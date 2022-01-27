Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F6C49DBF1
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 08:51:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261232.452129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCzYo-00043j-Ib; Thu, 27 Jan 2022 07:51:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261232.452129; Thu, 27 Jan 2022 07:51:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCzYo-0003we-D3; Thu, 27 Jan 2022 07:51:14 +0000
Received: by outflank-mailman (input) for mailman id 261232;
 Thu, 27 Jan 2022 07:51:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h4dm=SL=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nCzYm-0008Mi-SI
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 07:51:13 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061f.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4da8ad7-7f45-11ec-8f75-fffcc8bd4f1a;
 Thu, 27 Jan 2022 08:51:11 +0100 (CET)
Received: from AM8P191CA0016.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::21)
 by AM9PR08MB7101.eurprd08.prod.outlook.com (2603:10a6:20b:41a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Thu, 27 Jan
 2022 07:51:10 +0000
Received: from VE1EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:21a:cafe::b6) by AM8P191CA0016.outlook.office365.com
 (2603:10a6:20b:21a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15 via Frontend
 Transport; Thu, 27 Jan 2022 07:51:10 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT019.mail.protection.outlook.com (10.152.18.153) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.15 via Frontend Transport; Thu, 27 Jan 2022 07:51:09 +0000
Received: ("Tessian outbound 741ca6c82739:v113");
 Thu, 27 Jan 2022 07:51:09 +0000
Received: from e105dde92142.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CC93E2F0-21EA-4475-94A2-76E03B244F59.1; 
 Thu, 27 Jan 2022 07:51:03 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e105dde92142.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 27 Jan 2022 07:51:03 +0000
Received: from DB6PR0301CA0061.eurprd03.prod.outlook.com (2603:10a6:4:54::29)
 by DBAPR08MB5847.eurprd08.prod.outlook.com (2603:10a6:10:1a0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Thu, 27 Jan
 2022 07:50:55 +0000
Received: from DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:54:cafe::70) by DB6PR0301CA0061.outlook.office365.com
 (2603:10a6:4:54::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17 via Frontend
 Transport; Thu, 27 Jan 2022 07:50:55 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT037.mail.protection.outlook.com (10.152.20.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Thu, 27 Jan 2022 07:50:55 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 27 Jan
 2022 07:50:36 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.20; Thu, 27
 Jan 2022 07:50:35 +0000
Received: from penny.shanghai.arm.com (10.169.188.91) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Thu, 27 Jan 2022 07:50:34 +0000
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
X-Inumbo-ID: e4da8ad7-7f45-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJ6pNGZyTQYLxJKZGBnj9F34C5RzJhd0CRvAgb1BVyU=;
 b=PA/rvwGNZkNJApPB68L21Y4sL3jX0/KuSSVoDUTgbaWhmaQKkzJnfIrzVsKauWgXkbq7s8MgllCaxNf8Q37ZgOgFtYQonIMA7/kHY6l7fGxb96C2/PXXZ2WUO1zfv8qY0jlTxiV0kInqYE0XWWsCSmuLu/1pNoM1d+5yvc3S5F8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: fc1e44a9ecbac685
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hZ0kQAYF8QlByHFRDLkIv/rOVPvCSuxvNyHmpIftqL+NYEzeg8DsWCmaaHeWa+ZZczlSJl5ddPVI93gXs6qm7wsVf1g5Nay/a8dPu30txIwtY4a+hK6RXwMByY4FM41f54+jhRsOIgFROw4ySH7VLSRrr7TnRzG7Mh3evNeb0ajIlrew99Afy4rtSuTeVdIRKN5n90UyZ1qyycTurR8WmUxiKPUdLXTl49+9NOFHx/Uyr1wIagyNT5L8gJyUmeBABT7bNVxQzNSTlIU8x7nO5h1kV/CQ1KDe+KHLs2s2D4npZGrOhsvYy4keENGQ6WKOBs3ZuPJjZlYn+ZWG9fQNtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HJ6pNGZyTQYLxJKZGBnj9F34C5RzJhd0CRvAgb1BVyU=;
 b=c6kfX5lOsUezfWWxOjN0zr9a6gYy1bGRUbu2gplxppcNaVmlw8YsKHQmm6LLOB5I60p7NXCMOtrNBh2UUwzrZk2A7yRnC3VD5cbrj0pRa531kwqCHvmh86p+xV2CUch56AQIcuYaTSm+/RB4K+QH9P9jRoBFamICiMHOEnPAAXbR2Z4WkEl6za1KGQKll3T/8JAAMImgapLWZmQxfaA+YFc6SQfxvfhs7kcQY7K0RrHmYrxUn77pFxV21Mo0hkHljyrTt0u27+CBeEG1rTd0PEJm0MUj9GwvqmdwVyOxbW1SJ+Z7bdU58yhBoIXVQ1B3lRsAYVFIm8bWSXPIrqkQng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJ6pNGZyTQYLxJKZGBnj9F34C5RzJhd0CRvAgb1BVyU=;
 b=PA/rvwGNZkNJApPB68L21Y4sL3jX0/KuSSVoDUTgbaWhmaQKkzJnfIrzVsKauWgXkbq7s8MgllCaxNf8Q37ZgOgFtYQonIMA7/kHY6l7fGxb96C2/PXXZ2WUO1zfv8qY0jlTxiV0kInqYE0XWWsCSmuLu/1pNoM1d+5yvc3S5F8=
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
Subject: [PATCH v5 05/11] xen/arm: introduce direct-map for domUs
Date: Thu, 27 Jan 2022 07:49:23 +0000
Message-ID: <20220127074929.502885-6-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220127074929.502885-1-penny.zheng@arm.com>
References: <20220127074929.502885-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 0fef3adb-fa6b-471d-0603-08d9e169c84f
X-MS-TrafficTypeDiagnostic:
	DBAPR08MB5847:EE_|VE1EUR03FT019:EE_|AM9PR08MB7101:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB7101971CA34E36ABE627096CF7219@AM9PR08MB7101.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;OLM:1332;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 YIGTyZ10pbiRE2SCuJzGy3xYDA9n7WdEcB0TtjwG7ipnpOcgthhCWudKsY1nortkoiQ2I5048UpHQ7o6vSm7w50u2/1NT7snwA4eiRShUX31jPOy/dJcMphwoK4q1Ff2s8VydD+xR2mPL5VKNXbpXea1X5IUneF3tXO0Q6PMl7C8ItiKi9k+7RuMEOXV8oZ/dOzrDWTJ4YhC/WOO1dUdBTcdPlUgWPUy3VScX6N08S2SmOT0CE+0s+FWflDRISGNUNTPGOzB2G4V0ohSHbMvy5Ziu2hghTAMyCuqjCzd+JQRy7PqDMBVyKh81ub/T8R0mMi9GxKLzAYjETgHO0ROL63MREcQUbmhfxa40Aw1GkM4JI4doAzAejUN9Qr4Txbfv2zdkdOzAZ7oDT6z6wCyJg+BZSL5eU7wGlZLA6HtTfeN/GD/n14gIHLCh+wxWJn3YiBPODYa1O39/tEq4Dv6onuCkROz9GcnARa+bcJFXMOryW9FiWIsRBzuavXp8aQM3FQQAxu1RMmHnp/0oQ8Fps1fJFzk427pUSaWBLuPkT3oKJ6OBtpM7j8wfEPYPtEKLI1z+WkGlyb+9CnJj6VrnHC5EstWIlkONjRQcnHCFwM1AKRXcude1uIpZK5isg69WmA9XSohpEmW5zZX9DycrN5LDKWUxqwgngv+vgYLqQxIgXnOfqyb4iDh21zxv5S4OyksbVH1MRXEJfqompnVYQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(5660300002)(36860700001)(2616005)(70206006)(70586007)(2906002)(36756003)(508600001)(6666004)(81166007)(44832011)(356005)(7696005)(83380400001)(54906003)(26005)(82310400004)(316002)(40460700003)(336012)(110136005)(8936002)(8676002)(4326008)(1076003)(186003)(47076005)(426003)(86362001)(36900700001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5847
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	27549ade-7b54-4dc7-4f7e-08d9e169bfae
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	72bo7nO9CoeYRE2LFIVw7WCx4vXCqGtN2oGfdu4VZJMe1kblMpN6MsxhobV/OS5EZULpNUJ1gBpfdRx/biATHVAf1yBce1AFDFYXDVYkwPavOIyJe/9T5703j9J4FJMFISy839B+PwdNTRJ21WGHNR0/TzDMurDNIGxgZtABd3nlUGcTfb+gmROHXLZ4gBnk8PDQEDo15uRrHBPobWSBZlsHePAJK8UbpgqpXLMKDN0UlfsGnEXXSZOEY/EuqP5NKm1WWsWSmUqWTJLtx6qssnrH39vyaVX+sFrfgI33dJXExxATwgmp0zOoqU6oONA+bPtwwy+nMDyRLLZbtDDxKTqvOJfUAVP6pPQuJgeCCn5ZFqU7LlijR68Cm3I3qzZwPSx8HpRVpsha0zZGCQgeVyVh5v42vUhA1mUN6aCq+6Sm0jZQ/8yqmmu7g9EYgxoeiUlCmLA7YDxkbBK82/qrtSvoffJpzZZ523Lq5K37KiGfcgjhz5PgrSjrtlMnckIZLP7TlAIL7K3Rc1hXhYf6sE5UeLYpKaObymY825F8ySwF830vP/icLHA4UGAkeeY/2aOf5bhXWeTaqQfhvG8PslCpU67PaJkrgaHdtOHCGvXOLrYfBVP+mnxfyhYuWBdi0GpYYYPEgt4j2uFYQB0T9oL9fIKXPJ0mOfs4srfSyifDVcpsIdTAEt+vkn60ttv4
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(2616005)(26005)(186003)(1076003)(508600001)(86362001)(44832011)(426003)(36860700001)(47076005)(336012)(40460700003)(83380400001)(2906002)(6666004)(7696005)(4326008)(110136005)(81166007)(316002)(82310400004)(8936002)(5660300002)(70206006)(70586007)(8676002)(54906003)(36756003)(20210929001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 07:51:09.7025
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fef3adb-fa6b-471d-0603-08d9e169c84f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB7101

Cases where domU needs direct-map memory map:
  * IOMMU not present in the system.
  * IOMMU disabled if it doesn't cover a specific device and all the guests
are trusted. Thinking a mixed scenario, where a few devices with IOMMU and
a few without, then guest DMA security still could not be totally guaranteed.
So users may want to disable the IOMMU, to at least gain some performance
improvement from IOMMU disabled.
  * IOMMU disabled as a workaround when it doesn't have enough bandwidth.
To be specific, in a few extreme situation, when multiple devices do DMA
concurrently, these requests may exceed IOMMU's transmission capacity.
  * IOMMU disabled when it adds too much latency on DMA. For example,
TLB may be missing in some IOMMU hardware, which may bring latency in DMA
progress, so users may want to disable it in some realtime scenario.
  * Guest OS relies on the host memory layout

This commit introduces a new helper assign_static_memory_11 to allocate
static memory as guest RAM for direct-map domain.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Tested-by: Stefano Stabellini <sstabellini@kernel.org>
---
v2 changes:
- split the common codes into two helpers: parse_static_mem_prop and
acquire_static_memory_bank to deduce complexity.
- introduce a new helper allocate_static_memory_11 for allocating static
memory for direct-map guests
- remove redundant use "bool direct_map", to be replaced by
d_cfg.flags & XEN_DOMCTL_CDF_directmap
- remove panic action since it is fine to assign a non-DMA capable device when
IOMMU and direct-map both off
---
v3 changes:
- doc refinement
- drop the pointless gbank
- add check of the size of nr_banks shall not exceed NR_MEM_BANKS
- add ASSERT_UNREACHABLE to catch any misuse
- add another check of validating flag XEN_DOMCTL_CDF_INTERNAL_directmap only
when CONFIG_STATIC_MEMORY is set.
---
v4 changes:
- comment refinement
- rename function allocate_static_memory_11() to assign_static_memory_11()
to make clear there is actually no allocation done. Instead we are only
mapping pre-defined host regions to pre-defined guest regions.
- remove tot_size to directly substract psize from kinfo->unassigned_mem
- check kinfo->unassigned_mem doesn't underflow or overflow
- remove nested if/else
- refine "panic" info
---
v5 changes:
- fix coding style
---
 xen/arch/arm/domain_build.c | 97 +++++++++++++++++++++++++++++++++++--
 1 file changed, 94 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index e61d2d53ba..ec29bd302c 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -494,8 +494,17 @@ static bool __init append_static_memory_to_bank(struct domain *d,
 {
     int res;
     unsigned int nr_pages = PFN_DOWN(size);
-    /* Infer next GFN. */
-    gfn_t sgfn = gaddr_to_gfn(bank->start + bank->size);
+    gfn_t sgfn;
+
+    /*
+     * For direct-mapped domain, the GFN match the MFN.
+     * Otherwise, this is inferred on what has already been allocated
+     * in the bank.
+     */
+    if ( !is_domain_direct_mapped(d) )
+        sgfn = gaddr_to_gfn(bank->start + bank->size);
+    else
+        sgfn = gaddr_to_gfn(mfn_to_maddr(smfn));
 
     res = guest_physmap_add_pages(d, sgfn, smfn, nr_pages);
     if ( res )
@@ -668,12 +677,92 @@ static void __init allocate_static_memory(struct domain *d,
  fail:
     panic("Failed to allocate requested static memory for domain %pd.", d);
 }
+
+/*
+ * Allocate static memory as RAM for one specific domain d.
+ * The static memory will be directly mapped in the guest(Guest Physical
+ * Address == Physical Address).
+ */
+static void __init assign_static_memory_11(struct domain *d,
+                                           struct kernel_info *kinfo,
+                                           const struct dt_device_node *node)
+{
+    u32 addr_cells, size_cells, reg_cells;
+    unsigned int nr_banks, bank = 0;
+    const __be32 *cell;
+    paddr_t pbase, psize;
+    mfn_t smfn;
+    int length;
+
+    if ( parse_static_mem_prop(node, &addr_cells, &size_cells, &length, &cell) )
+    {
+        printk(XENLOG_ERR
+               "%pd: failed to parse \"xen,static-mem\" property.\n", d);
+        goto fail;
+    }
+    reg_cells = addr_cells + size_cells;
+    nr_banks = length / (reg_cells * sizeof(u32));
+
+    if ( nr_banks > NR_MEM_BANKS )
+    {
+        printk(XENLOG_ERR
+               "%pd: exceed max number of supported guest memory banks.\n", d);
+        goto fail;
+    }
+
+    for ( ; bank < nr_banks; bank++ )
+    {
+        smfn = acquire_static_memory_bank(d, &cell, addr_cells, size_cells,
+                                          &pbase, &psize);
+        if ( mfn_eq(smfn, INVALID_MFN) )
+            goto fail;
+
+        printk(XENLOG_INFO "%pd: STATIC BANK[%u] %#"PRIpaddr"-%#"PRIpaddr"\n",
+               d, bank, pbase, pbase + psize);
+
+        /* One guest memory bank is matched with one physical memory bank. */
+        kinfo->mem.bank[bank].start = pbase;
+        if ( !append_static_memory_to_bank(d, &kinfo->mem.bank[bank],
+                                           smfn, psize) )
+            goto fail;
+
+        kinfo->unassigned_mem -= psize;
+    }
+
+    kinfo->mem.nr_banks = nr_banks;
+
+    /*
+     * The property 'memory' should match the amount of memory given to
+     * the guest.
+     * Currently, it is only possible to either acquire static memory or
+     * let Xen allocate. *Mixing* is not supported.
+     */
+    if ( kinfo->unassigned_mem != 0 )
+    {
+        printk(XENLOG_ERR
+               "Size of \"memory\" property doesn't match up with the sum-up of \"xen,static-mem\".\n");
+        goto fail;
+    }
+
+    return;
+
+ fail:
+    panic("Failed to assign requested static memory for direct-map domain %pd.",
+          d);
+}
 #else
 static void __init allocate_static_memory(struct domain *d,
                                           struct kernel_info *kinfo,
                                           const struct dt_device_node *node)
 {
 }
+
+static void __init assign_static_memory_11(struct domain *d,
+                                           struct kernel_info *kinfo,
+                                           const struct dt_device_node *node)
+{
+    ASSERT_UNREACHABLE();
+}
 #endif
 
 /*
@@ -3023,8 +3112,10 @@ static int __init construct_domU(struct domain *d,
 #endif
     if ( !dt_find_property(node, "xen,static-mem", NULL) )
         allocate_memory(d, &kinfo);
-    else
+    else if ( !is_domain_direct_mapped(d) )
         allocate_static_memory(d, &kinfo, node);
+    else
+        assign_static_memory_11(d, &kinfo, node);
 
     rc = prepare_dtb_domU(d, &kinfo);
     if ( rc < 0 )
-- 
2.25.1


