Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D7D304CDB
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 23:58:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75649.136250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4XI5-0003fU-Qg; Tue, 26 Jan 2021 22:58:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75649.136250; Tue, 26 Jan 2021 22:58:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4XI5-0003f8-Nc; Tue, 26 Jan 2021 22:58:29 +0000
Received: by outflank-mailman (input) for mailman id 75649;
 Tue, 26 Jan 2021 22:58:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ePBE=G5=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l4XI3-0003f3-GB
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 22:58:27 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0b797e51-c1f1-4798-af58-37fe74414c81;
 Tue, 26 Jan 2021 22:58:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B8AED2065C;
 Tue, 26 Jan 2021 22:58:25 +0000 (UTC)
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
X-Inumbo-ID: 0b797e51-c1f1-4798-af58-37fe74414c81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611701906;
	bh=lBmGHUiflFRUC0V9kp0medYQqqnmF0fLgCVG0sitVCw=;
	h=Date:From:To:cc:Subject:From;
	b=AU+m6eXF0wIx5iS1TzqHOTBJkLC3adN7F2xAj8rFgW8NQKCXPVyoOfgBRu+Ib9sUt
	 OkFIH2mZnExTaxsd7kBfXRNNItLlGjfei+Zrkjyds4MC4bmTINaTit5/zxuEpiFrDM
	 rewN5kGSZOUurlnm8zxG5DHschlS7Xp9SnZdl4cujPrxNT2YXIFeudY5OUEK39Xlvw
	 jJQwXgZZwYr+/XA/mNgPEv+Fwv69gB9sB5VCibWUAN0pv8yyu9ZBMdsjygHKuvs5en
	 rbGeFVxc2OboeVeaIaGO0Lw5T+vnzY7oDwGegH1r4lh6F5Wkkxd0lO0sdbvDl5qJMA
	 bfvuHOkOiX1Mw==
Date: Tue, 26 Jan 2021 14:58:25 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: xen-devel <xen-devel@lists.xenproject.org>
cc: sstabellini@kernel.org, julien@xen.org, Bertrand.Marquis@arm.com, 
    Volodymyr_Babchuk@epam.com, rahul.singh@arm.com, brian.woods@xilinx.com
Subject: [PATCH v3 0/3] Generic SMMU Bindings
Message-ID: <alpine.DEB.2.21.2101261435550.2568@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

This series introduces support for the generic SMMU bindings to
xen/drivers/passthrough/arm/smmu.c.

The last version of the series was
https://marc.info/?l=xen-devel&m=159539053406643

I realize that it is late for 4.15 -- I think it is OK if this series
goes in afterwards.

Cheers,

Stefano


Brian Woods (3):
      arm,smmu: switch to using iommu_fwspec functions
      arm,smmu: restructure code in preparation to new bindings support
      arm,smmu: add support for generic DT bindings. Implement add_device and dt_xlate.

 xen/drivers/passthrough/arm/smmu.c    | 162 ++++++++++++++++++++++++----------
 xen/drivers/passthrough/device_tree.c |  24 ++---
 2 files changed, 123 insertions(+), 63 deletions(-)

