Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 085497E472B
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 18:36:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628955.980930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0PzM-0005UQ-8B; Tue, 07 Nov 2023 17:35:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628955.980930; Tue, 07 Nov 2023 17:35:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0PzM-0005Rc-5E; Tue, 07 Nov 2023 17:35:44 +0000
Received: by outflank-mailman (input) for mailman id 628955;
 Tue, 07 Nov 2023 17:35:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r0PzK-0005RU-FI
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 17:35:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r0PzJ-0001WF-M7; Tue, 07 Nov 2023 17:35:41 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.15.180]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r0PzJ-0006Lx-DR; Tue, 07 Nov 2023 17:35:41 +0000
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
	bh=j21g8dpn/q+EGMfdr9jayfb1ajEj2csdSt6CFQ/MqKA=; b=VuQaGbEKgfEMW0vD00Uu0b7vUY
	iXIPdHdF5tyoszMGmW893EDjGav3YTgJNibmCWti6ETuSAJtK7JNnwavrgkb/U0jtPUvOGkWNb6nn
	Dk2MJ3g1PxJA0B4UI4vcNJZ5gFtbKUPH2Qrm4K3dgeEnSQ7jz0Ct20sPW7+wusRN8wFk=;
Message-ID: <a35f339b-29c4-4618-a631-0b53019424b1@xen.org>
Date: Tue, 7 Nov 2023 17:35:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 4/4] automation/eclair: add deviation for certain
 backwards goto
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com,
 roger.pau@citrix.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
References: <cover.1699295113.git.nicola.vetrini@bugseng.com>
 <306ca49d5d63ea0614bbcef470efec9234d1a018.1699295113.git.nicola.vetrini@bugseng.com>
 <a95c6666-dbf3-4f1f-9618-b1f31bf47710@xen.org>
 <31d0509acf5a31351d6efa7c66710729@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <31d0509acf5a31351d6efa7c66710729@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07/11/2023 14:45, Nicola Vetrini wrote:
> Hi Julien,

Hi,

> On 2023-11-07 13:44, Julien Grall wrote:
>>> +in the community."
>>> +-config=MC3R1.R15.2,reports+={deliberate, 
>>> "any_area(any_loc(text(^.*goto (again|retry).*$)))"}
>>> +-doc_end
>>> +
>>>   #
>>>   # Series 20.
>>>   #
>>> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
>>> index 8511a189253b..7d1e1f0d09b3 100644
>>> --- a/docs/misra/deviations.rst
>>> +++ b/docs/misra/deviations.rst
>>> @@ -208,6 +208,16 @@ Deviations related to MISRA C:2012 Rules:
>>>          statements are deliberate.
>>>        - Project-wide deviation; tagged as `disapplied` for ECLAIR.
>>>   +   * - R15.2
>>> +     - The possible prevention of developer confusion as a result of 
>>> using
>>> +       control flow structures other than backwards goto-s in some 
>>> instances was
>>> +       deemed not strong enough to justify the additional complexity 
>>> introduced
>>> +       in the code. Such instances are the uses of the following 
>>> labels:
>>> +
>>> +       - again
>>> +       - retry
>>
>> Have you investigated the possibility to use SAF-X in the code? If so, 
>> what's the problem to use them?
>>
>> Cheers,
> 
> This is another viable option: putting the SAF comment on top of the 
> label should suffice,
> as shown below:
> 
> /* SAF-2-safe */
> repeat:
>      ++fmt;          /* this also skips first '%' */
>      switch (*fmt) {
>      case '-': flags |= LEFT; goto repeat;
>      case '+': flags |= PLUS; goto repeat;
>      case ' ': flags |= SPACE; goto repeat;
>      case '#': flags |= SPECIAL; goto repeat;
>      case '0': flags |= ZEROPAD; goto repeat;
>      }
> 
> I think it ultimately boils down to whether Xen wants to promote the use 
> of certain labels
> as the designated alternative when no other control flow mechanism is 
> clearer from a
> readability perspective (in which case there should be a consistent 
> naming to capture and deviate
> all of them, such as "retry") or do so on a case-by-case basis with a 
> SAF, which is ok,

I would prefer a case-by-case basis because it adds an additional 
review. With deviating by keywords, the reviewrs/developpers may not be 
aware of the deviation (which may be fine for some, but IMHO not this one).

> but then
> it needs someone to check each one and either fix them or mark them as ok.

Don't we technically already need to go through all the existing use of 
ready & co even if we deviate by keyword?

> Yet another route could be to mark with a SAF all those present right 
> now to establish a baseline.

How many do we have?

Cheers,

-- 
Julien Grall

