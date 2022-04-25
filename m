Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE2150DB6D
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 10:41:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312558.529866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niuHg-0004NH-PD; Mon, 25 Apr 2022 08:41:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312558.529866; Mon, 25 Apr 2022 08:41:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niuHg-0004Kc-LH; Mon, 25 Apr 2022 08:41:28 +0000
Received: by outflank-mailman (input) for mailman id 312558;
 Mon, 25 Apr 2022 08:41:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfhB=VD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1niuHf-0003e7-01
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 08:41:27 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e336170-c473-11ec-a405-831a346695d4;
 Mon, 25 Apr 2022 10:41:26 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2053.outbound.protection.outlook.com [104.47.12.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-10-ZktRNjkqPfWbQ1YRYp5RlQ-2; Mon, 25 Apr 2022 10:41:23 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB8PR04MB6891.eurprd04.prod.outlook.com (2603:10a6:10:112::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Mon, 25 Apr
 2022 08:41:22 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 08:41:22 +0000
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
X-Inumbo-ID: 7e336170-c473-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650876085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R8DiCPGmZfdIitLCnmZ7S3mCQH5fBWGDgn8DzVJxrZM=;
	b=cG5HNqJ85x5KfaghM7F4h1epa3hfnbhsd4u+khx3ZB5JZ6+D84+6O0jx9bm54GQ/P/qxsf
	xmgl3PpI0YXapJV5ei/DTTg1r4zNWazfHFzbIBCHjMrLX0gUPKSHcFhGjDx445mYMNlA0f
	/UuAgjHrNja+egtScCbMNOHYobjaz7o=
X-MC-Unique: ZktRNjkqPfWbQ1YRYp5RlQ-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=coDZ6RpsG602xyEM7tLBo7nhvZW3Ko6pEtf1UXXXmMOcujikRDFcu7Aoh0BjUypvHQi/nVS7pLvgb2b1Pm8OtxoEWItdP42EXLRrJIGnos2xgNrZqGLR3GnEtGlOTIwSIqPi3yH7JO6l9DErytmtoOfuzsgFuu+raBzNrawSWOtDrgyDggb1QgMAufpqM6jrWfkR9WbSFZnkpZEZldkwkDzIswXnNTQ212PkNuIdxS3pOTt/P3dSTdXZCxIp+dwwc8leld9s2v2YTIIETVllWga08w398fri79N9RKFLQTsVbIPqc+JkR4n1a8p4ShqJ2SKZp/Dp4IqhYTC3Kc9//w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R8DiCPGmZfdIitLCnmZ7S3mCQH5fBWGDgn8DzVJxrZM=;
 b=M3o93GbzCeH6THWaLvpzP3/l2TovQH+tocAd70n3h5+tkyqjDbH2zQ2VytALlubRohBExvTfP2o0tyIOfFGkzTk5XCWBYOzHs6gspcDoMvgpEKz9qAVvEeoMZYq9eYePDgStbhGeCEB+aSsj7OOWo6r2eI4VwX+nvMg4w5feLEQdM8Y/Yh/nDvmCvBpqPG6/ibaUOlXuPd+yKNCRbIOuaPJIpP+gBhz/RbeMSZx/fS7dbQtqUd2Z7mgG0t8UNJ2nVGLSDY3f1ZwEd4yyddatpMNXbbwdawoU9ngHJWuhwKFeifRKKd7bs2x6xZeS7GilOm0p8TbSPXWZV4tSq2fdlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fedf7224-8023-275a-843c-1a5753c20ded@suse.com>
Date: Mon, 25 Apr 2022 10:41:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: [PATCH v4 14/21] x86: introduce helper for recording degree of
 contiguity in page tables
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
In-Reply-To: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0043.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::20) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16e2feb1-0837-4112-01c3-08da2697606e
X-MS-TrafficTypeDiagnostic: DB8PR04MB6891:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB68919AA9B1B9CDE17DB04C38B3F89@DB8PR04MB6891.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zXiGfoVkqc9pAj1Wobos8VX3wDvPd7bajFrbhXS3nJqZbhuq9LGg0a2vBL7nVq/vbjtA9B8Dl1Sp8tXqNSHNe0gFl7BOt3cbop5pV5b3WbYvg+q//Fb2sabk3ZMLTIMbAOQTuwNqxIjwxHUxuF6uzF/KbOdn9jLj3I2Nwy3xycN9dC3WjQWmI9bJ6S1QgVEXjEEzTqmmbHJzceWMy73CwuoNftvM303NAn1l7dGPaKIeLfXLMiG6qqhVv/4vlq6GhX7l2AHCdQFc9Jlk/MamVjoORqqYPWPFPCSwxX0jfKA74gYbmv0gb5uSldYWL2Tlw1AzZeK1RkqvwW+Fg+tYL+1ONzoHPIjKOd/jYKDLYjxXAmz3gdv0kvzKoJYG+Rl4STnUzrpaWEqHH9+OVz73OU+Za4NjuAyTkQ1R/tkIKF0BBnuCIhM8zkKecc4o6QFO0BL7Pn5FSabySHh+h9+MMaTz9JvAUbvffb+xNDIMtPGCzc/vbJd9N5cNXN+PTkh2gnb14v4FzpkkzYVDHphSMMbdHGETC3OIs/g366s6WZKBjhvKQ5QYsAL6ZxJzLPTkb8xOByeFtNORmF8IYLY2PnxY9qGxF2EJGvo/HQGmfyUZympB1UM4f24EeOS8LcOCnuMnvet88tSs9FP6NbJju4AiMywXJPR75LkHcJmojkdDmtZ0ma3NXBgAwcw86EHt/OsuhltnbDkUHNM1Zkuz6q3aodmk7tJdUMJHqiRNf2A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66556008)(26005)(66946007)(6512007)(38100700002)(508600001)(66476007)(316002)(6506007)(83380400001)(54906003)(6486002)(186003)(6916009)(86362001)(31696002)(2616005)(2906002)(5660300002)(31686004)(8936002)(36756003)(4326008)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q05JaDJPaHZwazNySlNrS2JreVFrY05iekJYcTVkS241VmJPVlVLYWJFalV6?=
 =?utf-8?B?M0xUdWhzeStCaHJFTklSQmdHcVdGejNrN2YzWlgxV0pkaU1zSUlncFNzZVZX?=
 =?utf-8?B?OUVoU0UrQWJ0NG5CQkw0VW1vUmVLdm5XZkdWdGcrRU1UVzkrYVZsVjVVbGR4?=
 =?utf-8?B?UUVWdXI2MUFwT09Rbm84T2pudU1TT0FZSDMxMEtwUTh1aXNURWxQUkZ1ckdW?=
 =?utf-8?B?RS9zUWpVbFhTOVJoUDJuMVUzb21PR0FhcXVLUUIxNUs4eWUyYm5OeE01VnpZ?=
 =?utf-8?B?Q29hUzJGdW0wZFFtRG53cjFiSUlMb0k3YlJjaDJYOStCbWNCOGNscXAzRGx0?=
 =?utf-8?B?c09hYVU1a1A4RzRUVnZ1TjllMXhvU0RwbEhhOUpsTmo3bG9OSEsrdTNCZjBU?=
 =?utf-8?B?NXN0cmNWblcxRmFyMmtQQ2tMOWJRRmJvMzBibjVvSXVmaFkvQlM1bm83bExC?=
 =?utf-8?B?RTFzM1UwYnZ6Skp0RVAxTFVJRDNBdy8zUWIydHZyY2tDQTNMQkR0Um5JQU94?=
 =?utf-8?B?Ykp6am45QzdWRithNTljNURCUHQ2V0Vua01UQ3Y0eDcxQUZJQnoxU2kvcjlm?=
 =?utf-8?B?czlySkEreFJVNU5PcUNmREVGV0x4ekJidE1yVlNTeTRSeEI0T1Q1Z2FHb0dp?=
 =?utf-8?B?MzFyRUdVTHdDd2JXRmlGZlFmL1JjS1VPZDR0b3c4VHNBRkxNMENQdmxRcHNQ?=
 =?utf-8?B?dmhSdVh3WXVqSnZyNXFacGxvUWI1STRnMWFlYUZ4UWRQNFNENURrT3Jrc2dW?=
 =?utf-8?B?bUZIbm5LMU54WE91TWZXTXo0VWF3Rnc2U3d3Vkc5SjArOVFDK0ZsU3dDU20y?=
 =?utf-8?B?YTZpbEJ6alA4bzlmaTMxSEE5MHo1UGsxL0JTemhaOWtGQzI1ZFdtZkQ3S3Rr?=
 =?utf-8?B?MU1YZTRRMjF1dzZhQ1hWOHk0MjY2NUg1aFRDakJzcDVQOTlDdDRMNlUzNFgx?=
 =?utf-8?B?YXl2dUdmdW01bHNMRU9yOEZLSVBHbXArZHJUaXdZVDFIVm9UTkNNZTZJckph?=
 =?utf-8?B?ZUZYaUovMnEybnJ5b0xRejhNTTJqVjA2ZUdpcGFqdVdGenhpa2Z4dzlIWVlS?=
 =?utf-8?B?eFkvWERESVV0Vk5mY0pyWEV3S0F4YlZ1VW5FNlNVTnBoSUdGd2MvVkVGTk9K?=
 =?utf-8?B?UjNMM1Ayd1FrSmNxaitZaHM2dFZWTFFxbmtEUTNLS1hhUElzWlZERGl0VTVq?=
 =?utf-8?B?dDV2R0huWTAwait5cEp2cUthczlPZEZMb3dibXdRYlB4RVlxMVNYNERsN0J1?=
 =?utf-8?B?WUVQODJqVVZDSUZUemFiOW5MbTMwVDA4OUNLbm0yNHVwM01IQlp5dy90MTBj?=
 =?utf-8?B?V2V3ZEd0SzY2cFdjanlmYTZMTTdQMW1CVFRjYjd5ekI2MVNxRFFoNFQ4Wm44?=
 =?utf-8?B?QXVsbXlhM0lYTVZub1dQM2k5RGxBYzFsK0JvTnhQc0VGd3Q4ZGowTElpa3p4?=
 =?utf-8?B?cEVuSVNCQWxSb3YzWW5idVJHWDhoSzgrYldBVHp1Q3RDZEl5bXUrVlJSTTFk?=
 =?utf-8?B?dG8rd0xWN0NMajA1ZlhoTzJTMDZncGRyL1h1Z3ltMEI3TmxNNDBYSXVPbGVy?=
 =?utf-8?B?MXZyV3F2NjNVL1YxRk8vYVNMcnB0VGRpYSsyVVcxT1F0L2Y4d1l0dlVFY3Zw?=
 =?utf-8?B?RDFldmErN0hrTXFLSWlHR0RBODZEb2RyS3JOb3Y2S1ZpdEJKU216QTZiMzJF?=
 =?utf-8?B?SW56WGhnOFY3ek4ycUNpWURySm1QQ0s2dCt2YXlEanNLWDNxOVBkZXdqY01I?=
 =?utf-8?B?bll3QW5qNXJXOXdmMEZCblRwUDRRNXpvZXdOc25uSmVYOGlHUUF0SnVaZTc2?=
 =?utf-8?B?QVFmRlVWWVRZU2NLeThlK1AvaCtGblVTem14ZWhxTjZmM1BydERvb0pVK09B?=
 =?utf-8?B?SGc2U1ZnSVJUSlBsUUVKbjZTUEpLZFM2YTU3MGNRNmlwUEkyS01pNG5LN3d1?=
 =?utf-8?B?Q1RXaWliVTJNUVpSMFJ5emtGT0tTeVRlQng2dzBabEZpaEx0dWtWeEM5aGMx?=
 =?utf-8?B?ck5tZENYR3dyMVV6VWd6TWZQaGk2VmtabkpYQ25XdGFRR0tFWnpkYlZRNEov?=
 =?utf-8?B?RkdrMGdlUUwzUGFaZjJIcGxGeVFweUR0VmkyR1E4Z04wR214am5PWUpOVitM?=
 =?utf-8?B?UHlDTnhGSGxCb1dYb2FOWFAxREVoWkNXWEFNUG8yaXZ6UGY0S1N2S1gvYWNz?=
 =?utf-8?B?NVFXaFNubG82UENOaDRQNXIxaDJQWkwxWGFqZGxLKy9YQ2p0MS9LdTRoKzFQ?=
 =?utf-8?B?L1p5ZC8zNCtHNjVvZlF5TEUwVkc0aW50VWhkdHA0TUhzSlpCaHlCMGRpU1dz?=
 =?utf-8?B?MDB6V254ZXk3RC9HeW40djdoOUNpS2ViVENrSHdvVDk3aTVpNnU1dz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16e2feb1-0837-4112-01c3-08da2697606e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 08:41:22.7491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e2I5vDMK/fGIZa0bT3yfQpKU/+SM2HnQVxQsKx/3m4fpNuRjVuhNv3vxrem1NWc5BF9rceepUr7X0ihfTYDvpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6891

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


