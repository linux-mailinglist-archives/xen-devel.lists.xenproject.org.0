Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B6C80D07C
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 17:05:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652356.1018156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCimi-0007hy-QB; Mon, 11 Dec 2023 16:05:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652356.1018156; Mon, 11 Dec 2023 16:05:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCimi-0007fK-NU; Mon, 11 Dec 2023 16:05:32 +0000
Received: by outflank-mailman (input) for mailman id 652356;
 Mon, 11 Dec 2023 16:05:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rCimh-0007fC-RJ
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 16:05:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rCimh-0008V0-22; Mon, 11 Dec 2023 16:05:31 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=[10.95.158.169]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rCimg-0005UX-Rt; Mon, 11 Dec 2023 16:05:30 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=lWxSdLNaXH7A4ljkX5TXvDnV7n/cRE3mQRQaunKjnqE=; b=Om8i62/NRRhWr9GEwch6bHfBDw
	OV1tQHMEGBSm/3MUUhIsmmLAGdscfHTx2h6vqYQ6yKx7wAcbxwxfj1bTXBEFc2w4V1IeA2ZHr1k9I
	pSjSbRZupM01fewxUX/uWk03jymgSoLpLgD9bd9f6Ob0PMiqGgPGCgUA0p5BBntPk3KY=;
Message-ID: <95690c3a-92c5-4e05-856b-088133b87650@xen.org>
Date: Mon, 11 Dec 2023 16:05:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 5/7] xen/arm: traps: add ASSERT_UNREACHABLE() where
 needed
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1702283415.git.nicola.vetrini@bugseng.com>
 <394b69b769f2dc2461d2ddb0c7e037f4794eb244.1702283415.git.nicola.vetrini@bugseng.com>
 <08e3c8f0-772e-4c08-9afc-c623f19c85e3@xen.org>
 <c77560d6044700f10a8b149d539a95d1@bugseng.com>
 <3b3b62a3-0691-4ae7-9234-a8a85516c9eb@xen.org>
In-Reply-To: <3b3b62a3-0691-4ae7-9234-a8a85516c9eb@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/12/2023 15:59, Julien Grall wrote:
> Hi Nicola,
> 
> On 11/12/2023 14:54, Nicola Vetrini wrote:
>> On 2023-12-11 13:32, Julien Grall wrote:
>>> Hi,
>>>
>>> On 11/12/2023 10:30, Nicola Vetrini wrote:
>>>> The branches of the switch after a call to 'do_unexpected_trap'
>>>> cannot return, but there is one path that may return, hence
>>>> only some clauses are marked with ASSERT_UNREACHABLE().
>>> I don't understand why this is necessary. The code should never be 
>>> reachable because do_unexpected_trap() is a noreturn().
>>>
>>> Cheers,
>>
>> It was meant as a safeguard against mistakes. 
> 
> I am confused about which mistakes you are trying to prevent. Are you 
> saying you are not trusting the noreturn attribute?
> 
> And if so, are you intending to add ASSERT_UNREACHABLE() after every 
> single call to noreturn functions?

Replying to myself. What's confusing the most is that in [1], you 
decided to not add the ASSERT_UNREACHABLE(). Yet the problem is similar.

I'd also like to point out that by removing the "break", then if the 
'noreturn' function turns out to return, then in prod build you would 
fallthrough to the next case. And who knows what's going to happen...

All of this really adds some confusion...

> 
>> There are MISRA rules that deal with this aspect (e.g., a noreturn 
>> function should not return), but they are not in Amendment 2, which is 
>> what Xen is following.
> Do you mind providing a bit more details about the rules you are talking 
> about? At least the numbers would be helpful.

[1] 
https://lore.kernel.org/xen-devel/c0a8a12e39d688e101936d221af0f8eeefabe352.1702283415.git.nicola.vetrini@bugseng.com/

Cheers,

-- 
Julien Grall

