Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9AF766809
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 11:01:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571395.895117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPJK2-0004L4-9C; Fri, 28 Jul 2023 08:59:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571395.895117; Fri, 28 Jul 2023 08:59:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPJK2-0004J1-6Q; Fri, 28 Jul 2023 08:59:42 +0000
Received: by outflank-mailman (input) for mailman id 571395;
 Fri, 28 Jul 2023 08:59:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qPJK0-0004Iv-Ia
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 08:59:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qPJJy-00081v-CC; Fri, 28 Jul 2023 08:59:38 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qPJJy-0006hI-3h; Fri, 28 Jul 2023 08:59:38 +0000
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
	bh=KwfFLqj9L7gUIV1iKqjrLTQMHrhjTK6yI7PHSe5pwH0=; b=6O+WJ+IC7/H2FoIp+3Q3zq3/dW
	4T7GtI4sVa/zD2jCSGO4ex15ph2hVcp+DMfOPU7Ke9a6zzCIN/Y22RrRDui7LKHZngON5bRhETkpc
	YCZb7c7V8xeBWwNH7nW80jNsSUwIaVwJzdaLchM/P7a+k4iqD/U0efChaEiUnShqnmNo=;
Message-ID: <3cce8892-1494-775f-8d75-80e87f0643cf@xen.org>
Date: Fri, 28 Jul 2023 09:59:36 +0100
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
From: Julien Grall <julien@xen.org>
In-Reply-To: <9a6d9c8b-350b-9a3e-4c23-0d7fd312e77a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 28/07/2023 07:23, Juergen Gross wrote:
> On 27.07.23 23:53, Julien Grall wrote:
>> Hi Juergen,
>>
>> On 24/07/2023 12:02, Juergen Gross wrote:
>>> Struct xs_tdb_record_hdr is used for nodes stored in the data base.
>>> When working on a node, struct node is being used, which is including
>>> the same information as struct xs_tdb_record_hdr, but in a different
>>> format. Rework struct xs_tdb_record_hdr in order to prepare including
>>> it in struct node.
>>>
>>> Do the following modifications:
>>>
>>> - move its definition to xenstored_core.h, as the reason to put it into
>>>    utils.h are no longer existing
>>>
>>> - rename it to struct node_hdr, as the "tdb" in its name has only
>>>    historical reasons
>>>
>>> - replace the empty permission array at the end with a comment about
>>>    the layout of data in the data base (concatenation of header,
>>>    permissions, node contents, and children list)
>>>
>>> - use narrower types for num_perms and datalen, as those are naturally
>>>    limited to XENSTORE_PAYLOAD_MAX (childlen is different here, as it is
>>>    in theory basically unlimited)
>>
>> The assumption is XENSTORE_PAYLOAD_MAX will never change and/or always 
>> apply for all the connection. I am aware of at least one downstream 
>> use where this is not the case.
>>
>> I am happy to use narrower types, but I would at least like some 
>> checks in Xenstore to ensure the limits are not reached.
> 
> I will add a BUILD_BUG_ON().

Initially I was thinking about a runtime check, but I am also fine with 
a BUILD_BUG_ON() if it is right next to length check in handle_input(). 
So if someone decided to add different payload size depending on the 
domain (such as privileged domain could do more), it would be easier to 
spot what else needs to be changed.

>> OOI, do you have a use case where a node would be shared with more 
>> than 255 domains?
> 
> No, but limiting it wouldn't give any real advantage.

I guess by advantage you mean that the size of the structure would still 
be the same. I thought this was the rationale but I asked just in case 
you had something else in mind. For instance, Xen technically supports 
up to ~32 000 domains. But I think it would be crazy to decide to have 
more than a few tens permissions on a node :).

Cheers,

-- 
Julien Grall

