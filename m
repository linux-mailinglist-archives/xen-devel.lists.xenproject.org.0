Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65535766ACD
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 12:35:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571418.895208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPKo9-0002L1-AP; Fri, 28 Jul 2023 10:34:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571418.895208; Fri, 28 Jul 2023 10:34:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPKo9-0002Id-7T; Fri, 28 Jul 2023 10:34:53 +0000
Received: by outflank-mailman (input) for mailman id 571418;
 Fri, 28 Jul 2023 10:34:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qPKo7-0002IX-Ee
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 10:34:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qPKo6-0001lU-Jm; Fri, 28 Jul 2023 10:34:50 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qPKo6-0002Rd-D6; Fri, 28 Jul 2023 10:34:50 +0000
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
	bh=JsJQgzDDCAF2edNK8Xvnra+lKq6/w7gX380A9gtI340=; b=dZRdPoRee7Zu5vTCRhZB39zDrr
	SyJ3xmC60S/x/V1A8qOKbMMKbpgWfkO2xiEhP2veA6TYcj6shQRX7oy7rWSooICP1Rhe70AO26Uhn
	JBt0eK6NBBs8atlOQRRxCZTNlxE0xJsavl98MyDWx4FWlP0U2gcQfqoACjSRhiNcbewQ=;
Message-ID: <8cea1316-db0b-f29d-c467-6fd5c4a6321c@xen.org>
Date: Fri, 28 Jul 2023 11:34:48 +0100
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
From: Julien Grall <julien@xen.org>
In-Reply-To: <68acbf84-218b-f2f7-9526-d9e07f845f6e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 28/07/2023 10:45, Juergen Gross wrote:
> On 28.07.23 11:38, Julien Grall wrote:
>> Hi Juergen,
>>
>> On 28/07/2023 10:14, Juergen Gross wrote:
>>> On 28.07.23 10:59, Julien Grall wrote:
>>>> Hi Juergen,
>>>>
>>>> On 28/07/2023 07:23, Juergen Gross wrote:
>>>>> On 27.07.23 23:53, Julien Grall wrote:
>>>>>> Hi Juergen,
>>>>>>
>>>>>> On 24/07/2023 12:02, Juergen Gross wrote:
>>>>>>> Struct xs_tdb_record_hdr is used for nodes stored in the data base.
>>>>>>> When working on a node, struct node is being used, which is 
>>>>>>> including
>>>>>>> the same information as struct xs_tdb_record_hdr, but in a different
>>>>>>> format. Rework struct xs_tdb_record_hdr in order to prepare 
>>>>>>> including
>>>>>>> it in struct node.
>>>>>>>
>>>>>>> Do the following modifications:
>>>>>>>
>>>>>>> - move its definition to xenstored_core.h, as the reason to put 
>>>>>>> it into
>>>>>>>    utils.h are no longer existing
>>>>>>>
>>>>>>> - rename it to struct node_hdr, as the "tdb" in its name has only
>>>>>>>    historical reasons
>>>>>>>
>>>>>>> - replace the empty permission array at the end with a comment about
>>>>>>>    the layout of data in the data base (concatenation of header,
>>>>>>>    permissions, node contents, and children list)
>>>>>>>
>>>>>>> - use narrower types for num_perms and datalen, as those are 
>>>>>>> naturally
>>>>>>>    limited to XENSTORE_PAYLOAD_MAX (childlen is different here, 
>>>>>>> as it is
>>>>>>>    in theory basically unlimited)
>>>>>>
>>>>>> The assumption is XENSTORE_PAYLOAD_MAX will never change and/or 
>>>>>> always apply for all the connection. I am aware of at least one 
>>>>>> downstream use where this is not the case.
>>>>>>
>>>>>> I am happy to use narrower types, but I would at least like some 
>>>>>> checks in Xenstore to ensure the limits are not reached.
>>>>>
>>>>> I will add a BUILD_BUG_ON().
>>>>
>>>> Initially I was thinking about a runtime check, but I am also fine 
>>>> with a BUILD_BUG_ON() if it is right next to length check in 
>>>> handle_input(). So if someone decided to add different payload size 
>>>> depending on the domain (such as privileged domain could do more), 
>>>> it would be easier to spot what else needs to be changed.
>>>
>>> Is this really the correct placement?
>>
>> I think so. By adding the BUILD_ON_BUG() right above the length check, 
>> it would be easier for everyone to know that the datastructure may 
>> also need to change. This ...
>>
>>>
>>> I've put it into write_node_raw(), as this is where the related 
>>> datalen member
>>> is being filled. 
>>
>> ... would be less obvious here and I think it might be miss.
> 
> Assuming that someone changing XENSTORE_PAYLOAD_MAX would do a build 
> afterwards,
> I don't see how such a failure could be missed.

Because one may want dom0 to send payload bigger than 
XENSTORE_PAYLOAD_MAX. Something like:

if ( conn->id != 0 && len < XENSTORE_PAYLOAD_MAX )

Such change would not be caught during compilation. AWS has a similar 
check in the downstream tree because the implementation of 
non-cooperative migration is using Xenstore command and we want to be 
able to transfer the state in a single command.

> In case of a runtime 
> check I
> agree that a more central place would be preferred.
> 
> In the end I don't mind that much, but
> 
>      BUILD_BUG_ON(XENSTORE_PAYLOAD_MAX >=
>               (typeof((struct node_hdr *)NULL->datalen))(-1));
> 
> is a little bit clumsy IMHO.

Agree. We could introduce FIELD_SIZEOF() (as Linux did) to hide the 
complexity. The code would then look like:

 >= (8 * FIELD_SIZEOF(struct node_hdr, datalen))

Cheers,

-- 
Julien Grall

