Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEvZK2D1cGmgbAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 16:48:48 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A83459736
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 16:48:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1209949.1521827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viaRV-0003tR-1p; Wed, 21 Jan 2026 15:48:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209949.1521827; Wed, 21 Jan 2026 15:48:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viaRU-0003pk-U5; Wed, 21 Jan 2026 15:48:24 +0000
Received: by outflank-mailman (input) for mailman id 1209949;
 Wed, 21 Jan 2026 15:48:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D6Gw=72=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1viaRT-0003mT-7G
 for xen-devel@lists.xenproject.org; Wed, 21 Jan 2026 15:48:23 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c417d03-f6e0-11f0-9ccf-f158ae23cfc8;
 Wed, 21 Jan 2026 16:48:21 +0100 (CET)
Received: from BN9PR03CA0488.namprd03.prod.outlook.com (2603:10b6:408:130::13)
 by CH1PPF0B4A257F6.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::605) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 15:48:15 +0000
Received: from BN1PEPF00004683.namprd03.prod.outlook.com
 (2603:10b6:408:130:cafe::a0) by BN9PR03CA0488.outlook.office365.com
 (2603:10b6:408:130::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Wed,
 21 Jan 2026 15:48:06 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004683.mail.protection.outlook.com (10.167.243.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 15:48:15 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 21 Jan
 2026 09:48:12 -0600
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
X-Inumbo-ID: 9c417d03-f6e0-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KVlH5mRGBpElNskBUSQBa8ePqq5KqxNO7QHBLhwjOuMWQqAERO/cjnERGLCDBvf+C7peiSTeJ3W4YmFdodZmt4OvXQ1WCS9awjBDekvJUt/MhE0u0OryhOxCoRfuA8gs3J8cmr/K1li0iV4w+v5CewL5yAWrhpXlYm7n+9h/wGt1gAoWHG53Xf2G1CDxmEk5CDp6dsAF70iV8OQY5YH0vySk2+MaCN0zxrFrFdA38tCyIudEpJmumwwVA0OtkDPEDsp+l1i4GLy4xXeaDa/On4ki8rj/57FVzKVF78D2Nfxa4Qd/ILCjs+uTZFgH6idHr6BwdIOISoOGhAR6kB2jew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3hEcp5FuV32q9O8AGTwJAtTSdTYQ5bAV1OGHL0IDGXc=;
 b=dAeMAS95HOGlJNSwyS363y7npnE/Dw+sdI44VUhvfrnpZANNSAu3iu7hWbgnLX0SHHbZNfNa8sDr+9BA0LHrHBWqtoHB5cyra1zxHV0yMm6mDbn2FDSGszTeJo8Lmc31eQrOUddIeEysmSWqr0GrC4aA8FYcWXoJdACSmY7Kp/vdRcSgBwiW84Z7aSsL847//P/1DiScMNbUOD4mCoYwqIrJOkMM408l3E98ox8lpfDQ6/j+399D3qhQxEhCkJcUsOiCJIiEm57u9erHjaEd6o8ccyNPb3V+wT2qg2otR+kxYZ+5Y0MJdsSBLJA4ijI2JZ81jzmF5yjsXSz+NMZ/aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3hEcp5FuV32q9O8AGTwJAtTSdTYQ5bAV1OGHL0IDGXc=;
 b=KRZI97vci0YMiu5g2Nzw1/1+aGXunWzcN0x2f9JLPC+9EFNQCgdeZoRdyPMlRUUmnGepC4WvnMt1G6tvkA8E36mJF5E3hXV8lwNCt1k7AzAEEMggnjEJl7IobLK/p5rNFjjVFypupHmH0/k5vUptmO8utOXC0BVMt6swjItInwQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v5 1/2] xen: Allow lib-y targets to also be .init.o
Date: Wed, 21 Jan 2026 16:47:54 +0100
Message-ID: <20260121154757.44350-2-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260121154757.44350-1-alejandro.garciavallejo@amd.com>
References: <20260121154757.44350-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004683:EE_|CH1PPF0B4A257F6:EE_
X-MS-Office365-Filtering-Correlation-Id: 0781965f-80b0-478c-5b9d-08de59047d71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PH/kHBcEUNFtUP2dLAKQDTIkm0DiCvbj6VjUaRPRUD2fjaA+KuWw3tRkrdjP?=
 =?us-ascii?Q?WYQFr69mv03MBb3DnBwUh8busvuhtVGlAGjo3mMqKAKbyVbOJXty9TFrBNhN?=
 =?us-ascii?Q?thlxIOj4As/dBl8TbD99vetCHHEhqi9IbzSTue77wZX97IJ0T+G+xOLKCeOQ?=
 =?us-ascii?Q?4RHlnaxpjSfLHj8CGH/q+oVt+1H0hs3BYAsV8IOz6KKZpD3RwMVBiqE0eyK8?=
 =?us-ascii?Q?OnaWfpMXlA2oalYisVW2o8DGWnqb/OZ2iwUP6hYWrsl9cLbzz07J3XZqajS0?=
 =?us-ascii?Q?pMfih+1r6r+04ITg+89Ol6VVar7S9aOny6dqJp4ltqS+4vaRsGqie/1ASRTM?=
 =?us-ascii?Q?0Dm1P8Se24j1zyyWC4qzxGkzsHGSzWSdS8EnHrmP3BylbwmsbHEXKnBwD84x?=
 =?us-ascii?Q?TMTVanf58KYV3HYHhbkjNp5VE0/GephXN6MHwKtfCqtk8R2XTPxKyJLl0A8P?=
 =?us-ascii?Q?svHnr+hwSBDDyDR2v1p7FIJM+nKxU8RgumQsPNt9GG51PZ3zedgak7l4q+tj?=
 =?us-ascii?Q?bI8NKvY1Gc9hnv7mGyaeVy/qY830ey2rXe7TmUJEjncITMLtDQAAAaXqEuCo?=
 =?us-ascii?Q?wFXCq6jUmVfA3ZDkflVKWfnQKp1VjH10p/PKn6DaUDNg783Ae0wX+CKPx0qz?=
 =?us-ascii?Q?5sqHl+TBV27u6z2ynjok8d68V0GF0ksEfaHxHfwwI3CoiQV9PY7acf5iDjMu?=
 =?us-ascii?Q?HV3YKhFaxnTJTpvlmLglGatD6zhW5Z6/tgBLEHbT7/ihYr/Iu/t/StDKYe25?=
 =?us-ascii?Q?nYNLJCwbHLpZdWIUWz/Uuhb2YhCyZzZ6h95X6jLxaEAb9uxDB5fvP8XmU9KJ?=
 =?us-ascii?Q?O2FTOD+KZ6eH0Ql36QPbGuxJmW4Mw9T8ki+NnveHvIV1xvuei9PtIIKUwL5y?=
 =?us-ascii?Q?BzAtZcGCV20bIe8vOROBcgkywdqOkJEHgRdQI2fImnbULw/mF8O4lU6/U1Je?=
 =?us-ascii?Q?dPCczimPCV9aIie8dQexDPFAq8dpe1Zp9XDNpETT8ixNW58vdvDP+WdAQBhT?=
 =?us-ascii?Q?bIlpMiGpjqnVmBOhxdJs2T29/XXDwtWo/p0mX+kMHeAxbIb1HQ2I/iWLyvGd?=
 =?us-ascii?Q?3IoS3DYK8VtZVVlY4DzJZu+PwjwWOonsRhhyZWN8mnZ1Z6n3oJTCJWnejed7?=
 =?us-ascii?Q?JbmwPR8tESdR3OLj/dNxfonR0+JYd6hTAg3QT71IejET+lSnKKpz07n2an1x?=
 =?us-ascii?Q?2r+SOahXs11kRC2kZYSaInNoZLuvwGhDV0GPUhPL8+ICZx2Gs+P9Nf0qHR0R?=
 =?us-ascii?Q?SLjgkTFKDwgO2Z4hhLF2ugbvvjw7Jj681BrYJg7IwjwjN1XKqKcVKJCNp6wG?=
 =?us-ascii?Q?O0VIXIrM8mBuYJ8ZhGuS/Zf4NvgZJ4avzuiA9AlWAN1zMvEs0WzFYmjdgJti?=
 =?us-ascii?Q?0d+OSugzxytR16VQXKvwfuSaoRmhgZ/b8gs+UmjhZ+HMuxh99KbdTMNK7guR?=
 =?us-ascii?Q?/6re3ATWJc5PGhPjIVcVBTCKQ9do0UySXcMEDU+PD5f8ax+KJ75FLRLi5vZe?=
 =?us-ascii?Q?juowAAxBTlojC4TuiepjfQuj5Ps3nxw2IIwFyimusZJ7e0859+tLDJGYRveJ?=
 =?us-ascii?Q?ciAAk/cr84uUfp5oZDxeBYMYJyjokvoOMMicj06UMibfgwhwjd9Bpr0JjDNb?=
 =?us-ascii?Q?J3aZIVSNgX8L0NstIcLQ6fJuwwV5CHmkXzwgdZ5jXHvK8cW61yVL7N8zJvbm?=
 =?us-ascii?Q?g8hbGA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 15:48:15.2080
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0781965f-80b0-478c-5b9d-08de59047d71
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004683.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF0B4A257F6
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:alejandro.garciavallejo@amd.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo,suse.com:email];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2A83459736
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

There's some assumptions as to which targets may be init-only. But
there's little reason to preclude libraries from being init-only.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
 xen/Rules.mk | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/Rules.mk b/xen/Rules.mk
index 2b28d1ac3c..2c3f836c1b 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -130,9 +130,9 @@ endif
 
 targets += $(targets-for-builtin)
 
-$(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y)): CFLAGS-y += -DINIT_SECTIONS_ONLY
+$(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y) $(lib-y)): CFLAGS-y += -DINIT_SECTIONS_ONLY
 
-non-init-objects = $(filter-out %.init.o, $(obj-y) $(obj-bin-y) $(extra-y))
+non-init-objects = $(filter-out %.init.o, $(obj-y) $(obj-bin-y) $(extra-y) $(lib-y))
 
 ifeq ($(CONFIG_CC_IS_CLANG),y)
     cov-cflags-$(CONFIG_COVERAGE) := -fprofile-instr-generate -fcoverage-mapping
@@ -146,7 +146,7 @@ endif
 $(call cc-option-add,cov-cflags-$(CONFIG_COVERAGE),CC,-fprofile-update=atomic)
 
 # Reset cov-cflags-y in cases where an objects has another one as prerequisite
-$(nocov-y) $(filter %.init.o, $(obj-y) $(obj-bin-y) $(extra-y)): \
+$(nocov-y) $(filter %.init.o, $(obj-y) $(obj-bin-y) $(extra-y) $(lib-y)): \
     cov-cflags-y :=
 
 $(non-init-objects): _c_flags += $(cov-cflags-y)
@@ -156,7 +156,7 @@ ifeq ($(CONFIG_UBSAN),y)
 UBSAN_FLAGS := $(filter-out -fno-%,$(CFLAGS_UBSAN)) $(filter -fno-%,$(CFLAGS_UBSAN))
 
 # Reset UBSAN_FLAGS in cases where an objects has another one as prerequisite
-$(noubsan-y) $(filter %.init.o, $(obj-y) $(obj-bin-y) $(extra-y)): \
+$(noubsan-y) $(filter %.init.o, $(obj-y) $(obj-bin-y) $(extra-y) $(lib-y)): \
     UBSAN_FLAGS :=
 
 $(non-init-objects): _c_flags += $(UBSAN_FLAGS)
@@ -273,7 +273,7 @@ define cmd_obj_init_o
     $(OBJCOPY) $(foreach s,$(SPECIAL_DATA_SECTIONS),--rename-section .$(s)=.init.$(s)) $< $@
 endef
 
-$(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y)): $(obj)/%.init.o: $(obj)/%.o FORCE
+$(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y) $(lib-y)): $(obj)/%.init.o: $(obj)/%.o FORCE
 	$(call if_changed,obj_init_o)
 
 quiet_cmd_cpp_i_c = CPP     $@
-- 
2.43.0


