Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F8D505088
	for <lists+xen-devel@lfdr.de>; Mon, 18 Apr 2022 14:23:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307192.522512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngQQ0-0003Hk-8z; Mon, 18 Apr 2022 12:23:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307192.522512; Mon, 18 Apr 2022 12:23:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngQQ0-0003F7-5c; Mon, 18 Apr 2022 12:23:48 +0000
Received: by outflank-mailman (input) for mailman id 307192;
 Mon, 18 Apr 2022 12:23:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UkN/=U4=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1ngQPy-0002c3-E5
 for xen-devel@lists.xenproject.org; Mon, 18 Apr 2022 12:23:46 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02on060a.outbound.protection.outlook.com
 [2a01:111:f400:fe05::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63f4bba1-bf12-11ec-a405-831a346695d4;
 Mon, 18 Apr 2022 14:23:45 +0200 (CEST)
Received: from AS8PR04CA0095.eurprd04.prod.outlook.com (2603:10a6:20b:31e::10)
 by AM0PR08MB4019.eurprd08.prod.outlook.com (2603:10a6:208:128::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Mon, 18 Apr
 2022 12:23:42 +0000
Received: from AM5EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:31e:cafe::5f) by AS8PR04CA0095.outlook.office365.com
 (2603:10a6:20b:31e::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18 via Frontend
 Transport; Mon, 18 Apr 2022 12:23:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT043.mail.protection.outlook.com (10.152.17.43) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.19 via Frontend Transport; Mon, 18 Apr 2022 12:23:42 +0000
Received: ("Tessian outbound 9613c00560a5:v118");
 Mon, 18 Apr 2022 12:23:42 +0000
Received: from 38a061796f99.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 30740B92-F3AC-480E-8C36-58F0DADEA8C2.1; 
 Mon, 18 Apr 2022 12:23:35 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 38a061796f99.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 18 Apr 2022 12:23:34 +0000
Received: from AS9PR06CA0498.eurprd06.prod.outlook.com (2603:10a6:20b:49b::24)
 by HE1PR08MB2892.eurprd08.prod.outlook.com (2603:10a6:7:30::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Mon, 18 Apr
 2022 12:23:33 +0000
Received: from VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:49b:cafe::9a) by AS9PR06CA0498.outlook.office365.com
 (2603:10a6:20b:49b::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18 via Frontend
 Transport; Mon, 18 Apr 2022 12:23:32 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT027.mail.protection.outlook.com (10.152.18.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5164.19 via Frontend Transport; Mon, 18 Apr 2022 12:23:32 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Mon, 18 Apr
 2022 12:23:29 +0000
Received: from a011292.shanghai.arm.com (10.169.190.94) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Mon, 18 Apr 2022 12:23:20 +0000
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
X-Inumbo-ID: 63f4bba1-bf12-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uyBX+fsNkrz5HUOuaIVqm6IKexBIh5lxFql//sHUJM4=;
 b=vLA7Be18p24LEiOJS5tLPPWUKlFHVYaztq6P+wHHsznD1M9kSS/wbVuzMD1jhquag9RAF32Ih79iVW4HNZOYlIuzyLQwQKgtHWUYYriHOa+2bvQesQ33IQAlRKrtc6wNEcOCk4GqPUVEZzGpReDNomoDnvB6S7f+dm92KZWJ9TM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: b53748e9b814031d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lm3HNdec7I7A5Zrn0/ClCUvK1ljQZTEn34QR8kILz2lNZbnYM2h/X0CJDXRjAlOhjDki8BdlSrksyhjw98X4Qv8PyG2EL5CHmhsyjE+LOU3Ku2U6jcfGMlMj+fto2qEaEgMMLy+gCH1wfyrjxcsZ6pA6v196k52xS7/61MIAliF9ur1UKtXR6sgZHVrHywdmiYiG/2WrcuNyGtvz7/WyZyJzVDpv/dTAISxsvTqHdYiSzTT63UOVJ0WeN8MmEnon1SQ4SJB6wgJXNQz9366EbX16t6dT4bOI2QgbY8y3aTToD40n/8uVSY3QtVRDzk/F1/YOJ+NnXRzb1iWfg94/Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uyBX+fsNkrz5HUOuaIVqm6IKexBIh5lxFql//sHUJM4=;
 b=P/suv8TqTHF/CxyTi+2iJJiaDz4VnQaFX5mO36/viASAP6w/K0pdf/LBPm9VJABZa4dJvkTN43WtSLVgqBgZbWRRO4GbdL6giIWprbwY7swd+8OZDLXIdzWIm7ofDmf836mv6zEf5VeOmqFNfn2chXVZ6sGnRrhPnueDyVxCGHo4piE2Gji0z1A3muFgT8qiCLqzJ2Y+TUPue7+Kx9QVupji24SjDQvYigma9SYwZIa3VdHSsqcgDY3vxfdKvfVPR9NdoEJ6K/PUqBMQ+BsWA5yjWd3w/VQBAoWC+0JUcZaRRzTbys25RnzEFWa3u81ZTq0lb9IkzR+mtrj5BYr+UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uyBX+fsNkrz5HUOuaIVqm6IKexBIh5lxFql//sHUJM4=;
 b=vLA7Be18p24LEiOJS5tLPPWUKlFHVYaztq6P+wHHsznD1M9kSS/wbVuzMD1jhquag9RAF32Ih79iVW4HNZOYlIuzyLQwQKgtHWUYYriHOa+2bvQesQ33IQAlRKrtc6wNEcOCk4GqPUVEZzGpReDNomoDnvB6S7f+dm92KZWJ9TM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <Penny.Zheng@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <wei.chen@arm.com>, Penny Zheng <Penny.Zheng@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v2 3/6] xen: add field "flags" to cover all internal CDF_XXX
Date: Mon, 18 Apr 2022 20:22:48 +0800
Message-ID: <20220418122251.3583049-4-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220418122251.3583049-1-Penny.Zheng@arm.com>
References: <20220418122251.3583049-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: a5dcc233-7aa2-4a92-4021-08da21364697
X-MS-TrafficTypeDiagnostic:
	HE1PR08MB2892:EE_|AM5EUR03FT043:EE_|AM0PR08MB4019:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB401971B94B73290B39EA534DF7F39@AM0PR08MB4019.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 grONejuSOQg698IMeUKWD7yEXpzELpn6Y+M11a+Dc/JLxyLtEIDfRLpiOMDHP9EMu8oKMbeFNGd0c0FemCVgHiBshOX8K7CCl6rF7aktdQm+9DZNgiqAAvJCj53zq+hX1cFJht6ExMDZPzBfsHkEJo5KIPhXwITK6dqLCAzSSQgguxQXfjBkV79dWlyX6zY3XfBnIGFTzgxqZ1yD06ziXZQe8Z4HodpJRpai6ObJZrrZC7c8R9GlCe/YOdb99Ku/kpFd//b3Lab5wZTiJqMsdH3Q+RE+KdqdvriVnZyKUOWTUya1GfmgVDfesFJclYgjBeQ++xrWcaQuy41TbcLajQZtbxYt2Ybeo2yIa3RQ2z4Ifpq+EqopmVnURmg2NNWUhi8w1DvqeIVeYpyUQ6rhsScnOHE5D4s5w130Wif3f+lIknV+n/CBWWSs+3Mwitga7IpF79Cx2ukkdSut+JcqbnSALSN/eVXyssNZQB/HIIB2XydhrTZDnmxVhY2T57PQ4GZ5bv7TncA3dTnx3lKVmC2w1UUW9rz8JAPCmTBZnF8tqJ8kwJPhmUJDJhSmY037Bk7idRpiUmXdCxSKyO3Dzm2VavEgvGjCK3RpNEO7DV2YRXxWBNPU7uiOHY0Q8vKlC3fQXwdzdrXd3s4P71B3UdKO3FViiCe8uDC7IImvGTjj6lgwXvJ2A+qFlExAeSi6LfvfapI+GvuR1MUGusJGNKqye24usTxHFijxLeAZ4/s=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(356005)(1076003)(26005)(5660300002)(4326008)(36756003)(36860700001)(70206006)(83380400001)(81166007)(82310400005)(8676002)(70586007)(8936002)(54906003)(6916009)(2906002)(316002)(186003)(2616005)(40460700003)(7696005)(86362001)(6666004)(508600001)(336012)(426003)(47076005)(21314003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2892
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	59e0dada-653e-4a91-9d43-08da21364090
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	56Y2qAUXbbPHavPrlibf2hrbe0jXKcK+X4Vd89J4OgTeD002+Wy3I+RxwqQNb3WhcB7+1Q+fQshxk6mdTcS7OOc+JA6eIQ8xHVSoVgzrO4Ff9zhF/xIgsxrJ124PIuigO9gcIzWtJTE760D73rxp+vvxahX5wtjaXy1ACvpLBayKxl4nPOErRHrJeDiqgyP41PiXz6MCCsRUK5b4nncYIXtxiKtrgwNjk+L4tiJMhSsQLG34Gaydf6eBr0SnQO9+V+3s0Co3VEuQymja36sQw5i3i0Fa+gjIF05cF6s4wmDBHvjqJJGyLnGtbWdA/wt2EIZK5qwHGY6M81KfwNhG3Zs8elBzzAWfpeQOOyCYXVr/mrDYVHi1uBS+9FR4aceSE+pjpAGXVYxpynJN2lRPNvOTdfFgyQq6QRzPad/VrLs43WFDKWWbFk2i32NnHxlRAa303wZw7+573sUFo6Y6gM3wNHxT9ZPfPfwWmZIeOvRcVClHS+tMHejROL1Wy8e+0Km/ZTm+8NIIomn80Cqj7E+nzykTkum+IrooCFb/TVflBSZ4GQ/baCsEA92LCbWXecZA6nLzDx0hefssfv7tLsnDHCIgkzSahjoxyWI+uaQAUkwu5r5M2NfQRV3nl8Vh/lQ0f6tK+IzSqlBIh6l169PSsZj9PK1C+7Gnh3R28HZLy3tdD6Ca/B+znmmWs1vbJnp18xTHlCAXIw6Zn+wXBg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(8936002)(6916009)(40460700003)(54906003)(498600001)(6666004)(5660300002)(81166007)(83380400001)(36756003)(86362001)(2906002)(7696005)(8676002)(4326008)(82310400005)(26005)(70206006)(36860700001)(70586007)(1076003)(47076005)(2616005)(426003)(336012)(186003)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2022 12:23:42.1989
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5dcc233-7aa2-4a92-4021-08da21364697
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4019

With more and more CDF_xxx internal flags in and to save the space, this
commit introduces a new field "flags" in struct domain to store CDF_*
internal flags directly.

Another new CDF_xxx will be introduced in the next patch.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v2 changes:
- let "flags" live in the struct domain. So other arch can take
advantage of it in the future
- fix coding style
---
 xen/arch/arm/domain.c             | 2 --
 xen/arch/arm/include/asm/domain.h | 3 +--
 xen/common/domain.c               | 3 +++
 xen/include/xen/sched.h           | 3 +++
 4 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 8110c1df86..74189d9878 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -709,8 +709,6 @@ int arch_domain_create(struct domain *d,
     ioreq_domain_init(d);
 #endif
 
-    d->arch.directmap = flags & CDF_directmap;
-
     /* p2m_init relies on some value initialized by the IOMMU subsystem */
     if ( (rc = iommu_domain_init(d, config->iommu_opts)) != 0 )
         goto fail;
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index ed63c2b6f9..36ec00e62d 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -29,7 +29,7 @@ enum domain_type {
 #define is_64bit_domain(d) (0)
 #endif
 
-#define is_domain_direct_mapped(d) (d)->arch.directmap
+#define is_domain_direct_mapped(d) ((d)->flags & CDF_directmap)
 
 /*
  * Is the domain using the host memory layout?
@@ -103,7 +103,6 @@ struct arch_domain
     void *tee;
 #endif
 
-    bool directmap;
 }  __cacheline_aligned;
 
 struct arch_vcpu
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 351029f8b2..859cc13d3b 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -568,6 +568,9 @@ struct domain *domain_create(domid_t domid,
     /* Sort out our idea of is_system_domain(). */
     d->domain_id = domid;
 
+    /* Holding CDF_* internal flags. */
+    d->flags = flags;
+
     /* Debug sanity. */
     ASSERT(is_system_domain(d) ? config == NULL : config != NULL);
 
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index ed8539f6d2..68eb08058e 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -591,6 +591,9 @@ struct domain
         struct ioreq_server     *server[MAX_NR_IOREQ_SERVERS];
     } ioreq_server;
 #endif
+
+    /* Holding CDF_* constant. Internal flags for domain creation. */
+    uint32_t flags;
 };
 
 static inline struct page_list_head *page_to_list(
-- 
2.25.1


