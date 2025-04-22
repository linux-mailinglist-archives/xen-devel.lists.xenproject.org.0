Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1921BA97169
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 17:43:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.963174.1354212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Fm5-0003Va-QU; Tue, 22 Apr 2025 15:43:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 963174.1354212; Tue, 22 Apr 2025 15:43:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Fm5-0003Sw-NC; Tue, 22 Apr 2025 15:43:05 +0000
Received: by outflank-mailman (input) for mailman id 963174;
 Tue, 22 Apr 2025 15:43:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f4Vg=XI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u7Fm3-0003RX-Mw
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 15:43:03 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79556548-1f90-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 17:43:02 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43ed8d32a95so46739805e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 08:43:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4407c5c7916sm121017995e9.27.2025.04.22.08.43.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 08:43:00 -0700 (PDT)
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
X-Inumbo-ID: 79556548-1f90-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745336581; x=1745941381; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4TobmocEiqslu8onLFlVQt+DalcpztYYjeKdBb2+ZCc=;
        b=Rwru5d+4k6snnoKxST2ZQOUK7g0jtOs1fEYOBxYlXkjgP9yNw0KgqQ2ENXTFagWUpx
         gJ+B1LtYxARntLGErhxZyMyWuKvXZf+gCV8MPcp6hHjX7IjXP4vdbkIRXlQ5BgeyJ53v
         lQv3y5eVS2q+Xm4c5Nk1QPvz7+d6u/QCMtpa0HTFiUMik3pTR6P9rWFScaVGV9gM3kO7
         6RW+2BIFunfZNWRofr6SSEVayMENvECRgCdOBfijQgRyhqUEn4ImEmZFCmDQjAQe1FA0
         UqwvKY8xB7vWoEpZqDyZWMEWAmbG1tvBZi1izAvyzR6I+SpwQenpeTnr2LIV+QUgaBW5
         Wf6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745336581; x=1745941381;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4TobmocEiqslu8onLFlVQt+DalcpztYYjeKdBb2+ZCc=;
        b=H+cdQZMOiLNkgsEdbsQP7WtLW9P5UvcvAwBUyLW3YmZOgdSiB9L5xC+uJo2IDKMMmX
         YNYoXgV7FQIuXR9DUhRDj/z9FgiWm0dAKj5vAmwmtsd73gYQX//wzKkvM2t4pIg7W/D6
         2SbpNr6Lk2pXfl6jotCJqZAUa39/nVIYcvneFYJW9W38DULsDlzsB74mTCMefEcGp8Mc
         ZJMTn6axfY+qg85Pjv4CKL6gtpW+AbPjIioUyJ4Mg8pzRGAt4XUw7VMZOyvPZrgviTuq
         1jkgWDWIjxr0zSpUNy8/RRJ5VOxq/c+T+FTS3vY7FsEm4E8bnVFcwBa8y37PUdxB1EHa
         BDPA==
X-Forwarded-Encrypted: i=1; AJvYcCW0DO8zLojTzGnO1/ylEsNuHEcIr1PoyZGmRJ5MgBTNsFFEiHfS9QDaNie50DIWgF89VmWDDWjuVlc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzNQUJudrAoKXTk4f7FSFWTYXSMTGXjecwSmt6W6ZDFoNqTsPUE
	SMiCytCrDh2F7rL0rJvBYYFNawn1GmMOLtu9udR+5zEZZ2CpuYlvCDypE+948Q==
X-Gm-Gg: ASbGnctyJzMdahsg6e5gd0yWB51/OvMNTk/Ljti4CpfVSPxRYc218iWt/YcqeJSizkG
	ce6m9cfQzxb6QH29ZMnnKafJT8M7OqmarDDxPNq2yMl61RP7+FWhy0BYTDwSJcauLEfCOlCqMKh
	U2Fpb1ueozdQn/OtuGYD0iNt4CT4L1KEdJ/J0BLB3++j1pFRyMj3sIl26OzEuJU8aynzdcU1iu4
	6CBzEMgXI2n2IEUZf10ec0LxwObMXf9iqjmzd3tEQFZ5p77PBQ89k6t15or7+qrBXANXkuHL5CI
	sAH02pRXrqUpv4OopCmy6iL8xFJSVetZoK+H5uFaYH4CB8i2bfyyH7pOul5PxuhJa/Pj8WhovxZ
	1jdHZkmYmSe/dwTwJq2UiTq7POQ==
X-Google-Smtp-Source: AGHT+IEYc9Fp6/LR0hBcpYboV/AhYUUAmRl4kQ06qt0qnqSBc9NlLo6M5yvG+pafkK+tGf9hXYhRwA==
X-Received: by 2002:a05:600c:3d08:b0:43b:cc3c:60bc with SMTP id 5b1f17b1804b1-4406aba7ecdmr168420395e9.15.1745336581159;
        Tue, 22 Apr 2025 08:43:01 -0700 (PDT)
Message-ID: <e7480755-49b7-417b-aa5b-4102abee770b@suse.com>
Date: Tue, 22 Apr 2025 17:43:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] asm-generic: move some parts of Arm's
 domain_build.h to common
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1744626032.git.oleksii.kurochko@gmail.com>
 <1c67078147c4a89e46f253f040bef5046fac9ca9.1744626032.git.oleksii.kurochko@gmail.com>
 <1e7ba51b-8943-4001-be2f-9181e7362223@suse.com>
 <3181aaf7-e1a8-48de-8f16-dad0dfad0cdc@gmail.com>
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
In-Reply-To: <3181aaf7-e1a8-48de-8f16-dad0dfad0cdc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.04.2025 17:12, Oleksii Kurochko wrote:
> On 4/17/25 4:36 PM, Jan Beulich wrote:
>> On 14.04.2025 17:56, Oleksii Kurochko wrote:
>>> --- /dev/null
>>> +++ b/xen/include/xen/fdt-domain-build.h
>>> @@ -0,0 +1,46 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +#ifndef __XEN_FDT_DOMAIN_BUILD_H__
>>> +#define __XEN_FDT_DOMAIN_BUILD_H__
>>> +
>>> +#include <xen/bootfdt.h>
>>> +#include <xen/device_tree.h>
>>> +#include <xen/fdt-kernel.h>
>>> +#include <xen/types.h>
>>> +
>>> +#if __has_include(<asm/domain_build.h>)
>>> +#   include <asm/domain_build.h>
>>> +#endif
>> Why is this conditional include needed? There's ...
> 
> To use everywhere just the generic header xen/fdt-domain-build.h instead of both
> xen/fdt-domain-build.h and <asm/domain_build.h>.

But elsewhere we're actively trying to remove dependencies between headers.

Jan

