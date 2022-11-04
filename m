Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 060F3619C4A
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 16:56:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437736.692184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqz3B-00020Y-KV; Fri, 04 Nov 2022 15:56:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437736.692184; Fri, 04 Nov 2022 15:56:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqz3B-0001ym-Hc; Fri, 04 Nov 2022 15:56:09 +0000
Received: by outflank-mailman (input) for mailman id 437736;
 Fri, 04 Nov 2022 15:56:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hzer=3E=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1oqz3A-0001yg-4g
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 15:56:08 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b922e14-5c59-11ed-8fd1-01056ac49cbb;
 Fri, 04 Nov 2022 16:55:57 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 p13-20020a05600c468d00b003cf8859ed1bso3454372wmo.1
 for <xen-devel@lists.xenproject.org>; Fri, 04 Nov 2022 08:55:57 -0700 (PDT)
Received: from [10.85.37.166] (54-240-197-228.amazon.com. [54.240.197.228])
 by smtp.gmail.com with ESMTPSA id
 d14-20020adffbce000000b0022cbf4cda62sm4489730wrs.27.2022.11.04.08.55.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 08:55:56 -0700 (PDT)
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
X-Inumbo-ID: 2b922e14-5c59-11ed-8fd1-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=qZ7caN2ZrMloq+8jcSpHLFrKEnKM6MrLRtzEsAg/5go=;
        b=clYaVWmcpHa3ahKI1Eeays+S3pOLvwUCujGkwbf6pmY22TlQL7MsuMKMMCAXiVi/5o
         N5cbSfe1YfzOFOXJC1E4znFHh6TQrlAJ6W+jXk5VqYs4J8xB3GqixnsdKp6VlvfrZAWt
         NrDhxf1Ls4+cGbDYVwNCFkTp8u63H0EbdJg5QMzo5YP91jiNBTg2+VkLKJoQkE8ct5IG
         WiO39LB3KjXe6xyN/IDmmIznBL7RGiXe3oMHH3UxYaqeBUP2LCL5K9NIbXDK1mnbggPt
         gtoF70fDtYeOKp6OovBO+j3T6wChlCGuJ0E5tHvKXuUQFDXeWo+izW9bpYuGeIKFJvdx
         KQCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qZ7caN2ZrMloq+8jcSpHLFrKEnKM6MrLRtzEsAg/5go=;
        b=u98XvcNia4IjYFNC6vsDiapYpO/nMcrsSLQoDWV+OFoGGe4/SfldFDqkXgYu+GACik
         EN5hl9u3HYu7PDm2DPYZzld4a35wwNFJDQKK/UaMYGbOWeUcVFgS6KHEC9ACdqIymOGL
         AAQFJwrJ3Pocqfb13xOwk6l6VPfdMlh3aD4Zof/qQkdwdgH5QG9osn7qxs8omKnpa5mz
         yKB362qTkLN1xmraQ2HU/la1wpCVgMkjMJfYSt1WG4oom5W6OyO2lRNWV+uubmKqg4iU
         VQ9nofsHAG0Zq1uAnnT9OehC71idQH9/yiKQ6Br87AsKhclbB0axjbdkq4CAOZ/WHOIQ
         w5ow==
X-Gm-Message-State: ACrzQf3cQYu4eEZTiC33HqkzxzgWL0r4dJGfhsGr55+s0Oc+cj3gzNLB
	hxb6RIwsWHyV2lXtJqxe080=
X-Google-Smtp-Source: AMsMyM73IQCiLlmfiQdki4N5PDimEKpFXYN6AK/X2nDCnHgjNIM70Wz9iBsvYWC10uNMtxz5yjVTzw==
X-Received: by 2002:a1c:f60d:0:b0:3be:708b:c96c with SMTP id w13-20020a1cf60d000000b003be708bc96cmr34895984wmc.168.1667577356765;
        Fri, 04 Nov 2022 08:55:56 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <2a3c5141-516d-a5e4-392b-e7fe54f3781c@xen.org>
Date: Fri, 4 Nov 2022 15:55:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH for-4.17 2/2] hvm/apic: repurpose the reporting of the
 APIC assist options
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com, Wei Liu <wl@xen.org>, Jan Beulich
 <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
References: <20221104142235.36556-1-roger.pau@citrix.com>
 <20221104142235.36556-3-roger.pau@citrix.com>
Organization: Xen Project
In-Reply-To: <20221104142235.36556-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 04/11/2022 14:22, Roger Pau Monne wrote:
> The current reporting of the hardware assisted APIC options is done by
> checking "virtualize APIC accesses" which is not very helpful, as that
> feature doesn't avoid a vmexit, instead it does provide some help in
> order to detect APIC MMIO accesses in vmexit processing.
> 
> Repurpose the current reporting of xAPIC assistance to instead report
> such feature as present when there's support for "TPR shadow" and
> "APIC register virtualization" because in that case some xAPIC MMIO
> register accesses are handled directly by the hardware, without
> requiring a vmexit.
> 
> For symetry also change assisted x2APIC reporting to require
> "virtualize x2APIC mode" and "APIC register virtualization", dropping
> the option to also be reported when "virtual interrupt delivery" is
> available.  Presence of the "virtual interrupt delivery" feature will
> be reported using a different option.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> I find the logic in vmx_vlapic_msr_changed() hard to follow, but I
> don't want to rewrite the function logic at this point.
> ---
>   xen/arch/x86/hvm/viridian/viridian.c |  2 +-
>   xen/arch/x86/hvm/vmx/vmcs.c          |  8 ++++----
>   xen/arch/x86/hvm/vmx/vmx.c           | 25 ++++++++++++++++++-------
>   xen/arch/x86/traps.c                 |  4 +---
>   4 files changed, 24 insertions(+), 15 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridian/viridian.c
> index c4fa0a8b32..bafd8e90de 100644
> --- a/xen/arch/x86/hvm/viridian/viridian.c
> +++ b/xen/arch/x86/hvm/viridian/viridian.c
> @@ -201,7 +201,7 @@ void cpuid_viridian_leaves(const struct vcpu *v, uint32_t leaf,
>            * Suggest x2APIC mode by default, unless xAPIC registers are hardware
>            * virtualized and x2APIC ones aren't.
>            */
> -        if ( !cpu_has_vmx_apic_reg_virt || cpu_has_vmx_virtualize_x2apic_mode )
> +        if ( !has_assisted_xapic(d) || has_assisted_x2apic(d) )

So, not sure why this is separated from patch 1 but stated this way it 
seems counterintuitive. We only want to use the viridian MSRs if they 
are going to be more efficient.. which I think is only in the case where 
we have neither an x2apic not an assisted xapic (hence we would trap for 
MMIO).

   Paul

>               res->a |= CPUID4A_MSR_BASED_APIC;
>           if ( viridian_feature_mask(d) & HVMPV_hcall_ipi )
>               res->a |= CPUID4A_SYNTHETIC_CLUSTER_IPI;


