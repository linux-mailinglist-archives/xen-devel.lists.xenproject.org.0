Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D55AAA41BCD
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2025 11:58:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895113.1303712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmW9x-00083q-3N; Mon, 24 Feb 2025 10:58:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895113.1303712; Mon, 24 Feb 2025 10:58:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmW9x-00081i-0S; Mon, 24 Feb 2025 10:58:01 +0000
Received: by outflank-mailman (input) for mailman id 895113;
 Mon, 24 Feb 2025 10:58:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e8X9=VP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tmW9w-00081V-1R
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2025 10:58:00 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 350cfe98-f29e-11ef-9897-31a8f345e629;
 Mon, 24 Feb 2025 11:57:58 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-abbb12bea54so755619566b.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Feb 2025 02:57:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abbc0d0b882sm1256799166b.109.2025.02.24.02.57.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Feb 2025 02:57:57 -0800 (PST)
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
X-Inumbo-ID: 350cfe98-f29e-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740394677; x=1740999477; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ysv7qbYr2PtFBSrUhYJAcLLFoKwC5PSI9/7EyxPoOlA=;
        b=OsJ5TB7cfAbLKt39DRXtf676XW+jXxMb6NcdKWcB+KWDEY2je+yS50uuXpAcbS6l90
         nLbamswEdYPHOmWTRyPA4C3b3JivxJdH3kPO3igeHYpV/OFUk8fMZevEnAnwY5LsVCxY
         YA8YHBUYCy/qLUWZMFtClA0ezB/z5P8h7seJZ0DCiHvNboXSHB4PrEccM6b9b+11fnYV
         sNSa+IwC3M7kOu4xrc7yWtLJiZ9fRv74MTs1ArYVEHB6APKTkPTWNspuolMwMhzFPItW
         q17bHZlSGL7yPm6ayjJZRHDgqG9aipJtNxnrRLfDlNlhZLwWRayIKSPieDtSTOLO2BA9
         /geQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740394677; x=1740999477;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ysv7qbYr2PtFBSrUhYJAcLLFoKwC5PSI9/7EyxPoOlA=;
        b=iaYxUaR5rxBc9C5ezHjEOciPJ8igW9YsJGvg0KiI9muEU/3N0nF+EtFGhPB9Jk8drK
         740elkujIeE4CwXOePAUlUS/tPiC2gv9L6E4cEmOAB3ZzjrvSBcGAdfe4PxPY9h1GnVS
         oifqDraZK7AzqQSO4c+b3h3Zqh2OrQZl8n2vEbemiIvMrPSi9zKPElAcalNApQQN9Q1q
         iQ9PRBYYgcgqJOYAKs0gwa3qVhbDtM3skOb5xQeJkxyEXaOwzRvoYesbDhFh/9t+xQZh
         tlx3k4Wv3TvGjBosEyR2JUq/rGI5IDZGfJAcpZ2C4bZW9l0DM6jrSK+yr3vrh6wvSamn
         zo/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWZTv3YEqdlj56O+gLyTyku9jZ2IX804os1JdJh69ei4egkO7zz8EIQZsWnkqGwRRobfRWsVWDuNYg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwHg3sUBVfxnTCrW48xhMkZtZbUiSIOapvmvN3R0SYGFpWlzHxJ
	hJ48QNxPssDNx0s/bHjcTDJ9HUSx/dXUI5Urm6ZHsxH117ATbVjvYDFy1AG1og==
X-Gm-Gg: ASbGnctGMvZvSD0aveMWyeOGj3Sj1wyA+8QkjrGGqxjEUahxHEYe+gXyM9P2JBRHAxI
	vh/xNnXTcO8ORHK7MduwLYzAfYw3w40LVd7JVc7XlKnx/BY6Vh7Odw8uGS6b36RnxB+5UCmYSy+
	FxWtxKeUH5EohB0sEmDZkhkm0WczjxpdmQYDxFkMfbl1IQD/QIf+PRG/2hCk2Un2etE9PugarlL
	d2gN82YFTlbUoR323iZ6mSKO2WZbRDNVHy5O98c4DeDXlxDXSiO8W6BA1smUlVEHelUBP5b/iSj
	EW1tDmzT0LACxZnUitcWv3zPxE5jxJdLwiJ412NA2V7Aebdi709tevmXQPvEZnSOT7ZLj2nU7vW
	8wftgJ8uGsYs=
X-Google-Smtp-Source: AGHT+IGEYXT20PehG8MMnPKiKMuVV08rP/ZcnKc7n5xPXsTI9s9j16Qs9uJESs94rRchCg+nJ4/IOw==
X-Received: by 2002:a17:907:270a:b0:abc:dba:f6a2 with SMTP id a640c23a62f3a-abc0dbafbfemr1128035166b.15.1740394677607;
        Mon, 24 Feb 2025 02:57:57 -0800 (PST)
Message-ID: <da6639c9-479c-40a1-80f5-fe93d5947326@suse.com>
Date: Mon, 24 Feb 2025 11:57:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4.21 v7 0.5/4] xen/README: add compiler and binutils
 versions for RISCV-64
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1740071755.git.oleksii.kurochko@gmail.com>
 <5d71d27f7393753d549c73ab2e5639acc2260df8.1740071755.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <5d71d27f7393753d549c73ab2e5639acc2260df8.1740071755.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.02.2025 18:02, Oleksii Kurochko wrote:
> Set the baseline for the compiler and binutils to >=12.2 for GCC and
>> =2.39 for GNU binutils, as Xen's GitLab CI will use the Debian 12
> container for RISCV-64 testing. Therefore, these versions are expected
> to be the minimum supported versions.

It's not the container that dictates the minimum version, but the issues
with older versions. Those want naming here instead.

Jan

