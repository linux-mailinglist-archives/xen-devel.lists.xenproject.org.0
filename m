Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEnYOs0QC2pN/gQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 15:14:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 819C056D6B7
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 15:14:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1311845.1581994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOxni-0000PX-Ck; Mon, 18 May 2026 13:14:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1311845.1581994; Mon, 18 May 2026 13:14:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOxni-0000NX-9o; Mon, 18 May 2026 13:14:30 +0000
Received: by outflank-mailman (input) for mailman id 1311845;
 Mon, 18 May 2026 13:14:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1wOxnh-0000KK-06
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 13:14:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOxng-00EWKw-CM
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 15:14:28 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a0b10aa-5cb7-0a2a0a5109dd-0a2a450aa170-48
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 15:14:28 +0200
Received: from [40.107.208.49]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a0b10b2-56b3-0a2a450a0019-286bd03147ae-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 15:14:28 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by BY5PR03MB5111.namprd03.prod.outlook.com (2603:10b6:a03:1e2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Mon, 18 May
 2026 13:14:24 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 13:14:23 +0000
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
 b=KsV39skMRHI6JNafJKHe2WpW2WvXfSPJo58c9633aMt2xqaV296InJ13wNYfvSu++LrH67Jx8KLW1LK61QtG0WH+KamG/A3oLUobFkYEuf2VrljD/eN4FbWDbyBFLpiqY8bXq7z9E0aDxMdBGZJFNMEodMiS+Mq/G4AF8R4VxEW5JFmvGKM/vFSwjg3EqVV3qeN5gluKT4bVxD/U2L5/raqzwogJUswTVTMSi+bo/YxNRkZGQ+nwB+3eg+ZS5maQik3Bj4v9s5NWkUg4yJzM+Z7ROowV85lBMNuYlredCTUGugsntQ+uuwza3E5NqikY7vA5jcYKGxAsXlqPQzy8eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IvpufiE6EX4IADgKhV1F40NPVtMT7lPinzez3cDqZ/k=;
 b=C9H0tTNEy5ArjqkzokC8lHlg5i9rgIvXKi4shMc+buSmeV4usg66B6pBEEs3VHgHOXJ+1XptSYcOB7f0po50pSpsOpM/tLtB0piCnxXlmLlMeZV5jSKbBTsqGIjVjCK0Ex39RQfIse+4AVJTbldo3/VckMcck5VaIzG4Fl6LUw6+5EcN7ZbYIO3RAo0be2qg8yVWaLR3ZyeUJfXZs989N4/UpwrmvewXRaKzAS89ZCcSx1dcEqOAmeZSO57RCErgxcoToG+aR1eUTRZuvFoxSFlP3Himlw4WvNMGZ1dUWboI12OLFPUijP9busW8D1Ioh4x3DX9EfC247eMAS/Dt+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IvpufiE6EX4IADgKhV1F40NPVtMT7lPinzez3cDqZ/k=;
 b=iCNnDkDr0ycJG2/xEIovV3zbuTTrrG2wqDSwbU4VHI6xOIPUR9Wwhy9fUM7JiS8HE9HAj+Hll6YTL6bwFOlr9tGy7UNXkH3cnp1NQiL6n+x7P1MroLtmuTNxVqr4TWmk8aG6r1FtgCeHHtXQV8m4QIrcoPtQRQG1bPfFxakkH4I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [RFC v1 3/7] x86/emul: Separate out instruction completion
Date: Mon, 18 May 2026 14:14:00 +0100
Message-ID: <20260518131404.3716969-4-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260518131404.3716969-1-ross.lagerwall@citrix.com>
References: <20260518131404.3716969-1-ross.lagerwall@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4PR10CA0005.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dc::13) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|BY5PR03MB5111:EE_
X-MS-Office365-Filtering-Correlation-Id: f0b56c02-0799-45c7-807c-08deb4df613d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|56012099003|18002099003|3023799003|11063799003;
X-Microsoft-Antispam-Message-Info:
	TC/bt776wv+lTW1EoVcUWMvaDvxbHDdARI1mrw/5SXKhrk9dzl6NwomlMQ82qrAvHzMyy8fHLIA8tSafF1bvpfMLF0frwH91zq8p5JF0/c2zhmVicjhO0XMjOEDUfJm27StcNdnBAx0PXfXCWxkJ/rFoC94u3QtZ4AinKuQqfW5gI6gKEQYWsFIzMHcwht5T1NBME+3/0flfC98WE5x7D94F6RwFs7suW0IZVA3EzO047AjdtAW+jaJOQ9aT4o5wlCsa4OkInCQMe2UEjba4Q/3JRhmP/4zTIAVgUdr34hEbzAkxSKwL2d+qeYO7MTbDSZt2GN9MFOotBS8OMysMQd2gaKFeZlIabUfIZqEM7igWbS3DeTqMX4B5Kd3INXVh/7PTT3/4X8f5L1LlWhOdHw9+dF3EFNz17BbZKE2RKA/9qkr9TFBSf35zDoR5xwcjUfRDzOCKkZJRbyQkrupRWBilyiMqH4l1B+7gtw8jCkw6fouszICNcJ+7elPH21f59NDifjOnPXD8p0WBDCFpQC6kRK8PRSgEQCY3bz8m7XJ+LOBQ9tjNGwtBPw0SadxWOArVh9lCTo7nu682lR6NZX78Tqy1hI1uISzobjHqH9TltfZOQVbRF4HmU2JXIe9lEuyQHfbALZWTzUbF526w0jm9GIx5sJHqhs0j351FS6thOj4PBLQHbIi4QN5k/Hfn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(56012099003)(18002099003)(3023799003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qlfB+jTAQlAbBYQDbh5PfwPatKBwKzHNFcHlh9UdCyuXFckqVuDzZMaHqZ7H?=
 =?us-ascii?Q?336W9VV+yvSNRYgluFCaweA/SNrrRcZfr7bBthUZf4OakWsrhc8LiGzO8pVl?=
 =?us-ascii?Q?R9SWjb/sFXuWVn6Aj2dkykbEumTc1cMa3736zGVhxw6zX2Wm1HDBcTli6KCS?=
 =?us-ascii?Q?QocKZgN5rAU+xu2w971M5juRjKA6I1V8DZvmNZ2G1RQvahF7P8nUyJCSiC+E?=
 =?us-ascii?Q?+n43XHZu9IaPYBoh2jhQGahOlW4p0uNoPm+KGzxmryTPt4RAIbPI63R1HIwY?=
 =?us-ascii?Q?9s3uHCfksRL5htTbgS4gFkojRFjbQaZFE6Bb47Llp3/OLHrYW6BLxfeYe/bd?=
 =?us-ascii?Q?RRMS5FIlZq4mwouCb+4mN2zfPPYjDJuAlvS9pzBwqA1DqS+GxmbHxlQNdv9s?=
 =?us-ascii?Q?ZvzyWwSf5nAs82A+rL+TwaR85DUbsY51Y6g00vorwnqyW9Gr9yRAUlD2WKDn?=
 =?us-ascii?Q?sxDdvF+xI4OpJ8cAr5ueEKXQ+vyJK3pO4Y88TsayO+Ni26p8V4hdUE3yE12U?=
 =?us-ascii?Q?wXlcN2a43alm/S2HRyxfVebrpY5p4mWp8jsjx26dAO0H88w1Phs26ygLAiI3?=
 =?us-ascii?Q?Ra2hRM3cd9yhB/CLQX1a8r0NfyT9NW6NuDxVAc1WRsdbmyzKzPO3mTpqYqFF?=
 =?us-ascii?Q?GkWSj/Ognuk9KagZC+rWg940e/ZyTqGLSwdeeOgwn7fhZTP0gLfKwWVUl9f+?=
 =?us-ascii?Q?jG+bZ7TEJgSrs1PeawTgmJXBzAEyNHsDvhdF/t2iRk0SW96IZ54AZQzPECF5?=
 =?us-ascii?Q?LsLe6BWrjXrN3B+G+W7PetGL+OmZt5lL9HdykyP3ZrzxW+i4UQ8w7snFX5Yd?=
 =?us-ascii?Q?B3kEZqj1H5FK26GL8U2sCA5UWXse4JmTQm9eWZQDyKbCLz6X7kvSVzilEG23?=
 =?us-ascii?Q?7u3SKlK63TJ6msh+cpNtZffHn1ic5dJw+69pL078rilnHuCe6Y7NQoLRmbcs?=
 =?us-ascii?Q?qE1JDyi2ZFG2cV9PKDJQw45usXIBvFe4uMq9BYEDK7Ogf1kO7xNQXr/u8In5?=
 =?us-ascii?Q?VaGblX99mzwcoB0yuD0tGF3NWEJF1pe1wHFnd8KP3Xw3V3Vd0DVZCQXT4ZmJ?=
 =?us-ascii?Q?Icjt/nprKdnt1hqwPoukfE0C1VsEek0y2kBDG8cwIBLAlSBio699lEsQI246?=
 =?us-ascii?Q?maintDwwDKFu2fPD26dMMqXroH+wYfGx7+JNh7ww0IIlVHMGH14o3JTkIEtn?=
 =?us-ascii?Q?+OksI8TmxqJpOoxA1gnils6vhMmWYoha3KnfC5mhWuFu3nhI9aFhyrMtfXQF?=
 =?us-ascii?Q?NhG3kR9OiKa535oB+YSvA4vP4P3emGlJHGcKfmH3lldDHGlA6eD4bP37iiGV?=
 =?us-ascii?Q?T+maLmU1Ie6vsEAwWweQVMXuJmyVcP8geP9rEn/TwKW1j6n4fFK7gyiHUZMN?=
 =?us-ascii?Q?ioJaGnHQ4MpK8B7uqtaKgIUaQWoRUM5b+1Qnm+t9MNO+gyRgc16v3nbnNTwo?=
 =?us-ascii?Q?NSmmD1DLFKdmwQTDSn0B7q7VKQ3QI0Gd6eAiNOn7IhvL3Dmww4e1n+dh2vyL?=
 =?us-ascii?Q?BV1BOEWQRw3rjxzlUOd1c2yfAd7IABdwFihKZWUpaw2rAVS1EOlDgxBzIVOH?=
 =?us-ascii?Q?qgKCa3QFK7JRobOAmDBSmvQfIcxx1eP374c21pSJ91tSItDQs43ljmEf5HI1?=
 =?us-ascii?Q?Xr9Pp1iZFkrwqbva/6wS4XeVxZDmjArW8p9NfWdN3gG0Drdy2mjEG+ZscEap?=
 =?us-ascii?Q?5JD4e9YjgsU/EAxYHopCOKt0T7iEJGGyEvU7PxrkuEP+3OYWpP+gNnrP7vgh?=
 =?us-ascii?Q?t/oAZ1ejDvgzIYUbmxG32zcV/Q/XRec=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0b56c02-0799-45c7-807c-08deb4df613d
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 13:14:23.7949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F3FQZQM4rfQYtzM7ZSsdCAz1aH4sbzHtpqXu9GydHclp3ymMTQ/crmLULzvk5QmWFkQpHe+Uaq1l/n2+ouSUv9QsgWEaRF3gHvlMFBQ7mLs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5111
X-purgate-ID: tlsNG-4011c0/1779110068-7236B8B7-976AE496/0/0
X-purgate-type: clean
X-purgate-size: 6425
X-Rspamd-Queue-Id: 819C056D6B7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:ross.lagerwall@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:mid,citrix.com:dkim];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

To support merging the emulated instruction and VMEXIT paths, split out
instruction completion from the core x86 emulation so it can be called
separately.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/x86_emulate/x86_emulate.c | 48 +++++++++++++++-----------
 xen/arch/x86/x86_emulate/x86_emulate.h |  3 ++
 2 files changed, 30 insertions(+), 21 deletions(-)

diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
index 364e6c092ded..76fbebf96b4d 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -320,7 +320,7 @@ do {                                                                    \
     rc = ops->insn_fetch(ip, NULL, 0, ctxt);                            \
     if ( rc ) goto done;                                                \
     _regs.r(ip) = ip;                                                   \
-    singlestep = _regs.eflags & X86_EFLAGS_TF;                          \
+    ctxt->singlestep = _regs.eflags & X86_EFLAGS_TF;                    \
 } while (0)
 
 #define validate_far_branch(cs, ip) ({                                  \
@@ -337,7 +337,7 @@ do {                                                                    \
         ({                                                              \
             validate_far_branch(cs, newip);                             \
             _regs.r(ip) = (newip);                                      \
-            singlestep = _regs.eflags & X86_EFLAGS_TF;                  \
+            ctxt->singlestep = _regs.eflags & X86_EFLAGS_TF;            \
         }),                                                             \
         ops->write_segment(x86_seg_cs, cs, ctxt)                        \
     )
@@ -1234,6 +1234,22 @@ int cf_check x86emul_unhandleable_rw(
     return X86EMUL_UNHANDLEABLE;
 }
 
+void x86_emulate_complete(struct x86_emulate_ctxt *ctxt, int rc)
+{
+    /* Zero the upper 32 bits of %rip if not in 64-bit mode. */
+    if ( !mode_64bit() )
+        ctxt->regs->r(ip) = (uint32_t)ctxt->regs->r(ip);
+
+    /* Should a singlestep #DB be raised? */
+    if ( rc == X86EMUL_OKAY && ctxt->singlestep && !ctxt->retire.mov_ss )
+    {
+        ctxt->retire.singlestep = true;
+        ctxt->retire.sti = false;
+    }
+
+    ctxt->regs->eflags &= ~X86_EFLAGS_RF;
+}
+
 /* Helper definitions. */
 #define op_bytes (state->op_bytes)
 #define ad_bytes (state->ad_bytes)
@@ -1265,8 +1281,6 @@ x86_emulate(
     uint8_t b, d, *opc = NULL;
     unsigned int first_byte = 0, elem_bytes, insn_bytes = 0;
     uint64_t op_mask = ~0ULL;
-    bool singlestep = (_regs.eflags & X86_EFLAGS_TF) &&
-	    !is_branch_step(ctxt, ops);
     bool sfence = false, fault_suppression = false;
     struct operand src = { .reg = PTR_POISON };
     struct operand dst = { .reg = PTR_POISON };
@@ -1280,6 +1294,9 @@ x86_emulate(
 
     init_context(ctxt);
 
+    ctxt->singlestep = (_regs.eflags & X86_EFLAGS_TF) &&
+	    !is_branch_step(ctxt, ops);
+
     generate_exception_if((mode_vif() &&
                            (_regs.eflags & X86_EFLAGS_VIF) &&
                            (_regs.eflags & X86_EFLAGS_VIP)),
@@ -2064,7 +2081,7 @@ x86_emulate(
             goto done;
 
         _regs.r(ip) = imm1;
-        singlestep = _regs.eflags & X86_EFLAGS_TF;
+        ctxt->singlestep = _regs.eflags & X86_EFLAGS_TF;
         break;
 
 #ifndef X86EMUL_NO_FPU
@@ -3103,7 +3120,7 @@ x86_emulate(
          * Their only mitigation is to use a task gate for handling
          * #DB (or to not use enable EFER.SCE to start with).
          */
-        singlestep = _regs.eflags & X86_EFLAGS_TF;
+        ctxt->singlestep = _regs.eflags & X86_EFLAGS_TF;
         break;
 
     case X86EMUL_OPC(0x0f, 0x06): /* clts */
@@ -3189,7 +3206,7 @@ x86_emulate(
                                       ctxt)) != X86EMUL_OKAY )
             goto done;
 
-        singlestep = _regs.eflags & X86_EFLAGS_TF;
+        ctxt->singlestep = _regs.eflags & X86_EFLAGS_TF;
         break;
 
     case X86EMUL_OPC(0x0f, 0x08): /* invd */
@@ -3918,7 +3935,7 @@ x86_emulate(
             /* In particular mode_64bit() needs to return true from here on. */
             ctxt->addr_size = ctxt->sp_size = 64;
 
-        singlestep = _regs.eflags & X86_EFLAGS_TF;
+        ctxt->singlestep = _regs.eflags & X86_EFLAGS_TF;
         break;
 
     case X86EMUL_OPC(0x0f, 0x35): /* sysexit */
@@ -3958,7 +3975,7 @@ x86_emulate(
         _regs.r(ip) = op_bytes == 8 ? _regs.r(dx) : _regs.edx;
         _regs.r(sp) = op_bytes == 8 ? _regs.r(cx) : _regs.ecx;
 
-        singlestep = _regs.eflags & X86_EFLAGS_TF;
+        ctxt->singlestep = _regs.eflags & X86_EFLAGS_TF;
         break;
 
     case X86EMUL_OPC(0x0f, 0x40) ... X86EMUL_OPC(0x0f, 0x4f): /* cmovcc */
@@ -8347,17 +8364,6 @@ x86_emulate(
     put_fpu(fpu_type, false, state, ctxt, ops);
     fpu_type = X86EMUL_FPU_none;
 
-    /* Zero the upper 32 bits of %rip if not in 64-bit mode. */
-    if ( !mode_64bit() )
-        _regs.r(ip) = (uint32_t)_regs.r(ip);
-
-    /* Should a singlestep #DB be raised? */
-    if ( rc == X86EMUL_OKAY && singlestep && !ctxt->retire.mov_ss )
-    {
-        ctxt->retire.singlestep = true;
-        ctxt->retire.sti = false;
-    }
-
     if ( rc != X86EMUL_DONE )
         *ctxt->regs = _regs;
     else
@@ -8366,7 +8372,7 @@ x86_emulate(
         rc = X86EMUL_OKAY;
     }
 
-    ctxt->regs->eflags &= ~X86_EFLAGS_RF;
+    x86_emulate_complete(ctxt, rc);
 
  done:
     put_fpu(fpu_type, insn_bytes > 0 && dst.type == OP_MEM, state, ctxt, ops);
diff --git a/xen/arch/x86/x86_emulate/x86_emulate.h b/xen/arch/x86/x86_emulate/x86_emulate.h
index 0fd20747dc43..17bf14455cf3 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.h
+++ b/xen/arch/x86/x86_emulate/x86_emulate.h
@@ -594,6 +594,7 @@ struct x86_emulate_ctxt
     } retire;
 
     bool event_pending;
+    bool singlestep;
     struct x86_event event;
 };
 
@@ -680,6 +681,8 @@ x86_emulate(
     struct x86_emulate_ctxt *ctxt,
     const struct x86_emulate_ops *ops);
 
+void x86_emulate_complete(struct x86_emulate_ctxt *ctxt, int rc);
+
 #ifndef NDEBUG
 /*
  * In debug builds, wrap x86_emulate() with some assertions about its expected
-- 
2.53.0


