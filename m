Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C016774017
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 18:59:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580122.908427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTQ2c-0005wf-RR; Tue, 08 Aug 2023 16:58:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580122.908427; Tue, 08 Aug 2023 16:58:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTQ2c-0005uL-Oq; Tue, 08 Aug 2023 16:58:42 +0000
Received: by outflank-mailman (input) for mailman id 580122;
 Tue, 08 Aug 2023 16:58:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p7Ml=DZ=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1qTQ2b-0005uF-Ac
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 16:58:41 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d060796c-360c-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 18:58:37 +0200 (CEST)
Received: from [10.10.1.156] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1691513907885492.6306990381539;
 Tue, 8 Aug 2023 09:58:27 -0700 (PDT)
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
X-Inumbo-ID: d060796c-360c-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1691513910; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hhuK0tKhf9t493M/8GRmbr0aXPGUKF1JM5ZG9yg7eHtPWYBGsifdHMgMA5xxxF+/R0lmjakz2HpVdzWP78n8u6V/Z+jp6H9jTkS6bbqKFW30zTbGJVBDpOksupGHsqosYtevRSmEjp+PWnNcpFADkSDLKZMrxsCUY7tlWR9wlJc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1691513910; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=3dUJBOjuqqWLjpxfBkSfndZTHDMoM6dCP9+ndRkRl/Y=; 
	b=Pythcn5vYe714EREOI5XkhnYFP/FwmCn0oXHsFHgm6WI1cY8QrEloTui/B4VZzNfUdC2vMyQa/qL+oNt1tPFBBNXvGAtHry5Cniq5kcCN9ps9JLPYIu233afcs8D7XS2DU3d5hpS5vHe8Ivu6U0Y5maEeSPQzOMs7JoPcyLunTw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1691513910;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=3dUJBOjuqqWLjpxfBkSfndZTHDMoM6dCP9+ndRkRl/Y=;
	b=a0pIBflVFGXlGAlzBuQH+nOZar2uWMFQJPvH2+fdhMl55fs2zewOfMyl9o8f/Drj
	fKo04+mUQXUo0bvQ5SunV/MmUljfcPI6a5dauGP7BIkRDO3NbZnoiCMRUAhqXSI+osB
	C2BsmZWwU6I9tgz0pTRkLHU5ojw1XhkKZ0bQ+nRE=
Message-ID: <72274554-5942-294e-aa1f-a594ae2e37e9@apertussolutions.com>
Date: Tue, 8 Aug 2023 12:58:25 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH] console: generalize the ability for domU access
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Christopher Clark <christopher.w.clark@gmail.com>,
 Luca Fancellu <luca.fancellu@arm.com>, Henry Wang <Henry.Wang@arm.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230801160608.19219-1-dpsmith@apertussolutions.com>
 <3b889079-571a-a83a-0cba-c30cf2ce0b1b@suse.com>
 <d90cc238-87ef-d0d0-b06f-58e89d24eaca@apertussolutions.com>
 <01a80d4c-f19b-98ec-805e-e648e752d6b1@suse.com>
 <e1554020-a605-8df2-619a-eda86d86c50a@apertussolutions.com>
 <2ded224f-0b8b-90fe-367a-91762d1f25d5@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <2ded224f-0b8b-90fe-367a-91762d1f25d5@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 8/4/23 03:49, Jan Beulich wrote:
> On 03.08.2023 18:31, Daniel P. Smith wrote:
>> On 8/3/23 11:56, Jan Beulich wrote:
>>> On 03.08.2023 14:56, Daniel P. Smith wrote:
>>>> On 8/2/23 07:01, Jan Beulich wrote:
>>>>> On 01.08.2023 18:06, Daniel P. Smith wrote:
>>>>>> +        {
>>>>>> +            for_each_domain(next)
>>>>>
>>>>> What guarantees that the list won't change behind your back? You don't
>>>>> hold domlist_read_lock here afaict. It might be that you're safe because
>>>>> that lock is an RCU one and this function is only invoked at init time
>>>>> or from some form of interrupt handler. But that's far from obvious and
>>>>> will hence need both properly confirming and stating in a comment. (It
>>>>> is actually this concern, iirc, which so far had us avoid iterating the
>>>>> domain list here.)
>>>>
>>>> It is better to error on the side of caution instead of assuming this
>>>> will always be invoked in a safe manner. I will add a read lock for the
>>>> domain list.
>>>
>>> I'm not firm enough in RCU to be certain whether acquiring that lock is
>>> permissible here.
>>
>> Same and I took your statements to suggest that I should.
> 
> Actually I wasn't paying close enough attention here: The code already
> uses rcu_lock_domain_by_id(), which acquires domlist_read_lock.
> 

Right, it grabs the lock while iterating through domain_hash[], I 
thought your concern was with regard to the iterating with 
for_each_domain and the embedded open coded version. Because of your 
inquiry, I have been thinking about it and I should be grabbing the lock 
as I iterate to be sure that I don't get deceived into believing the end 
of list was hit because a domain was being removed as I walked the list. 
And if it so happens that the context is always safe, then there should 
be no contention on grabbing the lock. Do you disagree?

v/r,
dps

