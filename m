Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F2D6E2A56
	for <lists+xen-devel@lfdr.de>; Fri, 14 Apr 2023 20:58:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521214.809644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnOcF-0001gH-F8; Fri, 14 Apr 2023 18:57:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521214.809644; Fri, 14 Apr 2023 18:57:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnOcF-0001eB-C6; Fri, 14 Apr 2023 18:57:47 +0000
Received: by outflank-mailman (input) for mailman id 521214;
 Fri, 14 Apr 2023 18:57:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OWbr=AF=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1pnOcD-0001O1-SR
 for xen-devel@lists.xenproject.org; Fri, 14 Apr 2023 18:57:45 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20601.outbound.protection.outlook.com
 [2a01:111:f400:fe59::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d0f641f-daf6-11ed-b21e-6b7b168915f2;
 Fri, 14 Apr 2023 20:57:45 +0200 (CEST)
Received: from CYZPR17CA0005.namprd17.prod.outlook.com (2603:10b6:930:8c::21)
 by SA1PR12MB8599.namprd12.prod.outlook.com (2603:10b6:806:254::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.28; Fri, 14 Apr
 2023 18:57:42 +0000
Received: from CY4PEPF0000C977.namprd02.prod.outlook.com
 (2603:10b6:930:8c:cafe::5) by CYZPR17CA0005.outlook.office365.com
 (2603:10b6:930:8c::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.36 via Frontend
 Transport; Fri, 14 Apr 2023 18:57:42 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000C977.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.27 via Frontend Transport; Fri, 14 Apr 2023 18:57:41 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 14 Apr
 2023 13:57:40 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 14 Apr 2023 13:57:39 -0500
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
X-Inumbo-ID: 3d0f641f-daf6-11ed-b21e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZVHNIhQawx2IMLPEDwhhvyQ0AskgqeAeqibmTkNk0c73CcLlidKXboAqFzuqLznrR4S6rD0D11mXho7iarj6vuSLsQhq9QAfwW0PjzJD6RO3Y3P9MQIRtAY3R6CwmXXtS0ybmAdUilByhfQOsDebq6YxwiCCObFXAqBH5A7hpVLsq2HFZEIUqvs04DvAwmiyHszIh/CyAnjcElHtdf8swOmdfaFKBM1I+V83Lgz/p22QY5GRhHKf6GvdXpzNDkiJpVb/iEb4CLoeb+fi08MPvhigVDe4NhXt9thD+DI7CmLaOQLiLzfK4NWBZDUzfLA6tqwo2yPG0wPJqT4Jz6l4eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z33OHiDZlWIHfUqu2WZ+dteJoaqpdcUN2xGgnP65iNE=;
 b=A3mE3zhgQQMTKZGlbzpiW3sBgba8XcUINhrq7m92V9Fvm+vTk0YrqswIrPi46ARpnEccJP8jIf2FGj/Qe2CEuVb92hyYD25GykGld5t1IREpXCS+AF7Yz86/tRmU89+LeltefTYNlU4E/JaPK7WRL3dFkDTvPbw4kQ5HICgydxOmSwGPV2Duhbffk8uybx5H1HIuNzK6EpI4SLgE1DXYtg2+wHisFd2cmCspWiAn/6qpJwj0XwgrWd8NYD3osLpWOpzDyDttMsbHMzTAeIFUksUISCc0vLmdXGO9WAXy0rANna9CRYDK3MJBwITEU2Jt7wOIQ8FJKTTXqMLZb0EX0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z33OHiDZlWIHfUqu2WZ+dteJoaqpdcUN2xGgnP65iNE=;
 b=kJD5WWKbFY8zyBHg9v8QvIhNtbyngzYa/AZOTwccVLfv3rBFrloYesqyh8e/99Oe7YPAU3Bld8/t3jsX/bLT8ZlJWI92xZuYfN/eIx4L6DJBqBWQBuwV73tcgYNQZ2BKKIg+P5/3KUO08Dahkz/qe2OqgH//Dgbm+upD0URVCiM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 1/3] xen/arm: mark __guest_cmpxchg always_inline
Date: Fri, 14 Apr 2023 14:57:12 -0400
Message-ID: <20230414185714.292881-2-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230414185714.292881-1-stewart.hildebrand@amd.com>
References: <20230414185714.292881-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C977:EE_|SA1PR12MB8599:EE_
X-MS-Office365-Filtering-Correlation-Id: 8598bab1-0dbd-4004-299e-08db3d1a1fca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wA+Jg7uRF9g5PnFKZUnpgcCiILrMoIUHeTMMQCkSlKSHyW9lhOwsiLwAtOekh4nzTNKKCqGEqvoHfXv65CdFXG6yx14/rmuI7QPvpEIqSgh2+My53Z2MogVu+49VHJx05bxf2faVlevcUbqOgCz1Xzgu2937PWfDWisOtKVeWCabiCrwKgSFrTyn/Ja4gpc6QFODy8qiEBFVhL2EF5khFrLvv2cBjRbSxgLOqhEosM/ekNhhNpP8UAoQ9HowE4AXZ1fo08n9y2/dFYtCfK3+E59zDcT2hDZ1pzAfjDCjHqUUJUHdTXQK6B92Ue5YnDJyNFQOu+jZRO/NSmIAJEEWgKRSCWnHNxKNwMMvDednyfZDr8v2VgjUD+qWd1mtNQ1gTthiRWpzHKE2BfG9u6BrfypnSaUGXflxnyntOOKvBmjBmJB2jVQ5YO1O39tB5h7MDQ/HV1J1s+/T1ge6cMxRLy2MRaN/OtkuWLerdyZkod0dzoWlh+MulvKCuA8R7D86UkTZbA/rj7gUrXZEIhMJUiXeMbUzoKcjDFun6z7me6Ea7adaHNXNcNqwj/p0cxNh0da7RzDQ7MAb289Fu4aKPXLQaoNCaKluudpWY1RujglJHthcByiJLry/b/hNmy7Kl0RqvLtuqC93ZLkq2+htPqbvTgnNdhofWFmwQDkGut+8sfQqhushKpfSOhcXR0a5ZRIJgK/wFBgEmGioMOKCZgqd4DmgBkQU+sLZOKyyddg=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(136003)(39860400002)(396003)(451199021)(46966006)(40470700004)(36840700001)(2906002)(70206006)(70586007)(426003)(336012)(82310400005)(5660300002)(44832011)(36756003)(8676002)(40460700003)(8936002)(41300700001)(316002)(6916009)(4326008)(40480700001)(478600001)(54906003)(6666004)(26005)(81166007)(82740400003)(2616005)(1076003)(83380400001)(356005)(47076005)(36860700001)(86362001)(186003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 18:57:41.3749
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8598bab1-0dbd-4004-299e-08db3d1a1fca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000C977.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8599

When building the hypervisor with -Og, we run into a __bad_cmpxchg link error:

aarch64-none-linux-gnu-ld: prelink.o: in function `__int_cmpxchg':
.../xen/./arch/arm/include/asm/arm64/cmpxchg.h:117: undefined reference to `__bad_cmpxchg'
aarch64-none-linux-gnu-ld: .../xen/./arch/arm/include/asm/arm64/cmpxchg.h:117: undefined reference to `__bad_cmpxchg'
aarch64-none-linux-gnu-ld: ./.xen-syms.0: hidden symbol `__bad_cmpxchg' isn't defined
aarch64-none-linux-gnu-ld: final link failed: bad value

This is due to the function __guest_cmpxchg not being inlined in the -Og build
with gcc 12. Fix this by marking __guest_cmpxchg always_inline.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com
---
I considered also changing "guest_cmpxchg64" just below in the same file to
always_inline, but I decided not to because this function does not take a size
parameter.
---
 xen/arch/arm/include/asm/guest_atomics.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/include/asm/guest_atomics.h b/xen/arch/arm/include/asm/guest_atomics.h
index 9e2e96d4ff72..a1745f8613f6 100644
--- a/xen/arch/arm/include/asm/guest_atomics.h
+++ b/xen/arch/arm/include/asm/guest_atomics.h
@@ -86,11 +86,11 @@ static inline void guest_clear_mask16(struct domain *d, uint16_t mask,
     domain_unpause(d);
 }
 
-static inline unsigned long __guest_cmpxchg(struct domain *d,
-                                            volatile void *ptr,
-                                            unsigned long old,
-                                            unsigned long new,
-                                            unsigned int size)
+static always_inline unsigned long __guest_cmpxchg(struct domain *d,
+                                                   volatile void *ptr,
+                                                   unsigned long old,
+                                                   unsigned long new,
+                                                   unsigned int size)
 {
     unsigned long oldval = old;
 
-- 
2.40.0


