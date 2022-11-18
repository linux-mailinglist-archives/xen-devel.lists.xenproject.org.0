Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E4462F2E8
	for <lists+xen-devel@lfdr.de>; Fri, 18 Nov 2022 11:46:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445562.700784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovysR-0006UY-W0; Fri, 18 Nov 2022 10:45:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445562.700784; Fri, 18 Nov 2022 10:45:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovysR-0006Lq-Q7; Fri, 18 Nov 2022 10:45:43 +0000
Received: by outflank-mailman (input) for mailman id 445562;
 Fri, 18 Nov 2022 10:45:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nf+F=3S=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1ovysQ-0006Il-OS
 for xen-devel@lists.xenproject.org; Fri, 18 Nov 2022 10:45:42 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7d00::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2519d8d8-672e-11ed-91b6-6bf2151ebd3b;
 Fri, 18 Nov 2022 11:45:41 +0100 (CET)
Received: from AS9PR05CA0005.eurprd05.prod.outlook.com (2603:10a6:20b:488::12)
 by GVXPR08MB7821.eurprd08.prod.outlook.com (2603:10a6:150:4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.6; Fri, 18 Nov
 2022 10:45:38 +0000
Received: from AM7EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:488:cafe::84) by AS9PR05CA0005.outlook.office365.com
 (2603:10a6:20b:488::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13 via Frontend
 Transport; Fri, 18 Nov 2022 10:45:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT006.mail.protection.outlook.com (100.127.141.21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.8 via Frontend Transport; Fri, 18 Nov 2022 10:45:38 +0000
Received: ("Tessian outbound 2ff13c8f2c05:v130");
 Fri, 18 Nov 2022 10:45:37 +0000
Received: from 74e5848c6914.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4DE39858-FB57-467E-9ABF-829731D5494E.1; 
 Fri, 18 Nov 2022 10:45:30 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 74e5848c6914.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 18 Nov 2022 10:45:30 +0000
Received: from FR3P281CA0136.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:95::9) by
 DB4PR08MB9312.eurprd08.prod.outlook.com (2603:10a6:10:3f4::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.7; Fri, 18 Nov 2022 10:45:28 +0000
Received: from VI1EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:95:cafe::eb) by FR3P281CA0136.outlook.office365.com
 (2603:10a6:d10:95::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17 via Frontend
 Transport; Fri, 18 Nov 2022 10:45:28 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VI1EUR03FT015.mail.protection.outlook.com (100.127.144.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Fri, 18 Nov 2022 10:45:27 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Fri, 18 Nov
 2022 10:45:16 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Fri, 18 Nov 2022 10:45:14 +0000
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
X-Inumbo-ID: 2519d8d8-672e-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zPDBV9XWmcg+tmJ+qaggSEwwP7UYQrtfJrIfAn/ghm8=;
 b=gYpMeoi0cAV8S5MEdr2i0zEw2ONGil2iKvajFMMX8o1Ty9L7aWYU+GmCGKffP0cKd6+WL5dJHeIzZMeFYQi+zNWnYZWyj1JzIYxvuFuAtUJQqNen0X4H5hRhhSonVtCAEZ5DrBTooD5yl11aB9u6GPpMZQgH/zMFHE6ohhUYs1k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 761e9207070253d9
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cbsOpHSk60d4zwAv4sREGs6gsp5u516P6BDfuTSrVbygwoDbpclj87i1aBYo8glKU3k8X6oL/Om8WPzel+Gg/3EQMmWk2VYoYQwmdKJwqziIyZ7VTnDX6qqpOmeJa1Wj1rsR0GUeGvSIZgrIMDOWMa+Tk8yFbZSOQLZLCuIo8wsJBhKB74kMaNYgjULIVvo8+llPoopnZFCvkTu/8euqHV0oVRs/QwiNF93YXZx4Qv7jMVHolsU/M2giwV6nrgFp5CCkx/1NXLxgaQb2Anr/2fRJFnfXiyL7zGb3oyb2sYk3XOpQ30pQjH9jQGbUIy20WSuuOeEWNyd6/Y3pMxOOmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zPDBV9XWmcg+tmJ+qaggSEwwP7UYQrtfJrIfAn/ghm8=;
 b=dtH4bsC2F7By9VmmRqd0p0GMNFDgpnWVGepIVGA2li+Bc8ZzpVko7YPH2B+Q2CSkZVB5NZe6zo3UREC/zEaxPMtjOTl3/2pQI1xDswYEZt8JtBtsPeYVCdhjJRXRHBGCUsg3jFDgKpq05zuLme+6TSicJqEn6cX6yT+rT2mppoBc1yuxXPWNOKy28A+3Qu0Xwkknx4rWrr7Pe1AssT+mvcF0LNRGO2izUyoVfQB+OsoIQe1iUKnYvRJvlFPaHw1lO4bWxMe3CpduTFzIS7Go5oF7mXeA9+TCu951OkyADoHFZ5bNay2mo8LpVtA7wYIEi59zlqB7LgDNSPraPxR2ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zPDBV9XWmcg+tmJ+qaggSEwwP7UYQrtfJrIfAn/ghm8=;
 b=gYpMeoi0cAV8S5MEdr2i0zEw2ONGil2iKvajFMMX8o1Ty9L7aWYU+GmCGKffP0cKd6+WL5dJHeIzZMeFYQi+zNWnYZWyj1JzIYxvuFuAtUJQqNen0X4H5hRhhSonVtCAEZ5DrBTooD5yl11aB9u6GPpMZQgH/zMFHE6ohhUYs1k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Wei Chen <wei.chen@arm.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v9 1/6] xen/x86: Provide helpers for common code to access acpi_numa
Date: Fri, 18 Nov 2022 18:45:03 +0800
Message-ID: <20221118104508.768274-2-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221118104508.768274-1-wei.chen@arm.com>
References: <20221118104508.768274-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	VI1EUR03FT015:EE_|DB4PR08MB9312:EE_|AM7EUR03FT006:EE_|GVXPR08MB7821:EE_
X-MS-Office365-Filtering-Correlation-Id: c1b50885-3619-4c03-a583-08dac95207c9
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 XmcoCAlg8GIEFiR1CKMlavwkryiNGS0Sbm1nUTR2DFdM3czxnAusa5jdbOwjJ/c0lbk+P8bYCjDktfQEtkp6Y/E7WL7LnrcoPsWJnp31ccYJzGTcg6orVe0jzotnQxtrasMPYD1uBjozFIOw7IYG751le6HHp7RYcMRBcsuETOpflBuuzwgW3+wfwOiS1eAxs73wuNjAr4DYF7eyfkshZCdU1FtZGDrP5I2uYqYZyVx+gdUWhh1kdHI41fKnPVgRophDN70uIajivfaU+W9xhSyF6au/1k4pdLx3eRFT19ieS9exhVQQHdZpR/5VrLPePSA0WWoQ2VA8s+FvDvtj/z0clHdZ/BD4Na4pr9F771FR3V2SGX5zCjOI/WaVV7SEIdsdFOAV4d2qfyYjF7MadmmEKp5gwBgUD1mzTi/o0W0Oap26S1IIrQK+HKHm6haz35VcZCnElS8SKPYseSnH29NaZk33+77NsYqVjaYO7P90tX06MUqIEqx3BZk7OdRIMPU/GFtsagijXCFqFrpfj0BEICChFSVIHcRCCVRl/efpzSBMX/0bXl0HKT1fl7f/2k4h+bxDKWg4HllGwUuXYsuN0pZ9dtPxgX11kRnVJY1xa9uL30sLdbuz1jWSRwsjl9sXj2YE6Pu8gFEGQikcGVD7kzzVPaeObZKpgjI+FIKDLWzTKdzrpzIGAntPBU4L1NpgHQkgv63O0TlDwNveBwi8JZaB3lYW1M0VgFL6hrA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(136003)(396003)(376002)(346002)(451199015)(46966006)(40470700004)(36840700001)(36756003)(82740400003)(44832011)(356005)(81166007)(2906002)(36860700001)(426003)(83380400001)(47076005)(86362001)(41300700001)(40460700003)(70586007)(4326008)(26005)(8676002)(70206006)(186003)(316002)(6916009)(54906003)(336012)(40480700001)(8936002)(478600001)(5660300002)(7696005)(2616005)(6666004)(82310400005)(1076003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9312
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	48f56b80-f14d-4b6a-056a-08dac9520170
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KfZnQCnawTvhzOhrzFwCsYQDmX++EdtTuwnOrtC7kZXsxhyo6j5hrZxGMrunk9iVFydWO+Il7qIy79pT19nrCTesfD20E3b/GAkj+S/6eyXsG0Y9QWQvOhdVt+BKXtC1Jmxad0TL/r3+V/sLjEZOW0m1YVPZkzVJLifRYSrl7xpRzXGVxrZp43gBkXOWym2h0rN6ssQCpa0HRGuELRVsF/2W8/X8kUS3wSAT2bjz6GO7ecUz4tS/E6UrLIlz6QPRX/rWafLfnhII6Jk02D73e2/TtR35j5/cvQ9A54l9xw+UR2r4eurB2x54kXCuzfpNTWqeMEFZSoPoBicocf/Bu5JiUZMCX+vBN3N26xoqjpS2xXWgWVkE6TrssuAn4bduKqjRgjTZtJZqwzONJjdKAz6d77GoVlOB/nItU9T9aEpjZqOSPYza8VGYlN77xNUufvBkoy7gJajeMAedWHi1enNUKbIdMPvOLQM3IbRJG4acPscfRyXKmzDN+L6MctoRbh6YPjND1UCgLWKHGlHnYGigpel/TtXHA7Gb92X4Azr2fSBa9n3GlcKwH+T22Rr3H1vldxDU3Xj9zbMGNAhoDEgds0JgBBV9sSu+zTNA7+BYNDEhMsdYozUiix5dt12VcL6MPA9NrjBsbTUe5RNSb+8RTedu8/yhSrFJPJCyGDoCflfz/GSjwNHw/E+JdKil0S0Xi7s96Mbe9VQ0aWNkaw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(376002)(396003)(136003)(451199015)(46966006)(40470700004)(36840700001)(26005)(40480700001)(478600001)(6666004)(7696005)(6916009)(2616005)(86362001)(47076005)(54906003)(426003)(186003)(316002)(1076003)(336012)(82310400005)(2906002)(70586007)(82740400003)(36756003)(8936002)(36860700001)(81166007)(70206006)(83380400001)(5660300002)(41300700001)(4326008)(44832011)(40460700003)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 10:45:38.1034
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1b50885-3619-4c03-a583-08dac95207c9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7821

acpi_numa is a specific NUMA switch for ACPI NUMA implementation.
Other NUMA implementation may not need this switch. But this switch is
not only used by ACPI code, it is also used directly in some general
NUMA logic code. So far this hasn't caused any problem because Xen only
has x86 implementing ACPI NUMA, but now Arm is implementing device tree
based NUMA. Accesssing acpi_numa directly in some functions will be a
block of reusing NUMA common code. It is also difficult for us to replace
it with a new generic switch, because it is hard to prove that the new
switch states can guarantee the original code will work correctly.

So in this patch, we provide two helpers for common code to update and
get states of acpi_numa. And other new NUMA implementations just need
to provide the same helpers for common code. In this case, the generic
NUMA logic code can be reused by all NUMA implementations.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
v8 -> v9:
1. No change.
v7 -> v8:
1. No change.
v6 -> v7:
1. Add Rb.
v5 -> v6:
1. Revert arch_numa_broken to arch_numa_disabled, as acpi_numa
   can be set to -1 by users. So acpi_numa < 0 does not mean
   a broken firmware.
v4 -> v5:
1. Use arch_numa_broken instead of arch_numa_disabled for
   acpi_numa < 0 check. Because arch_numa_disabled might
   include acpi_numa < 0 (init failed) and acpi_numa == 0
   (no data or data no init) cases.
v3 -> v4:
1. Drop parameter from arch_numa_disabled, the parameter will be
   introduced in later patch where use it.
2. Drop unnecessary "else" from arch_numa_setup, and fix its
   indentation.
v2 -> v3:
1. Drop enumeration of numa status.
2. Use helpers to get/update acpi_numa.
3. Insert spaces among parameters of strncmp in numa_setup.
v1 -> v2:
1. Remove fw_numa.
2. Use enumeration to replace numa_off and acpi_numa.
3. Correct return value of srat_disabled.
4. Introduce numa_enabled_with_firmware.
---
 xen/arch/x86/include/asm/numa.h |  5 +++--
 xen/arch/x86/numa.c             | 38 ++++++++++++++++++++++-----------
 2 files changed, 28 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/include/asm/numa.h b/xen/arch/x86/include/asm/numa.h
index c32ccffde3..237f2c6dbf 100644
--- a/xen/arch/x86/include/asm/numa.h
+++ b/xen/arch/x86/include/asm/numa.h
@@ -32,8 +32,9 @@ extern void numa_add_cpu(int cpu);
 extern void numa_init_array(void);
 extern bool numa_off;
 
-
-extern int srat_disabled(void);
+extern int arch_numa_setup(const char *opt);
+extern bool arch_numa_disabled(void);
+extern bool srat_disabled(void);
 extern void numa_set_node(int cpu, nodeid_t node);
 extern nodeid_t setup_node(unsigned int pxm);
 extern void srat_detect_node(int cpu);
diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
index 322157fab7..1c3198445d 100644
--- a/xen/arch/x86/numa.c
+++ b/xen/arch/x86/numa.c
@@ -50,9 +50,28 @@ nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
 bool numa_off;
 s8 acpi_numa = 0;
 
-int srat_disabled(void)
+int __init arch_numa_setup(const char *opt)
 {
-    return numa_off || acpi_numa < 0;
+#ifdef CONFIG_ACPI_NUMA
+    if ( !strncmp(opt, "noacpi", 6) )
+    {
+        numa_off = false;
+        acpi_numa = -1;
+        return 0;
+    }
+#endif
+
+    return -EINVAL;
+}
+
+bool arch_numa_disabled(void)
+{
+    return acpi_numa < 0;
+}
+
+bool srat_disabled(void)
+{
+    return numa_off || arch_numa_disabled();
 }
 
 /*
@@ -294,28 +313,21 @@ void numa_set_node(int cpu, nodeid_t node)
 /* [numa=off] */
 static int __init cf_check numa_setup(const char *opt)
 {
-    if ( !strncmp(opt,"off",3) )
+    if ( !strncmp(opt, "off", 3) )
         numa_off = true;
-    else if ( !strncmp(opt,"on",2) )
+    else if ( !strncmp(opt, "on", 2) )
         numa_off = false;
 #ifdef CONFIG_NUMA_EMU
     else if ( !strncmp(opt, "fake=", 5) )
     {
         numa_off = false;
-        numa_fake = simple_strtoul(opt+5,NULL,0);
+        numa_fake = simple_strtoul(opt + 5, NULL, 0);
         if ( numa_fake >= MAX_NUMNODES )
             numa_fake = MAX_NUMNODES;
     }
-#endif
-#ifdef CONFIG_ACPI_NUMA
-    else if ( !strncmp(opt,"noacpi",6) )
-    {
-        numa_off = false;
-        acpi_numa = -1;
-    }
 #endif
     else
-        return -EINVAL;
+        return arch_numa_setup(opt);
 
     return 0;
 } 
-- 
2.25.1


