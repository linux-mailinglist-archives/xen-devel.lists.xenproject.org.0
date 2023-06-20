Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 843AF736934
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 12:25:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551521.861113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBYY7-0002Kw-KS; Tue, 20 Jun 2023 10:25:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551521.861113; Tue, 20 Jun 2023 10:25:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBYY7-0002Hr-GW; Tue, 20 Jun 2023 10:25:23 +0000
Received: by outflank-mailman (input) for mailman id 551521;
 Tue, 20 Jun 2023 10:25:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FRxy=CI=bugseng.com=roberto.bagnara@srs-se1.protection.inumbo.net>)
 id 1qBYY6-0002Hl-61
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 10:25:22 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1b1bf24-0f54-11ee-b234-6b7b168915f2;
 Tue, 20 Jun 2023 12:25:20 +0200 (CEST)
Received: from [192.168.1.143] (unknown [151.46.142.235])
 by support.bugseng.com (Postfix) with ESMTPSA id 0C3D34EE0737;
 Tue, 20 Jun 2023 12:25:17 +0200 (CEST)
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
X-Inumbo-ID: c1b1bf24-0f54-11ee-b234-6b7b168915f2
Message-ID: <e1ca0aa6-6df4-b02c-14df-3d54d134be70@bugseng.com>
Date: Tue, 20 Jun 2023 12:25:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.7.12) Gecko/20050929
 Thunderbird/1.0.7 Fedora/1.0.7-1.1.fc4 Mnenhy/0.7.3.0
Subject: Re: [XEN PATCH] docs/misra: document the C dialect and translation
 toolchain assumptions.
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <db6e7432f92657c1386a475895c3b334e1c53693.1686839154.git.roberto.bagnara@bugseng.com>
 <alpine.DEB.2.22.394.2306151444310.897208@ubuntu-linux-20-04-desktop>
 <3499c107-ea0d-3a74-4278-86879a9d80e7@bugseng.com>
 <90eec636-7ae5-8e1b-1561-0de62e0bc799@suse.com>
 <5b166e61-1f28-ecb2-7b14-9972cf12aac7@bugseng.com>
 <978fc5da-bad3-c028-d95c-652ed1bcb3f4@suse.com>
From: Roberto Bagnara <roberto.bagnara@bugseng.com>
In-Reply-To: <978fc5da-bad3-c028-d95c-652ed1bcb3f4@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/06/23 13:47, Jan Beulich wrote:
> On 19.06.2023 12:53, Roberto Bagnara wrote:
>> On 19/06/23 09:54, Jan Beulich wrote:
>>> On 16.06.2023 17:54, Roberto Bagnara wrote:
>>>> On 16/06/23 01:26, Stefano Stabellini wrote:
>>>>> On Thu, 15 Jun 2023, Roberto Bagnara wrote:
>>>>>> +       static function is used in an inline function with external linkage:
>>>>>> +          non-documented GCC extension.
>>>>>
>>>>> I am not sure if I follow about this one. Did you mean "static is used
>>>>> in an inline function with external linkage" ?
>>>>
>>>> An inline function with external linkage can be inlined everywhere.
>>>> If that calls a static functions, which is not available everywhere,
>>>> the behavior is not defined.
>>>
>>> I guess I could do with an example where this leads to UB. What I'd expect
>>> is that it leads to a compilation error.
>>
>> Here are the two occurrences we have in ARM64 code:
>>
>> violation for rule MC3R1.R1.1: (required) The program shall contain no violations of the standard C syntax and constraints, and shall not exceed the implementation's translation limits.
>> xen/common/spinlock.c:316.29-316.40: Loc #1 [culprit: static function `observe_head(spinlock_tickets_t*)' is used in an inline function with external linkage (ill-formed for the C99 standard, ISO/IEC 9899:1999: "An ill-formed source detected by the parser."
>> xen/common/spinlock.c:301.26-301.37: Loc #2 [evidence: `observe_head(spinlock_tickets_t*)' declared here]
>> xen/include/xen/spinlock.h:180.1-180.4: Loc #3 [evidence: use 'static' to give inline function `_spin_lock_cb(spinlock_t*, void(*)(void*), void*)' internal linkage]
>>
>> violation for rule MC3R1.R1.1: (required) The program shall contain no violations of the standard C syntax and constraints, and shall not exceed the implementation's translation limits.
>> xen/common/spinlock.c:324.5-324.12: Loc #1 [culprit: static function `got_lock(union lock_debug*)' is used in an inline function with external linkage (ill-formed for the C99 standard, ISO/IEC 9899:1999: "An ill-formed source detected by the parser."
>> xen/common/spinlock.c:227.13-227.20: Loc #2 [evidence: `got_lock(union lock_debug*)' declared here]
>> xen/include/xen/spinlock.h:180.1-180.4: Loc #3 [evidence: use 'static' to give inline function `_spin_lock_cb(spinlock_t*, void(*)(void*), void*)' internal linkage]
> 
> I know _spin_lock_cb() was an example of a violation (it isn't anymore),
> but this does not serve as an example for the UB you claim may occur.
> The "inline" there was in a .c file, and hence the function could only
> be inlined with its (static) helper also in scope.

This is a constraint violation according to C99 6.7.4p3: "An inline definition
of a function with external linkage shall not contain a definition of a modifiable
object with static storage duration, and shall not contain a reference to an identifier
with internal linkage."  A standard-compliant C compiler ought to diagnose all
constraint violations: when it does not, as is the case for GCC in these specific
examples, the behavior is implicitly undefined.


