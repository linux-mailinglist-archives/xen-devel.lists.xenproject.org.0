Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F213EB27B1B
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 10:34:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1082996.1442671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umpsl-0006hl-Ue; Fri, 15 Aug 2025 08:33:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1082996.1442671; Fri, 15 Aug 2025 08:33:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umpsl-0006ee-Rk; Fri, 15 Aug 2025 08:33:51 +0000
Received: by outflank-mailman (input) for mailman id 1082996;
 Fri, 15 Aug 2025 08:33:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZXrH=23=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1umpsj-0006eT-FK
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 08:33:50 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f1f98ad-79b2-11f0-a328-13f23c93f187;
 Fri, 15 Aug 2025 10:33:46 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 59ADE4EE0742;
 Fri, 15 Aug 2025 10:33:45 +0200 (CEST)
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
X-Inumbo-ID: 8f1f98ad-79b2-11f0-a328-13f23c93f187
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1755246825;
	b=1tzPg5EpoQZvLYDDg1IgCgbcxJAFZL0uo37bFP7e7/h95Yg7DgUsYKAlUZUm67mcC68M
	 SAhZWY2zB0UqKCV8YW700j1OYzN7DCGn5YXoxjuv65JJHh6PR3mCul6Hx1ET7ccd0GzrI
	 umktG5r/9JMCrDEPeGk6Ka/p1qkYOOisfBS4LttOlsi/SKA5G5F9b50Zu+D0q/xeDqa39
	 lxsxlc7c1DJGER1z9jkjF3UmUp6bbrRs2ozsP5xrOiCJ8SEr5aeUcWksYe9BtwZc0eOsO
	 LCXG+09upXSNm3XMKzUeYZh6gfOLMSIGXNsGtYfx2xxSBne0Mdt859XFsBeKbG7lZkoOk
	 FLqDR78+6cSPS5Hm3AIG7SJOGAyTpN1EA42+6+wBUyTd3/hp02xKjeJSnQYk+ba+utrJL
	 XXO25EPSDyahX0HdLE1gA3eT9gS5oaS1Vh8SIBU8pzu84JfR9Fng4udAit8UTQOdRSR1y
	 K0CnJ6fZujgjgSWZH5273EhA6aAaKUYVirREnszz+k9ifhUHDUlCXYSV4WSzxmlxzfq8e
	 cTWk+yOh4dBtF8K032fbnEA5p+UG/0HgF7PIkB2yo9M0jtCgbQ0N54TZqW4Xh3KR69xD6
	 0Q08YxCxhSXyx4onMxQ/mR+4tHCU3TDtyrYH07nX5nuYXWLtd0kwSUlt9pswZRk=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1755246825;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=8UX0rF92ich/Uj9FEpDrVgAcvFZxbLo++qCmo3WlKiY=;
	b=kUSdh+4UCl5CL+mW4xLKiptWeQKhZQXIDtLCIDHgsTm+0TDqAsnpyqJqsOrJIBbV4GHn
	 KlB+1UgcnUQgM41SnYWbWBgDbwNPOuvtnZTTJNy+mpRXMU98mHMjpwLgve++dckFB8Pur
	 bwCsyfCCTYOiUdJjIg52Llz1Ey8azUPl/KX7pou4dMHXneSjNrfIxW4xBz/L/zpRbX+qJ
	 pQ1UrQ/EpiZ2MEqRJOjnCRBLVGxNWVsOBoXY4SEUQwEac9ZOUbWrTPGqfheYPTxEZg+Ut
	 kCE3jzLu9jVrRPkq2GHdnNgXTP+tq+dqXZZFVeGDu6XU5gR7DdkUCO1KzvKfWpHHwbHa6
	 2oP55peO4hVBOOi9cYTvtd2baMq6eiqMb2TAUH0LVnDEfiLUvJGWuJKvxwgcglqnvuX0c
	 Gm+mgE9ctQIsSBWM0zSv0MKQGIrRoPxUj+zKgoZ1Ti6wmzoE339etg/hUfIJ0W/yLMZ5+
	 bVs79b7rsWu/vvqmfCGFrz/DMO1F7vzserCYOYBuOcpRUqsl+PUth0BlJD3vVjXXyXl+h
	 CFL0TAWygVRd2y72TxfjoBBcWExBEgxImQPQeSkVTh+M9AGJzMD13E8EJjqRAq3GykstY
	 fYt3M0+AhECzRuIELz/9ki7LBXg7ZabPYy3LHNeXcBMmfT/EmOsQxFYEgizEaJA=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1755246825; bh=0nRO27FFoVsRsivnfkAhF9FHD4VCkeUdH4EspsCm0Zg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jA1ImJNIGxogOPwJ49vI7WiVO9bvjNPFBxLTmxiL46eoNucj1aO2RsX5cwAEaeeEx
	 2eXX3bKUVH7KanzWZO00ANb3zhS0dpTY15ZyG2GPVlt+ox0kjK8p+s3mgzNSEb9KaM
	 NQKIEKk3R6QkdrYL8tzqUrgiwnyt4BLjphba3KQBvDknOE5Bwh7DtA0YSw9CHxLhid
	 JYAomDsemxVRilOrZyacUpJRZUSoyrHYPiAVxGJH9N9tIQUTU8J0dg92S0N8Oo3h5O
	 eKS2K/iu65Q+sODPx2dqSKUTQX3+qFi1JsSOUBsb0jCUPv9PIv2sgIONH8w5SoPtxy
	 O+1V3n78aPX+w==
MIME-Version: 1.0
Date: Fri, 15 Aug 2025 10:33:45 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Roberto Bagnara <roberto.bagnara@bugseng.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>
Subject: Re: [PATCH v2] xen: Use auto as per C23
In-Reply-To: <f3ff5b2d-8077-4591-bf1f-bd658d705242@citrix.com>
References: <20250814222524.2638883-1-andrew.cooper3@citrix.com>
 <3056ed85948288639110e3cdd6b28c6e@bugseng.com>
 <f3ff5b2d-8077-4591-bf1f-bd658d705242@citrix.com>
Message-ID: <7fc93aeef27153f1d6caa786bd44420f@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-08-15 10:17, Andrew Cooper wrote:
> On 15/08/2025 8:20 am, Nicola Vetrini wrote:
>> On 2025-08-15 00:25, Andrew Cooper wrote:
>>> In macros it is common to declare local variables using typeof(param)
>>> in order
>>> to ensure that side effects are only evaluated once.  A consequence
>>> of this is
>>> double textural expansion of the parameter, which can get out of hand
>>> very
>>> quickly with nested macros.
>>> 
>>> In C23, the auto keyword has been repurposed to perform type 
>>> inference.
>>> 
>>> A GCC extension, __auto_type, is now avaialble in the new toolchain
>>> baseline
>>> and avoids the double textural expansion.
>>> 
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> 
>> Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Thankyou.
> 
>>> 
>>> diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
>>> index 88bf26bc5109..38ef5d82ad95 100644
>>> --- a/xen/include/xen/compiler.h
>>> +++ b/xen/include/xen/compiler.h
>>> @@ -64,6 +64,20 @@
>>>  # define asm_inline asm
>>>  #endif
>>> 
>>> +/*
>>> + * In C23, the auto keyword has been repurposed to perform type
>>> inference.
>>> + *
>>> + * This behaviour is available via the __auto_type extension in
>>> supported
>>> + * toolchains.
>>> + *
>>> + *
>>> https://www.gnu.org/software/c-intro-and-ref/manual/html_node/Auto-Type.html
>>> + * https://clang.llvm.org/docs/LanguageExtensions.html#auto-type
>>> + */
>>> +#if !defined(__STDC_VERSION__) || __STDC_VERSION__ < 202311L
>>> +/* SAF-3-safe MISRA C Rule 20.4: Giving the keyword it's C23
>>> meaning. */
>>> +#define auto __auto_type
>>> +#endif
>>> +
>> 
>> A more detailed explanation should live in deviations.rst under this
>> bullet point
>> 
>>    * - R20.4
>>      - The override of the keyword \"inline\" in xen/compiler.h is
>> present so
>>        that section contents checks pass when the compiler chooses not 
>> to
>>        inline a particular function.
>>      - Comment-based deviation.
>> 
>> as described in the SAF entry:
>> 
>>         {
>>             "id": "SAF-3-safe",
>>             "analyser": {
>>                 "eclair": "MC3A2.R20.4"
>>             },
>>             "name": "MC3A2.R20.4: allow the definition of a macro with
>> the same name as a keyword in some special cases",
>>             "text": "The definition of a macro with the same name as a
>> keyword can be useful in certain configurations to improve the
>> guarantees that can be provided by Xen. See docs/misra/deviations.rst
>> for a precise rationale for all such cases."
>>         },
> 
> Ah right.  What about this:
> 
> "Xen does not use the \"auto\" keyword as a storage qualifier.  The
> override of the keyword \"auto\" in xen/compiler.h is to give it it's
> C23 behaviour of type inference."
> 
> ?
> 

Seems good to me. Maybe this should be spelled out in ./CODING_STYLE as 
well, so that newcomers don't trip over this?

> ~Andrew
> 
> P.S. I thought that final fix was too easy.  Your instructions for the
> main config were spot on and worked first time, except for getting the
> R20.4 violation too.

Yeah, forgot about that one; it's not so common to override keywords.

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

