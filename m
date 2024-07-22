Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 686F7938D9D
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 12:44:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761641.1171631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVqWh-0006g2-B3; Mon, 22 Jul 2024 10:44:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761641.1171631; Mon, 22 Jul 2024 10:44:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVqWh-0006eT-7K; Mon, 22 Jul 2024 10:44:19 +0000
Received: by outflank-mailman (input) for mailman id 761641;
 Mon, 22 Jul 2024 10:44:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=79tL=OW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sVqWf-0006eN-OV
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 10:44:17 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e33f1d4-4817-11ef-bbfe-fd08da9f4363;
 Mon, 22 Jul 2024 12:43:33 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-58ef19aa69dso2877454a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2024 03:43:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5a30aaa253fsm5920360a12.23.2024.07.22.03.43.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 03:43:32 -0700 (PDT)
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
X-Inumbo-ID: 3e33f1d4-4817-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721645013; x=1722249813; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uUJ0LhTHkPKliaHMVBuaNiS2nMMCe9pRxCR6YJM2wL8=;
        b=J7N+5Y91sRYFBkLK9PakyYboJIUEX8WbvnRkKJfkjZSRGjD5ay0F68Cs5jTZSgvSQI
         2WBdemBrJTtsKtD4S8Wee2slNOdcD2Gh/GnM40rDKJHA3iI825+1lJBfVXltRYRbVtaR
         Geis9NK4K3wurTtUreJ12xCIR5emzihQyM68PGwSssTFXgyjMSGOlJPeja8XwwsMz0Uu
         AZ1cq/yekiHs6NJq4DVuMIawSbX3DKHIWmf4u/AAeaghsFfYzJU79hNN7s0If9sF8til
         Za3vqk7eILTckkc8/JLsPbjuP3gIRCzTaytcciDFMYqRCLG957cp2kDUbDeCMlUz8WF/
         gbDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721645013; x=1722249813;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uUJ0LhTHkPKliaHMVBuaNiS2nMMCe9pRxCR6YJM2wL8=;
        b=JlQVZK01CyRVV0vjM/VbK3W9V8j2xZCWpileLSpQWHM+X5RcFkNDPFu1HY8FGgTbhL
         g90k1vSm362sefLuc5WtqBoe3lxXsUWcpN57oYPERgYa/3ZlYtL0N17qIs6AlCD1dz90
         ZuWVQAcRtb5mjkdnjOADHk8QTCHkBqeEMn0FExgnOe/OyUwm11q/qWlmP4c4vGG9+DwJ
         vEMOR8C23qmBzDV0vhJMhddvDHGnyQgsYAeAPfslO6QCyOXIHjPIqu6RO7jMgqAtZSFY
         QUv7MgQ5ziL+ru17KupIAa7lEKquKLh8F5R2WTUgVbhH7C4vS/BXO5NQgORY69/hSllQ
         hn6A==
X-Forwarded-Encrypted: i=1; AJvYcCUTisdM2oWdlxbnd0f45gFgnWl637csnm8GTS48RAojCH59xBC+gZ7V0oguns6+gLheA7up8tzTM+l6wRtNgZrpLNMp6DGiVeCKlA4owYM=
X-Gm-Message-State: AOJu0Yzz+Nld8hq+fkDUeDMAl/xB9bycrUysfFLGAVcwTFyM4D6JPY53
	a1RmE4BPFXnPE+wabXDJTQ75W0Ffz0an8NcMVTz68dmhAonfXZCeT3xzYiut2w==
X-Google-Smtp-Source: AGHT+IFyIHZ7Jde/nlBLtjXyVYXyp13+RZKGKFcRGEOHqoPquzQJ6FXDh3Bhw+yy+qdFeKIpmqkzqQ==
X-Received: by 2002:a05:6402:5111:b0:599:4d6c:d70c with SMTP id 4fb4d7f45d1cf-5a479a6e7b1mr3633869a12.8.1721645013198;
        Mon, 22 Jul 2024 03:43:33 -0700 (PDT)
Message-ID: <9123e966-1ec6-4853-b6a2-f92e21dc784c@suse.com>
Date: Mon, 22 Jul 2024 12:43:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/efi: Unlock NX if necessary
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Gene Bright <gene@cyberlight.us>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240722101838.3946983-1-andrew.cooper3@citrix.com>
 <20240722101838.3946983-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240722101838.3946983-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.07.2024 12:18, Andrew Cooper wrote:
> EFI systems can run with NX disabled, as has been discovered on a Broadwell
> Supermicro X10SRM-TF system.
> 
> Prior to commit fc3090a47b21 ("x86/boot: Clear XD_DISABLE from the early boot
> path"), the logic to unlock NX was common to all boot paths, but that commit
> moved it out of the native-EFI booth path.
> 
> Have the EFI path attempt to unlock NX, rather than just blindly refusing to
> boot when CONFIG_REQUIRE_NX is active.
> 
> Fixes: fc3090a47b21 ("x86/boot: Clear XD_DISABLE from the early boot path")
> Link: https://xcp-ng.org/forum/post/80520
> Reported-by: Gene Bright <gene@cyberlight.us>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
for both patches, yet with two remarks and a nit here:

First: Cleanup in the earlier patch will get in the way of backporting
this easily. Let's hope I won't screw up.

> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -736,13 +736,33 @@ static void __init efi_arch_handle_module(const struct file *file,
>      efi_bs->FreePool(ptr);
>  }
>  
> +static bool __init intel_unlock_nx(void)
> +{
> +    uint64_t val, disable;
> +
> +    rdmsrl(MSR_IA32_MISC_ENABLE, val);
> +
> +    disable = val & MSR_IA32_MISC_ENABLE_XD_DISABLE;
> +
> +    if ( !disable )
> +        return false;
> +
> +    wrmsrl(MSR_IA32_MISC_ENABLE, val & ~disable);

The base ISA not having ANDN or NAND (and a prereq to my patch to add
minimum-ABI-level control to the build machinery still sitting there
unreviewed), using "val ^ disable" here would likely produce slightly
better code for the time being.

> @@ -752,10 +772,17 @@ static void __init efi_arch_cpu(void)
>      caps[FEATURESET_e1d] = cpuid_edx(0x80000001U);
>  
>      /*
> -     * This check purposefully doesn't use cpu_has_nx because
> +     * These checks purposefully doesn't use cpu_has_nx because

Nit: With the change to plural, switch to "don't"?

Jan

