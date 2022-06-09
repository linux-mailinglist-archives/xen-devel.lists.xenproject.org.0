Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9402E54489C
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 12:18:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.344895.570516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzFFZ-0002sj-D3; Thu, 09 Jun 2022 10:18:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 344895.570516; Thu, 09 Jun 2022 10:18:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzFFZ-0002qc-9y; Thu, 09 Jun 2022 10:18:49 +0000
Received: by outflank-mailman (input) for mailman id 344895;
 Thu, 09 Jun 2022 10:18:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jWvP=WQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1nzFFX-000264-OF
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 10:18:47 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0625.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c3db64c-e7dd-11ec-b605-df0040e90b76;
 Thu, 09 Jun 2022 12:18:46 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Thu, 9 Jun
 2022 10:18:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.013; Thu, 9 Jun 2022
 10:18:45 +0000
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
X-Inumbo-ID: 8c3db64c-e7dd-11ec-b605-df0040e90b76
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KzbRGGGfZwiRpIwszqMeYG8MPArqTM5DUedH7Qsip/Lvz9fntrSo5qK6j3Y3+iNMm7flGN8k5VZWUcmNjAVHOMpFjYdxJNH9a3sfksECBRoGZzNOOUDvichbN0SdFfgcht3B+Jb3xVA8dM1h5C4ECSW9rKmJatknbn2g/uIsalNo65OSOQvSxPYcUpcRU7Eik3kEIJJEDzt12bgHFWCmg8J7hcIHy+z9VQvBWJgx7aHlcxedXqpuBj7D+Fnems3v20HzUtx5tOWT8t3ClO4s8zxuFlzLnRuPpkh6yySlTS0LHnIszx+TYIil4c7zpP8/DA+PB/MARAVrmIxAdxC1hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nzH6EFMW+e3+Xs7xettJZg30tav9rjlAdUzEqGTjlFU=;
 b=WZq5xNk8k/aZ3WAC/pYR7TnmZ9xZMUSFIMmIaPf57q9RAoDl1q3HjOqTpa8QBgos0DCAKwF1OsEHzHpNIdDh1bDsLbJiAVmZMOUox8USRh5GUdERceYfuXJUbOxUss4dtE2OLJF0NVBHkO3jGlma14Kl9WmfNgNzUn4flyvGSc2bPhBYVA+H710l6I1boKDcJT9MctbhldV3gbiPyAkxWw9YgYLczhfZlQjKPHrJ0q5e80l55A32363DYcp9p0IjfUlZOpuSmuoQW4LpqLPXUqvGUSuPItzbeKdOU3qzm4CpMqF9XHfMLafTLzwC6eAL2eaHYyREMLyLLj9Tvcbpww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nzH6EFMW+e3+Xs7xettJZg30tav9rjlAdUzEqGTjlFU=;
 b=4ZIAI3IbTXjtYrTEodr/B8hdhaiWqSTIbRjV4Z4RitEQjM5oW1qIzcdvimWGLFdUreD28VPzgpq8m6BSTjTgUY9VlYtFkny9QuQ1zQ+pwvWQagjc0LagpCDTP2l/CSJDnJcYPiR2R4Wlo4pZHblefDpvKMwJBNwCDH64AMOvJe6kWFJoRptRvz+cVo7XDMI3DM1XPStpgfFP3EQ3SJLsiOKDPP0GqVZHjeJvDd2+sCgo2KsL48r02hJvzFP3OgTt9JIZzCJ4Tmhvn29yYVyCpVEvZqCIl41QjWP683KmclSEmq2vdajNomjcnm41+Rcjmu9h2XNJ8xOFbAkopo0zAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4932f8c0-26e5-4289-ef7b-6bba27a9216c@suse.com>
Date: Thu, 9 Jun 2022 12:18:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: [PATCH v6 05/12] x86: introduce helper for recording degree of
 contiguity in page tables
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <e873e30c-7a04-a8a3-2fe5-0dda30e654fe@suse.com>
In-Reply-To: <e873e30c-7a04-a8a3-2fe5-0dda30e654fe@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM7PR02CA0029.eurprd02.prod.outlook.com
 (2603:10a6:20b:100::39) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e503443c-0bb0-4455-9fcf-08da4a016f84
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_
X-Microsoft-Antispam-PRVS:
	<DU2PR04MB87904A21E836293CE8338C63B3A79@DU2PR04MB8790.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5MoHlvozFHMcq9CkQ4I7r6cMveOku/ksD7Vy+IoIccFLbt5RgtEZOyFAIACS3pQsuqyHUHsqLcYnguZC8Q228BrumWB3OX0jEMAtmJcRBoFVhhVKtpQR8jb0fM9Z1VNEfFwD4S7SpJl77AFzCn1LdO++RmURUKfd2qRv+ZZ4Nx3Jv8WJlWWw86c2XyB3wpwoExRRSPxkLwhbnarTqnO7Jh8jB5y6wZRA/CjnvY7leO3Hlm9cSI2J3boSpiyL5dbUILq8mG6gC7mzcu6Lx0hOk2aPlb1GtsMzRfG68wK9FDL6+IB6s+EOlgswN+9KD1Xacn5i9IlGDPvFO2R9MDWpptJw/6ZkoRtBO6W3hCBMmMy2FRG4M/N6TVT6lNBn5j8ya/HaH/SKm03MVTLqpkYb0AkvisBUps0xbfKyXb29yypNn4Fx3V/1fEjcobY35M+Nk4ztZx4cI/YD9VwSUAkBuqjx0snTk7MUPhFzcVv/s+Na08gj27xLVkK9sVyr4I7GKtXsPt3EGGtvcZ3DLder9JnPgmrNLTAEvOXcU17XbdggLvpdSt/UwR6VQzExtRotxQGc6rxtcW7k4nKheYkkIgNvFPdt19QXqEy5HrFNgj0oV0DdWkD/1uxw4tTk6xoOXogaIkFeH4Ne6xIlAqa527jIkVVvxUrqlfIyuH3dzIsamFbsFQKkYIFavbQhEj42yN7xGNEXvRTvr6c2/N/haCUVhEw6c5qi6+k3cznW74XQO5gRfWLqomA6DQ+ggSGB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(6512007)(31696002)(6486002)(6506007)(5660300002)(186003)(66946007)(83380400001)(2906002)(86362001)(508600001)(8936002)(36756003)(2616005)(38100700002)(66476007)(66556008)(8676002)(4326008)(6916009)(316002)(54906003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SExaRnlnbnRrcmxneEpKM1NKNzVvZUJVWnd4bTkzWSsvRi8yTjFJT1hVZ2s4?=
 =?utf-8?B?Zmg4LzA0eHlUOUoyYzZzNmpsMjFGRG5BbTRPSjlveWxuNkhJM3dUQ01UV0RL?=
 =?utf-8?B?VVlXOEdWOGxQNTZNMng0d2VLd2dWekFPVEoxcGhOdUdrK2VmL1RSM2tMMTVW?=
 =?utf-8?B?R2FUWng3K1BoRGZUUE1pNWxFMHFyWW0wVWdkd3RxK1BlaDZuWllGdTNsdWF2?=
 =?utf-8?B?WVJxT2ljTllZQkNqR2ZoQmNtdWx1MU5JWWlpY05XekN5cWxZbk90WlRPeGFh?=
 =?utf-8?B?bHNwVVZ5bU45V2hSdFl0L3YvQ2RLeTZmcFl4TnRiQmVDeTNuZyt2MnB6aE1B?=
 =?utf-8?B?UTRUN2JKTnNuYnBqRVZ6SWdJSkdoZWtCaFJMcWZaeU82VTRraHJqOHBqOGVG?=
 =?utf-8?B?UTRYU0JuNGk1dURkeW9pRE5BRXZZNFhCQS9sNFZZYlYyNnJqZnB4MHRyeTlU?=
 =?utf-8?B?WEs2RERRTXluY2RXOWxYT20yb3hiTnJoNVdRYVlKMmI3YXdFRTNzcHVFdjU0?=
 =?utf-8?B?N3lTNVZnODJ5WUpYT3FIMFMxSkdjM3pmcjNJQm53Smw3ZWRXMldSZUNPTUFL?=
 =?utf-8?B?eUlSb29Ga2V4aERabkhJM1JQWXV0bDgyNUpCa2lmTHNUY012eUtrNkRyaUFp?=
 =?utf-8?B?cHVtWi9wMkVtQ08vUDdKNkhoalVaaitLYjV5WTExelFJTWcwWmxSYVlQbG5T?=
 =?utf-8?B?OGFaTXJ4Vlc0aWs1V20weUxlMzdnTE9ZeSsxWGZOZUdVMS8vMHZPOGR6Ymsx?=
 =?utf-8?B?ZDZRbHpTeXQvY2F6UVpBazlEK2ljUVpwallPVDhiUlBkdWF5czFLajI0MlZp?=
 =?utf-8?B?UTIvcXhTQXUwbndGM0ZKSkM1MWI4QmhPRUtuRXhoR005RXpBbTErMVNoSTFR?=
 =?utf-8?B?ajJWaTVBUDZqRjhPdUdFamtzTjEvYUFpNUxQRWV2YVJHRCtjWVFrZXJlSjBP?=
 =?utf-8?B?bXRIaW1vRi9XQ0FRdndFeDVFVGZzeS9EQmdtUmFJSUxYZ1RES3cvTTV2RmdF?=
 =?utf-8?B?ZU9ZdGhKanI5dUV3SEIyWUY5Y1IrdWpuakVjZFZTVnlVTzhFVHMzNEo0djdI?=
 =?utf-8?B?SzdmNUExSk1JeU5LVG9iN2RZaUp0QmxCaHpqdHBuVVQxSENIU2VpNWRFdm80?=
 =?utf-8?B?ZlFyTklFZ2pPeGxHa1hPZ3M4bCtWNkNmdXFrbVZzb3VUUTFHUXlLenNWNGVY?=
 =?utf-8?B?RDdkYVVLODVXcDcyT25GR3VDelRMd0piUis2bU9MQ0Z0VVdSTG9mRU5FNjUr?=
 =?utf-8?B?eW0rVHVNYmx5UWh1eGlsVU9zdE1tRlFXeFh2bjdiOW4rU05vN2JrRUhHTlNS?=
 =?utf-8?B?SS82eTlhVlV2dzNja3laeUJ1bkRHSk9sQ0ppWS81Z3NGSDBodzBoSnJvN2Jo?=
 =?utf-8?B?ZWpVK2xnZDg4SXJGL1NxMk5tZkxWVzhXMm55UDZQekgwVEhlbjNyVDF2cTZz?=
 =?utf-8?B?czk4U3VobU1rNlJ6Z1RlanVxbE9NYWtLLytta3hTRmtmYWR3R0JtOXlobFIr?=
 =?utf-8?B?Q0pERkZuU1VzeW1zYk1ES1k5c2sxUUJDbnpYVXZLdkZpRjVQaWp4Tk1DR0hv?=
 =?utf-8?B?Q1lHQTBjY0NCZUtvVjc0SmhvNzdDdFlmVU5WYWxKQS8zUXV3OStOYzZrbWRP?=
 =?utf-8?B?elM3RmIvZ3lsMVozTUcwQk1qTjlXZ3gvL1ZWSCtEK0MrSkh2TjZUM1VoMFo3?=
 =?utf-8?B?OXRYY3JyZkM5VVJZbUYxdVhBeHkyMmw2cHpDTHpvNEhFcXc0Yms4REJUaWdB?=
 =?utf-8?B?WDB2UytqYXFmUHFkMkpXbUxkMmhBOVVwVGVQbWdTOFluTXJzQVY2WVh5WVhI?=
 =?utf-8?B?WStucm4vTFBvamp4Uk00WWtYNjZCOW15ZzNOVi9wOHo3Zm9lUmJoMktsMTlX?=
 =?utf-8?B?azZ2ZWFLMVQzOEowOTNQcGpyTWUwbzZhaEVNaWxsL3NpN25GdGR2QlcwYmh3?=
 =?utf-8?B?R0RobmRLZVV2Ui9EY1R5V09ReVMxZGlyOFp3MWtzVldtMjl4c25LekRDeEY3?=
 =?utf-8?B?bHJ6eWxzMUcwSERXU3dEeEoxR3FtZjBYOEFJTFZWVVMwSGRWNFlBdS9jU2F3?=
 =?utf-8?B?QW1xSVpnenl4K2N3RnhqMHQ2UHZGdDhpQU5lemZ1WmNuMjlkbkhnSTEvM3Na?=
 =?utf-8?B?QkNJTHpBNHZQOWZQQ3htNFVxNHFMNXB3Vi94b1ZOYnlVa2J1V2g4Zzd5VUFw?=
 =?utf-8?B?MitJbk1NRDhsS0VWd0Jnakt2eTVnWTNDVTVXbU15UlRwMjN0SEF4OEJCYmZ6?=
 =?utf-8?B?UnBTcTdTTnFYWTYzbUNjM3g3Ym9teG5ha1QxRXl5Yzd0OHRYYjEya01rd1Rp?=
 =?utf-8?B?WjBnSUZMbjM3MEk1ZzQ3c3ZuZlJoalpXNitVOWQ4a1pENXQ2TnBqQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e503443c-0bb0-4455-9fcf-08da4a016f84
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 10:18:45.3981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ozcmZ5vgmGKPwYSYcnY6JQ3eJ9ICOyayjUBhirOlZEyIgVol2GxN6TZ+rkZN8oXwO911m/h/2HNJzkn2AlrXqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8790

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


