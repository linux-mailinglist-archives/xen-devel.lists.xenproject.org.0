Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0D0B2C059
	for <lists+xen-devel@lfdr.de>; Tue, 19 Aug 2025 13:28:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1086464.1444649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoKUx-0000oz-58; Tue, 19 Aug 2025 11:27:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1086464.1444649; Tue, 19 Aug 2025 11:27:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoKUx-0000mw-2W; Tue, 19 Aug 2025 11:27:27 +0000
Received: by outflank-mailman (input) for mailman id 1086464;
 Tue, 19 Aug 2025 11:27:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TlMz=27=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uoKUv-0000mp-41
 for xen-devel@lists.xenproject.org; Tue, 19 Aug 2025 11:27:25 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2418::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78e0b59f-7cef-11f0-b898-0df219b8e170;
 Tue, 19 Aug 2025 13:27:22 +0200 (CEST)
Received: from SJ0PR05CA0056.namprd05.prod.outlook.com (2603:10b6:a03:33f::31)
 by IA0PPF44635DB8D.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::bcc) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Tue, 19 Aug
 2025 11:27:18 +0000
Received: from MWH0EPF000971E3.namprd02.prod.outlook.com
 (2603:10b6:a03:33f:cafe::91) by SJ0PR05CA0056.outlook.office365.com
 (2603:10b6:a03:33f::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.12 via Frontend Transport; Tue,
 19 Aug 2025 11:27:17 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000971E3.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Tue, 19 Aug 2025 11:27:16 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 19 Aug
 2025 06:27:14 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Tue, 19 Aug
 2025 04:27:14 -0700
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Tue, 19 Aug 2025 06:27:13 -0500
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
X-Inumbo-ID: 78e0b59f-7cef-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yTUS4i/DWTJzO9QapNZpH3V4SU3yXfdu57455jONsxSfkU6YxALOI8FupnbBOmRgkVroLF7UXngkKhBdiOfUv1Lf3HrTOUpVz4iHuEQvOZKmDurIWZQ3t60GXkYyafZKjzkWzABPXqnnKPwxi+mlEjgVtwyD3hxk0PZK0mpuLEZV9PssBeAiu1gV68mxWkX8JIXlCB/RR+XdCXXAYv1fgYO72CBj5PBWH4YG3QZ76ds9790JEQQE9e4Jv795vGBjqDi2s0gNea/kz83anhuEDX0eb1pMJ5WzZVpfDUOoa081uda4LTMWWbXt3jr+XsjOriTK+oYufnC8zBZ3SMNBaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mod91OXSJKMWsqI/Xv5g/tFPiOhHB1wMGsFVxE9S3kQ=;
 b=pwhzkgoqRgxi5crFH61BaM3rJ1oacenvwBnZzfkFx1x5knD449MzqUWXbq1toJq30sSiT79SGP0eD5XEjWVDb0WbI4GaLqonS2nCMAe4w94ZVs8sFAVVr1b6dG1t0KumsBZrz/+XlnMWkSLThER2CjmAVFHC9IqsxylyMxs2tiZ561c2n8MIiMJlW9z73jlPJoRw9jPRQhqCcM3HHeJaV6MnYtKyM1od0kXV9LbocYzxNhsm7fzGDZg8b4qksdREi6xjRvOtsYRsyQslReAoKslXA+uVXXBgbW0ZG4dxBvsfE/ksoSvWThTh5KmmRQC7kLYL48yv4HfFLo8Z54cS7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mod91OXSJKMWsqI/Xv5g/tFPiOhHB1wMGsFVxE9S3kQ=;
 b=SbWTw3NpC3MslQPGCyC9TnkDrQfRcyPU4CJmS1J8BLEeKEohdWxJps+jRglos0DKiRRifY30G9R5VKLZdZ88wXEV5qR6mgE50Bywh4J47IMWp+aj9G1dWEMZKzHZEAoSu5w+Q6VAu5WlGYVB0a2Pb037TwVBw41PESJQy8QA86Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Artem Mygaiev <artem_mygaiev@epam.com>
Subject: [PATCH v4 1/2] docs: fusa: Define the requirements for XEN_VERSION hypercall.
Date: Tue, 19 Aug 2025 12:27:08 +0100
Message-ID: <20250819112709.3789987-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E3:EE_|IA0PPF44635DB8D:EE_
X-MS-Office365-Filtering-Correlation-Id: db9a1dde-e6e5-42dd-c988-08dddf135a04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?D5UBKLcU9fTzyKXuHqyZ+xHU1IyhyOMbqeVXFEGXS5G4gv0WTpXXGPeboHUX?=
 =?us-ascii?Q?hMIYq9pjpJrMHFo70zOC6ZgqWR3z/c71Y4Y9n1YCSdMuSA5M7eMwf0Ys6I4v?=
 =?us-ascii?Q?kWkHrsP8UclpRC/tWqaOBIFbNtx95oPMw1sCCOhh3rJrEwDvu+qiSsnBfPyo?=
 =?us-ascii?Q?W/vVn5NPGfcY/EK/st9/DHVoUATsxpznFEborsQDSQkm/jWdCN6sJ/ylpfRm?=
 =?us-ascii?Q?0DBn8QWfmUmobZ/M1pQlycvTrR+zWaazcgl5T0wHKd0R+h9Kq5/g+Z+XkBu0?=
 =?us-ascii?Q?lSQt5g7HKyLleHFB75QfMT7vDK6kbFzVjOLMHk6iKglSHinjrXAbFEvfz4jd?=
 =?us-ascii?Q?LspIs2KizK4O8hqPa1HmTFA7acZNLxXtTGNur5P1BDP14MqsPboaXjx5/Nvi?=
 =?us-ascii?Q?/3S7ifZyMvL+cnPlLLV8yGEh6L3mOexGktR7GSqRY7QHhs/DTgFUJ/tuTBqN?=
 =?us-ascii?Q?5b1GfC3OLSz+LGbiinDEJ7D0vBdmtANhLDRaEaqr2riN39tqF7q2LtHUwnjG?=
 =?us-ascii?Q?ZC9maz+oUd5Gojvq92LdCwhABeTBWzVz3bzTTKsOTOLzvBIo753e6/g30krs?=
 =?us-ascii?Q?oY9zCvCPlZP0ElP7BxjqvqETWozBcGH6ncYZnTyPsvKu9AmvZm7yVvZ95Q0X?=
 =?us-ascii?Q?DmguSVdDCju+/5Jh4ezhPN5mRaWiMYpGnxEBrKRarD9i+6w12gshN+mvMEXd?=
 =?us-ascii?Q?twsKD3u+7WhnoK1E92fuvlAIjGaeYMQ1z1SWrO1HWKtND/quv3FpmYgpbyKY?=
 =?us-ascii?Q?ikYhSl0PbLFdDYhRZl1YxiLr8V32/G9WRZ/r0SLEzyIDWiYQnixdBUVfDApv?=
 =?us-ascii?Q?9ZWZRZv/HOHF9AarVkRmQLdP8wD91ptLikjnmRWmM6sidz2U2SPFjYuqy+nZ?=
 =?us-ascii?Q?Zei4TojfrLZhNAOkPlBwPIewuO9uC8nCoYiOYRSiVI7T9rSjahSjwkRBOdFM?=
 =?us-ascii?Q?z26qjl0dH/o4doI22j13ROrOi29SNYmv6uN65xc+xP+aGyQ86EecPIdddt8t?=
 =?us-ascii?Q?Yh4RCDuSM90RVQvyJMZv0nEGAS37pfdVoW0RgrTa/jCVB3rtmdRYjn+Wt8gy?=
 =?us-ascii?Q?uZeM3X93lag0YIUfbZfOEPT2HVbhSOYSHfOZDLrV4zZk2SXQ1Kw5vrXwKCmF?=
 =?us-ascii?Q?bWwobMP71fcLm3r4UsYVZ6LJtkoFGcBWK2ijylJWqOOhT5Z5Thetn51Ihw65?=
 =?us-ascii?Q?yRsGHkbY7eEifmm39Uy9Qyfhg7O9LEhJuhmiEYbDVBxV0FYgKgJay73Vgp/0?=
 =?us-ascii?Q?g3T5MuQw279G3YYG1LszwoD5AAvtp55S8wgi8T6vtshWiBnHKyxiwgAUrrRT?=
 =?us-ascii?Q?6u9oY+lSfq7KSAsA/sWT9HWW5bUKVGvMAkNTLxwUinz94qKF+BOqTx2PI5Ns?=
 =?us-ascii?Q?j08VUJaxXRoaTTbZLbGjOPy8Bfs5BNsQXhg/AQvKiR6gZCu9uwkUf2ysrj2d?=
 =?us-ascii?Q?myLA6XoF2vJVs5b05hvhfYRaZbRrmmxIoJs7uZ9mLaQJfevaHLwy+z+TRG+Q?=
 =?us-ascii?Q?jUcnCS1sZhUHqg9tYQntwhHT8bXjZufz41L+?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 11:27:16.2768
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db9a1dde-e6e5-42dd-c988-08dddf135a04
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF44635DB8D

Define the requirements which are common for all the commands.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from -

v1 - 1. Fixed `XenProd~version_hyp_ret_val~1` requirement as Xen does not return
0 for success in all the cases.
2. Reworded the requirements so as to write them from Xen's perspective (not
domain's perspective).

v2 - 1. Specified the register details.
2. Specified the type of buffer.

v3 - Fixed some wordings to make it precise (eg register details, bit fields).

 .../fusa/reqs/design-reqs/arm64/hypercall.rst | 60 +++++++++++++++++++
 docs/fusa/reqs/index.rst                      |  2 +
 docs/fusa/reqs/market-reqs/reqs.rst           | 16 +++++
 .../reqs/product-reqs/version_hypercall.rst   | 42 +++++++++++++
 4 files changed, 120 insertions(+)
 create mode 100644 docs/fusa/reqs/design-reqs/arm64/hypercall.rst
 create mode 100644 docs/fusa/reqs/product-reqs/version_hypercall.rst

diff --git a/docs/fusa/reqs/design-reqs/arm64/hypercall.rst b/docs/fusa/reqs/design-reqs/arm64/hypercall.rst
new file mode 100644
index 0000000000..82ecf690a3
--- /dev/null
+++ b/docs/fusa/reqs/design-reqs/arm64/hypercall.rst
@@ -0,0 +1,60 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Hypercall
+=========
+
+Instruction
+-----------
+
+`XenSwdgn~arm64_hyp_instr~1`
+
+Description:
+Xen shall treat domain hvc instruction execution (with 0xEA1) as hypercall
+requests.
+
+Rationale:
+
+Comments:
+Hypercall is one of the communication mechanism between Xen and domains.
+Domains use hypercalls for various requests to Xen.
+The exception syndrome register should have the following values :-
+ESR_EL2.ISS should be 0xEA1.
+ESR_EL2.EC should be 0x16.
+
+Covers:
+ - `XenProd~version_hyp_first_param~1`
+ - `XenProd~version_hyp_second_param~1`
+
+Parameters
+----------
+
+`XenSwdgn~arm64_hyp_param~1`
+
+Description:
+Xen shall use x0 - x4 core registers to obtain the arguments for domain hypercall
+requests.
+
+Rationale:
+
+Comments:
+Xen shall read x0 for the first argument, x1 for the second argument and so on.
+
+Covers:
+ - `XenProd~version_hyp_first_param~1`
+ - `XenProd~version_hyp_second_param~1`
+
+Hypercall number
+----------------
+
+`XenSwdgn~arm64_hyp_num~1`
+
+Description:
+Xen shall read x16 to obtain the hypercall number.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~version_hyp_first_param~1`
+ - `XenProd~version_hyp_second_param~1`
diff --git a/docs/fusa/reqs/index.rst b/docs/fusa/reqs/index.rst
index 1088a51d52..d8683edce7 100644
--- a/docs/fusa/reqs/index.rst
+++ b/docs/fusa/reqs/index.rst
@@ -10,5 +10,7 @@ Requirements documentation
    market-reqs/reqs
    product-reqs/reqs
    product-reqs/arm64/reqs
+   product-reqs/version_hypercall
    design-reqs/arm64/generic-timer
    design-reqs/arm64/sbsa-uart
+   design-reqs/arm64/hypercall
diff --git a/docs/fusa/reqs/market-reqs/reqs.rst b/docs/fusa/reqs/market-reqs/reqs.rst
index 2d297ecc13..7e3912c8f8 100644
--- a/docs/fusa/reqs/market-reqs/reqs.rst
+++ b/docs/fusa/reqs/market-reqs/reqs.rst
@@ -79,3 +79,19 @@ Comments:
 
 Needs:
  - XenProd
+
+Version hypercall
+-----------------
+
+`XenMkt~version_hypercall~1`
+
+Description:
+Xen shall provide a hypercall for the domains to retrieve Xen's version, type
+and compilation information.
+
+Rationale:
+
+Comments:
+
+Needs:
+ - XenProd
diff --git a/docs/fusa/reqs/product-reqs/version_hypercall.rst b/docs/fusa/reqs/product-reqs/version_hypercall.rst
new file mode 100644
index 0000000000..b824c539b0
--- /dev/null
+++ b/docs/fusa/reqs/product-reqs/version_hypercall.rst
@@ -0,0 +1,42 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Version hypercall
+=================
+
+First Parameter
+---------------
+
+`XenProd~version_hyp_first_param~1`
+
+Description:
+Xen shall treat the value stored in x0 as the command number for the hypercall.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenMkt~version_hypercall~1`
+
+Needs:
+ - XenSwdgn
+
+Second Parameter
+----------------
+
+`XenProd~version_hyp_second_param~1`
+
+Description:
+Xen shall treat the value stored in x1 as a domain virtual address (mapped as
+Normal Inner Write-Back Outer Write-Back Inner-Shareable) to buffer in domain's
+memory.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenMkt~version_hypercall~1`
+
+Needs:
+ - XenSwdgn
-- 
2.25.1


