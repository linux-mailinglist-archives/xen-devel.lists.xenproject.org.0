Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 398EF766F05
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 16:09:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571472.895408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPO90-0000mD-7J; Fri, 28 Jul 2023 14:08:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571472.895408; Fri, 28 Jul 2023 14:08:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPO90-0000kZ-4R; Fri, 28 Jul 2023 14:08:38 +0000
Received: by outflank-mailman (input) for mailman id 571472;
 Fri, 28 Jul 2023 14:08:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qPO8y-0000kR-7z
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 14:08:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qPO8w-0008Gn-II; Fri, 28 Jul 2023 14:08:34 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qPO8w-0003dP-D4; Fri, 28 Jul 2023 14:08:34 +0000
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
	bh=MEpmttx+knm+kGZKPoablProjkNQStd/NcMbONiWQTU=; b=5p8UheWq4yIZm2xzzy/Va7aawL
	SbsoxB+QgHpMaHSFPsRpP1qDhwhRydtKe00V1JT09rUHFhOaf3cz2759xNRsF49+PLRUY7W0K33q5
	3GWu/V/pV3ZecRJq5dOnNOJskMbr01B8CT1h9U++QzGjqUaa8xqy3qGAqe0Pto5z+hOM=;
Message-ID: <ebc61b04-bfc4-592a-df09-7226e32d355b@xen.org>
Date: Fri, 28 Jul 2023 15:08:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/25] tools/xenstore: rework struct xs_tdb_record_hdr
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-18-jgross@suse.com>
 <b2d2a346-12c0-8ea4-38a2-b4748396540f@xen.org>
 <9a6d9c8b-350b-9a3e-4c23-0d7fd312e77a@suse.com>
 <3cce8892-1494-775f-8d75-80e87f0643cf@xen.org>
 <a9d55381-df3a-a343-7c4b-c5d5f6e7695b@suse.com>
 <27ba8831-89cb-9470-0b1c-03ad817e8292@xen.org>
 <68acbf84-218b-f2f7-9526-d9e07f845f6e@suse.com>
 <8cea1316-db0b-f29d-c467-6fd5c4a6321c@xen.org>
 <6a376365-a731-2413-16c7-14ede5224eea@suse.com>
 <b8b8e733-6be0-a4d9-33b7-d93366ec0091@xen.org>
 <8a5854d1-2594-ed4f-ace8-e21db4fe4c7b@suse.com>
 <75dc26f0-0ea7-2097-47b2-1f857e1d7236@xen.org>
 <4d36876c-e943-06ac-782d-5d94851040e2@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <4d36876c-e943-06ac-782d-5d94851040e2@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 28/07/2023 14:24, Juergen Gross wrote:
> On 28.07.23 14:48, Julien Grall wrote:
>> Hi,
>>
>> On 28/07/2023 13:06, Juergen Gross wrote:
>>> On 28.07.23 13:19, Julien Grall wrote:
>>>>>>> In case of a runtime check I
>>>>>>> agree that a more central place would be preferred.
>>>>>>>
>>>>>>> In the end I don't mind that much, but
>>>>>>>
>>>>>>>      BUILD_BUG_ON(XENSTORE_PAYLOAD_MAX >=
>>>>>>>               (typeof((struct node_hdr *)NULL->datalen))(-1));
>>>>>>>
>>>>>>> is a little bit clumsy IMHO.
>>>>>>
>>>>>> Agree. We could introduce FIELD_SIZEOF() (as Linux did) to hide 
>>>>>> the complexity. The code would then look like:
>>>>>>
>>>>>>  >= (8 * FIELD_SIZEOF(struct node_hdr, datalen))
>>>>>
>>>>> Oh, I guess you mean sizeof_field().
>>>>>
>>>>> And even with that it would look quite clumsy:
>>>>>
>>>>>      BUILD_BUG_ON(XENSTORE_PAYLOAD_MAX >=
>>>>>               (1UL << (8 * sizeof_field(struct node_hdr, datalen))));
>>>>
>>>> How about keeping the BUILD_BUG_ON() in write_node_raw() and add the 
>>>> following comment on top of handle_input():
>>>>
>>>> Some fields in Xenstored are sized based on the max payload (see 
>>>> various BUILD_BUG_ON()). This would need extra runtime check if we 
>>>> ever decide to have a dynamic payload size.
>>>
>>> I _could_ do that, but where to stop adding such comments?
>>
>> When someone other than the author is able to understand the code 
>> without too much effort. More comments never hurts, less will in the 
>> longer run (see below).
> 
> I agree with that statement in general, but requesting a comment to aid a
> future potential change violating the Xenstore wire protocol is a little 
> bit
> weird.

Well... This is violating the existing protocol, but it is not set in 
stone and I think this is acceptable to update it when there is no 
change for the VMs and for new features (e.g. Live-Update/Live-Migration).

>>>
>>> TBH, I really don't see the point doing that.
>>>
>>> In case a patch came up upstream trying to violate 
>>> XENSTORE_PAYLOAD_MAX I would
>>> surely NACK it.
>> That's assuming you will still be around when this happens :). I am 
>> not wishing anything bad but the code will likely outlast any of us.
> 
> Maybe. But would you really Ack patches adding comments like that in other
> areas?

Potentially yes. We had a similar discussion on Arm when allowing 
paddr_t to be 32-bit.

[...]

>>> In case we need payloads larger than XENSTORE_PAYLOAD_MAX we should 
>>> split the
>>> related operation in multiple parts (see e.g. XS_DIRECTORY_PART or 
>>> XS_CONTROL
>>> for uploading a new kernel to Xenstore-stubdom for live update). 
>>> Which is, BTW,
>>> the way AWS should have handled the migration problem (transactions 
>>> come to my
>>> mind in this context).
>>
>> I wasn't part of the original design, but I can see why it was done 
>> like that.
> 
> I can see why it was done that way, but this doesn't mean I can understand
> why such a design should be supported by adding comments helping to 
> repeat such
> a bad decision.
> 
>> Using multiple commands has also its downside. The first that comes to 
>> my mind if that you need to keep around the data. But, with your 
>> proposal, you we wouldn't be able to store it in the database (like 
>> for transaction update) as datalen can only be 65KB.
> 
> I wasn't aware that a complete transaction needs to be kept in a single 
> data
> base record. :-)

IIUC, you are thinking that the client will restore all the state bits 
by bits. But if you look at the design in 
docs/designs/xenstore-migration.md, this is a blob.

> 
> It would work perfectly fine to allocate the needed memory via talloc() 
> and to
> reference it from a special node being part of the transaction, or to 
> not use
> a node at all (see again the XS_CONTROL example).

I am not convinced the complexity is worth it here. To be honest, I 
think the payload limit should have been relaxed for Live-Update as well 
as you don't gain much to split. That said, this is less a concern 
because you are not time constrained.

[...]

> But maybe that comment was based on wrong assumptions, like the mentioned
> change not violating the protocol. >
>> I am happy to rewrite the comment so it doesn't lead to think that you 
>> (as the maintainer) are open to have a more relax length check.
> 
> Yes, please make a suggestion for a proper comment not suggesting we are 
> fine
> to violate the wire protocol.

Here we go:

"The payload size is not only currently restricted by the protocol but 
also the internal implementation (see various BUILD_BUG_ON())."

-- 
Julien Grall

