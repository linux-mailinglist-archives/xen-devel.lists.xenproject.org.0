Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD1E5ACEDC
	for <lists+xen-devel@lfdr.de>; Mon,  5 Sep 2022 11:32:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.398671.639577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oV8S3-0007gj-AQ; Mon, 05 Sep 2022 09:31:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 398671.639577; Mon, 05 Sep 2022 09:31:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oV8S3-0007eS-65; Mon, 05 Sep 2022 09:31:31 +0000
Received: by outflank-mailman (input) for mailman id 398671;
 Mon, 05 Sep 2022 09:31:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oV8S1-0007eK-BO
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 09:31:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oV8Ry-0006NG-TT; Mon, 05 Sep 2022 09:31:26 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.1.223]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oV8Ry-0005LJ-Jv; Mon, 05 Sep 2022 09:31:26 +0000
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
	bh=5FgliYH0x1QTvE9lSa2XHpn9O4R/3vC2uFHrycBrS2c=; b=qcStOTPFMSdZij4xK8jtIGfEJh
	z8+eqNXcHNJVfGjvzJCLHXMneXcIae2kdPafYAobTLXd/03YNMpTmTzSrpVlruN/kwRTQw+wxddjN
	xp2qZulP4+xYo/mAY0X/p0NtG7v8etN91nwvGE1Av/ghsQZvxmeTDvWMdeg3cLCVzsBw=;
Message-ID: <5f0bf815-3236-2262-62b4-cd3d99bb60ff@xen.org>
Date: Mon, 5 Sep 2022 10:31:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH v2 03/10] xen/arm: smmuv3: Ensure queue is read after
 updating prod pointer
Content-Language: en-US
To: Rahul Singh <Rahul.Singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Zhou Wang <wangzhou1@hisilicon.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Will Deacon <will@kernel.org>
References: <cover.1662123432.git.rahul.singh@arm.com>
 <59c24309e2d8494edf414904fe9725b4e7387098.1662123432.git.rahul.singh@arm.com>
 <alpine.DEB.2.22.394.2209021613440.3931@ubuntu-linux-20-04-desktop>
 <FB788985-2DE3-406D-9282-56B8C9E4B1C1@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <FB788985-2DE3-406D-9282-56B8C9E4B1C1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 05/09/2022 10:18, Rahul Singh wrote:
>> On 3 Sep 2022, at 12:21 am, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>
>> On Fri, 2 Sep 2022, Rahul Singh wrote:
>>> From: Zhou Wang <wangzhou1@hisilicon.com>
>>>
>>> Backport Linux commit a76a37777f2c. This is the clean backport without
>>> any changes.
>>>
>>> Reading the 'prod' MMIO register in order to determine whether or
>>> not there is valid data beyond 'cons' for a given queue does not
>>> provide sufficient dependency ordering, as the resulting access is
>>> address dependent only on 'cons' and can therefore be speculated
>>> ahead of time, potentially allowing stale data to be read by the
>>> CPU.
>>>
>>> Use readl() instead of readl_relaxed() when updating the shadow copy
>>> of the 'prod' pointer, so that all speculated memory reads from the
>>> corresponding queue can occur only from valid slots.
>>>
>>> Signed-off-by: Zhou Wang <wangzhou1@hisilicon.com>
>>> Link: https://lore.kernel.org/r/1601281922-117296-1-git-send-email-wangzhou1@hisilicon.com
>>> [will: Use readl() instead of explicit barrier. Update 'cons' side to match.]
>>> Signed-off-by: Will Deacon <will@kernel.org>
>>> Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git a76a37777f2c
>>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>>> ---
>>> Changes in v2:
>>> - fix commit msg
>>> - add _iomb changes also from the origin patch
>>> ---
>>> xen/arch/arm/include/asm/system.h     |  1 +
>>> xen/drivers/passthrough/arm/smmu-v3.c | 11 +++++++++--
>>> 2 files changed, 10 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/include/asm/system.h b/xen/arch/arm/include/asm/system.h
>>> index 65d5c8e423..fe27cf8c5e 100644
>>> --- a/xen/arch/arm/include/asm/system.h
>>> +++ b/xen/arch/arm/include/asm/system.h
>>> @@ -29,6 +29,7 @@
>>> #endif
>>>
>>> #define smp_wmb()       dmb(ishst)
>>> +#define __iomb()        dmb(osh)
>>
>> We don't have any other #define starting with __ in system.h.
>> I wonder if we should call this macro differently or simply iomb().
>   
> I think either iomb() or dma_mb() will be the right name.
> Please let me know your view on this.

It is not 100% clear why Linux went with __iomb() rather than iomb(). 
But I would prefer to keep the __* version to match Linux.

If the others really want to drop the __. Then I think it should be name 
iomb(). The rationale is while __iomb() is an alias to dma_mb(), the 
__iormb() behaves differently compare to dma_mb() (I haven't into 
details why).

So if it was a read barrier, we would likely want to use the iormb() 
semantic. This will keep the terminology consistent with Linux (even if 
we remove the __).

Cheers,

-- 
Julien Grall

