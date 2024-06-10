Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7F9901BEE
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 09:33:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736978.1143071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGZWu-0007Ij-5y; Mon, 10 Jun 2024 07:33:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736978.1143071; Mon, 10 Jun 2024 07:33:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGZWu-0007Gj-2l; Mon, 10 Jun 2024 07:33:24 +0000
Received: by outflank-mailman (input) for mailman id 736978;
 Mon, 10 Jun 2024 07:33:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mjq2=NM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sGZWt-0007GR-2A
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 07:33:23 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b5d2e47f-26fb-11ef-b4bb-af5377834399;
 Mon, 10 Jun 2024 09:33:20 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a626919d19dso910731366b.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2024 00:33:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6efed85dc3sm314515466b.124.2024.06.10.00.33.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jun 2024 00:33:19 -0700 (PDT)
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
X-Inumbo-ID: b5d2e47f-26fb-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718004800; x=1718609600; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WzLFkLtR7EbRJPACEKegzEuozy8200Ef12p+Now7ihA=;
        b=AtNoNo9hHrRSfid7OE/IHp6glNdfu5ZAcGHh07RU4sToucjE6nMyNNMWoYlSGUfBTc
         u6E24Gx5RB3YHEXilQHntongzmrl82lnQB8CU9deQHFSNZa2azQI/7yPh+qoCo32YjpD
         VjKIkPs2H+i1kwdTisDSi5YaqtUJDvFjJFdNdoiYHvp9jbJqfOWgS2n0RmX0olGgYGJx
         OQ9LyBPPOuCb3qoDDDDlQRzMzbNY7pP9iL8dOPXqktWJq7kJS5wgfHF/H/D5za5eouZG
         wDu5wLYg9au7aSggmn6Omp7/fApbM0UJ2vsuhRplX9sh5AlrSxj5BsIUTGugrqE8xLOt
         l8bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718004800; x=1718609600;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WzLFkLtR7EbRJPACEKegzEuozy8200Ef12p+Now7ihA=;
        b=ZIcj/Dj5+OWXlZsSVvHRcYRa7Yc673n3f1mb8ud9aI5AO2rAnuhlgKMH6sHDKFO5tk
         Uq6TkBvoCMowvWcArxGBMx8eUBLoy4hIdBq5WCvUxb5xrM8kDt8Z8uCaHHsUqsZOro+B
         4+RZV/8rmgMp5y0+9bx3TrevF3NMhUv34GOUog4HrajKKvhOPKmWAkCXq/oQXLNmiwYI
         B7zTLvfAgjTucUef+5ICHU/W8eu4alvsJu99p5plU6Oam/k4MW/d2pI2A8pwKDchYxSA
         Gb4jpB03yKKcHFEQSO6EH7z5sCR/xjm80YU1f+bY83O1NDWf+PzLjnICl3bCGBPaJoYi
         xe8A==
X-Forwarded-Encrypted: i=1; AJvYcCVXYIN6bL8bFnSD5l5U7sFqqHTP83HO5+0fcMCTOCK0ZaWpjoKftnf8AgzkqaCChnhW14jw6NhD4DOWGyaXoLb0oS/EHvH7VOANnHQh2qI=
X-Gm-Message-State: AOJu0YyPMjh3Exo5ixbJJTvQ9H5CVWr03TFnExXhNdWU4EOKeN3ED4zw
	nWaSfM9nqcUEF2EsIN6MHUyYwcKi2tAnuCRVBbA5qxxhvHsxR/TTTYVdhthSrxdacYiNnQQBRTo
	=
X-Google-Smtp-Source: AGHT+IEyGyI/8woqsRj6pEXWhIdYhUmKG3SNNSGc7iIwnV7LENiyyrIMk5ZL1f6lX0RxunQvL5iT0A==
X-Received: by 2002:a17:906:2991:b0:a6f:259d:9a5f with SMTP id a640c23a62f3a-a6f259d9ee9mr51402666b.35.1718004799625;
        Mon, 10 Jun 2024 00:33:19 -0700 (PDT)
Message-ID: <651a4f58-9737-462e-9ffa-1d3d14db6963@suse.com>
Date: Mon, 10 Jun 2024 09:33:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19? v5 09/10] xen/x86: Disallow creating domains
 with altp2m enabled and altp2m.nr == 0
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1717356829.git.w1benny@gmail.com>
 <d6fd97b66b5f1a974e317c9d3f72fb139b39118f.1717356829.git.w1benny@gmail.com>
 <8936b5ef-1ef7-4606-9f19-c75287aa88fa@suse.com>
 <CAKBKdXi9uiADe+rXyHSd6HV3A-MvT04fgJAdJA=LNuYOr2Eedw@mail.gmail.com>
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
In-Reply-To: <CAKBKdXi9uiADe+rXyHSd6HV3A-MvT04fgJAdJA=LNuYOr2Eedw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.06.2024 01:08, Petr Beneš wrote:
> The flag isn't bool. It can hold one of 3 values (besides 0).

Oh, sorry, yes.

Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

> On Thu, Jun 6, 2024 at 9:57 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 02.06.2024 22:04, Petr Beneš wrote:
>>> From: Petr Beneš <w1benny@gmail.com>
>>>
>>> Since libxl finally sends the altp2m.nr value, we can remove the previously
>>> introduced temporary workaround.
>>>
>>> Creating domain with enabled altp2m while setting altp2m.nr == 0 doesn't
>>> make sense and it's probably not what user wants.
>>
>> Yet: Do we need separate count and flag anymore? Can't "nr != 0"
>> take the place of the flag being true?
>>
>> Jan


