Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B8579373D
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 10:38:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596347.930211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdo1e-0002QS-MG; Wed, 06 Sep 2023 08:36:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596347.930211; Wed, 06 Sep 2023 08:36:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdo1e-0002Na-Ii; Wed, 06 Sep 2023 08:36:38 +0000
Received: by outflank-mailman (input) for mailman id 596347;
 Wed, 06 Sep 2023 08:36:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7I91=EW=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qdo1c-0002NQ-VC
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 08:36:37 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c669300-4c90-11ee-8783-cb3800f73035;
 Wed, 06 Sep 2023 10:36:35 +0200 (CEST)
Received: from MW4PR03CA0358.namprd03.prod.outlook.com (2603:10b6:303:dc::33)
 by MW3PR12MB4524.namprd12.prod.outlook.com (2603:10b6:303:2d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 08:36:30 +0000
Received: from MWH0EPF000989EA.namprd02.prod.outlook.com
 (2603:10b6:303:dc:cafe::1e) by MW4PR03CA0358.outlook.office365.com
 (2603:10b6:303:dc::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34 via Frontend
 Transport; Wed, 6 Sep 2023 08:36:30 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989EA.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.25 via Frontend Transport; Wed, 6 Sep 2023 08:36:29 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 6 Sep
 2023 03:36:26 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27
 via Frontend Transport; Wed, 6 Sep 2023 03:36:25 -0500
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
X-Inumbo-ID: 7c669300-4c90-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T9+CgbifMdb0JZ2kJyJRPYodmoIloX7XVEH6Rql4vVEiKtzEdT1Gj4ph398guFJRYch1AzcXoL1WtTDgLrCJ4PYtD2s4CN/of+nnPPE4l0sOzHDML8PCuD6Astzb0rW7v8lsnHHyL0cqShBYU19q01a4t0TkWxrv3StrJiaZHZks42L4ML0lt+clhGQfP0GfYYrlQN+h8Rzn1ypD4+9uIzu4BC0iQ0KZHRji8YyK4b1PFkDS7XV34QvEq882Miq/6oOI7fLB6YMcNic09kZlLIbbj/Kvuwo+3QMHSf7YFaHpQcI3iDZm+bLki2jRLBPOcYxwaqGYTm/EauewDM4TwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2N9qman4jPoFedFZdZwqNPAoopTV8srge1tPN9OvOTw=;
 b=OCfXYgvOsLkQ5MatLusUdv+JuAd5xAznjt0j/2JdYsPVu1kI7MccRL8LpNJKxYzxpgnzuW2qoLa3EOf3UDZuzEv2CZ9a44MeMQVAUEmhv6W+gmw1i3+Yz+xikYqlV+GgOIFseODekindF8wtZguDcDL1Yg6S2wZa8PWeEbl6cAzrjWJkmns7+kEJZxvR8JC09OQgd61chZ5Uw11dOaEktJufLj3Js+mPbV1rZakKvyfebE9GWeuw5oO6LAUDVHgcnhspARK672tbpey3k7i1E/PVmaNc9HAlbJVZrmAmHcALPQVx0+yMY7HGbGQ2T52WrZJRKpQGif98OgQ08sOzEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2N9qman4jPoFedFZdZwqNPAoopTV8srge1tPN9OvOTw=;
 b=bSL56byUyXvBv/snYMZuzYj/sERYPKybDfAcDtLy35u4E62TpD5N3ltLXOy9pOV0HalOm4IGi6HxE0hEz0TuQBcxxx+gR17/QofM8AkoKC76Rfn84PV2vNArJgKrX+A623AXT3ezvILhSmOvbmbuX2l2H1SbjxnNC/G7ajiwil0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, <jbeulich@suse.com>,
	<stefano.stabellini@amd.com>, <vikram.garhwal@amd.com>
Subject: [PATCH] tools/xl: Guard main_dt_overlay() with LIBXL_HAVE_DT_OVERLAY
Date: Wed, 6 Sep 2023 10:36:14 +0200
Message-ID: <20230906083614.25315-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EA:EE_|MW3PR12MB4524:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ebc7cd3-c417-4004-c503-08dbaeb45e25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	C4sAQKYUYQTEgNkz3cDHdPxenZtglauhu6hg3O+w75kL2KuEhst2/IlBfKI/5a8jh1oamo7+1uHMEMxYF2WuKO1YF2OxMTekQKZz4vUgz4Eq0xMltwov8uR6okjh3HPiHsTRMspgi2shwJHhua3mEHBO6SGt4LUbFLdO0YLNi/RwDd6o3ds+Nfvt8uZtr9E+XfwLuGUtFPSjZcRm/KLUOhkb68XKIVbYSNDCrCHBAOlnyAeM11sojtXI2OZTSs9+0d++aqslppzI4C9exOjnokA2LiSZVZsy6b8vxaPsX9OkASYwsHNQAvpOCg+joJEVjE5QC8Js3IoTSHenWy+rP4ZwrT9yB+Cmtxc4hMG79bfT7tzphuo2RgT6PvEIvKYfQJr+dim294dZnXTT7LvzWmJbJhUSoWvV2hGml9bqxSxyDDMg5aTMmHgpCjHom2WeLTpGVf3HjET3TzeNDEHp6nv3daRSq5cMvDDWK94+u2r+pejTnYvvCmWM4hu1I6d8r3w41erT1jOKMHpkW+Ivt222b2j44ppj9lWW82nNeHJtpUumseV565NIE9HbagGaKIFGeCJYT8Zcxfe6q/cFIeIJ6+EBnGQU+PsjgTpJ/hfIlCB917O95PyLQNpLAxm0jbE9JCNdy5d0z/2uWvyMGyRbRv3aHYlcEeZ8ulz4fxk73polvlDDxlbtJq6H9cV4PVxOZNEkQV67AjlViu3/WQkbzcog7KwerXolH/UrmVqJNDohkz4u2u7YTXKR2GIb3n3KkwVCPWzK98OqJZaMAg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(376002)(136003)(396003)(82310400011)(1800799009)(186009)(451199024)(40470700004)(46966006)(36840700001)(82740400003)(2616005)(40460700003)(26005)(81166007)(356005)(1076003)(47076005)(36756003)(36860700001)(426003)(336012)(83380400001)(40480700001)(478600001)(4326008)(8676002)(8936002)(70586007)(70206006)(5660300002)(44832011)(54906003)(86362001)(6916009)(316002)(6666004)(2906002)(41300700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 08:36:29.8374
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ebc7cd3-c417-4004-c503-08dbaeb45e25
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989EA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4524

main_dt_overlay() makes a call to libxl_dt_overlay() which is for now
only compiled for Arm. This causes the build failure as reported by
gitlab CI and OSSTEST. Fix it by guarding the function, prototype and
entry in cmd_table[] using LIBXL_HAVE_DT_OVERLAY. This has an advantage
over regular Arm guard so that the code will not need to be modified again
if other architecture gain support for this feature.

Fixes: 61765a07e3d8 ("tools/xl: Add new xl command overlay for device tree overlay support")
Reported-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
There are still other parts of dt overlay support in toolstack that would
want to be revisited in order to use guards suitable to be used by other
arches.
---
 tools/xl/xl.h           | 2 ++
 tools/xl/xl_cmdtable.c  | 2 ++
 tools/xl/xl_vmcontrol.c | 3 +++
 3 files changed, 7 insertions(+)

diff --git a/tools/xl/xl.h b/tools/xl/xl.h
index a923daccd340..3045b5a8e3f0 100644
--- a/tools/xl/xl.h
+++ b/tools/xl/xl.h
@@ -138,7 +138,9 @@ int main_shutdown(int argc, char **argv);
 int main_reboot(int argc, char **argv);
 int main_list(int argc, char **argv);
 int main_vm_list(int argc, char **argv);
+#ifdef LIBXL_HAVE_DT_OVERLAY
 int main_dt_overlay(int argc, char **argv);
+#endif
 int main_create(int argc, char **argv);
 int main_config_update(int argc, char **argv);
 int main_button_press(int argc, char **argv);
diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index 2463521156a1..62bdb2aeaa35 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -631,12 +631,14 @@ const struct cmd_spec cmd_table[] = {
       "Issue a qemu monitor command to the device model of a domain",
       "<Domain> <Command>",
     },
+#ifdef LIBXL_HAVE_DT_OVERLAY
     { "dt-overlay",
       &main_dt_overlay, 0, 1,
       "Add/Remove a device tree overlay",
       "add/remove <.dtbo>"
       "-h print this help\n"
     },
+#endif
 };
 
 const int cmdtable_len = ARRAY_SIZE(cmd_table);
diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
index cea5b4a88e81..98f6bd2e7607 100644
--- a/tools/xl/xl_vmcontrol.c
+++ b/tools/xl/xl_vmcontrol.c
@@ -1265,6 +1265,7 @@ int main_create(int argc, char **argv)
     return 0;
 }
 
+#ifdef LIBXL_HAVE_DT_OVERLAY
 int main_dt_overlay(int argc, char **argv)
 {
     const char *overlay_ops = NULL;
@@ -1317,6 +1318,8 @@ int main_dt_overlay(int argc, char **argv)
 
     return rc;
 }
+#endif
+
 /*
  * Local variables:
  * mode: C
-- 
2.25.1


