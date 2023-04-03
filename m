Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFA76D4B37
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 16:57:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517486.802872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjLcz-00077T-Ir; Mon, 03 Apr 2023 14:57:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517486.802872; Mon, 03 Apr 2023 14:57:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjLcz-000746-Ff; Mon, 03 Apr 2023 14:57:49 +0000
Received: by outflank-mailman (input) for mailman id 517486;
 Mon, 03 Apr 2023 14:57:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dypz=72=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pjLcy-00066R-Bz
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 14:57:48 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20631.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e55c288d-d22f-11ed-85db-49a42c6b2330;
 Mon, 03 Apr 2023 16:57:47 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8760.eurprd04.prod.outlook.com (2603:10a6:10:2e3::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 14:57:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.033; Mon, 3 Apr 2023
 14:57:46 +0000
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
X-Inumbo-ID: e55c288d-d22f-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e4Fx248CscoJ4WRIKQ0QGNnVid4Fv/K8U6cYb5HD42xPpX7Waq8Reahrvn08N6SOaEJoXjZRwTH3PNVD9EDmeawJCZqCJnTMjSiTJwVZOhYh6W1vmhjhsFwHeImaMdLQ3MdO/6w7BrMbskrgVXf+mV3B3GTAXHTwfLNHC3l1T23+TpcQ3tNexDX6BSI1r5gq+0TfvuYkPnNQAB0223+6IWTseRdEtEFJXalt2umjAgXkMNhGwn7OFXYk252am0KqZRxfU1eRM9HE8o84rZmB16VvyL5BlckRV6QlbnzvMj6POMxPYlTh8Q7k5XyzymH4tt1xoB9MqFjt+X3OxmuwVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y99XU3et9c84vJqhU6TL+qqpPQD4yDAwck0bIDW2RGA=;
 b=j9UxJBO6JgFcM8nLZ0AumNAYaP42R1/NsW2IyOWNdVQ6U3vfjzJHgBvEpHV8bTklI8EwAPM1TP0iJ4JD+ESj0bKKdTvBTF8A+2V6QWlN00YdHq2GiV4+yFUYklwgx/TNr31mRe4NZHe/7FgaZbxXr4aV0Z6X2kO1P6ymj8PaC/TgC02KhWvbHwF+MCmB2xjkpPyzZ+Ep+3iFWZrsVcEIpP5tFG3F6CVnhbF4FHbgXf7toIDGHpi2Ko9/AxZ23M3e/nCm3VusqpjtL/hYzgvV8oGiJVvAb7hFpT8R0pgj1C9lBboNafNYiXr2oaq0HnKRzNKoVE/Ba7tGWIcwXRWErg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y99XU3et9c84vJqhU6TL+qqpPQD4yDAwck0bIDW2RGA=;
 b=LEISKkaZBCIQmO7WrEQI09DY4XFGlQnoKu5eHyGc24yicxPCfHZ16s9aJdfl26xHuBgxmncTW6eTdJmC6l4eOXKk1y3L04v6TlJfyRQ6v/7ARaR3VaABANkl3X1OrYFD7DtwAbYzFk9XoaAekVuDLIH8GZtudGi0fKvj0CGz1pT48MB2bIuSDUR2YjFCxCMzxAXGmnKkbH5xVO+44mxh7I7+i303kbZFnyc4tK6KsAMn8JCFaACNc7V5U48YIARbKmKHohUenlUnEgqKy6Jh95NPZyGdLJbJID/pQ4+TcBNj4d5MiIyTpaPYoWaqO9NoCWQGXxffOntZT3QbjPcCCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d6c6a796-04fb-8156-e005-a2138be5a99e@suse.com>
Date: Mon, 3 Apr 2023 16:57:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: [PATCH v2 03/10] x86emul: handle AVX512-FP16 move insns
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <8cbbab55-d670-5632-30ee-3e8ca352f048@suse.com>
In-Reply-To: <8cbbab55-d670-5632-30ee-3e8ca352f048@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0165.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8760:EE_
X-MS-Office365-Filtering-Correlation-Id: 305e6770-76fb-45c5-afaf-08db3453c8bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	juWwsLcDWMj12svgVwg+Yr3h9M/35BM7crTmON3ZDAaL9D9ys2Y5vCYAhwv/ajeZgsOUpG1bils1M+uO3TLC7bJtaz9giW1bVk948OpMzPINm/zdlZq2MOXVdXnt0TBYIi/w623Q9NvSghcuohq5uqtxjINpnpLDIVoKGCLoKrE1DReuELAoCnwOer/rWp+9E2XYnzw6bAJZaNpVLkjpzlfaR0r8gzvcpZ3J0vIcej/fDynF+U3FoTiMKNy27/mtcBuItKZYJVj0yvfUJPtHq1KotkOF7jiPbyGAKXZ7yC8SiOdaKAIwjsadvYYGyxBjcc3lfr5pLXL1+yMACGevKzCgl9aKNBI7nPZ1GwW78UFlmnMcNECVYzDBdwe+WkKVWT1LjYk+H3BKQI/n1AgP8+3i7Em65oVr2tHmo5EVEtyIfL9lF3db87KnVDOBfd786BUP6cJHiHlkKUkstdWGOF1mdwSdLM+4rAyIDmNoFsrlzZP/vpK3ssDp6l8AU/tXmTU8+8e8QnxSxuQp8Y5Ypvf0NeyC/mVWlPeapBDPXexMrTj5lZkBYa4AjO88qgXJlA+k8sO57RDYUMCFTMIzjSCEvfO0x91Ks26KP1mkrT3jzy7OVANCIy4P4o7gzk+bu72IomcLT9+Db64uk8EcfQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(136003)(346002)(39860400002)(376002)(451199021)(6916009)(8676002)(66476007)(4326008)(66556008)(66946007)(478600001)(316002)(54906003)(8936002)(41300700001)(38100700002)(5660300002)(186003)(2616005)(6486002)(26005)(6506007)(6512007)(86362001)(31696002)(36756003)(2906002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NnFlUTdseDA2bXZDaEhPWnRmZjd5UXppcXRLTzd0SVJydmFybHg0eElOak5Z?=
 =?utf-8?B?NkMyb1RvU0NWTWlpb0tNR0p0NXhqRXk1U01rdHhnZkJxN0tOVmljS3NhMFll?=
 =?utf-8?B?R0Q2LzFjVmpBUURaRU9WT3FRaTZBNURIR2RESW1XbXhsRjhLTUcyYzd0eHVK?=
 =?utf-8?B?UUpwOERHUjgxcnpzMnlmbGZ3VVh5V2E0eHNHTUh6RXVIUTZHMzhvVG1ZSWJN?=
 =?utf-8?B?UHJGV044T1FLb05IMTdEeE0vNFhydW95cXV1bzNFOEloS2M1V2dhV3ZDL1NH?=
 =?utf-8?B?Yjl1UW5lQk9ldEVua3VPUlZOQWRzYS9aSTQ3dm40enV5dGtCdGpWS3VwUEVn?=
 =?utf-8?B?MTBRMFFXUEVFN0ZnZXVVelJiV0tpTHlUTUcxN2pPNm1pd3AvaDJoanJNcjR0?=
 =?utf-8?B?M0xXSmh5NWlwaHJRSzRzRVRjNkJSN1NwQlV5SHlZb1JwbkRFTFVSVVNVODhV?=
 =?utf-8?B?bCt3ZE82SWhTc0pPWHBEcmVKdkk5d2RrUGlJM0VuNGZoZ1pUdHRrV05Bbnpi?=
 =?utf-8?B?dXpzYk9pSmFYM1FmVkVId1FsU0ZEdHM2MGtiSzc4bUlrVHRpbUpIOEJnRnVM?=
 =?utf-8?B?dS83L1BNVk1sK0o4ZDlPTDV5ZGNVZEJXL3JYT0RLcFpsd2tYdnh6cm1sWmRI?=
 =?utf-8?B?UFR4aXZVb25NZnJZL0FZWVEvdDJXT0RDeXlIcEdJblYrNVNscG5LKzkwb2pk?=
 =?utf-8?B?WEEvajdLMTBXNUF0SWlrTjhCdXlwUURubHN2N0s3ZDkxUmQrYkl1UHl3ckc5?=
 =?utf-8?B?YStqWm1iT1ZyUWl4NHJKbWVwNmFKb2o0NzduRmY3cEtCNS9KbStCa1lKbHNV?=
 =?utf-8?B?cnNuV2h0MGdzWERZVDFyTXlCeFNtN3Z3WTJmMVBVK1NBcFc4ZU1nTTcxcFVv?=
 =?utf-8?B?a0hxblJqSnB4OXVnUjdtZ0FaUkpqVnoyZWNqOTRWaC9KV3ZieGdiMGJnN3pv?=
 =?utf-8?B?RnFhK2R6V1Jnc3hMY0NEdWh6WE90T0FZdVd5RFJjaWVVQUd6M2gwMXBuMzdw?=
 =?utf-8?B?bGFCVk1WQUhNK3dnRzFTSjI0RkVTeG1rbnQ0ZnQ5ZFNQRktYdVZCMEVtTmdM?=
 =?utf-8?B?VTFuaGN5aUNkMjlwTTNnbUVRaFlqb3U3clZja2ZiSkZqRnBQcWplMFNiR0l6?=
 =?utf-8?B?TlFKbFZwYzJBRVA1UDBLaFVRWUFHS0h6Ym5LQ2laTWlYYnhDYjgwMWlXUnM3?=
 =?utf-8?B?d0w5T09VQVBVeGFqMXBwTEZHMi9FYlBKa3pBL0xycUJqbFpaQUQrL1d4L0tL?=
 =?utf-8?B?OU5wYUlsTXU5MWo0d0tNSE9tTE5aaUZ4NW5xVVU2ZW0raG93cktkZjhUWXlo?=
 =?utf-8?B?OE9hWVV4Q2hjNDdlUzdOWXMxeE9RZUlEMG5LZ0FteUdTWjlqS1ZFM3dTSG5C?=
 =?utf-8?B?VzdoUXJyVUlMZFduVytsVkhKM0tna1VnbllCQytjalM5TWNLV21sTjUranZK?=
 =?utf-8?B?TTVueUdXbHRwMG91dHcyRHRCbC8yeHVLbzV3RjdISlRwbTFia1hIZ2xiRXZN?=
 =?utf-8?B?Z0Z4aVJyWXRpQkxqenhuZXpUdmlSQ1cvS0hzY3BiWFJFbmtqL2VWL00vWUV6?=
 =?utf-8?B?YzJ2TkFWWU1sMUgrVzB1WTVzc2pFOUE0VExPYjNNb2RheUpkNmczMkJ1RjJs?=
 =?utf-8?B?bGpvUVdKeTlkbXBxdWh5cm5BRUZORTZPQ0Z5MnRlNGJheDJRai9qT2FxTUMw?=
 =?utf-8?B?eU92bkpsTzZJVk5udFErVmcveXBRckhjOG5lZGxob1RSU0R2UHBIQmJPenA1?=
 =?utf-8?B?NUN0Rkpuc3FXdzFZUEk2QWdZSExlbTRNbCsvaWx5NjVHSjRHeU42eGhCbGk5?=
 =?utf-8?B?QzZBdTYwakZxaFAwOFArekcwa0NVOVhuSGNnb1A3YXJjdGd1ZUQ0c3RtTzFV?=
 =?utf-8?B?OFZ4TEJyeDY3eHJWWUlrb1lIdENEd0p0Mk5nTnNRa2E2N3pBVzJLdThPb0RL?=
 =?utf-8?B?c0Q4Y3VEbnhnWjg3S2toRjg0Mzh1RDVMNGt5NjRkN3ArVEN0NlU0eTBkSDJm?=
 =?utf-8?B?OFRnV1ZEWk85VkdQMGJCeGwrelFrL1A5V1A0YUtQQnlUU1o0NlFQSlZsSE1t?=
 =?utf-8?B?TjF2SzlFL2VnUCtPODJhM3pqK29LNEwwbWtySVBIT2hTcUFZQUxOQXUvdmg1?=
 =?utf-8?Q?Kw11USetWsaRwNeGwqQwd2i/S?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 305e6770-76fb-45c5-afaf-08db3453c8bc
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 14:57:45.9815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kNFNG1nkNpIvNdHSW+8U6RoBeBEl1fwDCoWnMH/Z0IuM81NMWrWFhAnVzIjobBw+I9u0Do0O15xRGXMlAVzqYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8760

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -622,6 +622,8 @@ static const struct test avx512_fp16_all
     INSN(maxsh,         f3, map5, 5f,    el, fp16, el),
     INSN(minph,           , map5, 5d,    vl, fp16, vl),
     INSN(minsh,         f3, map5, 5d,    el, fp16, el),
+    INSN(movsh,         f3, map5, 10,    el, fp16, el),
+    INSN(movsh,         f3, map5, 11,    el, fp16, el),
     INSN(mulph,           , map5, 59,    vl, fp16, vl),
     INSN(mulsh,         f3, map5, 59,    el, fp16, el),
     INSN(reduceph,        , 0f3a, 56,    vl, fp16, vl),
@@ -635,6 +637,11 @@ static const struct test avx512_fp16_all
     INSN(ucomish,         , map5, 2e,    el, fp16, el),
 };
 
+static const struct test avx512_fp16_128[] = {
+    INSN(movw, 66, map5, 6e, el, fp16, el),
+    INSN(movw, 66, map5, 7e, el, fp16, el),
+};
+
 static const struct test gfni_all[] = {
     INSN(gf2p8affineinvqb, 66, 0f3a, cf, vl, q, vl),
     INSN(gf2p8affineqb,    66, 0f3a, ce, vl, q, vl),
@@ -1039,6 +1046,7 @@ void evex_disp8_test(void *instr, struct
     RUN(avx512_vp2intersect, all);
     RUN(avx512_vpopcntdq, all);
     RUN(avx512_fp16, all);
+    RUN(avx512_fp16, 128);
 
     if ( cpu_has_avx512f )
     {
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -2029,6 +2029,8 @@ static const struct evex {
     { { 0xce }, 3, T, R, pfx_66, W1, Ln }, /* vgf2p8affineqb */
     { { 0xcf }, 3, T, R, pfx_66, W1, Ln }, /* vgf2p8affineinvqb */
 }, evex_map5[] = {
+    { { 0x10 }, 2, T, R, pfx_f3, W0, LIG }, /* vmovsh */
+    { { 0x11 }, 2, T, W, pfx_f3, W0, LIG }, /* vmovsh */
     { { 0x2e }, 2, T, R, pfx_no, W0, LIG }, /* vucomish */
     { { 0x2f }, 2, T, R, pfx_no, W0, LIG }, /* vcomish */
     { { 0x51 }, 2, T, R, pfx_no, W0, Ln }, /* vsqrtph */
@@ -2045,6 +2047,8 @@ static const struct evex {
     { { 0x5e }, 2, T, R, pfx_f3, W0, LIG }, /* vdivsh */
     { { 0x5f }, 2, T, R, pfx_no, W0, Ln }, /* vmaxph */
     { { 0x5f }, 2, T, R, pfx_f3, W0, LIG }, /* vmaxsh */
+    { { 0x6e }, 2, T, R, pfx_66, WIG, L0 }, /* vmovw */
+    { { 0x7e }, 2, T, W, pfx_66, WIG, L0 }, /* vmovw */
 };
 
 static const struct {
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -5140,6 +5140,76 @@ int main(int argc, char **argv)
     else
         printf("skipped\n");
 
+    printf("%-40s", "Testing vmovsh 8(%ecx),%xmm5...");
+    if ( stack_exec && cpu_has_avx512_fp16 )
+    {
+        decl_insn(vmovsh_from_mem);
+        decl_insn(vmovw_to_gpr);
+
+        asm volatile ( "vpcmpeqw %%ymm5, %%ymm5, %%ymm5\n\t"
+                       put_insn(vmovsh_from_mem,
+                                /* vmovsh 8(%0), %%xmm5 */
+                                ".byte 0x62, 0xf5, 0x7e, 0x08\n\t"
+                                ".byte 0x10, 0x69, 0x04")
+                       :: "c" (NULL) );
+
+        set_insn(vmovsh_from_mem);
+        res[2] = 0x3c00bc00;
+        regs.ecx = (unsigned long)res;
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( (rc != X86EMUL_OKAY) || !check_eip(vmovsh_from_mem) )
+            goto fail;
+        asm volatile ( "kmovw     %2, %%k1\n\t"
+                       "vmovdqu16 %1, %%zmm4%{%%k1%}%{z%}\n\t"
+                       "vpcmpeqw  %%zmm4, %%zmm5, %%k0\n\t"
+                       "kmovw     %%k0, %0"
+                       : "=g" (rc)
+                       : "m" (res[2]), "r" (1) );
+        if ( rc != 0xffff )
+            goto fail;
+        printf("okay\n");
+
+        printf("%-40s", "Testing vmovsh %xmm4,2(%eax){%k3}...");
+        memset(res, ~0, 8);
+        res[2] = 0xbc00ffff;
+        memset(res + 3, ~0, 8);
+        regs.eax = (unsigned long)res;
+        regs.ecx = ~0;
+        for ( i = 0; i < 2; ++i )
+        {
+            decl_insn(vmovsh_to_mem);
+
+            asm volatile ( "kmovw %1, %%k3\n\t"
+                           put_insn(vmovsh_to_mem,
+                                    /* vmovsh %%xmm4, 2(%0)%{%%k3%} */
+                                    ".byte 0x62, 0xf5, 0x7e, 0x0b\n\t"
+                                    ".byte 0x11, 0x60, 0x01")
+                           :: "a" (NULL), "r" (i) );
+
+            set_insn(vmovsh_to_mem);
+            rc = x86_emulate(&ctxt, &emulops);
+            if ( (rc != X86EMUL_OKAY) || !check_eip(vmovsh_to_mem) ||
+                 memcmp(res, res + 3 - i, 8) )
+                goto fail;
+        }
+        printf("okay\n");
+
+        printf("%-40s", "Testing vmovw %xmm5,%ecx...");
+        asm volatile ( put_insn(vmovw_to_gpr,
+                                /* vmovw %%xmm5, %0 */
+                                ".byte 0x62, 0xf5, 0x7d, 0x08\n\t"
+                                ".byte 0x7e, 0xe9")
+                       :: "c" (NULL) );
+        set_insn(vmovw_to_gpr);
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( (rc != X86EMUL_OKAY) || !check_eip(vmovw_to_gpr) ||
+             regs.ecx != 0xbc00 )
+            goto fail;
+        printf("okay\n");
+    }
+    else
+        printf("skipped\n");
+
     printf("%-40s", "Testing invpcid 16(%ecx),%%edx...");
     if ( stack_exec )
     {
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -585,7 +585,7 @@ static unsigned int decode_disp8scale(en
         break;
 
     case d8s_dq64:
-        return 2 + (s->op_bytes == 8);
+        return 1 + !s->fp16 + (s->op_bytes == 8);
     }
 
     switch ( s->simd_size )
@@ -1469,6 +1469,15 @@ int x86emul_decode(struct x86_emulate_st
                     s->fp16 = true;
                 s->simd_size = simd_none;
                 break;
+
+            case 0x6e: /* vmovw r/m16, xmm */
+                d = (d & ~SrcMask) | SrcMem16;
+                /* fall through */
+            case 0x7e: /* vmovw xmm, r/m16 */
+                if ( s->evex.pfx == vex_66 )
+                    s->fp16 = true;
+                s->simd_size = simd_none;
+                break;
             }
 
             /* Like above re-use twobyte_table[] here. */
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -4390,6 +4390,15 @@ x86_emulate(
 
 #ifndef X86EMUL_NO_SIMD
 
+    case X86EMUL_OPC_EVEX_66(5, 0x7e): /* vmovw xmm,r/m16 */
+        ASSERT(dst.bytes >= 4);
+        if ( dst.type == OP_MEM )
+            dst.bytes = 2;
+        /* fall through */
+    case X86EMUL_OPC_EVEX_66(5, 0x6e): /* vmovw r/m16,xmm */
+        host_and_vcpu_must_have(avx512_fp16);
+        generate_exception_if(evex.w, EXC_UD);
+        /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f, 0x6e): /* vmov{d,q} r/m,xmm */
     case X86EMUL_OPC_EVEX_66(0x0f, 0x7e): /* vmov{d,q} xmm,r/m */
         generate_exception_if((evex.lr || evex.opmsk || evex.brs ||
@@ -7745,8 +7754,18 @@ x86_emulate(
 
 #ifndef X86EMUL_NO_SIMD
 
+    case X86EMUL_OPC_EVEX_F3(5, 0x10):   /* vmovsh m16,xmm{k} */
+                                         /* vmovsh xmm,xmm,xmm{k} */
+    case X86EMUL_OPC_EVEX_F3(5, 0x11):   /* vmovsh xmm,m16{k} */
+                                         /* vmovsh xmm,xmm,xmm{k} */
+        generate_exception_if(evex.brs, EXC_UD);
+        if ( ea.type == OP_MEM )
+            d |= TwoOp;
+        else
+        {
     case X86EMUL_OPC_EVEX_F3(5, 0x51):   /* vsqrtsh xmm/m16,xmm,xmm{k} */
-        d &= ~TwoOp;
+            d &= ~TwoOp;
+        }
         /* fall through */
     case X86EMUL_OPC_EVEX(5, 0x51):      /* vsqrtph [xyz]mm/mem,[xyz]mm{k} */
     CASE_SIMD_SINGLE_FP(_EVEX, 5, 0x58): /* vadd{p,s}h [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */


