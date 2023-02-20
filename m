Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3143D69CA7B
	for <lists+xen-devel@lfdr.de>; Mon, 20 Feb 2023 13:08:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498087.768902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pU4wv-0000Ic-9y; Mon, 20 Feb 2023 12:07:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498087.768902; Mon, 20 Feb 2023 12:07:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pU4wv-0000GR-5r; Mon, 20 Feb 2023 12:07:17 +0000
Received: by outflank-mailman (input) for mailman id 498087;
 Mon, 20 Feb 2023 12:07:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pU4wt-0000GL-C4
 for xen-devel@lists.xenproject.org; Mon, 20 Feb 2023 12:07:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pU4ws-0006zh-EX; Mon, 20 Feb 2023 12:07:14 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231] helo=[10.95.98.51])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pU4ws-0002te-6t; Mon, 20 Feb 2023 12:07:14 +0000
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
	bh=zcrL1e44/8H+/+yQs6pkKueOKtpkPX/DtFV1euHA7YY=; b=eU+/7jrpfRH0atBAKPMaJxDg0G
	mr9EZ8fK3+KD1s7/OY1iniptXvlG5+OMvM+v/+WMm4Nk2nhFcpo7ARzXkPfweGihjIT/ZwWAuUpB6
	ga99A4JfyKr5gDYLthKhANc1IOaM8jeAkN6YFafnE+lG7kAa0tgcXoO19RCEcFkuKttU=;
Message-ID: <bd355c4c-b3a9-ac79-8522-5ff227ae26ab@xen.org>
Date: Mon, 20 Feb 2023 12:07:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.1
Subject: Re: [PATCH v2 01/13] tools/xenstore: don't allow creating too many
 nodes in a transaction
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230120100028.11142-1-jgross@suse.com>
 <20230120100028.11142-2-jgross@suse.com>
 <2131198f-f54b-2c38-8104-1c8b63e9990c@xen.org>
 <c203062e-fd76-3aa1-8014-bf7d13eae1aa@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <c203062e-fd76-3aa1-8014-bf7d13eae1aa@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 20/02/2023 11:04, Juergen Gross wrote:
> On 20.02.23 10:46, Julien Grall wrote:
>> Hi Juergen,
>>
>> On 20/01/2023 10:00, Juergen Gross wrote:
>>> The accounting for the number of nodes of a domain in an active
>>> transaction is not working correctly, as it allows to create arbitrary
>>> number of nodes. The transaction will finally fail due to exceeding
>>> the number of nodes quota, but before closing the transaction an
>>> unprivileged guest could cause Xenstore to use a lot of memory.
>>
>> I know I said I would delay my decision on this patch. However, I was 
>> still expecting the commit message to be updated based on our previous 
>> discussion.
> 
> As said before, I was waiting on the settlement of our discussion before
> doing the update.

This is not a very good practice to resend a patch without recording the 
disagreement because new reviewers may not be aware of the disagreement 
and this could end up to be committed by mistake...

> 
>> Also thinking more about it, "The transaction will finally fail due to 
>> exceeding the number of nodes quota" may not be true for a couple of 
>> reasons:
>>    1) The transaction may removed a node afterwards.
> 
> Yes, and? Just because it is a transaction, this is still a violation of
> the quota. Even outside a transaction you could use the same reasoning,
> but you don't (which is correct, of course).

I can understand your point. However, to me, the goal of the transaction 
is to commit everything in one go at the end. So the violations in the 
middle should not matter.

Furthermore, I would expect a transaction to work on a snapshot of the 
system. So it feels really strange to me that we are constantly checking 
the quota with the updated values rather than the initial one.

> 
> In case you never finish the transaction, you are owner of more than
> allowed nodes.
How so? The nodes would not be committed so you don't really own them.
We also have quotas to limit the number of nodes accessed in a transaction.

> 
>>    2) A node may have been removed outside of the transaction.
> 
> If the removed node hasn't been touched by the transaction, it will be
> accounted for correctly.

It depends on when the node was removed. If it is removed *after* the 
quota was hit then your transaction will fail.

>  If it has been touched, the transaction will
> fail anyway.
So the transaction will fail to commit because there is a conflict. So 
the client is expected to retry it. We should not expected the client to 
retry for error like quota.

So the overall behavior is changed.

> 
>> In both situation, the transaction will still be committed. This will 
>> now be prevented by this patch.
> 
> As said above, only in the first case.

Cheers,

-- 
Julien Grall

