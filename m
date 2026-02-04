Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJJcIUHYg2lbuwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 00:37:37 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 211BBED505
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 00:37:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1221255.1529544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnmR7-0002Qa-2q; Wed, 04 Feb 2026 23:37:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1221255.1529544; Wed, 04 Feb 2026 23:37:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnmR6-0002I3-Rh; Wed, 04 Feb 2026 23:37:28 +0000
Received: by outflank-mailman (input) for mailman id 1221255;
 Wed, 04 Feb 2026 23:37:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gU/K=AI=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1vnmR5-0001wI-94
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 23:37:27 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7389be09-0222-11f1-b161-2bf370ae4941;
 Thu, 05 Feb 2026 00:37:22 +0100 (CET)
Received: from BN9PR03CA0504.namprd03.prod.outlook.com (2603:10b6:408:130::29)
 by DM4PR12MB7766.namprd12.prod.outlook.com (2603:10b6:8:101::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 23:37:16 +0000
Received: from BN1PEPF00004683.namprd03.prod.outlook.com
 (2603:10b6:408:130:cafe::c4) by BN9PR03CA0504.outlook.office365.com
 (2603:10b6:408:130::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Wed,
 4 Feb 2026 23:37:14 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004683.mail.protection.outlook.com (10.167.243.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Wed, 4 Feb 2026 23:37:15 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 4 Feb
 2026 17:37:15 -0600
Received: from SATLEXMB04.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 4 Feb 2026 17:37:14 -0600
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
X-Inumbo-ID: 7389be09-0222-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vjpu7FHY3GbsqJ8C+iiNw+C7Ci+IqUwNbvJhUQGkrjtip+u1LeH3LRvbxOUVfaHtagXmpFAKBDpb/JKvJ6UzPfL8dhfZbKN16lMfVNz05txJWqgnhSFYiJaC8pX/V/N5TLaTPvH9qnhyBpEk3b1MbLZJtmxJrPmjNB47wDW/CpwgcVGpSWgsl5KjTEFY2F8p6osP7bzz7UDgpMSM1AWlYzb1qhvnjt5ygc3cucbhEJD7Lp1RGFB90VZQfxgtUXmRaEXPTz7qR8v5Eo0iz9+JFkawccu/0O/XvQ5KejQbV5osk8iNf5jgSVoXy1mjbUb5INYSO0U55DI65sLEVDJsoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z+m+wfbaQfqsO+srFswTlFpdkOkHztR+/HdKJrjtAEE=;
 b=oZu6urX+QGXoQzrPduGk/GB1YpW0Hub/re+Zpzz/XavS8kYDpkFmnw7JSZyRnKDZMIWRuTaw7GG/+SgH+x4lKviXqNeHrCI6si0JaeKa6kglqBlODWTA/FeOIRNXJuCIc9BVWTOExlLHibeuZUkQq4s5odnCJMn8jUEnqdV/5htKhqn+7IHSxwQ0gCKIfxEkWFXwP2Nj3zHGE/FlWDeDyrxZtS9uOJOhi5FY0kb/FEQhP+f37sHnf3FIDyuj1UawBZxdtf11asdLnQlHYlxrwt9z7THkMGRTYL9jZ8gCMtig3hzgori6KeoS31DRI92rh2vW1C/Wgy2N/O3wkRp5GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z+m+wfbaQfqsO+srFswTlFpdkOkHztR+/HdKJrjtAEE=;
 b=HNFtjdPXYa1EsdXB2qJWCScK8rQYph6QQQlTMZnh05ASZzDrB4HUUTI7xYJeNC1cqH/zcKGszhTUuDuFAGCIrmxe/93r0jRAw1sXBIXqSF80q5IjckWDvSwbR7mpNjVD0UFMt3ApBK0ctJD46dJuUfR51+/wV39ZbGzy2JMjBsM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <grygorii_strashko@epam.com>, <anthony.perard@vates.tech>,
	<michal.orzel@amd.com>, <julien@xen.org>, <roger.pau@citrix.com>,
	<jason.andryuk@amd.com>, <victorm.lira@amd.com>, <andrew.cooper3@citrix.com>,
	<jbeulich@suse.com>, <sstabellini@kernel.org>, Stefano Stabellini
	<stefano.stabellini@amd.com>
Subject: [PATCH v10 1/5] xen/console: use ACCESS_ONCE for console_rx
Date: Wed, 4 Feb 2026 15:37:08 -0800
Message-ID: <20260204233712.3396752-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2602041533440.3175371@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2602041533440.3175371@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004683:EE_|DM4PR12MB7766:EE_
X-MS-Office365-Filtering-Correlation-Id: aa101bac-8a89-4080-6fb6-08de6446542d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?J4tKs+0eqjb0iO28ALtbpTkHjXACNu8eenXMsCjbOr0uAYb87QyHcOEzPsiY?=
 =?us-ascii?Q?U0/yjFZ+KN6qtUI8/6iJfBnn13ncBTMdMJKKN+VGhzBt9VDoJjhCV6piXusf?=
 =?us-ascii?Q?7K+fFupV4kQtbR0pOENuIV279DU6Bwp8o5ySzDz+pK857K4Wl8zqENsc2ZXH?=
 =?us-ascii?Q?p/aKxTGIIAW6h5xm1JGPgS+AaibTkhXK8nY2Oqq3EkQE7+5KK21iVLA9gQfd?=
 =?us-ascii?Q?ZaqPGRvLnFONeIfUIHa7doXBFAsopOiIAftD/inX7KGHWqR5TtcWTv5JCp7i?=
 =?us-ascii?Q?zJBc9QU/uKrE8uhia3laYBzm7+NIqEgy/AADrfX59y/xR42jMCaTsWpdHqIh?=
 =?us-ascii?Q?kpzxSDvQPcEwCBetPfqEP82JqwZlvdBBAG9xpbFrgrhJU31FbuWJLxrN9gVU?=
 =?us-ascii?Q?9P2/Cox7sDzm/TyLXqn1z/d34u2RF2PsgtXmTL/SjUTRWxOsEByp96YhRyE/?=
 =?us-ascii?Q?KhtXE/vQURW1Gi0fl7GRVcew2G1YSect7Dl8WzH3fhm+G1LDam1mfnQhrG+h?=
 =?us-ascii?Q?sM6H2ANGWg/tGYgOLyvQudZeqjMvp3gb8wrmbuPc3vZyA0eqEu1LTbZeoJ0+?=
 =?us-ascii?Q?wrhl6T5rRWrQ3UCpJtqXtIFUppCLL2mJVH0wKsSY4sTyY+eRyyhGWbP1kaZA?=
 =?us-ascii?Q?9QmtbSfwj0NmFUFbFhiIqDFROeY1z0j0rAHyVr1niJZid8eB4AR0+23cGqNi?=
 =?us-ascii?Q?xO+ssf/6auYLYr1eRD0OKWhyvlPqKJammFDzC4A/eJFurAPpwzdvFVYVqxNV?=
 =?us-ascii?Q?H01RCUjEDv2F9vxcGylrOCdY/SNs5093HjdYo/kVQpLUNUoHPRtCUkIPjjT0?=
 =?us-ascii?Q?7cgekssLFRaorju0VjgRNRpsJ7IYsbLsfLGiLpjT45o7HE92NVpnvj53Pt7p?=
 =?us-ascii?Q?E4bQIG0ksFZ7Yoy9z8afummCzJJckYP8X5sNOVm21SSFNHBvJaUiMAyzxnCX?=
 =?us-ascii?Q?gt08w2tev2CbUS9ORNjY/TljiaUXpEHTTDZkRe/Fv6NHhrXoq1D0DTTHMkz9?=
 =?us-ascii?Q?fZi//3R/r43NncW7TBRC2jtn1EMYd9QTYeA7KXqt6tpzkkcEO30eJLw1tmvM?=
 =?us-ascii?Q?2qwI+99kxkvxjHb03mWzZ/Z9x6A4ithd/Dl8jUxgOWKHQTmQA12O5eMkEUsr?=
 =?us-ascii?Q?ihUBeYBi5LrKjpxBojgJDxDW40m9EMNObmf0H7StmISzlsrjxcJMnuXsCfNs?=
 =?us-ascii?Q?ZijWyq02p324fBSXw/zJKAYATa7hbHnjKf9c6g7dtbewjU+z5cgQas3IErVT?=
 =?us-ascii?Q?Xj9BVRXq8ZK+UplcZsxL3XWcozLmLsy1FhiZGk+6uGJXBY0kLh16+MDggVVm?=
 =?us-ascii?Q?6e7KkxCDdxIySDiiz//n2Uludu8+CO87+iVD8R1dw/9lFLXEBalP+VlTujhO?=
 =?us-ascii?Q?twkpbX72tQ696/m7lDZOSkhiQg52GBCJlWUwV4xf24lflY7krWZtndf1jTeu?=
 =?us-ascii?Q?L5cbaT3oc/7qN8yzGsya3uLtK1aYq3cgFheSRsc4YqdsMg+nUwqFfCdgWkeZ?=
 =?us-ascii?Q?+h8rfKOBMfQQQ2PBaQqkZmr9lAcM3n3c+zEi5hDegMqXTnt7DNUbBdsQIBXV?=
 =?us-ascii?Q?pWON+ZG8u4XPLSnxtYFxQByIzLTb3vQ5Xsde4WWHMd9TekdTMnBT8oFzRicu?=
 =?us-ascii?Q?/agBKOGReUldDyp0CTKUN/t3eqEqFR+9EJrq74BjAmv75YdIs7Qn3Gga6xVE?=
 =?us-ascii?Q?JMd5Kg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rsjbAevPMSM3fUKJQMwNMYY793JTZywSi1j/83iHyZ4xq7CCSpxsMSKymI5vLnesJhO017OJNAaU4w5aeuk0Fo3/cr1mlgumZeTtp/o6EgXAgB402Tv8dfYFnfTtV7dR/cWw3A8XtvrK7t6m6uC1ohKSrmYURSPVItdghSb+SJNrxCATbRwimmtXhVF0qX3/gbWlxqyevQCOLq7iJuydjTVWCdpbrOeQfxD1+4FWIg8z/TYEgqL2PjFixNtH2Ab8A1sec/y4HlKrfjvfwRkHDJgf1p5YJQZ2pPygHVS7sHaxSBJBscKdIL+jRNreg4C50MW6Mhier+cSbOTfVJ7wYqnWkjMrmTyc43NuFlavRo4M7tFyLcOxCZdiPBr3IbY/zVpgknbkC2ACjoccAmaf4A82jG3nvS1T4l5S2tOz3X5zt46ALdImoOVA1g+gKRen
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 23:37:15.5506
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa101bac-8a89-4080-6fb6-08de6446542d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004683.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7766
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 211BBED505
X-Rspamd-Action: no action

There can be concurrent reads and writes to the console_rx variable so
it is prudent to use ACCESS_ONCE.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
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


