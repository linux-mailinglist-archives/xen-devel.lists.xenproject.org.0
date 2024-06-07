Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B766B8FFDDB
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2024 10:12:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736380.1142461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFUhj-0001q4-Lu; Fri, 07 Jun 2024 08:12:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736380.1142461; Fri, 07 Jun 2024 08:12:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFUhj-0001nn-IU; Fri, 07 Jun 2024 08:12:07 +0000
Received: by outflank-mailman (input) for mailman id 736380;
 Fri, 07 Jun 2024 08:12:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Avvd=NJ=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sFUhi-0001Em-Bn
 for xen-devel@lists.xenproject.org; Fri, 07 Jun 2024 08:12:06 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20620.outbound.protection.outlook.com
 [2a01:111:f400:7e88::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f70c644-24a5-11ef-b4bb-af5377834399;
 Fri, 07 Jun 2024 10:12:04 +0200 (CEST)
Received: from MW4PR04CA0072.namprd04.prod.outlook.com (2603:10b6:303:6b::17)
 by IA1PR12MB8408.namprd12.prod.outlook.com (2603:10b6:208:3db::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.35; Fri, 7 Jun
 2024 08:11:59 +0000
Received: from CO1PEPF000044F9.namprd21.prod.outlook.com
 (2603:10b6:303:6b:cafe::c6) by MW4PR04CA0072.outlook.office365.com
 (2603:10b6:303:6b::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.16 via Frontend
 Transport; Fri, 7 Jun 2024 08:11:59 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.0 via Frontend Transport; Fri, 7 Jun 2024 08:11:59 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 7 Jun
 2024 03:11:55 -0500
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
X-Inumbo-ID: 9f70c644-24a5-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bOHfxV66U/ZBaYSt0CgDDxeC9Jodb/G08TioPOvCG1ekA/qg7AaAUf3HQfXSmPiJ7rTcoZ+iPSjFRoEs8oU0lsA2wfmKaLSS7/Orl7mU5Qmzku8aarRgOGlTRTI20kZkuWurbSLHVyQ5ovOUeU3ios5EsageE+ayC5dqHvJs0Eee57BFCxpGe1+ngpWCLfRlxjATMEFRRaTBABHpAcU5SX+vN63PRcwvdCa6f/dGjJMzAiNmy85RBe2kLKow4d4Tr5qj5b04Yxd1lMR4NtqmHDxUFGIsJ1nJ7lUkhwZtve9B7Uy2zD+GDWcNNsigvibOSULHp5q8DzuN27xzdCGb+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=46lGlqrGZ1pXbqPXjWR29h7ukmWWAI3m9/j58I4jIsk=;
 b=MbQa0nEaW6iQva8TbT1wsM8SBRMnNSAV81Gi7u3iBdr1/WwuUb/MOLFiSuxcslLtoqUPbJ4bncVEF0XAMos1myxz21mnKU7QvHjH00PO0CtK3UEy5WJv7ZkMQuZHy5vIQ6lWmcS0n1iD6IeUJ4rfQHLp4ZQ3GCNuCtkiJOhQ009+dfDyxdV0jpAxfs8QGPLy2W1pyvPVXMzZm6imD8yoQtsbj7d/HDeMtHAUiCa/PUTi66Vrkbd7Ny7wlJr7/W0+KsI9LO5/DB2NXaZOqfTrnTiwml4mZOOSkaP7Sm0L4xr0e9I8Ehq3TH1lj8uqoYw//wlMDG22bIky0rc2ZXT4TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=46lGlqrGZ1pXbqPXjWR29h7ukmWWAI3m9/j58I4jIsk=;
 b=tyc5IM07WsQKI/JzwcW/FFJzbBpepySzmneiqeNH3FztBw4PlSJPZLJAkowjmndyutcIxZbdNHdzidACvuioNrb8zG5PBG3/anSbiA1cxRZLWY262XEej7KBfVj7/10CZVT7lw7fi5ro+3LbWnJZin0/O2gxgTPGgtD+ga6CxII=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony@xenproject.org>, "Juergen
 Gross" <jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>, Huang Rui
	<Ray.Huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>, Huang Rui
	<ray.huang@amd.com>
Subject: [XEN PATCH v9 2/5] x86/pvh: Allow (un)map_pirq when dom0 is PVH
Date: Fri, 7 Jun 2024 16:11:24 +0800
Message-ID: <20240607081127.126593-3-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240607081127.126593-1-Jiqian.Chen@amd.com>
References: <20240607081127.126593-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F9:EE_|IA1PR12MB8408:EE_
X-MS-Office365-Filtering-Correlation-Id: eff896dd-3367-42be-b41a-08dc86c98157
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|7416005|82310400017|376005|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GR5pCOQhewA/YvAU+LXGD9pp60GGAlGIc3iKd3RnMSdTxvBwO329Qrc0pEpM?=
 =?us-ascii?Q?49sC9l3M8r55AUi7Q/2UCq4hdqJ8kKVIjq8egLc5qiMoQhIfEfQ2Jxnq5d1+?=
 =?us-ascii?Q?3OrR/2HuZd5k5SH55lYrgIxN5c4qh3gsN3zFvlLP886Ra9WgSccxuaqS+Iu/?=
 =?us-ascii?Q?yWE17cBT2gUXUVJtPtT19J7PgaOMPHa6z28bL2+dFVNL0O9gvptxM5ptTmiK?=
 =?us-ascii?Q?rG/F9vaq4RvqgOZQI8c/cPq0Gz1vEf6fDcago7Dii7kAWApMAowlqWsSFjvq?=
 =?us-ascii?Q?Ag9W2wo69eNnC7o2dsnFawodR3MtMFFgkc79JB+N7YvwzWlZBXIy1aTT6ygT?=
 =?us-ascii?Q?naszkFTD9HgQVTpieUhf8MMln6IGqVCNXWZck38s7fALdssdSTsDGu3Ag1lP?=
 =?us-ascii?Q?I5hiMOQEaLzU/hTKUVKixo3ol4Q2m4NFMleO1LJof0skKjP2txxpNkmOTxFW?=
 =?us-ascii?Q?am9qSDYXMIIt7BnM/bWGLAVNlMbXmFtmWn73AleHa3rdTMaDFrNdtGZxugYE?=
 =?us-ascii?Q?kThTclWc6Fadd0PDg2KDZ444O3bc6VjzB303eY43o0ZrDBsbPVqudYA+ixVu?=
 =?us-ascii?Q?ybMbHiiScNf9k1OICE9O20AI0GtvygdusHoiKveFfD6cwF3gefxENIw1ZKk3?=
 =?us-ascii?Q?PPQlfbNLSMDutguhgWzOi0It2iH2QIZfzvRIIVmW7VMBV5KxeYFepJ9ieHeM?=
 =?us-ascii?Q?Thq9Jlo3dZI9LcFU17fqi3reujziZKLKwlbYDa+DgtBsN/bLKqZfC052Xh1k?=
 =?us-ascii?Q?zMAOwjtO94tJb30Cenuh7KZ9e8C604P8QT02zX11CiPk5bB8vR49AgxYSfmM?=
 =?us-ascii?Q?vSyEiCjulx9WNFmhAquvY8Xk7uwNTOAfvJRQ1+o8zrhvu/T7BJO9Xi9QZtm5?=
 =?us-ascii?Q?jmOmQqASuvxkkOMJkk5OAWVfDV4M5GjqmdkS/Hd5buEFTiE5RKvA1Q+oezUy?=
 =?us-ascii?Q?nNuvgs6IQn+8d7IKfCc3PRNp0FrjnDirrjaAM4CARymea4JkWCgde3HrRTXM?=
 =?us-ascii?Q?HMI38yQdEey4Ptg/ux06VPeLPdUv0ZjA+EQu32CnfEQskhiKaSkFzdEy5cP5?=
 =?us-ascii?Q?u/FAS1V7HrUXj1C9M7dFOVbXqpiTQEQ0y9IodlvmqNhTLTe8Jee+1KzAR0Hg?=
 =?us-ascii?Q?c3iw3aEmphHG6Co/VYUMVKYkeS/ZH5RH1cFhfW1wUmvvSD2DTcDgsW6NvDo4?=
 =?us-ascii?Q?GMA07xVxENrBDJkcjVEyA4M9Wet6NWOKFxzCYEQ3ZIc2n/Q0KHMRmaISaAYj?=
 =?us-ascii?Q?ZFakq6Ulqe58jxQTqMjxOkXpQDLwJeNUFviZYyh8LOtzh3zDGE+WTqKiXHzm?=
 =?us-ascii?Q?SPEUh+rgZ9+Q4WRxcPLCHH2SEWutq1QbAx7V9LNLyqd0e0ZSdXpLC7zOjCvS?=
 =?us-ascii?Q?FM1Tc9LAngUWX6X5WC8MNwXCRLVurmBsJ0VLySr/X2gh6FpjRw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(7416005)(82310400017)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 08:11:59.4606
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eff896dd-3367-42be-b41a-08dc86c98157
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8408

If run Xen with PVH dom0 and hvm domU, hvm will map a pirq for
a passthrough device by using gsi, see qemu code
xen_pt_realize->xc_physdev_map_pirq and libxl code
pci_add_dm_done->xc_physdev_map_pirq. Then xc_physdev_map_pirq
will call into Xen, but in hvm_physdev_op, PHYSDEVOP_map_pirq
is not allowed because currd is PVH dom0 and PVH has no
X86_EMU_USE_PIRQ flag, it will fail at has_pirq check.

So, allow PHYSDEVOP_map_pirq when dom0 is PVH and also allow
PHYSDEVOP_unmap_pirq for the failed path to unmap pirq. And
add a new check to prevent self map when subject domain has no
PIRQ flag.

Signed-off-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/arch/x86/hvm/hypercall.c |  6 ++++++
 xen/arch/x86/physdev.c       | 24 ++++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index 0fab670a4871..fa5d50a0dd22 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -71,8 +71,14 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 
     switch ( cmd )
     {
+    /*
+     * Only being permitted for management of other domains.
+     * Further restrictions are enforced in do_physdev_op.
+     */
     case PHYSDEVOP_map_pirq:
     case PHYSDEVOP_unmap_pirq:
+        break;
+
     case PHYSDEVOP_eoi:
     case PHYSDEVOP_irq_status_query:
     case PHYSDEVOP_get_free_pirq:
diff --git a/xen/arch/x86/physdev.c b/xen/arch/x86/physdev.c
index 7efa17cf4c1e..61999882f836 100644
--- a/xen/arch/x86/physdev.c
+++ b/xen/arch/x86/physdev.c
@@ -305,11 +305,23 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     case PHYSDEVOP_map_pirq: {
         physdev_map_pirq_t map;
         struct msi_info msi;
+        struct domain *d;
 
         ret = -EFAULT;
         if ( copy_from_guest(&map, arg, 1) != 0 )
             break;
 
+        d = rcu_lock_domain_by_any_id(map.domid);
+        if ( d == NULL )
+            return -ESRCH;
+        /* Prevent self-map when domain has no X86_EMU_USE_PIRQ flag */
+        if ( is_hvm_domain(d) && !has_pirq(d) && d == current->domain )
+        {
+            rcu_unlock_domain(d);
+            return -EOPNOTSUPP;
+        }
+        rcu_unlock_domain(d);
+
         switch ( map.type )
         {
         case MAP_PIRQ_TYPE_MSI_SEG:
@@ -343,11 +355,23 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 
     case PHYSDEVOP_unmap_pirq: {
         struct physdev_unmap_pirq unmap;
+        struct domain *d;
 
         ret = -EFAULT;
         if ( copy_from_guest(&unmap, arg, 1) != 0 )
             break;
 
+        d = rcu_lock_domain_by_any_id(unmap.domid);
+        if ( d == NULL )
+            return -ESRCH;
+        /* Prevent self-unmap when domain has no X86_EMU_USE_PIRQ flag */
+        if ( is_hvm_domain(d) && !has_pirq(d) && d == current->domain )
+        {
+            rcu_unlock_domain(d);
+            return -EOPNOTSUPP;
+        }
+        rcu_unlock_domain(d);
+
         ret = physdev_unmap_pirq(unmap.domid, unmap.pirq);
         break;
     }
-- 
2.34.1


