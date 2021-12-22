Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE40A47D2FA
	for <lists+xen-devel@lfdr.de>; Wed, 22 Dec 2021 14:19:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250825.431979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n01Wb-0006k9-JE; Wed, 22 Dec 2021 13:19:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250825.431979; Wed, 22 Dec 2021 13:19:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n01Wb-0006hQ-Fg; Wed, 22 Dec 2021 13:19:21 +0000
Received: by outflank-mailman (input) for mailman id 250825;
 Wed, 22 Dec 2021 13:19:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KCiG=RH=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1n01WZ-0006hK-QV
 for xen-devel@lists.xenproject.org; Wed, 22 Dec 2021 13:19:19 +0000
Received: from pb-smtp1.pobox.com (pb-smtp1.pobox.com [64.147.108.70])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c29f5a65-6329-11ec-bb0b-79c175774b5d;
 Wed, 22 Dec 2021 14:19:17 +0100 (CET)
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id DFB2210B1C0;
 Wed, 22 Dec 2021 08:19:14 -0500 (EST)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id D5BE010B1BF;
 Wed, 22 Dec 2021 08:19:14 -0500 (EST)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [95.67.114.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 489DF10B1BE;
 Wed, 22 Dec 2021 08:19:14 -0500 (EST)
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
X-Inumbo-ID: c29f5a65-6329-11ec-bb0b-79c175774b5d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=2N/aoPMv6tJ0Gk304J71excBq0TQU6oYj6jMq22Vl1o=; b=XkfF
	bM6GyT1G+bKeVjjCMIZz2RjKZghalr81Pi2DQ2zx5P+CHJDst5jW+EOR7ONv44FR
	u0nnlAbIGmSvKvPodueIekaEUFz4mxJCwi64D0lukxsF6335IfPEWSULDqtG49Zn
	IMPF2pK5Nl6i/KDuF+5XzgK3oBvAdXaKDFa5hn0=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Roman Skakun <rm.skakun@gmail.com>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrii Anisov <Andrii_Anisov@epam.com>
Subject: [RFC v2] tag IOMMU-protected devices in dom0 fdt
Date: Wed, 22 Dec 2021 13:18:45 +0000
Message-Id: <20211222131847.2476835-1-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Pobox-Relay-ID:
 C21D4B1E-6329-11EC-8A36-5E84C8D8090B-90055647!pb-smtp1.pobox.com
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
  xen/arm: introduce dummy iommu node for dom0
  arm/xen: don't use xen DMA ops when the device is protected

Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>
Cc: Roman Skakun <rm.skakun@gmail.com>
Cc: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Andrii Anisov <Andrii_Anisov@epam.com>
--=20
2.25.1


