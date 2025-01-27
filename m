Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE710A1D534
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 12:19:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877752.1287897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcN93-0006xJ-2l; Mon, 27 Jan 2025 11:19:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877752.1287897; Mon, 27 Jan 2025 11:19:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcN93-0006uc-06; Mon, 27 Jan 2025 11:19:09 +0000
Received: by outflank-mailman (input) for mailman id 877752;
 Mon, 27 Jan 2025 11:19:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O4xJ=UT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tcN91-0006uU-Kj
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 11:19:07 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8576cd20-dca0-11ef-a0e6-8be0dac302b0;
 Mon, 27 Jan 2025 12:19:06 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5d3bdccba49so7967723a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2025 03:19:06 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dc186d8b37sm5235637a12.72.2025.01.27.03.19.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 03:19:05 -0800 (PST)
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
X-Inumbo-ID: 8576cd20-dca0-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737976746; x=1738581546; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DpdqrWBdH+Ai5k3myB9oDK6+53dJhIzny954JTChJI4=;
        b=SEM0Xp+GbYNI+4HqofqhXBhoKZGbTQF0T2bSF/Im6imdrB50t3vzZoNvI68Efrfr3G
         cfJQMy7LgI30abBaNgoh0Xi3SWAZg5uz0XAtcmEythZaq1SK97unYMdCitTUj8sy8NJ+
         rNFsQb/D7wH96RkbW6ftFkKMvsbCUe6VVAis93YtQOIbb79wFEpRJkLcie4DvRuJGKVf
         hoV7dYHaqyNqvvqX7X9V8U/feV7O1WGGegSIkpfE00wBCw+DbN/eBehLNvM2U4PhEV/z
         KGyomoRq6SlUtOGaXV9KYef462I2vh/xRBXA0nkA2Vf5RirWKuI11qaWmXsNV0wl8kZr
         V7EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737976746; x=1738581546;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DpdqrWBdH+Ai5k3myB9oDK6+53dJhIzny954JTChJI4=;
        b=kIqE9o7Zluvajc8Pb9hq/YvxOKCrS4lRTWYJ3YOTOb7n3ZevmH+mzpv5L4bVH4WT1W
         q+egtSTv5z4wEei8ggVCbnMKraT2jXVxrx1jCx+3g7qnXGdac8A1BdISY7UOXl0AYF7v
         NFAD61JZ+fY/oUEHM8crW30ivQQIhdL48V5hz+hzxzJRmq/KYGzKoODRWMLKdIPzbqup
         k1huikmp8cG9CxpWvDZ8mkM5X11E8BeRBG1OtdkfILt5IRwlrasjpotieYJTW3BZDaOh
         SJkex20dEAyMTl3XIX9494MyKp7/40XcaeeVt7zI/R3YQmJcDGVwv4ti7fTVghidw3eN
         nEjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWag/V8elqCNbaV2fshkw8zeUIE4yAbmHpbBl05GPywMkQFQKk+OkoAX3rigV1v/n+MHQhUHd5FR1M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwFYuXx23l9EPV7C6Cl4+o2UJIx4Oy8OyYdLAgMWuX8eeUwv2+o
	DR6qEIb4K6cODyjoWRgF/lNPvXhT5rsCCTQxLFnXEjKFGdW1kDrzv2IbbjxCgg==
X-Gm-Gg: ASbGnctfroQutI/78HgxKlrb8kuiaB/gKrQR6fAZoQHr4l+Xyxc/pz3+vgv5oHWmNUm
	0tJujfCCBnxMZ4gJilS8wSwQcV/+kbIAJe7Qtt7M5gEL7OhS0psvoC9XICZ/v9A9XcZY0fCFniC
	sJGi36SvImHGmlc2BR8ELm84x6qPQAJGm6CGPMRkZW2XXbc2TElz1D5ngvvESt+tlAPIfz/6sz3
	RnLvunQ5x2QoKGAJ6klDB2L/KDF9viHXwQEJLTleLec6cW+ut9lpVB/cNKuAeae422qKubhnTwR
	uprZIJ85CTIWA21GrZ6s6TTqZJZGgxZ18v+5KmJw9s4Ft2dO/KtvB1QeB84AC8Ihww==
X-Google-Smtp-Source: AGHT+IGNdcqW+ubVpSsx+dFwwCfhleBuCZKbk9firtANmIUKOAxyvufJteopB/mSMSDNTEphxQrnOQ==
X-Received: by 2002:a05:6402:2346:b0:5dc:1fab:f63c with SMTP id 4fb4d7f45d1cf-5dc1fabfe0cmr10311190a12.9.1737976746115;
        Mon, 27 Jan 2025 03:19:06 -0800 (PST)
Message-ID: <58f861e2-866d-4c11-9bdb-b4b6c84825af@suse.com>
Date: Mon, 27 Jan 2025 12:19:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/9] asm-generic: move Arm's static-memory.h to
 asm-generic
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1736334615.git.oleksii.kurochko@gmail.com>
 <3f1f3786ee48b01f1a5c7c7573456da72aa1e1d2.1736334615.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <3f1f3786ee48b01f1a5c7c7573456da72aa1e1d2.1736334615.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.01.2025 12:13, Oleksii Kurochko wrote:
> Except moving Arm's static-memory.h to asm-generic #ifdef header guard
> is updated: s/__ASM_STATIC_MEMORY_H_/__ASM_GENERIC_STATIC_MEMORY_H__.
> 
> Update arm/include/asm/Makefile to use asm-generic version of
> static-memory.h for Arm.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Here as well as in patch 5 the "why" is again missing. Moving is fine, as
long as it's clear that this will actually be used by another arch (e.g.
RISC-V). Whether you have such (immediate or at least near term) plans is
unclear though, as both features look like relatively advanced ones, and
hence more basic functionality may want to appear first in RISC-V.

Jan

