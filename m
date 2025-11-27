Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5338C8DD70
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 11:51:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173751.1498755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOZbA-0008G3-Rz; Thu, 27 Nov 2025 10:51:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173751.1498755; Thu, 27 Nov 2025 10:51:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOZbA-0008D5-OZ; Thu, 27 Nov 2025 10:51:40 +0000
Received: by outflank-mailman (input) for mailman id 1173751;
 Thu, 27 Nov 2025 10:51:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mf1n=6D=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOZb9-0008Cz-FD
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 10:51:39 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0bcc123b-cb7f-11f0-980a-7dc792cee155;
 Thu, 27 Nov 2025 11:51:37 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-42b38de7940so344615f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Nov 2025 02:51:37 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1c5168acsm2769976f8f.0.2025.11.27.02.51.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Nov 2025 02:51:35 -0800 (PST)
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
X-Inumbo-ID: 0bcc123b-cb7f-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764240696; x=1764845496; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fuNkvfFW2Iv0MNCHZq+eylUOGEvVMnchrkzhL3kueuI=;
        b=gGFb6QxH3dmANs+x5LrqqZtV2FpcXxw4GYve+RqB6pM425XALwFPcyAqc92RxdQi/J
         fzeTfVlBWoOr3xv4rAxuu2LeTYdg9NNPxRPtpFAXTr3JQgGwzNQjxRYNavCYJ4MUuoGe
         5+pnTBipbO0ti9bnMamLyT3QM912NgXCFLcTa3Zah5hZfgYSThRx5IC3EpAOpc5mBbjd
         GhWp7rkwitEK3q4Zd0Ygu5xDIU0pMc0F+veeFJoXp9KBsZJKN1AVFyREtFfMqMhqILZQ
         dG/8d3IgWoQb9cwWArYmSaVQjnaLFtwDVDhGengA1yWOJa/wUurX02cqqRlKqxMxaxNA
         UrSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764240696; x=1764845496;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fuNkvfFW2Iv0MNCHZq+eylUOGEvVMnchrkzhL3kueuI=;
        b=rbVmrf0djiy3l4xOwP9I7BjAgOqgHYs2knEIxsJuzWN7tEdOdD2YZUizSVh2IfIVix
         pmU7JJIMB1sZzW9W88qHPAIVIpUcGhOeGY8Ze9g7d2iUdcCicbEmTuBKyZuAfYoi6qYy
         4HD62jRF6Ne89DVLOMdsZWlJITo9a+mufBEMsVxLgOhvjOyB3x5REAdSgyi33TNJb0Dj
         JUd4I4zhCSIJzewtUsMlFpjXxAoarVv7j2W8n4otKWBUdSgdUr7PAR17QPsEllyLtd4G
         BvobhYX7BgznEwpD48gP5GnI+nW38agtbO+6mhg9wmp2KSIEnHV7yaw3Xu0jfYi2qaB6
         dHMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWf9XS/5TGkhzNKwz8sR3VlBz7qeJwJbGvsMDR3/OINjCJoQ+c/3FOqFjC281CJbKNzE/hGgjfUnIk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzF9Ixv4HDXkKej/NyjjGWILfXnmzcCdHFkUYFa45H3v/L+LJg6
	H4SG2Mk25Sqsvbfu9Vm9TxVs4GP/d1LyLR5cb0HjvuVum++Tpw26mzfRd0PrdpKzIQ==
X-Gm-Gg: ASbGnctVRFTf6DHYDTpe6PjaG10fr0tIX1nKsZXteHs6xW1NjPViiwMK4AhtdEEIJbR
	bV8ceyp5ohnWSPL1aXb2aPAn+3sadIiQvu3KqKKyL2qlohIiZgAxVA0ywGRinikw6xvZs2SAvgh
	s59hXApZsaKCIWjk3feTXmPdPHcfogMUSiCPohqIzf1cAl6WQO07XAlUJIB5HjdswxdEaShNZCE
	5brQw6UXPO+Yo3NVOnRCQEdylX5fK9d2dIjxARfoTNMfvj4oj+fPPgjRElVhYOFmGgHfPy5e0ZU
	Kqv1xY8jVEX0KMQqw3j6/MpBv59LmyBiPTVd4Xu7BonN4vcGBlKSYJaW5Ncms5f71ZMfYjym5J9
	jEfil0+6ziCzRWotINiDmdvD5Iz3mcYI8ymgKpobRMThSpFrgpwFMJARqMx9+S6EQnsA1ZuBEEF
	D2wsPiSIJP4Qp7q0K7Z+Ld8K2IOkNCezk7B59BvkdDd2dkzbrnFPm2115DcP0c08Ich0YWC+0Mz
	mjzYfVV7J/DpQ==
X-Google-Smtp-Source: AGHT+IFldfk4lMKK8bYTZMbXRPEjEoufVsap0JIPFEOSCa7d5JG5ga95XCu4QaryqgZR8phCxa3GZA==
X-Received: by 2002:a05:6000:4201:b0:42b:3eb2:1b97 with SMTP id ffacd0b85a97d-42cc1ab7181mr27263439f8f.9.1764240696255;
        Thu, 27 Nov 2025 02:51:36 -0800 (PST)
Message-ID: <ad217ce2-0b3c-4746-b32e-3b3bc7c9cc51@suse.com>
Date: Thu, 27 Nov 2025 11:51:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 04/11] x86: Refactor early vendor lookup code to use
 x86_vendor_is()
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20251126164419.174487-1-alejandro.garciavallejo@amd.com>
 <20251126164419.174487-5-alejandro.garciavallejo@amd.com>
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
In-Reply-To: <20251126164419.174487-5-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.11.2025 17:44, Alejandro Vallejo wrote:
> Move the "unknown" vendor ahead of all others and have it NOT rely
> on x86_vendor_is(), as that would yield incorrect values for the
> single-vendor+no-fallback case when running in incorrect hardware
> (because x86_vendor_is() becomes a folded constant of the single
> compiled-in vendor).
> 
> This is one of the two places where x86_vendor_is() cannot be used,
> along with the compatibility check on loaded guest CPU policies.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> ---
>  xen/arch/x86/cpu/common.c | 31 +++++++++++++++++++++++--------
>  1 file changed, 23 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
> index 393c30227f..c0c3606dd2 100644
> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -342,23 +342,38 @@ void __init early_cpu_init(bool verbose)
>  
>  	c->x86_vendor = x86_cpuid_lookup_vendor(ebx, ecx, edx) &
>  	                X86_ENABLED_VENDORS;
> -	switch (c->x86_vendor) {
> -	case X86_VENDOR_INTEL:    intel_unlock_cpuid_leaves(c);
> -				  actual_cpu = intel_cpu_dev;    break;
> -	case X86_VENDOR_AMD:      actual_cpu = amd_cpu_dev;      break;
> -	case X86_VENDOR_CENTAUR:  actual_cpu = centaur_cpu_dev;  break;
> -	case X86_VENDOR_SHANGHAI: actual_cpu = shanghai_cpu_dev; break;
> -	case X86_VENDOR_HYGON:    actual_cpu = hygon_cpu_dev;    break;
> -	default:
> +
> +	/*
> +	 * We can't rely on x86_vendor_is() here due to the single-vendor
> +	 * optimisation. It makes x86_vendor_is(x, y) rely on the constant `y`
> +	 * matching the single vendor Xen was compiled for and ignore the
> +	 * runtime variable `x`. In order to preserve sanity we must assert here
> +	 * that we never boot such a build in a CPU from another vendor, or
> +	 * major chaos would ensue.
> +	 */
> +	if (c->x86_vendor == X86_VENDOR_UNKNOWN)
> +	{

Nit: No mix of styles please. Here it wants to be Linux style.

>  		if (verbose || !IS_ENABLED(CONFIG_UNKNOWN_CPU))
>  			printk(XENLOG_ERR
>  			       "Unrecognised or unsupported CPU vendor '%.12s'\n",
>  			       c->x86_vendor_id);
> +
>  		if (!IS_ENABLED(CONFIG_UNKNOWN_CPU))
>  			panic("Cannot run in unknown/compiled-out CPU vendor.\n");
>  
>  		actual_cpu = default_cpu;
>  	}
> +	else if (x86_vendor_is(c->x86_vendor, X86_VENDOR_INTEL)) {
> +		intel_unlock_cpuid_leaves(c);
> +		actual_cpu = intel_cpu_dev;
> +	} else if (x86_vendor_is(c->x86_vendor, X86_VENDOR_AMD))
> +		actual_cpu = amd_cpu_dev;
> +	else if (x86_vendor_is(c->x86_vendor, X86_VENDOR_CENTAUR))
> +		actual_cpu = centaur_cpu_dev;
> +	else if (x86_vendor_is(c->x86_vendor, X86_VENDOR_SHANGHAI))
> +		actual_cpu = shanghai_cpu_dev;
> +	else if (x86_vendor_is(c->x86_vendor, X86_VENDOR_HYGON))
> +		actual_cpu = hygon_cpu_dev;

If it needs to be like this, then so be it, but I view it as a downside to
not be able to use switch() anymore. It's not quite clear to me though what
extra gains the transformation brings. The masking by X86_ENABLED_VENDORS
already does most of what you want, and X86_VENDOR_UNKNOWN continues to be
handled separately anyway.

Jan

