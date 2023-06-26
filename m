Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB3673E03B
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 15:10:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555498.867304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDlzJ-0006FU-BK; Mon, 26 Jun 2023 13:10:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555498.867304; Mon, 26 Jun 2023 13:10:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDlzJ-0006CZ-8C; Mon, 26 Jun 2023 13:10:37 +0000
Received: by outflank-mailman (input) for mailman id 555498;
 Mon, 26 Jun 2023 13:10:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qDlzH-0006CT-QW
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 13:10:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qDlzG-0001d4-QZ; Mon, 26 Jun 2023 13:10:34 +0000
Received: from [193.85.242.128] (helo=[192.168.148.103])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qDlzG-0002QC-Kc; Mon, 26 Jun 2023 13:10:34 +0000
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
	bh=G4eWSyMvDC+09Qyd6/bjrGtcvaBOXYbn/TNk/q6T63I=; b=mK0yt+vjmnvM2YPtHbfS+hRojN
	uMvxflsAFY1d+xOa37hkvRnyI00TLfBfRZTowbSq/ZkxCHh4UofaV6GsF481ETWp8EaNx+F6KpTkC
	o0omTPk8+CbYx0bMaDiCs5KS+HQ9P6O9/vSWkoHFvxCirmTP4V9+cq5FJq+jjjNDpw4Q=;
Message-ID: <a1cea404-329b-1516-bc7c-1f9d427751a4@xen.org>
Date: Mon, 26 Jun 2023 14:10:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH 10/11] tools/xenstore: drop use of tdb
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230530091333.7678-1-jgross@suse.com>
 <20230530091333.7678-11-jgross@suse.com>
 <a9aaf2df-f3c6-71a5-426d-096d9aaf0545@xen.org>
 <2bfc737a-53c5-ef13-835e-97933a57f414@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <2bfc737a-53c5-ef13-835e-97933a57f414@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 26/06/2023 12:06, Juergen Gross wrote:
> On 19.06.23 20:22, Julien Grall wrote:
>> Hi Juergen,
>>
>> I haven't looked at the code in details yet. But I have a few 
>> questions regarding the commit message/
>>
>> On 30/05/2023 10:13, Juergen Gross wrote:
>>> Today all Xenstore nodes are stored in a TDB data base. This data base
>>> has several disadvantages:
>>>
>>> - it is using a fixed sized hash table, resulting in high memory
>>>    overhead for small installations with only very few VMs, and a rather
>>>    large performance hit for systems with lots of VMs due to many
>>>    collisions
>>
>> Can you provide some concrete numbers and a setup in mind? This would 
>> help if someone in the future says that they see the inverse and we 
>> need to rework the logic.
> 
> The hash table size today is 7919 entries. This means that e.g. in case
> of a simple desktop use case with 2 or 3 VMs probably far less than 10%
> of the entries will be used (assuming roughly 100 nodes per VM). OTOH a
> setup on a large server with 500 VMs would result in heavy conflicts in
> the hash list with 5-10 nodes per hash table entry.

Thanks! Can this be written down in the commit message?

>>> So drop using TDB and store the nodes directly in memory making them
>>> easily accessible. Use a hash-based lookup mechanism for fast lookup
>>> of nodes by their full path.
>>>
>>> For now only replace TDB keeping the current access functions.
>>
>> Do you plan to have the rest of the work upstreamed for 4.18? Also, if 
>> for some reasons, only this work will be merged. Will this have an 
>> impact on Xenstored memory usage/performance?
> 
> Memory usage should go down, especially after deleting lots of entries
> (AFAIK TDB will never free the unused memory again, it will just keep it
> for the future).
> 
> Memory fragmentation might go up, though.
> 
> Performance might be better, too, as there is no need to realloc() the
> memory when adding nodes.

What you write seems to be quite hypothetical so far. Given there this 
is not gated by an #ifdef, I think it would be good to have a good idea 
of the impact to have only the partial rework.

Cheers,

-- 
Julien Grall

