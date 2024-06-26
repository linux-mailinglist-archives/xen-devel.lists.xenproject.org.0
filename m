Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D7991856C
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 17:12:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749145.1157167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMUJX-0001Wo-DW; Wed, 26 Jun 2024 15:12:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749145.1157167; Wed, 26 Jun 2024 15:12:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMUJX-0001UY-Aa; Wed, 26 Jun 2024 15:12:03 +0000
Received: by outflank-mailman (input) for mailman id 749145;
 Wed, 26 Jun 2024 15:12:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sMUJV-0001US-EA
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 15:12:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sMUJV-0001MX-7u; Wed, 26 Jun 2024 15:12:01 +0000
Received: from [15.248.3.89] (helo=[10.24.67.25])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sMUJV-00027W-0o; Wed, 26 Jun 2024 15:12:01 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=YrtY+XUknKG4Rl78En6BHKtQzOEjyF+mQuFIWuRoS/s=; b=wGiDU+M0FY3jCCLJEX+dYsrOWM
	NeDbyfgLVPtrgP2FNMiN8tKEa/lMFZJTpyFFlivBJjnXeSlOV4SNwVWXVoMVC43lrHmsDRvFtw7Gx
	P/exYtyXGrOecFVKmtC8mFD6ZZO5wVjZ7L3pdkjS1We9SKfMg0MYNIPE/Yb7op+1Qr+c=;
Message-ID: <431cabe9-345d-48d9-bb9c-ad412cf3430f@xen.org>
Date: Wed, 26 Jun 2024 16:11:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] Add scripts/oss-fuzz/build.sh
Content-Language: en-GB
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20240621191434.5046-1-tamas@tklengyel.com>
 <20240621191434.5046-2-tamas@tklengyel.com>
 <6f94d071-f90f-485d-a8aa-a0c8a726ce34@xen.org>
 <CABfawhkCJv1oQ4+_bBHf_ys1=gtmFVT-Zn7UeYDLaSm9KQqgcA@mail.gmail.com>
 <9b6819fd-fd76-4249-b1f9-5afb372dd1e1@xen.org>
 <CABfawhmeOn0g2y40_AxRcXQe9EMNJyXhqVtg9OoAYVSHwM37fQ@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CABfawhmeOn0g2y40_AxRcXQe9EMNJyXhqVtg9OoAYVSHwM37fQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Tamas,

On 26/06/2024 14:20, Tamas K Lengyel wrote:
> On Wed, Jun 26, 2024 at 8:41 AM Julien Grall <julien@xen.org> wrote:
>>
>> Hi Tamas,
>>
>> On 24/06/2024 23:18, Tamas K Lengyel wrote:
>>> On Mon, Jun 24, 2024 at 5:58 PM Julien Grall <julien@xen.org> wrote:
>>>>
>>>> Hi,
>>>>
>>>> On 21/06/2024 20:14, Tamas K Lengyel wrote:
>>>>> The build integration script for oss-fuzz targets.
>>>>
>>>> Do you have any details how this is meant and/or will be used?
>>>
>>> https://google.github.io/oss-fuzz/getting-started/new-project-guide/#buildsh
>>>
>>>>
>>>> I also couldn't find a cover letter. For series with more than one
>>>> patch, it is recommended to have one as it help threading and could also
>>>> give some insight on what you are aiming to do.
>>>>
>>>>>
>>>>> Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
>>>>> ---
>>>>>     scripts/oss-fuzz/build.sh | 22 ++++++++++++++++++++++
>>>>>     1 file changed, 22 insertions(+)
>>>>>     create mode 100755 scripts/oss-fuzz/build.sh
>>>>>
>>>>> diff --git a/scripts/oss-fuzz/build.sh b/scripts/oss-fuzz/build.sh
>>>>> new file mode 100755
>>>>> index 0000000000..48528bbfc2
>>>>> --- /dev/null
>>>>> +++ b/scripts/oss-fuzz/build.sh
>>>>
>>>> Depending on the answer above, we may want to consider to create the
>>>> directory oss-fuzz under automation or maybe tools/fuzz/.
>>>
>>> I'm fine with moving it wherever.
>>
>> What about tools/fuzz then? This is where are all the tooling for the
>> fuzzing.
>>
>>>
>>>>
>>>>> @@ -0,0 +1,22 @@
>>>>> +#!/bin/bash -eu
>>>>> +# Copyright 2024 Google LLC
>>>>
>>>> I am a bit confused with this copyright. Is this script taken from
>>>> somewhere?
>>>
>>> Yes, I took an existing build.sh from oss-fuzz,
>>
>> It is unclear to me what is left from that "existing" build.sh. At least
>> everything below seems to be Xen specific.
>>
>> Anyway, if you want to give the copyright to Google then fair enough,
>> but I think you want to use an Origin tag (or similar) to indicate the
>> original copy.
>>
>>>   it is recommended to
>>> have the more complex part of build.sh as part of the upstream
>>> repository so that additional targets/fixes can be merged there
>>> instead of opening PRs on oss-fuzz directly. With this setup the
>>> build.sh I merge to oss-fuzz will just just this build.sh in the Xen
>>> repository. See
>>> https://github.com/tklengyel/oss-fuzz/commit/552317ae9d24ef1c00d87595516cc364bc33b662.
>>>
>>>>
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
>>>>> +
>>>>> +cd xen
>>>>> +./configure clang=y --disable-stubdom --disable-pvshim --disable-docs --disable-xen
>>>>
>>>> Looking at the help from ./configure, 'clang=y' is not mentioned and it
>>>> doesn't make any difference in the config.log. Can you clarify why this
>>>> was added?
>>>
>>> Just throwing stuff at the wall till I was able to get a clang build.
>>> If it's indeed not needed I can remove it.
>>>
>>>>
>>>>> +make clang=y -C tools/include
>>>>> +make clang=y -C tools/fuzz/x86_instruction_emulator libfuzzer-harness
>>>>> +cp tools/fuzz/x86_instruction_emulator/libfuzzer-harness $OUT/x86_instruction_emulator
>>>>
>>>> Who will be defining $OUT?
>>>
>>> oss-fuzz
>>
>> Ok. Can you add a link to the documentation in build.sh? This would be
>> helpful for the future reader to understand what's $OUT really mean.
> 
> Sure, it turns out there is already a README.oss-fuzz in tools/fuzz
> that points to the oss-fuzz so I don't think there is anything else
> needed here, 

Perfect. I am fine with that.

Cheers,

-- 
Julien Grall

