Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CF58FFDDA
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2024 10:12:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736381.1142471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFUhq-0002DR-Ve; Fri, 07 Jun 2024 08:12:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736381.1142471; Fri, 07 Jun 2024 08:12:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFUhq-0002Aq-Qv; Fri, 07 Jun 2024 08:12:14 +0000
Received: by outflank-mailman (input) for mailman id 736381;
 Fri, 07 Jun 2024 08:12:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Avvd=NJ=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sFUho-0001Hx-TM
 for xen-devel@lists.xenproject.org; Fri, 07 Jun 2024 08:12:12 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20608.outbound.protection.outlook.com
 [2a01:111:f400:7e88::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3f98c95-24a5-11ef-90a2-e314d9c70b13;
 Fri, 07 Jun 2024 10:12:12 +0200 (CEST)
Received: from SJ0PR05CA0009.namprd05.prod.outlook.com (2603:10b6:a03:33b::14)
 by PH7PR12MB7210.namprd12.prod.outlook.com (2603:10b6:510:205::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.17; Fri, 7 Jun
 2024 08:12:08 +0000
Received: from CO1PEPF000044F8.namprd21.prod.outlook.com
 (2603:10b6:a03:33b:cafe::9b) by SJ0PR05CA0009.outlook.office365.com
 (2603:10b6:a03:33b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.12 via Frontend
 Transport; Fri, 7 Jun 2024 08:12:08 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.0 via Frontend Transport; Fri, 7 Jun 2024 08:12:07 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 7 Jun
 2024 03:11:59 -0500
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
X-Inumbo-ID: a3f98c95-24a5-11ef-90a2-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SQcdtiN7rUK6mSpewwdeSJlYpoNEXzHlbbXRQzb7XCGBZqLqg7GH6NBTmFa3nBImgVXizzx0mp33JqtbOY5TVEN9s7WVz+Lr/+Pq4o+EAegsGs8Zhw1zemYXpPeiwG7sOz7u+dHzwMqir0Yvvo7zIWpELE9jl9OhdLga5B6VF0N6r3yyE4rdaHRE3Gi3XvKXeZ+HvVRYxL0xXsayRpEzrNromD52LPuaRqbY/SZ1KV7n4UwW3bQ2LssBDoGojcKARrGiCnfizEZJdIlYXzW0D0SXrUXKx/LMSK3rYgkA2HFSAGAOQm1R6HESgzhcPHGqbG6FyO31Rerh3EFsRe4GPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qcD0xWxQTGxAvBu0zi4mdkVlNKBayZWA9asqiHxXLZ0=;
 b=NdDIdTi6WfnTckXMO/obfujg9++1F5704rj8CgtGKjf7gq435AD99/2jwvYPPUIafhFar+cIgiwDut6yZUIGCs/9tRearg65OaLw1f/lCWPoHVf4MVwGhRWUS/sBQvgMKKaxNz5NwBwHhuXQPURxI91TJbNmE1v/F+aFNAOh8rA+9pCerw44tv6Ohf19C9HSVoWgc3aoVChnbSwpE/kOHVMVjWBjzPj5Qk9Yij+fJe/Y1KBtknqtCCSVkKMXoZIMVB7qQMbwP0e7wyTLf6FdTVwNH8Rm0mRyBJkMBmbYZwN1Fz7/bcXh8Qm+JvWa8vX7iEn2q/bUCZzDL/mgaS1MHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qcD0xWxQTGxAvBu0zi4mdkVlNKBayZWA9asqiHxXLZ0=;
 b=eI7lBBQxffiY2IXj79JnlOtOK0meQci6Z6yjJzc5C22Azuw2P99ILoQFiAfZ2dSobQZTo0Lx2v9S5TP10zU8KhfZNN3Mn0OKlNEgc7xYvpRd6j5AK5J0m1vBqPiZqoWWXSCvFEjy+yIxH7upaMwDhn8GaOBCC3MGZj+0tIi+9Kk=
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
Subject: [XEN PATCH v9 3/5] x86/pvh: Add PHYSDEVOP_setup_gsi for PVH dom0
Date: Fri, 7 Jun 2024 16:11:25 +0800
Message-ID: <20240607081127.126593-4-Jiqian.Chen@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F8:EE_|PH7PR12MB7210:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a3a5448-453d-400a-2811-08dc86c9865b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|376005|82310400017|7416005|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5F7rF2rvSgyBwSLNicxaP1ev/9UrT9aEeafFtVpNnKv7+38TiOOiWa2201ZI?=
 =?us-ascii?Q?7lXz2H2mBGgZzQFBx1x+jK2Zr4kMM1dgh5ie/PiLyCaft9dKN8uFGT7mDtrH?=
 =?us-ascii?Q?TifcCjh5XJYCGdwQSxWsmVhF5boqcK8ouoBF0SOQ1VgUh5o3qJ3bWKG6mQh9?=
 =?us-ascii?Q?GIdhpSs512IiNLaW+xC+xl7k+3LVoYeTGojVJtRvzKG7p3lj94u4gkC3jKtV?=
 =?us-ascii?Q?OdKb5kfafwXLt8wSaTRLsKHVlsQGt3+EKTVpquHCiqSOnURuLoRdMDawfTnb?=
 =?us-ascii?Q?7a9PIsorJHV5JUB14viFGQRBBHdAxKQ/36z3JXKTAv3YBJaqIVbiCd8aln48?=
 =?us-ascii?Q?48L+Y1YMrtRkz6PG4u/WnpkMCvDvVc0bh8nT2IuoYcejwzTP4upVvJX3lc7B?=
 =?us-ascii?Q?2vg3vbNWGkrxO8Z+Ke8NYO+qENIkxL8sl83K1p/yHnknbB73lhDIQ+v4Fjty?=
 =?us-ascii?Q?cDoXx1imZEj+AAsDi+dB90DNu21x7vT572VzAYElS5DmapumG4J6AZX91/oc?=
 =?us-ascii?Q?aXRebu8hOxrumsbjwyhmBgOBlWDwlTZQ4FdQCENI10F8xHvOjV+6MJl23tuo?=
 =?us-ascii?Q?+xh7UQnusofq5JIgkAPIwzopsXdyH4ZiL6+hBKSBWhiVolIiLaLC18PjGtkH?=
 =?us-ascii?Q?niTx5Mg/8sKxUH96pYEnxvOBcvAaWrhyNCGuGkAKbYErFayNCALq/qGDbUgq?=
 =?us-ascii?Q?ERPl4OB2nX1Cv5b1ibTbsdDjjR2QiiD9zXj2Tau2WrlIPDXwdwKokVBgAERg?=
 =?us-ascii?Q?tDFOGB7fiOkE5Q2/Z6sFqIPtIvRtunBQokynnRp3PydN1xUu1SycMDTIN4l4?=
 =?us-ascii?Q?RZU/aa6PE6QlI1OMXwHgeRcwULiZcjg0WSKDEgZMRnZCgiER3NB5zwF0hzjx?=
 =?us-ascii?Q?s/cVyMovByIDnenNkriQQ8UPOha+lLYGoqwLe+dLTgzrjtWmEUE1ijSJ3thT?=
 =?us-ascii?Q?3Aac2PKtqCmKqfAb2qMXRSO8Gkgs+gy5FnmXSq2Vgu6q7F+5h3IvmMLbUqcX?=
 =?us-ascii?Q?mMB55ACaeaFUQMzVJAJY7YOU7lk7gk5aLXHgY3Tm5RQXTeOvkaTlrNJgeukF?=
 =?us-ascii?Q?LZ0MEoGKWQVbU3h8I3rovaqnH5DiMO5wxDbH7gThRgXRC+EbfvBqMXDPSRD5?=
 =?us-ascii?Q?oGl+A15/FEC0+szmT3EJVRid9eZK6+00b47hJ7iC8xjQUmLySs7MzuL2t44h?=
 =?us-ascii?Q?hd/OBmbHfz8tc9IMHc/4wFa6nUkGZHy9tkIR6EFfsYrgDzTeW8i4I9YLPiRZ?=
 =?us-ascii?Q?96g41ZOjdk90IrBjXj98qUhPZt7OZwwEqwWSkk2drnaeQRxG9O3LXNuTVDpI?=
 =?us-ascii?Q?IKcNg5u5Dg2BTHKSQHFPgFxlSeJ5UfS5wqINTZNsq+BPqMHnDOWJ+oBziZfz?=
 =?us-ascii?Q?jcDIPcs=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(376005)(82310400017)(7416005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 08:12:07.8718
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a3a5448-453d-400a-2811-08dc86c9865b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7210

On PVH dom0, the gsis don't get registered, but
the gsi of a passthrough device must be configured for it to
be able to be mapped into a hvm domU.
On Linux kernel side, it calles PHYSDEVOP_setup_gsi for
passthrough devices to register gsi when dom0 is PVH.
So, add PHYSDEVOP_setup_gsi for above purpose.

Signed-off-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
The code link that will call this hypercall on linux kernel side is as follows
https://lore.kernel.org/lkml/20240607075109.126277-3-Jiqian.Chen@amd.com/T/#u
---
 xen/arch/x86/hvm/hypercall.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index fa5d50a0dd22..164f4eefa043 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -86,6 +86,7 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
             return -ENOSYS;
         break;
 
+    case PHYSDEVOP_setup_gsi:
     case PHYSDEVOP_pci_mmcfg_reserved:
     case PHYSDEVOP_pci_device_add:
     case PHYSDEVOP_pci_device_remove:
-- 
2.34.1


