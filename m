Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19702566E9D
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 14:48:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361160.590510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8hyG-0004t0-DR; Tue, 05 Jul 2022 12:48:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361160.590510; Tue, 05 Jul 2022 12:48:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8hyG-0004rB-AK; Tue, 05 Jul 2022 12:48:04 +0000
Received: by outflank-mailman (input) for mailman id 361160;
 Tue, 05 Jul 2022 12:48:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IaUl=XK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o8hyE-0004qq-9c
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 12:48:02 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70041.outbound.protection.outlook.com [40.107.7.41])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3f9e874-fc60-11ec-a8e4-439420d8e422;
 Tue, 05 Jul 2022 14:48:01 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM5PR04MB3089.eurprd04.prod.outlook.com (2603:10a6:206:b::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.22; Tue, 5 Jul
 2022 12:47:05 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 12:47:05 +0000
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
X-Inumbo-ID: b3f9e874-fc60-11ec-a8e4-439420d8e422
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IifTTQEATJ5rsOs+0MYWRNiVeYOl4HmRLv/0qT4Q1/S7hNiCjoOTbtXdaxOAEtRqxx8f5CXdV1E4Z4QcrI356jNZ/BWyBVfYvqelaj+K6GYoeAdE0ANeHfUtmsL6gRVE0p41sAW3FOAPWUkDxBETeFaAtIn87TNoEznJ+zEdyMbiqJQiPV9Z4c4T4g7raW3n0QtgGojmXaW9OOlYjgmd5/NgnNREqjZJYlmxwsNVZXw80eYWsg7/WdrO3b44mQAkK33aYHzIiOxPiAu+acFZTgg6eMOn2fFCGqrjbQq2eHuER5pH0pvRoYDgU0B6Quwsvgbl79rCDrIOl5vNrqce4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nzH6EFMW+e3+Xs7xettJZg30tav9rjlAdUzEqGTjlFU=;
 b=eNuEDpnJGvKgefB/KMfXzNBxiCUJB5nU/VNiWl+aHiG5xI+WxDOtlJbg+9zOdw6xU6nsjS5xuYnCVxf50oVlSMbJqjGJiSQDUChwjcTEteWZ+hu6fWLqUKrww5vgS9yggj1Jyj40XndtoxgnFARiUECqD6BbI2d5XelcZ0OtuZpVg7A6yc1boX70L58LBfOebaix1w2mu4xzHx4Bwdh6nHiqgrPQXnN+iQLdx6cRz4b9fVAlRFohrBTyastvOAiYofnXE0Vsz/6G7gTsT0G35sJ1/hmC6Sq7iuGBr03lUKE7wQLfjpNK7pw0LGEiFHloOv1UEFjdH8gSNF7RvxV41w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nzH6EFMW+e3+Xs7xettJZg30tav9rjlAdUzEqGTjlFU=;
 b=vZrmrFR22i1aPqYekL2ea2xnPgR619OXDSqa6tUwtORrSK6F/h9v2zLzmGevDHSs7Sf9TmRfWAyzosXSqY1tSA5z3hfobEoLXi3+L5VHyDOufS+0E4IKEj3NBy+DQAomK8qRA5Iv+ITd3cxCMNXxEoeFas6aj5ud9r7jYoQ6w/tDj8ndREyafbRXV04X1Q/u4H9SgAcoekVJRlm4YNSfBQZ/S+nmK1cFUy7b3ea1WfaZuww+Y0C7x+/Aa26iC9pwh58t4E4fuVh2mxy1pM659z+eiGXwmsrNTOKdsUOkLHW8qum5VRS94tgwLmbEv7GI7F3zg09F6C3nGf/WB7jHBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1ff53db0-088e-ec08-b757-b03639c09432@suse.com>
Date: Tue, 5 Jul 2022 14:47:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: [PATCH v7 07/14] x86: introduce helper for recording degree of
 contiguity in page tables
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <4c9d4b32-d4db-3a4f-fe92-6022e63c3f82@suse.com>
In-Reply-To: <4c9d4b32-d4db-3a4f-fe92-6022e63c3f82@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0102.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4e76a39-2084-4ed2-6ff9-08da5e84771b
X-MS-TrafficTypeDiagnostic: AM5PR04MB3089:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KHX2nzvOmr4qFPnYicQka8unMweegtMNmAcJzW2JQRf4PSnFPmvUIrzPD/cyuolqQCn89da4Cjai+6/GaPpt8MbH3mwlZsyrErAgc0zH0N8ELDpGIHNuvuL6Sci5E3CzpEEMgy4/XVRj+dTMZEyqoGAZh7K9wettedRRHfTs/qvJssmkMDbm7Yj7HadSLcU5rfqTQN/T/WTceeUTjKJREqPQbwNW4od5JHrvP4xkvZQRPdy4auDjNv4bYF4NVvNRW+xr6EYPTG9fV48jL3oLyJQT6lxACLw0REaCO3PqLGQlUCjIpR+bUVx841AK0ONCq6Sj+OtyhBD9cJFnWreu+IsBa8zgQHCvgTdh6f9CCmYTVdWcbclPJDWlgndjoAQZDu2VrlLLt/GJ65sGTTh1t7owJPN/0uwWYMmR8vGsvP0Ji1HQEA7Gdn5sjp6rqTG0SPy/KPT5R4KvFd6VtffZiuygA3wcoIoELV5Y+KjKUVoeVwIFMGm+8QhjFLWX6x+wKlMaSDPAG8BRzu3LZiGtjhvbxKRJASyWDhBmT1CTgOmOb0fsNFIrPp1lfBHZNcyCf1AzrFUBv319o2rTolGsqGJvZBLeBwYvBnAOviYooIn5D3eHpLkPey7x2FIAI2lX1ut3gHBzA6NqmlPmAfF06CQmh+SbdKeUK6BGA3qVXEAypLHKsXjVpg75tzPBeMQNAhvQDhHEqTMBVvnPCQwuc72DzGDx5NJQuWt18n6Cm7cHgF7RoYwrJvvZ8Fsps/C5W/pMiq1nMtE3gOTEg2Fiv2oezf8kNTZ8ACs7INk97K5gRQN0WOhSMuIsbzAgQzsDA1Ge3Ulyqacw9EUlAAqW/TjsUIqEH0zfTcTEBP+D4FE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(39860400002)(376002)(136003)(346002)(478600001)(8936002)(5660300002)(6486002)(86362001)(31696002)(2906002)(6916009)(54906003)(316002)(41300700001)(2616005)(66476007)(66556008)(66946007)(186003)(83380400001)(6506007)(31686004)(38100700002)(36756003)(4326008)(8676002)(26005)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SnZZb2RNbDJvL0pvRk1tbGFWN1kxcTNCSURRUkJhNjB5SlVSL2dDRHpvRkJQ?=
 =?utf-8?B?bDhFcjVIeUVtbUovYStGUUk0VE52ZFdyWVBxTklaY1liSWtpRXgzMW1SUzd6?=
 =?utf-8?B?WWVSUkY1YmNBeXlRMkRwNWRXUG9uTlZCYWtDKzVuZnlSb2ZWaHowVklMUGlh?=
 =?utf-8?B?N0I0WU9oU2VqOThva3lHdk1PWDlmUFYxZWF5WUtONFRFZmE2NkMxcmN5Qi9o?=
 =?utf-8?B?Ukx6YkhobzBGenZCS25vWGVXeDNoc0lBQXgzZUxCYUp1M09ZYzhqek5BaVR1?=
 =?utf-8?B?cGFUL1FuMnYxbkRCcklUeCtnanNKRGtQRzMwQndadHkvc3JYTjI1Q2FwbmRi?=
 =?utf-8?B?K05wV2tjZTVtYUZDMlM0djdEUmwyZW1VODZrMWZUUzQvcUVLTXl2RVdNMitR?=
 =?utf-8?B?SE50bFptM0NZNTE4MXFYRkxDNENzWFYwS00wZDF0YU9qQTU5S21MSFd4djJl?=
 =?utf-8?B?R1lEZndCeEdRNzB4YUtRL1AzMUhMelVJNWpiVitnMDIxc3BTOWlpdVZaSGp3?=
 =?utf-8?B?Ymo4TE1iSmJ6Z1Q3bkFtTW43amd1OEt0bUI3R1UvTEF0cWtLcHVBRVlwNkVo?=
 =?utf-8?B?OEcrTG1wdGVTbld4RndOWkZNa2hBQWl6cmQ3TVYvd0g2dFlMd25nT2ppeXJG?=
 =?utf-8?B?c3h2MVBFYVRQQ2tSYzFIVEt6Lzlia0lYZkY5RUE2S1VDUXpvOG05dDloN3o0?=
 =?utf-8?B?SVRZV1pGdVMxcCsvNC9vbDd2a1NIWGFveGhrTk1FSER0TFlXQkIrc0JIMVZh?=
 =?utf-8?B?K3NTMnIwazdDOTRDK0Nya0FLWC96dzM0WkN2MXRVWldyOElNKzFJWld6L1pk?=
 =?utf-8?B?S211MGxRWWIwK2xURTZ1M3FCSWNLWUpuSFQwNVhZTHdIaFgxbWdzRDE3Wmx3?=
 =?utf-8?B?NUo4OU1MWWxvZjlIZTFtdFppN0tibW5CanRRbUsxbTVSbzlEUHlTNndjQURn?=
 =?utf-8?B?Vmk4UG40NTZsdnoraGNmQ2xlSmZaS2ZWalZlanFDYVdTK2ZMZDNNL0gwRVhz?=
 =?utf-8?B?RXA1a0RsMk1OdnhkY0JEam5ndEtxZnk5R3NmVlhETVRNbzdaQ2Rob2laczJv?=
 =?utf-8?B?KzgxYjVLVWhlQU02S0NnT09abCszd0kxcG9INGdFQk96WnpicEd4dDFROVVq?=
 =?utf-8?B?d0s5c0RSTTJndVFTVlZYSDhOMW1pOHVRN1RSc0RYbExNRWdNY010MWFRemJ4?=
 =?utf-8?B?bWRUcXM0T0h3bHNrSFFxU2tCd0FvQ3F2V1BpTHRlOHBQb3hGNXZyeXNPVDQ4?=
 =?utf-8?B?RUVzVjU0K2IwVktOQUN3NjVySFAwYmZyRVh5MnNId3Zpd2QwbGJFTnVFRVkr?=
 =?utf-8?B?eE03MmhaRzVRaWNEU254cUZuY2hkemd2ZGx1QmgzcnhtcXpMcVB5S0xnMzZx?=
 =?utf-8?B?ZmlwVGovVm11Uy96NHpPVlA4dDBIbVhZTUE4Nk4wTmZhY2NGNHNwMUlQSFl2?=
 =?utf-8?B?QXlaUGtZNWJIZWdLbDhQSVQ0cHN3SnVXMElJVmJaaUdWQ1ZCSzFWb0hvbjZ0?=
 =?utf-8?B?bkJFZ3g0YVQwN2lBYUdicjA3d0lYWCtkcUk3NXdlMHNNSER3c0diK1hKdVBa?=
 =?utf-8?B?akZFWTVic2xmZ0JlS2V5dnVKMGNuR3o2a2FjZnRWaVNKUEVtUUVteDdSYUJ5?=
 =?utf-8?B?SFNoRyt3Tk9kTzhJYi9KeWd2UXRrRkg5blZOQlBQSGNJZjFQenNwVW90ek5Y?=
 =?utf-8?B?UjhNVnU4TFFhVHBSRWpDMXN0Wk1qdWRvQSthd0NKYkJyWnpFVnFFNHp5NFVY?=
 =?utf-8?B?S1h3M1VtNkdFditkSkpRTDdSYVZDdWJCZDZTdWVOTHR0QndPNHI1a0lHRm12?=
 =?utf-8?B?Y2QxdDZXRTFodjdaaE9YMVJJajZTRnBuNjVmTGJDNnhjSjA2LzJPb2FlL3Qr?=
 =?utf-8?B?ZlBTeG9PU0t2c0tWVVpCTXZEYVJuSEk0aHJ2a1phbzQ4cFZEQ1drQUZMcEFF?=
 =?utf-8?B?UHhyL2dpVnNIZXNuYUxWRG9PdHdPbk1sMHJ3SHViclBDQVo1ekNOYnZXd2VB?=
 =?utf-8?B?Y0FoczVCVFFHR0ZjaDVjN3QyNk9HRDM3TEpQNU0wUGkwa1hxMnhGUjFpTlFK?=
 =?utf-8?B?TkV0MFFKYWhlVTE2aVdTQ2lxcTlIblZQeWthdnc2ZUxXNlJhY3J1SHlkRXhY?=
 =?utf-8?Q?wpmLAXj/2vIJczfiESL3XTyU1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4e76a39-2084-4ed2-6ff9-08da5e84771b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 12:47:05.4733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6E6aurzClZBOFWPGA7ImmFoHM3ea5vP1JrKR/Exhzt3El9FL9kHTqJorPmT0LOf/WCUMXKTmurzr5NYFOKbg+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3089

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
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
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
+/* This is the same for all anticipated users, so doesn't need passing in. */
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
+        if ( GET_MARKER(pt[i]) <= b )
+            break;
+        SET_MARKER(pt[i], b);
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
+#undef CONTIG_MASK
+
+#endif /* CONTIG_MASK */
+
+#endif /* __ASM_X86_PT_CONTIG_MARKERS_H */


