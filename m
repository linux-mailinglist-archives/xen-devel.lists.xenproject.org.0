Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0372FCAD307
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 13:44:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180461.1503634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSabG-0004pu-7m; Mon, 08 Dec 2025 12:44:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180461.1503634; Mon, 08 Dec 2025 12:44:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSabG-0004nA-4u; Mon, 08 Dec 2025 12:44:22 +0000
Received: by outflank-mailman (input) for mailman id 1180461;
 Mon, 08 Dec 2025 12:44:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mtm3=6O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vSabE-0004n4-O1
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 12:44:20 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c343710-d433-11f0-980a-7dc792cee155;
 Mon, 08 Dec 2025 13:44:18 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4775ae5684fso22378665e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Dec 2025 04:44:18 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-479311ece7asm237911495e9.12.2025.12.08.04.44.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 04:44:16 -0800 (PST)
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
X-Inumbo-ID: 9c343710-d433-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765197857; x=1765802657; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7wUHFrBu0Pftp6NamaEvwDoEZatGA9mmCuoZN2UQEH4=;
        b=eKJEH0JSOds/GycPi7Zfi1gxWypHZ8mnOz4DuojTdet2O764yuDvz4ydOqq0jtrR9y
         OiKOF40du5vRkdfn0//zRTEkSTnEacjiqvYgNdll9LKr77ly4l6QzN+cq2BfOPN2aT+M
         6M37flxAXL0HDYFlTTAsXc3F36ucuzrrczDz/0YB1yrGh1mMhIhczHf23mqTjFGhXiNg
         cfbnxFFaRnTkYzCyvad2I5cLvk7XcyLIDL9HN8ow6nHKfAhqH30DIYBSFprglbe4OUA9
         9FHk16Thp7AeIdyHFASaHffIGaOvgP/LM4ppougr+f6Uv0xM46jvlpG1adhcSTzhR/ns
         AqvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765197857; x=1765802657;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7wUHFrBu0Pftp6NamaEvwDoEZatGA9mmCuoZN2UQEH4=;
        b=TRnX8tfCrfoPbkekEUe/wUzFjhIHSrgMDOoxzygfES0zNx8fjlXggNli8NnCIcSdsP
         al7a9qVRXtRWrToCc4JoqiW5MRSgSvlFUCkAPrl/aUNJHjD9R54hNFm0wfu0CN5r8E5r
         4hM3FqaxB+cGb8Vm54gnmfVyso1s8wnAxti+lt0tbz54SojbmP88lHi8OWG583sWOB3j
         LB/TEtC/tQ0Gyn2LiWzgFD/LwO2t+ZA8IZ54kPwUIF6sloL1atXpb2jpPE5Bq9Zi7zFz
         LLdeiILGfNx5JabqStxcwTO3HYyE8jiASkf66NmdmV8ZsMqeC3dE464MQvpMR7ReF/3S
         B2bw==
X-Forwarded-Encrypted: i=1; AJvYcCVo5+vaT75rfMmIEoXJINqWx1QKyc8pW96zVjioSTbUVkfwEc0OhknlwVUQEEQtUbGasxNXzoy06gA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzWBYWjmjL6flaraQRsIb4i2QNWJhOvCCthU9O/PcyR13vMaANq
	iixq7w8Qbk0JKDMXp2xl2grwW0p5v5FP5fr3OzyG4IrZZP383kVVMfMGb+r08fkD6Q==
X-Gm-Gg: ASbGnctFufAr1uzvQfal5sHG6vgJyyPUy5HmALGB4ZZztueFwpId7zds4l3DU8+XgOY
	Z2rppJvU9sWq42zJGRJusHT5d0jXZl1KuIIYeIOocxsN4pCp3gMEJkJB0n6roG7sg0XXkNUtgh4
	Ret0OcRyMpvuNMV/hATsLYFJDmDUrphGOtplfABPS9HsoozmXAL3+OidxBoTHjbGdvHwNFkabu+
	XndG6sU0w3nxeC4lu+rw1zr/KK9lEcMXK76FowZiBQQkrQ18XGTv3Oln3ocKyD2t8G1htNp/lmu
	69AIm18FE1u/YiP89iMV/KzOY0Fyqdm78svjNORvU3PiA3bzlh+jKizw9zuS62GnoM4Z+YWNbvv
	oNCYqF8qp5X6QombBIKTNFIPnUxnI+X4P02XPwmBbgYgVAe9quoYTMlTQXymIE2ewdA6+Cjv9cX
	LtIYcEoeomjjTJw7zmf68p08+3AslwBVEjTkamXX9ek44D2DKcNmzFu7sOHEkDtyrZJ+2x+6l2B
	8mAv5QLg5NX6Q==
X-Google-Smtp-Source: AGHT+IGPlV07i8Kfqbg0zJSt94gTHEGX0dyQQN4q01jW+F/bK0g5JU+YB77pXyXFYEhO0d+6b7VDYQ==
X-Received: by 2002:a05:600c:3115:b0:477:63db:c718 with SMTP id 5b1f17b1804b1-47939e2797cmr89596135e9.16.1765197857281;
        Mon, 08 Dec 2025 04:44:17 -0800 (PST)
Message-ID: <c9ee4fc8-44c6-43e8-88eb-9041c51aed16@suse.com>
Date: Mon, 8 Dec 2025 13:44:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] xen/x86: move d->arch.physaddr_bitsize field
 handling to pv32
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251128152218.3886583-1-grygorii_strashko@epam.com>
 <20251128152218.3886583-4-grygorii_strashko@epam.com>
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
In-Reply-To: <20251128152218.3886583-4-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.11.2025 16:22, Grygorii Strashko wrote:
> --- a/xen/arch/x86/include/asm/mm.h
> +++ b/xen/arch/x86/include/asm/mm.h
> @@ -619,9 +619,12 @@ void __iomem *ioremap_wc(paddr_t pa, size_t len);
>  
>  extern int memory_add(unsigned long spfn, unsigned long epfn, unsigned int pxm);
>  
> -void domain_set_alloc_bitsize(struct domain *d);
> -unsigned int domain_clamp_alloc_bitsize(struct domain *d, unsigned int bits);
> -#define domain_clamp_alloc_bitsize(d, bits) domain_clamp_alloc_bitsize(d, bits)
> +#ifdef CONFIG_PV32
> +#define domain_clamp_alloc_bitsize(d, bits)                                    \
> +    (((d) && (d)->arch.pv.physaddr_bitsize)                                    \
> +         ? min_t(uint32_t, (d)->arch.pv.physaddr_bitsize, (bits))              \
> +         : (bits))

I'm not quite sure if converting to a macro was a good idea. But now that it's
done this way, so be it. Just that a couple of issues may want / need sorting:
- d is now evaluated up to 3 times,
- indentation is wrong,
- the use of uint32_t is against ./CODING_STYLE (I dislike the use of min_t()
  anyway, but what do you do when a macro was asked for; of course we could
  [easily] arrange for BITS_PER_LONG to be of type "unsigned int"),
- the use of "bits" in min_t() doesn't really need parentheses.

> --- a/xen/arch/x86/pv/domain.c
> +++ b/xen/arch/x86/pv/domain.c
> @@ -254,7 +254,11 @@ int switch_compat(struct domain *d)
>              goto undo_and_fail;
>      }
>  
> -    domain_set_alloc_bitsize(d);
> +    if ( MACH2PHYS_COMPAT_NR_ENTRIES(d) < max_page )

You mention the change in condition in the revlog (but not in the description),
and I'm having trouble to follow why ...

> --- a/xen/arch/x86/x86_64/mm.c
> +++ b/xen/arch/x86/x86_64/mm.c
> @@ -1119,26 +1119,6 @@ unmap:
>      return ret;
>  }
>  
> -void domain_set_alloc_bitsize(struct domain *d)
> -{
> -    if ( !is_pv_32bit_domain(d) ||
> -         (MACH2PHYS_COMPAT_NR_ENTRIES(d) >= max_page) ||
> -         d->arch.physaddr_bitsize > 0 )

... this 3rd part is going away.

Jan

