Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CEA86DD83
	for <lists+xen-devel@lfdr.de>; Fri,  1 Mar 2024 09:50:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687570.1071216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfyaf-0006es-Iu; Fri, 01 Mar 2024 08:50:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687570.1071216; Fri, 01 Mar 2024 08:50:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfyaf-0006cH-Fi; Fri, 01 Mar 2024 08:50:01 +0000
Received: by outflank-mailman (input) for mailman id 687570;
 Fri, 01 Mar 2024 08:50:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=skW7=KH=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rfyad-0006cB-Vh
 for xen-devel@lists.xenproject.org; Fri, 01 Mar 2024 08:49:59 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:200a::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae42b111-d7a8-11ee-afd8-a90da7624cb6;
 Fri, 01 Mar 2024 09:49:58 +0100 (CET)
Received: from BLAPR05CA0030.namprd05.prod.outlook.com (2603:10b6:208:335::11)
 by PH7PR12MB8014.namprd12.prod.outlook.com (2603:10b6:510:27c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.41; Fri, 1 Mar
 2024 08:49:54 +0000
Received: from BL02EPF0001A106.namprd05.prod.outlook.com
 (2603:10b6:208:335:cafe::58) by BLAPR05CA0030.outlook.office365.com
 (2603:10b6:208:335::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.16 via Frontend
 Transport; Fri, 1 Mar 2024 08:49:53 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A106.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Fri, 1 Mar 2024 08:49:53 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 1 Mar
 2024 02:49:51 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 1 Mar
 2024 00:49:51 -0800
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35
 via Frontend Transport; Fri, 1 Mar 2024 02:49:50 -0600
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
X-Inumbo-ID: ae42b111-d7a8-11ee-afd8-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QMoLGM6eSxSq0Be+3WYV2TTYH7/lZfSuqSfLi+j3wDd1FsMPMi+K9vlvSttE697Ldsqxy7lqVAfRG9TgN8j5lGYkjwPk57vph+w7AH/iObvbCSgdFPTw+z9LCXJCa3mGTsSPBQosQXrWlTjk5w9c/66ZCNnEs0wDuig1Qj9OjrjB0ioi16xmDuuQXD9Qwa6suJj374Ew9/zvIT8LnKzEFh64tAzvTykho+BkyRA/TNSIDwjeVZ6S48XuFYvsdcERqMNM5ch6eAFuS1PSEPUT1Ky4ZcHOiEH8K6ViztEL1d831HRDMsEVokr9CH8d6zXC3M3TxagzZEqBSIUnd842DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9mqY6PXoqHTV48+lmvGVft603ncwA2ceDN0myBvjPAI=;
 b=K1hIt33QKlLK2PhOaBUD+SRZtaNrJoDr/CsxmmOKBD/jougnHDdVzt8ZC0HuKTGfIsVffer9WyTb2UOeVJexu0oXi0hln1PDzwjZVdDuSYP/2NEDyH/bEw1HV0PNynKD2GIYuR72l8cseH8UBKP9fk3a0pYhORYkpUXD2DQz2OnyESJ+tamA3ammpflsMJZbM2l/sy+w5j6QosHUGOlSmWilojRX2qWOEs2faY26ME7kqGiij5GTp4MJNKXjxR9cVvw/lpuAmzPzT6DuiqVxsPvUogAXcYIafEGeDN18XJbsgMyacc3Dfr/YMf3DR5VY3RVISH/EQj8LZltXnUIipg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9mqY6PXoqHTV48+lmvGVft603ncwA2ceDN0myBvjPAI=;
 b=rN5IFiCTcuSrYgvp3Hi8Yt7RSd3cs9Ik0epP6SNaF/fqDJ3sH8rGB/8dOlwbApdNOBtAuL91uKcXAlUlC2pg/nN0eP05LMTqhH+1Psvy1BbTfHGctbtx62ArGYw2iWyynoPHS7IAWp+PuPEA2j76iBgVQdUS9X/aNEFCC9uyRaQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH] docs/misra/rules.rst: Fix entry for 20.12 rule
Date: Fri, 1 Mar 2024 09:49:47 +0100
Message-ID: <20240301084947.19241-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A106:EE_|PH7PR12MB8014:EE_
X-MS-Office365-Filtering-Correlation-Id: 666acea2-804f-44e4-7126-08dc39cc903d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5AvjZEtrQz919PqWaJQTrZKJM5cb7ItibPmA6HxB/3bXl2M+8XPYK7IXboqJxn1E0LXAnitSqtpNUveEJOROI18Ok7x4oeB0ByAr7++vlfQBUB2lEOE1e2MENi9d2Vp7vXOZc47eonuewrVU2SGjJk4tbCwHmdfZ+VDrAy7Zb1zcpKDqRjAIpNwklbLXtUahwcye7lbCNf0TsOIvDTLbNEa03dFlQy2qGS3YrosCmypXorKpOlUt+eIkY4IiFFwlVHh0EhfYLlOjlCwOjeYzgg74QIaU3gISnlOv70B1u5xDikTHuJPUNvEx82Rl8b1Dw2rbTtVHxr5mvxfUTb+xIzWWvTuNxUS/IMYTLyEZkbHKrJaTEXz6EcmW8xO1VJuL6jO3vX8rQnHzA90RHkWOlE/bCzn6fKpd6V0/U25NrFEGm1lzOaLgrGpaZiNnOVpyNZFVzEqaGD2H2k/Fpbu6+I84aQkQIcXSwVYJDRblgZ8iqIZOVDU+W7PX6iU9info3K8MLXX4ZnVmQZHbnuNu1dvP2KeBnAT3AhjcIPZT3gyiWSz2dfOwc9a1PLgC1csrBi1eaIXhc/9nKdYCBbNQwnryqK4YPrBwvxPKJ5X1gIcLQPN0G7YAM9V7Q23lGAiScXqfKrMVEzFyI3x39OGaIdkpif2Qq7Y1FhWnkX8AL/QEUy55EhJywdaEriqrCChp2E7/mBZdACwhElqb8DnOkQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2024 08:49:53.4262
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 666acea2-804f-44e4-7126-08dc39cc903d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A106.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8014

Commit 4cac80e22600 broke the CI cppcheck jobs by adding an entry for
a rule 20.12 with "Severity" and "Summary" fields placed in reverse order.
This leads to an error as reported by convert_misra_doc.py:
No summary for rule 20.12

Fixes: 4cac80e22600 ("docs/misra/rules.rst: add rule 16.6 and 20.12")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Failed pipeline:
https://gitlab.com/xen-project/xen/-/pipelines/1196428827
---
 docs/misra/rules.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index c1853669669d..efea063ab941 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -561,10 +561,10 @@ maintainers if you want to suggest a change.
      -
 
    * - `Rule 20.12 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_20_12.c>`_
+     - Required
      - A macro parameter used as an operand to the # or ## operators,
        which is itself subject to further macro replacement, shall only
        be used as an operand to these operators
-     - Required
      - Variadic macros are allowed to violate the rule.
 
    * - `Rule 20.13 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_20_13.c>`_
-- 
2.25.1


