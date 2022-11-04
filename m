Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF587619C23
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 16:51:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437732.692173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqyxw-0000mw-0e; Fri, 04 Nov 2022 15:50:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437732.692173; Fri, 04 Nov 2022 15:50:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqyxv-0000jy-Tx; Fri, 04 Nov 2022 15:50:43 +0000
Received: by outflank-mailman (input) for mailman id 437732;
 Fri, 04 Nov 2022 15:50:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hzer=3E=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1oqyxu-0000iL-AC
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 15:50:42 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ecdf055-5c58-11ed-8fd1-01056ac49cbb;
 Fri, 04 Nov 2022 16:50:40 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id cl5so7612618wrb.9
 for <xen-devel@lists.xenproject.org>; Fri, 04 Nov 2022 08:50:40 -0700 (PDT)
Received: from [10.85.37.166] (54-240-197-228.amazon.com. [54.240.197.228])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a05600c190700b003b477532e66sm13036117wmq.2.2022.11.04.08.50.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 08:50:38 -0700 (PDT)
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
X-Inumbo-ID: 6ecdf055-5c58-11ed-8fd1-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=a+sX517KzpQ++DVNKCB8dS7Tc1rlk/IB6W98yNMpu3U=;
        b=iu6jrbePum2ktWfBAmCCFMHaCV5eKXQZph8MKEjU6IAQN670KvCtMG+bo9766UQr1I
         BAPWdKCGvkPG8HTHU6npgpeMOom2g0/aXzBYpcJcN1xWZk9tnb7B/tCLVLPGFHncv+H3
         yu3gNjR5libQ82GzGXvJCEwTvv6J/1pa4Ig13cauWwxBptavyZoBTbGMlAmti3KAcPSI
         HyhJ71z1tCrSdbA+YqC0HuRyp9Fnahj/tTj5C9u0Xu06MRZpmeAWcvec+Zx3qjpoOen8
         3UptlycN/OHoY5pbecITodUYxb/h8h6KniyCDhUY6iydsFQl16IKpLzCO4DCE8a7hwUp
         qMvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a+sX517KzpQ++DVNKCB8dS7Tc1rlk/IB6W98yNMpu3U=;
        b=J2PslVSdJqeIyk6j7rgYeuQa4EYyvfjVLA/Jx+29pl3GhZG9gT1ieMdShwh6IZr7Qz
         lhXDqNDsqLNFSTbmRUxL8zlmSnILcBPriIm7ZajErtCD1wjVgWsYYg1UPtDbZlMmOVxD
         dxAdj0MPS+yqu8BLaax4gH49HSOg/sZIgxqYcY06/9qVz3NwMicV3wkjkLbsxj5ZM2nw
         I8ffniu/nDdB5A+1ZvenTXC2R94KgIuyqNfObG2G44hAaLsgL9SsHCopy4MmJQllF3xq
         nWK6ySCQBHWazF9nT1sl2p/QgrvBhMfNIi1DIsMcFw0y+0vHZjLFNHmSQ+Gzd8tWmgsx
         WGxQ==
X-Gm-Message-State: ACrzQf1aDCfYuAi/6z6Z/S/C7d0yz/AfNnIFjV1lU1jMk97Mtq45BIEu
	ePYknrzpXJfE31BP7OdQBjY=
X-Google-Smtp-Source: AMsMyM4EZ9+gSF3Yo6FxXNy8Rf/sJE0jCEUjqda7OkzUJ+hzZM8maptFtPsddbm78nEXv3Lli3mU7w==
X-Received: by 2002:a05:6000:18aa:b0:238:3cb3:1a1d with SMTP id b10-20020a05600018aa00b002383cb31a1dmr7024830wri.409.1667577040049;
        Fri, 04 Nov 2022 08:50:40 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <0ad753a4-2876-88a5-c0be-9f917283e61b@xen.org>
Date: Fri, 4 Nov 2022 15:50:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH for-4.17 1/2] viridian: suggest MSR APIC accesses if MSR
 accesses are accelerated
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com, Wei Liu <wl@xen.org>, Jan Beulich
 <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20221104142235.36556-1-roger.pau@citrix.com>
 <20221104142235.36556-2-roger.pau@citrix.com>
Content-Language: en-US
Organization: Xen Project
In-Reply-To: <20221104142235.36556-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 04/11/2022 14:22, Roger Pau Monne wrote:
> The "APIC register virtualization" Intel hardware feature applies to
> both MMIO or MSR APIC accesses depending on whether "virtualize x2APIC
> mode" is also available.
> 
> As such also suggest MSR APIC accesses if both "APIC register
> virtualization" and "virtualize x2APIC mode" features are available.
> 

I'm having trouble reconciling that with the logic below...

> Fixes: 7f2e992b82 ('VMX/Viridian: suppress MSR-based APIC suggestion when having APIC-V')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>   xen/arch/x86/hvm/viridian/viridian.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridian/viridian.c
> index 25dca93e8b..c4fa0a8b32 100644
> --- a/xen/arch/x86/hvm/viridian/viridian.c
> +++ b/xen/arch/x86/hvm/viridian/viridian.c
> @@ -197,7 +197,11 @@ void cpuid_viridian_leaves(const struct vcpu *v, uint32_t leaf,
>           res->a = CPUID4A_RELAX_TIMER_INT;
>           if ( viridian_feature_mask(d) & HVMPV_hcall_remote_tlb_flush )
>               res->a |= CPUID4A_HCALL_REMOTE_TLB_FLUSH;
> -        if ( !cpu_has_vmx_apic_reg_virt )
> +        /*
> +         * Suggest x2APIC mode by default, unless xAPIC registers are hardware
> +         * virtualized and x2APIC ones aren't.
> +         */
> +        if ( !cpu_has_vmx_apic_reg_virt || cpu_has_vmx_virtualize_x2apic_mode )

This means APIC register virt *not* available or virt x2apic *is* 
available. Is the latter gated on the former?

   Paul


>               res->a |= CPUID4A_MSR_BASED_APIC;
>           if ( viridian_feature_mask(d) & HVMPV_hcall_ipi )
>               res->a |= CPUID4A_SYNTHETIC_CLUSTER_IPI;


