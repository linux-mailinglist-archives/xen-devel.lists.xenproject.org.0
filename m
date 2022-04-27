Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BBF511CBC
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 20:00:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315362.533882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njlx5-0006Sx-MZ; Wed, 27 Apr 2022 17:59:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315362.533882; Wed, 27 Apr 2022 17:59:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njlx5-0006Pz-JL; Wed, 27 Apr 2022 17:59:47 +0000
Received: by outflank-mailman (input) for mailman id 315362;
 Wed, 27 Apr 2022 17:59:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1njlx4-0006Pt-FU
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 17:59:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1njlx4-0003V8-2l; Wed, 27 Apr 2022 17:59:46 +0000
Received: from [54.239.6.186] (helo=[192.168.24.58])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1njlx3-0003HO-TG; Wed, 27 Apr 2022 17:59:46 +0000
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
	bh=zpowA/N27QqR0UQ34YRsqGoaNmzeDHr8vK0TiteJl4I=; b=p9I982PpARNn3KUvi1AlR3JwVo
	uEfCkQysR8rO23BqzyRg3x5ALYEDtwcwxXc5B/f/FZyHHIzx8kSEFBsj4NC2sqekjMvJzPXs2CChB
	sYBzdvFCrpWE2mZfh3BATuKovuzQmE9HdNKHmDVd8ul1VHlcMVkd6hB+g1NxRRCtHj7E=;
Message-ID: <a2bba079-0a26-8648-6f39-93148dbd5107@xen.org>
Date: Wed, 27 Apr 2022 18:59:44 +0100
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

Looking at the spec (ARM IHI 0069H), I can't find a command error named 
MAPC_LPI_OFF. Is it something specific to your HW?

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
>           ret = gicv3_its_setup_collection(smp_processor_id());
>           if ( ret )
>               return ret;
> -        if ( !gicv3_enable_lpis() )
> -            return -EBUSY;

AFAICT, Linux is using the same ordering as your are proposing. It seems 
to have been introduced from the start, so it is not clear why we chose 
this approach.

However, given this works on some HW, can you clarify whether this is 
mandated by the spec or this is a bug in your HW?

Cheers,

-- 
Julien Grall

