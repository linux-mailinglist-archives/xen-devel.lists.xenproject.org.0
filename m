Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1972863F821
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 20:26:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451132.708751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0pBX-0003Ew-LM; Thu, 01 Dec 2022 19:25:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451132.708751; Thu, 01 Dec 2022 19:25:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0pBX-0003Cr-Ic; Thu, 01 Dec 2022 19:25:27 +0000
Received: by outflank-mailman (input) for mailman id 451132;
 Thu, 01 Dec 2022 19:25:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p0pBW-0003Cj-8m
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 19:25:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p0pBV-0001ZK-KI; Thu, 01 Dec 2022 19:25:25 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p0pBV-000413-Dd; Thu, 01 Dec 2022 19:25:25 +0000
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
	bh=W6nssiOm/uphqiZYWMvX0vxit2Y5B4Kq9RinETGP9gg=; b=2YHZF/KqfNj14PZvNJWpXfMcOo
	B86dYfeST4b9j6A9Yg1Ty/YJ+E1oH6qQ39F+2ngUj7dzGl/vi+0kTsMrWnhLnisTg4QBFfoeqXnxM
	SX2+N9JiJx2GZ1j/pRVuz0I7tJp3wjSaj17bJqgioe9R6s4eK006m40WEd1FgI+JWgTs=;
Message-ID: <39f4a517-7263-2431-920f-fe8ea65b7495@xen.org>
Date: Thu, 1 Dec 2022 19:25:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20221101152842.4257-1-jgross@suse.com>
 <20221101152842.4257-14-jgross@suse.com>
 <32f61945-08fa-f095-02c4-9d52b66b6c04@xen.org>
 <a55a6433-d49f-2963-0f79-ee98441afe5f@suse.com>
 <c878e5dc-1cfc-fc7f-f535-9d1afb99f378@xen.org>
 <ceda3142-f5c0-f1b1-19c4-40aade11fa63@suse.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 13/20] tools/xenstore: don't allow creating too many nodes
 in a transaction
In-Reply-To: <ceda3142-f5c0-f1b1-19c4-40aade11fa63@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 08/11/2022 08:09, Juergen Gross wrote:
> On 07.11.22 19:37, Julien Grall wrote:
>> On 07/11/2022 08:34, Juergen Gross wrote:
>>> On 06.11.22 23:00, Julien Grall wrote:
>>>> Hi Juergen,
>>>>
>>>> On 01/11/2022 15:28, Juergen Gross wrote:
>>>>> The accounting for the number of nodes of a domain in an active
>>>>> transaction is not working correctly, as it allows to create arbitrary
>>>>> number of nodes. The transaction will finally fail due to exceeding
>>>>> the number of nodes quota, but before closing the transaction an
>>>>> unprivileged guest could cause Xenstore to use a lot of memory.
>>>>
>>>> I have already made some of comments on the security ML when this 
>>>> was initially set. The arguments still don't sound right to me.
>>>>
>>>> For a first, since XSA-326, we have a cap in place for the memory a 
>>>> domain can consume. So this surely can't be a "lot of memory". 
>>>> Otherwise we are saying that our limit (there are other way to hit 
>>>> it) were wrong...
>>>
>>> Yeah, maybe I should rework the commit message.
>>>
>>> The reason I still want to keep the patch is that in a transaction 
>>> without any
>>> conflicts and without hitting any transaction specific limits (number 
>>> of nodes
>>> accessed), the errors returned due to a single operation should be 
>>> the same as
>>> with the same operation performed outside a transaction.
>>
>> This seems to be a very niche use case. So it is not clear to me why 
>> this matter and we want to add extra check for everyone.
> 
> It is a matter of correctness.

I think this is a matter of perspective. Transactions are inherently 
racy and I see no point of try to solve issues in the idealistic case 
(i.e. no conflict). The reasoning below...

> 
> Additionally, after the internal accounting rework this makes even more
> sense, as the maximum values per domain seen are really correct, even when
> queried while transactions are active.
... might be a better justification. But I will need to review the other 
patch in order to forge a more positive opinion. Can you point me to the 
patch?

Cheers,

-- 
Julien Grall

