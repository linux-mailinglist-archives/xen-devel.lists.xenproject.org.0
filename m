Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4F5535F16
	for <lists+xen-devel@lfdr.de>; Fri, 27 May 2022 13:17:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337978.562708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuXxz-0002Bx-K2; Fri, 27 May 2022 11:17:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337978.562708; Fri, 27 May 2022 11:17:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuXxz-00029y-H4; Fri, 27 May 2022 11:17:15 +0000
Received: by outflank-mailman (input) for mailman id 337978;
 Fri, 27 May 2022 11:17:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0f/x=WD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nuXxy-0001xA-Ha
 for xen-devel@lists.xenproject.org; Fri, 27 May 2022 11:17:14 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ef28913-ddae-11ec-bd2c-47488cf2e6aa;
 Fri, 27 May 2022 13:17:13 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-39-dBmytWmVNeSxHDLZLFECnA-1; Fri, 27 May 2022 13:17:11 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB5831.eurprd04.prod.outlook.com (2603:10a6:20b:a8::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Fri, 27 May
 2022 11:17:09 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.013; Fri, 27 May 2022
 11:17:09 +0000
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
X-Inumbo-ID: 8ef28913-ddae-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653650233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fkjYnsuJuIkyi038qFhXwji2/Rxpp4JG0amuTKIuhJU=;
	b=FYDjvmFsXTb2LDfTo+Wfp+gP6bbl9LChp6S3wnzMHnqiCBWTcTDhIgzzmeembQrnQaapWk
	3A1XGTujwxTBoEWmQN+YXIjRjqKkC7LRVBi3flmWGfrV4NtGBZo1jIXxtAQrU0kCL0NhiF
	HKuptOrvVBklbrXHTpcryCZJGK0+yow=
X-MC-Unique: dBmytWmVNeSxHDLZLFECnA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GaiVRM7IsofcFjdsYnr/lvCCJ2LKSMJcB1TSnm7OWgBWE9dgispmLhM2/DJMTRB8TKmLJ98e8V/xn3YXuzAwkis8LEciMRRxhI1I2cfwK4KutMZuXdclPMOtsNIuJyO4O9C11JAR9l1ZeVvyGN9GxVVJA7AENiNkB1iX/fuKi2PieCijDrnGw0FGBfglfbFqjrRvcB23yTjOozGiHEUIrIs0H9HFzJ0TqXfYmatPoWym3snI6swZFsAfdMUTvQnfyVL3sIz8mM2sI4tBqReXEjpJXj8+xL6U78j/0wn9Hh2w7QASxwgGDzliGnUH8K4InQ2VcIAYTw/TrThIlHanJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RkfpNnHTVuEAPWGDCPWVLqkwh9PtWcL+B3weEOaUpQY=;
 b=lFAHPueMCaUYBOdm9GM43qgC7pk9uslA+VmHteOjHVpgfm4AMLpummoEBFHtw+TTh77NYgQ+8FKZaDuCHx6h06gJOJwc9ZlUd7uT7/E7HCuVLD1gXEAuCW/+TP5g+k95QX7MG5osptpUv7RCONr9aa/oJ2b0gkDkeqbSd5AUr85nCBhcp++FGZySFEV5FcTjEOcI6R+/lQR2K6SDrvDqQ2pzgCj1JoFFyGP+XxTl4KVaRwRPU5hcOUkytBIvkbx6cBIycln3BjW9jj5cTxxeRK4YSUUJut++fHQ1vTkIf/OOfTa5BHpoFTate0Jsjih1ht655C8xaW0ILR8shbL1nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1fec512a-8c7b-69b5-40bf-88b42e9ecb7d@suse.com>
Date: Fri, 27 May 2022 13:17:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: [PATCH v5 07/15] x86: introduce helper for recording degree of
 contiguity in page tables
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <80448822-bc1c-9f7d-ade5-fdf7c46421fe@suse.com>
In-Reply-To: <80448822-bc1c-9f7d-ade5-fdf7c46421fe@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR05CA0020.eurprd05.prod.outlook.com
 (2603:10a6:20b:311::25) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d999bae7-e061-4c62-c6b6-08da3fd270e7
X-MS-TrafficTypeDiagnostic: AM6PR04MB5831:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB5831CCBB57324E32613D4386B3D89@AM6PR04MB5831.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	x2aP4wBf3Asdk8nuF2D3A7UefiwMF/84sheBRy3YoZpDJRgKCyZGrvNxmC9+W2inPTpip0sd8rijs/OmRWiyvTe6StmhQ83k8tJJssSQzWN1HD9RhoVvaww4A/r/qtaLfSzyTXBXge7FXEo+0ngg+c5h5Y6FTR2/yWBEPSrwN0NA6UeuEewNv4THS0VDSpX9FWMvUt7hfr3wZe+H7D4/slFvyFoIpSGG3DzsB+AEqTI9fafSGlYxKmCIODJIdliQ9YI82q+gKjesx85aZ2iHTYCkqAPd35eLodPMku4XAZWriKG9RkbqB3v/VN+PzlVTS+rgyr/2T4sM/8e9hCDV02Slhk+AcYZ/4PTckkkP+4yZZeg3xGbharO35w/Wz2wvU+XIec5PbgGyy3/UUrZpdZxOlHnw6h7MnJf7hCZGcIprJACUgXCNFmn6+Q/oXijH4eMemYVPwZn8HjZlgh1492mRkS3+qCmfRf2ZQFwGoWJJLr2vgNBA1iNIUyIBkVm1TrWyahY64id6lou468cHyeZ8k6RtHk2EHuUQaH25UHsAk0C7rpwDhsFfhOUjbYPJXss/KxcvCzLUju2UvvEsNh+MwZBo34BvbyuWhzsZ2peS1ZpdQaA9jwBOdvtmQyNUKA4n6A7la8Y62+bcICTd0IZeaWnWp2j8KodgmU+WS4WjQVIPSbdk8qnQP0U0eUTbkRsHpiDWhHO1s1UcuhhdJsCODgUPNYXNRUhcKNVjjrUV/oog9OIFCge2q32HMuEC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(2616005)(26005)(6506007)(316002)(66556008)(66946007)(54906003)(508600001)(8676002)(4326008)(66476007)(6486002)(86362001)(38100700002)(31696002)(186003)(83380400001)(5660300002)(31686004)(2906002)(8936002)(36756003)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lpnYAR/1UiEYox+o/8FG7fJd210Tsl/sW23QRdqypYJ9a3cQUYuOCXabIVCB?=
 =?us-ascii?Q?Us7Re7KxfLAGNk8ZaWQ0SvDqmfLy6vDZDuVKwJ14Eb64yOYj14G5utPDguKB?=
 =?us-ascii?Q?at08KH6UqMTse/zo1sRmZ2ER2Lb76jKs3/Bi9c3GorEkWmLzvUr0a2YQdp2y?=
 =?us-ascii?Q?K1f9JuqtAFKjnBlzAeeDUUgmEOsc3ZLD40fpIYlLCdt5ndKM0mPVo1d7wGae?=
 =?us-ascii?Q?+CP6XWA/qKwk/euYQhCATBSiOi6OQOADC2OV5/gzu+G8JlMICuum5dX4L/Ex?=
 =?us-ascii?Q?I5m/4eCGVK97Au5GwOpIiqwa/RHkP6894not3ezpYtZsiSGcN/zBf9Ew55a/?=
 =?us-ascii?Q?zoHwnKmUSOFRC5zIWqb7JcpXU7NZolAU21txuEuHD2iOxtQim+FP9CAbzm6S?=
 =?us-ascii?Q?3NZJOGLadX4C2egbVZIDRNjauFsRtZgC+6JWcAIPTbYqPQ4t7rIUSiR6P+1H?=
 =?us-ascii?Q?081l2dELJ59z3phbIRVLgT9czSjArqSuSHqFqFhKjUwVInyUtiFvBjoIpr2A?=
 =?us-ascii?Q?UO+EekunRyRnqekymFB00ehE0uCMEf+4PfM2YqrVCRFY3yrEYNhBgkdLDkrH?=
 =?us-ascii?Q?XxhmEsIBwyhX7hqRW22MgBDSePzLBvUCCgg/D9qCK9PRnEgU4dhXCHHsJOrQ?=
 =?us-ascii?Q?Zfw9TwcU/XENy43DrUlC8yMmK+ud33jxKCaV7QxCLyctb3fHrVyCygGfbXZa?=
 =?us-ascii?Q?/O0rQzEKZEIwnVTDtriQn0BYHpUYrM/sThLqtFkEet5pKXlGcLIVdhghB6sH?=
 =?us-ascii?Q?5y1Mqf/LS/bVnZe6OHl+NxcVI1ypPiQfOy0lOwWiCbZcjjQ2qbOa767W/IkL?=
 =?us-ascii?Q?A2+2ERdS6ShC5iTfTTgLBTMD91uNq3x6U8y9KBOp6E1PLYJbhPVRJlPg5MbL?=
 =?us-ascii?Q?d72CEsKhRxPeXF6EXtR5UOa/uVQQl0p9lcF6yzDKxdpxYLfR3fua1sCDQw1k?=
 =?us-ascii?Q?bWpSLoTPLjvX1zrEqJA7awEvAl656s5TXeKUz65MFnUnbzUzHb38FAICXrJy?=
 =?us-ascii?Q?cUeUrELJbGEMuXWdKsJ+MA1SjcGV9HhcHMBIwb7q7UYNk6ygtpq+rMXJfuDw?=
 =?us-ascii?Q?Jpwz9oSiKG5EN6h4y9IcPTp+ZOgFsEbdkZhy4vNMHeR1pnjpPTL6S64Q/mdU?=
 =?us-ascii?Q?7+IRYUaii2hiDF944ZoLF1Ei7ygA7KD1n/UawaU5wk1w3aktvMH66Q1yy5Zm?=
 =?us-ascii?Q?9d6ooILis5vpmbbyFwYTROQtnvfJoN+zl15I57pPM6T9vOMCv3ii5SZPyC05?=
 =?us-ascii?Q?eoc7+3tXG3cua7ellMV9XDsCoQ2tMctbk97mt4sR7UOHQbOzuezbGKqPlp38?=
 =?us-ascii?Q?qzFgkxLBf5urwmVowF/yoWnWaaRsd/uzDEe5H9dFQKcSItaR9oAr0LTS8r5v?=
 =?us-ascii?Q?NS0UFjNeA774aIa8kbPnEGPP6V2Fo+H0krnBfZhp7juK/m0PSsskRpZFekaJ?=
 =?us-ascii?Q?oc7uBJmFAsxjoTOhYnTR+nR4vv36vxFUeCEvnvm2gsL72EjDJxrFOVu9TNKq?=
 =?us-ascii?Q?aPpto4xCXgxtRbtTuyeuneak6wdymva5G77uMELR/rdcSGOts3EC6uhuYog7?=
 =?us-ascii?Q?oVBiqlDx3i2FmjXZmvjKdzQIKZGNI/H3RfwDxZ+Eqff1Th/hAOOyPJnxgjhA?=
 =?us-ascii?Q?6XFTQYYidU/ZjuUrbWN+rqaXkvphkSNc+4HpGTWIlBMb4+zt/oHZ0N6K7AHc?=
 =?us-ascii?Q?o9mqKBoct+BGfQ+PE8d0OTKKjcaURlb2ZOtJkLh21fX0dA/5WBiCYeOFD8PG?=
 =?us-ascii?Q?MiaNwQLY0Q=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d999bae7-e061-4c62-c6b6-08da3fd270e7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2022 11:17:09.7672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: znrazilBfjJYgAwkY3rO3/hQTUHWvi2dn6/2sLX9NHq0giw6Ga3hK+mTl0zJLAc2VhsJ86b5AQNuw0FpLVnX6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5831

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
Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
---
@Roger: I've retained your R-b, but I was on the edge of dropping it.
---
v5: Bail early from step 1 if possible. Arrange for consumers who are
    just after CONTIG_{LEVEL_SHIFT,NR}. Extend comment.
v3: Rename function and header. Introduce IS_CONTIG().
v2: New.

--- /dev/null
+++ b/xen/arch/x86/include/asm/pt-contig-markers.h
@@ -0,0 +1,110 @@
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
+ *   contiguous bits (ignored by hardware), before including this file (or
+ *   else only CONTIG_LEVEL_SHIFT and CONTIG_NR will become available),
+ * - page tables to be passed to the helper need to be initialized with
+ *   correct markers,
+ * - not-present entries need to be entirely clear except for the marker.
+ */
+
+/* This is the same for all anticipated users, so doesn't need passing in.=
 */
+#define CONTIG_LEVEL_SHIFT 9
+#define CONTIG_NR          (1 << CONTIG_LEVEL_SHIFT)
+
+#ifdef CONTIG_MASK
+
+#include <xen/bitops.h>
+#include <xen/lib.h>
+#include <xen/page-size.h>
+
+#define GET_MARKER(e) MASK_EXTR(e, CONTIG_MASK)
+#define SET_MARKER(e, m) \
+    ((void)((e) =3D ((e) & ~CONTIG_MASK) | MASK_INSR(m, CONTIG_MASK)))
+
+#define IS_CONTIG(kind, pt, i, idx, shift, b) \
+    ((kind) =3D=3D PTE_kind_leaf \
+     ? (((pt)[i] ^ (pt)[idx]) & ~CONTIG_MASK) =3D=3D (1ULL << ((b) + (shif=
t))) \
+     : !((pt)[i] & ~CONTIG_MASK))
+
+enum PTE_kind {
+    PTE_kind_null,
+    PTE_kind_leaf,
+    PTE_kind_table,
+};
+
+static bool pt_update_contig_markers(uint64_t *pt, unsigned int idx,
+                                     unsigned int level, enum PTE_kind kin=
d)
+{
+    unsigned int b, i =3D idx;
+    unsigned int shift =3D (level - 1) * CONTIG_LEVEL_SHIFT + PAGE_SHIFT;
+
+    ASSERT(idx < CONTIG_NR);
+    ASSERT(!(pt[idx] & CONTIG_MASK));
+
+    /* Step 1: Reduce markers in lower numbered entries. */
+    while ( i )
+    {
+        b =3D find_first_set_bit(i);
+        i &=3D ~(1U << b);
+        if ( GET_MARKER(pt[i]) <=3D b )
+            break;
+        SET_MARKER(pt[i], b);
+    }
+
+    /* An intermediate table is never contiguous with anything. */
+    if ( kind =3D=3D PTE_kind_table )
+        return false;
+
+    /*
+     * Present entries need in-sync index and address to be a candidate
+     * for being contiguous: What we're after is whether ultimately the
+     * intermediate table can be replaced by a superpage.
+     */
+    if ( kind !=3D PTE_kind_null &&
+         idx !=3D ((pt[idx] >> shift) & (CONTIG_NR - 1)) )
+        return false;
+
+    /* Step 2: Check higher numbered entries for contiguity. */
+    for ( b =3D 0; b < CONTIG_LEVEL_SHIFT && !(idx & (1U << b)); ++b )
+    {
+        i =3D idx | (1U << b);
+        if ( !IS_CONTIG(kind, pt, i, idx, shift, b) || GET_MARKER(pt[i]) !=
=3D b )
+            break;
+    }
+
+    /* Step 3: Update markers in this and lower numbered entries. */
+    for ( ; SET_MARKER(pt[idx], b), b < CONTIG_LEVEL_SHIFT; ++b )
+    {
+        i =3D idx ^ (1U << b);
+        if ( !IS_CONTIG(kind, pt, i, idx, shift, b) || GET_MARKER(pt[i]) !=
=3D b )
+            break;
+        idx &=3D ~(1U << b);
+    }
+
+    return b =3D=3D CONTIG_LEVEL_SHIFT;
+}
+
+#undef IS_CONTIG
+#undef SET_MARKER
+#undef GET_MARKER
+#undef CONTIG_MASK
+
+#endif /* CONTIG_MASK */
+
+#endif /* __ASM_X86_PT_CONTIG_MARKERS_H */


