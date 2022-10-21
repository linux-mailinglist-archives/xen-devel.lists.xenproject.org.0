Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E68896074CA
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 12:15:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427534.676700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olp3Z-0001t9-WF; Fri, 21 Oct 2022 10:15:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427534.676700; Fri, 21 Oct 2022 10:15:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olp3Z-0001q5-TD; Fri, 21 Oct 2022 10:15:13 +0000
Received: by outflank-mailman (input) for mailman id 427534;
 Fri, 21 Oct 2022 10:15:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1olp3Y-0001oX-9d
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 10:15:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1olp3Y-0007re-2T; Fri, 21 Oct 2022 10:15:12 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=[192.168.29.168]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1olp3X-0003PI-RT; Fri, 21 Oct 2022 10:15:12 +0000
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
	bh=/8u8+zco2y9CslAFeSm9UDDuJ8qWMDuBULNqBkJNWrY=; b=Kzdwyx9tWLI4t2MD375DrT5IVF
	Z/caO9V0+FY+Cd08cIniEaKauC/GMqcXvyrul3gq6z8eCt2+lrC9gT99ryjQVdAJKTI0xChPENs4J
	Kpme7ZcpgN6JNlDJuNsoqy+m0hN5j3RI8mRY844IkmVgTAXOwp/ty439dk5QqwpUjaOI=;
Message-ID: <89639d8e-b2a4-a191-0d59-9bd8c5bbb7c0@xen.org>
Date: Fri, 21 Oct 2022 11:15:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: [4.17] RE: [PATCH v2] xen/arm: p2m: fix pa_range_info for 52-bit
 pa range
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, Xenia Ragiadakou
 <burzalodowa@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221019144913.291677-1-burzalodowa@gmail.com>
 <c3ecb453-ac2e-fd0d-d5ca-3f485d7f53a3@xen.org>
 <AS8PR08MB7991AE87BC1FF9E47A3F9F9D922D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AS8PR08MB7991AE87BC1FF9E47A3F9F9D922D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 21/10/2022 02:42, Henry Wang wrote:
> Hi Julien and Xenia,

Hi Henry,


>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> <Volodymyr_Babchuk@epam.com>; Henry Wang <Henry.Wang@arm.com>
>> Subject: Re: [PATCH v2] xen/arm: p2m: fix pa_range_info for 52-bit pa range
>>
>> (+ Henry)
>>
>> Hi Xenia,
>>
>> On 19/10/2022 15:49, Xenia Ragiadakou wrote:
>>> Currently, the fields 'root_order' and 'sl0' of the pa_range_info for
>>> the 52-bit pa range have the values 3 and 3, respectively.
>>> This configuration does not match any of the valid root table configurations
>>> for 4KB granule and t0sz 12, described in ARM DDI 0487I.a D8.2.7.
>>>
>>> More specifically, according to ARM DDI 0487I.a D8.2.7, in order to support
>>> the 52-bit pa size with 4KB granule, the p2m root table needs to be
>> configured
>>> either as a single table at level -1 or as 16 concatenated tables at level 0.
>>> Since, currently there is not support for level -1, set the 'root_order' an
>>
>> Typo: s/not/no/ (I can fix it while committing)
>>
>>> 'sl0' fields of the 52-bit pa_range_info according to the second approach.
>>>
>>> Note that the values of those fields are not used so far. This patch updates
>>> their values only for the sake of correctness.
>>>
>>> Fixes: 407b13a71e32 ("xen/arm: p2m don't fall over on FEAT_LPA enabled
>> hw")
>>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
>>
>> Reviewed-by: Julien Grall <jgrall@amazon.com>
>>
>> Regarding 4.17, I am a bit split whether this should be included. On one
>> hand, it would be good to have the value correct (not that I expect
>> anymore to try using 52-bit on 4.17...). On the other hand, this is not
>> used so there is no bug (this could also be an argument to add it
>> because it is nearly risk free).
>>
>> If we don't include it, I will definitely add in my list of potential
>> backports.
>>
>> Henry, any thoughts?
> 
> I am actually monitoring this patch for the same question that if
> we need this patch for 4.17.
> 
> I see no reason to exclude this patch since (1) we want to make sure
> our code is correct (2) I am pretty sure we are not using 52 bit PA so
> as indicated by commit message this patch is just for correctness and
> no potential harm to include this patch in the release (probably even
> backporting this patch till the 52 bit PA was introduced?).
> 
> So if you wouldn't mind committing this patch, you can of course have
> my:

Thanks for the feedback. I am happy to commit it. So...

> 
> Release-acked-by: Henry Wang <Henry.Wang@arm.com>

I have now done it with your tag added.

Cheers,

-- 
Julien Grall

