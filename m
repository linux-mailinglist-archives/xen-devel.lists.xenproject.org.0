Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28338452B05
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 07:33:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226075.390580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mms13-00021V-P3; Tue, 16 Nov 2021 06:32:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226075.390580; Tue, 16 Nov 2021 06:32:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mms13-0001yn-LQ; Tue, 16 Nov 2021 06:32:25 +0000
Received: by outflank-mailman (input) for mailman id 226075;
 Tue, 16 Nov 2021 06:32:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dk95=QD=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1mms11-0001yg-R0
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 06:32:24 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062d.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4141c16-46a6-11ec-9787-a32c541c8605;
 Tue, 16 Nov 2021 07:32:21 +0100 (CET)
Received: from DB6P195CA0012.EURP195.PROD.OUTLOOK.COM (2603:10a6:4:cb::22) by
 AM5PR0801MB1780.eurprd08.prod.outlook.com (2603:10a6:203:39::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Tue, 16 Nov
 2021 06:32:19 +0000
Received: from DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:cb:cafe::26) by DB6P195CA0012.outlook.office365.com
 (2603:10a6:4:cb::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26 via Frontend
 Transport; Tue, 16 Nov 2021 06:32:19 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT004.mail.protection.outlook.com (10.152.20.128) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.15 via Frontend Transport; Tue, 16 Nov 2021 06:32:19 +0000
Received: ("Tessian outbound 1cd1a01725a6:v110");
 Tue, 16 Nov 2021 06:32:19 +0000
Received: from 8e81b312028f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 10DE31A1-7021-4A47-BE04-9C0B067B8022.1; 
 Tue, 16 Nov 2021 06:32:13 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8e81b312028f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 16 Nov 2021 06:32:13 +0000
Received: from DB7PR02CA0006.eurprd02.prod.outlook.com (2603:10a6:10:52::19)
 by PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.25; Tue, 16 Nov
 2021 06:32:11 +0000
Received: from DB5EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:52:cafe::fa) by DB7PR02CA0006.outlook.office365.com
 (2603:10a6:10:52::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.19 via Frontend
 Transport; Tue, 16 Nov 2021 06:32:11 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT022.mail.protection.outlook.com (10.152.20.171) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4690.19 via Frontend Transport; Tue, 16 Nov 2021 06:32:10 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Tue, 16 Nov
 2021 06:32:09 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Tue, 16 Nov 2021 06:32:07 +0000
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
X-Inumbo-ID: f4141c16-46a6-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K1MdOhTcbAnefmEK77IlyRaqvA1cKHpVoGyuRHaxgnE=;
 b=IQW8J+N8qw0+7n0cNZ/Pfv9XpEyjl1B5cC2wgF9v9kko4sz+vtaifUVkRU+11VrCMA33hjChn67lPJXVv/aPMyRxklbGvXBUjw87GN+/nIUs5hoVB0alzvDpIQoPEYuz9st+1PsayjooPDPS2x5W4OKPdpJVrbkgwHhvBFHuLJw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 165dd54ca812c98a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fTtexNJoN6icMNJM6mwbjbQRkWF7wUOQFaJy5x3s5j6f754kIkxbZommWR0gt2UktBQL+MKXZl7bIteOCb6ZVkovMfzUXPTNAh4eGtmbWl0jIclY636EPMTQQKw1iFumcgPTMUd852jU/PYB12ce2vdRXcZi0WAuBDsl+sWEuNP5L0rt7LCTsUH2Fg62ALPb6QHPNMBHpR/nW99AhFWCxHe7qyZwxuNfxSeGamyFOMGimWmTeEQpVVxr0HgNQ4r5t8P0vcRIawrktj1cW7bn9geMnsm6ZG+0FAleGe9IZnTkQGpsqri3O+7yArxkfG7IDfaHWTmbR1xeFMoLI5Ubqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K1MdOhTcbAnefmEK77IlyRaqvA1cKHpVoGyuRHaxgnE=;
 b=aHIymzpUHK/lPvc2nGkeDjmQwUrdtF7seX6/2nECR5DZnd0vVFp6OZx3VCUFMCZCDUVfrwrDp+4zIe9zjYRyuUsCQHDdxnttFKfcXvgtCrgfGzTEiXPN95wOSgzjYC+KU6zOdGV/DoTmFofLWojWoV/KBcjaD040pesb7L47KzzfVDsEMT413PhbniQiXw06KsbJFQc0VbrJDKUBexU80RE+XJXdx6SbJD5VwqIJi2NNhRltT/n7TnGWNNjVl+KwLx0FsEBseXdAjlz0mG2s0nRHjH8BTdh3qgKedse9uYhImrhLHv5/gbotaokFM6VveZIkdFkjhuBU/MhMhxNyGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K1MdOhTcbAnefmEK77IlyRaqvA1cKHpVoGyuRHaxgnE=;
 b=IQW8J+N8qw0+7n0cNZ/Pfv9XpEyjl1B5cC2wgF9v9kko4sz+vtaifUVkRU+11VrCMA33hjChn67lPJXVv/aPMyRxklbGvXBUjw87GN+/nIUs5hoVB0alzvDpIQoPEYuz9st+1PsayjooPDPS2x5W4OKPdpJVrbkgwHhvBFHuLJw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <penny.zheng@arm.com>
To: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<julien@xen.org>
CC: <Bertrand.Marquis@arm.com>, <Wei.Chen@arm.com>
Subject: [PATCH v3 01/10] xen: introduce XEN_DOMCTL_CDF_INTERNAL_directmap
Date: Tue, 16 Nov 2021 06:31:46 +0000
Message-ID: <20211116063155.901183-2-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211116063155.901183-1-penny.zheng@arm.com>
References: <20211116063155.901183-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c2dadb3-0b64-4679-1739-08d9a8cad70e
X-MS-TrafficTypeDiagnostic: PR3PR08MB5593:|AM5PR0801MB1780:
X-Microsoft-Antispam-PRVS:
	<AM5PR0801MB1780744088B70604D590BB5CF7999@AM5PR0801MB1780.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 5wxZ44f16vDjahLHDN1sK4eyOq1hfXjSgdkFXxLU5TFufroTBKJEfUfk6H+EvlYF8Jrbs4vxNOpfLpXgvIeukrV2q21FdV1jyNDACX/vMXuC0nfmIuCGTQhLEq3QvQ121IHTWz/U7fS+zqrnzC+WTTRKWIPfBSVdUkmf8YOszthtFXn1cExqYRsjQOVWsylu3ep3dhS9qi3vhg4MDaCeGpPRzfpxa9fKWPmHeOtWkbVN62EynSx6qjXy3/+sGah4k4PNfuvrSi2/QePKj9SO9sxdp4pbs+RebZLRcmb/FVWsTYEThV7OP5AlQbiDyM41op1h/sCZL4n63VGQBMyCTOkTHU1s7m/hZLQMSMPRFWO+EEtgYRunS9Lk2cD4dWMFlt1SQ+bjfcoBgoMcFRyAPUkJweXaIn9t8GQ/0xBd+qQpW9Ug1qzLEqmr4riOR9P7oPSN5p22wAj7/YqJ0OGqXk4JqKi2Du3Ycys1P8M+I+QXeFkfpOMXqTQW9CqI9Etlw387i1LXWOX76u7wjt9LmqGRy+Q16vf2PYJAxK0qgp4w4P9qll3HFdVaWi45RbU0ar8Zpj3d1cjxPMbJ0IIDp4jmgEtuX3d0ofz3N0U82kQFWBUuwRlZ5zYOQWC54+XzKmni/xjvKdpaOkELgz2ahCbLkTaS1ujAO0Pc7q4ZC6s950A46a6X68xuspKL3yftX3KuVlYR+XiCnVvfBuq6p+INlJ0t0AlrtsB2o9IfyOEPuSldfdLxnug6V2ehnzFw
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(4326008)(2906002)(7696005)(8676002)(86362001)(82310400003)(5660300002)(316002)(426003)(36860700001)(508600001)(81166007)(70586007)(70206006)(47076005)(110136005)(186003)(83380400001)(36756003)(8936002)(54906003)(26005)(356005)(1076003)(336012)(2616005)(6666004)(44832011)(21314003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5593
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9e52ae0d-7f3b-448b-497e-08d9a8cad206
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3wRoB+n5mvuRZW20H7d+SHjJ+tSRAfcJ3N61Sr05RH3D7D0eni9gUNfBCxrNIjKzEDD+vr7rllDS4RLWLE8Tq0ZM3HwRZvhYIi5XTJw75n3Xo3K9c0DyRVq1USdeqRNqm3yV8U0CYn/ROHpE3V6qpI1QqPxf7hZX1hKaDSAhu1D2kMKjkgbr1+eQeCRr25EIpGrtutcrVZ91KNa/C6G5x+Z55qNFgSoSRZ4tdWQCbdY+rgvGEyWCfy6eZn2llIykVKtfWu9zh/0g6A4qu1XEFUC1Y/N9dYwQceWPk393YtYWN2ifsVdofIaic6vIQb6cKownxR/VsNvhVbWnlJ7l09kBzwVo0Azju7dfWg2kNbrgGSrYsSdY9GrFm1h0Ptul60fttQh5mL28m6qXGnQcVSpco+1yD1DwYBVu8nfSP3IYlX717LhE3BtWQiOVlNnKYLOIG50ct2tCGXNu4SjvVNWr9dmQqjnjdz0QWIXh9SWr8tcT/zybRvjyVKT05pgjSEJdexuPWn48dRu9dltqOjUlpOp5sn4JlnAXqi2s/eNlfjcTU+w2XYh3XaaguLHFzTeTOZTaBQuJwj5loPKZdS312+OqfWlueXDE5tgkofUkWxX1PLMj6+8xroZj0GwzqZYg8x7Uh475Nmip6CNKIUCamo1YUT7kTh2YI2dYvsdXsQHhfnTgPw4SA4AbNTubfdt+RDoihB330GZUWQr1UqDvVPUbXjae2ygsgBStmX4=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(81166007)(336012)(36860700001)(508600001)(26005)(8936002)(8676002)(1076003)(54906003)(7696005)(5660300002)(186003)(6666004)(82310400003)(316002)(110136005)(47076005)(86362001)(2616005)(4326008)(70586007)(36756003)(70206006)(426003)(44832011)(83380400001)(2906002)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 06:32:19.4450
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c2dadb3-0b64-4679-1739-08d9a8cad70e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1780

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

This commit introduces a new arm-specific flag
XEN_DOMCTL_CDF_INTERNAL_directmap to specify that a domain should
have its memory direct-map(guest physical address == physical address)
at domain creation.

Since this flag is only available for domain created by XEN, not exposed
to the toolstack, we name it with extra "INTERNAL" to distinguish from
other public XEN_DOMCTL_CDF_xxx flags, and add comments to warn developers
not to accidently use its bitfield when introducing new
XEN_DOMCTL_CDF_xxx flag.

Refine is_domain_direct_mapped to check whether the flag
XEN_DOMCTL_CDF_INTERNAL_directmap is set.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
CC: andrew.cooper3@citrix.com
CC: jbeulich@suse.com
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
CC: Wei Liu <wl@xen.org>
CC: "Roger Pau Monné" <roger.pau@citrix.com>
---
v2 changes
- remove the introduce of internal flag
- remove flag direct_map since we already store this flag in d->options
- Refine is_domain_direct_mapped to check whether the flag
XEN_DOMCTL_CDF_directmap is set
- reword "1:1 direct-map" to just "direct-map"
---
v3 changes
- move flag back to xen/include/xen/domain.h, to let it be only available for
domain created by XEN.
- name it with extra "INTERNAL" and add comments to warn developers not
to accidently use its bitfield when introducing new XEN_DOMCTL_CDF_xxx flag.
- reject this flag in x86'es arch_sanitise_domain_config()
---
 xen/arch/arm/domain.c        | 3 ++-
 xen/arch/arm/domain_build.c  | 4 +++-
 xen/arch/x86/domain.c        | 6 ++++++
 xen/common/domain.c          | 3 ++-
 xen/include/asm-arm/domain.h | 4 ++--
 xen/include/public/domctl.h  | 4 ++++
 xen/include/xen/domain.h     | 3 +++
 7 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 96e1b23550..d77265c03f 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -629,7 +629,8 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
 {
     unsigned int max_vcpus;
     unsigned int flags_required = (XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap);
-    unsigned int flags_optional = (XEN_DOMCTL_CDF_iommu | XEN_DOMCTL_CDF_vpmu);
+    unsigned int flags_optional = (XEN_DOMCTL_CDF_iommu | XEN_DOMCTL_CDF_vpmu |
+                                   XEN_DOMCTL_CDF_INTERNAL_directmap);
 
     if ( (config->flags & ~flags_optional) != flags_required )
     {
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 19487c79da..664c88ebe4 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -3089,8 +3089,10 @@ static int __init construct_dom0(struct domain *d)
 void __init create_dom0(void)
 {
     struct domain *dom0;
+    /* DOM0 has always its memory direct-map. */
     struct xen_domctl_createdomain dom0_cfg = {
-        .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
+        .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
+                 XEN_DOMCTL_CDF_INTERNAL_directmap,
         .max_evtchn_port = -1,
         .max_grant_frames = gnttab_dom0_frames(),
         .max_maptrack_frames = -1,
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index ef1812dc14..eba6502218 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -692,6 +692,12 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
         return -EINVAL;
     }
 
+    if ( config->flags & XEN_DOMCTL_CDF_INTERNAL_directmap )
+    {
+        dprintk(XENLOG_INFO, "direct-map cannot be enabled yet\n");
+        return -EINVAL;
+    }
+
     return 0;
 }
 
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 56d47dd664..13ac5950bc 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -486,7 +486,8 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
          ~(XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
            XEN_DOMCTL_CDF_s3_integrity | XEN_DOMCTL_CDF_oos_off |
            XEN_DOMCTL_CDF_xs_domain | XEN_DOMCTL_CDF_iommu |
-           XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_vpmu) )
+           XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_vpmu |
+           XEN_DOMCTL_CDF_INTERNAL_directmap) )
     {
         dprintk(XENLOG_INFO, "Unknown CDF flags %#x\n", config->flags);
         return -EINVAL;
diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
index 9b3647587a..4f2c3f09d4 100644
--- a/xen/include/asm-arm/domain.h
+++ b/xen/include/asm-arm/domain.h
@@ -29,8 +29,8 @@ enum domain_type {
 #define is_64bit_domain(d) (0)
 #endif
 
-/* The hardware domain has always its memory direct mapped. */
-#define is_domain_direct_mapped(d) is_hardware_domain(d)
+#define is_domain_direct_mapped(d) \
+        (d->options & XEN_DOMCTL_CDF_INTERNAL_directmap)
 
 struct vtimer {
     struct vcpu *v;
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 1c21d4dc75..054e545c97 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -72,6 +72,10 @@ struct xen_domctl_createdomain {
 #define XEN_DOMCTL_CDF_nested_virt    (1U << _XEN_DOMCTL_CDF_nested_virt)
 /* Should we expose the vPMU to the guest? */
 #define XEN_DOMCTL_CDF_vpmu           (1U << 7)
+/*
+ * Be aware that bit 8 has already been occupied by flag
+ * XEN_DOMCTL_CDF_INTERNAL_directmap, defined in xen/include/xen/domain.h.
+ */
 
 /* Max XEN_DOMCTL_CDF_* constant.  Used for ABI checking. */
 #define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_vpmu
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index 160c8dbdab..2b9edfdcee 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -28,6 +28,9 @@ void getdomaininfo(struct domain *d, struct xen_domctl_getdomaininfo *info);
 void arch_get_domain_info(const struct domain *d,
                           struct xen_domctl_getdomaininfo *info);
 
+/* Should domain memory be directly mapped? */
+#define XEN_DOMCTL_CDF_INTERNAL_directmap      (1U << 8)
+
 /*
  * Arch-specifics.
  */
-- 
2.25.1


