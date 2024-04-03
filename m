Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAB78970FA
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 15:29:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700541.1093858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rs0ek-000255-7T; Wed, 03 Apr 2024 13:27:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700541.1093858; Wed, 03 Apr 2024 13:27:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rs0ek-00022m-3t; Wed, 03 Apr 2024 13:27:58 +0000
Received: by outflank-mailman (input) for mailman id 700541;
 Wed, 03 Apr 2024 13:27:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g+Gt=LI=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1rs0ei-00022g-4t
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 13:27:56 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8aaf3dd-f1bd-11ee-a1ef-f123f15fe8a2;
 Wed, 03 Apr 2024 15:27:53 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1712150868276133.6148006139797;
 Wed, 3 Apr 2024 06:27:48 -0700 (PDT)
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
X-Inumbo-ID: f8aaf3dd-f1bd-11ee-a1ef-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; t=1712150869; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KXla8mW4NVro9+h032S0ILVMxKXlwvaUqvnrRnJauCMxYf5bNFi5hxk0SvmY/kvtfyxYRenY6PbpJYkMpRWsz7D3A99We3LXBP94tq4wx25haP0BYi5rBJO7sClUMHzdKsWAYYYIl/QHl/gDNeFYeFM6h7ts94takBIGQSOkFLU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1712150869; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=DAv8TPOyq2ChFBd07jPFEeUeq/LlmA+d41YZpewyVYc=; 
	b=G+OrYxNvfx4HAhuEcRa04eTh33op6ciOPMIEpM9VwVsB7++pCqnN+5Y0MqOm6G0eMD9f7jEpbS4YzRN7Dl7CmQ/H250w7aeOm7FYyK4CaswtnwQtKAn7cYTy2mykmtV4Xh0FJeuOa4GCWMQHUuJbwqcV1lXyXNzDJbP6yXZgzNE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1712150869;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=DAv8TPOyq2ChFBd07jPFEeUeq/LlmA+d41YZpewyVYc=;
	b=g9W/gEMFyOY4zktSXfYnjTnIqFIYI9ph4ehZxQhOPZSfUIocQ2LQWN2XZZPrk74A
	zBVP0P3Z8lE40d9pXeGzMQtcetPG8lT3W6GLpX118pPALAEX5R4FBc7TTPPge72Goh+
	VcLJcmsxJj9g9A112zaVzF6Hd7HsVx/lpvKV+tL0=
Message-ID: <61945064-38ec-4ea5-9084-a82d3c252b2d@apertussolutions.com>
Date: Wed, 3 Apr 2024 09:27:46 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "evtchn: refuse EVTCHNOP_status for Xen-bound
 event channels"
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20240402170612.2477791-1-andrew.cooper3@citrix.com>
 <11957460-0b2b-432d-ad92-38350306c9ff@suse.com>
 <2df1e3ef-32c5-45c3-af1b-e9473a4e9120@apertussolutions.com>
 <d86e7a86-cd2a-4b0c-b269-6b4e9b2edff3@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <d86e7a86-cd2a-4b0c-b269-6b4e9b2edff3@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 4/3/24 08:05, Jan Beulich wrote:
> On 03.04.2024 13:10, Daniel P. Smith wrote:
>> On 4/3/24 02:16, Jan Beulich wrote:
>>> On 02.04.2024 19:06, Andrew Cooper wrote:
>>>> The commit makes a claim without any kind of justification.
>>>
>>> Well, what does "have no business" leave open?
>>
>> Why does it not have any business? Why should a domain that creates an
>> event channel not be able to inquire about its status?
> 
> Event channels we talk about here are created via
> alloc_unbound_xen_event_channel(). IOW it's not any domain creating them.
> Once connected, the respective domain is of course fine to query its end
> of the channel.


I would disagree, for instance alloc_unbound_xen_event_channel() is used 
in response to XEN_DOMCTL_vuart_op:XEN_DOMCTL_VUART_OP_INIT and 
XEN_DOMCTL_VM_EVENT_OP_PAGING:XEN_VM_EVENT_ENABLE, which are hypercalls 
by a domain and not something initiated by the hypervisor.

>>>> The claim is false, and the commit broke lsevtchn in dom0.
>>>
>>> Or alternatively lsevtchn was doing something that was never meant to work
>>> (from Xen's perspective).
>>
>> Again, you have not said why this is a problem. What concern does it
>> create? Does it open the door for access elevation, resource
>> deprivation, or some other malicious behaviors?
> 
> It exposes information that perhaps better wouldn't be exposed. Imo if
> Xen owned resource state is of interest, it would want exposing via
> hypfs.

You didn't answer why, just again expressed your opinion that it is not 
better exposed. And I would have to wholly disagree with the sentiment 
that hypfs exposure is the deciding factor what is or is not worth 
exposing. This thinking is completely orthogonal to FLASK and 
fine-grained access control.

>>>>    It is also quite
>>>> obvious from XSM_TARGET that it has broken device model stubdoms too.
>>>
>>> Why would that be "obvious"? What business would a stubdom have to look at
>>> Xen's side of an evtchn?
>>
>> Again, you have not expressed why it shouldn't be able to do so.
> 
> See above - not its resource, nor its guest's.

It is a resource provided to a domain that the domain can send/raise an 
event to and a backing domain that can bind to it, ie. the two 
parameters that must be passed to the allocation call.

>>>> Whether to return information about a xen-owned evtchn is a matter of policy,
>>>> and it's not acceptable to short circuit the XSM on the matter.
>>>
>>> I can certainly accept this as one possible view point. As in so many cases
>>> I'm afraid I dislike you putting it as if it was the only possible one.
>>
>> In fact, this commit is in violation of the XSM. It hard-codes a
>> resource access check outside XSM, thus breaking the fine-grained access
>> control of FLASK.
> 
> Perhaps; see below and see the question raised in the subsequent reply
> to the patch.
> 
>>> In summary: The supposed justification you claim is missing in the original
>>> change is imo also missing here then: What business would any entity in the
>>> system have to look at Xen's side of an event channel? Back at the time, 3
>>> people agreed that it's "none".
>>
>> As stated, you provided no reason or justification for "has no business"
>> and by face value is an opinion that a few people agreed with. As for
>> why, there could be a myriad number of reasons a domain may want to
>> check the status of an interface it has with the hypervisor. From just
>> logging its state for debug to throttling attempts at sending an event.
>> So why, from a security/access control decision, does this access have
>> to absolutely blocked, even from FLASK?
> 
> I didn't say it absolutely needs to be blocked. I'm okay to become
> convinced otherwise. But in the description complaining about lack of
> reasons in the 3-4 year old change, just to then again not provide any
> reasons looks "interesting" to me. (And no, just to take that example,
> lsevtchn not working anymore on such channels is not on its own a
> reason. As indicated, it may well be that conceptually it was never
> supposed to be able to have access to this information. The latest not
> anymore when hypfs was introduced.)

This broke an existing behavior, whether that behavior is correct can 
always be questioned, does not justify leaving an incorrect 
implementation. And it is incorrect because as again you have not 
articulated why the lsevtchn behavior is wrong and thus whether this is 
the valid corrective action.

v/r,
dps

