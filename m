Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D563C57DD9
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 15:14:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161666.1489559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJY51-0000dA-PH; Thu, 13 Nov 2025 14:13:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161666.1489559; Thu, 13 Nov 2025 14:13:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJY51-0000bR-MO; Thu, 13 Nov 2025 14:13:43 +0000
Received: by outflank-mailman (input) for mailman id 1161666;
 Thu, 13 Nov 2025 14:13:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJY50-0000bJ-Dt
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 14:13:42 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3fe1516-c09a-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 15:13:40 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-b6d402422c2so131258266b.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 06:13:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fd809absm170278966b.44.2025.11.13.06.13.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 06:13:38 -0800 (PST)
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
X-Inumbo-ID: f3fe1516-c09a-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763043219; x=1763648019; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4TTJPVdAZmkz3yr/Hfs42Z7Z6Q3IXIsREz8jqYX8PVk=;
        b=GbRB6H/2m/gYIukpWiTCVdj4wl5Ra+liDMEzDW8gXXRhtnDebR1+uMfl0qMEQKmZQO
         8OceHtHnJBxIASnfSSyyyKiRXZeT7KX6rWcQ9l6oZF7AphfuzgCo9yBGG+WHcivvz0XA
         /kyvS9Yxaw8+ffiJOvG+CIF7KT0ZKlIqYB76ui8bbGRFP/Rdw6O6VHR64V2xNcAyRnQY
         BOyj5HqV4dLNnWSl5Wac/Ns/8JRqeAWhyMbc3wc1V/ZI+Yf/tShlwKM4skFxlGtjfPvQ
         JNjKm+zDKX4VpJsd1Knf5uBeGSbayib/tqvJKzP5eTGBooSDLq7m0jZlsXRM++EbW5KW
         RvIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763043219; x=1763648019;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4TTJPVdAZmkz3yr/Hfs42Z7Z6Q3IXIsREz8jqYX8PVk=;
        b=V1sieD0Q47f90ZBjpSDmkhLt545fjvGfwQr91Xk3M+btmk1ewxXSkNTBP+uPD6AVj0
         q1xB0ngoeWf7OytXaOLwrvb725laCa1YbEAhYbHI7fA0tQTsBtaa+Y2/KiGh7WPxf40X
         82D++vZN8ujgUspLjpnfzQS9MX08UvwT6kgjbspl+NynrsByKC0FPAAH46VM8ktkqusJ
         BaofiwAODuo0yGgOMNJcHS58ZUZsnmtSzzy9w3aH1iYgDDDse8EB1o0LSSn8S8IU6TmG
         gxpD3EnvgOxOeXS04fVbzjdG0kTb0khK8+qbCEr3auzOdEFCwb6LMQlm1rCRO6WiM38I
         v7YA==
X-Forwarded-Encrypted: i=1; AJvYcCV176P+ioz8B+IB6nv5LoSyG2tlLQu2WDf603F6W2DdizAeSDXaGqfqBsbQ47WC/Z3cEHPqCBgo6ts=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw3ZqJsgj+/zF7IPKROE2g8NRlyyynT1WOjB5ISzO5d/pGiI169
	vtNxw5nYccpUBeGA8rz/Eal2IFnKNHPVKT5hM3h8pFYq7zYc6R2yJwyWnhPBA0UbPg==
X-Gm-Gg: ASbGncvhY4jwyp+oyn/fp3sARKxHdlTUNT/RyjRspOasbEEKItodyA0s+OgsGYo6fe9
	YBSVGknGMTEVlOShKUEG/xiFQUnan1jbqNSXI9aYJgX54aFxKmOr/AfnUrEDLWWaffGJgLgo120
	LKVnzmGTbxeMTmXL0zS4OYWWHR/2+MCO2z6UwFYFf0cPe4lHbeB8hKYdJ9/lditA5UozlK2Purj
	zOOkeJ/PgePakAHlifkZnX7JyDQRcq5+5YICk9I+qhUOcYV2uHr1QUSsW5+Hy+SzSMzqTuTBeEG
	uPKjynHjUcDnG1T66jkqfgdik0R/wCb8orvZ06IiyjmHaxmPFzqqVL0O7zJkuQOxQKEvkrXjgD6
	AJgv4Sr/evwaoPu9/Fqq/0Ptt48XZpOXguLZOLQ9BlPv00K1uT9vO6JTsa0LAaGn37gHIWxZhl1
	IGq43mSeqTiXt1XYQ3R5jrgMfU47y1TSOZw0APY3CJG5EN0AQy7KIc5C93LZ33Ndf8QOZ9Zavc8
	Pk=
X-Google-Smtp-Source: AGHT+IFkREzEUOlIBeyy2rpmAWznBG+4sB1Qd3pEFtZaN1dimQkzlcu96WA0CRI2QG/M6GH99nkKmQ==
X-Received: by 2002:a17:907:cd0d:b0:b72:52c2:b8e0 with SMTP id a640c23a62f3a-b7331a6f64fmr665531666b.37.1763043219434;
        Thu, 13 Nov 2025 06:13:39 -0800 (PST)
Message-ID: <7573a826-23f3-4924-96da-032e74ae8916@suse.com>
Date: Thu, 13 Nov 2025 15:13:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] xen/page_alloc: Pass node to adjust_tot_pages and
 check it
To: Bernhard Kaindl <bernhard.kaindl@cloud.com>
Cc: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas@tklengyel.com>, xen-devel@lists.xenproject.org
References: <cover.1757261045.git.bernhard.kaindl@cloud.com>
 <80adbc587f6acf6bae05bf66016ffecb532f8877.1757261045.git.bernhard.kaindl@cloud.com>
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
In-Reply-To: <80adbc587f6acf6bae05bf66016ffecb532f8877.1757261045.git.bernhard.kaindl@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.09.2025 18:15, Bernhard Kaindl wrote:
> @@ -2806,7 +2816,8 @@ void free_domheap_pages(struct page_info *pg, unsigned int order)
>                  }
>              }
>  
> -            drop_dom_ref = !domain_adjust_tot_pages(d, -(1 << order));
> +            drop_dom_ref = !domain_adjust_tot_pages(d, NUMA_NO_NODE,
> +                                                    -(1 << order));

As you touch this, can you take the opportunity and switch to using 1L here?

Jan

