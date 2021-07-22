Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6A63D24EE
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jul 2021 15:56:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.159758.293782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6ZBb-0008Ob-LJ; Thu, 22 Jul 2021 13:56:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159758.293782; Thu, 22 Jul 2021 13:56:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6ZBb-0008Lf-HQ; Thu, 22 Jul 2021 13:56:27 +0000
Received: by outflank-mailman (input) for mailman id 159758;
 Thu, 22 Jul 2021 13:56:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m6ZBa-0008GP-8i
 for xen-devel@lists.xenproject.org; Thu, 22 Jul 2021 13:56:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m6ZBV-0008M6-D8; Thu, 22 Jul 2021 13:56:21 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m6ZBV-0003Ni-6s; Thu, 22 Jul 2021 13:56:21 +0000
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
	bh=q/d5xyMhvQ+IJFO4x3/BmEipbNSLjCuyrL8bc42tePA=; b=WJTazslFfkXjuHXB9+orQvXf14
	I5i3c8PVrUxvhjHaQFp2rYIvTlH6SaiZ5q+9ikxWXIJULukqb/kYgyuwz3RsBehd2ozguGHL59zmi
	Fquj/kFNw49v2TJlc5Adglql0upmQkJSDMpJtUEGAtPWX+WeqjTHq/cwUEZm3PtaVBQI=;
Subject: Re: [PATCH v4 1/3] arm,smmu: switch to using iommu_fwspec functions
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com,
 rahul.singh@arm.com, brian.woods@xilinx.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <alpine.DEB.2.21.2107161657300.3916@sstabellini-ThinkPad-T480s>
 <20210716235939.9585-1-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
Message-ID: <267ed58b-a63c-3ef4-b244-bab9e2e7f95e@xen.org>
Date: Thu, 22 Jul 2021 14:56:18 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210716235939.9585-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 17/07/2021 00:59, Stefano Stabellini wrote:
> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
> index 999b831d90..911f82a561 100644
> --- a/xen/drivers/passthrough/device_tree.c
> +++ b/xen/drivers/passthrough/device_tree.c
> @@ -140,8 +140,12 @@ int iommu_add_dt_device(struct dt_device_node *np)
>       if ( !ops )
>           return -EINVAL;
>   
> +    /*
> +     * Device already added. It can happen when both iommus and
> +     * mmu-masters are present.
> +     */

This is common code. So I would suggest to write a generic comment to 
avoid any misunderstanding. The one added just after the call in 
iommu_do_domctl() would seem more suitable.

>       if ( dev_iommu_fwspec_get(dev) )
> -        return -EEXIST;
> +        return 0;
There are a few things to mention here:

  1) The change is not explained in the commit message
  2) One of the caller was checking -EEXIST. As you dropped the only 
place where -EEXIST should be returned, can you drop the check in the 
caller?

Ideally this should be in a separate patch because this change is not 
entirely related to this patch.

Cheers,

-- 
Julien Grall

