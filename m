Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 584DF9E1581
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 09:22:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847297.1262431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIOAb-0000Fq-0S; Tue, 03 Dec 2024 08:22:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847297.1262431; Tue, 03 Dec 2024 08:22:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIOAa-00008o-Ok; Tue, 03 Dec 2024 08:22:08 +0000
Received: by outflank-mailman (input) for mailman id 847297;
 Tue, 03 Dec 2024 08:16:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x39C=S4=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tIO4r-0006fu-SC
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 08:16:13 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062c.outbound.protection.outlook.com
 [2a01:111:f403:2417::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db64af16-b14e-11ef-a0d3-8be0dac302b0;
 Tue, 03 Dec 2024 09:16:13 +0100 (CET)
Received: from CH2PR14CA0031.namprd14.prod.outlook.com (2603:10b6:610:56::11)
 by DM4PR12MB6349.namprd12.prod.outlook.com (2603:10b6:8:a4::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8207.18; Tue, 3 Dec 2024 08:16:02 +0000
Received: from DS3PEPF0000C37D.namprd04.prod.outlook.com
 (2603:10b6:610:56:cafe::c7) by CH2PR14CA0031.outlook.office365.com
 (2603:10b6:610:56::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.18 via Frontend Transport; Tue,
 3 Dec 2024 08:16:01 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF0000C37D.mail.protection.outlook.com (10.167.23.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Tue, 3 Dec 2024 08:16:01 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Dec 2024 02:14:11 -0600
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
X-Inumbo-ID: db64af16-b14e-11ef-a0d3-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HBALj0iwWTZhtTNB4m/9IaArFm/7IEBRoyPCvWid9Jpm+/9v887vk86iyIwQHnGfc4surbZpPW7RQwhi4zXSvWR2pSH3bO8Izujlv9+LPOLMNJzK8mcHBHU6IFYo6GEn4ubTpZYc5k29zt2NGbWEP7QBsHwxr80l+XMRpiaitZquw7Tb9ZZe2AdMQUF0IOJ6kG6Q/3fEkpA8r8MmwigGEoWVXeqnYw78k1EC0aVr+N1Lk8AP801iwRsvzwDZLoIgwZg9398yo7BgWmIWTwNlgWvbC+iM86CweKbOSDxpxuVIWLNIAxqaD06t0P4/rNgQ8J4CAbwZv7fkI1PuB5xp7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4pMiDIbPnk4KOwi5Wnpl0tX4XgGePDycYMINNFX4f3E=;
 b=GbG+f9B45tkdX/A3tckiTDzs9iZoNlABvZS8TqPriJPZQh21EtKMS+RRU5nI0XYeo7TiF3IuglNnjHSEHU57CWIzLveCXcaQ+PA1PsYIWc5nNIEetzivR5kNl0XlQy3ASt1T0QKu0Xusrpv10GK+w7+KrBrKEN7SXojZHAP2KyTspnbE3w4qSzLTswX8Bxe5s7B17JGBDEMDxOU/dgSt02fxNkCZAXVUnugFfw4UNDo1b7on+6pNjhJ+K7FpsNU+vsw42JhbSM+/tbjb6ocjwMu2LF9tOM0MPaHAachSArDmr364qiGc6eZ+veztdXX0eqHKQfTBaaAmFcs+TfpC5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4pMiDIbPnk4KOwi5Wnpl0tX4XgGePDycYMINNFX4f3E=;
 b=R38U9L/Am/H3UX0uep6bS2+I13idinpEmZaapnzU2b1KqgUsW/pWJ4NW4LeJ4zcxc9ewaJL2yH7O/pXiYBK0ihYDanzr4IQiC01fDKvA/4DqeuJLhqEBAXsaBrwZMGR3eLA9XMv2rKQsW6YNeT0o1CIDnxZsk0SyBwLyq+rmfw8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <stefano.stabellini@amd.com>, <Ray.Huang@amd.com>,
	<Xenia.Ragiadakou@amd.com>, <Jason.Andryuk@amd.com>, <penny.zheng@amd.com>,
	Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: [PATCH v1 02/11] xen/x86: introduce new sub-hypercall to get CPPC data
Date: Tue, 3 Dec 2024 16:11:02 +0800
Message-ID: <20241203081111.463400-3-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241203081111.463400-1-Penny.Zheng@amd.com>
References: <20241203081111.463400-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37D:EE_|DM4PR12MB6349:EE_
X-MS-Office365-Filtering-Correlation-Id: f22a0c5d-1264-48f6-502e-08dd1372b955
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?C1MmUL0CWsM/fCxiN1qGIpAMZpdzbSq3rotW9sVJ6X697RxD62RG/CN7VgBU?=
 =?us-ascii?Q?c6HMdzMymwahE/K9fyB0EpXgdnPEidzGmqRm+7vBz5EZ09bad6/+bSkeuK+s?=
 =?us-ascii?Q?olFbSEnLRduxQ3jE86I3ge+loVXUx4mpEiPjgykUQzCX6KxGjChFudcmlSA7?=
 =?us-ascii?Q?acyDcyw4K4vw5L+3j/W+1ZHbag4B2eNAsyHaq71mMkm8SodMTaiuMoxqBYiz?=
 =?us-ascii?Q?e/zRyfm2YiUUi2aUfC3CU78h6ZaOe5XCAHNBucTxVmpAaKJnW6F+xUIl9dDn?=
 =?us-ascii?Q?NAikNiqCxFABmvLAm7rnKMVeqQg8sHd5pnz4e1ieB1Yp5jJ4stqzNpwk/tM6?=
 =?us-ascii?Q?XXBJfm4oEL0Zyu7rwv77CDOVVV2Cqud0KfgxKYj7YGkTyuJMPcj3nBzFL4xF?=
 =?us-ascii?Q?D1YcxcCpS3dgix3grcAxY7eZU3fSRAJIyfkFGMKD8pmnK63jmV0skQJYrnmm?=
 =?us-ascii?Q?/+W5jt/lFsQGxoXOXrHp8i8NyvlCMX1cEvJuOnjzcdcpA2maNtQs+WRS249q?=
 =?us-ascii?Q?wFQh5iJGvC0aU/Mvm/oAdEqnrzfk1GIz1pB0OluSoqRUGunngSObhQj2r+7V?=
 =?us-ascii?Q?DiDARgpZKOqfMsSFAlesf8+jJZ3+fYAzskxAum4pEZyFjCLOMApGoLH020kU?=
 =?us-ascii?Q?Bb54Nb0HwOGa1JMCJtm2AF966qYu2d29f1VAuUQQeBEUY+jzf9bYtieEF09Z?=
 =?us-ascii?Q?5aYJDzgHJjzwgG8e1GIn9PUAigM6wOueT6b980YEJ76n7BB5DaUZDrPUFqYy?=
 =?us-ascii?Q?A1e9XVjyRtgohMWsw6rHy3ArgzxkM7BoTgxQlfuVtTFXd7o6Z5zvVJhKTmD0?=
 =?us-ascii?Q?KXeWoravLyljhu+29+2ftwVn3LhIYMpS6lXVhR1ReKYxBv2g0bDkX6bVELo6?=
 =?us-ascii?Q?cv09h/sBOhdaaRCpG9gL3Qy1on/PCOtD00nsTg6vDVGb+Ty16nVrpnugfAQS?=
 =?us-ascii?Q?CRbdoJ8tNJn9Ev1q2KSPZj2vm8e5eATHqbIUgCG4deHuSXjBU2kcuYAB5JCw?=
 =?us-ascii?Q?H67VPNkO+RzcmBhNhIlLQ2tJ/QIfBeAA41qkIJW0Of/tOVPVyhcroudjoqWG?=
 =?us-ascii?Q?E8AOsiJBR0DDeLdPMWmLDSo/rq4BbeK9kxxp2PJqko5gFX1K+EKw/6wsdrV5?=
 =?us-ascii?Q?+uAsYS/NuiPgctcF6jGXO6CXBak9X1rohtWXtNlDgjZSNoSJbhLNXYxcWeDn?=
 =?us-ascii?Q?O4sfKKtQspMnoP6bNWu30B33JJ86b+7/f7eauhFLCrqc8DQIBirQp41Iq3G4?=
 =?us-ascii?Q?BwcNNOrp/N4nyrLc1ta5BmM11GWokNiER+pOOj6w6QHFhUS8q0R48xmJ0C7A?=
 =?us-ascii?Q?ig93TCg36SuRJvsdoEegiiZwWetvfUVyZD2tBG/5tPR6R2m5P1drmPfANQ+X?=
 =?us-ascii?Q?uNA2eVLdPIdDxwyJgFEy0PFpap8cAwxtNWCko0KxH98w+JrOXohawthudo/X?=
 =?us-ascii?Q?fWAF1auOQn+aKuBPSed5AEddnVzWdauU?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 08:16:01.1960
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f22a0c5d-1264-48f6-502e-08dd1372b955
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6349

In order to provide backward compatibility with existing governors
that represent performance as frequencies, like ondemand, the _CPC
table can optionally provide processor frequency range values, Lowest
frequency and Norminal frequency, to let OS use Lowest Frequency/
Performance and Nominal Frequency/Performance as anchor points to
create linear mapping of CPPC abstract performance to CPU frequency.

As Xen is uncapable of parsing the ACPI dynamic table, this commit
introduces a new sub-hypercall to get required CPPC data from
dom0 kernel.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 xen/arch/x86/platform_hypercall.c         |  6 +++
 xen/arch/x86/x86_64/cpufreq.c             | 18 ++++++++
 xen/arch/x86/x86_64/platform_hypercall.c  |  3 ++
 xen/drivers/cpufreq/cpufreq.c             | 50 +++++++++++++++++++++++
 xen/include/acpi/cpufreq/processor_perf.h |  1 +
 xen/include/public/platform.h             | 11 +++++
 xen/include/xen/pmstat.h                  |  3 ++
 xen/include/xlat.lst                      |  1 +
 8 files changed, 93 insertions(+)

diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
index 67f851237d..917c395f58 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -572,6 +572,12 @@ ret_t do_platform_op(
             break;
         }
 
+        case XEN_PM_CPPC:
+        {
+            ret = set_cppc_pminfo(op->u.set_pminfo.id, &op->u.set_pminfo.u.cppc_data);
+        }
+        break;
+
         default:
             ret = -EINVAL;
             break;
diff --git a/xen/arch/x86/x86_64/cpufreq.c b/xen/arch/x86/x86_64/cpufreq.c
index e4f3d5b436..1aa10a5dbd 100644
--- a/xen/arch/x86/x86_64/cpufreq.c
+++ b/xen/arch/x86/x86_64/cpufreq.c
@@ -54,3 +54,21 @@ int compat_set_px_pminfo(uint32_t acpi_id,
 
     return set_px_pminfo(acpi_id, xen_perf);
 }
+
+int compat_set_cppc_pminfo(uint32_t acpi_id,
+                           struct compat_processor_cppc *cppc_data)
+{
+    struct xen_processor_cppc *xen_cppc;
+    unsigned long xlat_page_current;
+
+    xlat_malloc_init(xlat_page_current);
+
+    xen_cppc = xlat_malloc_array(xlat_page_current,
+                                    struct xen_processor_cppc, 1);
+    if ( unlikely(xen_cppc == NULL) )
+        return -EFAULT;
+
+    XLAT_processor_cppc(xen_cppc, cppc_data);
+
+    return set_cppc_pminfo(acpi_id, xen_cppc);
+}
diff --git a/xen/arch/x86/x86_64/platform_hypercall.c b/xen/arch/x86/x86_64/platform_hypercall.c
index 9ab631c17f..8c28465b8e 100644
--- a/xen/arch/x86/x86_64/platform_hypercall.c
+++ b/xen/arch/x86/x86_64/platform_hypercall.c
@@ -20,6 +20,9 @@ EMIT_FILE;
 #define xen_processor_power compat_processor_power
 #define set_cx_pminfo       compat_set_cx_pminfo
 
+#define xen_processor_cppc compat_processor_cppc
+#define set_cppc_pminfo    compat_set_cppc_pminfo
+
 #define xen_pf_pcpuinfo xenpf_pcpuinfo
 CHECK_pf_pcpuinfo;
 #undef xen_pf_pcpuinfo
diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
index 4a103c6de9..3e3392da1b 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -458,6 +458,56 @@ static void print_PPC(unsigned int platform_limit)
     printk("\t_PPC: %d\n", platform_limit);
 }
 
+static void print_CPPC(struct xen_processor_cppc *cppc_data)
+{
+    printk("\t_CPC: highest_perf=%u, lowest_perf=%u, "
+           "nominal_perf=%u, lowest_nonlinear_perf=%u, "
+           "nominal_freq=%uMhz, lowest_freq=%uMhz\n",
+           cppc_data->highest_perf, cppc_data->lowest_perf,
+           cppc_data->nominal_perf, cppc_data->lowest_nonlinear_perf,
+           cppc_data->nominal_freq, cppc_data->lowest_freq);
+}
+
+int set_cppc_pminfo(uint32_t acpi_id, struct xen_processor_cppc *cppc_data)
+{
+    int ret = 0, cpuid;
+    struct processor_pminfo *pm_info;
+
+    cpuid = get_cpu_id(acpi_id);
+    if ( cpuid < 0 || !cppc_data )
+    {
+        ret = -EINVAL;
+        goto out;
+    }
+    if ( cpufreq_verbose )
+        printk("Set CPU acpi_id(%d) cpuid(%d) CPPC State info:\n",
+               acpi_id, cpuid);
+
+    pm_info = processor_pminfo[cpuid];
+    if ( !pm_info )
+    {
+        pm_info = xzalloc(struct processor_pminfo);
+        if ( !pm_info )
+        {
+            ret = -ENOMEM;
+            goto out;
+        }
+        processor_pminfo[cpuid] = pm_info;
+    }
+    pm_info->acpi_id = acpi_id;
+    pm_info->id = cpuid;
+
+    memcpy ((void *)&pm_info->cppc_data,
+            (void *)cppc_data,
+            sizeof(struct xen_processor_cppc));
+
+    if ( cpufreq_verbose )
+        print_CPPC(&pm_info->cppc_data);
+
+ out:
+    return ret;
+}
+
 int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *perf)
 {
     int ret = 0, cpu;
diff --git a/xen/include/acpi/cpufreq/processor_perf.h b/xen/include/acpi/cpufreq/processor_perf.h
index 301104e16f..cfa0fed647 100644
--- a/xen/include/acpi/cpufreq/processor_perf.h
+++ b/xen/include/acpi/cpufreq/processor_perf.h
@@ -37,6 +37,7 @@ struct processor_pminfo {
     uint32_t acpi_id;
     uint32_t id;
     struct processor_performance    perf;
+    struct xen_processor_cppc cppc_data;
 };
 
 extern struct processor_pminfo *processor_pminfo[NR_CPUS];
diff --git a/xen/include/public/platform.h b/xen/include/public/platform.h
index 2725b8d104..be1cf9a12f 100644
--- a/xen/include/public/platform.h
+++ b/xen/include/public/platform.h
@@ -363,6 +363,7 @@ DEFINE_XEN_GUEST_HANDLE(xenpf_getidletime_t);
 #define XEN_PM_PX   1
 #define XEN_PM_TX   2
 #define XEN_PM_PDC  3
+#define XEN_PM_CPPC 4
 
 /* Px sub info type */
 #define XEN_PX_PCT   1
@@ -432,6 +433,15 @@ struct xen_processor_px {
 typedef struct xen_processor_px xen_processor_px_t;
 DEFINE_XEN_GUEST_HANDLE(xen_processor_px_t);
 
+struct xen_processor_cppc {
+    uint32_t highest_perf;
+    uint32_t nominal_perf;
+    uint32_t lowest_perf;
+    uint32_t lowest_nonlinear_perf;
+    uint32_t lowest_freq;
+    uint32_t nominal_freq;
+};
+
 struct xen_psd_package {
     uint64_t num_entries;
     uint64_t revision;
@@ -465,6 +475,7 @@ struct xenpf_set_processor_pminfo {
         struct xen_processor_power          power;/* Cx: _CST/_CSD */
         struct xen_processor_performance    perf; /* Px: _PPC/_PCT/_PSS/_PSD */
         XEN_GUEST_HANDLE(uint32)            pdc;  /* _PDC */
+        struct xen_processor_cppc           cppc_data; /*_CPC */
     } u;
 };
 typedef struct xenpf_set_processor_pminfo xenpf_set_processor_pminfo_t;
diff --git a/xen/include/xen/pmstat.h b/xen/include/xen/pmstat.h
index 8350403e95..7b73b123aa 100644
--- a/xen/include/xen/pmstat.h
+++ b/xen/include/xen/pmstat.h
@@ -5,6 +5,7 @@
 #include <public/platform.h> /* for struct xen_processor_power */
 #include <public/sysctl.h>   /* for struct pm_cx_stat */
 
+int set_cppc_pminfo(uint32_t cpu, struct xen_processor_cppc *cppc_data);
 int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *perf);
 long set_cx_pminfo(uint32_t acpi_id, struct xen_processor_power *power);
 
@@ -13,6 +14,8 @@ struct compat_processor_performance;
 int compat_set_px_pminfo(uint32_t acpi_id, struct compat_processor_performance *perf);
 struct compat_processor_power;
 long compat_set_cx_pminfo(uint32_t acpi_id, struct compat_processor_power *power);
+struct compat_processor_cppc;
+int compat_set_cppc_pminfo(uint32_t acpi_id, struct compat_processor_cppc *cppc);
 #endif
 
 uint32_t pmstat_get_cx_nr(unsigned int cpu);
diff --git a/xen/include/xlat.lst b/xen/include/xlat.lst
index 2046b36c04..cdd0340c5e 100644
--- a/xen/include/xlat.lst
+++ b/xen/include/xlat.lst
@@ -166,6 +166,7 @@
 !	processor_cx			platform.h
 !	processor_flags			platform.h
 !	processor_performance		platform.h
+!	processor_cppc			platform.h
 !	processor_power			platform.h
 ?	processor_px			platform.h
 !	psd_package			platform.h
-- 
2.34.1


