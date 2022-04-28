Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4450513452
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 15:00:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316510.535438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nk3k2-0006A0-3B; Thu, 28 Apr 2022 12:59:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316510.535438; Thu, 28 Apr 2022 12:59:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nk3k2-00067d-0D; Thu, 28 Apr 2022 12:59:30 +0000
Received: by outflank-mailman (input) for mailman id 316510;
 Thu, 28 Apr 2022 12:59:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nk3k0-00067W-BY
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 12:59:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nk3k0-0006SX-3v; Thu, 28 Apr 2022 12:59:28 +0000
Received: from [54.239.6.184] (helo=[192.168.2.126])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nk3jz-0003fX-Tl; Thu, 28 Apr 2022 12:59:28 +0000
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
	bh=vuFgT9Y2joI5bZRvrXmv2sl62aqJNMlLAjfd3k+HU50=; b=JXV5RN51ryVVhaeKIkHAVUrNIb
	Mk0hAuCXDdi7TffAaUycP07IuNLozwGt2ibzu0sv9RvZHeUAJzVXTS8uNQ4zFFh6rWgQbGh9Ezwjc
	JgdKjSkqIf4CxHbq3qrb+GPmXgDGurp71RYI4ZpMkzKvN4wYywFxH6ZehrEInpaYYY8o=;
Message-ID: <fd2492da-0980-2dd4-f8d8-e2b86e9444ef@xen.org>
Date: Thu, 28 Apr 2022 13:59:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [PATCH] arm/its: enable LPIs before mapping the collection table
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <7762e8e35be1f99f2a7ca81aa8cf8fc502030e7b.1651075773.git.rahul.singh@arm.com>
 <a2bba079-0a26-8648-6f39-93148dbd5107@xen.org>
 <73BA5CB5-8B01-41BF-B967-15886554C230@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <73BA5CB5-8B01-41BF-B967-15886554C230@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 28/04/2022 11:00, Rahul Singh wrote:
> Hi Julien,
> 
>> On 27 Apr 2022, at 6:59 pm, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Rahul,
>>
>> On 27/04/2022 17:14, Rahul Singh wrote:
>>> MAPC_LPI_OFF ITS command error can be reported to software if LPIs are
>>
>> Looking at the spec (ARM IHI 0069H), I can't find a command error named MAPC_LPI_OFF. Is it something specific to your HW?
> 
> I found the issue on HW that implements GIC-600 and GIC-600 TRM specify the MAPC_LPI_OFF its command error.
> 
> https://developer.arm.com/documentation/100336/0106/introduction/about-the-gic-600
> {Table 3-15 ITS command and translation errors, records 13+ page 3-89}

Please provide a pointer to the spec in the commit message. This would 
help the reviewer to know where MAPC_LPI_OFF come from.

> 
>>
>>> not enabled before mapping the collection table using MAPC command.
>>> Enable the LPIs using GICR_CTLR.EnableLPIs before mapping the collection
>>> table.
>>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>>> ---
>>> xen/arch/arm/gic-v3.c | 4 ++--
>>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
>>> index 3c472ed768..8fb0014b16 100644
>>> --- a/xen/arch/arm/gic-v3.c
>>> +++ b/xen/arch/arm/gic-v3.c
>>> @@ -812,11 +812,11 @@ static int gicv3_cpu_init(void)
>>> /* If the host has any ITSes, enable LPIs now. */
>>> if ( gicv3_its_host_has_its() )
>>> {
>>> + if ( !gicv3_enable_lpis() )
>>> + return -EBUSY;
>>> ret = gicv3_its_setup_collection(smp_processor_id());
>>> if ( ret )
>>> return ret;
>>> - if ( !gicv3_enable_lpis() )
>>> - return -EBUSY;
>>
>> AFAICT, Linux is using the same ordering as your are proposing. It seems to have been introduced from the start, so it is not clear why we chose this approach.
> 
> Yes I also confirmed that before sending the patch for review. I think this is okay if we enable the enable LPIs before mapping the collection table.

In general, I expect change touching the GICv3 code based on the 
specification rather than "we think this is okay". This reduce the risk 
to make modification that could break other platforms (we can't possibly 
test all of them).

Reading through the spec, the definition of GICR.EnableLPIs contains the 
following:

"
0b0 LPI support is disabled. Any doorbell interrupt generated as a 
result of a write to a virtual LPI register must be discarded, and any 
ITS translation requests or commands involving LPIs in this 
Redistributor are ignored.

0b1 LPI support is enabled.
"

So your change is correct. But the commit message needs to be updated 
with more details on which GIC HW the issue was seen and why your 
proposal is correct (i.e. quoting the spec).

Cheers,

-- 
Julien Grall

