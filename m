Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6191CFCA1
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2020 19:52:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYZ4o-0003n1-DO; Tue, 12 May 2020 17:52:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UHzJ=62=dornerworks.com=stewart.hildebrand@srs-us1.protection.inumbo.net>)
 id 1jYZ4m-0003mm-Sz
 for xen-devel@lists.xenproject.org; Tue, 12 May 2020 17:52:20 +0000
X-Inumbo-ID: 516bdeba-9479-11ea-a2ec-12813bfff9fa
Received: from USG02-BN3-obe.outbound.protection.office365.us (unknown
 [23.103.208.43]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 516bdeba-9479-11ea-a2ec-12813bfff9fa;
 Tue, 12 May 2020 17:52:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=bszWCxULPwViyELzgwQ9iWh894VcixMG5LXPWNNeLA0byL6hjInjmnzOei6Ow2xXHZcc8ZzBMGD3BWqcLHZScJUYheeJAXhbSY1e0RTg0rvy4zVJDv7oTdYC0WL1SkxoXGe7pyPKYjtF4PXFJLmys5gqZTNaJXZ36dGpwwBBWCWFaUT8g41xAu+OZTuwjnsHEOTHt661yc7QdsWyTlN/l42p6iRXy09iiIYM418ZwNdxDimA34mvNlInzcDECQOVryHAyGGvhVOtq+Rt/56zTe7Vo4pwRoFef9mwnR5Qn1cwVVL7FDIwNLIXhqN5gX6iINg6EAl9MvHseoReSBPBVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7l8Bmm/K7ceMetHeKL2gL9WtqQocfYzBFc4P4UDSMq0=;
 b=KRsbMeDaeO/TjmC5z7u2CxoWqgwrE3Tg49/JRHWt6w6/jgJUfV44RG4jvkKX0Op1sPJscEWOk/0z1cS0Tso+f9bFgmIyjCsDOuGupQSYojQ1FDIOi/C5AFdFtvDkm2Q3HKMdSEcjSB2T642AnN0kcmKIOrO3cvu1/J8qdY1ow+0VMSCUyqKDDWAi06OvF8g6VGsj4ZB2XGRS6fxBcIBnDXtPcaEVpuQwvfVjy4GJSts+MG/dgAlpMQ/O1T0EW64pG7/n02XmErOH4T/NeKShaRq6IvbvNaKBN66uVAbFI1vdzijuZXmOSL77rEbY1/11HfwUvDygPgJCm9Lq8kND7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 207.242.234.14) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=dornerworks.com; dmarc=none action=none
 header.from=dornerworks.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dornerworkssystem.onmicrosoft.us;
 s=selector1-dornerworkssystem-onmicrosoft-us;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7l8Bmm/K7ceMetHeKL2gL9WtqQocfYzBFc4P4UDSMq0=;
 b=kd5Jk72EF5PayUkVYKeLXAqWQU6/sBOPOWb0TeJIlTwd8jkok8Fd354+hdNOcb0HboSsXLfHgYMC2vGu0FplSci3RtnE8kW9KW5b7yalgSzORROnF/wEBl5gyY2N21qhZlRkYGAjQADlagiJ5/xZMYcsWqCUkOtgbIf4lt4Dy88=
Received: from SN1P110CA0027.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:61::17)
 by BN3P110MB0337.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:409::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.27; Tue, 12 May
 2020 17:52:12 +0000
Received: from CY1USG02FT013.eop-usg02.itar.protection.office365.us
 (2001:489a:2202:d::631) by SN1P110CA0027.office365.us (2001:489a:200:61::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.35 via Frontend
 Transport; Tue, 12 May 2020 17:52:12 +0000
Authentication-Results: spf=fail (sender IP is 207.242.234.14)
 smtp.mailfrom=dornerworks.com; lists.xenproject.org; dkim=none (message not
 signed) header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=dornerworks.com;
Received-SPF: Fail (protection.outlook.com: domain of dornerworks.com does not
 designate 207.242.234.14 as permitted sender)
 receiver=protection.outlook.com; client-ip=207.242.234.14;
 helo=ubuntu.localdomain;
Received: from ubuntu.localdomain (207.242.234.14) by
 CY1USG02FT013.mail.protection.office365.us (10.97.26.98) with Microsoft SMTP
 Server id 15.20.2979.30 via Frontend Transport; Tue, 12 May 2020 17:52:11
 +0000
From: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
To: xen-devel@lists.xenproject.org
Subject: [XEN PATCH 1/2] xen/build: fixup path to merge_config.sh
Date: Tue, 12 May 2020 13:52:05 -0400
Message-Id: <20200512175206.20314-2-stewart.hildebrand@dornerworks.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512175206.20314-1-stewart.hildebrand@dornerworks.com>
References: <20200512175206.20314-1-stewart.hildebrand@dornerworks.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-spam-status: No, score=-2.9 required=3.5 tests=ALL_TRUSTED, BAYES_00,
 MAILSHELL_SCORE_0_4
X-Spam-Flag: NO
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:207.242.234.14; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:ubuntu.localdomain; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(346002)(46966005)(33430700001)(8936002)(6666004)(2616005)(956004)(44832011)(86362001)(4326008)(2906002)(26005)(186003)(70206006)(70586007)(4744005)(508600001)(336012)(54906003)(8676002)(6916009)(81166007)(36756003)(47076004)(33440700001)(33310700002)(5660300002)(82310400002)(1076003);
 DIR:OUT; SFP:1101; 
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f1846d1-cba3-4d37-cb13-08d7f69d3345
X-MS-TrafficTypeDiagnostic: BN3P110MB0337:
X-Microsoft-Antispam-PRVS: <BN3P110MB033704ED41645EF72F1DFBEE8CBE0@BN3P110MB0337.NAMP110.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-Forefront-PRVS: 0401647B7F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-OriginatorOrg: dornerworks.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2020 17:52:11.4398 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f1846d1-cba3-4d37-cb13-08d7f69d3345
X-MS-Exchange-CrossTenant-Id: 097cf9aa-db69-4b12-aeab-ab5f513dbff9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=097cf9aa-db69-4b12-aeab-ab5f513dbff9; Ip=[207.242.234.14];
 Helo=[ubuntu.localdomain]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3P110MB0337
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Doug Goldstein <cardoe@cardoe.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This resolves the following observed error:

/bin/sh: /path/to/xen/xen/../xen/scripts/kconfig/merge_config.sh: No such file or directory

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
---
 xen/tools/kconfig/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/tools/kconfig/Makefile b/xen/tools/kconfig/Makefile
index ef2f2336c4..fd37f4386a 100644
--- a/xen/tools/kconfig/Makefile
+++ b/xen/tools/kconfig/Makefile
@@ -93,7 +93,7 @@ configfiles=$(wildcard $(srctree)/kernel/configs/$@ $(srctree)/arch/$(SRCARCH)/c
 
 %.config: $(obj)/conf
 	$(if $(call configfiles),, $(error No configuration exists for this target on this architecture))
-	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh -m .config $(configfiles)
+	$(Q)$(CONFIG_SHELL) $(srctree)/tools/kconfig/merge_config.sh -m .config $(configfiles)
 	$(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
 
 PHONY += kvmconfig
-- 
2.26.2


