Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4BF773B26
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 17:44:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580080.908367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTOsU-0003bv-D1; Tue, 08 Aug 2023 15:44:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580080.908367; Tue, 08 Aug 2023 15:44:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTOsU-0003a9-AM; Tue, 08 Aug 2023 15:44:10 +0000
Received: by outflank-mailman (input) for mailman id 580080;
 Tue, 08 Aug 2023 15:44:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qTOsS-0003a3-Ty
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 15:44:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qTOsP-0008LA-2U; Tue, 08 Aug 2023 15:44:05 +0000
Received: from [15.248.2.255] (helo=[10.24.67.31])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qTOsO-0001oX-SL; Tue, 08 Aug 2023 15:44:05 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=sqyyigZHJaOtU1jw9Xx23TLmVkSGZVzIrTLrpNwpGN8=; b=b/jPwmZlgfsEpY4wQOHQQgxZuP
	TsheKpSUk+4vO3CrOfh+0CSV+kv4pTjQKEtZeD/g3DCLZrNYQYZiPo75LXsj0LUkTjxFaK8JAwxbv
	7SI0g3ax3kwbH715BnUwJKccPbO6gTH9DgXgHrapa1DUmHIn0D5AX2okqfp/G1xrOJww=;
Message-ID: <be588477-cafd-4875-aeef-9b17206a5cc5@xen.org>
Date: Tue, 8 Aug 2023 16:44:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 10/11] xen/sched: add ASSERT_UNREACHABLE() to address
 MISRA C:2012 Rule 2.1
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli
 <dfaggioli@suse.com>, Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
References: <cover.1690985045.git.nicola.vetrini@bugseng.com>
 <3f1385f2ddb151a53ca092ea1caeac5d12fd80f5.1690985045.git.nicola.vetrini@bugseng.com>
 <db2ac35e-b371-4537-9d56-8703e3648abe@xen.org>
 <5135e7ac-1025-3a45-7cf6-d049a15b8df5@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <5135e7ac-1025-3a45-7cf6-d049a15b8df5@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 08/08/2023 16:36, Jan Beulich wrote:
> On 08.08.2023 17:25, Julien Grall wrote:
>> On 02/08/2023 15:38, Nicola Vetrini wrote:
>>> The break statement after the return statement is definitely unreachable.
>>> As such, an call to the ASSERT_UNREACHABLE() macro is added to signal
>>> the intentionality of such construct.
>>
>> How about using unreachable() rather than ASSERT_UNREACHABLE()? The main
>> difference is the later will hint the compiler that the code cannot be
>> reached and will not crash Xen in debug build (this could be changed).
> 
> Isn't using unreachable() in place of ASSERT_UNREACHABLE() unsafe (not
> here but in general)?

Yes it is.

  It'll tell the compiler that (in the extreme case)
> it can omit the function epilogue, including the return instruction. In
> the resulting build, if the code turns out to be reachable, execution
> would fall through into whatever follows.

Right, but the problem is somewhat similar with adding 
ASSERT_UNREACHABLE() without proper error path because there is no 
guarantee the rest of the code will be correct in the unlikely case it 
is reachable.

> 
> In the case here ...
> 
>>> --- a/xen/common/sched/core.c
>>> +++ b/xen/common/sched/core.c
>>> @@ -2233,6 +2233,7 @@ static bool sched_tasklet_check_cpu(unsigned int cpu)
>>>            /* fallthrough */
>>>        case TASKLET_enqueued|TASKLET_scheduled:
>>>            return true;
>>> +        ASSERT_UNREACHABLE();
>>>            break;
>>>        case TASKLET_scheduled:
>>>            clear_bit(_TASKLET_scheduled, tasklet_work);
> 
> ... "return" alone already tells the compiler that "break" is
> unreachable. You don't need unreachable() for that. As said before,
> "break" like this simply want purging (and Misra is wrong to demand
> "break" everywhere - it should instead demand no [unannotated]
> fall-through, which can also be achieved by return, continue, and
> goto).

My suggestion was in the context of this series where we add 
ASSERT_UNREACHABLE() before break. From my understanding, we don't have 
a lot of leeway here because, from what Nicola wrote, rule 16.3 is 
mandatory.

So I think using unreachable is better if we every decide to use break 
after return.

Cheers,

-- 
Julien Grall

