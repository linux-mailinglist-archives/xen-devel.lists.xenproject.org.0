Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC8231D06A
	for <lists+xen-devel@lfdr.de>; Tue, 16 Feb 2021 19:51:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86029.161073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lC5QR-0000zB-3K; Tue, 16 Feb 2021 18:50:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86029.161073; Tue, 16 Feb 2021 18:50:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lC5QQ-0000ym-WE; Tue, 16 Feb 2021 18:50:19 +0000
Received: by outflank-mailman (input) for mailman id 86029;
 Tue, 16 Feb 2021 18:50:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QcaE=HS=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lC5QO-0000yg-VG
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 18:50:16 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 00d293e8-e9a1-46c8-a9fc-75ee1a041f98;
 Tue, 16 Feb 2021 18:50:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1C97064D99;
 Tue, 16 Feb 2021 18:50:15 +0000 (UTC)
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
X-Inumbo-ID: 00d293e8-e9a1-46c8-a9fc-75ee1a041f98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1613501415;
	bh=GgsQbSrSQW88fNbO/wEDbTzgE3oo75sp7dX9OoFQ8ao=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=V/Z95bWkzedD8WdfPR1O7ydPkR5ksfTPYTpFyrGaMCAxEabELRbgAxKvXYQX2BD+E
	 LKMDA86qkwNlRWsczw43atb3hq/78jGnxdcj1GB692B5rdtBW1Dr2Z5GRI+g+CfGum
	 kDYfzi/PRDcPDOtZ0IX9oBMSeN9Bu65bjX+25L8LnPSD49v741YExZu8niJHMo+2Wm
	 7MkYilBELQ8t3wa1YlKKdl+XoB84XA+RnWt63Vxdesu03xrxbxDSLc1Djw4PtVcVu0
	 xWFIj9TYfSyeo1opfNIcD4edhgUnCAvyEQbd5+SjAguTf37SkFEQJySxKeJPQvvwG5
	 xj8pOiD8gJSHA==
Date: Tue, 16 Feb 2021 10:50:14 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Julien Grall <julien@xen.org>, Julien Grall <jgrall@amazon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Rahul Singh <Rahul.Singh@arm.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/iommu: arm: Don't insert an IOMMU mapping when the
 grantee and granter...
In-Reply-To: <3a827099-1d8f-826d-42ef-743d86d9ccce@suse.com>
Message-ID: <alpine.DEB.2.21.2102161049030.3234@sstabellini-ThinkPad-T480s>
References: <20210214143504.23099-1-julien@xen.org> <3a827099-1d8f-826d-42ef-743d86d9ccce@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 15 Feb 2021, Jan Beulich wrote:
> On 14.02.2021 15:35, Julien Grall wrote:
> > From: Julien Grall <jgrall@amazon.com>
> > 
> > ... are the same.
> > 
> > When the IOMMU is enabled and the domain is direct mapped (e.g. Dom0),
> > Xen will insert a 1:1 mapping for each grant mapping in the P2M to
> > allow DMA.
> > 
> > This works quite well when the grantee and granter and not the same
> > because the GFN in the P2M should not be mapped. However, if they are
> > the same, we will overwrite the mapping. Worse, it will be completely
> > removed when the grant is unmapped.
> > 
> > As the domain is direct mapped, a 1:1 mapping should always present in
> > the P2M. This is not 100% guaranteed if the domain decides to mess with
> > the P2M. However, such domain would already end up in trouble as the
> > page would be soon be freed (when the last reference dropped).
> > 
> > Add an additional check in arm_iommu_{,un}map_page() to check whether
> > the page belongs to the domain. If it is belongs to it, then ignore the
> > request.
> 
> Doesn't this want / need solving in grant_table.c itself, as it also
> affects PV on x86? Or alternatively in gnttab_need_iommu_mapping(),
> handing the macro the MFN alongside the domain? No matter which one
> was chosen, it could at the same time avoid the expensive mapkind()
> invocation in this case.

Not knowing the x86 side I don't have an opinion on the best location
for the check. But I wanted to say for the records that the patch has
already been tested successfully and looks good to me.

