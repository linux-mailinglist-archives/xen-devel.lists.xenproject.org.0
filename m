Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 828414A4E85
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 19:37:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263262.455921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEbXk-0003dR-GH; Mon, 31 Jan 2022 18:36:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263262.455921; Mon, 31 Jan 2022 18:36:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEbXk-0003aW-CF; Mon, 31 Jan 2022 18:36:48 +0000
Received: by outflank-mailman (input) for mailman id 263262;
 Mon, 31 Jan 2022 18:36:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nEbXi-0003aP-JA
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 18:36:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nEbXi-0000pJ-1o; Mon, 31 Jan 2022 18:36:46 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235] helo=[10.95.141.2])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nEbXh-0007Pb-RH; Mon, 31 Jan 2022 18:36:45 +0000
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
	bh=QjCVKS1tg4XSc2Ett6Q/OKtq9W1Rcan+e+fCTtKKobs=; b=rxL1mwzbmcEHVcc75FZTgEP8a8
	+Dn0hiMKE4U/ilqC3C3ezpo8rIT4vheH0s3E4ITAzCYfCre8bTqAVaLEgTchU85rHNifu6aRpu0Dh
	P54R6B226AJlouN0k0Fx3AgE9pxGoeihmWszre0p8jclBN0UCsUAL/xc/y2DojeO2kPw=;
Message-ID: <c6de95bd-f931-aff0-f7a3-1c9fedb5c395@xen.org>
Date: Mon, 31 Jan 2022 18:36:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH V3 0/2] Add support for Renesas R-Car S4 IPMMU and other
 misc changes (remaining 2 patches)
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
References: <1643313352-29940-1-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1643313352-29940-1-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 27/01/2022 19:55, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Hello all.
> 
> You can find the V1-V2 patch series at [1]-[2].
> 
> The first 8 patches (prereq work + R-Car S4 IPMMU support) have been already committed.
> These are remaining 2 patches which include misc changes.
> 
> [1] https://lore.kernel.org/all/1638035505-16931-1-git-send-email-olekstysh@gmail.com/
> [2] https://lore.kernel.org/all/1640034957-19764-1-git-send-email-olekstysh@gmail.com/
> 
> Oleksandr Tyshchenko (2):
>    iommu/ipmmu-vmsa: Use refcount for the micro-TLBs
>    iommu/arm: Remove code duplication in all IOMMU drivers

I have committed the two patches.

Cheers,

> 
>   xen/drivers/passthrough/arm/iommu.c      |  7 +++++++
>   xen/drivers/passthrough/arm/ipmmu-vmsa.c | 36 ++++++++++++++------------------
>   xen/drivers/passthrough/arm/smmu-v3.c    | 17 +--------------
>   xen/drivers/passthrough/arm/smmu.c       | 17 +--------------
>   4 files changed, 25 insertions(+), 52 deletions(-)
> 

-- 
Julien Grall

