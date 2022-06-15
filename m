Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE23D54C54C
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jun 2022 12:00:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.349840.576023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1PpC-0004g4-SN; Wed, 15 Jun 2022 10:00:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 349840.576023; Wed, 15 Jun 2022 10:00:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1PpC-0004e1-Og; Wed, 15 Jun 2022 10:00:34 +0000
Received: by outflank-mailman (input) for mailman id 349840;
 Wed, 15 Jun 2022 10:00:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=56zs=WW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o1Pp9-0001TN-Nh
 for xen-devel@lists.xenproject.org; Wed, 15 Jun 2022 10:00:32 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02on060f.outbound.protection.outlook.com
 [2a01:111:f400:fe05::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id faab09f1-ec91-11ec-ab14-113154c10af9;
 Wed, 15 Jun 2022 12:00:27 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8922.eurprd04.prod.outlook.com (2603:10a6:20b:409::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.22; Wed, 15 Jun
 2022 10:00:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.020; Wed, 15 Jun 2022
 10:00:23 +0000
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
X-Inumbo-ID: faab09f1-ec91-11ec-ab14-113154c10af9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XXvdUIKXiFgnk8HNvb3iNQLGv5X4dZbd9QaRA9BakRARHlAD4VcTj69qBB6nR25AA0kiru3YGDQih/Fq2a9iVhP6SN58PMCI1FG4/UIgilrUbDteeft3wMRxH3K/F9UN1U1AjGxSayWMCGPs2d8KPRJUqfiiVMHebwdqsr2zItawmskPANDawyx+dn105jGNEYScnJe1yNKYLelmkdiA4CZ9ChrJPpJC32JBUf2iZA738/wyb3VgBN2aQTHycdJhyVIz0KNJ4DK6o5mawpv+PWLMhTdvhptUN8zBqC7ZbgFatRS23+YPYctm39uaQ4x8hkovdDa6vjbIfN+eFVt7gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AvQ/sd0ff44RR7TRadc587zbGi4Hi8kh03vW/b/TdBE=;
 b=O0LvfUMT2RjvKOTpP3QLTdvGyPe714Ak/RNVIvznWW6+NUKBAwor7d60LFKo5W9UUphCZoTXClXt/roFG9ybnbUe87GBCMrjckZTs13yBEpRExmK1zmkcJofZLdmZfJnbK6tESpPyIs4EYMlMCetG1YN/w1/EGBddg6KFciBkSHScjlkWvVZ183A4w33iCcowxN7D8AXaUJnKrnwDcPs6Mbez4Ql6Rvgi2Mh/Ej+B04+se5jfFNxhVgRre9IWMK1FqLKzuNGC3o8GBxwS8kObVSu8xRvd3FUJIkzCU5FF9xPrKHRVXyapGM/AESGY5TtpzNP94IEUb9YxS/mwcB5SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AvQ/sd0ff44RR7TRadc587zbGi4Hi8kh03vW/b/TdBE=;
 b=2B/atoDs61KOq4gies3UP/HqDLwoXoUJ5hTCMo0YzlIMzxcGd5TRGo/uO+hfjfNyeANvfvtTpsh+vMibiC/e5YDb4wuYkmu7GzFeRy3YIi97nGuAWikt8qzuqFrJ937EDSP9WZ/y+GlDDZk31BolIBm6AAxKHMRZTdtSUgztq1MUM0BNeTw7GVFgdY+55nqlvXwXPm4fLTynbdpZEG0yIyZO1gflW1/e6Cfnir0192pFo68ku+FRJOpn66AbI+gCKO94huFHq9E+K6V2YAm/oA/T1ePQsp0YqKDuY3CbRuY5jleY+urCA+y6ZGzgICPkh5xJtl4APxvwTihkyxgUOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a17f35c2-b1ef-0ae5-e1ce-99f34c63c77d@suse.com>
Date: Wed, 15 Jun 2022 12:00:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: [PATCH v2 5/8] x86emul: split off insn decoding
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <7f5287ad-8442-6c53-d513-f9a8345c4857@suse.com>
In-Reply-To: <7f5287ad-8442-6c53-d513-f9a8345c4857@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0013.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73193ec0-7c76-4979-3816-08da4eb5dcbc
X-MS-TrafficTypeDiagnostic: AM9PR04MB8922:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB8922D3CDEB2BC3FFD5E3B82FB3AD9@AM9PR04MB8922.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	soqXSt1DM0SULDLSabSHfKFpxs4zUoH1OdOiusVWqBZnyN+AOa+KOMSAG/tfVn/LL/y9WePTtf0VKcBMDTi1n6xImWQNL2hQKJdnOEoWJl5dOYBUGW2RtYfIOKw42S8RsOlOQukV4wHEeiAg4T62uIBDWHsjoR5n1woEYonsGUAvFGy3Qs3HsuwVWFhC6qrwabgCjBLFt3WVjtYy2nfkAOlGdwRB6OPrgjQyN9/HROQ26SCwBLghzyo8X6ilp1neyPH/ldqEZTyppyhoAvRZYdcWtTKwAwVllY/VNB2ifIxcRbQCqVeMvTxoOTOHN8cUBCppaOVtZX6R5aZUDGoKr7da0zXBnrlAOtDAT4ZqAM6+VUZU3rSWLs3iffrH3mUfPOYN2FHnea71sZlvSxIaz5zZT0H7sTyvdRiV+Wbmd2+WIn7QAFgcmwikbl37q3thXq9r+TBVEG7XwErS8E+qKO41+UVTNgR7EtHI/K7qNwkI1BqFGj5cq329FIWhHzhgTHnCXFsDZRe3vc7C1bt/QnBgcO2ikYpXLKIY+AzKo+TTzIvlcrMhcP72FeQqw6r629ei59FiIrzTWnCJMgWvBiSoOkOt/WzjiOyhzOENjl334AhFN5OSvabFJWOwcsk/8aQkkYLKRQ5HhI5ZENRs2RhI3gZaOv6yYXMYHWR61DwEzO0exIUpZxATc6hNJoLRgjJuDWGgC5PFVEaPSdu247IkNeUQdvBI3pDS8ArTXmqL4gjHaECuSGFBiwAQEV6aJgG5WRk4paO+RAKR62nJV2Yp/fCELYpqfpDZGkaiOfHWhS1rJBQdxvHqN0APeZS0bUlT4Auo/o9T+evwh7lvaQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(83380400001)(186003)(2616005)(31686004)(36756003)(38100700002)(2906002)(6512007)(316002)(6486002)(5660300002)(86362001)(6506007)(66556008)(26005)(6916009)(508600001)(8676002)(66946007)(4326008)(8936002)(66476007)(31696002)(54906003)(30864003)(2004002)(45980500001)(43740500002)(579004)(559001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmxtY0tCTVFSRmVLQnQwYVRSdldublcxWm5HUE0remU0MG4vMFhrM25zYzVz?=
 =?utf-8?B?MEFlMENNcVdIMjJCbzgxWkpZK09QU2RYTXFyeGtiT3piQ1BobTU5K1QxbWtK?=
 =?utf-8?B?V05GeTZmSWZXRnQ5b2pla0pVaUxDaFpwQUsrblkxZkNETmo2Snc1aVdBMzE0?=
 =?utf-8?B?M1hKU0Y1WEpmNDVZYkVFZWx1YXhKTHhSWTZGVWU0UHBBYVl3cmpwSEFkN3Fy?=
 =?utf-8?B?bXFHREZIWXZEQnlkNmplOWU0MFNiTXBxeWQrQ3lBN2dQd0Eyc1ZVY3JicmU2?=
 =?utf-8?B?VWRnK3ZacmRISkhBejAxZVppNWM3MTc2THNVUmZITzVFbDNUMS8zYnNSb1lQ?=
 =?utf-8?B?eHBLc2ZVT0luZFdPRUtKeCtiTzE5S3RBWlZaYTVmNDBIaXZmUFN6b1hCYWRK?=
 =?utf-8?B?aXhkM0Y1L3Q0MjZWTlJrSzVoWDNIRFhhVXI0WjlYUTl5cHZzZkRtejdUazhk?=
 =?utf-8?B?My9XVHNFOXk1SXE1MzZ0b1UwNTBnbFNPNnAxcXBscUh2eXdueGZvWk5MbXJ4?=
 =?utf-8?B?YlpYSSt2M2Y5T2s3V3ZCTEtJL3FNbEFsRDFVOGVXYVREQ3JXT0M3VVRRcldG?=
 =?utf-8?B?K1UyYy9IR2tQOSs5Uk44cEFXRVRoeFdETkRteXFodk8rMDJiZVlnNysybGRi?=
 =?utf-8?B?YmZiY3VwNTJtQzg2MSswRWFtdlEzbXNFcCs1cktSUHJRTHpBVzAzWHptTnJG?=
 =?utf-8?B?L1BpUko1dzF6MTF6VkI1MzVtZWFmLzlNci9HbWNjNDdBM29YYzVDakFWUXRx?=
 =?utf-8?B?L3FmQnlaNGVoODQ2Yi9jYkF4U3VlN3ozdFpZeDhQT0tjVGZOdk5qZUpOZ3ZB?=
 =?utf-8?B?K3A5ZWxtOXF6VjhXWlVyV0FsUjNpRksvdWhDYXVuWWFJU0pmcDZGOUZSblNW?=
 =?utf-8?B?Y0FCVmRJS2dVQW0rOGVieTloeGZSVTFjR1NOTDI1UHNXVGZTdDZKMHlNZVBL?=
 =?utf-8?B?QmYxZGhINFFJRXJwOVNqQWlLQlUybjkxYUQvdHRMdkRwb3NwOE5UN1R2N3hk?=
 =?utf-8?B?V2FqNFlVbWtDTHY1ZlZ0WHQ0MG80amdtYS9YUURkSTBVTXpYK25memtwTzdB?=
 =?utf-8?B?MC9MSGt6dDRTREc4SFRDZXRKZFVMTWZuN21zUUZtOEs5MTZEUmJXbnRhSjBO?=
 =?utf-8?B?cUoyejAzOGIwaktoak8vbHpiaHFMWHhmd1BhRnk3WFBrMGdBWXE1aWFBS0VH?=
 =?utf-8?B?RmYrclNFaGhFRXVreU8raEk0UlBMYVBLdEp1a2F4dDZlSks5QW4wQjg5eW55?=
 =?utf-8?B?RktyVWFlQlo3UWtBZ2Y4eGhIci9yOXBzVDJzRjM3cyt1Z3F4dS8xK1FJTjlT?=
 =?utf-8?B?a2tCTm1yK3VhVDlUanplcHNISjR0UnUvckJiNUtPSVQxYUE5WXZnZ0liYlUz?=
 =?utf-8?B?cTM3TVdtS0o0OWNxdDZWNFYzV3dEU3N6UXdldmxpalZBQTZXZW96My9VbzQz?=
 =?utf-8?B?MU1ZTzdBRGhxSW5NaW9XTFFRNTJGd2MzTklYVjlLZ2hmdFdVSTZPbnVTMXpJ?=
 =?utf-8?B?L2VHZkxBanJ0Z0hVd041SU1Ta2crVUNCaUI5dGdRSnk4U2JkbDUrQUxNbnM5?=
 =?utf-8?B?b3UyWEJZek1TcER2amFvbzZ5VGFLR3hrY29DQnp2MG1MbENNQmV0QlBPMFk0?=
 =?utf-8?B?d3ZBWlNKWXlHSWdHN3oxQ2xSWFNMV3M3YUN2VzFYTzgzM09tMUhweVQ0akJ1?=
 =?utf-8?B?alRsQzd6MTFrVnFEQzFORVZHcHdXVGxNSUFlOFhYNmxuWDQyeXk2NC9XUGlR?=
 =?utf-8?B?WkdqUXArU2pYbkR3QW9MRll5VzR4TDNSb3c3LzNBY0VpNlVTYVN1dytUVmpI?=
 =?utf-8?B?SFBsamNDbERJVXgxV3U5UXZ2WTNoUmRzMHBVWlE4Y0J2amxtaWRNUGxvaVV1?=
 =?utf-8?B?dGJiaFVaUllMUmpneFg2Vm41TUNEU1AyM1oxVlp2SjlCRlN1ZU1FaENQZHZ0?=
 =?utf-8?B?TFZPd09qbTNUQ3lzdEdFWEloQUhVd0xMb2d0UCswNXpNNjFxSWZFMTBqNXZ2?=
 =?utf-8?B?c29WcGJELzdwcEdYL24zMnBsWTRuWm9pbEZLN3dTSXFBaW9MZGxjRzdYT3N6?=
 =?utf-8?B?eXgvblMxUHlNbFg0M3d4eUNTeEkvMEs0TTdTYlBvNjNVVEc1dXZ0aEVNUlli?=
 =?utf-8?B?TGZjU3BGQVVrTmVoTXk3ekpHTnc4ZFRpdWluTWFqUmhETUxuQ3VWZkNGTzNt?=
 =?utf-8?B?NEYzQXgwTUd1Zy9IdXBVOUIyS2M3QmlpWUNRT25HWHBseWl0OS9ZbGJFQTVr?=
 =?utf-8?B?eHVDcVZuQXNUd1ZjbHdFK3VKclBtMWZwSmNDZTVaQ0JyRnB4SFlaYUcrUjJk?=
 =?utf-8?B?bDA5NkIvOVI2cmszSEhTaVd0a3ZoNDlPM3ZPRW96azRvTEdDYU44QT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73193ec0-7c76-4979-3816-08da4eb5dcbc
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 10:00:22.8216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NRpeh/UuuomPR+FTTTVqmv/3dzckZUNW8sxcRL7r/jBnrF9qTDO7fX/cEsepd4xCrg/cvGaFSrH+b/ABV3AXmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8922

This is a fair chunk of code and data and can easily live separate from
the main emulation function.

Code moved gets slightly adjusted in a few places, e.g. replacing EXC_*
by X86_EXC_* (such that EXC_* don't need to move as well; we want these
to be phased out anyway).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Re-base.

--- a/tools/fuzz/x86_instruction_emulator/Makefile
+++ b/tools/fuzz/x86_instruction_emulator/Makefile
@@ -36,7 +36,7 @@ x86_emulate.h := x86-emulate.h x86_emula
 
 OBJS := fuzz-emul.o x86-emulate.o
 OBJS += x86_emulate/0f01.o x86_emulate/0fae.o x86_emulate/0fc7.o
-OBJS += x86_emulate/fpu.o
+OBJS += x86_emulate/decode.o x86_emulate/fpu.o
 
 # x86-emulate.c will be implicit for both
 x86-emulate.o x86-emulate-cov.o: x86_emulate/x86_emulate.c $(x86_emulate.h) x86_emulate/private.h
--- a/tools/tests/x86_emulator/Makefile
+++ b/tools/tests/x86_emulator/Makefile
@@ -252,7 +252,7 @@ endif # 32-bit override
 
 OBJS := x86-emulate.o cpuid.o test_x86_emulator.o evex-disp8.o predicates.o wrappers.o
 OBJS += x86_emulate/0f01.o x86_emulate/0fae.o x86_emulate/0fc7.o
-OBJS += x86_emulate/fpu.o
+OBJS += x86_emulate/decode.o x86_emulate/fpu.o
 
 $(TARGET): $(OBJS)
 	$(HOSTCC) $(HOSTCFLAGS) -o $@ $^
--- a/tools/tests/x86_emulator/x86-emulate.c
+++ b/tools/tests/x86_emulator/x86-emulate.c
@@ -3,11 +3,6 @@
 #include <errno.h>
 #include <sys/mman.h>
 
-#define DEFINE_PER_CPU(type, var) type per_cpu_##var
-#define this_cpu(var) per_cpu_##var
-
-#define ERR_PTR(val) NULL
-
 /* See gcc bug 100680, but here don't bother making this version dependent. */
 #define gcc11_wrap(x) ({                  \
     unsigned long x_;                     \
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -48,6 +48,9 @@
 #define ASSERT assert
 #define ASSERT_UNREACHABLE() assert(!__LINE__)
 
+#define DEFINE_PER_CPU(type, var) type per_cpu_##var
+#define this_cpu(var) per_cpu_##var
+
 #define MASK_EXTR(v, m) (((v) & (m)) / ((m) & -(m)))
 #define MASK_INSR(v, m) (((v) * ((m) & -(m))) & (m))
 
--- a/xen/arch/x86/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate.c
@@ -9,7 +9,6 @@
  *    Keir Fraser <keir@xen.org>
  */
 
-#include <xen/err.h>
 #include <xen/event.h>
 #include <asm/x86_emulate.h>
 #include <asm/processor.h> /* current_cpu_info */
--- a/xen/arch/x86/x86_emulate/Makefile
+++ b/xen/arch/x86/x86_emulate/Makefile
@@ -1,4 +1,5 @@
 obj-y += 0f01.o
 obj-y += 0fae.o
 obj-y += 0fc7.o
+obj-y += decode.o
 obj-$(CONFIG_HVM) += fpu.o
--- /dev/null
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -0,0 +1,1749 @@
+/******************************************************************************
+ * decode.c - helper for x86_emulate.c
+ *
+ * Generic x86 (32-bit and 64-bit) instruction decoder and emulator.
+ *
+ * Copyright (c) 2005-2007 Keir Fraser
+ * Copyright (c) 2005-2007 XenSource Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "private.h"
+
+#ifdef __XEN__
+# include <xen/err.h>
+#else
+# define ERR_PTR(val) NULL
+#endif
+
+#define evex_encoded() (s->evex.mbs)
+
+struct x86_emulate_state *
+x86_decode_insn(
+    struct x86_emulate_ctxt *ctxt,
+    int (*insn_fetch)(
+        unsigned long offset, void *p_data, unsigned int bytes,
+        struct x86_emulate_ctxt *ctxt))
+{
+    static DEFINE_PER_CPU(struct x86_emulate_state, state);
+    struct x86_emulate_state *s = &this_cpu(state);
+    const struct x86_emulate_ops ops = {
+        .insn_fetch = insn_fetch,
+        .read       = x86emul_unhandleable_rw,
+    };
+    int rc;
+
+    init_context(ctxt);
+
+    rc = x86emul_decode(s, ctxt, &ops);
+    if ( unlikely(rc != X86EMUL_OKAY) )
+        return ERR_PTR(-rc);
+
+#if defined(__XEN__) && !defined(NDEBUG)
+    /*
+     * While we avoid memory allocation (by use of per-CPU data) above,
+     * nevertheless make sure callers properly release the state structure
+     * for forward compatibility.
+     */
+    if ( s->caller )
+    {
+        printk(XENLOG_ERR "Unreleased emulation state acquired by %ps\n",
+               s->caller);
+        dump_execution_state();
+    }
+    s->caller = __builtin_return_address(0);
+#endif
+
+    return s;
+}
+
+static const opcode_desc_t opcode_table[256] = {
+    /* 0x00 - 0x07 */
+    ByteOp|DstMem|SrcReg|ModRM, DstMem|SrcReg|ModRM,
+    ByteOp|DstReg|SrcMem|ModRM, DstReg|SrcMem|ModRM,
+    ByteOp|DstEax|SrcImm, DstEax|SrcImm, ImplicitOps|Mov, ImplicitOps|Mov,
+    /* 0x08 - 0x0F */
+    ByteOp|DstMem|SrcReg|ModRM, DstMem|SrcReg|ModRM,
+    ByteOp|DstReg|SrcMem|ModRM, DstReg|SrcMem|ModRM,
+    ByteOp|DstEax|SrcImm, DstEax|SrcImm, ImplicitOps|Mov, 0,
+    /* 0x10 - 0x17 */
+    ByteOp|DstMem|SrcReg|ModRM, DstMem|SrcReg|ModRM,
+    ByteOp|DstReg|SrcMem|ModRM, DstReg|SrcMem|ModRM,
+    ByteOp|DstEax|SrcImm, DstEax|SrcImm, ImplicitOps|Mov, ImplicitOps|Mov,
+    /* 0x18 - 0x1F */
+    ByteOp|DstMem|SrcReg|ModRM, DstMem|SrcReg|ModRM,
+    ByteOp|DstReg|SrcMem|ModRM, DstReg|SrcMem|ModRM,
+    ByteOp|DstEax|SrcImm, DstEax|SrcImm, ImplicitOps|Mov, ImplicitOps|Mov,
+    /* 0x20 - 0x27 */
+    ByteOp|DstMem|SrcReg|ModRM, DstMem|SrcReg|ModRM,
+    ByteOp|DstReg|SrcMem|ModRM, DstReg|SrcMem|ModRM,
+    ByteOp|DstEax|SrcImm, DstEax|SrcImm, 0, ImplicitOps,
+    /* 0x28 - 0x2F */
+    ByteOp|DstMem|SrcReg|ModRM, DstMem|SrcReg|ModRM,
+    ByteOp|DstReg|SrcMem|ModRM, DstReg|SrcMem|ModRM,
+    ByteOp|DstEax|SrcImm, DstEax|SrcImm, 0, ImplicitOps,
+    /* 0x30 - 0x37 */
+    ByteOp|DstMem|SrcReg|ModRM, DstMem|SrcReg|ModRM,
+    ByteOp|DstReg|SrcMem|ModRM, DstReg|SrcMem|ModRM,
+    ByteOp|DstEax|SrcImm, DstEax|SrcImm, 0, ImplicitOps,
+    /* 0x38 - 0x3F */
+    ByteOp|DstReg|SrcMem|ModRM, DstReg|SrcMem|ModRM,
+    ByteOp|DstReg|SrcMem|ModRM, DstReg|SrcMem|ModRM,
+    ByteOp|DstEax|SrcImm, DstEax|SrcImm, 0, ImplicitOps,
+    /* 0x40 - 0x4F */
+    ImplicitOps, ImplicitOps, ImplicitOps, ImplicitOps,
+    ImplicitOps, ImplicitOps, ImplicitOps, ImplicitOps,
+    ImplicitOps, ImplicitOps, ImplicitOps, ImplicitOps,
+    ImplicitOps, ImplicitOps, ImplicitOps, ImplicitOps,
+    /* 0x50 - 0x5F */
+    ImplicitOps|Mov, ImplicitOps|Mov, ImplicitOps|Mov, ImplicitOps|Mov,
+    ImplicitOps|Mov, ImplicitOps|Mov, ImplicitOps|Mov, ImplicitOps|Mov,
+    ImplicitOps|Mov, ImplicitOps|Mov, ImplicitOps|Mov, ImplicitOps|Mov,
+    ImplicitOps|Mov, ImplicitOps|Mov, ImplicitOps|Mov, ImplicitOps|Mov,
+    /* 0x60 - 0x67 */
+    ImplicitOps, ImplicitOps, DstReg|SrcMem|ModRM, DstReg|SrcNone|ModRM|Mov,
+    0, 0, 0, 0,
+    /* 0x68 - 0x6F */
+    DstImplicit|SrcImm|Mov, DstReg|SrcImm|ModRM|Mov,
+    DstImplicit|SrcImmByte|Mov, DstReg|SrcImmByte|ModRM|Mov,
+    ImplicitOps|Mov, ImplicitOps|Mov, ImplicitOps|Mov, ImplicitOps|Mov,
+    /* 0x70 - 0x77 */
+    DstImplicit|SrcImmByte, DstImplicit|SrcImmByte,
+    DstImplicit|SrcImmByte, DstImplicit|SrcImmByte,
+    DstImplicit|SrcImmByte, DstImplicit|SrcImmByte,
+    DstImplicit|SrcImmByte, DstImplicit|SrcImmByte,
+    /* 0x78 - 0x7F */
+    DstImplicit|SrcImmByte, DstImplicit|SrcImmByte,
+    DstImplicit|SrcImmByte, DstImplicit|SrcImmByte,
+    DstImplicit|SrcImmByte, DstImplicit|SrcImmByte,
+    DstImplicit|SrcImmByte, DstImplicit|SrcImmByte,
+    /* 0x80 - 0x87 */
+    ByteOp|DstMem|SrcImm|ModRM, DstMem|SrcImm|ModRM,
+    ByteOp|DstMem|SrcImm|ModRM, DstMem|SrcImmByte|ModRM,
+    ByteOp|DstReg|SrcMem|ModRM, DstReg|SrcMem|ModRM,
+    ByteOp|DstMem|SrcReg|ModRM, DstMem|SrcReg|ModRM,
+    /* 0x88 - 0x8F */
+    ByteOp|DstMem|SrcReg|ModRM|Mov, DstMem|SrcReg|ModRM|Mov,
+    ByteOp|DstReg|SrcMem|ModRM|Mov, DstReg|SrcMem|ModRM|Mov,
+    DstMem|SrcReg|ModRM|Mov, DstReg|SrcNone|ModRM,
+    DstReg|SrcMem16|ModRM|Mov, DstMem|SrcNone|ModRM|Mov,
+    /* 0x90 - 0x97 */
+    DstImplicit|SrcEax, DstImplicit|SrcEax,
+    DstImplicit|SrcEax, DstImplicit|SrcEax,
+    DstImplicit|SrcEax, DstImplicit|SrcEax,
+    DstImplicit|SrcEax, DstImplicit|SrcEax,
+    /* 0x98 - 0x9F */
+    ImplicitOps, ImplicitOps, ImplicitOps, ImplicitOps,
+    ImplicitOps|Mov, ImplicitOps|Mov, ImplicitOps, ImplicitOps,
+    /* 0xA0 - 0xA7 */
+    ByteOp|DstEax|SrcMem|Mov, DstEax|SrcMem|Mov,
+    ByteOp|DstMem|SrcEax|Mov, DstMem|SrcEax|Mov,
+    ByteOp|ImplicitOps|Mov, ImplicitOps|Mov,
+    ByteOp|ImplicitOps, ImplicitOps,
+    /* 0xA8 - 0xAF */
+    ByteOp|DstEax|SrcImm, DstEax|SrcImm,
+    ByteOp|DstImplicit|SrcEax|Mov, DstImplicit|SrcEax|Mov,
+    ByteOp|DstEax|SrcImplicit|Mov, DstEax|SrcImplicit|Mov,
+    ByteOp|DstImplicit|SrcEax, DstImplicit|SrcEax,
+    /* 0xB0 - 0xB7 */
+    ByteOp|DstReg|SrcImm|Mov, ByteOp|DstReg|SrcImm|Mov,
+    ByteOp|DstReg|SrcImm|Mov, ByteOp|DstReg|SrcImm|Mov,
+    ByteOp|DstReg|SrcImm|Mov, ByteOp|DstReg|SrcImm|Mov,
+    ByteOp|DstReg|SrcImm|Mov, ByteOp|DstReg|SrcImm|Mov,
+    /* 0xB8 - 0xBF */
+    DstReg|SrcImm|Mov, DstReg|SrcImm|Mov, DstReg|SrcImm|Mov, DstReg|SrcImm|Mov,
+    DstReg|SrcImm|Mov, DstReg|SrcImm|Mov, DstReg|SrcImm|Mov, DstReg|SrcImm|Mov,
+    /* 0xC0 - 0xC7 */
+    ByteOp|DstMem|SrcImm|ModRM, DstMem|SrcImmByte|ModRM,
+    DstImplicit|SrcImm16, ImplicitOps,
+    DstReg|SrcMem|ModRM|Mov, DstReg|SrcMem|ModRM|Mov,
+    ByteOp|DstMem|SrcImm|ModRM|Mov, DstMem|SrcImm|ModRM|Mov,
+    /* 0xC8 - 0xCF */
+    DstImplicit|SrcImm16, ImplicitOps, DstImplicit|SrcImm16, ImplicitOps,
+    ImplicitOps, DstImplicit|SrcImmByte, ImplicitOps, ImplicitOps,
+    /* 0xD0 - 0xD7 */
+    ByteOp|DstMem|SrcImplicit|ModRM, DstMem|SrcImplicit|ModRM,
+    ByteOp|DstMem|SrcImplicit|ModRM, DstMem|SrcImplicit|ModRM,
+    DstImplicit|SrcImmByte, DstImplicit|SrcImmByte, ImplicitOps, ImplicitOps,
+    /* 0xD8 - 0xDF */
+    ImplicitOps|ModRM, ImplicitOps|ModRM|Mov,
+    ImplicitOps|ModRM, ImplicitOps|ModRM|Mov,
+    ImplicitOps|ModRM, ImplicitOps|ModRM|Mov,
+    DstImplicit|SrcMem16|ModRM, ImplicitOps|ModRM|Mov,
+    /* 0xE0 - 0xE7 */
+    DstImplicit|SrcImmByte, DstImplicit|SrcImmByte,
+    DstImplicit|SrcImmByte, DstImplicit|SrcImmByte,
+    DstEax|SrcImmByte, DstEax|SrcImmByte,
+    DstImplicit|SrcImmByte, DstImplicit|SrcImmByte,
+    /* 0xE8 - 0xEF */
+    DstImplicit|SrcImm|Mov, DstImplicit|SrcImm,
+    ImplicitOps, DstImplicit|SrcImmByte,
+    DstEax|SrcImplicit, DstEax|SrcImplicit, ImplicitOps, ImplicitOps,
+    /* 0xF0 - 0xF7 */
+    0, ImplicitOps, 0, 0,
+    ImplicitOps, ImplicitOps, ByteOp|ModRM, ModRM,
+    /* 0xF8 - 0xFF */
+    ImplicitOps, ImplicitOps, ImplicitOps, ImplicitOps,
+    ImplicitOps, ImplicitOps, ByteOp|DstMem|SrcNone|ModRM, DstMem|SrcNone|ModRM
+};
+
+static const struct twobyte_table {
+    opcode_desc_t desc;
+    simd_opsize_t size:4;
+    disp8scale_t d8s:4;
+} twobyte_table[256] = {
+    [0x00] = { ModRM },
+    [0x01] = { ImplicitOps|ModRM },
+    [0x02] = { DstReg|SrcMem16|ModRM },
+    [0x03] = { DstReg|SrcMem16|ModRM },
+    [0x05] = { ImplicitOps },
+    [0x06] = { ImplicitOps },
+    [0x07] = { ImplicitOps },
+    [0x08] = { ImplicitOps },
+    [0x09] = { ImplicitOps },
+    [0x0b] = { ImplicitOps },
+    [0x0d] = { ImplicitOps|ModRM },
+    [0x0e] = { ImplicitOps },
+    [0x0f] = { ModRM|SrcImmByte },
+    [0x10] = { DstImplicit|SrcMem|ModRM|Mov, simd_any_fp, d8s_vl },
+    [0x11] = { DstMem|SrcImplicit|ModRM|Mov, simd_any_fp, d8s_vl },
+    [0x12] = { DstImplicit|SrcMem|ModRM|Mov, simd_other, 3 },
+    [0x13] = { DstMem|SrcImplicit|ModRM|Mov, simd_other, 3 },
+    [0x14 ... 0x15] = { DstImplicit|SrcMem|ModRM, simd_packed_fp, d8s_vl },
+    [0x16] = { DstImplicit|SrcMem|ModRM|Mov, simd_other, 3 },
+    [0x17] = { DstMem|SrcImplicit|ModRM|Mov, simd_other, 3 },
+    [0x18 ... 0x1f] = { ImplicitOps|ModRM },
+    [0x20 ... 0x21] = { DstMem|SrcImplicit|ModRM },
+    [0x22 ... 0x23] = { DstImplicit|SrcMem|ModRM },
+    [0x28] = { DstImplicit|SrcMem|ModRM|Mov, simd_packed_fp, d8s_vl },
+    [0x29] = { DstMem|SrcImplicit|ModRM|Mov, simd_packed_fp, d8s_vl },
+    [0x2a] = { DstImplicit|SrcMem|ModRM|Mov, simd_other, d8s_dq64 },
+    [0x2b] = { DstMem|SrcImplicit|ModRM|Mov, simd_any_fp, d8s_vl },
+    [0x2c ... 0x2d] = { DstImplicit|SrcMem|ModRM|Mov, simd_other },
+    [0x2e ... 0x2f] = { ImplicitOps|ModRM|TwoOp, simd_none, d8s_dq },
+    [0x30 ... 0x35] = { ImplicitOps },
+    [0x37] = { ImplicitOps },
+    [0x38] = { DstReg|SrcMem|ModRM },
+    [0x3a] = { DstReg|SrcImmByte|ModRM },
+    [0x40 ... 0x4f] = { DstReg|SrcMem|ModRM|Mov },
+    [0x50] = { DstReg|SrcImplicit|ModRM|Mov },
+    [0x51] = { DstImplicit|SrcMem|ModRM|TwoOp, simd_any_fp, d8s_vl },
+    [0x52 ... 0x53] = { DstImplicit|SrcMem|ModRM|TwoOp, simd_single_fp },
+    [0x54 ... 0x57] = { DstImplicit|SrcMem|ModRM, simd_packed_fp, d8s_vl },
+    [0x58 ... 0x59] = { DstImplicit|SrcMem|ModRM, simd_any_fp, d8s_vl },
+    [0x5a] = { DstImplicit|SrcMem|ModRM|Mov, simd_any_fp, d8s_vl },
+    [0x5b] = { DstImplicit|SrcMem|ModRM|Mov, simd_packed_fp, d8s_vl },
+    [0x5c ... 0x5f] = { DstImplicit|SrcMem|ModRM, simd_any_fp, d8s_vl },
+    [0x60 ... 0x62] = { DstImplicit|SrcMem|ModRM, simd_other, d8s_vl },
+    [0x63 ... 0x67] = { DstImplicit|SrcMem|ModRM, simd_packed_int, d8s_vl },
+    [0x68 ... 0x6a] = { DstImplicit|SrcMem|ModRM, simd_other, d8s_vl },
+    [0x6b ... 0x6d] = { DstImplicit|SrcMem|ModRM, simd_packed_int, d8s_vl },
+    [0x6e] = { DstImplicit|SrcMem|ModRM|Mov, simd_none, d8s_dq64 },
+    [0x6f] = { DstImplicit|SrcMem|ModRM|Mov, simd_packed_int, d8s_vl },
+    [0x70] = { SrcImmByte|ModRM|TwoOp, simd_other, d8s_vl },
+    [0x71 ... 0x73] = { DstImplicit|SrcImmByte|ModRM, simd_none, d8s_vl },
+    [0x74 ... 0x76] = { DstImplicit|SrcMem|ModRM, simd_packed_int, d8s_vl },
+    [0x77] = { DstImplicit|SrcNone },
+    [0x78 ... 0x79] = { DstImplicit|SrcMem|ModRM|Mov, simd_other, d8s_vl },
+    [0x7a] = { DstImplicit|SrcMem|ModRM|Mov, simd_packed_fp, d8s_vl },
+    [0x7b] = { DstImplicit|SrcMem|ModRM|Mov, simd_other, d8s_dq64 },
+    [0x7c ... 0x7d] = { DstImplicit|SrcMem|ModRM, simd_other },
+    [0x7e] = { DstMem|SrcImplicit|ModRM|Mov, simd_none, d8s_dq64 },
+    [0x7f] = { DstMem|SrcImplicit|ModRM|Mov, simd_packed_int, d8s_vl },
+    [0x80 ... 0x8f] = { DstImplicit|SrcImm },
+    [0x90 ... 0x9f] = { ByteOp|DstMem|SrcNone|ModRM|Mov },
+    [0xa0 ... 0xa1] = { ImplicitOps|Mov },
+    [0xa2] = { ImplicitOps },
+    [0xa3] = { DstBitBase|SrcReg|ModRM },
+    [0xa4] = { DstMem|SrcImmByte|ModRM },
+    [0xa5] = { DstMem|SrcReg|ModRM },
+    [0xa6 ... 0xa7] = { ModRM },
+    [0xa8 ... 0xa9] = { ImplicitOps|Mov },
+    [0xaa] = { ImplicitOps },
+    [0xab] = { DstBitBase|SrcReg|ModRM },
+    [0xac] = { DstMem|SrcImmByte|ModRM },
+    [0xad] = { DstMem|SrcReg|ModRM },
+    [0xae] = { ImplicitOps|ModRM },
+    [0xaf] = { DstReg|SrcMem|ModRM },
+    [0xb0] = { ByteOp|DstMem|SrcReg|ModRM },
+    [0xb1] = { DstMem|SrcReg|ModRM },
+    [0xb2] = { DstReg|SrcMem|ModRM|Mov },
+    [0xb3] = { DstBitBase|SrcReg|ModRM },
+    [0xb4 ... 0xb5] = { DstReg|SrcMem|ModRM|Mov },
+    [0xb6] = { ByteOp|DstReg|SrcMem|ModRM|Mov },
+    [0xb7] = { DstReg|SrcMem16|ModRM|Mov },
+    [0xb8] = { DstReg|SrcMem|ModRM },
+    [0xb9] = { ModRM },
+    [0xba] = { DstBitBase|SrcImmByte|ModRM },
+    [0xbb] = { DstBitBase|SrcReg|ModRM },
+    [0xbc ... 0xbd] = { DstReg|SrcMem|ModRM },
+    [0xbe] = { ByteOp|DstReg|SrcMem|ModRM|Mov },
+    [0xbf] = { DstReg|SrcMem16|ModRM|Mov },
+    [0xc0] = { ByteOp|DstMem|SrcReg|ModRM },
+    [0xc1] = { DstMem|SrcReg|ModRM },
+    [0xc2] = { DstImplicit|SrcImmByte|ModRM, simd_any_fp, d8s_vl },
+    [0xc3] = { DstMem|SrcReg|ModRM|Mov },
+    [0xc4] = { DstImplicit|SrcImmByte|ModRM, simd_none, 1 },
+    [0xc5] = { DstReg|SrcImmByte|ModRM|Mov },
+    [0xc6] = { DstImplicit|SrcImmByte|ModRM, simd_packed_fp, d8s_vl },
+    [0xc7] = { ImplicitOps|ModRM },
+    [0xc8 ... 0xcf] = { ImplicitOps },
+    [0xd0] = { DstImplicit|SrcMem|ModRM, simd_other },
+    [0xd1 ... 0xd3] = { DstImplicit|SrcMem|ModRM, simd_128, 4 },
+    [0xd4 ... 0xd5] = { DstImplicit|SrcMem|ModRM, simd_packed_int, d8s_vl },
+    [0xd6] = { DstMem|SrcImplicit|ModRM|Mov, simd_other, 3 },
+    [0xd7] = { DstReg|SrcImplicit|ModRM|Mov },
+    [0xd8 ... 0xdf] = { DstImplicit|SrcMem|ModRM, simd_packed_int, d8s_vl },
+    [0xe0] = { DstImplicit|SrcMem|ModRM, simd_packed_int, d8s_vl },
+    [0xe1 ... 0xe2] = { DstImplicit|SrcMem|ModRM, simd_128, 4 },
+    [0xe3 ... 0xe5] = { DstImplicit|SrcMem|ModRM, simd_packed_int, d8s_vl },
+    [0xe6] = { DstImplicit|SrcMem|ModRM|Mov, simd_packed_fp, d8s_vl },
+    [0xe7] = { DstMem|SrcImplicit|ModRM|Mov, simd_packed_int, d8s_vl },
+    [0xe8 ... 0xef] = { DstImplicit|SrcMem|ModRM, simd_packed_int, d8s_vl },
+    [0xf0] = { DstImplicit|SrcMem|ModRM|Mov, simd_other },
+    [0xf1 ... 0xf3] = { DstImplicit|SrcMem|ModRM, simd_128, 4 },
+    [0xf4 ... 0xf6] = { DstImplicit|SrcMem|ModRM, simd_packed_int, d8s_vl },
+    [0xf7] = { DstMem|SrcMem|ModRM|Mov, simd_packed_int },
+    [0xf8 ... 0xfe] = { DstImplicit|SrcMem|ModRM, simd_packed_int, d8s_vl },
+    [0xff] = { ModRM }
+};
+
+/*
+ * "two_op" and "four_op" below refer to the number of register operands
+ * (one of which possibly also allowing to be a memory one). The named
+ * operand counts do not include any immediate operands.
+ */
+static const struct ext0f38_table {
+    uint8_t simd_size:5;
+    uint8_t to_mem:1;
+    uint8_t two_op:1;
+    uint8_t vsib:1;
+    disp8scale_t d8s:4;
+} ext0f38_table[256] = {
+    [0x00] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
+    [0x01 ... 0x03] = { .simd_size = simd_packed_int },
+    [0x04] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
+    [0x05 ... 0x0a] = { .simd_size = simd_packed_int },
+    [0x0b] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
+    [0x0c ... 0x0d] = { .simd_size = simd_packed_fp, .d8s = d8s_vl },
+    [0x0e ... 0x0f] = { .simd_size = simd_packed_fp },
+    [0x10 ... 0x12] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
+    [0x13] = { .simd_size = simd_other, .two_op = 1, .d8s = d8s_vl_by_2 },
+    [0x14 ... 0x16] = { .simd_size = simd_packed_fp, .d8s = d8s_vl },
+    [0x17] = { .simd_size = simd_packed_int, .two_op = 1 },
+    [0x18] = { .simd_size = simd_scalar_opc, .two_op = 1, .d8s = 2 },
+    [0x19] = { .simd_size = simd_scalar_opc, .two_op = 1, .d8s = 3 },
+    [0x1a] = { .simd_size = simd_128, .two_op = 1, .d8s = 4 },
+    [0x1b] = { .simd_size = simd_256, .two_op = 1, .d8s = d8s_vl_by_2 },
+    [0x1c ... 0x1f] = { .simd_size = simd_packed_int, .two_op = 1, .d8s = d8s_vl },
+    [0x20] = { .simd_size = simd_other, .two_op = 1, .d8s = d8s_vl_by_2 },
+    [0x21] = { .simd_size = simd_other, .two_op = 1, .d8s = d8s_vl_by_4 },
+    [0x22] = { .simd_size = simd_other, .two_op = 1, .d8s = d8s_vl_by_8 },
+    [0x23] = { .simd_size = simd_other, .two_op = 1, .d8s = d8s_vl_by_2 },
+    [0x24] = { .simd_size = simd_other, .two_op = 1, .d8s = d8s_vl_by_4 },
+    [0x25] = { .simd_size = simd_other, .two_op = 1, .d8s = d8s_vl_by_2 },
+    [0x26 ... 0x29] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
+    [0x2a] = { .simd_size = simd_packed_int, .two_op = 1, .d8s = d8s_vl },
+    [0x2b] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
+    [0x2c] = { .simd_size = simd_packed_fp, .d8s = d8s_vl },
+    [0x2d] = { .simd_size = simd_packed_fp, .d8s = d8s_dq },
+    [0x2e ... 0x2f] = { .simd_size = simd_packed_fp, .to_mem = 1 },
+    [0x30] = { .simd_size = simd_other, .two_op = 1, .d8s = d8s_vl_by_2 },
+    [0x31] = { .simd_size = simd_other, .two_op = 1, .d8s = d8s_vl_by_4 },
+    [0x32] = { .simd_size = simd_other, .two_op = 1, .d8s = d8s_vl_by_8 },
+    [0x33] = { .simd_size = simd_other, .two_op = 1, .d8s = d8s_vl_by_2 },
+    [0x34] = { .simd_size = simd_other, .two_op = 1, .d8s = d8s_vl_by_4 },
+    [0x35] = { .simd_size = simd_other, .two_op = 1, .d8s = d8s_vl_by_2 },
+    [0x36 ... 0x3f] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
+    [0x40] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
+    [0x41] = { .simd_size = simd_packed_int, .two_op = 1 },
+    [0x42] = { .simd_size = simd_packed_fp, .two_op = 1, .d8s = d8s_vl },
+    [0x43] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
+    [0x44] = { .simd_size = simd_packed_int, .two_op = 1, .d8s = d8s_vl },
+    [0x45 ... 0x47] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
+    [0x4c] = { .simd_size = simd_packed_fp, .two_op = 1, .d8s = d8s_vl },
+    [0x4d] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
+    [0x4e] = { .simd_size = simd_packed_fp, .two_op = 1, .d8s = d8s_vl },
+    [0x4f] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
+    [0x50 ... 0x53] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
+    [0x54 ... 0x55] = { .simd_size = simd_packed_int, .two_op = 1, .d8s = d8s_vl },
+    [0x58] = { .simd_size = simd_other, .two_op = 1, .d8s = 2 },
+    [0x59] = { .simd_size = simd_other, .two_op = 1, .d8s = 3 },
+    [0x5a] = { .simd_size = simd_128, .two_op = 1, .d8s = 4 },
+    [0x5b] = { .simd_size = simd_256, .two_op = 1, .d8s = d8s_vl_by_2 },
+    [0x62] = { .simd_size = simd_packed_int, .two_op = 1, .d8s = d8s_bw },
+    [0x63] = { .simd_size = simd_packed_int, .to_mem = 1, .two_op = 1, .d8s = d8s_bw },
+    [0x64 ... 0x66] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
+    [0x68] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
+    [0x70 ... 0x73] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
+    [0x75 ... 0x76] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
+    [0x77] = { .simd_size = simd_packed_fp, .d8s = d8s_vl },
+    [0x78] = { .simd_size = simd_other, .two_op = 1 },
+    [0x79] = { .simd_size = simd_other, .two_op = 1, .d8s = 1 },
+    [0x7a ... 0x7c] = { .simd_size = simd_none, .two_op = 1 },
+    [0x7d ... 0x7e] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
+    [0x7f] = { .simd_size = simd_packed_fp, .d8s = d8s_vl },
+    [0x82] = { .simd_size = simd_other },
+    [0x83] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
+    [0x88] = { .simd_size = simd_packed_fp, .two_op = 1, .d8s = d8s_dq },
+    [0x89] = { .simd_size = simd_packed_int, .two_op = 1, .d8s = d8s_dq },
+    [0x8a] = { .simd_size = simd_packed_fp, .to_mem = 1, .two_op = 1, .d8s = d8s_dq },
+    [0x8b] = { .simd_size = simd_packed_int, .to_mem = 1, .two_op = 1, .d8s = d8s_dq },
+    [0x8c] = { .simd_size = simd_packed_int },
+    [0x8d] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
+    [0x8e] = { .simd_size = simd_packed_int, .to_mem = 1 },
+    [0x8f] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
+    [0x90 ... 0x93] = { .simd_size = simd_other, .vsib = 1, .d8s = d8s_dq },
+    [0x96 ... 0x98] = { .simd_size = simd_packed_fp, .d8s = d8s_vl },
+    [0x99] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
+    [0x9a] = { .simd_size = simd_packed_fp, .d8s = d8s_vl },
+    [0x9b] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
+    [0x9c] = { .simd_size = simd_packed_fp, .d8s = d8s_vl },
+    [0x9d] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
+    [0x9e] = { .simd_size = simd_packed_fp, .d8s = d8s_vl },
+    [0x9f] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
+    [0xa0 ... 0xa3] = { .simd_size = simd_other, .to_mem = 1, .vsib = 1, .d8s = d8s_dq },
+    [0xa6 ... 0xa8] = { .simd_size = simd_packed_fp, .d8s = d8s_vl },
+    [0xa9] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
+    [0xaa] = { .simd_size = simd_packed_fp, .d8s = d8s_vl },
+    [0xab] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
+    [0xac] = { .simd_size = simd_packed_fp, .d8s = d8s_vl },
+    [0xad] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
+    [0xae] = { .simd_size = simd_packed_fp, .d8s = d8s_vl },
+    [0xaf] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
+    [0xb4 ... 0xb5] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
+    [0xb6 ... 0xb8] = { .simd_size = simd_packed_fp, .d8s = d8s_vl },
+    [0xb9] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
+    [0xba] = { .simd_size = simd_packed_fp, .d8s = d8s_vl },
+    [0xbb] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
+    [0xbc] = { .simd_size = simd_packed_fp, .d8s = d8s_vl },
+    [0xbd] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
+    [0xbe] = { .simd_size = simd_packed_fp, .d8s = d8s_vl },
+    [0xbf] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
+    [0xc4] = { .simd_size = simd_packed_int, .two_op = 1, .d8s = d8s_vl },
+    [0xc6 ... 0xc7] = { .simd_size = simd_other, .vsib = 1, .d8s = d8s_dq },
+    [0xc8] = { .simd_size = simd_packed_fp, .two_op = 1, .d8s = d8s_vl },
+    [0xc9] = { .simd_size = simd_other },
+    [0xca] = { .simd_size = simd_packed_fp, .two_op = 1, .d8s = d8s_vl },
+    [0xcb] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
+    [0xcc] = { .simd_size = simd_packed_fp, .two_op = 1, .d8s = d8s_vl },
+    [0xcd] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
+    [0xcf] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
+    [0xdb] = { .simd_size = simd_packed_int, .two_op = 1 },
+    [0xdc ... 0xdf] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
+    [0xf0] = { .two_op = 1 },
+    [0xf1] = { .to_mem = 1, .two_op = 1 },
+    [0xf2 ... 0xf3] = {},
+    [0xf5 ... 0xf7] = {},
+    [0xf8] = { .simd_size = simd_other },
+    [0xf9] = { .to_mem = 1, .two_op = 1 /* Mov */ },
+};
+
+static const struct ext0f3a_table {
+    uint8_t simd_size:5;
+    uint8_t to_mem:1;
+    uint8_t two_op:1;
+    uint8_t four_op:1;
+    disp8scale_t d8s:4;
+} ext0f3a_table[256] = {
+    [0x00] = { .simd_size = simd_packed_int, .two_op = 1, .d8s = d8s_vl },
+    [0x01] = { .simd_size = simd_packed_fp, .two_op = 1, .d8s = d8s_vl },
+    [0x02] = { .simd_size = simd_packed_int },
+    [0x03] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
+    [0x04 ... 0x05] = { .simd_size = simd_packed_fp, .two_op = 1, .d8s = d8s_vl },
+    [0x06] = { .simd_size = simd_packed_fp },
+    [0x08 ... 0x09] = { .simd_size = simd_packed_fp, .two_op = 1, .d8s = d8s_vl },
+    [0x0a ... 0x0b] = { .simd_size = simd_scalar_opc, .d8s = d8s_dq },
+    [0x0c ... 0x0d] = { .simd_size = simd_packed_fp },
+    [0x0e] = { .simd_size = simd_packed_int },
+    [0x0f] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
+    [0x14] = { .simd_size = simd_none, .to_mem = 1, .two_op = 1, .d8s = 0 },
+    [0x15] = { .simd_size = simd_none, .to_mem = 1, .two_op = 1, .d8s = 1 },
+    [0x16] = { .simd_size = simd_none, .to_mem = 1, .two_op = 1, .d8s = d8s_dq64 },
+    [0x17] = { .simd_size = simd_none, .to_mem = 1, .two_op = 1, .d8s = 2 },
+    [0x18] = { .simd_size = simd_128, .d8s = 4 },
+    [0x19] = { .simd_size = simd_128, .to_mem = 1, .two_op = 1, .d8s = 4 },
+    [0x1a] = { .simd_size = simd_256, .d8s = d8s_vl_by_2 },
+    [0x1b] = { .simd_size = simd_256, .to_mem = 1, .two_op = 1, .d8s = d8s_vl_by_2 },
+    [0x1d] = { .simd_size = simd_other, .to_mem = 1, .two_op = 1, .d8s = d8s_vl_by_2 },
+    [0x1e ... 0x1f] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
+    [0x20] = { .simd_size = simd_none, .d8s = 0 },
+    [0x21] = { .simd_size = simd_other, .d8s = 2 },
+    [0x22] = { .simd_size = simd_none, .d8s = d8s_dq64 },
+    [0x23] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
+    [0x25] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
+    [0x26] = { .simd_size = simd_packed_fp, .two_op = 1, .d8s = d8s_vl },
+    [0x27] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
+    [0x30 ... 0x33] = { .simd_size = simd_other, .two_op = 1 },
+    [0x38] = { .simd_size = simd_128, .d8s = 4 },
+    [0x3a] = { .simd_size = simd_256, .d8s = d8s_vl_by_2 },
+    [0x39] = { .simd_size = simd_128, .to_mem = 1, .two_op = 1, .d8s = 4 },
+    [0x3b] = { .simd_size = simd_256, .to_mem = 1, .two_op = 1, .d8s = d8s_vl_by_2 },
+    [0x3e ... 0x3f] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
+    [0x40 ... 0x41] = { .simd_size = simd_packed_fp },
+    [0x42 ... 0x43] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
+    [0x44] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
+    [0x46] = { .simd_size = simd_packed_int },
+    [0x48 ... 0x49] = { .simd_size = simd_packed_fp, .four_op = 1 },
+    [0x4a ... 0x4b] = { .simd_size = simd_packed_fp, .four_op = 1 },
+    [0x4c] = { .simd_size = simd_packed_int, .four_op = 1 },
+    [0x50] = { .simd_size = simd_packed_fp, .d8s = d8s_vl },
+    [0x51] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
+    [0x54] = { .simd_size = simd_packed_fp, .d8s = d8s_vl },
+    [0x55] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
+    [0x56] = { .simd_size = simd_packed_fp, .two_op = 1, .d8s = d8s_vl },
+    [0x57] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
+    [0x5c ... 0x5f] = { .simd_size = simd_packed_fp, .four_op = 1 },
+    [0x60 ... 0x63] = { .simd_size = simd_packed_int, .two_op = 1 },
+    [0x66] = { .simd_size = simd_packed_fp, .two_op = 1, .d8s = d8s_vl },
+    [0x67] = { .simd_size = simd_scalar_vexw, .two_op = 1, .d8s = d8s_dq },
+    [0x68 ... 0x69] = { .simd_size = simd_packed_fp, .four_op = 1 },
+    [0x6a ... 0x6b] = { .simd_size = simd_scalar_opc, .four_op = 1 },
+    [0x6c ... 0x6d] = { .simd_size = simd_packed_fp, .four_op = 1 },
+    [0x6e ... 0x6f] = { .simd_size = simd_scalar_opc, .four_op = 1 },
+    [0x70 ... 0x73] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
+    [0x78 ... 0x79] = { .simd_size = simd_packed_fp, .four_op = 1 },
+    [0x7a ... 0x7b] = { .simd_size = simd_scalar_opc, .four_op = 1 },
+    [0x7c ... 0x7d] = { .simd_size = simd_packed_fp, .four_op = 1 },
+    [0x7e ... 0x7f] = { .simd_size = simd_scalar_opc, .four_op = 1 },
+    [0xcc] = { .simd_size = simd_other },
+    [0xce ... 0xcf] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
+    [0xdf] = { .simd_size = simd_packed_int, .two_op = 1 },
+    [0xf0] = {},
+};
+
+static const opcode_desc_t xop_table[] = {
+    DstReg|SrcImmByte|ModRM,
+    DstReg|SrcMem|ModRM,
+    DstReg|SrcImm|ModRM,
+};
+
+static const struct ext8f08_table {
+    uint8_t simd_size:5;
+    uint8_t two_op:1;
+    uint8_t four_op:1;
+} ext8f08_table[256] = {
+    [0xa2] = { .simd_size = simd_packed_int, .four_op = 1 },
+    [0x85 ... 0x87] = { .simd_size = simd_packed_int, .four_op = 1 },
+    [0x8e ... 0x8f] = { .simd_size = simd_packed_int, .four_op = 1 },
+    [0x95 ... 0x97] = { .simd_size = simd_packed_int, .four_op = 1 },
+    [0x9e ... 0x9f] = { .simd_size = simd_packed_int, .four_op = 1 },
+    [0xa3] = { .simd_size = simd_packed_int, .four_op = 1 },
+    [0xa6] = { .simd_size = simd_packed_int, .four_op = 1 },
+    [0xb6] = { .simd_size = simd_packed_int, .four_op = 1 },
+    [0xc0 ... 0xc3] = { .simd_size = simd_packed_int, .two_op = 1 },
+    [0xcc ... 0xcf] = { .simd_size = simd_packed_int },
+    [0xec ... 0xef] = { .simd_size = simd_packed_int },
+};
+
+static const struct ext8f09_table {
+    uint8_t simd_size:5;
+    uint8_t two_op:1;
+} ext8f09_table[256] = {
+    [0x01 ... 0x02] = { .two_op = 1 },
+    [0x80 ... 0x81] = { .simd_size = simd_packed_fp, .two_op = 1 },
+    [0x82 ... 0x83] = { .simd_size = simd_scalar_opc, .two_op = 1 },
+    [0x90 ... 0x9b] = { .simd_size = simd_packed_int },
+    [0xc1 ... 0xc3] = { .simd_size = simd_packed_int, .two_op = 1 },
+    [0xc6 ... 0xc7] = { .simd_size = simd_packed_int, .two_op = 1 },
+    [0xcb] = { .simd_size = simd_packed_int, .two_op = 1 },
+    [0xd1 ... 0xd3] = { .simd_size = simd_packed_int, .two_op = 1 },
+    [0xd6 ... 0xd7] = { .simd_size = simd_packed_int, .two_op = 1 },
+    [0xdb] = { .simd_size = simd_packed_int, .two_op = 1 },
+    [0xe1 ... 0xe3] = { .simd_size = simd_packed_int, .two_op = 1 },
+};
+
+static unsigned int decode_disp8scale(enum disp8scale scale,
+                                      const struct x86_emulate_state *s)
+{
+    switch ( scale )
+    {
+    case d8s_bw:
+        return s->evex.w;
+
+    default:
+        if ( scale < d8s_vl )
+            return scale;
+        if ( s->evex.brs )
+        {
+    case d8s_dq:
+            return 2 + s->evex.w;
+        }
+        break;
+
+    case d8s_dq64:
+        return 2 + (s->op_bytes == 8);
+    }
+
+    switch ( s->simd_size )
+    {
+    case simd_any_fp:
+    case simd_single_fp:
+        if ( !(s->evex.pfx & VEX_PREFIX_SCALAR_MASK) )
+            break;
+        /* fall through */
+    case simd_scalar_opc:
+    case simd_scalar_vexw:
+        return 2 + s->evex.w;
+
+    case simd_128:
+        /* These should have an explicit size specified. */
+        ASSERT_UNREACHABLE();
+        return 4;
+
+    default:
+        break;
+    }
+
+    return 4 + s->evex.lr - (scale - d8s_vl);
+}
+
+/* Fetch next part of the instruction being emulated. */
+#define insn_fetch_bytes(_size) ({                                    \
+   unsigned long _x = 0, _ip = s->ip;                                 \
+   s->ip += (_size); /* real hardware doesn't truncate */             \
+   generate_exception_if((uint8_t)(s->ip -                            \
+                                   ctxt->regs->r(ip)) > MAX_INST_LEN, \
+                         X86_EXC_GP, 0);                              \
+   rc = ops->insn_fetch(_ip, &_x, _size, ctxt);                       \
+   if ( rc ) goto done;                                               \
+   _x;                                                                \
+})
+#define insn_fetch_type(type) ((type)insn_fetch_bytes(sizeof(type)))
+
+static int
+decode_onebyte(struct x86_emulate_state *s,
+               struct x86_emulate_ctxt *ctxt,
+               const struct x86_emulate_ops *ops)
+{
+    int rc = X86EMUL_OKAY;
+
+    switch ( ctxt->opcode )
+    {
+    case 0x06: /* push %%es */
+    case 0x07: /* pop %%es */
+    case 0x0e: /* push %%cs */
+    case 0x16: /* push %%ss */
+    case 0x17: /* pop %%ss */
+    case 0x1e: /* push %%ds */
+    case 0x1f: /* pop %%ds */
+    case 0x27: /* daa */
+    case 0x2f: /* das */
+    case 0x37: /* aaa */
+    case 0x3f: /* aas */
+    case 0x60: /* pusha */
+    case 0x61: /* popa */
+    case 0x62: /* bound */
+    case 0xc4: /* les */
+    case 0xc5: /* lds */
+    case 0xce: /* into */
+    case 0xd4: /* aam */
+    case 0xd5: /* aad */
+    case 0xd6: /* salc */
+        s->not_64bit = true;
+        break;
+
+    case 0x82: /* Grp1 (x86/32 only) */
+        s->not_64bit = true;
+        /* fall through */
+    case 0x80: case 0x81: case 0x83: /* Grp1 */
+        if ( (s->modrm_reg & 7) == 7 ) /* cmp */
+            s->desc = (s->desc & ByteOp) | DstNone | SrcMem;
+        break;
+
+    case 0x90: /* nop / pause */
+        if ( s->vex.pfx == vex_f3 )
+            ctxt->opcode |= X86EMUL_OPC_F3(0, 0);
+        break;
+
+    case 0x9a: /* call (far, absolute) */
+    case 0xea: /* jmp (far, absolute) */
+        generate_exception_if(mode_64bit(), X86_EXC_UD);
+
+        s->imm1 = insn_fetch_bytes(s->op_bytes);
+        s->imm2 = insn_fetch_type(uint16_t);
+        break;
+
+    case 0xa0: case 0xa1: /* mov mem.offs,{%al,%ax,%eax,%rax} */
+    case 0xa2: case 0xa3: /* mov {%al,%ax,%eax,%rax},mem.offs */
+        /* Source EA is not encoded via ModRM. */
+        s->ea.type = OP_MEM;
+        s->ea.mem.off = insn_fetch_bytes(s->ad_bytes);
+        break;
+
+    case 0xb8 ... 0xbf: /* mov imm{16,32,64},r{16,32,64} */
+        if ( s->op_bytes == 8 ) /* Fetch more bytes to obtain imm64. */
+            s->imm1 = ((uint32_t)s->imm1 |
+                       ((uint64_t)insn_fetch_type(uint32_t) << 32));
+        break;
+
+    case 0xc8: /* enter imm16,imm8 */
+        s->imm2 = insn_fetch_type(uint8_t);
+        break;
+
+    case 0xf6: case 0xf7: /* Grp3 */
+        if ( !(s->modrm_reg & 6) ) /* test */
+            s->desc = (s->desc & ByteOp) | DstNone | SrcMem;
+        break;
+
+    case 0xff: /* Grp5 */
+        switch ( s->modrm_reg & 7 )
+        {
+        case 2: /* call (near) */
+        case 4: /* jmp (near) */
+            if ( mode_64bit() && (s->op_bytes == 4 || !amd_like(ctxt)) )
+                s->op_bytes = 8;
+            s->desc = DstNone | SrcMem | Mov;
+            break;
+
+        case 3: /* call (far, absolute indirect) */
+        case 5: /* jmp (far, absolute indirect) */
+            /* REX.W ignored on a vendor-dependent basis. */
+            if ( s->op_bytes == 8 && amd_like(ctxt) )
+                s->op_bytes = 4;
+            s->desc = DstNone | SrcMem | Mov;
+            break;
+
+        case 6: /* push */
+            if ( mode_64bit() && s->op_bytes == 4 )
+                s->op_bytes = 8;
+            s->desc = DstNone | SrcMem | Mov;
+            break;
+        }
+        break;
+    }
+
+ done:
+    return rc;
+}
+
+static int
+decode_twobyte(struct x86_emulate_state *s,
+               struct x86_emulate_ctxt *ctxt,
+               const struct x86_emulate_ops *ops)
+{
+    int rc = X86EMUL_OKAY;
+
+    switch ( ctxt->opcode & X86EMUL_OPC_MASK )
+    {
+    case 0x00: /* Grp6 */
+        switch ( s->modrm_reg & 6 )
+        {
+        case 0:
+            s->desc |= DstMem | SrcImplicit | Mov;
+            break;
+        case 2: case 4:
+            s->desc |= SrcMem16;
+            break;
+        }
+        break;
+
+    case 0x78:
+        s->desc = ImplicitOps;
+        s->simd_size = simd_none;
+        switch ( s->vex.pfx )
+        {
+        case vex_66: /* extrq $imm8, $imm8, xmm */
+        case vex_f2: /* insertq $imm8, $imm8, xmm, xmm */
+            s->imm1 = insn_fetch_type(uint8_t);
+            s->imm2 = insn_fetch_type(uint8_t);
+            break;
+        }
+        /* fall through */
+    case 0x10 ... 0x18:
+    case 0x28 ... 0x2f:
+    case 0x50 ... 0x77:
+    case 0x7a ... 0x7d:
+    case 0x7f:
+    case 0xc2 ... 0xc3:
+    case 0xc5 ... 0xc6:
+    case 0xd0 ... 0xef:
+    case 0xf1 ... 0xfe:
+        ctxt->opcode |= MASK_INSR(s->vex.pfx, X86EMUL_OPC_PFX_MASK);
+        break;
+
+    case 0x20: case 0x22: /* mov to/from cr */
+        if ( s->lock_prefix && vcpu_has_cr8_legacy() )
+        {
+            s->modrm_reg += 8;
+            s->lock_prefix = false;
+        }
+        /* fall through */
+    case 0x21: case 0x23: /* mov to/from dr */
+        ASSERT(s->ea.type == OP_REG); /* Early operand adjustment ensures this. */
+        generate_exception_if(s->lock_prefix, X86_EXC_UD);
+        s->op_bytes = mode_64bit() ? 8 : 4;
+        break;
+
+    case 0x79:
+        s->desc = DstReg | SrcMem;
+        s->simd_size = simd_packed_int;
+        ctxt->opcode |= MASK_INSR(s->vex.pfx, X86EMUL_OPC_PFX_MASK);
+        break;
+
+    case 0x7e:
+        ctxt->opcode |= MASK_INSR(s->vex.pfx, X86EMUL_OPC_PFX_MASK);
+        if ( s->vex.pfx == vex_f3 ) /* movq xmm/m64,xmm */
+        {
+    case X86EMUL_OPC_VEX_F3(0, 0x7e): /* vmovq xmm/m64,xmm */
+    case X86EMUL_OPC_EVEX_F3(0, 0x7e): /* vmovq xmm/m64,xmm */
+            s->desc = DstImplicit | SrcMem | TwoOp;
+            s->simd_size = simd_other;
+            /* Avoid the s->desc clobbering of TwoOp below. */
+            return X86EMUL_OKAY;
+        }
+        break;
+
+    case X86EMUL_OPC_VEX(0, 0x90):    /* kmov{w,q} */
+    case X86EMUL_OPC_VEX_66(0, 0x90): /* kmov{b,d} */
+        s->desc = DstReg | SrcMem | Mov;
+        s->simd_size = simd_other;
+        break;
+
+    case X86EMUL_OPC_VEX(0, 0x91):    /* kmov{w,q} */
+    case X86EMUL_OPC_VEX_66(0, 0x91): /* kmov{b,d} */
+        s->desc = DstMem | SrcReg | Mov;
+        s->simd_size = simd_other;
+        break;
+
+    case 0xae:
+        ctxt->opcode |= MASK_INSR(s->vex.pfx, X86EMUL_OPC_PFX_MASK);
+        /* fall through */
+    case X86EMUL_OPC_VEX(0, 0xae):
+        switch ( s->modrm_reg & 7 )
+        {
+        case 2: /* {,v}ldmxcsr */
+            s->desc = DstImplicit | SrcMem | Mov;
+            s->op_bytes = 4;
+            break;
+
+        case 3: /* {,v}stmxcsr */
+            s->desc = DstMem | SrcImplicit | Mov;
+            s->op_bytes = 4;
+            break;
+        }
+        break;
+
+    case 0xb2: /* lss */
+    case 0xb4: /* lfs */
+    case 0xb5: /* lgs */
+        /* REX.W ignored on a vendor-dependent basis. */
+        if ( s->op_bytes == 8 && amd_like(ctxt) )
+            s->op_bytes = 4;
+        break;
+
+    case 0xb8: /* jmpe / popcnt */
+        if ( s->vex.pfx >= vex_f3 )
+            ctxt->opcode |= MASK_INSR(s->vex.pfx, X86EMUL_OPC_PFX_MASK);
+        break;
+
+        /* Intentionally not handling here despite being modified by F3:
+    case 0xbc: bsf / tzcnt
+    case 0xbd: bsr / lzcnt
+         * They're being dealt with in the execution phase (if at all).
+         */
+
+    case 0xc4: /* pinsrw */
+        ctxt->opcode |= MASK_INSR(s->vex.pfx, X86EMUL_OPC_PFX_MASK);
+        /* fall through */
+    case X86EMUL_OPC_VEX_66(0, 0xc4): /* vpinsrw */
+    case X86EMUL_OPC_EVEX_66(0, 0xc4): /* vpinsrw */
+        s->desc = DstImplicit | SrcMem16;
+        break;
+
+    case 0xf0:
+        ctxt->opcode |= MASK_INSR(s->vex.pfx, X86EMUL_OPC_PFX_MASK);
+        if ( s->vex.pfx == vex_f2 ) /* lddqu mem,xmm */
+        {
+        /* fall through */
+    case X86EMUL_OPC_VEX_F2(0, 0xf0): /* vlddqu mem,{x,y}mm */
+            s->desc = DstImplicit | SrcMem | TwoOp;
+            s->simd_size = simd_other;
+            /* Avoid the s->desc clobbering of TwoOp below. */
+            return X86EMUL_OKAY;
+        }
+        break;
+    }
+
+    /*
+     * Scalar forms of most VEX-/EVEX-encoded TwoOp instructions have
+     * three operands.  Those which do really have two operands
+     * should have exited earlier.
+     */
+    if ( s->simd_size && s->vex.opcx &&
+         (s->vex.pfx & VEX_PREFIX_SCALAR_MASK) )
+        s->desc &= ~TwoOp;
+
+ done:
+    return rc;
+}
+
+static int
+decode_0f38(struct x86_emulate_state *s,
+            struct x86_emulate_ctxt *ctxt,
+            const struct x86_emulate_ops *ops)
+{
+    switch ( ctxt->opcode & X86EMUL_OPC_MASK )
+    {
+    case 0x00 ... 0xef:
+    case 0xf2 ... 0xf5:
+    case 0xf7 ... 0xf8:
+    case 0xfa ... 0xff:
+        s->op_bytes = 0;
+        /* fall through */
+    case 0xf6: /* adcx / adox */
+    case 0xf9: /* movdiri */
+        ctxt->opcode |= MASK_INSR(s->vex.pfx, X86EMUL_OPC_PFX_MASK);
+        break;
+
+    case X86EMUL_OPC_EVEX_66(0, 0x2d): /* vscalefs{s,d} */
+        s->simd_size = simd_scalar_vexw;
+        break;
+
+    case X86EMUL_OPC_EVEX_66(0, 0x7a): /* vpbroadcastb */
+    case X86EMUL_OPC_EVEX_66(0, 0x7b): /* vpbroadcastw */
+    case X86EMUL_OPC_EVEX_66(0, 0x7c): /* vpbroadcast{d,q} */
+        break;
+
+    case 0xf0: /* movbe / crc32 */
+        s->desc |= s->vex.pfx == vex_f2 ? ByteOp : Mov;
+        if ( s->vex.pfx >= vex_f3 )
+            ctxt->opcode |= MASK_INSR(s->vex.pfx, X86EMUL_OPC_PFX_MASK);
+        break;
+
+    case 0xf1: /* movbe / crc32 */
+        if ( s->vex.pfx == vex_f2 )
+            s->desc = DstReg | SrcMem;
+        if ( s->vex.pfx >= vex_f3 )
+            ctxt->opcode |= MASK_INSR(s->vex.pfx, X86EMUL_OPC_PFX_MASK);
+        break;
+
+    case X86EMUL_OPC_VEX(0, 0xf2):    /* andn */
+    case X86EMUL_OPC_VEX(0, 0xf3):    /* Grp 17 */
+    case X86EMUL_OPC_VEX(0, 0xf5):    /* bzhi */
+    case X86EMUL_OPC_VEX_F3(0, 0xf5): /* pext */
+    case X86EMUL_OPC_VEX_F2(0, 0xf5): /* pdep */
+    case X86EMUL_OPC_VEX_F2(0, 0xf6): /* mulx */
+    case X86EMUL_OPC_VEX(0, 0xf7):    /* bextr */
+    case X86EMUL_OPC_VEX_66(0, 0xf7): /* shlx */
+    case X86EMUL_OPC_VEX_F3(0, 0xf7): /* sarx */
+    case X86EMUL_OPC_VEX_F2(0, 0xf7): /* shrx */
+        break;
+
+    default:
+        s->op_bytes = 0;
+        break;
+    }
+
+    return X86EMUL_OKAY;
+}
+
+static int
+decode_0f3a(struct x86_emulate_state *s,
+            struct x86_emulate_ctxt *ctxt,
+            const struct x86_emulate_ops *ops)
+{
+    if ( !s->vex.opcx )
+        ctxt->opcode |= MASK_INSR(s->vex.pfx, X86EMUL_OPC_PFX_MASK);
+
+    switch ( ctxt->opcode & X86EMUL_OPC_MASK )
+    {
+    case X86EMUL_OPC_66(0, 0x14)
+     ... X86EMUL_OPC_66(0, 0x17):     /* pextr*, extractps */
+    case X86EMUL_OPC_VEX_66(0, 0x14)
+     ... X86EMUL_OPC_VEX_66(0, 0x17): /* vpextr*, vextractps */
+    case X86EMUL_OPC_EVEX_66(0, 0x14)
+     ... X86EMUL_OPC_EVEX_66(0, 0x17): /* vpextr*, vextractps */
+    case X86EMUL_OPC_VEX_F2(0, 0xf0): /* rorx */
+        break;
+
+    case X86EMUL_OPC_66(0, 0x20):     /* pinsrb */
+    case X86EMUL_OPC_VEX_66(0, 0x20): /* vpinsrb */
+    case X86EMUL_OPC_EVEX_66(0, 0x20): /* vpinsrb */
+        s->desc = DstImplicit | SrcMem;
+        if ( s->modrm_mod != 3 )
+            s->desc |= ByteOp;
+        break;
+
+    case X86EMUL_OPC_66(0, 0x22):     /* pinsr{d,q} */
+    case X86EMUL_OPC_VEX_66(0, 0x22): /* vpinsr{d,q} */
+    case X86EMUL_OPC_EVEX_66(0, 0x22): /* vpinsr{d,q} */
+        s->desc = DstImplicit | SrcMem;
+        break;
+
+    default:
+        s->op_bytes = 0;
+        break;
+    }
+
+    return X86EMUL_OKAY;
+}
+
+#define ad_bytes (s->ad_bytes) /* for truncate_ea() */
+
+int x86emul_decode(struct x86_emulate_state *s,
+                   struct x86_emulate_ctxt *ctxt,
+                   const struct x86_emulate_ops *ops)
+{
+    uint8_t b, d;
+    unsigned int def_op_bytes, def_ad_bytes, opcode;
+    enum x86_segment override_seg = x86_seg_none;
+    bool pc_rel = false;
+    int rc = X86EMUL_OKAY;
+
+    ASSERT(ops->insn_fetch);
+
+    memset(s, 0, sizeof(*s));
+    s->ea.type = OP_NONE;
+    s->ea.mem.seg = x86_seg_ds;
+    s->ea.reg = PTR_POISON;
+    s->regs = ctxt->regs;
+    s->ip = ctxt->regs->r(ip);
+
+    s->op_bytes = def_op_bytes = ad_bytes = def_ad_bytes =
+        ctxt->addr_size / 8;
+    if ( s->op_bytes == 8 )
+    {
+        s->op_bytes = def_op_bytes = 4;
+#ifndef __x86_64__
+        return X86EMUL_UNHANDLEABLE;
+#endif
+    }
+
+    /* Prefix bytes. */
+    for ( ; ; )
+    {
+        switch ( b = insn_fetch_type(uint8_t) )
+        {
+        case 0x66: /* operand-size override */
+            s->op_bytes = def_op_bytes ^ 6;
+            if ( !s->vex.pfx )
+                s->vex.pfx = vex_66;
+            break;
+        case 0x67: /* address-size override */
+            ad_bytes = def_ad_bytes ^ (mode_64bit() ? 12 : 6);
+            break;
+        case 0x2e: /* CS override / ignored in 64-bit mode */
+            if ( !mode_64bit() )
+                override_seg = x86_seg_cs;
+            break;
+        case 0x3e: /* DS override / ignored in 64-bit mode */
+            if ( !mode_64bit() )
+                override_seg = x86_seg_ds;
+            break;
+        case 0x26: /* ES override / ignored in 64-bit mode */
+            if ( !mode_64bit() )
+                override_seg = x86_seg_es;
+            break;
+        case 0x64: /* FS override */
+            override_seg = x86_seg_fs;
+            break;
+        case 0x65: /* GS override */
+            override_seg = x86_seg_gs;
+            break;
+        case 0x36: /* SS override / ignored in 64-bit mode */
+            if ( !mode_64bit() )
+                override_seg = x86_seg_ss;
+            break;
+        case 0xf0: /* LOCK */
+            s->lock_prefix = true;
+            break;
+        case 0xf2: /* REPNE/REPNZ */
+            s->vex.pfx = vex_f2;
+            break;
+        case 0xf3: /* REP/REPE/REPZ */
+            s->vex.pfx = vex_f3;
+            break;
+        case 0x40 ... 0x4f: /* REX */
+            if ( !mode_64bit() )
+                goto done_prefixes;
+            s->rex_prefix = b;
+            continue;
+        default:
+            goto done_prefixes;
+        }
+
+        /* Any legacy prefix after a REX prefix nullifies its effect. */
+        s->rex_prefix = 0;
+    }
+ done_prefixes:
+
+    if ( s->rex_prefix & REX_W )
+        s->op_bytes = 8;
+
+    /* Opcode byte(s). */
+    d = opcode_table[b];
+    if ( d == 0 && b == 0x0f )
+    {
+        /* Two-byte opcode. */
+        b = insn_fetch_type(uint8_t);
+        d = twobyte_table[b].desc;
+        switch ( b )
+        {
+        default:
+            opcode = b | MASK_INSR(0x0f, X86EMUL_OPC_EXT_MASK);
+            s->ext = ext_0f;
+            s->simd_size = twobyte_table[b].size;
+            break;
+        case 0x38:
+            b = insn_fetch_type(uint8_t);
+            opcode = b | MASK_INSR(0x0f38, X86EMUL_OPC_EXT_MASK);
+            s->ext = ext_0f38;
+            break;
+        case 0x3a:
+            b = insn_fetch_type(uint8_t);
+            opcode = b | MASK_INSR(0x0f3a, X86EMUL_OPC_EXT_MASK);
+            s->ext = ext_0f3a;
+            break;
+        }
+    }
+    else
+        opcode = b;
+
+    /* ModRM and SIB bytes. */
+    if ( d & ModRM )
+    {
+        s->modrm = insn_fetch_type(uint8_t);
+        s->modrm_mod = (s->modrm & 0xc0) >> 6;
+
+        if ( !s->ext && ((b & ~1) == 0xc4 || (b == 0x8f && (s->modrm & 0x18)) ||
+                         b == 0x62) )
+            switch ( def_ad_bytes )
+            {
+            default:
+                BUG(); /* Shouldn't be possible. */
+            case 2:
+                if ( s->regs->eflags & X86_EFLAGS_VM )
+                    break;
+                /* fall through */
+            case 4:
+                if ( s->modrm_mod != 3 || in_realmode(ctxt, ops) )
+                    break;
+                /* fall through */
+            case 8:
+                /* VEX / XOP / EVEX */
+                generate_exception_if(s->rex_prefix || s->vex.pfx, X86_EXC_UD);
+                /*
+                 * With operand size override disallowed (see above), op_bytes
+                 * should not have changed from its default.
+                 */
+                ASSERT(s->op_bytes == def_op_bytes);
+
+                s->vex.raw[0] = s->modrm;
+                if ( b == 0xc5 )
+                {
+                    opcode = X86EMUL_OPC_VEX_;
+                    s->vex.raw[1] = s->modrm;
+                    s->vex.opcx = vex_0f;
+                    s->vex.x = 1;
+                    s->vex.b = 1;
+                    s->vex.w = 0;
+                }
+                else
+                {
+                    s->vex.raw[1] = insn_fetch_type(uint8_t);
+                    if ( mode_64bit() )
+                    {
+                        if ( !s->vex.b )
+                            s->rex_prefix |= REX_B;
+                        if ( !s->vex.x )
+                            s->rex_prefix |= REX_X;
+                        if ( s->vex.w )
+                        {
+                            s->rex_prefix |= REX_W;
+                            s->op_bytes = 8;
+                        }
+                    }
+                    else
+                    {
+                        /* Operand size fixed at 4 (no override via W bit). */
+                        s->op_bytes = 4;
+                        s->vex.b = 1;
+                    }
+                    switch ( b )
+                    {
+                    case 0x62:
+                        opcode = X86EMUL_OPC_EVEX_;
+                        s->evex.raw[0] = s->vex.raw[0];
+                        s->evex.raw[1] = s->vex.raw[1];
+                        s->evex.raw[2] = insn_fetch_type(uint8_t);
+
+                        generate_exception_if(!s->evex.mbs || s->evex.mbz, X86_EXC_UD);
+                        generate_exception_if(!s->evex.opmsk && s->evex.z, X86_EXC_UD);
+
+                        if ( !mode_64bit() )
+                            s->evex.R = 1;
+
+                        s->vex.opcx = s->evex.opcx;
+                        break;
+                    case 0xc4:
+                        opcode = X86EMUL_OPC_VEX_;
+                        break;
+                    default:
+                        opcode = 0;
+                        break;
+                    }
+                }
+                if ( !s->vex.r )
+                    s->rex_prefix |= REX_R;
+
+                s->ext = s->vex.opcx;
+                if ( b != 0x8f )
+                {
+                    b = insn_fetch_type(uint8_t);
+                    switch ( s->ext )
+                    {
+                    case vex_0f:
+                        opcode |= MASK_INSR(0x0f, X86EMUL_OPC_EXT_MASK);
+                        d = twobyte_table[b].desc;
+                        s->simd_size = twobyte_table[b].size;
+                        break;
+                    case vex_0f38:
+                        opcode |= MASK_INSR(0x0f38, X86EMUL_OPC_EXT_MASK);
+                        d = twobyte_table[0x38].desc;
+                        break;
+                    case vex_0f3a:
+                        opcode |= MASK_INSR(0x0f3a, X86EMUL_OPC_EXT_MASK);
+                        d = twobyte_table[0x3a].desc;
+                        break;
+                    default:
+                        rc = X86EMUL_UNRECOGNIZED;
+                        goto done;
+                    }
+                }
+                else if ( s->ext < ext_8f08 + ARRAY_SIZE(xop_table) )
+                {
+                    b = insn_fetch_type(uint8_t);
+                    opcode |= MASK_INSR(0x8f08 + s->ext - ext_8f08,
+                                        X86EMUL_OPC_EXT_MASK);
+                    d = array_access_nospec(xop_table, s->ext - ext_8f08);
+                }
+                else
+                {
+                    rc = X86EMUL_UNRECOGNIZED;
+                    goto done;
+                }
+
+                opcode |= b | MASK_INSR(s->vex.pfx, X86EMUL_OPC_PFX_MASK);
+
+                if ( !evex_encoded() )
+                    s->evex.lr = s->vex.l;
+
+                if ( !(d & ModRM) )
+                    break;
+
+                s->modrm = insn_fetch_type(uint8_t);
+                s->modrm_mod = (s->modrm & 0xc0) >> 6;
+
+                break;
+            }
+    }
+
+    if ( d & ModRM )
+    {
+        unsigned int disp8scale = 0;
+
+        d &= ~ModRM;
+#undef ModRM /* Only its aliases are valid to use from here on. */
+        s->modrm_reg = ((s->rex_prefix & 4) << 1) | ((s->modrm & 0x38) >> 3) |
+                       ((evex_encoded() && !s->evex.R) << 4);
+        s->modrm_rm  = s->modrm & 0x07;
+
+        /*
+         * Early operand adjustments. Only ones affecting further processing
+         * prior to the x86_decode_*() calls really belong here. That would
+         * normally be only addition/removal of SrcImm/SrcImm16, so their
+         * fetching can be taken care of by the common code below.
+         */
+        switch ( s->ext )
+        {
+        case ext_none:
+            switch ( b )
+            {
+            case 0xf6 ... 0xf7: /* Grp3 */
+                switch ( s->modrm_reg & 7 )
+                {
+                case 0 ... 1: /* test */
+                    d |= DstMem | SrcImm;
+                    break;
+                case 2: /* not */
+                case 3: /* neg */
+                    d |= DstMem;
+                    break;
+                case 4: /* mul */
+                case 5: /* imul */
+                case 6: /* div */
+                case 7: /* idiv */
+                    /*
+                     * DstEax isn't really precise for all cases; updates to
+                     * rDX get handled in an open coded manner.
+                     */
+                    d |= DstEax | SrcMem;
+                    break;
+                }
+                break;
+            }
+            break;
+
+        case ext_0f:
+            if ( evex_encoded() )
+                disp8scale = decode_disp8scale(twobyte_table[b].d8s, s);
+
+            switch ( b )
+            {
+            case 0x12: /* vmovsldup / vmovddup */
+                if ( s->evex.pfx == vex_f2 )
+                    disp8scale = s->evex.lr ? 4 + s->evex.lr : 3;
+                /* fall through */
+            case 0x16: /* vmovshdup */
+                if ( s->evex.pfx == vex_f3 )
+                    disp8scale = 4 + s->evex.lr;
+                break;
+
+            case 0x20: /* mov cr,reg */
+            case 0x21: /* mov dr,reg */
+            case 0x22: /* mov reg,cr */
+            case 0x23: /* mov reg,dr */
+                /*
+                 * Mov to/from cr/dr ignore the encoding of Mod, and behave as
+                 * if they were encoded as reg/reg instructions.  No further
+                 * disp/SIB bytes are fetched.
+                 */
+                s->modrm_mod = 3;
+                break;
+
+            case 0x78:
+            case 0x79:
+                if ( !s->evex.pfx )
+                    break;
+                /* vcvt{,t}ps2uqq need special casing */
+                if ( s->evex.pfx == vex_66 )
+                {
+                    if ( !s->evex.w && !s->evex.brs )
+                        --disp8scale;
+                    break;
+                }
+                /* vcvt{,t}s{s,d}2usi need special casing: fall through */
+            case 0x2c: /* vcvtts{s,d}2si need special casing */
+            case 0x2d: /* vcvts{s,d}2si need special casing */
+                if ( evex_encoded() )
+                    disp8scale = 2 + (s->evex.pfx & VEX_PREFIX_DOUBLE_MASK);
+                break;
+
+            case 0x5a: /* vcvtps2pd needs special casing */
+                if ( disp8scale && !s->evex.pfx && !s->evex.brs )
+                    --disp8scale;
+                break;
+
+            case 0x7a: /* vcvttps2qq and vcvtudq2pd need special casing */
+                if ( disp8scale && s->evex.pfx != vex_f2 && !s->evex.w && !s->evex.brs )
+                    --disp8scale;
+                break;
+
+            case 0x7b: /* vcvtp{s,d}2qq need special casing */
+                if ( disp8scale && s->evex.pfx == vex_66 )
+                    disp8scale = (s->evex.brs ? 2 : 3 + s->evex.lr) + s->evex.w;
+                break;
+
+            case 0x7e: /* vmovq xmm/m64,xmm needs special casing */
+                if ( disp8scale == 2 && s->evex.pfx == vex_f3 )
+                    disp8scale = 3;
+                break;
+
+            case 0xe6: /* vcvtdq2pd needs special casing */
+                if ( disp8scale && s->evex.pfx == vex_f3 && !s->evex.w && !s->evex.brs )
+                    --disp8scale;
+                break;
+            }
+            break;
+
+        case ext_0f38:
+            d = ext0f38_table[b].to_mem ? DstMem | SrcReg
+                                        : DstReg | SrcMem;
+            if ( ext0f38_table[b].two_op )
+                d |= TwoOp;
+            if ( ext0f38_table[b].vsib )
+                d |= vSIB;
+            s->simd_size = ext0f38_table[b].simd_size;
+            if ( evex_encoded() )
+            {
+                /*
+                 * VPMOVUS* are identical to VPMOVS* Disp8-scaling-wise, but
+                 * their attributes don't match those of the vex_66 encoded
+                 * insns with the same base opcodes. Rather than adding new
+                 * columns to the table, handle this here for now.
+                 */
+                if ( s->evex.pfx != vex_f3 || (b & 0xf8) != 0x10 )
+                    disp8scale = decode_disp8scale(ext0f38_table[b].d8s, s);
+                else
+                {
+                    disp8scale = decode_disp8scale(ext0f38_table[b ^ 0x30].d8s,
+                                                   s);
+                    s->simd_size = simd_other;
+                }
+
+                switch ( b )
+                {
+                /* vp4dpwssd{,s} need special casing */
+                case 0x52: case 0x53:
+                /* v4f{,n}madd{p,s}s need special casing */
+                case 0x9a: case 0x9b: case 0xaa: case 0xab:
+                    if ( s->evex.pfx == vex_f2 )
+                    {
+                        disp8scale = 4;
+                        s->simd_size = simd_128;
+                    }
+                    break;
+                }
+            }
+            break;
+
+        case ext_0f3a:
+            /*
+             * Cannot update d here yet, as the immediate operand still
+             * needs fetching.
+             */
+            s->simd_size = ext0f3a_table[b].simd_size;
+            if ( evex_encoded() )
+                disp8scale = decode_disp8scale(ext0f3a_table[b].d8s, s);
+            break;
+
+        case ext_8f09:
+            if ( ext8f09_table[b].two_op )
+                d |= TwoOp;
+            s->simd_size = ext8f09_table[b].simd_size;
+            break;
+
+        case ext_8f08:
+        case ext_8f0a:
+            /*
+             * Cannot update d here yet, as the immediate operand still
+             * needs fetching.
+             */
+            break;
+
+        default:
+            ASSERT_UNREACHABLE();
+            return X86EMUL_UNIMPLEMENTED;
+        }
+
+        if ( s->modrm_mod == 3 )
+        {
+            generate_exception_if(d & vSIB, X86_EXC_UD);
+            s->modrm_rm |= ((s->rex_prefix & 1) << 3) |
+                           ((evex_encoded() && !s->evex.x) << 4);
+            s->ea.type = OP_REG;
+        }
+        else if ( ad_bytes == 2 )
+        {
+            /* 16-bit ModR/M decode. */
+            generate_exception_if(d & vSIB, X86_EXC_UD);
+            s->ea.type = OP_MEM;
+            switch ( s->modrm_rm )
+            {
+            case 0:
+                s->ea.mem.off = s->regs->bx + s->regs->si;
+                break;
+            case 1:
+                s->ea.mem.off = s->regs->bx + s->regs->di;
+                break;
+            case 2:
+                s->ea.mem.seg = x86_seg_ss;
+                s->ea.mem.off = s->regs->bp + s->regs->si;
+                break;
+            case 3:
+                s->ea.mem.seg = x86_seg_ss;
+                s->ea.mem.off = s->regs->bp + s->regs->di;
+                break;
+            case 4:
+                s->ea.mem.off = s->regs->si;
+                break;
+            case 5:
+                s->ea.mem.off = s->regs->di;
+                break;
+            case 6:
+                if ( s->modrm_mod == 0 )
+                    break;
+                s->ea.mem.seg = x86_seg_ss;
+                s->ea.mem.off = s->regs->bp;
+                break;
+            case 7:
+                s->ea.mem.off = s->regs->bx;
+                break;
+            }
+            switch ( s->modrm_mod )
+            {
+            case 0:
+                if ( s->modrm_rm == 6 )
+                    s->ea.mem.off = insn_fetch_type(int16_t);
+                break;
+            case 1:
+                s->ea.mem.off += insn_fetch_type(int8_t) * (1 << disp8scale);
+                break;
+            case 2:
+                s->ea.mem.off += insn_fetch_type(int16_t);
+                break;
+            }
+        }
+        else
+        {
+            /* 32/64-bit ModR/M decode. */
+            s->ea.type = OP_MEM;
+            if ( s->modrm_rm == 4 )
+            {
+                uint8_t sib = insn_fetch_type(uint8_t);
+                uint8_t sib_base = (sib & 7) | ((s->rex_prefix << 3) & 8);
+
+                s->sib_index = ((sib >> 3) & 7) | ((s->rex_prefix << 2) & 8);
+                s->sib_scale = (sib >> 6) & 3;
+                if ( unlikely(d & vSIB) )
+                    s->sib_index |= (mode_64bit() && evex_encoded() &&
+                                     !s->evex.RX) << 4;
+                else if ( s->sib_index != 4 )
+                {
+                    s->ea.mem.off = *decode_gpr(s->regs, s->sib_index);
+                    s->ea.mem.off <<= s->sib_scale;
+                }
+                if ( (s->modrm_mod == 0) && ((sib_base & 7) == 5) )
+                    s->ea.mem.off += insn_fetch_type(int32_t);
+                else if ( sib_base == 4 )
+                {
+                    s->ea.mem.seg  = x86_seg_ss;
+                    s->ea.mem.off += s->regs->r(sp);
+                    if ( !s->ext && (b == 0x8f) )
+                        /* POP <rm> computes its EA post increment. */
+                        s->ea.mem.off += ((mode_64bit() && (s->op_bytes == 4))
+                                       ? 8 : s->op_bytes);
+                }
+                else if ( sib_base == 5 )
+                {
+                    s->ea.mem.seg  = x86_seg_ss;
+                    s->ea.mem.off += s->regs->r(bp);
+                }
+                else
+                    s->ea.mem.off += *decode_gpr(s->regs, sib_base);
+            }
+            else
+            {
+                generate_exception_if(d & vSIB, X86_EXC_UD);
+                s->modrm_rm |= (s->rex_prefix & 1) << 3;
+                s->ea.mem.off = *decode_gpr(s->regs, s->modrm_rm);
+                if ( (s->modrm_rm == 5) && (s->modrm_mod != 0) )
+                    s->ea.mem.seg = x86_seg_ss;
+            }
+            switch ( s->modrm_mod )
+            {
+            case 0:
+                if ( (s->modrm_rm & 7) != 5 )
+                    break;
+                s->ea.mem.off = insn_fetch_type(int32_t);
+                pc_rel = mode_64bit();
+                break;
+            case 1:
+                s->ea.mem.off += insn_fetch_type(int8_t) * (1 << disp8scale);
+                break;
+            case 2:
+                s->ea.mem.off += insn_fetch_type(int32_t);
+                break;
+            }
+        }
+    }
+    else
+    {
+        s->modrm_mod = 0xff;
+        s->modrm_reg = s->modrm_rm = s->modrm = 0;
+    }
+
+    if ( override_seg != x86_seg_none )
+        s->ea.mem.seg = override_seg;
+
+    /* Fetch the immediate operand, if present. */
+    switch ( d & SrcMask )
+    {
+        unsigned int bytes;
+
+    case SrcImm:
+        if ( !(d & ByteOp) )
+        {
+            if ( mode_64bit() && !amd_like(ctxt) &&
+                 ((s->ext == ext_none && (b | 1) == 0xe9) /* call / jmp */ ||
+                  (s->ext == ext_0f && (b | 0xf) == 0x8f) /* jcc */ ) )
+                s->op_bytes = 4;
+            bytes = s->op_bytes != 8 ? s->op_bytes : 4;
+        }
+        else
+        {
+    case SrcImmByte:
+            bytes = 1;
+        }
+        /* NB. Immediates are sign-extended as necessary. */
+        switch ( bytes )
+        {
+        case 1: s->imm1 = insn_fetch_type(int8_t);  break;
+        case 2: s->imm1 = insn_fetch_type(int16_t); break;
+        case 4: s->imm1 = insn_fetch_type(int32_t); break;
+        }
+        break;
+    case SrcImm16:
+        s->imm1 = insn_fetch_type(uint16_t);
+        break;
+    }
+
+    ctxt->opcode = opcode;
+    s->desc = d;
+
+    switch ( s->ext )
+    {
+    case ext_none:
+        rc = decode_onebyte(s, ctxt, ops);
+        break;
+
+    case ext_0f:
+        rc = decode_twobyte(s, ctxt, ops);
+        break;
+
+    case ext_0f38:
+        rc = decode_0f38(s, ctxt, ops);
+        break;
+
+    case ext_0f3a:
+        d = ext0f3a_table[b].to_mem ? DstMem | SrcReg : DstReg | SrcMem;
+        if ( ext0f3a_table[b].two_op )
+            d |= TwoOp;
+        else if ( ext0f3a_table[b].four_op && !mode_64bit() && s->vex.opcx )
+            s->imm1 &= 0x7f;
+        s->desc = d;
+        rc = decode_0f3a(s, ctxt, ops);
+        break;
+
+    case ext_8f08:
+        d = DstReg | SrcMem;
+        if ( ext8f08_table[b].two_op )
+            d |= TwoOp;
+        else if ( ext8f08_table[b].four_op && !mode_64bit() )
+            s->imm1 &= 0x7f;
+        s->desc = d;
+        s->simd_size = ext8f08_table[b].simd_size;
+        break;
+
+    case ext_8f09:
+    case ext_8f0a:
+        break;
+
+    default:
+        ASSERT_UNREACHABLE();
+        return X86EMUL_UNIMPLEMENTED;
+    }
+
+    if ( s->ea.type == OP_MEM )
+    {
+        if ( pc_rel )
+            s->ea.mem.off += s->ip;
+
+        s->ea.mem.off = truncate_ea(s->ea.mem.off);
+    }
+
+    /*
+     * Simple op_bytes calculations. More complicated cases produce 0
+     * and are further handled during execute.
+     */
+    switch ( s->simd_size )
+    {
+    case simd_none:
+        /*
+         * When prefix 66 has a meaning different from operand-size override,
+         * operand size defaults to 4 and can't be overridden to 2.
+         */
+        if ( s->op_bytes == 2 &&
+             (ctxt->opcode & X86EMUL_OPC_PFX_MASK) == X86EMUL_OPC_66(0, 0) )
+            s->op_bytes = 4;
+        break;
+
+#ifndef X86EMUL_NO_SIMD
+    case simd_packed_int:
+        switch ( s->vex.pfx )
+        {
+        case vex_none:
+            if ( !s->vex.opcx )
+            {
+                s->op_bytes = 8;
+                break;
+            }
+            /* fall through */
+        case vex_66:
+            s->op_bytes = 16 << s->evex.lr;
+            break;
+        default:
+            s->op_bytes = 0;
+            break;
+        }
+        break;
+
+    case simd_single_fp:
+        if ( s->vex.pfx & VEX_PREFIX_DOUBLE_MASK )
+        {
+            s->op_bytes = 0;
+            break;
+    case simd_packed_fp:
+            if ( s->vex.pfx & VEX_PREFIX_SCALAR_MASK )
+            {
+                s->op_bytes = 0;
+                break;
+            }
+        }
+        /* fall through */
+    case simd_any_fp:
+        switch ( s->vex.pfx )
+        {
+        default:
+            s->op_bytes = 16 << s->evex.lr;
+            break;
+        case vex_f3:
+            generate_exception_if(evex_encoded() && s->evex.w, X86_EXC_UD);
+            s->op_bytes = 4;
+            break;
+        case vex_f2:
+            generate_exception_if(evex_encoded() && !s->evex.w, X86_EXC_UD);
+            s->op_bytes = 8;
+            break;
+        }
+        break;
+
+    case simd_scalar_opc:
+        s->op_bytes = 4 << (ctxt->opcode & 1);
+        break;
+
+    case simd_scalar_vexw:
+        s->op_bytes = 4 << s->vex.w;
+        break;
+
+    case simd_128:
+        /* The special cases here are MMX shift insns. */
+        s->op_bytes = s->vex.opcx || s->vex.pfx ? 16 : 8;
+        break;
+
+    case simd_256:
+        s->op_bytes = 32;
+        break;
+#endif /* !X86EMUL_NO_SIMD */
+
+    default:
+        s->op_bytes = 0;
+        break;
+    }
+
+ done:
+    return rc;
+}
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -38,9 +38,11 @@
 #ifdef __i386__
 # define mode_64bit() false
 # define r(name) e ## name
+# define PTR_POISON NULL /* 32-bit builds are for user-space, so NULL is OK. */
 #else
 # define mode_64bit() (ctxt->addr_size == 64)
 # define r(name) r ## name
+# define PTR_POISON ((void *)0x8086000000008086UL) /* non-canonical */
 #endif
 
 /* Operand sizes: 8-bit operands or specified/overridden size. */
@@ -77,6 +79,23 @@
 
 typedef uint8_t opcode_desc_t;
 
+enum disp8scale {
+    /* Values 0 ... 4 are explicit sizes. */
+    d8s_bw = 5,
+    d8s_dq,
+    /* EVEX.W ignored outside of 64-bit mode */
+    d8s_dq64,
+    /*
+     * All further values must strictly be last and in the order
+     * given so that arithmetic on the values works.
+     */
+    d8s_vl,
+    d8s_vl_by_2,
+    d8s_vl_by_4,
+    d8s_vl_by_8,
+};
+typedef uint8_t disp8scale_t;
+
 /* Type, address-of, and value of an instruction's operand. */
 struct operand {
     enum { OP_REG, OP_MEM, OP_IMM, OP_NONE } type;
@@ -183,6 +202,9 @@ enum vex_pfx {
     vex_f2
 };
 
+#define VEX_PREFIX_DOUBLE_MASK 0x1
+#define VEX_PREFIX_SCALAR_MASK 0x2
+
 union vex {
     uint8_t raw[2];
     struct {             /* SDM names */
@@ -716,6 +738,10 @@ do {
     if ( rc ) goto done;                                        \
 } while (0)
 
+int x86emul_decode(struct x86_emulate_state *s,
+                   struct x86_emulate_ctxt *ctxt,
+                   const struct x86_emulate_ops *ops);
+
 int x86emul_fpu(struct x86_emulate_state *s,
                 struct cpu_user_regs *regs,
                 struct operand *dst,
@@ -745,6 +771,13 @@ int x86emul_0fc7(struct x86_emulate_stat
                  const struct x86_emulate_ops *ops,
                  mmval_t *mmvalp);
 
+/* Initialise output state in x86_emulate_ctxt */
+static inline void init_context(struct x86_emulate_ctxt *ctxt)
+{
+    ctxt->retire.raw = 0;
+    x86_emul_reset_event(ctxt);
+}
+
 static inline bool is_aligned(enum x86_segment seg, unsigned long offs,
                               unsigned int size, struct x86_emulate_ctxt *ctxt,
                               const struct x86_emulate_ops *ops)
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -22,274 +22,6 @@
 
 #include "private.h"
 
-static const opcode_desc_t opcode_table[256] = {
-    /* 0x00 - 0x07 */
-    ByteOp|DstMem|SrcReg|ModRM, DstMem|SrcReg|ModRM,
-    ByteOp|DstReg|SrcMem|ModRM, DstReg|SrcMem|ModRM,
-    ByteOp|DstEax|SrcImm, DstEax|SrcImm, ImplicitOps|Mov, ImplicitOps|Mov,
-    /* 0x08 - 0x0F */
-    ByteOp|DstMem|SrcReg|ModRM, DstMem|SrcReg|ModRM,
-    ByteOp|DstReg|SrcMem|ModRM, DstReg|SrcMem|ModRM,
-    ByteOp|DstEax|SrcImm, DstEax|SrcImm, ImplicitOps|Mov, 0,
-    /* 0x10 - 0x17 */
-    ByteOp|DstMem|SrcReg|ModRM, DstMem|SrcReg|ModRM,
-    ByteOp|DstReg|SrcMem|ModRM, DstReg|SrcMem|ModRM,
-    ByteOp|DstEax|SrcImm, DstEax|SrcImm, ImplicitOps|Mov, ImplicitOps|Mov,
-    /* 0x18 - 0x1F */
-    ByteOp|DstMem|SrcReg|ModRM, DstMem|SrcReg|ModRM,
-    ByteOp|DstReg|SrcMem|ModRM, DstReg|SrcMem|ModRM,
-    ByteOp|DstEax|SrcImm, DstEax|SrcImm, ImplicitOps|Mov, ImplicitOps|Mov,
-    /* 0x20 - 0x27 */
-    ByteOp|DstMem|SrcReg|ModRM, DstMem|SrcReg|ModRM,
-    ByteOp|DstReg|SrcMem|ModRM, DstReg|SrcMem|ModRM,
-    ByteOp|DstEax|SrcImm, DstEax|SrcImm, 0, ImplicitOps,
-    /* 0x28 - 0x2F */
-    ByteOp|DstMem|SrcReg|ModRM, DstMem|SrcReg|ModRM,
-    ByteOp|DstReg|SrcMem|ModRM, DstReg|SrcMem|ModRM,
-    ByteOp|DstEax|SrcImm, DstEax|SrcImm, 0, ImplicitOps,
-    /* 0x30 - 0x37 */
-    ByteOp|DstMem|SrcReg|ModRM, DstMem|SrcReg|ModRM,
-    ByteOp|DstReg|SrcMem|ModRM, DstReg|SrcMem|ModRM,
-    ByteOp|DstEax|SrcImm, DstEax|SrcImm, 0, ImplicitOps,
-    /* 0x38 - 0x3F */
-    ByteOp|DstReg|SrcMem|ModRM, DstReg|SrcMem|ModRM,
-    ByteOp|DstReg|SrcMem|ModRM, DstReg|SrcMem|ModRM,
-    ByteOp|DstEax|SrcImm, DstEax|SrcImm, 0, ImplicitOps,
-    /* 0x40 - 0x4F */
-    ImplicitOps, ImplicitOps, ImplicitOps, ImplicitOps,
-    ImplicitOps, ImplicitOps, ImplicitOps, ImplicitOps,
-    ImplicitOps, ImplicitOps, ImplicitOps, ImplicitOps,
-    ImplicitOps, ImplicitOps, ImplicitOps, ImplicitOps,
-    /* 0x50 - 0x5F */
-    ImplicitOps|Mov, ImplicitOps|Mov, ImplicitOps|Mov, ImplicitOps|Mov,
-    ImplicitOps|Mov, ImplicitOps|Mov, ImplicitOps|Mov, ImplicitOps|Mov,
-    ImplicitOps|Mov, ImplicitOps|Mov, ImplicitOps|Mov, ImplicitOps|Mov,
-    ImplicitOps|Mov, ImplicitOps|Mov, ImplicitOps|Mov, ImplicitOps|Mov,
-    /* 0x60 - 0x67 */
-    ImplicitOps, ImplicitOps, DstReg|SrcMem|ModRM, DstReg|SrcNone|ModRM|Mov,
-    0, 0, 0, 0,
-    /* 0x68 - 0x6F */
-    DstImplicit|SrcImm|Mov, DstReg|SrcImm|ModRM|Mov,
-    DstImplicit|SrcImmByte|Mov, DstReg|SrcImmByte|ModRM|Mov,
-    ImplicitOps|Mov, ImplicitOps|Mov, ImplicitOps|Mov, ImplicitOps|Mov,
-    /* 0x70 - 0x77 */
-    DstImplicit|SrcImmByte, DstImplicit|SrcImmByte,
-    DstImplicit|SrcImmByte, DstImplicit|SrcImmByte,
-    DstImplicit|SrcImmByte, DstImplicit|SrcImmByte,
-    DstImplicit|SrcImmByte, DstImplicit|SrcImmByte,
-    /* 0x78 - 0x7F */
-    DstImplicit|SrcImmByte, DstImplicit|SrcImmByte,
-    DstImplicit|SrcImmByte, DstImplicit|SrcImmByte,
-    DstImplicit|SrcImmByte, DstImplicit|SrcImmByte,
-    DstImplicit|SrcImmByte, DstImplicit|SrcImmByte,
-    /* 0x80 - 0x87 */
-    ByteOp|DstMem|SrcImm|ModRM, DstMem|SrcImm|ModRM,
-    ByteOp|DstMem|SrcImm|ModRM, DstMem|SrcImmByte|ModRM,
-    ByteOp|DstReg|SrcMem|ModRM, DstReg|SrcMem|ModRM,
-    ByteOp|DstMem|SrcReg|ModRM, DstMem|SrcReg|ModRM,
-    /* 0x88 - 0x8F */
-    ByteOp|DstMem|SrcReg|ModRM|Mov, DstMem|SrcReg|ModRM|Mov,
-    ByteOp|DstReg|SrcMem|ModRM|Mov, DstReg|SrcMem|ModRM|Mov,
-    DstMem|SrcReg|ModRM|Mov, DstReg|SrcNone|ModRM,
-    DstReg|SrcMem16|ModRM|Mov, DstMem|SrcNone|ModRM|Mov,
-    /* 0x90 - 0x97 */
-    DstImplicit|SrcEax, DstImplicit|SrcEax,
-    DstImplicit|SrcEax, DstImplicit|SrcEax,
-    DstImplicit|SrcEax, DstImplicit|SrcEax,
-    DstImplicit|SrcEax, DstImplicit|SrcEax,
-    /* 0x98 - 0x9F */
-    ImplicitOps, ImplicitOps, ImplicitOps, ImplicitOps,
-    ImplicitOps|Mov, ImplicitOps|Mov, ImplicitOps, ImplicitOps,
-    /* 0xA0 - 0xA7 */
-    ByteOp|DstEax|SrcMem|Mov, DstEax|SrcMem|Mov,
-    ByteOp|DstMem|SrcEax|Mov, DstMem|SrcEax|Mov,
-    ByteOp|ImplicitOps|Mov, ImplicitOps|Mov,
-    ByteOp|ImplicitOps, ImplicitOps,
-    /* 0xA8 - 0xAF */
-    ByteOp|DstEax|SrcImm, DstEax|SrcImm,
-    ByteOp|DstImplicit|SrcEax|Mov, DstImplicit|SrcEax|Mov,
-    ByteOp|DstEax|SrcImplicit|Mov, DstEax|SrcImplicit|Mov,
-    ByteOp|DstImplicit|SrcEax, DstImplicit|SrcEax,
-    /* 0xB0 - 0xB7 */
-    ByteOp|DstReg|SrcImm|Mov, ByteOp|DstReg|SrcImm|Mov,
-    ByteOp|DstReg|SrcImm|Mov, ByteOp|DstReg|SrcImm|Mov,
-    ByteOp|DstReg|SrcImm|Mov, ByteOp|DstReg|SrcImm|Mov,
-    ByteOp|DstReg|SrcImm|Mov, ByteOp|DstReg|SrcImm|Mov,
-    /* 0xB8 - 0xBF */
-    DstReg|SrcImm|Mov, DstReg|SrcImm|Mov, DstReg|SrcImm|Mov, DstReg|SrcImm|Mov,
-    DstReg|SrcImm|Mov, DstReg|SrcImm|Mov, DstReg|SrcImm|Mov, DstReg|SrcImm|Mov,
-    /* 0xC0 - 0xC7 */
-    ByteOp|DstMem|SrcImm|ModRM, DstMem|SrcImmByte|ModRM,
-    DstImplicit|SrcImm16, ImplicitOps,
-    DstReg|SrcMem|ModRM|Mov, DstReg|SrcMem|ModRM|Mov,
-    ByteOp|DstMem|SrcImm|ModRM|Mov, DstMem|SrcImm|ModRM|Mov,
-    /* 0xC8 - 0xCF */
-    DstImplicit|SrcImm16, ImplicitOps, DstImplicit|SrcImm16, ImplicitOps,
-    ImplicitOps, DstImplicit|SrcImmByte, ImplicitOps, ImplicitOps,
-    /* 0xD0 - 0xD7 */
-    ByteOp|DstMem|SrcImplicit|ModRM, DstMem|SrcImplicit|ModRM,
-    ByteOp|DstMem|SrcImplicit|ModRM, DstMem|SrcImplicit|ModRM,
-    DstImplicit|SrcImmByte, DstImplicit|SrcImmByte, ImplicitOps, ImplicitOps,
-    /* 0xD8 - 0xDF */
-    ImplicitOps|ModRM, ImplicitOps|ModRM|Mov,
-    ImplicitOps|ModRM, ImplicitOps|ModRM|Mov,
-    ImplicitOps|ModRM, ImplicitOps|ModRM|Mov,
-    DstImplicit|SrcMem16|ModRM, ImplicitOps|ModRM|Mov,
-    /* 0xE0 - 0xE7 */
-    DstImplicit|SrcImmByte, DstImplicit|SrcImmByte,
-    DstImplicit|SrcImmByte, DstImplicit|SrcImmByte,
-    DstEax|SrcImmByte, DstEax|SrcImmByte,
-    DstImplicit|SrcImmByte, DstImplicit|SrcImmByte,
-    /* 0xE8 - 0xEF */
-    DstImplicit|SrcImm|Mov, DstImplicit|SrcImm,
-    ImplicitOps, DstImplicit|SrcImmByte,
-    DstEax|SrcImplicit, DstEax|SrcImplicit, ImplicitOps, ImplicitOps,
-    /* 0xF0 - 0xF7 */
-    0, ImplicitOps, 0, 0,
-    ImplicitOps, ImplicitOps, ByteOp|ModRM, ModRM,
-    /* 0xF8 - 0xFF */
-    ImplicitOps, ImplicitOps, ImplicitOps, ImplicitOps,
-    ImplicitOps, ImplicitOps, ByteOp|DstMem|SrcNone|ModRM, DstMem|SrcNone|ModRM
-};
-
-enum disp8scale {
-    /* Values 0 ... 4 are explicit sizes. */
-    d8s_bw = 5,
-    d8s_dq,
-    /* EVEX.W ignored outside of 64-bit mode */
-    d8s_dq64,
-    /*
-     * All further values must strictly be last and in the order
-     * given so that arithmetic on the values works.
-     */
-    d8s_vl,
-    d8s_vl_by_2,
-    d8s_vl_by_4,
-    d8s_vl_by_8,
-};
-typedef uint8_t disp8scale_t;
-
-static const struct twobyte_table {
-    opcode_desc_t desc;
-    simd_opsize_t size:4;
-    disp8scale_t d8s:4;
-} twobyte_table[256] = {
-    [0x00] = { ModRM },
-    [0x01] = { ImplicitOps|ModRM },
-    [0x02] = { DstReg|SrcMem16|ModRM },
-    [0x03] = { DstReg|SrcMem16|ModRM },
-    [0x05] = { ImplicitOps },
-    [0x06] = { ImplicitOps },
-    [0x07] = { ImplicitOps },
-    [0x08] = { ImplicitOps },
-    [0x09] = { ImplicitOps },
-    [0x0b] = { ImplicitOps },
-    [0x0d] = { ImplicitOps|ModRM },
-    [0x0e] = { ImplicitOps },
-    [0x0f] = { ModRM|SrcImmByte },
-    [0x10] = { DstImplicit|SrcMem|ModRM|Mov, simd_any_fp, d8s_vl },
-    [0x11] = { DstMem|SrcImplicit|ModRM|Mov, simd_any_fp, d8s_vl },
-    [0x12] = { DstImplicit|SrcMem|ModRM|Mov, simd_other, 3 },
-    [0x13] = { DstMem|SrcImplicit|ModRM|Mov, simd_other, 3 },
-    [0x14 ... 0x15] = { DstImplicit|SrcMem|ModRM, simd_packed_fp, d8s_vl },
-    [0x16] = { DstImplicit|SrcMem|ModRM|Mov, simd_other, 3 },
-    [0x17] = { DstMem|SrcImplicit|ModRM|Mov, simd_other, 3 },
-    [0x18 ... 0x1f] = { ImplicitOps|ModRM },
-    [0x20 ... 0x21] = { DstMem|SrcImplicit|ModRM },
-    [0x22 ... 0x23] = { DstImplicit|SrcMem|ModRM },
-    [0x28] = { DstImplicit|SrcMem|ModRM|Mov, simd_packed_fp, d8s_vl },
-    [0x29] = { DstMem|SrcImplicit|ModRM|Mov, simd_packed_fp, d8s_vl },
-    [0x2a] = { DstImplicit|SrcMem|ModRM|Mov, simd_other, d8s_dq64 },
-    [0x2b] = { DstMem|SrcImplicit|ModRM|Mov, simd_any_fp, d8s_vl },
-    [0x2c ... 0x2d] = { DstImplicit|SrcMem|ModRM|Mov, simd_other },
-    [0x2e ... 0x2f] = { ImplicitOps|ModRM|TwoOp, simd_none, d8s_dq },
-    [0x30 ... 0x35] = { ImplicitOps },
-    [0x37] = { ImplicitOps },
-    [0x38] = { DstReg|SrcMem|ModRM },
-    [0x3a] = { DstReg|SrcImmByte|ModRM },
-    [0x40 ... 0x4f] = { DstReg|SrcMem|ModRM|Mov },
-    [0x50] = { DstReg|SrcImplicit|ModRM|Mov },
-    [0x51] = { DstImplicit|SrcMem|ModRM|TwoOp, simd_any_fp, d8s_vl },
-    [0x52 ... 0x53] = { DstImplicit|SrcMem|ModRM|TwoOp, simd_single_fp },
-    [0x54 ... 0x57] = { DstImplicit|SrcMem|ModRM, simd_packed_fp, d8s_vl },
-    [0x58 ... 0x59] = { DstImplicit|SrcMem|ModRM, simd_any_fp, d8s_vl },
-    [0x5a] = { DstImplicit|SrcMem|ModRM|Mov, simd_any_fp, d8s_vl },
-    [0x5b] = { DstImplicit|SrcMem|ModRM|Mov, simd_packed_fp, d8s_vl },
-    [0x5c ... 0x5f] = { DstImplicit|SrcMem|ModRM, simd_any_fp, d8s_vl },
-    [0x60 ... 0x62] = { DstImplicit|SrcMem|ModRM, simd_other, d8s_vl },
-    [0x63 ... 0x67] = { DstImplicit|SrcMem|ModRM, simd_packed_int, d8s_vl },
-    [0x68 ... 0x6a] = { DstImplicit|SrcMem|ModRM, simd_other, d8s_vl },
-    [0x6b ... 0x6d] = { DstImplicit|SrcMem|ModRM, simd_packed_int, d8s_vl },
-    [0x6e] = { DstImplicit|SrcMem|ModRM|Mov, simd_none, d8s_dq64 },
-    [0x6f] = { DstImplicit|SrcMem|ModRM|Mov, simd_packed_int, d8s_vl },
-    [0x70] = { SrcImmByte|ModRM|TwoOp, simd_other, d8s_vl },
-    [0x71 ... 0x73] = { DstImplicit|SrcImmByte|ModRM, simd_none, d8s_vl },
-    [0x74 ... 0x76] = { DstImplicit|SrcMem|ModRM, simd_packed_int, d8s_vl },
-    [0x77] = { DstImplicit|SrcNone },
-    [0x78 ... 0x79] = { DstImplicit|SrcMem|ModRM|Mov, simd_other, d8s_vl },
-    [0x7a] = { DstImplicit|SrcMem|ModRM|Mov, simd_packed_fp, d8s_vl },
-    [0x7b] = { DstImplicit|SrcMem|ModRM|Mov, simd_other, d8s_dq64 },
-    [0x7c ... 0x7d] = { DstImplicit|SrcMem|ModRM, simd_other },
-    [0x7e] = { DstMem|SrcImplicit|ModRM|Mov, simd_none, d8s_dq64 },
-    [0x7f] = { DstMem|SrcImplicit|ModRM|Mov, simd_packed_int, d8s_vl },
-    [0x80 ... 0x8f] = { DstImplicit|SrcImm },
-    [0x90 ... 0x9f] = { ByteOp|DstMem|SrcNone|ModRM|Mov },
-    [0xa0 ... 0xa1] = { ImplicitOps|Mov },
-    [0xa2] = { ImplicitOps },
-    [0xa3] = { DstBitBase|SrcReg|ModRM },
-    [0xa4] = { DstMem|SrcImmByte|ModRM },
-    [0xa5] = { DstMem|SrcReg|ModRM },
-    [0xa6 ... 0xa7] = { ModRM },
-    [0xa8 ... 0xa9] = { ImplicitOps|Mov },
-    [0xaa] = { ImplicitOps },
-    [0xab] = { DstBitBase|SrcReg|ModRM },
-    [0xac] = { DstMem|SrcImmByte|ModRM },
-    [0xad] = { DstMem|SrcReg|ModRM },
-    [0xae] = { ImplicitOps|ModRM },
-    [0xaf] = { DstReg|SrcMem|ModRM },
-    [0xb0] = { ByteOp|DstMem|SrcReg|ModRM },
-    [0xb1] = { DstMem|SrcReg|ModRM },
-    [0xb2] = { DstReg|SrcMem|ModRM|Mov },
-    [0xb3] = { DstBitBase|SrcReg|ModRM },
-    [0xb4 ... 0xb5] = { DstReg|SrcMem|ModRM|Mov },
-    [0xb6] = { ByteOp|DstReg|SrcMem|ModRM|Mov },
-    [0xb7] = { DstReg|SrcMem16|ModRM|Mov },
-    [0xb8] = { DstReg|SrcMem|ModRM },
-    [0xb9] = { ModRM },
-    [0xba] = { DstBitBase|SrcImmByte|ModRM },
-    [0xbb] = { DstBitBase|SrcReg|ModRM },
-    [0xbc ... 0xbd] = { DstReg|SrcMem|ModRM },
-    [0xbe] = { ByteOp|DstReg|SrcMem|ModRM|Mov },
-    [0xbf] = { DstReg|SrcMem16|ModRM|Mov },
-    [0xc0] = { ByteOp|DstMem|SrcReg|ModRM },
-    [0xc1] = { DstMem|SrcReg|ModRM },
-    [0xc2] = { DstImplicit|SrcImmByte|ModRM, simd_any_fp, d8s_vl },
-    [0xc3] = { DstMem|SrcReg|ModRM|Mov },
-    [0xc4] = { DstImplicit|SrcImmByte|ModRM, simd_none, 1 },
-    [0xc5] = { DstReg|SrcImmByte|ModRM|Mov },
-    [0xc6] = { DstImplicit|SrcImmByte|ModRM, simd_packed_fp, d8s_vl },
-    [0xc7] = { ImplicitOps|ModRM },
-    [0xc8 ... 0xcf] = { ImplicitOps },
-    [0xd0] = { DstImplicit|SrcMem|ModRM, simd_other },
-    [0xd1 ... 0xd3] = { DstImplicit|SrcMem|ModRM, simd_128, 4 },
-    [0xd4 ... 0xd5] = { DstImplicit|SrcMem|ModRM, simd_packed_int, d8s_vl },
-    [0xd6] = { DstMem|SrcImplicit|ModRM|Mov, simd_other, 3 },
-    [0xd7] = { DstReg|SrcImplicit|ModRM|Mov },
-    [0xd8 ... 0xdf] = { DstImplicit|SrcMem|ModRM, simd_packed_int, d8s_vl },
-    [0xe0] = { DstImplicit|SrcMem|ModRM, simd_packed_int, d8s_vl },
-    [0xe1 ... 0xe2] = { DstImplicit|SrcMem|ModRM, simd_128, 4 },
-    [0xe3 ... 0xe5] = { DstImplicit|SrcMem|ModRM, simd_packed_int, d8s_vl },
-    [0xe6] = { DstImplicit|SrcMem|ModRM|Mov, simd_packed_fp, d8s_vl },
-    [0xe7] = { DstMem|SrcImplicit|ModRM|Mov, simd_packed_int, d8s_vl },
-    [0xe8 ... 0xef] = { DstImplicit|SrcMem|ModRM, simd_packed_int, d8s_vl },
-    [0xf0] = { DstImplicit|SrcMem|ModRM|Mov, simd_other },
-    [0xf1 ... 0xf3] = { DstImplicit|SrcMem|ModRM, simd_128, 4 },
-    [0xf4 ... 0xf6] = { DstImplicit|SrcMem|ModRM, simd_packed_int, d8s_vl },
-    [0xf7] = { DstMem|SrcMem|ModRM|Mov, simd_packed_int },
-    [0xf8 ... 0xfe] = { DstImplicit|SrcMem|ModRM, simd_packed_int, d8s_vl },
-    [0xff] = { ModRM }
-};
-
 /*
  * The next two tables are indexed by high opcode extension byte (the one
  * that's encoded like an immediate) nibble, with each table element then
@@ -325,257 +57,9 @@ static const uint16_t _3dnow_ext_table[1
     [0xb] = (1 << 0xb) /* pswapd */,
 };
 
-/*
- * "two_op" and "four_op" below refer to the number of register operands
- * (one of which possibly also allowing to be a memory one). The named
- * operand counts do not include any immediate operands.
- */
-static const struct ext0f38_table {
-    uint8_t simd_size:5;
-    uint8_t to_mem:1;
-    uint8_t two_op:1;
-    uint8_t vsib:1;
-    disp8scale_t d8s:4;
-} ext0f38_table[256] = {
-    [0x00] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
-    [0x01 ... 0x03] = { .simd_size = simd_packed_int },
-    [0x04] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
-    [0x05 ... 0x0a] = { .simd_size = simd_packed_int },
-    [0x0b] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
-    [0x0c ... 0x0d] = { .simd_size = simd_packed_fp, .d8s = d8s_vl },
-    [0x0e ... 0x0f] = { .simd_size = simd_packed_fp },
-    [0x10 ... 0x12] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
-    [0x13] = { .simd_size = simd_other, .two_op = 1, .d8s = d8s_vl_by_2 },
-    [0x14 ... 0x16] = { .simd_size = simd_packed_fp, .d8s = d8s_vl },
-    [0x17] = { .simd_size = simd_packed_int, .two_op = 1 },
-    [0x18] = { .simd_size = simd_scalar_opc, .two_op = 1, .d8s = 2 },
-    [0x19] = { .simd_size = simd_scalar_opc, .two_op = 1, .d8s = 3 },
-    [0x1a] = { .simd_size = simd_128, .two_op = 1, .d8s = 4 },
-    [0x1b] = { .simd_size = simd_256, .two_op = 1, .d8s = d8s_vl_by_2 },
-    [0x1c ... 0x1f] = { .simd_size = simd_packed_int, .two_op = 1, .d8s = d8s_vl },
-    [0x20] = { .simd_size = simd_other, .two_op = 1, .d8s = d8s_vl_by_2 },
-    [0x21] = { .simd_size = simd_other, .two_op = 1, .d8s = d8s_vl_by_4 },
-    [0x22] = { .simd_size = simd_other, .two_op = 1, .d8s = d8s_vl_by_8 },
-    [0x23] = { .simd_size = simd_other, .two_op = 1, .d8s = d8s_vl_by_2 },
-    [0x24] = { .simd_size = simd_other, .two_op = 1, .d8s = d8s_vl_by_4 },
-    [0x25] = { .simd_size = simd_other, .two_op = 1, .d8s = d8s_vl_by_2 },
-    [0x26 ... 0x29] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
-    [0x2a] = { .simd_size = simd_packed_int, .two_op = 1, .d8s = d8s_vl },
-    [0x2b] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
-    [0x2c] = { .simd_size = simd_packed_fp, .d8s = d8s_vl },
-    [0x2d] = { .simd_size = simd_packed_fp, .d8s = d8s_dq },
-    [0x2e ... 0x2f] = { .simd_size = simd_packed_fp, .to_mem = 1 },
-    [0x30] = { .simd_size = simd_other, .two_op = 1, .d8s = d8s_vl_by_2 },
-    [0x31] = { .simd_size = simd_other, .two_op = 1, .d8s = d8s_vl_by_4 },
-    [0x32] = { .simd_size = simd_other, .two_op = 1, .d8s = d8s_vl_by_8 },
-    [0x33] = { .simd_size = simd_other, .two_op = 1, .d8s = d8s_vl_by_2 },
-    [0x34] = { .simd_size = simd_other, .two_op = 1, .d8s = d8s_vl_by_4 },
-    [0x35] = { .simd_size = simd_other, .two_op = 1, .d8s = d8s_vl_by_2 },
-    [0x36 ... 0x3f] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
-    [0x40] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
-    [0x41] = { .simd_size = simd_packed_int, .two_op = 1 },
-    [0x42] = { .simd_size = simd_packed_fp, .two_op = 1, .d8s = d8s_vl },
-    [0x43] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
-    [0x44] = { .simd_size = simd_packed_int, .two_op = 1, .d8s = d8s_vl },
-    [0x45 ... 0x47] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
-    [0x4c] = { .simd_size = simd_packed_fp, .two_op = 1, .d8s = d8s_vl },
-    [0x4d] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
-    [0x4e] = { .simd_size = simd_packed_fp, .two_op = 1, .d8s = d8s_vl },
-    [0x4f] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
-    [0x50 ... 0x53] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
-    [0x54 ... 0x55] = { .simd_size = simd_packed_int, .two_op = 1, .d8s = d8s_vl },
-    [0x58] = { .simd_size = simd_other, .two_op = 1, .d8s = 2 },
-    [0x59] = { .simd_size = simd_other, .two_op = 1, .d8s = 3 },
-    [0x5a] = { .simd_size = simd_128, .two_op = 1, .d8s = 4 },
-    [0x5b] = { .simd_size = simd_256, .two_op = 1, .d8s = d8s_vl_by_2 },
-    [0x62] = { .simd_size = simd_packed_int, .two_op = 1, .d8s = d8s_bw },
-    [0x63] = { .simd_size = simd_packed_int, .to_mem = 1, .two_op = 1, .d8s = d8s_bw },
-    [0x64 ... 0x66] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
-    [0x68] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
-    [0x70 ... 0x73] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
-    [0x75 ... 0x76] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
-    [0x77] = { .simd_size = simd_packed_fp, .d8s = d8s_vl },
-    [0x78] = { .simd_size = simd_other, .two_op = 1 },
-    [0x79] = { .simd_size = simd_other, .two_op = 1, .d8s = 1 },
-    [0x7a ... 0x7c] = { .simd_size = simd_none, .two_op = 1 },
-    [0x7d ... 0x7e] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
-    [0x7f] = { .simd_size = simd_packed_fp, .d8s = d8s_vl },
-    [0x82] = { .simd_size = simd_other },
-    [0x83] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
-    [0x88] = { .simd_size = simd_packed_fp, .two_op = 1, .d8s = d8s_dq },
-    [0x89] = { .simd_size = simd_packed_int, .two_op = 1, .d8s = d8s_dq },
-    [0x8a] = { .simd_size = simd_packed_fp, .to_mem = 1, .two_op = 1, .d8s = d8s_dq },
-    [0x8b] = { .simd_size = simd_packed_int, .to_mem = 1, .two_op = 1, .d8s = d8s_dq },
-    [0x8c] = { .simd_size = simd_packed_int },
-    [0x8d] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
-    [0x8e] = { .simd_size = simd_packed_int, .to_mem = 1 },
-    [0x8f] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
-    [0x90 ... 0x93] = { .simd_size = simd_other, .vsib = 1, .d8s = d8s_dq },
-    [0x96 ... 0x98] = { .simd_size = simd_packed_fp, .d8s = d8s_vl },
-    [0x99] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
-    [0x9a] = { .simd_size = simd_packed_fp, .d8s = d8s_vl },
-    [0x9b] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
-    [0x9c] = { .simd_size = simd_packed_fp, .d8s = d8s_vl },
-    [0x9d] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
-    [0x9e] = { .simd_size = simd_packed_fp, .d8s = d8s_vl },
-    [0x9f] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
-    [0xa0 ... 0xa3] = { .simd_size = simd_other, .to_mem = 1, .vsib = 1, .d8s = d8s_dq },
-    [0xa6 ... 0xa8] = { .simd_size = simd_packed_fp, .d8s = d8s_vl },
-    [0xa9] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
-    [0xaa] = { .simd_size = simd_packed_fp, .d8s = d8s_vl },
-    [0xab] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
-    [0xac] = { .simd_size = simd_packed_fp, .d8s = d8s_vl },
-    [0xad] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
-    [0xae] = { .simd_size = simd_packed_fp, .d8s = d8s_vl },
-    [0xaf] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
-    [0xb4 ... 0xb5] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
-    [0xb6 ... 0xb8] = { .simd_size = simd_packed_fp, .d8s = d8s_vl },
-    [0xb9] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
-    [0xba] = { .simd_size = simd_packed_fp, .d8s = d8s_vl },
-    [0xbb] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
-    [0xbc] = { .simd_size = simd_packed_fp, .d8s = d8s_vl },
-    [0xbd] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
-    [0xbe] = { .simd_size = simd_packed_fp, .d8s = d8s_vl },
-    [0xbf] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
-    [0xc4] = { .simd_size = simd_packed_int, .two_op = 1, .d8s = d8s_vl },
-    [0xc6 ... 0xc7] = { .simd_size = simd_other, .vsib = 1, .d8s = d8s_dq },
-    [0xc8] = { .simd_size = simd_packed_fp, .two_op = 1, .d8s = d8s_vl },
-    [0xc9] = { .simd_size = simd_other },
-    [0xca] = { .simd_size = simd_packed_fp, .two_op = 1, .d8s = d8s_vl },
-    [0xcb] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
-    [0xcc] = { .simd_size = simd_packed_fp, .two_op = 1, .d8s = d8s_vl },
-    [0xcd] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
-    [0xcf] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
-    [0xdb] = { .simd_size = simd_packed_int, .two_op = 1 },
-    [0xdc ... 0xdf] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
-    [0xf0] = { .two_op = 1 },
-    [0xf1] = { .to_mem = 1, .two_op = 1 },
-    [0xf2 ... 0xf3] = {},
-    [0xf5 ... 0xf7] = {},
-    [0xf8] = { .simd_size = simd_other },
-    [0xf9] = { .to_mem = 1, .two_op = 1 /* Mov */ },
-};
-
 /* Shift values between src and dst sizes of pmov{s,z}x{b,w,d}{w,d,q}. */
 static const uint8_t pmov_convert_delta[] = { 1, 2, 3, 1, 2, 1 };
 
-static const struct ext0f3a_table {
-    uint8_t simd_size:5;
-    uint8_t to_mem:1;
-    uint8_t two_op:1;
-    uint8_t four_op:1;
-    disp8scale_t d8s:4;
-} ext0f3a_table[256] = {
-    [0x00] = { .simd_size = simd_packed_int, .two_op = 1, .d8s = d8s_vl },
-    [0x01] = { .simd_size = simd_packed_fp, .two_op = 1, .d8s = d8s_vl },
-    [0x02] = { .simd_size = simd_packed_int },
-    [0x03] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
-    [0x04 ... 0x05] = { .simd_size = simd_packed_fp, .two_op = 1, .d8s = d8s_vl },
-    [0x06] = { .simd_size = simd_packed_fp },
-    [0x08 ... 0x09] = { .simd_size = simd_packed_fp, .two_op = 1, .d8s = d8s_vl },
-    [0x0a ... 0x0b] = { .simd_size = simd_scalar_opc, .d8s = d8s_dq },
-    [0x0c ... 0x0d] = { .simd_size = simd_packed_fp },
-    [0x0e] = { .simd_size = simd_packed_int },
-    [0x0f] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
-    [0x14] = { .simd_size = simd_none, .to_mem = 1, .two_op = 1, .d8s = 0 },
-    [0x15] = { .simd_size = simd_none, .to_mem = 1, .two_op = 1, .d8s = 1 },
-    [0x16] = { .simd_size = simd_none, .to_mem = 1, .two_op = 1, .d8s = d8s_dq64 },
-    [0x17] = { .simd_size = simd_none, .to_mem = 1, .two_op = 1, .d8s = 2 },
-    [0x18] = { .simd_size = simd_128, .d8s = 4 },
-    [0x19] = { .simd_size = simd_128, .to_mem = 1, .two_op = 1, .d8s = 4 },
-    [0x1a] = { .simd_size = simd_256, .d8s = d8s_vl_by_2 },
-    [0x1b] = { .simd_size = simd_256, .to_mem = 1, .two_op = 1, .d8s = d8s_vl_by_2 },
-    [0x1d] = { .simd_size = simd_other, .to_mem = 1, .two_op = 1, .d8s = d8s_vl_by_2 },
-    [0x1e ... 0x1f] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
-    [0x20] = { .simd_size = simd_none, .d8s = 0 },
-    [0x21] = { .simd_size = simd_other, .d8s = 2 },
-    [0x22] = { .simd_size = simd_none, .d8s = d8s_dq64 },
-    [0x23] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
-    [0x25] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
-    [0x26] = { .simd_size = simd_packed_fp, .two_op = 1, .d8s = d8s_vl },
-    [0x27] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
-    [0x30 ... 0x33] = { .simd_size = simd_other, .two_op = 1 },
-    [0x38] = { .simd_size = simd_128, .d8s = 4 },
-    [0x3a] = { .simd_size = simd_256, .d8s = d8s_vl_by_2 },
-    [0x39] = { .simd_size = simd_128, .to_mem = 1, .two_op = 1, .d8s = 4 },
-    [0x3b] = { .simd_size = simd_256, .to_mem = 1, .two_op = 1, .d8s = d8s_vl_by_2 },
-    [0x3e ... 0x3f] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
-    [0x40 ... 0x41] = { .simd_size = simd_packed_fp },
-    [0x42 ... 0x43] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
-    [0x44] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
-    [0x46] = { .simd_size = simd_packed_int },
-    [0x48 ... 0x49] = { .simd_size = simd_packed_fp, .four_op = 1 },
-    [0x4a ... 0x4b] = { .simd_size = simd_packed_fp, .four_op = 1 },
-    [0x4c] = { .simd_size = simd_packed_int, .four_op = 1 },
-    [0x50] = { .simd_size = simd_packed_fp, .d8s = d8s_vl },
-    [0x51] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
-    [0x54] = { .simd_size = simd_packed_fp, .d8s = d8s_vl },
-    [0x55] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
-    [0x56] = { .simd_size = simd_packed_fp, .two_op = 1, .d8s = d8s_vl },
-    [0x57] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
-    [0x5c ... 0x5f] = { .simd_size = simd_packed_fp, .four_op = 1 },
-    [0x60 ... 0x63] = { .simd_size = simd_packed_int, .two_op = 1 },
-    [0x66] = { .simd_size = simd_packed_fp, .two_op = 1, .d8s = d8s_vl },
-    [0x67] = { .simd_size = simd_scalar_vexw, .two_op = 1, .d8s = d8s_dq },
-    [0x68 ... 0x69] = { .simd_size = simd_packed_fp, .four_op = 1 },
-    [0x6a ... 0x6b] = { .simd_size = simd_scalar_opc, .four_op = 1 },
-    [0x6c ... 0x6d] = { .simd_size = simd_packed_fp, .four_op = 1 },
-    [0x6e ... 0x6f] = { .simd_size = simd_scalar_opc, .four_op = 1 },
-    [0x70 ... 0x73] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
-    [0x78 ... 0x79] = { .simd_size = simd_packed_fp, .four_op = 1 },
-    [0x7a ... 0x7b] = { .simd_size = simd_scalar_opc, .four_op = 1 },
-    [0x7c ... 0x7d] = { .simd_size = simd_packed_fp, .four_op = 1 },
-    [0x7e ... 0x7f] = { .simd_size = simd_scalar_opc, .four_op = 1 },
-    [0xcc] = { .simd_size = simd_other },
-    [0xce ... 0xcf] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
-    [0xdf] = { .simd_size = simd_packed_int, .two_op = 1 },
-    [0xf0] = {},
-};
-
-static const opcode_desc_t xop_table[] = {
-    DstReg|SrcImmByte|ModRM,
-    DstReg|SrcMem|ModRM,
-    DstReg|SrcImm|ModRM,
-};
-
-static const struct ext8f08_table {
-    uint8_t simd_size:5;
-    uint8_t two_op:1;
-    uint8_t four_op:1;
-} ext8f08_table[256] = {
-    [0xa2] = { .simd_size = simd_packed_int, .four_op = 1 },
-    [0x85 ... 0x87] = { .simd_size = simd_packed_int, .four_op = 1 },
-    [0x8e ... 0x8f] = { .simd_size = simd_packed_int, .four_op = 1 },
-    [0x95 ... 0x97] = { .simd_size = simd_packed_int, .four_op = 1 },
-    [0x9e ... 0x9f] = { .simd_size = simd_packed_int, .four_op = 1 },
-    [0xa3] = { .simd_size = simd_packed_int, .four_op = 1 },
-    [0xa6] = { .simd_size = simd_packed_int, .four_op = 1 },
-    [0xb6] = { .simd_size = simd_packed_int, .four_op = 1 },
-    [0xc0 ... 0xc3] = { .simd_size = simd_packed_int, .two_op = 1 },
-    [0xcc ... 0xcf] = { .simd_size = simd_packed_int },
-    [0xec ... 0xef] = { .simd_size = simd_packed_int },
-};
-
-static const struct ext8f09_table {
-    uint8_t simd_size:5;
-    uint8_t two_op:1;
-} ext8f09_table[256] = {
-    [0x01 ... 0x02] = { .two_op = 1 },
-    [0x80 ... 0x81] = { .simd_size = simd_packed_fp, .two_op = 1 },
-    [0x82 ... 0x83] = { .simd_size = simd_scalar_opc, .two_op = 1 },
-    [0x90 ... 0x9b] = { .simd_size = simd_packed_int },
-    [0xc1 ... 0xc3] = { .simd_size = simd_packed_int, .two_op = 1 },
-    [0xc6 ... 0xc7] = { .simd_size = simd_packed_int, .two_op = 1 },
-    [0xcb] = { .simd_size = simd_packed_int, .two_op = 1 },
-    [0xd1 ... 0xd3] = { .simd_size = simd_packed_int, .two_op = 1 },
-    [0xd6 ... 0xd7] = { .simd_size = simd_packed_int, .two_op = 1 },
-    [0xdb] = { .simd_size = simd_packed_int, .two_op = 1 },
-    [0xe1 ... 0xe3] = { .simd_size = simd_packed_int, .two_op = 1 },
-};
-
-#define VEX_PREFIX_DOUBLE_MASK 0x1
-#define VEX_PREFIX_SCALAR_MASK 0x2
-
 static const uint8_t sse_prefix[] = { 0x66, 0xf3, 0xf2 };
 
 #ifdef __x86_64__
@@ -637,12 +121,6 @@ static const uint8_t sse_prefix[] = { 0x
 #define repe_prefix()  (vex.pfx == vex_f3)
 #define repne_prefix() (vex.pfx == vex_f2)
 
-#ifdef __x86_64__
-#define PTR_POISON ((void *)0x8086000000008086UL) /* non-canonical */
-#else
-#define PTR_POISON NULL /* 32-bit builds are for user-space, so NULL is OK. */
-#endif
-
 /*
  * While proper alignment gets specified in mmval_t, this doesn't get honored
  * by the compiler for automatic variables. Use this helper to instantiate a
@@ -831,19 +309,6 @@ do{ asm volatile (
                 : [msk] "i" (EFLAGS_MASK), ## src);                     \
 } while (0)
 
-/* Fetch next part of the instruction being emulated. */
-#define insn_fetch_bytes(_size)                                         \
-({ unsigned long _x = 0, _ip = state->ip;                               \
-   state->ip += (_size); /* real hardware doesn't truncate */           \
-   generate_exception_if((uint8_t)(state->ip -                          \
-                                   ctxt->regs->r(ip)) > MAX_INST_LEN,   \
-                         EXC_GP, 0);                                    \
-   rc = ops->insn_fetch(_ip, &_x, _size, ctxt);                         \
-   if ( rc ) goto done;                                                 \
-   _x;                                                                  \
-})
-#define insn_fetch_type(_type) ((_type)insn_fetch_bytes(sizeof(_type)))
-
 /*
  * Given byte has even parity (even number of 1s)? SDM Vol. 1 Sec. 3.4.3.1,
  * "Status Flags": EFLAGS.PF reflects parity of least-sig. byte of result only.
@@ -1354,13 +819,6 @@ static int ioport_access_check(
     return rc;
 }
 
-/* Initialise output state in x86_emulate_ctxt */
-static void init_context(struct x86_emulate_ctxt *ctxt)
-{
-    ctxt->retire.raw = 0;
-    x86_emul_reset_event(ctxt);
-}
-
 static int
 realmode_load_seg(
     enum x86_segment seg,
@@ -1707,51 +1165,6 @@ static unsigned long *decode_vex_gpr(
     return decode_gpr(regs, ~vex_reg & (mode_64bit() ? 0xf : 7));
 }
 
-static unsigned int decode_disp8scale(enum disp8scale scale,
-                                      const struct x86_emulate_state *state)
-{
-    switch ( scale )
-    {
-    case d8s_bw:
-        return state->evex.w;
-
-    default:
-        if ( scale < d8s_vl )
-            return scale;
-        if ( state->evex.brs )
-        {
-    case d8s_dq:
-            return 2 + state->evex.w;
-        }
-        break;
-
-    case d8s_dq64:
-        return 2 + (state->op_bytes == 8);
-    }
-
-    switch ( state->simd_size )
-    {
-    case simd_any_fp:
-    case simd_single_fp:
-        if ( !(state->evex.pfx & VEX_PREFIX_SCALAR_MASK) )
-            break;
-        /* fall through */
-    case simd_scalar_opc:
-    case simd_scalar_vexw:
-        return 2 + state->evex.w;
-
-    case simd_128:
-        /* These should have an explicit size specified. */
-        ASSERT_UNREACHABLE();
-        return 4;
-
-    default:
-        break;
-    }
-
-    return 4 + state->evex.lr - (scale - d8s_vl);
-}
-
 #define avx512_vlen_check(lig) do { \
     switch ( evex.lr ) \
     { \
@@ -1833,1138 +1246,6 @@ int cf_check x86emul_unhandleable_rw(
 #define evex_encoded() (evex.mbs)
 #define ea (state->ea)
 
-static int
-x86_decode_onebyte(
-    struct x86_emulate_state *state,
-    struct x86_emulate_ctxt *ctxt,
-    const struct x86_emulate_ops *ops)
-{
-    int rc = X86EMUL_OKAY;
-
-    switch ( ctxt->opcode )
-    {
-    case 0x06: /* push %%es */
-    case 0x07: /* pop %%es */
-    case 0x0e: /* push %%cs */
-    case 0x16: /* push %%ss */
-    case 0x17: /* pop %%ss */
-    case 0x1e: /* push %%ds */
-    case 0x1f: /* pop %%ds */
-    case 0x27: /* daa */
-    case 0x2f: /* das */
-    case 0x37: /* aaa */
-    case 0x3f: /* aas */
-    case 0x60: /* pusha */
-    case 0x61: /* popa */
-    case 0x62: /* bound */
-    case 0xc4: /* les */
-    case 0xc5: /* lds */
-    case 0xce: /* into */
-    case 0xd4: /* aam */
-    case 0xd5: /* aad */
-    case 0xd6: /* salc */
-        state->not_64bit = true;
-        break;
-
-    case 0x82: /* Grp1 (x86/32 only) */
-        state->not_64bit = true;
-        /* fall through */
-    case 0x80: case 0x81: case 0x83: /* Grp1 */
-        if ( (modrm_reg & 7) == 7 ) /* cmp */
-            state->desc = (state->desc & ByteOp) | DstNone | SrcMem;
-        break;
-
-    case 0x90: /* nop / pause */
-        if ( repe_prefix() )
-            ctxt->opcode |= X86EMUL_OPC_F3(0, 0);
-        break;
-
-    case 0x9a: /* call (far, absolute) */
-    case 0xea: /* jmp (far, absolute) */
-        generate_exception_if(mode_64bit(), EXC_UD);
-
-        imm1 = insn_fetch_bytes(op_bytes);
-        imm2 = insn_fetch_type(uint16_t);
-        break;
-
-    case 0xa0: case 0xa1: /* mov mem.offs,{%al,%ax,%eax,%rax} */
-    case 0xa2: case 0xa3: /* mov {%al,%ax,%eax,%rax},mem.offs */
-        /* Source EA is not encoded via ModRM. */
-        ea.type = OP_MEM;
-        ea.mem.off = insn_fetch_bytes(ad_bytes);
-        break;
-
-    case 0xb8 ... 0xbf: /* mov imm{16,32,64},r{16,32,64} */
-        if ( op_bytes == 8 ) /* Fetch more bytes to obtain imm64. */
-            imm1 = ((uint32_t)imm1 |
-                    ((uint64_t)insn_fetch_type(uint32_t) << 32));
-        break;
-
-    case 0xc8: /* enter imm16,imm8 */
-        imm2 = insn_fetch_type(uint8_t);
-        break;
-
-    case 0xf6: case 0xf7: /* Grp3 */
-        if ( !(modrm_reg & 6) ) /* test */
-            state->desc = (state->desc & ByteOp) | DstNone | SrcMem;
-        break;
-
-    case 0xff: /* Grp5 */
-        switch ( modrm_reg & 7 )
-        {
-        case 2: /* call (near) */
-        case 4: /* jmp (near) */
-            if ( mode_64bit() && (op_bytes == 4 || !amd_like(ctxt)) )
-                op_bytes = 8;
-            state->desc = DstNone | SrcMem | Mov;
-            break;
-
-        case 3: /* call (far, absolute indirect) */
-        case 5: /* jmp (far, absolute indirect) */
-            /* REX.W ignored on a vendor-dependent basis. */
-            if ( op_bytes == 8 && amd_like(ctxt) )
-                op_bytes = 4;
-            state->desc = DstNone | SrcMem | Mov;
-            break;
-
-        case 6: /* push */
-            if ( mode_64bit() && op_bytes == 4 )
-                op_bytes = 8;
-            state->desc = DstNone | SrcMem | Mov;
-            break;
-        }
-        break;
-    }
-
- done:
-    return rc;
-}
-
-static int
-x86_decode_twobyte(
-    struct x86_emulate_state *state,
-    struct x86_emulate_ctxt *ctxt,
-    const struct x86_emulate_ops *ops)
-{
-    int rc = X86EMUL_OKAY;
-
-    switch ( ctxt->opcode & X86EMUL_OPC_MASK )
-    {
-    case 0x00: /* Grp6 */
-        switch ( modrm_reg & 6 )
-        {
-        case 0:
-            state->desc |= DstMem | SrcImplicit | Mov;
-            break;
-        case 2: case 4:
-            state->desc |= SrcMem16;
-            break;
-        }
-        break;
-
-    case 0x78:
-        state->desc = ImplicitOps;
-        state->simd_size = simd_none;
-        switch ( vex.pfx )
-        {
-        case vex_66: /* extrq $imm8, $imm8, xmm */
-        case vex_f2: /* insertq $imm8, $imm8, xmm, xmm */
-            imm1 = insn_fetch_type(uint8_t);
-            imm2 = insn_fetch_type(uint8_t);
-            break;
-        }
-        /* fall through */
-    case 0x10 ... 0x18:
-    case 0x28 ... 0x2f:
-    case 0x50 ... 0x77:
-    case 0x7a ... 0x7d:
-    case 0x7f:
-    case 0xc2 ... 0xc3:
-    case 0xc5 ... 0xc6:
-    case 0xd0 ... 0xef:
-    case 0xf1 ... 0xfe:
-        ctxt->opcode |= MASK_INSR(vex.pfx, X86EMUL_OPC_PFX_MASK);
-        break;
-
-    case 0x20: case 0x22: /* mov to/from cr */
-        if ( lock_prefix && vcpu_has_cr8_legacy() )
-        {
-            modrm_reg += 8;
-            lock_prefix = false;
-        }
-        /* fall through */
-    case 0x21: case 0x23: /* mov to/from dr */
-        ASSERT(ea.type == OP_REG); /* Early operand adjustment ensures this. */
-        generate_exception_if(lock_prefix, EXC_UD);
-        op_bytes = mode_64bit() ? 8 : 4;
-        break;
-
-    case 0x79:
-        state->desc = DstReg | SrcMem;
-        state->simd_size = simd_packed_int;
-        ctxt->opcode |= MASK_INSR(vex.pfx, X86EMUL_OPC_PFX_MASK);
-        break;
-
-    case 0x7e:
-        ctxt->opcode |= MASK_INSR(vex.pfx, X86EMUL_OPC_PFX_MASK);
-        if ( vex.pfx == vex_f3 ) /* movq xmm/m64,xmm */
-        {
-    case X86EMUL_OPC_VEX_F3(0, 0x7e): /* vmovq xmm/m64,xmm */
-    case X86EMUL_OPC_EVEX_F3(0, 0x7e): /* vmovq xmm/m64,xmm */
-            state->desc = DstImplicit | SrcMem | TwoOp;
-            state->simd_size = simd_other;
-            /* Avoid the state->desc clobbering of TwoOp below. */
-            return X86EMUL_OKAY;
-        }
-        break;
-
-    case X86EMUL_OPC_VEX(0, 0x90):    /* kmov{w,q} */
-    case X86EMUL_OPC_VEX_66(0, 0x90): /* kmov{b,d} */
-        state->desc = DstReg | SrcMem | Mov;
-        state->simd_size = simd_other;
-        break;
-
-    case X86EMUL_OPC_VEX(0, 0x91):    /* kmov{w,q} */
-    case X86EMUL_OPC_VEX_66(0, 0x91): /* kmov{b,d} */
-        state->desc = DstMem | SrcReg | Mov;
-        state->simd_size = simd_other;
-        break;
-
-    case 0xae:
-        ctxt->opcode |= MASK_INSR(vex.pfx, X86EMUL_OPC_PFX_MASK);
-        /* fall through */
-    case X86EMUL_OPC_VEX(0, 0xae):
-        switch ( modrm_reg & 7 )
-        {
-        case 2: /* {,v}ldmxcsr */
-            state->desc = DstImplicit | SrcMem | Mov;
-            op_bytes = 4;
-            break;
-
-        case 3: /* {,v}stmxcsr */
-            state->desc = DstMem | SrcImplicit | Mov;
-            op_bytes = 4;
-            break;
-        }
-        break;
-
-    case 0xb2: /* lss */
-    case 0xb4: /* lfs */
-    case 0xb5: /* lgs */
-        /* REX.W ignored on a vendor-dependent basis. */
-        if ( op_bytes == 8 && amd_like(ctxt) )
-            op_bytes = 4;
-        break;
-
-    case 0xb8: /* jmpe / popcnt */
-        if ( rep_prefix() )
-            ctxt->opcode |= MASK_INSR(vex.pfx, X86EMUL_OPC_PFX_MASK);
-        break;
-
-        /* Intentionally not handling here despite being modified by F3:
-    case 0xbc: bsf / tzcnt
-    case 0xbd: bsr / lzcnt
-         * They're being dealt with in the execution phase (if at all).
-         */
-
-    case 0xc4: /* pinsrw */
-        ctxt->opcode |= MASK_INSR(vex.pfx, X86EMUL_OPC_PFX_MASK);
-        /* fall through */
-    case X86EMUL_OPC_VEX_66(0, 0xc4): /* vpinsrw */
-    case X86EMUL_OPC_EVEX_66(0, 0xc4): /* vpinsrw */
-        state->desc = DstImplicit | SrcMem16;
-        break;
-
-    case 0xf0:
-        ctxt->opcode |= MASK_INSR(vex.pfx, X86EMUL_OPC_PFX_MASK);
-        if ( vex.pfx == vex_f2 ) /* lddqu mem,xmm */
-        {
-        /* fall through */
-    case X86EMUL_OPC_VEX_F2(0, 0xf0): /* vlddqu mem,{x,y}mm */
-            state->desc = DstImplicit | SrcMem | TwoOp;
-            state->simd_size = simd_other;
-            /* Avoid the state->desc clobbering of TwoOp below. */
-            return X86EMUL_OKAY;
-        }
-        break;
-    }
-
-    /*
-     * Scalar forms of most VEX-/EVEX-encoded TwoOp instructions have
-     * three operands.  Those which do really have two operands
-     * should have exited earlier.
-     */
-    if ( state->simd_size && vex.opcx &&
-         (vex.pfx & VEX_PREFIX_SCALAR_MASK) )
-        state->desc &= ~TwoOp;
-
- done:
-    return rc;
-}
-
-static int
-x86_decode_0f38(
-    struct x86_emulate_state *state,
-    struct x86_emulate_ctxt *ctxt,
-    const struct x86_emulate_ops *ops)
-{
-    switch ( ctxt->opcode & X86EMUL_OPC_MASK )
-    {
-    case 0x00 ... 0xef:
-    case 0xf2 ... 0xf5:
-    case 0xf7 ... 0xf8:
-    case 0xfa ... 0xff:
-        op_bytes = 0;
-        /* fall through */
-    case 0xf6: /* adcx / adox */
-    case 0xf9: /* movdiri */
-        ctxt->opcode |= MASK_INSR(vex.pfx, X86EMUL_OPC_PFX_MASK);
-        break;
-
-    case X86EMUL_OPC_EVEX_66(0, 0x2d): /* vscalefs{s,d} */
-        state->simd_size = simd_scalar_vexw;
-        break;
-
-    case X86EMUL_OPC_EVEX_66(0, 0x7a): /* vpbroadcastb */
-    case X86EMUL_OPC_EVEX_66(0, 0x7b): /* vpbroadcastw */
-    case X86EMUL_OPC_EVEX_66(0, 0x7c): /* vpbroadcast{d,q} */
-        break;
-
-    case 0xf0: /* movbe / crc32 */
-        state->desc |= repne_prefix() ? ByteOp : Mov;
-        if ( rep_prefix() )
-            ctxt->opcode |= MASK_INSR(vex.pfx, X86EMUL_OPC_PFX_MASK);
-        break;
-
-    case 0xf1: /* movbe / crc32 */
-        if ( repne_prefix() )
-            state->desc = DstReg | SrcMem;
-        if ( rep_prefix() )
-            ctxt->opcode |= MASK_INSR(vex.pfx, X86EMUL_OPC_PFX_MASK);
-        break;
-
-    case X86EMUL_OPC_VEX(0, 0xf2):    /* andn */
-    case X86EMUL_OPC_VEX(0, 0xf3):    /* Grp 17 */
-    case X86EMUL_OPC_VEX(0, 0xf5):    /* bzhi */
-    case X86EMUL_OPC_VEX_F3(0, 0xf5): /* pext */
-    case X86EMUL_OPC_VEX_F2(0, 0xf5): /* pdep */
-    case X86EMUL_OPC_VEX_F2(0, 0xf6): /* mulx */
-    case X86EMUL_OPC_VEX(0, 0xf7):    /* bextr */
-    case X86EMUL_OPC_VEX_66(0, 0xf7): /* shlx */
-    case X86EMUL_OPC_VEX_F3(0, 0xf7): /* sarx */
-    case X86EMUL_OPC_VEX_F2(0, 0xf7): /* shrx */
-        break;
-
-    default:
-        op_bytes = 0;
-        break;
-    }
-
-    return X86EMUL_OKAY;
-}
-
-static int
-x86_decode_0f3a(
-    struct x86_emulate_state *state,
-    struct x86_emulate_ctxt *ctxt,
-    const struct x86_emulate_ops *ops)
-{
-    if ( !vex.opcx )
-        ctxt->opcode |= MASK_INSR(vex.pfx, X86EMUL_OPC_PFX_MASK);
-
-    switch ( ctxt->opcode & X86EMUL_OPC_MASK )
-    {
-    case X86EMUL_OPC_66(0, 0x14)
-     ... X86EMUL_OPC_66(0, 0x17):     /* pextr*, extractps */
-    case X86EMUL_OPC_VEX_66(0, 0x14)
-     ... X86EMUL_OPC_VEX_66(0, 0x17): /* vpextr*, vextractps */
-    case X86EMUL_OPC_EVEX_66(0, 0x14)
-     ... X86EMUL_OPC_EVEX_66(0, 0x17): /* vpextr*, vextractps */
-    case X86EMUL_OPC_VEX_F2(0, 0xf0): /* rorx */
-        break;
-
-    case X86EMUL_OPC_66(0, 0x20):     /* pinsrb */
-    case X86EMUL_OPC_VEX_66(0, 0x20): /* vpinsrb */
-    case X86EMUL_OPC_EVEX_66(0, 0x20): /* vpinsrb */
-        state->desc = DstImplicit | SrcMem;
-        if ( modrm_mod != 3 )
-            state->desc |= ByteOp;
-        break;
-
-    case X86EMUL_OPC_66(0, 0x22):     /* pinsr{d,q} */
-    case X86EMUL_OPC_VEX_66(0, 0x22): /* vpinsr{d,q} */
-    case X86EMUL_OPC_EVEX_66(0, 0x22): /* vpinsr{d,q} */
-        state->desc = DstImplicit | SrcMem;
-        break;
-
-    default:
-        op_bytes = 0;
-        break;
-    }
-
-    return X86EMUL_OKAY;
-}
-
-static int
-x86_decode(
-    struct x86_emulate_state *state,
-    struct x86_emulate_ctxt *ctxt,
-    const struct x86_emulate_ops  *ops)
-{
-    uint8_t b, d;
-    unsigned int def_op_bytes, def_ad_bytes, opcode;
-    enum x86_segment override_seg = x86_seg_none;
-    bool pc_rel = false;
-    int rc = X86EMUL_OKAY;
-
-    ASSERT(ops->insn_fetch);
-
-    memset(state, 0, sizeof(*state));
-    ea.type = OP_NONE;
-    ea.mem.seg = x86_seg_ds;
-    ea.reg = PTR_POISON;
-    state->regs = ctxt->regs;
-    state->ip = ctxt->regs->r(ip);
-
-    op_bytes = def_op_bytes = ad_bytes = def_ad_bytes = ctxt->addr_size/8;
-    if ( op_bytes == 8 )
-    {
-        op_bytes = def_op_bytes = 4;
-#ifndef __x86_64__
-        return X86EMUL_UNHANDLEABLE;
-#endif
-    }
-
-    /* Prefix bytes. */
-    for ( ; ; )
-    {
-        switch ( b = insn_fetch_type(uint8_t) )
-        {
-        case 0x66: /* operand-size override */
-            op_bytes = def_op_bytes ^ 6;
-            if ( !vex.pfx )
-                vex.pfx = vex_66;
-            break;
-        case 0x67: /* address-size override */
-            ad_bytes = def_ad_bytes ^ (mode_64bit() ? 12 : 6);
-            break;
-        case 0x2e: /* CS override / ignored in 64-bit mode */
-            if ( !mode_64bit() )
-                override_seg = x86_seg_cs;
-            break;
-        case 0x3e: /* DS override / ignored in 64-bit mode */
-            if ( !mode_64bit() )
-                override_seg = x86_seg_ds;
-            break;
-        case 0x26: /* ES override / ignored in 64-bit mode */
-            if ( !mode_64bit() )
-                override_seg = x86_seg_es;
-            break;
-        case 0x64: /* FS override */
-            override_seg = x86_seg_fs;
-            break;
-        case 0x65: /* GS override */
-            override_seg = x86_seg_gs;
-            break;
-        case 0x36: /* SS override / ignored in 64-bit mode */
-            if ( !mode_64bit() )
-                override_seg = x86_seg_ss;
-            break;
-        case 0xf0: /* LOCK */
-            lock_prefix = 1;
-            break;
-        case 0xf2: /* REPNE/REPNZ */
-            vex.pfx = vex_f2;
-            break;
-        case 0xf3: /* REP/REPE/REPZ */
-            vex.pfx = vex_f3;
-            break;
-        case 0x40 ... 0x4f: /* REX */
-            if ( !mode_64bit() )
-                goto done_prefixes;
-            rex_prefix = b;
-            continue;
-        default:
-            goto done_prefixes;
-        }
-
-        /* Any legacy prefix after a REX prefix nullifies its effect. */
-        rex_prefix = 0;
-    }
- done_prefixes:
-
-    if ( rex_prefix & REX_W )
-        op_bytes = 8;
-
-    /* Opcode byte(s). */
-    d = opcode_table[b];
-    if ( d == 0 && b == 0x0f )
-    {
-        /* Two-byte opcode. */
-        b = insn_fetch_type(uint8_t);
-        d = twobyte_table[b].desc;
-        switch ( b )
-        {
-        default:
-            opcode = b | MASK_INSR(0x0f, X86EMUL_OPC_EXT_MASK);
-            ext = ext_0f;
-            state->simd_size = twobyte_table[b].size;
-            break;
-        case 0x38:
-            b = insn_fetch_type(uint8_t);
-            opcode = b | MASK_INSR(0x0f38, X86EMUL_OPC_EXT_MASK);
-            ext = ext_0f38;
-            break;
-        case 0x3a:
-            b = insn_fetch_type(uint8_t);
-            opcode = b | MASK_INSR(0x0f3a, X86EMUL_OPC_EXT_MASK);
-            ext = ext_0f3a;
-            break;
-        }
-    }
-    else
-        opcode = b;
-
-    /* ModRM and SIB bytes. */
-    if ( d & ModRM )
-    {
-        modrm = insn_fetch_type(uint8_t);
-        modrm_mod = (modrm & 0xc0) >> 6;
-
-        if ( !ext && ((b & ~1) == 0xc4 || (b == 0x8f && (modrm & 0x18)) ||
-                      b == 0x62) )
-            switch ( def_ad_bytes )
-            {
-            default:
-                BUG(); /* Shouldn't be possible. */
-            case 2:
-                if ( state->regs->eflags & X86_EFLAGS_VM )
-                    break;
-                /* fall through */
-            case 4:
-                if ( modrm_mod != 3 || in_realmode(ctxt, ops) )
-                    break;
-                /* fall through */
-            case 8:
-                /* VEX / XOP / EVEX */
-                generate_exception_if(rex_prefix || vex.pfx, EXC_UD);
-                /*
-                 * With operand size override disallowed (see above), op_bytes
-                 * should not have changed from its default.
-                 */
-                ASSERT(op_bytes == def_op_bytes);
-
-                vex.raw[0] = modrm;
-                if ( b == 0xc5 )
-                {
-                    opcode = X86EMUL_OPC_VEX_;
-                    vex.raw[1] = modrm;
-                    vex.opcx = vex_0f;
-                    vex.x = 1;
-                    vex.b = 1;
-                    vex.w = 0;
-                }
-                else
-                {
-                    vex.raw[1] = insn_fetch_type(uint8_t);
-                    if ( mode_64bit() )
-                    {
-                        if ( !vex.b )
-                            rex_prefix |= REX_B;
-                        if ( !vex.x )
-                            rex_prefix |= REX_X;
-                        if ( vex.w )
-                        {
-                            rex_prefix |= REX_W;
-                            op_bytes = 8;
-                        }
-                    }
-                    else
-                    {
-                        /* Operand size fixed at 4 (no override via W bit). */
-                        op_bytes = 4;
-                        vex.b = 1;
-                    }
-                    switch ( b )
-                    {
-                    case 0x62:
-                        opcode = X86EMUL_OPC_EVEX_;
-                        evex.raw[0] = vex.raw[0];
-                        evex.raw[1] = vex.raw[1];
-                        evex.raw[2] = insn_fetch_type(uint8_t);
-
-                        generate_exception_if(!evex.mbs || evex.mbz, EXC_UD);
-                        generate_exception_if(!evex.opmsk && evex.z, EXC_UD);
-
-                        if ( !mode_64bit() )
-                            evex.R = 1;
-
-                        vex.opcx = evex.opcx;
-                        break;
-                    case 0xc4:
-                        opcode = X86EMUL_OPC_VEX_;
-                        break;
-                    default:
-                        opcode = 0;
-                        break;
-                    }
-                }
-                if ( !vex.r )
-                    rex_prefix |= REX_R;
-
-                ext = vex.opcx;
-                if ( b != 0x8f )
-                {
-                    b = insn_fetch_type(uint8_t);
-                    switch ( ext )
-                    {
-                    case vex_0f:
-                        opcode |= MASK_INSR(0x0f, X86EMUL_OPC_EXT_MASK);
-                        d = twobyte_table[b].desc;
-                        state->simd_size = twobyte_table[b].size;
-                        break;
-                    case vex_0f38:
-                        opcode |= MASK_INSR(0x0f38, X86EMUL_OPC_EXT_MASK);
-                        d = twobyte_table[0x38].desc;
-                        break;
-                    case vex_0f3a:
-                        opcode |= MASK_INSR(0x0f3a, X86EMUL_OPC_EXT_MASK);
-                        d = twobyte_table[0x3a].desc;
-                        break;
-                    default:
-                        rc = X86EMUL_UNRECOGNIZED;
-                        goto done;
-                    }
-                }
-                else if ( ext < ext_8f08 + ARRAY_SIZE(xop_table) )
-                {
-                    b = insn_fetch_type(uint8_t);
-                    opcode |= MASK_INSR(0x8f08 + ext - ext_8f08,
-                                        X86EMUL_OPC_EXT_MASK);
-                    d = array_access_nospec(xop_table, ext - ext_8f08);
-                }
-                else
-                {
-                    rc = X86EMUL_UNRECOGNIZED;
-                    goto done;
-                }
-
-                opcode |= b | MASK_INSR(vex.pfx, X86EMUL_OPC_PFX_MASK);
-
-                if ( !evex_encoded() )
-                    evex.lr = vex.l;
-
-                if ( !(d & ModRM) )
-                    break;
-
-                modrm = insn_fetch_type(uint8_t);
-                modrm_mod = (modrm & 0xc0) >> 6;
-
-                break;
-            }
-    }
-
-    if ( d & ModRM )
-    {
-        unsigned int disp8scale = 0;
-
-        d &= ~ModRM;
-#undef ModRM /* Only its aliases are valid to use from here on. */
-        modrm_reg = ((rex_prefix & 4) << 1) | ((modrm & 0x38) >> 3) |
-                    ((evex_encoded() && !evex.R) << 4);
-        modrm_rm  = modrm & 0x07;
-
-        /*
-         * Early operand adjustments. Only ones affecting further processing
-         * prior to the x86_decode_*() calls really belong here. That would
-         * normally be only addition/removal of SrcImm/SrcImm16, so their
-         * fetching can be taken care of by the common code below.
-         */
-        switch ( ext )
-        {
-        case ext_none:
-            switch ( b )
-            {
-            case 0xf6 ... 0xf7: /* Grp3 */
-                switch ( modrm_reg & 7 )
-                {
-                case 0 ... 1: /* test */
-                    d |= DstMem | SrcImm;
-                    break;
-                case 2: /* not */
-                case 3: /* neg */
-                    d |= DstMem;
-                    break;
-                case 4: /* mul */
-                case 5: /* imul */
-                case 6: /* div */
-                case 7: /* idiv */
-                    /*
-                     * DstEax isn't really precise for all cases; updates to
-                     * rDX get handled in an open coded manner.
-                     */
-                    d |= DstEax | SrcMem;
-                    break;
-                }
-                break;
-            }
-            break;
-
-        case ext_0f:
-            if ( evex_encoded() )
-                disp8scale = decode_disp8scale(twobyte_table[b].d8s, state);
-
-            switch ( b )
-            {
-            case 0x12: /* vmovsldup / vmovddup */
-                if ( evex.pfx == vex_f2 )
-                    disp8scale = evex.lr ? 4 + evex.lr : 3;
-                /* fall through */
-            case 0x16: /* vmovshdup */
-                if ( evex.pfx == vex_f3 )
-                    disp8scale = 4 + evex.lr;
-                break;
-
-            case 0x20: /* mov cr,reg */
-            case 0x21: /* mov dr,reg */
-            case 0x22: /* mov reg,cr */
-            case 0x23: /* mov reg,dr */
-                /*
-                 * Mov to/from cr/dr ignore the encoding of Mod, and behave as
-                 * if they were encoded as reg/reg instructions.  No further
-                 * disp/SIB bytes are fetched.
-                 */
-                modrm_mod = 3;
-                break;
-
-            case 0x78:
-            case 0x79:
-                if ( !evex.pfx )
-                    break;
-                /* vcvt{,t}ps2uqq need special casing */
-                if ( evex.pfx == vex_66 )
-                {
-                    if ( !evex.w && !evex.brs )
-                        --disp8scale;
-                    break;
-                }
-                /* vcvt{,t}s{s,d}2usi need special casing: fall through */
-            case 0x2c: /* vcvtts{s,d}2si need special casing */
-            case 0x2d: /* vcvts{s,d}2si need special casing */
-                if ( evex_encoded() )
-                    disp8scale = 2 + (evex.pfx & VEX_PREFIX_DOUBLE_MASK);
-                break;
-
-            case 0x5a: /* vcvtps2pd needs special casing */
-                if ( disp8scale && !evex.pfx && !evex.brs )
-                    --disp8scale;
-                break;
-
-            case 0x7a: /* vcvttps2qq and vcvtudq2pd need special casing */
-                if ( disp8scale && evex.pfx != vex_f2 && !evex.w && !evex.brs )
-                    --disp8scale;
-                break;
-
-            case 0x7b: /* vcvtp{s,d}2qq need special casing */
-                if ( disp8scale && evex.pfx == vex_66 )
-                    disp8scale = (evex.brs ? 2 : 3 + evex.lr) + evex.w;
-                break;
-
-            case 0x7e: /* vmovq xmm/m64,xmm needs special casing */
-                if ( disp8scale == 2 && evex.pfx == vex_f3 )
-                    disp8scale = 3;
-                break;
-
-            case 0xe6: /* vcvtdq2pd needs special casing */
-                if ( disp8scale && evex.pfx == vex_f3 && !evex.w && !evex.brs )
-                    --disp8scale;
-                break;
-            }
-            break;
-
-        case ext_0f38:
-            d = ext0f38_table[b].to_mem ? DstMem | SrcReg
-                                        : DstReg | SrcMem;
-            if ( ext0f38_table[b].two_op )
-                d |= TwoOp;
-            if ( ext0f38_table[b].vsib )
-                d |= vSIB;
-            state->simd_size = ext0f38_table[b].simd_size;
-            if ( evex_encoded() )
-            {
-                /*
-                 * VPMOVUS* are identical to VPMOVS* Disp8-scaling-wise, but
-                 * their attributes don't match those of the vex_66 encoded
-                 * insns with the same base opcodes. Rather than adding new
-                 * columns to the table, handle this here for now.
-                 */
-                if ( evex.pfx != vex_f3 || (b & 0xf8) != 0x10 )
-                    disp8scale = decode_disp8scale(ext0f38_table[b].d8s, state);
-                else
-                {
-                    disp8scale = decode_disp8scale(ext0f38_table[b ^ 0x30].d8s,
-                                                   state);
-                    state->simd_size = simd_other;
-                }
-
-                switch ( b )
-                {
-                /* vp4dpwssd{,s} need special casing */
-                case 0x52: case 0x53:
-                /* v4f{,n}madd{p,s}s need special casing */
-                case 0x9a: case 0x9b: case 0xaa: case 0xab:
-                    if ( evex.pfx == vex_f2 )
-                    {
-                        disp8scale = 4;
-                        state->simd_size = simd_128;
-                    }
-                    break;
-                }
-            }
-            break;
-
-        case ext_0f3a:
-            /*
-             * Cannot update d here yet, as the immediate operand still
-             * needs fetching.
-             */
-            state->simd_size = ext0f3a_table[b].simd_size;
-            if ( evex_encoded() )
-                disp8scale = decode_disp8scale(ext0f3a_table[b].d8s, state);
-            break;
-
-        case ext_8f09:
-            if ( ext8f09_table[b].two_op )
-                d |= TwoOp;
-            state->simd_size = ext8f09_table[b].simd_size;
-            break;
-
-        case ext_8f08:
-        case ext_8f0a:
-            /*
-             * Cannot update d here yet, as the immediate operand still
-             * needs fetching.
-             */
-            break;
-
-        default:
-            ASSERT_UNREACHABLE();
-            return X86EMUL_UNIMPLEMENTED;
-        }
-
-        if ( modrm_mod == 3 )
-        {
-            generate_exception_if(d & vSIB, EXC_UD);
-            modrm_rm |= ((rex_prefix & 1) << 3) |
-                        ((evex_encoded() && !evex.x) << 4);
-            ea.type = OP_REG;
-        }
-        else if ( ad_bytes == 2 )
-        {
-            /* 16-bit ModR/M decode. */
-            generate_exception_if(d & vSIB, EXC_UD);
-            ea.type = OP_MEM;
-            switch ( modrm_rm )
-            {
-            case 0:
-                ea.mem.off = state->regs->bx + state->regs->si;
-                break;
-            case 1:
-                ea.mem.off = state->regs->bx + state->regs->di;
-                break;
-            case 2:
-                ea.mem.seg = x86_seg_ss;
-                ea.mem.off = state->regs->bp + state->regs->si;
-                break;
-            case 3:
-                ea.mem.seg = x86_seg_ss;
-                ea.mem.off = state->regs->bp + state->regs->di;
-                break;
-            case 4:
-                ea.mem.off = state->regs->si;
-                break;
-            case 5:
-                ea.mem.off = state->regs->di;
-                break;
-            case 6:
-                if ( modrm_mod == 0 )
-                    break;
-                ea.mem.seg = x86_seg_ss;
-                ea.mem.off = state->regs->bp;
-                break;
-            case 7:
-                ea.mem.off = state->regs->bx;
-                break;
-            }
-            switch ( modrm_mod )
-            {
-            case 0:
-                if ( modrm_rm == 6 )
-                    ea.mem.off = insn_fetch_type(int16_t);
-                break;
-            case 1:
-                ea.mem.off += insn_fetch_type(int8_t) * (1 << disp8scale);
-                break;
-            case 2:
-                ea.mem.off += insn_fetch_type(int16_t);
-                break;
-            }
-        }
-        else
-        {
-            /* 32/64-bit ModR/M decode. */
-            ea.type = OP_MEM;
-            if ( modrm_rm == 4 )
-            {
-                uint8_t sib = insn_fetch_type(uint8_t);
-                uint8_t sib_base = (sib & 7) | ((rex_prefix << 3) & 8);
-
-                state->sib_index = ((sib >> 3) & 7) | ((rex_prefix << 2) & 8);
-                state->sib_scale = (sib >> 6) & 3;
-                if ( unlikely(d & vSIB) )
-                    state->sib_index |= (mode_64bit() && evex_encoded() &&
-                                         !evex.RX) << 4;
-                else if ( state->sib_index != 4 )
-                {
-                    ea.mem.off = *decode_gpr(state->regs, state->sib_index);
-                    ea.mem.off <<= state->sib_scale;
-                }
-                if ( (modrm_mod == 0) && ((sib_base & 7) == 5) )
-                    ea.mem.off += insn_fetch_type(int32_t);
-                else if ( sib_base == 4 )
-                {
-                    ea.mem.seg  = x86_seg_ss;
-                    ea.mem.off += state->regs->r(sp);
-                    if ( !ext && (b == 0x8f) )
-                        /* POP <rm> computes its EA post increment. */
-                        ea.mem.off += ((mode_64bit() && (op_bytes == 4))
-                                       ? 8 : op_bytes);
-                }
-                else if ( sib_base == 5 )
-                {
-                    ea.mem.seg  = x86_seg_ss;
-                    ea.mem.off += state->regs->r(bp);
-                }
-                else
-                    ea.mem.off += *decode_gpr(state->regs, sib_base);
-            }
-            else
-            {
-                generate_exception_if(d & vSIB, EXC_UD);
-                modrm_rm |= (rex_prefix & 1) << 3;
-                ea.mem.off = *decode_gpr(state->regs, modrm_rm);
-                if ( (modrm_rm == 5) && (modrm_mod != 0) )
-                    ea.mem.seg = x86_seg_ss;
-            }
-            switch ( modrm_mod )
-            {
-            case 0:
-                if ( (modrm_rm & 7) != 5 )
-                    break;
-                ea.mem.off = insn_fetch_type(int32_t);
-                pc_rel = mode_64bit();
-                break;
-            case 1:
-                ea.mem.off += insn_fetch_type(int8_t) * (1 << disp8scale);
-                break;
-            case 2:
-                ea.mem.off += insn_fetch_type(int32_t);
-                break;
-            }
-        }
-    }
-    else
-    {
-        modrm_mod = 0xff;
-        modrm_reg = modrm_rm = modrm = 0;
-    }
-
-    if ( override_seg != x86_seg_none )
-        ea.mem.seg = override_seg;
-
-    /* Fetch the immediate operand, if present. */
-    switch ( d & SrcMask )
-    {
-        unsigned int bytes;
-
-    case SrcImm:
-        if ( !(d & ByteOp) )
-        {
-            if ( mode_64bit() && !amd_like(ctxt) &&
-                 ((ext == ext_none && (b | 1) == 0xe9) /* call / jmp */ ||
-                  (ext == ext_0f && (b | 0xf) == 0x8f) /* jcc */ ) )
-                op_bytes = 4;
-            bytes = op_bytes != 8 ? op_bytes : 4;
-        }
-        else
-        {
-    case SrcImmByte:
-            bytes = 1;
-        }
-        /* NB. Immediates are sign-extended as necessary. */
-        switch ( bytes )
-        {
-        case 1: imm1 = insn_fetch_type(int8_t);  break;
-        case 2: imm1 = insn_fetch_type(int16_t); break;
-        case 4: imm1 = insn_fetch_type(int32_t); break;
-        }
-        break;
-    case SrcImm16:
-        imm1 = insn_fetch_type(uint16_t);
-        break;
-    }
-
-    ctxt->opcode = opcode;
-    state->desc = d;
-
-    switch ( ext )
-    {
-    case ext_none:
-        rc = x86_decode_onebyte(state, ctxt, ops);
-        break;
-
-    case ext_0f:
-        rc = x86_decode_twobyte(state, ctxt, ops);
-        break;
-
-    case ext_0f38:
-        rc = x86_decode_0f38(state, ctxt, ops);
-        break;
-
-    case ext_0f3a:
-        d = ext0f3a_table[b].to_mem ? DstMem | SrcReg : DstReg | SrcMem;
-        if ( ext0f3a_table[b].two_op )
-            d |= TwoOp;
-        else if ( ext0f3a_table[b].four_op && !mode_64bit() && vex.opcx )
-            imm1 &= 0x7f;
-        state->desc = d;
-        rc = x86_decode_0f3a(state, ctxt, ops);
-        break;
-
-    case ext_8f08:
-        d = DstReg | SrcMem;
-        if ( ext8f08_table[b].two_op )
-            d |= TwoOp;
-        else if ( ext8f08_table[b].four_op && !mode_64bit() )
-            imm1 &= 0x7f;
-        state->desc = d;
-        state->simd_size = ext8f08_table[b].simd_size;
-        break;
-
-    case ext_8f09:
-    case ext_8f0a:
-        break;
-
-    default:
-        ASSERT_UNREACHABLE();
-        return X86EMUL_UNIMPLEMENTED;
-    }
-
-    if ( ea.type == OP_MEM )
-    {
-        if ( pc_rel )
-            ea.mem.off += state->ip;
-
-        ea.mem.off = truncate_ea(ea.mem.off);
-    }
-
-    /*
-     * Simple op_bytes calculations. More complicated cases produce 0
-     * and are further handled during execute.
-     */
-    switch ( state->simd_size )
-    {
-    case simd_none:
-        /*
-         * When prefix 66 has a meaning different from operand-size override,
-         * operand size defaults to 4 and can't be overridden to 2.
-         */
-        if ( op_bytes == 2 &&
-             (ctxt->opcode & X86EMUL_OPC_PFX_MASK) == X86EMUL_OPC_66(0, 0) )
-            op_bytes = 4;
-        break;
-
-#ifndef X86EMUL_NO_SIMD
-    case simd_packed_int:
-        switch ( vex.pfx )
-        {
-        case vex_none:
-            if ( !vex.opcx )
-            {
-                op_bytes = 8;
-                break;
-            }
-            /* fall through */
-        case vex_66:
-            op_bytes = 16 << evex.lr;
-            break;
-        default:
-            op_bytes = 0;
-            break;
-        }
-        break;
-
-    case simd_single_fp:
-        if ( vex.pfx & VEX_PREFIX_DOUBLE_MASK )
-        {
-            op_bytes = 0;
-            break;
-    case simd_packed_fp:
-            if ( vex.pfx & VEX_PREFIX_SCALAR_MASK )
-            {
-                op_bytes = 0;
-                break;
-            }
-        }
-        /* fall through */
-    case simd_any_fp:
-        switch ( vex.pfx )
-        {
-        default:
-            op_bytes = 16 << evex.lr;
-            break;
-        case vex_f3:
-            generate_exception_if(evex_encoded() && evex.w, EXC_UD);
-            op_bytes = 4;
-            break;
-        case vex_f2:
-            generate_exception_if(evex_encoded() && !evex.w, EXC_UD);
-            op_bytes = 8;
-            break;
-        }
-        break;
-
-    case simd_scalar_opc:
-        op_bytes = 4 << (ctxt->opcode & 1);
-        break;
-
-    case simd_scalar_vexw:
-        op_bytes = 4 << vex.w;
-        break;
-
-    case simd_128:
-        /* The special cases here are MMX shift insns. */
-        op_bytes = vex.opcx || vex.pfx ? 16 : 8;
-        break;
-
-    case simd_256:
-        op_bytes = 32;
-        break;
-#endif /* !X86EMUL_NO_SIMD */
-
-    default:
-        op_bytes = 0;
-        break;
-    }
-
- done:
-    return rc;
-}
-
-/* No insn fetching past this point. */
-#undef insn_fetch_bytes
-#undef insn_fetch_type
-
 /* Undo DEBUG wrapper. */
 #undef x86_emulate
 
@@ -3000,7 +1281,7 @@ x86_emulate(
                            (_regs.eflags & X86_EFLAGS_VIP)),
                           EXC_GP, 0);
 
-    rc = x86_decode(&state, ctxt, ops);
+    rc = x86emul_decode(&state, ctxt, ops);
     if ( rc != X86EMUL_OKAY )
         return rc;
 
@@ -10520,45 +8801,6 @@ int x86_emulate_wrapper(
 }
 #endif
 
-struct x86_emulate_state *
-x86_decode_insn(
-    struct x86_emulate_ctxt *ctxt,
-    int (*insn_fetch)(
-        unsigned long offset, void *p_data, unsigned int bytes,
-        struct x86_emulate_ctxt *ctxt))
-{
-    static DEFINE_PER_CPU(struct x86_emulate_state, state);
-    struct x86_emulate_state *state = &this_cpu(state);
-    const struct x86_emulate_ops ops = {
-        .insn_fetch = insn_fetch,
-        .read       = x86emul_unhandleable_rw,
-    };
-    int rc;
-
-    init_context(ctxt);
-
-    rc = x86_decode(state, ctxt, &ops);
-    if ( unlikely(rc != X86EMUL_OKAY) )
-        return ERR_PTR(-rc);
-
-#if defined(__XEN__) && !defined(NDEBUG)
-    /*
-     * While we avoid memory allocation (by use of per-CPU data) above,
-     * nevertheless make sure callers properly release the state structure
-     * for forward compatibility.
-     */
-    if ( state->caller )
-    {
-        printk(XENLOG_ERR "Unreleased emulation state acquired by %ps\n",
-               state->caller);
-        dump_execution_state();
-    }
-    state->caller = __builtin_return_address(0);
-#endif
-
-    return state;
-}
-
 static inline void check_state(const struct x86_emulate_state *state)
 {
 #if defined(__XEN__) && !defined(NDEBUG)


