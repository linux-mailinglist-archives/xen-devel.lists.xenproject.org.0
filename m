Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CEA7E7DC4
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 17:30:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630605.983613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1UOd-0004gY-8H; Fri, 10 Nov 2023 16:30:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630605.983613; Fri, 10 Nov 2023 16:30:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1UOd-0004e8-5C; Fri, 10 Nov 2023 16:30:15 +0000
Received: by outflank-mailman (input) for mailman id 630605;
 Fri, 10 Nov 2023 16:30:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EgQD=GX=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r1UOc-0004cj-2j
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 16:30:14 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6bcf49b1-7fe6-11ee-98da-6d05b1d4d9a1;
 Fri, 10 Nov 2023 17:30:12 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 25C624EE073A;
 Fri, 10 Nov 2023 17:30:12 +0100 (CET)
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
X-Inumbo-ID: 6bcf49b1-7fe6-11ee-98da-6d05b1d4d9a1
MIME-Version: 1.0
Date: Fri, 10 Nov 2023 17:30:12 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Julien Grall <julien@xen.org>, Jbeulich <jbeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Andrew Cooper3
 <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich
 <jbeulich@suse.com>, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH][for-4.19] domain: add ASSERT to help static analysis
 tools
In-Reply-To: <cffef994-1cba-4ce2-acb5-96e0ddd61064@xen.org>
References: <3f163bb58993410183229e72eb1f227057f9b1c7.1699034273.git.nicola.vetrini@bugseng.com>
 <d67ec7e2-a606-ed62-150f-08e3c1c9aabe@suse.com>
 <44df74cb532bfb9642b1c8752ee8c0d6@bugseng.com>
 <2c8c246d-caea-5c8b-4a2a-83248422c48d@suse.com>
 <b407f981-c58c-4272-bc7c-1470a87e2487@xen.org>
 <4b4583f5-4cdb-6be9-20eb-22466b6aef28@suse.com>
 <483f3b34-ebd4-4613-b083-596bebf5ac15@xen.org>
 <alpine.DEB.2.22.394.2311091614010.3478774@ubuntu-linux-20-04-desktop>
 <cffef994-1cba-4ce2-acb5-96e0ddd61064@xen.org>
Message-ID: <0ad97e9ff3d703f56b24393e327cac84@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Hi everyone,

I trimmed the thread a bit, to make this more readable.

>>>>> IMHO, the only viable option would be to have a configuration to 
>>>>> keep
>>>>> ASSERT in production build for scanning tools.
>>>> 
>>>> But wouldn't that then likely mean scanning to be done on builds not 
>>>> also
>>>> used in production? Would doing so even be permitted when 
>>>> certification
>>>> is a requirement? Or do you expect such production builds to be used 
>>>> with
>>>> the assertions left in place (increasing the risk of a crash; recall 
>>>> that
>>>> assertions themselves may also be wrong, and hence one triggering in 
>>>> rare
>>>> cases may not really be a reason to bring down the system)?
>>> 
>>> I will leave Stefano/Nicola to answer from the certification 
>>> perspective. But
>>> I don't really see how we could get away unless we replace most of 
>>> the
>>> ASSERT() with proper runtime check (which may not be desirable for 
>>> ASSERT()s
>>> like this one).
>> 
>> For sure we don't want to replace ASSERTs with runtime checks.
>> 
>> Nicola, do we really need the ASSERT to be implemented as a check, or
>> would the presence of the ASSERT alone suffice as a tag, the same way 
>> we
>> would be using /* SAF-xx-safe */ or asmlinkage?
>> 
>> If we only need ASSERT as a deviation tag, then production builds vs.
>> debug build doesn't matter.
>> 
>> If ECLAIR actually needs ASSERT to be implemented as a check, could we
>> have a special #define to define ASSERT in a special way for static
>> analysis tools in production builds? For instance:
>> 
>> #ifdef STATIC_ANALYSIS
>> #define ASSERT(p) \
>>      do { if ( unlikely(!(p)) ) printk("ASSERT triggered %s:%d", 
>> __file__,__LINE__); } while (0)
>> #endif
> 
> Just to make 100% clear, you are saying that assessor will be happy if 
> we analyze it with ASSERT enabled but in production we use it wout them 
> enabled? The assumption here is that they should have *never* been 
> triggered so they surely should not happen in production.
> 
> Cheers,

First of all, Andrew is experimenting with an alternate solution, so we 
should wait making
any decision here until he can share the outcome of his findings.
However, from a certification perspective, the fact that the codebase is 
tested with
asserts enabled is a strong enough claim for a justification to be based 
on an assertion;
the code path just needs to be exercised by the tests.
Getting into the business of how to define asserts for static analysis 
is likely to
just cause more trouble.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

