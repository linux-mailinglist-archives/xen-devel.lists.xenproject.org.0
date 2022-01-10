Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 910C3489DA8
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jan 2022 17:35:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255479.437804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6xdw-00051a-Rb; Mon, 10 Jan 2022 16:35:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255479.437804; Mon, 10 Jan 2022 16:35:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6xdw-0004z2-OP; Mon, 10 Jan 2022 16:35:36 +0000
Received: by outflank-mailman (input) for mailman id 255479;
 Mon, 10 Jan 2022 16:35:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GSA=R2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n6xdv-0004yp-8c
 for xen-devel@lists.xenproject.org; Mon, 10 Jan 2022 16:35:35 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 553dfe1d-7233-11ec-81c1-a30af7de8005;
 Mon, 10 Jan 2022 17:35:34 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-16-3WZDW2p_PE6K3Ic3v7hpsQ-1; Mon, 10 Jan 2022 17:35:33 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6477.eurprd04.prod.outlook.com (2603:10a6:803:11e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Mon, 10 Jan
 2022 16:35:32 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.011; Mon, 10 Jan 2022
 16:35:32 +0000
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
X-Inumbo-ID: 553dfe1d-7233-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641832534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R8DiCPGmZfdIitLCnmZ7S3mCQH5fBWGDgn8DzVJxrZM=;
	b=YpGjlxzZz+b6lbOVZlZ1QemRVaHbroYw/pGlCFdBLzNc9nYg7Q3Y8xR+r8lcfkcVuTnQNe
	40Gtj6ykOtymaqi7i/clUfrBe1ElnPHx3wW/9TRaQ6laRJOcL6F7c1+ATenX92JMn+uurQ
	ltxD5nGp4beRC/13LOw5vzsXIeXkXRA=
X-MC-Unique: 3WZDW2p_PE6K3Ic3v7hpsQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dtgH5oisWfDJDDNrzURF/R6FlGlO9Irl8OYbZLCORSNbf+tgYP5xeIzLWnq/e7A1s0UZDqmZxOefVsHslomfLylJA7IotN+kbpqohSwX5C5OVs9z34HJG3TSfUg0X7FIkL3zCEMBSMsh/wyXLUXC8yw0MZKYWQfTabVO0t5PtM95CehQwsoMi3/LB7NLIAR1EJUcfibirSvnJrJI5RohZ+exGTVsib45bMJCBJgwH45qbBsCgyOrAJx1fI34wjyY+pNA28SpdZvO+vcNVzDPtKiCJVyxm9zuV4bgQG216ZmxQq9wamK461a84MR7Pk33Px0Fp1gE8UUVSQCND4fRLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R8DiCPGmZfdIitLCnmZ7S3mCQH5fBWGDgn8DzVJxrZM=;
 b=FbGiYi6bm5eCAAzq783mMT+HVIEdn3Jprf+bUlD+lm9BPShzFtpSzWPVH+U0b8am/uQ9H7czFJjz/tLHPJqxH7rqAsZ9qBSauy3NCMrZ/bw+rKLgYp/uf7lgG9cSEKcUxwLC4mHfjXVM1flAQ/0kGm7q8itvlwbqKt85ZXvbeb9804XKwtnXrNJKegJL1aChfLIB6/OiuMbBx9Fwoa2e3+RxTuoTz4KCy6EMCYNA6T6RYIAQfvuipkL8mMSyhAg/AnvAG36FNE4cK5bnswx10P/uEuyNT1/ySCLnB8zBmkGxfvGc+E2S4uEkQQ+jG0AnhCZO+FVIRuUORRwym3RbTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1f88ec2a-ebb6-2974-c451-4c2635d17d9b@suse.com>
Date: Mon, 10 Jan 2022 17:35:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: [PATCH v3 18/23] x86: introduce helper for recording degree of
 contiguity in page tables
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <76cb9f26-e316-98a2-b1ba-e51e3d20f335@suse.com>
In-Reply-To: <76cb9f26-e316-98a2-b1ba-e51e3d20f335@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR08CA0004.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b11c059-47d8-45ba-f4b4-08d9d4573820
X-MS-TrafficTypeDiagnostic: VE1PR04MB6477:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6477C0EC8E2FA4DF0041FEC5B3509@VE1PR04MB6477.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VSLCCamdg3GR6l7xbHlFyFjoM1IcjPzZB7mWr/TKnuxPbBzwqZ2gGR5yPDme6w3/4yBgobBROgRulC4pwCIpKurlS0ao+xncV20oKr34LlasWidbYhSK40AZv//l8B6xBtSNOhKnE32DiQzRxRvGNcS9UxGtk4+fs7XJ02xi2WE3KN85vgzN6QRAHk+TqtW8k8M80UyxFAdWWkks84Rzy8dfkSBq+npeesRuWEQC/eH2kTI9ljIaUNRIM+A1s1Z09XG2kzrLFkYUrq0fwczapd7mi1DQRY8VOPXrsus8BGQ00J/2gzO0zrx+4WbVgimrXJ8KbDJWjFlPWzPPWs8fuOwGK7W+VpibGxB+1zjiGeQsUQ6lCRlCqJjk+wbdgVvwJX7l6hjrHe+6gLCMvwWHge57LuDgt+R+nTO9R5CA7Jmn4naF7HznrM9c9CVNzitia4Bvy/GtpK8bHYxcJ7AV/1/WsxC6tLXaEcjOnJHWx4shAJkeg3rQ2qhooxt+sWyZO/eSCmnD4I/47Xbmjl7ZdrhK5UNeKPG0c7kYjPsvcNUzIkNQgLnm4WMWdLZHGiWdDj2aAbxk7x5XTuYcEYOwHADC+HMx8O/oFEVvqXCJPwBpsfHI1vU83/L+7wv+KhnJ5draqG0mzA8ppFwUVq/mQsILSBL4oh4PBHnawN/CobBihnh3xDeu26DD0dJESoayAcNiryNRC96I3DUPn7x2baeDFJttbnRFcgZZNhTMADE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(6916009)(86362001)(36756003)(8676002)(508600001)(6486002)(31686004)(186003)(26005)(2616005)(6512007)(66556008)(6506007)(66476007)(2906002)(66946007)(4326008)(31696002)(83380400001)(38100700002)(54906003)(5660300002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TjV3blVES3dKcDE5ZVY4MEorTmlxQjV4ZitBTzRqOUlUc1pLaEw5UVk2MU5i?=
 =?utf-8?B?cVFXcGhNdThVV1kyRjZBTlhWc0dua095U2MzaFhFaUVreTd2dEY0djVMaEdy?=
 =?utf-8?B?UkJ5OUE3b1pNWm9YdFBTRzREZnVjbTRoK2Q2OW5FS1MvcFdleWMyTWgvazZk?=
 =?utf-8?B?SGh3SlJqUWc1REtqZW95RlBkWE9DcU1EQjVvQUVZc0hUNXdUbWttYzZpa1VJ?=
 =?utf-8?B?VkZSNUVoRTVzT090VFYrZjZrVnQ1WGtQNEQ0WVA0UjRyaW5xbERPajIvZy9S?=
 =?utf-8?B?ZlI1N1JyWWplaVdWTkp2d05XOHJzR0hyUzY5Nk00b3Q0a3hIZG1HRktsZVkx?=
 =?utf-8?B?U2E2ekdPUlN0VW1JMFFvdEp1aTdjTzBmUzZwNThmWWV5VEhjeldjMmR2NmxX?=
 =?utf-8?B?azY0eGpzSDdVMjlCejFXek85VUFycFNYTXJobzUwWFI3eURGV3dGWmM1N1h4?=
 =?utf-8?B?UWpDelFsM29TbVBIdXlaMnZsRFcvd0dTeVkxNEdxTmFtUXdqa0JNRFJKVFRy?=
 =?utf-8?B?c2QrSDNFNUtMemczSjhnS1J6RlFzV2I2UWFmdXNRT3FuNnBNc3d2TWVzYXpx?=
 =?utf-8?B?YXZJMlkwOFZyV1dKeTRTemQwMkJJTHZOYnNUR2FYVkFPUTVJQXcySmhrK0lE?=
 =?utf-8?B?Vy9RMFJaZVl5TWowN2FIc09KemNFYVNHVVZFZmpCRlBhWmtxYTBOWVpoSEc1?=
 =?utf-8?B?SExKTXkzU09xZlZ5R2RoOFZ4Y01ZcnAwajBlOTVPZEtxSjJsSkVjeE1nbGZy?=
 =?utf-8?B?blRRZXJSY1lCMnVrd2cvclRoT0NOMEFDR0kzVDVhbnlVVmV0Yi9UQ0hkN2Iz?=
 =?utf-8?B?N1BxSzI5UUVMQlNZT0J4R3BlTUozb1ltY244TWRqa3p3bG84QVE3WHNQNFFC?=
 =?utf-8?B?OWdLOFZsbjhNSThrOWU3QU5YWGZLTmt0K3owbENsVGp0eUxmbjZ3bjZBMmow?=
 =?utf-8?B?QlJhTVBjU2JLTlBHN2U1Q2pMaVFlWWxtT0Z0eUt5RW9YOVNVcksxNjhEeGg2?=
 =?utf-8?B?QS9BQ3p0WElpSTZLRHAxMWN4ejY5a2puQ0tWYXI3RmhtbzQvSFMvZzlUTjJZ?=
 =?utf-8?B?QkhsaFlZaFhwSUlHSE1vOVE2VVpqZmxCL3dGVzg5QmxlSlNnMVYrK2ZTZlhL?=
 =?utf-8?B?TkZ3ZElHVjRYMWlQZXM2alJiMlZRMzVKelo1aGJvYXhXMmVjQUlWNGFpZy8x?=
 =?utf-8?B?RHdoT2c5aTREUkdxeTVURmRUVWJnWXFHTGlYcncwNVE4L2N4cVp3NmZLZ3Vw?=
 =?utf-8?B?OHlMR2NGNlQzYU1MUmNZRmJZS256RElFNkE3dFA4V1dINlQyaHExdFNkWW9p?=
 =?utf-8?B?ZTFDd1huY2xKWWdOVkgzZWxZdnRDNVpWNTdMSmN2Z1JtR0dKbFhWRVQ1TnBP?=
 =?utf-8?B?VjlNci8wZWtqRUdrUmN2M0Yrd1p4WElobUlZU3hBVUFTUjBVbExqMGZLNVFQ?=
 =?utf-8?B?QUd3VDRxcW1Fd1dLRHB0SU5XQlVnZ2hLcGFaaEUwaXM3UUQycDB4bTdMZy9K?=
 =?utf-8?B?elBUWlc0YmJuQklSL2phU1MyNThqNVRJbzU0UE96SitHaDVTb2ZOZHcxSDg4?=
 =?utf-8?B?azZrSGkrTkFFdHVxN0VwWm1xWDA2MzZJbldiNWlTSG9LWnR5dExaOWk1aTVi?=
 =?utf-8?B?aEFaUDBGWklCU2J6UStmQkh5VUZDQnBKSGUvZjlwR0ZQb3Q3VHNlVlo3NVF3?=
 =?utf-8?B?bVppbngwdFJnRC9xSG5DQ3BmeDh2bWVHdUhIVlROcWYzZXpwTmlZMGJEbWgz?=
 =?utf-8?B?a2JKWWRJQ0FYMFJGTUNjWjdrTm9GWnRsd3FlVWlrbFdIZ2lrQktWMFE2QXEv?=
 =?utf-8?B?QTdOS2ZxNzZycHp5Yzl5U2l3ZGVaMmFOdVBNTEV3OWF5anJuVklmU3NnTGox?=
 =?utf-8?B?RGNxNnN1RDBFMGtQbHlYa1pFbE1pOW5KVkZtYVlGeDJBUEpTRnJZZkZXSkQ4?=
 =?utf-8?B?SVoxRENDeDdHbTN1ZlpzaEZIeFE5eldGc0FNenloNVFsd3dxN29Tb2pSWncx?=
 =?utf-8?B?ZHh5Nno4dCttVkdGSmRBa2h1T2UzK2dqSm1oYXp0dFFDeWdsMzBMS1RuN2R1?=
 =?utf-8?B?V01JUDV1d0FQNW9Gc2psa2lBa21jL1BzWG04N1oyaTBFK084QTQvdVdUNHE2?=
 =?utf-8?B?aG9nL2JXTmszUGtrYUlsTGFRR0NJWnU4SVVpWlJMRmNOVHhlYi9jeXFsOTZS?=
 =?utf-8?Q?yifM0lKuRJSDb08z7ks4msA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b11c059-47d8-45ba-f4b4-08d9d4573820
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 16:35:31.9362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HDA3MQYoh85Z2Vr9g74mPyLsz6Ap0OLjSHHttD8vZOI7ji5JWddgKlenDDwzrbnQuJb1QQoSrtJXddvzZDPytw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6477

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
v3: Rename function and header. Introduce IS_CONTIG().
v2: New.

--- /dev/null
+++ b/xen/arch/x86/include/asm/pt-contig-markers.h
@@ -0,0 +1,105 @@
+#ifndef __ASM_X86_PT_CONTIG_MARKERS_H
+#define __ASM_X86_PT_CONTIG_MARKERS_H
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
+    ((void)((e) = ((e) & ~CONTIG_MASK) | MASK_INSR(m, CONTIG_MASK)))
+
+#define IS_CONTIG(kind, pt, i, idx, shift, b) \
+    ((kind) == PTE_kind_leaf \
+     ? (((pt)[i] ^ (pt)[idx]) & ~CONTIG_MASK) == (1ULL << ((b) + (shift))) \
+     : !((pt)[i] & ~CONTIG_MASK))
+
+enum PTE_kind {
+    PTE_kind_null,
+    PTE_kind_leaf,
+    PTE_kind_table,
+};
+
+static bool pt_update_contig_markers(uint64_t *pt, unsigned int idx,
+                                     unsigned int level, enum PTE_kind kind)
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
+     * Present entries need in-sync index and address to be a candidate
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
+        if ( !IS_CONTIG(kind, pt, i, idx, shift, b) || GET_MARKER(pt[i]) != b )
+            break;
+    }
+
+    /* Step 3: Update markers in this and lower numbered entries. */
+    for ( ; SET_MARKER(pt[idx], b), b < CONTIG_LEVEL_SHIFT; ++b )
+    {
+        i = idx ^ (1U << b);
+        if ( !IS_CONTIG(kind, pt, i, idx, shift, b) || GET_MARKER(pt[i]) != b )
+            break;
+        idx &= ~(1U << b);
+    }
+
+    return b == CONTIG_LEVEL_SHIFT;
+}
+
+#undef IS_CONTIG
+#undef SET_MARKER
+#undef GET_MARKER
+#undef CONTIG_NR
+#undef CONTIG_LEVEL_SHIFT
+#undef CONTIG_MASK
+
+#endif /* __ASM_X86_PT_CONTIG_MARKERS_H */


