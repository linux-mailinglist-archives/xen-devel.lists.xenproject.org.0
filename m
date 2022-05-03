Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D089518938
	for <lists+xen-devel@lfdr.de>; Tue,  3 May 2022 17:58:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319757.540127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nluus-0000Kk-Sv; Tue, 03 May 2022 15:58:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319757.540127; Tue, 03 May 2022 15:58:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nluus-0000IT-Pu; Tue, 03 May 2022 15:58:22 +0000
Received: by outflank-mailman (input) for mailman id 319757;
 Tue, 03 May 2022 15:58:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nluur-0000IK-Fe
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 15:58:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nluur-0006F8-0S; Tue, 03 May 2022 15:58:21 +0000
Received: from [54.239.6.185] (helo=[192.168.2.157])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nluuq-0001dV-R7; Tue, 03 May 2022 15:58:20 +0000
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
	bh=s7eq2YAZ2vkZbMLKz3s/AzmFRex9ztoOqdyNyEaAaX8=; b=1YzDPQCchP9KTR4O9pTtSCtN/l
	mKACTZQVXS0JLK/JQX1UMyAwZL2aPZMNePBbNs83jbsl7ulU0NsmZcu37hmLPnEGxDrL46UmHKaIz
	xkX+jFQHBg+DmIsi0qO95M4egFQUusz8WXoE0wE/nqJFZfxzHPgZuuI5DqXV19DjfeO4=;
Message-ID: <ea7e891a-6e4c-50e2-dc3f-82f373640784@xen.org>
Date: Tue, 3 May 2022 16:58:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [PATCH] arm/its: enable LPIs before mapping the collection table
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <7762e8e35be1f99f2a7ca81aa8cf8fc502030e7b.1651075773.git.rahul.singh@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <7762e8e35be1f99f2a7ca81aa8cf8fc502030e7b.1651075773.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Rahul,

On 27/04/2022 17:14, Rahul Singh wrote:
> MAPC_LPI_OFF ITS command error can be reported to software if LPIs are
> not enabled before mapping the collection table using MAPC command.
> 
> Enable the LPIs using GICR_CTLR.EnableLPIs before mapping the collection
> table.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
>   xen/arch/arm/gic-v3.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index 3c472ed768..8fb0014b16 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -812,11 +812,11 @@ static int gicv3_cpu_init(void)
>       /* If the host has any ITSes, enable LPIs now. */
>       if ( gicv3_its_host_has_its() )
>       {
> +        if ( !gicv3_enable_lpis() )
> +            return -EBUSY;

gicv3_enable_lpis() is using writel_relaxed(). So in theory, the write 
may not be visible before gicv3_its_setup_collection() send the command.

So I think we need to add an smp_wmb() to ensure the ordering with a 
comment explaning why this is necessary.

Cheers,

-- 
Julien Grall

