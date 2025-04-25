Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD9DA9D658
	for <lists+xen-devel@lfdr.de>; Sat, 26 Apr 2025 01:43:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.968817.1358276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8Shl-00033Z-Kz; Fri, 25 Apr 2025 23:43:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 968817.1358276; Fri, 25 Apr 2025 23:43:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8Shl-0002zx-Em; Fri, 25 Apr 2025 23:43:37 +0000
Received: by outflank-mailman (input) for mailman id 968817;
 Fri, 25 Apr 2025 23:43:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/n1b=XL=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1u8Shk-0002xk-0E
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 23:43:36 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20622.outbound.protection.outlook.com
 [2a01:111:f403:2406::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18aab247-222f-11f0-9ffb-bf95429c2676;
 Sat, 26 Apr 2025 01:43:33 +0200 (CEST)
Received: from BN0PR08CA0024.namprd08.prod.outlook.com (2603:10b6:408:142::14)
 by IA1PR12MB6089.namprd12.prod.outlook.com (2603:10b6:208:3ef::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 25 Apr
 2025 23:43:27 +0000
Received: from BN3PEPF0000B072.namprd04.prod.outlook.com
 (2603:10b6:408:142:cafe::31) by BN0PR08CA0024.outlook.office365.com
 (2603:10b6:408:142::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.40 via Frontend Transport; Fri,
 25 Apr 2025 23:43:27 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B072.mail.protection.outlook.com (10.167.243.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 25 Apr 2025 23:43:26 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Apr
 2025 18:43:26 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Apr
 2025 18:43:26 -0500
Received: from xsjstefanos51.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Fri, 25 Apr 2025 18:43:25 -0500
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
X-Inumbo-ID: 18aab247-222f-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r6GRTe27VOvnE0t+MjpxBXTq/znf3G/QC/xw9bwMAkObbk4dFSeAJEhSB3u7/zX121LW2yr+vXY1E+790RYPww0rulnun/Zq2tMRJxRn8TxkmLA7Pff+D8jYGhZVQUR2UgKIlMNz1CDaTl8kshqGMM6yi+QA0upWtID4AyVdsuz+AVGjyfHfkJ2zC6jX3epTmRi+/R9QMw5+hRnjC6/XsUfqFUnyxaQSeZAh6I+zYsjsrCtlCa/GtuFZGBh7YygtOjV16tEMn5sIEqphO7QkMVtJynzMUJIw4h0In/40j3WzBh5w3EDogF3LEbanSmcNcjiE/95sn+0YC7E5juEc6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D8E/bPc0PJUR1517qnR2GX1GX93U2VDwCoULoW2ZQwk=;
 b=qjeq1utWZAbYlRljYxJ6D3oUOM/641N50WhOMX71xA5zc+woRz+Z6lmEga7WcEpU/APRWBTh4WJvSOBDtuuaGcUeJsEF2oj8DZ6PLmMl4ECuB41sfqTUBzP9/DzaBN9s1EDefFizoSsPMl+e000S5kB2uDI8D80uEWI1K2mUMYhffGiay4uihdJIV5cTpZcZROdlXVIG7dw3XvhtNwBJ4f+zhwCDEJSwyg6RuXxYc2ckZhny8vQzXIeXaX+6BVJasXG2l4ZSRKj+mgWqzKnBZxvYelnScE9Q9cmyS6rj7ic31LnLgVbOAkaRsPsEwiVnPfpmtDqX0+KdaB6+XPUBSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D8E/bPc0PJUR1517qnR2GX1GX93U2VDwCoULoW2ZQwk=;
 b=22bo6mk/NNPwb72hKcRyQHeH1F6Txsno1bGXs00jdQzVI+Ybc0XKy2vN0dBDjMU/bR/k7WwJzabJOynGyE6YaFQfffXOI0A3imXnRdue9/kcJ9QYI3sXxKgCdPCBIzIVdyDP1N0WjCXhfs+JDtXzXIdR8YVzzpPEE/IM/VeZb70=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: <victorm.lira@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Victor Lira
	<victorm.lira@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Anthony
 PERARD" <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Federico Serafini
	<federico.serafini@bugseng.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH v1 2/3] compat: address violations of MISRA C Rule 19.1
Date: Fri, 25 Apr 2025 16:42:37 -0700
Message-ID: <74b0420ab20fc0204db14c0a1a4a68ed48b25a38.1745624090.git.victorm.lira@amd.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <c694069696dd428bc1719e36c378a573b03f74b9.1745624090.git.victorm.lira@amd.com>
References: <c694069696dd428bc1719e36c378a573b03f74b9.1745624090.git.victorm.lira@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: victorm.lira@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B072:EE_|IA1PR12MB6089:EE_
X-MS-Office365-Filtering-Correlation-Id: 8acae5c2-15ce-43a2-df26-08dd8452f9c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K1Jkc0xlNG5tblJIelA5eWhNVzdsZFBBSDFDUHlPUEt4c1pzUkdwcTk4Mzcx?=
 =?utf-8?B?Ty8ya3dKaFpObFFxM3RCM1YxVUZLM002dCtmaHBEam00OFYyN0MwbWtlWC9O?=
 =?utf-8?B?MXcrcjZlZ3VxRnZ4V0pWZCs2NStzemE2WEF4cEM2OE96WHJJNDkrT1Q5ZGx5?=
 =?utf-8?B?NDJnTFY3TGNMcTYwQkR1UmJSSVhPYitOQVNFTGJEU3VRUUpxbERYaUpzNjZx?=
 =?utf-8?B?YnlmSXp3MHhBSXBBc1ZEeUZpbTRQSDdnVUNZb0ZGR3NTTnpSRE0zck9rVFZK?=
 =?utf-8?B?YmdJWUZMRlY2d2dTVWVHU2M1K0Q0M2tXY2RTd3JKUFBSN2JRRC82YzY5SFRC?=
 =?utf-8?B?OU8zMUNMeENiYVRoYStTOGdYcWRUM2swbnlZKzRBN0dJMkFWc2JpYVB4NnZz?=
 =?utf-8?B?VEdoRXJQY1p6TEhJbDBiWEtxQ2pKS0hFaG91VC91bElaUS8xcksrcWF2bkFU?=
 =?utf-8?B?a2N2aHdxbzF4cGlXUE5UK2laYWhuMm9wRTQ3RjhwVGpTajdybXJBVzc0SDlv?=
 =?utf-8?B?TGZFQndETE1DTDdSVkJFR2swelU2N1d3clUzVFpFMk0yMlF4SVNIeWppdm91?=
 =?utf-8?B?ZjVWNnpaUUtIVnR4OVF1MEdUOVQ0M0RZOER3S0xNZDBZOVRYV0JQb2J5ZTFl?=
 =?utf-8?B?TENmNEJ3QlYzSkpWNVp6emhvc2QvN1hjaEZUYUlIUXdyZzNwdEhpN2t5RXMr?=
 =?utf-8?B?V1hTU2M4cEVBVndLOUpQYVg5b2I0WC9uYnlJOHdJSFhFbzRQeE5DMUQ2ZXMv?=
 =?utf-8?B?dkpXV25uMFB6Q3pqV1h3ZUhuTlEwWi9OaW9NL2REZDBuSGlZeVRpNXUyU204?=
 =?utf-8?B?dXdIYXhWcTduTy9BaXNLMXBMb1lYdGVCNnFNWUtSd2U0bE44RWNueE1zY3B1?=
 =?utf-8?B?L1dPWlJXbHA4bU9tbHAzYnRMRG1GMXE0aG1qcjlack9RMXlzUmZmM0NJOEUr?=
 =?utf-8?B?ZEJ1NGEvallmOGJpTzJGdWxzQjFPNm5MTVZzVXVvQUJUVTBlZEhlRmM2OUZM?=
 =?utf-8?B?aW13RjNkdFZqMVV4WWlEaE4rdng2NEE2T1crdm5Tc0Mrblhra1VHL1JwYlpV?=
 =?utf-8?B?azZzSW9oYzR4dDZwVEwvM1NpMzFxWXg4U0JOZWh2VFlIR1ZIVTNFSjV4WXhr?=
 =?utf-8?B?TXVwSU9xUm94NTNJOWVoWXQyQkZ0K1d1WWxlbTlUUUdNMWZzQUpQdEV5L1NR?=
 =?utf-8?B?K082T3FKTjdqSUZwR1ZZMDJZemtKbG9HMzEvRDI5QnVXOVZQREJkN1JRYWFV?=
 =?utf-8?B?WGNtdHBJYlUwSEwvaGxXNGV4REdpcWdMeWord0QrZG1scTdGRGFSK1dsQ2dz?=
 =?utf-8?B?RlpPb2dXOWJRU3YrMFlLSHh2bXNpUklJS2FiNmgzVXM1K3FBZTNtS05udHgw?=
 =?utf-8?B?ai92T3Z5L0diSWFPeFhZalNpS2c5UnFjdmIxRWk3OW0ybC9ySGFYU2RyaUky?=
 =?utf-8?B?SS9xSzl3K1RKVHVrOEJpTjNESWVkbThJeU5TeFZ5bEpjQTVXZ0x2K3UxdndW?=
 =?utf-8?B?MnlCMTVtUzNjclBqUjhiSjc3MisyeWdZbUNDQ0ZnWUZieWVwbys3WjR5bzhy?=
 =?utf-8?B?R3doS1pJMVkwTzlqOVM5QnQrVFNCNGg2cGZnMnNOdlArekZtdXBPWUNreE5E?=
 =?utf-8?B?WEQ5Ri8rWTJEMXZtY0c0blFRQ01rbklpZWc2OHBqMGlLeWZWWGxBSEppcmVz?=
 =?utf-8?B?T041N3lqMTZ2Z2dPWVJWYmlaVnNHMXR6WWFGTTJYeTQ5N0gzdWM4ZVJwWFN0?=
 =?utf-8?B?ZE5EUDhSUjNqZmxIY0dhcys4SkVHMWpwWnNNNW1mb3hHRmErTmxxbHdta1dD?=
 =?utf-8?B?cjIrZWR2eUpETGF3ZkVOMHJ6eFcxMEJMOE1pczMwQS93WTdxai83ZWg2aDcz?=
 =?utf-8?B?ekVHTWxaRWhZKzZYTFh1c2lTUk14Ymtoc281Yk5ETlV4a3JYKzdrUDVIUHlL?=
 =?utf-8?B?YzRQVUFTbktGczhrS2psUndTWEVJdnAvVEZHSXV4SFVQQWRsNTVBMW5OZXVB?=
 =?utf-8?B?eEZHaEpFbk1zVW03ZkZLUDRRMEVNSjY3bzd5RFlOTVMvTkJCSE1kUUxXREk5?=
 =?utf-8?Q?yUzmfm?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 23:43:26.8426
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8acae5c2-15ce-43a2-df26-08dd8452f9c1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B072.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6089

From: Nicola Vetrini <nicola.vetrini@bugseng.com>

Rule 19.1 states: "An object shall not be assigned or copied
to an overlapping object". Since the "call" and "compat_call" are
fields of the same union, reading from one member and writing to
the other violates the rule, while not causing Undefined Behavior
due to their relative sizes. However, a dummy variable is used to
address the violation and prevent the future possibility of
incurring in UB.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Signed-off-by: Victor Lira <victorm.lira@amd.com>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>
Cc: Michal Orzel <michal.orzel@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Roger Pau Monné <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Federico Serafini <federico.serafini@bugseng.com>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/common/compat/multicall.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/xen/common/compat/multicall.c b/xen/common/compat/multicall.c
index b17739d218..1740fb2172 100644
--- a/xen/common/compat/multicall.c
+++ b/xen/common/compat/multicall.c
@@ -15,8 +15,13 @@ typedef int ret_t;
 static inline void xlat_multicall_entry(struct mc_state *mcs)
 {
     int i;
+    xen_ulong_t arg;
+
     for (i=0; i<6; i++)
-        mcs->compat_call.args[i] = mcs->call.args[i];
+    {
+        arg = mcs->call.args[i];
+        mcs->compat_call.args[i] = arg;
+    }
 }

 #define multicall_entry      compat_multicall_entry
--
2.47.0

