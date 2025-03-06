Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0258EA55949
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 23:04:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904073.1312051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqJK4-0002iw-RE; Thu, 06 Mar 2025 22:04:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904073.1312051; Thu, 06 Mar 2025 22:04:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqJK4-0002aA-HP; Thu, 06 Mar 2025 22:04:08 +0000
Received: by outflank-mailman (input) for mailman id 904073;
 Thu, 06 Mar 2025 22:04:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0N12=VZ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tqJK2-0000Ss-Aa
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 22:04:06 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2414::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea70cf98-fad6-11ef-9ab4-95dc52dad729;
 Thu, 06 Mar 2025 23:04:03 +0100 (CET)
Received: from BL0PR02CA0067.namprd02.prod.outlook.com (2603:10b6:207:3d::44)
 by SJ0PR12MB6880.namprd12.prod.outlook.com (2603:10b6:a03:485::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.28; Thu, 6 Mar
 2025 22:03:57 +0000
Received: from BN3PEPF0000B36D.namprd21.prod.outlook.com
 (2603:10b6:207:3d:cafe::b9) by BL0PR02CA0067.outlook.office365.com
 (2603:10b6:207:3d::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.16 via Frontend Transport; Thu,
 6 Mar 2025 22:03:56 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B36D.mail.protection.outlook.com (10.167.243.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8549.1 via Frontend Transport; Thu, 6 Mar 2025 22:03:56 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 16:03:55 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 16:03:54 -0600
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 6 Mar 2025 16:03:54 -0600
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
X-Inumbo-ID: ea70cf98-fad6-11ef-9ab4-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jCdpWR6pP4yjaOBZgGwDtmjnJPrwj/1WPNQTOYRUvNuSXKxdXjs/I8SStc3S5i3f2JuSOgAq/+tOE3HMZpei3RLxufvBB2LzT4S/YczS0ZmFCHx2y5eWpuiyl4oZpk7jA8xflRKLAkpQmjAO2gtNA0GDo1v+sdWB3cttiW0ybVAB725E1aMqY+lKhTrTAvLamHFfD09Pe1SDF+nmy8eCuVCY/KOcSdCBFxn7trVcD3y/r4prFXANux+6kFgbJrSyDFA6jcAEO/ujhvYpcz2WAmv6t6g1f43HbaegW7coX0rkdo/KDYiDQrPPJ5KVkxA0bpvN0xlwbMmVqv/OdsUqUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gxRTK5sPthCjce7F1tIG5rxl4Y3DZmkzwFsUXndn8/c=;
 b=n3zxn8/UkaQ0WSdgCx4GfmlgF1oCDQISXhLiBA+BxIgK1EZQvps8Lu2lPyM/ByRyXp2rTT7UvEcVs8qbEj7kaTnuPTcqH37rfCt5o66zoG6RbYaansvayXmSUnFe+komby/4RHmyCvGclhaUbSJKCAdrO4SatrLXjAwMPa/2kNgiij0Kdl0qzm/o6MKrJJi0/szk0hkKfbVtBhue5Hfm4XTp3uPwj2Ua7TUp1FGWXBWHHfe76fG0F+hIwjfYjTxcotMipI+eWEY4GDWONjnGEBbjsJNplWOcpJo6qm3itxEWrqUyEybuUr902XetyhPbEbXQ8VMS5LzIYNv4pnGKew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gxRTK5sPthCjce7F1tIG5rxl4Y3DZmkzwFsUXndn8/c=;
 b=WH0GSUGCnXgrKL3QFzmn/8q040fQQTTnfv4T2OgbL+KsyujZlDxA6k9dVv8susjDj77L8PN+vo+3EskT6F3hcmfPmG2PH7HzcvZX6TyGqISnZjhfvByzHbbgceiEtoLG0k5dPieJrvF0rvo3ahwYKOAAphmsTi7qkIcNOd1NifQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 06/23] xen/domctl: Expose privileged and hardware capabilities
Date: Thu, 6 Mar 2025 17:03:26 -0500
Message-ID: <20250306220343.203047-7-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306220343.203047-1-jason.andryuk@amd.com>
References: <20250306220343.203047-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36D:EE_|SJ0PR12MB6880:EE_
X-MS-Office365-Filtering-Correlation-Id: 197b53d0-10cd-4907-489a-08dd5cfaca48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sQQy/wtFRj4CW/HIQ0CvA9jvqNPkA6HMlW19/aNJKP3CNy5jl2h2F1OXXG76?=
 =?us-ascii?Q?QRSv1/A2wUJudiSNkp1BWQNCDsvkyL2mAPBylwiHswN72oofT5tnX8YyHBZN?=
 =?us-ascii?Q?Aya0HHbrNPIYtJ7fa+9kQbHwl/DbL+Qsm/zZn/l7ePiqC8ijGLFnM0NKUszo?=
 =?us-ascii?Q?QIi0E7pSn+TC9vMBlZwgxuzAzlQBhC5LhYrcN7vdfm/dqvRmFrZS0xlLhDJ+?=
 =?us-ascii?Q?2EWkcVaah/L3S9oqYzYNt60VxvUpJ9WX2+mOq1JQRLesfZJe3TU6sX4F9j3u?=
 =?us-ascii?Q?BNN48+jF9Bi5kiV6kKxOKA7knjVkbTdHE/Z4sV2dwAWguFTCDMhbQeJPmBP2?=
 =?us-ascii?Q?57oTuwcOghc3qLV3RJ0sXkuo7xBZdEwa4m82VuRufANf8cv9vtvNl/nzAvik?=
 =?us-ascii?Q?PdVvGR1/dOGVJVPUXFt+8lg+zpDa/NmqUt6yYYdht57wM0Om5Ds7P1nD98L4?=
 =?us-ascii?Q?OThD/iif1vmp/QL8XYXyR5pd1q9aAsunsaJ4MxHQY9ZkhEkeOgp95uGtabPM?=
 =?us-ascii?Q?fObY5mmlutyiVl0nvGWegi054ebqEIgMBw+HFMRGDOYDRGP+lXmRH+xgDHPI?=
 =?us-ascii?Q?GqmQzNd07tPnEEsWEt4oQu/vYttyfKMaq1G6s8Ta0FgDGj0FDwTODP6A3N2P?=
 =?us-ascii?Q?R31eyjHwpE8Gi1csGbjD0vW9l9iZcvyr2r9Qryb5BmRbW6F9Lk3AU+tWoXsA?=
 =?us-ascii?Q?+WbkiA13LCBXxr0R1JHbrsrm35STWCcsrQKrx/+lx9B5Db1Qw7y4OLM4KsD6?=
 =?us-ascii?Q?UodBjikWDNwRtCVxsmXIURludpJ5BvN3hkVt5FYPFCK3LoJrMoy6Tsn5EMxh?=
 =?us-ascii?Q?ZMr9A5ro8b3esDD/nae56LccIWX6Mf4aGrvzlSkuZi/wAJXvsJQIr3i2dAxM?=
 =?us-ascii?Q?wAHnXDaSpRWWyRU9eGhBK0QO/YmdAU92x0ywIrFzwgjtlWjx+exS/dnohIx9?=
 =?us-ascii?Q?DNFRTuC3TiUI/Cgdk9xAUkpmFqyxGGhUsPXZCQsvu8bZVmtbChUz/rGk93nx?=
 =?us-ascii?Q?xkTZNwgMblyPweqCfgY7RYqIxGGfDgyTXgJnSyCUquLhrpNIY6u4S4CuHOkG?=
 =?us-ascii?Q?kON4FZ7zb5zPa6Bt61PJh6kffyp+KhhQusdZT1ZZlQRkXGNaorAlRyrpmo4g?=
 =?us-ascii?Q?qqQhy7+5gRqv1igdDepYU5bDtUDt728fzbTHkOIU+GZI0EVAIaK7Vj9DlX6S?=
 =?us-ascii?Q?SUBGrWGpOUdQJACfJLlhbF3oAZzjrxnc1LDpaB+OkNFrG+rjR/Ah2YDL6z3b?=
 =?us-ascii?Q?R02AOsK8sBkBnZFiuNrr8fajwr7wRFb2ZuGTFoCZ0dHdrHjqk6+njrgWRRgy?=
 =?us-ascii?Q?C4sZGjnYVBBODpz/mqjK6y6bRJsk06a1WxmdZDPIJ//1BBgFypC2kiMlMbhU?=
 =?us-ascii?Q?4X2IX757x5+1hprxS0ewvnXRorjaeP4yt56ganLxiUJTgOcHJQW4Yu8eww2Q?=
 =?us-ascii?Q?CYYbHa++aH/JV6kxULwXwPgdrGmOURPuLP1Hke+Irrzz+Y7qy8sPkKWYdCZV?=
 =?us-ascii?Q?sx1xyi9QbBo/lL4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 22:03:56.1323
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 197b53d0-10cd-4907-489a-08dd5cfaca48
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6880

There isn't currently a way to determine if a domain is the hardware
domain or a privilged (control) domain.  Add new domain info flags to
indicate these properties.

This is useful for a hyperlaunch-ed xenstore domain to determine which
domains are privileged.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 xen/common/domctl.c         | 2 ++
 xen/include/public/domctl.h | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 05abb581a0..3c6dcfed87 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -103,6 +103,8 @@ void getdomaininfo(struct domain *d, struct xen_domctl_getdomaininfo *info)
         (d->debugger_attached           ? XEN_DOMINF_debugged  : 0) |
         (is_xenstore_domain(d)          ? XEN_DOMINF_xs_domain : 0) |
         (is_hvm_domain(d)               ? XEN_DOMINF_hvm_guest : 0) |
+        (is_hardware_domain(d)          ? XEN_DOMINF_hardware  : 0) |
+        (is_control_domain(d)           ? XEN_DOMINF_priv      : 0) |
         d->shutdown_code << XEN_DOMINF_shutdownshift;
 
     xsm_security_domaininfo(d, info);
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index e2d392d1e5..84c2af6a09 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -155,6 +155,12 @@ struct xen_domctl_getdomaininfo {
 /* domain has hardware assisted paging */
 #define _XEN_DOMINF_hap       8
 #define XEN_DOMINF_hap        (1U<<_XEN_DOMINF_hap)
+/* domain is hardware domain */
+#define _XEN_DOMINF_hardware  9
+#define XEN_DOMINF_hardware   (1U<<_XEN_DOMINF_hardware)
+/* domain is privileged */
+#define _XEN_DOMINF_priv      10
+#define XEN_DOMINF_priv       (1U<<_XEN_DOMINF_priv)
  /* XEN_DOMINF_shutdown guest-supplied code.  */
 #define XEN_DOMINF_shutdownmask 255
 #define XEN_DOMINF_shutdownshift 16
-- 
2.48.1


