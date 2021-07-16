Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3C03CBFE9
	for <lists+xen-devel@lfdr.de>; Sat, 17 Jul 2021 01:59:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.157769.290600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4XjY-0004xi-Kf; Fri, 16 Jul 2021 23:59:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 157769.290600; Fri, 16 Jul 2021 23:59:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4XjY-0004vq-Hh; Fri, 16 Jul 2021 23:59:08 +0000
Received: by outflank-mailman (input) for mailman id 157769;
 Fri, 16 Jul 2021 23:59:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kgq4=MI=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1m4XjX-0004vk-1U
 for xen-devel@lists.xenproject.org; Fri, 16 Jul 2021 23:59:07 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 52b822e0-135b-40e2-a27a-66058eb6836f;
 Fri, 16 Jul 2021 23:59:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9DD036128A;
 Fri, 16 Jul 2021 23:59:05 +0000 (UTC)
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
X-Inumbo-ID: 52b822e0-135b-40e2-a27a-66058eb6836f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626479945;
	bh=cWboYh9tKqa+rfk5b7l/2mNBPoHKJOk6KCnacxMThk4=;
	h=Date:From:To:cc:Subject:From;
	b=c3CE9SkR8UoFe1KfQuRDVLDHHSUj2aoxvfs6IHMlB/M0taTJ0FVSpJcoH/6CKKq4O
	 uCuIop45E4azIHbLGW++wtZSzPVE1LX6zJiIQ+0foVpR99NaPUWSbNpP6QgIv/0yOG
	 0JR59jp0e6DZMjR1r95Ocf1R2LWpiRQiWO85gbAaFQrTr2wNt/ygTYmkIN/Eywr5P+
	 QIHOxJ0vxeI9xEREjTCR7bo4n+tMLLb2JMzMowODoXGhTR8hasCmQ+xWJgBRok9QUZ
	 G1q/Wlz2x3J0UT7FJ5yKLI1uSam3MAbSqzcWzoqLoKikoYppVXrCQBNtsTVBueK1QU
	 +xlBBifAVEtzQ==
Date: Fri, 16 Jul 2021 16:59:05 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, julien@xen.org, Bertrand.Marquis@arm.com, 
    Volodymyr_Babchuk@epam.com, rahul.singh@arm.com, brian.woods@xilinx.com
Subject: [PATCH v4 0/3] Generic SMMU Bindings
Message-ID: <alpine.DEB.2.21.2107161657300.3916@sstabellini-ThinkPad-T480s>
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

 xen/drivers/passthrough/arm/smmu.c    | 141 +++++++++++++++++++++++++---------
 xen/drivers/passthrough/device_tree.c |  23 ++----
 2 files changed, 112 insertions(+), 52 deletions(-)

