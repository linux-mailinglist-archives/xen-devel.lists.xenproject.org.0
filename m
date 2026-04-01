Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GAzBIZJzWk+bgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 18:36:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E4737DFAB
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 18:36:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1270704.1559302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7yXn-0008Dz-CE; Wed, 01 Apr 2026 16:35:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1270704.1559302; Wed, 01 Apr 2026 16:35:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7yXn-0008C3-9A; Wed, 01 Apr 2026 16:35:51 +0000
Received: by outflank-mailman (input) for mailman id 1270704;
 Wed, 01 Apr 2026 16:35:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1w7yXl-0008Aa-RT
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 16:35:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7yXl-0069XP-79
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 18:35:49 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69cd495f-bab6-0a2a0a5309dd-0a2a4501c264-6
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 18:35:49 +0200
Received: from [40.107.201.65]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69cd4963-6fc9-0a2a45010019-286bc941a3f8-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 18:35:48 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by BY5PR03MB5112.namprd03.prod.outlook.com (2603:10b6:a03:1e9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 16:35:45 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.20.9769.016; Wed, 1 Apr 2026
 16:35:45 +0000
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
 b=FzkubG7x01jqCjp86iqQ2iB8wDKOhRnSAF/m6pprcFpllhy/POQoFrHxpq7WetPyyhsA4bCm95nIpbzq+hrQCK7uubRm8WiP1iMm0TBA0wDEyfte1M+pBkVkuUQR0giDS9dz7pruX6EbbDgeOIU6nanwBRmLTGDm0l6KUbpQ2QZU0POU1G9yxKAsEyHy5WhsVxFOc3ajQFDP6rDDonlCNyrqEB5XP1ct/8P//JW8Tn/XulxpG8fru86ssj+roz2gMXpYgKNAY8g2NNuuLnvmKhSVzTaUHxmmP8brV3y+SM94CZPJt35XsL0Ja0TTSH1AywAKJbQAtrbGXwr7GfrGDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nwao3VQk3x8O9KAMQNctVeFtFJMAsjfx9O8DsNd7b8k=;
 b=jKF0EFuWOZs0hzeDsWUhl9FnBF7xFlwsX1NKWNlp0hS4TVXoJV7G4F1dfixTTNsv3LvTWVZLiYwSayhLdsMgK+gtLK8kZZlDxyl92EnPVUDZIoxKz+Qx2ebf8vXpj37h6YrM2qn3Owy0+OUNEXL1CNTT77L0FgCf2DcGZq4y1Lf/C9HB5UoVlUd2fi9KLcTwWiRpcwifARNEOn9vHvTawg3I/LzWk11JyKyDRA/DE18jS75/VVIHVmVvsz3H+HJkKVUpSkjNTAlwXJaGZnuc/MAzAQ2+IeVr5MFoZWprJ6n3MZFodW+wV7sYVyWpLznCUdcN5jev2brjF/piKjm87Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nwao3VQk3x8O9KAMQNctVeFtFJMAsjfx9O8DsNd7b8k=;
 b=k1Yyv+XuRt4UMAYgAQb4UMBxNSD3hXo1+DZHEB6Txal/Pzf8PTJQOXXWT6G60wJSL5r7AGRhzWiNDQzie8ai5y0CQYn3wttdT6dOzJaXYQliKCavX7tX1VUBKsplXGYasgLpqgqTuh5XHIjDAGL3Uwpr9ADIB8NfgLxPdGan6Lk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v1 3/3] x86/smp: Rewrite TLB flush using on_selected_cpus()
Date: Wed,  1 Apr 2026 17:35:21 +0100
Message-ID: <20260401163521.3603665-4-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260401163521.3603665-1-ross.lagerwall@citrix.com>
References: <20260401163521.3603665-1-ross.lagerwall@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO3P123CA0019.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::15) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|BY5PR03MB5112:EE_
X-MS-Office365-Filtering-Correlation-Id: a74a36f5-2417-4b91-bb66-08de900cb946
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	FKqRE24Qw9sDzywarSFJksyfGnIY/EUkSTHXinHunQOLqMxPm2SoONY+MFCQ4JNO0uoyL+uQdnjLK1/S0M/4/8lRD/eVR1GTGF484l3+z1j9f1+MzSqzy1JNPNQRCG9NjCUK0ncbfj/CFugh6PXgHsNOpKSrEemWWJJoxTJIU9J68Z1E0F9YLuSLxquis1VRVYAlAoEew4rCS4nAgkn+mJNoDeUB1ImHOH/vdGtgr+p+fhRt/cJdAqPl70eaxInEQ49hb4hV22m+t2J+Y1pvJDosvRduBbtjUkGv6tKAvV6TFj6KX8rH5m+X11MXDyAaPVJr+tOGsz09afcaJo1yKmDspUrBDTSDn+Y9WPDokEiU/qyvres7eFJKLB5fqlYfBxfFH4sQeOvagDGrP/O6DHXhSuzTpuE+RhRaF/1FtR01FYAWVpxV5S/2xeAZPjpuwzx/k6QG+yWnHGhzQWcMW0ozycqXhQlUn7GjDHKjIA3626y7UN9xq5suVZmeZYCM3rB3zO1Hamsi4G5diaPlPiQw8NaSYueOmPcQpE3O3TxBmogQkfj+DWzp25WSQmyGHyaTtzfgI2AMstTwLvTGJpKntIg14+278fQst0OUUwbxAwM6kOIXHMBEZGMzNfeEGk1WkCGzGQJoHujwat63b516OVbunlBzZDhwesN4NxDTmbolwnz7nnlBC+RqoAe674p3wQMGDtRmKEMlqiyVnr0owFfYyoytMC7aPrhgCeE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0PzGTcdyM1Zh7HsNyAaI8RdZAT/bWPxn4/6K4zDC+zamZ9d+WMm2Q4v+cQCu?=
 =?us-ascii?Q?mCSDIPXlx/Cy0OMRvKYT3J2hRfWbT/OHRkqXYv9O4//dVRcVWyJvxizNqEUt?=
 =?us-ascii?Q?U0aEcz7xMO4F8CQkul92bsOaPMMpYYXhDEehCXjU4vXFnGoK4biyPKKsZtHV?=
 =?us-ascii?Q?bgsxIU6qkuQ8/0akU+LnuxifxXyW8yKUv/HoouMpkhd9j9MYqcR36zSl88Xz?=
 =?us-ascii?Q?0wk7aB/Z9JAiGlhTcXtMT6XfHvRNJH87k27wDjvS2ov1QNTvirvzkMMGwNyv?=
 =?us-ascii?Q?nadfTkIVMAHvlkfXrgV1rlVgGhJnWbaxeYPVcjwLxadugk6VN8w+DlPhB1l4?=
 =?us-ascii?Q?A74VuJDXbj58+afAlgUhwXsO2NHzYCjTQWawvx/OFEDkTdmVUdJwNNbCRyLT?=
 =?us-ascii?Q?JUflCPgdNQHTeGDaMnIhBHWfTV6h2ct/9VqsYWvKVbza9+O6ZzwQr1GZ/dT+?=
 =?us-ascii?Q?EzK3szzMsQl+5IDYrC2dihAllA7wMDoF9ZS67a41yfszT6+GrwbmTo4O7AV2?=
 =?us-ascii?Q?eD4ij38xLs7V+W4V69rXdduEEsR3W8sgf68+0yizrYyXkvQpcD03JT/WAWJg?=
 =?us-ascii?Q?p/ippJyORCWu0bxZ14wDtdjmr/1x8eJspMFLVScZMnkK5cOMELa060zKuIJm?=
 =?us-ascii?Q?xlBkPZ7cEAHcaTnI9mjYyLUA0UxZo45lZw+gDaTiKSealahwyTsQ/exI6+t6?=
 =?us-ascii?Q?g2iX7unA/EfQbX2gNYnySVifCsWvJr+kbGAklEP+lVcVg0O9CLhLQocxrLOs?=
 =?us-ascii?Q?4FZG7bp/p3/j/KIxgNezo6jlEUYMVZMdhyw1kn71guWECzQNl1rF4wmi9n1A?=
 =?us-ascii?Q?ACQN833yDsadjCivmTWVzpjIrs7HlDPKd7ytVZ6Fw9nFpvL1Vzgfl1LAhIn7?=
 =?us-ascii?Q?P08dAxbROMMfLh84sDrcwAUYuGY3sKPAGUcU1yY6YfUo4wi6Yak4lPhQKhzr?=
 =?us-ascii?Q?lXS8LfIJSF5Rr46KouIPpNRJ1+FogiIMqppuHx+0tJVd5heUFh01PFVZe+Al?=
 =?us-ascii?Q?zTWRYqJriH52rTFtHLS43d4+q92UXibcUxVMxKymHYYId2+XHtg+QSULP81h?=
 =?us-ascii?Q?GDXPvLB7u2gcShZQy1UoBgL643g/eCpAJmj54x+2WiPuF1FzcCwCBehZiSA6?=
 =?us-ascii?Q?5zLANIJXS4in8MvHax3vva7jjRuyDrbj99kSQwqzXcIyq9anqXC8g8GCIRE/?=
 =?us-ascii?Q?KgoIFbhjj5HZunhtpoZRDyUKCZ8e+3szCEbUlkiiBh+rkOpEDlaKwlz2mIoz?=
 =?us-ascii?Q?Y9epe5bExnF3FnP9/NlELvLgTXQcq5dOPZhB3uLvHCE817heI/581soMmYhL?=
 =?us-ascii?Q?FBmalt53Mi238hruHgnF6xHR0CnU4LuHBSa+AfxaJuvAKaxd+1d6uexaxjIp?=
 =?us-ascii?Q?5hKx/EL1eAGxbGgCGWQw8gM6VhB6Kfy890/VPqdtA7Vcgk5pd/NhpMnT7F2x?=
 =?us-ascii?Q?j4/deKDdf2S9b6oCTJqaJy+BXOyy9Y/cbnT1x6AANyznHyEa6Qz8WCjPPpb9?=
 =?us-ascii?Q?dRDhorNz/EyzxZqGu+9udwzHwvSqtdWJ+cY933xD6sl8oWtvdbSd5UwVU9Ri?=
 =?us-ascii?Q?kdf2TujlidTQaMbIu3Y1r5Rutthn1iMU6++VrTJzAnk7hRg9rsSTwqGfhdcj?=
 =?us-ascii?Q?4dtaHsiKKLf+cYH2HOj3KhabLjlLAvYWqRvVCvIYZptqJrVgslqBeSGJIoCM?=
 =?us-ascii?Q?wo4frkeZlMdCxtNJwD6VwtQAvq7XcNb2vxLZqkWUq3oXB4CsSQWz0bSrubY9?=
 =?us-ascii?Q?uICYAe13CdahNbvYto4bkCAuSSEQJkU=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a74a36f5-2417-4b91-bb66-08de900cb946
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 16:35:45.6302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BplmDTxuO12Q9SNyWGePvYkQlXOHwDVob3T2YI65K9pLaSC5GOzx6fHXxuVWDnu9SGHNzdR6xoEF/oMu6eYb6JPfKdC0/Wq/ur11Y21/49k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5112
X-purgate-ID: tlsNG-d62444/1775061349-B76FF185-C6A02C0C/0/0
X-purgate-type: clean
X-purgate-size: 5405
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:ross.lagerwall@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B6E4737DFAB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

With on_selected_cpus() rewritten to avoid taking a global lock, also
use it for TLB flushes rather than the existing hand-rolled
functionality.

This improves performance by allowing TLB flushes on behalf of different
guests to happen at the same time.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 tools/xentrace/xenalyze.c              |  2 --
 xen/arch/x86/include/asm/irq-vectors.h |  1 -
 xen/arch/x86/include/asm/irq.h         |  1 -
 xen/arch/x86/smp.c                     | 30 +++++++++++---------------
 xen/arch/x86/smpboot.c                 |  1 -
 5 files changed, 13 insertions(+), 22 deletions(-)

diff --git a/tools/xentrace/xenalyze.c b/tools/xentrace/xenalyze.c
index 876d59d42ca5..a32f5f378a84 100644
--- a/tools/xentrace/xenalyze.c
+++ b/tools/xentrace/xenalyze.c
@@ -866,7 +866,6 @@ const char * hvm_svm_exit_reason_name[HVM_SVM_EXIT_REASON_MAX] = {
 /* General hvm information */
 #define SPURIOUS_APIC_VECTOR  0xff
 #define ERROR_APIC_VECTOR     0xfe
-#define INVALIDATE_TLB_VECTOR 0xfd
 #define EVENT_CHECK_VECTOR    0xfc
 #define CALL_FUNCTION_VECTOR  0xfb
 #define THERMAL_APIC_VECTOR   0xfa
@@ -878,7 +877,6 @@ const char * hvm_svm_exit_reason_name[HVM_SVM_EXIT_REASON_MAX] = {
 const char * hvm_extint_vector_name[EXTERNAL_INTERRUPT_MAX] = {
     [SPURIOUS_APIC_VECTOR] = "SPURIOS_APIC",
     [ERROR_APIC_VECTOR] =    "ERROR_APIC",
-    [INVALIDATE_TLB_VECTOR]= "INVALIDATE_TLB",
     [EVENT_CHECK_VECTOR]=    "EVENT_CHECK",
     [CALL_FUNCTION_VECTOR]=  "CALL_FUNCTION",
     [THERMAL_APIC_VECTOR]=   "THERMAL_APIC",
diff --git a/xen/arch/x86/include/asm/irq-vectors.h b/xen/arch/x86/include/asm/irq-vectors.h
index d75d1c56716a..a1eb160d500b 100644
--- a/xen/arch/x86/include/asm/irq-vectors.h
+++ b/xen/arch/x86/include/asm/irq-vectors.h
@@ -4,7 +4,6 @@
 /* Processor-initiated interrupts are all high priority. */
 #define SPURIOUS_APIC_VECTOR	0xff
 #define ERROR_APIC_VECTOR	0xfe
-#define INVALIDATE_TLB_VECTOR	0xfd
 #define EVENT_CHECK_VECTOR	0xfc
 #define CALL_FUNCTION_VECTOR	0xfb
 #define LOCAL_TIMER_VECTOR	0xfa
diff --git a/xen/arch/x86/include/asm/irq.h b/xen/arch/x86/include/asm/irq.h
index 7315150b66b4..57cf2f23eb8d 100644
--- a/xen/arch/x86/include/asm/irq.h
+++ b/xen/arch/x86/include/asm/irq.h
@@ -111,7 +111,6 @@ extern int opt_irq_vector_map;
 #define platform_legacy_irq(irq)	((irq) < NR_ISA_IRQS)
 
 void cf_check event_check_interrupt(void);
-void cf_check invalidate_interrupt(void);
 void cf_check call_function_interrupt(void);
 void cf_check irq_move_cleanup_interrupt(void);
 
diff --git a/xen/arch/x86/smp.c b/xen/arch/x86/smp.c
index 7936294f5fcd..a2a9abbb2f4e 100644
--- a/xen/arch/x86/smp.c
+++ b/xen/arch/x86/smp.c
@@ -242,21 +242,20 @@ void cf_check send_IPI_mask_phys(const cpumask_t *mask, int vector)
     local_irq_restore(flags);
 }
 
-static DEFINE_SPINLOCK(flush_lock);
-static cpumask_t flush_cpumask;
-static const void *flush_va;
-static unsigned int flush_flags;
+struct flush_data {
+    const void *va;
+    unsigned int flags;
+};
 
-void cf_check invalidate_interrupt(void)
+static void cf_check invalidate_cb(void *info)
 {
-    unsigned int flags = flush_flags;
-    ack_APIC_irq();
-    perfc_incr(ipis);
+    struct flush_data *data = info;
+    unsigned int flags = data->flags;
+
     if ( (flags & FLUSH_VCPU_STATE) && __sync_local_execstate() )
         flags &= ~(FLUSH_TLB | FLUSH_TLB_GLOBAL | FLUSH_ROOT_PGTBL);
     if ( flags & ~(FLUSH_VCPU_STATE | FLUSH_ORDER_MASK) )
-        flush_area_local(flush_va, flags);
-    cpumask_clear_cpu(smp_processor_id(), &flush_cpumask);
+        flush_area_local(data->va, flags);
 }
 
 void flush_area_mask(const cpumask_t *mask, const void *va, unsigned int flags)
@@ -275,21 +274,18 @@ void flush_area_mask(const cpumask_t *mask, const void *va, unsigned int flags)
     if ( (flags & ~FLUSH_ORDER_MASK) &&
          !cpumask_subset(mask, cpumask_of(cpu)) )
     {
+        cpumask_t flush_cpumask;
+        struct flush_data data = { .va = va, .flags = flags };
+
         if ( cpu_has_hypervisor &&
              !(flags & ~(FLUSH_TLB | FLUSH_TLB_GLOBAL | FLUSH_VA_VALID |
                          FLUSH_ORDER_MASK)) &&
              !hypervisor_flush_tlb(mask, va, flags) )
             return;
 
-        spin_lock(&flush_lock);
         cpumask_and(&flush_cpumask, mask, &cpu_online_map);
         cpumask_clear_cpu(cpu, &flush_cpumask);
-        flush_va      = va;
-        flush_flags   = flags;
-        send_IPI_mask(&flush_cpumask, INVALIDATE_TLB_VECTOR);
-        while ( !cpumask_empty(&flush_cpumask) )
-            cpu_relax();
-        spin_unlock(&flush_lock);
+        on_selected_cpus(&flush_cpumask, invalidate_cb, &data, 1);
     }
 }
 
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 491cbbba33ae..51e6982a1d25 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -1482,6 +1482,5 @@ void __init smp_intr_init(void)
     /* Direct IPI vectors. */
     set_direct_apic_vector(IRQ_MOVE_CLEANUP_VECTOR, irq_move_cleanup_interrupt);
     set_direct_apic_vector(EVENT_CHECK_VECTOR, event_check_interrupt);
-    set_direct_apic_vector(INVALIDATE_TLB_VECTOR, invalidate_interrupt);
     set_direct_apic_vector(CALL_FUNCTION_VECTOR, call_function_interrupt);
 }
-- 
2.53.0


