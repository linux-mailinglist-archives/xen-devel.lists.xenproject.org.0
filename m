Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5053D76691A
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 11:38:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571407.895158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPJvE-00026X-TP; Fri, 28 Jul 2023 09:38:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571407.895158; Fri, 28 Jul 2023 09:38:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPJvE-00024j-QR; Fri, 28 Jul 2023 09:38:08 +0000
Received: by outflank-mailman (input) for mailman id 571407;
 Fri, 28 Jul 2023 09:38:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qPJvE-00024d-2n
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 09:38:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qPJvC-0000Pp-HP; Fri, 28 Jul 2023 09:38:06 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qPJvC-00007b-BJ; Fri, 28 Jul 2023 09:38:06 +0000
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
	bh=+980A7+N+XFZHXI1jhl4MMS+tRacKtGCEpilRWASUxs=; b=wvhVTU1sVcYoiha+y5A+tKmL+y
	hV6aWqtRXwU+BIfI/MlvvAgSYLymKBj0qbseRpmkuptLPtBrI49beamnuJFyHrbOc+SR4upjcGK2F
	S1143fAVJCs9W6qMPrvFdF8S+tDZnfNjZFkHW0IRjfQZbknWmkORdoG86KdOSwaBgOu4=;
Message-ID: <27ba8831-89cb-9470-0b1c-03ad817e8292@xen.org>
Date: Fri, 28 Jul 2023 10:38:04 +0100
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
From: Julien Grall <julien@xen.org>
In-Reply-To: <a9d55381-df3a-a343-7c4b-c5d5f6e7695b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 28/07/2023 10:14, Juergen Gross wrote:
> On 28.07.23 10:59, Julien Grall wrote:
>> Hi Juergen,
>>
>> On 28/07/2023 07:23, Juergen Gross wrote:
>>> On 27.07.23 23:53, Julien Grall wrote:
>>>> Hi Juergen,
>>>>
>>>> On 24/07/2023 12:02, Juergen Gross wrote:
>>>>> Struct xs_tdb_record_hdr is used for nodes stored in the data base.
>>>>> When working on a node, struct node is being used, which is including
>>>>> the same information as struct xs_tdb_record_hdr, but in a different
>>>>> format. Rework struct xs_tdb_record_hdr in order to prepare including
>>>>> it in struct node.
>>>>>
>>>>> Do the following modifications:
>>>>>
>>>>> - move its definition to xenstored_core.h, as the reason to put it 
>>>>> into
>>>>>    utils.h are no longer existing
>>>>>
>>>>> - rename it to struct node_hdr, as the "tdb" in its name has only
>>>>>    historical reasons
>>>>>
>>>>> - replace the empty permission array at the end with a comment about
>>>>>    the layout of data in the data base (concatenation of header,
>>>>>    permissions, node contents, and children list)
>>>>>
>>>>> - use narrower types for num_perms and datalen, as those are naturally
>>>>>    limited to XENSTORE_PAYLOAD_MAX (childlen is different here, as 
>>>>> it is
>>>>>    in theory basically unlimited)
>>>>
>>>> The assumption is XENSTORE_PAYLOAD_MAX will never change and/or 
>>>> always apply for all the connection. I am aware of at least one 
>>>> downstream use where this is not the case.
>>>>
>>>> I am happy to use narrower types, but I would at least like some 
>>>> checks in Xenstore to ensure the limits are not reached.
>>>
>>> I will add a BUILD_BUG_ON().
>>
>> Initially I was thinking about a runtime check, but I am also fine 
>> with a BUILD_BUG_ON() if it is right next to length check in 
>> handle_input(). So if someone decided to add different payload size 
>> depending on the domain (such as privileged domain could do more), it 
>> would be easier to spot what else needs to be changed.
> 
> Is this really the correct placement?

I think so. By adding the BUILD_ON_BUG() right above the length check, 
it would be easier for everyone to know that the datastructure may also 
need to change. This ...

> 
> I've put it into write_node_raw(), as this is where the related datalen 
> member
> is being filled. 

... would be less obvious here and I think it might be miss.

Cheers,

-- 
Julien Grall

