Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0EC85B42D
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 08:45:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683185.1062570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcKoP-0003GG-To; Tue, 20 Feb 2024 07:45:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683185.1062570; Tue, 20 Feb 2024 07:45:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcKoP-0003Dj-QL; Tue, 20 Feb 2024 07:45:09 +0000
Received: by outflank-mailman (input) for mailman id 683185;
 Tue, 20 Feb 2024 07:45:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YSgb=J5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rcKoO-0003Db-G0
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 07:45:08 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f75ed2a9-cfc3-11ee-8a52-1f161083a0e0;
 Tue, 20 Feb 2024 08:45:07 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4126dd40a54so3735005e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Feb 2024 23:45:07 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 p17-20020a05600c469100b004120b4c57c9sm13842866wmo.4.2024.02.19.23.45.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Feb 2024 23:45:06 -0800 (PST)
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
X-Inumbo-ID: f75ed2a9-cfc3-11ee-8a52-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708415107; x=1709019907; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gUHDm++rJxrZmyWvH6jBOaVy8/JQwpnsk5PLwAGeL+c=;
        b=cVFNCzYmmwZXrVr7D7XDbJbdHjTVX3KMbSn1B6IiJomtJqvt9WcOH636taYzeud1sT
         FfoRNKs2muhU/crbsoBUMt68sFsu8wIxdZtNPHXaJcAK6WcYPsi/roD0Fhorr2qCqqlL
         +hQfrJkFLuAs4U/921sEDiuCBWn9PjzSdEKtU1i3YKPFnjay1eHC9bdXC9K15sTJp35L
         5Mh3ZT/nbOi3llPE9bf6hufnZXZ2X5U9SkwRNNpVpufdueMUc70Zm0XYU5k1qNTbF/ah
         hAp966FeGhloRYvwIcytMg0zaBCy+5nP8uHBfzCeidmAKVDKfSoyjzkcK7x+9d519huC
         xArg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708415107; x=1709019907;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gUHDm++rJxrZmyWvH6jBOaVy8/JQwpnsk5PLwAGeL+c=;
        b=w+0LpnrFC2Ohao7GMwNDe7RuOPusFkZreIRdepbYhSbfKQmD1VlS49KqsvIS8w7Lif
         GjwMRCd9BBkJp8IiaTdGS/VXswSHOgMjN+8EkBrzIMKAPZl0SOZiVZHR5E3lJhZE2vCr
         +T7ihrg4dRQUQgbOvHCKM/qw/CcDVQd5yZ6XWQ/jhw5Mn7EuH1TloJw+oiCPkTcuMqSj
         +CJitihj9ipa+zC7fonfv3USCDPuk7OUCJf0PWkilZfP3/cjAOYNxRa6B6bt0ijkuImN
         ZNUAHmpwG4EpWr1vsQQrlc+DRnehK3BsqsOvCfwotK4mK5+kbl8Ew6C/5KsH52+v+zGb
         O8Bg==
X-Forwarded-Encrypted: i=1; AJvYcCXt14t2ccpw3uA/YGjQizLWD6QTydhmnBDypufQc0WoSbs3/WO8ga6HJwZ+tssau+V/BCU+rJxulOnyTF25oPv3Vh0c8nwThkf0beY2LHU=
X-Gm-Message-State: AOJu0YwHOxlXn6/7UTRykzeDGsNvlVgwIG8ga8fyUXqShVUtnm8W3/Cu
	kNOV//ImWbMklQgxtgx9V5YVFCy6E2wXpX/wbRTmeIzGtFwHVNusD8/OxUyb0A==
X-Google-Smtp-Source: AGHT+IFYIAlUadMDqejLTbHkz/pmDNkrmNWdeYu4jJMLp6MzAyvy1taPWooutRgPTOSjBFuyaPhD0Q==
X-Received: by 2002:a05:600c:1f87:b0:411:fc3f:c620 with SMTP id je7-20020a05600c1f8700b00411fc3fc620mr13119388wmb.20.1708415106721;
        Mon, 19 Feb 2024 23:45:06 -0800 (PST)
Message-ID: <d90d98b6-508b-4a2a-ab6a-74a9828a5b94@suse.com>
Date: Tue, 20 Feb 2024 08:45:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] xen: cache clearing and invalidation helpers
 refactoring
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cc6bf44701c808645c69bacaf4463295e2cb0fba.1708354388.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <cc6bf44701c808645c69bacaf4463295e2cb0fba.1708354388.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.02.2024 16:14, Nicola Vetrini wrote:
> The cache clearing and invalidation helpers in x86 and Arm didn't
> comply with MISRA C Rule 17.7: "The value returned by a function
> having non-void return type shall be used". On Arm they
> were always returning 0, while some in x86 returned -EOPNOTSUPP
> and in common/grant_table the return value is saved.
> 
> As a consequence, a common helper arch_grant_cache_flush that returns
> an integer is introduced, so that each architecture can choose whether to
> return an error value on certain conditions, and the helpers have either
> been changed to return void (on Arm) or deleted entirely (on x86).
> 
> Signed-off-by: Julien Grall <julien@xen.org>
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> The original refactor idea came from Julien Grall in [1]; I edited that proposal
> to fix build errors.
> 
> I did introduce a cast to void for the call to flush_area_local on x86, because
> even before this patch the return value of that function wasn't checked in all
> but one use in x86/smp.c, and in this context the helper (perhaps incidentally)
> ignored the return value of flush_area_local.

I object to such casting to void, at least until there's an overriding
decision that for Misra purposes such casts may be needed.

> --- a/xen/arch/arm/include/asm/page.h
> +++ b/xen/arch/arm/include/asm/page.h
> @@ -123,6 +123,7 @@
>  
>  #ifndef __ASSEMBLY__
>  
> +#include <public/grant_table.h>

This is a no-go, imo (also on x86): Adding this include here effectively
means that nearly every CU will have a dependency on that header, no
matter that most are entirely agnostic of grants. Each arch has a
grant_table.h - is there any reason the new, grant-specific helper can't
be put there?

> @@ -182,21 +183,21 @@ void flush_area_mask(const cpumask_t *mask, const void *va,
>  }
>  
>  static inline void flush_page_to_ram(unsigned long mfn, bool sync_icache) {}
> -static inline int invalidate_dcache_va_range(const void *p,
> -                                             unsigned long size)
> -{ return -EOPNOTSUPP; }
> -static inline int clean_and_invalidate_dcache_va_range(const void *p,
> -                                                       unsigned long size)
> +
> +static inline int arch_grant_cache_flush(unsigned int op, const void *p,
> +                                     unsigned long size)
>  {
> -    unsigned int order = get_order_from_bytes(size);
> +    unsigned int order;
> +
> +    if ( !(op & GNTTAB_CACHE_CLEAN) )
> +        return -EOPNOTSUPP;
> +
> +    order = get_order_from_bytes(size);
>      /* sub-page granularity support needs to be added if necessary */
> -    flush_area_local(p, FLUSH_CACHE|FLUSH_ORDER(order));
> +    (void) flush_area_local(p, FLUSH_CACHE|FLUSH_ORDER(order));

As to my objection to the addition of a cast, did you actually check
what this function returns, before saying "incidentally" in the
respective remark? Already the return type being "unsigned int" is
indicative of the return value not being suitable here for handing
on.

In addition there shouldn't be a blank after a cast. Instead, if
already you were to touch this line, it would have been nice if you
took the opportunity and added the missing blanks around the binary
operator involved.

Jan

