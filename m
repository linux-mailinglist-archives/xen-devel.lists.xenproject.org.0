Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 104ECA559FB
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 23:41:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904246.1312197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqJuC-00016E-VP; Thu, 06 Mar 2025 22:41:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904246.1312197; Thu, 06 Mar 2025 22:41:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqJuC-00013o-Pj; Thu, 06 Mar 2025 22:41:28 +0000
Received: by outflank-mailman (input) for mailman id 904246;
 Thu, 06 Mar 2025 22:41:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0N12=VZ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tqJK9-0000Ss-Bn
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 22:04:13 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2413::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee36c560-fad6-11ef-9ab4-95dc52dad729;
 Thu, 06 Mar 2025 23:04:11 +0100 (CET)
Received: from BN9PR03CA0087.namprd03.prod.outlook.com (2603:10b6:408:fc::32)
 by PH7PR12MB9222.namprd12.prod.outlook.com (2603:10b6:510:2ef::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 22:04:05 +0000
Received: from BN3PEPF0000B372.namprd21.prod.outlook.com
 (2603:10b6:408:fc:cafe::7) by BN9PR03CA0087.outlook.office365.com
 (2603:10b6:408:fc::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.17 via Frontend Transport; Thu,
 6 Mar 2025 22:04:05 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B372.mail.protection.outlook.com (10.167.243.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8549.1 via Frontend Transport; Thu, 6 Mar 2025 22:04:05 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 16:04:04 -0600
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 6 Mar 2025 16:04:03 -0600
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
X-Inumbo-ID: ee36c560-fad6-11ef-9ab4-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M+duMxeKFPY+K2EpRSRoDLL047tDFglfbWulRwOx2yNLxEoI4yT7jqnowhSn+QrNikdjo0GZNsqN6XnR0wQ+yKP5DjOwDhvN9++7Zj92yHVXFERDnYbxAKqqccbmgVj3h6fqChgpwgGnaBh0Jy4zNlzlcZwCDDaQGFCmqTCHxooQ+7Ffakptw0x2boyLO8TW3l7nZSl3v0n0ONi0JVJmb8k+AIC0lYcJHbHKO1n3q8f6N9GGoke8f3HJBdHwjUlhcI7fEHte1vSye1XtrdIlk6TlSYgBM8yW1SfLR8BJ9p+NjBvjBMahjc45xsxWWjB76h3Z6FzwAgSkjiE4HNmMTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TNgQrZnx+1brlKFiQ9NUOt1D3BsJYWITfDLiw9hTcZM=;
 b=SITUgxldZs16Fi75BN80NqQboE/qAziRO4Eevh2RSgz55Z+TVBM4qLRktuJcjlFcI4aqGAgurioDtqR8g3aqxyb7GgIHX9Hc5Vk4QBuNdb823uywL7C2Y/Kj2AxSOQJAkrUh8ymlM4rHJYRDN9pUQQzYD0VM89hrXVeVk8NjBj1JI9zbDPpFJBdINNlei3ULK+J2k2HNy2JDR9FmO/PsFQPQY5FALkya9dlmEYofuAAuiG7TYkomACHEc9GUkZqimIu8wFRX/b5s9N1H6mNl8FyworqXkT6gMRNZs1EBg9lL47jjMzZzA81/pbK8CbJU5gk1i6xrKHC61ODz0RNt5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TNgQrZnx+1brlKFiQ9NUOt1D3BsJYWITfDLiw9hTcZM=;
 b=YVBII0jL2M0g457n5fYBXk1Cj7DxocpvhQ5agcu6X6UxIHfvJFOUmCge4RG9SRt4plNtmhWlYXDTsEqGI0BCuOhLAeTYEh78kpyQqFX6uijYdF4BNcLHbM37u0YVg3d+8umsVzCZ/dv8iLh5Z8NILCY/t/ao5s5k0larGqDtUpU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>,
	"Andrew Cooper" <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Daniel P.
 Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH 14/23] xsm/dummy: Allow XS_PRIV to call get_hvm_param
Date: Thu, 6 Mar 2025 17:03:34 -0500
Message-ID: <20250306220343.203047-15-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306220343.203047-1-jason.andryuk@amd.com>
References: <20250306220343.203047-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B372:EE_|PH7PR12MB9222:EE_
X-MS-Office365-Filtering-Correlation-Id: fa96a43a-dcec-4fc3-1228-08dd5cfad00c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?A+3hxxMl1yIA4nqaJNKLFOy1KzHOLdrLaI5ddjzCy2sVS5PV99/WK7n6P7ss?=
 =?us-ascii?Q?7O9hkkSMIfiK9UgkaXMvfjKrzidQnXYueHlbg3P/oTpvQek5NRq/27v1H0Cl?=
 =?us-ascii?Q?1hjPXP7/XXrIcj6tvkXMV4SZSm8u53DKN6B3di646Ufgqa1olGLx8HgMUyIt?=
 =?us-ascii?Q?TCnIPIcFHgn0Y4o7Pngy+JUVLQ5snTjPPt5Akwt5hs+QQZ18GP1JlENT5meQ?=
 =?us-ascii?Q?KH1jeScMyVp0mOKjnKfx6945l/sC73TLYhPte5fGJ989Z71wUDBl6GsvoK5p?=
 =?us-ascii?Q?pAqoqG6uiIcjxG/+Yals3EUwoOl1sp24VlTCSGH86GotGQ7OAxTvKKDiNmRd?=
 =?us-ascii?Q?p45dzBwv/5EgqjIX+rsapgtXD/mAm+bwPGuZ1gszuKmETgfJfQYesR95wwJr?=
 =?us-ascii?Q?QVn2wPymYAIM+VCgTKXUjD9oiROxosHzAKpP0SzJFhTZswaOOWKatsEAlOOi?=
 =?us-ascii?Q?3Yobl35Tq1s6VjY+qSBdLuqs9L4esZhRpcvE3O2RLZzKmDXWMqpieGOGo14S?=
 =?us-ascii?Q?xTirDJ+XIXJ8YYwT8eMR696uxOc+o1Lslj8bTmWSKftu4goiZNtEg8BWCAdZ?=
 =?us-ascii?Q?X80rIsJE115t5ZYZHb8jaIxf4IL+/IezwJeL+lZufdaWFoS7D5FyfO5d7s3g?=
 =?us-ascii?Q?kNIAfsDjL13Dea8Q6/U990ae/OTDlcIcwztEf/jtP/OVs9Qd6KKvRaEvXFLw?=
 =?us-ascii?Q?izUM+r9iLGtWlDe0zInWqx67vZJb3s4BwvmAUIP4T1S/TpwAiy2do3LpWE+0?=
 =?us-ascii?Q?SiXXn8kW1g5HYEaJ9JxSuhl7pi9tUQEloIAXEDhKKVqy3OCcCReSKgzMeQ+3?=
 =?us-ascii?Q?gc8vWNRk/iWB1fu8T4zV9zFuKnxkFNwAox0SAsXs2/cI6n4f4YpBsedn0VCV?=
 =?us-ascii?Q?glLzB68RafxCePg91OnwE1KIZZ6Y+SNwqPR1ie8BhCPGem/XmKUloqbduieB?=
 =?us-ascii?Q?JGVFpGgTDOUAdWaS4Lo7LCE10E87/o6v12lNBc6RkXei6T5MyObK0DRjpA0u?=
 =?us-ascii?Q?8fWpRrAqbziK/kbP0ILLDcfu7dKYzpZSu/SvI8+3H7V3J2S6G1THLupGytPS?=
 =?us-ascii?Q?Krycr6IM2JZmSMquPIXC1ErcHRNwGt8q+9Tyic4cEe4ZZgvK3q1Cl0CC+9yh?=
 =?us-ascii?Q?OXnRrX+Lxgk/2JuDzrPE4PCTlVHzk5gH9sYwpB9IGVdCgu+pu0MHJXwZxRhr?=
 =?us-ascii?Q?ydLf+EctXjMVmQ21kUzLQzkgm/zrMpifMNB36kxMzC/h3X2UpwFhhTb1phiX?=
 =?us-ascii?Q?y/LsBnRZcYC2hBIyqQE43XQ+Ve84KXRzzZnGjk2WH8Qoxe2chYD/DzpdrLwm?=
 =?us-ascii?Q?Za1DhWeh6dcssiMuw3PVS5LCUGn3xIokuNyPHS3oj7+cw0eGJvKtNeWcYAGm?=
 =?us-ascii?Q?Ygsh8qSpYr4P1mDUuZmdFNV0vRUAugaCWznHfwhVXAulR57oFW8eQgij0fCO?=
 =?us-ascii?Q?ex597K+s9lUDv8ogUp3Qf7mMOSe6nYZZZtcBZcdlU7yBezmoup2CKxxLbC5J?=
 =?us-ascii?Q?CGTy8eluEKI2uqc=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 22:04:05.8041
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa96a43a-dcec-4fc3-1228-08dd5cfad00c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B372.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9222

This is useful for a combined hardware/xenstore domain that will run
init-dom0less and xenstored.  init-dom0less calls xc_hvm_param_get() to
retrieve the xenstore event channel and pfn to configure xenstore for a
guest.  With a hypervisor-allocated event channel and page, the
set_hvm_param is not needed, and the normal domid permissions will allow
xenstored to connect.

Similarly, a hyperlaunch-ed xenstore stubdom needs to read a domain's
xenstore event channel out of hvm_param.

This allows reading but not modifying the guest, so allow the permission.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 xen/arch/arm/hvm.c      |  2 +-
 xen/arch/x86/hvm/hvm.c  |  8 ++++----
 xen/include/xsm/dummy.h | 14 ++++++++++++--
 3 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/hvm.c b/xen/arch/arm/hvm.c
index 86e49bf474..b50ca10cee 100644
--- a/xen/arch/arm/hvm.c
+++ b/xen/arch/arm/hvm.c
@@ -89,7 +89,7 @@ long do_hvm_op(unsigned long op, XEN_GUEST_HANDLE_PARAM(void) arg)
         if ( d == NULL )
             return -ESRCH;
 
-        rc = xsm_hvm_param(XSM_TARGET, d, op);
+        rc = xsm_hvm_param(XSM_OTHER, d, op);
         if ( rc )
             goto param_fail;
 
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 969e43c2f2..f3f1002cc9 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -4177,7 +4177,7 @@ static int hvm_allow_set_param(struct domain *d,
     uint64_t value;
     int rc;
 
-    rc = xsm_hvm_param(XSM_TARGET, d, HVMOP_set_param);
+    rc = xsm_hvm_param(XSM_OTHER, d, HVMOP_set_param);
     if ( rc )
         return rc;
 
@@ -4458,7 +4458,7 @@ static int hvm_allow_get_param(struct domain *d,
 {
     int rc;
 
-    rc = xsm_hvm_param(XSM_TARGET, d, HVMOP_get_param);
+    rc = xsm_hvm_param(XSM_OTHER, d, HVMOP_get_param);
     if ( rc )
         return rc;
 
@@ -5055,7 +5055,7 @@ static int hvmop_get_mem_type(
     if ( d == NULL )
         return -ESRCH;
 
-    rc = xsm_hvm_param(XSM_TARGET, d, HVMOP_get_mem_type);
+    rc = xsm_hvm_param(XSM_OTHER, d, HVMOP_get_mem_type);
     if ( rc )
         goto out;
 
@@ -5148,7 +5148,7 @@ long do_hvm_op(unsigned long op, XEN_GUEST_HANDLE_PARAM(void) arg)
         if ( unlikely(d != current->domain) )
             rc = -EOPNOTSUPP;
         else if ( is_hvm_domain(d) && paging_mode_shadow(d) )
-            rc = xsm_hvm_param(XSM_TARGET, d, op);
+            rc = xsm_hvm_param(XSM_OTHER, d, op);
         if ( !rc )
             pagetable_dying(a.gpa);
 
diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index f2d6662a9d..06f4eccf5f 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -614,8 +614,18 @@ static XSM_INLINE int cf_check xsm_map_gmfn_foreign(
 static XSM_INLINE int cf_check xsm_hvm_param(
     XSM_DEFAULT_ARG struct domain *d, unsigned long op)
 {
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, current->domain, d);
+    XSM_ASSERT_ACTION(XSM_OTHER);
+    switch ( op )
+    {
+    case HVMOP_get_param:
+        /* A domain can query itself, or a DM can query its target. */
+        if ( !xsm_default_action(XSM_TARGET, current->domain, d) )
+            return 0;
+        /* Xenstore domain needs to be able to query for mapping. */
+        return xsm_default_action(XSM_XS_PRIV, current->domain, d);
+    default:
+        return xsm_default_action(XSM_TARGET, current->domain, d);
+    }
 }
 
 static XSM_INLINE int cf_check xsm_hvm_param_altp2mhvm(
-- 
2.48.1


