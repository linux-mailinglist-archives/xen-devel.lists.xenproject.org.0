Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E572C878174
	for <lists+xen-devel@lfdr.de>; Mon, 11 Mar 2024 15:14:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691516.1077549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjgQ7-00038J-CF; Mon, 11 Mar 2024 14:14:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691516.1077549; Mon, 11 Mar 2024 14:14:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjgQ7-000365-9c; Mon, 11 Mar 2024 14:14:27 +0000
Received: by outflank-mailman (input) for mailman id 691516;
 Mon, 11 Mar 2024 14:14:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xWeI=KR=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rjgQ5-00035z-Ca
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2024 14:14:25 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a956c6cd-dfb1-11ee-afdc-a90da7624cb6;
 Mon, 11 Mar 2024 15:14:24 +0100 (CET)
Received: from [192.168.1.9] (net-93-144-106-196.cust.vodafonedsl.it
 [93.144.106.196])
 by support.bugseng.com (Postfix) with ESMTPSA id F2D074EE0C90;
 Mon, 11 Mar 2024 15:14:22 +0100 (CET)
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
X-Inumbo-ID: a956c6cd-dfb1-11ee-afdc-a90da7624cb6
Message-ID: <3e4bb597-3624-418e-93d0-b95042fd27a7@bugseng.com>
Date: Mon, 11 Mar 2024 15:14:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 03/16] misra: add deviations for direct inclusion
 guards
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1710145041.git.simone.ballarin@bugseng.com>
 <1fdfec12fd2207c294f50d01d8ec32f890b915d7.1710145041.git.simone.ballarin@bugseng.com>
 <adeb5103-81b4-4f04-9ff6-a0526c8065db@suse.com>
 <6472eb42-157a-4d6e-b5bb-daa74fbbd97b@bugseng.com>
 <a9f85f2b-3eae-4544-88dd-6984011f0ef9@suse.com>
From: Simone Ballarin <simone.ballarin@bugseng.com>
Organization: BUGSENG
In-Reply-To: <a9f85f2b-3eae-4544-88dd-6984011f0ef9@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/03/24 14:56, Jan Beulich wrote:
> On 11.03.2024 13:00, Simone Ballarin wrote:
>> On 11/03/24 11:08, Jan Beulich wrote:
>>> On 11.03.2024 09:59, Simone Ballarin wrote:
>>>> --- a/xen/arch/arm/include/asm/hypercall.h
>>>> +++ b/xen/arch/arm/include/asm/hypercall.h
>>>> @@ -1,3 +1,4 @@
>>>> +/* SAF-5-safe direct inclusion guard before */
>>>>    #ifndef __XEN_HYPERCALL_H__
>>>>    #error "asm/hypercall.h should not be included directly - include xen/hypercall.h instead"
>>>>    #endif
>>>> --- a/xen/arch/x86/include/asm/hypercall.h
>>>> +++ b/xen/arch/x86/include/asm/hypercall.h
>>>> @@ -2,6 +2,7 @@
>>>>     * asm-x86/hypercall.h
>>>>     */
>>>>    
>>>> +/* SAF-5-safe direct inclusion guard before */
>>>>    #ifndef __XEN_HYPERCALL_H__
>>>>    #error "asm/hypercall.h should not be included directly - include xen/hypercall.h instead"
>>>>    #endif
>>>
>>> Iirc it was said that this way checking for correct guards is suppressed
>>> altogether in Eclair, which is not what we want. Can you clarify this,
>>> please?
>>>
>>
>> My first change was moving this check inside the guard.
>> You commented my patch saying that this would be an error because someone can
>> include it directly if it has already been included indirectly.
>> I replied telling that this was the case also before the change.
>> You agreed with me, and we decided that the correct thing would be fixing the
>> check and not apply my temporary change to address the finding.
>>
>> Considering that the code should be amended, a SAF deviation seems to me
>> the most appropriate way for suppressing these findings.
> 
> Since I don't feel your reply addresses my question, asking differently: With
> your change in place, will failure to have proper guards (later) in these
> headers still be reported by Eclair?
> 
> Jan
> 

No, if you put something between the check and the guard,
no violation will be reported.


-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com)


