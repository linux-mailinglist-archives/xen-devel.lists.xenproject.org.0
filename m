Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99695B16EAF
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 11:31:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065199.1430563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhPd4-0005DN-LO; Thu, 31 Jul 2025 09:31:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065199.1430563; Thu, 31 Jul 2025 09:31:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhPd4-0005Ag-IO; Thu, 31 Jul 2025 09:31:14 +0000
Received: by outflank-mailman (input) for mailman id 1065199;
 Thu, 31 Jul 2025 09:31:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lm68=2M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uhPd3-0005Aa-Uz
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 09:31:13 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19169eee-6df1-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 11:31:12 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4555f89b236so1640365e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 02:31:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b422b7e4fc1sm963544a12.28.2025.07.31.02.31.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 02:31:11 -0700 (PDT)
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
X-Inumbo-ID: 19169eee-6df1-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753954272; x=1754559072; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GZ7z844DnX0shFJoAtbgL2qxPQ8Qc41rLYUtyMT/grk=;
        b=Od6FLUz0Z1gBinE2aQMs2hPd+8/oTenC/ONsffyEEveLmiYJVaykUJ3mv6Ll558z0q
         erG9DZ5auI1pDwZ1xYxAZ3UEVhFywZ5Bg3aGE5l72c3Si1dJ1IDEosyNjzi2k6aA5DoY
         xcdJtpxaXbU6rnrI9T3/ke+Qbornn+ZUU2I/ATcJp9GUvIDm7rnba1k8xzJJbQtUmi9d
         zZyQ+hY4yM00TjpbdHQc4sqOXz9Nb4+Xc3unQSUDzvj78tLIbJ822bCXZCMZvVeZ5nb/
         TSXhtPypgyQrY0EN9kphimxh5eq0vgoefyd/kxJMbBM+1mBlQceTN7KEI7kYFLy61pZY
         VPsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753954272; x=1754559072;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GZ7z844DnX0shFJoAtbgL2qxPQ8Qc41rLYUtyMT/grk=;
        b=KWwLoRjPr6an5EobF39ywFhl9wmFbF7vPKoqfot68bGe5Y6B4YpBtUSGJJ10IWVHrq
         xa+/AaQxHXT6iixWY9UUM1H/YJzSDkojmexo0MtKYdyMBevdMt0Gha4JQU+M0Tc0yLn0
         iDEvQojHLvhazaYa9h+uu4jjU6gDn5BypjEjZgrLBv8vE868Aun0rCFr+NkT0uBh6c/6
         V9FdjpxxG6K7ybMWkJE0kGrdyWzcLIDDETscipNlf5bIoILnqoY/JQO/trK2bFtTj7BO
         XfKLI9UyrMWVQeMdlkE0zYnL1Q/Q3pTwdcYozEU56Y/Ht25bxdF5CMA6LENnuwQMv5xM
         g1Xg==
X-Forwarded-Encrypted: i=1; AJvYcCV4pgcBD/kZDd5nG4siYIJbnOgUwSjoZQCBhrb7M98QtCiVG8jBlwseKz9W3Eh1PbXFX5ESgVIhe2s=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx0YWDC1AuD4sKKaMH69huddSnvJbqDnrfNEQZHwWw6pKZygtCg
	FwTOIgvdDOTHH/5JKxuHiZ9utH7zH7Nn0aQ8Ve5UPKRD7kTrzVDCT9xxgW3Aqw14eA==
X-Gm-Gg: ASbGncvJPIgf0Do37jUvaUPUDOblUNUPArsuleF67LI17dfuC9PWn/VbgJBGaWB7ss9
	W8lAmmYeAOWcr8Wa8Yv99vU/6uZIm5+moara18JNTY1BIKtroWnSdmTORmk6NhfvfYQACUnk5Lg
	PtJliEdtAWemDWE5G73EFQ8Ok73cBkPwMv6dwZuiDAtNL1/vQ8mxoiuXB8e2TADkqssSUo216Qq
	1IeK4P9IDxeDS3BFndx2IX4wLtLrdPoiS4U8+1b6mjr1d9Pk2JEzdMxC1XCwXkGrQMtsR2L0a37
	zVfIUNU9XBwjdFnsMDJW2ZPTsO4oDVr1cvxe6tXP2ksLrZlr36d/C66Zwv/W2bw/0607vRZhZzW
	IdFwCLUmVaBDt4aWZA22UE4VQfoHsmWOOP98qqtYZAQC/y3lHvasRyu48Vky3bTdLaqQB6zMEU4
	MJAeeGY+0jL2Sh0AfhbYl5I8+MZIZ0
X-Google-Smtp-Source: AGHT+IGxn6tP8h7ISBHel2cLw7SWp5mFU/oBcAjmZBe+PFpdPMssBKliaKbeUlYEoOpwxublTCLDCA==
X-Received: by 2002:a05:6000:310f:b0:3a5:8d08:6239 with SMTP id ffacd0b85a97d-3b794ff3b7fmr5533317f8f.21.1753954272076;
        Thu, 31 Jul 2025 02:31:12 -0700 (PDT)
Message-ID: <379b70bc-2e1c-44fb-84ec-d7fd42fda147@suse.com>
Date: Thu, 31 Jul 2025 11:30:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 0/6] x86: Make MAX_ALTP2M configurable
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, Juergen Gross
 <jgross@suse.com>, Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>, xen-devel@lists.xenproject.org
References: <cover.1753953832.git.w1benny@gmail.com>
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
In-Reply-To: <cover.1753953832.git.w1benny@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31.07.2025 11:27, Petr Beneš wrote:
> From: Petr Beneš <w1benny@gmail.com>
> 
> This series introduces the ability to configure the maximum number of altp2m
> tables during domain creation. Previously, the limits were hardcoded to a
> maximum of 10. This change allows for greater flexibility in environments that
> require more or fewer altp2m views.
> 
> This enhancement is particularly relevant for users leveraging Xen's features
> for virtual machine introspection.
> 
> Changes since v11:
> - altp2m: Drop p2m_altp2m_check() stubs on non-x86, move prototype, and guard
>   uses
>     - s/following/subsequent/ in the commit message + Reviewed-by: Jan Beulich
>     - Despite agreeing to let Jan make this change, this commit wasn't still in
>       the staging branch at the time of sending this patch.

As it is still lacking ack-s, as I think I had indicated.

Jan

