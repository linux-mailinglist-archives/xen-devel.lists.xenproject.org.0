Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 422D63DE37F
	for <lists+xen-devel@lfdr.de>; Tue,  3 Aug 2021 02:24:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163204.299012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAiDy-0000va-GQ; Tue, 03 Aug 2021 00:24:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163204.299012; Tue, 03 Aug 2021 00:24:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAiDy-0000tX-DE; Tue, 03 Aug 2021 00:24:02 +0000
Received: by outflank-mailman (input) for mailman id 163204;
 Tue, 03 Aug 2021 00:24:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GulG=M2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mAiDw-0000tR-Pu
 for xen-devel@lists.xenproject.org; Tue, 03 Aug 2021 00:24:00 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 18fb132e-f3f1-11eb-9a7d-12813bfff9fa;
 Tue, 03 Aug 2021 00:24:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1E48860EB5;
 Tue,  3 Aug 2021 00:23:59 +0000 (UTC)
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
X-Inumbo-ID: 18fb132e-f3f1-11eb-9a7d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1627950239;
	bh=E6zENBRmB4zx1eVjbhrxX8BIHkVGgXu9tBHnCDzCieM=;
	h=Date:From:To:cc:Subject:From;
	b=hx9BErdNCXDqFcaDghqIFTAs9NcnYODyJROU9pgXqDB9GX+BA96gBnSpU6Dqww1+R
	 vfBoiPxtngnVwwhQpkwb5EsXFIyybyc7T2RQK8VzOiNt0mV3DVdoOXaqv4iKPivpDk
	 mERJ+Xtr9zMCO41p8ESX/daqdJJIPW69CERjJyxHExCCznrV5rlVjhaXM9jJocFSFe
	 JrfBLXTLDL05HORjnGX9yqRT6Fijtlb255M1xoAsIsVzRcuco72dBETexAzxDSpcWi
	 ir06tBL6VO14fAFfcT5bcvgfofTQ/r+ozT2OhTL8yB8pnPyxs1udS8Eeb3uFtK2/eo
	 mdiOEn5hg5KKA==
Date: Mon, 2 Aug 2021 17:23:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, julien@xen.org, Bertrand.Marquis@arm.com, 
    Volodymyr_Babchuk@epam.com, rahul.singh@arm.com, brian.woods@xilinx.com
Subject: [PATCH v6 0/4] Generic SMMU Bindings
Message-ID: <alpine.DEB.2.21.2108021720560.10122@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

This series introduces support for the generic SMMU bindings to
xen/drivers/passthrough/arm/smmu.c.

Cheers,

Stefano

Brian Woods (3):
      arm,smmu: switch to using iommu_fwspec functions
      arm,smmu: restructure code in preparation to new bindings support
      arm,smmu: add support for generic DT bindings. Implement add_device and dt_xlate.

Stefano Stabellini (1):
      xen: do not return -EEXIST if iommu_add_dt_device is called twice

 xen/drivers/passthrough/arm/smmu.c    | 141 +++++++++++++++++++++++++---------
 xen/drivers/passthrough/device_tree.c |  30 ++------
 2 files changed, 113 insertions(+), 58 deletions(-)

