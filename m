Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A741A99743
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 19:56:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.965076.1355741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7eKq-0002AF-Fs; Wed, 23 Apr 2025 17:56:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 965076.1355741; Wed, 23 Apr 2025 17:56:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7eKq-00027i-C3; Wed, 23 Apr 2025 17:56:36 +0000
Received: by outflank-mailman (input) for mailman id 965076;
 Wed, 23 Apr 2025 17:56:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V8j8=XJ=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1u7eKp-0001gW-1c
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 17:56:35 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2009::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48dde7cc-206c-11f0-9ffb-bf95429c2676;
 Wed, 23 Apr 2025 19:56:30 +0200 (CEST)
Received: from BN9PR03CA0923.namprd03.prod.outlook.com (2603:10b6:408:107::28)
 by DS0PR12MB7996.namprd12.prod.outlook.com (2603:10b6:8:14f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Wed, 23 Apr
 2025 17:56:25 +0000
Received: from BL6PEPF00022570.namprd02.prod.outlook.com
 (2603:10b6:408:107:cafe::e) by BN9PR03CA0923.outlook.office365.com
 (2603:10b6:408:107::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.37 via Frontend Transport; Wed,
 23 Apr 2025 17:56:24 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00022570.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Wed, 23 Apr 2025 17:56:24 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Apr
 2025 12:56:24 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Apr
 2025 12:56:23 -0500
Received: from xsjstefanos51.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Wed, 23 Apr 2025 12:56:22 -0500
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
X-Inumbo-ID: 48dde7cc-206c-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FjMmHs99SVN4Cimq+1M6gf60/LwLgvGM1dxniWUpeigaFMWC81FJ+q2QzlLJDmQSf4V8oF24xL2rJ/rghmbe2dnB/uIW07uhsMJ5GGwUf3e7lkMZHxsVH3J3nVHbLZ2PzzqgfoMLIcetHCta1uk5aD3DEy0Eh6ScrRoR6YQyDkp4ZVZ0n/yUgjrVNVmrEJovR7Bo9gAjIHsJcXQqvxOVRPIpV7oacVzrvruSjw2nOO+nomYkobV/TAVElq5NRtGRmKj35kf4mHDY8ghckwZNKYxEJ0HiGDzn8nti6BzM6NyiBnh2FxPZkKNw8jKoQk5MePAhagwQEzyy71rrsoEeEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kE8TlEXpMEGDLCR5A1KZPRKIoivOfgWyVNytlePMvB0=;
 b=jGOcMya7XFJiFLnDwWqSBenOUhpaCmUG4LA1hQyRcQqBtTBk003FF/JHPvhC4rSg0npiGjXqITyLH9Lb9JmjLDrgKX2sOCFzfDauZogBuck9rm6SRRO76v44k37+VU/46paaniviZCF1FujmgjkjziZmcXPyHSi10xzFP9bTNSFIZIGn/eMWnoXPf2bi5skFlq7yrIexJhwi/Odrxix0nz0x0qG2gpJ3HvCRqK9pib16J0aHD4cZ7drisfjP9BZX0c73TAYz1FdS5QFR4i2KlDpXEdeZtd6soYJWs6fsJZFwTPSuSkmmGo2kSz0FJPjDqCCldCFFdS/O0PBBgj2FOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kE8TlEXpMEGDLCR5A1KZPRKIoivOfgWyVNytlePMvB0=;
 b=jZ/aoXbnvhkqkr+gpDaOGnds0rolqgfrLuL9MfzidKDEfNz194mwAe7xkWdHh3LbAYwreCyPG3K6mP4qcIsjUzIP2fwq0QWdeWNnCPHyJOHM6N1QdfW/VF3Jj5JHRqzdYtoHbsoQPG/zlR1514IvPycnSckxvMxc64jVd1xd94s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: <victorm.lira@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Federico Serafini
	<federico.serafini@bugseng.com>, Victor Lira <victorm.lira@amd.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>
Subject: [PATCH v1] misra: add deviation for rules 21.1 and 21.2
Date: Wed, 23 Apr 2025 10:54:27 -0700
Message-ID: <9e1210f2a9c794d68dcc6b897239b228b141296a.1745427770.git.victorm.lira@amd.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022570:EE_|DS0PR12MB7996:EE_
X-MS-Office365-Filtering-Correlation-Id: f064dbc8-436a-4c67-d4ac-08dd829029ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NUQ3ajFzSkQycnRPbnJwSG5KTUF6Ymhzd2F0S0NXcVlzK2hiNHpMSVpjM2Qx?=
 =?utf-8?B?YUc1T3FvSDIzT0VtdU1VV0dBbWRvb2ZRWjhvanJmajZjZjJubjA2N3JwYjlV?=
 =?utf-8?B?RkJnMVB3RFd2SkF4WUdVbkxYQncyR0NET0JybXp4K2R0cVR6VXIxUGdHT29i?=
 =?utf-8?B?UkxsNzlmUE5LTThtbzRzdnNlOHZIZUMxRzdVNXF6MC9uVGxabWVEZUU2ZzQ1?=
 =?utf-8?B?VnhQcjFRYWxyOVhRY2xSMzR4Z0p3a1ozUndVcmE4czhxaXI2Q1NvOXhCOWpO?=
 =?utf-8?B?dDkwWWszamgrcmlvSkdEbC9YQjR2RGtrK2FVYm1qUlRjWTVsNkFCUUN6ZlA0?=
 =?utf-8?B?eE9jY3VWNy9xajhFUmF0UkhKYmFhRGNqc053enMvbDBjSGRUTkw0VkcxN1Av?=
 =?utf-8?B?UWc1ZWZ0SG5IWFMrcGlNMmdhWnFpNVVuNzBZcjQrcGNPZm9Zd0h3MUMvK2dK?=
 =?utf-8?B?M01MZmh2b3FjZDZGRWtOeHphNzRIY0V0YXR0bXNtNFJnUmZYNkNnSzNHTFVX?=
 =?utf-8?B?eEFkbkN2a05VdjJLTFplNHZ1d1lmYmtieE5sNmlEUjZsdVY1NWRMQi92VU9v?=
 =?utf-8?B?bUE3NElxOC9CZ2Q0OUdkWjQ1ekpWZjNzWGpFUGZqQXFYejhxMXRYZThGeFZM?=
 =?utf-8?B?UDhTVTIyTkZZblVGd2pzQ2NON2s5NFk1L2RWU2R2bFBKVXJHTzBxN210VVRy?=
 =?utf-8?B?WWNhQzJ5OHRWb3ZXSk9FQlpXQUI0dGdxajBIbmkwa0IyR0xHbm9tZ0NxNkNL?=
 =?utf-8?B?ZVU2UCsrL2xMa1NyS2NoVzhYZWtyT21PcEljRUE3SDhHUjNNRFJ0cFd3Njdx?=
 =?utf-8?B?OWUrTlJSOUNsOHgwVDNtRThSaForSWlxbEVhUDhjbk9jdXdSWjJDRUJMQUZI?=
 =?utf-8?B?NEdpTnBUVm4ramVxYUhPM1Y3ZUhDU1RHbVFVVi9PZ0RzdEswVmZkYlptdzFz?=
 =?utf-8?B?Rlg3WG5hcWNXVTdaWnNlRTFBQkdNK24rOGRPQ21NTDJRK0VUOVNUTjNwcm9l?=
 =?utf-8?B?cmV0Z3pGYytpdDdiVmUyUWxkV3pWSEk1Q040OWJWTFBpRFpWRU5hTS9BYWp1?=
 =?utf-8?B?MGZtUnJGU05kUU85emd1aGROSWJvdmlRcUpzdmp0anFuQk9Ydm4xYVprRytj?=
 =?utf-8?B?QVA3NHliYVExN0Z6MWM4VDRzWjRGZFlVQXkxTUZwcFZwTS8vRUVCNG5TeU1Z?=
 =?utf-8?B?Q2xZNzV2eW03T3VPMXVKNXFuNGVUSDdQdlo3ampseEtBVHIvcXpkZ3p6L2wy?=
 =?utf-8?B?SUxnYllVUVNlQlBaNGk4WTlCTWhrM01Lby9KNG5jNVRteGFEUHhoNk80VTRP?=
 =?utf-8?B?VDhFL21Nb3JVbDc0a2FCTFdqd3R2N2gzWDFxY3RVVjF4TWNhRFlSREtnMjRi?=
 =?utf-8?B?OXp5TFd0bUlpRFRoZ0d2WE9BV0lLUFBuRVMxb0JxOFNqU3RTbURTWmRaaWJh?=
 =?utf-8?B?Q3JSRS8vVHpxQU9JTE42Qi83dW9pamtZQk9XNFRiRWtaeDhVKzB6M1A4R1NT?=
 =?utf-8?B?aVVaT01wUk1TZ1M3clRveEVWdVZ6SEhZd2N2WlNmekNWdFU3blJzbHhhTUpC?=
 =?utf-8?B?RytUdHBPaWxuNzZsaURJRzJEWmZLSllHZTAxVzhESDlHRk90OGUvalU0aWRt?=
 =?utf-8?B?YlJWTXZOMmJieGNQaktrcTVKVjNJa2lkZU9JRmxVcngvMFZmVG1jemFRQzZ2?=
 =?utf-8?B?bkhVczJUQytZTkp2QjJNRCsyZWh2VUZSVUhoRWpXeTdHbWlkdG1sMUdhbzNt?=
 =?utf-8?B?THFRRkgxaUtQYnlqQU9VTmVOekgxU3pXNW15ZktsVG8rbWoxZTV0MjBEQzF4?=
 =?utf-8?B?RjVIUjlpcjhBZEprdEphcDBnL01pRGk0VURPdEhySUVVWEx6Qm01d3FCZkxp?=
 =?utf-8?B?UENuZXRrVEQ1elBTZmw2alNyQ0xISjVzSnFEYWl0QnpMZTliNGdhRDhFajI5?=
 =?utf-8?B?d3V3ZFZtVzVmQ0pOdFJtOVhmYldjSEJOTVpMN01iNXVoQ0FQVDR5dnRiS3NH?=
 =?utf-8?B?VUxqV25QVkc3aWdyQm1EYTVuZEVKY3c2SWJ3M0V6OEttdVlLSTNDV29xMFpM?=
 =?utf-8?Q?55FOqx?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 17:56:24.4339
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f064dbc8-436a-4c67-d4ac-08dd829029ce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022570.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7996

From: Nicola Vetrini <nicola.vetrini@bugseng.com>

MISRA C Rules 21.1 ("#define and #undef shall not be used on a
reserved identifier or reserved macro name") and R21.2 ("A reserved
identifier or reserved macro name shall not be declared") violations
are not problematic for Xen, as it does not use the C or POSIX
libraries.

Xen uses -fno-builtin and -nostdinc to ensure this, but there are still
__builtin_* functions from the compiler that are available so
a deviation is formulated for all identifiers not starting with
"__builtin_".

The missing text of a deviation for Rule 21.2 is added to
docs/misra/deviations.rst.

To avoid regressions, tag both rules as clean and add them to the
monitored set.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
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
 .../eclair_analysis/ECLAIR/deviations.ecl     |  9 ++++++-
 .../eclair_analysis/ECLAIR/monitored.ecl      |  2 ++
 automation/eclair_analysis/ECLAIR/tagging.ecl |  2 ++
 docs/misra/deviations.rst                     | 26 ++++++++++++++++++-
 4 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index 2c8fb92713..ffa23b53b7 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -639,8 +639,15 @@ in the expansion."
 # Series 21.
 #

+-doc_begin="Xen does not use C and POSIX libraries:
+identifiers reserved by these libraries can be used safely, except for those
+beginning with '__builtin_'."
+-config=MC3A2.R21.1,macros={safe, "!^__builtin_.*$"}
+-config=MC3A2.R21.2,declarations={safe, "!^__builtin_.*$"}
+-doc_end
+
 -doc_begin="or, and and xor are reserved identifiers because they constitute alternate
-spellings for the corresponding operators (they are defined as macros by iso646.h).
+spellings for the corresponding logical operators (as defined in header 'iso646.h').
 However, Xen doesn't use standard library headers, so there is no risk of overlap."
 -config=MC3A2.R21.2,reports+={safe, "any_area(stmt(ref(kind(label)&&^(or|and|xor|not)$)))"}
 -doc_end
diff --git a/automation/eclair_analysis/ECLAIR/monitored.ecl b/automation/eclair_analysis/ECLAIR/monitored.ecl
index 8351996ec8..da229a0d84 100644
--- a/automation/eclair_analysis/ECLAIR/monitored.ecl
+++ b/automation/eclair_analysis/ECLAIR/monitored.ecl
@@ -79,6 +79,8 @@
 -enable=MC3A2.R20.12
 -enable=MC3A2.R20.13
 -enable=MC3A2.R20.14
+-enable=MC3A2.R21.1
+-enable=MC3A2.R21.2
 -enable=MC3A2.R21.3
 -enable=MC3A2.R21.4
 -enable=MC3A2.R21.5
diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
index 1d078d8905..3292bf751e 100644
--- a/automation/eclair_analysis/ECLAIR/tagging.ecl
+++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
@@ -88,6 +88,8 @@ MC3A2.R20.11||
 MC3A2.R20.12||
 MC3A2.R20.13||
 MC3A2.R20.14||
+MC3A2.R21.1||
+MC3A2.R21.2||
 MC3A2.R21.3||
 MC3A2.R21.4||
 MC3A2.R21.5||
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index fe0b1e10a2..88328eaa8a 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -587,7 +587,31 @@ Deviations related to MISRA C:2012 Rules:
        construct is deviated only in Translation Units that present a violation
        of the Rule due to uses of this macro.
      - Tagged as `deliberate` for ECLAIR.
-
+
+   * - R21.1
+     - Rule 21.1 reports identifiers reserved for the C and POSIX standard
+       libraries. Xen does not use such libraries and all translation units
+       are compiled with option '-nostdinc', therefore there is no reason to
+       avoid to use `#define` or `#undef` on such identifiers except for those
+       beginning with `__builtin_` for which compilers may perform (wrong)
+       optimizations.
+     - Tagged as `safe` for ECLAIR.
+
+   * - R21.2
+     - Rule 21.2 reports identifiers reserved for the C and POSIX standard
+       libraries. Xen does not use such libraries and all translation units
+       are compiled with option '-nostdinc', therefore there is no reason to
+       avoid declaring such identifiers except for those beginning with
+       `__builtin_` for which compilers may perform (wrong) optimizations.
+     - Tagged as `safe` for ECLAIR.
+
+   * - R21.2
+     - `or`, `and` and `xor` are reserved identifiers because they constitute
+       alternate spellings for the corresponding logical operators
+       (as defined in Standard Library header `\<iso646.h\>`). Xen does not use
+       Standard library headers, so there is no risk of overlap.
+     - Tagged as `safe` for ECLAIR.
+
    * - R21.9
      - Xen does not use the `bsearch` and `qsort` functions provided by the C
        Standard Library, but provides in source form its own implementation,
--
2.47.0

