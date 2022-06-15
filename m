Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7616054C60F
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jun 2022 12:28:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.349918.576122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1QG5-00048c-VW; Wed, 15 Jun 2022 10:28:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 349918.576122; Wed, 15 Jun 2022 10:28:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1QG5-00044f-Rk; Wed, 15 Jun 2022 10:28:21 +0000
Received: by outflank-mailman (input) for mailman id 349918;
 Wed, 15 Jun 2022 10:28:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=56zs=WW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o1QG4-0002mz-DP
 for xen-devel@lists.xenproject.org; Wed, 15 Jun 2022 10:28:20 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7d00::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df9db296-ec95-11ec-bd2c-47488cf2e6aa;
 Wed, 15 Jun 2022 12:28:19 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB7PR04MB5113.eurprd04.prod.outlook.com (2603:10a6:10:14::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.22; Wed, 15 Jun
 2022 10:28:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.020; Wed, 15 Jun 2022
 10:28:17 +0000
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
X-Inumbo-ID: df9db296-ec95-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=knfsbiqT+Bu2ST7HeueaXPvfrV0oD9Vaf047LgFbpqYptcQBDIizftlID7OxlbjVPlUBkv9/Tb6bVFnOwsFlm0ham8cCfzye4SuRQeGmK2SNME0P/KLXRqv/RixpnH7kZmi3ZKcSCtALpD2n6UF2Lscnj45Nk7Z9Sts+CJzdCNfk1nLPqYMXVsKP4ySpU1cdfIKZhJV+YQKDfhp30RjhcIKJC0tLJpvXpFDZnoSRSlpHWBAA0N5Lm312A/sSfBfjefQPgPlv61iBD08y1wiIJhh7P5miMmR0FVYQHwrRHWsedNnKlQbBsKnXG7qsK0cnsSpADtuPTypmfu3ZLOzIPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JQIzAAXSLVSWkhcS1qf3HBv4Fi2PTXseHqP5u9rJaSQ=;
 b=Z0GAZ5yr2aT9WyPv9dnqlVS19pSLK2x/mLLW1GhWZxtPeOj7taVhdlwwWmRChCnxEJM1Z5moMnNTkntWzeKi0LcoyEk48P+uo3+AkYuVzsZyNuCjVqhbhxTM7AYLJrpxmZEfY4ALKGH9Ur9J6f4QRWhVCyzdRN27GtLRwm2DobTidxvUPuWPAwxRmG5BU8i0qxF+EuVabkaPZL+/8j1g6BRz1nq84baztK4zVOvd7B8JMTMNaqgIVOfWgC29d2cVXhvn6iNkW4RW5Viy2Og56dfOA99jFd2gajooTK4Q96PqxV4TXfONbRbPw/78ykViSnHl7pxxBqTg5cX65W4yhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JQIzAAXSLVSWkhcS1qf3HBv4Fi2PTXseHqP5u9rJaSQ=;
 b=04tVpoI+dOu5NPsFIwLqjOhIH7Cdt3LN4MS0YtHruAKK2df1jw2WQWTzFWwwrns4fH5BV4y9UOzWTzG+33B0p7uD4rgwQI4eQVpskVMzwmU1myt979ltGage9HBZfYUQdfID2IGsO430x7rO1hkIMpi3eB1CkhxZ+NXIxZiaywrHBgM8Q+kFqkDjO47AbCBlhNCAgM9T6kTyCehU251OwJ8OLMfItS6Yop238ktPbl1luHNtyfg33XRNcrDWWAH1dIZv3L4ZwPmjzfNvnowIweY/L+F+sfjtIg1Z9zocs0VSldQJMCnR1U+00MkFgkkvySn4dA5MTFqRKvjbkrusVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6721f404-e2f9-b686-009c-4c465a5a1e3f@suse.com>
Date: Wed, 15 Jun 2022 12:28:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: [PATCH 03/11] x86emul: handle AVX512-FP16 Map5 arithmetic insns
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <9ba3aaa7-56ce-b051-f1c4-874276e493e1@suse.com>
In-Reply-To: <9ba3aaa7-56ce-b051-f1c4-874276e493e1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0038.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:87::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7923a1c0-f008-411a-b801-08da4eb9c2ce
X-MS-TrafficTypeDiagnostic: DB7PR04MB5113:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB5113DC76D6EC564AFDA4CC53B3AD9@DB7PR04MB5113.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	b20EOtTG7crdxcbUSrDwuReDqySHTpMjZyXGYRREMbB+PAc/jaBuv+aTJNU3rLXu3TYbWQRo4F27z2j1VBvQoavNtluCSHi7WNJ9t9BpTwiidpNCKWncfUcMB1BrJe5tZYNWK1Lb5UoWFjnWCTPsMD3NPT6QUecp/+R3w/0OpY7ajdyWNRkWFCkFJ/6zhPnC3KtJ3AyifxqXTDbJ30JxSCH0mb8n5lALsePAwnLfBBYgs/MJ8RZlzI8OxPEPXFwo9hT6Hn6Lu3NeolFrh2zniXbPPIrmbnaJ5gAx5KlolLa4tNihMtSTBrzjE0CslVjAZLPZ93PUVYTOFgKPYS+xx2McuvH87WjKuGn+5PJy3Y71VnZ+STcPGTpStCI6VrpoIZub2U3lebyjFCUn6k/iw7xkiY6TO+1mMaBmqWx0CIaCMiOBUS12SoaMYWaN2zE7p8t/18/Xg9oWgjWFxNrT2VXqAE+e3Y4LehqogEJPDrO/1pH2YNozLKjKahfeWI4LglyYdI0xhY/34EobBflN3lrfBo6aTrhiLaYuaBO3Lk3eeCnPn0E0+VZpfYBd7SnEJ4PpXMR8UlzEHGPuneU0STfv1UgT+RmQLx0gv1Q7gR8ji1bwBNPDU6yWWb3n8aF7uXxaaQVr+B1dpPf80NIooYH2ckY0QD2qk1kf5o8gMNGCXwwRrpNKXD7CP0Aj4Aa306PxyrSWnwjZxCtUZA2vHPNSlrbLFltAoXWbXXHCRTD/phYFGkjCGO0IEUOyLKsr
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(316002)(36756003)(508600001)(38100700002)(6512007)(6916009)(8676002)(31686004)(4326008)(6486002)(26005)(2616005)(66946007)(66556008)(66476007)(2906002)(31696002)(5660300002)(186003)(86362001)(6506007)(54906003)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2lJU3RwTzlFblBreGVMRkdDR0JzNkpIYjlMcGFOalFoTGg4cFpuUSt0MUZO?=
 =?utf-8?B?cmJDeXlQdjJvbHJYUDZ1T3JoZHhaYmJ1by84aVpnSXJkaVpsRzFvcUxxaG5E?=
 =?utf-8?B?ck9abEE4YmpCVHdyTVQwNURFNzJxVEZpdlY3djFoU2FpRXBzdHJYWkJDMXp6?=
 =?utf-8?B?TEJISHBMQit2QUFUMjBJWWFoYitQOUEvWFIxb21ldzY1OUljbThsbHUzTlh2?=
 =?utf-8?B?MG9WTW1FbVdkUTdCVHNDN3ppSjFST1BZQktaT2l5Ry9SU1NpZFZuZGxOMXdD?=
 =?utf-8?B?QTVKRHN2aEtNRExqQ2VlVlZJdnAxNkNnaXJQaG5STmtPb3k4dFhsUFN5NnNr?=
 =?utf-8?B?WWRwYVZJL1d3a3JCaHI5dnZVY0wvMWF2VlNtNXp0RHdLR0xwS2hVSkV0UTVt?=
 =?utf-8?B?YjlPdDJWSDFadlJIL1lDQ2hCYWF0ZmNUUmxMM3hlKzFpaG0rRWNIaGU2RG1E?=
 =?utf-8?B?dXE3Z1RiSmdnaHZDM2RVblRYajlUV3Fub05NaVdEdWdMcHc3bzhQeTdFSnZ3?=
 =?utf-8?B?Sk5HUHJuQ1lzdDdHcGJ5SGNsazh0WXFMYVgwMmlkZDVLQ2xNY3p4YnJOamxB?=
 =?utf-8?B?YjY5MGlhN3UwRDdNSGlNbml0MU1oaXRnaWp2QXg1TmhsaFFndWxVZWIvK0Nt?=
 =?utf-8?B?bHhNOGU5dGQrRkd4Mk1PcytyOWRqamMrL3hSWi9aTjBYTlhYWHVlNlQ1MHNE?=
 =?utf-8?B?SFNzZlVaY1c4WGsrNllYK0l6Sm1ZcnFqcG5zUzZDYkt4U1VpcW5ETGhFZ3Vk?=
 =?utf-8?B?VXprTTJsNi9aLytjTWlWQjlLNlJRaGhDZFRKOTdSMWRGb2hwN01MMkFCL3hG?=
 =?utf-8?B?V1RkanVNakNRTkJVMnZIZ3JFVVM2UzdhL09nc2s2Z3JBV1lCR05NVlY5ZXNL?=
 =?utf-8?B?cW8vZDk5dDVqQnpqWTlVRHUvcXZHQnh3Qmt4ZUw1NnJwd3lXSXMydWZXNDJi?=
 =?utf-8?B?YUJXeDdBZkFTbnRZNXUxd0M2WmNaazVIemRwaCswWE5IOUhLbWZwa1QxR3Bm?=
 =?utf-8?B?QXJPSFJreHhnQUxFUFB2SDhuSHpXZWZ4QjZlOGtGV1lod0tza3ZhTEIxazdl?=
 =?utf-8?B?Y1dGd2dlTEZDMExmbG1udjBwYU9CcTNFeFpxamt0T0JzUnd2VTRtTTJVRWc2?=
 =?utf-8?B?ckJvMTgxRmFkbk1UNFNJQmZ3M1g1RTdOQ09udWFlZFJkQ1V1cnVLcWZOeVZm?=
 =?utf-8?B?NlpDcVJUcmtjTjcxSnZDOHptNzByazVEV3dkdmRBNy9TeUhJZkJhY2ZMYkRz?=
 =?utf-8?B?YTNTbEEra21Nb1MzV2JST1ZhSHlHd0dwZUVFajdpZW1JQ0g4VDR3R0VNWkIr?=
 =?utf-8?B?d3RPV3IzeDZySU1KY3I3Q0Jrbk9vQXYrSzVlcjFHSVpmMGd5QzY0Z2J3TkZG?=
 =?utf-8?B?NC9TUVc5M1VlVGU4NVhhcEdYd1MvM000TGZvMFdySlM1QkZ5MGVTamJSYTlL?=
 =?utf-8?B?L3RxYTFmQlRNYm4wUWhITFRMZmlwN0dHZmNDK09pZUFhaS92YkdsVnNmdVZl?=
 =?utf-8?B?Rk4wZE1HdkozL2dBdER5ZllMWjF3LzhQbzUxbVE0M3N2bnphZGVVcnRkN2Yv?=
 =?utf-8?B?eVhScXM0MUpldEsxRFhmaGlkMklGbkRqLzFLdkVHV2VlYlVNc0FCdjI2OTNM?=
 =?utf-8?B?blJmUStqWVBjcFBwdElYSnBVVG5wRXU5dWpYRlg1TlhWeHN3YUlTNlJmMUdN?=
 =?utf-8?B?TEprY1NqbjQ0UDZjOXAweXlhMWtUQjZ2MENsK3dqb1lmeVZtVGdSMWkwUk8v?=
 =?utf-8?B?T3NLQ0JYclFrMWpWbzJrbms5SDBjUG5hWUlYNDZjRHNaa0dKd2djbW0wTjBp?=
 =?utf-8?B?ZWl6RXVaei9pTytmc3I2Y09jUWdaVFZZQ0VrUXJZTnpFRjkySldrZHB3cW51?=
 =?utf-8?B?QkNScGlIajNIUG9qYktxK1lvSEcrKzNSVHgvTkpqYmxpZDFleGVQTitWVE1m?=
 =?utf-8?B?ZGU3Rkxha3FOU2FEYUw4enJxZFNNKzlaRzlhRGdIV3pJSzNsNmlGTUk3WkRv?=
 =?utf-8?B?MVUycGZIclNWOUg5ME1XYXFLdGthY3VLNCthQTRIM2FBZEROZG1sZ1BEL2px?=
 =?utf-8?B?aHk5NjhSZFdXcTdmZ3k5NzliaWsrSm9RcE1xTk9tcmNaMmxpbStSc2drRGxI?=
 =?utf-8?B?TnlGWDBjTU9pZjRSUlhtQmRQcEFXL1ZwcWx2dmZ1dENRdXBib0syYVNNQjI4?=
 =?utf-8?B?a0NybURRa1NybHoydDd4WnVBVEFOYkZiaWIrSUJXeTBKR1VhY09UaVJBMlov?=
 =?utf-8?B?WlAvMXhzUFlLMEp0dlZYYjJFaWpENnpON3NkN3Y5djFPdnJBbFJwVDAyaG9n?=
 =?utf-8?B?NkN0NmhBN0ZLR1ZUUTFaUS84dTdsaVVxZ1VLRFQvQmx2b3ZYUjdNZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7923a1c0-f008-411a-b801-08da4eb9c2ce
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 10:28:17.2308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iRVv80wt9FUnn9Z/cajvPbDVi+62fx+oIC063qL019WbUgTdMSmzAn0kA0bbG0M/ubFEY+t2QQFuv9Y6reW0yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5113

This encoding space is a very sparse clone of the "twobyte" one. Re-use
that table, as the entries corresponding to invalid opcodes in Map5 are
simply benign with simd_size forced to other than simd_none (preventing
undue memory reads in SrcMem handling early in x86_emulate()).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -6,7 +6,7 @@
 struct test {
     const char *mnemonic;
     unsigned int opc:8;
-    unsigned int spc:2;
+    unsigned int spc:3;
     unsigned int pfx:2;
     unsigned int vsz:3;
     unsigned int esz:4;
@@ -19,6 +19,10 @@ enum spc {
     SPC_0f,
     SPC_0f38,
     SPC_0f3a,
+    SPC_unused4,
+    SPC_map5,
+    SPC_map6,
+    SPC_unused7,
 };
 
 enum pfx {
@@ -603,16 +607,32 @@ static const struct test avx512_vpopcntd
 };
 
 static const struct test avx512_fp16_all[] = {
+    INSN(addph,           , map5, 58,    vl, fp16, vl),
+    INSN(addsh,         f3, map5, 58,    el, fp16, el),
     INSN(cmpph,           , 0f3a, c2,    vl, fp16, vl),
     INSN(cmpsh,         f3, 0f3a, c2,    el, fp16, el),
+    INSN(comish,          , map5, 2f,    el, fp16, el),
+    INSN(divph,           , map5, 5e,    vl, fp16, vl),
+    INSN(divsh,         f3, map5, 5e,    el, fp16, el),
     INSN(fpclassph,       , 0f3a, 66,    vl, fp16, vl),
     INSN(fpclasssh,       , 0f3a, 67,    el, fp16, el),
     INSN(getmantph,       , 0f3a, 26,    vl, fp16, vl),
     INSN(getmantsh,       , 0f3a, 27,    el, fp16, el),
+    INSN(maxph,           , map5, 5f,    vl, fp16, vl),
+    INSN(maxsh,         f3, map5, 5f,    el, fp16, el),
+    INSN(minph,           , map5, 5d,    vl, fp16, vl),
+    INSN(minsh,         f3, map5, 5d,    el, fp16, el),
+    INSN(mulph,           , map5, 59,    vl, fp16, vl),
+    INSN(mulsh,         f3, map5, 59,    el, fp16, el),
     INSN(reduceph,        , 0f3a, 56,    vl, fp16, vl),
     INSN(reducesh,        , 0f3a, 57,    el, fp16, el),
     INSN(rndscaleph,      , 0f3a, 08,    vl, fp16, vl),
     INSN(rndscalesh,      , 0f3a, 0a,    el, fp16, el),
+    INSN(sqrtph,          , map5, 51,    vl, fp16, vl),
+    INSN(sqrtsh,        f3, map5, 51,    el, fp16, el),
+    INSN(subph,           , map5, 5c,    vl, fp16, vl),
+    INSN(subsh,         f3, map5, 5c,    el, fp16, el),
+    INSN(ucomish,         , map5, 2e,    el, fp16, el),
 };
 
 static const struct test gfni_all[] = {
@@ -713,8 +733,8 @@ static void test_one(const struct test *
     union evex {
         uint8_t raw[3];
         struct {
-            uint8_t opcx:2;
-            uint8_t mbz:2;
+            uint8_t opcx:3;
+            uint8_t mbz:1;
             uint8_t R:1;
             uint8_t b:1;
             uint8_t x:1;
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -2028,6 +2028,23 @@ static const struct evex {
     { { 0xc2 }, 3, T, R, pfx_f3, W0, LIG }, /* vcmpsh */
     { { 0xce }, 3, T, R, pfx_66, W1, Ln }, /* vgf2p8affineqb */
     { { 0xcf }, 3, T, R, pfx_66, W1, Ln }, /* vgf2p8affineinvqb */
+}, evex_map5[] = {
+    { { 0x2e }, 2, T, R, pfx_no, W0, LIG }, /* vucomish */
+    { { 0x2f }, 2, T, R, pfx_no, W0, LIG }, /* vcomish */
+    { { 0x51 }, 2, T, R, pfx_no, W0, Ln }, /* vsqrtph */
+    { { 0x51 }, 2, T, R, pfx_f3, W0, LIG }, /* vsqrtsh */
+    { { 0x58 }, 2, T, R, pfx_no, W0, Ln }, /* vaddph */
+    { { 0x58 }, 2, T, R, pfx_f3, W0, LIG }, /* vaddsh */
+    { { 0x59 }, 2, T, R, pfx_no, W0, Ln }, /* vmulph */
+    { { 0x59 }, 2, T, R, pfx_f3, W0, LIG }, /* vmulsh */
+    { { 0x5c }, 2, T, R, pfx_no, W0, Ln }, /* vsubph */
+    { { 0x5c }, 2, T, R, pfx_f3, W0, LIG }, /* vsubsh */
+    { { 0x5d }, 2, T, R, pfx_no, W0, Ln }, /* vminph */
+    { { 0x5d }, 2, T, R, pfx_f3, W0, LIG }, /* vminsh */
+    { { 0x5e }, 2, T, R, pfx_no, W0, Ln }, /* vdivph */
+    { { 0x5e }, 2, T, R, pfx_f3, W0, LIG }, /* vdivsh */
+    { { 0x5f }, 2, T, R, pfx_no, W0, Ln }, /* vmaxph */
+    { { 0x5f }, 2, T, R, pfx_f3, W0, LIG }, /* vmaxsh */
 };
 
 static const struct {
@@ -2037,6 +2054,8 @@ static const struct {
     { evex_0f,   ARRAY_SIZE(evex_0f) },
     { evex_0f38, ARRAY_SIZE(evex_0f38) },
     { evex_0f3a, ARRAY_SIZE(evex_0f3a) },
+    { NULL,      0 },
+    { evex_map5, ARRAY_SIZE(evex_map5) },
 };
 
 #undef Wn
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -1219,9 +1219,18 @@ int x86emul_decode(struct x86_emulate_st
                         opcode |= MASK_INSR(0x0f3a, X86EMUL_OPC_EXT_MASK);
                         d = twobyte_table[0x3a].desc;
                         break;
+
+                    case evex_map5:
+                        if ( !evex_encoded() )
+                        {
                     default:
-                        rc = X86EMUL_UNRECOGNIZED;
-                        goto done;
+                            rc = X86EMUL_UNRECOGNIZED;
+                            goto done;
+                        }
+                        opcode |= MASK_INSR(5, X86EMUL_OPC_EXT_MASK);
+                        d = twobyte_table[b].desc;
+                        s->simd_size = twobyte_table[b].size ?: simd_other;
+                        break;
                     }
                 }
                 else if ( s->ext < ext_8f08 + ARRAY_SIZE(xop_table) )
@@ -1443,6 +1452,24 @@ int x86emul_decode(struct x86_emulate_st
             }
             break;
 
+        case ext_map5:
+            switch ( b )
+            {
+            default:
+                if ( !(s->evex.pfx & VEX_PREFIX_DOUBLE_MASK) )
+                    s->fp16 = true;
+                break;
+
+            case 0x2e: case 0x2f: /* v{,u}comish */
+                if ( !s->evex.pfx )
+                    s->fp16 = true;
+                s->simd_size = simd_none;
+                break;
+            }
+
+            disp8scale = decode_disp8scale(twobyte_table[b].d8s, s);
+            break;
+
         case ext_8f09:
             if ( ext8f09_table[b].two_op )
                 d |= TwoOp;
@@ -1661,6 +1688,7 @@ int x86emul_decode(struct x86_emulate_st
         s->simd_size = ext8f08_table[b].simd_size;
         break;
 
+    case ext_map5:
     case ext_8f09:
     case ext_8f0a:
         break;
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -194,6 +194,7 @@ enum vex_opcx {
     vex_0f = vex_none + 1,
     vex_0f38,
     vex_0f3a,
+    evex_map5 = 5,
 };
 
 enum vex_pfx {
@@ -222,8 +223,8 @@ union vex {
 union evex {
     uint8_t raw[3];
     struct {             /* SDM names */
-        uint8_t opcx:2;  /* mm */
-        uint8_t mbz:2;
+        uint8_t opcx:3;  /* mmm */
+        uint8_t mbz:1;
         uint8_t R:1;     /* R' */
         uint8_t b:1;     /* B */
         uint8_t x:1;     /* X */
@@ -248,6 +249,7 @@ struct x86_emulate_state {
         ext_0f   = vex_0f,
         ext_0f38 = vex_0f38,
         ext_0f3a = vex_0f3a,
+        ext_map5 = evex_map5,
         /*
          * For XOP use values such that the respective instruction field
          * can be used without adjustment.
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -3760,6 +3760,13 @@ x86_emulate(
         ASSERT(!state->simd_size);
         break;
 
+#ifndef X86EMUL_NO_SIMD
+
+    case X86EMUL_OPC_EVEX(5, 0x2e): /* vucomish xmm/m16,xmm */
+    case X86EMUL_OPC_EVEX(5, 0x2f): /* vcomish xmm/m16,xmm */
+        host_and_vcpu_must_have(avx512_fp16);
+        generate_exception_if(evex.w, EXC_UD);
+        /* fall through */
     CASE_SIMD_PACKED_FP(_EVEX, 0x0f, 0x2e): /* vucomis{s,d} xmm/mem,xmm */
     CASE_SIMD_PACKED_FP(_EVEX, 0x0f, 0x2f): /* vcomis{s,d} xmm/mem,xmm */
         generate_exception_if((evex.reg != 0xf || !evex.RX || evex.opmsk ||
@@ -3772,9 +3779,11 @@ x86_emulate(
         get_fpu(X86EMUL_FPU_zmm);
 
         opc = init_evex(stub);
-        op_bytes = 4 << evex.w;
+        op_bytes = 2 << (!state->fp16 + evex.w);
         goto vcomi;
 
+#endif
+
     case X86EMUL_OPC(0x0f, 0x30): /* wrmsr */
         generate_exception_if(!mode_ring0(), EXC_GP, 0);
         fail_if(ops->write_msr == NULL);
@@ -7738,6 +7747,20 @@ x86_emulate(
 
 #ifndef X86EMUL_NO_SIMD
 
+    case X86EMUL_OPC_EVEX_F3(5, 0x51):   /* vsqrtsh xmm/m16,xmm,xmm{k} */
+        d &= ~TwoOp;
+        /* fall through */
+    case X86EMUL_OPC_EVEX(5, 0x51):      /* vsqrtph [xyz]mm/mem,[xyz]mm{k} */
+    CASE_SIMD_SINGLE_FP(_EVEX, 5, 0x58): /* vadd{p,s}h [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    CASE_SIMD_SINGLE_FP(_EVEX, 5, 0x59): /* vmul{p,s}h [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    CASE_SIMD_SINGLE_FP(_EVEX, 5, 0x5c): /* vsub{p,s}h [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    CASE_SIMD_SINGLE_FP(_EVEX, 5, 0x5d): /* vmin{p,s}h [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    CASE_SIMD_SINGLE_FP(_EVEX, 5, 0x5e): /* vdiv{p,s}h [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    CASE_SIMD_SINGLE_FP(_EVEX, 5, 0x5f): /* vmax{p,s}h [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+        host_and_vcpu_must_have(avx512_fp16);
+        generate_exception_if(evex.w, EXC_UD);
+        goto avx512f_all_fp;
+
     case X86EMUL_OPC_XOP(08, 0x85): /* vpmacssww xmm,xmm/m128,xmm,xmm */
     case X86EMUL_OPC_XOP(08, 0x86): /* vpmacsswd xmm,xmm/m128,xmm,xmm */
     case X86EMUL_OPC_XOP(08, 0x87): /* vpmacssdql xmm,xmm/m128,xmm,xmm */
--- a/xen/arch/x86/x86_emulate/x86_emulate.h
+++ b/xen/arch/x86/x86_emulate/x86_emulate.h
@@ -619,6 +619,7 @@ struct x86_emulate_ctxt
  *    0x0fxxxx for 0f-prefixed opcodes (or their VEX/EVEX equivalents)
  *  0x0f38xxxx for 0f38-prefixed opcodes (or their VEX/EVEX equivalents)
  *  0x0f3axxxx for 0f3a-prefixed opcodes (or their VEX/EVEX equivalents)
+ *     0x5xxxx for Map5 opcodes (EVEX only)
  *  0x8f08xxxx for 8f/8-prefixed XOP opcodes
  *  0x8f09xxxx for 8f/9-prefixed XOP opcodes
  *  0x8f0axxxx for 8f/a-prefixed XOP opcodes


