Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E2580E77E
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 10:24:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652771.1018802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCyzb-0007Gp-4M; Tue, 12 Dec 2023 09:23:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652771.1018802; Tue, 12 Dec 2023 09:23:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCyzb-0007ER-1Y; Tue, 12 Dec 2023 09:23:55 +0000
Received: by outflank-mailman (input) for mailman id 652771;
 Tue, 12 Dec 2023 09:23:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rCyza-0007EL-A4
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 09:23:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rCyzZ-0002ia-LU; Tue, 12 Dec 2023 09:23:53 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rCyzZ-0008Ik-Eb; Tue, 12 Dec 2023 09:23:53 +0000
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
	bh=TB5yjhHPKMvliFzy0ZYrxRezpvoAmMnx8oPcMzhpCCQ=; b=J7Wdk9RSaJ3qNdKouHQIaTJYnA
	JgV/DrD02+gCwIXz9ZPbEY7Ip9F8DASVal6pzYfymrndgGGkKhE9Ld38ZYSlS4aixbg7GzyrWQv4n
	zm1GL+jKVYFFx1y14UclcHzv/vP6ZZp0SvbZCKOCeHsnQ8jZzBOf49RjssZknOGVbx4U=;
Message-ID: <a9489f10-b126-40fa-9b1e-6a8a47dcc071@xen.org>
Date: Tue, 12 Dec 2023 09:23:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 5/7] xen/arm: traps: add ASSERT_UNREACHABLE() where
 needed
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1702283415.git.nicola.vetrini@bugseng.com>
 <394b69b769f2dc2461d2ddb0c7e037f4794eb244.1702283415.git.nicola.vetrini@bugseng.com>
 <08e3c8f0-772e-4c08-9afc-c623f19c85e3@xen.org>
 <c77560d6044700f10a8b149d539a95d1@bugseng.com>
 <3b3b62a3-0691-4ae7-9234-a8a85516c9eb@xen.org>
 <95690c3a-92c5-4e05-856b-088133b87650@xen.org>
 <920a835236ff8cf922e515c5082770b7@bugseng.com>
 <alpine.DEB.2.22.394.2312111735500.1703076@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2312111735500.1703076@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 12/12/2023 01:36, Stefano Stabellini wrote:
> On Mon, 11 Dec 2023, Nicola Vetrini wrote:
>> On 2023-12-11 17:05, Julien Grall wrote:
>>> On 11/12/2023 15:59, Julien Grall wrote:
>>>> Hi Nicola,
>>>>
>>>> On 11/12/2023 14:54, Nicola Vetrini wrote:
>>>>> On 2023-12-11 13:32, Julien Grall wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On 11/12/2023 10:30, Nicola Vetrini wrote:
>>>>>>> The branches of the switch after a call to 'do_unexpected_trap'
>>>>>>> cannot return, but there is one path that may return, hence
>>>>>>> only some clauses are marked with ASSERT_UNREACHABLE().
>>>>>> I don't understand why this is necessary. The code should never be
>>>>>> reachable because do_unexpected_trap() is a noreturn().
>>>>>>
>>>>>> Cheers,
>>>>>
>>>>> It was meant as a safeguard against mistakes.
>>>>
>>>> I am confused about which mistakes you are trying to prevent. Are you
>>>> saying you are not trusting the noreturn attribute?
>>>>
>>>> And if so, are you intending to add ASSERT_UNREACHABLE() after every
>>>> single call to noreturn functions?
>>>
>>> Replying to myself. What's confusing the most is that in [1], you decided to
>>> not add the ASSERT_UNREACHABLE(). Yet the problem is similar.
>>>
>>> I'd also like to point out that by removing the "break", then if the
>>> 'noreturn' function turns out to return, then in prod build you would
>>> fallthrough to the next case. And who knows what's going to happen...
>>>
>>> All of this really adds some confusion...
>>>
>>
>> I should have checked before responding: do_trap_hyp_sync is not afaik
>> noreturn. Specifically, do_trap_brk may return. If I worked under the wrong
>> assumption, then certainly the ASSERT_UNREACHABLE-s should be dropped.
> 
> It looks like we could add noreturn to do_trap_brk. Julien what do you
> think?

You can't add noreturn to do_trap_brk(). It is used to handle WARN_ON() 
that *will* return.

Cheers,

-- 
Julien Grall

