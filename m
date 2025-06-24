Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC07AE5884
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 02:21:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022868.1398727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTrOz-0006FL-RV; Tue, 24 Jun 2025 00:20:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022868.1398727; Tue, 24 Jun 2025 00:20:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTrOz-0006CN-Nj; Tue, 24 Jun 2025 00:20:41 +0000
Received: by outflank-mailman (input) for mailman id 1022868;
 Tue, 24 Jun 2025 00:20:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UKra=ZH=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1uTrOx-0006CC-4I
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 00:20:39 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20612.outbound.protection.outlook.com
 [2a01:111:f403:2009::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c6f857c-5091-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 02:20:36 +0200 (CEST)
Received: from BN0PR04CA0125.namprd04.prod.outlook.com (2603:10b6:408:ed::10)
 by CY3PR12MB9653.namprd12.prod.outlook.com (2603:10b6:930:ff::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Tue, 24 Jun
 2025 00:20:31 +0000
Received: from BN2PEPF000044A4.namprd02.prod.outlook.com
 (2603:10b6:408:ed:cafe::fb) by BN0PR04CA0125.outlook.office365.com
 (2603:10b6:408:ed::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.30 via Frontend Transport; Tue,
 24 Jun 2025 00:20:30 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A4.mail.protection.outlook.com (10.167.243.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Tue, 24 Jun 2025 00:20:30 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Jun
 2025 19:20:30 -0500
Received: from xsjvictlira50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Mon, 23 Jun 2025 19:20:29 -0500
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
X-Inumbo-ID: 0c6f857c-5091-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BFhSRqPbdYwNsMLopKaXtnMOmDEHpz7nuH5d00K9AS9re7WMpdyTdtazNUzPJDFN+FMwdhbkMl4Sw9Ic7x5JZaIbCXjq+fycw+y+QKb09rMKYW8ATPtiI5rr29tAsA2RMbEjJbw94nCOYN/CxOMsHD/1phz3PEvULTt9qh7Lo4EEmFzjMen3dkLwc09S3yShvb6JwH0tS4vxI33SS0GV/2iZk7BM38raJmAofhKE0bDLsMaB2AUYsNucisYgBxDOynq1JjhBMK5/nHQWS8KpzbfvmTaC8nDYN9sKPICIwrf4V5DKAv5MDLet3grVQmbSTIMk26btkhi9stgIex6V4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nIkRL+KmS9tOBKdPslWRWd6541u4H2gTXTX/zlKIRfg=;
 b=ahX68Ba2Dm2hYFicJMGAVA7EQPQ+klOzohDubbOhajIy1XbfhMwLhz31j42657H4N+mTwBjM+ktgFi31O8ltPUZFr+HZrlkir9PzHIu7Mnpl12fFh3pUtqEmGCq3oCZJQ1YNFf4sl9vlWChb5K5sNM8kiWUV7GxasMHTkjCYEJb/mi3Mmlfyu6fszkvyNmQXs1PnKjhsfwLe1ydhL9p1LzXxH8fFjS37f1syMEruABc3loZ2SPuWDNFplqBNhIxvLPjA3z6gzvfVowiRlJb1NKISFUSHgfwVfe8x2xriGy8cCNMu/HGrsavN2Spj4sA33vwQ7SV4jJFtl4zmRne5Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nIkRL+KmS9tOBKdPslWRWd6541u4H2gTXTX/zlKIRfg=;
 b=OTpXPmAJBT6UXEYknrT6y00fSgXuZqJvtPbWBLS696P1qLjBmerrfbZsKWxGyivEm0RZFXsuWkgo94l5Mi6THRFMq7G8YNtbHYjG7Wuj7KFeilO5gMXA1oDQ7r8rM5PJtYye/Gemu4tSf8WCiPYkqIryVdr7BZ/cewn10ykJSOg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: <victorm.lira@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Victor Lira
	<victorm.lira@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Anthony
 PERARD" <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	"Jan Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=83=C2=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Federico Serafini
	<federico.serafini@bugseng.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH 2/2] xen/x86: address violations of Rule 11.3
Date: Mon, 23 Jun 2025 17:20:15 -0700
Message-ID: <20250624002018.4121819-2-victorm.lira@amd.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250624002018.4121819-1-victorm.lira@amd.com>
References: <20250624002018.4121819-1-victorm.lira@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: victorm.lira@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A4:EE_|CY3PR12MB9653:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f3b51e4-ad1e-4e74-b495-08ddb2b4edc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Wkk2Q2pRSWFxNmRxWUdZQmNKZEhkaTBDVTNPa0RCd3VkeDhGaGxQcXE0MEFm?=
 =?utf-8?B?WWNxQlloZjdyU1N6REtycjN1aDJrK2tMbE1qTHdrd0xRbkR3SXBiWmJFWnlV?=
 =?utf-8?B?TUg0aENnN1RrZmtQTkhZMGQ5YUNxU3FRUXBsdDBDbjZqQ29TMU5jMm5HZEZF?=
 =?utf-8?B?YnpEVFoyUXIxWU9yQWlpVjU3ZFZLRW9ySVZveVRER0lCci8rVXpxY3pKcEY4?=
 =?utf-8?B?U0ZJS1BiNzNENHBCWkordVZUZC9qcTRjWHB4V1B5Z3dOV1NsVHlBaDRpekFi?=
 =?utf-8?B?M1VPcmErMkVPMVVuTG1HWUhPWjdQS21QNlh6QlI1S285VlBwU08wSFF1YXd5?=
 =?utf-8?B?WUZNS1hsT1ZkUktsWkJrajR6V1lZazJwMG42NlFFT0FxTlp0VUM1NWdNV25q?=
 =?utf-8?B?NWpRRXQ5WitpWko0TzVXTThaUU1jUm9vVkF3VHAyaWhhVjMvTHoxY0hyMFJI?=
 =?utf-8?B?S28vY2JYVEVJMHRQSmZrY3dWMnh3dDdsRm5RazU2UzZHK1ZEakxBWVQwWnZ5?=
 =?utf-8?B?M3MrY21hZHdzK20zaTI3dytpZCsrbVU5UkdqWEl0bkg3b1FJTlFBVlR6Mk9R?=
 =?utf-8?B?RldEMm1nZTNFRjhwdm9aM2VhbzFMcGovR1J5bnVNZXYwakZNNlJzRWV5TExN?=
 =?utf-8?B?YlM0d1ZSNjR3MGZod3pHMUU0ZkZmMFgyRE0zL2hrOWxpZHVOVzlSZlY4OUJu?=
 =?utf-8?B?UHdSaGhVUXExTGtySktvYm0wSU5lbVBjUHJDaXhUUWhYU2NlbCswUjlMZHo4?=
 =?utf-8?B?N2RFQ09YV2xUY0k5TER6bi9mVHZteDlESVFST2ZZQXJwb0N3VGRncmZLSUZQ?=
 =?utf-8?B?MVRsOXI5QXNHSEM5eTNVNklXdlVUVC9JbDZZZW93ajdqZTZ2VVBhN1hCWUxj?=
 =?utf-8?B?dXBvUUtSNkcwOXh2dWdodFc4eHhzZmx4WU5oSkJVaDZsQXpPK1Ewdk9uQkp3?=
 =?utf-8?B?N296bW5GL3FOYUJEbU9iRkU0NnJiSSs1Q1I0SUVUcVNYcHFjTU0xMUN3dzJj?=
 =?utf-8?B?WG5UQS83Z2V5YWNtMjE4SGhUR0dQNnh5Ym5UUDV2TEZQdFdEZzNkODRINjd4?=
 =?utf-8?B?ZXpPY1NFbEg0c0liY21mSjZ0T0g5cVFQcW1RMnBOd25Edk1SVG1xdWxhaStJ?=
 =?utf-8?B?R0dwUXdFNnJPUjRLNEs2V2J2cTkxNE8zc1pueWNPYXVOZGJhQ3ZDeWxCa05j?=
 =?utf-8?B?cS9nNHZPb2RxeTZqOHZUdDRiZVNieDFXRHAxbTdQVHZJZC8xV2hCU2Mzbkln?=
 =?utf-8?B?K1NkVGw3WSswbE9BYkEyMnl5Ums3a1hPTWhaWGtISCtrSHVsRkkvMHRJd2Zu?=
 =?utf-8?B?NHhvR2xLUjAxSUxjajdOWGtFak04UXFrNHpuQUFNYXJveU5WaTZVZWllRCs1?=
 =?utf-8?B?ZFpTTjlubld3MEZtZEtINXUxUVROczR5b3R3ZjVqcVZmUy9IbUJsT09VTFN3?=
 =?utf-8?B?RjNURjJ5UEUvblpzL2M5cHRtblQyUGRoTkhUYzZQSDA5eUs3L0JIWlVOS0JN?=
 =?utf-8?B?aDVZM0dxWTJ5QUlwU1dGTG9TcUpjVVJjMGp5NWdEc1lJSThzdjd4MWMyWWdY?=
 =?utf-8?B?MDdkQStLdUpRVkROQU96TDZpVEtNZUJ6ZFVPOGNBczgxdEJZM0lpMGM5bDVK?=
 =?utf-8?B?enRNQnY2MjJHVjEzZEtwTHlTaUpGeUF4TkZCRjhNVTVmOUYzMUpqeXhyK2sy?=
 =?utf-8?B?Wm5ONDlzSXJ6cm9RK29ySmZLaHZMa3loVXprMkdCVUVDSGliTGs2aGkzVVl5?=
 =?utf-8?B?bTN0RjBLcXZyNEJIdmZKa3ZwL01OK0xxNkY4NDQ5aE13ZlZDaUdRc0R5cTZl?=
 =?utf-8?B?ejBvK1RoUXNZSnEzZnU0c3M0QjdtRUNIbFBUaGVaSTJRb3BzU09SWVhTZGdo?=
 =?utf-8?B?TE9hMXFVRFIzVHc4TG1jMlMzeXR4Ym1YVFRMbVFXK0JaRUR3Yk45b09JZzVv?=
 =?utf-8?B?dHdtV0JDd0FuWWJQL1NtZ2V3aVEzVUVieFpic2hUdFFGcjlFUGdKMEYvZEt5?=
 =?utf-8?B?WCtnSTZCbDdSYlBmdEx4dG5SbUo5U2xBclh6L1lwSGF6MDZjQXByVklmaGhV?=
 =?utf-8?Q?EA7rhX?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 00:20:30.9063
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f3b51e4-ad1e-4e74-b495-08ddb2b4edc5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9653

From: Nicola Vetrini <nicola.vetrini@bugseng.com>

Use {get,put}_unaligned_t to ensure that reads and writes are
safe to perform even on potentially misaligned pointers.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Signed-off-by: Victor Lira <victorm.lira@amd.com>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>
Cc: Michal Orzel <michal.orzel@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Roger Pau MonnÃ© <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Federico Serafini <federico.serafini@bugseng.com>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/x86/alternative.c               | 12 ++++++++----
 xen/arch/x86/hvm/emulate.c               |  8 ++++----
 xen/arch/x86/include/asm/hvm/vlapic.h    |  5 +++--
 xen/arch/x86/setup.c                     |  2 +-
 xen/drivers/passthrough/amd/iommu_init.c |  2 +-
 5 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
index d4fe56b3da..200cf2e44c 100644
--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -17,6 +17,7 @@
 #include <asm/nmi.h>
 #include <asm/nops.h>
 #include <xen/livepatch.h>
+#include <xen/unaligned.h>

 #define MAX_PATCH_LEN (255-1)

@@ -168,7 +169,7 @@ void *place_ret(void *ptr)
         BUG_ON((int32_t)disp != disp);

         *p++ = 0xe9;
-        *(int32_t *)p = disp;
+        put_unaligned_t(int32_t, disp, p);
         p += 4;
     }
     else
@@ -345,8 +346,11 @@ static int init_or_livepatch _apply_alternatives(struct alt_instr *start,

         /* 0xe8/0xe9 are relative branches; fix the offset. */
         if ( a->repl_len >= 5 && (*buf & 0xfe) == 0xe8 )
-            *(int32_t *)(buf + 1) += repl - orig;
+        {
+            int32_t val = get_unaligned_t(int32_t, buf + 1);

+            put_unaligned_t(int32_t, val + repl - orig, buf + 1);
+        }
         a->priv = 1;

         add_nops(buf + a->repl_len, total_len - a->repl_len);
@@ -388,7 +392,7 @@ static int init_or_livepatch apply_alt_calls(
             return -EINVAL;
         }

-        disp = *(int32_t *)(orig + 2);
+        disp = get_unaligned_t(int32_t, orig + 2);
         dest = *(const void **)(orig + 6 + disp);

         if ( dest )
@@ -420,7 +424,7 @@ static int init_or_livepatch apply_alt_calls(

             buf[0] = 0x2e;
             buf[1] = 0xe8;
-            *(int32_t *)(buf + 2) = disp;
+            put_unaligned_t(int32_t, disp, buf + 2);
         }
         else
         {
diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index 91f004d233..3b644eed12 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -68,17 +68,17 @@ static void hvmtrace_io_assist(const ioreq_t *p)
     else
         event = p->dir ? TRC_HVM_IOPORT_READ : TRC_HVM_IOPORT_WRITE;

-    *(uint64_t *)buffer = p->addr;
-    size = (p->addr != (u32)p->addr) ? 8 : 4;
+    put_unaligned_t(uint64_t, p->addr, buffer);
+    size = (p->addr != (uint32_t)p->addr) ? 8 : 4;
     if ( size == 8 )
         event |= TRC_64_FLAG;

     if ( !p->data_is_ptr )
     {
         if ( size == 4 )
-            *(uint32_t *)&buffer[size] = p->data;
+            put_unaligned_t(uint32_t, p->data, &buffer[size]);
         else
-            *(uint64_t *)&buffer[size] = p->data;
+            put_unaligned_t(uint64_t, p->data, &buffer[size]);
         size *= 2;
     }

diff --git a/xen/arch/x86/include/asm/hvm/vlapic.h b/xen/arch/x86/include/asm/hvm/vlapic.h
index c388551198..c7a26c0a0f 100644
--- a/xen/arch/x86/include/asm/hvm/vlapic.h
+++ b/xen/arch/x86/include/asm/hvm/vlapic.h
@@ -10,6 +10,7 @@
 #define __ASM_X86_HVM_VLAPIC_H__

 #include <xen/tasklet.h>
+#include <xen/unaligned.h>
 #include <asm/hvm/vpt.h>

 #define vcpu_vlapic(x)   (&(x)->arch.hvm.vlapic)
@@ -85,13 +86,13 @@ struct vlapic {
 static inline uint32_t vlapic_get_reg(const struct vlapic *vlapic,
                                       uint32_t reg)
 {
-    return *((uint32_t *)(&vlapic->regs->data[reg]));
+    return get_unaligned_t(uint32_t, &vlapic->regs->data[reg]);
 }

 static inline void vlapic_set_reg(
     struct vlapic *vlapic, uint32_t reg, uint32_t val)
 {
-    *((uint32_t *)(&vlapic->regs->data[reg])) = val;
+    put_unaligned_t(uint32_t, val, &vlapic->regs->data[reg]);
 }

 void vlapic_reg_write(struct vcpu *v, unsigned int reg, uint32_t val);
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 1f5cb67bd0..5919e94f5b 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1249,7 +1249,7 @@ void asmlinkage __init noreturn __start_xen(void)
                (caps & 2) ? " V2" : "",
                !(caps & 3) ? " none" : "");
         printk("EDID transfer time: %d seconds\n", caps >> 8);
-        if ( *(u32 *)bootsym(boot_edid_info) == 0x13131313 )
+        if ( get_unaligned_t(u32, bootsym(boot_edid_info)) == 0x13131313 )
         {
             printk(" EDID info not retrieved because ");
             if ( !(caps & 3) )
diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthrough/amd/iommu_init.c
index bb25b55c85..c00aa64983 100644
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -562,7 +562,7 @@ static void cf_check parse_event_log_entry(struct amd_iommu *iommu, u32 entry[])
         unsigned int device_id = MASK_EXTR(entry[0], IOMMU_EVENT_DEVICE_ID_MASK);
         unsigned int domain_id = MASK_EXTR(entry[1], IOMMU_EVENT_DOMAIN_ID_MASK);
         unsigned int flags = MASK_EXTR(entry[1], IOMMU_EVENT_FLAGS_MASK);
-        uint64_t addr = *(uint64_t *)(entry + 2);
+        uint64_t addr = get_unaligned_t(uint64_t, entry + 2);

         printk(XENLOG_ERR "AMD-Vi: %s: %pp d%u addr %016"PRIx64
                " flags %#x%s%s%s%s%s%s%s%s%s%s\n",
--
2.25.1

