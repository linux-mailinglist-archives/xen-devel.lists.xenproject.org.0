Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNyhNM0QC2pN/gQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 15:14:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 707DF56D6B6
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 15:14:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1311843.1581977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOxnb-0008Mp-Qe; Mon, 18 May 2026 13:14:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1311843.1581977; Mon, 18 May 2026 13:14:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOxnb-0008Jr-Nh; Mon, 18 May 2026 13:14:23 +0000
Received: by outflank-mailman (input) for mailman id 1311843;
 Mon, 18 May 2026 13:14:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1wOxna-0008JZ-To
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 13:14:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOxna-009DFo-64
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 15:14:22 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a0b10ab-e002-0a2a0a5209dd-0a2a4502a610-10
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 15:14:21 +0200
Received: from [52.101.201.42]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a0b10ab-af86-0a2a45020019-3465c92ae39e-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 15:14:20 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by BY5PR03MB5111.namprd03.prod.outlook.com (2603:10b6:a03:1e2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Mon, 18 May
 2026 13:14:15 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 13:14:15 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vGSterGOJEwV89HAjCcxXmzfJvI0aQOE4d5iYZ7EDqVjeCFXTg0tJvOnrl79P51Mm8nFx1BrC+VuVZXq75M5sLrXhBd0avyLHEqaTUYOd7SBvpsjk5sFiZ+Nj1YJPg0xs7b2yEhlL/Vy5AWQG9CabH9dTjqkO4JnLOLfHghBRPxoXKhnKLyHkMPapwT9MpbGA6JdwN+i9rwrr1F2gR59P+NnqMcFooLgmsZAxDJ8GB1ZQEZwjPKC5TK9CCWKz9iZk8dgt5K6kSKoFk4N34DYMJx8R7Qn7QnrJOwHEEH/Vd3nrP0ACoQ2U76rxMkIghFq48i8ZashN7qtnIJ+ZQ2Nmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YmWCXDgj2ZZ2XpOGe/Bk8AcX6edLOrCqiS8EDz8T5GY=;
 b=eO+IR2qpYQqOoEyb3Gciu7dL//aZwy2yiDSNAtoYKrmGfut4WFJfiWBsjYaqvnAqOwBGLI+hZ/YI9FNA7C/l2br9RZ5Pj/Ybj5PKIwoCifL0cvfigZLoFsYe3777LnjA6/loFnGGO6zgyTNxJ/fRJzIRKteV05vpAoDm7qv4GeGp7YNncAxwss3yf5nQiSVDj/KMCsxGpckp8G2pryvfasUsVjGRHprOKdDQhf3CmNPmi3ao2Zq1fB5FhYBQR6f/VrGhEjWbKUWEpBeZu3Uo6BBMCMDTs3b9zefheXiNgHmjM8rL2X8q8FRsveG9km5ocVP/0UJEySx1jSJBqELGAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YmWCXDgj2ZZ2XpOGe/Bk8AcX6edLOrCqiS8EDz8T5GY=;
 b=pIsHuvXcGYauXgdb/sNX6a+cd1oC3BWdojgZiMQdR/6hrh+AmOAlWauOdHCcIH2YWEXKDmYOJb5CbGJVQ/erQi66tRCBSL9ZuytG1THS1kuXWtwvdIXrjWmhPe/P3Dz/hgn88rL6y1CgVBzOAtjBTAp5aEHDVTdLiDfs/w+duck=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [RFC v1 1/7] x86/hvm: Move description into hvm_emulate_ctxt
Date: Mon, 18 May 2026 14:13:58 +0100
Message-ID: <20260518131404.3716969-2-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260518131404.3716969-1-ross.lagerwall@citrix.com>
References: <20260518131404.3716969-1-ross.lagerwall@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0036.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::12) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|BY5PR03MB5111:EE_
X-MS-Office365-Filtering-Correlation-Id: 582fbf76-f75a-4997-4cfd-08deb4df5c3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|56012099003|18002099003|3023799003|11063799003;
X-Microsoft-Antispam-Message-Info:
	HRCXS+IwIDFXK82aFXQSl5d7uD1HxrDKfqPZWzTLXPDKOnq4FIo91PWwnLSi5RoQT4IiHDqXbcdDiKGaDykmQH3HwcLOpo/fuFRyRNnwJwKtLvv1qsuWkPd9dNBstnXox7/78bgI2g2xIIfvgkcmLuk1H/8x4koIFzeYDxq3YKQUHCFr2CR2HN5XOfbJQEZxMXUFfeSopO9vAmA54kejpuOMRjMKe92Ik1TaQJ2F9DilGdfwncCwbWBCNzBYAC4NV8dcr8+uiGIt3Wve7gjuZqjh2D1nho59kl09a6hEIobVR20puvNidPp5rs3dWzgIbuHO2PGM80kzFbYMoEYmB369c3Ivpbd3mm/shJt6sB9h1/JtvNqOcz5LjP3RBiBQiHTc7TSR7DwW/D//Xp9flxL3yI8qnHi89ZqCdO9k3tpKicwVOeD4gSUpuaCtyoAXxMsXTxWfRaWp61Vbwj/dkSfCs5+gdbyHymYOE2iiKk7WNEbRjr6Amk+r0+ZL9kcg3+gyF6vNhKtpZ9nGxP9AZWVP9ic6IKLee1YJdy0LfFEcfy6rbbkq3+/LwCoA+iwu7PklPhc1WEtfKTtaO51eYw/3tov1XLaNNItJpClg55iIRiBQOzQcZlO+Oh1dzQzPKw8jcAYiipQvajuq0dyv+7vnek0Hdu+/4WiEEuPMrmk80HsNy3gU/qbx9RqdBkmC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(56012099003)(18002099003)(3023799003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?O+A/Bl2ZWPhuTYGHSgaTqyHRBclGHAaju5oZydYZgY481LSzSKtm7hZ/8RAs?=
 =?us-ascii?Q?2fpDlgDx4pp7mrNS28I6s5CKJ1dAYJpv2F+ykQ2qGz2rN/FfV/LqoVTkdFBk?=
 =?us-ascii?Q?vjijCDfMKujpnxhevqzKVr/inzIbv2U4gpYqiQt42CL5k47a9qI2pCxJCPe9?=
 =?us-ascii?Q?8haDCLm/x0GhVByGI5BHnMMbxSMmUeoS953wLZIOXXxOuHaWMQNkXOOC2MNP?=
 =?us-ascii?Q?6O4uqjWlonDGksZY+CKGWIFbSXhvAe/nTJU05eBJj5lnb35ZeANqueUbuoQX?=
 =?us-ascii?Q?Gpym9CPVRtMA3vunQw5Mh3ellDMwVg3lozjEEw4QneLB1PGZ7W+wvlCW7TsN?=
 =?us-ascii?Q?5Mfs2+5tQqq9tAeNn284g5hy8lcpoQEQoHr5IPuevepY5sm/XJ7ZjkY2tUCo?=
 =?us-ascii?Q?Nnk+Qwyq6t6nWkFszQyQAIPccTphyr92MwjGhJgI1lB/BH7Lu1U5L8SIL4ET?=
 =?us-ascii?Q?jqdaIA4yJyXnOtkybD5A6azAJIRmy+Yu+UM/ZzyYFhO3DOD6TSmBiKTImHt1?=
 =?us-ascii?Q?e3auodqeZDXYBmzz7GyIT1n3tLXhIaKoYe6vNiEk1GBCdkH3a3iYvdAKwA0E?=
 =?us-ascii?Q?mmGxeOWnzKOA+XloRIUFqgY00PotJaQGXX9iAvsO4zZYMh2Q+1RJW1WbNLgT?=
 =?us-ascii?Q?4beH+tOh9VX6zfJwEG0tNp4t9VidSCJhnOaGMIwMjdgqt8HBBtED64+YoA2T?=
 =?us-ascii?Q?QGjt9dbxdfi7L/Z3BMpNIJgBrDBkRySkpe74RV0GzfIAUDQnyEjPtwWXtiGq?=
 =?us-ascii?Q?H5S5bXnzG1y5WoYXIfd24PJeWFcKGZNH3wsM41kaf+PhprYa8LibwPELSrdm?=
 =?us-ascii?Q?JcHZtG48+AH2PEy9gD18iD4qhGqdRfoYqikNa7xIiLghfnjqITSfFlqHFSzN?=
 =?us-ascii?Q?ipQfuEgeyUh1YlQqLr8lgNp8Gr+7mkZ5wDYu8WKPL9gnTl0R1JlSg58C9dCh?=
 =?us-ascii?Q?Sw/X0qLkDd2r3jMN4oySLfqreGfelOiE2BL9KLYSExShJrn0vHSF+h/P2fVE?=
 =?us-ascii?Q?76zh2Es48XNMPn03Lk0UiPXRM/dkp7DMxo5gdgYRCwj2ZLvv6rTvu4hmwCTJ?=
 =?us-ascii?Q?1LoTQOYxkM93x3kuX3NsEDI+1hpRTv+6Fpr4FMTS/fukDMRyW9Ufl5X0kDMK?=
 =?us-ascii?Q?Aob52rR601d43l7afqmwEAgc4Fggqh3eYLZ0uymeMPX46OJtwP4/73NKkyPs?=
 =?us-ascii?Q?xbyZeeZuu0ceYnQdE9jLzbXVhcnDZhsqHTVEUoCS3lomKZiHB4+L7T3/aGvh?=
 =?us-ascii?Q?2gjO4104l0ZIDIDd/kSMphAwqgC49BY2KQwVgZVyTzEV+NoV9zQslGusxDwA?=
 =?us-ascii?Q?poP2kS++/1o+14/+zuaf/dmKoJUGExmlJGsbfGzQEw7Hc3BWzR6vunhkZdMV?=
 =?us-ascii?Q?xWE4uPZqcv6I0ZSdU4l/4AMKE1p0ci7ay5SP2ZNrdloLqLYW5aIdHA64zoWo?=
 =?us-ascii?Q?+Gc2JA2Qzkd6wnw2+C7U4QCE7v4pLw9VHiJ4IXkXImJy2SPQSB1sRWSKq8J5?=
 =?us-ascii?Q?DAXIiygnTH+2b6YqHSjE6dJmzBdwdZuBs6XmNdHiytROKhH6OtDbdbXbQfc1?=
 =?us-ascii?Q?dZFOTz7ucEr5QWpTh4R6aUxMX7TP8CaOJRtcUvlt5tSHiuK0Wex4md2gNfYK?=
 =?us-ascii?Q?P1PFi1d664pd01+uZQyTSawXYhDcHCB627uuJhxCBUx/rVdY9W5n2F5ov3Ln?=
 =?us-ascii?Q?Bz6GJxCCaQw+9iPXBC3drVvrviSTU/kRdClE2hKun7tb1u7s1ItWo7FUOouM?=
 =?us-ascii?Q?E8aaiXzx/erFcxgL03V/ncL0GeLPeto=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 582fbf76-f75a-4997-4cfd-08deb4df5c3a
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 13:14:15.2762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BJL1Gzg3GvdpT0EYqhGUv4bpsvwT0jKT/Bvjdpkftdn1+64WWuP9fw9z6lzHSg5RJL/xJ37scNXpmSh40Y4tFuRIiBYxz/OEJa3oYIq6OiM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5111
X-purgate-ID: tlsNG-720697/1779110061-8077A161-4D9ECB49/0/0
X-purgate-type: clean
X-purgate-size: 6095
X-Rspamd-Queue-Id: 707DF56D6B6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:mid,citrix.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:ross.lagerwall@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

This will be needed to split up hvm_emulate_one_insn().

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/hvm/emulate.c             | 4 +++-
 xen/arch/x86/hvm/hvm.c                 | 2 +-
 xen/arch/x86/hvm/io.c                  | 6 +++---
 xen/arch/x86/hvm/ioreq.c               | 2 +-
 xen/arch/x86/hvm/svm/emulate.c         | 4 ++--
 xen/arch/x86/hvm/vmx/realmode.c        | 2 +-
 xen/arch/x86/include/asm/hvm/emulate.h | 2 ++
 7 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index bb1bb03ac4e9..a96d7814f91c 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -2868,7 +2868,7 @@ void hvm_emulate_one_vm_event(enum emul_kind kind, unsigned int trapnr,
     struct hvm_emulate_ctxt ctx = {};
     int rc;
 
-    hvm_emulate_init_once(&ctx, NULL, guest_cpu_user_regs());
+    hvm_emulate_init_once(&ctx, NULL, NULL, guest_cpu_user_regs());
 
     switch ( kind )
     {
@@ -2929,6 +2929,7 @@ void hvm_emulate_one_vm_event(enum emul_kind kind, unsigned int trapnr,
 void hvm_emulate_init_once(
     struct hvm_emulate_ctxt *hvmemul_ctxt,
     hvm_emulate_validate_t *validate,
+    const char *descr,
     struct cpu_user_regs *regs)
 {
     struct vcpu *curr = current;
@@ -2941,6 +2942,7 @@ void hvm_emulate_init_once(
     hvmemul_get_seg_reg(x86_seg_ss, hvmemul_ctxt);
 
     hvmemul_ctxt->validate = validate;
+    hvmemul_ctxt->descr = descr;
     hvmemul_ctxt->ctxt.regs = regs;
     hvmemul_ctxt->ctxt.cpu_policy = curr->domain->arch.cpu_policy;
     hvmemul_ctxt->ctxt.force_writeback = true;
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index f759a397c557..de399bd9024a 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -3835,7 +3835,7 @@ void hvm_ud_intercept(struct cpu_user_regs *regs)
     bool should_emulate = false;
     struct hvm_emulate_ctxt ctxt;
 
-    hvm_emulate_init_once(&ctxt, NULL, regs);
+    hvm_emulate_init_once(&ctxt, NULL, NULL, regs);
 
     if ( opt_hvm_fep )
     {
diff --git a/xen/arch/x86/hvm/io.c b/xen/arch/x86/hvm/io.c
index 23a5ea0e6197..d9838c36d330 100644
--- a/xen/arch/x86/hvm/io.c
+++ b/xen/arch/x86/hvm/io.c
@@ -55,16 +55,16 @@ bool hvm_emulate_one_insn(hvm_emulate_validate_t *validate, const char *descr)
     struct hvm_emulate_ctxt ctxt;
     int rc;
 
-    hvm_emulate_init_once(&ctxt, validate, guest_cpu_user_regs());
+    hvm_emulate_init_once(&ctxt, validate, descr, guest_cpu_user_regs());
 
     switch ( rc = hvm_emulate_one(&ctxt, VIO_no_completion) )
     {
     case X86EMUL_UNHANDLEABLE:
-        hvm_dump_emulation_state(XENLOG_G_WARNING, descr, &ctxt, rc);
+        hvm_dump_emulation_state(XENLOG_G_WARNING, ctxt.descr, &ctxt, rc);
         return false;
 
     case X86EMUL_UNRECOGNIZED:
-        hvm_dump_emulation_state(XENLOG_G_WARNING, descr, &ctxt, rc);
+        hvm_dump_emulation_state(XENLOG_G_WARNING, ctxt.descr, &ctxt, rc);
         hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
         break;
 
diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
index a5fa97e149ba..42ff796c6cb9 100644
--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -39,7 +39,7 @@ bool arch_vcpu_ioreq_completion(enum vio_completion completion)
     {
         struct hvm_emulate_ctxt ctxt;
 
-        hvm_emulate_init_once(&ctxt, NULL, guest_cpu_user_regs());
+        hvm_emulate_init_once(&ctxt, NULL, NULL, guest_cpu_user_regs());
         vmx_realmode_emulate_one(&ctxt);
         hvm_emulate_writeback(&ctxt);
 
diff --git a/xen/arch/x86/hvm/svm/emulate.c b/xen/arch/x86/hvm/svm/emulate.c
index 1f5436c8ea5d..1dd830a31bd7 100644
--- a/xen/arch/x86/hvm/svm/emulate.c
+++ b/xen/arch/x86/hvm/svm/emulate.c
@@ -71,7 +71,7 @@ unsigned int svm_get_insn_len(struct vcpu *v, unsigned int instr_enc)
 #endif
 
     ASSERT(v == current);
-    hvm_emulate_init_once(&ctxt, NULL, guest_cpu_user_regs());
+    hvm_emulate_init_once(&ctxt, NULL, NULL, guest_cpu_user_regs());
     hvm_emulate_init_per_insn(&ctxt, NULL, 0);
     state = x86_decode_insn(&ctxt.ctxt, hvmemul_insn_fetch);
     if ( IS_ERR_OR_NULL(state) )
@@ -116,7 +116,7 @@ unsigned int svm_get_task_switch_insn_len(void)
     struct x86_emulate_state *state;
     unsigned int emul_len, modrm_reg;
 
-    hvm_emulate_init_once(&ctxt, NULL, guest_cpu_user_regs());
+    hvm_emulate_init_once(&ctxt, NULL, NULL, guest_cpu_user_regs());
     hvm_emulate_init_per_insn(&ctxt, NULL, 0);
     state = x86_decode_insn(&ctxt.ctxt, hvmemul_insn_fetch);
     if ( IS_ERR_OR_NULL(state) )
diff --git a/xen/arch/x86/hvm/vmx/realmode.c b/xen/arch/x86/hvm/vmx/realmode.c
index ff44ddcfa627..9879533280d0 100644
--- a/xen/arch/x86/hvm/vmx/realmode.c
+++ b/xen/arch/x86/hvm/vmx/realmode.c
@@ -163,7 +163,7 @@ void vmx_realmode(struct cpu_user_regs *regs)
     if ( intr_info & INTR_INFO_VALID_MASK )
         __vmwrite(VM_ENTRY_INTR_INFO, 0);
 
-    hvm_emulate_init_once(&hvmemul_ctxt, NULL, regs);
+    hvm_emulate_init_once(&hvmemul_ctxt, NULL, NULL, regs);
 
     /* Only deliver interrupts into emulated real mode. */
     if ( !(curr->arch.hvm.guest_cr[0] & X86_CR0_PE) &&
diff --git a/xen/arch/x86/include/asm/hvm/emulate.h b/xen/arch/x86/include/asm/hvm/emulate.h
index 178ac32e151f..2801d14d5455 100644
--- a/xen/arch/x86/include/asm/hvm/emulate.h
+++ b/xen/arch/x86/include/asm/hvm/emulate.h
@@ -30,6 +30,7 @@ struct hvm_emulate_ctxt {
      * filtering.
      */
     hvm_emulate_validate_t *validate;
+    const char *descr;
 
     /* Cache of 16 bytes of instruction. */
     uint8_t insn_buf[16];
@@ -74,6 +75,7 @@ void hvm_emulate_one_vm_event(enum emul_kind kind,
 void hvm_emulate_init_once(
     struct hvm_emulate_ctxt *hvmemul_ctxt,
     hvm_emulate_validate_t *validate,
+    const char *descr,
     struct cpu_user_regs *regs);
 /* Must be called once before each instruction emulated. */
 void hvm_emulate_init_per_insn(
-- 
2.53.0


