Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CBDB1C353
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 11:28:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1071484.1434918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujaQa-0004uy-Dk; Wed, 06 Aug 2025 09:27:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1071484.1434918; Wed, 06 Aug 2025 09:27:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujaQa-0004sx-BC; Wed, 06 Aug 2025 09:27:20 +0000
Received: by outflank-mailman (input) for mailman id 1071484;
 Wed, 06 Aug 2025 09:27:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Huua=2S=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1ujaQY-0004sp-JF
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 09:27:19 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8abd2adf-72a7-11f0-a322-13f23c93f187;
 Wed, 06 Aug 2025 11:27:16 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 1AC774EE3C08;
 Wed,  6 Aug 2025 11:27:15 +0200 (CEST)
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
X-Inumbo-ID: 8abd2adf-72a7-11f0-a322-13f23c93f187
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1754472435;
	b=AJkuH9J5YqrP5II6/gS1aTZbyz1dHlg4LoI/VW1rJhc6V3TIY3BqohDM2evb0LqNPRTe
	 Pe0AA+NPmqr6ZcN41YkAlglgg4SktmX/O/iajf77rGjc8DI9QfyA1ZM4liOrENzE2iKlZ
	 liFtCu0UPNTR89V30kZWSHxp90Lc+XhaQnwbdJccDrEJqOWtN/8qqqSJguzUhbc2eQEvm
	 xMaRk2hoCJdRuMNcwwMQq19UHaODCT+Hqp8LYw0OANgpqFo6nzLjB+SR9pgJ1r1xp32W5
	 mBhp/Vgkmlj5ByhRG7ZItue8/poetqUQDbKiMYTdfCXtjcKpKDD16LPxGEMKRzFA6xQ7F
	 S2U1SzTI62iKGZu7OZkrD6SAa7Y1ok2s0dsa2ksqMD91r4xuMVSkut8zU1UxCpgqDGeyn
	 wA7dbY//0HffncScx/iS0oJ3gzCpp56cvleVBpydSkmdN6hjotdxgenM4x6TdF8DFv0I3
	 dULs3uHS+vZ9pkjsg8mR5rKHY9bRVSgTsdlqBV8Zx+yN5I3kxnceobT77Zi7JwYUgPZJB
	 gyFPs5DPzfwrxtkMmfmewNjaFggEBveVp0JrxGXK+o52f8Yv+R0gzUjXQCdcoTgdDM6LA
	 SAMYcAB5JLMLDjTBfDd13jfqWjYZam67wXveYHi+2+2eHpnNBuFjXD/YcfZwgBU=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1754472435;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=zHBloSQqeTefUgcInSIkotrVwYowy0OPUoNB4Uzss/E=;
	b=vhY9oXqI+BVMKkrK+eRa9nbeDuRXqsMlU+ZlEgh09tEcFkxbAFMpWUE4Y/qC6lKcaFA+
	 Esix8dL0XZwEyJaTgNr6xbmFbJObnvoA5Ac8FNZxNDza19tfWNK7TOUoaRNcS+b0AcAW+
	 JnN22BOMuJindwOjH1XBKeBfVEmHVNO3J9f/EcmJpQBnPFIWdPCvt6xj6oZQSL+bN3U2b
	 Pq+UaovU0/k2MnVAivtRIndu8xbYmM5sXDwu9PoqnBpzWWcjl6IPSExaZJXQIWLCNef7B
	 CpWfpqRizXVrTBQPfPAiMh/kBIogpcXIfueNVVzDh+WmF0/4iCZF8aGeuYn3PwATX6FlY
	 SyK8bhwS4gzAaB+ck+RALG+b5Nuq0NnXLfLAqFFERQ2NDqtzMpSs1Azk/iyFfaOpFCLZ2
	 8dGVexZJngVQk8ZodzAhJJcU0j/kH2aP+uYZ/jivgxzRVwP1j1dOgYU8uzP84mkMTVQDh
	 9HZob6Vp6gh6AjK76QeDya9Pdtb9b+lWmPUeSgUBqPlU8iKqAGUxYCSI3StmytwbSEJNU
	 4oTjgzstEQOnMkV7eOxFFMEiqOHoPIDd7axEaw15VgnZ95V6pZL4D0CCIDLl+8o5CQIRn
	 iBalF/IxQcNVFvvwsGECZ4hkhFDQtMquvnvdKmFnZ+TiHcFHLayVRZFEQgppm0s=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1754472435; bh=7Hjdjh+aV53vBodBhPbYzgpJ/VZHR0kXFsVhxXLFUak=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VWiJ12VferULVv14GIrzNYcCNTIJvJxmGnur1L8PTAGVNrfwZyFVfZVwTDpjI0KDm
	 08z3CbHlvsJX0LN1xR3/8n64vnxoyozI/v6O2IkKzVVbcURlJ3LT4kVkNHBM0dYtD6
	 S9Pp+sq2iNIj26q/bsgsJ8xX7G504MxyPAErX2ihLa02U8ui8LZG0AWxrQr0t9RLwh
	 xO41u2inoMG7j8vQ1kdKcjypBa1bCcKwglj1vn8jjAXQtuSampMpjjOnF8zhuMoY5U
	 MgE/BBZhqqGIOt4RLC8OdWVm7Ma0rkTW/Y+emmqMtJn50ODLnuGEwB9fBtvSurAICP
	 8S0bS983ILy6w==
MIME-Version: 1.0
Date: Wed, 06 Aug 2025 11:27:15 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Dario Faggioli <dfaggioli@suse.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>,
 xen-devel@lists.xenproject.org, Andrew Cooper3 <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] misra: fix violations in macros GVA_INFO, TRACE_TIME
In-Reply-To: <1a59e6d831fd7119df1e2bd0cdbe262b@bugseng.com>
References: <73cfc8a2d4d66042b49f44c69e672ce8ad0556ce.1753971749.git.dmytro_prokopchuk1@epam.com>
 <470a04e6-f8c1-4937-8478-0f80107d562d@citrix.com>
 <898e1c2a-7684-489b-84cd-254b2ee53e5d@suse.com>
 <9952fc5c-b95a-4879-a442-12e491438e08@citrix.com>
 <689178480a418f04158d623e3cedd4bd@bugseng.com>
 <91d2a8ec-8a8e-404a-85ac-1038317e937b@epam.com>
 <1a59e6d831fd7119df1e2bd0cdbe262b@bugseng.com>
Message-ID: <fd5603bdbf7c1180b988b57dc5cbf631@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-08-05 15:22, Nicola Vetrini wrote:
> On 2025-08-05 13:49, Dmytro Prokopchuk1 wrote:
>> On 7/31/25 19:09, Nicola Vetrini wrote:
>>> On 2025-07-31 18:05, Andrew Cooper wrote:
>>>> On 31/07/2025 4:58 pm, Jan Beulich wrote:
>>>>> On 31.07.2025 17:37, Andrew Cooper wrote:
>>>>>> On 31/07/2025 4:16 pm, Dmytro Prokopchuk1 wrote:
>>>>>>> MISRA Rule 13.1: Initializer lists shall not contain persistent 
>>>>>>> side
>>>>>>> effects.
>>>>>>> 
>>>>>>> The violations occur because both the `GVA_INFO` and `TRACE_TIME`
>>>>>>> macro
>>>>>>> expansions include expressions with persistent side effects 
>>>>>>> introduced
>>>>>>> via inline assembly.
>>>>>>> 
>>>>>>> In the case of `GVA_INFO`, the issue stems from the initializer 
>>>>>>> list
>>>>>>> containing a direct call to `current`, which evaluates to
>>>>>>> `this_cpu(curr_vcpu)` and involves persistent side effects via 
>>>>>>> the
>>>>>>> `asm` statement. To resolve this, the side-effect-producing 
>>>>>>> expression
>>>>>>> is computed in a separate statement prior to the macro 
>>>>>>> initialization:
>>>>>>> 
>>>>>>>     struct vcpu *current_vcpu = current;
>>>>>>> 
>>>>>>> The computed value is passed into the `GVA_INFO(current_vcpu)` 
>>>>>>> macro,
>>>>>>> ensuring that the initializer is clean and free of such side 
>>>>>>> effects.
>>>>>>> 
>>>>>>> Similarly, the `TRACE_TIME` macro violates this rule when 
>>>>>>> accessing
>>>>>>> expressions like `current->vcpu_id` and 
>>>>>>> `current->domain->domain_id`,
>>>>>>> which also depend on `current` and inline assembly. To fix this, 
>>>>>>> the
>>>>>>> value of `current` is assigned to a temporary variable:
>>>>>>> 
>>>>>>>     struct vcpu *v = current;
>>>>>>> 
>>>>>>> This temporary variable is then used to access `domain_id` and
>>>>>>> `vcpu_id`.
>>>>>>> This ensures that the arguments passed to the `TRACE_TIME` macro 
>>>>>>> are
>>>>>>> simple expressions free of persistent side effects.
>>>>>>> 
>>>>>>> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
>>>>>> The macro `current` specifically does not (and must not) have side
>>>>>> effects.  It is expected to behave like a plain `struct vcpu 
>>>>>> *current;`
>>>>>> variable, and what Eclair is noticing is the thread-local 
>>>>>> machinery
>>>>>> under this_cpu() (or in x86's case, get_current()).
>>>>>> 
>>>>>> In ARM's case, it's literally reading the hardware thread pointer
>>>>>> register.  Can anything be done to tell Eclair that `this_cpu()`
>>>>>> specifically does not have side effects?
>>>>>> 
>>>>>> The only reason that GVA_INFO() and TRACE_TIME() are picked out is
>>>>>> because they both contain embedded structure initialisation, and
>>>>>> this is
>>>>>> is actually an example where trying to comply with MISRA 
>>>>>> interferes
>>>>>> with
>>>>>> what is otherwise a standard pattern in Xen.
>>>>> Irrespective of what you say, some of the changes here were 
>>>>> eliminating
>>>>> multiple adjacent uses of current, which - iirc - often the 
>>>>> compiler
>>>>> can't fold via CSE.
>>>> 
>>>> Where we have mixed usage, sure.  (I'm sure I've got a branch 
>>>> somewhere
>>>> trying to add some more pure/const around to try and help out here, 
>>>> but
>>>> I can't find it, and don't recall it being a major improvement 
>>>> either.)
>>>> 
>>>> The real problem here is that there are a *very few* number of 
>>>> contexts
>>>> where Eclair refuses to tolerate the use of `current` citing side
>>>> effects, despite there being no side effects.
>>>> 
>>>> That is the thing that breaks the principle of least surprise, and 
>>>> we
>>>> ought to fix it by making Eclair happy with `current` everywhere, 
>>>> rather
>>>> than force people to learn that 2 macros can't have a `current` in 
>>>> their
>>>> parameter list.
>>>> 
>>> 
>>> I'll take a look. Likely yes, by adding a handful of properties. 
>>> There
>>> are subtleties, though.
>>> 
>> 
>> Hi, Nicola.
>> 
>> Did you have a chance to try configure Eclair to ignore this macro
>> `this_cpu()`?
>> 
> 
> Hi Dmytro,
> 
> I'm on it, I needed to handle other tasks first.
> 

A solution has been devised by extending ECLAIR. The runner will be 
updated with the latest ECLAIR version, and as a result a couple of 
other patches will be submitted to adapt for it.

>> Thanks.
>> Dmytro

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

