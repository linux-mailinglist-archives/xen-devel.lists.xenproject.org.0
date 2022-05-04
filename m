Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE846519EBB
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 13:59:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320635.541466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmDfB-0004sS-Bx; Wed, 04 May 2022 11:59:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320635.541466; Wed, 04 May 2022 11:59:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmDfB-0004p3-8v; Wed, 04 May 2022 11:59:25 +0000
Received: by outflank-mailman (input) for mailman id 320635;
 Wed, 04 May 2022 11:59:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nmDf9-0004ox-QV
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 11:59:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nmDf9-0003xy-HQ; Wed, 04 May 2022 11:59:23 +0000
Received: from [54.239.6.185] (helo=[192.168.21.29])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nmDf9-0008Ik-BY; Wed, 04 May 2022 11:59:23 +0000
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
	bh=rMOx4W//VFhBwFm/jRSN74+WIOFhA+Era3LnSSHVD8M=; b=uBVFSbtGjpvmC7vR/U2oTr4N9d
	B93M4lHOpbOMQIISn9YA1M9FP49GZMGDcHCRxO8w5qqL8/dnp1rPKu+ru3R8eMCZ+fv2DbreDxt+3
	/JEZvwccNII+pFi3+527PI/gu+szSKstIHpUa9M3yPtLKKcKw9jYYgOwq7vWLxibRCbk=;
Message-ID: <0bab2226-fcce-6525-323f-c95d951e6696@xen.org>
Date: Wed, 4 May 2022 12:59:21 +0100
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
 <ea7e891a-6e4c-50e2-dc3f-82f373640784@xen.org>
 <66A4F1AF-9539-497E-A777-316D1C21E1F4@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <66A4F1AF-9539-497E-A777-316D1C21E1F4@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 04/05/2022 12:25, Rahul Singh wrote:
>> On 3 May 2022, at 4:58 pm, Julien Grall <julien@xen.org> wrote:
>> On 27/04/2022 17:14, Rahul Singh wrote:
>>> MAPC_LPI_OFF ITS command error can be reported to software if LPIs are
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
>>
>> gicv3_enable_lpis() is using writel_relaxed(). So in theory, the write may not be visible before gicv3_its_setup_collection() send the command.
> Agree.
>>
>> So I think we need to add an smp_wmb() to ensure the ordering with a comment explaning why this is necessary.
> 
> Or maybe be we can change the writer_relaxed() to writel() that will also work.
> 
> -    writel_relaxed(val | GICR_CTLR_ENABLE_LPIS, GICD_RDIST_BASE + GICR_CTLR);
> +    writel(val | GICR_CTLR_ENABLE_LPIS, GICD_RDIST_BASE + GICR_CTLR);

writel() guarantees the previous writes are observed before this write. 
But it would not guarantee that the write will be observed before the 
ones after.

Also, after further thoughts, I think this wants to be wmb() 
(system-wide) rather than smp_wmb() (innershearable).

Cheers,

-- 
Julien Grall

