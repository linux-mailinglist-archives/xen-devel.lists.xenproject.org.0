Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A10D5B2BF21
	for <lists+xen-devel@lfdr.de>; Tue, 19 Aug 2025 12:40:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1086431.1444625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoJlA-0002lm-CN; Tue, 19 Aug 2025 10:40:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1086431.1444625; Tue, 19 Aug 2025 10:40:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoJlA-0002jF-9R; Tue, 19 Aug 2025 10:40:08 +0000
Received: by outflank-mailman (input) for mailman id 1086431;
 Tue, 19 Aug 2025 10:40:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xm9j=27=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uoJl8-0002dZ-KL
 for xen-devel@lists.xenproject.org; Tue, 19 Aug 2025 10:40:06 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dda1ec49-7ce8-11f0-b898-0df219b8e170;
 Tue, 19 Aug 2025 12:40:04 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-6188b7949f6so9531670a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 Aug 2025 03:40:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61a75794ccbsm1565987a12.39.2025.08.19.03.40.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Aug 2025 03:40:03 -0700 (PDT)
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
X-Inumbo-ID: dda1ec49-7ce8-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755600004; x=1756204804; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=L2HfJE50R2xX3LKs3bv68gJhZRqOK54gsd8NsS9sVNY=;
        b=fBmW/FR+ZeX2E16jbuUO2mbMxGZ+1aF21t2b3Za66Z2OBVh8aav+pW8TfFrOZrmru9
         6ITluaGTrhlf1C0iu79J3ey1dT67kQDmY53IUEIMYkesopYqBStibUuzHbcJOU+j+Mr1
         5OpMPi4pCpgWaIhISniZyRAchfXAksldSBgES6c/EBBUfYOjq91TlUtX7tsSwX/lSji1
         PKKknLs7lf9/bmije+Pu2pPatV+LG3j+oLWQ5+87DVYaTf5aXvrZeDNySurUZpIKLxIt
         ssNsEg1Pv+ek4S442k5FaVd5pFTYOxK37t0g3eFaGzq7gSgdwdYvq+ZoVwUZbYx7y9zG
         fHww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755600004; x=1756204804;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L2HfJE50R2xX3LKs3bv68gJhZRqOK54gsd8NsS9sVNY=;
        b=GTk3eVC68pF7HctxYo4pyDN01z1qd/o6h4sNqGEuiVgmZFC9UbRkyKA4OSquA4baf2
         01DTH0VtubAUIIX9p4XQk9Zr2Mnt/NoNOMFJbSM3n5NGXpsEItgZOotphSCmLPH7Qxxb
         kDtokUvrfwIwSUyHSTT9szy/VvxDgsij6Uf3ILAU54HwQ9JZA1xekDTOQ6zBbIU5bB6P
         CH7KvTugPwVM/XHZ1Kra6GaW4DU78HK4lIziO+efdkcfURouifLrTQ2j9N04MV2uP+ST
         l+sv2b2MobfUC4RUUm5/dAavepijUf0cOlkhkfD3LLU2WjngDgFdoGawfdIcrap0JQqF
         kVcg==
X-Forwarded-Encrypted: i=1; AJvYcCUXo7AouaNZGxj50sJ1zx9TV7kLLw+478Jm6B97QqJ09X3hRd5eC+m/7sdin9QCOjnmAs1o0nhsuAM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzl1AiH0VNo9xt9Vha+2RkKjE8upc6uDTKuULAs+pCXdIfxjbOm
	xX3MoRNOf5HQaEBaIWrzAj4or6YiQm7qh574xjZBk1j8jOkdLBBgc4hCb3WeZpK7+g==
X-Gm-Gg: ASbGncvbHbbsIgdxMJpl3VSRnf0J8dXWiaxpAWT3VXmSpDd/eC/bXIL6blkmhrgGRpt
	i9UERTBAP79fFWPr8hfQjuTYeycG8WIeofNsd7Jf5esBKeknU1t2obDvWjz2R6gJn1v7k+slqPT
	0pKm5QctKmsCEjDWie2ZQvoY9Bvv/jtO8Eeb0c5DyhZQm9PLYgsB47srZEvKfWhBMbwZ7YIaA0Y
	gPe8mRzNZaQLbroCtUdnKf29PNm3bj1MYL38UAT90mb7YN+ClqUsP7KXnU+nULXpzxmeFzcVQjm
	M/Rthkw1mwBg4fnu13y7KMCXPIgQFfHcwhQ5WEoMOrJ5DBqH1plP4FqeWlQfCrrZi0FtV6hgZmF
	ntWGsB11n7lREDiJPf/wQkf1hyBSdV9jc9NWtAFfEtDUae84xGzc+7oh32K6Z3Ivwi4IOT0+dd8
	XPEwdSfTQ=
X-Google-Smtp-Source: AGHT+IHXp/SCz+UK5HfkXt3qyPpRM+fgVa/Ksmd0I86OXMUvMvbBX7SdMIN5TbP4gXZVq++96GRaYg==
X-Received: by 2002:a05:6402:3596:b0:618:20c1:7e74 with SMTP id 4fb4d7f45d1cf-61a7e756b98mr1549722a12.25.1755600003657;
        Tue, 19 Aug 2025 03:40:03 -0700 (PDT)
Message-ID: <85c5fbe6-48f4-4e4e-9752-5d4ef34fb8a5@suse.com>
Date: Tue, 19 Aug 2025 12:40:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/16] x86: Clean up asm/time.h
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
 <20250815204117.3312742-9-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250815204117.3312742-9-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.08.2025 22:41, Andrew Cooper wrote:
> With asm/tsc.h split out, asm/time.h shouldn't be including asm/msr.h, but it
> turns out that an outrageous number of files (even some headers) are pulling
> their dependentices transitively through asm/time.h -> asm/msr.h
> 
> Most are asm/msr{,-index}.h, but in some cases it's printk(), va_args, and
> even PRIxxx macros.
> 
> Give asm/time.h an SPDX tag, and strip trailing whitespace.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
preferably ...

> --- a/xen/arch/x86/include/asm/time.h
> +++ b/xen/arch/x86/include/asm/time.h
> @@ -1,8 +1,7 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef X86_TIME_H
> +#define X86_TIME_H
>  
> -#ifndef __X86_TIME_H__
> -#define __X86_TIME_H__
> -
> -#include <asm/msr.h>
>  #include <asm/tsc.h>
>  
>  typedef u64 cycles_t;
> @@ -38,6 +37,7 @@ uint64_t cf_check acpi_pm_tick_to_ns(uint64_t ticks);
>  
>  uint64_t tsc_ticks2ns(uint64_t ticks);
>  
> +struct cpu_user_regs;
>  uint64_t pv_soft_rdtsc(const struct vcpu *v, const struct cpu_user_regs *regs);
>  uint64_t gtime_to_gtsc(const struct domain *d, uint64_t time);
>  uint64_t gtsc_to_gtime(const struct domain *d, uint64_t tsc);
> @@ -47,7 +47,7 @@ int tsc_set_info(struct domain *d, uint32_t tsc_mode, uint64_t elapsed_nsec,
>  
>  void tsc_get_info(struct domain *d, uint32_t *tsc_mode, uint64_t *elapsed_nsec,
>                    uint32_t *gtsc_khz, uint32_t *incarnation);
> -   
> +
>  
>  void force_update_vcpu_system_time(struct vcpu *v);

... with that one line dropped rather than just pruned of trailing blanks, so
we no longer have a double blank line here.

Jan

