Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27ABA94101B
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 13:00:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767589.1178264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYka0-000188-Kz; Tue, 30 Jul 2024 10:59:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767589.1178264; Tue, 30 Jul 2024 10:59:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYka0-00016B-IM; Tue, 30 Jul 2024 10:59:44 +0000
Received: by outflank-mailman (input) for mailman id 767589;
 Tue, 30 Jul 2024 10:59:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BAGm=O6=ti.com=a-singh21@srs-se1.protection.inumbo.net>)
 id 1sYkZy-000162-Qf
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 10:59:43 +0000
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0cc17d0-4e62-11ef-bc01-fd08da9f4363;
 Tue, 30 Jul 2024 12:59:40 +0200 (CEST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46UAxNdt007163;
 Tue, 30 Jul 2024 05:59:23 -0500
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46UAxN3S122728
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 30 Jul 2024 05:59:23 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 30
 Jul 2024 05:59:23 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 30 Jul 2024 05:59:23 -0500
Received: from localhost (nightbug.dhcp.ti.com [10.24.68.118])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46UAxMmB042060;
 Tue, 30 Jul 2024 05:59:23 -0500
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
X-Inumbo-ID: d0cc17d0-4e62-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722337163;
	bh=S4TKs36zuyYQhQC2wNo65S9DbOgKoxAMU4qhwPg6ZC0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=DRGoe7jKXTG+0vpSFv46vZ0XAtzs/e8IZ4vj7YQ8NCMFawEj8PxHEu4BOVegSmwnI
	 RJQnJI8asevu6QgxWmHceCp1RQ5p9oDKhYLEYqE0YSitIEwfIXd4ltf4I1cm5EkoyN
	 0/orT05a8NzXl1mFbCCRAVdn6lIJ9aiWG0Y6YkxI=
From: Amneesh Singh <a-singh21@ti.com>
To: <sstabellini@kernel.org>
CC: <boris.ostrovsky@oracle.com>, <hch@infradead.org>,
        <iommu@lists.linux-foundation.org>, <jasowang@redhat.com>,
        <jgross@suse.com>, <konrad.wilk@oracle.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-imx@nxp.com>,
        <linux-kernel@vger.kernel.org>, <mst@redhat.com>, <peng.fan@nxp.com>,
        <virtualization@lists.linux-foundation.org>, <x86@kernel.org>,
        <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen: introduce xen_vring_use_dma
Date: Tue, 30 Jul 2024 16:29:10 +0530
Message-ID: <20240730105910.443753-1-a-singh21@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <alpine.DEB.2.21.2007151001140.4124@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2007151001140.4124@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hi Stefano,

First off, apologies for bumping this dead thread.

I came across this patch signed off by you recently
https://github.com/Xilinx/linux-xlnx/commit/72cb5514953be3aa2ac00c57c9eaa100ecc67176

and was wondering if a patch replacing xen_domain() with xen_pv_domain() in
vring_use_dma_api() can be sent upstream? If not, is there a reason why?

Regards
Amneesh

