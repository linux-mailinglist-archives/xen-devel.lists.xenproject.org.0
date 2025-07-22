Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B3AB0D439
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 10:16:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052153.1420735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue8AC-0003Ib-Tu; Tue, 22 Jul 2025 08:15:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052153.1420735; Tue, 22 Jul 2025 08:15:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue8AC-0003GI-Ql; Tue, 22 Jul 2025 08:15:52 +0000
Received: by outflank-mailman (input) for mailman id 1052153;
 Tue, 22 Jul 2025 08:15:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D6vH=2D=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ue8AB-00035f-Cv
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 08:15:51 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13b16df4-66d4-11f0-b894-0df219b8e170;
 Tue, 22 Jul 2025 10:15:50 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a528243636so3111039f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Jul 2025 01:15:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c9f287c19sm11528118a91.31.2025.07.22.01.15.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 01:15:48 -0700 (PDT)
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
X-Inumbo-ID: 13b16df4-66d4-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753172149; x=1753776949; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nllRgQ84jYpURBj8sy34Fb9sk2jSCTZMudkyrZXKNac=;
        b=EB0pOMAbYoELykdJhax9hEHq7QtloXRv5OiSK+/IwarLvDO18PqF8ezgXmd11rufOU
         keUupr2hNjRNSk+doldR1xJ0F3u1j7Zue4uocOdjmkR3pxmug7n3Bx6SKOVM+krlb8SI
         bChhgm5kSOUmqqlhAyP5H0ssZl3oYd8Cy2dBBLSY+VGvN6RjBy/BOl5PzNvaLqfOrOCU
         yTYnxMYLe6cwkYQUYa04llYvjxOP4dcg5XcgIQ4i6wc6fi3cd05I1qY0cSUz9FBhEjv5
         bvTltFxcjG4ach3IlDA7hMquRhiuMK9BFMKtrPnI1BXOU80tSz2RB+wD1p8Q79WIIABd
         xLiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753172149; x=1753776949;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nllRgQ84jYpURBj8sy34Fb9sk2jSCTZMudkyrZXKNac=;
        b=oJMQ1JI22qjFTUyav1DrdSawOnsZBpPPARsqwHwt5C1SBBJE5aIFgXVN8YgT55cogw
         TsXuhfJUoo0YMxBbL/LUxQz1h5pSsm1WR2Ms7Fkl97cjcIXjUjdh/ch6aaqOMqHduwwl
         3EVzYwcs3XclPFgr72doTmPsiKgv0Cj9f2GUUf9hsGl7126fKKmlk9zoEYbv801L1sNk
         fA+mziZmouZ/U0imi2gbKBdPXXv8PaSemY0znvtm4P0Yo9C5pMyd9VCBAvFr610iJ3QK
         X0Ssxraj4EnVtyPTmgBHX0zQDUULK+4FbC3zXqxY3rnRyNUuvY238Ff/bkRUdC0dNiYJ
         wnMg==
X-Forwarded-Encrypted: i=1; AJvYcCWbKka3ImLFcPYUYEqAdJYyBS0wTRnjvT9jOsIHL4H5LoCNt4a2ObV8gmKm8jPms2f7SB9chI+MNng=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyH7er6M9zJscMibzT2e/qb2cDByR9BShinSnwQ7V72PBrNhuxx
	zYLz26DMoh+u9NGGkDjNGSmNBFSQ0Jqvz6pUwmUcA1nO5pKj1IFTo/715UknUfpasA==
X-Gm-Gg: ASbGncu/Wy2xKTIkJipLBJjY4dXgD9AbH5XHum25foO1YhFwoT6LYovtl/iF9gN/7qk
	rIgIFaHI9H9vqA6pPX6YVCBAm3sGY8mLKSaxjXcrktqmHpTQ9UdisCkcpkSBuA76t0i70K8lV27
	7qegHFOXLP4MKN+9UBUvI1YR35YmS2P27oqZDG7/Sov0CI42q85a1iitK1YxHYkKYxiF0/bfvDI
	jXBMZ/KxGKsXlWUN4VaCM0xLtQ7D0f99RW4O0G/JkM5TtwMuL1K0Ji7a7s49iMF2bbSCrPYCin+
	U6kGD7U3lLI7982o4WjJm3mtJvu2YfUkqNsHUQeqGjpnZB93x4x18yOZd27TgoAhDrjiKC38sF4
	CAOCzrTvdrdZOmdsF6CC6q4Jd8yraw9qQC3RXsubX+dnEpB1EKErRDe92BLhWVJiivydjq9AENF
	mDKjsZXsE=
X-Google-Smtp-Source: AGHT+IG3z2Gt/9S11Sbe09DmErKEPr9o6+tAWxMV2y6PSDHvCvV+vdk/KdPYTkERCNlhThQhUOeQ6A==
X-Received: by 2002:a05:6000:2f87:b0:3b5:def6:4b2 with SMTP id ffacd0b85a97d-3b61b2227e0mr11556407f8f.45.1753172149229;
        Tue, 22 Jul 2025 01:15:49 -0700 (PDT)
Message-ID: <90c840fe-86cb-4152-9a75-10b9981fc57b@suse.com>
Date: Tue, 22 Jul 2025 10:15:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coverage: add support for GCC 15
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250716212504.406565-1-volodymyr_babchuk@epam.com>
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
In-Reply-To: <20250716212504.406565-1-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.07.2025 23:25, Volodymyr Babchuk wrote:
> GCC 15 (with commit "Add prime path coverage to gcc/gcov") added a
> new, tenth counter. Reflect this in gcc_4_7.c.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


