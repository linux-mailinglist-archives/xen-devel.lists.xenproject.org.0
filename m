Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 455BEB0A199
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 13:08:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1048511.1418737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucixL-0003ai-1E; Fri, 18 Jul 2025 11:08:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1048511.1418737; Fri, 18 Jul 2025 11:08:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucixK-0003Yd-Ur; Fri, 18 Jul 2025 11:08:46 +0000
Received: by outflank-mailman (input) for mailman id 1048511;
 Fri, 18 Jul 2025 11:08:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Achr=Z7=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1ucixJ-0003V6-DI
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 11:08:45 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9106cc61-63c7-11f0-b894-0df219b8e170;
 Fri, 18 Jul 2025 13:08:43 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 5AB544EE3C3D;
 Fri, 18 Jul 2025 13:08:42 +0200 (CEST)
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
X-Inumbo-ID: 9106cc61-63c7-11f0-b894-0df219b8e170
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1752836922;
	b=kRQWgw/bnSkltbyqQuT0cKjTWIEeFGjgq7kP4oeB9po0Fyo0xcpU28juPagBkfE2tr2i
	 X0EKDwVKlA0TwFSZeXRqXJMLbCEpgh+RsIRCAE5Tu4QBA8ll9LOCsQ7aRF3hFMbZBua/U
	 mtUvIFbpbpKlu1FFooHEqrFz1ZHlf6knPm8NZYKKtnuxFm95kj5IoyFqvbjBlToOYoMVs
	 ICc0049AgibQKRaCKLl8RX1+KxbtgRtxYU9RESpSyIY0KBiWKIO9nqFz4ZACf4lG6T+ab
	 JIjSmSOoxHV5pzT7fPsOWI6oEtOeTctZSEupzqgzlqICtBIYzIeLEPlHVlyKAcjV/mAvH
	 eEaWsN7YnZGrRvsTR80rbqSDYQpfdDXxXXObc0FKtxAOkFc4Nul/Y74WQ08dm2MTyZSFb
	 n5u3afiigT3L/CgW9Vv2LMR4LCcquxuZ0fuiaESO/AJAgrIBivXPYCZUXV7QU424G+fMD
	 VouA5HPsOCSV2B4bKU1jmYEtJt1OQTDRZLeJvhOziJ7BDYLSXPeHQr8XX/7sa+EZbKDOD
	 aMSdXkJE15GHHU75c7/DsoUU99qCq5FwjUuj9v+3KL9hBEX5OVrbzXXjeDopsjV4Yn496
	 fqmeZiEP4uICFXI/tRHuw4tiAZ4Ei/RxudBOdpsdSiZDfVoUblCyNw75Dr9RSHE=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1752836922;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=0d1nOfeve6wJcOeXViWzw8ZmgfRHSzOZNEaSx5Q4YTs=;
	b=M7rJHF7EBoXgHmjSuyrr2HuN787BaNoQleE8D8cw/Kni8CCDJvB9jwwwyFVMbPk2iWEi
	 1S//8HGroWn5kg+YCUfZBoD3hnPpA7ZhAsqPSxu5mL26BmEN1zUcB4QoiJdprTvz/t6cw
	 eI6X4RGc3zmQcuK7zzDl8nSJeZSruYc+7zgCwtZKcRF/oR7ega+ZYVc2i4HLXuJDZ9LEW
	 CCU0XOu4vPYfpZAuLHTUC3gr/eSMtqTJZD8WDZ7Rg+EDQIbACkJO2cTdXphh04yj+QWrY
	 Ri3pYt5q3In5+fHDF8s06A1R/7lZPQCp5p+z4maXKZ4DR0EbOaDF5Frw4ky8Lk1uVWWRS
	 crbFtv2LvQKE9nV5j0FIE9auQcn6hyxqjGAHUPjg8Z+SsxjWCWfwlmuJoGHkMzP786pkV
	 /TuMTKtmk1rCI9McC5fb18QGrrgVDOr3cSGOVYDQQmN+Sqd63xNwzpnHudsZUrjpGW3Yu
	 BQg1N93Z4VuY/yAbV3xULKSO8MxpfgRruidC7AK+2jw7wGCmc4SPpFcpw75Sv6kZCTatZ
	 9hprvJEz9YSqKi4xa+YspTXzrkrYhUEg4QkAzzGRAELWcvCKlbEv+1ZT2YjIqNlb7T5y5
	 K9nbaX4DOaqjKhAiEZVVOHtFucVrXNQ9YKduQsta3HnmBhWnOvFDeOGr9Z2rjSs=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1752836922; bh=BN4SWkZczzxjs/e/rRTv2d5a1HDkkD+q2GUUqGwXjnY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hKEobAEN4dR+kkmIdKoJa7cj6IdxIKCJ6agNf6z1NKfF9LvyQrajxZPES7OdHPZrD
	 /HyjL7Am/OpPnmVq6yxoMQ9ezDTcVRa0b0f1w/1Qo+HPXXh24cYKrVv4fRjyt0b1/T
	 VrEhRbIu3tOmM4RpfPYRbnncKG3Bijq4SSc26GgACc+KEcAmFt+DmRB2MbZ8Z3wX/T
	 qUd9fihdQQ+osN//0bsPbLrXD8GKspBX9AuLea+PccF2f68ei4J6DB6arHspOSoJwb
	 pSPRglqDCwhQ7XelKK3wOs+YCuLlgXtn18EfaKdSdbN/zLAh5leFEw4deOc8BmYKCN
	 d7ty4bYOE2rGg==
MIME-Version: 1.0
Date: Fri, 18 Jul 2025 13:08:42 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 victorm.lira@amd.com, Federico Serafini <federico.serafini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH v1] misra: add deviation for rules 21.1 and 21.2
In-Reply-To: <ca61bfc1-2b22-4c42-b03d-7e05588aac0c@epam.com>
References: <9e1210f2a9c794d68dcc6b897239b228b141296a.1745427770.git.victorm.lira@amd.com>
 <f1d1dbe4-5b62-4540-a480-afa6045d9622@epam.com>
 <39114395-5aa0-4c4a-a0b9-f151c6976674@suse.com>
 <078093af-1581-44e8-97f0-82561bfd06a5@epam.com>
 <ca61bfc1-2b22-4c42-b03d-7e05588aac0c@epam.com>
Message-ID: <f3e56c3fc9bf8351f253bb988138ed57@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-07-18 11:28, Dmytro Prokopchuk1 wrote:
> On 7/18/25 12:17, Dmytro Prokopchuk wrote:
>> 
>> 
>> On 7/18/25 08:31, Jan Beulich wrote:
>>> On 17.07.2025 22:47, Dmytro Prokopchuk1 wrote:
>>>> 
>>>> 
>>>> On 4/23/25 20:54, victorm.lira@amd.com wrote:
>>>>> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>>> 
>>>>> MISRA C Rules 21.1 ("#define and #undef shall not be used on a
>>>>> reserved identifier or reserved macro name") and R21.2 ("A reserved
>>>>> identifier or reserved macro name shall not be declared") 
>>>>> violations
>>>>> are not problematic for Xen, as it does not use the C or POSIX
>>>>> libraries.
>>>>> 
>>>>> Xen uses -fno-builtin and -nostdinc to ensure this, but there are 
>>>>> still
>>>>> __builtin_* functions from the compiler that are available so
>>>>> a deviation is formulated for all identifiers not starting with
>>>>> "__builtin_".
>>>>> 
>>>>> The missing text of a deviation for Rule 21.2 is added to
>>>>> docs/misra/deviations.rst.
>>>>> 
>>>>> To avoid regressions, tag both rules as clean and add them to the
>>>>> monitored set.
>>>>> 
>>>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>>>>> Signed-off-by: Victor Lira <victorm.lira@amd.com>
>>>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>>>> ---
>>>>> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>> Cc: Anthony PERARD <anthony.perard@vates.tech>
>>>>> Cc: Michal Orzel <michal.orzel@amd.com>
>>>>> Cc: Jan Beulich <jbeulich@suse.com>
>>>>> Cc: Julien Grall <julien@xen.org>
>>>>> Cc: Roger Pau Monné <roger.pau@citrix.com>
>>>>> Cc: Stefano Stabellini <sstabellini@kernel.org>
>>>>> Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>>> Cc: Federico Serafini <federico.serafini@bugseng.com>
>>>>> Cc: Bertrand Marquis <bertrand.marquis@arm.com>
>>>>> ---
>>>>>    .../eclair_analysis/ECLAIR/deviations.ecl     |  9 ++++++-
>>>>>    .../eclair_analysis/ECLAIR/monitored.ecl      |  2 ++
>>>>>    automation/eclair_analysis/ECLAIR/tagging.ecl |  2 ++
>>>>>    docs/misra/deviations.rst                     | 26 
>>>>> ++++++++++++++
>>>>> ++++-
>>>>>    4 files changed, 37 insertions(+), 2 deletions(-)
>>>>> 
>>>>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/
>>>>> automation/eclair_analysis/ECLAIR/deviations.ecl
>>>>> index 2c8fb92713..ffa23b53b7 100644
>>>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>>> @@ -639,8 +639,15 @@ in the expansion."
>>>>>    # Series 21.
>>>>>    #
>>>>> 
>>>>> +-doc_begin="Xen does not use C and POSIX libraries:
>>>>> +identifiers reserved by these libraries can be used safely, except
>>>>> for those
>>>>> +beginning with '__builtin_'."
>>>>> +-config=MC3A2.R21.1,macros={safe, "!^__builtin_.*$"}
>>>>> +-config=MC3A2.R21.2,declarations={safe, "!^__builtin_.*$"}
>>>>> +-doc_end
>>>>> +
>>>>>    -doc_begin="or, and and xor are reserved identifiers because 
>>>>> they
>>>>> constitute alternate
>>>>> -spellings for the corresponding operators (they are defined as
>>>>> macros by iso646.h).
>>>>> +spellings for the corresponding logical operators (as defined in
>>>>> header 'iso646.h').
>>>>>    However, Xen doesn't use standard library headers, so there is 
>>>>> no
>>>>> risk of overlap."
>>>>>    -config=MC3A2.R21.2,reports+={safe,
>>>>> "any_area(stmt(ref(kind(label)&&^(or|and|xor|not)$)))"}
>>>>>    -doc_end
>>>>> diff --git a/automation/eclair_analysis/ECLAIR/monitored.ecl b/
>>>>> automation/eclair_analysis/ECLAIR/monitored.ecl
>>>>> index 8351996ec8..da229a0d84 100644
>>>>> --- a/automation/eclair_analysis/ECLAIR/monitored.ecl
>>>>> +++ b/automation/eclair_analysis/ECLAIR/monitored.ecl
>>>>> @@ -79,6 +79,8 @@
>>>>>    -enable=MC3A2.R20.12
>>>>>    -enable=MC3A2.R20.13
>>>>>    -enable=MC3A2.R20.14
>>>>> +-enable=MC3A2.R21.1
>>>>> +-enable=MC3A2.R21.2
>>>>>    -enable=MC3A2.R21.3
>>>>>    -enable=MC3A2.R21.4
>>>>>    -enable=MC3A2.R21.5
>>>>> diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/
>>>>> automation/eclair_analysis/ECLAIR/tagging.ecl
>>>>> index 1d078d8905..3292bf751e 100644
>>>>> --- a/automation/eclair_analysis/ECLAIR/tagging.ecl
>>>>> +++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
>>>>> @@ -88,6 +88,8 @@ MC3A2.R20.11||
>>>>>    MC3A2.R20.12||
>>>>>    MC3A2.R20.13||
>>>>>    MC3A2.R20.14||
>>>>> +MC3A2.R21.1||
>>>>> +MC3A2.R21.2||
>>>>>    MC3A2.R21.3||
>>>>>    MC3A2.R21.4||
>>>>>    MC3A2.R21.5||
>>>>> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
>>>>> index fe0b1e10a2..88328eaa8a 100644
>>>>> --- a/docs/misra/deviations.rst
>>>>> +++ b/docs/misra/deviations.rst
>>>>> @@ -587,7 +587,31 @@ Deviations related to MISRA C:2012 Rules:
>>>>>           construct is deviated only in Translation Units that
>>>>> present a violation
>>>>>           of the Rule due to uses of this macro.
>>>>>         - Tagged as `deliberate` for ECLAIR.
>>>>> -
>>>>> +
>>>>> +   * - R21.1
>>>>> +     - Rule 21.1 reports identifiers reserved for the C and POSIX
>>>>> standard
>>>>> +       libraries. Xen does not use such libraries and all
>>>>> translation units
>>>>> +       are compiled with option '-nostdinc', therefore there is no
>>>>> reason to
>>>>> +       avoid to use `#define` or `#undef` on such identifiers
>>>>> except for those
>>>>> +       beginning with `__builtin_` for which compilers may perform
>>>>> (wrong)
>>>>> +       optimizations.
>>>>> +     - Tagged as `safe` for ECLAIR.
>>>>> +
>>>>> +   * - R21.2
>>>>> +     - Rule 21.2 reports identifiers reserved for the C and POSIX
>>>>> standard
>>>>> +       libraries. Xen does not use such libraries and all
>>>>> translation units
>>>>> +       are compiled with option '-nostdinc', therefore there is no
>>>>> reason to
>>>>> +       avoid declaring such identifiers except for those beginning
>>>>> with
>>>>> +       `__builtin_` for which compilers may perform (wrong)
>>>>> optimizations.
>>>>> +     - Tagged as `safe` for ECLAIR.
>>>>> +
>>>>> +   * - R21.2
>>>>> +     - `or`, `and` and `xor` are reserved identifiers because they
>>>>> constitute
>>>>> +       alternate spellings for the corresponding logical operators
>>>>> +       (as defined in Standard Library header `\<iso646.h\>`). Xen
>>>>> does not use
>>>>> +       Standard library headers, so there is no risk of overlap.
>>>>> +     - Tagged as `safe` for ECLAIR.
>>>>> +
>>>>>       * - R21.9
>>>>>         - Xen does not use the `bsearch` and `qsort` functions
>>>>> provided by the C
>>>>>           Standard Library, but provides in source form its own
>>>>> implementation,
>>>>> --
>>>>> 2.47.0
>>>> 
>>>> Hello All!
>>>> 
>>>> I tried to play with Rule 21.1 deviations.
>>>> 
>>>> After applying the following configurations:
>>>> 
>>>> -config=MC3A2.R21.1,macros+={safe, "^offsetof$ || ^(is|to)[a-z]+$ ||
>>>> name(NULL) || name(bool) || name(true) || name(false)"}
>>>> -config=MC3A2.R21.1,macros+={safe,
>>>> "loc(file(^xen/include/xen/inttypes\\.h$))"}
>>>> -config=MC3A2.R21.1,macros+={safe, "loc(file(^xen/include/xen/types\
>>>> \.h$))"}
>>>> -config=MC3A2.R21.1,macros+={safe, "^str[a-z]+$ || ^(v)?sprintf$ ||
>>>> ^va_[a-z]+$"}
>>> 
>>> Can you spell these out in words? I can only vaguely interpret these
>>> Eclair
>>> patterns, sorry.
>> Yes, sure.
>> 
>> That means to deviate the following macros:
>> - offsetof
>> - begin with either ‘is’ or ‘to’ followed by a lowercase letters
>> (islower, isdigit, tolower, toupper, etc.)
>> - NULL
>> - bool
>> - true
>> - false
>> - all PRI/SCN macros for printing/scanning format specifiers from 
>> header
>> file xen/include/xen/inttypes.h
>> - all macros from header file xen/include/xen/types.h (limits:
>> UINT8_MAX, INT_MAX, LONG_MIN, etc.)
>> - begin with 'str' followed by a lowercase letters (string functions)
>> - sprintf/vsprintf
>> - begin with 'va_' followed by a lowercase letters (va_copy, va_start,
>> va_end, va_arg)
>> 
>>> 
>>>> Eclair showed 699 remaining violations.
>>>> All of them were related to names beginning with an underscore (_).
>>>> 
>>>> It's possible to resolve the rest of them with help of (all, except 
>>>> for
>>>> those beginning with '__builtin_' and '__x86_64__'):
>>>> 
>>>> -config=MC3A2.R21.1,macros+={safe, "^_.*$ && !^__builtin_.*$ &&
>>>> !^__x86_64__$"}
>>>> 
>>>> Probably, the exception list can be extended.
>>>> 
>>>> Jan,
>>>> I know you don't want to disallow "_all_" such reserved identifiers.
>>>> But how to deal with that?
>>> 
>>> How do I not want this? I've been arguing for years that we should
>>> respect
>>> the reserved name spaces. (Did you perhaps mean "... you don't want 
>>> to
>>> deviate ..."?) There are exceptions, yes, e.g. ...
>>> 
>> Yes, I meant about deviations. Sorry.
>> 
>>>> Try to cover all macros? Like this, for example (I assume that there 
>>>> are
>>>> no such reserved macros):
>>>> -config=MC3A2.R21.1,macros+={safe, "^.*XEN.*$ || ^.*HYPERVISOR.*$"}
>>> 
>>> ... anything we may have (wrongly) introduced into the public 
>>> headers. We
>>> can't very well change naming there.
>> Looks like the only way is to deviate all macros (that are currently
>> used in Xen), tag rule as "clean" and prohibit using reserved names in
>> the future.
>> 
>> Any suggestions?
>> 
>> Dmytro
> 
> BTW, not all violations are in public headers.
> Probably, they could be fixed in code.
> But the number of them is huge...
> 

This is precisely the issue I was pointing out when you offered to 
respin this patch. Yes, Xen could fix those rather than deviate, but the 
sheer number of violations makes this in my opinion unfeasible.

> Dmytro
> 
>> 
>>> 
>>> Jan

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

