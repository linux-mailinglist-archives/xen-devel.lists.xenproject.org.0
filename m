Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F216FD60C
	for <lists+xen-devel@lfdr.de>; Wed, 10 May 2023 07:14:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532611.828879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwc9N-0001LC-Re; Wed, 10 May 2023 05:14:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532611.828879; Wed, 10 May 2023 05:14:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwc9N-0001Ek-Lv; Wed, 10 May 2023 05:14:05 +0000
Received: by outflank-mailman (input) for mailman id 532611;
 Wed, 10 May 2023 00:18:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VlwF=A7=hotmail.com=rafael_andreas@srs-se1.protection.inumbo.net>)
 id 1pwXXS-0004li-Si
 for xen-devel@lists.xenproject.org; Wed, 10 May 2023 00:18:39 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02olkn20822.outbound.protection.outlook.com
 [2a01:111:f400:fe13::822])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 358ca281-eec8-11ed-b229-6b7b168915f2;
 Wed, 10 May 2023 02:18:38 +0200 (CEST)
Received: from DU0P192MB1700.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:3bf::6) by
 AM9P192MB0871.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:1fb::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.33; Wed, 10 May 2023 00:18:36 +0000
Received: from DU0P192MB1700.EURP192.PROD.OUTLOOK.COM
 ([fe80::5056:b334:c71f:b047]) by DU0P192MB1700.EURP192.PROD.OUTLOOK.COM
 ([fe80::5056:b334:c71f:b047%6]) with mapi id 15.20.6363.033; Wed, 10 May 2023
 00:18:36 +0000
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
X-Inumbo-ID: 358ca281-eec8-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mOEebGwVICUAf+35vIFZxHWtEeFJhyzGW5z1UKCJ0K/+KmFyo5xg+Pv4KR6HTKN9rzisSUl/sp29JXcW4JjNhyubBNDoQ0D5bmfHYwMAz3M4N3Ts8RL7bO8Af6jhJ7HK4Z33xo+poLIEKYBz8qZPFc69UT027pDW+NuOTRh7o+EMYkyj+8zDiCR9Vd9t1t7eD1teuFQ8qORT+MYzpyz7ahXKYhE/YQihP65Lv6heUJy8wEswqApBcWEqA1x2EG8YNuY8uhEMWejt5biyJbt0z8TwvnQRQfzqGT2kqvmXvLOb3Gui4gezsGI8HY5cIH+7cp5REs6/OXuyg1UOfOGoDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ET36M7cTJdg4CJ6NvtMlwqnICtej3ldCzYBd3kr2cj0=;
 b=YuLCM9JoFlMUB4UQNDkDR5C/o9F6Fi8AFSrnxJG8Et0jIZsGB9NpQ9kX/43nZydoBJzupohR3Ghtk108K5o9cSvWkhS0+OSYqLweuuaRfKvOD60tnnLVhrtdmj+HRlNY1JhxDRSuQmJ9SBP6f856BPe48kIDgW6qadct+gVMieiEQ00qQdDYS4mylhkFQP7p+HnL6ynJX0y7OG8M17k19bzPw9af6c7+QJtl3mIXXJ5CncPvN8Iz8O0ZczKLOsXJ43RYhDl9wt+OFpmiFbIIKdOvI4oGPVaswufpX3DpreizKSgyvYjSMLupbZWixJL4iP0UjKpd2tqRjKBnVxXcMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ET36M7cTJdg4CJ6NvtMlwqnICtej3ldCzYBd3kr2cj0=;
 b=oNExkE8UPjaq1+li7g+wT2UsONIAiV3UH9MAdKqTBTw17wIGc4GUznLazP7RlaQ6wUIQgxZ0TFL67QmaXGpT25Wr1HnM3dtzpzLOUDBh1mhmsxMxrnvGJ5rdf4WoSpXTVwoj3qVFAKUMgQrywV8cb4MlKITx/pZ5ZvdPFXKRVaNlmbRlFXJZQiT6brrn2HKJnpMQZcp/SOOItnq6I5OCalhIXJo6uQCcAduR1mfPbfXPIJTL3ZQYcDf44oiFzC0EQj9vkIOKc2WGn//KYe1PRJroLHaNZmW9pznxOEW5FYlqT1pusP6Xhlj7RMA6r0KpFIENlWhpo5NtdFOLUipkvw==
From: =?UTF-8?q?Rafa=C3=ABl=20Kooi?= <rafael_andreas@hotmail.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Rafa=C3=ABl=20Kooi?= <rafael_andreas@hotmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 1/2] xen/decompress: Add a user pointer for book keeping in the callbacks
Date: Wed, 10 May 2023 02:18:21 +0200
Message-ID:
 <DU0P192MB1700684CB8DF7B3845B64126E3779@DU0P192MB1700.EURP192.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <cover.1683673597.git.rafael_andreas@hotmail.com>
References: <cover.1683673597.git.rafael_andreas@hotmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TMN: [tSTPrSG+RMNi4PjUJiX8cv+iUoVEEwY8OMWFWNwu3UdjJOU6en9lzcwWbm24R6GF]
X-ClientProxiedBy: LO2P265CA0052.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::16) To DU0P192MB1700.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:10:3bf::6)
X-Microsoft-Original-Message-ID:
 <06c6d6eb57f2dffa036af44ac8d9cc3e9df6aad0.1683673598.git.rafael_andreas@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0P192MB1700:EE_|AM9P192MB0871:EE_
X-MS-Office365-Filtering-Correlation-Id: c2488a15-447a-4104-3ccb-08db50ec18a7
X-MS-Exchange-SLBlob-MailProps:
	AZnQBsB9Xmr6PcyLpofOFOY3OlYay91HJ3b9A+qmOPqQ9CxHjkFPP1tLatAmAKdGQVd0HMcrjUdFNDgYpjaMXKkNxlStevtGtWd8KtZf0Dxbhg3Xy9biPvwPr5+6EIHO3jy1tL4xUY3PR/QyPGct+KjDz47IqDKDzrMWEmI5IhRh1ddq66GtJ6ewGpFH07Js9OC6KOCB0RM8YTyjrp/3OFM+R9ay6kcha0Mr+DMJ/WqqZEKclNqmtEbVAYXEg2iexGV+7yiJy7IhF3G5MsmoN+WRsYYVWjConbbGhbDSbDkiDlR+v5Uu3ZQZ1HJDD+r6z4q5SYyuL5ZKIyIROy2h5K34UzrQAH7rlUb9vIYss7V7OsHA3V1pW/p27mbEZSnfgEICluj0UhcNwgxdMatZHofwE5LH5IEOybhzx7ph29ckd0WDMa6xXRe24zkYD5In0sUsaYjJZs6p1RxIoA7urgTbDRbF4RlX4FCQfqMkgXxnWdX+mWQ3CG/1YggpRbsp1tCxavF4LZhdRcGxDGddgmZSxKq1mfUsQH3tb42c8ox63dLNLzBFvkcalJ3bDEzmEx5FRCNUJY3IzsuTpulRQLhG68uvALqw1YXuVTXR1sWrohn65BsEeBbnaKB0LN01rZev8kPUgaBF8KmW4pUTW/HJ2ORh9nXgjPVvQe1FRpFbmiNR/IwvCiFr72rjn8UpDQVhDBon5Bcve4ORw59fQPZqX8NwvDYiJH/0sfaJbE5/5NQ/IE19eIZd8tCq+29BPuPdKoi5+f0=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AMMwcnNMK4U4RE52DktPQ6YGKy5Zzdp7knMJlDFrp6XSmYyYlwV3bGHQEKZoyOIV873Cm/S9V3gtvINsucn8q0YB3HzoGtVNeJCN2BymMiPeEpClpf1sHjPcCNaaY90SpkNPIRdRHILRKVRA+clftUuY1BpsgvXVlmZPvJl4GR8lQvHkKQvWLKnMGaCGbu3qgWnnBJ1WDTn7tNTVXm2Hkkwy2PvzDqbggyqoJSqZpPtE5UR1UO+WI1vukzUndBXIx7K6aIn3uX6Yg4eyOdfe2AGLycKloZzeDll7Gt3t6nkj5LOjpTn8JViu2dlm5R0z6sCBKrUS10DKZqDy52OCEbHv6H+EMNM+d48grS4no0JjNfd6sqiSINzl4Cz6QqYYc4TSkfoqG2pWDdb+nejTUv0iGSAYqE4kXnviE+xfhJbn/GDdgGm9Z/xpD0dEFeZcmaMdkPMTYXMF34mkCmKmnXVjtzRR6NS9WywSUD0zCrdyB0z5WoDAlgu6DbElHm4jXIEHGaUjLehuhGQDwvPQCAkE5NceqMjT3ru9UPF6LobNa8sn+bvZcbAdugP2DfL8UYld9Exu7x9CZBwe9t5S7jd2FlCovMxl5zxC7eMLlvTsfU6ZnShuZvRW3YunUrwi
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wm1GeEQwbE9WRlF6dG5pSkFWbGpVYTNiVTVpR1VBNnBlc2srajhjVW5VQ0FV?=
 =?utf-8?B?V0FVNVJrUlB1RUs0UVlmNklvVThRUU4xL2tFNms1ZkhqK3JsVERtYzVCVnAx?=
 =?utf-8?B?NVpKd3dJUS9pY2lBeHIrT1hOWXlFTTVyaFhiYitaWUpqTVYydFR5amg2YjZi?=
 =?utf-8?B?Sjd6QWU1WU5Zb3BNWjhLOE95c1hHNnRadStOVHJ5b1FZaUVUaGNaVURjNm9t?=
 =?utf-8?B?VUcwbDY1NWRrQjRNeFc5azdTNDdOd2lCV2RPcjJTU0FpRDJzYmxHN1dzQzV3?=
 =?utf-8?B?WG44cHdMTkdlUUZZMXNWcWRBNmJhUHJtdnRaYllXMXFtTW5Ud1RWRHFJK0tv?=
 =?utf-8?B?bHVJL09IQ2VBcmg5ZC82cjk2UnMwbU94UDNtQzFMTGhsQ3NydEx5eW8zQ0Vy?=
 =?utf-8?B?cUx4Y2ZRb0pSNlRGcjRmVTVYRGdZMmdWcC9tdE9JcU1zRjFRaU1nbWhMSTlO?=
 =?utf-8?B?andEbVBuazR4WUU4UVlaWkk1SEpKYlY3bDVkOHlkUTFXYWpaV3pZUXRlM1Jq?=
 =?utf-8?B?L2p6Q1RlWEdTaFQ2R3lDSkVlbVdtQmtNblhXMWZUVTZsZUtDVGlodHhaNUtw?=
 =?utf-8?B?SzIxUUtOUDhJN2FCTDFPMGtBV2VrRWtzamJZUjZMSFNCRTVtQmV2QVJVbG85?=
 =?utf-8?B?U1hzbEhraURkNFJidHluSXhmTVp5VXp3RjA5c09oYWllWkxTRzdhWnNGZjRL?=
 =?utf-8?B?QkpNNlhFM3hGUDBEeWJTWGJqMkhyYU5ySkc3dU1Ndm1rb3JYb0FTaDRNOWJ1?=
 =?utf-8?B?T2lEM05sQjlqWWZyVThRRDhHVnpGcUg3b3k4YmErRytBaE1WTFBLY3lEWTVE?=
 =?utf-8?B?d3ZQbGUvajNDMzQ3MElZb3FuUDZaV0lVN0xEd0pPQys0VWdpNnlVN0VLV2FB?=
 =?utf-8?B?eFF2MmJ1QUhGcmlTc0h1ZjlMNzl2WndyTFhnNmduSEJGdFFjdXZQT2piUEJ6?=
 =?utf-8?B?T0dwSy9JZXVwb0xDamowTlNRNDFMU01uclNnR1RQd0R0eUpGQkZiQjJJcFpK?=
 =?utf-8?B?VGhpQlB3bjhJZ01RajcyRC9Tejl1SXpPKys5UzFJZGxWZG9OTkdyK3V3UGxX?=
 =?utf-8?B?MTIxWTBWMVlONmI4QVZ3d202UFFITkZ2ZjFBLzR3U1YyZ0ZPSjZnblR2cUNm?=
 =?utf-8?B?V09FcUNvM2QzYzJ1ZnNmVnJMVDBhdnhvN2FFNVlJM01mdEFoRjNQQm13eEov?=
 =?utf-8?B?RlFRU1hmMDBFN2tUK1o5TXJXUkRueTNBV1RoNDdkb0xFdmhxeGdVK20vcEc0?=
 =?utf-8?B?N0psYWhnZktPQ1ZSd29KeWtrSEdIdlEyVW1TbmRCaWNPOGFTUjUvMlZQVGNP?=
 =?utf-8?B?ZjZmZWY2d0szK3ppTGRhTWhHcmRVZGdjYlpxeW01U0xha1J2N3dpWFRGNXVX?=
 =?utf-8?B?UForMlRXK083b1hRZysrZ1VHenFjTVJZa3VRVlFsU3F1cmV2eDJEVlFic3pD?=
 =?utf-8?B?VzlpbTJLTXR3SlRNRW5YOW9YdktlNWVKTklIeEhBWkZRb2VuVUVxRUtyUVpD?=
 =?utf-8?B?L294WUtVK2hUTnp1VWtybUJ1am5UTmVoNTZsZzNDanJZakFLNXZhOW42TDNj?=
 =?utf-8?B?QjUyV2p0alFPYTVsNFZLVVNqT01kSjdWdnZuVlpzVjlwTHZHWnNCV01SSlAw?=
 =?utf-8?B?V2FwRkFRY1doenNmdXZKUUNBUTlYQ29wY2t3dHlSOTFYMmN0SUd6ZHBpZ1ow?=
 =?utf-8?B?S1d4RnJmdVBja0h4REFiNGlIdVNuRTZXWVkzSkNzajFHM1RqQjIyVzhUK2Za?=
 =?utf-8?Q?RZ24vXXbu4o1BlYhVA=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-fb43a.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: c2488a15-447a-4104-3ccb-08db50ec18a7
X-MS-Exchange-CrossTenant-AuthSource: DU0P192MB1700.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 00:18:36.3371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P192MB0871

Before this change the callbacks either needed to be completely
stateless or use global state for book keeping. In the case where book
keeping is needed we can't use global state in decompress.c because the
linker disallows the existence of the .data and .bss segments. This
change allows for localized book keeping with the user pointer.

Signed-off-by: Rafaël Kooi <rafael_andreas@hotmail.com>
---
 xen/common/bunzip2.c         | 23 +++++++++++++----------
 xen/common/unlz4.c           | 15 ++++++++-------
 xen/common/unlzma.c          | 30 ++++++++++++++++++------------
 xen/common/unlzo.c           | 13 +++++++------
 xen/common/unxz.c            | 11 ++++++-----
 xen/common/unzstd.c          | 13 +++++++------
 xen/include/xen/decompress.h | 10 +++++++---
 7 files changed, 66 insertions(+), 49 deletions(-)

diff --git a/xen/common/bunzip2.c b/xen/common/bunzip2.c
index 4466426941..a854046524 100644
--- a/xen/common/bunzip2.c
+++ b/xen/common/bunzip2.c
@@ -1,4 +1,4 @@
-/* vi: set sw = 4 ts = 4: */
+/* vi: set sw=4 ts=4: */
 /*	Small bzip2 deflate implementation, by Rob Landley (rob@landley.net).
 
 	Based on bzip2 decompression code by Julian R Seward (jseward@acm.org),
@@ -86,7 +86,7 @@ struct bunzip_data {
 	/* State for interrupting output loop */
 	int writeCopies, writePos, writeRunCountdown, writeCount, writeCurrent;
 	/* I/O tracking data (file handles, buffers, positions, etc.) */
-	int (*fill)(void*, unsigned int);
+	int (*fill)(void*, unsigned int, void*);
 	int inbufCount, inbufPos /*, outbufPos*/;
 	unsigned char *inbuf /*,*outbuf*/;
 	unsigned int inbufBitCount, inbufBits;
@@ -99,6 +99,7 @@ struct bunzip_data {
 	unsigned char selectors[32768];		/* nSelectors = 15 bits */
 	struct group_data groups[MAX_GROUPS];	/* Huffman coding tables */
 	int io_error;			/* non-zero if we have IO error */
+	void *userptr;			/* user pointer to pass to fill */
 };
 
 
@@ -117,7 +118,7 @@ static unsigned int __init get_bits(struct bunzip_data *bd, char bits_wanted)
 		if (bd->inbufPos == bd->inbufCount) {
 			if (bd->io_error)
 				return 0;
-			bd->inbufCount = bd->fill(bd->inbuf, BZIP2_IOBUF_SIZE);
+			bd->inbufCount = bd->fill(bd->inbuf, BZIP2_IOBUF_SIZE, bd->userptr);
 			if (bd->inbufCount <= 0) {
 				bd->io_error = RETVAL_UNEXPECTED_INPUT_EOF;
 				return 0;
@@ -612,7 +613,7 @@ decode_next_byte:
 	goto decode_next_byte;
 }
 
-static int __init cf_check nofill(void *buf, unsigned int len)
+static int __init cf_check nofill(void *buf, unsigned int len, void *userptr)
 {
 	return -1;
 }
@@ -621,7 +622,7 @@ static int __init cf_check nofill(void *buf, unsigned int len)
    a complete bunzip file (len bytes long).  If in_fd!=-1, inbuf and len are
    ignored, and data is read from file handle into temporary buffer. */
 static int __init start_bunzip(struct bunzip_data **bdp, void *inbuf, int len,
-			       int (*fill)(void*, unsigned int))
+			       int (*fill)(void*, unsigned int, void*), void *userptr)
 {
 	struct bunzip_data *bd;
 	unsigned int i, j, c;
@@ -644,6 +645,7 @@ static int __init start_bunzip(struct bunzip_data **bdp, void *inbuf, int len,
 		bd->fill = fill;
 	else
 		bd->fill = nofill;
+	bd->userptr = userptr;
 
 	/* Init the CRC32 table (big endian) */
 	for (i = 0; i < 256; i++) {
@@ -671,10 +673,11 @@ static int __init start_bunzip(struct bunzip_data **bdp, void *inbuf, int len,
 /* Example usage: decompress src_fd to dst_fd.  (Stops at end of bzip2 data,
    not end of file.) */
 int __init bunzip2(unsigned char *buf, unsigned int len,
-		   int(*fill)(void*, unsigned int),
-		   int(*flush)(void*, unsigned int),
+		   int(*fill)(void*, unsigned int, void*),
+		   int(*flush)(void*, unsigned int, void*),
 		   unsigned char *outbuf, unsigned int *pos,
-		   void(*error)(const char *x))
+		   void(*error)(const char *x),
+		   void *userptr)
 {
 	struct bunzip_data *bd;
 	int i = -1;
@@ -696,7 +699,7 @@ int __init bunzip2(unsigned char *buf, unsigned int len,
 		i = RETVAL_OUT_OF_MEMORY;
 		goto exit_0;
 	}
-	i = start_bunzip(&bd, inbuf, len, fill);
+	i = start_bunzip(&bd, inbuf, len, fill, userptr);
 	if (!i) {
 		for (;;) {
 			i = read_bunzip(bd, outbuf, BZIP2_IOBUF_SIZE);
@@ -705,7 +708,7 @@ int __init bunzip2(unsigned char *buf, unsigned int len,
 			if (!flush)
 				outbuf += i;
 			else
-				if (i != flush(outbuf, i)) {
+				if (i != flush(outbuf, i, userptr)) {
 					i = RETVAL_UNEXPECTED_OUTPUT_EOF;
 					break;
 				}
diff --git a/xen/common/unlz4.c b/xen/common/unlz4.c
index 2096b98f36..00c179732e 100644
--- a/xen/common/unlz4.c
+++ b/xen/common/unlz4.c
@@ -23,10 +23,11 @@
 #define ARCHIVE_MAGICNUMBER 0x184C2102
 
 int __init unlz4(unsigned char *input, unsigned int in_len,
-		 int (*fill)(void *, unsigned int),
-		 int (*flush)(void *, unsigned int),
+		 int (*fill)(void *, unsigned int, void*),
+		 int (*flush)(void *, unsigned int, void*),
 		 unsigned char *output, unsigned int *posp,
-		 void (*error)(const char *x))
+		 void (*error)(const char *x),
+		 void *userptr)
 {
 	int ret = -1;
 	size_t chunksize = 0;
@@ -75,7 +76,7 @@ int __init unlz4(unsigned char *input, unsigned int in_len,
 		*posp = 0;
 
 	if (fill)
-		fill(inp, 4);
+		fill(inp, 4, userptr);
 
 	chunksize = get_unaligned_le32(inp);
 	if (chunksize == ARCHIVE_MAGICNUMBER) {
@@ -92,7 +93,7 @@ int __init unlz4(unsigned char *input, unsigned int in_len,
 	for (;;) {
 
 		if (fill)
-			fill(inp, 4);
+			fill(inp, 4, userptr);
 
 		chunksize = get_unaligned_le32(inp);
 		if (chunksize == ARCHIVE_MAGICNUMBER) {
@@ -113,7 +114,7 @@ int __init unlz4(unsigned char *input, unsigned int in_len,
 				error("chunk length is longer than allocated");
 				goto exit_2;
 			}
-			fill(inp, chunksize);
+			fill(inp, chunksize, userptr);
 		}
 #if defined(__XEN__) || defined(__MINIOS__)
 		if (out_len >= uncomp_chunksize) {
@@ -133,7 +134,7 @@ int __init unlz4(unsigned char *input, unsigned int in_len,
 		}
 
 		ret = -1;
-		if (flush && flush(outp, dest_len) != dest_len)
+		if (flush && flush(outp, dest_len, userptr) != dest_len)
 			goto exit_2;
 		if (output)
 			outp += dest_len;
diff --git a/xen/common/unlzma.c b/xen/common/unlzma.c
index 6cd99023ad..d5dbc44881 100644
--- a/xen/common/unlzma.c
+++ b/xen/common/unlzma.c
@@ -59,7 +59,7 @@ static long long __init read_int(unsigned char *ptr, int size)
 #define LZMA_IOBUF_SIZE	0x10000
 
 struct rc {
-	int (*fill)(void*, unsigned int);
+	int (*fill)(void*, unsigned int, void*);
 	uint8_t *ptr;
 	uint8_t *buffer;
 	uint8_t *buffer_end;
@@ -68,6 +68,7 @@ struct rc {
 	uint32_t range;
 	uint32_t bound;
 	void (*error)(const char *);
+	void *userptr;
 };
 
 
@@ -76,7 +77,7 @@ struct rc {
 #define RC_MODEL_TOTAL_BITS 11
 
 
-static int __init cf_check nofill(void *buffer, unsigned int len)
+static int __init cf_check nofill(void *buffer, unsigned int len, void *userptr)
 {
 	return -1;
 }
@@ -84,7 +85,7 @@ static int __init cf_check nofill(void *buffer, unsigned int len)
 /* Called twice: once at startup and once in rc_normalize() */
 static void __init rc_read(struct rc *rc)
 {
-	rc->buffer_size = rc->fill((char *)rc->buffer, LZMA_IOBUF_SIZE);
+	rc->buffer_size = rc->fill((char *)rc->buffer, LZMA_IOBUF_SIZE, rc->userptr);
 	if (rc->buffer_size <= 0)
 		rc->error("unexpected EOF");
 	rc->ptr = rc->buffer;
@@ -93,8 +94,9 @@ static void __init rc_read(struct rc *rc)
 
 /* Called once */
 static inline void __init rc_init(struct rc *rc,
-				  int (*fill)(void*, unsigned int),
-				  unsigned char *buffer, int buffer_size)
+				  int (*fill)(void*, unsigned int, void*),
+				  unsigned char *buffer, int buffer_size,
+				  void *userptr)
 {
 	if (fill)
 		rc->fill = fill;
@@ -104,6 +106,7 @@ static inline void __init rc_init(struct rc *rc,
 	rc->buffer_size = buffer_size;
 	rc->buffer_end = rc->buffer + rc->buffer_size;
 	rc->ptr = rc->buffer;
+	rc->userptr = userptr;
 
 	rc->code = 0;
 	rc->range = 0xFFFFFFFF;
@@ -274,8 +277,9 @@ struct writer {
 	size_t buffer_pos;
 	int bufsize;
 	size_t global_pos;
-	int(*flush)(void*, unsigned int);
+	int(*flush)(void*, unsigned int, void*);
 	struct lzma_header *header;
+	void *userptr;
 };
 
 struct cstate {
@@ -313,7 +317,7 @@ static inline int __init write_byte(struct writer *wr, uint8_t byte)
 	if (wr->flush && wr->buffer_pos == wr->header->dict_size) {
 		wr->buffer_pos = 0;
 		wr->global_pos += wr->header->dict_size;
-		if (wr->flush((char *)wr->buffer, wr->header->dict_size)
+		if (wr->flush((char *)wr->buffer, wr->header->dict_size, wr->userptr)
 				!= wr->header->dict_size)
 			return -1;
 	}
@@ -529,10 +533,11 @@ static inline int __init process_bit1(struct writer *wr, struct rc *rc,
 
 
 int __init unlzma(unsigned char *buf, unsigned int in_len,
-		  int(*fill)(void*, unsigned int),
-		  int(*flush)(void*, unsigned int),
+		  int(*fill)(void*, unsigned int, void*),
+		  int(*flush)(void*, unsigned int, void*),
 		  unsigned char *output, unsigned int *posp,
-		  void(*error)(const char *x))
+		  void(*error)(const char *x),
+		  void *userptr)
 {
 	struct lzma_header header;
 	int lc, pb, lp;
@@ -566,8 +571,9 @@ int __init unlzma(unsigned char *buf, unsigned int in_len,
 	wr.global_pos = 0;
 	wr.previous_byte = 0;
 	wr.buffer_pos = 0;
+	wr.userptr = userptr;
 
-	rc_init(&rc, fill, inbuf, in_len);
+	rc_init(&rc, fill, inbuf, in_len, userptr);
 
 	for (i = 0; i < sizeof(header); i++) {
 		if (rc.ptr >= rc.buffer_end)
@@ -644,7 +650,7 @@ int __init unlzma(unsigned char *buf, unsigned int in_len,
 
 	if (posp)
 		*posp = rc.ptr-rc.buffer;
-	if (!wr.flush || wr.flush(wr.buffer, wr.buffer_pos) == wr.buffer_pos)
+	if (!wr.flush || wr.flush(wr.buffer, wr.buffer_pos, wr.userptr) == wr.buffer_pos)
 		ret = 0;
 exit_3:
 	large_free(p);
diff --git a/xen/common/unlzo.c b/xen/common/unlzo.c
index 74056778eb..8908790425 100644
--- a/xen/common/unlzo.c
+++ b/xen/common/unlzo.c
@@ -115,10 +115,11 @@ static int __init parse_header(u8 *input, int *skip, int in_len)
 }
 
 int __init unlzo(unsigned char *input, unsigned int in_len,
-		 int (*fill) (void *, unsigned int),
-		 int (*flush) (void *, unsigned int),
+		 int (*fill) (void *, unsigned int, void*),
+		 int (*flush) (void *, unsigned int, void*),
 		 unsigned char *output, unsigned int *posp,
-		 void (*error) (const char *x))
+		 void (*error) (const char *x),
+		 void *userptr)
 {
 	u8 r = 0;
 	int skip = 0;
@@ -161,7 +162,7 @@ int __init unlzo(unsigned char *input, unsigned int in_len,
 		*posp = 0;
 
 	if (fill)
-		fill(in_buf, lzo1x_worst_compress(LZO_BLOCK_SIZE));
+		fill(in_buf, lzo1x_worst_compress(LZO_BLOCK_SIZE), userptr);
 
 	if (!parse_header(input, &skip, in_len)) {
 		error("invalid header");
@@ -227,7 +228,7 @@ int __init unlzo(unsigned char *input, unsigned int in_len,
 			}
 		}
 
-		if (flush && flush(out_buf, dst_len) != dst_len)
+		if (flush && flush(out_buf, dst_len, userptr) != dst_len)
 			goto exit_2;
 		if (output)
 			out_buf += dst_len;
@@ -235,7 +236,7 @@ int __init unlzo(unsigned char *input, unsigned int in_len,
 			*posp += src_len + 12;
 		if (fill) {
 			in_buf = in_buf_save;
-			fill(in_buf, lzo1x_worst_compress(LZO_BLOCK_SIZE));
+			fill(in_buf, lzo1x_worst_compress(LZO_BLOCK_SIZE), userptr);
 		} else {
 			in_buf += src_len;
 			in_len -= src_len;
diff --git a/xen/common/unxz.c b/xen/common/unxz.c
index 17aead0adf..6f005170d3 100644
--- a/xen/common/unxz.c
+++ b/xen/common/unxz.c
@@ -158,10 +158,11 @@
  * fill() and flush() won't be used.
  */
 int __init unxz(unsigned char *in, unsigned int in_size,
-		int (*fill)(void *dest, unsigned int size),
-		int (*flush)(void *src, unsigned int size),
+		int (*fill)(void *dest, unsigned int size, void *userptr),
+		int (*flush)(void *src, unsigned int size, void *userptr),
 		unsigned char *out, unsigned int *in_used,
-		void (*error)(const char *x))
+		void (*error)(const char *x),
+		void *userptr)
 {
 	struct xz_buf b;
 	struct xz_dec *s;
@@ -213,7 +214,7 @@ int __init unxz(unsigned char *in, unsigned int in_size,
 
 				b.in_pos = 0;
 
-				in_size = fill(in, XZ_IOBUF_SIZE);
+				in_size = fill(in, XZ_IOBUF_SIZE, userptr);
 				if ((int) in_size < 0) {
 					/*
 					 * This isn't an optimal error code
@@ -236,7 +237,7 @@ int __init unxz(unsigned char *in, unsigned int in_size,
 				 * returned by xz_dec_run(), but probably
 				 * it's not too bad.
 				 */
-				if (flush(b.out, b.out_pos) != (int)b.out_pos)
+				if (flush(b.out, b.out_pos, userptr) != (int)b.out_pos)
 					ret = XZ_BUF_ERROR;
 
 				b.out_pos = 0;
diff --git a/xen/common/unzstd.c b/xen/common/unzstd.c
index 47073dd3e3..09e8fdef04 100644
--- a/xen/common/unzstd.c
+++ b/xen/common/unzstd.c
@@ -143,10 +143,11 @@ out:
 }
 
 int __init unzstd(unsigned char *in_buf, unsigned int in_len,
-		  int (*fill)(void*, unsigned int),
-		  int (*flush)(void*, unsigned int),
+		  int (*fill)(void*, unsigned int, void*),
+		  int (*flush)(void*, unsigned int, void*),
 		  unsigned char *out_buf, unsigned int *in_pos,
-		  void (*error)(const char *x))
+		  void (*error)(const char *x),
+		  void *userptr)
 {
 	ZSTD_inBuffer in;
 	ZSTD_outBuffer out;
@@ -190,7 +191,7 @@ int __init unzstd(unsigned char *in_buf, unsigned int in_len,
 	}
 	/* Read the first chunk, since we need to decode the frame header. */
 	if (fill != NULL)
-		in_len = fill(in_buf, ZSTD_IOBUF_SIZE);
+		in_len = fill(in_buf, ZSTD_IOBUF_SIZE, userptr);
 	if ((int)in_len < 0) {
 		error("ZSTD-compressed data is truncated");
 		err = -1;
@@ -267,7 +268,7 @@ int __init unzstd(unsigned char *in_buf, unsigned int in_len,
 		if (in.pos == in.size) {
 			if (in_pos != NULL)
 				*in_pos += in.pos;
-			in_len = fill ? fill(in_buf, ZSTD_IOBUF_SIZE) : -1;
+			in_len = fill ? fill(in_buf, ZSTD_IOBUF_SIZE, userptr) : -1;
 			if ((int)in_len < 0) {
 				error("ZSTD-compressed data is truncated");
 				err = -1;
@@ -283,7 +284,7 @@ int __init unzstd(unsigned char *in_buf, unsigned int in_len,
 			goto out;
 		/* Flush all of the data produced if using flush(). */
 		if (flush != NULL && out.pos > 0) {
-			if (out.pos != flush(out.dst, out.pos)) {
+			if (out.pos != flush(out.dst, out.pos, userptr)) {
 				error("Failed to flush()");
 				err = -1;
 				goto out;
diff --git a/xen/include/xen/decompress.h b/xen/include/xen/decompress.h
index f5bc17f2b6..804dbca963 100644
--- a/xen/include/xen/decompress.h
+++ b/xen/include/xen/decompress.h
@@ -2,10 +2,11 @@
 #define __XEN_GENERIC_H
 
 typedef int decompress_fn(unsigned char *inbuf, unsigned int len,
-                          int (*fill)(void*, unsigned int),
-                          int (*flush)(void*, unsigned int),
+                          int (*fill)(void*, unsigned int, void*),
+                          int (*flush)(void*, unsigned int, void*),
                           unsigned char *outbuf, unsigned int *posp,
-                          void (*error)(const char *x));
+                          void (*error)(const char *x),
+                          void *userptr);
 
 /* inbuf   - input buffer
  * len     - len of pre-read data in inbuf
@@ -15,6 +16,7 @@ typedef int decompress_fn(unsigned char *inbuf, unsigned int len,
  * posp    - if non-null, input position (number of bytes read) will be
  *           returned here
  * error   - error reporting function
+ * userptr - user pointer to pass to flush and fill
  *
  * If len != 0, inbuf should contain all the necessary input data, and fill
  * should be NULL
@@ -29,6 +31,8 @@ typedef int decompress_fn(unsigned char *inbuf, unsigned int len,
  * decompressor (outbuf = NULL), and the flush function will be called to
  * flush the output buffer at the appropriate time (decompressor and stream
  * dependent).
+ *
+ * Flush and fill's third argument is a user pointer for book keeping purposes.
  */
 
 decompress_fn bunzip2, unxz, unlzma, unlzo, unlz4, unzstd;
-- 
2.40.0


