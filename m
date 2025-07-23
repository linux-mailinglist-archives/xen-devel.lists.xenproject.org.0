Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EC7B0F4B3
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 15:58:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1054060.1422884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueZzW-0008U9-BE; Wed, 23 Jul 2025 13:58:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1054060.1422884; Wed, 23 Jul 2025 13:58:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueZzW-0008Qt-62; Wed, 23 Jul 2025 13:58:42 +0000
Received: by outflank-mailman (input) for mailman id 1054060;
 Wed, 23 Jul 2025 13:58:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFh9=2E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ueZzU-0008H4-Gd
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 13:58:40 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21ee1c51-67cd-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 15:58:38 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a6e8b1fa37so4789530f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jul 2025 06:58:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6b491bsm97052795ad.126.2025.07.23.06.58.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 06:58:37 -0700 (PDT)
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
X-Inumbo-ID: 21ee1c51-67cd-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753279118; x=1753883918; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=D70zU/e0FxvG6n0n4XxyBvja1FlAvKCF8ckIzyzH9xM=;
        b=eF80SDQ6vR6Zid2gxSIMlLMHDpYTt3M4+2engLEAywORBuldAyMifJPxsNwcU7x56A
         hPt8vExAaxiwD9YWzCok6e3JEpEBFXbSxrmMT7/uLH1uo1rIsPKNIL1E97WswfJoPX7B
         jITs/fz2wSeQ5jUkcbj2sxnoCtkL+1KYiB3fscO47MFet1a9aTvFUTfktljlUECKSLgS
         Zg2RdrjmNEzEAe5cVNjvNoLTnrbxb1t6ciWcHNwu7bCOUFVE2EGgzhYT7BSqx7xs0Qna
         VxYkcN8Hugx0TxvevBKXvSoRVbtC5CjDby7dmopyh0L+Fg7xGLSUGZOOCX3c48h7JY3g
         Mqzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753279118; x=1753883918;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D70zU/e0FxvG6n0n4XxyBvja1FlAvKCF8ckIzyzH9xM=;
        b=mPy5ptAJ6BYqyIyEOV41CepCgPgICM6CRX9ZFs3sMp1gSLZqpuw/Vcp5r2nsXgrOIx
         9lDTMP8BbFLX72sLQJnx+0EbnPPjpITrwMjHPjbbQeP/4rbS+GxdbSFs1h4Qxon2Gdhq
         1mLlxVa6CSSqroRQPno8ADGXMEe7r+tjAbKE4kmaoapf7u9wDwQoglL+RzrSOOA/ChLy
         Aq+avBOvfUOWSC+JfHY/qaP7w6OzeBizLjUQQdLr6dATSP+p9+QlGANk2QTxsgAwmicd
         H5c8o9YMWSuSfAkBrTtWIZ8Zof9wJOt9xcs64aCvX/OtYzdqMde5JY2fu/Zp15CS+xNX
         ONCA==
X-Forwarded-Encrypted: i=1; AJvYcCVT7EQtj1BUQar27sH3uCn7LubxSUcu00eykVVOJDmpLSd0/2+r2xKepAxwQy3KMNKrU349aBqaXzE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzVvYssFQqMltkrDDo1g7TCXJeXNIRNnB5gy9VWQN7vQDSemSno
	HUKLf7R56+8uVsNDXHO8IcK/JP2NbP9hvsb5eVdt95c282qxlGNxFW/M2KRtpOOWUA==
X-Gm-Gg: ASbGncsj/je76CpNMHVjFE1v+kO42r6Yn4whJOvZWVg6KYOdgN1TWKXRgmw48o+dugA
	WvLCZmDeohIDnHg5yCKC2u0SOxstNx2CfQ10if6KnkhIbFo71yoc0jCx62GjSWFGSf9l6kuvyVG
	Vcqn72iZChaYrDDQfCxOBCGXjUi60QDgb5OrmJi3nhxHjDwHd0c5d7jAMvpvit1sbvqMJwqkJIp
	AwRWsg0AOcucSZr7r5c22E3GBm2o+N5XzzPCdUR6YL4dt1GfuvHTzIrfGmsRl5tU5lIqRTpdJ5i
	dRoQ7KTDaHv+1sMCLZswYUBNgr5rLdAB0UsRokCrv0CioSJKJ5qxKzPxfqplpabtVHTl/XgzE5T
	51EkuVEvECUisDARGwu+miF6rPHhMvy4i5sOLBsiTHyzveyJ6Whfpi658DYeq27rFgMkgtj9XNT
	OX8DmdsbQ=
X-Google-Smtp-Source: AGHT+IHpFk5I31RkpSI8Q7d5aR1oBiAqSQZKrBla1wQBDydFAJcA9sR8FpqDwM/0crDuk3bB8F82CA==
X-Received: by 2002:a05:6000:144c:b0:3b5:dc2a:ee74 with SMTP id ffacd0b85a97d-3b768eb427amr2942371f8f.24.1753279117845;
        Wed, 23 Jul 2025 06:58:37 -0700 (PDT)
Message-ID: <6c7341a2-fd49-40de-8ad3-e7980d4e9e42@suse.com>
Date: Wed, 23 Jul 2025 15:58:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misra: address MISRA C Rule 18.3 compliance
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Dario Faggioli <dfaggioli@suse.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c9fb095c43edfedfd6174284bac404ec9ae5523d.1753263957.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <c9fb095c43edfedfd6174284bac404ec9ae5523d.1753263957.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.07.2025 12:12, Dmytro Prokopchuk1 wrote:
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -568,6 +568,14 @@ C99 Undefined Behaviour 45: Pointers that do not point into, or just beyond, the
>  -config=MC3A2.R18.2,reports+={safe, "any_area(any_loc(any_exp(macro(^page_to_mfn$))))"}
>  -doc_end
>  
> +-doc_begin="Consider relational pointer comparisons in kernel-related sections as safe and compliant."
> +-config=MC3R1.R18.3,reports+={safe, "any_area(any_loc(any_exp(macro(name(is_kernel||is_kernel_text||is_kernel_rodata||is_kernel_inittext)))))"}
> +-doc_end
> +
> +-doc_begin="Allow deviations for pointer comparisons in BUG_ON and ASSERT macros, treating them as safe for debugging and validation."
> +-config=MC3R1.R18.3,reports+={safe, "any_area(any_loc(any_exp(macro(name(BUG_ON||ASSERT)))))"}
> +-doc_end

Nit: Drop "deviations for" from the verbal description?

> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -461,7 +461,8 @@ static void __init efi_arch_edd(void)
>                  params->device_path_info_length =
>                      sizeof(struct edd_device_params) -
>                      offsetof(struct edd_device_params, key);
> -                for ( p = (const u8 *)&params->key; p < &params->checksum; ++p )
> +                for ( p = (const u8 *)&params->key;
> +                      (uintptr_t)p < (uintptr_t)&params->checksum; ++p )

There mere addition of such casts makes code more fragile imo. What about the
alternative of using != instead of < here? I certainly prefer < in such situations,
but functionally != ought to be equivalent (and less constrained by C and Misra).

As mentioned several times when discussing these rules, it's also not easy to see
how "pointers of different objects" could be involved here: It's all within
*params, isn't it?

Finally, when touching such code it would be nice if u<N> was converted to
uint<N>_t.

> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -360,7 +360,7 @@ static always_inline void sched_spin_lock_double(
>      {
>          *flags = _spin_lock_irqsave(lock1);
>      }
> -    else if ( lock1 < lock2 )
> +    else if ( (uintptr_t)lock1 < (uintptr_t)lock2 )

Similarly, no matter what C or Misra may have to say here, imo such casts are
simply dangerous. Especially when open-coded.

> --- a/xen/common/virtual_region.c
> +++ b/xen/common/virtual_region.c
> @@ -83,8 +83,8 @@ const struct virtual_region *find_text_region(unsigned long addr)
>      rcu_read_lock(&rcu_virtual_region_lock);
>      list_for_each_entry_rcu ( iter, &virtual_region_list, list )
>      {
> -        if ( (void *)addr >= iter->text_start &&
> -             (void *)addr <  iter->text_end )
> +        if ( addr >= (unsigned long)iter->text_start &&
> +             addr <  (unsigned long)iter->text_end )

Considering further casts to unsigned long of the same struct fields, was it
considered to alter the type of the struct fields instead?

Jan

