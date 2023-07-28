Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9A9766B94
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 13:20:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571432.895258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPLVC-0000sL-Qu; Fri, 28 Jul 2023 11:19:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571432.895258; Fri, 28 Jul 2023 11:19:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPLVC-0000pb-Ne; Fri, 28 Jul 2023 11:19:22 +0000
Received: by outflank-mailman (input) for mailman id 571432;
 Fri, 28 Jul 2023 11:19:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qPLVB-0000pV-7B
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 11:19:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qPLV9-0003oc-RJ; Fri, 28 Jul 2023 11:19:19 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qPLV9-00047W-Ic; Fri, 28 Jul 2023 11:19:19 +0000
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
	bh=CMWRqPe1E1bmdUsEzrcOGNV4qP4PJLyHt13rJGHNjTg=; b=xBZ5+Olq/aU1rzrVcpm0h0x9x+
	f69AiNiFjj9rJ1EEfkPuIeM9FAjAuKCt24LDjFjaTfkSIK4wsk9io9jqlPDoVXec7UonWLjthUO+M
	q9UPeoIBXCv2LGeLuC/Ba78cWOsrUG1aTxQYz/Sn16Y9aKv/6fMVzb7sMNiqvLIwxKj0=;
Message-ID: <b8b8e733-6be0-a4d9-33b7-d93366ec0091@xen.org>
Date: Fri, 28 Jul 2023 12:19:18 +0100
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
From: Julien Grall <julien@xen.org>
In-Reply-To: <6a376365-a731-2413-16c7-14ede5224eea@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 28/07/2023 11:47, Juergen Gross wrote:
> On 28.07.23 12:34, Julien Grall wrote:
>> Because one may want dom0 to send payload bigger than 
>> XENSTORE_PAYLOAD_MAX. Something like:
>>
>> if ( conn->id != 0 && len < XENSTORE_PAYLOAD_MAX )
>>
>> Such change would not be caught during compilation. AWS has a similar 
>> check in the downstream tree because the implementation of 
>> non-cooperative migration is using Xenstore command and we want to be 
>> able to transfer the state in a single command.
> 
> And how directly is this related to the max data size of node contents?

I think you missed my point. Until this patch, the existing field would 
be able to accomodate very large payload. This doesn't hold anymore.

What I was trying to convey is that anyone looking at relaxing the check 
in handle_input() needs to be able to find "easily" that other part of 
Xenstored are making some assumption based on the maximum length.

> 
> As soon as you are allowing dom0 to write larger nodes, you are risking to
> kill client connections trying to read such a node. So the node size should
> still be limited to XENSTORE_PAYLOAD_MAX.
> 
> IMO another reason to use the placement I've suggested.

I agree that BUILD_BUG_ON() makes sense where you suggest if you think 
about where the runtime check would happen.

It seems like we have two different aims here. Mine is to make sure we 
make it more difficult to introduce a security hole if the lenght check 
is relaxed.

I have made a proposal below that may suit both our aim.

> AWS should even add
> a size check when writing nodes to make sure dom0 doesn't do evil things.

What make you think we don't already have such checked? ;)

Also, I noticed you mention about datalen. What about the number of 
permissions?

> 
>>
>>> In case of a runtime check I
>>> agree that a more central place would be preferred.
>>>
>>> In the end I don't mind that much, but
>>>
>>>      BUILD_BUG_ON(XENSTORE_PAYLOAD_MAX >=
>>>               (typeof((struct node_hdr *)NULL->datalen))(-1));
>>>
>>> is a little bit clumsy IMHO.
>>
>> Agree. We could introduce FIELD_SIZEOF() (as Linux did) to hide the 
>> complexity. The code would then look like:
>>
>>  >= (8 * FIELD_SIZEOF(struct node_hdr, datalen))
> 
> Oh, I guess you mean sizeof_field().
> 
> And even with that it would look quite clumsy:
> 
>      BUILD_BUG_ON(XENSTORE_PAYLOAD_MAX >=
>               (1UL << (8 * sizeof_field(struct node_hdr, datalen))));

How about keeping the BUILD_BUG_ON() in write_node_raw() and add the 
following comment on top of handle_input():

Some fields in Xenstored are sized based on the max payload (see various 
BUILD_BUG_ON()). This would need extra runtime check if we ever decide 
to have a dynamic payload size.

Cheers,

-- 
Julien Grall

