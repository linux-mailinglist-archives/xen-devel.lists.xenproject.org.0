Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D76D4A7EBA5
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 20:57:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.940941.1340587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1rey-00086X-MT; Mon, 07 Apr 2025 18:57:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 940941.1340587; Mon, 07 Apr 2025 18:57:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1rey-000844-Ho; Mon, 07 Apr 2025 18:57:28 +0000
Received: by outflank-mailman (input) for mailman id 940941;
 Mon, 07 Apr 2025 18:57:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D4Wy=WZ=ti.com=afd@srs-se1.protection.inumbo.net>)
 id 1u1rex-0007kd-L7
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 18:57:27 +0000
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22788e3a-13e2-11f0-9ffb-bf95429c2676;
 Mon, 07 Apr 2025 20:57:22 +0200 (CEST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 537Iuq0i454871
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Apr 2025 13:56:52 -0500
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 537Iuq3q011999
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 7 Apr 2025 13:56:52 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 7
 Apr 2025 13:56:52 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 7 Apr 2025 13:56:51 -0500
Received: from fllvsmtp8.itg.ti.com ([10.249.42.149])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 537Iup47094348;
 Mon, 7 Apr 2025 13:56:51 -0500
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
X-Inumbo-ID: 22788e3a-13e2-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744052212;
	bh=ayTupi2WPvTI3Popd5a6clT7WjyIKWAcMrNm4hWyGyk=;
	h=From:To:CC:Subject:Date;
	b=OX+PNp412lCc0vxhnOijlFpYYMx/tJ5YQmkV0cuMqpvpzNsm301qpxGYAg7ILwzps
	 C7Icr+4R8Ys0tWuKfbkxkqtxhSHVRKIYKSFkb3lQypD4CkIvmJkpTvE9FIDR2aukmL
	 r/TAGQJJ4Zj4Qr51qB+A5bOBnCMhBNSeZx1oMeZ0=
From: Andrew Davis <afd@ti.com>
To: Arnd Bergmann <arnd@arndb.de>, Andre Przywara <andre.przywara@arm.com>,
        Russell King <linux@armlinux.org.uk>, Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik
	<robert.jarzmik@free.fr>,
        Alexey Charkov <alchark@gmail.com>,
        Krzysztof
 Kozlowski <krzk@kernel.org>,
        Stefano Stabellini <sstabellini@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <xen-devel@lists.xenproject.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH v5 0/5] Switch more ARM plats to sys-off handler API
Date: Mon, 7 Apr 2025 13:56:45 -0500
Message-ID: <20250407185650.411887-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hello all,

Continuing the quest to remove the legacy pm_power_off() global
function handler. Remove uses from arch/arm/ using the helper
register_platform_power_off().

These have been sent for several cycles without feedback, not
sure if there are anymore active platform maintainers who
can take these individually, maybe these remaining could
go in directly though the arm-soc tree?

Thanks,
Andrew

Changes for v5:
 - Rebase on v6.15-rc1

Changes for v4:
 - Drop already taken patches
 - Rebase on latest master

Changes for v3:
 - Rebase on v6.12-rc1

Changes for v2:
 - Collect Reviewed/Acked-bys
 - Rebase on v6.11-rc1

Andrew Davis (5):
  ARM: highbank: Switch to new sys-off handler API
  ARM: pxa: Switch to new sys-off handler API
  ARM: sa1100: Switch to new sys-off handler API
  ARM: vt8500: Switch to new sys-off handler API
  arm/xen: Switch to new sys-off handler API

 arch/arm/mach-highbank/highbank.c | 2 +-
 arch/arm/mach-pxa/spitz.c         | 2 +-
 arch/arm/mach-sa1100/generic.c    | 2 +-
 arch/arm/mach-vt8500/vt8500.c     | 2 +-
 arch/arm/xen/enlighten.c          | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.39.2


