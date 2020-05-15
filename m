Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 809601D590C
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2020 20:26:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZf1T-00028v-3T; Fri, 15 May 2020 18:25:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sXO4=65=dornerworks.com=stewart.hildebrand@srs-us1.protection.inumbo.net>)
 id 1jZf1R-00028q-Kj
 for xen-devel@lists.xenproject.org; Fri, 15 May 2020 18:25:25 +0000
X-Inumbo-ID: 7019f6e6-96d9-11ea-a5b2-12813bfff9fa
Received: from USG02-CY1-obe.outbound.protection.office365.us (unknown
 [23.103.209.84]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7019f6e6-96d9-11ea-a5b2-12813bfff9fa;
 Fri, 15 May 2020 18:25:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=Uf1EUMhCapRRYsBH3QY98wpUSN7jJYCCkQ92Ad5mGQpkzdtwraVJih5PeZ8erfPNymdD0f3v0Yxn6OHpnY70irNBFenJwZswStPDEr53v8SXFKbmC+qJ8utuLE84MlCpGjPP6H/Dgu35GwIPpgv4g65y5o+9BVrk2PbLVHrn5JMVTRLkwTscJlCIRBuQs2grrURQGE7to6LG85Wv6693Yy1VuYAXdsgOvZhSdAZo370Ha2o7OCn7iBKUu9vWWX7Ock8lPaUv6OCwG9GpeDB1d9cwwnwWEX8kA0fl2Y4bu/Y7wWFUQL2Mg1uvQLsevd+v37akZKB+MfLRIASidoGViQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2bBfou/chdJqZdN6bXhQ23PEqm32owHKlLolqa3BTx0=;
 b=LxKyxbWFOargpVgbQ4+AK00k70lpG1OMFPxz9px7SEDKRJYuUpS0qbn3eCgyc6+wfl2YSL/HUm3dOTCvKyCqDyRXsG5asEZrfXLjdrzaQ9RlsfM6P66yJaB4TjCgHG0TSLIeHCnZbSWAP+qVtAn2IoENLChqtWQsty2/K4UH45AfFGTmQhcQk3w1Qs0uov4dscPQgFo9mOxpeBHoSyZbrBWRITL1S8apkMB6OiKygQLEcqhPbCU+bhJyBB1ZEXYYFPXeJ0J2Uw9YdSWg34+Uvo6yDRo9t58PevMFh0+RyaLNriTgWVM5RgVvIGI3MJit4n1mdvk7aBNdqMHLyhJJ7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 207.242.234.14) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=dornerworks.com; dmarc=none action=none
 header.from=dornerworks.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dornerworkssystem.onmicrosoft.us;
 s=selector1-dornerworkssystem-onmicrosoft-us;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2bBfou/chdJqZdN6bXhQ23PEqm32owHKlLolqa3BTx0=;
 b=3Z6txRrfHqCPM3T/pV4YKVkr78QjLUShpN5iM5B/TR/MHQw6+bfyHPfDVeIimhcjwTGTcy781wFNPiMiKIn8r+uoSHUTytPCXChZ9kzLJoJBB9mZKZj/cQB1GQpJxZ5SAkhfVBdPCSetm1EQ+/v7Be6bES6gevwBkB3NAQfn8oM=
Received: from SN1P110CA0028.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:61::18)
 by CY1P110MB0358.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:401::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.35; Fri, 15 May
 2020 18:25:19 +0000
Received: from CY1USG02FT007.eop-usg02.itar.protection.office365.us
 (2001:489a:2202:d::631) by SN1P110CA0028.office365.us (2001:489a:200:61::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.35 via Frontend
 Transport; Fri, 15 May 2020 18:25:18 +0000
Authentication-Results: spf=fail (sender IP is 207.242.234.14)
 smtp.mailfrom=dornerworks.com; lists.xenproject.org; dkim=none (message not
 signed) header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=dornerworks.com;
Received-SPF: Fail (protection.outlook.com: domain of dornerworks.com does not
 designate 207.242.234.14 as permitted sender)
 receiver=protection.outlook.com; client-ip=207.242.234.14;
 helo=ubuntu.localdomain;
Received: from ubuntu.localdomain (207.242.234.14) by
 CY1USG02FT007.mail.protection.office365.us (10.97.26.110) with Microsoft SMTP
 Server id 15.20.2979.30 via Frontend Transport; Fri, 15 May 2020 18:25:12
 +0000
From: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
To: xen-devel@lists.xenproject.org
Subject: [XEN PATCH v2] xen/build: use the correct kconfig makefile
Date: Fri, 15 May 2020 14:25:09 -0400
Message-Id: <20200515182509.5476-1-stewart.hildebrand@dornerworks.com>
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
 SFS:(346002)(46966005)(508600001)(6916009)(2906002)(6666004)(186003)(956004)(70206006)(54906003)(2616005)(44832011)(336012)(70586007)(26005)(4326008)(36756003)(33310700002)(8676002)(82310400002)(5660300002)(81166007)(86362001)(8936002)(47076004)(1076003);
 DIR:OUT; SFP:1101; 
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71c76360-2106-447a-897c-08d7f8fd5226
X-MS-TrafficTypeDiagnostic: CY1P110MB0358:|CY1P110MB0358:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY1P110MB0358F36E9C31893D670955658CBD0@CY1P110MB0358.NAMP110.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:466;
X-Forefront-PRVS: 04041A2886
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-OriginatorOrg: dornerworks.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2020 18:25:12.4962 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71c76360-2106-447a-897c-08d7f8fd5226
X-MS-Exchange-CrossTenant-Id: 097cf9aa-db69-4b12-aeab-ab5f513dbff9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=097cf9aa-db69-4b12-aeab-ab5f513dbff9; Ip=[207.242.234.14];
 Helo=[ubuntu.localdomain]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1P110MB0358
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
Cc: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 Anthony PERARD <anthony.perard@citrix.com>, Doug Goldstein <cardoe@cardoe.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This resolves the following observed error during config merge:

/bin/sh /path/to/xen/xen/../xen/tools/kconfig/merge_config.sh -m .config /path/to/xen/xen/../xen/arch/arm/configs/custom.config
Using .config as base
Merging /path/to/xen/xen/../xen/arch/arm/configs/custom.config
#
# merged configuration written to .config (needs make)
#
make -f /path/to/xen/xen/../xen/Makefile olddefconfig
make[2]: Entering directory '/path/to/xen/xen'
make[2]: *** No rule to make target 'olddefconfig'.  Stop.
make[2]: Leaving directory '/path/to/xen/xen'
tools/kconfig/Makefile:95: recipe for target 'custom.config' failed

The build was invoked by first doing a defconfig (which succeeded):

$ make -C xen XEN_TARGET_ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- defconfig

Followed by the config fragment merge command (which failed before this patch)

$ cat > xen/arch/arm/configs/custom.config <<EOF
CONFIG_DEBUG=y
CONFIG_EARLY_PRINTK_ZYNQMP=y
EOF
$ make -C xen XEN_TARGET_ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- custom.config

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>

---
v2: updated commit message
---
 xen/tools/kconfig/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/tools/kconfig/Makefile b/xen/tools/kconfig/Makefile
index fd37f4386a..f39521a0ed 100644
--- a/xen/tools/kconfig/Makefile
+++ b/xen/tools/kconfig/Makefile
@@ -94,7 +94,7 @@ configfiles=$(wildcard $(srctree)/kernel/configs/$@ $(srctree)/arch/$(SRCARCH)/c
 %.config: $(obj)/conf
 	$(if $(call configfiles),, $(error No configuration exists for this target on this architecture))
 	$(Q)$(CONFIG_SHELL) $(srctree)/tools/kconfig/merge_config.sh -m .config $(configfiles)
-	$(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
+	$(Q)$(MAKE) -f $(srctree)/tools/kconfig/Makefile.kconfig olddefconfig
 
 PHONY += kvmconfig
 kvmconfig: kvm_guest.config
-- 
2.26.2


