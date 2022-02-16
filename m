Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB7A4B8637
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 11:54:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273989.469307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKHwi-0004Dw-QQ; Wed, 16 Feb 2022 10:54:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273989.469307; Wed, 16 Feb 2022 10:54:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKHwi-0004BO-Mv; Wed, 16 Feb 2022 10:54:04 +0000
Received: by outflank-mailman (input) for mailman id 273989;
 Wed, 16 Feb 2022 10:54:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mysP=S7=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1nKHwh-0004BE-FV
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 10:54:03 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf93bbed-8f16-11ec-b215-9bbe72dcb22c;
 Wed, 16 Feb 2022 11:54:01 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 q198-20020a1ca7cf000000b0037bb52545c6so3429841wme.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Feb 2022 02:54:01 -0800 (PST)
Received: from [10.7.237.11] (54-240-197-227.amazon.com. [54.240.197.227])
 by smtp.gmail.com with ESMTPSA id o4sm16349706wms.9.2022.02.16.02.53.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 02:54:00 -0800 (PST)
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
X-Inumbo-ID: bf93bbed-8f16-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:reply-to:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=tPmLSTqOcapZvO9uuQqXhfO95EoSa8ZZQjKGr7P8WvQ=;
        b=MrWlhRHEZscDjDZwu4uFIkEoxOuGnpMV8XkioDQLbSlDe9iacozN8NSy9o1K2zgFM/
         1HwVBUchLx9SYmhvjPIi8zQ1MX5xNgxmRfmIMF73lAU0maSudm/NV2zwUsegl+g9wZ4S
         nY3Gn1WHA+N2f7QSZMXrla0zcnoKrncT4EdH8C6UmMrblkZBYcE0OORMwM/E28wYoKGb
         DzQs5Og4JhQPbvHS3hEVWAqSGjhD1M/Gv3QukE+mCdZnhq+IpAiayfBrRuknXNqMC8CF
         AXuJlNwGLRLuSPodiZbipNbt+2Nk1cqDmVqup5iNPj+si1ilfe55MoXKIDMkfihm4ukn
         KfhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=tPmLSTqOcapZvO9uuQqXhfO95EoSa8ZZQjKGr7P8WvQ=;
        b=5x2tgEDzK90u/bcZiwKAPDmTPgPdSndcdUxzGAV6ssRP7PvYA8EGhCmO6UI+sc+HIr
         OFvdhIdqt3XoO3jeOKZgeK1dWHX3dvPpfDcyS6R451lisvsV56Ybo1khd/krLbKJwFTK
         IAwjtUrcg2qN4i7MZGbNaF/rg5eunHABZ7zF9WGYaSHltIn+NbmN8dmR4IGGipGmOsSs
         m9jF394epas1EOBCYb3NsUVSvlmGquJsXfc0h5Nx+xlKGkEqcUWN4fS13wuqJ10Gl/5n
         iLRKyfFoyKq4kVvHedynRHrr5GIzmwvrVsyZxfpmdDmdWTjNO8V8Pow50wZVWTgjxEOV
         TsSg==
X-Gm-Message-State: AOAM5302qnlM2BsdofKZp2sihHkHi4DM3itbG07+0ykmbaFIttz+qwiz
	w8i4MHWaCu0hbnE8YGKh3zk=
X-Google-Smtp-Source: ABdhPJwMB0xkn6tPdGfD+4I6HmDmVdRWu2XRzMnIe3yO0Nex+nM0rpiMtiVxBDzMHGlCTVOuueXeAg==
X-Received: by 2002:a1c:f30b:0:b0:37b:b5de:c804 with SMTP id q11-20020a1cf30b000000b0037bb5dec804mr1039815wmq.166.1645008840988;
        Wed, 16 Feb 2022 02:54:00 -0800 (PST)
Message-ID: <73c3db96-fbca-9d03-d645-4d44ab6a640f@gmail.com>
Date: Wed, 16 Feb 2022 10:53:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Reply-To: paul@xen.org
Subject: Re: [PATCH v2 RFC 4/5] x86/ioreq: report extended destination ID
 support by emulators
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: dwmw2@infradead.org, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>
References: <20220216103026.11533-1-roger.pau@citrix.com>
 <20220216103026.11533-5-roger.pau@citrix.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <20220216103026.11533-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16/02/2022 10:30, Roger Pau Monne wrote:
> Introduce a new arch specific field to report whether an emulator
> supports the Extended Destination ID field, so that the hypervisor can
> refrain from exposing the feature if one of the emulators doesn't
> support it.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Changes since v1:
>   - New in this version.
> ---
> RFC: I find this kind of clumsy. In fact fully emulated devices
> should already support Extended Destination ID without any
> modifications, because XEN_DMOP_inject_msi gets passed the address and
> data fields, so the hypervisor extracts the extended destination ID
> from there.
> 
> PCI passthrough devices however use xc_domain_update_msi_irq and that
> has leaked the gflags parameter in the API, even worse the position
> of the flags are hardcoded in QEMU.
> 
> Should the clearing of ext_dest_id be limited to the domain using an
> IOMMU?
> 
> RFC: Only enable ext_dest_id if max_cpu > 128? So the device model is
> aware the domain must use ext_dest_id? (implies device model knows
> APIC ID = CPU ID * 2)

There is still only a single sync ioreq server page, so 128 vCPUs is the 
max possible.

   Paul


