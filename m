Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8335C9D9C4B
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 18:20:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843947.1259530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFzEP-00050a-0w; Tue, 26 Nov 2024 17:20:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843947.1259530; Tue, 26 Nov 2024 17:20:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFzEO-0004uv-Tn; Tue, 26 Nov 2024 17:20:08 +0000
Received: by outflank-mailman (input) for mailman id 843947;
 Tue, 26 Nov 2024 17:20:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lzfN=SV=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tFzEN-0004k8-9N
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 17:20:07 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2407::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab4bdcd1-ac1a-11ef-99a3-01e77a169b0f;
 Tue, 26 Nov 2024 18:20:02 +0100 (CET)
Received: from BLAPR03CA0041.namprd03.prod.outlook.com (2603:10b6:208:32d::16)
 by MW6PR12MB8900.namprd12.prod.outlook.com (2603:10b6:303:244::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Tue, 26 Nov
 2024 17:19:55 +0000
Received: from BN3PEPF0000B06B.namprd21.prod.outlook.com
 (2603:10b6:208:32d:cafe::55) by BLAPR03CA0041.outlook.office365.com
 (2603:10b6:208:32d::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8182.20 via Frontend Transport; Tue,
 26 Nov 2024 17:19:54 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B06B.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.0 via Frontend Transport; Tue, 26 Nov 2024 17:19:54 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 26 Nov
 2024 11:19:52 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 26 Nov
 2024 11:19:52 -0600
Received: from amd-BIRMANPLUS.mshome.net (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Tue, 26 Nov 2024 11:19:52 -0600
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
X-Inumbo-ID: ab4bdcd1-ac1a-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQwNzo6NjBmIiwiaGVsbyI6Ik5BTTAyLUJOMS1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImFiNGJkY2QxLWFjMWEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNjQxNjAyLjYxNjgyMSwic2VuZGVyIjoiamFzb24uYW5kcnl1a0BhbWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yunzMZ21GMUd/h77Vtl5ARGp3smqCcADElWnwjFAsOL5l564FOgeLRyYBAQPeo0mpnqzClvmuXssQej9JXavHmxx+Z8ykwm4Fw4232E+0wbjaVwwGfGt8klngqoiQ2MXuH8Rcoidvg93ebVECMp4rc8/Uw5D8sevObOWB1ki+zgjLrbdPpvfOnBdM9Rro7tpte4ARXkrSPzr1AFDN0TXrpmQYAvcvbtBpQJhTOU67vnGgwROjIHlBir1kpAzZx04Lm8rgPQkvBUdVTdqOentKJGBHxupET37lAZikvESgIUVxATB5V+z71dNi4DJR22Fbz0BFdo51T965lECQuyMMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uu7AKaBE7cQGMVaJpznh0ldBUuYX3CfpL80utGtzydc=;
 b=aCSim3baJZEMxj3tiQqZUrWXJgBNyUsqBRVSAeWC5kBfX96ardZkI4EfTozwA7XDPj9b0NVtQJRIzioGToFPIslZCP789ou00ei9pUZewKBg20fpZvjAYQCmT3EZo1u75mRyCcClDZ1Z3uhcrGdhd2EXDD3j003o7sMZ3uUzCg5rUG67vgheaBwpdizZCFaIdL4BUwzj8HmDxGlgbKXWVRiS/hT5/IFOw8uL83afT0ILTPJCMcip8WaJ1AqctHaOo3Jgx1urtMUYgahOGoFQj1CqnOIFAw6BLWb0WBDXajye4WYZNjuvCWY+HdMMK3hCGit4IejhtXd4TQzWm6T8Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uu7AKaBE7cQGMVaJpznh0ldBUuYX3CfpL80utGtzydc=;
 b=a2L/qfJ7d9ZR14WBQdIZUGrGNRqa3IbBew/U5mRWIRCdbw3njicCiJ/DyO/EW4OMExoGF4AK4m8GjyuQYY+sWUPB2Dt3BHZH3KLJRzpbGQETxMPPPuHcbpYlCdZECILTBYvbpWAZ1AL+bxM9kMSok3tH4vHXGuRQBdEy7HzMtKg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>
Subject: [PATCH v2 1/2] xl: Keep monitoring suspended domain
Date: Tue, 26 Nov 2024 12:19:40 -0500
Message-ID: <20241126171941.170897-2-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241126171941.170897-1-jason.andryuk@amd.com>
References: <20241126171941.170897-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06B:EE_|MW6PR12MB8900:EE_
X-MS-Office365-Filtering-Correlation-Id: 147dd5bd-b82b-443a-eaae-08dd0e3e8b76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5npzX6wCUbq63ixJdcRcao1pPiyeHxd2pm5rjOhPzqENbH73qBffa0Bb2zQk?=
 =?us-ascii?Q?M3qe65qSHdNbo26CltgT9w9RQxwHLoIvt9fFrjdFKzomqWGLIg0mBVeBrzxD?=
 =?us-ascii?Q?tx7LTyyUgMOooR3+tooKpJsbeke2//XmUDoBYX6WhbMsH9hJrvnwN0dAiD+N?=
 =?us-ascii?Q?SN95vsDw/inpSS+u7M+X70e/V79tVOAn7DaKiWSrWRy642PSFFGG1vqlKDEh?=
 =?us-ascii?Q?/o2PCYWuWPL8zWXtwvHwwV3NE70HbNu7Ly9j3nOOUhvdw5+orOq4vuquEUnO?=
 =?us-ascii?Q?ylNa2aq+VOYWobsZGRUwtK1zVpydJzXgg9UeQiCg1ohi4mCNNhOxsBcbhzk1?=
 =?us-ascii?Q?hanQX9pqDRs+1Koh3gvSYqfythe3EFKPZ13ZXCBAkq4Px87/rYvJ9lgurlT2?=
 =?us-ascii?Q?l4V+oKAvJ+6Km1B67WS1xFv+C2H3YFe0tHysxLELEuL2J1yG7ByRzYmV0gaG?=
 =?us-ascii?Q?V46GAkPKbAyQf889a+pETT8GopS3ualWwF33NDrZWuyabK6j6KQE2wVoEZHI?=
 =?us-ascii?Q?z041TaQ+rD5BnK7XxRrj+nNRs44eG2N1OwpGfTALyibTvik9itnnLYyNb1rG?=
 =?us-ascii?Q?XdUbOq6Ml+XfeDAog8J3o4P/AWHo5XR4jyCfLgbtO6+Jg5iqJYiD7h8JlUnJ?=
 =?us-ascii?Q?0ySZ3guZ39Rm/jMfZLHkXLr6x2H89AOOScag6/RFndUTKL4vTt+OxykG+Vrj?=
 =?us-ascii?Q?zsA8mwdxrS6vPNXsbA6H4Pu2rUuO1sii0XhzNh0FuEiHe9cvt7KnCGcMEsmX?=
 =?us-ascii?Q?k6epN7NmNv8boCYYHv5Dh0K8LtqUSZUMA36XMax8SGXnA0NqK/XREMia+hng?=
 =?us-ascii?Q?dORNbhF+Qf47VOIgKN2GGEU2/yLZyCyqZDK5bm53Bk5iWlxJoQ9V/XbrMD52?=
 =?us-ascii?Q?zhALCt14QdHj7uhi87lF/sA/j+hnrHLcBzfVzxRWiKc3PXTvVF9Nf4t3bcCV?=
 =?us-ascii?Q?tH1qWrqysUVISQCPWggayamDB2WSR3d3puyx1/B6iWTQksYOV4ZnSOggvdsl?=
 =?us-ascii?Q?kcyJxUYglq0oLrwp1UHPwuNa6wdItYh2oTNfzCiREEbsRH7p6PkHhUOMSiwZ?=
 =?us-ascii?Q?ORSZCKmvFy5mEAwLdePN+q/0AKvf/FaXGxULk8VjeKy0Xy/JWlhndpdfBpPV?=
 =?us-ascii?Q?q9QwWlYhDOrGZn1terZdtkbeND/YQGYKsR27KzyUiamuQPbx6gGipzQn4rqj?=
 =?us-ascii?Q?2l5ZXSHAgAWdK1DKFI1dPGAWc0lBYngJFFiNvtVduUcvkagr31UJdhftxCzv?=
 =?us-ascii?Q?8aWNPMMDuykx487SWCdq+3Id+I98OYeEEaOQYzszDs7Uz3Wpc3IodWu8+JhC?=
 =?us-ascii?Q?WwE95szjYcrGeG2FrOFoH/oD5NPvVMiLtcsCrH+lrK5ARUm7qklGEKbwin22?=
 =?us-ascii?Q?MBYJLhpssUy4DUXsGSYI5b4WhZfm0IcTtyoNg82/nrWV2EwT/MlwK9YngWFF?=
 =?us-ascii?Q?NPp6VO7wshVIFrDEIJTIE2CkqNS0Znp1?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 17:19:54.6441
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 147dd5bd-b82b-443a-eaae-08dd0e3e8b76
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06B.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8900

When a VM transitioned to LIBXL_SHUTDOWN_REASON_SUSPEND, the xl daemon
was exiting as 0 = DOMAIN_RESTART_NONE "No domain restart".
Later, when the VM actually shutdown, the missing xl daemon meant the
domain wasn't cleaned up properly.

Add a new DOMAIN_RESTART_SUSPENDED to handle the case.  The xl daemon
keeps running to react to future shutdown events.

The domain death event needs to be re-enabled to catch subsequent
events.  The libxl_evgen_domain_death is moved from death_list to
death_reported, and then it isn't found on subsequent iterations through
death_list.  We enable the new event before disabling the old event, to
keep the xenstore watch active.  If it is unregistered and
re-registered, it'll fire immediately for our suspended domain which
will end up continuously re-triggering.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 tools/xl/xl.h           |  1 +
 tools/xl/xl_vmcontrol.c | 18 +++++++++++++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/tools/xl/xl.h b/tools/xl/xl.h
index 9c86bb1d98..967d034cfe 100644
--- a/tools/xl/xl.h
+++ b/tools/xl/xl.h
@@ -301,6 +301,7 @@ typedef enum {
     DOMAIN_RESTART_NORMAL,       /* Domain should be restarted */
     DOMAIN_RESTART_RENAME,       /* Domain should be renamed and restarted */
     DOMAIN_RESTART_SOFT_RESET,   /* Soft reset should be performed */
+    DOMAIN_RESTART_SUSPENDED,    /* Domain suspended - keep looping */
 } domain_restart_type;
 
 extern void printf_info_sexp(int domid, libxl_domain_config *d_config, FILE *fh);
diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
index fa1a4420e3..c45d497c28 100644
--- a/tools/xl/xl_vmcontrol.c
+++ b/tools/xl/xl_vmcontrol.c
@@ -417,7 +417,7 @@ static domain_restart_type handle_domain_death(uint32_t *r_domid,
         break;
     case LIBXL_SHUTDOWN_REASON_SUSPEND:
         LOG("Domain has suspended.");
-        return 0;
+        return DOMAIN_RESTART_SUSPENDED;
     case LIBXL_SHUTDOWN_REASON_CRASH:
         action = d_config->on_crash;
         break;
@@ -1030,6 +1030,7 @@ start:
         }
     }
     while (1) {
+        libxl_evgen_domain_death *deathw2 = NULL;
         libxl_event *event;
         ret = domain_wait_event(domid, &event);
         if (ret) goto out;
@@ -1100,9 +1101,24 @@ start:
                 ret = 0;
                 goto out;
 
+            case DOMAIN_RESTART_SUSPENDED:
+                LOG("Continue waiting for domain %u", domid);
+                /*
+                 * Enable a new event before disabling the old.  This ensures
+                 * the xenstore watch remains active.  Otherwise it'll fire
+                 * immediately on re-registration and find our suspended domain.
+                 */
+                ret = libxl_evenable_domain_death(ctx, domid, 0, &deathw2);
+                if (ret) goto out;
+                libxl_evdisable_domain_death(ctx, deathw);
+                deathw = deathw2;
+                deathw2 = NULL;
+                break;
+
             default:
                 abort();
             }
+            break;
 
         case LIBXL_EVENT_TYPE_DOMAIN_DEATH:
             LOG("Domain %u has been destroyed.", domid);
-- 
2.34.1


