Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 415DFB29BDE
	for <lists+xen-devel@lfdr.de>; Mon, 18 Aug 2025 10:19:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1085571.1443884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unv59-0004xk-IF; Mon, 18 Aug 2025 08:19:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1085571.1443884; Mon, 18 Aug 2025 08:19:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unv59-0004vR-EZ; Mon, 18 Aug 2025 08:19:07 +0000
Received: by outflank-mailman (input) for mailman id 1085571;
 Mon, 18 Aug 2025 08:19:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q+DX=26=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1unv57-0004of-V2
 for xen-devel@lists.xenproject.org; Mon, 18 Aug 2025 08:19:05 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0158e744-7c0c-11f0-a329-13f23c93f187;
 Mon, 18 Aug 2025 10:19:05 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-afcb78c77ebso612656366b.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Aug 2025 01:19:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdce78d2esm752119666b.52.2025.08.18.01.19.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 01:19:04 -0700 (PDT)
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
X-Inumbo-ID: 0158e744-7c0c-11f0-a329-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755505145; x=1756109945; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sFY94uChyClg0+a0a/YvsDr5HY1piMcnGgbaNPokLow=;
        b=YFcEnU0lA/NSRJurlDB0ujpXO9k6PLBM2dsu89JJw0MQMI4J+NE+rs2UWGHZzOx8iD
         SmWJ/3qeJ/RWN4Sw38GFgM3AHssnu+iflsKr7TElX7pWsZmbv/LiXG2ZHXKllmeMRsRz
         ft7CJrz3I9c88ecPFUkwKiBeGX5CPr3ThU/UqKS1aANlwHided/p+XsUD2B/u5MDxKeJ
         1t9ofJGtAVc1ivrN5NVPqWwYMrr7en1AmYDrjHaJyd8uH/ihvNNY6ubhiofqnUcztzLl
         yckhCdh9eoJa7EReGNfwGjJ5lP+lsn3siKna3sl+VZ39xIj6GG9pDLll9F6PhPncnXNN
         KUng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755505145; x=1756109945;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sFY94uChyClg0+a0a/YvsDr5HY1piMcnGgbaNPokLow=;
        b=RSf17QFKdJOmG4pEtdO0KrYU7N1SuQPqwq/J8GQce4cOtMou/wVaHuQVqac3oSRpvC
         bA+ahe6FABUgqwUDgBwAyKB2CDvAI0mGc70q2ZhdG5URMyt+fo5hmHs801cBV8Kru+Se
         WsAAY/pL6NHheMbs4ejsYKnBtQzqIrbD6OMHXg85ft0NGvSt/WrGKwfvWCRQm4fxpjYj
         4wVXR581cr0vujPKHwovokxGFvPSUHurM+wEjiZu789ufhJsFQWC+YtT3wUhuYKDI9QL
         zzjQ4sDYpydKnZ4bAXZ/LOrzD35Ap7M2oM0zZbfKIuoQKl7auY8gA/ghN5/IEW5Yg+SP
         /9Jg==
X-Forwarded-Encrypted: i=1; AJvYcCXcrZ58CaQntB1d862UdjpDGI+2rl2zrZmUZ+T0IUd24Suu4BtfAwcYvNLtF6SdyoecfxNY0aJPx08=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx6+i2dln4VWBG8nvTimdtBpJogV5+CBvj1U6aYyi6wGt53stPE
	cHyjnXgwfmT/dWvdmL0PurRk5C2BoHPecA/u1R1lD/jabsbOFy5HhZrEcIAHt4R8HQ==
X-Gm-Gg: ASbGncv1qYMB+cumke83V1ReriaZAYiGonMTXT4v7LMS8VHjlRpWzLGWum5tQyqPfkO
	nFDyugrJwm0wpGs0E0/wCO26FowSfFfDuEc2E34Xznr8b+Khuf0wxImUO5TpQITEaSdqa5JMmhz
	vzQvY1gLfSy7uuQSMzOE/LrkorjOWay1j+hU5aTm3yr48nefWY2xnkbp0Rpo9mqXsO7SVPZIdeU
	eK6pVpsxv/ZdWc17u1IMjASh1tdKxmnj5v7MYLS721lN0YAO3Ge0mFNhB43BXEFyQMXplIqCzqB
	Zr6NB/ztFnOf0GFY+X+638KtzGPuVEafdWWTIATnT67zdgES+8rcXqIbJsmjwWqtDH8ehOMHmN2
	x7nsGxUn5VkMBVU7cOUNxNYOBJeXAqcNu9JEoJgtZEqFxDCDQ1wa/j1PRmobg/4RyQhVnFXblfX
	MGlnL/QdxMOT+VU5oooA==
X-Google-Smtp-Source: AGHT+IHNNb6YOA/LW0siZbnkTY39xA+HxDf0E8keY6qGqfmq9zsavAiBDWgNME2Odf0ra0vBtxNxsA==
X-Received: by 2002:a17:907:3f12:b0:af9:414d:9c2 with SMTP id a640c23a62f3a-afcdc1c2477mr1064902866b.3.1755505144372;
        Mon, 18 Aug 2025 01:19:04 -0700 (PDT)
Message-ID: <717ab7f1-7ec4-4319-bf33-d7b430e04760@suse.com>
Date: Mon, 18 Aug 2025 10:19:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/llvm.c: udpate LLVM profile raw format from v4 to
 v10
To: Erkai Yu <si1krow@outlook.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <1e44e2b9009fe8d2dad5fb31c2a4ac4114e0b892.1755478573.git.si1krow@outlook.com>
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
In-Reply-To: <1e44e2b9009fe8d2dad5fb31c2a4ac4114e0b892.1755478573.git.si1krow@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.08.2025 03:06, "Erkai Yu failedtofindaname"@gmail.com wrote:
> From: Erkai Yu <si1krow@outlook.com>
> 
> Update LLVM profile raw format version from 4 to 10, supporting
> LLVM 19 and LLVM 20. Only the file xen/common/coverage/llvm.c is 
> changed.
> 
> I’m not sure whether maintainers want to update this version, since
> version 4 is already a bit outdated. My patch currently supports LLVM
> 19 and 20; it’s unclear if maintainers would prefer support for all
> format versions from 4 to 10.

This shouldn't be part of the commit message imo, but yes - we can't
very well support just one version when it constantly changes.

Jan

