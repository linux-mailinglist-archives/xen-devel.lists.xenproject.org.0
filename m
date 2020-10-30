Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E9E2A06A0
	for <lists+xen-devel@lfdr.de>; Fri, 30 Oct 2020 14:41:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.15835.39051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYUe5-0004uB-4g; Fri, 30 Oct 2020 13:40:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 15835.39051; Fri, 30 Oct 2020 13:40:45 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYUe5-0004tm-1J; Fri, 30 Oct 2020 13:40:45 +0000
Received: by outflank-mailman (input) for mailman id 15835;
 Fri, 30 Oct 2020 13:40:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pDD0=EF=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kYUe3-0004th-Ts
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 13:40:43 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 885044e7-172f-4859-8d9d-ce181d6eb7e1;
 Fri, 30 Oct 2020 13:40:43 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kYUe1-0001BY-Hd; Fri, 30 Oct 2020 13:40:41 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kYUe1-0002k7-9W; Fri, 30 Oct 2020 13:40:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=pDD0=EF=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kYUe3-0004th-Ts
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 13:40:43 +0000
X-Inumbo-ID: 885044e7-172f-4859-8d9d-ce181d6eb7e1
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 885044e7-172f-4859-8d9d-ce181d6eb7e1;
	Fri, 30 Oct 2020 13:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=ZjkrVIv5JXeXyE9ersuoQrXhVPfZD3kNV20TshAAkkg=; b=w0qfUBf2BzE28tYsKKpsax/P5R
	bJgOWuf0qr8owj6RqvPMY+7LPtaNWUY1NvBGa2+sh+vYYyOad3WuWIon8G17wm9kjezPfgMzIE0Rb
	SIuA7O608uKeqZXpeztXqQBT5DSVxoTl+XqXSGPwMx4esZhFrr3uGUTmDflyqX4LfMvY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kYUe1-0001BY-Hd; Fri, 30 Oct 2020 13:40:41 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kYUe1-0002k7-9W; Fri, 30 Oct 2020 13:40:41 +0000
Subject: Re: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <b085e894773842ac320b818aa6f84289d0a128ed.1602591365.git.rahul.singh@arm.com>
 <cd433f0a-ed0b-ce82-c356-d6deaa053a30@xen.org>
 <BBF09ABE-29A6-4990-8DA2-B44086E9C88C@arm.com>
 <1082f30e-0ce8-00b1-e120-194ff874a9ba@xen.org>
 <alpine.DEB.2.21.2010221631440.12247@sstabellini-ThinkPad-T480s>
 <D8EF4B06-B64D-4264-8C86-DA1B5A1146D2@arm.com>
 <7314936f-6c1e-5ca6-a33b-973c8e61ba3b@xen.org>
 <D9F93137-412F-47E5-A55C-85D1F3745618@arm.com>
 <2813ea2b-bfc4-0590-47ef-86089ad65a5d@xen.org>
 <0E2548E0-0504-43B6-8DD7-D5B7BACCEB6E@arm.com>
 <bc697327-2750-9a78-042d-d45690d27928@xen.org>
 <92A7B6FF-A2CE-4BB1-831A-8F12FB5290B8@arm.com>
 <alpine.DEB.2.21.2010291316290.12247@sstabellini-ThinkPad-T480s>
 <1BE06E0F-26CF-453A-BB06-808CC0F3E09B@arm.com>
 <aae5892a-2532-04f8-02af-84c4d4c4f3fd@xen.org>
 <226DA6DB-D03C-41A7-A68C-53000DFA70F6@arm.com>
 <e5ce30c5-e0e0-90c8-962d-c86b65a82ccd@xen.org>
 <E52CE228-0D19-491E-BA47-04ED7599DDCE@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c820556e-7ba6-c8f8-9d99-b3a6a29348b2@xen.org>
Date: Fri, 30 Oct 2020 13:40:39 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <E52CE228-0D19-491E-BA47-04ED7599DDCE@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 30/10/2020 11:33, Rahul Singh wrote:
> Hello Julien,

Hi,

> 
>> On 30 Oct 2020, at 10:05 am, Julien Grall <julien@xen.org> wrote:
>>
>>
>>
>> On 30/10/2020 09:45, Rahul Singh wrote:
>>> Hello Julien,
>>>> On 30 Oct 2020, at 9:21 am, Julien Grall <julien@xen.org> wrote:
>>>>
>>>> Hi,
>>>>
>>>> On 30/10/2020 08:46, Rahul Singh wrote:
>>>>> Ok Yes when I ported the driver I port the command queue operation from the previous commit where atomic operations is not used and rest all the code is from the latest code. I will again make sure that any bug that is fixed in Linux should be fixed in XEN also.
>>>>
>>>> I would like to seek some clarifications on the code because there seem to be conflicting information provided in this thread.
>>>>
>>>> The patch (the baseline commit is provided) and the discussion with Bertrand suggests that you took a snapshot of the code last year and adapted for Xen.
>>>>
>>>> However, here you suggest that you took an hybrid approach where part of the code is based from last year and other part is based from the latest code (I assume v5.9).
>>>>
>>>> So can you please clarify?
>>>>
>>>> Cheers,
>>> Approach I took is to first merge the code  from the commit ( Jul 2, 2019 7c288a5b27934281d9ea8b5807bc727268b7001a ) the snapshot before atomic operation is used in SMMUv3 code for command queue operations.
>>> After that I fixed  the other code( not related to command queue operations.)  from the latest code so that no bug is introduced in XEN because of using the last year commit.
>>
>> Ok. That was definitely not clear from the commit message. Please make this clearer in the commit message.
>>
> 
> Ok. I will make this clearer in the commit message.
> 
>> Anway, it means we need to do a full review of the code (rather than a light one) because of the hybrid model.
>>
>> I am still a bit puzzle to why it would require almost of a restart of the implementation in order to sync the latest code. Does it imply that you are mostly using the old code?
>>
> 
> SMMuv3 code is divided into below parts :
> 
> 1. Low-level/High level queue manipulation functions.
> 2. Context descriptor manipulation functions.
> 3. Stream table manipulation functions.
> 4. Interrupt handling.
> 5. Linux IOMMU API functions.
> 6. Driver initialisation functions( probe/reset ).
> 
> Low-level/High-level queue manipulation functions are from the old code, rest is the new code whenever it was possible.

Thanks for the details! I think it would be useful to mention that in 
the commit message.

> I started with porting the latest code but there are many dependencies for the queue manipulation function so we decided to use the old queue manipulation function.

In general, I would recommend to involve the community as soon as 
possible in the development process. This is quite important for big 
feature because it allows all the party to agree on the approach without 
investing significant effort.

> As the queue manipulation function is a big part of the code it will require a lot of effort and testing to sync with the latest code once the atomic operation is in place to use
Sure, everything has a cost (including maintaining the code). This has 
to be a trade-off.

My main concern was the maintenance of the code long term. However, as 
you and Bertrand stepped up for maintaining the code, then this should 
be less of a concern...

Cheers,

-- 
Julien Grall

