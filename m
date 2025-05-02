Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD300AA70C6
	for <lists+xen-devel@lfdr.de>; Fri,  2 May 2025 13:41:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.974587.1362402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAolH-0004G6-Jm; Fri, 02 May 2025 11:40:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 974587.1362402; Fri, 02 May 2025 11:40:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAolH-0004Dm-EH; Fri, 02 May 2025 11:40:59 +0000
Received: by outflank-mailman (input) for mailman id 974587;
 Fri, 02 May 2025 11:40:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uekI=XS=actia.se=john.ernberg@srs-se1.protection.inumbo.net>)
 id 1uAolG-0004Db-Co
 for xen-devel@lists.xenproject.org; Fri, 02 May 2025 11:40:58 +0000
Received: from mail.actia.se (mail.actia.se [212.181.117.226])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f9583e3-274a-11f0-9eb4-5ba50f476ded;
 Fri, 02 May 2025 13:40:56 +0200 (CEST)
Received: from S036ANL.actianordic.se (10.12.31.117) by S035ANL.actianordic.se
 (10.12.31.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 2 May
 2025 13:40:55 +0200
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%3]) with mapi id
 15.01.2507.039; Fri, 2 May 2025 13:40:55 +0200
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
X-Inumbo-ID: 4f9583e3-274a-11f0-9eb4-5ba50f476ded
From: John Ernberg <john.ernberg@actia.se>
To: Juergen Gross <jgross@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Andrew Morton <akpm@linux-foundation.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>, John Ernberg
	<john.ernberg@actia.se>
Subject: [PATCH 0/2] xen: swiotlb: 2 fixes SoCs w/o IOMMU (e.g. iMX8QXP)
Thread-Topic: [PATCH 0/2] xen: swiotlb: 2 fixes SoCs w/o IOMMU (e.g. iMX8QXP)
Thread-Index: AQHbu1cQRZF4GUbfuk+26xI8NrrtUw==
Date: Fri, 2 May 2025 11:40:55 +0000
Message-ID: <20250502114043.1968976-1-john.ernberg@actia.se>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.49.0
x-originating-ip: [10.12.12.35]
x-esetresult: clean, is OK
x-esetid: 37303A2956B14453667460
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0

There's 2 problems with DMA today when running Xen on the iMX8QXP SoC.

The first identifies as a USB corruption, but is actually a memory
corruption risk with any small DMA transfer, and just manifests itself
in USB transfers.

This is a regression fix tracing back to Linux 6.5 when the blamed commit
(patch series) landed.

The second one causes any attempt to use DMA via the iMX8QXP eDMA v3 block
to fail with DMA_MAPPING_ERROR when running under Xen because this DMA
controller wants to do DMA in MMIO space.

I'm a little bit more on the fence with the second one, as that never
worked, but is still fixing an issue. There is no Fixes or Cc stable on
this one because of this.

John Ernberg (2):
  xen: swiotlb: Use swiotlb bouncing if kmalloc allocation demands it
  xen: swiotlb: Implement map_resource callback

 drivers/xen/swiotlb-xen.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

--=20
2.49.0

