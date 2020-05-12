Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9E31CFCA2
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2020 19:52:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYZ4h-0003mV-P9; Tue, 12 May 2020 17:52:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UHzJ=62=dornerworks.com=stewart.hildebrand@srs-us1.protection.inumbo.net>)
 id 1jYZ4g-0003mQ-KZ
 for xen-devel@lists.xenproject.org; Tue, 12 May 2020 17:52:14 +0000
X-Inumbo-ID: 4f7b4226-9479-11ea-b9cf-bc764e2007e4
Received: from USG02-BN3-obe.outbound.protection.office365.us (unknown
 [2001:489a:2202:c::623])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4f7b4226-9479-11ea-b9cf-bc764e2007e4;
 Tue, 12 May 2020 17:52:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=FNRv4yf6VBuwcj7CX05z4y06SXfqXUOWpsAryReOlqvp7FDgVUJ/SVuDr2yW76nF9u4oJZyU9pYwhU+clr+/n0bzG0l5LpOh7KJdANrizZHLAOVsFSwuOO0osoT2WS0d8eKe6l5oXnfqAx0L5YnmOkULKoQn2mdivI+bZES64f5HoB6pm/wrehMl0+ufDG/Im0I7JYfoDpJbPPByb2dAs2ZY+1y867zHJPIeB3ojeO7ORPSQQmfWJh521vIDcBx14K4emTOVh3jBijpq04s2Bx2YvVAZWEc94HQYmL9NhfedL+39tzLCtOYzuYjLW9ef0XDUSpmEzfYjO/wDd3/s6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ibFUUBUfF4zgAAt8INh+umAlcWsDLL1uH7FOJdxJPag=;
 b=grT6wEmtoxI2kjiiv+FAXoXfzIH0cWgcOlm/e2jw93M0AetlSfD6oUBTrW5ujyry/yhOEPmzPuRGDrWMpazFCWk7L+hEF5KG1zjDGRhn7RK/ToBcnS+Sfo8xGe3Cg5/7WaP/duRaYrMfqG/5/aqLIu9PjWlXlcRPndkuk8YW9qEZrsW3oTTOARk/wp0eRNxhhloMIh/b0wERb2WW3IkEXr9zp0Yfpo198uXYtBtVyMeodEmHsPeyIdKSrObCDyPIjZCRjnPAMjgcvPfjGKmX/4kGakjbY+961VwPghrIrm/mY3d6t4J/X9XBAwZqtbFhPk/ErKeFoM+/zpDiUofCww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 207.242.234.14) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=dornerworks.com; dmarc=none action=none
 header.from=dornerworks.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dornerworkssystem.onmicrosoft.us;
 s=selector1-dornerworkssystem-onmicrosoft-us;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ibFUUBUfF4zgAAt8INh+umAlcWsDLL1uH7FOJdxJPag=;
 b=k2IeNJtkHI9E8zge43PkMrsFrxnuHejHraPcePVZjgKdVnkc5fp5C71+tMLYu8rC/F9p7t9jddsz9WTIaTIt68zpEawlasBFbLidB9RjdJNz3v7qK0R63LHPWTAc9yAx6bbwFbQDYylcQ5sH7LefIsXvZvM0P7efXxhY8xuRHdI=
Received: from SN1P110CA0027.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:61::17)
 by SN5P110MB0557.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:41c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.35; Tue, 12 May
 2020 17:52:09 +0000
Received: from CY1USG02FT013.eop-usg02.itar.protection.office365.us
 (2001:489a:2202:d::631) by SN1P110CA0027.office365.us (2001:489a:200:61::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.35 via Frontend
 Transport; Tue, 12 May 2020 17:52:09 +0000
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
 Server id 15.20.2979.30 via Frontend Transport; Tue, 12 May 2020 17:52:07
 +0000
From: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
To: xen-devel@lists.xenproject.org
Subject: [XEN PATCH 0/2] xen/build: fix kconfig errors during config merge
Date: Tue, 12 May 2020 13:52:04 -0400
Message-Id: <20200512175206.20314-1-stewart.hildebrand@dornerworks.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-spam-status: No, score=-2.9 required=3.5 tests=ALL_TRUSTED, BAYES_00,
 MAILSHELL_SCORE_0_4
X-Spam-Flag: NO
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:207.242.234.14; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:ubuntu.localdomain; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(346002)(46966005)(33430700001)(8676002)(81166007)(6916009)(70206006)(33310700002)(33440700001)(8936002)(70586007)(82310400002)(2616005)(44832011)(1076003)(86362001)(47076004)(4326008)(6666004)(508600001)(4744005)(956004)(336012)(186003)(5660300002)(36756003)(54906003)(26005)(2906002);
 DIR:OUT; SFP:1101; 
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1bde4486-e498-4431-364b-08d7f69d314f
X-MS-TrafficTypeDiagnostic: SN5P110MB0557:
X-Microsoft-Antispam-PRVS: <SN5P110MB055798B824C98EFE1D941EA18CBE0@SN5P110MB0557.NAMP110.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-Forefront-PRVS: 0401647B7F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-OriginatorOrg: dornerworks.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2020 17:52:07.9848 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bde4486-e498-4431-364b-08d7f69d314f
X-MS-Exchange-CrossTenant-Id: 097cf9aa-db69-4b12-aeab-ab5f513dbff9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=097cf9aa-db69-4b12-aeab-ab5f513dbff9; Ip=[207.242.234.14];
 Helo=[ubuntu.localdomain]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN5P110MB0557
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

This series fixes a couple of kconfig errors that I observed while
invoking a build with a defconfig and config fragment.

I invoked the build as follows:

cat > xen/arch/arm/configs/custom.config <<EOF
CONFIG_DEBUG=y
CONFIG_SCHED_ARINC653=y
CONFIG_EARLY_PRINTK_ZYNQMP=y
EOF
make -C xen XEN_TARGET_ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- defconfig custom.config
make XEN_TARGET_ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- dist-xen -j $(nproc)

Stewart Hildebrand (2):
  xen/build: fixup path to merge_config.sh
  xen/build: use the correct kconfig makefile

 xen/tools/kconfig/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.26.2


