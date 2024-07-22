Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8473C938F06
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 14:20:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761853.1171905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVs1i-00014V-V6; Mon, 22 Jul 2024 12:20:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761853.1171905; Mon, 22 Jul 2024 12:20:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVs1i-00012O-Rm; Mon, 22 Jul 2024 12:20:26 +0000
Received: by outflank-mailman (input) for mailman id 761853;
 Mon, 22 Jul 2024 12:20:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=79tL=OW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sVs1h-00012I-1u
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 12:20:25 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4d86b2d-4824-11ef-8776-851b0ebba9a2;
 Mon, 22 Jul 2024 14:20:23 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-52f04150796so1097315e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2024 05:20:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a3c785b89sm415683066b.36.2024.07.22.05.20.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 05:20:22 -0700 (PDT)
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
X-Inumbo-ID: c4d86b2d-4824-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721650822; x=1722255622; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fMNh7FBPsBo1tfiC+OaicVwt+SBfn+RT7xkOluCDgEw=;
        b=DQomlsZsZ9t0Ougi1IjYbDPEV+F4CfcR7hJtoSKcHG9z4yCvn1raA6iDCaZ0e1IXpc
         fdohKwrfq6hkG2R5KU7yFHTDoNTRP7i3a17iqpqjOj9FT/iWIssICLW8Cg3cQtoMayO5
         X9S1A4nuuUKGcZTrhjyZXfnUrVV+lTQrRDYneVIVLejrgK27uHg1ZtJgogsTDQCxE2HQ
         YYM9TlnGk+gopdmx5AZjitSwRGQyd+kNRYv8zQvfvqawGUKl3viIVZw82M0cPxBKx4oI
         enqRWwP5EKT3ED9z06ecncmXopc0WPTapJb7/ial+13ntFIbA/TgxjhS03Bo21LuFR32
         Ib2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721650822; x=1722255622;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fMNh7FBPsBo1tfiC+OaicVwt+SBfn+RT7xkOluCDgEw=;
        b=gTsZtD+W/AanhLsmmbD8e+ugtkijmxSRcYjr8JY6GvJQOaKjHg7DJdHLl57eZUWE+s
         OT8wSom1WufHAf+eka+SaAcUP0qQla0YAr9Xk2pXFXwfoqb6LVtlHH6ETAUrLFrAGapX
         N/ZJ8KQbpPA3hMb4hLMIaXx5b5c0x6BoITkA8Y7Ii8wKoy/ncYjc+SS7g+ioCB5phVYH
         3EG2mULxaL5/pcqA/4VkD9d5ke1FpCn7R23TQAr6fYz4CX+vJTFBfCXNdZdNoGJVIs1h
         /6/lGPvHf0cNzRBWTDCsckOW/X5JXQZhWh3cDVrVZVrKt/g/LDqmxpgoYAncfqpmBoF/
         znig==
X-Forwarded-Encrypted: i=1; AJvYcCWONsRd94a91NJPkmdEc7V1VDcOIDY+yaqJJcU4WTQG6XHj6dpcTDsyf2biMLDpo+O2aYEeSijk6pgsLfJQaj3WD6+9aRTe06LmtVKHiBI=
X-Gm-Message-State: AOJu0YzvK8dXh+l86ahquWAGRWuA1DyiFW53dJ252F2A3eAWkcaRudnt
	9IgYFHK6h0Y2HCn33kCXkRkA3UAPWIZIaVaCrG4PjwwuGd+90paFodKV2vkFrg==
X-Google-Smtp-Source: AGHT+IEZtTsgswGnEBJn3t7Khak3o+4+5720hQ9v+YL1+X1Z6yno4BQW3BqW2wHLHQiEXHvJVQaSVw==
X-Received: by 2002:a05:6512:3e14:b0:52c:d78b:d0b8 with SMTP id 2adb3069b0e04-52efb780b4amr4695585e87.39.1721650822502;
        Mon, 22 Jul 2024 05:20:22 -0700 (PDT)
Message-ID: <9bd41e19-50f7-43e7-b3ce-c2870a836f79@suse.com>
Date: Mon, 22 Jul 2024 14:20:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] Add tools/fuzz/oss-fuzz/build.sh
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org
References: <20240722112752.4981-1-tamas@tklengyel.com>
 <20240722112752.4981-2-tamas@tklengyel.com>
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
In-Reply-To: <20240722112752.4981-2-tamas@tklengyel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.07.2024 13:27, Tamas K Lengyel wrote:
> --- /dev/null
> +++ b/LICENSES/Apache-2.0
> @@ -0,0 +1,202 @@
> +
> +                                 Apache License
> +                           Version 2.0, January 2004
> +                        http://www.apache.org/licenses/

Better https:// (also near the end) nowadays?

Other files in this directory also have at least one Valid-License-Identifier:
line and at least one SPDX-URL: one. Depending on what would be put there, I'd
then wonder whether ...

> --- /dev/null
> +++ b/tools/fuzz/oss-fuzz/build.sh
> @@ -0,0 +1,11 @@
> +#!/bin/bash -eu
> +# Copyright 2024 Google LLC
> +# SPDX-License-Identifier: Apache-2.0

... there wouldn't want to be an "-only" tag here. Yet I'm entirely uncertain
with this, as CC-BY-4.0 also has no such tag.

I guess I should offer making respective adjustments while committing. I'll
wait with an ack though to give Alejandro some time to confirm that you
addressed his bash related comment.

Jan

> +# This script is intended to be run only from the oss-fuzz docker framework
> +# See https://google.github.io/oss-fuzz/getting-started/new-project-guide/#buildsh
> +cd xen
> +./configure --disable-stubdom --disable-pvshim --disable-docs --disable-xen --with-system-qemu
> +make clang=y -C tools/include
> +make clang=y -C tools/fuzz/x86_instruction_emulator libfuzzer-harness
> +cp tools/fuzz/x86_instruction_emulator/libfuzzer-harness $OUT/x86_instruction_emulator


