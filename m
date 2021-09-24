Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C81E6416FAA
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 11:55:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195175.347755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mThvf-0007Qh-7g; Fri, 24 Sep 2021 09:55:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195175.347755; Fri, 24 Sep 2021 09:55:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mThvf-0007OW-4a; Fri, 24 Sep 2021 09:55:39 +0000
Received: by outflank-mailman (input) for mailman id 195175;
 Fri, 24 Sep 2021 09:55:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wINm=OO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mThvc-0007OH-Vq
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 09:55:37 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9004f430-1d1d-11ec-bab9-12813bfff9fa;
 Fri, 24 Sep 2021 09:55:35 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2056.outbound.protection.outlook.com [104.47.13.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-13-Rz5mZz5XPKqiIPn6C0XiNg-1; Fri, 24 Sep 2021 11:55:33 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7150.eurprd04.prod.outlook.com (2603:10a6:800:12a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Fri, 24 Sep
 2021 09:55:32 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 09:55:32 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0217.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1e::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 09:55:31 +0000
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
X-Inumbo-ID: 9004f430-1d1d-11ec-bab9-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632477334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D2c15IMrfJ+Hh7ordOiYcIR+2DVc7QDDbgHC4O7HA/g=;
	b=Of1loTSoRrJPTrwKq04oH2nGUBwxwhFM0ipKRL2heHTQIuyhx9D/T9PPlbZyn9yhx9FnqN
	uB5NPTvx1driPEEq6iq6UFFhuKXDegoiIlyGXFVwgvxUdvCI6/sjQktL+77xF2nWpvn52d
	xim7JpEc84Khy/8jvB5UlP7gJ/RuSFA=
X-MC-Unique: Rz5mZz5XPKqiIPn6C0XiNg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BxaTx3GFrtAKwrJKnIR+Ah53uUqoEyJGQ5behSh9i9e4hBnp8oGDlTjd8pw8JPGPPTs43bzeLjTv/UAGG88E5RwrYXWF4RFejOCz1vOoKzskK+YF7uESLalNevaOYgfJJ4CJubPlndizV3GFrtW26DqjXYIoKA/J7JdvWUNhSuKFjnmJaXfz1/o/+ZiRFEhmSK5AAfNbb16vk8PcrQreCjYPJgKCmrgrmxbziLmGlIwSC7pZ/5AWFBvozJ9BFPy3AE4gZXI6ahesLDYDNZnQsgqqGpcPze9DO/d8Z/G+owbkqDT8CzMTD+HCB3YWQ8mBKO5Z189MsUaN04M00xYUSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=D2c15IMrfJ+Hh7ordOiYcIR+2DVc7QDDbgHC4O7HA/g=;
 b=c3jKAKZpEMwp+ShSGw5fBGNYs9YMRiT1izHBcdKEQuUp/e4ZM949XdJogxWOlAhoXZMFCfLKAxGjjr01BGnqeXFwVTQJ9GSSiBEh4hWFB+FGLhtKCmJanr5tUv5pw61m+lID3dVcce8YURpNi27ldKWSFa5E8cY5KaVZB3OT6+dzxr0O3QM+HFxyw7tQqrTuQ5L0ZnVLBtNbMUiAA7Qv5Rb1gNVxPaDyk1cIg5srIyucIDUWIxYe6550fHyOVrWDfXhS222q3TtcbIlaHlFjhqlH7b50rBcvaZSYYOzC4A2VnHq0yuBW0gYTgR8E217pVimAXvoD7hAbBsVT4S2nhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v2 16/18] x86: introduce helper for recording degree of
 contiguity in page tables
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
Message-ID: <aab0b88b-7643-cc08-756b-0684f93be257@suse.com>
Date: Fri, 24 Sep 2021 11:55:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0217.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 104740b7-38b6-4852-81a1-08d97f417296
X-MS-TrafficTypeDiagnostic: VI1PR04MB7150:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB715029FD3ED2AD8F0DBDECFDB3A49@VI1PR04MB7150.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zQQ9DEqa2ac9nHxTqMsIrcm6Hw2+HBxew1sZ/tXGKKRt+G/cyHRhzJD0NYc0xExF2xUY1dknXJnq0ewFOIZVT9VLYR8ADJ1eKwJmPR8QznCyFRkpqJa962MutLSKA60xeTb9JbRMaClGGiYBukIrAfULFRPuYSWrQU2+sM8WZPyrnvMlhi2RuB76mitmxJQuyv4BnKrk2PiMkn71kcHvfCVNtsr/BYvXcIoigdF8Hgr3S9qmo7fx8/uUug1TXjLuzQF5dsZFSYsUo1vB/9QuD9yafLUIxs9pcYFmSJo7+nU+S7aBcossOD7ylbIaGgJ+3Q2xLOGHauavls4nPNcYSfzJjzxFifuMDocrcDp9W0c3RIwszTGZBoKe8ge3GqHadwtMyWHYZiafDy4a5ubATOfPOjlra/8S5cvsXR5nj+jlPfPNNQcytFuEwxB1s5AFha/c5bPLzXpkLgKP992WxsouEyfCS43dRALDDFHGtetqXrqHgMEIJa/oxDhQhFzvhbmKQJwxXMRTvXX1v6tlU24fi5g5OVkpOkZZH+ytQHNw1RVHfE8qRAUL2c9bd+kv/dg3Q6J7/6nqAAmgA2vXZHOZAQPCusZBvfckMTxs7F/HBXDNCG0tqC3hoHPsb8QRTbIHY8NVLqbJA5wvuE2X5E7mRZcPoLmEpUuEjcg6Afg9/O+MwGpZ9W/WSyiFHxSFaGqpjOTiolFBrmvxL8xvV4uaxUJZHkOrkwcinnQgOXw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(8936002)(5660300002)(2616005)(508600001)(31686004)(956004)(38100700002)(66476007)(66946007)(26005)(8676002)(66556008)(6916009)(2906002)(36756003)(86362001)(6486002)(16576012)(31696002)(83380400001)(4326008)(316002)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVhTNStJYmJIUVVQVWZLcnFmc21PMktYMktnZmxIM2Rsd0dLZVc3cTNQQUdl?=
 =?utf-8?B?Qm83djNKdzdRZzZyQ3c3NElYTWdWbzAxTEVWRGlmMnRFdkJ3RENwckpIVVhp?=
 =?utf-8?B?WjFEcXVnRnFBeE9rMDJKMURrTjVTc1F0UWdBbUxRdzc1Y3VTQi92QnE2UjNu?=
 =?utf-8?B?c2FkS0Q0L2x4Y2h4cTYwU05oL1dnZEVsZEEwVzJidStCdXBXY0lBRTkyZ3J6?=
 =?utf-8?B?c0wwOVIwSXhZWWlZbEtOZ0hyVTJqR3pOSnc5NW5kaEgrNHZjazFGZnhxeDdG?=
 =?utf-8?B?Sjg1SFZXMTdxYkNGS3FvNXBKRUJmL3NacGJaaWRHQk1lT3d6Y3hmMENaWElp?=
 =?utf-8?B?cDZiMG1PK0N0R1FYZms2MFphc0ZNWng2SEhQT1RIYlhCNTd5ZktDWlFsZklF?=
 =?utf-8?B?ZkYwYVRtRjdqZWxjdkZmNW1UdDZaaGRDNUlzdTdVdDR4K1B1RGx1K0x6c3Jq?=
 =?utf-8?B?VjZFaFY0QXozYjVtWHdkQ01ZVDdpb3ZFSHU3UUtxSG5vVlJpMXhDNWpBZXNG?=
 =?utf-8?B?U3NCbDVGcVpORmluWWNrTk5XS0VWOVlCOFRUWDRZc0c1ZlRpUGNieVJ4L3BC?=
 =?utf-8?B?cEh3cDFUeThEdFcyVjFibGh4SEErM2RMTG45U2RWU2V0THl4N3ZGVGZoZlc0?=
 =?utf-8?B?M1Nrd3U2YnRmdXpaYytsMTJwemp1YzJpdDVaN2VYSjAreGpacWZDdDQwckdC?=
 =?utf-8?B?dXdGdnZWN1Q1NVRSbFV5a3cxVVFobXRybjVCK0ZnWTB5M0RLdnBqSTFDNjhw?=
 =?utf-8?B?d2x6OTFYZ2RFTXNOR0NrNWlIYWJZTFRML1o4NDM0bVFTU1crc0hWV2J5SUZy?=
 =?utf-8?B?UGhJRGg2MFFmL0YzYkUwakpIUVhOTnVhblBLMVI2eHB4RXJnaTk5eWN5amgy?=
 =?utf-8?B?T1AxdWFMUHNXcmVKUzJtNHNqcmRDVkVVN3hqb1N3MEp3MC9YSVlML0E0RTJy?=
 =?utf-8?B?MVl4NkRJTVRwUVZpOUVJZ3VXOVErWXB5eksvWkt4Y2VlKy9BaWpvTks5TTFo?=
 =?utf-8?B?bmoyWUdjZlBYV1lyZ2lsY3poeGNidUxtRTRmWkFpNTd3S1NuRXEyTEFlRXQ4?=
 =?utf-8?B?cVZYck5qMXViK3J0TDhQS2ZNZmpDbyt2Zmo5aGVGZVZxY2xqNlh2Z0UrNGN2?=
 =?utf-8?B?MGk1TEVMUkNVQ0NwbDZKWXo2RDRyclBWUVhuVmpqblVaOTZyY2xCbjVaR2do?=
 =?utf-8?B?ZkhHOFl1Qll0Y0x6Nll2OVFBZHBtVzZMZGtZNUV6UGhWUm1oZlFVRWh4dy82?=
 =?utf-8?B?eGNjejVqSTJUSTFQMFlOMGk0LzJoWTRlN1Jna1dCU2VHMWR4TFl2bTVTZ0p3?=
 =?utf-8?B?V2ZMMXE4dlNkcTkyTDR1K3B4eWl6WnBIaHhya1kvUWVWU05HRVR2M05BWVJG?=
 =?utf-8?B?YjRoMVRaWnpOTEhMSWVoUld1cTVDTUZJdVI0VXRNNEF2cFNyeXRpcmRxWGpk?=
 =?utf-8?B?NVh3VUJpNWd1NUZoNnN4UmFDWjNua2Q3ZGZyY2tpNmZSTGlmVG1QNDBsQWJX?=
 =?utf-8?B?SDMvWUI1a2tWV1FYeDJvcFJGVEVIbm5JQUNjOUxGL3BzeGlJMmdzZFlBODB2?=
 =?utf-8?B?SVlReVpxcVlsSGtxdDJPekRLRU0ya1VOYnNJRTJSakdsa1V4cWpzWFJYblBn?=
 =?utf-8?B?WEdPOEQrQW1JclBpb1JTakc5cWxSK2JIaVdsSGx0LzVzbjQrV0haeEcrejBp?=
 =?utf-8?B?ZGxPK2x2RGtxVXRiSlFObUFLR0lCOWRZUlRVWWhVUzRoSlFyTlMvMXRwNEtK?=
 =?utf-8?Q?2vPsq2kdjeDTDnYZE9O9KsWHaZ9FkhSL7oR0UUu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 104740b7-38b6-4852-81a1-08d97f417296
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 09:55:32.2813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: la014zidY3Bd4wGrF+6awJep5bkaH4TaLcgf8knf3IT3lmuQhX/fBOmN/+Wf3k5mm/ZZWup71NowDFHBoTJ4FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7150

This is a re-usable helper (kind of a template) which gets introduced
without users so that the individual subsequent patches introducing such
users can get committed independently of one another.

See the comment at the top of the new file. To demonstrate the effect,
if a page table had just 16 entries, this would be the set of markers
for a page table with fully contiguous mappings:

index  0 1 2 3 4 5 6 7 8 9 A B C D E F
marker 4 0 1 0 2 0 1 0 3 0 1 0 2 0 1 0

"Contiguous" here means not only present entries with successively
increasing MFNs, each one suitably aligned for its slot, but also a
respective number of all non-present entries.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- /dev/null
+++ b/xen/include/asm-x86/contig-marker.h
@@ -0,0 +1,105 @@
+#ifndef __ASM_X86_CONTIG_MARKER_H
+#define __ASM_X86_CONTIG_MARKER_H
+
+/*
+ * Short of having function templates in C, the function defined below is
+ * intended to be used by multiple parties interested in recording the
+ * degree of contiguity in mappings by a single page table.
+ *
+ * Scheme: Every entry records the order of contiguous successive entries,
+ * up to the maximum order covered by that entry (which is the number of
+ * clear low bits in its index, with entry 0 being the exception using
+ * the base-2 logarithm of the number of entries in a single page table).
+ * While a few entries need touching upon update, knowing whether the
+ * table is fully contiguous (and can hence be replaced by a higher level
+ * leaf entry) is then possible by simply looking at entry 0's marker.
+ *
+ * Prereqs:
+ * - CONTIG_MASK needs to be #define-d, to a value having at least 4
+ *   contiguous bits (ignored by hardware), before including this file,
+ * - page tables to be passed here need to be initialized with correct
+ *   markers.
+ */
+
+#include <xen/bitops.h>
+#include <xen/lib.h>
+#include <xen/page-size.h>
+
+/* This is the same for all anticipated users, so doesn't need passing in. */
+#define CONTIG_LEVEL_SHIFT 9
+#define CONTIG_NR          (1 << CONTIG_LEVEL_SHIFT)
+
+#define GET_MARKER(e) MASK_EXTR(e, CONTIG_MASK)
+#define SET_MARKER(e, m) \
+    ((void)(e = ((e) & ~CONTIG_MASK) | MASK_INSR(m, CONTIG_MASK)))
+
+enum PTE_kind {
+    PTE_kind_null,
+    PTE_kind_leaf,
+    PTE_kind_table,
+};
+
+static bool update_contig_markers(uint64_t *pt, unsigned int idx,
+                                  unsigned int level, enum PTE_kind kind)
+{
+    unsigned int b, i = idx;
+    unsigned int shift = (level - 1) * CONTIG_LEVEL_SHIFT + PAGE_SHIFT;
+
+    ASSERT(idx < CONTIG_NR);
+    ASSERT(!(pt[idx] & CONTIG_MASK));
+
+    /* Step 1: Reduce markers in lower numbered entries. */
+    while ( i )
+    {
+        b = find_first_set_bit(i);
+        i &= ~(1U << b);
+        if ( GET_MARKER(pt[i]) > b )
+            SET_MARKER(pt[i], b);
+    }
+
+    /* An intermediate table is never contiguous with anything. */
+    if ( kind == PTE_kind_table )
+        return false;
+
+    /*
+     * Present entries need in sync index and address to be a candidate
+     * for being contiguous: What we're after is whether ultimately the
+     * intermediate table can be replaced by a superpage.
+     */
+    if ( kind != PTE_kind_null &&
+         idx != ((pt[idx] >> shift) & (CONTIG_NR - 1)) )
+        return false;
+
+    /* Step 2: Check higher numbered entries for contiguity. */
+    for ( b = 0; b < CONTIG_LEVEL_SHIFT && !(idx & (1U << b)); ++b )
+    {
+        i = idx | (1U << b);
+        if ( (kind == PTE_kind_leaf
+              ? ((pt[i] ^ pt[idx]) & ~CONTIG_MASK) != (1ULL << (b + shift))
+              : pt[i] & ~CONTIG_MASK) ||
+             GET_MARKER(pt[i]) != b )
+            break;
+    }
+
+    /* Step 3: Update markers in this and lower numbered entries. */
+    for ( ; SET_MARKER(pt[idx], b), b < CONTIG_LEVEL_SHIFT; ++b )
+    {
+        i = idx ^ (1U << b);
+        if ( (kind == PTE_kind_leaf
+              ? ((pt[i] ^ pt[idx]) & ~CONTIG_MASK) != (1ULL << (b + shift))
+              : pt[i] & ~CONTIG_MASK) ||
+             GET_MARKER(pt[i]) != b )
+            break;
+        idx &= ~(1U << b);
+    }
+
+    return b == CONTIG_LEVEL_SHIFT;
+}
+
+#undef SET_MARKER
+#undef GET_MARKER
+#undef CONTIG_NR
+#undef CONTIG_LEVEL_SHIFT
+#undef CONTIG_MASK
+
+#endif /* __ASM_X86_CONTIG_MARKER_H */


