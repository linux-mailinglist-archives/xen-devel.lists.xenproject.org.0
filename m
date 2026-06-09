Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pyH0FP00KGqZAAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 17:45:01 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B86C4661ECB
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 17:45:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=ffFlcgVZ;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1333569.1596667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWyd1-0007vM-Ql; Tue, 09 Jun 2026 15:44:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1333569.1596667; Tue, 09 Jun 2026 15:44:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWyd1-0007sc-Nf; Tue, 09 Jun 2026 15:44:35 +0000
Received: by outflank-mailman (input) for mailman id 1333569;
 Tue, 09 Jun 2026 15:44:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1wWyd0-0007s0-5n
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 15:44:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWycz-004x8p-Ie
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 17:44:33 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6a2834df-e002-0a2a0a5209dd-0a2a450bb8ae-6
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 17:44:33 +0200
Received: from [52.101.62.70]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6a2834df-212f-0a2a450b0019-34653e465aa2-4
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 17:44:33 +0200
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by CH7PR03MB7785.namprd03.prod.outlook.com (2603:10b6:610:24f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 15:44:30 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0113.011; Tue, 9 Jun 2026
 15:44:30 +0000
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XKFy9O8XztXGAiR8C/zCBA26YZmXdkLRrTaQDPzB6vO6HMxdHBcjkLeHQbDGjBEBwuF6hj3qNjTaYT13ofNflT1ndBPxaksJGQBK4uVfNtSx1exWGL8QC8uTFQsGgtyB8u1KT9awKD7eUeWvfUqVCv/AYuLSScm41kz85Mu/83OjsTwzleaCwlgMCh/nbtVeN45BhjZ3WQRAqZYn74q+kRAmWxNbxb12p7o45YBxcbU4yvXjY76KGzoA2/6br4w3OUJL7RgoF1cgSEoig03e8v2cQ2zh1SPkhXYbjC2m94NwfJCohD/SsxgStqT+hCn/LxYZXs/9ISvwZ6qnbLG9cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bzc1oPu1NL/usio0KuZ5ijXQQ8zkcN2uEf2vo0rgkT0=;
 b=ghwGPqdlAOT77Z/z5uFyTphQnfpzILgbTimb6jqO1pi7DNjqu0oZAH0Ts4KJw4COUUDbXJ/YTwB7+MvV2qcZ3m8+gCwkUhGUQMUoBk/jQfld06nSXddx5kg7jwn1G3+EfvbS8YSVYLU+FDeBmWfePTqGoxvC1FVcOrh1YcEDYKdgshixRzHPZo6qiqlZ7YYCIz3SUKe5Aa7bS3zgxNdz0mYhFB+l+dz6z/0EhDbToxqnp9bU5TTADI43id5RIkVGNpT2s32R4sCHUP6i2WzLZl/l8zX43zAycs76xe+SxrizeLEQIHcYZPgOs0hFYjkQ3QvUX50iPPzCDEEa8ZcXUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bzc1oPu1NL/usio0KuZ5ijXQQ8zkcN2uEf2vo0rgkT0=;
 b=ffFlcgVZQfdyMCFxLNww30rQxWPyYjz1y9QK+IZFPTxjgnsEQs5jD6H2NSJg2aO/gugblwnCdPkyrExXyoRBMCQnsWq+YMollP1N0OEtCll1UGCD5neaqrXc9SDcl//vEs4qCBifk1wMgddl2hpC/qEvnWGrADiDpa/bmY2pFD0=
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Kevin Lampis <klampis@citrix.com>
Subject: [PATCH 1/7] x86/kexec: add digest checks
Date: Tue,  9 Jun 2026 16:45:12 +0100
Message-ID: <20260609154518.779757-2-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260609154518.779757-1-kevin.lampis@citrix.com>
References: <20260609154518.779757-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0124.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::14) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|CH7PR03MB7785:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b147230-7207-4e6c-9906-08dec63dfda6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	pGo67S51EMGohECkz6pIf5d/paawaz+NTpjUMbeyyTYifXUb1/IZ0wy5TEmkYjN+c6Cu0/h9cGC+pzcHAwr4zbvZY9OKN4NSvscsb96WXVMk7MJqmy3kB/lRecGdAumyDjseK6ibJFJvgTeJ1gNEkL8++rVF0xjQCVqjUkY6addTZAjJv9gwtL2adoTlTMY+4biATz5XdrSCNMBxtW6NF/PSgEpEqCkfIYig3sjkkqXcH0gd+0l2SmpbBwoYZOKCiIMvCTuetPMC6ERCss6ql5nk3eP443Yan49AMF0NFG8t9F3lQZlvm2lTMLz9pVyq26oVgfmeMp5trjOcbR0BszXzluJVh1ntkyJxADzTH8PSc1ieutsflCCpd/r401CqkUo1aHfqDVz5eKRYzVJKuGgup4GSyAb5QVXl5YKv5lPaGAR3z8c/PEO+9mgcsUoQfGJJPjos8rsXbYD3+tN31UgjDtKR9UWr+rNZ0BLgGvDXYTnoPn2BXp/8BxBfm3cWoAPJOV8CcutKbE6t/jLDXfD6VP8lt0Kg6Sm2ACdYvmJKCgBR4SWhJL/0nvF09TxNkwu13V3PHvWNLq8X1hmtkcp4DdKyPJADckI3WhKKnc2ChqvPNxcbqv9wCZZt/Ssoqw0akBvV6Bc3tZZW7algdxyr4evNsv8KNP5kMN7EwgrgpXun1SYNlCroXeTiX/pn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?A8IVL2m6eWDFcEl+wdwi9w/7IVk3UtrLGVpbToPvDFXd3lkFg09s4uO97ypf?=
 =?us-ascii?Q?JxYNtpn7arzz8liSTmsutoyEzNjnVB9nzgm7gNXBiuA6J8HhcP+AiGovsP8o?=
 =?us-ascii?Q?SpV+UGhAZ7lS2vOBahDw3SyMte2gsfwDIh3igr7Bk5Q4unEY9Gg8PGaUT+WZ?=
 =?us-ascii?Q?Kh3PW1z6UCxKEatTU2YhJXt0u6/E5XWEGCAwzTdPTeLz384mTE+ExaOuyfv+?=
 =?us-ascii?Q?BwRWUpN3pdBeF7OaYOFhBeBOM1DwGq5D1MlKPjNTDltbLpSch9pIZx+cQJsm?=
 =?us-ascii?Q?A4sND+I7btxyWReIinx7Jv3BRqw3wLJk52XQF/EpOl9vRBFQxhI1YZUJuFXv?=
 =?us-ascii?Q?uVAhmbUwBC1GWwRh/OibJmczpehHhuGmOAR41onvqiOhrzhLzPlxqXq0y6Eq?=
 =?us-ascii?Q?LQc3lSeHqT+cPAyW3ItluHRFRCsfzzGXS4ME6MVkJDx4WNTmEOvEMVgSn4f1?=
 =?us-ascii?Q?slgfLjtqCne6Io6GjlL6vsaz4Sjl60flLeBlRODo4UGrYmUwgb56eBBjH0P4?=
 =?us-ascii?Q?EYrAnw7zyEDIfCT53+laiyy1UCPiUuZ9/BBePWbdZP/NOC//acLpq/D9BCh+?=
 =?us-ascii?Q?chhOLNlRj8Ck72XTcCiGoYVcQ4PJghqcWTO5Y0NEEFiI7Vsq78eqyxGr0ZzF?=
 =?us-ascii?Q?aVeSbG5XvPTqYjsycBySwjjvJe3mJmOxHwEeO7LAnN6IQgp/Ow9tzvRGWGjx?=
 =?us-ascii?Q?2Jf3Ru8w5Lgd40MXNaXXurHqUYFGaW6bfrK1IFm6W+JLGx5PRuZwuom9AKGb?=
 =?us-ascii?Q?F7423KcI1JG5DmXiUkWbOuDmiICGS2EmZfhZPuEFdWcc3/hLxhajc3nAJnDi?=
 =?us-ascii?Q?AofB6kMIm0PuUpNhbsL4zCK/Ac4OtODcLEZaxsSBlRoxlvpOk2ZBkHGFflf2?=
 =?us-ascii?Q?SIESgJ9VTLDMCIyK/iOLmn9AjsDqjRudd5SloO3FUo/G75tuKBNrahwt1Z+C?=
 =?us-ascii?Q?SAGy8Q62lc8gT4cTzRE3tqIav5Dz8t5lA6BoeMGwHMoe/nhRQxnKN3Xt3659?=
 =?us-ascii?Q?la8nwGO3QD9/TLVH7s7ONQkFHDaDdIgGPmaLazSlHpmXPxgHNN46l6tlb1P8?=
 =?us-ascii?Q?0WY5Spr67ZUQxEYeLSwGRJelIN8DprNV9kQzqaq07Rre8yEukCr7bNCFflnF?=
 =?us-ascii?Q?FDyjDmdAlcE13B3ERJlMxn5W/lYFKhluJ8OTzEm4KlGf5mIf8ArQ3BRjYWlD?=
 =?us-ascii?Q?Bo3cs5d/S0lrRWfC66/eYH4OE0J1rx0cnisSaOmAaLWbGUjpiKk4jZfHhuiX?=
 =?us-ascii?Q?K5c0NoWt8OdlqTAXNdavT7P/SBc98CtnPJqn8o+CmGxbHdFdAaN4C44X5CC1?=
 =?us-ascii?Q?obziI5TvuefwvWvjd7sem54nI6f8vBR+BHvuCGMTlAyloeSQWtI1g0w5QewL?=
 =?us-ascii?Q?QCusVYaClhi55SohgI94AoeIP2DWwkzpxwmfvK9w++HWiBoB2cvQwfBYVb07?=
 =?us-ascii?Q?xpM15iLmVP6UhQ72yNazB3VK+uWgkd/gziB76vvsMAyUZeLfc9TciT/mSfJY?=
 =?us-ascii?Q?MzIjNjSADim1wuyn6Bf84BQLeAIV3/X/QS+ci15HZ28K0D6swmGuFihT8baf?=
 =?us-ascii?Q?wVsrfQj3JTZQrx6acM9Uuu9+9evfWG0dZMBjRhYzBVD8DkZ2PkU02Gnnt470?=
 =?us-ascii?Q?/+A9ZwRLvyLyWk7MHGhcHY2VfeZ4Av4p0VDGb0AnqiMRSEhKmtDnE0aFYlOd?=
 =?us-ascii?Q?x0PqMHgLawgVxfmsPsos/yK5WWXoot9K1kcVqJ40H+VoLYMqdPLs4etRb6Un?=
 =?us-ascii?Q?N+FBrAi38Q=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b147230-7207-4e6c-9906-08dec63dfda6
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 15:44:29.8994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ubGG8shG/XILmEBvcDgkriGt87H61seWvMCLtSF67nNG4r3E21Bxpbwd9mz94r8/esSxOBoveKKsYYGjn6THg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH7PR03MB7785
X-purgate-ID: tlsNG-42698a/1781019873-1B979F3B-A420759C/0/0
X-purgate-type: clean
X-purgate-size: 5961
X-Rspamd-Action: no action
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
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:ross.lagerwall@citrix.com,m:klampis@citrix.com,s:lists@lfdr.de];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid,citrix.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FROM_NEQ_ENVFROM(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B86C4661ECB

From: Ross Lagerwall <ross.lagerwall@citrix.com>

During kexec load a sha256 digest is calculated of all the kexec
segments combined. This digest is stored and verified again during kexec
execution.

This is a requirement for Secure Boot to ensure that kexec data has not
been tampered with or corrupted between signature verification and
actual execution.

Only kexec crash is supported. The segments for normal kexec are stored
in temporary buffers and moved to their intended destination during
execution. To calculate/verify the normal kexec data before relocation
would involve walking the relocation table to find every temporary
buffer which was out of scope for Secure Boot work.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
Signed-off-by: Kevin Lampis <klampis@citrix.com>

---
 xen/common/kexec.c       | 10 ++++
 xen/common/kimage.c      | 98 ++++++++++++++++++++++++++++++++++++++++
 xen/include/xen/kimage.h |  6 +++
 3 files changed, 114 insertions(+)

diff --git a/xen/common/kexec.c b/xen/common/kexec.c
index 65776a95fd..c920bc6d8a 100644
--- a/xen/common/kexec.c
+++ b/xen/common/kexec.c
@@ -383,6 +383,12 @@ void kexec_crash(enum crash_reason reason)
     if ( !test_bit(KEXEC_IMAGE_CRASH_BASE + pos, &kexec_flags) )
         return;
 
+    if ( kimage_verify_digest(kexec_image[KEXEC_IMAGE_CRASH_BASE + pos]) != 0 )
+    {
+        printk(XENLOG_ERR "kexec digest failed, won't boot corrupted image\n");
+        return;
+    }
+
     kexecing = true;
 
     if ( kexec_common_shutdown() != 0 )
@@ -1132,6 +1138,10 @@ static int kexec_load(XEN_GUEST_HANDLE_PARAM(void) uarg)
     if ( ret < 0 )
         goto error;
 
+    ret = kimage_calc_digest(kimage, kimage->digest);
+    if ( ret )
+        return ret;
+
     ret = kexec_load_slot(kimage);
     if ( ret < 0 )
         goto error;
diff --git a/xen/common/kimage.c b/xen/common/kimage.c
index 6202491f7e..018ef66451 100644
--- a/xen/common/kimage.c
+++ b/xen/common/kimage.c
@@ -20,9 +20,12 @@
 #include <xen/mm.h>
 #include <xen/kexec.h>
 #include <xen/kimage.h>
+#include <xen/sha2.h>
 
 #include <asm/page.h>
 
+#define KIMAGE_SHA256_REGIONS 16
+
 /*
  * When kexec transitions to the new kernel there is a one-to-one
  * mapping between physical and virtual addresses.  On processors
@@ -820,6 +823,101 @@ int kimage_alloc(struct kexec_image **rimage, uint8_t type, uint16_t arch,
     return result;
 }
 
+static int kimage_calc_one_digest(struct sha2_256_state *ctx,
+                                  xen_kexec_segment_t *segment)
+{
+    paddr_t dest;
+    unsigned long sbytes;
+    int ret = 0;
+
+    sbytes = segment->buf_size;
+    dest = segment->dest_maddr;
+
+    while ( sbytes )
+    {
+        unsigned long dest_mfn;
+        void *dest_va;
+        size_t schunk, dchunk;
+
+        dest_mfn = dest >> PAGE_SHIFT;
+
+        dchunk = PAGE_SIZE;
+        schunk = min(dchunk, sbytes);
+
+        dest_va = map_domain_page(_mfn(dest_mfn));
+        if ( !dest_va )
+            return -EINVAL;
+
+        sha2_256_update(ctx, dest_va, schunk);
+
+        unmap_domain_page(dest_va);
+        if ( ret )
+            return -EFAULT;
+
+        sbytes -= schunk;
+        dest += dchunk;
+    }
+    return 0;
+}
+
+int kimage_calc_digest(const struct kexec_image *image,
+                       uint8_t digest[SHA2_256_DIGEST_SIZE])
+{
+    int ret;
+    struct sha2_256_state ctx;
+    unsigned int s;
+
+    if ( image->type == KEXEC_TYPE_DEFAULT )
+    {
+        /* TODO implement digest calculation for normal kexec */
+        return 0;
+    }
+
+    if ( image->nr_segments > KIMAGE_SHA256_REGIONS )
+    {
+        dprintk(XENLOG_DEBUG, "More segments than allocated SHA256 regions\n");
+        return -E2BIG;
+    }
+
+
+    sha2_256_init(&ctx);
+
+    for ( s = 0; s < image->nr_segments; s++ ) {
+        ret = kimage_calc_one_digest(&ctx, &image->segments[s]);
+        if ( ret )
+            return ret;
+    }
+
+    sha2_256_final(&ctx, digest);
+    return 0;
+}
+
+int kimage_verify_digest(const struct kexec_image *image)
+{
+    uint8_t digest[SHA2_256_DIGEST_SIZE];
+    int ret;
+
+    if ( image->type == KEXEC_TYPE_DEFAULT )
+    {
+        /* TODO implement digest check for normal kexec */
+        return 0;
+    }
+
+    ret = kimage_calc_digest(image, digest);
+    if ( ret )
+        return ret;
+
+    if ( memcmp(digest, image->digest, sizeof(digest)) != 0 )
+    {
+        printk(XENLOG_ERR "kexec digest failed expected %*phN but got %*phN\n",
+               SHA2_256_DIGEST_SIZE, image->digest,
+               SHA2_256_DIGEST_SIZE, digest);
+        return 1;
+    }
+
+    return 0;
+}
+
 int kimage_load_segments(struct kexec_image *image)
 {
     int s;
diff --git a/xen/include/xen/kimage.h b/xen/include/xen/kimage.h
index fccba1d88d..ad52551ba2 100644
--- a/xen/include/xen/kimage.h
+++ b/xen/include/xen/kimage.h
@@ -11,6 +11,7 @@
 
 #include <xen/list.h>
 #include <xen/mm.h>
+#include <xen/sha2.h>
 #include <public/kexec.h>
 
 #define KEXEC_SEGMENT_MAX 16
@@ -37,6 +38,8 @@ struct kexec_image {
 
     /* Address of next control page to allocate for crash kernels. */
     paddr_t next_crash_page;
+
+    uint8_t digest[SHA2_256_DIGEST_SIZE];
 };
 
 int kimage_alloc(struct kexec_image **rimage, uint8_t type, uint16_t arch,
@@ -52,6 +55,9 @@ mfn_t kimage_entry_mfn(kimage_entry_t *entry, bool compat);
 unsigned long kimage_entry_ind(kimage_entry_t *entry, bool compat);
 int kimage_build_ind(struct kexec_image *image, mfn_t ind_mfn,
                      bool compat);
+int kimage_verify_digest(const struct kexec_image *image);
+int kimage_calc_digest(const struct kexec_image *image,
+                       uint8_t digest[SHA2_256_DIGEST_SIZE]);
 
 #endif /* __ASSEMBLER__ */
 
-- 
2.52.0


