Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9160BA9EA54
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 10:09:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970243.1358981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9JYl-0005kV-6A; Mon, 28 Apr 2025 08:09:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970243.1358981; Mon, 28 Apr 2025 08:09:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9JYl-0005hR-3V; Mon, 28 Apr 2025 08:09:51 +0000
Received: by outflank-mailman (input) for mailman id 970243;
 Mon, 28 Apr 2025 08:09:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jkfC=XO=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1u9JYj-0005hL-8T
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 08:09:49 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1de3ac95-2408-11f0-9ffb-bf95429c2676;
 Mon, 28 Apr 2025 10:09:33 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 073DC4EE3BF6;
 Mon, 28 Apr 2025 10:09:32 +0200 (CEST)
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
X-Inumbo-ID: 1de3ac95-2408-11f0-9ffb-bf95429c2676
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1745827772;
	b=zIccB85bktTzSnPDowmOWN4MSfqDRx6HZLnohJgUMyCmeXEtKkSdZM2tZqNcB1bAQTR2
	 Ec3iEzQU1+QyczApt+A3zhKb/e2jPIRNVvDDAER9yqt8o20srMctpjc1SrvMEqDxookKj
	 sg1Htp1ViK8kQXbxv80KvoA2yJYepJME01fMuV8vgJup+zk3OYVBRgTuoJ8OtBQqLkxNt
	 2EPYIKvAsbLcxgjFjD6E9oFtmsYNxgaumER9tOB8Gjtz3bx/tn22b6b86oc2dy2MffBwy
	 FQci3F1GV3M89Cad4C86+a478WtD8wiRs2DlPyDIEIEGoRree9dHqcStmGBRNJEHY0Km9
	 y3GLGAVYc0SorMbmmPasnfnDXWBcZiUil2bExfz7XqQZtFi62aOI/inOf1Uffw+ob6ZEE
	 tVkFemJwWZiiCiMy05NaieK/2pCZg/7SXcZZ2rNQPnwPa8eqoS+WhbpupLRqnZh//lWAi
	 yZ+ZueaprsbeLd4EEOMgY66yWzZ2eUzVwhpPyGbV3HK/aqEMLgwEO69+K+45L/v+JoMXR
	 eRCan+nCmcE4In8Smv9ddZxUpQpd3ck1sVoAvhleCe2dOAmlFASODelQUsg9C1rJbiFIm
	 ORKSwcGHLJVlwrTGWVNFKPPOfH+2Ko0KQTeTlz8I0zvjgnY10YwMQp7Vq3l/Mlw=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1745827772;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=5b9rIaHsBEMgET7/OtbvnYHK9PMh8spD8IAyFhEOSeI=;
	b=SOUQ5boc2VEPNH/6N3rkshlaIJpyolmdin9hi8VPHlPin+VHkGbZnKedKcnbE2jRteuL
	 k725seoLbbeC7YOwqk0AbJX7dqwsRic5Z+Ew95HgH1GprWLCcehyvQ16Rqha9oIg24xd3
	 v6v9aoHOwevRBltEvnJufudmRrldlvIbMImAWoqa8/A+1woGtQ6j3+ffxvKIvA/8y5XtD
	 QCH1AKFkOtFKImU7l40m5kLzcQJo3CJucT3HPHMMlP1MujMWgOca+2XByuYfU8yM6uqj4
	 +kUGbkUrhkAfUu5HzR6swg3yGzhW6sqvDYAxYmy94vwP99It8YxDO3txV62l4qkWdgQWM
	 /xtdHYY9hZEEFs47bKt/7DC5xwCa9i0TbO9+otY7il4OABlfxj1VUoaEWg8t81U/UV70d
	 xbPXuseRKNcrcPXaiZy8sXOi5getrMWwrWW+ZmrO/y+9kOFUPHc0KQVLMAESS5rpscn2t
	 27mlrdmpP6/ExcrN7rf5fosU17Kj19AE9wZ3IKzgrqKOOIDoa4UY2a7H0y+4SpkDjBI7d
	 4k4sqlk0tFcVzZG8+UDaVqLamGxO+eVTTiOctF13D2s2pT1g1pgUmZhbOvz4RPLWT8BGD
	 MCSQdVD8DMKmmohnCEEmqVUUm4vSOZs2zVV0MJ9xjPnpd42kvqVqRWCCG+pSDV8=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1745827772; bh=JzMJRDXX9cYzQSnQeMmypGV+wWv+n9FTx72bbJYFzsY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qpx1qZaPdIWAICJAvNPjaiTbZKH/KQkKkynEMklIs3yZ+WnacSR3TZX1zST4rFgfy
	 1hHfSYKI1TQULJR5kDoTboXr2ytQQcXz3V/VJlmtC4L4+KIR1ibBhKt0Wjmzy02L5y
	 Go9S71SWTwHNLBVqJb2+IEPWO3iiEH8WTWaKm2nC1bg0fseBoRhGtYAtbMrFzS3/RH
	 WRniJLIe/tX5LwjrNDS4UrzzobkhUnLG+1ijf42QFO8QejxdkSI+Cnn710UMpd7E8o
	 oaztC7xa3xBP7nwgijwOJM4PMk4Oq1Rfz0u/keWvzmYUSBrf4tcC+qz1CIJAJ1AgGs
	 hMixYUVHowSRQ==
MIME-Version: 1.0
Date: Mon, 28 Apr 2025 10:09:31 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, victorm.lira@amd.com,
 Federico Serafini <federico.serafini@bugseng.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Bertrand Marquis
 <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1] misra: add deviation for rules 21.1 and 21.2
In-Reply-To: <b7f7ab2b-baaa-416f-b390-5ed2229d34cb@suse.com>
References: <9e1210f2a9c794d68dcc6b897239b228b141296a.1745427770.git.victorm.lira@amd.com>
 <f5d35582-9270-4816-84c2-f078afeee711@suse.com>
 <alpine.DEB.2.22.394.2504241443550.785180@ubuntu-linux-20-04-desktop>
 <8d65ee65-ec6f-49a3-8954-d303b08dc2df@suse.com>
 <a9db045cff906a4b7db8730ad1095e4b@bugseng.com>
 <b7f7ab2b-baaa-416f-b390-5ed2229d34cb@suse.com>
Message-ID: <4d21245edbd4949a0aec6ecdadea437c@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-04-28 08:15, Jan Beulich wrote:
> On 25.04.2025 17:53, Nicola Vetrini wrote:
>> On 2025-04-25 10:07, Jan Beulich wrote:
>>> On 24.04.2025 23:45, Stefano Stabellini wrote:
>>>> On Thu, 24 Apr 2025, Jan Beulich wrote:
>>>>> On 23.04.2025 19:54, victorm.lira@amd.com wrote:
>>>>>> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>>>> 
>>>>>> MISRA C Rules 21.1 ("#define and #undef shall not be used on a
>>>>>> reserved identifier or reserved macro name") and R21.2 ("A 
>>>>>> reserved
>>>>>> identifier or reserved macro name shall not be declared") 
>>>>>> violations
>>>>>> are not problematic for Xen, as it does not use the C or POSIX
>>>>>> libraries.
>>>>>> 
>>>>>> Xen uses -fno-builtin and -nostdinc to ensure this, but there are
>>>>>> still
>>>>>> __builtin_* functions from the compiler that are available so
>>>>>> a deviation is formulated for all identifiers not starting with
>>>>>> "__builtin_".
>>>>>> 
>>>>>> The missing text of a deviation for Rule 21.2 is added to
>>>>>> docs/misra/deviations.rst.
>>>>>> 
>>>>>> To avoid regressions, tag both rules as clean and add them to the
>>>>>> monitored set.
>>>>>> 
>>>>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>>>>>> Signed-off-by: Victor Lira <victorm.lira@amd.com>
>>>>> 
>>>>> While the rule is in the library section, ...
>>>>> 
>>>>>> --- a/docs/misra/deviations.rst
>>>>>> +++ b/docs/misra/deviations.rst
>>>>>> @@ -587,7 +587,31 @@ Deviations related to MISRA C:2012 Rules:
>>>>>>         construct is deviated only in Translation Units that 
>>>>>> present
>>>>>> a violation
>>>>>>         of the Rule due to uses of this macro.
>>>>>>       - Tagged as `deliberate` for ECLAIR.
>>>>>> -
>>>>>> +
>>>>>> +   * - R21.1
>>>>>> +     - Rule 21.1 reports identifiers reserved for the C and POSIX
>>>>>> standard
>>>>>> +       libraries. Xen does not use such libraries and all
>>>>>> translation units
>>>>>> +       are compiled with option '-nostdinc', therefore there is 
>>>>>> no
>>>>>> reason to
>>>>>> +       avoid to use `#define` or `#undef` on such identifiers
>>>>>> except for those
>>>>>> +       beginning with `__builtin_` for which compilers may 
>>>>>> perform
>>>>>> (wrong)
>>>>>> +       optimizations.
>>>>>> +     - Tagged as `safe` for ECLAIR.
>>>>> 
>>>>> ... I'd like to ask that it be explicitly clarified here that it's
>>>>> solely
>>>>> the library (and not e.g. the compiler itself) that are of concern
>>>>> here.
>>>> 
>>>> The language can be clarified:
>>>> 
>>>> - Rule 21.1 reports identifiers reserved for the C and POSIX 
>>>> standard
>>>>   libraries. Xen does not use such libraries and all translation 
>>>> units
>>>>   are compiled with option '-nostdinc', therefore there is no reason
>>>> to
>>>>   avoid to use `#define` or `#undef` on C and POSIX standard 
>>>> libraries
>>>>   identifiers except for those beginning with `__builtin_` for which
>>>>   compilers may perform (wrong) optimizations.
>>> 
>>> Which makes it more apparent that there is a gap: What about e.g.
>>> __x86_64__?
>>> That falls within what the rules cover, is not a C or POSIX standard
>>> library
>>> identifier, yet very clearly must not be fiddled with. Whereas the 
>>> text
>>> above deviates it.
>> 
>> that is true, even if unlikely: one approach could be to avoid 
>> deviating
>> predefined macros for all CUs as -nostdinc and -fno-builtins should 
>> take
>> care of the rest; this kind of deviation is not currently possible in
>> ECLAIR, but it might be in the future.
> 
> Is this perhaps because by "all pre-defined macros" you really mean 
> _just_
> those, and not the entire reserved (for that purpose) sub-namespace? 
> Imo
> we should not go by what a particular compiler may pre-define (we may 
> even
> overlook something if we did it this way).
> 
> Jan
> 

I think there is a slight misalignment here: maybe I'm interpreting your 
answer incorrectly. Let me try to restate the proposal: the following 
identifiers are not allowed to be #define'd or #undef'd:
- __builtin_*
- for each CU, all macro identifiers already defined upon preprocessing 
that CU by the compiler invocation for that CU. This set of identifiers 
is always a subset of all the reserved identifiers, but is also 
dependent on the compiler invocation that is used for that CU, (e.g. 
__x86_64__ for an Arm target is usually safe to define, as it's 
typically not a predefined macro introduced by the compiler for that 
invocation, while (re)defining __STDC_VERSION__ or __SIZEOF_INT__ will 
be a violation in any command line I can think of). Note that this is 
not a static set, but is based on what is determined to be predefined at 
the moment of the analysis, so it is not tied to what a particular 
compiler pre-defines.

>> I think this could be
>> accomplished also via some gcc trickery on each CU, though I'm not 
>> sure
>> how valued that is for Xen.
>> 

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

