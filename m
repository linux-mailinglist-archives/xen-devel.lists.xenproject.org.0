Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 552BF9143F6
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 09:56:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746157.1153122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLeYp-0002Zl-Ba; Mon, 24 Jun 2024 07:56:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746157.1153122; Mon, 24 Jun 2024 07:56:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLeYp-0002XY-8f; Mon, 24 Jun 2024 07:56:23 +0000
Received: by outflank-mailman (input) for mailman id 746157;
 Mon, 24 Jun 2024 07:56:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=11f7=N2=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1sLeYn-0002Wx-MH
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 07:56:21 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20613.outbound.protection.outlook.com
 [2a01:111:f400:7e88::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d90a4a2-31ff-11ef-90a3-e314d9c70b13;
 Mon, 24 Jun 2024 09:56:20 +0200 (CEST)
Received: from CH5P220CA0024.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::23)
 by DM4PR12MB7600.namprd12.prod.outlook.com (2603:10b6:8:108::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.28; Mon, 24 Jun
 2024 07:56:16 +0000
Received: from CH1PEPF0000AD78.namprd04.prod.outlook.com
 (2603:10b6:610:1ef:cafe::3a) by CH5P220CA0024.outlook.office365.com
 (2603:10b6:610:1ef::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.38 via Frontend
 Transport; Mon, 24 Jun 2024 07:56:16 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD78.mail.protection.outlook.com (10.167.244.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Mon, 24 Jun 2024 07:56:16 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 24 Jun
 2024 02:56:16 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 24 Jun
 2024 02:56:15 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Mon, 24 Jun 2024 02:56:14 -0500
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
X-Inumbo-ID: 3d90a4a2-31ff-11ef-90a3-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OYJOOumKGL8/qdyEgk6IVSIxUBPeowec3pZmn1WTpU3bJWjRypUZxWNrwuBok7T1we9VU/xYBqPbkNxA5xCLU6yG0m5OKXG0hAmUTWnSi3wFsRnyJVg99Mz0OdwBN6wVJtwkT7uRGp7jlJM5WQ/cWKXi1ewpUyX9fICTfrG9rfUXFsiIFWDdC+gTXNMQ88lDJwmpyHXvFx+AhdCI1mtfC+5M0YKBc1CpDe6tTFasaXIIFjG78hLXVLsjeD87Px+QmZ0t6bd4p/LsCvFeaCBVDImDo+BEWb6vV8T4sidp/qcGGrM4FZ1MOJi2OoFx2JtoNJrw8QPi8wZfQ/r2fvWCGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8p9N3jX+sDeQrnUZwbq8aFuht35rrHShuG3TJ+r3T7g=;
 b=fkHf79Lv81MQRfWysQ3HPIBNtkKKDXine1dbhUZDr2ihzBgdwP08Xeso48NuBm2WiRzGFQaquEQOwK8UNl5hFt5VEhIlL6aGNnahd8t1ZgAnbR2RS2D4tmo/RFWJJMofPJVEs9L+wvope5CTB3f6w/XQzFBsFvfu1ht7Bnthx6d5RA2heKhyyYkxuPAU9nkoufQJD/1CUavIS3HMNwhZ0NVyvc8cs4wY4cgTJiH8n2w5qqH2fPAdt4SPydnvGu5cnEDsrIKG8802wIDfmSf2A3iNT3S2NnjhV4k5NwdyUFB+mCeDFPC1gkwRcJZ+AajX+A0esIoai6fWQvDevIpTbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8p9N3jX+sDeQrnUZwbq8aFuht35rrHShuG3TJ+r3T7g=;
 b=rLULqj/LSPaCy9tKVC0l01wGK9mSr8t5/yDZXMXMOyBT/TUgtO08RpzcO5mOvjuyy68Vq+FzDqtq69ARRrzM6p+/mvuQSOinlQchQ5K9EV2AMk/uUxCSX6ySupPm00k3c9FPByK8SV30tJmSoRnWvFpW0BtwC0jxwXOFRWZGLw8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>
Subject: [ImageBuilder] Add support for omitting host paddr for static shmem regions
Date: Mon, 24 Jun 2024 09:55:59 +0200
Message-ID: <20240624075559.15484-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD78:EE_|DM4PR12MB7600:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a92ad91-15ab-4bc9-5d04-08dc94232046
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|36860700010|82310400023|376011|1800799021;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PT/c3GCqyRHV/iWkE8GwQw9vL1ztAdaZKc6zZN/7UEpOWtHvDoqv30XvQ5J8?=
 =?us-ascii?Q?XB97cou/D1ew7IcMEbDlUVn/eDsvlFj8uVYDJAP97mIyLLT7mt5G1yjMeTEO?=
 =?us-ascii?Q?7P1I5jMKjOrCpaO+4HOQavWEA+DSRjwoOUApTaJJupV+8m1UBZigmdOVqhO4?=
 =?us-ascii?Q?SvPRLAtv2bN+5CoGM1hkP3ASq4NC6tj9Z/Imm5RAMqhxgOoyMkCUl7RuICQi?=
 =?us-ascii?Q?AqDnSul/9Ks9tg4YRLFO/kmlGK/cLizGQa+l2T/pSOv07n6x3BCfu1JGAjYA?=
 =?us-ascii?Q?T+wUY/TB+VbaDgGgEAKYi+SW43LJmaFk24+UU3l5h42+Et2PNRcsUXEJrZbx?=
 =?us-ascii?Q?4IlVZSJjPu0KIh+lk0TGqsB56p1lmbyIXsg7NtCFNLnPxl8MtwdtNDHhMIQk?=
 =?us-ascii?Q?BByn7O5oO+PMJSgSObC3jgI1qJveY2qrVdyaLXtzEiQlbtc91/Dh7NNlekbm?=
 =?us-ascii?Q?MZiel4EV+/0Rt7Ow6s0D1Ldy3xuIOZM6TeW3qRuM4dFXv2CHmGzsgxsQQWH+?=
 =?us-ascii?Q?OIW0wkkManzK0weDl887sqz/qImRVKGGAqNkLIglvGjpEoZaY7buM0NnB27r?=
 =?us-ascii?Q?vUvs2emeSs8mLNuZDfJYSSKdSw7H6EdaldAT81IiBlNbkyDFw7EowkY2z4cC?=
 =?us-ascii?Q?hQ/L0Dy4EzBSGagnbxtDW5U3FLnSG5nmOiBBlzpwTrMFzLRqrR1iGY/9m7lD?=
 =?us-ascii?Q?2htmpb2il9kUQmkMnAreOqx6yLObhXi88aaniOm0HcVn45ZI+pnp1/hk2riX?=
 =?us-ascii?Q?Ycie8Lu1VkHANBBamOjJlPlMTQQr0JhkJWjwJafXJHV3R7mJ/DO1pA2cKrT9?=
 =?us-ascii?Q?EGSXGJ/SRUm2WJOmo/W04CySi2BhQvA/IVow6tjSs7Q5VhHQzEqRjtMl/rag?=
 =?us-ascii?Q?zbdK06vxd8dTGhZBxmhG5KY4DumtltVossoKTaezNh8N1GsNl+kO3THx87e/?=
 =?us-ascii?Q?zZ6mzVJ2sAk+DLC9qZWsAwh+lct5Ei+4VvshpUBFjkPS/5jMtLJs9PUnQ4VA?=
 =?us-ascii?Q?PZk1EUwzlc6ieY8E9one/o/Bvy8JfPbobKWS1/yGogwztVwPHgPFOVHdyFAg?=
 =?us-ascii?Q?yMOGTqu58+ear/+SAZmDZ9PwmTcscNAGpUcaYfidE1IoyT3g30w5fVUA66E+?=
 =?us-ascii?Q?k0CaYi3yb4xKn5b2ZBnb42CrlUka7a9TIOp8MtD/Klum2jl8+m9Ixlpjxf+J?=
 =?us-ascii?Q?bJ1BclwW5A3ffmtLAdB9CRRpBIOvhOjsNf7KYYSe/LqGFpOs4OXPO6hU/sHP?=
 =?us-ascii?Q?vvGnvO1qe/p85sA1mt/O9Gk78kYK+yag2s5h0JNVrTohXsrVDN8J621QDLcy?=
 =?us-ascii?Q?45R4DLaGq7CmMmyasGzCCxgbApWrDEi0E4CBqQgH1m002XnyYWo8waGWihh8?=
 =?us-ascii?Q?6Z30qf/WQ1zrsicLKCmkISvmNNYeOwQ7MPHjNwaVY8o6s/AZ/Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230037)(36860700010)(82310400023)(376011)(1800799021);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2024 07:56:16.5234
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a92ad91-15ab-4bc9-5d04-08dc94232046
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD78.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7600

Reflect the latest Xen support to be able to omit the host physical
address for static shared memory regions, in which case the address will
come from the Xen heap.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 README.md                |  7 ++++---
 scripts/uboot-script-gen | 19 +++++++++++++------
 2 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/README.md b/README.md
index 7683492a6f7f..4fcd908c2c2f 100644
--- a/README.md
+++ b/README.md
@@ -199,9 +199,10 @@ Where:
 
 - DOMU_SHARED_MEM[number]="SHM-ID HPA GPA size"
   if specified, indicate SHM-ID represents the unique identifier of the shared
-  memory region, the host physical address HPA will get mapped at guest
-  address GPA in domU and the memory of size will be reserved to be shared
-  memory. The shared memory is used between two dom0less domUs.
+  memory region. The host physical address HPA is optional, if specified, will
+  get mapped at guest address GPA in domU (otherwise it will come from Xen heap)
+  and the memory of size will be reserved to be shared memory. The shared memory
+  is used between two dom0less domUs.
 
   Below is an example:
   NUM_DOMUS=2
diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index 20cc6ef7f892..8b664e711b10 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -211,18 +211,25 @@ function add_device_tree_static_shared_mem()
     local shared_mem_id=${shared_mem%% *}
     local regions="${shared_mem#* }"
     local cells=()
-    local shared_mem_host=${regions%% *}
-
-    dt_mknode "${path}" "shared-mem@${shared_mem_host}"
+    local node_name=
 
     for val in ${regions[@]}
     do
         cells+=("$(split_value $val)")
     done
 
-    dt_set "${path}/shared-mem@${shared_mem_host}" "compatible" "str" "xen,domain-shared-memory-v1"
-    dt_set "${path}/shared-mem@${shared_mem_host}" "xen,shm-id" "str" "${shared_mem_id}"
-    dt_set "${path}/shared-mem@${shared_mem_host}" "xen,shared-mem" "hex" "${cells[*]}"
+    # Less than 3 cells means host address not provided
+    if [ ${#cells[@]} -lt 3 ]; then
+        node_name="shared-mem-${shared_mem_id}"
+    else
+        node_name="shared-mem@${regions%% *}"
+    fi
+
+    dt_mknode "${path}" "${node_name}"
+
+    dt_set "${path}/${node_name}" "compatible" "str" "xen,domain-shared-memory-v1"
+    dt_set "${path}/${node_name}" "xen,shm-id" "str" "${shared_mem_id}"
+    dt_set "${path}/${node_name}" "xen,shared-mem" "hex" "${cells[*]}"
 }
 
 function add_device_tree_cpupools()
-- 
2.25.1


