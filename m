Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7B537B6D7
	for <lists+xen-devel@lfdr.de>; Wed, 12 May 2021 09:27:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126153.237486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgjGc-00062M-4u; Wed, 12 May 2021 07:26:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126153.237486; Wed, 12 May 2021 07:26:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgjGc-0005zW-1D; Wed, 12 May 2021 07:26:50 +0000
Received: by outflank-mailman (input) for mailman id 126153;
 Wed, 12 May 2021 07:26:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6NHd=KH=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1lgjGb-0005zQ-CT
 for xen-devel@lists.xenproject.org; Wed, 12 May 2021 07:26:49 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 618a88ed-57e8-4ba7-a9af-ca60e4609b20;
 Wed, 12 May 2021 07:26:48 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 90F4A67373; Wed, 12 May 2021 09:26:45 +0200 (CEST)
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
X-Inumbo-ID: 618a88ed-57e8-4ba7-a9af-ca60e4609b20
Date: Wed, 12 May 2021 09:26:45 +0200
From: Christoph Hellwig <hch@lst.de>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, hch@lst.de,
	linux-kernel@vger.kernel.org,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	boris.ostrovsky@oracle.com, jgross@suse.com,
	catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] xen/arm64: do not set SWIOTLB_NO_FORCE when
 swiotlb is required
Message-ID: <20210512072645.GA22396@lst.de>
References: <20210511174142.12742-1-sstabellini@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210511174142.12742-1-sstabellini@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

> -int xen_swiotlb_detect(void)
> -{
> -	if (!xen_domain())
> -		return 0;
> -	if (xen_feature(XENFEAT_direct_mapped))
> -		return 1;
> -	/* legacy case */
> -	if (!xen_feature(XENFEAT_not_direct_mapped) && xen_initial_domain())
> -		return 1;
> -	return 0;
> -}

I think this move should be a separate prep patch.

