Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BC9916225
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 11:17:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747497.1154919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM2IX-0004Hj-9u; Tue, 25 Jun 2024 09:17:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747497.1154919; Tue, 25 Jun 2024 09:17:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM2IX-0004F4-6S; Tue, 25 Jun 2024 09:17:09 +0000
Received: by outflank-mailman (input) for mailman id 747497;
 Tue, 25 Jun 2024 09:17:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sC98=N3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sM2IW-0004Ey-F2
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 09:17:08 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0be724f-32d3-11ef-b4bb-af5377834399;
 Tue, 25 Jun 2024 11:17:05 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2ec1620a956so63973711fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 02:17:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c819a66833sm8189007a91.9.2024.06.25.02.17.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jun 2024 02:17:04 -0700 (PDT)
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
X-Inumbo-ID: b0be724f-32d3-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719307025; x=1719911825; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LsYyQcbaduUfu96DOuZrUAkmpHBlvRODzMCVPgYQsoo=;
        b=cYWTFsQFsqrKYG2v0aYxteJpbLVKNakyKAL1QOwO2q9iGvnSrhHYPC4FyLSASnOVei
         aLhyBmQWPITx0rK18gZKFpBwiqHB42A+0zPgDmdr5uCGIK5TBEdtil/1WROY679zIRlD
         sX3P6PgiukjFD4wuxZu8hfTdNsCidyGeQa0Mtz1gGjUEh+6dM1gNjrdgzMug2WnFKbXV
         PPESA9vU5keEzgv2XxnRUvO4XBlgiNGv/Nrzs8XTUr/IJVaqcgdjioe78nr+eBUBv0l4
         B/t2Is+11Z+QMNK3mGqNXdvMfkBPJEmLiq0WmioWcxo3OOJfDfA3qqezXAzuMkg8Ujwm
         IhMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719307025; x=1719911825;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LsYyQcbaduUfu96DOuZrUAkmpHBlvRODzMCVPgYQsoo=;
        b=enfkhMnoZ7Ami937kEF/aNaOjJpn7fXucIkmMiSPdHXn33Lb7uDauUqQkW6DuXlJjg
         ynWiy0sKHHXyWGGdvyQcI6rLa/WYqkPADbnRXsEzKCOHw62pH7kpocMyd0ToFC+NMY2u
         QL284/j3GcCgpdZ2phImnUtJs7bZuh67hB7hhGiVcl1GEHhk2WUherl54sph4VH4LR/d
         dFNWMtO2lR4oC0O1bs2wMsAXzRqcdV/1EFn5TSyO1u+t0Yc5zPvXLPnohVShwLJsJ3F3
         5xoPSTR7CQoNnNT3253joCm5FpthCdeKk3SZ7Qw1iNh2NHd0KXTSkSfZh5FBJ/dvfpJI
         sXAw==
X-Forwarded-Encrypted: i=1; AJvYcCUKh1aL4BECNB0WaYKmGaGDBa4/pQ+bMAJy4Ryb0F3J7JHOTiDTju/S6Ac5yWhq1DDTjV6b/jjXfWDcc2ej/Rh+JovkhH8Va2s+SRCcc9M=
X-Gm-Message-State: AOJu0Yw/klO1CgseAh2d57cWuaQQ2FS3bm8JwhC2wX1z1cYfFxxgU3AY
	0UUV+WYDkNLYVqQ1axTXCtcOf4pnjj3INof1ooSU74B7x5BrKiDg79IarX9sTWdrzDmA0ubONzU
	=
X-Google-Smtp-Source: AGHT+IGHA5u5wLZ07A+fp1BC2M4h1Pc/v7hT0iNjdRZY0RM0UD450jk1aZ2exR07M/D7SJHvBPF5sw==
X-Received: by 2002:a2e:720b:0:b0:2ec:4096:4bc6 with SMTP id 38308e7fff4ca-2ec5b318000mr39135031fa.7.1719307025168;
        Tue, 25 Jun 2024 02:17:05 -0700 (PDT)
Message-ID: <0a7854e0-e01e-435e-95fe-b262cc4afc1e@suse.com>
Date: Tue, 25 Jun 2024 11:16:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] Add scripts/oss-fuzz/build.sh
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240621191434.5046-1-tamas@tklengyel.com>
 <20240621191434.5046-2-tamas@tklengyel.com>
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
In-Reply-To: <20240621191434.5046-2-tamas@tklengyel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.06.2024 21:14, Tamas K Lengyel wrote:
> --- /dev/null
> +++ b/scripts/oss-fuzz/build.sh
> @@ -0,0 +1,22 @@
> +#!/bin/bash -eu
> +# Copyright 2024 Google LLC
> +#
> +# Licensed under the Apache License, Version 2.0 (the "License");
> +# you may not use this file except in compliance with the License.
> +# You may obtain a copy of the License at
> +#
> +#      http://www.apache.org/licenses/LICENSE-2.0
> +#
> +# Unless required by applicable law or agreed to in writing, software
> +# distributed under the License is distributed on an "AS IS" BASIS,
> +# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
> +# See the License for the specific language governing permissions and
> +# limitations under the License.
> +#
> +################################################################################

I'm a little concerned here, but maybe I shouldn't be. According to what
I'm reading, the Apache 2.0 license is at least not entirely compatible
with GPLv2. While apparently the issue is solely with linking in Apache-
licensed code, I wonder whether us not having a respective file under
./LICENSES/ (and no pre-cooked SPDX identifier to use) actually has a
reason possibly excluding the use of such code in the project.

> +cd xen
> +./configure clang=y --disable-stubdom --disable-pvshim --disable-docs --disable-xen
> +make clang=y -C tools/include
> +make clang=y -C tools/fuzz/x86_instruction_emulator libfuzzer-harness
> +cp tools/fuzz/x86_instruction_emulator/libfuzzer-harness $OUT/x86_instruction_emulator

In addition to what Julien said, I further think that filename / directory
name are too generic for a file with this pretty specific contents.

Jan

