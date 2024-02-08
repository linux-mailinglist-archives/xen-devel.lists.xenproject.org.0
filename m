Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7D284E22A
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 14:42:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678198.1055276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY4eW-0004GH-4h; Thu, 08 Feb 2024 13:41:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678198.1055276; Thu, 08 Feb 2024 13:41:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY4eW-0004DY-1x; Thu, 08 Feb 2024 13:41:20 +0000
Received: by outflank-mailman (input) for mailman id 678198;
 Thu, 08 Feb 2024 13:41:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nVk9=JR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rY4eU-0004DS-C1
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 13:41:18 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bba9ccbb-c687-11ee-8a4a-1f161083a0e0;
 Thu, 08 Feb 2024 14:41:16 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40fb3b5893eso14534245e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 08 Feb 2024 05:41:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 iv9-20020a05600c548900b004104bc8d841sm555445wmb.13.2024.02.08.05.40.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Feb 2024 05:40:54 -0800 (PST)
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
X-Inumbo-ID: bba9ccbb-c687-11ee-8a4a-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707399676; x=1708004476; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CABFFYl92xdWMf0DiklpDeUUblSm1jKtp8QnB6qJDPU=;
        b=T4SW54BtNIyMDaAwH1RI/YiBRAYiHbvrINdst9jznI7cJR61mhJfZEvWmqE1foLcpr
         RL+APBatjgL8MtCVLVW5pEyFwyI20GoRlVBCFMCO03VfHBs/PwcV+/G0bPjHdr6ayPsc
         bSvZIEMGRq7VXVQkNs68629PWV5NsgZM15gK8mV0UDAfYAKSyPZ1itrkG4QiAlWNELDQ
         dde1EfiRRJoqW+QrmczBWMkT/RMAVa9dqajqJHVOSUEawr/RCDz/dapQXy/hCV8fuyOB
         jp7S727ZzmeN479YN50gVkOZBffSlFBgdmO5qGoynnhEqnE4MvLkJKL+zUPngmsxd9gr
         tL/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707399676; x=1708004476;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CABFFYl92xdWMf0DiklpDeUUblSm1jKtp8QnB6qJDPU=;
        b=D1z0TJ6HOU+A5zxHBCRIBD6Obs6qK7ThsfVS+bf45jdeG9aJI1DIFDA1Pb+PCGVaDk
         GYRLsmwhPocskxzJf4olCm7mv1xpkOjCxMX4gpXG18J+PF23D+OoHEecfEwBq9akeem3
         tN4wy8Rf0EVOmknqVhuGY0s2kN1AAM1Ea1kOkgAwg5j18qgz9rAyas134WTO3excLFJm
         QrvHZE5k3AQUvCWcW6lTvf2vMiX3nOaYxU4ucxMpzilSS7zZsA2rS3aCU7eo0at87tpx
         T7hZtdCsmWdTwMhn8/irKIVFHjNvkORzexZN/YAaNUgUDF/cfhaTzQoFWNIXaxX4RinL
         LXgA==
X-Forwarded-Encrypted: i=1; AJvYcCXCaJfrrgrONfp5gAOkLvCAsfJ3koMmkGXUrcSVf6ssTR3pZOoxVpw7UFSNzfbNPhtr4I14u7BVSTfRq7tQvEDu02hVcak8fYXH2ZDf+vE=
X-Gm-Message-State: AOJu0YzDO+xj4Uq4ZYhOiaEHu5PY6hn5fyuKuSvmQAe9lNO+uoinM5li
	a1mlpstgeH/rqsPTlwSx4bJaPFxxewYBjiZR0BIAwl81stGWHnEG2i6IOx6dXA==
X-Google-Smtp-Source: AGHT+IG3oBHD//gbzfxRjUQd4WkuFHz2ISynBvf6Lt65W4lSIu/vfVGC2mfXe/eyC0ASVTpSY1hfJQ==
X-Received: by 2002:a05:600c:19c7:b0:40f:dd7e:4a4d with SMTP id u7-20020a05600c19c700b0040fdd7e4a4dmr7276575wmq.31.1707399655165;
        Thu, 08 Feb 2024 05:40:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWGJ+SoKhdfLaHOPIBBF+cPkkrgnfV4rTLqm6ly/63qssg0T5TcKdtnWBWsHzJot/uLZJB7ViLPIawx+aLfkX1rpdvv99dwnAux04M+7ujkyzUzE10bNbyPx5NzwdfPumtzc+QOUa2EScn2aFayJtnjG7TWIAvCLO+bo36L9Rhpnzkmmt4ffha0FppO
Message-ID: <91e3fd09-8325-49b0-9d7b-43aacf2acd81@suse.com>
Date: Thu, 8 Feb 2024 14:40:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/vmx: add support for virtualize SPEC_CTRL
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240206142507.81985-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20240206142507.81985-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.02.2024 15:25, Roger Pau Monne wrote:
> @@ -2086,6 +2091,9 @@ void vmcs_dump_vcpu(struct vcpu *v)
>      if ( v->arch.hvm.vmx.secondary_exec_control &
>           SECONDARY_EXEC_VIRTUAL_INTR_DELIVERY )
>          printk("InterruptStatus = %04x\n", vmr16(GUEST_INTR_STATUS));
> +    if ( cpu_has_vmx_virt_spec_ctrl )
> +        printk("SPEC_CTRL mask = %#016lx  shadow = %#016lx\n",
> +               vmr(SPEC_CTRL_MASK), vmr(SPEC_CTRL_SHADOW));

#0... doesn't make a lot of sense; only e.g. %#lx does. Seeing context
there's no 0x prefix there anyway. Having looked at the function the
other day, I know though that there's a fair mix of 0x-prefixed and
unprefixed hex numbers that are output. Personally I'd prefer if all
0x prefixes were omitted here. If you and Andrew think otherwise, I can
live with that, so long as we're at least striving towards consistent
output (I may be able to get to doing a conversion patch, once I know
which way the conversion should be).

> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -823,18 +823,28 @@ static void cf_check vmx_cpuid_policy_changed(struct vcpu *v)
>      {
>          vmx_clear_msr_intercept(v, MSR_SPEC_CTRL, VMX_MSR_RW);
>  
> -        rc = vmx_add_guest_msr(v, MSR_SPEC_CTRL, 0);
> -        if ( rc )
> -            goto out;
> +        if ( !cpu_has_vmx_virt_spec_ctrl )
> +        {
> +            rc = vmx_add_guest_msr(v, MSR_SPEC_CTRL, 0);
> +            if ( rc )
> +                goto out;
> +        }

I'm certainly okay with you doing it this way, but generally I'd prefer
if code churn was limited whjere possible. Here leveraging that rc is 0
on entry, a smaller change would be to

        if ( !cpu_has_vmx_virt_spec_ctrl )
            rc = vmx_add_guest_msr(v, MSR_SPEC_CTRL, 0);
        if ( rc )
            goto out;

(similarly below then).

>      else
>      {
>          vmx_set_msr_intercept(v, MSR_SPEC_CTRL, VMX_MSR_RW);
>  
> -        rc = vmx_del_msr(v, MSR_SPEC_CTRL, VMX_MSR_GUEST);
> -        if ( rc && rc != -ESRCH )
> -            goto out;
> -        rc = 0; /* Tolerate -ESRCH */
> +        /*
> +         * NB: there's no need to clear the virtualize SPEC_CTRL control, as
> +         * the MSR intercept takes precedence.
> +         */

The two VMCS values are, aiui, unused during guest entry/exit. Maybe
worth mentioning here as well, as that not being the case would also
raise correctness questions?

> --- a/xen/arch/x86/include/asm/msr.h
> +++ b/xen/arch/x86/include/asm/msr.h
> @@ -302,8 +302,13 @@ struct vcpu_msrs
>       * For PV guests, this holds the guest kernel value.  It is accessed on
>       * every entry/exit path.
>       *
> -     * For VT-x guests, the guest value is held in the MSR guest load/save
> -     * list.
> +     * For VT-x guests, the guest value is held in the MSR guest load/save list
> +     * if there's no support for virtualized SPEC_CTRL. If virtualized
> +     * SPEC_CTRL is enabled the value here signals which bits in SPEC_CTRL the
> +     * guest is not able to modify.  Note that the value for those bits used in
> +     * Xen context is also used in the guest context.  Setting a bit here
> +     * doesn't force such bit to set in the guest context unless also set in
> +     * Xen selection of SPEC_CTRL.

Hmm, this mask value is unlikely to be in need of being vCPU-specific.
I'd not even expect it to be per-domain, but simply global.

I also can't spot where you set that field; do we really mean to give
guests full control now that we have it (rather than e.g. running in
IBRS-always-on mode at least under certain conditions)? If intended to
be like this for now, this (to me at least) surprising aspect could
likely do with mentioning in the description.

Jan

