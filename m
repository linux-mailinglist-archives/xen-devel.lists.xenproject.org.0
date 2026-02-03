Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIV/MuV/gmnAVQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 00:08:21 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B9DDF8E6
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 00:08:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1219745.1528629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnPVF-0008Tm-Ep; Tue, 03 Feb 2026 23:08:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1219745.1528629; Tue, 03 Feb 2026 23:08:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnPVF-0008RT-9f; Tue, 03 Feb 2026 23:08:13 +0000
Received: by outflank-mailman (input) for mailman id 1219745;
 Tue, 03 Feb 2026 23:08:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aUNd=AH=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1vnPVD-00088F-8f
 for xen-devel@lists.xenproject.org; Tue, 03 Feb 2026 23:08:11 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34cf5839-0155-11f1-b161-2bf370ae4941;
 Wed, 04 Feb 2026 00:08:10 +0100 (CET)
Received: from CH0PR03CA0272.namprd03.prod.outlook.com (2603:10b6:610:e6::7)
 by IA1PR12MB6482.namprd12.prod.outlook.com (2603:10b6:208:3a9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.15; Tue, 3 Feb
 2026 23:08:01 +0000
Received: from DS3PEPF000099DD.namprd04.prod.outlook.com
 (2603:10b6:610:e6:cafe::f9) by CH0PR03CA0272.outlook.office365.com
 (2603:10b6:610:e6::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Tue,
 3 Feb 2026 23:07:55 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS3PEPF000099DD.mail.protection.outlook.com (10.167.17.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 23:08:00 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 3 Feb
 2026 17:08:00 -0600
Received: from SATLEXMB04.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 3 Feb 2026 17:07:59 -0600
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
X-Inumbo-ID: 34cf5839-0155-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bX/dXpJu5OZ0eIu51neos4M3tXM7wYXB/QmnVUJPnjlYiVr0u/YFEZml5CgQZQUOjNhzCBgyUlPasxvWbOCOmncVs9GpOujra5B86lt/RMW0IU9GLBWyGi1HnnqPi6h3W30Sll7Q/vOm+cNsDNz6fuvQwnJpawMEhK1RiPAs4rBVVutFR/oXBKFEfQijjM7/la6gJjzgrbgcGSC+xw33oon1Br+Mx0/FssW5O3kaAxsQauL6b4vsNV2/Spq7w1cBW4xyIGYzyFs/qI2yA5XHrlPieaR6+c2jBEM7d6/4SQ/WIsPbsyJq8vHt7Guv1dyFodYFZfu/VRnFe1m6iT8Jhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RGuhRgy80JmJPp5zr7235mr+Lh7xOYWvGliDQSZ3vn8=;
 b=O/FAjKLYEdnS8L6lQVGRmA2XpwdMzlPIUj6bavIn5j3qosRYb8VFEnBehCkF9bHs5AKebqG1XghgeMviMx4TA8f1jOiRtdEDJ3MoG0DKd+nh8jvMl6b5VHozuwDoaiibTv+8oN0LupJo6+T6gbhSDTV51NC+FcADZNS+jmpz3AuefGS13bUWMoq3iBBqALnTxDitpuD2jdCrEa62xUVkfDNO2nv6AvoUJYBiZLzucEpki7RdAW3+Jyw/uxSAhCObX2Is37djHkc7R6lS2bthxKn4pksY4yViZ9GU915iGVC/OSMBzY5J4iBFB80w2JVFOt5K1mwGgUUYqqKYfqPK3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RGuhRgy80JmJPp5zr7235mr+Lh7xOYWvGliDQSZ3vn8=;
 b=d1L0QWG3U2X6xLT9me1lhJG9wSNNJ0Ma4UMvqjNpjY1xnbClzgpYlS8Fp9mPXMm9i1m5SYMZXtta8DCg6mmqulMpIX1IxMiQPFLC66d67393RLTUXEGv5GD0QUwD+4e3u/EOkb8baV03K2wa1jRXqnlWkt7xYln7HyaiXkOFKUU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <grygorii_strashko@epam.com>, <anthony.perard@vates.tech>,
	<michal.orzel@amd.com>, <julien@xen.org>, <roger.pau@citrix.com>,
	<jason.andryuk@amd.com>, <victorm.lira@amd.com>, <andrew.cooper3@citrix.com>,
	<jbeulich@suse.com>, <sstabellini@kernel.org>, Stefano Stabellini
	<stefano.stabellini@amd.com>
Subject: [PATCH v9 1/4] xen/console: use ACCESS_ONCE for console_rx
Date: Tue, 3 Feb 2026 15:07:54 -0800
Message-ID: <20260203230757.3224547-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2602031502240.3175371@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2602031502240.3175371@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DD:EE_|IA1PR12MB6482:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d101a7b-5d22-4436-7c14-08de637913d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tm2dD4oAaFvm9/KqxTTkKTI1F95WJyhfaT4ALueHWgMqyF/rzUXTrEYBJRR9?=
 =?us-ascii?Q?ylMBNgoMp9JAlSX+X4WEuSG8eV4s+Q1YuZqoscZmEG8txPePGkr2kP6DqEW4?=
 =?us-ascii?Q?+ISx5g4hJZjS50ZpZDJ2pkHGom1oOyTxrqd0ucIzwYAD6l0zD45U921KzB7m?=
 =?us-ascii?Q?m3jB37xXXFJLuN8hWFJnifjcAAk8ICHPx0qTa7sbIO7k9v+EAER8Dc+KLqCY?=
 =?us-ascii?Q?VIjpmdkOdIF/zb6vOk98jiFtSRWfpr6lsQjKPAOvBRdW8Jy/PdcOQu88B27U?=
 =?us-ascii?Q?NmUT32OlSgza3Xof2ulMs6b8Smna2KoxcN994OLKedvbVqYf4BNkOPBIYn0Y?=
 =?us-ascii?Q?yVpFrwiGeBG1MeSLc4GChhabN8x/7pSoNXgFpYvUzdtyPIIN8M6saO5lvDGP?=
 =?us-ascii?Q?PxfP0/WiBhyWg04EJAKDqziKvGwHvxyREyjicDFvDVhmBbUKOSWWWu5pyQfz?=
 =?us-ascii?Q?r1mjaHX28oOqGPxG7ysxkM5o4ob2roAvJqgGpYnx3FzAHwxPkxVo1jw72coj?=
 =?us-ascii?Q?45UBNMeeLMQ/cedJ3o4N580CcKi6EKvDYPwjqEEHeb5u21X/M+Dr5xMtDK1v?=
 =?us-ascii?Q?VNTyG9gUDktDTdk8vnVGVScjtokKPNMblVoUmidpgi6w+Clfp1Uja5yq58Ej?=
 =?us-ascii?Q?xSvBMO1yjq/eF2ojWxLWmxUc4QmYoQpAjrzxDLOhIRBq+pbWcUuEAl/oWuHI?=
 =?us-ascii?Q?JfpvdYs3lBCnVxjFKBLvTIDj9kcU7X1LYSU5NK15dZFjr7EYcfc6I9I7Q+Z8?=
 =?us-ascii?Q?vvcT3Ux350GLj2xgkM/oYtzud3dHfrc5tcgi9PjA1XsCxD0XzuuasbhONJGH?=
 =?us-ascii?Q?sBQBBbp0wK7quVBwfQtZEBl7VYnObedFSXnDsZW9/0XsDn5qrNWaL8kVCJgo?=
 =?us-ascii?Q?goS4cwJuVMNYYzDffIzyQlNALk6AYh3rzULD3bOoJ7dTyoBP2u2LjvkD3rK2?=
 =?us-ascii?Q?7vJvhZPJzFG4uBZ6vjMROTe1rwvM1av6nHuAIzHglBxMZ2kWoEUG+HoIh9vJ?=
 =?us-ascii?Q?E/uUggLiNuKCv7WJWDUQnjc63wDQ4pDer5atwRVOE749SqfXWExphd9m5XbA?=
 =?us-ascii?Q?6QGOZdiKox6qjRWPReQ0TepgELpZIDhSO9GmtdG2m2URok0VbTjXDYRjrqUW?=
 =?us-ascii?Q?CQ3gROZZqSAqnbmAnYa38YvY9fWgaQlKuurK/xT+PErq5Tyv+ea5ClzWHCMl?=
 =?us-ascii?Q?VJf5de7ipGUnPcWJNZnS4iixyF/Kv1vXzV0kBjvjExQa1YDIbn8y9WA35ySI?=
 =?us-ascii?Q?0IZ68DC+KNTJ+NwjR/1OM6n0Jewc/TnkMBFJ1Ec9EHawndBgY3nHtCfYQXJv?=
 =?us-ascii?Q?y5PV3PVvzHtEhv49ZVdHhBKck6kRD6/WuvEbA2+KidASE7sE3dzjmuTV8Kzl?=
 =?us-ascii?Q?OS2n1wJMRl2OeQhCv5d5caQcl3YCxS8h17s6BVA2xMdjogrSSi9LHD1tRmRH?=
 =?us-ascii?Q?BXEqbIos4XeN7jnaW2+gdHIHWHeK34TX4BwWWxWQ65mZ9e1GlbV8LE+GJ9ls?=
 =?us-ascii?Q?HCtOOyE9moXAqItH8wVgYjy2+WE4/GJKexLEswbmrtRz/+uXtbGCHUyYUX2W?=
 =?us-ascii?Q?KTMbjXRAy5rB+TVRm1mdGTw4bSVMyHOY4v7AMqzKiN9lzuAVW4PXlQBmYNWU?=
 =?us-ascii?Q?f3gydDCbBfyJH2ZPJ63XFNPdyADYAPFP60l2eVlhgm6cEMO9uc3JeJNJpkSg?=
 =?us-ascii?Q?VNDDKg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aqN/Xc2/LbKDGL4XFN9Jg2SCy4gkMDJ51y6dNucdJdjjHele8yh8LA0Lc5GA1zk/PwVVew/FStN+6s/cYjrxEbnm//hxHArHMGmw7F1YrxIJQTj5MuYe2obmkNHuqMQsjYhdQRijJY+g+D9VR7vHg1B2fuW65x2jpMIqrgcY3NWGsLLY0bmcV6hR83IPPmBZXMDhLHBkxmQ2b+kh+foBDSuqV7qOH7dQqn13sdBGUOEnj+GNSwmBtakrj9TULOMZNKq9GiJmljC5tVmwPbjbrEe7cM5LRBXEvoE13U1zS+RqLdgUp4EUCHoTho99BxF68tuTTgfIefKR9dF4cJaID692sHwaeYjS97rKtSH2f8TRX/g/3DPvFZ+lSHYs/Adn5WbAbHqYLCqazxamsBtUS543BW3PTgYafpWMoDwYh0wR6k/BvQ8S81SaMN9iVR9i
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 23:08:00.7772
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d101a7b-5d22-4436-7c14-08de637913d7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6482
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:grygorii_strashko@epam.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:victorm.lira@amd.com,m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:sstabellini@kernel.org,m:stefano.stabellini@amd.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[stefano.stabellini@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stefano.stabellini@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 75B9DDF8E6
X-Rspamd-Action: no action

There can be concurrent reads and writes to the console_rx variable so
it is prudent to use ACCESS_ONCE.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 xen/drivers/char/console.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 2bdb4d5fb4..35f541ca8e 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -518,11 +518,12 @@ static unsigned int __read_mostly console_rx = 0;
 struct domain *console_get_domain(void)
 {
     struct domain *d;
+    unsigned int rx = ACCESS_ONCE(console_rx);
 
-    if ( console_rx == 0 )
-            return NULL;
+    if ( rx == 0 )
+        return NULL;
 
-    d = rcu_lock_domain_by_id(console_rx - 1);
+    d = rcu_lock_domain_by_id(rx - 1);
     if ( !d )
         return NULL;
 
@@ -542,7 +543,7 @@ void console_put_domain(struct domain *d)
 
 static void console_switch_input(void)
 {
-    unsigned int next_rx = console_rx;
+    unsigned int next_rx = ACCESS_ONCE(console_rx);
 
     /*
      * Rotate among Xen, dom0 and boot-time created domUs while skipping
@@ -555,7 +556,7 @@ static void console_switch_input(void)
 
         if ( next_rx++ >= max_console_rx )
         {
-            console_rx = 0;
+            ACCESS_ONCE(console_rx) = 0;
             printk("*** Serial input to Xen");
             break;
         }
@@ -575,7 +576,7 @@ static void console_switch_input(void)
 
             rcu_unlock_domain(d);
 
-            console_rx = next_rx;
+            ACCESS_ONCE(console_rx) = next_rx;
             printk("*** Serial input to DOM%u", domid);
             break;
         }
@@ -592,7 +593,7 @@ static void __serial_rx(char c)
     struct domain *d;
     int rc = 0;
 
-    if ( console_rx == 0 )
+    if ( ACCESS_ONCE(console_rx) == 0 )
         return handle_keypress(c, false);
 
     d = console_get_domain();
@@ -1193,7 +1194,7 @@ void __init console_endboot(void)
      * a useful 'how to switch' message.
      */
     if ( opt_conswitch[1] == 'x' )
-        console_rx = max_console_rx;
+        ACCESS_ONCE(console_rx) = max_console_rx;
 
     register_keyhandler('w', conring_dump_keyhandler,
                         "synchronously dump console ring buffer (dmesg)", 0);
-- 
2.25.1


