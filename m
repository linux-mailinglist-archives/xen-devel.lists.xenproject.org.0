Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA06FACFEF0
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 11:13:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008254.1387513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNT8R-0006oh-K9; Fri, 06 Jun 2025 09:13:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008254.1387513; Fri, 06 Jun 2025 09:13:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNT8R-0006m8-HA; Fri, 06 Jun 2025 09:13:11 +0000
Received: by outflank-mailman (input) for mailman id 1008254;
 Fri, 06 Jun 2025 09:13:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U7n3=YV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uNT8Q-0006m0-De
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 09:13:10 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 763f35f3-42b6-11f0-b894-0df219b8e170;
 Fri, 06 Jun 2025 11:13:08 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a4f71831abso1782399f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Jun 2025 02:13:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31349fc3e72sm930172a91.31.2025.06.06.02.13.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jun 2025 02:13:07 -0700 (PDT)
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
X-Inumbo-ID: 763f35f3-42b6-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749201188; x=1749805988; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3jUHxb0lKIug35Ut90AkAc+cVTWHgCRZEKL2C55fXF4=;
        b=gcK3awgTmNpaaT47jdUkU/JzOIzeaoET1KkaLk6cAXG00JttQ1Vu6ekSHZtejDCvkj
         jsPN0nhZfRGOWIE3o2mebgZdCzRGfxb4DDKLVClnFpybRt24bN5hCBJD2w47IsrVISpc
         GrUjlrqBz/j/RfpXj3n+gEyDOT6jcMfdsX8QTaegO7RT7yDHElI08jh9sTv8+/27ruSS
         dC9sZmSn624sR/Dw4xCMzm1YA9Hg+682GRCXr0ldLkgre9iZa0KprosSOlpycN2X3MYG
         J12D6o/1Y8eJRGu5Jq4Owb2YHgrBgH6rIh/ej5SHT1/y1OU1SmVM4YSUVGwdRQqB9FGV
         T+Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749201188; x=1749805988;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3jUHxb0lKIug35Ut90AkAc+cVTWHgCRZEKL2C55fXF4=;
        b=Sj1l4tG5J7ZWz615xCjljAZvmMH/pj93oR6p5/8ybE3WM8nrO8jV7Bux19w4Vt7Bc5
         r9CfJlU3xykMS6vUgg/1j4KGLZhPUDDXU83ldRUXM45km/N4kvflNpGdY2G80E1cDcRU
         TAEaBjok+Y4NT6vgzyggiAYcEmu3Y0ENyuPQbp4j+loAvdKBe+jkLfcWcnNcFlSUbKO+
         +Fc64XUNu0AL/vXMvLII6vqbUIu0Y1aDOJWkSwvxNQJ5TJq2mWWl3qygpxBskRgqrY/H
         0eWjr9HXlLYrlsbX8PYMlzCx2SILluOAqEH0eoNVQElnJ3t7wxdeArKOPNDYJYvMtXM+
         9/KQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/RXG5MToIqmM2JutQEy6ZRoCc6Yiaj1TSJuhRNQGRZFbf+MAxqZ44Ov05Y66+uLNnpAL3lnkgGjY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwHeEW+RBPDXeurmveNkCELbkWqHyDtQBP28H7xpiPPSsbXBnSS
	hDiKj+28tjp50FoT53niJl8T1Zqu1GglsNpSiSzpRdgOO9DE0XUXfDb0JF+0Wxa1Hg==
X-Gm-Gg: ASbGnctGrs6JtkFypI92LTksH0FmINhZXiehcB0nzV8V97J2rsbAEsZotkwi0aSRVra
	qJSMeLwFokPaMSMqZlgvh8v7tBkcXjAj5Cd+CEQL6R0OybbzbBvcLxq5Wu01EuaR5dXjLZVJnu4
	9kIB7hB1RSNTqlqh2I7OlBJM+0noABE5gPB7yM8mGi0WIhrPEFw1GOwem/bT7c0QNr+pc7g+USC
	2LXqbPBD/09ey0MsLMJ+DRnPxlXUZB8vk95g1e6geVA4cjcVLcYGnll2mvIpagoktG9jAtstYgV
	k+J3jTy2ac1uEZKIXN7prc0eWpX5ZuIXti3FlESyeGaDSw71KhJTbATlauyh4erSo1aGaeu2hnQ
	R/jqrdPdJ//mJ6yhDoZjDFNaB2RJtn6fm1NeC
X-Google-Smtp-Source: AGHT+IGvuoYMyYUnQ8n/LQEDFxFJOc7hyvFm6gr4Msic7md6lRnyuq70UnCa3taYl6fcies92JWHfg==
X-Received: by 2002:a05:6000:2307:b0:3a4:f519:ed3 with SMTP id ffacd0b85a97d-3a531abc793mr2235363f8f.44.1749201187963;
        Fri, 06 Jun 2025 02:13:07 -0700 (PDT)
Message-ID: <bac962f2-807c-4cf8-aab8-2480f38244e2@suse.com>
Date: Fri, 6 Jun 2025 11:13:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/6] x86: re-work memcpy()
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <73481cbf-337f-4e85-81d2-3487366cd822@suse.com>
 <017e689a-41a2-4722-a5e7-19ffef27500f@suse.com>
 <81da4e8e-9dcf-4630-a535-39ce0b07260c@vates.tech>
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
In-Reply-To: <81da4e8e-9dcf-4630-a535-39ce0b07260c@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.06.2025 19:06, Teddy Astie wrote:
> Le 05/06/2025 à 12:27, Jan Beulich a écrit :
>> Move the function to its own assembly file. Having it in C just for the
>> entire body to be an asm() isn't really helpful. Then have two flavors:
>> A "basic" version using qword steps for the bulk of the operation, and an
>> ERMS version for modern hardware, to be substituted in via alternatives
>> patching.
>>
>> Alternatives patching, however, requires an extra precaution: It uses
>> memcpy() itself, and hence the function may patch itself. Luckily the
>> patched-in code only replaces the prolog of the original function. Make
>> sure this remains this way.
> 
> We can probably workaround that by using a separate memcpy for 
> alternatives patching. So it wouldn't end up patching itself.

We could, yes, but imo we better wouldn't.

> Aside that:
> Reviewed-by: Teddy Astie <teddy.astie@vates.tech>

Please clarify whether this applies without that suggestion of yours taken
care of.

Jan

