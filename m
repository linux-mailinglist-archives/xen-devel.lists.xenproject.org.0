Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F32849168AD
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 15:18:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747687.1155152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM63b-0006zh-DF; Tue, 25 Jun 2024 13:17:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747687.1155152; Tue, 25 Jun 2024 13:17:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM63b-0006xn-Ae; Tue, 25 Jun 2024 13:17:59 +0000
Received: by outflank-mailman (input) for mailman id 747687;
 Tue, 25 Jun 2024 13:17:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sC98=N3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sM63a-0006xf-7c
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 13:17:58 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55e35275-32f5-11ef-b4bb-af5377834399;
 Tue, 25 Jun 2024 15:17:56 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2ebe40673d8so62413171fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 06:17:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7068998497esm3452105b3a.15.2024.06.25.06.17.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jun 2024 06:17:55 -0700 (PDT)
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
X-Inumbo-ID: 55e35275-32f5-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719321476; x=1719926276; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bv6zRyWZDi+Xzi9ZgVEmKskG6R6plvviwberHPEumf4=;
        b=cxgkFZhysg3SEGeEuCU0WlS5laYSFnwU7GNnHalMv/Bte2/kQXrLKK4T/PVItb1Sm/
         d2+dXXw5D6W2phBBxjYClafT5zaUHohbGMU+43RVF2gLOE8IT0ltH1QcwGcd8SMskgPt
         mjakfowoW/tkZJW38uLlXRgAreQz9rbc0IkLdypfDhlHAbvs+zhKugmmLPAAj1yfQ/mS
         UbiqIoglu7WmwfdEsNU9EYURr13HnA/TW+oeHE+R45yueWM2iQFpO5ldvKtbGJLQ9Nd7
         H23ppu5kcFQWSPRiyhZayqvT4BZ7iyHljKRE8UDDPh17SKXRWlKjiKcaiws4O/v0dTph
         V8GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719321476; x=1719926276;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bv6zRyWZDi+Xzi9ZgVEmKskG6R6plvviwberHPEumf4=;
        b=QheSwEQ+yq/14llLuN8gPTqbiaAm915mvm8oKyxQDUDlNFB+DLCDnLugkLR20guhF7
         2iCl8X9obJbl2v4v83cYiMjdOuUhq3n7XdnjNqnr3jiQweglOlnqVbKjYmDaEWJBT+XW
         pNQjt1GgxOfhPjEMWjn2OYwbTqggoA63NlhqFoncGIS3HhTk7xjalcsNhx9Cq70cI82Y
         qyS37UQ4GeaORPLcReQLDwe6EHeUBTuyGyuGkChnEGwdVKSlhxtUQD1HQDUM4T4EYk6P
         Qjp3Gz8Hv5yVPQTNWnAaOMgXDkFv4GZjrDSEhx2Xk8hET12ijR1zduGQou4GKAU3jyF1
         Jtsw==
X-Forwarded-Encrypted: i=1; AJvYcCXiFBuGgho58vWpR84CDhw/qLyk5f22XdUx1cs9DE8v6nfp2Km9YkfH75Xnr9L3s41XuSodWHKkOCqq07BUmPrBXsRTaDrMxCzzTp6oMCQ=
X-Gm-Message-State: AOJu0YxyydjRuPQrSeXb9y2rRzuvArTa3nyS6/W7bSgk5j30e4OpisZn
	bYJh/axe0sL9tag7Jk+lses7BFZKgWNpm5c0DPBtOdCG8fK0MwAAYc5Sp+gfsw==
X-Google-Smtp-Source: AGHT+IGVOOghhqO53d9sReemg2y/BzisVqzszO26bakd0emcnmrpgV9JZcNF09liM71oVr49C4F/NQ==
X-Received: by 2002:a2e:9516:0:b0:2ec:4eca:7487 with SMTP id 38308e7fff4ca-2ec5b338b5fmr37697011fa.20.1719321475589;
        Tue, 25 Jun 2024 06:17:55 -0700 (PDT)
Message-ID: <66a7243d-a1a1-4236-832f-f3e1daf11b85@suse.com>
Date: Tue, 25 Jun 2024 15:17:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] Add scripts/oss-fuzz/build.sh
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240621191434.5046-1-tamas@tklengyel.com>
 <20240621191434.5046-2-tamas@tklengyel.com>
 <0a7854e0-e01e-435e-95fe-b262cc4afc1e@suse.com>
 <CABfawhmkhCD-MFgZBrhJ1CwiiseotJ=+MANbgwsjRL_VYsnuTQ@mail.gmail.com>
 <b9b84f10-6d41-48d9-996d-069408753e28@suse.com>
 <CABfawhkJ0t8FenCWbupGcHD-ZhorbWN7ZjMQVm-jeg_zA1g5iQ@mail.gmail.com>
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
In-Reply-To: <CABfawhkJ0t8FenCWbupGcHD-ZhorbWN7ZjMQVm-jeg_zA1g5iQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.06.2024 14:39, Tamas K Lengyel wrote:
> On Tue, Jun 25, 2024 at 7:40 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 25.06.2024 13:15, Tamas K Lengyel wrote:
>>> On Tue, Jun 25, 2024 at 5:17 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>>
>>>> On 21.06.2024 21:14, Tamas K Lengyel wrote:
>>>>> --- /dev/null
>>>>> +++ b/scripts/oss-fuzz/build.sh
>>>>> @@ -0,0 +1,22 @@
>>>>> +#!/bin/bash -eu
>>>>> +# Copyright 2024 Google LLC
>>>>> +#
>>>>> +# Licensed under the Apache License, Version 2.0 (the "License");
>>>>> +# you may not use this file except in compliance with the License.
>>>>> +# You may obtain a copy of the License at
>>>>> +#
>>>>> +#      http://www.apache.org/licenses/LICENSE-2.0
>>>>> +#
>>>>> +# Unless required by applicable law or agreed to in writing, software
>>>>> +# distributed under the License is distributed on an "AS IS" BASIS,
>>>>> +# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
>>>>> +# See the License for the specific language governing permissions and
>>>>> +# limitations under the License.
>>>>> +#
>>>>> +################################################################################
>>>>
>>>> I'm a little concerned here, but maybe I shouldn't be. According to what
>>>> I'm reading, the Apache 2.0 license is at least not entirely compatible
>>>> with GPLv2. While apparently the issue is solely with linking in Apache-
>>>> licensed code, I wonder whether us not having a respective file under
>>>> ./LICENSES/ (and no pre-cooked SPDX identifier to use) actually has a
>>>> reason possibly excluding the use of such code in the project.
>>>>
>>>>> +cd xen
>>>>> +./configure clang=y --disable-stubdom --disable-pvshim --disable-docs --disable-xen
>>>>> +make clang=y -C tools/include
>>>>> +make clang=y -C tools/fuzz/x86_instruction_emulator libfuzzer-harness
>>>>> +cp tools/fuzz/x86_instruction_emulator/libfuzzer-harness $OUT/x86_instruction_emulator
>>>>
>>>> In addition to what Julien said, I further think that filename / directory
>>>> name are too generic for a file with this pretty specific contents.
>>>
>>> I don't really get your concern here?
>>
>> The thing that is built is specifically a x86 emulator piece of fuzzing
>> binary. Neither the directory name nor the file name contain either x86
>> or (at least) emul.
> 
> Because this build script is not necessarily restricted to build only
> this one harness in the future. Right now that's the only one that has
> a suitable libfuzzer harness, but the reason this build script is here
> is to be easily able to add additional fuzzing binaries without the
> need to open PRs on the oss-fuzz repo, which as I understand no one
> was willing to do in the xen community due to the CLA. Now that the
> integration is going to be in oss-fuzz, the only thing you have to do
> in the future is add more stuff to this script to get fuzzed. Anything
> that's compiled with libfuzzer and copied to $OUT will be picked up by
> oss-fuzz automatically. Makes sense?

It does, yes. Yet nothing like that was said in the description. How
should anyone have known there are future possibilities with this script?

Jan

