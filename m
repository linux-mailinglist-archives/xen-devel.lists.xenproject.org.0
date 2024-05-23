Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D78E8CD413
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 15:22:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728487.1133416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA8Nw-0001pn-PE; Thu, 23 May 2024 13:21:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728487.1133416; Thu, 23 May 2024 13:21:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA8Nw-0001nU-Mb; Thu, 23 May 2024 13:21:32 +0000
Received: by outflank-mailman (input) for mailman id 728487;
 Thu, 23 May 2024 13:21:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sA8Nu-0001nO-Vl
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 13:21:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sA8No-0006JT-Vs; Thu, 23 May 2024 13:21:24 +0000
Received: from [15.248.2.28] (helo=[10.24.67.32])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sA8No-0006iV-K4; Thu, 23 May 2024 13:21:24 +0000
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
	bh=Gx66I4BrAdQd+feteMIxgc9xH71WxYCBsj3qSxHZUhs=; b=FRicO7bSvLrCPgUinRzfn2OG6J
	CZCaBbTOUiUY0CQVb4QNJz1I6rJaPZjlMVnX0/d/DO0/EItqyLhIdIUrALIiJZ3ILUMFWdmf97oUs
	EJvTtKmf3yWqddxRNiYRm4ELYYXpAP9PoDKPv4zVRQwFlPQA063qfIYZj2PdxsNE1/BA=;
Message-ID: <e9ad99ed-bdff-4acf-9f08-8819b4cbdb7c@xen.org>
Date: Thu, 23 May 2024 14:21:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 03/14] xen/bitops: implement fls{l}() in common logic
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, "Oleksii K."
 <oleksii.kurochko@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1715952103.git.oleksii.kurochko@gmail.com>
 <43df611d1c7b7ac16b181fb819f5d886daa31bad.1715952103.git.oleksii.kurochko@gmail.com>
 <d26a4033-8cd1-4a9c-8549-49a36b7d52fb@suse.com>
 <9e59da99eb87a7d3fcd8cc6a3c6d6ef2753736af.camel@gmail.com>
 <df910cf3-b784-48a6-a0af-32527302fb9f@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <df910cf3-b784-48a6-a0af-32527302fb9f@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 22/05/2024 09:15, Jan Beulich wrote:
> On 22.05.2024 09:37, Oleksii K. wrote:
>> On Tue, 2024-05-21 at 13:18 +0200, Jan Beulich wrote:
>>> On 17.05.2024 15:54, Oleksii Kurochko wrote:
>>>> To avoid the compilation error below, it is needed to update to
>>>> places
>>>> in common/page_alloc.c where flsl() is used as now flsl() returns
>>>> unsigned int:
>>>>
>>>> ./include/xen/kernel.h:18:21: error: comparison of distinct pointer
>>>> types lacks a cast [-Werror]
>>>>         18 |         (void) (&_x == &_y);            \
>>>>            |                     ^~
>>>>      common/page_alloc.c:1843:34: note: in expansion of macro 'min'
>>>>       1843 |         unsigned int inc_order = min(MAX_ORDER, flsl(e
>>>> - s) - 1);
>>>>
>>>> generic_fls{l} was used instead of __builtin_clz{l}(x) as if x is
>>>> 0,
>>>> the result in undefined.
>>>>
>>>> The prototype of the per-architecture fls{l}() functions was
>>>> changed to
>>>> return 'unsigned int' to align with the generic implementation of
>>>> these
>>>> functions and avoid introducing signed/unsigned mismatches.
>>>>
>>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>> ---
>>>>   The patch is almost independent from Andrew's patch series
>>>>   (
>>>> https://lore.kernel.org/xen-devel/20240313172716.2325427-1-andrew.cooper3@citrix.com/T/#t
>>>> )
>>>>   except test_fls() function which IMO can be merged as a separate
>>>> patch after Andrew's patch
>>>>   will be fully ready.
>>>
>>> If there wasn't this dependency (I don't think it's "almost
>>> independent"),
>>> I'd be offering R-b with again one nit below.
>>
>> Aren't all changes, except those in xen/common/bitops.c, independent? I
>> could move these changes in xen/common/bitops.c to a separate commit. I
>> think it is safe to commit them ( an introduction of common logic for
>> fls{l}() and tests ) separately since the CI tests have passed.
> 
> Technically they might be, but contextually there are further conflicts.
> Just try "patch --dry-run" on top of a plain staging tree. You really
> need to settle, perhaps consulting Andrew, whether you want to go on top
> of his change, or ahead of it. I'm not willing to approve a patch that's
> presented one way but then is (kind of) expected to go in the other way.

I agree with what Jan wrote. I don't have any strong opinion on which 
order they should be merged. But, if your series is intended to be 
merged before Andrew's one then please rebase to vanilla staging.

I looked at the rest of the patch and it LGTM.

Cheers,

-- 
Julien Grall

