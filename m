Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0C9766FFC
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 17:00:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571490.895470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPOwF-0000fK-FQ; Fri, 28 Jul 2023 14:59:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571490.895470; Fri, 28 Jul 2023 14:59:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPOwF-0000d3-CR; Fri, 28 Jul 2023 14:59:31 +0000
Received: by outflank-mailman (input) for mailman id 571490;
 Fri, 28 Jul 2023 14:59:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qPOwD-0000cx-Go
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 14:59:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qPOwC-0000zB-0v; Fri, 28 Jul 2023 14:59:28 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qPOwB-0005ic-PZ; Fri, 28 Jul 2023 14:59:27 +0000
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
	bh=6SUlWDQvVg/Nr067M1+I1QRHYItJKTUOBcBIoN2Mvgg=; b=zjt+7rrZWXD25txd8lGqpPfc7X
	3yNkziNxldil3t6l7pMudWnpymMD5A0fiHozyLTNqcE5PjRGXf89FbwsC1g2DHdfQad2085Wl4tMe
	NGQRauhMRdDUDdLU7Gy0nPME93b+/v0/JXkv99jJuzmzAJr2Y1WaWZyecHL0NhQ5spMg=;
Message-ID: <fa5cdab9-1bfe-7859-0629-3b23dcd6f16b@xen.org>
Date: Fri, 28 Jul 2023 15:59:25 +0100
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
 <ebc61b04-bfc4-592a-df09-7226e32d355b@xen.org>
 <daaf9af4-639e-c6fb-890b-852c0781271c@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <daaf9af4-639e-c6fb-890b-852c0781271c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 28/07/2023 15:32, Juergen Gross wrote:
> On 28.07.23 16:08, Julien Grall wrote: >>>> Using multiple commands has also its downside. The first that comes
>>>> to my mind if that you need to keep around the data. But, with your 
>>>> proposal, you we wouldn't be able to store it in the database (like 
>>>> for transaction update) as datalen can only be 65KB.
>>>
>>> I wasn't aware that a complete transaction needs to be kept in a 
>>> single data
>>> base record. :-)
>>
>> IIUC, you are thinking that the client will restore all the state bits 
>> by bits. But if you look at the design in 
>> docs/designs/xenstore-migration.md, this is a blob.
> 
> Of course it is.
> 
> I was never assuming that the state would be applied piecemeal, this has to
> happen atomically.

I am confused because I don't see how this related to the discussion. 
Above, you mention a transaction, which I interpreted as the client 
would open a transaction and do a bunch of "write note", "set 
permissions"... And then commit the transaction.

I thought this is what you talked about and this would still be 
atomically. My point with the blob is that the parsing of the state is 
done by Xenstored, not the client.

> 
>>> It would work perfectly fine to allocate the needed memory via 
>>> talloc() and to
>>> reference it from a special node being part of the transaction, or to 
>>> not use
>>> a node at all (see again the XS_CONTROL example).
>>
>> I am not convinced the complexity is worth it here. To be honest, I 
>> think the payload limit should have been relaxed for Live-Update as 
>> well as you don't gain much to split. That said, this is less a 
>> concern because you are not time constrained.
>>
>> [...]
>>
>>> But maybe that comment was based on wrong assumptions, like the 
>>> mentioned
>>> change not violating the protocol. >
>>>> I am happy to rewrite the comment so it doesn't lead to think that 
>>>> you (as the maintainer) are open to have a more relax length check.
>>>
>>> Yes, please make a suggestion for a proper comment not suggesting we 
>>> are fine
>>> to violate the wire protocol.
>>
>> Here we go:
>>
>> "The payload size is not only currently restricted by the protocol but 
>> also the internal implementation (see various BUILD_BUG_ON())."
> 
> Hmm, I'm still feeling uneasy to imply that the payload size might be 
> changed.
> See above reasoning.
> 
> The only way I could imagine this being possible would be a per-ring-page
> attribute with both sides agreeing to the max allowed size (the minimum 
> being
> today's value).
> 
> With that in mind I can hesitantly add the comment, maybe with the 
> addition:
> "Any potential change of the maximum payload size needs to be negotiated 
> between
> the involved parties."

I am ok with that.

Cheers,

-- 
Julien Grall

