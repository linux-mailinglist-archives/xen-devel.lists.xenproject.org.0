Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2D9810EC2
	for <lists+xen-devel@lfdr.de>; Wed, 13 Dec 2023 11:46:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653850.1020518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDMks-0005vN-Fj; Wed, 13 Dec 2023 10:46:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653850.1020518; Wed, 13 Dec 2023 10:46:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDMks-0005tB-CE; Wed, 13 Dec 2023 10:46:18 +0000
Received: by outflank-mailman (input) for mailman id 653850;
 Wed, 13 Dec 2023 10:46:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rDMkr-0005sp-1p
 for xen-devel@lists.xenproject.org; Wed, 13 Dec 2023 10:46:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rDMkq-0006sq-Jk; Wed, 13 Dec 2023 10:46:16 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227] helo=[192.168.2.97])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rDMkq-0005fz-Cv; Wed, 13 Dec 2023 10:46:16 +0000
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
	bh=NIKn1KtVJRyUNAQQ+HT5D4kqCv2OjKG5ZHXmVydNmNU=; b=L5GesP4Q7XFvd6KC5OpteW1UMK
	qV1USVSLXiVquHzGXwOextRabuMYlBdhVjfnWnlD+7KdfandEz9aI2wlQBzz6toyy/tSvr2vDXYmp
	dwdOOR/JBG7+xqlFqs6kNrUiypybY5N+ebLDTn5SKhbnuhVqjdv2hbYAbRatb/Q7gXQA=;
Message-ID: <a67c76c6-0fde-438e-9ca8-b6860d03470f@xen.org>
Date: Wed, 13 Dec 2023 10:46:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/9] xen/arm: don't pass iommu properties to hwdom for
 iommu-map
Content-Language: en-GB
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <jgrall@amazon.com>
References: <20231109182716.367119-1-stewart.hildebrand@amd.com>
 <20231109182716.367119-2-stewart.hildebrand@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231109182716.367119-2-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 09/11/2023 18:27, Stewart Hildebrand wrote:
> A device tree node for a PCIe root controller may have an iommu-map property [1]
> with a phandle reference to the SMMU node, but not necessarily an iommus
> property. In this case, we want to treat it the same as we currently handle
> devices with an iommus property: don't pass the iommu related properties to
> hwdom.
> 
> [1] https://www.kernel.org/doc/Documentation/devicetree/bindings/pci/pci-iommu.txt
> 
> Reported-by: Michal Orzel <michal.orzel@amd.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Acked-by: Julien Grall <jgrall@amazon.com>

I was committed this patch. The rest doesn't seem to be reviewed or have 
some dependencies.

Cheers,

-- 
Julien Grall

