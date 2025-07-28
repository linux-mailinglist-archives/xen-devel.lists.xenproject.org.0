Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8824B138DF
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 12:23:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061222.1426730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugL0h-00070q-NT; Mon, 28 Jul 2025 10:23:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061222.1426730; Mon, 28 Jul 2025 10:23:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugL0h-0006ya-Kf; Mon, 28 Jul 2025 10:23:11 +0000
Received: by outflank-mailman (input) for mailman id 1061222;
 Mon, 28 Jul 2025 10:23:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ScRH=2J=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ugL0g-0006SB-JB
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 10:23:10 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc00cbfc-6b9c-11f0-a31e-13f23c93f187;
 Mon, 28 Jul 2025 12:23:10 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a575a988f9so2297044f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 03:23:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7640872a4easm5182623b3a.24.2025.07.28.03.23.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jul 2025 03:23:06 -0700 (PDT)
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
X-Inumbo-ID: dc00cbfc-6b9c-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753698189; x=1754302989; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OdhUNMVS7g8JF0/EGnSX7IXXARMVB8n3zJRMq77uNsI=;
        b=bTOguYiHXm+3BW87F9qW+2e1mMJlhro3yJpwnRag39vyvuPiFwQuZ2xA+UMpY+jnts
         /rUKWFcHvFC7ouH2e6ydQQkKcU/j902F5f5E+6XLx/0U3X++QSgSzJo3sflgRibLYZWd
         u6g3gJiv2sd1LqGKNF5sfR7IEt1BuGZcPVc5Kg/WAnglicffju9V1wSp3z/e/i7BMtsZ
         eFPcX8MEMyz6V05zDmiomf1pusj9GFEngN72c/fYFGBOvPYi2IXr42e0huX/ktCCXLAA
         pGckMFqd7iEvP5BEV8oDyPz+KRFi16JqH939RB2hdQq+pRl4bW1qlsPl8BDgMKRxYA9N
         tihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753698189; x=1754302989;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OdhUNMVS7g8JF0/EGnSX7IXXARMVB8n3zJRMq77uNsI=;
        b=bQxPN7zFH9hI839rNhsTuUnf95faP/ZXrU7agiRoRqYmkD9Jw0ALK4bz69hxIHJ3O+
         v9xzMN632bXCi1aIcmBtFNOO6+xDAO2Jr+MagKWeCSmXExJHMMOafXmu7MFaqolDs3Ej
         HLjFbpXPrrFVrlom2Q2QyfC6dpptV/EF+8PRGQELbN2Bdcj6SdxDWX+oUEgU7lAuxqgR
         5rYxhECstExoz5/hI+/I3Tg6ZHY1MF3T/Txv5Rvp3j/kDiT9RSYmj6ahjqPBtS5MXvD4
         7XQmggDVShSzwbgsGE5pLYvIEJnU74AomcvsyCWpe4XcgJY0f1qhqGXOpK0LZu9bQzrq
         ulvw==
X-Forwarded-Encrypted: i=1; AJvYcCWAd0tkYtGT2nFWc1+uR0AamHA/yHT4eLz3I0r91H7xxIkLflwRIVkmKrzy6v/Ptaen0ImkV8BeTkc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw2bysC185gSIZ1qBMplHhJgEzUmHsO2UAoniEa1Q1A4kMd9YN9
	cTz0sMGzzHPKUQSznqkF4gLgxsmFBdmwJJugOEr9JHigD0vMM/prpZd3Tx13TarIWw==
X-Gm-Gg: ASbGncuMOX8/xb2KzTvIoPZWuj823o/h/6HOq6pGGP8yybcxGx0ifpyQkPGDUF5pVvR
	SjToO9/VViUIYVIJO5QzMflEV+PBJbsa8eH47jImQEZWiloqVvK5Sk+GEl9zcC+ahzNM1Rw+M7A
	egiPBFJtz8GKXRPph6XvCUvsKeBWe8Edh5Wyf6YlYs6iGzGAOeCTomxhGQOh0u4+yaQ863EPNHX
	RTadB4TJZSQYw7gOxs5DQOz9TZjJsfn6AzGWK8q2wkDr/LeTuYvKGkpHA4AXapM5iFSBbOeS122
	wfIZPEAkzEcZ35qW8GIHuxtzpFJi01kEFkOT3WfDzcv0yvUdzMcRYGce2etAD1Pcs+Y9Dq7XEBP
	lj62j7BFjAuH3ZJgODgVefrMQCRbOZmCZqXNbUkSR+NdwjVgTf53YGdy30i6vBrxpADP2vvzcuB
	mEeUN3fqA=
X-Google-Smtp-Source: AGHT+IHZC74KvUm1A/A3qgyyz8u+CrO3FJHzcoPKvaImPuKRg/gsx3N7ebPtvClX9hVP0z8Dx9BrkQ==
X-Received: by 2002:a05:6000:2585:b0:3b6:c88:7b74 with SMTP id ffacd0b85a97d-3b7766945aamr6585812f8f.59.1753698186639;
        Mon, 28 Jul 2025 03:23:06 -0700 (PDT)
Message-ID: <e309b129-32d9-467a-8577-c25771721e47@suse.com>
Date: Mon, 28 Jul 2025 12:22:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 03/10] arch-x86/pmu.h: convert ascii art drawing to
 Unicode
To: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 andriy.sultanov@vates.tech, boris.ostrovsky@oracle.com
References: <cover.1753372928.git.edwin.torok@cloud.com>
 <99651231c4b535cdba21c852f3ec7c28c00a8088.1753372928.git.edwin.torok@cloud.com>
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
In-Reply-To: <99651231c4b535cdba21c852f3ec7c28c00a8088.1753372928.git.edwin.torok@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.07.2025 17:06, Edwin Török wrote:
> Use `aa2u` (ascii-art-to-unicode from Hackage) to convert to
> Unicode box drawing characters.
> 
> The full list of supported drawing characters can be seen in the
> examples at:
> https://github.com/fmthoma/ascii-art-to-unicode/blob/master/src/Text/AsciiArt.hs
> 
> For future maintenance: conversion can be done incrementally
> (mixing ascii art with already converted Unicode,
>  and running the conversion tool again), or by hand.
> 
> No functional change.
> 
> Signed-off-by: Edwin Török <edwin.torok@cloud.com>
> ---
>  xen/include/public/arch-x86/pmu.h | 120 +++++++++++++++---------------
>  1 file changed, 60 insertions(+), 60 deletions(-)

I'm already unconvinced of the earlier patch: The whole construct isn't self-
explanatory, and it lacks a legend. There's also the question of legibility.
The change here has the main problem of making readability dependent upon the
capabilities of the editor / viewer / etc one is using. For example, the '┆'
character as well as the arrow ones I can't get Win10's console subsystem to
display properly.

In addition this pretty extensive use of Unicode chars then raises a concern
that was brought up for the binutils project a little while ago [1]. As I
have indicated in replies there, isolated uses may be appropriate in certain
cases. A larger comment like the one here is different though, as the
slipping in of problematic characters (now or in the future) might go
unnoticed.

Jan

[1] https://inbox.sourceware.org/binutils/72219ed1-147d-4dd3-b503-363d981528a2@arm.com/

