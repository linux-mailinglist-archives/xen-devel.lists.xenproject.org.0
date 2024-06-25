Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1938F916B47
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 16:57:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747886.1155409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM7bv-0007zu-Sd; Tue, 25 Jun 2024 14:57:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747886.1155409; Tue, 25 Jun 2024 14:57:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM7bv-0007yE-Ox; Tue, 25 Jun 2024 14:57:31 +0000
Received: by outflank-mailman (input) for mailman id 747886;
 Tue, 25 Jun 2024 14:57:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sC98=N3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sM7bv-0007Tg-73
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 14:57:31 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ee4519a-3303-11ef-90a3-e314d9c70b13;
 Tue, 25 Jun 2024 16:57:30 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2ebe785b234so62198491fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 07:57:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9eb2f045bsm82416265ad.53.2024.06.25.07.57.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jun 2024 07:57:29 -0700 (PDT)
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
X-Inumbo-ID: 3ee4519a-3303-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719327450; x=1719932250; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RcjHut3ba7UlZEfNOKRhl6HI5WDKYwGdWVqA7p7jfxU=;
        b=Y/xFLRgPndiDhg4IQw4NCwWQmxqXWeicATg98VwMdA3WBzPtiY93AJpcTpAyYZIJMs
         bcITyJNBCAkmQ/yOr0H3vg/SDdLXeImP8au6V+i1a4ctEqeTOp4ADe63bKwrcSP5G5nG
         CiUIKt4pUsqDFc61b/B1R0tkZ9/Hjm5XMBvIiR0ye4FN6MPxjSnPq/R8bKtUPtZxhZPw
         NNoKTEzHJx9kmjyCclXDrWu9i1Q95LLYwAPMRQJIT2qRQ13TwdzcG/KkjV5NkyprpuJj
         n+CTPMb+urDIeEde+nPHZ5PkVZ64kV6CV6ndL+/Xd4deM8xbr3z5dcQXDmR2dj/wVnsj
         sDOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719327450; x=1719932250;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RcjHut3ba7UlZEfNOKRhl6HI5WDKYwGdWVqA7p7jfxU=;
        b=Qlj1b/Knqu/Bb6pRb4IWT6HtbQb5LmZuWGYkbAhvtajP8tAPWSYSr0ES1wp6IevaHJ
         jO7ltg3pYFw2KyQeYCOiVCTjecWBM06HtoCoZ3n5B0o02AMZQtr4fE0WGSqHVzb6kSVH
         Z1MEX2ypI17BsHXmr5jKP29MjaOGxTRwkgzrif9tY0EXmzhpK4G9S2z9fUvbcACFfSBk
         0l4n3TJ1vIUv25k4uD2dhQtBTaB92RzE/+hMFZrwSxDaVvHhkWyXIrVbiN8InnJJX77A
         XBTzKVmrdtldCexp2a4KBGfPVG/8IiU9DEPAIdWj5jGIRUKAFielCP2QAq0UvYvT5PPe
         Fhzw==
X-Forwarded-Encrypted: i=1; AJvYcCVAvoh0SoMxt/gaM1ljg9ed4OircBPL2gHw0AHv32RdVgJfTYll9Q0LWv0+x+/A/ce8LMNGgrGo3fdxi6OmGAdkj41docdnP211BVnp+BI=
X-Gm-Message-State: AOJu0YyNotAFvgTV0E3rdpU3rU83rhicUt775OFf/Ml/TrCkGEeFwu7W
	jozIdkDh/t//22xRx4+3kCYFoXO8nef6l8EmsmR0UvUEN5i2WvRjozLoyzbz3w==
X-Google-Smtp-Source: AGHT+IHEDL9VznFTNvhb6457TbTO+Jb6EUd5nQybRNa22vbyoOpmk/NEg2twOLv9Wrt3vLOm4sBxDg==
X-Received: by 2002:a2e:96c4:0:b0:2ec:1f9f:a876 with SMTP id 38308e7fff4ca-2ec593101ebmr61641471fa.6.1719327449967;
        Tue, 25 Jun 2024 07:57:29 -0700 (PDT)
Message-ID: <0b362ff3-0df4-4ec3-b748-1aa9267b701a@suse.com>
Date: Tue, 25 Jun 2024 16:57:23 +0200
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
 <66a7243d-a1a1-4236-832f-f3e1daf11b85@suse.com>
 <CABfawhmAV5+Nr9A_Speh2ai3v9wfJtxmps=R6iTxNU1RFP4xRA@mail.gmail.com>
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
In-Reply-To: <CABfawhmAV5+Nr9A_Speh2ai3v9wfJtxmps=R6iTxNU1RFP4xRA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.06.2024 15:42, Tamas K Lengyel wrote:
> On Tue, Jun 25, 2024 at 9:18 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 25.06.2024 14:39, Tamas K Lengyel wrote:
>>> On Tue, Jun 25, 2024 at 7:40 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>>
>>>> On 25.06.2024 13:15, Tamas K Lengyel wrote:
>>>>> On Tue, Jun 25, 2024 at 5:17 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>>>>
>>>>>> On 21.06.2024 21:14, Tamas K Lengyel wrote:
>>>>>>> --- /dev/null
>>>>>>> +++ b/scripts/oss-fuzz/build.sh
>>>>>>> @@ -0,0 +1,22 @@
>>>>>>> +#!/bin/bash -eu
>>>>>>> +# Copyright 2024 Google LLC
>>>>>>> +#
>>>>>>> +# Licensed under the Apache License, Version 2.0 (the "License");
>>>>>>> +# you may not use this file except in compliance with the License.
>>>>>>> +# You may obtain a copy of the License at
>>>>>>> +#
>>>>>>> +#      http://www.apache.org/licenses/LICENSE-2.0
>>>>>>> +#
>>>>>>> +# Unless required by applicable law or agreed to in writing, software
>>>>>>> +# distributed under the License is distributed on an "AS IS" BASIS,
>>>>>>> +# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
>>>>>>> +# See the License for the specific language governing permissions and
>>>>>>> +# limitations under the License.
>>>>>>> +#
>>>>>>> +################################################################################
>>>>>>
>>>>>> I'm a little concerned here, but maybe I shouldn't be. According to what
>>>>>> I'm reading, the Apache 2.0 license is at least not entirely compatible
>>>>>> with GPLv2. While apparently the issue is solely with linking in Apache-
>>>>>> licensed code, I wonder whether us not having a respective file under
>>>>>> ./LICENSES/ (and no pre-cooked SPDX identifier to use) actually has a
>>>>>> reason possibly excluding the use of such code in the project.
>>>>>>
>>>>>>> +cd xen
>>>>>>> +./configure clang=y --disable-stubdom --disable-pvshim --disable-docs --disable-xen
>>>>>>> +make clang=y -C tools/include
>>>>>>> +make clang=y -C tools/fuzz/x86_instruction_emulator libfuzzer-harness
>>>>>>> +cp tools/fuzz/x86_instruction_emulator/libfuzzer-harness $OUT/x86_instruction_emulator
>>>>>>
>>>>>> In addition to what Julien said, I further think that filename / directory
>>>>>> name are too generic for a file with this pretty specific contents.
>>>>>
>>>>> I don't really get your concern here?
>>>>
>>>> The thing that is built is specifically a x86 emulator piece of fuzzing
>>>> binary. Neither the directory name nor the file name contain either x86
>>>> or (at least) emul.
>>>
>>> Because this build script is not necessarily restricted to build only
>>> this one harness in the future. Right now that's the only one that has
>>> a suitable libfuzzer harness, but the reason this build script is here
>>> is to be easily able to add additional fuzzing binaries without the
>>> need to open PRs on the oss-fuzz repo, which as I understand no one
>>> was willing to do in the xen community due to the CLA. Now that the
>>> integration is going to be in oss-fuzz, the only thing you have to do
>>> in the future is add more stuff to this script to get fuzzed. Anything
>>> that's compiled with libfuzzer and copied to $OUT will be picked up by
>>> oss-fuzz automatically. Makes sense?
>>
>> It does, yes. Yet nothing like that was said in the description. How
>> should anyone have known there are future possibilities with this script?
> 
> Apologies, to me "The build integration script for oss-fuzz targets."
> was sufficiently descriptive but it may require some familiarity with
> oss-fuzz to get. I can certainly add the above text to the commit
> message if that helps.

Yes please, or and abridged variant thereof.

Jan

