Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C16CF912E32
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2024 22:00:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.745516.1152644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKkQk-00043J-E0; Fri, 21 Jun 2024 20:00:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 745516.1152644; Fri, 21 Jun 2024 20:00:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKkQk-00041c-BI; Fri, 21 Jun 2024 20:00:18 +0000
Received: by outflank-mailman (input) for mailman id 745516;
 Fri, 21 Jun 2024 20:00:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=drXV=NX=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1sKkQj-00041W-FC
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2024 20:00:17 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2415::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e001a919-3008-11ef-90a3-e314d9c70b13;
 Fri, 21 Jun 2024 22:00:16 +0200 (CEST)
Received: from BLAPR05CA0004.namprd05.prod.outlook.com (2603:10b6:208:36e::8)
 by SN7PR12MB7275.namprd12.prod.outlook.com (2603:10b6:806:2ae::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Fri, 21 Jun
 2024 20:00:12 +0000
Received: from BL02EPF00021F69.namprd02.prod.outlook.com
 (2603:10b6:208:36e:cafe::fe) by BLAPR05CA0004.outlook.office365.com
 (2603:10b6:208:36e::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.37 via Frontend
 Transport; Fri, 21 Jun 2024 20:00:11 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00021F69.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Fri, 21 Jun 2024 20:00:11 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 21 Jun
 2024 15:00:10 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 21 Jun
 2024 15:00:10 -0500
Received: from xsjwoods50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Fri, 21 Jun 2024 15:00:10 -0500
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
X-Inumbo-ID: e001a919-3008-11ef-90a3-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fzqIL8zpWDnBKXDLraQ7F6o+6lOHYZLXxQvnnhdcuhY9aWPeV6VNZfF7W2Fu58aX/Is8nBpgbVnfMaeOfsgecb0511aMgeA9MvvpsrgYaBFGYrhvhde0K4LvP8Z9wrmuAIEBX+TccZG0lPJwtNkYPHQT4Z0x2KXU6FV4FLSC0GUFvvbYoe3dYpBjCKgzGY/BN7FLPop9uyuP+aZt+ro5ELH27OfC4jMqfEBeCy1QDG0atYdg8UtHMlBneGbjaYXs1cjjIMJenWZCbHZLQSJcD5eSHIp+Bt6biUTe6jQgfpRL0UPz7MlP3OyQgB8QrM16TmVcncHec3j+J/HlBnfBTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=azn84zSL6Ad+0R+BeGFFrMViBNjrO0AdAP5Q7j2OxqE=;
 b=iLl3GDFe6T/FTsPhAMrCHTKBcPZsnii8HdxvTnkIrML40+SfTQ5WJjnnL5n7slCGd4roW6Ha4XX/axYnr95K/VTEfViq1ZIIqIoFaQjNZXhVilB3/bSmLWsM49s5eTjWeqw2vl+J0OrGQmxXNfmIJC612oSVi+sJU8Z8xPxxbAO8rbchh4WG6krbz0CNZe8sMPm/F8grCONvYsqHSReO8M0DwQGAMsJ/azCmbQMXs/SzSC4U3Cbmhy28qyz6G4rd7DqywRngkaOjpBGRHmsuHeeYVILPklQsxPTSN2BKLqYUL6MeWiWq9kPArnwFQL1jG18VS573GLkDxfwxgP4+qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=azn84zSL6Ad+0R+BeGFFrMViBNjrO0AdAP5Q7j2OxqE=;
 b=y9NBYWzRwa8KXZ8fK7MO1L8P51KFwu9/JXiYhxG5eg+hEyH3sA0pSquPLDFasHMVuL7alj+VwYcHhOcqsN6rzlYAWFkXvBL6iCajS/Hh9OsICG/YmwKITL9PtTpAgvvHVfGyXeOJzh0pILtqN9yLr87ldNuIO6OEtPlqyggMdAM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: <victorm.lira@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Victor Lira <victorm.lira@amd.com>, "George
 Dunlap" <george.dunlap@cloud.com>, George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>
Subject: [XEN PATCH v2] common/sched: address a violation of MISRA C Rule 8.8
Date: Fri, 21 Jun 2024 12:59:51 -0700
Message-ID: <994b423128711b2a912401ff4cb13107ad5c6a9d.1718999221.git.victorm.lira@amd.com>
X-Mailer: git-send-email 2.37.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F69:EE_|SN7PR12MB7275:EE_
X-MS-Office365-Filtering-Correlation-Id: 661ffa20-69d5-44a9-1375-08dc922cc243
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|376011|36860700010|1800799021|82310400023;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ThDL8WKZ8ueZD6lhDNBn1KDtA4EjxTE7/9wAGOYKV+UxUiO+GW2k29BehJJC?=
 =?us-ascii?Q?++15Dar76Tq+6DpMSyUgPJnpEYYrHl2pPaBKwVN7L9UjAxZyJojmFJrfEH3t?=
 =?us-ascii?Q?hxwkarJDhCvohb1bHQ3OX8ZgfQQISnIpH9ow4HsS1YEh6oSE0QM09aHW4K2Z?=
 =?us-ascii?Q?iD7HBiZKoTl3vAMVeZDeuwbhiRlQcLjtMs0IxH0TwvkTjSkaKNtNnS6xRsoc?=
 =?us-ascii?Q?Kvh0SIqaBqhNR+kgnAsi7ITYzZwWjerAksoKqBRUPUP4Udr8TYehvcyTFJIB?=
 =?us-ascii?Q?AXyfFJXD//ctRrZ91/QANzpLjtWPqxU17sROBeJtaTIdBm8m3FdNL8okrhIY?=
 =?us-ascii?Q?cnu1JDP34Z+axBT1h6ObiFmXfKuXJYq3EeNg9YfUa2jp9ShAOblzp0Znky0V?=
 =?us-ascii?Q?2j8sjqC0Q4yWTZXLAdh6/3r/+JidxI7Ea8nCSxxdpxe2zGjHo12z2n/DSudi?=
 =?us-ascii?Q?Yq8Pmc8ZyBGZspiVt3b9fS6P6iE868uRRGcsQ7ZHcw7AqbX4BiZT5AspLwd9?=
 =?us-ascii?Q?XmOIzBZlmtOsJ370WlmTyubTnOuckh3ww+E+OH3ReLub4hxhUbVpxKlqiGAe?=
 =?us-ascii?Q?gb8Jmsf7aC/R0D7p3GFZ5PKstO26EMAV8LVhR06Oqm4iNKi28w5iqceLBgKW?=
 =?us-ascii?Q?qSFve2Owa4ivtMxA4oRYB+vGvtvA9uMppf2R33Fk2PKepkaZMxCrn+O2CMmx?=
 =?us-ascii?Q?KatPAQainbXNoTyAuMBXFDE4efPyUk8tdcmauTwJWXOcTuoDSOppVHCLXJ/f?=
 =?us-ascii?Q?XKuetKramnrCecgpAJ+d11jsyEOGi6Ps0U2bAb8FybNj3uN3puHJVyuNaNsX?=
 =?us-ascii?Q?PkekdTb7muN2z9GLqhlFWf5kzJvNgt8XjU2qZlIibV3zOLHnda6x28y0KO3a?=
 =?us-ascii?Q?lOYqYKVUUo8EPteruKfiANFWbb3ZbVxR8ATNZ0u/PyCHT/LIofZQiO6gBo6a?=
 =?us-ascii?Q?sf2Yd8pLuCxAYSakJxW8y9oHJ6uaY0R3NWBJLKmFonFThbH9CsY2SaKWdKxX?=
 =?us-ascii?Q?2lexwjW4EqdUpCHmu+3qUpDWRsMt5I7dDG3dkpfq8KGdjZRZv7gldkxcr4ZN?=
 =?us-ascii?Q?eEaNJU6h9pwTJdE1FZxjduVqE5tdl9ms3raGl9X7kF+qITySoKGP7BenZBpa?=
 =?us-ascii?Q?Cttn+TgRczdjCrVnycdCgcgvx2GchWv4OsWLnQe+F/JxviCck/uKgbJd892y?=
 =?us-ascii?Q?PWflQmjBCMFZRhMxC84QpY/4TdRG8cB7S/gBm002wZc90uDlGvaeK19olafC?=
 =?us-ascii?Q?NmtKvyTKTIUQku0FHZQ4LeWUTZQ8bOAho/TvfpY3iOvDxLsLebucu/zqNrvm?=
 =?us-ascii?Q?WRpirtOxsoGtN5RMB/JH8ksRgl7Cp+b7B2Auhsf2TBsO1mXtbltf5boklq4t?=
 =?us-ascii?Q?qxbmcnZwk/uuqWRAI3YPJhudchiSnWrlTnBVc9KV++n6zRil6Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230037)(376011)(36860700010)(1800799021)(82310400023);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2024 20:00:11.4378
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 661ffa20-69d5-44a9-1375-08dc922cc243
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F69.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7275

From: Victor Lira <victorm.lira@amd.com>

Rule 8.8: "The static storage class specifier shall be used in all
declarations of objects and functions that have internal linkage"

This patch fixes this by adding the static specifier.
No functional changes.

Reported-by: Stewart Hildebrand stewart.hildebrand@amd.com
Signed-off-by: Victor Lira <victorm.lira@amd.com>
Acked-by: George Dunlap <george.dunlap@cloud.com>
---
Changes from v1:
- adjust indentation and line width.
---
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Dario Faggioli <dfaggioli@suse.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org
---
 xen/common/sched/credit2.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index 685929c290..b4e03e2a63 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -1476,8 +1476,8 @@ static inline void runq_remove(struct csched2_unit *svc)
     list_del_init(&svc->runq_elem);
 }
 
-void burn_credits(struct csched2_runqueue_data *rqd, struct csched2_unit *svc,
-                  s_time_t now);
+static void burn_credits(struct csched2_runqueue_data *rqd,
+                         struct csched2_unit *svc, s_time_t now);
 
 static inline void
 tickle_cpu(unsigned int cpu, struct csched2_runqueue_data *rqd)
@@ -1855,8 +1855,8 @@ static void reset_credit(int cpu, s_time_t now, struct csched2_unit *snext)
     /* No need to resort runqueue, as everyone's order should be the same. */
 }
 
-void burn_credits(struct csched2_runqueue_data *rqd,
-                  struct csched2_unit *svc, s_time_t now)
+static void burn_credits(struct csched2_runqueue_data *rqd,
+                         struct csched2_unit *svc, s_time_t now)
 {
     s_time_t delta;
 
-- 
2.37.6


