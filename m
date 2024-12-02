Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BB69E0C7A
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2024 20:45:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847001.1262154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tICLW-0002Hn-IQ; Mon, 02 Dec 2024 19:44:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847001.1262154; Mon, 02 Dec 2024 19:44:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tICLW-0002AI-Cv; Mon, 02 Dec 2024 19:44:38 +0000
Received: by outflank-mailman (input) for mailman id 847001;
 Mon, 02 Dec 2024 19:41:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yaPF=S3=ti.com=afd@srs-se1.protection.inumbo.net>)
 id 1tICIo-0001je-9F
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2024 19:41:50 +0000
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71e3929b-b0e5-11ef-99a3-01e77a169b0f;
 Mon, 02 Dec 2024 20:41:39 +0100 (CET)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B2Jf9lX1777088
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 2 Dec 2024 13:41:09 -0600
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B2Jf9o8073856;
 Mon, 2 Dec 2024 13:41:09 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 2
 Dec 2024 13:41:09 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 2 Dec 2024 13:41:09 -0600
Received: from fllvsmtp7.itg.ti.com ([10.249.42.149])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B2Jf8iL127393;
 Mon, 2 Dec 2024 13:41:08 -0600
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
X-Inumbo-ID: 71e3929b-b0e5-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733168469;
	bh=pn8eSTUe12a9qvKo+zKnPKpjS9szyd/Lpr/Ci+nt4Fc=;
	h=From:To:CC:Subject:Date;
	b=rGZ2UQZlyTutS9HlG7KOnvww9jInzBxpmHEhaqzOPWlCIo3EAJfyjlgGd5KQwoQ4g
	 LvdH5tRnJFnnWrKFeFrDXyCSSAKwp3jVeP2lzpptJecgucUqfZrT4wQimmYZMZyJcn
	 VxOBnZWy3IoAosbhUb9IZwQBIjSeZ6jb3Hn2a6zM=
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
Subject: [PATCH v4 0/5] Switch more ARM plats to sys-off handler API
Date: Mon, 2 Dec 2024 13:41:02 -0600
Message-ID: <20241202194107.105119-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hello all,

Continuing the quest to remove the legacy pm_power_off() global
function handler. Remove uses from arch/arm/ using the helper
register_platform_power_off().

Thanks,
Andrew

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


