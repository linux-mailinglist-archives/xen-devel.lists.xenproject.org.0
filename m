Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4E44155CD
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 05:12:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193311.344340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTF9Q-0004mv-Et; Thu, 23 Sep 2021 03:11:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193311.344340; Thu, 23 Sep 2021 03:11:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTF9Q-0004km-Bb; Thu, 23 Sep 2021 03:11:56 +0000
Received: by outflank-mailman (input) for mailman id 193311;
 Thu, 23 Sep 2021 03:11:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qvJY=ON=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mTF9O-0004Qj-DU
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 03:11:54 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.72]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ff7c5433-1c1b-11ec-ba0a-12813bfff9fa;
 Thu, 23 Sep 2021 03:11:52 +0000 (UTC)
Received: from AM6PR0502CA0043.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::20) by DBBPR08MB4361.eurprd08.prod.outlook.com
 (2603:10a6:10:c8::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 23 Sep
 2021 03:11:41 +0000
Received: from AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:56:cafe::b3) by AM6PR0502CA0043.outlook.office365.com
 (2603:10a6:20b:56::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 03:11:41 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by AM5EUR03FT059.mail.protection.outlook.com (10.152.17.193) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 03:11:41 +0000
Received: ("Tessian outbound c9f4ff96a6ad:v103");
 Thu, 23 Sep 2021 03:11:39 +0000
Received: from 762f163a0586.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CA37131F-64B9-409C-B00E-9178C79C7F7C.1; 
 Thu, 23 Sep 2021 03:11:27 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 762f163a0586.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 03:11:27 +0000
Received: from AS8PR04CA0068.eurprd04.prod.outlook.com (2603:10a6:20b:313::13)
 by DB9PR08MB7050.eurprd08.prod.outlook.com (2603:10a6:10:2bd::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 23 Sep
 2021 03:11:25 +0000
Received: from VE1EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:313:cafe::d5) by AS8PR04CA0068.outlook.office365.com
 (2603:10a6:20b:313::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14 via Frontend
 Transport; Thu, 23 Sep 2021 03:11:25 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT039.mail.protection.outlook.com (10.152.19.196) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 03:11:25 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.14; Thu, 23 Sep
 2021 03:11:24 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 23
 Sep 2021 03:11:23 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Thu, 23 Sep 2021 03:11:21 +0000
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
X-Inumbo-ID: ff7c5433-1c1b-11ec-ba0a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PxKTjjjfvwxRnsbZJKvjVjurClpiQegEoLdVtMIbE48=;
 b=qElmi03Ic9TwxR4HBSDJDhHEUyaifwF/YbkCtycl0YqqkWwGzfw2pp9sl8lenQflnfejBPLpeUMWhollJPPMpBf9fbtEpMIfh7Oz6U/4fy68ej7jOLJF1MYicEoQGzVOBdLhHy9O3+51QBZ4AnCYcfkiFK+5YzL7i/JRLtTdCFk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8097e4d4a45c9b09
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z/4sG/owxdNQwWePWv3Hu+IOHrYJI4SEQ0kMGZ33kq6KPEjC3V54VRPb7vohA45yATFGQG/ZSJCo5zLB/nkreEN4CdPi9ILYrYXjpAb6To9VFH4R6xPjhNin69WtwEOckwrX4FSnJnvkxj59goxbMymIswcPwjL3QBDw3YYC/Ikk9YXMJPOxwsose8WwkkPVsCzWj5YtVPWkjcgxqdgWvlv1qAy/K8g3/bjasuvun2tLohTW1dsTjGm+7aViotCEXQaT7xNZx6jis8jWwAQ0CT5PrxtxgJD1BGm2iaCVt70XV4YZRdrclrKmQEj1CISgJ1WV/Blx0d7w4bjyZffGiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=PxKTjjjfvwxRnsbZJKvjVjurClpiQegEoLdVtMIbE48=;
 b=MInrOKf3N5TExZXY6p7tgfpXiMKVUmNsk5GzrQrPBrHcEq4D7Fq+c3zvLC6HmwzX15VjImnymsRTpQE3yC/Ohjw6joDKkyqc3hXlarodaaxrNXr5s7CJn0yHGMMm30Xfte2OhLVDrQIV8JJDuyRFqYbIb70RQq/f5pTNj8DQr71pDbwo6OINjiNHYkGRP+0VWey0qvhe4E6HCXsjNqkImf1QftZ5JFmEbmQia2ntnyNwentSsKYQ6ibuFLVSPd/wDNDcFfy8WMV4TMI4mzQxvcr6j33cjdAFixPXGQgcVcOfu/WRr/3TFWIvWYQjN2J0Mog0vHlrb9vUHVGE3cmbAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PxKTjjjfvwxRnsbZJKvjVjurClpiQegEoLdVtMIbE48=;
 b=qElmi03Ic9TwxR4HBSDJDhHEUyaifwF/YbkCtycl0YqqkWwGzfw2pp9sl8lenQflnfejBPLpeUMWhollJPPMpBf9fbtEpMIfh7Oz6U/4fy68ej7jOLJF1MYicEoQGzVOBdLhHy9O3+51QBZ4AnCYcfkiFK+5YzL7i/JRLtTdCFk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <penny.zheng@arm.com>
To: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<julien@xen.org>
CC: <Bertrand.Marquis@arm.com>, <Penny.Zheng@arm.com>, <Wei.Chen@arm.com>
Subject: [PATCH 01/11] xen: reserve flags for internal usage in xen_domctl_createdomain
Date: Thu, 23 Sep 2021 03:11:05 +0000
Message-ID: <20210923031115.1429719-2-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923031115.1429719-1-penny.zheng@arm.com>
References: <20210923031115.1429719-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8459c6c-cee4-4041-51bf-08d97e3fdd75
X-MS-TrafficTypeDiagnostic: DB9PR08MB7050:|DBBPR08MB4361:
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB43616343828A71DE52FEE5A8F7A39@DBBPR08MB4361.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 WIiGZflZU0eUsgMGCiC8xo9mr7vlf+kCGfnakbLFMgl7ZAZI2SE4mpkQ/0ToA07uOytpDqexWeNyvk9GDowhWwPsjbw0G5HjVAACXYyewYCXVLMIobrIpKcbdUIcJ2zEZ2vmvHWoJHQDtaxG3+E2j9GQI4zdBWJnOism3ZCy3O6hNDDtxlrVH07tE+/ZkJ+g6/dLqghS8K0rbRw9U1ZXec7aZRRea0XANvUhpSoAO7BJijyLLgy2/2KivJDybVQESLp5KrUGkex9ykz5m+AwTRfVe8zZmz1T6zudqxOuUO3yiJCGfxrP2hPIoZz71DFwZCbE0WwwGr1CUhp8slliL2YKd7KYki2PZsJuCO8llv3XLA3Z/P1MkIL67Puycipf1jFmhCZMBHoa+TbPc/NZ8ijsbvPhUO46/sYPA4KQMXHq2ozyFArKX4J+64zkQLmId4Ippk5kPKriZHL8hjNU8PFIBpRnkgeLb1UwjgLWvP2d8/Z55L02TWz+V3ZXPxlsu9EFc2zXQ3L8rbad/HQXbhYCjT0BM1Peox1Ye+nNX5rnCSVx+D9mAofFZzOFcB8srTvEDYZGZTV5S7JRrlqGOpcFb51mm8ILQJdtuI0JHwAICeulGLEjrt+QISfgHNZO+CUR2NBcedn6O90DLVeZZ4sOP3Z5VuOSamJmJuDEqfO2Y5WsZION++xxymhXDTacrO/XaqQTgM6yprWzV2lHOd8jM9fweyPYHP1YVOtuUE8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(70586007)(2906002)(356005)(316002)(36756003)(7696005)(8936002)(508600001)(70206006)(4326008)(186003)(81166007)(26005)(426003)(1076003)(47076005)(5660300002)(2616005)(82310400003)(336012)(6666004)(86362001)(8676002)(36860700001)(44832011)(54906003)(83380400001)(110136005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7050
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b13e7494-34b7-4986-5ef0-08d97e3fd422
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/q4d3YMs/iKQ0glHBwwvNkQoyTgRxELhoB+Joo1bAQYgNV9LdJ48XaouZeuDezpnlh4AnOtz7Ptnya/HreqIMo7vBKU5uykGoKuRQ3Ip3Ar/1xhKAqtOeJVK8uBMcXBwHORt811fE5YcEzNXHu0ijRIUe1EdLTdcdrUJisp53zyXj0Madn6nQgJ6crtzQ4Ucix0gsjyQP+i3JB3xroi//CrRpJCv5WQ8XW57b4RmCG0MWnlgMJyK2Qkn001zReFcc6XGohIanA0uOXRMc7C9/oyNIsTEMgkv1MeULw8nDo6LRMEW5ugG+ROdkNNOr1Qqs/K8Br6o6XjcJvC/4ivVEyXsVNQpOWc1cUq3UWpFA4O7r58W0mLeKYfOrmLQbd/LHYXwa5v/2cp4c0WZkomnuXqYZnP1H+aZR5c9uPJUGT77rbfs/1is/cWuw11PCMKlUpcOlOsBgcwenJQdYqTohe6ZsPiYo16y8JHFhhwdaFEZEk9Wa2KFAJrW+7q4moEfunU5qA5++YFH74OOUCUU3fjDsjHiHHWr+PRQ/QOpBmtghaL0KU6uJ0EF9A812ayfmPBBRIqNaoUMZU37D8VyFMBhoEx/9++d+8FG1TSBwVyZ1me4FCuwNgev5P2QXsGkuNdk0OZF2dP2o8Bjujp6sh4mU7IXesDXK9pxhQvxElTkX1IHyB2af+eBPTbi+dlqq1yfy1bB6D2aDsWbvlvd4Q==
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(83380400001)(70586007)(7696005)(316002)(70206006)(426003)(82310400003)(4326008)(110136005)(508600001)(54906003)(44832011)(26005)(336012)(81166007)(86362001)(5660300002)(2616005)(186003)(36756003)(47076005)(1076003)(8676002)(36860700001)(8936002)(6666004)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 03:11:41.2280
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8459c6c-cee4-4041-51bf-08d97e3fdd75
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4361

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

We are passing an extra special boolean flag at domain creation to
specify whether we want to the domain to be privileged (i.e. dom0) or
not. Another flag will be introduced later in this series.

Reserve bits 16-31 from the existing flags bitfield in struct
xen_domctl_createdomain for internal Xen usage.

Allocate bit 16 for XEN_DOMCTL_INTERNAL_ispriv: whether a domain is
privileged or not.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Signed-off-by: Penny Zheng <penny.zheng@arm.com>
CC: andrew.cooper3@citrix.com
CC: jbeulich@suse.com
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
CC: Wei Liu <wl@xen.org>
CC: "Roger Pau Monné" <roger.pau@citrix.com>
CC: George Dunlap <george.dunlap@eu.citrix.com>
CC: Dario Faggioli <dfaggioli@suse.com>
---
 xen/arch/arm/domain.c       |  2 +-
 xen/arch/arm/domain_build.c |  7 ++++---
 xen/arch/x86/setup.c        |  4 +++-
 xen/common/domain.c         | 19 +++++++++----------
 xen/common/domctl.c         |  3 ++-
 xen/common/sched/core.c     |  2 +-
 xen/include/public/domctl.h |  3 +++
 xen/include/xen/domain.h    |  4 ++++
 xen/include/xen/sched.h     |  3 +--
 9 files changed, 28 insertions(+), 19 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 19c756ac3d..7922249d26 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -623,7 +623,7 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
     unsigned int max_vcpus;
 
     /* HVM and HAP must be set. IOMMU may or may not be */
-    if ( (config->flags & ~XEN_DOMCTL_CDF_iommu) !=
+    if ( ((config->flags & XEN_DOMCTL_CDF_MASK) & ~XEN_DOMCTL_CDF_iommu) !=
          (XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap) )
     {
         dprintk(XENLOG_INFO, "Unsupported configuration %#x\n",
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index d233d634c1..8cc4c800e9 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2679,7 +2679,7 @@ void __init create_domUs(void)
          * very important to use the pre-increment operator to call
          * domain_create() with a domid > 0. (domid == 0 is reserved for Dom0)
          */
-        d = domain_create(++max_init_domid, &d_cfg, false);
+        d = domain_create(++max_init_domid, &d_cfg);
         if ( IS_ERR(d) )
             panic("Error creating domain %s\n", dt_node_name(node));
 
@@ -2752,7 +2752,8 @@ void __init create_dom0(void)
 {
     struct domain *dom0;
     struct xen_domctl_createdomain dom0_cfg = {
-        .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
+        .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
+                 XEN_DOMCTL_INTERNAL_ispriv,
         .max_evtchn_port = -1,
         .max_grant_frames = gnttab_dom0_frames(),
         .max_maptrack_frames = -1,
@@ -2773,7 +2774,7 @@ void __init create_dom0(void)
     if ( iommu_enabled )
         dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
 
-    dom0 = domain_create(0, &dom0_cfg, true);
+    dom0 = domain_create(0, &dom0_cfg);
     if ( IS_ERR(dom0) || (alloc_dom0_vcpu0(dom0) == NULL) )
         panic("Error creating domain 0\n");
 
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index b101565f14..6b7a1a3994 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -770,9 +770,11 @@ static struct domain *__init create_dom0(const module_t *image,
 
     if ( iommu_enabled )
         dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
+    if ( !pv_shim )
+        dom0_cfg.flags |= XEN_DOMCTL_INTERNAL_ispriv;
 
     /* Create initial domain 0. */
-    d = domain_create(get_initial_domain_id(), &dom0_cfg, !pv_shim);
+    d = domain_create(get_initial_domain_id(), &dom0_cfg);
     if ( IS_ERR(d) || (alloc_dom0_vcpu0(d) == NULL) )
         panic("Error creating domain 0\n");
 
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 6ee5d033b0..5fcca9b018 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -475,11 +475,11 @@ static void _domain_destroy(struct domain *d)
 
 static int sanitise_domain_config(struct xen_domctl_createdomain *config)
 {
-    bool hvm = config->flags & XEN_DOMCTL_CDF_hvm;
-    bool hap = config->flags & XEN_DOMCTL_CDF_hap;
-    bool iommu = config->flags & XEN_DOMCTL_CDF_iommu;
+    bool hvm = (config->flags & XEN_DOMCTL_CDF_MASK) & XEN_DOMCTL_CDF_hvm;
+    bool hap = (config->flags & XEN_DOMCTL_CDF_MASK) & XEN_DOMCTL_CDF_hap;
+    bool iommu = (config->flags & XEN_DOMCTL_CDF_MASK) & XEN_DOMCTL_CDF_iommu;
 
-    if ( config->flags &
+    if ( (config->flags & XEN_DOMCTL_CDF_MASK) &
          ~(XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
            XEN_DOMCTL_CDF_s3_integrity | XEN_DOMCTL_CDF_oos_off |
            XEN_DOMCTL_CDF_xs_domain | XEN_DOMCTL_CDF_iommu |
@@ -536,8 +536,7 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
 }
 
 struct domain *domain_create(domid_t domid,
-                             struct xen_domctl_createdomain *config,
-                             bool is_priv)
+                             struct xen_domctl_createdomain *config)
 {
     struct domain *d, **pd, *old_hwdom = NULL;
     enum { INIT_watchdog = 1u<<1,
@@ -563,7 +562,7 @@ struct domain *domain_create(domid_t domid,
     }
 
     /* Sort out our idea of is_control_domain(). */
-    d->is_privileged = is_priv;
+    d->is_privileged = config ? config->flags & XEN_DOMCTL_INTERNAL_ispriv : 0;
 
     /* Sort out our idea of is_hardware_domain(). */
     if ( domid == 0 || domid == hardware_domid )
@@ -756,7 +755,7 @@ void __init setup_system_domains(void)
      * Hidden PCI devices will also be associated with this domain
      * (but be [partly] controlled by Dom0 nevertheless).
      */
-    dom_xen = domain_create(DOMID_XEN, NULL, false);
+    dom_xen = domain_create(DOMID_XEN, NULL);
     if ( IS_ERR(dom_xen) )
         panic("Failed to create d[XEN]: %ld\n", PTR_ERR(dom_xen));
 
@@ -766,7 +765,7 @@ void __init setup_system_domains(void)
      * array. Mappings occur at the priv of the caller.
      * Quarantined PCI devices will be associated with this domain.
      */
-    dom_io = domain_create(DOMID_IO, NULL, false);
+    dom_io = domain_create(DOMID_IO, NULL);
     if ( IS_ERR(dom_io) )
         panic("Failed to create d[IO]: %ld\n", PTR_ERR(dom_io));
 
@@ -775,7 +774,7 @@ void __init setup_system_domains(void)
      * Initialise our COW domain.
      * This domain owns sharable pages.
      */
-    dom_cow = domain_create(DOMID_COW, NULL, false);
+    dom_cow = domain_create(DOMID_COW, NULL);
     if ( IS_ERR(dom_cow) )
         panic("Failed to create d[COW]: %ld\n", PTR_ERR(dom_cow));
 #endif
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 12d6144d28..2ec6d454dd 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -431,7 +431,8 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
             rover = dom;
         }
 
-        d = domain_create(dom, &op->u.createdomain, false);
+        op->u.createdomain.flags &= XEN_DOMCTL_CDF_MASK;
+        d = domain_create(dom, &op->u.createdomain);
         if ( IS_ERR(d) )
         {
             ret = PTR_ERR(d);
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 8f4b1ca10d..27d5bc2259 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -3021,7 +3021,7 @@ void __init scheduler_init(void)
         sched_ratelimit_us = SCHED_DEFAULT_RATELIMIT_US;
     }
 
-    idle_domain = domain_create(DOMID_IDLE, NULL, false);
+    idle_domain = domain_create(DOMID_IDLE, NULL);
     BUG_ON(IS_ERR(idle_domain));
     BUG_ON(nr_cpu_ids > ARRAY_SIZE(idle_vcpu));
     idle_domain->vcpu = idle_vcpu;
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 96696e3842..4d3fcd3bcb 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -74,6 +74,9 @@ struct xen_domctl_createdomain {
 /* Max XEN_DOMCTL_CDF_* constant.  Used for ABI checking. */
 #define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_nested_virt
 
+/* Flags from (1U<<16) to (1U<<31) are reserved for internal usage */
+#define XEN_DOMCTL_CDF_MASK           (0xffff)
+
     uint32_t flags;
 
 #define _XEN_DOMCTL_IOMMU_no_sharept  0
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index 1708c36964..7ed0b62b78 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -28,6 +28,10 @@ void getdomaininfo(struct domain *d, struct xen_domctl_getdomaininfo *info);
 void arch_get_domain_info(const struct domain *d,
                           struct xen_domctl_getdomaininfo *info);
 
+/* Flags are reserved for internal usage */
+#define _XEN_DOMCTL_INTERNAL_ispriv         16
+#define XEN_DOMCTL_INTERNAL_ispriv          (1U<<_XEN_DOMCTL_INTERNAL_ispriv)
+
 /*
  * Arch-specifics.
  */
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 28146ee404..a659b25dea 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -664,8 +664,7 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config);
  * (domid < DOMID_FIRST_RESERVED).
  */
 struct domain *domain_create(domid_t domid,
-                             struct xen_domctl_createdomain *config,
-                             bool is_priv);
+                             struct xen_domctl_createdomain *config);
 
 /*
  * rcu_lock_domain_by_id() is more efficient than get_domain_by_id().
-- 
2.25.1


