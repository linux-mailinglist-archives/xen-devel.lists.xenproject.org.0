Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AC1CB54C9
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 10:04:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183694.1506300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTcav-0001PB-8Z; Thu, 11 Dec 2025 09:04:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183694.1506300; Thu, 11 Dec 2025 09:04:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTcav-0001ML-5S; Thu, 11 Dec 2025 09:04:17 +0000
Received: by outflank-mailman (input) for mailman id 1183694;
 Thu, 11 Dec 2025 09:04:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+yrZ=6R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vTcat-0001MF-QM
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 09:04:15 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c2702ab-d670-11f0-9cce-f158ae23cfc8;
 Thu, 11 Dec 2025 10:04:12 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-42b38de7940so288930f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Dec 2025 01:04:12 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42fa8b8a9b9sm4717107f8f.35.2025.12.11.01.04.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Dec 2025 01:04:11 -0800 (PST)
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
X-Inumbo-ID: 5c2702ab-d670-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765443851; x=1766048651; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5ktbatWojyLrk8e+iwdl3ql2qu08x44yls8JHisvP5I=;
        b=TuHgt3cRbdUYVAund4ca12f33NdCHxyCaFrc9yDeki1pddptn/xI+vEz2B0LwPMkO8
         8UyfjYVNuQsjtbcfq+tKx6xoiNWF9RaeoYW/bLr34aCY9ybdAVNPrJr386rGUmnzoPsL
         MBNgzFHY/lOwUjaeupmvWGcM8Sv6ScY+G/hNwFpWyTyZ21/PmsLsDjysD4+ed2m7TUfX
         EEX/Zk3+rGPI+4/lm5oejAgN31NFAsW6KLTB0KujCkc2oHKTqsgFp6ej5QQXqPwNfTBw
         MqQMzplRCh8sVlRt0lMoTJ24nlkPWPGseq+6RiXXLidlEGvLrFkUWywjTzusw24UIHPL
         8TYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765443851; x=1766048651;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ktbatWojyLrk8e+iwdl3ql2qu08x44yls8JHisvP5I=;
        b=QfApxB2gfDM8eq6G+bHEF2mGzJYSIWwkdlMXvX+HLHEPLL7keVdaVV0q02pKXr6tXt
         bVzdDrb/9lNw2DW5e9PPZDC9Wc6XMOUQZ/X8znci72XL+3CKRNqZ4Ns71da345KxTIys
         7eyBUt3bIoh07ARSysumgJKRS2LPqtxkPF7wzaac1+jiycZ4NBKFpcuO+AwdBP6uDwqm
         X0o1QqX3SzMuWurCPMaiGnC84RF7Yr5l1dHRiqHa7olu220AtPwVaMkyjJ/Bnhru+Wx0
         4dbMz2TsHRguMihDVVflxMos+rKQAau1f0feyD7TX0dmGPVWJ/koZOcIgDUUSYOHzZIr
         wwDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKhj0WuZArmp/tVot/GJo+0KHmiIqtCe1TABBpfrevlelYuR8V1LCXZdkqPOxLsd+e1jXbjNOtejc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxASxjXFvwiK7I99+LjgkQfWnwfWXZg9CWS+saunwmg/ZW8MDJn
	sa7wJHcAHF7pgHXsdVpbA9049JUb6L1dMRmZPirsdZWC0v+gFxJCV0PounYmtVVJfg==
X-Gm-Gg: AY/fxX7a5HevuzuLkaOhCqfNUYiVAcKOUsr0wwFz2auhqVpbF/LbjXPSkrQT+qIuR/B
	PkP2vck2DSGu1WYc/+mgZNdBOPCZiTIX+yslAwC8VjtgDLc4JmCSZ0ruub98kpP5p5wLEWELdP+
	I43ek4VdNICDzHdTLJvGlA5fxNx5ax3Y3kxJStPqcVyAO+ZD6hk2RL+qirnOHlG2+kVyBwLjotK
	5zwtklwtdYlNwo2ugbzFPuNDKNjNVnvN2petLxp1h7tyoluLCYUP5kng/UlKDWKX5bq05PAeqks
	tsPDE0CQ0c1QrG2l/qjXByMtM2DKN4wmbsJlhADT768X6J5MN7wMvvLddZRtC4FmDEZlT2XH0gz
	VLJIVxPf8Xc2VH0fNK6b+TizOab+gcNhA3B8PSw3rtlJZByafGEt58yTveBtHgdC1osqWB524mF
	w7ItHccKJY4WWSl6xuSt+gsymKv7iGjGTkisT71z7t0frkOcDLtXEvWh/yyeW9YDAFkKij2DyLZ
	NY=
X-Google-Smtp-Source: AGHT+IGCRZQRDdsmT3XgqI/7TDpuv+yUrvw+OrltmDEZoxbRuq8wetolDqrtiqnbxa9JtbQ+n/BWJQ==
X-Received: by 2002:a05:6000:2405:b0:42b:3dbe:3a53 with SMTP id ffacd0b85a97d-42fa3b0fb04mr6047264f8f.40.1765443851390;
        Thu, 11 Dec 2025 01:04:11 -0800 (PST)
Message-ID: <73559a38-d5c2-4e04-a6d1-24695573552d@suse.com>
Date: Thu, 11 Dec 2025 10:04:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Current Eclair analysis
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <7744f9e7-17da-4f48-837d-8fc087899af5@citrix.com>
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
In-Reply-To: <7744f9e7-17da-4f48-837d-8fc087899af5@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.12.2025 19:14, Andrew Cooper wrote:
> Overall, what I think we want is something more like this:
> 
> Jobs named as *-all and *-amd.  After all, it's AMD's safety target
> specifically, not necessarily someone elses.

+1

> The *-all targets want everything possible enabling. Ideally we want
> something like Linux's COMPILE_TEST, but in the short term we can just
> adjust the input Kconfig.

Assuming the PV_SHIM_EXCLUSIVE negative dependencies get sorted, what's
wrong with simply using allyesconfig there?

> Like we had with the common configuration and the per-arch
> configuration, I think we want to express the clean rules as common,
> with a wider (a.k.a stricter) set used for the *-amd target.

+1

Jan

