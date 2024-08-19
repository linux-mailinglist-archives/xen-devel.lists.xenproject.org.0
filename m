Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89429956B6B
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2024 15:01:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.779687.1189392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sg20X-0004Rs-Gf; Mon, 19 Aug 2024 13:01:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 779687.1189392; Mon, 19 Aug 2024 13:01:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sg20X-0004Py-Dx; Mon, 19 Aug 2024 13:01:13 +0000
Received: by outflank-mailman (input) for mailman id 779687;
 Mon, 19 Aug 2024 13:01:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sg20V-0004Ps-P1
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2024 13:01:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sg20U-0003zy-Tf; Mon, 19 Aug 2024 13:01:10 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sg20U-0000sl-LW; Mon, 19 Aug 2024 13:01:10 +0000
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
	bh=+VnDYPZKkClqT/JA0a96f1/HE3BvvyWWvPwWbAcoIu8=; b=tfBAZKyOYHmjHeoyO3+EzMueJ9
	TP5aUnGqYJKKBapinx2o7zftROP2UVON5A1us0/gGzuDBoUj6KP8TTYswTTdrEL/JvZneKZmITn+X
	wJS5Dk5rMk01i/vAkOW1PnB2gnDSbu+bjcpJRJDpoiTc2QJvz6uv9Yf7+4YiQpX1XqlA=;
Message-ID: <d0adc2ad-9cfe-4270-bf77-61d0650effb6@xen.org>
Date: Mon, 19 Aug 2024 14:01:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] xen: make VMAP only support in MMU system
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: xen-devel@lists.xenproject.org, Penny Zheng <penny.zheng@arm.com>,
 Wei Chen <wei.chen@arm.com>, sstabellini@kernel.org,
 bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com
References: <20240813171356.46760-1-ayan.kumar.halder@amd.com>
 <20240813171356.46760-3-ayan.kumar.halder@amd.com>
 <6d333d94-80ad-485c-b024-a45a388b96a4@suse.com>
 <ef789757-8c03-4f97-9bfb-8ec2fd2f4ca2@amd.com>
 <dad27ab7-3cbd-4a8e-8200-adea52b26e55@suse.com>
 <597b358e-3b45-4fba-922d-31208b55d15a@amd.com>
 <9fd1801c-1460-44e5-b066-f6da1167543b@xen.org>
 <1a328f00-3b0d-4e9c-856c-97c3a80dfdef@amd.com>
 <ff48fff8-a659-4e63-8e1f-2385a936ad61@suse.com>
 <826532b8-1618-4246-aefb-d5315b877d6b@xen.org>
 <759d5d83-b09c-4853-8ec0-63a19faf8af5@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <759d5d83-b09c-4853-8ec0-63a19faf8af5@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 19/08/2024 13:24, Jan Beulich wrote:
> On 19.08.2024 14:12, Julien Grall wrote:
>> On 19/08/2024 12:39, Jan Beulich wrote:
>>> Guys,
>>>
>>> On 19.08.2024 11:45, Ayan Kumar Halder wrote:
>>>> On 16/08/2024 17:40, Julien Grall wrote:
>>>>> On 14/08/2024 13:33, Ayan Kumar Halder wrote:
>>>
>>> mind me asking why I continue to be on the To: list of this communication
>>> between the two of you?
>>
>> You were involved in the review and AFAICT will still touch the common
>> code. I am happy to remove you from the conversation if you are not
>> interested :).
> 
> That wasn't my request though. It's fine to keep me Cc-ed.

TBH, in this context, the difference between CC and TO is very blur.

For me, CC is for people that may be interested but not involved in the 
conversation. In this case, Ayan was suggesting whether we should use 
ARCH_VMAP or not.

Given you reviewed the rest, I feel you have your say on this decision. 
Hence why the TO makes sense. But I also understand why people may view 
it differently...

Personally, I don't make any filter on "cc" vs "to" because this is a 
matter of opinion whether you think someone should be actively involved 
(or not) in the discussion. So it is best if I look at everything even 
if this is just having a glancing look at on the content.

If you have some clear and unambiguous rules on when you want to be in 
the CC or TO, then I would be happy to follow them.

Cheers,

-- 
Julien Grall


