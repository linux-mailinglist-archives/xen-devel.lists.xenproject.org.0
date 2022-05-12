Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D4352486A
	for <lists+xen-devel@lfdr.de>; Thu, 12 May 2022 10:57:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.327463.550272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1np4cu-0005F2-MQ; Thu, 12 May 2022 08:56:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 327463.550272; Thu, 12 May 2022 08:56:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1np4cu-0005CU-J7; Thu, 12 May 2022 08:56:52 +0000
Received: by outflank-mailman (input) for mailman id 327463;
 Thu, 12 May 2022 08:56:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1np4cs-0005CM-S4
 for xen-devel@lists.xenproject.org; Thu, 12 May 2022 08:56:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1np4cs-00038x-CM; Thu, 12 May 2022 08:56:50 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.193])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1np4cs-00042r-6P; Thu, 12 May 2022 08:56:50 +0000
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
	bh=2Mg1225RNDZ4nc3rt5o9Hrn+rbeNZBGAUoV6S+qswi8=; b=mZh5gHvZCR1QOThzQsZmdgF5N1
	VZUBPF8Smb1QSdf5u6W6H6R+AwK98BA5avu7URtt9gudMbdCmALZsimfYp0V8n2u3ESJwZdyjJ6P5
	EZAzWozeRn4VlsF9pkqhJffspHnhog338G5Hfmc/gXBcOVgD+51wfsgKImvSRMF6+J+Y=;
Message-ID: <c072bd96-eede-5c8b-49f4-302600829862@xen.org>
Date: Thu, 12 May 2022 09:56:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v2] xen/evtchn: Add design for static event channel
 signaling
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <10d83478f116c923271a6c2f7d413f6ec117598d.1651685393.git.rahul.singh@arm.com>
 <cd402709-619f-7189-3d95-fea4ad6bf637@xen.org>
 <A06FC2FB-56CF-4DB6-BF59-7F2CECA0C9D9@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <A06FC2FB-56CF-4DB6-BF59-7F2CECA0C9D9@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Rahul,

On 11/05/2022 15:32, Rahul Singh wrote:
>> On 10 May 2022, at 1:32 pm, Julien Grall <julien@xen.org> wrote:
>>> +domain may toggle masked bits in the masked bit field and should clear the
>>> +pending bit when an event has been processed
>>> +
>>> +Events are received by a domain via an interrupt from Xen to the domain,
>>> +indicating when an event arrives (setting the bit). Further notifications are
>>> +blocked until the bit is cleared again. Events are delivered asynchronously to
>>> +a domain and are enqueued when the domain is not running.
>>> +More information about FIFO based event channel can be found at:
>>
>> I think the explanation is fine for a design proposal. If you want to use it as documentation, then I would suggest to clarify there are two different ABI for event channel: FIFO and 2L.
>>
>> 2L is the easiest one to implement and for embedded we may want to steer the users towards it.
> 
> I will rephrase the sentence as below:
> 
> Xen supports two different ABI for event channel FIFO and 2L. More information about FIFO based event channel can be found at:

I think it is a bit strange to point to the FIFO doc but not the 2L (the 
explanantion above is not really for 2L). If there are no doc for the 
latter, then I would possibly drop the link.

>>> +The event channel sub-node has the following properties:
>>> +
>>> +- compatible
>>> +
>>> + "xen,evtchn"
>>> +
>>> +- xen,evtchn
>>> +
>>> + The property is tuples of two numbers
>>> + (local-evtchn link-to-foreign-evtchn) where:
>>> +
>>> + local-evtchn is an integer value that will be used to allocate local port
>>> + for a domain to send and receive event notifications to/from the remote
>>> + domain.
>> Port 0 is reserved and both FIFO/2L have limit on the port numbers.
>>
>> I think we should let know the users about those limitations but I am not sure whether the binding is the right place for that.
> 
> If you are okay I can add this limitation in this design doc.

Design docs are generally for developper of Xen rather than the end 
users. I am OK if you want to add the limitations in this design doc so 
long we have another easy way for the user to find out the limits.

This could be end users documentation and/or message in Xen. Note that 
2L has a lower limit and we don't know in advance what the guest will 
use. So we may have to assume the lower limit (4096) which should be 
plenty for embedded :).

Cheers,

-- 
Julien Grall

