Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 373E2C006CC
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 12:18:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1148983.1480789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBsOO-0001N3-V6; Thu, 23 Oct 2025 10:18:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1148983.1480789; Thu, 23 Oct 2025 10:18:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBsOO-0001KL-Ro; Thu, 23 Oct 2025 10:18:00 +0000
Received: by outflank-mailman (input) for mailman id 1148983;
 Thu, 23 Oct 2025 10:18:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U0PU=5A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vBsOO-0001KF-Bm
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 10:18:00 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b889017-aff9-11f0-980a-7dc792cee155;
 Thu, 23 Oct 2025 12:17:57 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4710683a644so5035275e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 Oct 2025 03:17:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475c428f709sm90203545e9.8.2025.10.23.03.17.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 03:17:56 -0700 (PDT)
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
X-Inumbo-ID: 8b889017-aff9-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761214677; x=1761819477; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EZ2Z2qjOuEgvZPG/O2T9DgtWZV25EusHjsEAAMevAJY=;
        b=XoX7aELpRg5rZ5jut4wmqfw6h2ktH/lfXxnnHHXNEs3ZDuEUotAwcqSsauPi1wRZ6k
         pAyAyHorgZO26d6PYN8ctw3moqx9L3u/unaAJzHItfD77vsus0SYVqGaPbQ9m6JQKQWv
         LiaOFTYnMI4NyM/Mxw9m1c1HF53077tKuLusAmBVzY6OjzZtIz0lfzSSnd1KEl6vHXN2
         BLetWl6s02HGtX6X7GjiqOOLDyRylcBPh4kSQ1fZQrdzo0uNAW7mCxuGf0ZWQ/auamE0
         v3xMCr2BkBNgnF+pj+e21MlimC34AixNr+V76B5ve6Bt5+QyGw6aYGBcmuElzhVX194s
         hYJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761214677; x=1761819477;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EZ2Z2qjOuEgvZPG/O2T9DgtWZV25EusHjsEAAMevAJY=;
        b=jpOiOHjqmd/+oZdj0mrAaHZfHuPOxZ5iKfRZUZuhxqLRAvrbzbkvVOPsWN3gLqchSY
         1wm7rJaNZYifbAcGI9StQsrmvajjxvm7hGa2O8ZSbcbCyLRDqBFSVT/eYyUSijAQ3XEl
         v7pZEPXJfML/qn3ra0CbDaE9/z3pXKO699hY5tvw2oUxj+co8ggnjewBFGxLyPK7ftal
         IasYQmEOPxZ9Me+Ohrw6uI5O+wy3I8YtRB0NEbKn39CZ2RkLw45TwAnHx8X6Jq94tDDo
         TA8GGAhb/19JE7APlKjfxW6l2FKJdaxxyxi+jkkWuyUCqflfonNFB1GtQ27A79f52QLJ
         UNLQ==
X-Gm-Message-State: AOJu0YwSBk1wHvY956HOXGImFJtZcWtMS9KupCPzBV1dubyHENapqEHE
	zoekUak8J0ixqLH1R+ykAhs4QpPyKsmWlNj9zydv5pxvZlyFoBBcl4eY7QkA5qDtOQ==
X-Gm-Gg: ASbGncsxx5M2o6ma5hqh2SAzD6HD2cw/m2bjy2DBP0IFx6wf3mtyhJhJHXqw3GHWPI0
	ArFezS4ekFI0sCukCvk9J36wQ2pWeTz59xn1M80ZegDVaPXTcfLCF7U5tyVM27bD52g8pH/Ssf5
	B6kZDuPJQNvMUPzevJJ5cVW7FLMFPmGTEFAtEZra3vut0QcA1T3OJ9QS0U3T7MiFsxPW0ru5MKD
	jmgLQpLzqwnRcXup7Qzs1tXQj/glPXZKqxA58qoKYHBK+5iiouat6n2QLLZw2lVwVxgeSsimS6P
	yw8QasSe/lUCNb4UYe7pf2GhMbyfmGD85GuMsV32icrHOhCpl5b/iMPjuPtKMm5s7QvITfBou8p
	RzgwrPF4iMZQg1+inesWpwOjxgPIJFJFnicvuirkLZARU0yJGGXvKdk4YfmihjXzEmbkY1CKeTE
	uypgyFWJvhEG6Y5+cnYsl9Rvrl9ilA3DTJKaxv993LvHNNS5haoNP1RZyE46iF
X-Google-Smtp-Source: AGHT+IG1zN+uAQNPMwIykXAEgjpasQkCcp82c2UfP4X7BSIfAW9l7xbL+snCFFv06hDFOR5QOGKFTg==
X-Received: by 2002:a05:600c:4f11:b0:46e:37d5:dbed with SMTP id 5b1f17b1804b1-475c3fd5befmr54472755e9.12.1761214676681;
        Thu, 23 Oct 2025 03:17:56 -0700 (PDT)
Message-ID: <63e5addb-d109-4c57-a94f-88968c6d9382@suse.com>
Date: Thu, 23 Oct 2025 12:17:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] vtd: Collapse x86 subdirectory
To: Teddy Astie <teddy.astie@vates.tech>
References: <cover.1761209564.git.teddy.astie@vates.tech>
 <3e9e5ea80bb534b69bd315099da6b5d049852823.1761209564.git.teddy.astie@vates.tech>
Content-Language: en-US
Cc: xen-devel@lists.xenproject.org
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
In-Reply-To: <3e9e5ea80bb534b69bd315099da6b5d049852823.1761209564.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.10.2025 11:12, Teddy Astie wrote:
> The x86 subdirectory was originally meant to split x86-specific logic from
> general VT-d code. Today, Xen only supports VT-d on x86 and the code actually
> implemented in this subdirectory isn't x86-specific (e.g ATS code is not x86
> specific).
> 
> As ats.c is the only remaining file in this directory, and isn't x86 specific,
> move it up to vtd directory and remove the now empty x86 subdirectory.
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
> v2:
>  - reviewed commit description
> 
>  xen/drivers/passthrough/vtd/Makefile        |  3 +--
>  xen/drivers/passthrough/vtd/{x86 => }/ats.c | 10 +++++-----
>  xen/drivers/passthrough/vtd/x86/Makefile    |  1 -
>  3 files changed, 6 insertions(+), 8 deletions(-)
>  rename xen/drivers/passthrough/vtd/{x86 => }/ats.c (97%)
>  delete mode 100644 xen/drivers/passthrough/vtd/x86/Makefile

I should have remembered this when looking at v1 already: While some of your
other changes go farther (and hence are likely preferable), this one I'd rather
not see go in. I'd favor respective pieces of what's still pending from
https://lists.xen.org/archives/html/xen-devel/2024-02/msg00983.html. First and
foremost because ATS really is not only not x86-specific - it's not VT-d-
specific either.

Jan

