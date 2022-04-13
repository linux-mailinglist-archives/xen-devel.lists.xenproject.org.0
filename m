Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9441D4FF401
	for <lists+xen-devel@lfdr.de>; Wed, 13 Apr 2022 11:44:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.304004.518495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neZXw-00084U-Uw; Wed, 13 Apr 2022 09:44:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 304004.518495; Wed, 13 Apr 2022 09:44:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neZXw-00081o-R8; Wed, 13 Apr 2022 09:44:20 +0000
Received: by outflank-mailman (input) for mailman id 304004;
 Wed, 13 Apr 2022 09:44:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1neZXv-00081i-EM
 for xen-devel@lists.xenproject.org; Wed, 13 Apr 2022 09:44:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1neZXu-00070w-Nt; Wed, 13 Apr 2022 09:44:18 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227] helo=[10.7.236.29])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1neZXu-0006JW-EC; Wed, 13 Apr 2022 09:44:18 +0000
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
	bh=nR05iQlcVJ2C0VE1rgsjETinv2ZWE8ZVxdL572g6vr8=; b=pPUoLtzRlZ/U6d0NZGy7DpA0mi
	myk6YAPSwUApXFr60XrwmE8b1yV3+yEa4PvZWRW916/73BlsqqmsbQ5Ibz4UqUtuQaOTCV8OgOXV/
	WJsU9XN62UGQhIUfTH45u3l61jC6ixUwV+uF9nmMmWfH3R4ChkdlQxZkghIK9GyeDjc0=;
Message-ID: <4f8ae917-d5d6-d93b-b31a-d46b55fa66cd@xen.org>
Date: Wed, 13 Apr 2022 10:44:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [PATCH] xen/evtchn: Add design for static event channel signaling
 for domUs..
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <4836304496e6fbbea41348ed8cc9fcf6b0f3e893.1648049827.git.rahul.singh@arm.com>
 <0ecf69d2-c496-d18e-1309-f896ec6bbf4c@xen.org>
 <3622A5B1-D64C-43D9-9AA3-2E781C2310B9@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3622A5B1-D64C-43D9-9AA3-2E781C2310B9@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Rahul,

On 13/04/2022 09:25, Rahul Singh wrote:
>> On 11 Apr 2022, at 7:01 pm, Julien Grall <julien@xen.org> wrote:
>>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>>> ---
>>> docs/designs/dom0less-evtchn.md | 96 +++++++++++++++++++++++++++++++++
>>> 1 file changed, 96 insertions(+)
>>> create mode 100644 docs/designs/dom0less-evtchn.md
>>> diff --git a/docs/designs/dom0less-evtchn.md b/docs/designs/dom0less-evtchn.md
>>> new file mode 100644
>>> index 0000000000..6a1b7e8c22
>>> --- /dev/null
>>> +++ b/docs/designs/dom0less-evtchn.md
>>> @@ -0,0 +1,96 @@
>>> +# Signaling support between two domUs on dom0less system
>>> +
>>> +## Current state: Draft version
>>> +
>>> +## Proposer(s): Rahul Singh, Bertrand Marquis
>>> +
>>> +## Problem Statement:
>>> +
>>> +The goal of this work is to define a simple signaling system between Xen guests
>>> +in dom0less systems.
>>> +
>>> +In dom0less system, we cannot make use of xenbus and xenstore that are used in
>>> +normal systems with dynamic VMs to communicate between domains by providing a
>>> +bus abstraction for paravirtualized drivers.
>>> +
>>> +One possible solution to implement the signaling system between domUs is based
>>> +on event channels.
>>> +
>>> +## Proposal:
>>> +
>>> +Event channels are the basic primitive provided by Xen for event notifications.
>>> +An event channel is a logical connection between 2 domains (more specifically
>>> +between dom1,port1 and dom2,port2). They essentially store one bit of
>>> +information, the event of interest is signalled by transitioning this bit from
>>> +0 to 1. An event is an equivalent of a hardware interrupt.
>>> +
>>> +Notifications are received by a guest via an interrupt from Xen to the guest,
>>> +indicating when an event arrives (setting the bit).
>>
>> I am a bit confused with the description. Are you trying to explain the event channel in layman term? If not, then event channel protocol is more complicated than that (in particular for fifo).
> 
> Yes I am trying to explain the event-channel in simple term.

I would suggest to make that clear and also point to the documentation 
for the Event Channel ABI (we have a doc for fifo at least).

>>> +
>>> +Event channel communication will be established statically between two domU
>>> +guests before unpausing the domains after domain creation. Event channel
>>> +connection information between domUs will be passed to XEN via device tree
>>> +node.
>>
>> Why are we limiting ourself to domUs?
> 
> As this design is for a dom0less system I mean here to all the domains on the dom0less system.
> What I understand is that all domains in the dom0less system are called as domUs.

It depends on whether an admin may have specific a dom0 kernel. Looking 
at Penny series to handle shared memory, it will be possible to create a 
shared region between dom0 and a dom0less domU. Most likely the user 
will also want to provide a notification communication.

So shouldn't we also provide a way to create an event channel between 
dom0 and another domU?

Cheers,

-- 
Julien Grall

