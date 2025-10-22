Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D52BFE841
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 01:22:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1148554.1480529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBi9K-0004BH-Cw; Wed, 22 Oct 2025 23:21:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1148554.1480529; Wed, 22 Oct 2025 23:21:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBi9K-0004A0-7o; Wed, 22 Oct 2025 23:21:46 +0000
Received: by outflank-mailman (input) for mailman id 1148554;
 Wed, 22 Oct 2025 23:21:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KROf=47=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1vBi9J-0003eX-5z
 for xen-devel@lists.xenproject.org; Wed, 22 Oct 2025 23:21:45 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id decb1465-af9d-11f0-980a-7dc792cee155;
 Thu, 23 Oct 2025 01:21:43 +0200 (CEST)
Received: from BN9PR03CA0220.namprd03.prod.outlook.com (2603:10b6:408:f8::15)
 by DS7PR12MB9475.namprd12.prod.outlook.com (2603:10b6:8:251::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 23:21:38 +0000
Received: from BN2PEPF000044A0.namprd02.prod.outlook.com
 (2603:10b6:408:f8:cafe::f0) by BN9PR03CA0220.outlook.office365.com
 (2603:10b6:408:f8::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.16 via Frontend Transport; Wed,
 22 Oct 2025 23:21:38 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF000044A0.mail.protection.outlook.com (10.167.243.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Wed, 22 Oct 2025 23:21:37 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 22 Oct
 2025 16:21:37 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 22 Oct
 2025 18:21:37 -0500
Received: from SATLEXMB04.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 22 Oct 2025 16:21:36 -0700
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
X-Inumbo-ID: decb1465-af9d-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=op3PEH06WZft9gCkpLAONNJ60f5OuOJo/QGHeAaT/Iz3vJytGpdwvcA4iAwF/0Ie48zJsw840l/W2y3aCzdhJ2So9HJM+v/TCmxyknb6vxx38sOW6eLsqiXxmkDu8t5TM9jLXt1RjFKkEAS/WF5JC1+cy5niVCzP5caYjz8Vi/6wA5TnSQtrID8ZP7ciLi/5wo7qhx0o+uZybTnm+fttdcgByNE5M1MIeP15pWUdAC+ush9dNix54hir6zWafqEUlCE1MkgbsIwlJQ1Y7Fw+BUAxRT9TmV4DAUqqs3jQh2YwviaD+IDanEPfBJXyH9+sVtgxnbK+2mu86KsfA+myJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LZNtrUCtqCxFaK2QhoJpsm8umUnuvrY2vL1B+GJtJdk=;
 b=vTWACZAmcNBeACu+6JHqJxnEiI5iBOHliBaOo40eObn8RofygYa6+2cz368v5uo43+VD0d9kI6Rgp/eZdqdjR7u+QT6LsoVzl5buDjRUcPsqRzokqSXM7HeAA6njH1ML4cFSzjzeVxBvw12T8LaHDoj7PwZKcN1oYhAX6kPddf1UcQEHCZjmi6zhsWlDlSt+HI85PwIIl/6ohTZncn2S2zs6YZMagJieUtsqgKr3J70aRqE7gXBLJR3CUceJXYCYUvFcCEOR/MLR+aYoy0L0Ji7JtoWTaEkHD7614119Pj0BQyEMlMzhEXHFRcRji3pl6P3TeuTH1p8YgD2k48k5Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LZNtrUCtqCxFaK2QhoJpsm8umUnuvrY2vL1B+GJtJdk=;
 b=MkMy0/x3Yvm+y5JorYKvVaOSOFE/nuaivDpojotl4tpRpQL/p0aYA74Fapw4eSmMImp+24S4CYORDQQpZkvgojsGMmLN4lSeezxuKH27nPa1HIPy3kYel2hNIbibzPo/IDhB7AIf9kVEoJj90R/GHzBGJTg8Tf0ox+asUxVAhms=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <stefano.stabellini@amd.com>, <jbeulich@suse.com>,
	<andrew.cooper3@citrix.com>, <roger.pau@citrix.com>,
	<oleksii.kurochko@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/2] x86/mm: correct PG_log_dirty definition again
Date: Wed, 22 Oct 2025 16:21:31 -0700
Message-ID: <20251022232131.1190867-2-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2510221616570.495094@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2510221616570.495094@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A0:EE_|DS7PR12MB9475:EE_
X-MS-Office365-Filtering-Correlation-Id: 15568535-719a-43eb-e49b-08de11c1bff6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?h5Wl8TT4qaYGG2tSyAVIPBbOk429EG1ap3yDg+5r8m6yraVsF30Up4lOwsbN?=
 =?us-ascii?Q?DUz65PN5Vd+RjSBpMNNT57heyx+18Uriqt7+qle73lzWtxwPUm7Aj9T9b3tY?=
 =?us-ascii?Q?c8497/uOec8mfpReHnimod5fZuW1+rlMYqlP6i004qceogI3jkTD4zxclfWa?=
 =?us-ascii?Q?9I0DYUNZdCyoUdnoXsHXVH9cs3+VTXosgOU8CiQeruKhBTPTJFi9PuJZtX9m?=
 =?us-ascii?Q?tpBZpXPacJJKGrOzk/LhvAjfo39R7DzSZgC66BSiVMImH75QlMUtKSMs01Rm?=
 =?us-ascii?Q?LjfXP0sG9tccRUIfwGnz/OyQi0R7jALbxcNUJ6j7vUvZ/vNVyI42LCIKb3bN?=
 =?us-ascii?Q?EVPJ76AQLFL8LJBGl7AmHQH8RGUNQ3jUMP/CMQlwsHfuTjLey7PmEbrFQzJb?=
 =?us-ascii?Q?nPiS52B47m8IsSLiWxLmKKnn3gwWnWGIIj+yxwKiTSdVyJSnUarQnfzja9oB?=
 =?us-ascii?Q?CcMkvU0TawNrEF52FOnj231JRo0508V2xBY0S/p6TraLPoiO45we1t7iyRYX?=
 =?us-ascii?Q?5jnU3lrAcfIGZMKSj7oEi7e+Z/irXcvN8CouYhfgvCKOrBNZmsxS3OAKM0T1?=
 =?us-ascii?Q?OG4zqYEYv/3dpoDmVBbAYHDkuHKtqlL1AnT4TFNhXzFjIf+iqauprujCoG/m?=
 =?us-ascii?Q?h6G47Cxjlp4eJYCzrEy772Spuoe0RmxO/S/cawI9/C1nXQWK/Oew+ms/PL5M?=
 =?us-ascii?Q?EVZa5dUcPQg2gHntXfWa+GzTuiaz7VKg8BtJnUXEFV08wUVcJxKaiXkQjn1T?=
 =?us-ascii?Q?DB+sYyxQWyzoLUvOVhZ3JNgH9H1/p6Kbn9cj7Z3F6ay8CTp37HDLLCbX9X91?=
 =?us-ascii?Q?FXqHrDPm10Guf6XcxjVbcDW93nddlxBtyFhoin16MXY/iVkvS3bsnV9TMKVT?=
 =?us-ascii?Q?DCn5b8/MjhPWa9zymD4tEvklPU9vaalagDDA4Ja+O/2XY9SuqHWN0MCTUtNE?=
 =?us-ascii?Q?SCHBm2Euv3vMxiJamCdfjDK1XyvSAhBC5DNlzAZddRjK1xr0Hc8oZ+m7IHSN?=
 =?us-ascii?Q?+vYwGxPNWyPxB6MOt0ebjCd0rU8c6O6FdZR8jGcfMUgMxmu/8ptEtmxCgz2m?=
 =?us-ascii?Q?Jb1K6DKPGagLfBsCeaOeOftCkAEqoVTCOQHk7WhLvpnahlTk4c4I4sVFchS4?=
 =?us-ascii?Q?PfxcEZ3HYQuEZRjZjKEdVpQdqu1YG5nSbMrZup9BJgUdU7kY7jxmEX3PreFu?=
 =?us-ascii?Q?yvQ9m9crL+24d3ModGkqacfvYXwJUdn9uHtjR+oTiNxWr0T/IPkeEtvf0gcG?=
 =?us-ascii?Q?f3VTSd8quBuIK//Cid4MrT3MtB96qVdl6cb+Sg+Gp05V18sXzc6q3YRyLAKa?=
 =?us-ascii?Q?zHlQE+YiCUcTM+5WPEDyjMAphzGB7Qbq5PHNyNU1tDkmKD/XBV7YF6rFHHj8?=
 =?us-ascii?Q?UbPPKktFHNF+AJAqx3ZSRqfQfbHcWJA9/axoHyMSvlmbhF9ohREjTqnvdbaE?=
 =?us-ascii?Q?3xv3dEGX1QhbOhPOuwuicsOhfchE2cPlcFMV3p3OZDf/ZZEHJZ1lxncT40dj?=
 =?us-ascii?Q?hpNt07PqTtnoEMKh9cXPAO3Ty/08kpgCjgMbuYMpaX0EpPYPf5itvIT1qDj2?=
 =?us-ascii?Q?pdKnqDNywE4CauYqeIU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 23:21:37.9751
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15568535-719a-43eb-e49b-08de11c1bff6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9475

From: Jan Beulich <jbeulich@suse.com>

The earlier change wasn't correct as far as shim-exclusive mode goes:
Shadow mode is still to be enabled permitted there, yet the generic
paging-log-dirty (and more generally domctl) part of the code still is
unwanted (and cannot be used anyway, as domctl_lock_acquire() isn't
available).

Fixes: 2ae8a68df21e ("x86/mm: correct PG_log_dirty definition")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Tested-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/arch/x86/include/asm/paging.h | 2 +-
 xen/include/hypercall-defs.c      | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/include/asm/paging.h b/xen/arch/x86/include/asm/paging.h
index 1b0694bb36..0c06b0a7a8 100644
--- a/xen/arch/x86/include/asm/paging.h
+++ b/xen/arch/x86/include/asm/paging.h
@@ -55,7 +55,7 @@
 #define PG_translate   0
 #define PG_external    0
 #endif
-#ifdef CONFIG_PAGING
+#if defined(CONFIG_PAGING) && !defined(CONFIG_PV_SHIM_EXCLUSIVE)
 /* Enable log dirty mode */
 #define PG_log_dirty   (XEN_DOMCTL_SHADOW_ENABLE_LOG_DIRTY << PG_mode_shift)
 #else
diff --git a/xen/include/hypercall-defs.c b/xen/include/hypercall-defs.c
index 8370b4b289..cef08eeec1 100644
--- a/xen/include/hypercall-defs.c
+++ b/xen/include/hypercall-defs.c
@@ -197,7 +197,7 @@ dm_op(domid_t domid, unsigned int nr_bufs, xen_dm_op_buf_t *bufs)
 #ifdef CONFIG_SYSCTL
 sysctl(xen_sysctl_t *u_sysctl)
 #endif
-#if defined(CONFIG_X86) && defined(CONFIG_PAGING)
+#if defined(CONFIG_X86) && defined(CONFIG_PAGING) && !defined(CONFIG_PV_SHIM_EXCLUSIVE)
 paging_domctl_cont(xen_domctl_t *u_domctl)
 #endif
 #ifndef CONFIG_PV_SHIM_EXCLUSIVE
@@ -298,7 +298,7 @@ dm_op                              compat   do       compat   do       do
 hypfs_op                           do       do       do       do       do
 #endif
 mca                                do       do       -        -        -
-#if defined(CONFIG_X86) && defined(CONFIG_PAGING)
+#if defined(CONFIG_X86) && defined(CONFIG_PAGING) && !defined(CONFIG_PV_SHIM_EXCLUSIVE)
 paging_domctl_cont                 do       do       do       do       -
 #endif
 
-- 
2.25.1


