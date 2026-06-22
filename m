Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Cu6zLx1SOWpCqgcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 17:17:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AADF6B0A71
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 17:17:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b="f/GtDI3s";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1343891.1603134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbgP3-0005hf-PX; Mon, 22 Jun 2026 15:17:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1343891.1603134; Mon, 22 Jun 2026 15:17:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbgP3-0005g5-JG; Mon, 22 Jun 2026 15:17:37 +0000
Received: by outflank-mailman (input) for mailman id 1343891;
 Mon, 22 Jun 2026 15:17:36 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1wbgP2-0005cp-Ji
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 15:17:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wbgP2-0052oN-0K
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 17:17:36 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6a39520d-2eae-0a2a0a5409dd-0a2a450bcafe-12
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 17:17:35 +0200
Received: from [52.101.53.45]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6a39520e-5e53-0a2a450b0019-3465352ddf2d-3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 17:17:35 +0200
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by PH9PR03MB649383.namprd03.prod.outlook.com (2603:10b6:510:3e7::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Mon, 22 Jun
 2026 15:17:33 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 15:17:33 +0000
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
 b=TTF6kwwvRVX1Xy2dtL9LJ/R/8w5YhbWUyYtQ81S8TYgaKpGkmExAhjxrTeWba8eTFxUJdchAMXmwypXs0NPwEb8ei3YJXUJtiVOZ46L2xUrFe52YE3YoshO7Px0aCnPSjgNYzif8hYH7fFSPLHXgpC9s0uGG6H6n1Rf1jCVWkEP+BKmNevUJWYk4PggtZf2V67cMk+oK6ZpsSEKQXAU0Aqqa7WuHNDR8Drj/2IuTLjvo+/5SyMcDtNCzDKFcWEn7rQAoGFGpougtodWVSVyWJ4M+LZl73s3DOV80C9+m1p1REaFZl2ZnlZiUbEekIz/Di0ICtdihno0jiGijRaQ3cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TAZqxPDz4iGQDAm8r7PVY0zk34ELEqip4hG1SLppqVU=;
 b=LTkZgBXAxpW4jT1PQ1g/pZTJQbIPgQxXL70xnPM87zq/R4QB4/aDwM1XBP0OQ5YRYutiQOhKn1SjxzgA6m/HPP3Ax3sZmXpAQOR9LuBlc+lMlgHWaF8817nLzszFq3190xYQ7aIW4i16FVq5CkVcXA4Gyrdqdj69JXLUwEyih3mrCDsO+lO85tXxR25+T/gxAlJm1hxXrBzAsUsziV65Y+vAJ1anBROAhvdjU6p0L9wrfW8LTKRKZKLQX3sn7G9ANZO8VRPbBqJAw2kohASNZYGsE7r/wY2HpYCsy50Nez6WIwtDgXPLrSVgfWVPdBBZn6tiL5HPCzgSv1sTc2E6dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TAZqxPDz4iGQDAm8r7PVY0zk34ELEqip4hG1SLppqVU=;
 b=f/GtDI3sypzSj7z9MZLdpCcgjIvg1EpfOgR08Eh8JwChspNIis1+zBdpuCf71cvXTQ1IstmiB5jXPIimKNnGM8f7gs30AoyXQd5SRR/AvO0yrT3DHoNgyijU85lYAlHKAQmyTTXqWsKdLOu4838ZQGD9UigshSs3vto2TUc3XuI=
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	ross.lagerwall@citrix.com,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH v2 4/7] x86/kexec: Support non-page-aligned kexec segments
Date: Mon, 22 Jun 2026 16:18:30 +0100
Message-ID: <20260622151833.3397692-5-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260622151833.3397692-1-kevin.lampis@citrix.com>
References: <20260622151833.3397692-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0025.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::10) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|PH9PR03MB649383:EE_
X-MS-Office365-Filtering-Correlation-Id: 0763b7bb-dab6-4a24-efb3-08ded071625d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|22082099003|18002099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	xF7qmQiiPe7r4JZc2Sq+/nSkW+Fd8GcQeBKvmdOHCwLnjI8O8xZEzoyj8s7xbIAhKnMt5Jx4MaDtdP5ZIxdMMbsPiaud3YuQCOTIsDfvA4CHHL4nNjvFMfY9yyIdO1S1nOtbXbgZAkgRpCeTI7QYfVay6hSPVFFgSa62rT1j03xZu5tTAkf4+ROEbdKJEODN4a6gVNUvXhqilO1vTtsFefGIYj90ZsCxMHMu5drtLOr7Zg9l4tMrH10begAIDDsHy1nbD9ZKdyV0TRe5OC/jEMW+hpkMFjW3YJzHJLZuWYjyv7EwYsFVZhHpVcS2DOIQnTNqPRQ2rP+7Ff6QPQcCsDfKCB6utHVzr62y/4xW2cWLM0QCfV/XO0wQVHLIqmjvfzstZW2Z3wqcjZOPBr1LFiG1ji+zRhJbCuqZuDQuIq/+Wg9BeVY47vdL73L55w8G6gD4He8rF9ZpvLYpLBK1ZL8e8u6SQQhnJBZwCTKYwXAHCh2Zt/YJ7f1rHK/0OoYolufSmDzepU+KhvgxVfVCfVPlUeQ8OHN8NoN34x9iMmvd6F42vrnD071wjyXGMpIlOyn+/+S3VRC03C80poqClKvG+3FK5XZEcTg6tNHGrZHJoMeerL+ufrX84T4wI5mcNkBM2h0AnQIVVIgvbEkOy20971Sjs3J9fhwroslu2ck=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OLIaO20Y7VURev+VXZKwWuFencdeZ08fkct9v+HovPPOXxsI5+uhE+ZqUYdo?=
 =?us-ascii?Q?XPN5P2vmfSfWj9YmoBRDc/3YlG7zkd5C+2Vx2erUKLcTDJihXuVgmt7iL+mL?=
 =?us-ascii?Q?rLvTJnyKyEdd+GsYx0KEKrLR7o2zC52AKfiR2kIXjUMQTHUKKCGFcujjYVue?=
 =?us-ascii?Q?VOtoEyerAJfGbqDsMnudLqCHVwuBx+fQj7Whrd0/rjSVXmmSzLsK3/lobcaZ?=
 =?us-ascii?Q?AeSXl9krUJ+IfvRVggJNdVo7NeOv5H2Cqowg/F+UJooCxTYwEjpnCmce/nCX?=
 =?us-ascii?Q?KIDJQhmkrGU8eGuh217ExdAOVyoPiKYg5H2LLeqRVPv2fg5FMEr8Vrlx98mA?=
 =?us-ascii?Q?2fDfBPwpbrpMqxJ/yfNf+gkdg+uSEV7efdqZnfVbUVEL78ECAHoOsWfD7Grg?=
 =?us-ascii?Q?q3axiwwM98c1u1sR1is/LvDKIoyiM5TO+vg9E7AWz5McyoLNAl2jtB3J58ye?=
 =?us-ascii?Q?VXk03CR+Iy807cIpJg4pj99jBW+dKIr+IpXsUl3AIq/kHEZ7I17IBQuylp+o?=
 =?us-ascii?Q?08biu9wtRZZxmhAMILW5AEAeCMpOPRrJiA2QOlmQhC9Chzp+gjtQ3H/2mcCR?=
 =?us-ascii?Q?DE3wlxRDgp4cwerarN+TAMmMUW3ObPjZQZjntChsRnSRRqTLOTiWC6dqKGl2?=
 =?us-ascii?Q?1qzmEEBs3lPsuhTCUEB8in9WtrMdrbmysJwZ7q6X3ocyzne/FiR4ERZL0TSg?=
 =?us-ascii?Q?3tMA6iWG5URsW2m0WpwrOCFUvbGqgEz3zaIDzlgOO/htUcMVO77VhT4gi+8d?=
 =?us-ascii?Q?ozr8j5FqQc5PiAl3valyFWUNudAtnRaBQcWMa2DQxTaX4VLWQw+5InaHL3fJ?=
 =?us-ascii?Q?1l/qTPd5I07mbhW6M5K+NZ17632R9ypvWQjcKgx9XEl21erwjDSx/A7iOJrm?=
 =?us-ascii?Q?jFbt9Xy268MoN9m0LRXr8/UkGir8bY3tGi8WzQUQ+/rq7hfRO/Y7wBwy3e+K?=
 =?us-ascii?Q?dmliA6Pg3JyI/2Kj+D9FyE12CxNtykwTkcL4rBoUbz1wnWO/3GsDu9cy7zH1?=
 =?us-ascii?Q?2sX3Qi0y0d2O9i3j2/uuhMJ0emdJOwqc3o7Si54PJgWNVciTanRIcKdR+u7i?=
 =?us-ascii?Q?JeXVS6fenh39cT3vO/5P/lDPhpO3eM9E1yFPawktsGEQIKXcvVI4k/eXupHi?=
 =?us-ascii?Q?s9GtHSRQ20I4Je19JkCb4QegONus9oigv+/L25n8i7/jmpxDwPbLSm9oiEyp?=
 =?us-ascii?Q?4Sq2tUH78jY54evPXZ03bVIdzPPolfWdidhFwyCp+horcH/WLiVUNVBMIiTM?=
 =?us-ascii?Q?1ERVzRhmDm8SK4ao9HQ4bvEMqIKwCxCwjPanPB2S/ZnyVPZep0Cr07RbCLDE?=
 =?us-ascii?Q?+ZE7B67ZjO8VYWEBgYg3a9HK9vu5x5GFrQreNzzVJigaqnxLcU1EBBBAS61w?=
 =?us-ascii?Q?d/L+p1wyHmVyv0vPWd/o9ZRGMGTmLeKI8qiQlNV5M1lQXh4/rtIuEEIarfb2?=
 =?us-ascii?Q?oCi0PDCT2BRyIekg++vOX/NZ25oKeR/sdb7lPf0ZD+N2/5Q+kC8WLMiQMXc5?=
 =?us-ascii?Q?sF8FT/KhLSfDduhHJTAoUsGYEvHQGudUOyglgE8fBtPYfZNBUYxFlcLIl43z?=
 =?us-ascii?Q?qTfOzyBiy1mjILYF05OEXcUzEaJiJKAbmLRm5yga6NS+iD1ZTcyv111XmSBn?=
 =?us-ascii?Q?iYxEV+m7yLhCoKxnxfo/bjEJOQiKh6XYWwKkLFgA1sNxE2tsNcyN3zg33XF6?=
 =?us-ascii?Q?w0Kep7ntFB75SPMyGybrR+oz+ITd4vXzLjacQOCta+d2ArJXBP3RiXBRCI2c?=
 =?us-ascii?Q?5391O/IgCg=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0763b7bb-dab6-4a24-efb3-08ded071625d
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 15:17:33.4391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L8DkWHhFz41AVaTKWGzxdj1Q3u7cCFx3OYi0wz8/njPdir9Wy0VKkiYJ/M3/RgiCW+nJV+fBzWMBr+ZSZG46cQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR03MB649383
X-purgate-ID: tlsNG-42698a/1782141455-457FD00E-1ECFEA67/0/0
X-purgate-type: clean
X-purgate-size: 4633
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:ross.lagerwall@citrix.com,m:kevin.lampis@citrix.com,s:lists@lfdr.de];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
X-Rspamd-Queue-Id: 6AADF6B0A71

From: Ross Lagerwall <ross.lagerwall@citrix.com>

With Secure Boot, userspace passes in the entire kernel loaded for
verification purposes. However, the kernel's startup32 function needs to
be aligned (e.g. to 16 MiB) and this results in the start of the segment
not being page-aligned (depending on where the startup32 function lands
in the kernel binary). Relax this restriction in Xen to support this
use case.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
---
Changes in v2:
- Remove error handling around map_domain_page because it doesn't fail
---
 xen/common/kimage.c      | 47 +++++++++++++++++++++++++++++++---------
 xen/include/xen/kimage.h |  1 +
 2 files changed, 38 insertions(+), 10 deletions(-)

diff --git a/xen/common/kimage.c b/xen/common/kimage.c
index dc47306223..d4a695a2bd 100644
--- a/xen/common/kimage.c
+++ b/xen/common/kimage.c
@@ -725,12 +725,14 @@ static int kimage_load_crash_segment(struct kexec_image *image,
      */
     paddr_t dest;
     unsigned long sbytes, dbytes;
+    unsigned int dest_offset;
     int ret = 0;
     unsigned long src_offset = 0;
 
     sbytes = segment->buf_size;
     dbytes = segment->dest_size;
     dest = segment->dest_maddr;
+    dest_offset = segment->dest_offset;
 
     while ( dbytes )
     {
@@ -740,24 +742,26 @@ static int kimage_load_crash_segment(struct kexec_image *image,
 
         dest_mfn = dest >> PAGE_SHIFT;
 
-        dchunk = PAGE_SIZE;
+        dchunk = PAGE_SIZE - dest_offset;
         schunk = min(dchunk, sbytes);
 
         dest_va = map_domain_page(_mfn(dest_mfn));
-        if ( !dest_va )
-            return -EINVAL;
 
-        ret = copy_from_guest_offset(dest_va, segment->h, src_offset, schunk);
-        memset(dest_va + schunk, 0, dchunk - schunk);
+        if ( dest_offset )
+            memset(dest_va, 0, dest_offset);
+        ret = copy_from_guest_offset(dest_va + dest_offset, segment->h,
+                                     src_offset, schunk);
+        memset(dest_va + dest_offset + schunk, 0, dchunk - schunk);
 
         unmap_domain_page(dest_va);
         if ( ret )
             return -EFAULT;
 
-        dbytes -= dchunk;
+        dbytes -= dchunk + dest_offset;
         sbytes -= schunk;
-        dest += dchunk;
+        dest += dchunk + dest_offset;
         src_offset += schunk;
+        dest_offset = 0;
     }
 
     return 0;
@@ -798,6 +802,26 @@ int kimage_alloc(struct kexec_image **rimage, uint8_t type, uint16_t arch,
                  uint32_t nr_segments, struct kimage_segment *segment)
 {
     int result;
+    unsigned int i;
+
+    for ( i = 0; i < nr_segments; i++ )
+    {
+        paddr_t mend;
+
+        /*
+         * Stash the destination offset-in-page for use when copying the
+         * buffer later.
+         */
+        segment[i].dest_offset = PAGE_OFFSET(segment[i].dest_maddr);
+
+        /*
+         * Align down the start address to page size and align up the end
+         * address to page size.
+         */
+        mend = segment[i].dest_maddr + segment[i].dest_size;
+        segment[i].dest_maddr &= PAGE_MASK;
+        segment[i].dest_size = ROUNDUP(mend, PAGE_SIZE) - segment[i].dest_maddr;
+    }
 
     switch( type )
     {
@@ -824,9 +848,11 @@ static void kimage_calc_one_digest(struct sha2_256_state *ctx,
 {
     paddr_t dest;
     unsigned long sbytes;
+    unsigned int dest_offset;
 
     sbytes = segment->buf_size;
     dest = segment->dest_maddr;
+    dest_offset = segment->dest_offset;
 
     while ( sbytes )
     {
@@ -836,15 +862,16 @@ static void kimage_calc_one_digest(struct sha2_256_state *ctx,
 
         dest_mfn = dest >> PAGE_SHIFT;
 
-        dchunk = PAGE_SIZE;
+        dchunk = PAGE_SIZE - dest_offset;
         schunk = min(dchunk, sbytes);
 
         dest_va = map_domain_page(_mfn(dest_mfn));
-        sha2_256_update(ctx, dest_va, schunk);
+        sha2_256_update(ctx, dest_va + dest_offset, schunk);
         unmap_domain_page(dest_va);
 
         sbytes -= schunk;
-        dest += dchunk;
+        dest += dchunk + dest_offset;
+        dest_offset = 0;
     }
 }
 
diff --git a/xen/include/xen/kimage.h b/xen/include/xen/kimage.h
index 0841b6f321..86250f2939 100644
--- a/xen/include/xen/kimage.h
+++ b/xen/include/xen/kimage.h
@@ -23,6 +23,7 @@ struct kimage_segment {
     uint64_t buf_size;
     uint64_t dest_maddr;
     uint64_t dest_size;
+    unsigned int dest_offset;
 };
 
 struct kexec_image {
-- 
2.52.0


