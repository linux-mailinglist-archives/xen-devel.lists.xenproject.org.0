Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E27A4C7856
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 19:52:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280731.478779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOl77-0001Qq-DH; Mon, 28 Feb 2022 18:51:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280731.478779; Mon, 28 Feb 2022 18:51:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOl77-0001Pd-A7; Mon, 28 Feb 2022 18:51:17 +0000
Received: by outflank-mailman (input) for mailman id 280731;
 Mon, 28 Feb 2022 18:51:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nOl76-0001PX-1C
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 18:51:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nOl75-0004Eu-Qd; Mon, 28 Feb 2022 18:51:15 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.13.237]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nOl75-0000Xf-HB; Mon, 28 Feb 2022 18:51:15 +0000
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
	bh=l9bWHWXXVhia/n9u7oGRqlBS9yRDTfXgHaHFIdVfX/8=; b=SHFuJMwJOBmlq+TGhuIVrDfvsG
	XR5CDS3yyzl4Xdyzwgq3234syfuMWDzKW1llMjYuE/jt2AdZkIPRVUdzEe6d5UaPbzwxky2KMMbVg
	QYdwqnXoFpAuBamY1g9rpFYsxs82t2KA6qQT8buv3oRT7WzIb8RsByZ8/OpUpPfGZ5+E=;
Message-ID: <48a0712c-eff8-dfc1-2136-59317f22321f@xen.org>
Date: Mon, 28 Feb 2022 18:51:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [RFC PATCH 0/2] Introduce reserved Xenheap
To: Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Penny Zheng <Penny.Zheng@arm.com>
References: <20220224013023.50920-1-Henry.Wang@arm.com>
 <6269ec3d-039e-d68f-771d-c5e088631410@xen.org>
 <PA4PR08MB625324910ED4D40383191F9D92019@PA4PR08MB6253.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <PA4PR08MB625324910ED4D40383191F9D92019@PA4PR08MB6253.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 28/02/2022 07:12, Henry Wang wrote:
> Hi Julien,

Hi Henry,

>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: Saturday, February 26, 2022 4:09 AM
>> To: Henry Wang <Henry.Wang@arm.com>; xen-devel@lists.xenproject.org;
>> sstabellini@kernel.org
>> Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>; Wei Chen
>> <Wei.Chen@arm.com>; Penny Zheng <Penny.Zheng@arm.com>
>> Subject: Re: [RFC PATCH 0/2] Introduce reserved Xenheap
>>
>> Hi Henry,
>>
>> On 24/02/2022 01:30, Henry Wang wrote:
>>> The reserved Xenheap, or statically configured Xenheap, refers to parts
>>> of RAM reserved in the beginning for Xenheap. Like the static memory
>>> allocation, such reserved Xenheap regions are reserved by configuration
>>> in the device tree using physical address ranges.
>>
>> In Xen, we have the concept of domheap and xenheap. For Arm64 and x86
>> they would be the same. But for Arm32, they would be different: xenheap
>> is always mapped whereas domheap is separate.
>>
>> Skimming through the series, I think you want to use the region for both
>> domheap and xenheap. Is that correct?
> 
> Yes I think that would be correct, for Arm32, instead of using the full
> `ram_pages` as the initial value of `heap_pages`, we want to use the
> region specified in the device tree. But we are confused if this is the
> correct (or preferred) way for Arm32, so in this series we only
> implemented the reserved heap for Arm64.

That's an interesting point. When I skimmed through the series on 
Friday, my first thought was that for arm32 it would be only xenheap (so
all the rest of memory is domheap).

However, Xen can allocate memory from domheap for its own purpose (e.g. 
we don't need contiguous memory, or for page-tables).

In a fully static environment, the domheap and xenheap are both going to 
be quite small. It would also be somewhat difficult for a user to size 
it. So I think, it would be easier to use the region you introduce for 
both domheap and xenheap.

Stefano, Bertrand, any opionions?

On a separate topic, I think we need some documentation explaining how a 
user can size the xenheap. How did you figure out for your setup?

>>
>> Furthemore, now that we are introducing more static region, it will get
>> easier to overlap the regions by mistakes. I think we want to have some
>> logic in Xen (or outside) to ensure that none of them overlaps. Do you
>> have any plan for that?
> 
> Totally agree with this idea, but before we actually implement the code,
> we would like to firstly share our thoughts on this: One option could be to
> add data structures to notes down these static memory regions when the
> device tree is parsed, and then we can check if they are overlapped.

This should work.

> Over
> the long term (and this long term option is currently not in our plan),
> maybe we can add something in the Xen toolstack for this usage?

When I read "Xen toolstack", I read the tools that will run in dom0. Is 
it what you meant?

> 
> Also, I am wondering if the overlapping check logic should be introduced
> in this series. WDYT?

I would do that in a separate series.

Cheers,

-- 
Julien Grall

