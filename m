Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 432597B1BD2
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 14:13:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609602.948718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlpt3-0008Kr-3Q; Thu, 28 Sep 2023 12:12:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609602.948718; Thu, 28 Sep 2023 12:12:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlpt2-0008HV-VU; Thu, 28 Sep 2023 12:12:56 +0000
Received: by outflank-mailman (input) for mailman id 609602;
 Thu, 28 Sep 2023 12:12:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=baK2=FM=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qlpt2-0008Ca-1o
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 12:12:56 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7eab::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 58f987ad-5df8-11ee-878a-cb3800f73035;
 Thu, 28 Sep 2023 14:12:55 +0200 (CEST)
Received: from PR1P264CA0084.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:345::6)
 by PH7PR12MB6720.namprd12.prod.outlook.com (2603:10b6:510:1b3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.19; Thu, 28 Sep
 2023 12:12:49 +0000
Received: from SN1PEPF0002529F.namprd05.prod.outlook.com
 (2603:10a6:102:345:cafe::1a) by PR1P264CA0084.outlook.office365.com
 (2603:10a6:102:345::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.23 via Frontend
 Transport; Thu, 28 Sep 2023 12:12:49 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002529F.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Thu, 28 Sep 2023 12:12:48 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 28 Sep
 2023 07:12:46 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via
 Frontend Transport; Thu, 28 Sep 2023 07:12:45 -0500
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
X-Inumbo-ID: 58f987ad-5df8-11ee-878a-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iCxDe67moqguVdYFyeGqxqQ2qL9tM6ZEK/Hnduxh4JcNati1ta3Nxe6tdq0AK/VkBrXL8sokExTAr2SKFsv9kqFkY2UjDxCSMTJrE5zG2wH22PbGHlUiXT/Necd//EHrMzhVOreUbSxzU9OLakfCNbJU9Saeview9gzahsOlM2MMaz7qaIqkN90FL6cVMwiqJXpQjeXOmmzLqq8Fmc/sB9PhjcAjC3MZGXULEXO7w9XtuGD1fTZP07tRDVqAkuiNfL9LruuqxJ2rhWaYRZD7zz/trLMD7prtgBCXyEDskuei/+WtIiKrSIdheVwdXNV0EkiNqlpRlbu/wA5R9cV8hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bLs7cWsrv36ddscBKP8phBoxnUVI14/WwSVOc6mlSBE=;
 b=hzsnnuHVoGX6AcmOgRP9Nt0lWUYv7Doul1Aaa9Rz4Omhd6ZZtq0gH4swKbR3M5ZnKeMKQjuoBYzM6Q/t1qDmcYJtNVrNglbOVLSk4OIAlB2x8KpgFRR3WWvRTa/urD4cZBzPMd0lVsE2NmB7i3yG06CvTDcR0N34idmpuaVTqGCC5yorc5ZACNYwPzUD8NTJHHRlYi9Bi6rsy7iH0IGmABtrdkJ8bGkmM/JBPk6/LDdHSn1Q0G+X78P4R4MVvkx4j8+3rnIh+fH+a9S+6FC852noh2yhC7MO1/OKsdSfavMnuvr//Geq/GHZ4FwAfTqLiIhwf+mI9bD7OUd9LIIuvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bLs7cWsrv36ddscBKP8phBoxnUVI14/WwSVOc6mlSBE=;
 b=ZbydSgq5Z0tTAflxALm45z51Jc1y4swVPJzkJ/MDPiZnTORfocX4M3qZHnbAsnrpYMIEb7QFG6Vsa2lUDGA12yRREfeyEDsChw6rFTbSNv1kjR54J5IagQU0PLyWs1isFFdqf5DanM3zOkPgqqbszIzsUk490AdMm4TUdFX0oeI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>, <jgrall@amazon.com>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<bertrand.marquis@arm.com>, <Volodymyr_Babchuk@epam.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v2] xen: arm: procinfo.h: Fixed a typo
Date: Thu, 28 Sep 2023 13:12:43 +0100
Message-ID: <20230928121243.2636484-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529F:EE_|PH7PR12MB6720:EE_
X-MS-Office365-Filtering-Correlation-Id: bd20bc9b-9e70-4920-0a1a-08dbc01c3ad8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	b28uLbokxixGwQ6DwQPNiJ3ni8x6BPeoUF5AODsoKqkhdCIpom/ECx66TTCgormdkSHAKHDjY3WjGuLo+W1bqEzT0vOMiTovh8rq0b8yT0oe8Z99uCWe9SvFhDbJNsg4L9QKF+OwBewOJv4g7RkGzrBwACOVsty5ww1WBDa3V+XGezjB7bPX/f1BeNaiRfiaCzMuD8Y4Y/sr/Lfv7qxFBCudWje5QSmiqbuzDBGrl3TWjcuwYQxzu6eXAvdcHmpvgV2CpVQADNtiY9FYwR0JmqMalehCVx5Vr4sEUsv1YfwdYaFhpWHD8VIgOCenNYtzcit7t2UgNni8X3fMlBzemP+WGQRoRluen8m1ceFiW+H9/Ie9UDAUCYz2F9RmYdhKvYnE5wzm6/Qd52iIfqbJkLajJGvQNbDgjRfvoTwcl31+UEelQ85C/NQEAKCUjObDk+QuivH2G/NkfGUevPF/KxsDEYyL029J/Wkiwsd7AvohAJ1MRWUQ5XtoNGPPHkKa/11h5CYB6Azhvz9Mmsm5ww4+CD4+otyVjJBSToCYBl8uXROLK2vULP++luN8spDiaWyrQZcqMlrb6QGE78Eed1IXjJfqWVD87I8Znkx5QPyX4j2AxTM7+akc/flcv5tWZVsnYvgQCJHnCTrxjgFxoFvdmdursUe6zKclw0VenljAueOP9XU7POt4ieAjAXrMFohNWwPY7YVzoioin19CIX+6Iuy4dPVsL1aQARJ+foiGl3fzhnxF3JDOisiA2nfNQoi8mCQ3p6OAlK9SO1JJKg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(136003)(396003)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(82310400011)(46966006)(36840700001)(40470700004)(40480700001)(40460700003)(86362001)(478600001)(103116003)(36756003)(36860700001)(356005)(82740400003)(81166007)(4744005)(47076005)(336012)(8936002)(8676002)(426003)(83380400001)(54906003)(70586007)(316002)(26005)(1076003)(5660300002)(2906002)(2616005)(4326008)(41300700001)(110136005)(70206006)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 12:12:48.1130
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd20bc9b-9e70-4920-0a1a-08dbc01c3ad8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6720

Change VPCU to vCPU.
Also add a space before '*/'.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---

Changes from -

v1 - 1. Change VCPU --> vCPU.
2. Add a space before '*/'.

 xen/arch/arm/include/asm/procinfo.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/procinfo.h b/xen/arch/arm/include/asm/procinfo.h
index 02be56e348..3a05f27784 100644
--- a/xen/arch/arm/include/asm/procinfo.h
+++ b/xen/arch/arm/include/asm/procinfo.h
@@ -24,7 +24,7 @@
 #include <xen/sched.h>
 
 struct processor {
-    /* Initialize specific processor register for the new VPCU*/
+    /* Initialize specific processor register for the new vCPU */
     void (*vcpu_initialise)(struct vcpu *v);
 };
 
-- 
2.25.1


