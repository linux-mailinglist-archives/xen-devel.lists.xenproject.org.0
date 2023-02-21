Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B8069EA49
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 23:37:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499190.770233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUbFC-0002U0-2d; Tue, 21 Feb 2023 22:36:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499190.770233; Tue, 21 Feb 2023 22:36:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUbFB-0002S9-W6; Tue, 21 Feb 2023 22:36:17 +0000
Received: by outflank-mailman (input) for mailman id 499190;
 Tue, 21 Feb 2023 22:36:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pUbFA-0002S2-G9
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 22:36:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pUbF9-0006jI-Bw; Tue, 21 Feb 2023 22:36:15 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pUbF9-0001M9-6V; Tue, 21 Feb 2023 22:36:15 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=8N7ZTxZRpwrluNySXgT83M02a08yev1m+nEgeD0g1zU=; b=ERs3UxJVspoKio5b59Zw04RBbz
	Cxnr6dLB37UZIYPLSIWLVgZp+QXa8LOh14pAky+T9bE9AZ2NjWFvExirAWHMukVdXHBKiDlPupkIi
	zIGsMT+ylyrOsNquTtYEwVm0/zEi7AtxAoX/bqW6Nv1+5fBB99mRgE1gW2XpxKrtOgmw=;
Message-ID: <5fc2636e-45b0-e515-d901-18dc5fc214eb@xen.org>
Date: Tue, 21 Feb 2023 22:36:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>
References: <20230120100028.11142-1-jgross@suse.com>
 <20230120100028.11142-2-jgross@suse.com>
 <2131198f-f54b-2c38-8104-1c8b63e9990c@xen.org>
 <c203062e-fd76-3aa1-8014-bf7d13eae1aa@suse.com>
 <bd355c4c-b3a9-ac79-8522-5ff227ae26ab@xen.org>
 <adae39fe-1b72-e4ac-eb17-8bbfb28011f2@suse.com>
 <a0431ac1-4d1a-23c4-cb31-1d9d8812fc94@xen.org>
 <32a517cf-4448-2208-4877-83c7a7531635@suse.com>
 <20151614-96ca-0875-29a0-8099953b7e61@xen.org>
 <e90591bd-1242-0721-242b-5db2565349f8@suse.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 01/13] tools/xenstore: don't allow creating too many
 nodes in a transaction
In-Reply-To: <e90591bd-1242-0721-242b-5db2565349f8@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 21/02/2023 08:10, Juergen Gross wrote:
> On 20.02.23 19:01, Julien Grall wrote:
>> So I have recreated an XTF test which I think match what you wrote [1].
>>
>> It is indeed failing without your patch. But then there are still some 
>> weird behavior here.
>>
>> I would expect the creation of the node would also fail if instead of 
>> removing the node if removed outside of the transaction.
>>
>> This is not the case because we are looking at the current quota. So 
>> shouldn't we snapshot the global count?
> 
> As we don't do a global snapshot of the data base for a transaction 
> (this was
> changed due to huge memory needs, bad performance, and a higher transaction
> failure rate), 

I am a bit surprised that the only way to do proper transaction is to 
have a global snapshot. Instead, you could have an overlay.

> I don't think we should snapshot the count either.

But that would mean that the quota will change depending on modification 
of the global database while the transaction is inflight.

I guess this is not better nor worse that the current situation. But it 
is still really confusing for a client because:
   1) The error could happen at random point
   2) You may see an inconsistent database as nodes are only cached when 
they are first accessed

> A transaction is performed atomically at the time it is finished. Therefore
> seeing the current global state inside the transaction (with the 
> transaction
> private state on top like an overlay) is absolutely fine IMO.

To me it is just showing that our concept of transaction is very broken 
in C Xenstored. I am curious to know whether OXenstored is behaving the 
same way.

Anyway, I agree this is not better nor worse than the current situation. 
So I will acked this patch:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

