Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9C1B1B4D1
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 15:23:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070470.1434081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujHca-0006m4-Hz; Tue, 05 Aug 2025 13:22:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070470.1434081; Tue, 05 Aug 2025 13:22:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujHca-0006jS-FC; Tue, 05 Aug 2025 13:22:28 +0000
Received: by outflank-mailman (input) for mailman id 1070470;
 Tue, 05 Aug 2025 13:22:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vqd9=2R=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1ujHcY-0006jM-5l
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 13:22:26 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 397146f0-71ff-11f0-a321-13f23c93f187;
 Tue, 05 Aug 2025 15:22:24 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 3CAFF4EE0748;
 Tue,  5 Aug 2025 15:22:23 +0200 (CEST)
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
X-Inumbo-ID: 397146f0-71ff-11f0-a321-13f23c93f187
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1754400143;
	b=lLK45SGqceVrfzqlucKnaVhwKowUNgiKqDgz+wMNAWedZDa73XuLyG32ivpQgT4AWk9+
	 K+JRYYPEd9jSZ1Hv+9FekMXA8DB0nNDuS+Mp0wSkTfNjwF1VEg/1RtjivpZG8O8CAq7tz
	 7/LcgR0T/1s0ELV2gs4yApPkzFAD9l0fSDEwAeOLRiw9fMpYOQ7momEmlLochWHwXsd87
	 fozNGkvLEOyknBS+tZkKYZ2frTzxLN0E1kGdoZPmEVUtXXCrs7Ngu5Fy9m1hgLhmajX0C
	 xMC1K1GcqCjW65NARXH6UtXU6m5GqAPdOWvLUw+uqurMzdWTQAqXuODaoHJxWj4hOD6PW
	 2qoY3hEjwt2DyvAXv8qAvCu0WKRRhgGdU1iEWHVn5qeqxY0GwWK3J7k88se0HRfuieMrY
	 uaUtFEOi26qmhzbPu167YOm0kgrXkHA/wOxGA48GejLMvtSPw71yvyzSnBeCRGm/5L+xj
	 dJcILCHc7ZNt2WuNZAayXlRUK6A4FhxCkCJxbHhvzBLHzji2nTrIDYnAMUSSa/5iNyeZF
	 iWrOoF6a+7aoklmUxOkGYSl0IX8JHsSoRVh3NHKhYnaoT/X5hlkeFHNiZUDaKdqB7Cxcd
	 EttADNSq6xtYwzzOgpb2Zfj8DTcjV7k+FpLjk6UjQGvrlzi9m3WuW1xe6zBBAfc=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1754400143;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=aedfEB1NQHYXKIy3YnbXDfNuqnbmZclnxEMhF2lvd8Q=;
	b=UTg6mpd1VMUCLMEaHRBBLOWHhSr9/lrGrceKcnVpRTGAC2cuQ2pMoOwFfnA+gutOyvnx
	 48cYA2YUF7ufDsvRY1ZR1C+sAq6h7yFWQXhX0SQhp3duLHLPT+GKGTVRMLL3srdRZr/bu
	 3aw6Gs+CkTsT+nleSjL+8SJ67ur7Go8TSyobeG5w0J0ir7rs/MYFGYB4JQ2ge0hop8ErU
	 TJ4baXBykBJoApxzOV8QOdBsgOQlYai22vAa56matUzk4UPPRtr8Vq7bdhYv0CCnUvnsH
	 NThRh9KBL2UHvTU9D2jsL1zDFNFP7Mu8q7batdG2jyHjNe7xdHm5P9blEhNp49WADxDyE
	 BSsAHBaCakdOeKAlWByw3kEuu5sjAfiL04uEgg7mZxIXQOOiJFWt9tSAH+GF4SDI7xMXr
	 5S/D9KoZaBoPb7FLfe1/Mt5L8DRhYP5eq6Pe2K5AhNpddQTwOXGOCbtFI2Zu9FP+FYm+i
	 BnokNq3MTCaFthhC4xSFY/byYGvTFBb3gQp4QRM45Sz/1IbZwmejX7MNhdlAT4tm+gaOw
	 VNf9uEAAgVSq6TMlGshjkVKZowbqD1mQVXElFic14sRzfCvVlZev4bMQxit3acpSDjpaO
	 REa5M/UfljNSD57BX1WtklMfTBJujSMIYTSmEaznrBWaJhyg4lREyB4pQa5kgn0=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1754400143; bh=fLlSmMB8OttCWI618y1+A1e6c9DZsadgQRWTgiALugA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Z9XSomEccalJz+RpSSbEQEIzOjRWdQ1wAMg1Cq/qUq5+FDb3xkplB+YlgzCLZArB9
	 9Ut0LhrA0+wT3hqvg+IPk6wnsrzchdfNVEMkyFTT1nV+hSNkbREKEb2MiVnkSgYrUJ
	 56LXRN2+yX4uxnh9bjKwo/U+qX9G1yQxIvB1l/TeV7VQr+I//MlI6q8DPKMGqTKF10
	 WO/F2fbkapeOttMufpft+96tYl9O+jjWuSg2IxuGX/e4PViRR85u+8Z1e2yDTxlCq4
	 EyS0j1NGgxHlF3qqrZskMZQQpj73nKesn/oP5n+bWyv2JZtfmD0QuWJZz5ERkBxv9f
	 YJP715kbXHnaA==
MIME-Version: 1.0
Date: Tue, 05 Aug 2025 15:22:23 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Dario Faggioli <dfaggioli@suse.com>, Juergen
 Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH] misra: fix violations in macros GVA_INFO, TRACE_TIME
In-Reply-To: <91d2a8ec-8a8e-404a-85ac-1038317e937b@epam.com>
References: <73cfc8a2d4d66042b49f44c69e672ce8ad0556ce.1753971749.git.dmytro_prokopchuk1@epam.com>
 <470a04e6-f8c1-4937-8478-0f80107d562d@citrix.com>
 <898e1c2a-7684-489b-84cd-254b2ee53e5d@suse.com>
 <9952fc5c-b95a-4879-a442-12e491438e08@citrix.com>
 <689178480a418f04158d623e3cedd4bd@bugseng.com>
 <91d2a8ec-8a8e-404a-85ac-1038317e937b@epam.com>
Message-ID: <1a59e6d831fd7119df1e2bd0cdbe262b@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-08-05 13:49, Dmytro Prokopchuk1 wrote:
> On 7/31/25 19:09, Nicola Vetrini wrote:
>> On 2025-07-31 18:05, Andrew Cooper wrote:
>>> On 31/07/2025 4:58 pm, Jan Beulich wrote:
>>>> On 31.07.2025 17:37, Andrew Cooper wrote:
>>>>> On 31/07/2025 4:16 pm, Dmytro Prokopchuk1 wrote:
>>>>>> MISRA Rule 13.1: Initializer lists shall not contain persistent 
>>>>>> side
>>>>>> effects.
>>>>>> 
>>>>>> The violations occur because both the `GVA_INFO` and `TRACE_TIME`
>>>>>> macro
>>>>>> expansions include expressions with persistent side effects 
>>>>>> introduced
>>>>>> via inline assembly.
>>>>>> 
>>>>>> In the case of `GVA_INFO`, the issue stems from the initializer 
>>>>>> list
>>>>>> containing a direct call to `current`, which evaluates to
>>>>>> `this_cpu(curr_vcpu)` and involves persistent side effects via the
>>>>>> `asm` statement. To resolve this, the side-effect-producing 
>>>>>> expression
>>>>>> is computed in a separate statement prior to the macro 
>>>>>> initialization:
>>>>>> 
>>>>>>     struct vcpu *current_vcpu = current;
>>>>>> 
>>>>>> The computed value is passed into the `GVA_INFO(current_vcpu)` 
>>>>>> macro,
>>>>>> ensuring that the initializer is clean and free of such side 
>>>>>> effects.
>>>>>> 
>>>>>> Similarly, the `TRACE_TIME` macro violates this rule when 
>>>>>> accessing
>>>>>> expressions like `current->vcpu_id` and 
>>>>>> `current->domain->domain_id`,
>>>>>> which also depend on `current` and inline assembly. To fix this, 
>>>>>> the
>>>>>> value of `current` is assigned to a temporary variable:
>>>>>> 
>>>>>>     struct vcpu *v = current;
>>>>>> 
>>>>>> This temporary variable is then used to access `domain_id` and
>>>>>> `vcpu_id`.
>>>>>> This ensures that the arguments passed to the `TRACE_TIME` macro 
>>>>>> are
>>>>>> simple expressions free of persistent side effects.
>>>>>> 
>>>>>> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
>>>>> The macro `current` specifically does not (and must not) have side
>>>>> effects.  It is expected to behave like a plain `struct vcpu 
>>>>> *current;`
>>>>> variable, and what Eclair is noticing is the thread-local machinery
>>>>> under this_cpu() (or in x86's case, get_current()).
>>>>> 
>>>>> In ARM's case, it's literally reading the hardware thread pointer
>>>>> register.  Can anything be done to tell Eclair that `this_cpu()`
>>>>> specifically does not have side effects?
>>>>> 
>>>>> The only reason that GVA_INFO() and TRACE_TIME() are picked out is
>>>>> because they both contain embedded structure initialisation, and
>>>>> this is
>>>>> is actually an example where trying to comply with MISRA interferes
>>>>> with
>>>>> what is otherwise a standard pattern in Xen.
>>>> Irrespective of what you say, some of the changes here were 
>>>> eliminating
>>>> multiple adjacent uses of current, which - iirc - often the compiler
>>>> can't fold via CSE.
>>> 
>>> Where we have mixed usage, sure.  (I'm sure I've got a branch 
>>> somewhere
>>> trying to add some more pure/const around to try and help out here, 
>>> but
>>> I can't find it, and don't recall it being a major improvement 
>>> either.)
>>> 
>>> The real problem here is that there are a *very few* number of 
>>> contexts
>>> where Eclair refuses to tolerate the use of `current` citing side
>>> effects, despite there being no side effects.
>>> 
>>> That is the thing that breaks the principle of least surprise, and we
>>> ought to fix it by making Eclair happy with `current` everywhere, 
>>> rather
>>> than force people to learn that 2 macros can't have a `current` in 
>>> their
>>> parameter list.
>>> 
>> 
>> I'll take a look. Likely yes, by adding a handful of properties. There
>> are subtleties, though.
>> 
> 
> Hi, Nicola.
> 
> Did you have a chance to try configure Eclair to ignore this macro
> `this_cpu()`?
> 

Hi Dmytro,

I'm on it, I needed to handle other tasks first.

> Thanks.
> Dmytro

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

