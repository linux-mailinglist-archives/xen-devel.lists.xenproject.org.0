Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 815678C63A8
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 11:29:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722099.1125969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Awy-0003dY-VB; Wed, 15 May 2024 09:29:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722099.1125969; Wed, 15 May 2024 09:29:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Awy-0003Zc-RH; Wed, 15 May 2024 09:29:28 +0000
Received: by outflank-mailman (input) for mailman id 722099;
 Wed, 15 May 2024 09:29:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EWeN=MS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7Awx-0003Ui-Ci
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 09:29:27 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f673f1c-129d-11ef-909d-e314d9c70b13;
 Wed, 15 May 2024 11:29:26 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-572ba002a6bso1423712a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2024 02:29:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17b01517sm830642166b.157.2024.05.15.02.29.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 May 2024 02:29:25 -0700 (PDT)
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
X-Inumbo-ID: 9f673f1c-129d-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715765366; x=1716370166; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LpcJ7sW1Zg4pRLASa07jt2b4VErmFG99QkQLm4bcba4=;
        b=DIsv7n/4hBnhmgruIymTx3nrgjmpxJeUdkkoMJade/ThesqK5jRFUNN3Albc2VUNUK
         QQB+Vwqfi31oWfZ5wZvF5BumO7R/A9lpT4Ktk1CyCLiUei0OZcxt/D0nqq886K6WbDwi
         hA6PpskvLkzh22TW0rB2rIoswGpPE162qKxgMlhuHpdsvuAbEuWU9jYPBWcKs2h0a5hy
         0D/bhOt9xImBQjUcjyU5psbq3lnNn2R9xLrF4emN2UhOaGtUGfY32wBI3wrr/x+gnIpH
         e2q7emumsifu37mom2kgQhyXI16b8VD/8vx0AWXs8W8NqbW/AYcsu+HFDEv49mj6K/Wy
         GHaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715765366; x=1716370166;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LpcJ7sW1Zg4pRLASa07jt2b4VErmFG99QkQLm4bcba4=;
        b=eU+YJlPCCCaai0o/AEw3jPONs0AmXPzzKMU1Xr1jAGCtNlAzpvR1c3dCQvpaKUnZfM
         OOKpbgEMeRLJs1nBes0nh2hUHyS8HtQfGCR7qD8Yiaa1Vi0GebsdQbPGiOTTs35OlJT4
         1Prw4MA4TcKNt65f9o7ZyQPOIpaw8LJf0a63TZLgnJgcQJT3zwOnoW0y1obrlMRqC6wx
         ynmqgHqLG8UPLl2UvqKc70Y3EVf8AEjoD6LFc5KaxAG32vxKZ8gZjbScFBirY+EUeoVj
         4qnfgGQxPNU9JSZ/y7HSLjguLRlPMU/VwkYXXMXDG4qSo/x+cYZX4llxDU47ZvVLNK4n
         xJJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDD2f9wSn+pxUxPnb4rJ5XLjZQDBYqRVR9+eeyln2bXwId1D7Ealzs9rnRbbemAq9XRrrZRCFgZB0rXg1B9UpVZruu4VMetL51VwjaUR0=
X-Gm-Message-State: AOJu0Yz3HrtAbiEHX8MP2flHrDwml8eE5sDX2zrRUvddVCxr1a9ag4fm
	kM1D9jCKDKLAGl5CaKDFAH6pH+FCyCspNMvoQXDqDo/DY19cfHk5ewVaiI9zWQ==
X-Google-Smtp-Source: AGHT+IHdeQ8Y6mtgqOFy+gUIvy/Obijae+NFXBrcGhwE+LQoIzZdsI7SEBSIyI6vBId1ktAK3tV6pA==
X-Received: by 2002:a17:906:32d9:b0:a59:dd9d:6da5 with SMTP id a640c23a62f3a-a5a2d54c07amr970583566b.3.1715765366136;
        Wed, 15 May 2024 02:29:26 -0700 (PDT)
Message-ID: <548088ad-9d99-465a-b103-aa59831a0d43@suse.com>
Date: Wed, 15 May 2024 11:29:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 05/15] xen/riscv: introduce bitops.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1714988096.git.oleksii.kurochko@gmail.com>
 <c81251aa51abe383f60a24770a07a9aa6d673a21.1714988096.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <c81251aa51abe383f60a24770a07a9aa6d673a21.1714988096.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.05.2024 12:15, Oleksii Kurochko wrote:
> Changes in V9:
>  - add Acked-by: Jan Beulich <jbeulich@suse.com>
>  - drop redefinition of bitop_uint_t in asm/types.h as some operation in Xen common code expects
>    to work with 32-bit quantities.
>  - s/BITS_PER_LONG/BITOP_BITS_PER_WORD in asm/bitops.h around __AMO() macros.

Yet then ...

> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/bitops.h
> @@ -0,0 +1,137 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Copyright (C) 2012 Regents of the University of California */
> +
> +#ifndef _ASM_RISCV_BITOPS_H
> +#define _ASM_RISCV_BITOPS_H
> +
> +#include <asm/system.h>
> +
> +#if BITOP_BITS_PER_WORD == 64
> +#define __AMO(op)   "amo" #op ".d"
> +#elif BITOP_BITS_PER_WORD == 32
> +#define __AMO(op)   "amo" #op ".w"
> +#else
> +#error "Unexpected BITS_PER_LONG"

... there's a leftover here.

Jan

