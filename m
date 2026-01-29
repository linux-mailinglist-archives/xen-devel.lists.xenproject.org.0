Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wD6oEpTae2nNIwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 23:09:24 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B8CB52FD
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 23:09:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1217047.1526880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlaCP-0000Uz-NB; Thu, 29 Jan 2026 22:09:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1217047.1526880; Thu, 29 Jan 2026 22:09:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlaCP-0000SS-K9; Thu, 29 Jan 2026 22:09:13 +0000
Received: by outflank-mailman (input) for mailman id 1217047;
 Thu, 29 Jan 2026 22:09:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dzzj=AC=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1vlaCO-0000SM-VO
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 22:09:13 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 236bd160-fd5f-11f0-9ccf-f158ae23cfc8;
 Thu, 29 Jan 2026 23:09:10 +0100 (CET)
Received: from BYAPR08CA0057.namprd08.prod.outlook.com (2603:10b6:a03:117::34)
 by IA0PR12MB8837.namprd12.prod.outlook.com (2603:10b6:208:491::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 22:09:04 +0000
Received: from SJ5PEPF000001CB.namprd05.prod.outlook.com
 (2603:10b6:a03:117:cafe::37) by BYAPR08CA0057.outlook.office365.com
 (2603:10b6:a03:117::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.8 via Frontend Transport; Thu,
 29 Jan 2026 22:09:04 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001CB.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 29 Jan 2026 22:09:03 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 29 Jan
 2026 16:09:02 -0600
Received: from SATLEXMB03.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 29 Jan 2026 16:09:01 -0600
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
X-Inumbo-ID: 236bd160-fd5f-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JD2c9eo7wUG/bFMa9k7TZ3gN+nNe5BXSLgKnswbbXaLXRRMALfCIvuSEx3cqsc7y8T4IQaCtx56ZIOSBiynA8Rui0J5d8z3yftm8MqwZIC57b9QSYaVA0R1V74IchqK2Cb5Y3SdJ81Mof4Wrw5RzGJcC969yeP0pKf7MXUABFW01O70A57Whmbp9jFAAh3J5ySTulxSG4nIPvzm+OEIn3T8uOCaDf8sB3VPR1r9VCgw+mYHwwsB/DzOfxdXwRg9reCFHx4VKDz7raotL2Rr9erOSoJV3w/A3ufGbqEK2IuR+qN/lYfz6xnIp2dfBXSX69AjI+aVkGS1faNHusAUW0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yhb/Ct6/30TNWJ4dGiIhm+GmR7yGbSpklZW15TSwm7s=;
 b=iaCv0X5WuagjICWfF0z3kGoymyg8lyTzGmaAArbguzQmf3S4+1kjH/LVGQUD49FFcQuW1d3mOzazzyMiySVNFF5PbRYCpJEUYd6FQT818h1LgPoTaooUH9E05nVYVRUHzTYiFpNaxYbXlpnkJwmpggb4gtyZElWwdw1f8zedvfwWIP8N6mf0VVEw0OjKVtdNWSQ7rhY4TSV6jBjNwJmCgyBSmcdN1ZD+F8E7n2ojb5CTqAgUTPa01K2Rn816KVz7VnVFZpKQi9jYlvaMc5hYAHHefQnPBiLn9xuaYHT2Gozz7JmmESFwrJBtRwHKJmJjsDOsUfD+0jwadkXlJHX0OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yhb/Ct6/30TNWJ4dGiIhm+GmR7yGbSpklZW15TSwm7s=;
 b=2VJ2sCvlwKOtYFF+8ikXMsgQY2dJ+8/ae/F3b6l+e1hQloymvMegReRorV7ZryT8nypmR0cV+g+LsnNua/yNs9TmskJT4pNeebnb1BDTMpow2lEbxpM6Iy8fe2l+wxunsogZYaB2WG5YGTp4d3JrrEBEBPdGuYOjXQYoAsaC86c=
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
Subject: [PATCH v8 2/2] xen: enable dom0less guests to use console_io hypercalls
Date: Thu, 29 Jan 2026 14:08:58 -0800
Message-ID: <20260129220858.2371938-2-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2601291404410.2238666@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2601291404410.2238666@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CB:EE_|IA0PR12MB8837:EE_
X-MS-Office365-Filtering-Correlation-Id: 77d9e8b7-bc38-41e2-0b1e-08de5f83039e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8GuEIkv/50CcJRiNR+c9nq4ubbVQGYk+zllYU228ZKO+UIff1VVr6ypd47bt?=
 =?us-ascii?Q?lWBx0vBXXttWtFnZYcK+4EhjEEz1RvVDoYz2LI3869CiMlCdIlCGK+xUJ4Qr?=
 =?us-ascii?Q?D1sIJgNfnSuiFhZkm5GKou2rpstqwbOH9YSXeHg8fF11m0sY5yhRqbPZ80d2?=
 =?us-ascii?Q?EGdNKEoGcRL+kARnZPTb1TB3z5lPM/6ko+n7lSBMruZxtK+O4G6EhXtvfvem?=
 =?us-ascii?Q?8mKm1DfMIhjoXEqa9EKo126gniOV+9Adluu/CxjpOfGre/JZ9uxKJDoUuBdj?=
 =?us-ascii?Q?EbzWLNbj6cvsQOz9V3SpIwdjkbMkv5y6gI+8hegytTTAcLwwneVQGglMTZpo?=
 =?us-ascii?Q?iPBTk/5Zq7RwIefQGqj7MgE/95TjcIMJfJmQcG/fOK6FkwatJgo54cxu0NcZ?=
 =?us-ascii?Q?qai8EsQCKtb7+n6EnktQNo/W/HGf+XsHpoMA69k5gZwyVJ3MHwR7iUBKwHW2?=
 =?us-ascii?Q?BAU8kHBZH5BgrK9kdnpFb4gVOR+9ZgHyeR5M/83HKtl0WRCU17F7AY3FudkV?=
 =?us-ascii?Q?QXpWI3jutByJAOAE7zzszw0XOKxwnokhCsWhkN1oW9rMDGcA9IAJ+R1TX8pL?=
 =?us-ascii?Q?wTcVkHugtU6mspD3DmXVVdW8cH0H+rfqsXcVEgx7eEaY7qtlydQ3HCqYsU0A?=
 =?us-ascii?Q?dvQkTBvaKdEN/EJDTl2E0I4vYYjpM73C5g32wPnkNz1rHtqGqr5WPkeSn2JZ?=
 =?us-ascii?Q?h36H1HLDtgLbzij8QHsd287L13ST0q0jNksQtEngjb2q3uPQnGZ0mhfLiiYE?=
 =?us-ascii?Q?jyt3T3PoD5S9BQF9Ve2Zp+ayMtB2PDxBCH/9++MsNhibDBGn0Z2+JrT1vrFF?=
 =?us-ascii?Q?tpA4mbFMbPGQIAvg4mUbStXM0WD9wg7OYWpnPKH5Gjl5qjw+ePo9ygGu+Xun?=
 =?us-ascii?Q?R+wnwF/h3FUGFJsRuWlHRFgcA2myDXVc3QWN9Ihxo0zG7JxuBBSFyBPzUyNX?=
 =?us-ascii?Q?Rhi3Axql374xUHg7asf+av6O6I1tUhkDZ3UuSvQ/Kd/JrvNsC4ufwfO3XTWG?=
 =?us-ascii?Q?4AOwc0asevX1GHsx7ch64If0ctbInDthPTqLhpdjAFtfhMF9pQkhUYfJkafK?=
 =?us-ascii?Q?fiy/VsscrY552gZjTTYCUG5c25akLezS0MJZik43T8N2CdRhf9kyB9CBQzGm?=
 =?us-ascii?Q?vBMGSfqcrWfOMg3JxujPSrlCzaez60nUTAxZsiNh3B2/GglTGzBAgPOLvWZP?=
 =?us-ascii?Q?znOGV8lqZv0s8FEcfm3YH4z9LPaIsN8jXT6xnz9mFMql9i/4zQyfogkMLcVT?=
 =?us-ascii?Q?VBKJy1cQGeWVFtO16UIoWRv02UW3LR1RjoArDNz0RUsvLTCNff5nCdlkYAx9?=
 =?us-ascii?Q?FNHJjedumcXMOq+Kfr+WcUzLMZEHQGeYPyu6MIqmRU1eeyvFLo2wmWaKFOK7?=
 =?us-ascii?Q?dzsflDwEnQfOn+GHzL33FLaUuEX59G0YQltn3MpRJSJDKP3mfpLc6LzsWNcG?=
 =?us-ascii?Q?+ZMBqeNhUg/Qu7xmCoa6arsJ9s+YnAKJnDStm0KPnRfloh6uFRKvizoe+wwV?=
 =?us-ascii?Q?0E1wQsyrAdspMo7oE80OcgjzY+Qjvy5Qe4EESwv7+KpLJwzp3w2uPa8TVPJn?=
 =?us-ascii?Q?IK6/FYXbPMPVWYLB9WGQWEaW7Z1PXJcQmfVxmauoO5q4NWHym1OEPycB6nXN?=
 =?us-ascii?Q?M84fl6vKJcYy0qGZJ5nb42WNT8WIiMXrfF5vziRZd+4TrCeTfa0ciIrF+Z+c?=
 =?us-ascii?Q?tHSE/A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aCzSXLPfi2rCkiH+8Gk0o1CTwZusyrtjd07IVA88AlLfIl18pNP6EVn3OQNC7RLwEvLy+NO8SwBlBj5AxjiCPNCxOiQZNrWDUCb7fvX7W1xpJLlKizKu3HT4xk4PlVkayek97DDzQ8U4BJmM9b4boeYbYnOSNcRBOKXsFXYzo9SMKqQPvI5p2Ig/r87YaqKzCk72VIEeoQ8DQXEx3pdwA+tZPqGsJlbW5YOxurAIRsJwQuFQcY0+2OPM110S6Kr8X2GK+e2stXey6gK/s3yt3X7rX5ylOttfWcWue1lYqb20cnVzZbKnyBA/JpHv4vA/alnexmWfEnmrVsUkCwIyyT1cfMcBFC10YKHB6k32VDRHKZpOeHydrabMRkBhqmj5V36t6e1jlyA/UPhki7vSxF6SluvhHCZGd9ckYmBggN+jq8quH8ikhs7xfFk2NMFH
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 22:09:03.7758
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77d9e8b7-bc38-41e2-0b1e-08de5f83039e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8837
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: A3B8CB52FD
X-Rspamd-Action: no action

Enable dom0less guests on ARM to use console_io hypercalls:
- set input_allow = true for dom0less domains
- update the in-code comment in console.c
- prioritize the VUART check to retain the same behavior as today

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v8:
- move in-code comment update to previous patch
- add in-code comment about is_focus_domain() check
---
 xen/common/device-tree/dom0less-build.c |  2 ++
 xen/drivers/char/console.c              | 16 ++++++++++------
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index 840d14419d..cb7026fa7e 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -829,6 +829,8 @@ static int __init construct_domU(struct kernel_info *kinfo,
 
     rangeset_destroy(kinfo->xen_reg_assigned);
 
+    d->console->input_allowed = true;
+
     return rc;
 }
 
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index ed8f1ad8f2..418d194cef 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -613,11 +613,20 @@ static void __serial_rx(char c)
     if ( console_rx == 0 )
         return handle_keypress(c, false);
 
+    /* Includes an is_focus_domain() check. */
     d = console_get_domain();
     if ( !d )
         return;
 
-    if ( is_hardware_domain(d) )
+#ifdef CONFIG_SBSA_VUART_CONSOLE
+    /* Prioritize vpl011 if enabled for this domain */
+    if ( d->arch.vpl011.base_addr )
+    {
+        /* Deliver input to the emulated UART. */
+        rc = vpl011_rx_char_xen(d, c);
+    }
+    else
+#endif
     {
         unsigned long flags;
 
@@ -636,11 +645,6 @@ static void __serial_rx(char c)
          */
         send_global_virq(VIRQ_CONSOLE);
     }
-#ifdef CONFIG_SBSA_VUART_CONSOLE
-    else
-        /* Deliver input to the emulated UART. */
-        rc = vpl011_rx_char_xen(d, c);
-#endif
 
     if ( consoled_is_enabled() )
         /* Deliver input to the PV shim console. */
-- 
2.25.1


