Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B0C9F2D92
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 10:59:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.857639.1269860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN7sK-00089l-C4; Mon, 16 Dec 2024 09:58:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 857639.1269860; Mon, 16 Dec 2024 09:58:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN7sK-000889-8b; Mon, 16 Dec 2024 09:58:52 +0000
Received: by outflank-mailman (input) for mailman id 857639;
 Mon, 16 Dec 2024 09:58:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1wQJ=TJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tN7sI-000880-Um
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 09:58:50 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58a5d0f3-bb94-11ef-99a3-01e77a169b0f;
 Mon, 16 Dec 2024 10:58:49 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-385ddcfc97bso3288808f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2024 01:58:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c801643fsm7693112f8f.41.2024.12.16.01.58.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2024 01:58:48 -0800 (PST)
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
X-Inumbo-ID: 58a5d0f3-bb94-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734343128; x=1734947928; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XOLxbcZZTjzhG5nt8yc/Ddg/CYtaUwO8sT4eRfCtkUk=;
        b=FrP1L/DOxJA16G56y0Suj8dDpL+LX1TvsE4GAijRWjeNyA6vS4snx7aDuf7aElkjHK
         7dtFlO3HNDVtelGtRdnsGPuXr2ugsQYlVsyUaxhtuQxbK1SNeYBCtes4bmiDNfOWz2+l
         Tp0XWaHU0tih4s8fuVrDQ7WEL03WlwgKjYW65vp7Wja0kDaWZ8LQK40jWUm/A17rhkZi
         Ruqdw3s/5Dc2s3yeetzazCemsRRtdWvyNoR1r6dWZXvx/30onkxvh/vL/JiXruhpHZek
         4C3dsEcKTV5JtUKItRGU7JaxWOnXLADrXaS+6et1jKOI+8rpjcuIOIYO/Sefd3kMh5e0
         wGLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734343128; x=1734947928;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XOLxbcZZTjzhG5nt8yc/Ddg/CYtaUwO8sT4eRfCtkUk=;
        b=p4W5y0OyEiIRR1p5FzOyDfISmsBgQEBwiO1Wpu2/BVcHCyoQCY5f3pfGWs0cy9mVOn
         HdwOLL/xEuxgWXCDcpcU9OYHzvsiSrKPy5IIXMU4AggcCiP6gNEe9yi17YfBZ0jLvMvm
         T6/59U6OsKPiU/Hbid3c+7HAHgVd740Dm0/DHap0/W08AdZXpanNxLI8jaHR+RkTUZHz
         uY+aUMtX35tVcJKZ3FtFcLPL0dA/Es3V2IlyAxtuUU6gC8R3ChgcYHYivUUE8f4DaFz5
         Jt5QSH5mAhWT74+tBbr9XdWTXO6Hs1QJ8xwHGvCwAQOTNTy/eh5HYsS1PtjPAUYxh5a4
         VGxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfcQCBb9iw38/eQaTzolcxJ2mAX3pcdt4ZK+xGSwJTtYaYzRzPfHaG/ffUzkIc6TCaIFxol/X0peM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz4KCCS6VEwB9uASSA+0xegeKEXCX0kCTLTUWtsnZIcXQd0NuE7
	MSx7dPGcKC9I2gnlHN2h/lwblNY/koB8eXqhmiR+WNAblXgfJE9ov29Ueaa0Vg==
X-Gm-Gg: ASbGnctq3NR3FsoWBmR6RfwUHiJRpHpDCZz41aCCUfO67ppZiWKX66nu5DkwMwOTcOf
	Y5bU5keSisE1A8Xc2X5F0/KYK9LEcsKBAXcUnger00KZYZgaAWw0RK0qnhrkQW1fDcR+7YNTk+r
	+qtAR2Uhfx3bQ64IW/rNNfaqP59qdBHWdVi2bnjGNLX0R17HphWp7TDH7vhl8aGQWygkuD2CIPq
	4t/crGnqBP+4eJ++uDnrrEOlm3jS0G0t2h0aGhIvnpXDFwqMDTAvEPG2mGsGs9lTqnjz233ZhIp
	x+tAWR1PVq9LmZwGTmutuaeiTMeljqXNFDrfyBqbhA==
X-Google-Smtp-Source: AGHT+IH1H9EW0O/v3WAoUuqp6lsDCb04nNT/Xp7A6OtsjAi0UgjUdh8dkCD8xo3mdP2GdrHHivShYQ==
X-Received: by 2002:a5d:64ef:0:b0:385:f4db:e336 with SMTP id ffacd0b85a97d-38880af1626mr8180467f8f.2.1734343128363;
        Mon, 16 Dec 2024 01:58:48 -0800 (PST)
Message-ID: <153381d0-3da1-47b2-b9b1-ac6783bdc9b1@suse.com>
Date: Mon, 16 Dec 2024 10:58:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ARM: ITS: implement quirks and add support for
 Renesas Gen4 ITS
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1734096752.git.mykyta_poturai@epam.com>
 <2ea26be2689585ea254a9c0177816722bcb2db8d.1734096752.git.mykyta_poturai@epam.com>
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
In-Reply-To: <2ea26be2689585ea254a9c0177816722bcb2db8d.1734096752.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.12.2024 14:43, Mykyta Poturai wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> There are number of ITS implementations exist which are different from
> the base one which have number of functionalities defined as is
> "IMPLEMENTATION DEFINED", e.g. there may exist differences in cacheability,
> shareability and memory requirements and others. This requires
> appropriate handling of such HW requirements which are implemented as
> ITS quirks: GITS_IIDR (ITS Implementer Identification Register) is used to
> differentiate the ITS implementations and select appropriate set of
> quirks if any.
> 
> As an example of such ITSes add quirk implementation for Renesas Gen4 ITS:
> - add possibility to override default cacheability and shareability
> settings used for ITS memory allocations;
> - add possibility to allocate memory used by ITS with specific memory
> requirements: introduce _x{z|m}alloc_whole_pages functions and free the
> memory with xfree as usual.

I disagree with this part. If you need whole pages, you want to use
alloc_{dom,xen}heap_pages(). They also provide control over "specific
requirements", which xmalloc() et al (deliberately don't offer, while
you end up making that inconsistent by adding memflags to two of the
interfaces there). And btw, if anything you'd need to alter the
xvmalloc() set of interfaces, as new code is supposed to use them in
favor of the xmalloc() family.

Jan

