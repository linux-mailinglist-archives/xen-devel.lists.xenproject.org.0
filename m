Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0308440343A
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 08:22:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181442.328548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNqxq-0005r6-1L; Wed, 08 Sep 2021 06:21:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181442.328548; Wed, 08 Sep 2021 06:21:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNqxp-0005oK-Tz; Wed, 08 Sep 2021 06:21:41 +0000
Received: by outflank-mailman (input) for mailman id 181442;
 Wed, 08 Sep 2021 06:21:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Bx+7=N6=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1mNqxn-0005oC-Qy
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 06:21:39 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 062b4a3d-106d-11ec-b144-12813bfff9fa;
 Wed, 08 Sep 2021 06:21:38 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-8vDZ1ZkhO9mA5aQ2DxWJLw-1; Wed, 08 Sep 2021 02:21:36 -0400
Received: by mail-wm1-f71.google.com with SMTP id
 j33-20020a05600c48a100b002e879427915so526154wmp.5
 for <xen-devel@lists.xenproject.org>; Tue, 07 Sep 2021 23:21:35 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6125.dip0.t-ipconnect.de. [91.12.97.37])
 by smtp.gmail.com with ESMTPSA id
 l21sm1014143wmh.31.2021.09.07.23.21.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 23:21:34 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 062b4a3d-106d-11ec-b144-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631082098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z34UVAiI8Q78/349kHm5g+91ow7Iz9fZ37lSWz6rrwY=;
	b=axfZ8DDCs3RCvOLyr4CFX8PtrudeMAvhZE25+JxlU9p32pwRCGAx7t6+yheogb1+9jP+6h
	Ky4uP9Mbx/16mr0pMSILJrLTDimd9Tajm001koLUdZOK803RAL735x5G72KmC0KpSY3Tx0
	jm7L855GCNCra006HzyAU3azuLWh5z0=
X-MC-Unique: 8vDZ1ZkhO9mA5aQ2DxWJLw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:references:from:organization:subject
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=z34UVAiI8Q78/349kHm5g+91ow7Iz9fZ37lSWz6rrwY=;
        b=GbJiajyEh5oi9ZmT43yMvCo/ppfDABdzosNron7RU1Tc53Km5oA40K4Vw9esey/ktC
         9tHoKG5W/dO0Dm2ud8+rBzdJ26czgE63SZS6C/AvxtZxCSbxncsgvNDWOIvH3Mhoq1Df
         pHmxefoLFBH0MBFT3cxg0nCjHKCgHeCUKYvdngmIDU1b3jpwkab3RXdRhXptlT76e0do
         t1YLfp4WEotI4re6JBHjzJL/C18qF4i1ubXDfTMuaOUDuO6tBqed++8zjQbtxcp+b57C
         8SNjjc89UhruNwrF+D83/9p82XFsEgFYGtVIt6b+exIlhrzF2FPCn1xifmByRnw9gMrn
         7lFw==
X-Gm-Message-State: AOAM532xz1f7JgxljUJkQ7p4MFZOsqATFxa4Gt7xB7UpeX67aQe6kiCT
	nNXV2beHIy6vzsZ4H3KIXlr8M22J7v+550k8sBkPEJ+ku6N8mBjQGyJYximl0HErEupQLVlYPpm
	rPD2GyAoiattecxZmuHdv7i66BI4GDUtCZCqYg3tEawgb17apZuvGxRBeFSM+0bEvUtizjpnQGA
	0=
X-Received: by 2002:adf:9bdb:: with SMTP id e27mr1991910wrc.162.1631082094839;
        Tue, 07 Sep 2021 23:21:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwVePYl3oJzEgmfpZnrDZETUp0uOCSKVg5L73nfFg5SJFFaAVj5u3fATe4qqvZ9JKp+koI50g==
X-Received: by 2002:adf:9bdb:: with SMTP id e27mr1991865wrc.162.1631082094550;
        Tue, 07 Sep 2021 23:21:34 -0700 (PDT)
To: Sean Anderson <sean.anderson@seco.com>
Cc: akpm@linux-foundation.org, alexander.h.duyck@linux.intel.com,
 dave.hansen@intel.com, haiyangz@microsoft.com, kys@microsoft.com,
 linux-acpi@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 mgorman@techsingularity.net, mhocko@kernel.org, mhocko@suse.com,
 osalvador@suse.de, pankaj.gupta.linux@gmail.com,
 richard.weiyang@linux.alibaba.com, rppt@kernel.org, sthemmin@microsoft.com,
 vbabka@suse.cz, wei.liu@kernel.org, willy@infradead.org,
 xen-devel@lists.xenproject.org
References: <20201005121534.15649-5-david@redhat.com>
 <a52dacbe-5649-7245-866f-ceaba44975b5@seco.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v2 4/5] mm/page_alloc: place pages to tail in
 __free_pages_core()
Message-ID: <528e8d9c-b148-30ec-d8cc-3dd072eaa7f2@redhat.com>
Date: Wed, 8 Sep 2021 08:21:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <a52dacbe-5649-7245-866f-ceaba44975b5@seco.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 08.09.21 00:40, Sean Anderson wrote:
> Hi David,
> 
> This patch breaks booting on my custom Xilinx ZynqMP board. Booting
> fails just after/during GIC initialization:
> 
> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd034]
> [    0.000000] Linux version 5.14.0 (sean@plantagenet) (aarch64-linux-gnu-gcc (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0, GNU ld (GNU Binutils for Ubuntu) 2.34) #251 SMP Tue Sep 7 18:11:50 EDT 2021
> [    0.000000] Machine model: xlnx,zynqmp
> [    0.000000] earlycon: cdns0 at MMIO 0x00000000ff010000 (options '115200n8')
> [    0.000000] printk: bootconsole [cdns0] enabled
> [    0.000000] efi: UEFI not found.
> [    0.000000] Zone ranges:
> [    0.000000]   DMA32    [mem 0x0000000000000000-0x00000000ffffffff]
> [    0.000000]   Normal   [mem 0x0000000100000000-0x000000087fffffff]
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x0000000000000000-0x000000007fefffff]
> [    0.000000]   node   0: [mem 0x0000000800000000-0x000000087fffffff]
> [    0.000000] Initmem setup node 0 [mem 0x0000000000000000-0x000000087fffffff]
> [    0.000000] On node 0, zone Normal: 256 pages in unavailable ranges
> [    0.000000] cma: Reserved 1000 MiB at 0x0000000041400000
> [    0.000000] psci: probing for conduit method from DT.
> [    0.000000] psci: PSCIv1.1 detected in firmware.
> [    0.000000] psci: Using standard PSCI v0.2 function IDs
> [    0.000000] psci: MIGRATE_INFO_TYPE not supported.
> [    0.000000] psci: SMC Calling Convention v1.1
> [    0.000000] percpu: Embedded 19 pages/cpu s46752 r0 d31072 u77824
> [    0.000000] Detected VIPT I-cache on CPU0
> [    0.000000] CPU features: detected: ARM erratum 845719
> [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 1033987
> [    0.000000] Kernel command line: earlycon clk_ignore_unused root=/dev/mmcblk0p2 rootwait rw cma=1000M
> [    0.000000] Dentry cache hash table entries: 524288 (order: 10, 4194304 bytes, linear)
> [    0.000000] Inode-cache hash table entries: 262144 (order: 9, 2097152 bytes, linear)
> [    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
> [    0.000000] software IO TLB: mapped [mem 0x000000003d400000-0x0000000041400000] (64MB)
> [    0.000000] Memory: 3023384K/4193280K available (4288K kernel code, 514K rwdata, 1200K rodata, 896K init, 187K bss, 145896K reserved, 1024000K cma-reserved)
> [    0.000000] rcu: Hierarchical RCU implementation.
> [    0.000000] rcu: 	RCU event tracing is enabled.
> [    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
> [    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
> [    0.000000] GIC: Adjusting CPU interface base to 0x00000000f902f000
> [    0.000000] Root IRQ handler: gic_handle_irq
> [    0.000000] GIC: Using split EOI/Deactivate mode
> 
> and I bisected it to this patch. Applying the following patch (for 5.14)
> fixes booting again:

Hi Sean,

unfortunately that patch most likely (with 99.9999% confidence) revealed 
another latent BUG in your setup.

Some memory that shouldn't be handed to the buddy as free memory is 
getting now allocated earlier than later, resulting in that issue.


I had all different kinds of reports, but they were mostly

a) Firmware bugs that result in uncached memory getting exposed to the 
buddy, resulting in severe performance degradation such that the system 
will no longer boot. [3]

I wrote kstream [1] to be run under the old kernel, to identify these.

b) BUGs that result in unsuitable memory getting exposed to either the 
buddy or devices, resulting in errors during device initialization. [6]

c) Use after free BUGs.

Exposing memory, such as used for ACPI tables, to the buddy as free 
memory although it's still in use. [4]

d) Hypervisor BUGs

The last report (heavy performance degradation) was due to a BUG in 
dpdk. [2]


What the exact symptoms you're experiencing? Really slow boot/stall? 
Then it could be a) and kstream might help.


[1] https://github.com/davidhildenbrand/kstream
[2] 
https://lore.kernel.org/dpdk-dev/20210827161231.579968-1-eperezma@redhat.com/T/#u
[3] 
https://lore.kernel.org/r/MW3PR12MB4537C3C6EFD9CA3A4B32084DF36B9@MW3PR12MB4537.namprd12.prod.outlook.com
[4] https://lkml.kernel.org/r/4650320.31r3eYUQgx@kreacher
[5] https://lkml.kernel.org/r/87361onphy.fsf_-_@codeaurora.org
[6] 
https://lore.kernel.org/r/20201213225517.3838501-1-linus.walleij@linaro.org


-- 
Thanks,

David / dhildenb


