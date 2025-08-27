Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42029B3778A
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 04:09:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1095437.1450457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur5bD-0003pr-7G; Wed, 27 Aug 2025 02:09:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1095437.1450457; Wed, 27 Aug 2025 02:09:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur5bD-0003nK-3w; Wed, 27 Aug 2025 02:09:19 +0000
Received: by outflank-mailman (input) for mailman id 1095437;
 Wed, 27 Aug 2025 02:09:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vbje=3H=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1ur5bB-0003nB-Pq
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 02:09:17 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2418::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d51167a8-82ea-11f0-a32c-13f23c93f187;
 Wed, 27 Aug 2025 04:09:16 +0200 (CEST)
Received: from BYAPR03CA0016.namprd03.prod.outlook.com (2603:10b6:a02:a8::29)
 by MN0PR12MB5881.namprd12.prod.outlook.com (2603:10b6:208:379::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.13; Wed, 27 Aug
 2025 02:09:12 +0000
Received: from CY4PEPF0000E9D4.namprd03.prod.outlook.com
 (2603:10b6:a02:a8:cafe::df) by BYAPR03CA0016.outlook.office365.com
 (2603:10b6:a02:a8::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.13 via Frontend Transport; Wed,
 27 Aug 2025 02:09:12 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9D4.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Wed, 27 Aug 2025 02:09:12 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 26 Aug
 2025 21:09:11 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Tue, 26 Aug
 2025 19:09:11 -0700
Received: from ubuntu-20.04.2-arm64.shared (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 26 Aug 2025 21:09:10 -0500
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
X-Inumbo-ID: d51167a8-82ea-11f0-a32c-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wc/msUYe2PP21P2QfWvgcTDdrTsuXtpKph7B7XJO9PE4rH+bLTGonU97Z3IeJEpr2rhUs6JVt8+XcXfLS/2gmXhMeHfEheJKUJzgRIq69KF+2nQV88yxWF/KDylb8KhFY1DOcRgsFkSDhBdqOTyEg2wLx0yE+Y8wbUNifaL0mbVHPi6PKm+R/ttBdbyRCFCckxA0P8M/SVtoV9K6j19dILOKqru01Xm2ld9F1S28cjo8GsapE7uUD+mHVlQrYYZ0P4CXo19jg6HADfiANQODff6B+YD1CRFEv1nVS7WaC+O0uEjaydz0DcQ6R3xq+IrW0I2VgbbpGbPdzBdFGdK+YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1QvF+xLsQctW7G4unTn7CijyPOESIHg/9PWEXSCRLDk=;
 b=C9/1+2j5R7hZVWfP8Wkj+yGZ3zlFThYOMxrCCvyIsIsVdFmy+tFFdKdXXJBuKnEZu+gckE6BQxJ8RFSs7z4KK819pcNiHnYXOJSJDD3odR9FA3fujgpHfv2vfjcfHFR+T5+2wLygevn5uqRqO84aFEETRc89aZ7I2KyJRH2pmQnnH1zmjFeGQX2Ebd8bzm2w+UTsuAA+nOy4pQ1/on6LFcro5GiyWK9EHwpp6Cqr0djWOeLqS0OXUAfOXcN5M5j/XRR4kIgqp/xlSHffRImdGavqYFX9qJJzhEWt/Cv+oj79zomiKRTAhJrd7uvw1TfGqsUwkMNzpTnWrAesMHuwEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1QvF+xLsQctW7G4unTn7CijyPOESIHg/9PWEXSCRLDk=;
 b=uuc8GPF3Zxpd4olz2oV4LVAEVea+YOuldg3Vm9tvteX1/X0TojjXCG1GsizkUdKaHIpWMDiQ948Zull9MG5103M9qUGrXdpgpeXPSGD0XlA096QqRXKvtQYb42jZnXMDDVV6C1NXAoXAbGtjStEw+nhh9dhZOtJFq4oRAeSCHAA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Date: Tue, 26 Aug 2025 19:09:09 -0700
From: Stefano Stabellini <stefano.stabellini@amd.com>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <jbeulich@suse.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	<ray.huang@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, <xen-devel@lists.xenproject.org>, Penny Zheng
	<Penny.Zheng@amd.com>
Subject: Re: [PATCH] xen/x86: move domctl.o out of PV_SHIM_EXCLUSIVE
In-Reply-To: <alpine.DEB.2.22.394.2508261728250.3391208@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2508261802360.3391208@ubuntu-linux-20-04-desktop>
References: <20250815102728.1340505-1-Penny.Zheng@amd.com> <fb6f559a-b2aa-4b25-a6d3-401ecc4b4bd5@suse.com> <d6046b53-9317-43d6-bfda-e30d42c09320@gmail.com> <2035b14e-3836-4e80-9dad-8a49ca90864a@suse.com> <alpine.DEB.2.22.394.2508181646220.923618@ubuntu-linux-20-04-desktop>
 <49416df6-83c8-4fa3-bf81-2d1e504ef31b@suse.com> <alpine.DEB.2.22.394.2508251934200.3391208@ubuntu-linux-20-04-desktop> <alpine.DEB.2.22.394.2508261728250.3391208@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D4:EE_|MN0PR12MB5881:EE_
X-MS-Office365-Filtering-Correlation-Id: ccfba5ee-d93c-49c4-d46a-08dde50eb723
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HVAi2iUryEU/mUGsmWle8vse8T93O407mRaR4czdNOD6FsUfS+Z6KRld74fZ?=
 =?us-ascii?Q?AB7Ft01hV/rLq7uO4VUrA7ou++vmHnCQsAI7kJA1zg1PTf9ra4oq1DVuO7x5?=
 =?us-ascii?Q?r05Z9fvsdQB/QQYRsQDHnFyJJcyUBnnjF+fu25hiSXpvlhnlsS1h0ulmyBtZ?=
 =?us-ascii?Q?bUC1/l2VNZ+9FaING+RJzEWiXKIeXMJfrMUR2ondTM5+6TGA05lZchWcePvl?=
 =?us-ascii?Q?ZhRAnNwrKo7ujW4T9i012P8173fndJQYlLiHgLUEG7ze+3P8oSrr3sInNcZB?=
 =?us-ascii?Q?pc/ZB8wNtoY63+3ogIImVkS6xn5xIs0cD0SCqa/HmX2uEOonz7HmNj/SL8cB?=
 =?us-ascii?Q?lKXYwUcMaV31A8SV3OmU5UejH1PmW55A1oCTjcRRIa2vFeZ1Wsy5+LJXWDjt?=
 =?us-ascii?Q?tED1ACwn00P0r37U5FBlt8ABCiDwW3tLrWQEkIFhHOQwChSz/6X/JSjR9d+w?=
 =?us-ascii?Q?6q51GKsKU/uurPnEQN3iPTg2qY5qcFYSirtcxZ/JqVB5khU+A6EKNj6/QETd?=
 =?us-ascii?Q?WrJWfdnOWYcj199WSybmPIncljxEZUtFrrMZvkj6AOHXHJW6yN7hjMLp6Qj3?=
 =?us-ascii?Q?dQgs0f65KD8jocZbqhudP5mFUVGBj8JtFn34N7btlVBmo/KtJjQ6rrNNzSjW?=
 =?us-ascii?Q?Ppp+YspcPs0tlz1yAGckSsXffs7VKIbtz9VPmuFzyxGwZn+kxtrLh/A7B2p1?=
 =?us-ascii?Q?O7imHvlCpHoJAeB0h9h5eXKDk/JYyGXf0bMZzEkFvYoYOZ0tO/7k3NfZEKwt?=
 =?us-ascii?Q?c2GIsiC6aP0DytrN8ukOacIse9I7fz9LDyY2JSx3kj4bMRseAOWDcvfzhicQ?=
 =?us-ascii?Q?3YO26xZBeb+GJbuuz8mHQAx4Dg+W/fDKavd7TCHsxeItLvEJ/obqvlVN9/wb?=
 =?us-ascii?Q?nZvE2lrA3EzPjffyr7J1D0zg6/hhRs4fFgyMzw6ICiaR5+redO6cq0+bC/bl?=
 =?us-ascii?Q?+tdry/pDl1Ka/TWdpMOu05X+o3okbL1sag80ibXxmVUJC1qoOXMRWC9+44My?=
 =?us-ascii?Q?tNrlPTMJLeIH/wtY9/F74ex73QTJC1ErYeFfO6o0Jkf6zSHIIRhYqNukQG4Y?=
 =?us-ascii?Q?jRwAKDR4Y86aIAKR+GorO2xpTKa1RfxXjC566sNYeQ5MRUE/Jke6/yOpds/l?=
 =?us-ascii?Q?3KeGyCcZRuGQ9y1Tx3DvfyqAI0FSBAv3rJIDWsKuE9/Tv8RmvXF9CeixcHns?=
 =?us-ascii?Q?xZqe5tO7igrGMkJWL8Gwez+qGaoAx92BB5KqZIq4f88P+DkxYuisLuFD/AWS?=
 =?us-ascii?Q?vhvpsqoeqeISdZWLWnUCr582RrSqHwXACUi6GkS8nlMrU5nLAMKINewlwBYN?=
 =?us-ascii?Q?L25x+gtbo9WOrQxqfzU31q2TZB+f/5u6SFeAKd+f7fAxKZWIMQFdDoC/K7WH?=
 =?us-ascii?Q?Ow8JAq6Usdx4F1cS0XmoKZv1JtT5El/2p/nv053gLimjfA3exKNo3UjKUYc7?=
 =?us-ascii?Q?yXovGgvV2sAdyWyqN6jgwFaKs/k2o+jHMbQlLcj8s22JEO8LlP3/XRlpbMuL?=
 =?us-ascii?Q?R3cgjTSOcRb/ESP4/n4BgVEg8d6JqC7TmQuy?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 02:09:12.0482
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ccfba5ee-d93c-49c4-d46a-08dde50eb723
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5881

On Tue, 26 Aug 2025, Stefano Stabellini wrote:
> Hi all,
> 
> So I ran a test and the appended change, which is based on [1] and
> renaming CONFIG_DOMCTL to CONFIG_SYSCTL, is sufficient to resolve the
> build issue.
> 
> For 4.21, I suggest we go with two patches:
> 1) global rename of CONFIG_SYSCTL to CONFIG_MGMT_HYPERCALLS
> 2) stub domctl_lock_acquire/release based on CONFIG_MGMT_HYPERCALLS
> 
> Jan, are you OK with this?

The other patch doesn't work in the regular case but this patch does. I
ran it through 60+ randconfigs and so far so good. The strategy is still
the same I suggested above for 4.21: global rename, plus one more patch
(this one).


diff --git a/xen/common/Makefile b/xen/common/Makefile
index c316957fcb..352f004a2c 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -50,7 +50,6 @@ obj-y += spinlock.o
 obj-$(CONFIG_STACK_PROTECTOR) += stack-protector.o
 obj-y += stop_machine.o
 obj-y += symbols.o
-obj-$(CONFIG_SYSCTL) += sysctl.o
 obj-y += tasklet.o
 obj-y += time.o
 obj-y += timer.o
@@ -70,7 +69,10 @@ obj-bin-$(CONFIG_X86) += $(foreach n,decompress bunzip2 unxz unlzma lzo unlzo un
 obj-$(CONFIG_COMPAT) += $(addprefix compat/,domain.o memory.o multicall.o xlat.o)
 
 ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
+ifeq ($(CONFIG_SYSCTL),y)
 obj-y += domctl.o
+obj-y += sysctl.o
+endif
 endif
 
 extra-y := symbols-dummy.o
diff --git a/xen/include/hypercall-defs.c b/xen/include/hypercall-defs.c
index 8370b4b289..18ab294f94 100644
--- a/xen/include/hypercall-defs.c
+++ b/xen/include/hypercall-defs.c
@@ -194,14 +194,16 @@ kexec_op(unsigned long op, void *uarg)
 #ifdef CONFIG_IOREQ_SERVER
 dm_op(domid_t domid, unsigned int nr_bufs, xen_dm_op_buf_t *bufs)
 #endif
-#ifdef CONFIG_SYSCTL
+#if !defined(CONFIG_PV_SHIM_EXCLUSIVE) && defined(CONFIG_SYSCTL)
 sysctl(xen_sysctl_t *u_sysctl)
 #endif
 #if defined(CONFIG_X86) && defined(CONFIG_PAGING)
 paging_domctl_cont(xen_domctl_t *u_domctl)
 #endif
 #ifndef CONFIG_PV_SHIM_EXCLUSIVE
+#ifdef CONFIG_SYSCTL
 domctl(xen_domctl_t *u_domctl)
+#endif
 platform_op(xen_platform_op_t *u_xenpf_op)
 #endif
 #ifdef CONFIG_HVM
@@ -277,10 +279,8 @@ physdev_op                         compat   do       hvm      hvm      do_arm
 #ifdef CONFIG_HVM
 hvm_op                             do       do       do       do       do
 #endif
-#ifdef CONFIG_SYSCTL
+#if !defined(CONFIG_PV_SHIM_EXCLUSIVE) && defined(CONFIG_SYSCTL)
 sysctl                             do       do       do       do       do
-#endif
-#ifndef CONFIG_PV_SHIM_EXCLUSIVE
 domctl                             do       do       do       do       do
 #endif
 #ifdef CONFIG_KEXEC
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index e10baf2615..cb80e49de1 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -148,8 +148,17 @@ void arch_dump_domain_info(struct domain *d);
 
 int arch_vcpu_reset(struct vcpu *v);
 
+#if !defined(CONFIG_PV_SHIM_EXCLUSIVE) && defined(CONFIG_SYSCTL)
 bool domctl_lock_acquire(void);
 void domctl_lock_release(void);
+#else
+static inline bool domctl_lock_acquire(void)
+{
+    return false;
+}
+
+static inline void domctl_lock_release(void) {}
+#endif /* CONFIG_DOMCTL */
 
 /*
  * Continue the current hypercall via func(data) on specified cpu.
@@ -182,7 +191,7 @@ struct vnuma_info {
     struct xen_vmemrange *vmemrange;
 };
 
-#ifndef CONFIG_PV_SHIM_EXCLUSIVE
+#if !defined(CONFIG_PV_SHIM_EXCLUSIVE) && defined(CONFIG_SYSCTL)
 void vnuma_destroy(struct vnuma_info *vnuma);
 #else
 static inline void vnuma_destroy(struct vnuma_info *vnuma) { ASSERT(!vnuma); }

