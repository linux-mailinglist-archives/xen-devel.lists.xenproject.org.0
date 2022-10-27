Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A519F610125
	for <lists+xen-devel@lfdr.de>; Thu, 27 Oct 2022 21:10:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.431180.683858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oo8Fz-0003tp-1I; Thu, 27 Oct 2022 19:09:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 431180.683858; Thu, 27 Oct 2022 19:09:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oo8Fy-0003rO-Tu; Thu, 27 Oct 2022 19:09:34 +0000
Received: by outflank-mailman (input) for mailman id 431180;
 Thu, 27 Oct 2022 19:09:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9cef=24=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1oo8Fx-0003qz-8d
 for xen-devel@lists.xenproject.org; Thu, 27 Oct 2022 19:09:33 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2045.outbound.protection.outlook.com [40.107.223.45])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2a7f436-562a-11ed-91b5-6bf2151ebd3b;
 Thu, 27 Oct 2022 21:09:32 +0200 (CEST)
Received: from DS7PR03CA0275.namprd03.prod.outlook.com (2603:10b6:5:3ad::10)
 by SA0PR12MB4511.namprd12.prod.outlook.com (2603:10b6:806:95::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Thu, 27 Oct
 2022 19:09:27 +0000
Received: from DM6NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3ad:cafe::e3) by DS7PR03CA0275.outlook.office365.com
 (2603:10b6:5:3ad::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28 via Frontend
 Transport; Thu, 27 Oct 2022 19:09:27 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT057.mail.protection.outlook.com (10.13.172.252) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5769.14 via Frontend Transport; Thu, 27 Oct 2022 19:09:27 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 27 Oct
 2022 14:09:26 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 27 Oct
 2022 14:09:26 -0500
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31
 via Frontend Transport; Thu, 27 Oct 2022 14:09:24 -0500
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
X-Inumbo-ID: e2a7f436-562a-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n2xfodyO+wMwjJB7nN+HGe/r7IiBJsouSPAliaPZTRz+qJ++Zy6qhdFW2ANt/YsBFunEo127hO+bTLAbGVq2m/pHypB08al36qDcLO4n2Kmnv8EuGGWcS5v2sKpNcbBEHVJchMdO/WNDHVAfB3grTL5voshXPCoDWBXB6XeIOgnXy0yciwC7Bg3e8raBOLysseB6zE9/xVPmFej15iM6Ieq4PkxkicSOzsV8O1QE2O8uZegKACx+MrNQpUylREa+qv0VUVt3W11erPGdZARkYTwqIbvsfQLl5Ldiv3Q2wmDjUU02Kh7sADsXVwZrcwpUOE3Cjwhu64VtUtJcxibHiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8FeIMOJGH/45YEpzVXFBG3/d4t87OUAvpO4VLLRjPlc=;
 b=O3Q3VilCj6s+4hJ1o7ZzfSg+4XLYshJ4Q1lYMfPUjjvUhFtohZlDYSDozoZ6d/QVXGQVjy20aasEHGAdffsvFL8jYmChYKYuptVrET8CeeSGejSYKAePj4zJfWV78iffMotX0P7jxqcwciqa7CZ5kxJ+Hvk8spF/homnevfZnGsw3d4UpvJcrSNF+R5D3l6W3S3XsxLK8YYn43y9KYhBbzvWlw/9ccoLVWFRBTedW1nMmdWChXh23P/HA41eSOBwTWpm+FxrM95/N0Xw/sNuNY+j/x7XWDnaZgp1gGZmKQCNlhKgiaMt3eTOuz+3fWtE2ZLktZUerprhl5k1IHX3Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8FeIMOJGH/45YEpzVXFBG3/d4t87OUAvpO4VLLRjPlc=;
 b=gKcNrA25kQGxHe/elDshg2Z6J+yweYrMdUjlNIEuj7yjPRe0E3RaJatDPJ1mFx8EJBYaULMQGDeCS/7aTSwZ5vJkdV+DaMk++04FHGD2BKUBVi0E4pKNN8CvzLQjfY6+2UfOswTYwJY6rR5G9Fb6hhVd7tcE8CRkzTPwa4c5cLI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayankuma@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andre.przywara@arm.com>, <Henry.Wang@arm.com>, Ayan Kumar Halder
	<ayankuma@amd.com>
Subject: [XEN v1] xen/arm: vGICv3: Restore the interrupt state correctly
Date: Thu, 27 Oct 2022 20:09:13 +0100
Message-ID: <20221027190913.65413-1-ayankuma@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT057:EE_|SA0PR12MB4511:EE_
X-MS-Office365-Filtering-Correlation-Id: e8cfef07-e595-47c3-0ee5-08dab84ec499
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8vBnDcoUNChln3F+i1yGeMHR8BjA+lTohT3dh40uBHW5+hIaCQuE2ryvVoAryYS9I+HQrrl92ZUbISavLvOI4HlWiPjcKx71DDKtvobwtXkAS4DalCGPIxBIAsadiWF638XbQeuc/r8/BxWXdkTTkisOt+cVou7nDwNESVmC0WOKCe/two8FHUijXHP6OqMXl6pdv8lsTOsNxsVA2vbqrWDzRdl6xZdiAd5fvn6QL2L4ZWTKwYw2x92jzABLbcrLgvFKlQmoitXqVRMvxST2e4hBR105ksKt9n7WDXk7vj6FS+aylN+AfFIvwp8mGutFomg8lZlGV1nQQj/T/AhzFtQesMpyqYGEyYrZI7pfL1Uhvn+BsFy87ybO9EY42XJXxo1KxQ1/2+pJyiy+zdAHDSyPVhNvy9aFF1V1b+Qlv6D+adyPD1nquT0HTfm76jTjhHuVoUBPJGZzlULt0RrOcwaYAcVWDieY7aG6Qsi67ouHArCVvhzlS7wfLcJTlR/2Xtu44N9FJxXNr20YOYsYI6gOd8A7OLwKfL225XgfntoEbBeH2xEUO4GgFJKq3AoaLWCiZ64DolF+aM4L10Ylb0KrRC1uATIRZY+2OLyBsMimLnQsbWz6b2ULnHYpn4WuL4vd0VQVZUjNHe8WWMO78GJ/phQ9zHvwZDTqycQZ6jeZNg7HkqQtd7rZFC2cjJu9hqibNzN7uoBUpzaJC14epP4NoFhmrvhHEP1DiIhvz1GGjScXLI9fviVfFyYdNeeCowBP5+qOCTVW7zje+bcPmGGaQxiLxm7AtcUFy+cBplGErG+Rn4kKKTHZaDyXAWz+
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(346002)(39860400002)(376002)(451199015)(46966006)(40470700004)(36840700001)(426003)(47076005)(316002)(70586007)(8936002)(356005)(6916009)(54906003)(36756003)(81166007)(82310400005)(40480700001)(82740400003)(70206006)(8676002)(4326008)(26005)(83380400001)(2616005)(40460700003)(4744005)(36860700001)(1076003)(6666004)(336012)(186003)(478600001)(5660300002)(41300700001)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 19:09:27.0890
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8cfef07-e595-47c3-0ee5-08dab84ec499
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT057.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4511

As "spin_lock_irqsave(&v->arch.vgic.lock, flags)" saves the current interrupt
state in "flags", "spin_unlock_irqrestore(&v->arch.vgic.lock, flags)" should be
used to restore the saved interrupt state.

Fixes: fe7fa1332dabd9ce4 ("ARM: vGICv3: handle virtual LPI pending and property tables")
Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
---
 xen/arch/arm/vgic-v3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index d0e265634e..015446be17 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -582,7 +582,7 @@ static int __vgic_v3_rdistr_rd_mmio_write(struct vcpu *v, mmio_info_t *info,
             write_atomic(&v->arch.vgic.rdist_pendbase, reg);
         }
 
-        spin_unlock_irqrestore(&v->arch.vgic.lock, false);
+        spin_unlock_irqrestore(&v->arch.vgic.lock, flags);
 
         return 1;
     }
-- 
2.17.1


