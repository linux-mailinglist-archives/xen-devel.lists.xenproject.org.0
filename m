Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59911388E21
	for <lists+xen-devel@lfdr.de>; Wed, 19 May 2021 14:33:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130040.243813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljLNk-0006jT-J7; Wed, 19 May 2021 12:33:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130040.243813; Wed, 19 May 2021 12:33:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljLNk-0006hP-G5; Wed, 19 May 2021 12:33:00 +0000
Received: by outflank-mailman (input) for mailman id 130040;
 Wed, 19 May 2021 12:32:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ljLNi-0006hJ-VF
 for xen-devel@lists.xenproject.org; Wed, 19 May 2021 12:32:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ljLNh-0001Nd-D7; Wed, 19 May 2021 12:32:57 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ljLNh-0000ne-6a; Wed, 19 May 2021 12:32:57 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=IQ3aCoUHwi/lTR0+WrwBYffNjniV/qd4sAoovl954I0=; b=Ab4D1FbQ6Clf3eFPiKghcDL8P9
	EFv+SgmKfQ1e6TZ0ppBEb4sIWj0YZGB9pRZ6lddXlgquhzSQHtjvjV/wsxJUZkF7BPV404JVlXvJM
	GlkVXK1Gr2zlOrDNGIFMu48rW6ue9t9taxaqYIao6eTSHQfPtHoBY5hjJeIHF3V7hi9g=;
Subject: Re: Preserving transactions accross Xenstored Live-Update
To: Juergen Gross <jgross@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Edwin Torok <edvin.torok@citrix.com>, "Doebel, Bjoern" <doebel@amazon.de>,
 raphning@amazon.co.uk, "Durrant, Paul" <pdurrant@amazon.co.uk>
References: <13bbb51e-f63d-a886-272f-e6a6252fb468@xen.org>
 <377d042d-40ec-dafc-3d03-370c4f5dbb4c@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c14d7a27-b486-01c1-1a24-70f286c34431@xen.org>
Date: Wed, 19 May 2021 13:32:54 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <377d042d-40ec-dafc-3d03-370c4f5dbb4c@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 19/05/2021 10:09, Juergen Gross wrote:
> On 18.05.21 20:11, Julien Grall wrote:
>>
>> I have started to look at preserving transaction accross Live-update in 
> 
>> C Xenstored. So far, I managed to transfer transaction that read/write 
>> existing nodes.
>>
>> Now, I am running into trouble to transfer new/deleted node within a 
>> transaction with the existing migration format.
>>
>> C Xenstored will keep track of nodes accessed during the transaction 
>> but not the children (AFAICT for performance reason).
> 
> Not performance reasons, but because there isn't any need for that:
> 
> The children are either unchanged (so the non-transaction node records
> apply), or they will be among the tracked nodes (transaction node
> records apply). So in both cases all children should be known.
In theory, opening a new transaction means you will not see any 
modification in the global database until the transaction has been 
committed. What you describe would break that because a client would be 
able to see new nodes added outside of the transaction.

However, C Xenstored implements neither of the two. Currently, when a 
node is accessed within the transaction, we will also store the names of 
the current children.

To give an example with access to the global DB (prefixed with TID0) and 
within a transaction (TID1)

	1) TID0: MKDIR "data/bar"
         2) Start transaction TID1
	3) TID1: DIRECTORY "data"
		-> This will cache the node data
	4) TID0: MKDIR "data/foo"
		-> This will create "foo" in the global database
	5) TID1: MKDIR "data/fish"
		-> This will create "fish" in the transaction
	5) TID1: DIRECTORY "data"
		-> This will only return "bar" and "fish"

If we Live-Update between 4) and 5). Then we should make sure that "bar" 
cannot be seen in the listing by TID1.

Therefore, I don't think we can restore the children using the global 
node here. Instead we need to find a way to transfer the list of known 
children within the transaction.

As a fun fact, C Xenstored implements weirdly the transaction, so TID1 
will be able to access "bar" if it knows the name but not list it.

> 
> In case a child has been deleted in the transaction, the stream should
> contain a node record for that child with the transaction-id and the
> number of permissions being zero: see docs/designs/xenstore-migration.md

See above why this is not sufficient.

Cheers,

-- 
Julien Grall

