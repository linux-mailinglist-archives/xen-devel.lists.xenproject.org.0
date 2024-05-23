Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7B78CDBE9
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 23:24:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728864.1133915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAFuo-0005Dh-GG; Thu, 23 May 2024 21:23:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728864.1133915; Thu, 23 May 2024 21:23:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAFuo-0005CB-DV; Thu, 23 May 2024 21:23:58 +0000
Received: by outflank-mailman (input) for mailman id 728864;
 Thu, 23 May 2024 21:23:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sAFun-0005C5-8k
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 21:23:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sAFun-0006VZ-0W; Thu, 23 May 2024 21:23:57 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sAFum-0004JX-Q2; Thu, 23 May 2024 21:23:56 +0000
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
	bh=N6kjwu2fTaT6KkSOu1pbvEUSSozPo48Ld5dSPHla/Tw=; b=wKs6pIxCJsQXouhcBlVuzZlwWL
	7JjYKSFpmUXxLRel54Em2PK2Jty+rkQMXD2lEDGnac40QVAaLbrK124yHSX0fi8DFx791pF9N39Bx
	fbt4Et7+JK8wzSiwGFMkIBIAc3XC3N8nYjG9yyDnGvoaUhPO7O1psN3l2nvk7BhsRs2E=;
Message-ID: <55b10b42-44ae-473e-8b85-95e9f8e03413@xen.org>
Date: Thu, 23 May 2024 22:23:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/9] xen/arm, doc: Add a DT property to specify IOMMU
 for Dom0less domUs
Content-Language: en-GB
To: Henry Wang <xin.wang2@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240523074040.1611264-1-xin.wang2@amd.com>
 <20240523074040.1611264-3-xin.wang2@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240523074040.1611264-3-xin.wang2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 23/05/2024 08:40, Henry Wang wrote:
> There are some use cases in which the dom0less domUs need to have
> the XEN_DOMCTL_CDF_iommu set at the domain construction time. For
> example, the dynamic dtbo feature allows the domain to be assigned
> a device that is behind the IOMMU at runtime. For these use cases,
> we need to have a way to specify the domain will need the IOMMU
> mapping at domain construction time.
> 
> Introduce a "passthrough" DT property for Dom0less DomUs following
> the same entry as the xl.cfg. Currently only provide two options,
> i.e. "enable" and "disable". Set the XEN_DOMCTL_CDF_iommu at domain
> construction time based on the property.
> 
> Signed-off-by: Henry Wang <xin.wang2@amd.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

