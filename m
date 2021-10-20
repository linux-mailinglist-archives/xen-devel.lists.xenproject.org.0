Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FADD434E39
	for <lists+xen-devel@lfdr.de>; Wed, 20 Oct 2021 16:48:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213979.372368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdCtN-0005Dm-08; Wed, 20 Oct 2021 14:48:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213979.372368; Wed, 20 Oct 2021 14:48:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdCtM-0005BC-Sa; Wed, 20 Oct 2021 14:48:32 +0000
Received: by outflank-mailman (input) for mailman id 213979;
 Wed, 20 Oct 2021 14:48:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mdCtL-0005B6-Gw
 for xen-devel@lists.xenproject.org; Wed, 20 Oct 2021 14:48:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mdCtJ-0007VQ-R4; Wed, 20 Oct 2021 14:48:29 +0000
Received: from [54.239.6.185] (helo=[192.168.28.129])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mdCtJ-0005SS-L3; Wed, 20 Oct 2021 14:48:29 +0000
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
	bh=UwwupO7u8aeVtxcWJL1Hl3yNiRsNjMoSRB5OurzcRt8=; b=c/oFrCEulOvU6cOZOlbXVq4r9U
	XblMDdNtMQavqNhdI4/oAcBPmhMF1Pksjs2TMpXSlNz269G9uccCwXeZ4obwdMib++GMP/o5aF7T+
	zSBl+nx5cFYyO2U38hnxLxQ1T8rV5k7thAxrDaVuksgxcZ6VDaIVpQ/94Lkig1NxR+cA=;
Message-ID: <c562716d-78aa-1662-065b-65290f0ecf65@xen.org>
Date: Wed, 20 Oct 2021 15:48:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH v2 5/6] tools/xenstored: partially handle domains without
 a shared ring
From: Julien Grall <julien@xen.org>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 raphning@amazon.co.uk, "Doebel, Bjoern" <doebel@amazon.de>
References: <20210922082123.54374-1-roger.pau@citrix.com>
 <20210922082123.54374-6-roger.pau@citrix.com>
 <0aed8667-7f31-b0fb-3358-c5fd9a5734a1@xen.org>
 <YUr+K0tg6mspyOyd@MacBook-Air-de-Roger.local>
 <69285850-4168-b30c-db47-8c0649bd1ffc@xen.org>
 <09c4bad1-99e3-5d24-873e-4aca9acd6fed@suse.com>
 <56bb55e3-ca7a-12e6-5848-84756b431846@xen.org>
 <YUwrZS3FOh+hCQle@MacBook-Air-de-Roger.local>
 <041bbb31-700f-0ebd-d255-47a4aec927d8@xen.org>
In-Reply-To: <041bbb31-700f-0ebd-d255-47a4aec927d8@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi all,

On 23/09/2021 08:56, Julien Grall wrote:
> On 23/09/2021 12:23, Roger Pau Monné wrote:
>> On Wed, Sep 22, 2021 at 06:46:25PM +0500, Julien Grall wrote:
>>> I thought a bit more and looked at the code (I don't have access to a 
>>> test
>>> machine at the moment). I think there is indeed a problem.
>>>
>>> Some watchers of @releaseDomain (such as xenconsoled) will only remove a
>>> domain from their internal state when the domain is actually dead.
>>>
>>> This is based on dominfo.dying which is only set when all the 
>>> resources are
>>> relinquished and waiting for the other domains to release any 
>>> resources for
>>> that domain.
>>>
>>> The problem is Xenstore may fail to map the interface or the event 
>>> channel
>>> long before the domain is actually dead. With the current check, we 
>>> would
>>> free the allocated structure and therefore send @releaseDomain too 
>>> early. So
>>> daemon like xenconsoled, would never cleanup for the domain and leave a
>>> zombie domain. Well... until the next @releaseDomain (or 
>>> @introduceDomain
>>> for Xenconsoled) AFAICT.
>>>
>>> The revised patch is meant to solve it by just ignoring the 
>>> connection. With
>>> that approach, we would correctly notify watches when the domain is 
>>> dead.
>>
>> I think the patch provided by Julien is indeed better than the current
>> code, or else you will miss @releaseDomain events in corner cases for
>> dominfo.dying.
>>
>> I think however the patch is missing a change in the order of the
>> checks in conn_can_{read,write}, so that the is_ignored check is
>> performed before calling can_{read,write} which will try to poke at
>> the interface and trigger a fault if not mapped.
> 
> Ah good point. I originally moved the is_ignored check after the 
> callback because the socket connection can in theory be closed from 
> can_{read, write}.
> 
> However, in pratice, is_ignored is only set for socket from 
> ignore_connection() that will also close the socket.
> 
> The new use will only set is_ignored for the domain connection. So I am 
> guessing moving the check early on ought to be fine.
> 
> The alternative would be to call ignore_connection() but this feels a 
> bit weird because most of it would be a NOP as we are introducing the 
> domain.

At the end I went with re-using ignore_connection() and posted a patch 
for discussion:

https://lore.kernel.org/xen-devel/20211020144519.10362-1-julien@xen.org/T/#u

Cheers,

-- 
Julien Grall

