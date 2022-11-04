Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7859D619D31
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 17:26:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437766.692240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqzWS-0001Lc-8B; Fri, 04 Nov 2022 16:26:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437766.692240; Fri, 04 Nov 2022 16:26:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqzWS-0001Ik-53; Fri, 04 Nov 2022 16:26:24 +0000
Received: by outflank-mailman (input) for mailman id 437766;
 Fri, 04 Nov 2022 16:24:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eNsf=3E=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1oqzUE-0000xv-Fo
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 16:24:06 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2077.outbound.protection.outlook.com [40.107.237.77])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18c9cd5d-5c5d-11ed-91b5-6bf2151ebd3b;
 Fri, 04 Nov 2022 17:24:04 +0100 (CET)
Received: from DS7PR03CA0107.namprd03.prod.outlook.com (2603:10b6:5:3b7::22)
 by PH8PR12MB6794.namprd12.prod.outlook.com (2603:10b6:510:1c5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21; Fri, 4 Nov
 2022 16:24:01 +0000
Received: from DM6NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b7:cafe::42) by DS7PR03CA0107.outlook.office365.com
 (2603:10b6:5:3b7::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.23 via Frontend
 Transport; Fri, 4 Nov 2022 16:24:01 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT019.mail.protection.outlook.com (10.13.172.172) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5791.20 via Frontend Transport; Fri, 4 Nov 2022 16:24:00 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 4 Nov
 2022 11:24:00 -0500
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31
 via Frontend Transport; Fri, 4 Nov 2022 11:23:57 -0500
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
X-Inumbo-ID: 18c9cd5d-5c5d-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JyH9RSrmME2e3c+e+May26dI908uORfNPmqtAu+rR491ZCUZO+Crpkb1vuPFFwSUeXjdq6yNOirBKi4P4zku7gqmW9ew5VlWt1IzGYXO7qcRaVy9sm1IexYEwfBr/+kkBamEl9ToGcTzCD/N35rDVo6CttYz40WO+D3+lOH0a8APpIhby2Vt6PX+TfwdDSaWp4B3UxvN/6Pr58kbm1K2GJ+RKADJRPuKzf3aG00uYiazM2XDN8itdlPMAqmJfW7G543ZGks7AuOWoXC79WOaiNOQRRp2Vfv7GkZeospZn03Sq0O1ihb/l/Prpwhj7d835QudoTqiZ3KJ/KE63J+j6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pEw6Ps8mug7G4A+QhO2oaXYDI+K/H84ed4gbyS14lPo=;
 b=Iv+ngoxtGI5hcZ23u8GCYdyfq++M/XvRHi8+pZhlr2EDF445nILN+1bCuhzd9op5dIvmWXdyGpzFs7sDHaDoT1c+sfFKE6TviSHPL2ANbqGBSa1ew3q2+CuTxlIdaip3gWL9rfw9aq49SG7rKOLLBvhKgFarmjFWgMZ6aqgMhLFkVHuxRtl0G9lNH8MYNvK0N7Gtuvn0f+Fyn5ANDoLSrJ13euQu8Rp4oAXaidFtdpWYhB564j5co3dadZmgNI3Veng206e6qEPaRupIXs5EWD9LNfg0ft3j1MZOaE1aOLDTvzpEetyQu3im1ShKQ1ahPGOOE0cgLWsMntH51r/F1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pEw6Ps8mug7G4A+QhO2oaXYDI+K/H84ed4gbyS14lPo=;
 b=eXIUNALkQ3+qUsStejGO1lcYn0GGETuuukQqA3fRxBx/83rwgP5Svfi+pJVCw2er62HtN2UxFGKjYkoKxUbawQJp24kMUoL5b5wpCxz16jNhxbtXZOyGWKbLNSj48dOIJ53fODVZ1Oop1sPCSyREZAbdsWeOH3XXYltSgLZcDl4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, Ayan Kumar Halder <ayankuma@amd.com>, "Ayan Kumar
 Halder" <ayan.kumar.halder@amd.com>
Subject: [XEN v2] xen/Arm: Enforce alignment check for atomic read/write
Date: Fri, 4 Nov 2022 16:23:55 +0000
Message-ID: <20221104162355.23369-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT019:EE_|PH8PR12MB6794:EE_
X-MS-Office365-Filtering-Correlation-Id: 51c3d6e3-6efd-4273-6e4d-08dabe80fb63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5gTDpqqKji4dxVTsbeD7lCZ0zdySfSzgUATC978BVUKlujUmuN3ICTmZ78ZMVmttA0N6q3U/LwTasUeiL439O1qUtlD95P0RT/qL/xSSYoUNlPD6OuW+DYHGDfhJuNiw5O0IHnWyWmfKC5bDKCfQ/UtFikCgjNzE+lhO8bCaOfKiBqeULr1lb/ero1tHSMjxDKN6Y/8jMi70VQFRuBBamTaVoUpufR73fr32oiWLDthJASJQUdHjKMxQ9DdhvDEGqsmgOwPwaeeVKY9mRd43tY+vgTMi2b8QtWBKWRjjwgOawofWEvCWDnzouMlzRlZg6ZUlyTa0YbO+y4iOL5ShhY+gJGpulzk2rymy6RIB3gFkrzRZmVgS/CF0K3WVr+Ke5BqFqoaf72F5VxfPZOyk9se3Pt+P1Wc41A2LsznEVlvwqC+js+KBAIujqBxO0y9NvXE4UyYl4diu8gpWFAmEJrCQzKicfOECdJZUnSjsAtHHEUZGM7Aa0/zrr+MWB7e633yeZ72rdybqX4X5p8Hfs4hD77JU2U8aIQAEZL+2M8csJ9XkyudfoghOG2BcoeOimmb0B88cLYfCliegmprEbmwamJFYQiLDqwWpsiu0CZa3YGB6UWvAq+4kNLS+Uv54d7E0sMTw4rMm5ZN8f5AVVjRs9wIG2dPaN7YokCGwZU8jUZKuUXSm9K4qXxU9xyOJDFiLzW0vg8RPWDkStTiNh7rAvlzNRC8MzBiP3xblZ5OL4I/YNnZpoTDjtcx6lbP/sjWHEphzgyxsUZ5xUIBbs/SC/Bzz+uyuZmGMMfDj1g2H9LdUbdYytIRLrWc+eENf
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(39860400002)(346002)(136003)(451199015)(36840700001)(46966006)(40470700004)(6916009)(2906002)(8936002)(54906003)(478600001)(5660300002)(40460700003)(41300700001)(70206006)(70586007)(186003)(336012)(36860700001)(316002)(86362001)(426003)(83380400001)(1076003)(82310400005)(26005)(47076005)(2616005)(36756003)(356005)(81166007)(8676002)(82740400003)(40480700001)(4326008)(103116003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 16:24:00.8254
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51c3d6e3-6efd-4273-6e4d-08dabe80fb63
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6794

From: Ayan Kumar Halder <ayankuma@amd.com>

Refer ARM DDI 0487I.a ID081822, B2.2.1
"Requirements for single-copy atomicity

- A read that is generated by a load instruction that loads a single
general-purpose register and is aligned to the size of the read in the
instruction is single-copy atomic.

-A write that is generated by a store instruction that stores a single
general-purpose register and is aligned to the size of the write in the
instruction is single-copy atomic"

On AArch32, the alignment check is enabled at boot time by setting HSCTLR.A bit.
("HSCTLR, Hyp System Control Register").
However in AArch64, alignment check is not enabled at boot time.

Thus, one needs to check for alignment when performing atomic operations.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com
---

Changes from :-
v1 - 1. Referred to the latest Arm Architecture Reference Manual in the commit
message.

 xen/arch/arm/include/asm/atomic.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/arm/include/asm/atomic.h b/xen/arch/arm/include/asm/atomic.h
index 1f60c28b1b..64314d59b3 100644
--- a/xen/arch/arm/include/asm/atomic.h
+++ b/xen/arch/arm/include/asm/atomic.h
@@ -78,6 +78,7 @@ static always_inline void read_atomic_size(const volatile void *p,
                                            void *res,
                                            unsigned int size)
 {
+    ASSERT(IS_ALIGNED((vaddr_t)p, size));
     switch ( size )
     {
     case 1:
@@ -102,6 +103,7 @@ static always_inline void write_atomic_size(volatile void *p,
                                             void *val,
                                             unsigned int size)
 {
+    ASSERT(IS_ALIGNED((vaddr_t)p, size));
     switch ( size )
     {
     case 1:
-- 
2.17.1


