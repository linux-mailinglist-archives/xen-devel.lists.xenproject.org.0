Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A766F5285
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 10:02:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529015.822909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu7Ra-0001SA-7y; Wed, 03 May 2023 08:02:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529015.822909; Wed, 03 May 2023 08:02:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu7Ra-0001Ov-53; Wed, 03 May 2023 08:02:34 +0000
Received: by outflank-mailman (input) for mailman id 529015;
 Wed, 03 May 2023 08:02:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pu7RY-0001Nb-4t
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 08:02:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pu7RX-000419-8m; Wed, 03 May 2023 08:02:31 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238] helo=[192.168.7.72])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pu7RX-00072m-2y; Wed, 03 May 2023 08:02:31 +0000
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
	bh=agd0YHdB4COnxADCJ9g9QhBh4bEoptan8icrJwMebws=; b=XKvf32gvDUY6nW4SOcu5kWxp0H
	yls5SMFIcQAMLcD519IWP0ST8P7GRos7UELyD2wg/lrSMefPL9aq+ZbRSP4xjFPQ5W9g6yC1pVL5M
	LDcsZgX/PHI6LGP0b4F6UJN1/onxIG7JuXtErqnctwvKRC0Vi4/BOHgF1J8YYmPSIRrc=;
Message-ID: <acea2ebe-47c5-1d26-887d-b29df06d07dd@xen.org>
Date: Wed, 3 May 2023 09:02:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v4 05/13] tools/xenstore: use accounting buffering for
 node accounting
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230405070349.25293-1-jgross@suse.com>
 <20230405070349.25293-6-jgross@suse.com>
 <c3be0db1-ed47-967b-7f98-6f1569691fb6@xen.org>
 <887675ad-ef06-cf8c-8a32-5b3f726e2198@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <887675ad-ef06-cf8c-8a32-5b3f726e2198@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 03/05/2023 06:13, Juergen Gross wrote:
> On 02.05.23 20:55, Julien Grall wrote:
>> Hi Juergen,
>>
>> On 05/04/2023 08:03, Juergen Gross wrote:
>>> Add the node accounting to the accounting information buffering in
>>> order to avoid having to undo it in case of failure.
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> ---
>>>   tools/xenstore/xenstored_core.c   | 21 ++-------------------
>>>   tools/xenstore/xenstored_domain.h |  4 ++--
>>>   2 files changed, 4 insertions(+), 21 deletions(-)
>>>
>>> diff --git a/tools/xenstore/xenstored_core.c 
>>> b/tools/xenstore/xenstored_core.c
>>> index 84335f5f3d..92a40ccf3f 100644
>>> --- a/tools/xenstore/xenstored_core.c
>>> +++ b/tools/xenstore/xenstored_core.c
>>> @@ -1452,7 +1452,6 @@ static void destroy_node_rm(struct connection 
>>> *conn, struct node *node)
>>>   static int destroy_node(struct connection *conn, struct node *node)
>>>   {
>>>       destroy_node_rm(conn, node);
>>> -    domain_nbentry_dec(conn, get_node_owner(node));
>>>       /*
>>>        * It is not possible to easily revert the changes in a 
>>> transaction.
>>> @@ -1797,27 +1796,11 @@ static int do_set_perms(const void *ctx, 
>>> struct connection *conn,
>>>       old_perms = node->perms;
>>>       domain_nbentry_dec(conn, get_node_owner(node));
>>
>> IIRC, we originally said that domain_nbentry_dec() could never fail in 
>> a non-transaction case. But with your current rework, the function can 
>> now fail because of an allocation failure.
> 
> How would that be possible to happen?
> 
> domain_nbentry_dec() can only be called if a node is being owned by an 
> already
> known domain. So allocation is impossible to happen, as this would be a 
> major
> error in xenstored.

 From my understanding, the nodes accounting will be temporary and then 
committed at the end of the request.

So we would call acc_add_changed_dom() which may require allocation to 
hold the temporary accounting.

> 
>> Therefore, shouldn't we now check the error? (Possibly in a patch 
>> beforehand).
> 
> I don't think so. I can add a comment if you want.

See above.

Cheers,

-- 
Julien Grall

