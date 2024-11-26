Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C99239D950E
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 11:03:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843496.1259109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFsPW-0004hT-0W; Tue, 26 Nov 2024 10:03:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843496.1259109; Tue, 26 Nov 2024 10:03:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFsPV-0004fQ-UG; Tue, 26 Nov 2024 10:03:09 +0000
Received: by outflank-mailman (input) for mailman id 843496;
 Tue, 26 Nov 2024 10:03:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zjIj=SV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tFsPT-0004fI-PR
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 10:03:07 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a06e693a-abdd-11ef-a0cd-8be0dac302b0;
 Tue, 26 Nov 2024 11:03:04 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5cedf5fe237so6445822a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 26 Nov 2024 02:03:04 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d01d3fc7a9sm4967777a12.62.2024.11.26.02.03.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Nov 2024 02:03:03 -0800 (PST)
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
X-Inumbo-ID: a06e693a-abdd-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmEiLCJoZWxvIjoibWFpbC1lZDEteDUyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImEwNmU2OTNhLWFiZGQtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNjE1Mzg0LjEwODkxOSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732615383; x=1733220183; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=r8YR7iLaheJ6SeeGNT0bkA+wCorFO/8zes+RnLdy4Qs=;
        b=VZrI2epYk2idLdzwt43ud+y2GSCP3L2WH4y43Ap0hM+Cm4a1WTDJbEugvmYcqWnp5K
         D/Do1VTwLDp41SKA99rzk5VetCOEOytRbySyPirAoYVO+5IaSeVUhazPEI7oOdBzoaO2
         1qeEcj1v5BhhWujrd0N76IvA/pXThn5yrPPcRM9Y/75L59hxPMRJ9eMzCmGoyBAu6WHm
         A0kVcLSmogDG66bvrHw+/+0TkuNklY9fWSwUbJ+k4pvCfuG3jRuqX5nh0q4psbAF25KC
         R3uLqTHfkB9fiCqdMC5uhkVsLtMHJcJDG8NwtYCg/trX49Izrio9PaF3d7gQbtKEahs3
         TEMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732615383; x=1733220183;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r8YR7iLaheJ6SeeGNT0bkA+wCorFO/8zes+RnLdy4Qs=;
        b=Aze/9vI1qBlZuuTxgZOH9FwTQBzdssLy3Oedyo39fofnkIfx9IOtqSvaL2OP+QxLKq
         /BeAhCOWWik/aJUf2vQQQDyxu7vw/4zV9YBiDf5rl0JmE5aIQu6L0Kw4NIOAmlPWMyRU
         1RTPE/H/iqYSvWmhIeIgLDFVIfvkb/pZkr3uI7NUR6huqohTqspY4zm15zFpmoZudHrb
         BCVDpUsY2LbbdzHMsrZfdtexr55ZI/Q49I4L36sy/PE632bKw98cvsVqzoBuktFgOAR2
         BAaV9KdfVtBW/AHl9rIuCpuymCal/ENbHzuBwo/8PXDYLyH415upC/Fj9APgOl7A0+wI
         akYg==
X-Forwarded-Encrypted: i=1; AJvYcCUUUmU9nopaf7aNO6XJGY0ESotd2NQQArss2YpQ9dEHw9SQOjYvwllDl3AGC7CpsqvN3HGeaTpal0k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxJyrIu/EsMlBpkPClHVnjuhlW7uh6q3brB9Tod75T8e4BINGOp
	jQSPcMBkQN7F3GE8kG0KtU0qmJGWMHr5f6lIFezkFKvD0MvGrNm8wLGKz8O+8g==
X-Gm-Gg: ASbGncuqhmE8szLnX4GLTiLCkzYWYO2nvexIoNEGj9XE+9JBrspatlELOiC58QlcEnf
	KPPHFFTfdwT7FNqr9KYsmcrtSPgCblpFLZES3xoS+0Deq7GlEHfVLMVok45dA6OZvIfqjhr0Ygm
	JHBoz1pZv6EQAiBcy44XUzcnAJmygumPVNLiUxMGjSrBYhcJyeMA22th16S18nhDdbWjsKUYbDZ
	Tyh0uGf8wXZuSsf8t63LEC9ZlNPNl2yYNs3OYBue2wnifp37Z160Yo7vGb7QiJWStYiv2eGVRgk
	Py+Zv2VI3uPcbELuX+m/dqDnhwL/8MG5cRk=
X-Google-Smtp-Source: AGHT+IE+oZR02BaIQKhUFmaDRVB78suhEwdGdQP0qUuENvAOz1jnuMx9YTKn8D2vy9oYhd+TgCr6vA==
X-Received: by 2002:a05:6402:2793:b0:5cf:e5e3:e0b1 with SMTP id 4fb4d7f45d1cf-5d0207b2aaamr12059272a12.29.1732615383587;
        Tue, 26 Nov 2024 02:03:03 -0800 (PST)
Message-ID: <1c920063-efc9-4004-8670-fa3aae1389ef@suse.com>
Date: Tue, 26 Nov 2024 11:03:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/15] kconfig: introduce option to independently enable
 libfdt
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-5-dpsmith@apertussolutions.com>
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
In-Reply-To: <20241123182044.30687-5-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.11.2024 19:20, Daniel P. Smith wrote:
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -53,8 +53,12 @@ config HAS_ALTERNATIVE
>  config HAS_COMPAT
>  	bool
>  
> +config LIB_DEVICE_TREE
> +    bool

Nit: Indentation is wrong here and ...

>  config HAS_DEVICE_TREE
>  	bool
> +    select LIB_DEVICE_TREE

... here.

Jan

