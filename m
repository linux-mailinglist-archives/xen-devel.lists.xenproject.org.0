Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C166D4B31
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 16:57:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517481.802853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjLcP-00069U-0u; Mon, 03 Apr 2023 14:57:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517481.802853; Mon, 03 Apr 2023 14:57:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjLcO-00066g-SE; Mon, 03 Apr 2023 14:57:12 +0000
Received: by outflank-mailman (input) for mailman id 517481;
 Mon, 03 Apr 2023 14:57:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dypz=72=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pjLcM-00066R-HX
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 14:57:10 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20607.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cea60352-d22f-11ed-85db-49a42c6b2330;
 Mon, 03 Apr 2023 16:57:09 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8760.eurprd04.prod.outlook.com (2603:10a6:10:2e3::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 14:57:06 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.033; Mon, 3 Apr 2023
 14:57:06 +0000
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
X-Inumbo-ID: cea60352-d22f-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=acCpsPXMXDMlfJg+cL1cmT0lBWOGMvb0w6OND+xqasBt6i3ccE5k5hoFWdaDYgubxzEUjC6htBqA0VrC0BKbAwXj8qQO2Mem2RSueRbovXVGshtRa+PCcbRTQikw+ive3cjWXwT4ZsYJXRWnrFFpUdCT2W1jtlZ6gkucsObn8ajfn2tYGtLZekQeFsuUixRicjiC83nFY3Lt3YcuuGyHVBQrCbNMmCZyCdH7Huqc148L/3QkkFvcqxZRhVu2s6SYhOxi+OaojF6208TtD55Pyon7nVBDpQ3Ms198ZamRAEgp2k8+/ixQIWmzO0zrYCdMhQQSkuGzofFKGd28EXnMlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FCrSDs0f16ekqy4Eik8NqBW3LlGngJ7nD0dM0P0nsr8=;
 b=LghBN9P3jwxWVOMeSwJ43Kb5OL1TweMekV/42QexP0f6FAbrIO2GgsEjwTqLinPWtmuOVKR6F36XlcIWsP/Td36Id92iO72bz2m5FAh/I5wNm3PHCMt7fdw6g076upvL0t7iFtarPrDPh2ap13H4j2f2bYey3AGDTyByIQl06X78qhRSFg/0zwGQ956n10KWTcJ31tEOAk/F+HmzYx8L0X5T+g6QK64xJL4g8fbqL8mY2vnkU1xahqZs4OzQKBGuOrQCViqvM2pSrCHvwQJNPcSHq48bSTQ8JR9XM0daDwagi/hRe6FP+JhKY1IVCodzuhri+wg79aFScQCLtnMhAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FCrSDs0f16ekqy4Eik8NqBW3LlGngJ7nD0dM0P0nsr8=;
 b=ihTbTw4ZFCEFdExKJRV/bfiTEuRtUrMpXtcJfFUlF8yCM7qIur9ff6Pnekrm5r83cuRDsQl7NzwSDBvuLxjvxIX9LCBr20elx8GjPIOg04aSCiicHwhkCA0hQEm56DKx+WCE6mP4qIvBoVfE/XS5sb7FLH3CEwqRkDb9Zp0gC8T3WP7XU1dHg0m0lGocC98sokQ/6GSaK6ETzhAcTzA+GyYk8xcIdwrlfGPpx7vwsvofQCAHPJn2AZU1u/7boyUYMcbSzjXwa2tiOmvkYz/LLSCKpTEFRbQa2NeFztkxSpxZFM2qU8AF8hJtCggJcMlb7NmXL+Ec3o2FnFQ7YPf57g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6ce78724-a826-f53d-4ff2-701cc279289a@suse.com>
Date: Mon, 3 Apr 2023 16:57:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: [PATCH v2 01/10] x86emul: handle AVX512-FP16 insns encoded in 0f3a
 opcode map
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <8cbbab55-d670-5632-30ee-3e8ca352f048@suse.com>
In-Reply-To: <8cbbab55-d670-5632-30ee-3e8ca352f048@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0120.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8760:EE_
X-MS-Office365-Filtering-Correlation-Id: 1398e316-7ab8-459b-e2ad-08db3453b0f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gJH7sTdD+B931sUMQkYGMHQsEDVsbeEpddamUdu+F+M6nvK6PnhD8fcr8WISj97w7tqHKDzoGixjYoCKxWW5lvW+Z+3ZEOIwP5okgSVmp6zEHe7Av6buw4W1M0ozOd3rW7GXRT5LhD9eAqiscbOK6gg2OMqWHiYKKxoWoYSd+7XSuKV4TiSbe9Cb+Pd7/uixcbFNk7lN38DkJcKfDdpG0KQq6Hp7K5pQBOccFTRl8ZhWgGDNMFv0YrSzRXyEURIuxCMCwF5SjYF7Lv/QNdTXjc8/Cbvf61P8fHe/mKQOmHha5/lmtmf5m0cSdNBmYJleWcjEG5Lx/AJ1pExzkImbWv/ADsDkDXM3zmRk78sO0fg5XF7xlBUlEy0fDGgh53LmiS3hl2PjSsUv1wGI8sE3dA9C67exTB2KWDMMj/OmczR2i1on2O628pKUZn1BeuyyrhCjFDAG4ITfJRUJr8yvFbGy3TSwM7Xtw4PEk3+kzTNVmZt8C563ZJIuSaFhQpHuyGiyIOh3IGgTBXNNDMUpA88IkmyBN9Z63OwK45DVaXijO6mja6lPyJyBFUBD0326kP7ZMJ92KyAypJufisLbMHen/v+Wzs6cnboUo3QGqHfLILMLYtyHwzggt7X+0v/SLpgc2B9nWaAoT8nbQ6Qm3Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(136003)(346002)(39860400002)(376002)(451199021)(6916009)(8676002)(66476007)(4326008)(66556008)(66946007)(478600001)(316002)(54906003)(8936002)(30864003)(41300700001)(38100700002)(5660300002)(186003)(83380400001)(2616005)(6486002)(26005)(6506007)(6512007)(86362001)(31696002)(36756003)(2906002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXhpS2M0SUpZVVZvRkhLS1pqM0VDa0dINEVyZ1IwOXJJRmZlb3B2M28zQ25G?=
 =?utf-8?B?M3MvbDllK3FPQUUxZ3JxRjVrT2diMkpDYlJ2NzJzcklKRG9zdHRJSlVMWEZt?=
 =?utf-8?B?S0kwZlZwSi9xOUUrNllNYWNFNlBjNVBNUmVMQUNoeG9XRUZHTEUrVkxWMU81?=
 =?utf-8?B?b0ZRbEFZdFpJZXd0bE1JeS96ZVROYzdEYWJzY2NSRXVFY0pkTjFLRU52WUdv?=
 =?utf-8?B?VjdqUmlOcll4MExTSEErYXZaSS9CVjQzSXFnV0MyUUNTZjkreHRHV05sSnFq?=
 =?utf-8?B?S2s2ZnFPbHdxUUhGM3dEUkRiOXpQZ1ZEU0FFYzZDY2Fnb1lNcFVpNW1ueWxZ?=
 =?utf-8?B?L3k4WXlPODdxdFh0ckR1b2o0Y0g3Nk5JbGxDdEVPay9sMkVjVStFQURFSHlO?=
 =?utf-8?B?MkFZTysyTWtRbExLaGZiMEczQWtHeEZGUng2b3BsSmZMeU83WTlBVGtvMWt1?=
 =?utf-8?B?a0gxTWpTWnZMZlNFZG9ZTWJiM3pJbEFLRStiWTV2cm9nWUZmUXN5eVp0OUZ2?=
 =?utf-8?B?UFozWUFjbkprOXdBTE9odDhuTnZSQ2EzamJNMUdaTFFSUE1HZUFNVkJWU2Fi?=
 =?utf-8?B?YUl1TEVscEh5MFZGeVNkVGlZaE0yZU9nVFgyK2NFVUV0OE1VY1pRMG5rL2NJ?=
 =?utf-8?B?VnVHSS9NbGRydEhTQ1lnMC9TeG9PeHJQWHNRVjlBQThYV1dKVmNaZXl2SThv?=
 =?utf-8?B?L1ZKeFp4Y2hZUlg2UXZWL2VQbnh5TTFqb1VsSnh3dG91U3VUczdKU1ovWXBY?=
 =?utf-8?B?SkMwam9xZ1dYSWlrTVhGZmJMeHQzcWNvM3Z6aVNaQ0VEK0l0QzdCMjdlTDRi?=
 =?utf-8?B?OFVsSDczMEVzUzdZZVFnTzBRYVlFVzdYSnpLclBYMGxXNkhiVnRLMHFMWWNl?=
 =?utf-8?B?WmhSK0phTlAwZ3N2SGxiWHo2T0VlSmU3SnF5dnJ3U2xtaml5aEpBNjNzL0l4?=
 =?utf-8?B?aXJXRmpUM0EwVG0wYUJpRTNYVzIyTlc5WlNlZHFyOXJWaThhbXcwb1Q4SU9V?=
 =?utf-8?B?c3EyN3hrb3BvL252SSs0eTdHYXAzUXd3c3EyN1dVL0ExaUVxZ0ZOT1VrK3E3?=
 =?utf-8?B?Q3BiUXdtcWo4dDN1dXVvSUVhWmVKQnk5VUV5OTRPY0pVZjdKTmY2TmJrQXpD?=
 =?utf-8?B?d1pLWmNEdHYyZjJFOWQ0WDVYQXVwdzZReTRxSUFndVFBZHRSNEpEY0FHcU1y?=
 =?utf-8?B?OWtMZjQ4QmxRUDJiSmsrMlg5QjJQVHo1RVdEYTdlbUwzT2dVTTFldVFTTnps?=
 =?utf-8?B?N2JNYmdFNzlXcHpLaEU4elRkMDZFM01CYlNpSXY5TzI3MVVTOTBnQzdhMHV6?=
 =?utf-8?B?U1ZCZlNycHdpdSswM3I4QTZ0Y3R5cGplYytydWNVeGt3MVRidFlVYlJvRS9J?=
 =?utf-8?B?aHNGSXBuSHJ5bHg0bUE2QkQrNUpqRnJ1dkU5aXpQblhHeWw5VVEwaUYwaVRE?=
 =?utf-8?B?aFZwU3A3VjNMNk9EVVNqa3JzYXFpL0RjZTM1RTA2OEZQVjV1eXdRLy9RL3NQ?=
 =?utf-8?B?WVJ3U0YvQU1XTU1KY211QlE1SVlmSFFiR3RFVFhHcmVmNzhscmU2UjFuV1la?=
 =?utf-8?B?dEtMVnZjejh0WEkrbzBvT0tqSDNKdjQ2SzZZaVNlWjArVHl4R2l3QnRVb2cy?=
 =?utf-8?B?a3BPRUZtcldiSXorR2pqYWoremRMeFNmN2EyUkhwb2tUeTU4YUgwZk9GdWdv?=
 =?utf-8?B?T3VTeDJZY3E5VHd2YVBZcC91d2toMzlOVmhuOGgvMVRBWkxrRG1ZeEVISjhp?=
 =?utf-8?B?TG0zeXB6Tmt2NEFCR2FDbGdDM1J1WTZJY0d0UllRTWZMT2hiMXUySWtITG4r?=
 =?utf-8?B?YlpDQ3VSdDc1d2xGTUFHeFFUQUlXN0pad1c0ajdxV1ZERWI2eFpNWnd6TmRm?=
 =?utf-8?B?TnVSWVlWZHRJNUdSd3k0cGtHbkQ3SWd4cnErQlY3c1RSSFNtOTFQK3JhRUsr?=
 =?utf-8?B?dHJLUEhnSEdHbDV5R0R5YW5tZjVQMjlrbU5QNHgrYTM1REhoM0VRZFFyMlJD?=
 =?utf-8?B?RmhGSjVSMG0rUXZpUTFsK1NvbVQ1aFFaN3BzUkw5aXRaRytKN0FlS1ppQXRG?=
 =?utf-8?B?Mnd0U2w0V2MrSE5PLzRNNkhyYit1cVVxek0zdDlCcmN0WFgzWkw0clBUWExY?=
 =?utf-8?Q?G/+/tpkKpWtC+iRDrclxzYaNN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1398e316-7ab8-459b-e2ad-08db3453b0f3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 14:57:06.0431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: faOVin8bABF1uGPHQt/CB5svc+hwVdgJ9qE3Q3n21/t+VwxkmC3XvN5/SOwOKZ4W0K6pA5AaKHx0p0NDCsLHCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8760

In order to re-use (also in subsequent patches) existing code and tables
as much as possible, simply introduce a new boolean field in emulator
state indicating whether an insn is one with a half-precision source.
Everything else then follows "naturally".

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
SDE: -spr or -future

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -76,6 +76,7 @@ enum esz {
     ESZ_b,
     ESZ_w,
     ESZ_bw,
+    ESZ_fp16,
 };
 
 #ifndef __i386__
@@ -601,6 +602,19 @@ static const struct test avx512_vpopcntd
     INSN(popcnt, 66, 0f38, 55, vl, dq, vl)
 };
 
+static const struct test avx512_fp16_all[] = {
+    INSN(cmpph,           , 0f3a, c2,    vl, fp16, vl),
+    INSN(cmpsh,         f3, 0f3a, c2,    el, fp16, el),
+    INSN(fpclassph,       , 0f3a, 66,    vl, fp16, vl),
+    INSN(fpclasssh,       , 0f3a, 67,    el, fp16, el),
+    INSN(getmantph,       , 0f3a, 26,    vl, fp16, vl),
+    INSN(getmantsh,       , 0f3a, 27,    el, fp16, el),
+    INSN(reduceph,        , 0f3a, 56,    vl, fp16, vl),
+    INSN(reducesh,        , 0f3a, 57,    el, fp16, el),
+    INSN(rndscaleph,      , 0f3a, 08,    vl, fp16, vl),
+    INSN(rndscalesh,      , 0f3a, 0a,    el, fp16, el),
+};
+
 static const struct test gfni_all[] = {
     INSN(gf2p8affineinvqb, 66, 0f3a, cf, vl, q, vl),
     INSN(gf2p8affineqb,    66, 0f3a, ce, vl, q, vl),
@@ -728,8 +742,10 @@ static void test_one(const struct test *
         break;
 
     case ESZ_w:
-        esz = 2;
         evex.w = 1;
+        /* fall through */
+    case ESZ_fp16:
+        esz = 2;
         break;
 
 #ifdef __i386__
@@ -845,7 +861,7 @@ static void test_one(const struct test *
     case ESZ_b: case ESZ_w: case ESZ_bw:
         return;
 
-    case ESZ_d: case ESZ_q:
+    case ESZ_d: case ESZ_q: case ESZ_fp16:
         break;
 
     default:
@@ -1002,6 +1018,7 @@ void evex_disp8_test(void *instr, struct
     RUN(avx512_vnni, all);
     RUN(avx512_vp2intersect, all);
     RUN(avx512_vpopcntdq, all);
+    RUN(avx512_fp16, all);
 
     if ( cpu_has_avx512f )
     {
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -1972,8 +1972,10 @@ static const struct evex {
     { { 0x03 }, 3, T, R, pfx_66, Wn, Ln }, /* valign{d,q} */
     { { 0x04 }, 3, T, R, pfx_66, W0, Ln }, /* vpermilps */
     { { 0x05 }, 3, T, R, pfx_66, W1, Ln }, /* vpermilpd */
+    { { 0x08 }, 3, T, R, pfx_no, W0, Ln }, /* vrndscaleph */
     { { 0x08 }, 3, T, R, pfx_66, W0, Ln }, /* vrndscaleps */
     { { 0x09 }, 3, T, R, pfx_66, W1, Ln }, /* vrndscalepd */
+    { { 0x0a }, 3, T, R, pfx_no, W0, LIG }, /* vrndscalesh */
     { { 0x0a }, 3, T, R, pfx_66, W0, LIG }, /* vrndscaless */
     { { 0x0b }, 3, T, R, pfx_66, W1, LIG }, /* vrndscalesd */
     { { 0x0f }, 3, T, R, pfx_66, WIG, Ln }, /* vpalignr */
@@ -1993,7 +1995,9 @@ static const struct evex {
     { { 0x22 }, 3, T, R, pfx_66, Wn, L0 }, /* vpinsr{d,q} */
     { { 0x23 }, 3, T, R, pfx_66, Wn, L1|L2 }, /* vshuff{32x4,64x2} */
     { { 0x25 }, 3, T, R, pfx_66, Wn, Ln }, /* vpternlog{d,q} */
+    { { 0x26 }, 3, T, R, pfx_no, W0, Ln }, /* vgetmantph */
     { { 0x26 }, 3, T, R, pfx_66, Wn, Ln }, /* vgetmantp{s,d} */
+    { { 0x27 }, 3, T, R, pfx_no, W0, LIG }, /* vgetmantsh */
     { { 0x27 }, 3, T, R, pfx_66, Wn, LIG }, /* vgetmants{s,d} */
     { { 0x38 }, 3, T, R, pfx_66, Wn, L1|L2 }, /* vinserti{32x4,64x2} */
     { { 0x39 }, 3, T, W, pfx_66, Wn, L1|L2 }, /* vextracti{32x4,64x2} */
@@ -2008,14 +2012,20 @@ static const struct evex {
     { { 0x51 }, 3, T, R, pfx_66, Wn, LIG }, /* vranges{s,d} */
     { { 0x54 }, 3, T, R, pfx_66, Wn, Ln }, /* vfixupimmp{s,d} */
     { { 0x55 }, 3, T, R, pfx_66, Wn, LIG }, /* vfixumpimms{s,d} */
+    { { 0x56 }, 3, T, R, pfx_no, W0, Ln }, /* vreduceph */
     { { 0x56 }, 3, T, R, pfx_66, Wn, Ln }, /* vreducep{s,d} */
+    { { 0x57 }, 3, T, R, pfx_no, W0, LIG }, /* vreducesh */
     { { 0x57 }, 3, T, R, pfx_66, Wn, LIG }, /* vreduces{s,d} */
+    { { 0x66 }, 3, T, R, pfx_no, W0, Ln }, /* vfpclassph */
     { { 0x66 }, 3, T, R, pfx_66, Wn, Ln }, /* vfpclassp{s,d} */
+    { { 0x67 }, 3, T, R, pfx_no, W0, LIG }, /* vfpclasssh */
     { { 0x67 }, 3, T, R, pfx_66, Wn, LIG }, /* vfpclasss{s,d} */
     { { 0x70 }, 3, T, R, pfx_66, W1, Ln }, /* vshldw */
     { { 0x71 }, 3, T, R, pfx_66, Wn, Ln }, /* vshld{d,q} */
     { { 0x72 }, 3, T, R, pfx_66, W1, Ln }, /* vshrdw */
     { { 0x73 }, 3, T, R, pfx_66, Wn, Ln }, /* vshrd{d,q} */
+    { { 0xc2 }, 3, T, R, pfx_no, W0, Ln }, /* vcmpph */
+    { { 0xc2 }, 3, T, R, pfx_f3, W0, LIG }, /* vcmpsh */
     { { 0xce }, 3, T, R, pfx_66, W1, Ln }, /* vgf2p8affineqb */
     { { 0xcf }, 3, T, R, pfx_66, W1, Ln }, /* vgf2p8affineinvqb */
 };
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -4677,6 +4677,44 @@ int main(int argc, char **argv)
     else
         printf("skipped\n");
 
+    printf("%-40s", "Testing vfpclassphz $0x46,128(%ecx),%k3...");
+    if ( stack_exec && cpu_has_avx512_fp16 )
+    {
+        decl_insn(vfpclassph);
+
+        asm volatile ( put_insn(vfpclassph,
+                                /* 0x46: check for +/- 0 and neg. */
+                                /* vfpclassphz $0x46, 128(%0), %%k3 */
+                                ".byte 0x62, 0xf3, 0x7c, 0x48\n\t"
+                                ".byte 0x66, 0x59, 0x02, 0x46")
+                       :: "c" (NULL) );
+
+        set_insn(vfpclassph);
+        for ( i = 0; i < 3; ++i )
+        {
+            res[16 + i * 5 + 0] = 0x7fff0000; /* +0 / +NaN */
+            res[16 + i * 5 + 1] = 0xffff8000; /* -0 / -NaN */
+            res[16 + i * 5 + 2] = 0x80010001; /* +DEN / -DEN */
+            res[16 + i * 5 + 3] = 0xfc00f800; /* -FIN / -INF */
+            res[16 + i * 5 + 4] = 0x7c007800; /* +FIN / +INF */
+        }
+        res[31] = 0;
+        regs.ecx = (unsigned long)res - 64;
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( rc != X86EMUL_OKAY || !check_eip(vfpclassph) )
+            goto fail;
+        asm volatile ( "kmovd %%k3, %0" : "=g" (rc) );
+        /*
+         * 0b11(0001100101)*3
+         * 0b1100_0110_0101_0001_1001_0100_0110_0101
+         */
+        if ( rc != 0xc6519465 )
+            goto fail;
+        printf("okay\n");
+    }
+    else
+        printf("skipped\n");
+
     /*
      * The following compress/expand tests are not only making sure the
      * accessed data is correct, but they also verify (by placing operands
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -183,6 +183,7 @@ void wrpkru(unsigned int val);
 #define cpu_has_avx512_4fmaps (cp.feat.avx512_4fmaps && xcr0_mask(0xe6))
 #define cpu_has_avx512_vp2intersect (cp.feat.avx512_vp2intersect && xcr0_mask(0xe6))
 #define cpu_has_serialize  cp.feat.serialize
+#define cpu_has_avx512_fp16 (cp.feat.avx512_fp16 && xcr0_mask(0xe6))
 #define cpu_has_avx_vnni   (cp.feat.avx_vnni && xcr0_mask(6))
 #define cpu_has_avx512_bf16 (cp.feat.avx512_bf16 && xcr0_mask(0xe6))
 
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -518,6 +518,7 @@ static const struct ext0f3a_table {
     [0x7a ... 0x7b] = { .simd_size = simd_scalar_opc, .four_op = 1 },
     [0x7c ... 0x7d] = { .simd_size = simd_packed_fp, .four_op = 1 },
     [0x7e ... 0x7f] = { .simd_size = simd_scalar_opc, .four_op = 1 },
+    [0xc2] = { .simd_size = simd_any_fp, .d8s = d8s_vl },
     [0xcc] = { .simd_size = simd_other },
     [0xce ... 0xcf] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
     [0xdf] = { .simd_size = simd_packed_int, .two_op = 1 },
@@ -579,7 +580,7 @@ static unsigned int decode_disp8scale(en
         if ( s->evex.brs )
         {
     case d8s_dq:
-            return 2 + s->evex.w;
+            return 1 + !s->fp16 + s->evex.w;
         }
         break;
 
@@ -596,7 +597,7 @@ static unsigned int decode_disp8scale(en
         /* fall through */
     case simd_scalar_opc:
     case simd_scalar_vexw:
-        return 2 + s->evex.w;
+        return 1 + !s->fp16 + s->evex.w;
 
     case simd_128:
         /* These should have an explicit size specified. */
@@ -1417,7 +1418,29 @@ int x86emul_decode(struct x86_emulate_st
              */
             s->simd_size = ext0f3a_table[b].simd_size;
             if ( evex_encoded() )
+            {
+                switch ( b )
+                {
+                case 0x08: /* vrndscaleph */
+                case 0x0a: /* vrndscalesh */
+                case 0x26: /* vfpclassph */
+                case 0x27: /* vfpclasssh */
+                case 0x56: /* vgetmantph */
+                case 0x57: /* vgetmantsh */
+                case 0x66: /* vreduceph */
+                case 0x67: /* vreducesh */
+                    if ( !s->evex.pfx )
+                        s->fp16 = true;
+                    break;
+
+                case 0xc2: /* vpcmp{p,s}h */
+                    if ( !(s->evex.pfx & VEX_PREFIX_DOUBLE_MASK) )
+                        s->fp16 = true;
+                    break;
+                }
+
                 disp8scale = decode_disp8scale(ext0f3a_table[b].d8s, s);
+            }
             break;
 
         case ext_8f09:
@@ -1712,7 +1735,7 @@ int x86emul_decode(struct x86_emulate_st
             break;
         case vex_f3:
             generate_exception_if(evex_encoded() && s->evex.w, X86_EXC_UD);
-            s->op_bytes = 4;
+            s->op_bytes = 4 >> s->fp16;
             break;
         case vex_f2:
             generate_exception_if(evex_encoded() && !s->evex.w, X86_EXC_UD);
@@ -1722,11 +1745,11 @@ int x86emul_decode(struct x86_emulate_st
         break;
 
     case simd_scalar_opc:
-        s->op_bytes = 4 << (ctxt->opcode & 1);
+        s->op_bytes = 2 << (!s->fp16 + (ctxt->opcode & 1));
         break;
 
     case simd_scalar_vexw:
-        s->op_bytes = 4 << s->vex.w;
+        s->op_bytes = 2 << (!s->fp16 + s->vex.w);
         break;
 
     case simd_128:
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -305,6 +305,7 @@ struct x86_emulate_state {
     bool lock_prefix;
     bool not_64bit; /* Instruction not available in 64bit. */
     bool fpu_ctrl;  /* Instruction is an FPU control one. */
+    bool fp16;      /* Instruction has half-precision FP source operand. */
     opcode_desc_t desc;
     union vex vex;
     union evex evex;
@@ -592,6 +593,7 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_avx512_vp2intersect() (ctxt->cpuid->feat.avx512_vp2intersect)
 #define vcpu_has_serialize()   (ctxt->cpuid->feat.serialize)
 #define vcpu_has_tsxldtrk()    (ctxt->cpuid->feat.tsxldtrk)
+#define vcpu_has_avx512_fp16() (ctxt->cpuid->feat.avx512_fp16)
 #define vcpu_has_avx_vnni()    (ctxt->cpuid->feat.avx_vnni)
 #define vcpu_has_avx512_bf16() (ctxt->cpuid->feat.avx512_bf16)
 
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -1300,7 +1300,7 @@ x86_emulate(
     b = ctxt->opcode;
     d = state.desc;
 #define state (&state)
-    elem_bytes = 4 << evex.w;
+    elem_bytes = 2 << (!state->fp16 + evex.w);
 
     generate_exception_if(state->not_64bit && mode_64bit(), EXC_UD);
 
@@ -7145,6 +7145,15 @@ x86_emulate(
         avx512_vlen_check(b & 2);
         goto simd_imm8_zmm;
 
+    case X86EMUL_OPC_EVEX(0x0f3a, 0x0a): /* vrndscalesh $imm8,xmm/mem,xmm,xmm{k} */
+        generate_exception_if(ea.type != OP_REG && evex.brs, EXC_UD);
+        /* fall through */
+    case X86EMUL_OPC_EVEX(0x0f3a, 0x08): /* vrndscaleph $imm8,[xyz]mm/mem,[xyz]mm{k} */
+        host_and_vcpu_must_have(avx512_fp16);
+        generate_exception_if(evex.w, EXC_UD);
+        avx512_vlen_check(b & 2);
+        goto simd_imm8_zmm;
+
 #endif /* X86EMUL_NO_SIMD */
 
     CASE_SIMD_PACKED_INT(0x0f3a, 0x0f): /* palignr $imm8,{,x}mm/mem,{,x}mm */
@@ -7455,6 +7464,14 @@ x86_emulate(
             avx512_vlen_check(false);
         goto simd_imm8_zmm;
 
+    case X86EMUL_OPC_EVEX(0x0f3a, 0x26): /* vgetmantph $imm8,[xyz]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX(0x0f3a, 0x56): /* vreduceph $imm8,[xyz]mm/mem,[xyz]mm{k} */
+        host_and_vcpu_must_have(avx512_fp16);
+        generate_exception_if(evex.w, EXC_UD);
+        if ( ea.type != OP_REG || !evex.brs )
+            avx512_vlen_check(false);
+        goto simd_imm8_zmm;
+
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x51): /* vranges{s,d} $imm8,xmm/mem,xmm,xmm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x57): /* vreduces{s,d} $imm8,xmm/mem,xmm,xmm{k} */
         host_and_vcpu_must_have(avx512dq);
@@ -7467,6 +7484,16 @@ x86_emulate(
             avx512_vlen_check(true);
         goto simd_imm8_zmm;
 
+    case X86EMUL_OPC_EVEX(0x0f3a, 0x27): /* vgetmantsh $imm8,xmm/mem,xmm,xmm{k} */
+    case X86EMUL_OPC_EVEX(0x0f3a, 0x57): /* vreducesh $imm8,xmm/mem,xmm,xmm{k} */
+        host_and_vcpu_must_have(avx512_fp16);
+        generate_exception_if(evex.w, EXC_UD);
+        if ( !evex.brs )
+            avx512_vlen_check(true);
+        else
+            generate_exception_if(ea.type != OP_REG, EXC_UD);
+        goto simd_imm8_zmm;
+
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x30): /* kshiftr{b,w} $imm8,k,k */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x32): /* kshiftl{b,w} $imm8,k,k */
         if ( !vex.w )
@@ -7630,6 +7657,16 @@ x86_emulate(
         avx512_vlen_check(true);
         goto simd_imm8_zmm;
 
+    case X86EMUL_OPC_EVEX(0x0f3a, 0x66): /* vfpclassph $imm8,[xyz]mm/mem,k{k} */
+    case X86EMUL_OPC_EVEX(0x0f3a, 0x67): /* vfpclasssh $imm8,xmm/mem,k{k} */
+        host_and_vcpu_must_have(avx512_fp16);
+        generate_exception_if(evex.w || !evex.r || !evex.R || evex.z, EXC_UD);
+        if ( !(b & 1) )
+            goto avx512f_imm8_no_sae;
+        generate_exception_if(evex.brs, EXC_UD);
+        avx512_vlen_check(true);
+        goto simd_imm8_zmm;
+
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x70): /* vpshldw $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x72): /* vpshrdw $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
         generate_exception_if(!evex.w, EXC_UD);
@@ -7640,6 +7677,16 @@ x86_emulate(
         host_and_vcpu_must_have(avx512_vbmi2);
         goto avx512f_imm8_no_sae;
 
+    case X86EMUL_OPC_EVEX_F3(0x0f3a, 0xc2): /* vcmpsh $imm8,xmm/mem,xmm,k{k} */
+        generate_exception_if(ea.type != OP_REG && evex.brs, EXC_UD);
+        /* fall through */
+    case X86EMUL_OPC_EVEX(0x0f3a, 0xc2): /* vcmpph $imm8,[xyz]mm/mem,[xyz]mm,k{k} */
+        host_and_vcpu_must_have(avx512_fp16);
+        generate_exception_if(evex.w || !evex.r || !evex.R || evex.z, EXC_UD);
+        if ( ea.type != OP_REG || !evex.brs )
+            avx512_vlen_check(evex.pfx & VEX_PREFIX_SCALAR_MASK);
+        goto simd_imm8_zmm;
+
     case X86EMUL_OPC(0x0f3a, 0xcc):     /* sha1rnds4 $imm8,xmm/m128,xmm */
         host_and_vcpu_must_have(sha);
         op_bytes = 16;


