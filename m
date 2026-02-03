Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DhDB+Z/gmnAVQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 00:08:22 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3845DF8E7
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 00:08:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1219747.1528648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnPVG-0000Vx-UW; Tue, 03 Feb 2026 23:08:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1219747.1528648; Tue, 03 Feb 2026 23:08:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnPVG-0000Qo-RV; Tue, 03 Feb 2026 23:08:14 +0000
Received: by outflank-mailman (input) for mailman id 1219747;
 Tue, 03 Feb 2026 23:08:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aUNd=AH=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1vnPVF-00088F-8w
 for xen-devel@lists.xenproject.org; Tue, 03 Feb 2026 23:08:13 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34fe7887-0155-11f1-b161-2bf370ae4941;
 Wed, 04 Feb 2026 00:08:11 +0100 (CET)
Received: from CH3P220CA0002.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1e8::13)
 by CH8PR12MB9765.namprd12.prod.outlook.com (2603:10b6:610:264::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 3 Feb
 2026 23:08:04 +0000
Received: from CH1PEPF0000A348.namprd04.prod.outlook.com
 (2603:10b6:610:1e8:cafe::87) by CH3P220CA0002.outlook.office365.com
 (2603:10b6:610:1e8::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Tue,
 3 Feb 2026 23:08:03 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000A348.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 23:08:04 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 3 Feb
 2026 17:08:03 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 3 Feb
 2026 17:08:03 -0600
Received: from SATLEXMB04.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 3 Feb 2026 17:08:02 -0600
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
X-Inumbo-ID: 34fe7887-0155-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zCzu5gv3hrH7mMw8LprQZ6inysWDAuF+c2MyuO9VrHZvlyiwIFV0v2OVTSowMmIEmvqNyr3lizTEyO7nqidsnKPSXmSV7LzlLr1qPBZhF9UlXbR6ZOztBtWsBKMwy+Fo92pADkvLKW8ehrrL3RzPLKhkXUgq8TWhut6lfjR+5zbwzorJgnZt1qBpZGER+ruhvNKAsj6B4Swv43xi/oPK11xsRWB7npZGHkPNwD5TW1dOIS/7anlMtuXXg13tWgrkWQStYp7VyJI2zhoWQEpbhZ6KHkWutbJsYAHKLsqphCtwnW7TEXj8ElnHoAawtNXcD2NGei6iXL8Xd4JiTfuCvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8qQtk1b20aG/kh9W246LWa03j2XOhWS+O5knVRy/lLE=;
 b=Cv5ZyW1JjwnUqOyUHSk9NVIUMsAR3Q0OWPJX9GJsi+DkFWcMm/PfkwZ4TasDdvOqRjJSBHWWE8RX2S1go3hAqVJ5x7PUnR6VOW5yCDeWuNg1Be9Yu5kw7iUcYrIptm/i5oSrmOwqF0cAV2/ZtpiJMS5XvILgxbyVjDzxS2W0U36khMTX17FXY25+IXuZGu6m9E7uiZ2RE2NkqzMcsuSWecIjnjaJi+lCsdnZQuJQQS9/iQ6r4Tf70C96K7IT3uzL2BjIU5JWc1iuQztiMyc8PV49OKflNuT0frOSV1WCzgMFLSuvUJy9Btg5/pTl7RU9RIRw0YoCQkFWCx3QpV6pCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8qQtk1b20aG/kh9W246LWa03j2XOhWS+O5knVRy/lLE=;
 b=sOe4hwCiteYHVPn+NnKg44ApDK9J+xNYiW764f7Md6zXxGADz33xLGGShl9ZScX97WE6IB9/+XlLPH0mqbugtvlmiC7oltUZjjqLpQBqkAtoRpBkvuHJvPhU2BDLVXJ74HR99ITzz9FY0VLy7QhjBpcb9cDacj4Wv1LKpKJ/Uww=
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
Subject: [PATCH v9 4/4] xen: enable dom0less guests to use console_io hypercalls
Date: Tue, 3 Feb 2026 15:07:57 -0800
Message-ID: <20260203230757.3224547-4-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2602031502240.3175371@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2602031502240.3175371@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A348:EE_|CH8PR12MB9765:EE_
X-MS-Office365-Filtering-Correlation-Id: 98e68f0e-7787-4116-8dda-08de637915cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lrcjk2n+688ve0Us9x616T/OtzKyojek7avAHRGqraUbAtt7rmGYw6nWgXS1?=
 =?us-ascii?Q?/IqVXvURzAbMMdwvY51uDKd7MwqRjdjQo+y6cM2PxlcJPRTbp73YyQsQRRce?=
 =?us-ascii?Q?t9IPxw9suSM0dj2KmJWfrfsyvZK8IEtp+ut0dOMU+85aQl5txmtnruiJxRge?=
 =?us-ascii?Q?/c+U41MWk9Y+Z8OUHwm0nnYMVlPgfpeYnxKMhG3pe6/OEEEWSsMJXCR8WKyv?=
 =?us-ascii?Q?lVwnNODoxKNUcQ0vRdy3Ahc+ePyBgYXCUL4JT9rHT5iqb5ZDWHhkVerR2AXc?=
 =?us-ascii?Q?swFOxzDHUZEzvn1SsmWFEufYxLt2tr2iaOgwhzxFz9mByjcJ+5vNZMgOBtEP?=
 =?us-ascii?Q?Cwxz9UTR0c3T3U4IgN0tVRHNUdIyxf1g55xn4RdZ/GgV3drNT7QttQU9WL2/?=
 =?us-ascii?Q?8VhzlgdRNYdmTRiUqSQSgD1/QIaytHjXc2UkCfBNB9qPRpXmRxq6kO3U8+VN?=
 =?us-ascii?Q?KjUVQLEw8L6d+ajnmoEmc9QrE+i/1v+vG/du68O+NAtj9mhVe/CLC0Qx0UNw?=
 =?us-ascii?Q?gLnE5FFYA4MKaNcNSp4whSdT6u1WZmOckn/+9bRnW4PsEL2x6OVpgA+znAuI?=
 =?us-ascii?Q?Wu97LVPUko0ts3qHpPZKhne4WyrjffjaKlLQUSHTiEyC0Raq7I4wZR+DgsI2?=
 =?us-ascii?Q?V0C7DeCQYOgPuQE6kFu2ofVbpc78ABCTV/SwO0efPpNRzd1/60DcOj6Q2LuU?=
 =?us-ascii?Q?qkmH6IwUmAqZ2CX3hP2bLxuoeTG23rOvrT6IvG0D7COV7zJ8NLj5iOgRrGFq?=
 =?us-ascii?Q?xikJK/sjII/6Hfdz6hWyV/Aa0iiWKpp20QQx6s05S6F+lUp4mq6alxAnpwod?=
 =?us-ascii?Q?UWmO/MvjofdGKnTJd4PBA0+3gv8W3cWLL9/0C4afoJkXwdOmVRZRLoFj3Xlo?=
 =?us-ascii?Q?UH75a2cxt9hkMXU2ELJPfa7O+XmiXHHEKG1MAs4oUOOih/n9p0cOggdi912q?=
 =?us-ascii?Q?TIrEx57+RvQPGwiCz+ZNKrYEuewQEfGmPzP4937Id+roFbimn8KCg7PNyY7e?=
 =?us-ascii?Q?oGR0Tmhx1eYfqTqeF12yXqT5NblQrvRCzdL7g9qjA6qKcfVJEj34uJh/D0k0?=
 =?us-ascii?Q?B0xg1cAGgpKcp5M/6eGh17NR0sZx8EhImI7YrS7LcmBfyH2nOwrGsZWEg83Q?=
 =?us-ascii?Q?8mcIkSlKbJtT9Ji71zDzg8sH2KLDc5vUubYA72lIuM8Obn7CHZ/qBlaj1HzQ?=
 =?us-ascii?Q?Ip8mbKMvvF6N5FQXXLN/4jogjpIfp6jlItGUGUvLyFSG+S49MLf9bwHDrm9q?=
 =?us-ascii?Q?Fx//BagnOV8xmyABu/kyyCg3VFeG60mTon3d3lvzVgj6eDY/pyTME2RkuEBQ?=
 =?us-ascii?Q?qyLoRxhebkyUPbcPVX+6Tc7geExDumqO5Mue//mH3NNut5ECmOAjqDk9DnFF?=
 =?us-ascii?Q?mzFYJMj7wBLtE5NbcW17auGqa5r3qcjqvuqqCOzXxuGxKg9M2g00+pPYBZjD?=
 =?us-ascii?Q?BwY7Obk2EJTDfWDQIDlnVkZWoN4aVZGEHuvnQ9ZfbZvjIN/0bUxAmARPIIU5?=
 =?us-ascii?Q?ShQFwDmg98ON3p7KDXbY0YAHxEdEgI6JZpmTTz+p56t3EhOpz/ZBUXBlH2Fs?=
 =?us-ascii?Q?0aMCh5ama+9YoDCOa3DNHhQGjznzLD5/lV/B54OvlUg/aQQw4h3QlMz5UCWa?=
 =?us-ascii?Q?vLEY3R5UZVwisLAP+Wlb8hxDoZbPa6Vk2ocLv5qZrHws+kOGLFqDiqomvtQO?=
 =?us-ascii?Q?v52xvQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IhdGaBbSzBJzeC2aVMaQBPGeWdJsFjVqocNzqGOi8teFEgK0v8X57o/OEri6VutDVtLW6/mpLptZKBiyDOa2lnWD7GKRrDgfh1bOSgkVRMR2SD+HDJHZZ40mldYDNAxjjm4FLXHkFsG5AjhQFOxiSnhf2GesCDnx1lHcUlB2Z2ToZtFlSIXBKl7UiXZUSxrXNrP+n7e9whYxOAYuqaUH3G+sTvnT1Vz53Q/5WavkzRvvm6vacXThSY8HY8CJZIJJro+gfVh9y0tra7J8HwrrcOTRPJREqowQOq8sKf/M3VvQvkZaapPFBXXbvuCXN8FaaXUMiUayxeXjWgoVox1oNMQ8Jt7QOka8SFPmvVeJDNP+FrkgZp9OZJGaaI7pI3g2KYoOY/5aUZo1HaIAU5xNtdtEzFDuAeDSBKtj+ia/r1YoFqLzZAO1KFoSGa0r4BkF
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 23:08:04.0881
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98e68f0e-7787-4116-8dda-08de637915cd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A348.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9765
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
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:grygorii_strashko@epam.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:victorm.lira@amd.com,m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:sstabellini@kernel.org,m:stefano.stabellini@amd.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[stefano.stabellini@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stefano.stabellini@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: C3845DF8E7
X-Rspamd-Action: no action

Enable dom0less guests on ARM to use console_io hypercalls:
- set input_allow = true for dom0less domains
- update the in-code comment in console.c
- prioritize the VUART check to retain the same behavior as today

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
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
index b59ebdeddb..7afe9cfd41 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -610,11 +610,20 @@ static void __serial_rx(char c)
     if ( ACCESS_ONCE(console_rx) == 0 )
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
 
@@ -633,11 +642,6 @@ static void __serial_rx(char c)
          */
         send_guest_domain_virq(d, VIRQ_CONSOLE);
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


