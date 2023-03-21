Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE9F6C33AB
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 15:05:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512686.792831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peccT-0000bO-W1; Tue, 21 Mar 2023 14:05:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512686.792831; Tue, 21 Mar 2023 14:05:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peccT-0000YU-QS; Tue, 21 Mar 2023 14:05:45 +0000
Received: by outflank-mailman (input) for mailman id 512686;
 Tue, 21 Mar 2023 14:05:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CsWt=7N=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1peccS-0006ai-7i
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 14:05:44 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062c.outbound.protection.outlook.com
 [2a01:111:f400:7eab::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76b3d2ff-c7f1-11ed-b464-930f4c7d94ae;
 Tue, 21 Mar 2023 15:05:42 +0100 (CET)
Received: from BN9PR03CA0749.namprd03.prod.outlook.com (2603:10b6:408:110::34)
 by DS7PR12MB6144.namprd12.prod.outlook.com (2603:10b6:8:98::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.37; Tue, 21 Mar 2023 14:05:38 +0000
Received: from BN8NAM11FT076.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:110:cafe::19) by BN9PR03CA0749.outlook.office365.com
 (2603:10b6:408:110::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37 via Frontend
 Transport; Tue, 21 Mar 2023 14:05:38 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT076.mail.protection.outlook.com (10.13.176.174) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6222.16 via Frontend Transport; Tue, 21 Mar 2023 14:05:38 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 21 Mar
 2023 09:05:37 -0500
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Tue, 21 Mar 2023 09:05:36 -0500
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
X-Inumbo-ID: 76b3d2ff-c7f1-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hpIGEp87UMZy/0S4wlZ8kVStTNu4ahW5pBJGxhCvLwpf5wXdLlmW0nVsBhEPnO2lNrgf1hsaRhnKqT6Pkz1CeA/Mjrg2TKB7WZM2EbJYxN7Dui8e94zb5uuMiI6LbgGsOFed4hIg4b8mbQDp1R5p6BvsolYVart4+js0K8hsERiETn7YOTZ+h01Bxt3bwojvnRpjNBcZNxHrLveM7i0/RYAZbA6fNoe156jWMvtv7ZoclqTXc7/cYtedQzyxzDZLjQ18le4fZuA9GIE7JeXzGNigNZdgkB4n9oHRn6iFMVyS/v8WA1Dvm/edaEh6SNEUzijvqwvGmwGwt4PeVGIidQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Gza/rKHn3LPp6u594sFCTvWeeH53eu8mXZJgsCI0aY=;
 b=f+kuTK6bQoWNtPga0XbKr9uhobwRbA5PyVdbXUSgPx3s1sWYOVO9d390s3UXa7yp2nBnbu042FC4w7iw//yck02pN3bp/7m1f4uGP/dw8Uy4o6VvL9SChT4gw65nj5lq/JkWf58GL6M508le8L6M/E/B1BuqcUur10SDw76hkNKzVpCLOTImJtIgi4mJn9nY9LSmMFO6enVcw+ikFPPiTKRb/tFse/9e9lYoZCbkA5sYVSiWDfNsIuebleGOCIYvNSPwJjoVbt8+jwMVAnAkiaYx2QcYmM6jgXTl7YJ/q2l0Kq2mgUB5kSVoe5kul8YF+Td1PM5PRHbC/OhYJ1Rgaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Gza/rKHn3LPp6u594sFCTvWeeH53eu8mXZJgsCI0aY=;
 b=m6qzY3J2d7Nwz1sotbeQS6pRgHSavsjMALGb9iA9wrWD/TjUEkKAgbbjxxxeC9a19lMbTFN/h4nFGOnTo5w0w6Ov5enxJMtUQKLd0SmXYob3NMuanz/55SDvVAV5L1AA0E7i8CQuVPv3qgTVAOROq+iCrresDbBlkkYILU/BSg0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <rahul.singh@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v4 11/11] xen/arm: p2m: Enable support for 32bit IPA for ARM_32
Date: Tue, 21 Mar 2023 14:03:57 +0000
Message-ID: <20230321140357.24094-12-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230321140357.24094-1-ayan.kumar.halder@amd.com>
References: <20230321140357.24094-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT076:EE_|DS7PR12MB6144:EE_
X-MS-Office365-Filtering-Correlation-Id: 6928ca25-aba4-4dda-565d-08db2a155954
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/L9Mp41VgxEyTa6nySoFqhOa1yKn+2tXdcaVHLhkW+3YO6U7UuEBCmMZ9G57SSEOZS8ikGMdGauCHLMgX1ePdJXtA875x+xK1O/dDdqrTDsafYeOX0T8CpgIUSA3aeGwsaTm/S2j9ipJegi76117pDD40fFUMone2woRcGHZQu0alJ0sG24FtzRiv/we1bnDaMTXvsLg+yo6POtCuUiKV7ZYCULIDXIoTU3WqNKce1u5KDjdHOeaRyJVwfQEBqM8kzPaAABZGrNSGnAwHZvkinZjKIBqF62SFkjQ1cHUeDDQbntNhU4lTS7VBNTU+9g19yWl4jZd8Q/Hze67250T7KDxVjOj7QSMcerv+RnFVSwuFpBAQCmAHmAF7mWG12LmUpUtWRvVJ3UJCeLlWKsQjYHO2MPVv3ZcDRMyVx9tyhVbk779cPD0AT50RbEQfciSeuWw4/6f1xt4JvHYK55xqRVYCpaJCMrYFBRSSPX68xdMDOycgavFubIzs9StJVKyB27j4aiiO+d8khpG884EHhD1b7v1kj8Bp4SIfOc3aGJsdTRvOOFZeGMQ0IrO1+3hj8yt/ojk7eKaRmvDwB31iq33K7WnGjD4i6Fn7sJy1900aN2GR5ERSiSn4oW+loVXDzA/0ivGsVaXmhoK5IOwXRvQCF9ggmMXWpcvYsbf4teSK85FmCeCXaL2bwr1GGYD2gwJDMvCQ8kGvdwWcsRyCIGZcElcStxPil5zqyq7E9I=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(346002)(39860400002)(136003)(396003)(376002)(451199018)(36840700001)(46966006)(40470700004)(47076005)(103116003)(356005)(1076003)(82310400005)(336012)(26005)(7416002)(6666004)(478600001)(316002)(54906003)(2616005)(426003)(186003)(83380400001)(86362001)(5660300002)(8676002)(4326008)(6916009)(70586007)(70206006)(40480700001)(41300700001)(36860700001)(8936002)(40460700003)(4744005)(36756003)(82740400003)(81166007)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 14:05:38.4123
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6928ca25-aba4-4dda-565d-08db2a155954
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT076.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6144

The pabits, t0sz, root_order and sl0 values are the same as those for
ARM_64.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---

Changes from -

v1 - New patch.

v2 - 1. Added Ack.

v3 - 1. Dropped Ack. 
2. Rebased the patch based on the previous change.

 xen/arch/arm/p2m.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index f34b6e6f11..20beecc6e8 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -2272,8 +2272,9 @@ void __init setup_virt_paging(void)
         unsigned int sl0;    /* Desired SL0, maximum in comment */
     } pa_range_info[] __initconst = {
 #ifdef CONFIG_ARM_32
-        [0] = { 40,      24/*24*/,  1,          1 },
-        [1] = { 0 } /* Invalid */
+        [0] = { 32,      32/*32*/,  0,          1 },
+        [1] = { 40,      24/*24*/,  1,          1 },
+        [2] = { 0 } /* Invalid */
 #else
         /* T0SZ minimum and SL0 maximum from ARM DDI 0487H.a Table D5-6 */
         /*      PA size, t0sz(min), root-order, sl0(max) */
-- 
2.17.1


