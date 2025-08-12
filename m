Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8D1B22088
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 10:17:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078400.1439389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulkCL-0003qP-A2; Tue, 12 Aug 2025 08:17:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078400.1439389; Tue, 12 Aug 2025 08:17:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulkCL-0003nj-7L; Tue, 12 Aug 2025 08:17:33 +0000
Received: by outflank-mailman (input) for mailman id 1078400;
 Tue, 12 Aug 2025 08:17:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pr65=2Y=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ulkCK-0003bX-Ej
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 08:17:32 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca922829-7754-11f0-b898-0df219b8e170;
 Tue, 12 Aug 2025 10:17:30 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-af98b77d2f0so968649466b.3
 for <xen-devel@lists.xenproject.org>; Tue, 12 Aug 2025 01:17:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a23bedcsm2166374266b.120.2025.08.12.01.17.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Aug 2025 01:17:29 -0700 (PDT)
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
X-Inumbo-ID: ca922829-7754-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754986650; x=1755591450; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=J9/UtMIJfoJ79AGdHRB1b7dnHc+lGTsD5eII4rAr4M0=;
        b=C06YJzuPmgfklFv6cBGUNqLtzd5Hsf6mcW5EoCEY5ybfxHHTArlBWALzusoIoy3oq2
         fkniCiqBkZt505R/w+zu6sBGLlSg9azEl4zwvi2pzxjM+rxA+qBdLnc4QPonLjEdXipc
         ofh85CdnVOeqLjWNg5od/vKPI1JOV5OwshCjVEgXzpWB2+VCoFR0I54/j+8LOUBXKjQJ
         6C2Y3A25oXIC1Vl9K5DdK6L0jpJvoYTalQi70RTWuirIbmDYMU2ofbi8iqThNvOiBoqD
         bfV8j/LJhzYOO1BagZSheim+CUCPSu4f/24AduOv5/dCOK7isNvhxGKHU+Cy4FtJgFiI
         gMRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754986650; x=1755591450;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J9/UtMIJfoJ79AGdHRB1b7dnHc+lGTsD5eII4rAr4M0=;
        b=vP9+RIa9uIYv9N+HPeSoK3pr6ldXw/1/6PnkDq2l0OZX23wzbcxy1/agCU8S8/H0De
         /UKpa9kbrMGBu4rue+X//ImOMR1Rh5AveUwNJ2eaXq2z4T38HweVbd4ao23fN9yqA+Eu
         XawaBN6zCZUb7ZW66KFCDIFbj4YdDndWb0zby24FlwTLzDSxkB0BrVektMO+p0mERrG1
         ZCnH0PVX9g0ajme/FXJH0IkgEXuewz1F9YATZzk3bjxcxYpjcuHOGYSydHGiyfk3iSi5
         AVBrjQoEdWavGj8eSHsnTc8Hl6s7DEcnJZJy2vhmj49KtiMiK9aDBPWUTO6c6j9/uW7I
         MYFw==
X-Forwarded-Encrypted: i=1; AJvYcCXMUiLDWUVYt7Jshu8rmwK/Xna3r/9u/0jXpqDQ9ErFcLWkU9Bm+wh6qbWcfYDKZBFl1sY+wGyg9Ag=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yynf8ls1jFc8TKjc7nwFlxovD21ktIT9MfU7bbkvxgxKyb1faIy
	CS0h1XWcnu7PLUCnR2klsrPqjOQZTx0+oDtNRrGAcP3ohjSbgNC2ea3b4oKRJsCj7g==
X-Gm-Gg: ASbGncumA0bMVTlUTz801PIoacH0x1kFkbucagrUtJlyfIZPiFI5UclDiDMgoRrdIPk
	hwmjYbXY8rjdAeEMocKS2vxSjAJdetsMb0K42iUDCnUqz5vGMcY4oCUJ82BkKGKtMxEbH9taqek
	WB9Vp3Soiyc/zmSU85rrK12swuPTR9miEKPyKBvBUShXmuIH2NTO8Rk83lka88JqHgA/igC+lNZ
	/r1ICgK3GAVUSzrApIKruPIqWlZEIHDTJ4Mi6ZRPJCk0iiiL8usJEWcqgheP8wd3baAP7y/KIBp
	R42hMQ45HlD3COuEpRANbivl6UJZ8DY4ocfv2fr0FYKRSByKLb4rPE/piwaKYjQJ1TI+qAJlz+G
	skj5F6cJA1JqHBqg2aKT1AEd1mSFea11tHdFvttjrLGF6H91dG1dOWsE/w1i/3uK+Vui2CBMe24
	AnYKHCOdA=
X-Google-Smtp-Source: AGHT+IHMveklrPiiQk3eabv4a9B1JDqMK9Y7tnX/1/MtkhoQFmQL+upOh833oyIQcEF6IlCOrzrdWg==
X-Received: by 2002:a17:907:940c:b0:af2:42e8:ad92 with SMTP id a640c23a62f3a-af9c65b2f50mr1429942366b.61.1754986650163;
        Tue, 12 Aug 2025 01:17:30 -0700 (PDT)
Message-ID: <16b35284-fb2b-4ca2-9329-1a50eb3a1774@suse.com>
Date: Tue, 12 Aug 2025 10:17:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/22] x86/traps: Rename early_traps_init() to
 bsp_early_traps_init()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-6-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250808202314.1045968-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.08.2025 22:22, Andrew Cooper wrote:
> We're going to want to introduce an AP version shortly.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


