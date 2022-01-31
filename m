Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F904A4A7A
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 16:22:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263155.455763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEYVG-000310-KU; Mon, 31 Jan 2022 15:22:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263155.455763; Mon, 31 Jan 2022 15:22:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEYVG-0002yr-HH; Mon, 31 Jan 2022 15:22:02 +0000
Received: by outflank-mailman (input) for mailman id 263155;
 Mon, 31 Jan 2022 15:22:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6sSE=SP=gmail.com=groeck7@srs-se1.protection.inumbo.net>)
 id 1nEYVE-0002yl-HQ
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 15:22:00 +0000
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [2607:f8b0:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 871f193d-82a9-11ec-8eb8-a37418f5ba1a;
 Mon, 31 Jan 2022 16:21:57 +0100 (CET)
Received: by mail-oi1-x234.google.com with SMTP id q186so27242496oih.8
 for <xen-devel@lists.xenproject.org>; Mon, 31 Jan 2022 07:21:57 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id d65sm9789045otb.17.2022.01.31.07.21.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 07:21:44 -0800 (PST)
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
X-Inumbo-ID: 871f193d-82a9-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:content-language:to
         :cc:references:from:subject:in-reply-to:content-transfer-encoding;
        bh=oVZWckNIPsWHeKbXJ2sFvACBl5okPcSAEIsKC6XhxDU=;
        b=NXQ2vh5WqJcNrwvi+uhxOeXRwL3TuQvr8zI74nXKNlbA4THVcrFQe20l84a2F3rCSl
         fb+2O3VmewcReatZ19klOskQ2upf6qljRrD6n2B9Y4PhroYWW+XOfsdsfB3MZuirxQ9t
         X+vPYa1ikH13JYbnSKqVdMeH1jmxa4D6k59/FHZubOFHJbDfNxiaB8VfMIjtaMgLtJV+
         3A2GEeuqlrodVHjFD7y9lvjUf+N31nBGTmFabP1WX1nvXw95IBSd2qgNRGX0BxRvAmns
         3J8DZp0qcC/r7rrsLbS0TgQNcR7BR3VDw0NU5D6j9PO9dXHpEDeoVqLmRligf9NcdWA6
         MSIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=oVZWckNIPsWHeKbXJ2sFvACBl5okPcSAEIsKC6XhxDU=;
        b=HkTAe85qYiAZSHy2ELjCwBFenTaCuFG1h2N/1TJTALuEu/Ysx/DkSCBjYdJ5qTnh4i
         Wcq+iB4xTTgE3JDUTdcI2TejxgN5T5GDb41u3VwZM1Qa3mHMk7lEMZt4Qi6PBqzWJjB2
         SAx4kMiiJaSyQ9u6d7Rugvh3fz9S3pQB99vYu3JFqwQUKJwmxzGNkO2uiitLc0VDQs2F
         Tim/uGzDmGZw+b1PUJ+THEvAuAAUJQ+9MTuyS8ZB/PuXSU72Xo6oeC/sa+gsVJzWNexM
         3YRKlgIwhD28hpQiGnU1FaWmSYsM4ZRBCLJAvULriINgJWzL7JbRKdHl3IaN1Q27gUOF
         udVA==
X-Gm-Message-State: AOAM532dNelWNDwSfDHhj7j6HkbmeVtbQQ01wfzgsVdBozN7H8/pkXTj
	Wf5hjTI//0fYBvb+ZyUJ9cs7gvJ4m8Scyw==
X-Google-Smtp-Source: ABdhPJwZ2DsfGoZh9WlCulrelJMyxXaQWZM7t1bPVVjVsAMl6JMrpJ5ac6K1xcqWaqkMGtPCEBWrHw==
X-Received: by 2002:a05:6808:211f:: with SMTP id r31mr12780920oiw.194.1643642506160;
        Mon, 31 Jan 2022 07:21:46 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c78df469-1a9f-5778-24d1-8f08a6bf5bcc@roeck-us.net>
Date: Mon, 31 Jan 2022 07:21:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Nishanth Menon <nm@ti.com>,
 Mark Rutland <mark.rutland@arm.com>, Stuart Yoder <stuyoder@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Will Deacon <will@kernel.org>, Ashok Raj <ashok.raj@intel.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Jassi Brar
 <jassisinghbrar@gmail.com>, Sinan Kaya <okaya@kernel.org>,
 iommu@lists.linux-foundation.org, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Bjorn Helgaas <helgaas@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Jason Gunthorpe <jgg@nvidia.com>, linux-pci@vger.kernel.org,
 xen-devel@lists.xenproject.org, Kevin Tian <kevin.tian@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Robin Murphy <robin.murphy@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>, Cedric Le Goater
 <clg@kaod.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Megha Dey <megha.dey@intel.com>,
 Juergen Gross <jgross@suse.com>, Tero Kristo <kristo@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Vinod Koul <vkoul@kernel.org>, Marc Zygnier <maz@kernel.org>,
 dmaengine@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <87mtjc2lhe.ffs@tglx>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [patch V3 28/35] PCI/MSI: Simplify pci_irq_get_affinity()
In-Reply-To: <87mtjc2lhe.ffs@tglx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/31/22 03:27, Thomas Gleixner wrote:
> On Sun, Jan 30 2022 at 09:12, Guenter Roeck wrote:
>> On Fri, Dec 10, 2021 at 11:19:26PM +0100, Thomas Gleixner wrote:
>> This patch results in the following runtime warning when booting x86
>> (32 bit) nosmp images from NVME in qemu.
>>
>> [   14.825482] nvme nvme0: 1/0/0 default/read/poll queues
>> ILLOPC: ca7c6d10: 0f 0b
>> [   14.826188] ------------[ cut here ]------------
>> [   14.826307] WARNING: CPU: 0 PID: 7 at drivers/pci/msi/msi.c:1114 pci_irq_get_affinity+0x80/0x90
> 
> This complains about msi_desc->affinity being NULL.
> 
>> git bisect bad f48235900182d64537c6e8f8dc0932b57a1a0638
>> # first bad commit: [f48235900182d64537c6e8f8dc0932b57a1a0638] PCI/MSI: Simplify pci_irq_get_affinity()
> 
> Hrm. Can you please provide dmesg and /proc/interrupts from a
> kernel before that commit?
> 

Sure. Please see http://server.roeck-us.net/qemu/x86/.
The logs are generated with with v5.16.4.

Guenter

