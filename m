Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D792A9F500
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 17:55:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970881.1359438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Qou-0003zO-8e; Mon, 28 Apr 2025 15:55:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970881.1359438; Mon, 28 Apr 2025 15:55:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Qou-0003wG-5S; Mon, 28 Apr 2025 15:55:00 +0000
Received: by outflank-mailman (input) for mailman id 970881;
 Mon, 28 Apr 2025 15:54:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jkfC=XO=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1u9Qos-0003wA-8b
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 15:54:58 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20e08edd-2449-11f0-9eb4-5ba50f476ded;
 Mon, 28 Apr 2025 17:54:55 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 5FFBF4EE7BD1;
 Mon, 28 Apr 2025 17:54:54 +0200 (CEST)
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
X-Inumbo-ID: 20e08edd-2449-11f0-9eb4-5ba50f476ded
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1745855694;
	b=eipt02gPBxoFpPiUizlAIu453Rq+9O50h9bUvZM75rwDVcud2gOcX4WqleeOI6+XdXyE
	 SeSepUJDMvVlPdW5S5sXY+9faSbOr/s5Os/sQsjzuD+qwcMzwzHAwoerLeV95Vhz/Kg39
	 Rb7kF1zNQ5L9pbaiC0oB9VyWJ+cmasjrGgBzt3iU8XCxOxjbaN5bvcd7DtEoofO/to6BD
	 rOhAcFIQ1IsIcLZG9C42t4Q/xzOhoN9Xbe4fM8qIWS60AukGED9luwWFvv7mFtyXDF0ti
	 9OX2ts0vvVREnaU+hlPXPXmuPMUcPk+fNzpDCmQL8stPVC+KHYcBsYIJv7YTX501GDbYo
	 L9A9qQNV4gQfF54OtgxY1YX1JSuqdK8dKYIkREZ5q3L1elKmWPaROtTcvMaBiVN3ZD5uu
	 v/m0/KEAwtu27VoHvTnflCyBh9DyqDvW/ebMBooqZMMCZciEsI82p/fvTwD5lVisVex3O
	 5fU6BvbU099YhmUpTvfA2BwImR6Qc7E6zFYSnIoptJTjfPlWCrT+EJy2aYBsg1TkRGGGo
	 0iLa9fDz6ydxDvDuSZi5KHLR+y3ent/XHEtx07v9O+16V4kqNp96tRdz0L/rxjjdKzzvy
	 NY1Tg7QF61aivuN/JLXNJgc9bevGEaZiS+AgR7ddijgmi1pd8XBSrAjlG5sKwcI=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1745855694;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=huJVLdjXQrj/mQLDDbls7v4qsqBT56+HBzHEtpiM9yY=;
	b=0OdyNWWkDOfVfEeRd9Xm9AjtlegVe/gxPXFP8sLunNT92cqWQeR5+HTF0twcetEoWSp3
	 Hbw2DXVIhTP0msp3T/5vK4WWifCnAHDN8UNfkFdE82snOVSpXx+0coWzIiLItYdG3PKev
	 P49fT8qsHrBAs0FxUvQX0uLiuCZrcsHQcOdIUoP/CZZYYxieqxqcJ8eXXLDaD5seOhP0I
	 zwcwErnc+Sp1dGu48k3wYvLS+G4myFscgjyVfqkgrUfeD3vy9T3hRkKFixktq/tYbajDW
	 1YteLeJa9+IbhQCFmmw+ndYFELqewj5LnhgGsBMXJj1tXSfV9DEr5OwavtmaIVGZNSOXq
	 bE2JErXgYYUhEWDfUcsPpDOSmMxSfhrhcJ2+ta5pk4+SZF0fIa8lc0sc/t+6zIIrtlfpu
	 3K8JaeGSa2OeGBsArUPSSZo4wVj0hr2uG1VDmwtScacgL4AFPu0+QnV1FlH0Xobw1ufGK
	 xeRkFZ4BpBcIP7sgfg3Rjx0KwRacxNL6EflopV6eYaLrWdzmiRapYTvbyC40vittV8D18
	 ByFcYMGcY+pt4Kgjyxdrm6wj0kqKRijlIShdJeV/A3SxV7rEunRdNPqd+CNjS0NWAL118
	 vB2UEryMtTbYTbED5KHA/E5hbXhNbEQtPthfl0V+jNP7VgVnzE/s0yDHzLSktNk=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1745855694; bh=oH9I9/X/vUyXzwbHS/DzNriPaSfhdN76xWGpAd4Fao0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=uLJMkUn/1R8vw81dhMsOT2LILi4Vr3TstsQKnloyX7cIMlEALYt24butG1bhkVZ5S
	 yRzMZT7VvfcD4FoU2mBmUuz3hB7YcgEw6D7FBmikZaVrx3BfY0wI17h06tOejanknL
	 t37Y0V7wPD+XfM0XvM77nepeDOAgs11tCC3vi9CP0NiwcCmYKhhk6EBjzLUBpRJ46K
	 nAwJgfuNkv/HBA4iY/2oLckGh3l6CCRFO0ALqXLCaq3gyn4nYOUPGMyT2BYMWErLrC
	 Qk6K+4bu2Q8XS+TYt5XAiRqzxs6VD004VVcTsEumhj4zcUVbEM9oejODBuEMcMWDZ4
	 4u4WYTcZV++4A==
MIME-Version: 1.0
Date: Mon, 28 Apr 2025 17:54:54 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, victorm.lira@amd.com,
 Federico Serafini <federico.serafini@bugseng.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Bertrand Marquis
 <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1] misra: add deviation for rules 21.1 and 21.2
In-Reply-To: <35ac0856-7a96-4f91-a76d-989bcebfb911@suse.com>
References: <9e1210f2a9c794d68dcc6b897239b228b141296a.1745427770.git.victorm.lira@amd.com>
 <f5d35582-9270-4816-84c2-f078afeee711@suse.com>
 <alpine.DEB.2.22.394.2504241443550.785180@ubuntu-linux-20-04-desktop>
 <8d65ee65-ec6f-49a3-8954-d303b08dc2df@suse.com>
 <a9db045cff906a4b7db8730ad1095e4b@bugseng.com>
 <b7f7ab2b-baaa-416f-b390-5ed2229d34cb@suse.com>
 <4d21245edbd4949a0aec6ecdadea437c@bugseng.com>
 <35ac0856-7a96-4f91-a76d-989bcebfb911@suse.com>
Message-ID: <776e518b51ac40973207fc2efed6a460@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-04-28 11:04, Jan Beulich wrote:
> On 28.04.2025 10:09, Nicola Vetrini wrote:
>> On 2025-04-28 08:15, Jan Beulich wrote:
>>> On 25.04.2025 17:53, Nicola Vetrini wrote:
>>>> On 2025-04-25 10:07, Jan Beulich wrote:
>>>>> On 24.04.2025 23:45, Stefano Stabellini wrote:
>>>>>> On Thu, 24 Apr 2025, Jan Beulich wrote:
>>>>>>> On 23.04.2025 19:54, victorm.lira@amd.com wrote:
>>>>>>>> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>>>>>> 
>>>>>>>> MISRA C Rules 21.1 ("#define and #undef shall not be used on a
>>>>>>>> reserved identifier or reserved macro name") and R21.2 ("A
>>>>>>>> reserved
>>>>>>>> identifier or reserved macro name shall not be declared")
>>>>>>>> violations
>>>>>>>> are not problematic for Xen, as it does not use the C or POSIX
>>>>>>>> libraries.
>>>>>>>> 
>>>>>>>> Xen uses -fno-builtin and -nostdinc to ensure this, but there 
>>>>>>>> are
>>>>>>>> still
>>>>>>>> __builtin_* functions from the compiler that are available so
>>>>>>>> a deviation is formulated for all identifiers not starting with
>>>>>>>> "__builtin_".
>>>>>>>> 
>>>>>>>> The missing text of a deviation for Rule 21.2 is added to
>>>>>>>> docs/misra/deviations.rst.
>>>>>>>> 
>>>>>>>> To avoid regressions, tag both rules as clean and add them to 
>>>>>>>> the
>>>>>>>> monitored set.
>>>>>>>> 
>>>>>>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>>>>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>>>>>>>> Signed-off-by: Victor Lira <victorm.lira@amd.com>
>>>>>>> 
>>>>>>> While the rule is in the library section, ...
>>>>>>> 
>>>>>>>> --- a/docs/misra/deviations.rst
>>>>>>>> +++ b/docs/misra/deviations.rst
>>>>>>>> @@ -587,7 +587,31 @@ Deviations related to MISRA C:2012 Rules:
>>>>>>>>         construct is deviated only in Translation Units that
>>>>>>>> present
>>>>>>>> a violation
>>>>>>>>         of the Rule due to uses of this macro.
>>>>>>>>       - Tagged as `deliberate` for ECLAIR.
>>>>>>>> -
>>>>>>>> +
>>>>>>>> +   * - R21.1
>>>>>>>> +     - Rule 21.1 reports identifiers reserved for the C and 
>>>>>>>> POSIX
>>>>>>>> standard
>>>>>>>> +       libraries. Xen does not use such libraries and all
>>>>>>>> translation units
>>>>>>>> +       are compiled with option '-nostdinc', therefore there is
>>>>>>>> no
>>>>>>>> reason to
>>>>>>>> +       avoid to use `#define` or `#undef` on such identifiers
>>>>>>>> except for those
>>>>>>>> +       beginning with `__builtin_` for which compilers may
>>>>>>>> perform
>>>>>>>> (wrong)
>>>>>>>> +       optimizations.
>>>>>>>> +     - Tagged as `safe` for ECLAIR.
>>>>>>> 
>>>>>>> ... I'd like to ask that it be explicitly clarified here that 
>>>>>>> it's
>>>>>>> solely
>>>>>>> the library (and not e.g. the compiler itself) that are of 
>>>>>>> concern
>>>>>>> here.
>>>>>> 
>>>>>> The language can be clarified:
>>>>>> 
>>>>>> - Rule 21.1 reports identifiers reserved for the C and POSIX
>>>>>> standard
>>>>>>   libraries. Xen does not use such libraries and all translation
>>>>>> units
>>>>>>   are compiled with option '-nostdinc', therefore there is no 
>>>>>> reason
>>>>>> to
>>>>>>   avoid to use `#define` or `#undef` on C and POSIX standard
>>>>>> libraries
>>>>>>   identifiers except for those beginning with `__builtin_` for 
>>>>>> which
>>>>>>   compilers may perform (wrong) optimizations.
>>>>> 
>>>>> Which makes it more apparent that there is a gap: What about e.g.
>>>>> __x86_64__?
>>>>> That falls within what the rules cover, is not a C or POSIX 
>>>>> standard
>>>>> library
>>>>> identifier, yet very clearly must not be fiddled with. Whereas the
>>>>> text
>>>>> above deviates it.
>>>> 
>>>> that is true, even if unlikely: one approach could be to avoid
>>>> deviating
>>>> predefined macros for all CUs as -nostdinc and -fno-builtins should
>>>> take
>>>> care of the rest; this kind of deviation is not currently possible 
>>>> in
>>>> ECLAIR, but it might be in the future.
>>> 
>>> Is this perhaps because by "all pre-defined macros" you really mean
>>> _just_
>>> those, and not the entire reserved (for that purpose) sub-namespace?
>>> Imo
>>> we should not go by what a particular compiler may pre-define (we may
>>> even
>>> overlook something if we did it this way).
>>> 
>>> Jan
>>> 
>> 
>> I think there is a slight misalignment here: maybe I'm interpreting 
>> your
>> answer incorrectly. Let me try to restate the proposal: the following
>> identifiers are not allowed to be #define'd or #undef'd:
>> - __builtin_*
>> - for each CU, all macro identifiers already defined upon 
>> preprocessing
>> that CU by the compiler invocation for that CU. This set of 
>> identifiers
>> is always a subset of all the reserved identifiers, but is also
>> dependent on the compiler invocation that is used for that CU, (e.g.
>> __x86_64__ for an Arm target is usually safe to define, as it's
>> typically not a predefined macro introduced by the compiler for that
>> invocation,
> 
> No, it's not - elsewhere in the tree we may use this to distinguish
> architectures. Plus isn't Misra heavily about avoiding developer
> confusion? Defining __x86_64__ on Arm code is, imo, a pretty confusing
> thing to do.
> 

Indeed it is confusing, but likely safe from the perspective of 
preventing UB, which is the main rationale of this rule. For the 
purposes of distinguishing architectures I'd expect a #ifdef __x86_64__ 
or #if defined(__x86_64__) and those are fine, as this only applies to 
#define or #undef.

>> while (re)defining __STDC_VERSION__ or __SIZEOF_INT__ will
>> be a violation in any command line I can think of). Note that this is
>> not a static set, but is based on what is determined to be predefined 
>> at
>> the moment of the analysis, so it is not tied to what a particular
>> compiler pre-defines.
> 
> Right. Yet what I'm trying to get to is that we disallow _all_ such
> reserved identifiers, not just a subset.
> 

I understand now. There are thousands of locations to be touched to 
remove all uses of reserved identifiers, since they are used quite 
extensively in Xen (A rough estimation is around 1.5k such identifiers, 
with ~900 violations on Arm and ~1000 on x86, without counting their 
occurrences). That is a very disruptive change, even if split very 
finely.

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

