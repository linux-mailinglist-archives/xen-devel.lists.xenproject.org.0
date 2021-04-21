Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 417D336691B
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 12:21:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114340.217895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ9yz-0008Op-P2; Wed, 21 Apr 2021 10:21:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114340.217895; Wed, 21 Apr 2021 10:21:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ9yz-0008OT-LW; Wed, 21 Apr 2021 10:21:21 +0000
Received: by outflank-mailman (input) for mailman id 114340;
 Wed, 21 Apr 2021 10:21:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lZ9yy-0008OI-5A
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 10:21:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lZ9yw-0005ON-UU; Wed, 21 Apr 2021 10:21:18 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lZ9yw-0003Fb-Oe; Wed, 21 Apr 2021 10:21:18 +0000
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
	bh=YOpOABEOojqKBQPd/Pxk95IAlQb+FLSZ4QC7uulASH4=; b=Z+Jpfy8xcaAMDGeWfvoRW4Vl9k
	cJiRWx348zfy3sWUnT0W5WuwnHtFMpTxabUsrFB0tzz6oUUp/pbpdRRN6j4EXAqKh0pD/YqTHMIkM
	TeKLOwvlNK49Dhbt2xFgyosMe9gON0fkAU3x2re/DcF/BbqbmulRpJo7gN/hHOt7xgZI=;
Subject: Re: [PATCH 3/9] arm/gic: Get rid of READ/WRITE_SYSREG32
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, bertrand.marquis@arm.com
References: <20210420070853.8918-1-michal.orzel@arm.com>
 <20210420070853.8918-4-michal.orzel@arm.com>
 <1a087bed-94e5-bada-76c4-92e0c429cce6@xen.org>
 <fd5924c5-685d-a9fc-1116-c1b8909c9aea@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7cac2363-6263-6b64-2f7e-c3f7cd588d15@xen.org>
Date: Wed, 21 Apr 2021 11:21:17 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <fd5924c5-685d-a9fc-1116-c1b8909c9aea@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Michal,

On 21/04/2021 08:48, Michal Orzel wrote:
> On 20.04.2021 15:28, Julien Grall wrote:
>> On 20/04/2021 08:08, Michal Orzel wrote:
>>> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
>>>      static unsigned int gicv3_read_irq(void)
>>>    {
>>> -    unsigned int irq = READ_SYSREG32(ICC_IAR1_EL1);
>>> +    register_t irq = READ_SYSREG(ICC_IAR1_EL1);
>>>          dsb(sy);
>>>    -    return irq;
>>> +    /* Number of IRQs do not exceed 32bit. */
>>
>> If we want to be pedantic, the IRQs are encoded using 23-bit. So maybe we want to mask them below.
>>
>>> +    return (unsigned int)irq;
>>
>> NIT: We tend to avoid explicit cast unless they are strictly necessary because they can be more harmful than implicit cast (the compiler may not cast every conversion). So I would drop it and just keep the comment.
>>
> Ok. I will do:
> return (irq & 0xffffff);

Sounds good, so long we the value is not hardoced but provided through a 
define :).

Cheers,

-- 
Julien Grall

