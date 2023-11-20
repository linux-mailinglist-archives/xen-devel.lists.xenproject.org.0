Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B54F7F14FB
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 14:54:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636744.992468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r54jI-0003Z9-Qm; Mon, 20 Nov 2023 13:54:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636744.992468; Mon, 20 Nov 2023 13:54:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r54jI-0003WK-ND; Mon, 20 Nov 2023 13:54:24 +0000
Received: by outflank-mailman (input) for mailman id 636744;
 Mon, 20 Nov 2023 13:54:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r54jH-0003WE-0e
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 13:54:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r54jG-0007Ty-6e; Mon, 20 Nov 2023 13:54:22 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=[192.168.18.184]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r54jF-0006PS-T8; Mon, 20 Nov 2023 13:54:22 +0000
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
	bh=wvu691h30NLjTL7ttnnBQN4/RJmZXqF7VdOmD9t6MnE=; b=HDaXylDwJELYY5upUlwHEajkOR
	6/gf09bMNZ7IH0rSUYWM85lopykmU2AG+QnqUIXgdyZd1XbvbGTjHZnk1APmG/TVoCX9ADM2qb1s+
	gVvBO6n308xphnkz6imWakzRDfJD8fhtN0zTM96TEBVDs75w5bBDb05C7zRd1eSLRV/M=;
Message-ID: <4ad7f6ba-89f8-48ff-9b60-8d9d0dbe9afe@xen.org>
Date: Mon, 20 Nov 2023 13:54:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xenstored: print domain id in traces
Content-Language: en-GB
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20231116205613.3796068-1-volodymyr_babchuk@epam.com>
 <16a320e7-3d12-4c9e-9010-ce0fe37c7e33@xen.org> <874jhg38yd.fsf@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <874jhg38yd.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Volodymyr,

On 20/11/2023 12:28, Volodymyr Babchuk wrote:
> Julien Grall <julien@xen.org> writes:
> 
>> Hi Volodymyr,
>>
>> On 16/11/2023 20:56, Volodymyr Babchuk wrote:
>>> It is very helpful to see domain id why analyzing xenstored
>>> traces. Especially when you are trying to understand which exactly
>>> domain performs an action.
>>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>>> ---
>>>    tools/xenstored/core.c | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>> diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
>>> index edd07711db..311764eb0c 100644
>>> --- a/tools/xenstored/core.c
>>> +++ b/tools/xenstored/core.c
>>> @@ -135,8 +135,8 @@ static void trace_io(const struct connection *conn,
>>>    	now = time(NULL);
>>>    	tm = localtime(&now);
>>>    -	trace("io: %s %p %04d%02d%02d %02d:%02d:%02d %s (",
>>> -	      out ? "OUT" : "IN", conn,
>>> +	trace("io: %s %p (d%d) %04d%02d%02d %02d:%02d:%02d %s (",
>>
>> AFAICT conn->id is an unsigned int. So it should be d%u. This can be
>> dealt on commit.
>>
> 
> Yes, I missed this part. I have noticed that you already committed this
> change and even mentioned %u in the commit message. But in the diff [1] I am
> seeing %d. Should I sent another another patch that fixes this?

:(. I keep forgetting that "git commit --amend" only ammend the commit 
message. If you don't mind, can you send a follow-up?

Sorry for the inconvenience.

Cheers,

-- 
Julien Grall

