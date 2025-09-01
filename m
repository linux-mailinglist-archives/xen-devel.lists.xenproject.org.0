Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF4FB3E2EB
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 14:31:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104668.1455702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut3h3-0006wy-HQ; Mon, 01 Sep 2025 12:31:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104668.1455702; Mon, 01 Sep 2025 12:31:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut3h3-0006uY-Dr; Mon, 01 Sep 2025 12:31:29 +0000
Received: by outflank-mailman (input) for mailman id 1104668;
 Mon, 01 Sep 2025 12:31:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jJuX=3M=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1ut3h1-0006uS-Mk
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 12:31:27 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2009::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 929f6354-872f-11f0-8dd7-1b34d833f44b;
 Mon, 01 Sep 2025 14:31:25 +0200 (CEST)
Received: from MW4PR04CA0139.namprd04.prod.outlook.com (2603:10b6:303:84::24)
 by DS0PR12MB7557.namprd12.prod.outlook.com (2603:10b6:8:130::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.24; Mon, 1 Sep
 2025 12:31:20 +0000
Received: from SJ5PEPF000001F4.namprd05.prod.outlook.com
 (2603:10b6:303:84:cafe::d4) by MW4PR04CA0139.outlook.office365.com
 (2603:10b6:303:84::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.27 via Frontend Transport; Mon,
 1 Sep 2025 12:31:19 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F4.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Mon, 1 Sep 2025 12:31:19 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 1 Sep
 2025 07:31:18 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Mon, 1 Sep
 2025 05:31:18 -0700
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Mon, 1 Sep 2025 07:31:17 -0500
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
X-Inumbo-ID: 929f6354-872f-11f0-8dd7-1b34d833f44b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PFKkVpVgr2XTVtSAAqL573ZNe7lSimJRG3taNV0kWoY4DHzl/rRKaYMgfY3xUnIuF0lR1m2LBStNE4e5A218G1jc8xXBcpw9rQRyCvNzDjHtMj8o9xIwB0G6xJpnitCpcNYDwI+I1GNopxTxnqF26Y1D65tc+6BH0SbFJhn0x0hPUc0WzWv/LIwNo12h61iuyt0qZPYd8z3n7LcNewL6uLGc3c/G0SdqsrfewlQu2YFe8Ldm0q8z0OWql5Lcc6SWm4kL2BtZqyOj4aFkaW/AZPa4QP9GqppJvc4125zhuRKMSRbvYZ0W0Jd871+r0Ga8VE+1oUg8btmyqY/VeZRrSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZINCsSVfi528h5fUVouY6U4yEbjaaOkc6p5bmzSrQsY=;
 b=RYIPpE83wJ1WPYUexb3iXSjemkAmIcOWaKhapE3sxX6AbDaq813+dZANU/f0SpsoJiEIEHCZ7F8IE8yzVgMakt77byygR/gLg+4SsGXueoejSfWqgQO/iUxI0r18MQ5E9fC9LV3ZXBuA39XcRkQ3FlPpdZPqwtS+Y06kXyAQhWGSJLQNES5B5Cb5TX6c0Z5UaOZK2FMabQfdXXbjV1JLYghrzTm0yJvWs2kCtR79j3KBEDqADasK76Z/G3cvqNN58s91WfIEfMmCogcLyF9TsuScNFijhapMlmFUAvPbkNopB24Y264tBBxs9Vyd4W4rWUvzQnkiLQvdkAwaDaglvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZINCsSVfi528h5fUVouY6U4yEbjaaOkc6p5bmzSrQsY=;
 b=SE5Ml0EpY7d3S+3u04jORFIq8uXTWNVyPL1YdF2I8otoTzeVC3iaFbMeHnDepK5Tkd6jb20ixhW9jtEFMwd3Xn/xhvsEGASWhG3eJaZMlv7Gpa3Q60leQEe4aO05efE+9YBW2zvac/dhI33LCv20eoQC5ob6/BB06Enf0BGF56Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, <volodymyr_babchuk@epam.com>,
	<mark.brown@parrylabs.com>, <matthew.l.weber3@boeing.com>,
	<sookyung.ahn@boeing.com>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: [RFC PATCH v1] imagebuilder: Add a script to check the sanity of device tree
Date: Mon, 1 Sep 2025 13:31:03 +0100
Message-ID: <20250901123103.11418-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F4:EE_|DS0PR12MB7557:EE_
X-MS-Office365-Filtering-Correlation-Id: 93d8869b-bedb-4074-d30c-08dde95373dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QWJua0QwSVl0UDJ3K0NRWVhQYWFSRXFRdENWZVpPMzRWRXJxb3RSVGFWNHc1?=
 =?utf-8?B?KzZsZngzNnJOU2F4QTdiQXp6all0cFZMZFVUenZjTnFtMmJVMkE4WUhaRmts?=
 =?utf-8?B?UklINVREOG9lL1dOcm4vYStKbEpPbnByUHhyVGtZNXNVTVY5d0tZUVI2L2xN?=
 =?utf-8?B?WEljZG8rZUNmbXVYa3JRSlpvM09VQkREVzJCVkd3THF0NUFRRHNPMkp6YlFl?=
 =?utf-8?B?Z0lIeURpYWdHNHcxemNmb0Jxc0t4YWNBNVYvMmRJL05HOEdWV2dOQ1NnY2dk?=
 =?utf-8?B?TGVnWE5RYm9ZS3prM2lnS2FldlJFR1JJN01YMXo1eEc1Q1NpSURFZTZ1N3F2?=
 =?utf-8?B?NlpwNUJmQTM1R1pBUGlxc2JBRGNGam1hYU42VjhXWEV3a005YVF6Z0c0ekdJ?=
 =?utf-8?B?QTNVMzJxOGFqMnhiY0VhazQvMFhHRDRIMnBDMHdxdHBEM3haTHdvMzE2Y3lm?=
 =?utf-8?B?dUdvUXNIUlJmOXlmNWN0VmZtUXpCR3RVb1JoNE44aWNVUERNUndpZG5yeGpV?=
 =?utf-8?B?WGxPcmhaZ3dYUEtUVUNMS05HNSsxNEVBVlZrSFhiZy91Y0NmZU9DL1dNT0Mr?=
 =?utf-8?B?R1Vqb2QwZGMyUm5oaWVUQ2Jvd3FEdjdBdGFmcXlmWnB2b2lMWjBhWmZ6NXlu?=
 =?utf-8?B?ZVloZmVlUUx6U2FRemtIV2lOM3d6MnJqZW1DcmExSVhPK0YrU2l0SkkxSHFN?=
 =?utf-8?B?VnhWY3VBckFjdmh5OGEwSk1YMWhVVTFQaS83VktoVjJMUEJIZjFiQzQ1VkRN?=
 =?utf-8?B?cUdRQVFFeVk5TnhUcXN6b1pjanJLTUFMT0RmM1h1VzNJcGRHdWQ4Q1ZHbXhE?=
 =?utf-8?B?UHk2R2VxRDNPOFZwSWJGNmt5N1A5SUx2M3BaYW5OOFJTRytHZmxrL3lFZzNH?=
 =?utf-8?B?czVtREVNMzhvUW5WbmRzbzdVZjA4ajhUMTJjNXhHMnkwZnhRT25GOElKYWNs?=
 =?utf-8?B?NDRpWnRWQ0JnK2FiNnVobFlnZ2J3b2djYjZteXY1aWR6NkFCNDBFbnBwMHRL?=
 =?utf-8?B?Nmx6NFZIekpyRUIyVnVZakZ2aGdUYkYzSkU2WDNIOXRrdW80YmdoZkFaWUdZ?=
 =?utf-8?B?MWp0QUVxamNhWjE4WlJHUDV3UWxxTzlqZktQbDVkRXByT3B4WnhvKzBKa3Ux?=
 =?utf-8?B?akEzS1pYc2Y5UTg4MTR5c3ZZNEZYdWNGYzVUVmhvaGxibC8vbk1oSWdJVTZk?=
 =?utf-8?B?WFkzbWxjOHY1UkVlbzIxU0hKdlJIUGhoeXNnNGRTOFk5RnA4a2wxV1grQWpQ?=
 =?utf-8?B?Y3RTZWNSdlM4UHRxd3hIRW0rZVFrUHp1dUI5OU84eXZqeVc4YktuYUxJQkdG?=
 =?utf-8?B?YjcxbDRnRk91RE9UU1ZTS1llMmZmUVF6VEN0MDFqY3dTVE5mb0VnaE85SC82?=
 =?utf-8?B?YnlZcDY0Q0l6alJBVnY5Q090blR1V1pqbC9LbE9qVmRUZjRrUk9LS3laeFo5?=
 =?utf-8?B?UFdiT1daWlVNd3ppZ3p6U21uSU5qeitMV2Y0WkdzZUlPWUZUdFV1MnZyajhP?=
 =?utf-8?B?U2FKUWFycUZMS3dpMkZ2LzBIazgzRDFuaUdIN3liR1oxd0U1cXFJVnY0STJD?=
 =?utf-8?B?anNXQm9qYUtFclNsSzB2RnhuUmcwN0d0ZC9QN2lmQVhwOVdoeVVHck40MUQz?=
 =?utf-8?B?dHh5ZjFiMFgvMCtYTVRFU3ZMMkNKMzd6dGpreFdvYUNTK2NpZlBtK252UVBz?=
 =?utf-8?B?QnA1Rm1TamlaM2QrM240bHByNlFiY1VpTU5uVkNTZXhMR09aTDNvVWFoT3Ar?=
 =?utf-8?B?Q20ybDY3N2F6cktFdURXNEtPYWNnWlQvb0R4OEFWNHA2NzdwWDEyWHVrUGg5?=
 =?utf-8?B?SjJkbDJkOWpxRlpCM3dLalpYcktEQXl5OTNsaUNNKzgxRDArdTdZN3M2R1Z1?=
 =?utf-8?B?TThjVHhzTTlSSFVScytmZUt2UlF3ZkRvYjFOeEl1WjUwb290WCtzZm9oeWpV?=
 =?utf-8?B?TUZTVzY1UWRqTmpHeHJhZTFXUzNEQWNNa0N4NXBsK2FRUmsvRnQzaGx3b3g2?=
 =?utf-8?B?enhZbTRGdlpBZi9xMVZFY21GZ3NiYkRKSWJIYWpPalM3L2w2ZUN1ampvVHND?=
 =?utf-8?Q?mj6NDm?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 12:31:19.0611
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93d8869b-bedb-4074-d30c-08dde95373dd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7557

Xen gives a panic if certain nodes are not present in the device tree. In order
to prevent this panic, scripts/dt_sanity.py is written so that it checks if the
node/s are present. If the node/s are not present, the script gives an error.

User is expected to run the script against the device tree before booting Xen
with dtb.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---

Hi,
 
In some of the discussions with the safety experts and upstream folks, one issue
that kept coming up is there are lots of ‘faulty system configuration’ and
‘impossible conditions’ checks in Xen.  While these conditions can rarely occur,
Xen would panic if any of such condition does occur.
 
For example, during bootup, Xen parses the device tree .
It checks if the device tree nodes are present for timer, interrupt-controller,
memory, cpu, etc. If these nodes are not present, Xen panics.
 
As part of safety certification, we have 3 aims :-
1. We want to reduce the instances where Xen can panic. This is to improve the
robustness.

2. We need to define a safe state when a fault is triggered in Xen. As faults
(like the one mentioned here) are triggered during boot time and it is due to
incorrect system configuration in device tree, it is hard to define a safe state.

3. Avoid validating all the instances of system configuration errors. By having
an external tool, we push the responsibility to the system integrator. The system
integrator needs to run the tool to validate all the properties that Xen checks
for. This can be a justification for the coverage gap for those checks in Xen.
 
Thus, I have come up with the attached python script. In the script, we parse the
device tree to check if the nodes with the compatible properties (as specified in
config file) are present. If not, the script will throw an error.
 
 README.md            | 13 +++++++++++++
 scripts/dt_sanity.py | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 scripts/dt_sanity.py

diff --git a/README.md b/README.md
index 7b68cf5..413de3f 100644
--- a/README.md
+++ b/README.md
@@ -456,3 +456,16 @@ This section defines config file debug options
 
 - DBG_FDT_PRINT_CHOSEN specifies that U-Boot script command to print DT "chosen"
   node will be added to the boot script.
+
+## dt_sanity.py
+
+This script parses xen device tree source and checks if the required nodes are
+present. If not, the script gives an error.
+
+To use it, first write a config file like `config` where you can keep the
+compatible strings to be checked:
+
+```
+arm,gic-v3
+arm,armv8-timer
+```
diff --git a/scripts/dt_sanity.py b/scripts/dt_sanity.py
new file mode 100644
index 0000000..171947f
--- /dev/null
+++ b/scripts/dt_sanity.py
@@ -0,0 +1,33 @@
+import argparse
+from pydevicetree import Devicetree
+import sys
+
+def load_compatible_strings(config_path):
+    with open(config_path, 'r') as file:
+        return [line.strip() for line in file if line.strip()]
+
+def check_compatible_nodes(dts_path):
+    # Parse the DTS file
+    tree = Devicetree.parseFile(dts_path)
+
+    # Search nodes for compatible properties in the global array
+    for compatible in compatible_strings:
+        nodes = tree.match(compatible)
+        if len(nodes) == 0:
+            print(f"Error: Node with compatible '{compatible}' not found.")
+            sys.exit(1)
+
+if __name__ == "__main__":
+    # Set up argument parser
+    parser = argparse.ArgumentParser(description="Check for Xen specific nodes in a DTS file.")
+    parser.add_argument("dts_file", help="Path to the DTS file")
+    parser.add_argument("config_file", help="Path to the configuration file with compatible strings")
+
+    # Parse arguments
+    args = parser.parse_args()
+
+    # Load compatible strings from the config file
+    compatible_strings = load_compatible_strings(args.config_file)
+
+    # Use the provided DTS file path
+    check_compatible_nodes(args.dts_file)
-- 
2.25.1


