Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF0ED235CC
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 10:10:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1204394.1519071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgJMy-0002va-JD; Thu, 15 Jan 2026 09:10:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1204394.1519071; Thu, 15 Jan 2026 09:10:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgJMy-0002tL-GY; Thu, 15 Jan 2026 09:10:20 +0000
Received: by outflank-mailman (input) for mailman id 1204394;
 Thu, 15 Jan 2026 09:10:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6aKL=7U=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vgJMw-0002tF-Gv
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 09:10:18 +0000
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [2a00:1450:4864:20::443])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 023c4947-f1f2-11f0-b15e-2bf370ae4941;
 Thu, 15 Jan 2026 10:10:17 +0100 (CET)
Received: by mail-wr1-x443.google.com with SMTP id
 ffacd0b85a97d-432dc56951eso435706f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jan 2026 01:10:17 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-434af64a778sm4621712f8f.3.2026.01.15.01.10.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 01:10:14 -0800 (PST)
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
X-Inumbo-ID: 023c4947-f1f2-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768468216; x=1769073016; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XNiFNKSA8ewzq3AITTPzSNiSva1DLVUpQFCVeULNOW8=;
        b=egpEiVyq9LqMlY755hMogonncjd0RFHRaTg1LRDXpVxAPV7irH/vuqGp6XeIKduMck
         fQi1w9n3Ro5zb1CCNU8sxAmcuoKKF6hVpDJhP7iBEZWMkSCXqI5rpK+u/KZf/S2DGPRC
         7HAKYnWFnOgo7OF0HKkFujJY3Qrrr154ervYyDdhEqMax4dCVbxpazmAtqePOD1ESxxp
         Tp9l3B5+gL45TbJrnH1a+P531Ndzxh+CXmxALzNyEgeySKahEr8BfuZ99Tank+vIRW17
         fAHccPJVncqUvwd/oxAewWH5c7RUvlkTWbSLQ8I43aQzkB79PQHFefap8PuCoA3pTet3
         ratw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768468216; x=1769073016;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XNiFNKSA8ewzq3AITTPzSNiSva1DLVUpQFCVeULNOW8=;
        b=LABgNAfVpE/5yLxBnc+ZcFc+9lxqVbxmPw8/cuFNk+NkBxgBGO9Jxg07Id389tr0w2
         RoIYZILuHrmgpSoPLWuynUY7zR0ZPhAT+CEHW5MfkiVikUc5aQWrx/WGbE8fF4vHH9VL
         xEbeKA8ho4q+Vu+Wmu4V4ok+XvtwelJlPo888xGIXTz5/yBY1ukdsWStfcMUPN7uwjQ1
         SdVqWdA//X6Up27f2uKxL0I4Pxy18EMZ+gw/8VOdCSpIvSL36/l8i+0Glxg73sRVKC87
         vxuOlhuilnxyXhwvjtb5Hp0i+3tvmF3+H8d1qeQiSvV49Mj0+qo8Ue4Z1BGfDNF0uVk/
         1HLg==
X-Forwarded-Encrypted: i=1; AJvYcCVkVipWa/cgfxQBJtLxhY4Vf+9t43b+nDFjS09ez2Dsd9b8ItAcGal+F8JRYQ0sUgiV0QfZnIbadQ4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzy+wnUe8St2ZxJ6UdNVERq2htl9xDHRrPYeoMjkeuyexr3sUCC
	aLkaIlFuFfm14E85TCJZsLlb82zxypsGuLTtteZtNAE69aJx1axP6HX5CdtCqW33pw==
X-Gm-Gg: AY/fxX4TxzwkUbta1huHBefGAYwyElio3HU408EI6XK6zoZt4XODaT54lhLucYGAtr+
	XzVfwfsDtfJohvNbc8cee3XI0f6csDmT43WIeVLhWEF1L+Ui4Oaje30ZlokY/s0GohoeV9abg6c
	BwIkC+H+5HIoelyTz6UJ8Swfvn4uqLG1qhQnqQw4JpZDGrv8/uCMutOREz4jC59eaR8sRB6Z0hs
	S7Q8nH3ofDyzIYFV83AlDinmsE8D1Ds31PIjkCjmZmBYyC6V8HH7UvJ27+UMxBqEewawxvIuRXl
	DHQB7jo2Kp9iz+u1aHFVWVyrVJLsy35WLxztbVa6TF2rxSdNLVcv97PRNkdbA9YUBjl51KE2zwT
	2a8ayfyHwkQvX7LBlsd/Tz9X8Nzu/e3FJibY1qJ6Cs/CaBhcbB4HfU83893QkOHK70uied9q+dg
	lGXudWj3GPpdOmK7VKbSZ2Md3Fb8ij8bLPVLN+3HAAcl/EaqGuRPtkRpQdUlnpMqSLz4Ypp66CZ
	lA=
X-Received: by 2002:a05:6000:200d:b0:432:c0e6:cfda with SMTP id ffacd0b85a97d-4342c4ee790mr6053937f8f.7.1768468215033;
        Thu, 15 Jan 2026 01:10:15 -0800 (PST)
Message-ID: <86fe1ba2-2775-441f-9ea2-47de5f0375aa@suse.com>
Date: Thu, 15 Jan 2026 10:10:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/5] xen/domctl: extend XEN_DOMCTL_assign_device to
 handle not only iommu
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Juergen Gross
 <jgross@suse.com>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1768415200.git.oleksii_moisieiev@epam.com>
 <837eab835a75e7f668c5a49074991b2fcba56156.1768415200.git.oleksii_moisieiev@epam.com>
Content-Language: en-US
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
In-Reply-To: <837eab835a75e7f668c5a49074991b2fcba56156.1768415200.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.01.2026 19:29, Oleksii Moisieiev wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>

Nit on the patch title: "not only iommu" can mean pretty much anything. Imo
SCI should somehow appear in the title.

> Add chained handling of assigned DT devices to support access-controller
> functionality through SCI framework, so a DT device assign request can be
> passed to firmware for processing and enabling VM access to the requested
> device (for example, device power management through SCMI).
> 
> The SCI access-controller DT device processing is called before the IOMMU
> path. It runs for any DT-described device (protected or not, and even when
> the IOMMU is disabled). The IOMMU path remains unchanged for PCI devices;
> only the DT path is relaxed to permit non-IOMMU devices.
> 
> This lets xl.cfg:"dtdev" list both IOMMU-protected and non-protected DT
> devices:
> 
> dtdev = [
>     "/soc/video@e6ef0000", <- IOMMU protected device
>     "/soc/i2c@e6508000", <- not IOMMU protected device
> ]
> 
> The change is done in two parts:
> 1) call sci_do_domctl() in do_domctl() before IOMMU processing and propagate
> its error if it fails while the IOMMU path succeeds (unhandled cases return
> -ENXIO and are ignored);
> 2) update iommu_do_dt_domctl() to check for dt_device_is_protected() and
> not fail if DT device is not protected by IOMMU. iommu_do_pci_domctl
> doesn't need to be updated because iommu_do_domctl first tries
> iommu_do_pci_domctl (when CONFIG_HAS_PCI) and falls back to
> iommu_do_dt_domctl only if PCI returns -ENODEV.

Given how the line above ends early, you likely want to have a paragraph
(empty line) past here, to aid the reader?

> The new dt_device_is_protected() bypass in iommu_do_dt_domctl only
> applies to DT-described devices; SCI parameters are carried via DT nodes.
> PCI devices handled by iommu_do_pci_domctl do not carry DT/SCI
> metadata in this path, so there is no notion of “SCI parameters on a
> non-IOMMU-protected PCI device” for it to interpret or to skip. The
> PCI path should continue to report errors if assignment cannot be
> performed by the IOMMU layer.

It's less clear here, as ...

> So we should leave iommu_do_pci_domctl unchanged; the SCI/DT-specific
> relaxations belong only in the DT path.

... this still looks to pertain to the earlier paragraph. Perhaps that
sentence should start on the earlier line?

A more general nit: Please try to be consistent with line wrapping.
Don't go past 75 chars, but at the same time use available line length
instead of wrapping a sentence early.

Also please be consistent with adding () after function names.

> @@ -827,7 +830,37 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>      case XEN_DOMCTL_test_assign_device:
>      case XEN_DOMCTL_deassign_device:
>      case XEN_DOMCTL_get_device_group:
> +        if ( IS_ENABLED(CONFIG_ARM) )
> +        {
> +            /*
> +             * Add chained handling of assigned DT devices to support

Why "Add"? The comment should be describing what the code does, not what is
being changed by this patch.

> +             * access-controller functionality through SCI framework, so
> +             * DT device assign request can be passed to FW for processing and
> +             * enabling VM access to requested device.
> +             * The access-controller DT device processing is called before IOMMU
> +             * processing preserving return code and expected to be executed for
> +             * any DT device regardless if DT device is protected by IOMMU or
> +             * not (or IOMMU is disabled).
> +             */

Is there perhaps one (or more) comma(s) missing here? One after "processing",
and maybe another one after "code". Assuming of course I infer correctly what
is intended to be said.

> +            ret1 = sci_do_domctl(op, d, u_domctl);
> +            if ( ret1 < 0 )
> +                return ret1;

This leaves ret1 >= 0 for the code further down. Then ...

> +        }
> +        else
> +            ret1 = -ENXIO;
> +
>          ret = iommu_do_domctl(op, d, u_domctl);
> +        if ( ret < 0 )
> +            return ret;
> +
> +        /*
> +         * If IOMMU processing was successful, check for SCI processing return
> +         * code and if it was failed then overwrite the return code to propagate
> +         * SCI failure back to caller.
> +         */
> +        if ( ret1 != -ENXIO )
> +            ret = ret1;

..., with ret being 0 when we make it here, what use is this? I don't think
we can or should be returning positive values?

Nit for the comment: Drop the latter "was".

Jan

