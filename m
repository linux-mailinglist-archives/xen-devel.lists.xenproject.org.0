Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A6D55B94B
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 12:54:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356457.584699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5mNn-0000N5-Ta; Mon, 27 Jun 2022 10:54:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356457.584699; Mon, 27 Jun 2022 10:54:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5mNn-0000KG-QM; Mon, 27 Jun 2022 10:54:19 +0000
Received: by outflank-mailman (input) for mailman id 356457;
 Mon, 27 Jun 2022 10:54:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o5mNl-0000KA-Qf
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 10:54:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o5mNl-00011Y-5L; Mon, 27 Jun 2022 10:54:17 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=[192.168.2.226]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o5mNk-00021x-UZ; Mon, 27 Jun 2022 10:54:17 +0000
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
	bh=JXXPMSZGzGaXFcv/ptd/B+vPPagSuN1AnCFkgsww1xY=; b=no2OhGIEY69SiLfjnCUdHLdaET
	98SOaU6e4pcCdZQO12ctOYC2sy18Y05lJW5HuOqwqzh+l5AbQZ2aK7vGvfIoN2ekqXauTJ2ovOEjp
	k+kJQCT7W+vXjtyG+Fy4A9iyneNUw6faGz3EhCn3xxiemCF+zZG3sgOSPgh5T2ZPBXzA=;
Message-ID: <724524cd-7cb1-4cb9-e636-7a5ea3d78a71@xen.org>
Date: Mon, 27 Jun 2022 11:54:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH v7 9/9] xen: retrieve reserved pages on populate_physmap
To: Penny Zheng <Penny.Zheng@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Chen <Wei.Chen@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220620024408.203797-1-Penny.Zheng@arm.com>
 <20220620024408.203797-10-Penny.Zheng@arm.com>
 <ae94da35-40d5-f65c-1df5-3ebde3aa86a3@xen.org>
 <DU2PR08MB732533C0E687B1A27417E54AF7B99@DU2PR08MB7325.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <DU2PR08MB732533C0E687B1A27417E54AF7B99@DU2PR08MB7325.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 27/06/2022 11:11, Penny Zheng wrote:
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: Saturday, June 25, 2022 3:51 AM
>> To: Penny Zheng <Penny.Zheng@arm.com>; xen-devel@lists.xenproject.org
>> Cc: Wei Chen <Wei.Chen@arm.com>; Andrew Cooper
>> <andrew.cooper3@citrix.com>; George Dunlap <george.dunlap@citrix.com>;
>> Jan Beulich <jbeulich@suse.com>; Stefano Stabellini <sstabellini@kernel.org>;
>> Wei Liu <wl@xen.org>
>> Subject: Re: [PATCH v7 9/9] xen: retrieve reserved pages on
>> populate_physmap
>>
>> Hi Penny,
>>
>> On 20/06/2022 03:44, Penny Zheng wrote:
>>> When a static domain populates memory through populate_physmap at
>>> runtime, it shall retrieve reserved pages from resv_page_list to make
>>> sure that guest RAM is still restricted in statically configured memory
>> regions.
>>> This commit also introduces a new helper acquire_reserved_page to make
>> it work.
>>>
>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>> ---
>>> v7 changes:
>>> - remove the lock, since we add the page to rsv_page_list after it has
>>> been totally freed.
>>
>> Hmmm... Adding the page after it has been totally freed doesn't mean you
>> can get away with the lock. AFAICT you can still have concurrent free/allocate
>> that could modify the list.
>>
>> Therefore if you add/remove pages without the list, you would end up to
>> corrupt the list.
>>
>> If you disagree, then please point out which lock (or mechanism) will prevent
>> concurrent access.
>>
> 
> Ok. Combined with the last serie comments, actually, you suggest that we need to add
> two locks, right?

We at least need the second lock (i.e. d->page_alloc_lock). The first 
lock (i.e.) may not be necessary if all the static memory are allocated 
for a domain. So you can guarantee ordering by adding to the resv_page_list.

Unless there are an ordering issue between the locks, I would for now 
suggest to keep both. We can refine this afterwards.

Cheers,

-- 
Julien Grall

