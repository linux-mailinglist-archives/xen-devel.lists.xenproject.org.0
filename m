Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F982766D95
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 14:48:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571463.895368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPMtV-0007Te-Rk; Fri, 28 Jul 2023 12:48:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571463.895368; Fri, 28 Jul 2023 12:48:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPMtV-0007QP-Om; Fri, 28 Jul 2023 12:48:33 +0000
Received: by outflank-mailman (input) for mailman id 571463;
 Fri, 28 Jul 2023 12:48:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qPMtU-0007QJ-9p
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 12:48:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qPMtT-0006N9-Ev; Fri, 28 Jul 2023 12:48:31 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qPMtT-0008Gb-8K; Fri, 28 Jul 2023 12:48:31 +0000
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
	bh=vGsebjW1/nRHbE5Cv7b/6FKUwr3fBfJ++NGoQwReRMc=; b=D6Q+7kD3ZlSm7EUw647ImN/8WU
	982q9Rmb32nZg/9wvj4F6hmaI/o+bq4G6M7OW2aXCe9lv7h5zUWllLPjyaVRambQ6eY1VBDkMBLAG
	dKfA+41six8+UHrMlqhHVYlKq5Ab68oSUwCA+M4I3yFT3VdVPg9ii29PuK7dW7HU6NTI=;
Message-ID: <75dc26f0-0ea7-2097-47b2-1f857e1d7236@xen.org>
Date: Fri, 28 Jul 2023 13:48:29 +0100
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
From: Julien Grall <julien@xen.org>
In-Reply-To: <8a5854d1-2594-ed4f-ace8-e21db4fe4c7b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 28/07/2023 13:06, Juergen Gross wrote:
> On 28.07.23 13:19, Julien Grall wrote: 
>>>>> In case of a runtime check I
>>>>> agree that a more central place would be preferred.
>>>>>
>>>>> In the end I don't mind that much, but
>>>>>
>>>>>      BUILD_BUG_ON(XENSTORE_PAYLOAD_MAX >=
>>>>>               (typeof((struct node_hdr *)NULL->datalen))(-1));
>>>>>
>>>>> is a little bit clumsy IMHO.
>>>>
>>>> Agree. We could introduce FIELD_SIZEOF() (as Linux did) to hide the 
>>>> complexity. The code would then look like:
>>>>
>>>>  >= (8 * FIELD_SIZEOF(struct node_hdr, datalen))
>>>
>>> Oh, I guess you mean sizeof_field().
>>>
>>> And even with that it would look quite clumsy:
>>>
>>>      BUILD_BUG_ON(XENSTORE_PAYLOAD_MAX >=
>>>               (1UL << (8 * sizeof_field(struct node_hdr, datalen))));
>>
>> How about keeping the BUILD_BUG_ON() in write_node_raw() and add the 
>> following comment on top of handle_input():
>>
>> Some fields in Xenstored are sized based on the max payload (see 
>> various BUILD_BUG_ON()). This would need extra runtime check if we 
>> ever decide to have a dynamic payload size.
> 
> I _could_ do that, but where to stop adding such comments?

When someone other than the author is able to understand the code 
without too much effort. More comments never hurts, less will in the 
longer run (see below).

> 
> TBH, I really don't see the point doing that.
> 
> In case a patch came up upstream trying to violate XENSTORE_PAYLOAD_MAX 
> I would
> surely NACK it.
That's assuming you will still be around when this happens :). I am not 
wishing anything bad but the code will likely outlast any of us.

So we need to make easy for a future maintainers/reviewers to know the 
assumptions and implications of changing some of the limits.

> In case we need payloads larger than XENSTORE_PAYLOAD_MAX we should 
> split the
> related operation in multiple parts (see e.g. XS_DIRECTORY_PART or 
> XS_CONTROL
> for uploading a new kernel to Xenstore-stubdom for live update). Which 
> is, BTW,
> the way AWS should have handled the migration problem (transactions come 
> to my
> mind in this context).

I wasn't part of the original design, but I can see why it was done like 
that.

Using multiple commands has also its downside. The first that comes to 
my mind if that you need to keep around the data. But, with your 
proposal, you we wouldn't be able to store it in the database (like for 
transaction update) as datalen can only be 65KB.

So one command as the advantage to simply a lot the logic in Xenstored.

Anyway, this is getting a bit off topic. My only request is to write 
down assumption more explicitly rather than hiding them. A comment on 
top of the check is a nice way to help the developper to avoid making a 
"bad" decision.

I am happy to rewrite the comment so it doesn't lead to think that you 
(as the maintainer) are open to have a more relax length check.

Cheers,

-- 
Julien Grall

