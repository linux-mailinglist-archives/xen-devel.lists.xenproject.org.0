Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lV33JgY1KGqdAAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 17:45:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BE5661EDC
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 17:45:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=r7jTj0W8;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1333579.1596695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWydS-0000fL-KI; Tue, 09 Jun 2026 15:45:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1333579.1596695; Tue, 09 Jun 2026 15:45:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWydS-0000cV-Gx; Tue, 09 Jun 2026 15:45:02 +0000
Received: by outflank-mailman (input) for mailman id 1333579;
 Tue, 09 Jun 2026 15:45:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1wWydR-0000bC-6t
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 15:45:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWydQ-004xC6-JY
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 17:45:00 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6a2834df-e002-0a2a0a5209dd-0a2a450bb8ae-46
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 17:45:00 +0200
Received: from [40.93.195.55]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6a2834fb-212f-0a2a450b0019-285dc3379d98-3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 17:45:00 +0200
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by CH7PR03MB7785.namprd03.prod.outlook.com (2603:10b6:610:24f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 15:44:57 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0113.011; Tue, 9 Jun 2026
 15:44:57 +0000
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
 b=wh3BO/RvxfgtaqUYyuMfTwUyvez2TlxN4fOrd41bGFDS9mVH68D31FxHeizRAiS3nR5ycNDKamNPYLOfeAnBAapX9GUds5lsiWqLO5cDiYz2kkVMUeQAwySD6LTMOohc8U9bdnRJbVkNi8CaF24B+y1A9m9YL+LmBS5/KicWrmcz/SGm6GvRcuChZ0jxiniWfp+nOubLJS/8WYTKuhem6v8Sv4jz1vVzQQaS8I+hRetBD1A1T9G32P5DgW8DLqt/SUKNVf/6JVtSZNRW7NKQQWI8UYKK/VXhuSu4XcqORioFWhZCA8N8QLpVjgpKApAVwPh9Y2rNbG+8eD7fu55QNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XAGW0A7SKMny7hlVxWXRmaflj5yybevs1GYDnoI4BUI=;
 b=y8kzUuyNc9qWcLu8yUQwiPa3cCmGwuqOK5HrbQNQ2PFNrX0coV64L5YL3anKhlyo7OSgdBdFqDYG98+ErbwEqJ/GfNIZr4BHHknZGjyBooONiAVCf9R+7p29IAWZqZpY5zOUkvOg4aUPFP6tT4Wxtjp45nnMErDRURJH7p6TFEcBE+9l7DVHISowZ/mmogAeWukUj7nH9ZqpfLmIlTKBFr9zObSzjDqMrh4mwz0UB4JazA4zUYRntAIkVyQnI4M0O92g/CUWaJEwnKJYPPyhNqPqcN9V1iaeSSnGvIQ2KOEj7hESha8wjswyhMKoUAfMEO9sd8gzVukXxZNCic6i+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XAGW0A7SKMny7hlVxWXRmaflj5yybevs1GYDnoI4BUI=;
 b=r7jTj0W8QYaySonCdnVZKUfsUYjhRIuLxc2xrh8g9Fxbm0vvWnnbEYFsAO/Nv9XvpCIXcrhtUkgtA/1UoW1wXUiWHMD8AdWNJbMS0Jpo5DB4RpuSEjMAHix9KgsDCZg25pNui5kQcPw7DXZM2RizLroD3A+OXsVCn/oRT3X6QSI=
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Kevin Lampis <klampis@citrix.com>
Subject: [PATCH 4/7] x86/kexec: Support non-page-aligned kexec segments
Date: Tue,  9 Jun 2026 16:45:15 +0100
Message-ID: <20260609154518.779757-5-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260609154518.779757-1-kevin.lampis@citrix.com>
References: <20260609154518.779757-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0378.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::23) To DS1PR03MB7992.namprd03.prod.outlook.com
 (2603:10b6:8:21b::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|CH7PR03MB7785:EE_
X-MS-Office365-Filtering-Correlation-Id: a96c737d-bffd-4c40-bcda-08dec63e0e74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	ACwPLqAQF5rodZaMuSElq0BwCLn6oTQsp1XdbpIQIt1kmXBd+ToTX2aytvntae2pmZ6h1l84gwsw7LV70OHjzNCTPY6FVIcuv0x3AfInkbtCGqIE0we4RGjiEnq/fDzVyTZ59T7JSKnCoeV4uHOyL+oaEHHAsOsC4NhG0kmuEfa4HSRi0yt3qt669aQM1ZAkOX4REc4p00Oss0RujlyMpq63TK1z38QbIpS23MGKm/90nFDauCIn4bCGvZgOkjDjo6k6oxFroCdYzC5CY40NHQdCMzhmmfvbm3VU1rHRpUkC8GCg4H1zfwp3AobJYVgfOZrlyAjKHSnZL9arL+2/SyoXJ0EPnXvFIB/TOZ9UQqCe0pWDTP+QugLVViIeX1I102vBokhijqQrATRITO6rTgoEVN2S+si3M/i5q1cc5rw4Fy1sCPx9ICAR6fWwvbbm7MdYHldcngJV10gx9wfg+Hf1izlI8rVfxuf9OkqpPOUIdKukF8GafDcHLXnqsqUKzX9rBRN/ZjtnA/rwvLByJVzkcVwJlmXYyp3zLKMpiWnaE/V8KM7FO6eKNBvg5IJLFTibdia1vUK7KgnEk030GG2pt4AIwSXJZvyEhG3fgbr1gtZy7Cw54vR07FMUYCIDsdEGG4y8b39fJpZifropLYgshcQuJeplw3rT2M7cwyaDVlpVycbPhBqDOHgt+0DT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tEEYCe4K7ALWbVVqWDSQW0gelbQnuD9h6OlD7QotieQBj66+ncZqQXkLWQZ5?=
 =?us-ascii?Q?G6maYFmhbYjkKPPFayeXJEEPp1eNXz7tF/RBc+ZoKDiQXrNXDWLgUAG30cmT?=
 =?us-ascii?Q?xzzHKaQYTG50HqK/gklRwkrba6JCfU94j/nzZxewLVoN3qkCrElhF56TwO7A?=
 =?us-ascii?Q?nyHEDMCcW6Db4l8FuASaE0S1qFxAadkix8tuFQJhaxXLT/Qm2M5ZhhJVLLxN?=
 =?us-ascii?Q?Uj/XNQ1B2L7wR7ZjsfZC6oxYYGTc4cWaIDkgcGgPocAYUieRATl89/M54lRd?=
 =?us-ascii?Q?N9200XjVqd1cG8HhWJ8yVa+COBQu54YWNqBpGA4i5OJe1R+Nk8A8lUHH3nWM?=
 =?us-ascii?Q?pKOcqnGdSgJOXcLOfJgjih/hjQrNSQAwL7e7gHCBlEENN5m5XBFNFCRQS2Eu?=
 =?us-ascii?Q?UBUkvDYDZMhI7pFeYOnS6SLsWmayIQWskIHxiPnoxADkwCB7OZyhpwG1e9zT?=
 =?us-ascii?Q?BXStd2dFi2oG+WPWTRT9UBaEtXV9C+qegWgsTm7KtYIrsujTdh0wWhIZRrtm?=
 =?us-ascii?Q?RELjYcJA21+/YOtkDly0y3e6kiGtweGMEUzimZqYR7hvVXyJVmm+9WCLbGRS?=
 =?us-ascii?Q?3mO4zN3zCkztP4Ea/KOqn4gye00Bl/Ln+VyXHf5lOwVL1PEs9WeNEWPTgbTu?=
 =?us-ascii?Q?Y5ocSelC2YxRMGIeXnDkdYw1pwG8DNfpOhVVTBnibhVAnYoW+jezmq0xQvSn?=
 =?us-ascii?Q?FmLr3M09K5f7jGEzD0doof2+OzqvooxoVYOzYmnxsPXfD3mP/t5q2YdOh84q?=
 =?us-ascii?Q?5DfmxKRstf2A4bcOE06R1shYPk6jxFlNOm+JR8slHZTQOSXjeASkZTcS0gQ/?=
 =?us-ascii?Q?Jy/Z+3Xobh6LLdlJ+Q+Ysc+cUToi93mVNOE5ozPr50tftqfPGwo6eUOPaXoi?=
 =?us-ascii?Q?s4aefRxOFCw5pArsdK76Ihag2wUXi8y4nD7BmOAMb+E94tM0lQ8KWs5fTKfG?=
 =?us-ascii?Q?feer93UnCAAzya9/oATF0m2aNhQDYevoqsEr75J1/wNA0jF2a6OAZ0VtqRWk?=
 =?us-ascii?Q?hueeZLbkyqfxgTPPk5crhlqdWZmgeR+iRn+AKqEH7FlsJOHlRN2LWM3i2vSt?=
 =?us-ascii?Q?Ihgf6ukpAPdjozcHfOyEN8BvDGNWgDL/eMNT+mZxIDxuh1AyTGmjNp3uOCQL?=
 =?us-ascii?Q?MwMkyFEcbduEbitq9LCNGX+BArQ98fHEKTqIijbar8q1FEvllXYw8J03xgqa?=
 =?us-ascii?Q?RD3YMfV0+Rapo+/LdYlhhmpgpPsYzLv6DVi5VL33ViXtn6Lf7RiNz9njAi3y?=
 =?us-ascii?Q?Up/TZWNzaufN1XPDPJfu18L0ySIfsUQj3PVUZH5Tl7AlyOWkMsZHeky3r0uN?=
 =?us-ascii?Q?ti/auDu6C+3ld/fp+rczkqOlrzaovGSfoQ2AfdRsQU4oLtXp9qpyVuqIqbVu?=
 =?us-ascii?Q?wEbEsE7Iacm/EwghV1hEbYzIdAC5/1K42TlK2rmw8zYCCJVwZuw7UUg0a3m4?=
 =?us-ascii?Q?H98o+RSZCtgYKfOZDuBDtssa1mzZESH+N22bQ0AZD7ovi8g4cYi29bcJQotO?=
 =?us-ascii?Q?9+qXtcE8eZhSvd9zmx/hIshrXT5kzdOg9S8Hb898ARtuaLiBjwmkp1Lxbszq?=
 =?us-ascii?Q?1JL1JwMIG+rXq6QHnBZBmvzxsYY69EIzHTD4iXngTkQwq9MhBMS6Lh6i8jwo?=
 =?us-ascii?Q?WbuYPUeG/uDxhslNDidPi07KUYLoyaL7aCKQxwXWJcV2BIRgt3v8pxOKXVCd?=
 =?us-ascii?Q?wlS8pXy+bd04PeCc++HKU41JtSNNSGzV7rehM1fvOzFsu2qRTWNtsH+1RElW?=
 =?us-ascii?Q?gPASEBuJUQ=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a96c737d-bffd-4c40-bcda-08dec63e0e74
X-MS-Exchange-CrossTenant-AuthSource: DS1PR03MB7992.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 15:44:57.2045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6p/pRz/HzLgdLEtqnu5YCbXXgdqqUooncP1wKJG3q9u6Bo0FQnBwZpN5+hDCGMErmkVrfgq8b9IMsFzY1FoNUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH7PR03MB7785
X-purgate-ID: tlsNG-42698a/1781019900-1956BF3B-727081C1/0/0
X-purgate-type: clean
X-purgate-size: 3559
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
X-Rspamd-Queue-Id: 29BE5661EDC

From: Ross Lagerwall <ross.lagerwall@citrix.com>

With Secure Boot, userspace passes in the entire kernel loaded for verification
purposes. However, the kernel's startup32 function needs to be aligned (e.g. to
16 MiB) and this results in the start of the segment not being page-aligned
(depending on where the startup32 function lands in the kernel binary). Relax
this restriction in Xen to support this use case.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
Signed-off-by: Kevin Lampis <klampis@citrix.com>

---
 xen/common/kimage.c      | 34 ++++++++++++++++++++++++++++++----
 xen/include/xen/kimage.h |  1 +
 2 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/xen/common/kimage.c b/xen/common/kimage.c
index 2c3fd3c3b0..1d872916b9 100644
--- a/xen/common/kimage.c
+++ b/xen/common/kimage.c
@@ -730,12 +730,14 @@ static int kimage_load_crash_segment(struct kexec_image *image,
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
@@ -745,24 +747,28 @@ static int kimage_load_crash_segment(struct kexec_image *image,
 
         dest_mfn = dest >> PAGE_SHIFT;
 
-        dchunk = PAGE_SIZE;
+        dchunk = PAGE_SIZE - dest_offset;
         schunk = min(dchunk, sbytes);
 
         dest_va = map_domain_page(_mfn(dest_mfn));
         if ( !dest_va )
             return -EINVAL;
 
-        ret = copy_from_guest_offset(dest_va, segment->buf.h, src_offset, schunk);
+        if ( dest_offset )
+            memset(dest_va, 0, dest_offset);
+        ret = copy_from_guest_offset(dest_va + dest_offset, segment->buf.h,
+                                     src_offset, schunk);
         memset(dest_va + schunk, 0, dchunk - schunk);
 
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
@@ -803,6 +809,26 @@ int kimage_alloc(struct kexec_image **rimage, uint8_t type, uint16_t arch,
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
diff --git a/xen/include/xen/kimage.h b/xen/include/xen/kimage.h
index 258349d774..aab8707cac 100644
--- a/xen/include/xen/kimage.h
+++ b/xen/include/xen/kimage.h
@@ -26,6 +26,7 @@ struct kimage_segment {
     uint64_t buf_size;
     uint64_t dest_maddr;
     uint64_t dest_size;
+    unsigned int dest_offset;
 };
 
 struct kexec_image {
-- 
2.52.0


