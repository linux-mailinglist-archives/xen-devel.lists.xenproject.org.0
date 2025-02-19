Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF3DA3C306
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 16:05:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893094.1302025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkldx-0001xM-8x; Wed, 19 Feb 2025 15:05:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893094.1302025; Wed, 19 Feb 2025 15:05:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkldx-0001w4-5m; Wed, 19 Feb 2025 15:05:45 +0000
Received: by outflank-mailman (input) for mailman id 893094;
 Wed, 19 Feb 2025 15:05:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EceQ=VK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tkldv-0001vy-Tt
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 15:05:43 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc7352e0-eed2-11ef-9896-31a8f345e629;
 Wed, 19 Feb 2025 16:05:41 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5ded69e6134so10389237a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 07:05:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dece1d48c5sm11036655a12.47.2025.02.19.07.05.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2025 07:05:41 -0800 (PST)
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
X-Inumbo-ID: fc7352e0-eed2-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739977541; x=1740582341; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RLaqiXAS8GF1cwGRQpNegRrPNYOncnO4Th2y44F97Q0=;
        b=bZiXjhrvOKDdsBZdkUuCnCxUuE/aoRKGmbZThqggionX3Vg5So3xfM1NoKvVS5G1De
         PRdJgpsUyjWDfQomG6DzyRN0mgJUKW4PVh5o08H2yfBz4f9keG2lzO/Kz0gRhfJdDvDe
         T/d3EwXvD9712sAqFNrizVBngO8GobTi/VMinuDsephI/G2WYeNPQsOEifhRdx/nLbh1
         PFyVkTrWyTVuPUohKl4HRH5SCUGw9gZoG+S57AJisoyTHZGYM1J0Cr+99b68BV+AKb3R
         ZzPc0ezYHFTGNIhzHR6T0CaLNmGIzyyUkjfGJ7w/CX45adG/lXYhwyu3VjLXwZw7bDL8
         C1Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739977541; x=1740582341;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RLaqiXAS8GF1cwGRQpNegRrPNYOncnO4Th2y44F97Q0=;
        b=VVzsyPZlaOHEBnPXqCthvO4yDmN7sWXTUcZpPSju42PGzaCS2c9gg0Nn7wDxSGQx4H
         ORaLUG1dPA1HS2oR++IsX8H2t1zu9w+A650q/UZkZUQaxgcYy+2pXYXo5cdPT7peafUm
         CzyFzq4DQCgUOIwAcWMl4zsm6nxAb055hTE7hoLkEW12hyc5y662LgkhMXsYkOrsiC7H
         lwdRBBGa6GPOxIxiSSuli8BJz9BB1VSBsGNGMi+VQOXg+vJn9vRgEj/VH+/FOk6tEJCG
         DFx6BePwtMArNII08+6tZSVgfWKojiKvkBUI+ogQ5ZUcHHBbY38vwC7jE8n40ZtiCEPr
         G8bA==
X-Forwarded-Encrypted: i=1; AJvYcCUUxIRDXn91IdKMN0taQTfEJc356+lV/rgxT1ODM2uJQYhxitnjMo2Sa36yQ+UhLjYDeQgFe0c6STY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywviwzoe/rXwY8FayP9DzSm4ARjgrBQMtCL+wiSzA+ECim6JzQG
	lYVXJlAPUOjnRPnsKGv59lnxnB5fBl/0g2zrMVAEdXQdOk99ATvKlj0Q7pbWAQ==
X-Gm-Gg: ASbGnctXrs2ZJlbYdISfBoCA94ITV1fvgfW7IEZrEsnjWF3ehjcVdI+GLiP/UkUO/dj
	jd14eUJvPO+bAIG74TmlQnM2FDlVlUF8QulyYDRxuEBqJtD2j/dC4Q3AFx8GxVuSP4o4WPaQyh7
	OLWCikE8rqoGPp/MGSzB+Gp+9K8yCdwrHqIHIZA1y2d7mjOs6LUy0LZibyHfIoJKCmYDbPM0Y12
	Do7eJJjcMmTeSJAE24csFB0Dxa5V97t4arB520X3o2m51PGW/QQCjlarBGjtUFoI6iVJ5u5c4Yx
	pbXXRvG2utgYEaCXJhYi31geb0rmT4G9IzLRw2gg53IsJH2NOqFe20fDr4Ha4egX5ZJxjof5wjz
	d
X-Google-Smtp-Source: AGHT+IG7njE7ANUCZULH2a6MFd1bWzRNgyw6obHwzKxTOWfiPJwT9bDJZBFxDpLemvaVYRPofK5DPw==
X-Received: by 2002:a05:6402:238f:b0:5e0:9254:c10e with SMTP id 4fb4d7f45d1cf-5e09254d007mr1847804a12.11.1739977541329;
        Wed, 19 Feb 2025 07:05:41 -0800 (PST)
Message-ID: <701e841d-6dd7-45a8-b56b-c67dd04dd3a5@suse.com>
Date: Wed, 19 Feb 2025 16:05:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4.20? v4 3/3] xen/riscv: update mfn calculation in
 pt_mapping_level()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1739363240.git.oleksii.kurochko@gmail.com>
 <38093d9843afbba9dda7326ee6e8cc3c99343cf6.1739363240.git.oleksii.kurochko@gmail.com>
 <2cee5ebc-cae7-4da8-9b7d-bb55cc907570@suse.com>
 <d398d595-74b3-424a-bab9-992653cdca95@gmail.com>
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
In-Reply-To: <d398d595-74b3-424a-bab9-992653cdca95@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.02.2025 15:46, Oleksii Kurochko wrote:
> On 2/19/25 12:28 PM, Jan Beulich wrote:
>> On 12.02.2025 17:50, Oleksii Kurochko wrote:
>>> +    else
>>>       {
>>> -        rc = pt_next_level(alloc_tbl, &table, offsets[level]);
>>> -        if ( rc == XEN_TABLE_MAP_NOMEM )
>>> +        pte_t *table;
>>> +        unsigned int level = HYP_PT_ROOT_LEVEL;
>>> +        /* convenience aliases */
>> Nit: Style.
> 
>  From the 'Comments' section of CODING_STYLE, I see that the comment should start
> with capital letter. Do you mean that?

In the (earlier) reply to "xen/riscv: identify specific ISA supported by cpu"
I said precisely that. I didn't think I'd need to repeat it here. So yes.

Jan

