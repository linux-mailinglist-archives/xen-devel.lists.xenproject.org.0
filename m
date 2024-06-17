Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A899D90B0A1
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 15:59:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742331.1149111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJCtF-00031s-3b; Mon, 17 Jun 2024 13:59:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742331.1149111; Mon, 17 Jun 2024 13:59:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJCtF-0002zv-0c; Mon, 17 Jun 2024 13:59:21 +0000
Received: by outflank-mailman (input) for mailman id 742331;
 Mon, 17 Jun 2024 13:59:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E9YK=NT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sJCtD-0002zL-SC
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 13:59:19 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca05eda7-2cb1-11ef-b4bb-af5377834399;
 Mon, 17 Jun 2024 15:59:18 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-57cb9a370ddso4935592a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jun 2024 06:59:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56f427a5sm510584866b.180.2024.06.17.06.59.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 06:59:17 -0700 (PDT)
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
X-Inumbo-ID: ca05eda7-2cb1-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718632758; x=1719237558; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=S6FTxIfyV3G3v0Xf00XwxNaEQwEy+XPadyrqAOm4T8U=;
        b=CHajNYEJQ2ecPdvfLA4Ka3J7kMukDCKIIACIg69m35yFT2DFOv+8mpBSHlG2dUVrkG
         N+87jvo4i0GxjMDNTrqPnZtX8AO63pCiP54nPnmtYtEmq3PZzgFC1pnlABeSJRwvWxQ8
         +iWx476/LndMS8//+yXxW3iGNnknJl9lGgFWDQuwBhkVis3426LB3eERb4m3Pg1RI9du
         8ZOlYVytpjcIYzTOzYhoWoo04ZTaAZPGwSw5954XjZgyTVaNWsVMyHELnuFMtJ1r9nHU
         lNp/Gzg5RtxvQv0REc3xOxERD08Wh8FkHDxZVRMd8b3qJadvXUaiMi4j4ZgYHfvgV2tw
         iodg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632758; x=1719237558;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S6FTxIfyV3G3v0Xf00XwxNaEQwEy+XPadyrqAOm4T8U=;
        b=P5Mjbg/6Aq8bw5iQcXVBgykbXffCy93r/zQT0CYkf5iavctTOAy/otrIeLyy2FsTC7
         dkqJ/c6BP+/3Ip6c6rbXZ0OHxe39QL873ozp3emLq+5pbPOH18pLoWA7tQn9qEz+TwJU
         87JUI0LM8LiGXrjn2zWFmDBOoBe7TqQpR4ZqpCiIyBRcqv+flRf/RH0Mk3DkMIC7VQ2Y
         8uXenSU4SOpa2ZVkaoda8nehpIhvfXFGItlUEbluIKaj/ZOM8HkE+kYlkMoMaIUqNajY
         DIFYvNXfFX+kDqbRNROwERu5CNgDWOhsOmod7pDNiaUfbqUHMAMJt+ZDiiTsajKIHGiW
         KhmA==
X-Forwarded-Encrypted: i=1; AJvYcCWP+4pbmmSZxWJzHuAxPACURAy+MQMWCTmvCW5bFIhuCR2D2FX9RJD3mZBj3hKVa86be3Y0549ShohXHLW8aXgUsO4KZMiioe9ily0RV80=
X-Gm-Message-State: AOJu0YzbbPD95G1x8AoE6coxykIh2YYax5vEMr/EfqhxL6GWeZZTrEDZ
	XX4TyYiIU2LNGe6zmIg31StRbff9JuhzSSw/y9syTZ6GfpQBDH40Bb5mUhj5uA==
X-Google-Smtp-Source: AGHT+IFuWRNI4WU/0NI91wSTK7aC91vjaBJFxZ5g6WrCGLQ4YILFcumXere8oGHySDRkGTodqwkxBA==
X-Received: by 2002:a17:906:b858:b0:a68:ece7:8db5 with SMTP id a640c23a62f3a-a6f60d2c9e0mr615190066b.31.1718632757612;
        Mon, 17 Jun 2024 06:59:17 -0700 (PDT)
Message-ID: <fe216906-da96-4815-8a85-bf3428f380fa@suse.com>
Date: Mon, 17 Jun 2024 15:59:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/e820 address violations of MISRA C:2012 Rule 5.3
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1718380780.git.alessandro.zucchelli@bugseng.com>
 <1a02a5af6c2a737bc814610d4cc684ad4a00b8dc.1718380780.git.alessandro.zucchelli@bugseng.com>
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
In-Reply-To: <1a02a5af6c2a737bc814610d4cc684ad4a00b8dc.1718380780.git.alessandro.zucchelli@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.06.2024 18:12, Alessandro Zucchelli wrote:
> --- a/xen/arch/x86/e820.c
> +++ b/xen/arch/x86/e820.c
> @@ -593,79 +593,79 @@ int __init e820_add_range(uint64_t s, uint64_t e, uint32_t type)
>  }
>  
>  int __init e820_change_range_type(
> -    struct e820map *e820, uint64_t s, uint64_t e,
> +    struct e820map *map, uint64_t s, uint64_t e,
>      uint32_t orig_type, uint32_t new_type)
>  {
>      uint64_t rs = 0, re = 0;
>      unsigned int i;
>  
> -    for ( i = 0; i < e820->nr_map; i++ )
> +    for ( i = 0; i < map->nr_map; i++ )
>      {
>          /* Have we found the e820 region that includes the specified range? */
> -        rs = e820->map[i].addr;
> -        re = rs + e820->map[i].size;
> +        rs = map->map[i].addr;

I'm not overly happy with the many instances of map->map that we're now
gaining, but perhaps that's about as good as it can get. Hence
Acked-by: Jan Beulich <jbeulich@suse.com>

As mentioned for patch 1, please remember though to actually describe
what the conflict is in patches like this one. In this case, unless there
ends up being a need to submit another version, I'll try to remember to
add half a sentence while committing.

Jan

