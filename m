Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE62934C4A
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2024 13:18:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760395.1170234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUP8o-0004YW-7B; Thu, 18 Jul 2024 11:17:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760395.1170234; Thu, 18 Jul 2024 11:17:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUP8o-0004WH-4Q; Thu, 18 Jul 2024 11:17:42 +0000
Received: by outflank-mailman (input) for mailman id 760395;
 Thu, 18 Jul 2024 11:17:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3WUc=OS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sUP8m-0004WB-Ih
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2024 11:17:40 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57493490-44f7-11ef-bbfd-fd08da9f4363;
 Thu, 18 Jul 2024 13:17:39 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a77bf336171so109272066b.1
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2024 04:17:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fc0bc271a9sm90861785ad.172.2024.07.18.04.17.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jul 2024 04:17:37 -0700 (PDT)
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
X-Inumbo-ID: 57493490-44f7-11ef-bbfd-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721301458; x=1721906258; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vXCyi6KKfbmruRiB6+eBQeqPnWRWyLnw/eBpTAfqmKo=;
        b=QG1KgANI6AkqKE5y691lDqpv9S0CHxH2EnAHvaR0jGIJU538esQJ8b4RYJc6XA8Jg2
         UKvpeYezOVBOdTTvyV4uFrgjMPnqDiGSZbishPDuSBrxQ6+y2uVXhqh2mziZGkqV7VB2
         vwgo0Ul0kwxcOFSmjmJYHKMaQ/9RwDwz7QInbwZ7nInTkhPjVBkofUpEiS2D/sSUPXUa
         w4CCcdgncmqY0NddeekPLnbm4cyDT7cK2FbsAy8XLpJEtV94zXro+Nn0Q4fPwezwoDb3
         lXk2IMIfkFl/Vb/ujjyWS43ojrWWFtqUWwyXxHSFe8YP/XSIvt+OVfmGYVWw8eFO+jPr
         EeWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721301458; x=1721906258;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vXCyi6KKfbmruRiB6+eBQeqPnWRWyLnw/eBpTAfqmKo=;
        b=APZjYF5YAsZkn4NFTLUCcWWlXvifyQI65x2Ucq8Fv0XXYrJd5bV7PBTkGickFyQ8aS
         O2wncBXoXIc4NnduGaS5/+b6RKHv89qZo/qSoJ8VOSybvPF+XmM8uY4twD+jPLz4OMdK
         A4LNpZgUm7spbNf6YJ5SMdTU9c3tGONeBv3NPKwuR2NYMmMnV+7lZhdc7JaOlNqS+MuY
         pVoaAumR0X2zutf9ABpsMCY/4T+9aNZzdIHVo/lBvo0uaUCudZWJjQw32cfZCVEiW052
         7EQIxMEl4l4N9fjcYfzM89lgK/tfhyvZF4pcYXv4dBYr9tAXLAdnGq2gAahMRKVVm5yY
         lVMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMdqq1uQpD5g/0C+jyOye1P5JjQX0PTvlO41xYvrpxJTAoIWtD+6DhRYu026PJR3hqtjQcrcoX5FLAwzR5NJuwqcd32uQCOd09YRSTA5o=
X-Gm-Message-State: AOJu0Yy6TVKVvDL2bTp4w23pwj4F3u+o38MeqnlxTlL0kICILsAhV95T
	Ki55kRzGkXoKB5kgiCp0SCTxVkdjHJm0WpTMSm97C3URX8FrK/x7mYnvWsriZQ==
X-Google-Smtp-Source: AGHT+IGGBFBy7B/3FlMaGv3Y4kfYZCHSVyx3HKo46eU/r8hOpxkthl7YpZ8nZDnuxbGPWHmsnBbiNQ==
X-Received: by 2002:a17:906:f354:b0:a6f:e03a:99d with SMTP id a640c23a62f3a-a7a0eb4dc4dmr266528766b.0.1721301457892;
        Thu, 18 Jul 2024 04:17:37 -0700 (PDT)
Message-ID: <53e3356e-4cc1-475a-91a1-8fc17fda07ab@suse.com>
Date: Thu, 18 Jul 2024 13:17:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] Add scripts/oss-fuzz/build.sh
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <d14436e64c650b388936a921837b984772a4fceb.1719355322.git.tamas@tklengyel.com>
 <d0974cc40ca68fe197ba7941edd934970d3a92cf.1719355322.git.tamas@tklengyel.com>
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
In-Reply-To: <d0974cc40ca68fe197ba7941edd934970d3a92cf.1719355322.git.tamas@tklengyel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.06.2024 00:47, Tamas K Lengyel wrote:
> --- /dev/null
> +++ b/scripts/oss-fuzz/build.sh
> @@ -0,0 +1,23 @@
> +#!/bin/bash -eu
> +# SPDX-License-Identifier: Apache-2.0

Hmm. Aiui this line is supposed to make unnecessary ...

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

... all of this text, provided an entry is first put in ./LICENSES/.

> +################################################################################
> +
> +cd xen

This looks to suggest that the expectation is for the script to be invoked
from the root of a xen.git clone. Imo something like

cd $(dirname $0)/../../xen

would be more flexible.

> +./configure --disable-stubdom --disable-pvshim --disable-docs --disable-xen

Going forward we mean to no longer bundle e.g. qemu in release tarballs,
yet I wonder whether passing a couple of --with-system-...= here wouldn't
be better nevertheless.

> +make clang=y -C tools/include
> +make clang=y -C tools/fuzz/x86_instruction_emulator libfuzzer-harness

In how far is it a requirement to have "clang=y" here? Wasn't this question
even asked before? I'm not even sure whether mid- or long-term we mean to
retain that functionality. Overrides of tool chain (components) may better
be done using CC= and friends. Plus perhaps by whoever is invoking this
script?

Jan

