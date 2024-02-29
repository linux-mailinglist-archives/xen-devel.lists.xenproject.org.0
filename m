Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED23186CEEF
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 17:26:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687287.1070541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfjEJ-0000aj-EC; Thu, 29 Feb 2024 16:25:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687287.1070541; Thu, 29 Feb 2024 16:25:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfjEJ-0000Z2-AI; Thu, 29 Feb 2024 16:25:55 +0000
Received: by outflank-mailman (input) for mailman id 687287;
 Thu, 29 Feb 2024 16:25:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x8AV=KG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rfjEH-0000WZ-BD
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 16:25:53 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 331132ca-d71f-11ee-a1ee-f123f15fe8a2;
 Thu, 29 Feb 2024 17:25:49 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-563cb3ba9daso1563324a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 08:25:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 et5-20020a056402378500b00566a66b7409sm601971edb.16.2024.02.29.08.25.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 08:25:48 -0800 (PST)
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
X-Inumbo-ID: 331132ca-d71f-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709223949; x=1709828749; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m5uwW5Gs8BNeP8m0OIGGJgypUgHyrMfzDBMuxqGO/mM=;
        b=PoMvTrT0wVf1Jtk2EEuZa46OshXdMSYDUI7urEJh3D3s8dyXIY1ML9NL8kYsH0Xslg
         3MXaWQJLm3vWLQWY9zeVfnxyl1+StFSCTSn0pkz6CTJi9fGFqCBDnVI0FE2Z1xkzWUZD
         PQ7VMaHzCLosUSr1sxcU7D+Mk03oxMrOSg1eLzG6vVNej/dOqITr6OHrVcoEBW3/lEqa
         7j25VjEPhJrD9BuPoOlANJe2PCPr3KAVBl/mcd9Ek/kyVY+winqWOXZPvWS8qh4PUxql
         QdqREMqhARhND3pPMJmF/QO4cANBqRai8/ELxABsrTaqzSq5+EOcJW+hq0YZqRkvuHjE
         d9yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709223949; x=1709828749;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m5uwW5Gs8BNeP8m0OIGGJgypUgHyrMfzDBMuxqGO/mM=;
        b=ocStEa1Nlgi6V92dT+IzdqJX5D+dAQHm56aPMyRFI4rng2PHZpjwKCA3e6cQivCuiJ
         ZzBHDTxtfJRb8yo9HXmcFdksfCHXGCWH2vaQ8mIxoyXAceZs3Hyi/Q6KHgIGa4mW03bS
         4rDydjVa5PL8pqo4DbWQBP7oVbCS7LFX3YdbujTr240xX9R0ed/2s/Pa9bsaajzmh3Bo
         P3GGer8l3uWLNIGYQx0A0FmYpeaMmjnB+004PFEX4PWRhVb4hWH33cifwfjzdUBEckF2
         l4a51YMt5VHYBl5oMkf8DECa2DoqAUPfw/DBwpxVXMIGL0cB/o2DaFPv2FaOA/c+aeqH
         03fg==
X-Forwarded-Encrypted: i=1; AJvYcCX6NSqstkiELiEpts/dVprT3vxyTSZXZWrk0jglLTRcRGg1gObbricD8ygmMol0Bqw/eOfiVHI8gRZA0Rz1dGiLzs7a8x5CK9DjCU6h1y0=
X-Gm-Message-State: AOJu0YxzkYRg4p3bCgTCqUaND/x26uzYROx+xVAo591ShSrnf/KsFJRl
	RVehiadYNGfKMR4RWANWTn+y2RExA7p3regHH1aTNzf32PQjrzpSYYKUpuQkXA==
X-Google-Smtp-Source: AGHT+IEwimYARGtTXDS8xxyeHSDO65Ehn0VSIKYV8ZFLXZJa0tE4RgdrnlhL9vxhBmyUjuN262iO2A==
X-Received: by 2002:a50:ef07:0:b0:566:2a1a:fe18 with SMTP id m7-20020a50ef07000000b005662a1afe18mr1953136eds.36.1709223949170;
        Thu, 29 Feb 2024 08:25:49 -0800 (PST)
Message-ID: <26be05f7-7361-40d9-92f2-cf2e22da9d4e@suse.com>
Date: Thu, 29 Feb 2024 17:25:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 01/10] xen/include: address violations of MISRA C Rule
 20.7
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1709219010.git.nicola.vetrini@bugseng.com>
 <15d6e4fb5c873e7ea42cfcee2faa0bf33c10d101.1709219010.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <15d6e4fb5c873e7ea42cfcee2faa0bf33c10d101.1709219010.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.02.2024 16:27, Nicola Vetrini wrote:
> --- a/xen/include/xen/kconfig.h
> +++ b/xen/include/xen/kconfig.h
> @@ -25,7 +25,7 @@
>  #define __ARG_PLACEHOLDER_1 0,
>  #define config_enabled(cfg) _config_enabled(cfg)
>  #define _config_enabled(value) __config_enabled(__ARG_PLACEHOLDER_##value)
> -#define __config_enabled(arg1_or_junk) ___config_enabled(arg1_or_junk 1, 0)
> +#define __config_enabled(arg1_or_junk) ___config_enabled(arg1_or_junk (1), (0))
>  #define ___config_enabled(__ignored, val, ...) val

In addition to what Andrew said, would you mind clarifying what exactly the
violation is here? I find it questionable that numeric literals need
parenthesizing; they don't normally need to, aynwhere.

> --- a/xen/include/xen/list.h
> +++ b/xen/include/xen/list.h
> @@ -490,9 +490,9 @@ static inline void list_splice_init(struct list_head *list,
>   * @member: the name of the list_struct within the struct.
>   */
>  #define list_for_each_entry(pos, head, member)                          \
> -    for (pos = list_entry((head)->next, typeof(*pos), member);          \
> -         &pos->member != (head);                                        \
> -         pos = list_entry(pos->member.next, typeof(*pos), member))
> +    for (pos = list_entry((head)->next, typeof(*(pos)), member);          \
> +         &(pos)->member != (head);                                      \
> +         pos = list_entry((pos)->member.next, typeof(*(pos)), member))

this ends up inconsistent, which I think isn't nice: Some uses of "pos"
are now parenthesized, while others aren't. Applies further down as well.

You may also want to take this as a strong suggestion to split dissimilar
changes, so uncontroversial parts can go in.

> @@ -977,4 +977,3 @@ static inline void hlist_add_after_rcu(struct hlist_node *prev,
>            pos = pos->next)
>  
>  #endif /* __XEN_LIST_H__ */
> -

Unrelated change?

> --- a/xen/include/xen/spinlock.h
> +++ b/xen/include/xen/spinlock.h
> @@ -94,7 +94,7 @@ struct lock_profile_qhead {
>      int32_t                   idx;     /* index for printout */
>  };
>  
> -#define _LOCK_PROFILE(lockname) { .name = #lockname, .lock = &lockname, }
> +#define _LOCK_PROFILE(lockname) { .name = #lockname, .lock = &(lockname), }

This also may be viewed as falling in the same category, but is less
problematic because the other use is stringification, when in principle
some kind of expression would be passed in (albeit in practice I don't
expect anyone would do that).

Jan

