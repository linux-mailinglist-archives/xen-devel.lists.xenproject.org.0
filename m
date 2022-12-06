Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC492644DDE
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 22:21:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455567.713071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2fMz-0004QR-3J; Tue, 06 Dec 2022 21:20:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455567.713071; Tue, 06 Dec 2022 21:20:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2fMz-0004OD-03; Tue, 06 Dec 2022 21:20:53 +0000
Received: by outflank-mailman (input) for mailman id 455567;
 Tue, 06 Dec 2022 21:20:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p2fMx-0004O7-Mp
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 21:20:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p2fMx-0002lv-4A; Tue, 06 Dec 2022 21:20:51 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p2fMw-0002Rv-Vk; Tue, 06 Dec 2022 21:20:51 +0000
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
	bh=5EKspq5CNSz1IgXvPO/LH0VWNT/7SkTxw1w6M3GWNzA=; b=7ISxvCH5tItfxGK8/7oovKJiFU
	SdPfeNI0/tdoHROO0fK0gMX+fdBmMTxVAVoPlQtTQZ4ceFukRioMrwnh7eVkShAvdMZlx7mwHTTMU
	kw4kJujnXaQCqVXpyY2P//1fBNHoJQhV0N9MJQoCJ5UFZeO4/kVTxPkH8QuNZz9hDTx4=;
Message-ID: <188e8784-b033-8fba-e7f7-df194cbcff2e@xen.org>
Date: Tue, 6 Dec 2022 21:20:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 10/19] xen/arm: Suspend/resume GIC on system
 suspend/resume
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Mirela Simonovic <mirela.simonovic@aggios.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Saeed Nowshadi <saeed.nowshadi@xilinx.com>
References: <cover.1665137247.git.mykyta_poturai@epam.com>
 <99a4fc0ff6732482152389a0813769fcfbdb379c.1665137247.git.mykyta_poturai@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <99a4fc0ff6732482152389a0813769fcfbdb379c.1665137247.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 07/10/2022 11:32, Mykyta Poturai wrote:
> From: Mirela Simonovic <mirela.simonovic@aggios.com>
> 
> GIC state is saved on system suspend by calling gic_suspend
> (this function does not change current state of the GIC but only
> saves the values of configuration registers).
> The state of GIC has to be restored by calling gic_resume, but only
> if the gic_suspend has succeeded. If gic_suspend fails, we'll just
> restore interrupts configuration and abort suspend.
> 
> Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> ---
>   xen/arch/arm/gic.c     |  4 +---
>   xen/arch/arm/suspend.c | 14 ++++++++++++++
>   2 files changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
> index e9feb1fd3b..ef90664929 100644
> --- a/xen/arch/arm/gic.c
> +++ b/xen/arch/arm/gic.c
> @@ -476,9 +476,7 @@ int gic_suspend(void)
>       if ( !gic_hw_ops->suspend || !gic_hw_ops->resume )
>           return -ENOSYS;
>   
> -    gic_hw_ops->suspend();
> -
> -    return 0;
> +    return gic_hw_ops->suspend();

This should be part of the previous patch.

Cheers,

-- 
Julien Grall

