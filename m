Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E21620C91
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 10:46:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439816.693884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osLBD-00079S-3l; Tue, 08 Nov 2022 09:46:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439816.693884; Tue, 08 Nov 2022 09:46:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osLBD-00076h-0K; Tue, 08 Nov 2022 09:46:03 +0000
Received: by outflank-mailman (input) for mailman id 439816;
 Tue, 08 Nov 2022 09:46:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nxm+=3I=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1osLBB-00076b-Ly
 for xen-devel@lists.xenproject.org; Tue, 08 Nov 2022 09:46:01 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2063.outbound.protection.outlook.com [40.107.244.63])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25830b8d-5f4a-11ed-91b5-6bf2151ebd3b;
 Tue, 08 Nov 2022 10:45:59 +0100 (CET)
Received: from BN6PR17CA0038.namprd17.prod.outlook.com (2603:10b6:405:75::27)
 by CY5PR12MB6597.namprd12.prod.outlook.com (2603:10b6:930:43::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Tue, 8 Nov
 2022 09:45:55 +0000
Received: from BN8NAM11FT028.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:75:cafe::82) by BN6PR17CA0038.outlook.office365.com
 (2603:10b6:405:75::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Tue, 8 Nov 2022 09:45:54 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT028.mail.protection.outlook.com (10.13.176.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5791.20 via Frontend Transport; Tue, 8 Nov 2022 09:45:54 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 8 Nov
 2022 03:45:41 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 8 Nov
 2022 01:45:07 -0800
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31
 via Frontend Transport; Tue, 8 Nov 2022 03:45:06 -0600
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
X-Inumbo-ID: 25830b8d-5f4a-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KufQWCFB6USxsL32AOx3i0sr2CeCUE6OSe41FkbYy5Rp1h6E/7iDZjS/7L1dIe1mbHk1jTjOw/xOweO9R4WGWliXWfekYUuAVk7KZKewo90XM2TDaV7ix3d6SIKR/Bdtsl5+QSIkOY7Rn0qv82Fja+0FTbnSo81rG0VDqIklghK3sJeXj7nSBWEKoY3ZnG5LmIHoSXyYNcoponWEZUkWrjzQ9iXLgcrnKob8qJPmp3M76McAKtlMhtaJizvFhMef0xm71c9x3ggnBG27rpXAN+vpMVrRMi+FAIl/Yp36vS76Z1/B97xeE40Ez9Xa2OPxcLd1D0GTycqZd99nSDmfBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JjVJB5MYlDRfIruHI/1g6NGUyb/oTyRx5dUFFXbwFbM=;
 b=jg4Uj+7kGfbT2w2IomyHAtahUHXnYrejEikWmQ+2poOMWtA5NHavBc4q/nwbizcUiU43UtC7N1UI6k0dqSodh9nWiM0r66GjAHcZOi0zRne/x/tgctj0fg5gU01riQA1CBKFciLbmhUqb387LiXDC6wW+1uRgifsQtwyEvDrULrResxUuDNrJpmJaVWD6HSjYRY++mOpDu/BNax3/j4izQDD8IeB/MHGLA6mRplj+EXc5tEG9neK5IEW65UJt88xIkYy0qOfL3f9GJ0MRt4M579DWZN8lnzKvwv0yQpC5oA5TW1hZuY/yz8vmpMtBkK4sDZ4nVd7QxNmdy+aCpp6zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JjVJB5MYlDRfIruHI/1g6NGUyb/oTyRx5dUFFXbwFbM=;
 b=RaWwo9W7ox7Zuyu1BrtWGPNg1jofZEM0F7p77P2LkuredL8jWIY2t++Vc03oHVihryeb+KnCf3KvKQLHXvNOFpxsv/vmLzSXJKprJHHDm1FYDG0cQROEtmatLC8Stq3lWoTJGrqJ+PWcB0ESKBKpaf3m98dV0CPaRgtHIaFGVTw=
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
Subject: [XEN v3] xen/arm: Enforce alignment check in debug build for {read, write}_atomic
Date: Tue, 8 Nov 2022 09:45:03 +0000
Message-ID: <20221108094503.40253-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT028:EE_|CY5PR12MB6597:EE_
X-MS-Office365-Filtering-Correlation-Id: 94d9b8c3-c6e2-41c0-43dc-08dac16e0794
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DhsWffgQt47YUFWNgZfB0sAfBUKUpxx8J/vMKNw1D+87yYWemMhuN+LGLvCUSKDZ2oQ8aT6XitSietfoMEFgXCea6PBslScEwH0klr8GnAWq8emd+bKmf08P3S4wrVZD6VUcfD7BejaBObtp9fi/YeWV6BH3u9oDb/XAk4HVxvS6cn5z67sWawmA35j6S6lupUrkkumItZhG7oud6A1Q/ZSVf8mgzzU/Y319xxPCKeT+0PnyCJJUHpy7FVHeALI9/ByncerQjOHCHQ5drZlnOPDCRZUuMbCh4lsF0BY91wBDC7PwZ36IRfX3IC6CE6g51PRtYysCKOx2zS8h1M3DxcF0Pe/ed+iUdQijxMPN4dLA4ypDL8njHaR0L9k35K1L5fLezv1ez1P2sSIHXq9vrQSJ8IEuNVTwRbQH+dFkM/2uEdSSc+ZT7Ztzh/VpKeJPCu/EqxCkn+xQ7PqI2dDExRQWhp9NKRe5Zh/PDbtMNmKgyzdCQ4Yvoni5avbEJ1aGvyy1Z+ASEhDtsYd5DCxHoD3pPZ2Kpl/bdB5bjY/3lOAwz9W9oPPuEgUZpRuh2n5ajgudflqSeB/kAhSZZLaU5q89qgPOjG8MVV0A2A5TMKY2feR9/HTSGtcKagMAQ+cBnRMpcLkSNkZF0OX+RccVmFbUN+c6CoBxqRWi2PhMjnfcqS1bIKvjBNqFOBMnuAOp3i+WEfBGXrmOOTsY9FfsRQLJ/Or55F0W0KqkgRZbpdQS80qUFdDS+q+ZO17Wmw/pmMtZtH7ZPRiRJfidWgCeCOSrWqAPkd16yjsw2fsepgk=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(346002)(376002)(136003)(451199015)(46966006)(40470700004)(36840700001)(103116003)(86362001)(36756003)(81166007)(82740400003)(40480700001)(40460700003)(2906002)(8936002)(83380400001)(2616005)(1076003)(6666004)(186003)(336012)(47076005)(26005)(426003)(36860700001)(478600001)(6916009)(70206006)(54906003)(5660300002)(316002)(41300700001)(70586007)(8676002)(356005)(4326008)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 09:45:54.2817
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94d9b8c3-c6e2-41c0-43dc-08dac16e0794
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT028.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6597

From: Ayan Kumar Halder <ayankuma@amd.com>

Xen provides helper to atomically read/write memory (see {read,
write}_atomic()). Those helpers can only work if the address is aligned
to the size of the access (see B2.2.1 ARM DDI 08476I.a).

On Arm32, the alignment is already enforced by the processor because
HSCTLR.A bit is set (it enforce alignment for every access). For Arm64,
this bit is not set because memcpy()/memset() can use unaligned access
for performance reason (the implementation is taken from the Cortex
library).

To avoid any overhead in production build, the alignment will only be
checked using an ASSERT. Note that it might be possible to do it in
production build using the acquire/exclusive version of load/store. But
this is left to a follow-up (if wanted).

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Signed-off-by: Julien Grall <julien@xen.org>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---

Changes from :-
v1 - 1. Referred to the latest Arm Architecture Reference Manual in the commit
message.

v2 - 1. Updated commit message to specify the reason for using ASSERT().
2. Added Julien's SoB.

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


