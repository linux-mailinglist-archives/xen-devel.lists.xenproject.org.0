Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F41413897B9
	for <lists+xen-devel@lfdr.de>; Wed, 19 May 2021 22:20:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130414.244341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljSf9-0006m7-E4; Wed, 19 May 2021 20:19:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130414.244341; Wed, 19 May 2021 20:19:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljSf9-0006jS-An; Wed, 19 May 2021 20:19:27 +0000
Received: by outflank-mailman (input) for mailman id 130414;
 Wed, 19 May 2021 20:19:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ljSf7-0006jM-On
 for xen-devel@lists.xenproject.org; Wed, 19 May 2021 20:19:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ljSf7-0001cP-Ie; Wed, 19 May 2021 20:19:25 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ljSf7-0004Dg-CS; Wed, 19 May 2021 20:19:25 +0000
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
	bh=+Rnvnhd/0HT/XthA1LClHFuxX5pf6YhLMjjVwgpQ0co=; b=YpVT4QwcXe0365iutBgIGrlqcf
	jgXGqPCJhAYoPc+FcbOqSMGzl/ISco1JTKIAnoix7kmMMAqHzVFwOLvpbybQrB7M3RRHEBD6kzJBk
	kqNk1CM5FN9rKfnfifaJS16ygU4HjQ4jcC2N8w21KUcOcLoUNNzy+QyIP+UkFz3PV6CI=;
Subject: Re: Hand over of the Xen shared info page
To: Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrii Chepurnyi <Andrii_Chepurnyi@epam.com>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <64bc6ab6ec387acebb40c1b4786dfda1050f9d50.camel@epam.com>
 <8ff05bdf-a6c4-6b14-b39c-7d9b3bb9d279@xen.org>
 <1db54c363eae22613280e7181805abee396fe5e9.camel@epam.com>
From: Julien Grall <julien@xen.org>
Message-ID: <8d1ecf6c-a0d1-d9bc-5daf-d02a34fff1e6@xen.org>
Date: Wed, 19 May 2021 21:19:23 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <1db54c363eae22613280e7181805abee396fe5e9.camel@epam.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 14/05/2021 10:50, Anastasiia Lukianenko wrote:
> Hi Julien!

Hello,

> On Thu, 2021-05-13 at 09:37 +0100, Julien Grall wrote:
>>
>> On 13/05/2021 09:03, Anastasiia Lukianenko wrote:
>> The alternative is for U-boot to go through the DT and infer which
>> regions are free (IOW any region not described).
> 
> Thank you for interest in the problem and advice on how to solve it.
> Could you please clarify how we could find free regions using DT in U-
> boot?

I don't know U-boot code, so I can't tell whether what I suggest would work.

In theory, the device-tree should described every region allocated in 
address space. So if you parse the device-tree and create a list (or any 
datastructure) with the regions, then any range not present in the list 
would be free region you could use.

However, I realized a few days ago that the magic pages are not 
described in the DT. We probably want to fix it by marking the page as 
"reserved" or create a specific bindings.

So you will need a specific quirk for them.

I have posted some more idea a separate thread [1] related to FreeBSD 
support for Arm.

Cheers,

[1] 
https://lore.kernel.org/xen-devel/f7360dac-5d83-733b-7ec5-c73d4dc0350d@xen.org/

-- 
Julien Grall

