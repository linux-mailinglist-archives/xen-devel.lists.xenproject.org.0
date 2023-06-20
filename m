Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08182737078
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 17:31:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551946.861739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBdJp-0000eO-7b; Tue, 20 Jun 2023 15:30:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551946.861739; Tue, 20 Jun 2023 15:30:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBdJp-0000cS-4R; Tue, 20 Jun 2023 15:30:57 +0000
Received: by outflank-mailman (input) for mailman id 551946;
 Tue, 20 Jun 2023 15:30:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qkNP=CI=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qBdJo-0000bo-Ew
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 15:30:56 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061c.outbound.protection.outlook.com
 [2a01:111:f400:7eab::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70906b89-0f7f-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 17:30:53 +0200 (CEST)
Received: from PH8PR15CA0018.namprd15.prod.outlook.com (2603:10b6:510:2d2::11)
 by MN0PR12MB6001.namprd12.prod.outlook.com (2603:10b6:208:37d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.21; Tue, 20 Jun
 2023 15:30:48 +0000
Received: from SN1PEPF0002529E.namprd05.prod.outlook.com
 (2603:10b6:510:2d2:cafe::a8) by PH8PR15CA0018.outlook.office365.com
 (2603:10b6:510:2d2::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.21 via Frontend
 Transport; Tue, 20 Jun 2023 15:30:48 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002529E.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.27 via Frontend Transport; Tue, 20 Jun 2023 15:30:48 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 20 Jun
 2023 10:30:47 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Tue, 20 Jun 2023 10:30:46 -0500
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
X-Inumbo-ID: 70906b89-0f7f-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jrOe7Zu8Mz4y8cpDQq1xBIjsdFy9YrZcJuCKUcX5/nAjn8jUS5z62NlyCsmSwHssgZd8JiJf7FU+KLo79ZmfpghHq4iMLPRCmGLSHrLkwd/vWJhEzzCn+HYBygU8fBMICZph60sjTnwz4MZ7yTH78+rUmojFl9sh8BIRdw+efEmJ14XUQpxKZyH1sEskdW7DabC6XGG0R08Mv75yx9UA8oYgJzgRpLlErceHNZncTXGVhvnwMiRP7WjB5QAdug6GwNCXUspy8ArCQ008+Vl+f/w4BC2K6jEuDTgypLrVWw/GUebEHoNBKydAUuF8lteRmBVQ2VzOkGj1u0+6FBOSCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eG/NAeIcLSXOojnAynZKH1cfX+YLxTjSKfYEa0GZua8=;
 b=DQiL3LL8zYJW1nUo26nBaxCa3DaOK7a58wJr/uUoRWNX6Xb37QxlI2iooTo4FRFHXwxxdov2YaJtxWVJGuZXjAmQYYwmomo6Pcxkpl9HKK1mqGjCT1EaEvrE0dNTKBtuGtuuSDWT/jAMQt81HGr5egU4BxhBmURSDC5wTmzvFsYhwjOOgUADYy8eyor9A88UYIBlEOqxqq8wm8AG3AQANWjvmi2U1NK7zKACkeTt2SwUVGxUMah8dtMJmG4EsdXYadRU3P5lK+ti8IVnwau6lgx1uuUAlOH8n4SsSShbDrqq/ruwOJbHBQDaeTdshGruR+BeQXlfqibJp+cSdNwGdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eG/NAeIcLSXOojnAynZKH1cfX+YLxTjSKfYEa0GZua8=;
 b=Rc1/RDHvriBFs19jSZ9efUSN1NIqkZCRTAM3gnuh9+opZkBOW1a7iIzDz1lgkMQGuuH1mhhEd2PoficF/7TTftrGIkmygMrEHCnJ6U4HySEZFOm3XL+acQ0jjj+SUGH3MoNRuf+zoGlOyrdG+3lBqwP8mvWbgKQfVQTIbkw74tY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Artem Mygaiev <artem_mygaiev@epam.com>, Rahul Singh <rahul.singh@arm.com>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: [PATCH v1 2/2] xen/arm: Make has_vpci depend on CONFIG_HAS_VPCI
Date: Tue, 20 Jun 2023 11:29:21 -0400
Message-ID: <20230620152924.23622-2-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230620152924.23622-1-stewart.hildebrand@amd.com>
References: <20230620152924.23622-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529E:EE_|MN0PR12MB6001:EE_
X-MS-Office365-Filtering-Correlation-Id: 951a647b-3210-4ca4-ece3-08db71a35297
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dL69yDk0wJF33IAe2G/PrAsR7Y3g7JF9kZG8r6eUuEiZGSQ8hE/bzQ4+huWQyeIIxEOCEqCMZPKhVY5MrZXsGZ+Ty/KRjCMcg61p9Qo1gUurBcJJ0BFCSNx/O9Jmn2HZ8iLqQWtTCaQetjCYG6G3O4ZqDSbkcLe5BJrxBDD8mmYdv7fHgyKZLNrP/M13JdvYMVZ/Kt6UM1lBpfqgwxwSKijmWc4ZdWvCuV7NNwWnQdSR+XRVh1pnnEzXSddVJ2L0mzBb/M8dHMwhqEFDDejMVs1gp4h5lkqdDVdaUsDgOwuHp3qbX99KV92ZRPLsxOxClLsweyjk40FETbP1cRbbEVqRwqHfQVfFvEDWpI1xP0XmzjQhkyAd2eCsquK+dWg2x+EsNuaw6ncXuNK1qEafMRmo/IAnHmX7w1ENCOdpaNbA4J0LYsPeI0YskUMOtyWVmYi4RZMjjrF8tGyj7pVkoYtilknVvKQd5Zi4QDaaT1lpwjknd3+mbg32W/vuSVdAo7gymG/yXHtxEA3BM+/6ujGGGM37sy+0D1AFBJIeYATKacCqkojF8fHvaiaM1s55nclgHKI8i5ubGAZCd4RjxOdehQrSfi1z/NgSBiFtazI+9lipUWah4nmsLIkd4CjDMw0/67x7zXq/vFj8b9dwRzOxM6Uh9PzWCtd3ZM5aEp+ju5r5fNz7Tkw34EgmMspGLHT+LcwDCYLErQyPU8gSF1u9l0qiAWCTqaMBnpr//06MneK5kYk53G/7uXMoDVBdHpm6yQzsEI0NbYG6oFLoDZltrOy9iDqynhhBHWpA9qQ=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(39860400002)(396003)(136003)(451199021)(36840700001)(40470700004)(46966006)(36860700001)(82310400005)(47076005)(966005)(478600001)(6666004)(83380400001)(336012)(54906003)(2616005)(1076003)(426003)(26005)(186003)(2906002)(5660300002)(7416002)(44832011)(40460700003)(36756003)(70206006)(356005)(81166007)(70586007)(82740400003)(40480700001)(4326008)(316002)(8936002)(8676002)(41300700001)(86362001)(6916009)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 15:30:48.1728
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 951a647b-3210-4ca4-ece3-08db71a35297
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6001

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

VPCI is disabled on ARM. Make it depend on CONFIG_HAS_VPCI to test the PCI
passthrough support.

While here, remove the comment on the preceding line.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
There are two downstreams [1] [2] that have independently made a version this
change, each with different Signed-off-by's. I simply picked one at random for
the Author: field, and added both Signed-off-by lines. Please let me know if
there are any objections.

downstream->v1:
* change to IS_ENABLED(CONFIG_HAS_VPCI) instead of hardcoded to true
* remove the comment on the preceding line

[1] https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc/-/commit/27be1729ce8128dbe37275ce7946b2fbd2e5a382
[2] https://github.com/xen-troops/xen/commit/bf12185e6fb2e31db0d8e6ea9ccd8a02abadec17
---
 xen/arch/arm/include/asm/domain.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index 99e798ffff68..6e016b00bae1 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -298,8 +298,7 @@ static inline void arch_vcpu_block(struct vcpu *v) {}
 
 #define arch_vm_assist_valid_mask(d) (1UL << VMASST_TYPE_runstate_update_flag)
 
-/* vPCI is not available on Arm */
-#define has_vpci(d)    ({ (void)(d); false; })
+#define has_vpci(d)    ({ (void)(d); IS_ENABLED(CONFIG_HAS_VPCI); })
 
 struct arch_vcpu_io {
     struct instr_details dabt_instr; /* when the instruction is decoded */
-- 
2.41.0


