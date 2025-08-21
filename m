Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DC9B2FD35
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 16:48:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088777.1446504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up6Zo-0007H6-UB; Thu, 21 Aug 2025 14:47:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088777.1446504; Thu, 21 Aug 2025 14:47:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up6Zo-0007Eg-RS; Thu, 21 Aug 2025 14:47:40 +0000
Received: by outflank-mailman (input) for mailman id 1088777;
 Thu, 21 Aug 2025 14:47:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uBnp=3B=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1up6Zn-0007Ea-A2
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 14:47:39 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c7871ac2-7e9d-11f0-a32b-13f23c93f187;
 Thu, 21 Aug 2025 16:47:37 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id BAE654EEBC48;
 Thu, 21 Aug 2025 16:47:35 +0200 (CEST)
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
X-Inumbo-ID: c7871ac2-7e9d-11f0-a32b-13f23c93f187
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1755787655;
	b=D0dZrJhnT5VnJT0ZxcHQ96skrjQQJENYm59G8y96RTOF45jz4o8982huK7B6h/Xaeo3L
	 KKG/1jC/mvvQntFjkjl2+SzQafFW5ZCXT4CuIkl3GqLLRMQNHR72FO7nZafC8Y5CK8niv
	 pTINceKBQNu/EMvkyN41rNJxgyvP+NQVZYk5bYXXCbI5cXHQK4Yv/aErKNT1yTUsOJbmr
	 b8LGVOod0b7DJgRBnyIzfDBXFimdyzOdvtlGdPj/2hugriZEs+mNa/CxDfsejhMueYos2
	 FOijYtvGtTeZ/hlTFI3bc4WSPnYYmfSCBJVsRA2YLKOSjfEJcILt/lxfpb8PEIuiQJRe4
	 BOQzkPvybRw1Yl7Crlc2dkHrFqqNCD+yRnauGE7TkGmnGFTSccHbUTz/m+2KjulzqHOPT
	 krpiC6z9PNEd3mhVHlS0xMEfWHt0wKFHDXRUlVOyzoXTsjk6r6jd26Rk4lXnGMo5r8x6F
	 l1b96KfJK+JqifsquKmb13ZcMaFStkCglMjmXkJwLD6ZSSoeM8j7iYG3XCb0CSS4ToF1b
	 /IEomcRZP/Wbz4XvBLuc8QWnyLEb4Tm5fdX8MsVf7oPxaoGH/0a6qWO5x7Jja9ISlJBzy
	 Ydat0r00rdMwnhlgzh1QOZzWDEHJnudvpCE+44EEvcsRNETj+Hn9cZ5ICWbzVZs=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1755787655;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=ooDp5/VMTh979qC9zYvC3jDnRtcIb2fJaBdXnV3DnHg=;
	b=rDV7MRUCJ40h4sE3MzgXafJbZN5tSX2HgsSNWQjPFdMoja5AVSqrZscH0+JJP8eN1bwV
	 2gjHdKfpU7S/tQ/8ochYlQ59WmqV+pqItee3AeptsAjRrKw09xUEMYfZ9lXmx5g7eRCEq
	 /b8kEiHMy4OdziaHhBZ3IB6VoMdGFF7a+g39a0j03S6HImBKfhhGKl5vGJ0q3SQYX0X/0
	 jecAcC628fvn8HR4EZkfMXxG96MVAz51gyFho5uEilL1wdK5sVMWO9meL9Fzu08oTHRc9
	 QpBeM3kt++9iOGAUO71vErYp3JOHCH0GOrj1dFLsYwymTFOjBcHXkhwKR2gUpcYrqklTM
	 37GCqNUyNeymUqTsvzUSOUgOJH3DLJFjH6mkdmKP6SP5r5jD60ZFwUgCormswgLgS7xAw
	 hLHVfXS2Xj4RuJdvy+qv9+fN9CWQ1wI2DLc+/4qhsHuizFwgKCiavAVc8G0CDNot+L6WU
	 j9oMi8N7JBlrlw7fGQeBE5VpJVJ7y6L36anBJrwHco15wOacgv0+cMNLoM/GKmAuHZAsV
	 4C6Y0XAn2br5de0VeFPzK+EPxVwFKkbkEO7eMMX6oek74+k4LiwhShSsdCT0bK/3bGyir
	 s6uvwuslVdnppGz9dOCv619enFEHbRs8kzFxGw5cPgp4KvqJG8T1upD1oKfyFA4=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1755787655; bh=ll72S6UAoePq+ShXQlCmPA6aoznDCaWSxVG7nbqA1q4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Bo1iwj3Wj2275RgP5iiuvAHmzL5EvRdSPj05rt5757tzndrkrJwj7E6rUPKFPZtfW
	 OqW0kPMXHjEu5ZvMBPWYB/WbVlxXq7/yLLqhXLGXqSCrGqh7iTpNhzHNv3kUcNWJkF
	 UmRxWYTGe3N46R9rTlw3/CR6TpXVAi+UDFUPxdD010pphEPobb0+oMNY3HLZFrPD57
	 5Kpk4fbq7qIE5p5DVbxX5g1mGaSh8dTuUSGiwpca2pc+HX82xayUFUP4OyiUi6JULi
	 LHDDApFjjU8Ugo3nss3J8rm5kkIzCimgsmufkbKG4OD1kK7eTCSBWeYHamF7V0pnwf
	 L7cT0kf9Ic2Vg==
MIME-Version: 1.0
Date: Thu, 21 Aug 2025 16:47:35 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Jan Beulich <jbeulich@suse.com>, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH] misra: add deviation for MISRA C Rule 11.3
In-Reply-To: <a916d650-3000-44f8-be86-714f4b46a986@epam.com>
References: <d6a8682c98880d66ea99f882520b3defda0e3fe0.1755672275.git.dmytro_prokopchuk1@epam.com>
 <5199396a-685c-4839-b7cb-d32e3f4a0b48@suse.com>
 <159de776-d0bf-4f77-a6b6-670246eca85e@epam.com>
 <a916d650-3000-44f8-be86-714f4b46a986@epam.com>
Message-ID: <756c6bc79773078a3d436e60f7e4b2e9@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-08-21 16:28, Dmytro Prokopchuk1 wrote:
> On 8/21/25 17:13, Dmytro Prokopchuk wrote:
>> 
>> 
>> On 8/21/25 12:18, Jan Beulich wrote:
>>> On 20.08.2025 09:17, Dmytro Prokopchuk1 wrote:
>>>> MISRA C Rule 11.3 states: "A cast shall not be performed between a
>>>> pointer
>>>> to object type and a pointer to a different object type."
>>>> 
>>>> Violations of this rule arise due to the 'container_of' macro, which
>>>> casts
>>>> a member of a structure to its containing structure:
>>>>      container_of(ptr, type, member) ({                             
>>>> \
>>>>             typeof_field(type, member) *__mptr = (ptr);             
>>>> \
>>>>             (type *)( (char *)__mptr - offsetof(type,member) );})
>>>> 
>>>> The 'container_of' macro is safe because it relies on the
>>>> standardized and
>>>> well-defined 'offsetof' macro to calculate the memory address of the
>>>> containing structure, while assuming proper alignment and ensuring 
>>>> no
>>>> undefined behavior, provided that the input pointer is valid and
>>>> points to
>>>> the specified member.
>>>> 
>>>> Configure Eclair to suppress violation reports related to 
>>>> 'container_of
>>>> macro. Update 'deviations.rst' file accordingly. Add Rule 11.3 to 
>>>> the
>>>> monitored list.
>>>> No functional changes.
>>>> 
>>>> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
>>> 
>>> Looks largely okay; just one nit and a question:
>>> 
>>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>> @@ -403,6 +403,14 @@ because the semantics of the 'noreturn'
>>>> attribute do not alter the calling conve
>>>>   }
>>>>   -doc_end
>>>> +-doc_begin="Convesions in the 'container_of' macro are safe because
>>>> it relies on
>>> 
>>> "Conversions" (also in deviations.rst)
>>> 
>>>> --- a/automation/eclair_analysis/ECLAIR/monitored.ecl
>>>> +++ b/automation/eclair_analysis/ECLAIR/monitored.ecl
>>>> @@ -45,6 +45,7 @@
>>>>   -enable=MC3A2.R10.2
>>>>   -enable=MC3A2.R11.1
>>>>   -enable=MC3A2.R11.2
>>>> +-enable=MC3A2.R11.3
>>> 
>>> While the description mentions this change, it doesn't say why (e.g. 
>>> "no
>>> violations left" or "only this and that violation left" or some 
>>> such).
>> ARM:  813V ->   16V
>> X86: 1422V -> 1035V
>> 
>> Looks OK for ARM (to be added in the monitoring list), but X86...
>> Anyway the number of reported errors has no side effect.
>> 
>> Jan, decision up to you (include into monitored.ecl or not).
>> 
>> Dmytro.
> 
> Actually, better way is to remove '-enable=MC3A2.R11.3' from the
> monitored.ecl file and create separate patch (in future).
> 

I agree

> Dmytro.
> 
>>> 
>>>> --- a/docs/misra/deviations.rst
>>>> +++ b/docs/misra/deviations.rst
>>>> @@ -393,6 +393,14 @@ Deviations related to MISRA C:2012 Rules:
>>>>          (i.e., less strict) alignment requirement are safe.
>>>>        - Tagged as `safe` for ECLAIR.
>>>> +   * - R11.3
>>>> +     - Convesions in the 'container_of' macro are safe because it
>>>> relies on
>>>> +       the standardized and well-defined 'offsetof' macro to
>>>> calculate the memory
>>> 
>>> Actually another nit: Here as well as in the description, it would be
>>> nice
>>> to add parentheses, so indicate the function-ness of both macros 
>>> (i.e.
>>> container_of() and offsetof()).
>>> 
>>> Jan

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

