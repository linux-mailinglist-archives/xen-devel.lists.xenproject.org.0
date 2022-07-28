Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA253583B55
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jul 2022 11:36:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376719.609678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGzvt-0003y7-MQ; Thu, 28 Jul 2022 09:35:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376719.609678; Thu, 28 Jul 2022 09:35:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGzvt-0003uo-J6; Thu, 28 Jul 2022 09:35:53 +0000
Received: by outflank-mailman (input) for mailman id 376719;
 Thu, 28 Jul 2022 09:35:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oGzvs-0003uS-Fv
 for xen-devel@lists.xenproject.org; Thu, 28 Jul 2022 09:35:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oGzvr-00052P-Ip; Thu, 28 Jul 2022 09:35:51 +0000
Received: from [54.239.6.185] (helo=[192.168.5.18])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oGzvr-0002Be-CD; Thu, 28 Jul 2022 09:35:51 +0000
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
	bh=T0vdA59yfPVzgSOjk2kk/p/YIypWJXGCmrzn6PTyHpY=; b=HHU6cJ+wOVrey1OMJBBo8Km0ns
	52/1P4X5tKf+0D+CW1OANHgD74iO0HGtGdOB1NV63gXWhR42K2YPnf+uEBPZhhJi/QHKhD6datJe1
	DAv2mqb/nREQkhQFzopThBlnHVjtH8ExLeNo99OVjtA2i1PP5W0U9M0qnM6+tFAdYcHg=;
Message-ID: <49ed6d31-76fd-c962-5320-c88726b45987@xen.org>
Date: Thu, 28 Jul 2022 10:35:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.0.3
Subject: Re: [PATCH 2/2] xen/arm: asm/atomic.h: Fix MISRA C 2012 Rule 2.5
 violation
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220727153254.1143503-1-burzalodowa@gmail.com>
 <20220727153254.1143503-3-burzalodowa@gmail.com>
 <d0e8f4b6-a66e-48c3-4f29-728cc7f5fafc@xen.org>
 <93036B23-69AA-4075-A54F-1EC8CB194928@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <93036B23-69AA-4075-A54F-1EC8CB194928@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 28/07/2022 08:57, Bertrand Marquis wrote:
> Hi Julien,

Hi Bertrand,

> 
>> On 27 Jul 2022, at 16:46, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Xenia,
>>
>> On 27/07/2022 16:32, Xenia Ragiadakou wrote:
>>> Remove unused macro atomic_xchg().
>>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
>>> ---
>>> xen/arch/arm/include/asm/atomic.h | 2 --
>>> 1 file changed, 2 deletions(-)
>>> diff --git a/xen/arch/arm/include/asm/atomic.h b/xen/arch/arm/include/asm/atomic.h
>>> index f5ef744b4b..a2dc125291 100644
>>> --- a/xen/arch/arm/include/asm/atomic.h
>>> +++ b/xen/arch/arm/include/asm/atomic.h
>>> @@ -223,8 +223,6 @@ static inline int atomic_add_unless(atomic_t *v, int a, int u)
>>> return __atomic_add_unless(v, a, u);
>>> }
>>> -#define atomic_xchg(v, new) (xchg(&((v)->counter), new))
>>> -
>>
>> While I agree this is unused today, the wrapper is quite trivial and part of the generic API (x86 also provides one). So I am not in favor of removing it just to please MISRA.
>>
>> That said, if Bertrand and Stefano agrees with removing it then you should also remove the x86 version to avoid inconsistency.
> 
> I think we can keep this and maybe add a comment on top to document a known violation:
> /* TODO: MISRA_VIOLATION 2.5 */

While I am fine with this goal of the comment (i.e. indicating where Xen 
is not MISRA compliant), I think this is one place where I would rather 
not want one because it can get stale if someones decide to use the 
function.

Cheers,

-- 
Julien Grall

