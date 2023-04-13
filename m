Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E77746E13A4
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 19:38:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520867.808969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pn0u0-0003QH-ER; Thu, 13 Apr 2023 17:38:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520867.808969; Thu, 13 Apr 2023 17:38:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pn0u0-0003OH-9t; Thu, 13 Apr 2023 17:38:32 +0000
Received: by outflank-mailman (input) for mailman id 520867;
 Thu, 13 Apr 2023 17:38:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2GAK=AE=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pn0tx-0000rf-Vv
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 17:38:29 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20624.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff2291d1-da21-11ed-8611-37d641c3527e;
 Thu, 13 Apr 2023 19:38:28 +0200 (CEST)
Received: from BN9P223CA0023.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::28)
 by SJ1PR12MB6099.namprd12.prod.outlook.com (2603:10b6:a03:45e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 17:38:22 +0000
Received: from BN8NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10b:cafe::f6) by BN9P223CA0023.outlook.office365.com
 (2603:10b6:408:10b::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.32 via Frontend
 Transport; Thu, 13 Apr 2023 17:38:21 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT010.mail.protection.outlook.com (10.13.177.53) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.33 via Frontend Transport; Thu, 13 Apr 2023 17:38:21 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 13 Apr
 2023 12:38:21 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 13 Apr
 2023 10:38:20 -0700
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 13 Apr 2023 12:38:19 -0500
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
X-Inumbo-ID: ff2291d1-da21-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dTAkMA4qWNy5q7AncRiVsRwX/Y3Qu1od1qromFsPaqgUv5cMHBc/oHTNDRERP0biw+4lHXWPY+7AiVKVkQA73Xo7U3Omyi3Uwl7uhTw7xhJnjPB2vxSoZjoF0YFHFeOhRu4comZXNnVqjB/MbMV0dN+qd6rwz6TPPfl5/Zja/v86vfKiP8tfx1Dgyq7FfGB6AG/mbRKZ2BZlZGLSeplLhB6rU/tVx8MDE9yB0uMpNfSGLlmmA5fMjo0fpdnAY7uEsHu5TlR4hGVIlESCPPDgvq4mKdQFEhRkHeFOSjwEGxIUh3PGCmwpzLKTwTfgY97BTItfnRu++mAM6BLuHtFQug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eTQJ7lPK89ZtnWjeWUiqYAA5GuUNieXG2h1mgdQDvYw=;
 b=QdMKqOmqqWuZ2g7ks9ZCSbK/joHEmJncSmxizfVXTyzdpihHkosinviFCrHKgdR/1fRYDum+U/PJEyS5bjhYxa0tmET0UEC0lpNLbIqOStHCh3x7q4nMezJi8GEbRBKO2KJpnNZ2SGY4MIYSeFGo7YlRS2QCzOkH3Cdvy/S8jd27MqfD4JB3mj2oVhX9Pj7WFAesd0KUcXTngISzxLgPX6PqU0WQm2b8ufMttTneawb3e1PSfcSeDpw0/lr8cvzvW1OfDoymZni4ORPOlaC4eihVkCqVUXS0TxTTRv0hp83VO6NmWCKWeopsztvoAjRFNup2x3M5bQZZV+DZO1ACtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eTQJ7lPK89ZtnWjeWUiqYAA5GuUNieXG2h1mgdQDvYw=;
 b=vqHOMzgyq886Y1jjUWpFN3KHM7/VP2C/5TVEbTt7HIDsj1blMl6FsHRWmcY7uwKJgyQxybq33DTw6wQHhf0jWbKMg4F7RNFcCW4VA3DAjBpweHUm3LU0EXwWQQB8rVt6c4wamMgwyePtSc3AcUfHNfxCPU4Mk5EFoaHlXmHnkpA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <rahul.singh@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v5 06/10] xen/arm: guest_walk: LPAE specific bits should be enclosed within "ifndef CONFIG_PHYS_ADDR_T_32"
Date: Thu, 13 Apr 2023 18:37:31 +0100
Message-ID: <20230413173735.48387-7-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230413173735.48387-1-ayan.kumar.halder@amd.com>
References: <20230413173735.48387-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT010:EE_|SJ1PR12MB6099:EE_
X-MS-Office365-Filtering-Correlation-Id: edeceec4-7f4a-4f4c-54cd-08db3c45e046
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sXZ/mepfmmEommLgduBj8X7Rq+imLHEjXk+9t4ECL+FTnjEuN+QMWM6tIw/KJSdVxiVaH9iz9H8QLzLNJ1hc5Ew0BHnEdMt02fgRbMtXlc3FHjbfEztZI3tO3W0IHAer+0/FYY/pBSTqpHwnoWgGt/hC8oedIFI4uwajR4lXnbdfyrQC7bxbqCRH1VYj5reynX1eq1M8FiLn9WVhgzWM3PxO6YUpR0HL4TAZWeMZqnj216Wcx8V057HKAAyGkZToye+aM8unSp7cXXPUciCjNsXa017GJkerITYGEabvzfR7FWx2jnS/MCCzXwgmSaXOIGjTOKC5c301zP9zyxbdlaArNC+nANVkhwuH3RfXDCTgA0QtT3+P7zT0P6wHVFV6QI2r+HndtUG59NZ6pIxCe9H3cPBoso5kg1lcmqFxx+BX/+5g4CM3JYi6G6PypipuFt8n6Zm1Pl8oXxfKoAo8lRkHi3DTHD9P5TfmRkSBn2Lui1VO755SbPYbXLsLF1hd1Yo6l4VrpfQ4ky81Rqnfn9xlDEDUWgo/GFuBkLUBXmIQXZlmNkas9GNAZuXPBBaVuaT5DX6EBD6+xeiFf/8+q8CfIjYNyUlqw3O4U/1813Jvwy7BeLhjoGMD7Vszts2w2D9bfNz+abQWfCisudshRLDCW4ck7DL+AoAldQ23W16DOMTzCJaRh+ZWYLaugFSU5aY7JXSmxVONbaNpnFl8iAgUXy/LClDLNQplxxQz7wQ=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(376002)(39860400002)(346002)(451199021)(36840700001)(40470700004)(46966006)(316002)(6916009)(4326008)(82740400003)(70206006)(70586007)(2616005)(47076005)(426003)(336012)(5660300002)(41300700001)(82310400005)(6666004)(36756003)(86362001)(40460700003)(54906003)(40480700001)(26005)(186003)(1076003)(103116003)(2906002)(83380400001)(7416002)(8676002)(8936002)(36860700001)(478600001)(356005)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 17:38:21.5704
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: edeceec4-7f4a-4f4c-54cd-08db3c45e046
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6099

As the previous patch introduces CONFIG_PHYS_ADDR_T_32 to support 32 bit
physical addresses, the code specific to "Large Physical Address Extension"
(ie LPAE) should be enclosed within "ifndef CONFIG_PHYS_ADDR_T_32".

Refer xen/arch/arm/include/asm/short-desc.h, "short_desc_l1_supersec_t"
unsigned int extbase1:4;    /* Extended base address, PA[35:32] */
unsigned int extbase2:4;    /* Extended base address, PA[39:36] */

Thus, extbase1 and extbase2 are not valid when 32 bit physical addresses
are supported.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes from -
v1 - 1. Extracted from "[XEN v1 8/9] xen/arm: Other adaptations required to support 32bit paddr".

v2 - 1. Reordered this patch so that it appears after CONFIG_ARM_PA_32 is
introduced (in 6/9).

v3 - 1. Updated the commit message.
2. Added Ack.

v4 - 1. No changes.

 xen/arch/arm/guest_walk.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/arm/guest_walk.c b/xen/arch/arm/guest_walk.c
index 43d3215304..c80a0ce55b 100644
--- a/xen/arch/arm/guest_walk.c
+++ b/xen/arch/arm/guest_walk.c
@@ -154,8 +154,10 @@ static bool guest_walk_sd(const struct vcpu *v,
             mask = (1ULL << L1DESC_SUPERSECTION_SHIFT) - 1;
             *ipa = gva & mask;
             *ipa |= (paddr_t)(pte.supersec.base) << L1DESC_SUPERSECTION_SHIFT;
+#ifndef CONFIG_PHYS_ADDR_T_32
             *ipa |= (paddr_t)(pte.supersec.extbase1) << L1DESC_SUPERSECTION_EXT_BASE1_SHIFT;
             *ipa |= (paddr_t)(pte.supersec.extbase2) << L1DESC_SUPERSECTION_EXT_BASE2_SHIFT;
+#endif /* CONFIG_PHYS_ADDR_T_32 */
         }
 
         /* Set permissions so that the caller can check the flags by herself. */
-- 
2.17.1


