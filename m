Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CmkC+O5iWlmBQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 11:41:39 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C68310E382
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 11:41:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225204.1531691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpOhp-0007e1-Lr; Mon, 09 Feb 2026 10:41:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225204.1531691; Mon, 09 Feb 2026 10:41:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpOhp-0007ch-JF; Mon, 09 Feb 2026 10:41:25 +0000
Received: by outflank-mailman (input) for mailman id 1225204;
 Mon, 09 Feb 2026 10:41:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EeIc=AN=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vpOhn-0007cb-Vt
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 10:41:23 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id def62875-05a3-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 11:41:21 +0100 (CET)
Received: from CH0P221CA0044.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::27)
 by IA1PR12MB6233.namprd12.prod.outlook.com (2603:10b6:208:3e7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 10:41:16 +0000
Received: from CH3PEPF00000009.namprd04.prod.outlook.com
 (2603:10b6:610:11d:cafe::3c) by CH0P221CA0044.outlook.office365.com
 (2603:10b6:610:11d::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Mon,
 9 Feb 2026 10:41:21 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF00000009.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 9 Feb 2026 10:41:16 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 9 Feb
 2026 04:41:14 -0600
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
X-Inumbo-ID: def62875-05a3-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CQ7Wa9xhTh+UC1AwJNTwdZKU99vOp/+KTNnV/ovOrwpTnA4bq5TuniWi/s4yGK+AsS0bD2ZqJx3iK/uS1BCiqOo97dw1iHZVewON6CyhBQKWQ8X7amNYJhibdrxALGYjxWrg5QXT855uZkihW0wK5vLCuuc0OtOlPUnW0+tdk1UPxqxy5vLvAWo2xbui/JVBhGBtt54m88G4DYnU8MMUf+aZbIake1sMfF0TGkDSUYm/hVnCYdIqPy2DquqG+qIESUPsj1Aq2rZxNpucAC4USCn7HZiYlAyqnSuVj7opAgFNxdYk2Atyt91riitGQ9XmrVE1yyzNQS7W6W5mBwe3Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eAJGuOmwxNu4QZ9hKqgRV0cRJ+U0QxWyMRiYMd+1e5Q=;
 b=JrbAzhpRzSSeP+jSl2NgcjyMuKdG87wUMmZ1/WpDI7qBVpNC0SboaxykHrabgbgWf+fROAw1m1mWg3ZuNuShyga+uaVe8XGT4FrwSkbGQ0awcMxnf3W69Kjj9sUpylca3uqYR8IvUdvXMlh/RzpTiUZG+akxrAhLxkbfbw2WJzdanbE+LVC/7+nki79rfv0Ox9XU0icX+kAU1ehlT3inESmjximPL7yzjwdLfrINGljtk06N/sfRDx0KihVDM/9Dt0fW+bP/IHm9aE4dkWm7t6hmGRrbMJq7q+9bKF9UwpQa0HGNNds9PdSHI3l2Lm9cr4texx50IYZ6gSFDCiAKYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eAJGuOmwxNu4QZ9hKqgRV0cRJ+U0QxWyMRiYMd+1e5Q=;
 b=dSrOpzp16LhdwYriHD07klifCTIAmzm6C3d01Umr8lVBL3ZVlH+kpZoIWe5lk37QIvLqF+21g5mS8iwInGVN8GXAj1qRuk3LduOlmss7D7wRggBRHFkM3XQ6cMqyGb4RuaIaW1vd1Phh2Ud1NBqYEIsvFAujQENoE16ZJmu9mlE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Tim Deegan
	<tim@xen.org>
Subject: [PATCH] x86/shadow: Delete the none.c dummy file
Date: Mon, 9 Feb 2026 11:41:02 +0100
Message-ID: <20260209104104.7840-1-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000009:EE_|IA1PR12MB6233:EE_
X-MS-Office365-Filtering-Correlation-Id: a99352f0-d0df-4c7c-7df7-08de67c7c0bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?o4Yg7UowA3oF6PlL+k4gCUr0swws5r8jlDVB6cHJcku1fisJu4x5D+swil9h?=
 =?us-ascii?Q?CCK4LuSQOc+3/nJBciobVOYxAn9AdqVMLW8i7Bzbh9KoC5sPn6SHlzRMvMiH?=
 =?us-ascii?Q?8kfkgQFaSppXaVdFJsTqAOM0+0J3G+unC1gORkGbSytjJKVqRWBH5vy3nSel?=
 =?us-ascii?Q?TyF6tUoRcOJpvD/X0nIqcIu7PN0o7ua0hgMyH668VOpzDLLRVhgoiFWbgFPS?=
 =?us-ascii?Q?Y1uH1MWmXh5of25P9wwcrO2g7JkGGBoc4F0J8auuJmBqcUfyakWdjX1WVfF2?=
 =?us-ascii?Q?55xsFOtUQeLC7faCe/cc53mEs+yaxfXIjlgPy3jEVwB5nVhY5QYRdCljjBdc?=
 =?us-ascii?Q?fZs4rjihss3rqLwfnYq5tI0OTphDCXoGtnBXAMU7fxEfGIJm/rSrvspzjAtb?=
 =?us-ascii?Q?PXMpVfbmN2Y4BsURIUFaKM+N03iteKw3zdLnj30/1csfJ0utpg7DnIgbmTnh?=
 =?us-ascii?Q?UGAsGbZ/z8eq0tCeMF9kYAbr/lLsdnCTDdrm9sd0jo/+Ef9aUOA/zoklJLJI?=
 =?us-ascii?Q?0JYiINVP/3faiBU+OeSmpe3KhcDbEoiIN2EacrK3GMIzo4FdFEB5C0+D19g6?=
 =?us-ascii?Q?Gt5/SEvIgDQrRNsNqdube211XmONmAcdZM4AhmNizb2QKmZFmKJVJNQIcsns?=
 =?us-ascii?Q?xc/KS4PGhg7U415mV7UU81oojYRoveJCvUUfRTq0o25PYZ6ljPqHZ2H5NRUL?=
 =?us-ascii?Q?ka4lIOc4lA2kubwn4cWOi/iR5C720tK6bciToJKhUA7qu100XHjCGAz9vG5k?=
 =?us-ascii?Q?vm93LZUBM+mnI8A4L8uFPQ9QEtdXKmsgLiGYKistrapvYPXiKs4t3bH1JRPi?=
 =?us-ascii?Q?tP3aE9378KDPh2ezbpXZx+yZVEa9SfXxh7w8vorrSeu0CQL8grBCBelgkNvN?=
 =?us-ascii?Q?OmByT3+EN2ismY/HTxPLXpFFbuvM6AARoLGkStbXhbOkS5lkEI1HGSy5hhtY?=
 =?us-ascii?Q?PqeGsK+Thi9M4G68VgwckllfGY/oUbfk0GZb3nsiA+7gORhEYUJwbmL1zOyA?=
 =?us-ascii?Q?62QfoKEfdCi5GeCAsiOOeVguKkUpS/wYvThaPruQrJVYo3LMMpeEWKXKipvi?=
 =?us-ascii?Q?P4Qo41mrSr2in7tnJsaIkDxrjfeYsUdQbuBeRc8pFZU+mG/FZ1nE0mCwqU8g?=
 =?us-ascii?Q?APOTgliEX2RH98IN3lTODqZ+NUl2UIFtpdLWJgbE+rVYDghvlRZFTiQEK6qp?=
 =?us-ascii?Q?9OxwzT1ALJvjcIjxqttXkobOBR3XVKFFpAwlk6E9NJsnjGmoCLqfrO0aQUS4?=
 =?us-ascii?Q?GaTIeMGfeNxEcVG4tT7H0U8cETMPEIVdLMWQJcsLke/+Z6vbxoJhnpm9wO1o?=
 =?us-ascii?Q?Cm0DU13ZYros+nFrF+k0xS2ResuEW9kDZFZAza+y9PEeR2GPz1JBmIq0egXK?=
 =?us-ascii?Q?3BN6VXX26hRkR7AzAdsQPbt/UmOxeC9JTrSWyleA3IvjyVg5DuYegPFB05Ra?=
 =?us-ascii?Q?jHGGkDJmbPa6uIcUeTeK4n97P/kUWxJZtBmaqJHMOWS4gB6XaJlLTLJ7qkqV?=
 =?us-ascii?Q?t1JAjK/1OU3NHUZ6xgg88s51i5rk5+isdUFux94XJEUzKJXCIUuhvJDnAHxm?=
 =?us-ascii?Q?dpVdSffzAkhT1y3C4e/deEuKJ29HK2VlAvB6NKY/I5LRrSvKZ0nxrJ3ED/hA?=
 =?us-ascii?Q?hE6bUgwByWemPROAba/Co/Vte58cpTjqfbyi1x/fY1j9q85Urt7YhlaTZ438?=
 =?us-ascii?Q?AG9e7ksnzRwg2ZnTWgKq5RpRLSA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	SWgR+G9zLGhDIZWCvXGsfTrZWWVdjtkRdVk4YXuvpZ8V++zApI5ap30ZETCBBXk26ssGWVZOFiHwGzmplTcUANR1shSG6ho2svlphL/Xv7kaMguL3BaRsuY2/JGV3jssYArRxqWr02CeeKdwO43hrNrn3m/ZJ4gKdrQTD/ZTLHROgYtkXI7T2CWW+X3ej92uZbnkcD5NMhrOqKsTZ+L8aJxPyfUnZ0+wi+KWyyzpyI0kXcuXKDl/cIr/w6uvQUhBPRgY/ZFRRt7Mn1oPaVvJW6ASA5P5EbzRxbUL3XfFmXNhvp15rLxSEl0vQW9qG/8bdr/VH806KVZFPOhdqtFIXh+UB1r19+QbcMIuV56SFkDhjj7bfh2fFYw1Nz6R5RAaN/m9nXLRJPhZ4JGhDdBfAvNIoLUnjTcXPhLjgJPoMaraBn3+MlNl+zTryuBNt72N
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 10:41:16.2444
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a99352f0-d0df-4c7c-7df7-08de67c7c0bd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000009.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6233
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:alejandro.garciavallejo@amd.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:tim@xen.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.988];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 8C68310E382
X-Rspamd-Action: no action

It only has 2 callers, both of which can be conditionally removed.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
I'd be ok conditionalising the else branch on...

    IS_ENABLED(CONFIG_SHADOW_PAGING )|| IS_ENABLED(CONFIG_LOG_DIRTY)

logdirty patch: https://lore.kernel.org/xen-devel/20260209103118.5885-1-alejandro.garciavallejo@amd.com

... to avoid the danger of stale pointers, with required changes elsewhere so
none.c is only compiled out in that case.

I'm not sure how much it matters seeing how they are all unreachable.
---
 xen/arch/x86/mm/Makefile        |  2 +-
 xen/arch/x86/mm/paging.c        |  4 +-
 xen/arch/x86/mm/shadow/Makefile |  4 --
 xen/arch/x86/mm/shadow/none.c   | 77 ---------------------------------
 4 files changed, 3 insertions(+), 84 deletions(-)
 delete mode 100644 xen/arch/x86/mm/shadow/none.c

diff --git a/xen/arch/x86/mm/Makefile b/xen/arch/x86/mm/Makefile
index 960f6e8409..066c4caff3 100644
--- a/xen/arch/x86/mm/Makefile
+++ b/xen/arch/x86/mm/Makefile
@@ -1,4 +1,4 @@
-obj-y += shadow/
+obj-$(CONFIG_SHADOW_PAGING) += shadow/
 obj-$(CONFIG_HVM) += hap/
 
 obj-$(CONFIG_ALTP2M) += altp2m.o
diff --git a/xen/arch/x86/mm/paging.c b/xen/arch/x86/mm/paging.c
index 2396f81ad5..5f70254cec 100644
--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -634,7 +634,7 @@ int paging_domain_init(struct domain *d)
      */
     if ( hap_enabled(d) )
         hap_domain_init(d);
-    else
+    else if ( IS_ENABLED(CONFIG_SHADOW_PAGING) )
         rc = shadow_domain_init(d);
 
     return rc;
@@ -645,7 +645,7 @@ void paging_vcpu_init(struct vcpu *v)
 {
     if ( hap_enabled(v->domain) )
         hap_vcpu_init(v);
-    else
+    else if ( IS_ENABLED(CONFIG_SHADOW_PAGING) )
         shadow_vcpu_init(v);
 }
 
diff --git a/xen/arch/x86/mm/shadow/Makefile b/xen/arch/x86/mm/shadow/Makefile
index 3012fa127d..119989ca4d 100644
--- a/xen/arch/x86/mm/shadow/Makefile
+++ b/xen/arch/x86/mm/shadow/Makefile
@@ -1,7 +1,3 @@
-ifeq ($(CONFIG_SHADOW_PAGING),y)
 obj-y += common.o set.o
 obj-$(CONFIG_HVM) += hvm.o guest_2.o guest_3.o guest_4.o oos.o
 obj-$(CONFIG_PV) += pv.o guest_4.o
-else
-obj-y += none.o
-endif
diff --git a/xen/arch/x86/mm/shadow/none.c b/xen/arch/x86/mm/shadow/none.c
deleted file mode 100644
index 2a4005a795..0000000000
--- a/xen/arch/x86/mm/shadow/none.c
+++ /dev/null
@@ -1,77 +0,0 @@
-#include <xen/mm.h>
-#include <asm/shadow.h>
-
-static int cf_check _toggle_log_dirty(struct domain *d)
-{
-    ASSERT(is_pv_domain(d));
-    return -EOPNOTSUPP;
-}
-
-static void cf_check _clean_dirty_bitmap(struct domain *d)
-{
-    ASSERT(is_pv_domain(d));
-}
-
-static void cf_check _update_paging_modes(struct vcpu *v)
-{
-    ASSERT_UNREACHABLE();
-}
-
-int shadow_domain_init(struct domain *d)
-{
-    /* For HVM set up pointers for safety, then fail. */
-    static const struct log_dirty_ops sh_none_ops = {
-        .enable  = _toggle_log_dirty,
-        .disable = _toggle_log_dirty,
-        .clean   = _clean_dirty_bitmap,
-    };
-
-    paging_log_dirty_init(d, &sh_none_ops);
-
-    d->arch.paging.update_paging_modes = _update_paging_modes;
-
-    return is_hvm_domain(d) ? -EOPNOTSUPP : 0;
-}
-
-static int cf_check _page_fault(
-    struct vcpu *v, unsigned long va, struct cpu_user_regs *regs)
-{
-    ASSERT_UNREACHABLE();
-    return 0;
-}
-
-static bool cf_check _invlpg(struct vcpu *v, unsigned long linear)
-{
-    ASSERT_UNREACHABLE();
-    return true;
-}
-
-#ifdef CONFIG_HVM
-static unsigned long cf_check _gva_to_gfn(
-    struct vcpu *v, struct p2m_domain *p2m, unsigned long va, uint32_t *pfec)
-{
-    ASSERT_UNREACHABLE();
-    return gfn_x(INVALID_GFN);
-}
-#endif
-
-static pagetable_t cf_check _update_cr3(struct vcpu *v, bool noflush)
-{
-    ASSERT_UNREACHABLE();
-    return pagetable_null();
-}
-
-static const struct paging_mode sh_paging_none = {
-    .page_fault                    = _page_fault,
-    .invlpg                        = _invlpg,
-#ifdef CONFIG_HVM
-    .gva_to_gfn                    = _gva_to_gfn,
-#endif
-    .update_cr3                    = _update_cr3,
-};
-
-void shadow_vcpu_init(struct vcpu *v)
-{
-    ASSERT(is_pv_vcpu(v));
-    v->arch.paging.mode = &sh_paging_none;
-}

base-commit: 1ee8b11c1106dca6b8fe0d54c0e79146bb6545f0
-- 
2.43.0


