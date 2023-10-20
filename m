Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0C07D155D
	for <lists+xen-devel@lfdr.de>; Fri, 20 Oct 2023 20:02:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619908.965753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qttpB-0006Ju-VC; Fri, 20 Oct 2023 18:02:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619908.965753; Fri, 20 Oct 2023 18:02:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qttpB-0006HM-Rm; Fri, 20 Oct 2023 18:02:17 +0000
Received: by outflank-mailman (input) for mailman id 619908;
 Fri, 20 Oct 2023 18:02:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qttpB-0006HG-1m
 for xen-devel@lists.xenproject.org; Fri, 20 Oct 2023 18:02:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qttpA-0001dq-Mp; Fri, 20 Oct 2023 18:02:16 +0000
Received: from [54.239.6.188] (helo=[192.168.205.12])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qttpA-000615-Gn; Fri, 20 Oct 2023 18:02:16 +0000
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
	bh=r1/AEQOW3rJpZe7SHZ7WAusrV8f70aqhSl8y5z5pv80=; b=rbf89sMUb4lSGiHEhZPwn90j56
	VakncAkL3hjOg9LgvQAjOZy+193jAs84r5RjzNEOt2A1YuoYyeChca+qfoiVp9K+Se3KqfmQZfMCa
	JkEzOJrGSV0OZAwJKvBVbNoYEg5t2uuoFVPt6ML/osOweLEO0tRadpcrqRs5h8MZ2GCo=;
Message-ID: <7123faae-562e-4e78-a5d2-18c5ccc1b7f6@xen.org>
Date: Fri, 20 Oct 2023 19:02:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 9/9] xen/arm: Map ITS doorbell register to IOMMU page
 tables.
Content-Language: en-GB
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231004145604.1085358-1-stewart.hildebrand@amd.com>
 <20231004145604.1085358-10-stewart.hildebrand@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231004145604.1085358-10-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stewart,

On 04/10/2023 15:55, Stewart Hildebrand wrote:
> From: Rahul Singh <rahul.singh@arm.com>

This wants an explanation why this is needed.

> Signed-off-by: Rahul Singh <rahul.singh@arm.com>

Your signed-off-by is missing.

> ---
> v4->v5:
> * new patch
> ---
>   xen/arch/arm/vgic-v3-its.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/xen/arch/arm/vgic-v3-its.c b/xen/arch/arm/vgic-v3-its.c
> index 05429030b539..df8f045198a3 100644
> --- a/xen/arch/arm/vgic-v3-its.c
> +++ b/xen/arch/arm/vgic-v3-its.c
> @@ -682,6 +682,18 @@ static int its_handle_mapd(struct virt_its *its, uint64_t *cmdptr)
>                                            BIT(size, UL), valid);
>           if ( ret && valid )
>               return ret;
> +
> +        if ( is_iommu_enabled(its->d) ) {

Coding style.

> +            ret = map_mmio_regions(its->d, gaddr_to_gfn(its->doorbell_address),
> +                           PFN_UP(ITS_DOORBELL_OFFSET),
> +                           maddr_to_mfn(its->doorbell_address));


A couple of remarks. Firstly, we know the ITS doorbell at domain 
creation. So I think thish should be called from vgic_v3_its_init_virtual().

Regardless that, any code related to device initialization belongs to 
gicv3_its_map_guest_device().

Lastly, I know the IOMMU page-tables and CPU page-tables are currently 
shared. But strictly speaking, map_mmio_regions() is incorrect because 
the doorbell is only meant to be accessible by the device. So this 
should only be mapped in the IOMMU page-tables.

In fact I vaguely recall that on some platforms you may get a lockup if 
the CPU attempts to write to the doorbell. So we may want to unshare 
page-tables in the future.

For now, we want to use the correct interface (iommu_*) and write down 
the potential security impact (so we remember when exposing a virtual 
ITS to  guests).

> +            if ( ret < 0 )
> +            {
> +                printk(XENLOG_ERR "GICv3: Map ITS translation register d%d failed.\n",
> +                        its->d->domain_id);

XENLOG_ERR is not ratelimited and therefore should not be called from 
emulation path. If you want to print an error, then you should use 
XENLOG_G_ERR.

Also, for printing domain, the preferred is to using %pd with the domain 
as argument (here its->d.

But as this is emulation and therefore the current vCPU belongs to 
its->d, you could directly use gprintk(XENLOG_ERR, "...").

Cheers,

-- 
Julien Grall

