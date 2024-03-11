Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7700877B74
	for <lists+xen-devel@lfdr.de>; Mon, 11 Mar 2024 08:49:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691212.1076928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjaP4-0001hq-30; Mon, 11 Mar 2024 07:48:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691212.1076928; Mon, 11 Mar 2024 07:48:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjaP3-0001fM-WD; Mon, 11 Mar 2024 07:48:58 +0000
Received: by outflank-mailman (input) for mailman id 691212;
 Mon, 11 Mar 2024 07:48:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZVPQ=KR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rjaP2-0001fG-27
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2024 07:48:56 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf63db75-df7b-11ee-afdc-a90da7624cb6;
 Mon, 11 Mar 2024 08:48:55 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-563c595f968so4814949a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 Mar 2024 00:48:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 oz14-20020a170906cd0e00b00a44a859fd9dsm2654988ejb.174.2024.03.11.00.48.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Mar 2024 00:48:54 -0700 (PDT)
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
X-Inumbo-ID: cf63db75-df7b-11ee-afdc-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710143334; x=1710748134; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5YnNVAOc7BXvV5iVxvavJvXDOKz/8kh5qY/iWDfQuo0=;
        b=Jd+aOOHBA7BJUfQRL4ujWxV+m9w8Ttvca67/ySYfhraWAxB0Nb2jNujdMw5FFbBtNV
         IAQUMJl3+/2VvuT6cZLgu7DAJzndvqQjtXlYxuyLKSmYVvBN3Sifz+d5gE+lpCSOrBt2
         u5IfFEHl6GflgtaYA5vryE2mKBVv/RHu/t/EBrrVtgQ7haaVxUbf/VL6jK2YZTrwaLeX
         quUtLRjfv9pqYbcNzaHJYYSPcOlKh3eAs94ob+camlyBHj6FMHi1tTwqHgr/BEtQa8DG
         0a8VI6L/ya3Qsb32U4uu8IMd7WjgIEqDk79moemxuHlit3NTNk4kgwSKUr7YIjbzpJws
         qBUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710143334; x=1710748134;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5YnNVAOc7BXvV5iVxvavJvXDOKz/8kh5qY/iWDfQuo0=;
        b=dwaABXSKsGJzgddOZ4hw2HvOUw5vc5LM/hVvWygDLMGYqPgNINzwVI2iHntzDxCDJe
         BnQJDjpGbEAy7B20nWWMYuKc0ox3pTgsJUnbm9gwKP2B6y+kz/vhYViw2FRfSzsjHOCb
         6wVWMn7YnrrseYxCrASQSJXzXCF/vh4UwxTv+Qp5sm31V1ByDV0TPMIGTz+eNniNFUCi
         LxCMUFr5eQT2sjo5eb90Vpg2N2nkFkToEu5/VH23xPW/KiYBRYgJ98VP9DwRkqkjC01R
         YD66V2SAVXrefSroEcp/4Ium+k0Coe6HlSvCIOFJzhfURggZt160dpL4yISJpvWw72uV
         VVfg==
X-Forwarded-Encrypted: i=1; AJvYcCU64qCD97AHn06VcRrpeCqGH8Y7LUHbcSrZon2CobU4uiS8HKjrboIFk19tSNFWdRCWPJ8DkM58FF8PD6Sdv0xWMWjXYMkxMVa4OJSe5ao=
X-Gm-Message-State: AOJu0Ywvemt3LNGlyrtejXGqZy/ikJMCIkIvr5gMOcz3eGL1q45GwjTz
	3pLA705Q2YldcRdBM9+1ZCHWN2rFHWUti+ii74ujGIcc2mDC9tZou2DunUcJpg==
X-Google-Smtp-Source: AGHT+IE0zHiIdB9+wg9JSh8aBlHc7Vl6l9/UnGMzGeYHGT24LuoYdmP0qpNoAjQF4ep9OYyTvAIF5Q==
X-Received: by 2002:a17:907:c20e:b0:a46:19a7:3b2 with SMTP id ti14-20020a170907c20e00b00a4619a703b2mr2452848ejc.37.1710143334531;
        Mon, 11 Mar 2024 00:48:54 -0700 (PDT)
Message-ID: <0d3af110-773e-40bd-bd95-b385f49a7c47@suse.com>
Date: Mon, 11 Mar 2024 08:48:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 3/7] xen/list: address violations of MISRA C Rule
 20.7
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, bertrand.marquis@arm.com,
 julien@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1709896401.git.nicola.vetrini@bugseng.com>
 <b93a64b93ef4210f5fe96368c2522e5e71e9c87c.1709896401.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <b93a64b93ef4210f5fe96368c2522e5e71e9c87c.1709896401.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.03.2024 12:21, Nicola Vetrini wrote:
> --- a/xen/include/xen/list.h
> +++ b/xen/include/xen/list.h
> @@ -479,9 +479,9 @@ static inline void list_splice_init(struct list_head *list,
>   * @n:      another &struct list_head to use as temporary storage
>   * @head:   the head for your list.
>   */
> -#define list_for_each_backwards_safe(pos, n, head)              \
> -    for ( pos = (head)->prev, n = pos->prev; pos != (head);     \
> -          pos = n, n = pos->prev )
> +#define list_for_each_backwards_safe(pos, n, head)                 \
> +    for ( (pos) = (head)->prev, n = (pos)->prev; (pos) != (head);  \
> +          (pos) = n, n = (pos)->prev )

I think this is worse than before and incomplete: At least the rhs use of n
also needs parenthesizing. Plus if pos is parenthesized even in lhs
instances, imo n ought to be, too.

Jan

