Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BFE2D3D99
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 09:40:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48038.84974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmv0s-0004EM-1w; Wed, 09 Dec 2020 08:39:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48038.84974; Wed, 09 Dec 2020 08:39:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmv0r-0004Dx-Ub; Wed, 09 Dec 2020 08:39:53 +0000
Received: by outflank-mailman (input) for mailman id 48038;
 Wed, 09 Dec 2020 08:39:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uDNN=FN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kmv0q-0004Ds-IJ
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 08:39:52 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 713da693-e4ec-4974-bd5f-07ebd5931f06;
 Wed, 09 Dec 2020 08:39:51 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 64BE8ACF9;
 Wed,  9 Dec 2020 08:39:50 +0000 (UTC)
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
X-Inumbo-ID: 713da693-e4ec-4974-bd5f-07ebd5931f06
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607503191; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WmiMX/BdyhXgrl1NBMoFYDC7yJJFNPRV13Db/WmHB0w=;
	b=C7ap+WWBLvI0qGL6VHY4w2V5FDtIGiTmCqoWIWnAhMKPUWrmYq9g6cl4GmW7LJHa7DgNix
	OvByPsQpLzN/XiMBCgnhBRwZV77Mv0KT48wWaMwDZ3ErrD5fVaYRMtZHe2YdAHwlaxAQYe
	qEcMoDMI1hwiZ7YUSZ7rawIbQS89jcs=
Subject: Re: dom0 PV looping on search_pre_exception_table()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Manuel Bouyer <bouyer@antioche.eu.org>
References: <20201208175738.GA3390@antioche.eu.org>
 <e73cc71d-c1a6-87c8-1b82-5d70d4f52eaa@citrix.com>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cf1f85eb-1aa2-c3fa-680c-ea5ba5f68647@suse.com>
Date: Wed, 9 Dec 2020 09:39:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <e73cc71d-c1a6-87c8-1b82-5d70d4f52eaa@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08.12.2020 19:13, Andrew Cooper wrote:
> On 08/12/2020 17:57, Manuel Bouyer wrote:
>> Hello,
>> for the first time I tried to boot a xen kernel from devel with
>> a NetBSD PV dom0. The kernel boots, but when the first userland prcess
>> is launched, it seems to enter a loop involving search_pre_exception_table()
>> (I see an endless stream from the dprintk() at arch/x86/extable.c:202)
>>
>> With xen 4.13 I see it, but exactly once:
>> (XEN) extable.c:202: Pre-exception: ffff82d08038c304 -> ffff82d08038c8c8
>>
>> with devel:
>> (XEN) extable.c:202: Pre-exception: ffff82d040393309 -> ffff82d0403938c8        
>> (XEN) extable.c:202: Pre-exception: ffff82d040393309 -> ffff82d0403938c8        
>> (XEN) extable.c:202: Pre-exception: ffff82d040393309 -> ffff82d0403938c8        
>> (XEN) extable.c:202: Pre-exception: ffff82d040393309 -> ffff82d0403938c8        
>> (XEN) extable.c:202: Pre-exception: ffff82d040393309 -> ffff82d0403938c8        
>> [...]
>>
>> the dom0 kernel is the same.
>>
>> At first glance it looks like a fault in the guest is not handled at it should,
>> and the userland process keeps faulting on the same address.
>>
>> Any idea what to look at ?
> 
> That is a reoccurring fault on IRET back to guest context, and is
> probably caused by some unwise-in-hindsight cleanup which doesn't
> escalate the failure to the failsafe callback.

But is this a 32-bit Dom0? 64-bit ones get well-known selectors
installed for CS and SS by create_bounce_frame(), and we don't
permit registration of non-canonical trap handler entry point
addresses.

I have to admit I also find curious the difference between 4.13
and master.

Jan

