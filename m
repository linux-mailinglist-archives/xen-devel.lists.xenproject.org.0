Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AD2A9CD99
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 17:53:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.968349.1357979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8LMR-0006Np-TN; Fri, 25 Apr 2025 15:53:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 968349.1357979; Fri, 25 Apr 2025 15:53:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8LMR-0006LY-Qf; Fri, 25 Apr 2025 15:53:07 +0000
Received: by outflank-mailman (input) for mailman id 968349;
 Fri, 25 Apr 2025 15:53:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zUna=XL=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1u8LMQ-0006LS-KC
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 15:53:07 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5fa480f4-21ed-11f0-9eb3-5ba50f476ded;
 Fri, 25 Apr 2025 17:53:05 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id B09234EE0737;
 Fri, 25 Apr 2025 17:53:03 +0200 (CEST)
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
X-Inumbo-ID: 5fa480f4-21ed-11f0-9eb3-5ba50f476ded
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1745596383;
	b=r0G2RchOsSC16d4ETZYD/uzmM2EU9McvQPNAJHVMsyViROyAZTHRpj1auN0yK1ERHKA7
	 DuwSSjGG/9IaYD0P8af4DKSYJoSc2knm5TSctwTHzzb5XLnhrPFE75GZF/aAnYxTVGaJR
	 goTvxjJsaO0YYcryn1gHkT5eAC49qazNbH1ceFy0zkYgz4f7Q26/YJMvhIduC2fr1pZ4G
	 J51BtFPEh6IU6vWDFGCi9kCoVH79/N4SvG7YcOJJKkbpMQ8H9KMyFy0V+ih3VBR+hFbwA
	 1jTCJoh01r4l4jirMp70s3aAu59/PjFphB6Psz8HLfnkIWoBWyOAftFbGo4PzegqOz8jZ
	 mfr0OStT4WlzjI1N0wbopPIOKw0o/1edA542qPbQsOqZz/a/QbM0rdgIaY5sSfg2cNnV+
	 8d+SrK3o1mFOL8FDNLTENJfoKzAV2PrBKTVJWlaJXX9idT4nMN5c0GuxeJ4R9tjjaNhYl
	 EqKMR9sQdg2lBmGG3R9Qsn1+HXfkJlrdOj3dSny5H1FHZ1YMo0CZMK2+WQdf03oRdI9kx
	 KW9AdOrly1GscIpfppCP0TkQDiRGeQQnX8S3l1xyOUxPaJiy4rT/rZHfUbUMNZWFxHl4A
	 oxtVQjp3TrHd+e8wH+dSTbz11WOU7ytvtQZulSyNeAQyiQnk1ED5LbKjEMtkbIY=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1745596383;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=ZlVtX6/H69KyDq0ZXoXpcRteBc20NIKrfdkjlddmYTo=;
	b=ADWUoTAAQg41hsAUVJYHxwxn1REgd5tP4qS/R9wgytAyKUXj81gQiC1pIHUVi74LWF/k
	 yLEfLCufBBE9Gt1g1szYTMjsm3j/xYuP9lR/Z/5BbIBbV6yATTJ+dKd9NLFpr4LsJTuds
	 0dInXF+SfFQqT/dhuBIuNxUV+tTQ2Mx9+Fs5DvGIKABOm7GFOwXyT2J7kvrWB8FXeRnbp
	 vkSYnIPEpn4RglozymrXbYxtaik5qjdK1y3OMqCSnkozEhSmX0fKLlGIk7ZXmbUBnqnLC
	 uygjKOYDWD0B4HU1lZHXmL7lZqHsuBkG7FS6Mo3vQNauIx5DTpbb7HJBwA+BH6lgFeq1R
	 f/Xa5+svKB8PnDUDSzlTuLL7BKa5k/cWs9FsHpjejvdUP6PR9dWtkiJi5+EMy+odCSFpq
	 DJYqRxJ3sEOnxnwb9hZL+rgoBIX+nRNbOlSrxoehoSqwuN6HvxtkIIcdkY/7+Qvj+7wEV
	 gBDhsuhyQVJn3QZWPFH88w8YkRQXV6D6MWfIKKEyFfOeB6jwJdnguuXuytEfpzBmkg3x0
	 JycG/ge3srCdSlNOnlwLwqfU81VcD/uPI6/YGGsEVWCt0mEfGKLeLisHcvcEuIJs4sRYX
	 Ne/8toJoX4eUo1s9aB+PGavF/wORkVwUWvweTCX8jvgUagLA0+AJKrH2rCd6Iyo=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1745596383; bh=EoappiWRhq2Xe/N5OzY9mxhp+n9sKlOMXdL4nkS/LuE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rSm+IX0NO01zhMsLbMhu1CI4dx9T4OiXhMYP34Tt6e2Gc/sgyInecQ1G4vjpYb0Lx
	 lDnMsjLdlGnjPh0cMwwZxZgjlkqoJHR3v2aV5d5a5OJ60SiDDwICDbw6sqYiFqB3vw
	 CnRzFZppwCvDakzkP7s8HGIyCw7+TdLSyirt0bOlnKyA3vAKPLg3qBdO6C6cZO4+MJ
	 3Gfw9BcJjJ4F3zsCnH53jiAvpDYARkwH0qUHbN9WpKDtVZd9Dimno7E9AhSZniPivZ
	 dHG7P4U/gxySNz61uNw+i9lumIdrIHUkCTud7GAivkLsbgF7+jBpnVwPkm/26nvCPw
	 t5ep6TRs/6WVg==
MIME-Version: 1.0
Date: Fri, 25 Apr 2025 17:53:03 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, victorm.lira@amd.com,
 Federico Serafini <federico.serafini@bugseng.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Bertrand Marquis
 <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1] misra: add deviation for rules 21.1 and 21.2
In-Reply-To: <8d65ee65-ec6f-49a3-8954-d303b08dc2df@suse.com>
References: <9e1210f2a9c794d68dcc6b897239b228b141296a.1745427770.git.victorm.lira@amd.com>
 <f5d35582-9270-4816-84c2-f078afeee711@suse.com>
 <alpine.DEB.2.22.394.2504241443550.785180@ubuntu-linux-20-04-desktop>
 <8d65ee65-ec6f-49a3-8954-d303b08dc2df@suse.com>
Message-ID: <a9db045cff906a4b7db8730ad1095e4b@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-04-25 10:07, Jan Beulich wrote:
> On 24.04.2025 23:45, Stefano Stabellini wrote:
>> On Thu, 24 Apr 2025, Jan Beulich wrote:
>>> On 23.04.2025 19:54, victorm.lira@amd.com wrote:
>>>> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>> 
>>>> MISRA C Rules 21.1 ("#define and #undef shall not be used on a
>>>> reserved identifier or reserved macro name") and R21.2 ("A reserved
>>>> identifier or reserved macro name shall not be declared") violations
>>>> are not problematic for Xen, as it does not use the C or POSIX
>>>> libraries.
>>>> 
>>>> Xen uses -fno-builtin and -nostdinc to ensure this, but there are 
>>>> still
>>>> __builtin_* functions from the compiler that are available so
>>>> a deviation is formulated for all identifiers not starting with
>>>> "__builtin_".
>>>> 
>>>> The missing text of a deviation for Rule 21.2 is added to
>>>> docs/misra/deviations.rst.
>>>> 
>>>> To avoid regressions, tag both rules as clean and add them to the
>>>> monitored set.
>>>> 
>>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>>>> Signed-off-by: Victor Lira <victorm.lira@amd.com>
>>> 
>>> While the rule is in the library section, ...
>>> 
>>>> --- a/docs/misra/deviations.rst
>>>> +++ b/docs/misra/deviations.rst
>>>> @@ -587,7 +587,31 @@ Deviations related to MISRA C:2012 Rules:
>>>>         construct is deviated only in Translation Units that present 
>>>> a violation
>>>>         of the Rule due to uses of this macro.
>>>>       - Tagged as `deliberate` for ECLAIR.
>>>> -
>>>> +
>>>> +   * - R21.1
>>>> +     - Rule 21.1 reports identifiers reserved for the C and POSIX 
>>>> standard
>>>> +       libraries. Xen does not use such libraries and all 
>>>> translation units
>>>> +       are compiled with option '-nostdinc', therefore there is no 
>>>> reason to
>>>> +       avoid to use `#define` or `#undef` on such identifiers 
>>>> except for those
>>>> +       beginning with `__builtin_` for which compilers may perform 
>>>> (wrong)
>>>> +       optimizations.
>>>> +     - Tagged as `safe` for ECLAIR.
>>> 
>>> ... I'd like to ask that it be explicitly clarified here that it's 
>>> solely
>>> the library (and not e.g. the compiler itself) that are of concern 
>>> here.
>> 
>> The language can be clarified:
>> 
>> - Rule 21.1 reports identifiers reserved for the C and POSIX standard
>>   libraries. Xen does not use such libraries and all translation units
>>   are compiled with option '-nostdinc', therefore there is no reason 
>> to
>>   avoid to use `#define` or `#undef` on C and POSIX standard libraries
>>   identifiers except for those beginning with `__builtin_` for which
>>   compilers may perform (wrong) optimizations.
> 
> Which makes it more apparent that there is a gap: What about e.g. 
> __x86_64__?
> That falls within what the rules cover, is not a C or POSIX standard 
> library
> identifier, yet very clearly must not be fiddled with. Whereas the text
> above deviates it.
> 

Hi Jan,

that is true, even if unlikely: one approach could be to avoid deviating 
predefined macros for all CUs as -nostdinc and -fno-builtins should take 
care of the rest; this kind of deviation is not currently possible in 
ECLAIR, but it might be in the future. I think this could be 
accomplished also via some gcc trickery on each CU, though I'm not sure 
how valued that is for Xen.

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

