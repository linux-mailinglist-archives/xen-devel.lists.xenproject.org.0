Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0204853ECA
	for <lists+xen-devel@lfdr.de>; Tue, 13 Feb 2024 23:34:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680154.1058071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ra1LU-00074H-GT; Tue, 13 Feb 2024 22:33:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680154.1058071; Tue, 13 Feb 2024 22:33:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ra1LU-00072K-At; Tue, 13 Feb 2024 22:33:44 +0000
Received: by outflank-mailman (input) for mailman id 680154;
 Tue, 13 Feb 2024 22:33:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kFBu=JW=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1ra1LT-0006lq-60
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2024 22:33:43 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2412::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f01e1dd0-cabf-11ee-8a4d-1f161083a0e0;
 Tue, 13 Feb 2024 23:33:42 +0100 (CET)
Received: from MW4PR03CA0167.namprd03.prod.outlook.com (2603:10b6:303:8d::22)
 by LV2PR12MB5989.namprd12.prod.outlook.com (2603:10b6:408:171::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.24; Tue, 13 Feb
 2024 22:33:38 +0000
Received: from MWH0EPF000971E3.namprd02.prod.outlook.com (2603:10b6:303:8d::4)
 by MW4PR03CA0167.outlook.office365.com (2603:10b6:303:8d::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7270.39 via Frontend Transport; Tue, 13 Feb 2024 22:33:37 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E3.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Tue, 13 Feb 2024 22:33:37 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 13 Feb
 2024 16:33:36 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 13 Feb
 2024 16:33:36 -0600
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 13 Feb 2024 16:33:35 -0600
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
X-Inumbo-ID: f01e1dd0-cabf-11ee-8a4d-1f161083a0e0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CpUVo+0Ov3DJce4tEQemvjKriQZTUEv2ohOAFSqeQu41NBH3t4ui2ybyzAacf6qOD0iID1GMW12hoReM1jo3K2WgfU38OzG8xaarYZkIWI7R8cABj7cYTmAQvSZCbgkiZT5NtBC8Edl/wjR4/nPTzWMXS8IaKgBFMJx0aVabVqfQGvJ7HP7iAx8+DMf9Bp53pkQPb8GqBjWy5jUhzANEzSqzpPiK0ohHxct7KqjhCLt4ci4NT9Z7w8vCNSO9zVLLXF/nj0J26f836LFo4Ka+RSkONO3sy2maVaiRlB2emzj/k1VEQPCkNc+sq5eXvTv6QVLG3F+0ldUhSA0SO4VeNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p3zfWGoUqrVwRJH/yoaYwBvU4X2LEZOeMLmtpjXSpRM=;
 b=SjHTdDUzkwzHQZjvwfqQ4qPXYc84OZrSMpTuFJDKStvNHZCTy/8UZOuCJSu9FDF6j3tO5ZxfZxEsO0F3DzbJqVpMwqswD35xsAcgyPNIS9aJ3wDZJ9pOakEbJxBtKzDdfjPCW+biA9yPBTVH3nLdkJ8d9ZtRBWvS7WUz2GBM5IJ7DuCiPh6I7rlkEO7jx+EfFynPhXbX/NGkRWYv+y9ezvGdtULW/akYoLsRZ4//NZEEVBCvXz6yFvzE6pLTVq4dl6QmMJ1jRja/A9MFhdJUyrPoxwFuRXC/mhBQGOob/M5LXq9f0NVMdlAVzLUpxchWwMPRAgmgBRVf6ceMqb5pKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p3zfWGoUqrVwRJH/yoaYwBvU4X2LEZOeMLmtpjXSpRM=;
 b=eSbQ8sdRUu2GhCjyVh3Lp10zLLDgeQZ5CpGEwRKn2jG45RPltBqjj4Y26Uf2J8aTu4sEIXVdejrCc42E5tnPHyEacq4gO4GraG8j/iSGzYthG13zffXAMPI7HEsrhoc7Bhs57LVVH0+Y06rxhCRCDj0tp89vSyyHElww2fLpfNw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <stefano.stabellini@amd.com>, <andrew.cooper3@citrix.com>,
	<jbeulich@suse.com>, <george.dunlap@citrix.com>, <julien@xen.org>,
	<bertrannd.marquis@arm.com>, <roger.pau@citrix.com>,
	<roberto.bagnara@bugseng.com>, <federico.serafini@bugseng.com>
Subject: [PATCH v2 1/3] docs/misra/rules.rst: add rule 16.6 and 20.12
Date: Tue, 13 Feb 2024 14:33:32 -0800
Message-ID: <20240213223334.3693410-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2402131431070.1925432@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2402131431070.1925432@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E3:EE_|LV2PR12MB5989:EE_
X-MS-Office365-Filtering-Correlation-Id: 21879c1e-281e-44bd-0aee-08dc2ce3d21e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TjsqiEo5Rs1uKXDoH6YyqaZA3Rb4eP44xMs5DU61x45jQy4n+QCvJbn3A3yfaiN0VhlTi6eOwcngJWK8bF9m/qD16QlWA+JEvYOjfNQ1C7X66ZyJ6fLgQm2tKelPenBnlFNIxRbF7ptud/k/+oc6IVWezqqBbMu1zsO3JyrZvNl68xUdncWgVScCKhfZMwJcOVbI9bkLaBFJbFiHUJjRCihTLelQNW+Yu2P8R6CC6vqfx3AvpBI0HTZEM0+YUBFeiiN0Jstn0XldUhzqtRWZiB2ICbnowUVAxQ7TU3MrnGnM/gnPstrUPP+OHr6n0VB0npqL0ve7rF9CZFw1BrdYBnCyT1hPOY1Q932CA3fI6eZSsChdHFV3G+uAvA9oTBrEJ0RStAM5EF8+c96N0iO/Bst0nxdxs+WjHCxejcPEF4JVZibrHTE7nri8NJJkaOeOYSyBOs29BAPTyTfxbTorN48JZefVcJzSJpELXJgQVvyRdLgeQWO+7GhtGUkembNCLDnmDKYABCBcsLYXkVL6T3Wf4P/ssE/yoa4TYHe+R5qQO3uPkQxrqHm8/IiQnI6sb/kT5K7+PXMOpY4VtmUmLzvhniTYo9qzxfGxuvDpBzpr2KRF7ynb2JovwD0qDEhr
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(39860400002)(396003)(376002)(230922051799003)(82310400011)(186009)(1800799012)(64100799003)(451199024)(40470700004)(36840700001)(46966006)(36756003)(8676002)(426003)(2616005)(26005)(1076003)(41300700001)(478600001)(70206006)(8936002)(5660300002)(4326008)(6916009)(54906003)(70586007)(6666004)(316002)(86362001)(82740400003)(81166007)(356005)(336012)(44832011)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 22:33:37.2744
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21879c1e-281e-44bd-0aee-08dc2ce3d21e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5989

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 docs/misra/rules.rst | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 182331089d..c185366966 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -478,6 +478,12 @@ maintainers if you want to suggest a change.
        adhere to Rule 16.2 would result in increased complexity and
        maintenance difficulty, and could potentially introduce bugs. 
 
+   * - `Rule 16.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_16_06.c>`_
+     - Required
+     - Every switch statement shall have at least two switch-clauses
+     - Single-clause switches are allowed when they do not involve a
+       default label.
+
    * - `Rule 16.7 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_16_07.c>`_
      - Required
      - A switch-expression shall not have essentially Boolean type
@@ -554,6 +560,13 @@ maintainers if you want to suggest a change.
        evaluation
      -
 
+   * - `Rule 20.12 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_20_12.c>`_
+     - A macro parameter used as an operand to the # or ## operators,
+       which is itself subject to further macro replacement, shall only
+       be used as an operand to these operators
+     - Required
+     - Variadic macros are allowed to violate the rule.
+
    * - `Rule 20.13 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_20_13.c>`_
      - Required
      - A line whose first token is # shall be a valid preprocessing
-- 
2.25.1


