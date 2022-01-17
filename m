Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FEC4908E7
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jan 2022 13:43:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258169.444308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9RM1-0007GC-Pk; Mon, 17 Jan 2022 12:43:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258169.444308; Mon, 17 Jan 2022 12:43:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9RM1-0007EF-MU; Mon, 17 Jan 2022 12:43:21 +0000
Received: by outflank-mailman (input) for mailman id 258169;
 Mon, 17 Jan 2022 12:43:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6dQ8=SB=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1n9RM0-0007E3-7j
 for xen-devel@lists.xenproject.org; Mon, 17 Jan 2022 12:43:20 +0000
Received: from pb-smtp2.pobox.com (pb-smtp2.pobox.com [64.147.108.71])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ac64bae-7793-11ec-9bbc-9dff3e4ee8c5;
 Mon, 17 Jan 2022 13:43:18 +0100 (CET)
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 2F8F4F22D7;
 Mon, 17 Jan 2022 07:43:16 -0500 (EST)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 149B2F22D3;
 Mon, 17 Jan 2022 07:43:16 -0500 (EST)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [95.67.114.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp2.pobox.com (Postfix) with ESMTPSA id 52D28F22D1;
 Mon, 17 Jan 2022 07:43:15 -0500 (EST)
 (envelope-from sakib@darkstar.site)
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
X-Inumbo-ID: 0ac64bae-7793-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=ehAvKLKV+FFZbbA6yJlt6Yxc1t4t8lw2qAF4cfwf4NQ=; b=jWNU
	smbIZto7i4w0s9wqxj4MKJCGARE7D0Rmq42K/mZotq+bib0nPvXjf/JYty2ttsOm
	lLkiJnHXtDrGXZARa/m4DurYNJfJpU6Bu1MkGQPFgzeeNVCRMETSoEDLKv3PwuHf
	fCH+pAxAgAzHI4v09+f+NqaLP9IqKONS1Ky9NDQ=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/2] Avoid using Xen DMA ops when the device is protected by an IOMMU
Date: Mon, 17 Jan 2022 12:32:49 +0000
Message-Id: <20220117123251.140867-1-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Pobox-Relay-ID:
 0A04508A-7793-11EC-BB29-CB998F0A682E-90055647!pb-smtp2.pobox.com
Content-Transfer-Encoding: quoted-printable

At the moment, dom0 can't distinguish which devices are protected by
IOMMU and which are not. In some cases, this can cause swiotlb bounce
buffer use for DMA addresses above 32 bits, which in turn can lead
to poor performance.

Previous discussions at [1,2] agreed upon passing info about IOMMU via
device tree. This series does that in a way consistent with existing iomm=
u bindings.

[1] https://lore.kernel.org/all/1392913234-25429-1-git-send-email-julien.=
grall__16109.9684810781$1392913341$gmane$org@linaro.org/
[2] https://lore.kernel.org/all/cover.1633106362.git.roman_skakun@epam.co=
m/

Sergiy Kibrik (2):
  dt-bindings: arm: xen: document Xen iommu device
  arm/xen: don't use xen DMA ops when the device is protected by an
    IOMMU

 Documentation/devicetree/bindings/arm/xen.txt | 26 +++++++++++++++++++
 arch/arm/mm/dma-mapping.c                     |  2 +-
 arch/arm/xen/enlighten.c                      |  9 +++++++
 arch/arm64/mm/dma-mapping.c                   |  2 +-
 include/xen/swiotlb-xen.h                     |  1 +
 5 files changed, 38 insertions(+), 2 deletions(-)

Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>
Cc: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org

--=20
2.25.1


