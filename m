Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJkuM7A2EGoaVAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 12:57:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2675B2969
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 12:57:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1316642.1586021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQNZR-0004ZM-LG; Fri, 22 May 2026 10:57:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1316642.1586021; Fri, 22 May 2026 10:57:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQNZR-0004XL-IE; Fri, 22 May 2026 10:57:37 +0000
Received: by outflank-mailman (input) for mailman id 1316642;
 Fri, 22 May 2026 10:57:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>) id 1wQNZQ-0004UT-6x
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 10:57:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQNZP-00706o-4j
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 12:57:35 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6a10368f-2eae-0a2a0a5409dd-0a2a450c82b2-46
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 12:57:34 +0200
Received: from [52.101.46.41]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6a10369c-62f1-0a2a450c0019-34652e2973e1-4
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 12:57:34 +0200
Received: from SJ0PR03CA0131.namprd03.prod.outlook.com (2603:10b6:a03:33c::16)
 by BN7PPFABD533732.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6df) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Fri, 22 May
 2026 10:57:25 +0000
Received: from SJ1PEPF000023CB.namprd02.prod.outlook.com
 (2603:10b6:a03:33c:cafe::7e) by SJ0PR03CA0131.outlook.office365.com
 (2603:10b6:a03:33c::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.17 via Frontend Transport; Fri, 22
 May 2026 10:57:25 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023CB.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Fri, 22 May 2026 10:57:24 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 22 May
 2026 05:57:21 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=heIg3oPrNBkbvrtOIc9FU5NWNI8BRo3MKDmcg0dUgW/hD1Mz4GxcvC897LM24FUQlkvG5xdLt0f+F9739ihKm8Wlw9URcSBR6vIHzJxAOuOkL4xNFRIQbcMIHWVdqm+iWQ5Yod1HF7g20eoIq5AW9ND4X5AW/qFoiXGHO+MV5WDUxPJCwxNrqgiCJn1ANz4IaT8Ki13fusvu9nMhNaN92Is4F24j05XWaSa/0WVuEX22SHIoDGtXKjyd2g9mCPKVbnDxAPCvWYNaXKNDSDVYJRSL6uANNHtvbhoGGV10TgXptw76Vlhnh+fcRP/fOv/hacIPbh/mGrlchikuMg4zHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qOh2jpqS2BR1EVriwkYl3p6XELwuMqsRKXo/u+NABBk=;
 b=GbiS7q4ASnq1eX999s2VRi271FDOYX9qBqwHkKFprEc8p3Jp7D8eGbNKyK53WHvZjuyUI4IT/GVPH3VCOAnwEKzzZqV5QnxDRJ0WQWTBpBoDC6i6MJe8CSwJ7UGhmYxviq4ibFyYeNHURQ5+Y5gSYYrcR4B4Hu+d3wYk/rIpZuiGfGlQExLgXwX8YKjiWpF7MsPCXeYrl946fjXrCsqCWK69FO/GmxxWccB8pwoLzM/sfLlZLBFMj8PS6xGOKxJD5kyx+8KzH0nWXABfccNc/MEdcNZ3t31kE0vw8uH+CgXU1lps7H0EVa0civaYsWVid8Vt5VXmsw/MLHJ1/uiLKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qOh2jpqS2BR1EVriwkYl3p6XELwuMqsRKXo/u+NABBk=;
 b=y3xf3DInu3Y+0ER0VOy3IFU4ttZ90K9v+duNvguWa3txIN8gPvCrnDhWha610cTu0K/Affs9t9zKTZ5qouddVpQWsvRxOO8sJPmuqIplTtclp/PR1WEUA6JoLtZ2denRnqgv54XhciIbX+L6riHy/KTeuC2AfGBAdDbuOp2+Ask=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>
Subject: [for-4.22 PATCH] xen/gnttab: Fix TOCTOU race in gnttab_set_version()
Date: Fri, 22 May 2026 12:57:06 +0200
Message-ID: <20260522105709.25073-1-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CB:EE_|BN7PPFABD533732:EE_
X-MS-Office365-Filtering-Correlation-Id: f988b662-9caf-406e-3ea4-08deb7f0e845
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|30052699003|6133799003|56012099003|18002099003|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info:
	u+DETQJ11dN2U3XOzWA+EwtyC3xR2u48FWVQwgvzEqP/YGqvbFLs5ultd0jO4kXjh/YiJ5xarGja5lt8AfKiluoMKNkyMOokNpvParPQnwRQuQgHNkWNm4U2mnCvArzN3/E5O6a3dqV2PRSuaswt5Nb8WWY1iV17q8CONDwPakIO0qTIDUlDKfXCia44BthpR/JYCwolLr+Yb7ueD8mzH65Blf2Jn5PHPXUulT7wJl6qXTUA2XWlqpQKZlzoIG3DrI2leYTBIgYRQsZCx6H2I/9ygKUybiiEaONlOyRXREI2BXOX57YP6ARVe++jZVVlBXGX4k5lF4utK9lZnNmyC6quO0ozeOKIp51EW9waFXOmCMsO+RHu9E6CYDlUXwKsLOeNpNokBhWq+wq9aNbyRYFH0C8x2khDKGv5lhjDsag2VTo0aUWDiLk7zvyOGltmCajxtBZXRGTwdvC9b391H8/vjNLWNLijdARebPbmwj8wGyyy+DQYyx470m+bPRM7I81vfpKErHp4j3R6L24iyz2OWLNMK7Emnt5wp5iZcHnXivg4U94MhACEghMx+6a999fGUqilRw3Yf7QKzXKMjYnp2KJnA8uc8M9odx/N8uB8P5LSu7cU2hqxNGMluB+jwGTve43MGUV0u6G/Onc9ZcDx5eJ+QQo4X8LmtM3f9YptMFOaOc58udfhhL38DSUBLsYLtG5X+A2v5S+r1ntlrznBJ9tah5avl/CjRoQCwYY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(30052699003)(6133799003)(56012099003)(18002099003)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lZvZDlHK1L9QYasQZGBcvyx4LttVpOKkXe+gwlWtpli+ijt9RdyzHn9S+OhCzbnh+weF4J4v48zMz62T7SE+RxaHeQLKPO3e7XYY0wT+86z5YIEZ3qcn3dOI5w4Wj6qLAwZPQbq+mN7xqnkh1udx9WI6QPsX3OS0bIVbtdyzOlV1oEafEv/jQKXb5C1U2kvEtxyRxNYTsUtzomyNNkuiUiQpsKEyCUpA7TINMu06tMkgSYmRyh8dVVhqqDv6dazGrpuEGO1MStPWqSn7euGanF+t1Pprh5fHCnvETUFcThPtfkxpPvvSS5pbHm1piWpkc96d8Kc7otRZ6xGchjVbg2f1h9967BGfVJ2CgTeY+kwXvZqxd/OeMjG4+qS8Eu3HlCPg5/+1ahC/jh417oldG0PmhspfD/p8DbW3Mk5x/UTXE03mIelyoliP8O/CC+k3
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 10:57:24.8730
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f988b662-9caf-406e-3ea4-08deb7f0e845
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFABD533732
X-purgate-ID: tlsNG-d25034/1779447454-E377ECF5-B4D38192/0/0
X-purgate-type: clean
X-purgate-size: 1763
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[amd.com,citrix.com,vates.tech,suse.com,xen.org,gmail.com,kernel.org,epam.com];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:alejandro.garciavallejo@amd.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:oleksii.kurochko@gmail.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Oleksandr_Tyshchenko@epam.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,amd.com:email,amd.com:mid,amd.com:dkim,epam.com:email]
X-Rspamd-Queue-Id: 3F2675B2969
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Move first read of gt->gt_version inside the critical region of the
rwlock, otherwise concurrent gnttab operations (silly as they would be)
may get mutually confused as to the actual current version.

Fixes: c1488502c949("grant-tables: do not fail attempts to...")
Reported-by: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
This is far from a problem in practice, because kernels invoke this once and
then are done. Still, correctness mandates correctness.

There are a number of lockless reads of gt_version (e.g: right after unlock),
but they aren't very worrying because they are effectively snapshots of the
instantaneous version. I'd feel better if they were all atomic_read(), but all
Xen ports guarantee atomic access on aligned 4 octet fields, so I couldn't be
bothered to go chase them.
---
 xen/common/grant_table.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index 2dda1abd3f..ac9fed6001 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -3184,11 +3184,12 @@ gnttab_set_version(XEN_GUEST_HANDLE_PARAM(gnttab_set_version_t) uop)
     if ( op.version == 2 && gt->max_version == 1 )
         goto out; /* Behave as before set_version was introduced. */
 
+    grant_write_lock(gt);
+
     res = 0;
     if ( gt->gt_version == op.version )
-        goto out;
+        goto out_unlock;
 
-    grant_write_lock(gt);
     /*
      * Make sure that the grant table isn't currently in use when we
      * change the version number, except for the first 8 entries which

base-commit: aaa34f23ac65b75c94d069e407a2698602f18d56
-- 
2.43.0


