Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FBA96B221
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 08:50:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789841.1199508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sljq7-0005Cy-62; Wed, 04 Sep 2024 06:50:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789841.1199508; Wed, 04 Sep 2024 06:50:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sljq7-00059a-2S; Wed, 04 Sep 2024 06:50:03 +0000
Received: by outflank-mailman (input) for mailman id 789841;
 Wed, 04 Sep 2024 06:50:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxYG=QC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sljq6-0004wp-5j
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 06:50:02 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7bc6565-6a89-11ef-99a1-01e77a169b0f;
 Wed, 04 Sep 2024 08:50:00 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-533488ffaddso7573598e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 23:50:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8988fea65csm769493566b.5.2024.09.03.23.49.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 23:49:59 -0700 (PDT)
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
X-Inumbo-ID: e7bc6565-6a89-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725432600; x=1726037400; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+BQ25Mm7U3TcWEg790EOeO1rIHd2tnF2vbyDqiwzkYg=;
        b=IG+e8va/iixcA7o6zqbu72sjkoQm5RSkM80QazHqcWmsEt3dec0O1UAcZRWdoKov/P
         M0Iziyb8Ny1BKVW8wDhu5Qqnt+2+i3sRrUilSTUkJRvX5tNIe7DxMdFl1m1f2FZifWtV
         GHWnRqOX25eazscW7fv9rdOiw49UVQ9cBQeKo889OmYwrnYFryUIC3r6MK5YcVFTNcuV
         Eyc8njRIRH7TDyNdVPJ4QBZMuQUpnmZXnMvsH/oM+l0jaRkGknJ/UbZ3Eem/5C05+S7d
         MIsroWl7UKi+Tml0aGXNK4WBdMOOzDB4dtlSKvU786x3Jy01Z605+QL44fTJ+OBqewTg
         o4+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725432600; x=1726037400;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+BQ25Mm7U3TcWEg790EOeO1rIHd2tnF2vbyDqiwzkYg=;
        b=mgksmE+KFYxak3jAb7+BQZp7HgnlzOS5fswAI/OGE4RU7m+MW36axibuFr7CMobQUp
         esmUSy1qm326JoblxZ/Drank+rid4hV9Zv4l6mT2WoVOHg5qFWAY76POC1WmcQYkeF5D
         1LVNtwkCt+luR6L1loOlJ84MqqPbqbEF76oglAC8AuN/0EVfG/59i6XfMmTwMmtrLj2V
         m7b43+gFkIqlDvNrEgPIa/+3+rZI3pMfMQ0KXoAJiJiTmvhN1UsFH2dI9qCoiYD4T0er
         jyOHM0uXVHC4hR2KbZK77Q7FGJU+BCK7hSRcUoPMn0i0Vj5DrB65ltVVwjSOFPUfp00d
         D0eA==
X-Forwarded-Encrypted: i=1; AJvYcCWCTlMZQAMtYoNpRBNZd9OsBWfU6LnA1zQYunzQcaNpHbYGKqJq8eoRaElM+Rg3k+7nn8oBoAM0LB8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw3yJbldF5aMyd/r4UTqhZHjAgCX1g9choypcHB1oa8kYj/nvtW
	O50GpE8arQ4I1eT/eMVuUHz9G1bmqJqldseWZk2yWoKjStKjb6joyAWjMgZugg==
X-Google-Smtp-Source: AGHT+IGTf/L3otR9e/ynmuPU/XdhSVGWFYior16AUWNfsKmVm9OOCNum4cCyL5foX0W4yE/oN4hlQw==
X-Received: by 2002:a05:6512:a8b:b0:52c:a7c8:ec43 with SMTP id 2adb3069b0e04-53546a5dac7mr10630504e87.0.1725432599624;
        Tue, 03 Sep 2024 23:49:59 -0700 (PDT)
Message-ID: <10217d0f-441c-4991-b935-d27a6dd4b49b@suse.com>
Date: Wed, 4 Sep 2024 08:49:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/44] x86/boot: split bootstrap_map_addr() out of
 bootstrap_map()
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
 <20240830214730.1621-10-dpsmith@apertussolutions.com>
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
In-Reply-To: <20240830214730.1621-10-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.08.2024 23:46, Daniel P. Smith wrote:
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Using an interface based on addresses directly, not modules.
> 
> No functional change.

Okay, a mechanical transformation. But what's the goal?

> --- a/xen/arch/x86/include/asm/setup.h
> +++ b/xen/arch/x86/include/asm/setup.h
> @@ -34,6 +34,7 @@ void setup_io_bitmap(struct domain *d);
>  
>  unsigned long initial_images_nrpages(nodeid_t node);
>  void discard_initial_images(void);
> +void *bootstrap_map_addr(uint64_t start, uint64_t end);

Better paddr_t?

Jan

