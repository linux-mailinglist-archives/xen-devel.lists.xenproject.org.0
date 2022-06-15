Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6B854C654
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jun 2022 12:38:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.350000.576233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1QPg-0002u6-7M; Wed, 15 Jun 2022 10:38:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 350000.576233; Wed, 15 Jun 2022 10:38:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1QPg-0002ru-2t; Wed, 15 Jun 2022 10:38:16 +0000
Received: by outflank-mailman (input) for mailman id 350000;
 Wed, 15 Jun 2022 10:38:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=56zs=WW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o1QH7-0002mz-Vx
 for xen-devel@lists.xenproject.org; Wed, 15 Jun 2022 10:29:26 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0629.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06cdd9ac-ec96-11ec-bd2c-47488cf2e6aa;
 Wed, 15 Jun 2022 12:29:25 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7332.eurprd04.prod.outlook.com (2603:10a6:20b:1db::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.13; Wed, 15 Jun
 2022 10:29:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.020; Wed, 15 Jun 2022
 10:29:22 +0000
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
X-Inumbo-ID: 06cdd9ac-ec96-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UmzbM9VmEtu60O6d2A6xUEjeau3ZJ+a4LFwmd+AaHwBo6woOsa6fhSDB4JiE+emcPCv3Z2aSdlVtR06ZmauCmghcaSh86bsNm++UedyjFLme9uvyNXwj/qHahy7fV5xmvzgEShbx6jqBSOY6Bu+TnhVkBP4cpmfOb35OiOIQSGNcBmv09HGzG+m+oxofD9iUEQVgIVQi7qOhtwv1Z3LYnfGbuvWGs7pxWS/ssOJuzyt5nJToFFQnMVTws1ehOk6CzsX7rMu4L4fEt0WsiZIyiGvFi8tvCV82ncMkNd/LvPptYsn4B5HzTmxVZhoRCyUOjQOK0VqXG3ZSz/biyCJ/fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HjhcNK1/AAtI6oe/nZgHbpEji5E8JjehJMuPbAPTZnI=;
 b=SsV/3Mb+y3QW+2aejVkY5OS/te4kuVkFIVnJ+GX2ekxXabSS7oiiAR832Ut14HoqC739JEfVoPsI6eC8NyLjMyBj3FTb0Cocsc1QCA5hzrhbQELCuX1UrUpfHbU2Cacsu5W6mRf6JRcrsUU9IxCH57hIl3fQNTxRDmci/o/O3vuNROBram/01zykZl9T1PDpwAZR3LaIiY2FapihxOkeFpe3XM1+yoGrimL5KN3m1Drkq2SgBOsKRKoZW5hJ3GfE/Fi1Woa/Qe4Leky5fGE82ga+wk0kiJ1ZZ3GU3W3F8MyOhx4oHL7zG32+32Lff3ur7b19cXnHaWcaMqcfsZmh6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HjhcNK1/AAtI6oe/nZgHbpEji5E8JjehJMuPbAPTZnI=;
 b=091yK/Qon4Y5lgJvq4tvpGQ2NcvEebP+ZIgWfjZJd1ittCaMmqSErjXYBumjTlp4Velu3RORsIJJjUHzSvPz4tYF/wgt/DPviAZAoB3tSaXkciJcjyphbxu6d+nDa5o678Amp6W8HFm4PXyAMY6ZqJDc9bwLHtfehQs5gYp5DoFENh5WOodrjGRUBB2DvbkpwvNGfGDo1CDMYWnpWCRSWxkqusAT3yu/4UQvvKSaPlX/Ug2rDIqSuP/rbWbiBGoxrySzr7b3rQGLMkWZRVi8pUIYmA8E8otlima5qvknSaTJUVhML1kOwGEX+SUGEDBjsUT+3dyFfdar4rXHWLHBtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ca49ed5d-d440-72da-6f56-664888c8b25c@suse.com>
Date: Wed, 15 Jun 2022 12:29:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: [PATCH 06/11] x86emul: handle AVX512-FP16 Map6 misc insns
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <9ba3aaa7-56ce-b051-f1c4-874276e493e1@suse.com>
In-Reply-To: <9ba3aaa7-56ce-b051-f1c4-874276e493e1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0027.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8b::40) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1532c4d-c4c0-45ca-5f99-08da4eb9e99f
X-MS-TrafficTypeDiagnostic: AM8PR04MB7332:EE_
X-Microsoft-Antispam-PRVS:
	<AM8PR04MB7332227BE00708A2BCADEC00B3AD9@AM8PR04MB7332.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BsIMuZPD/6cFiapbTg/tQCZVnb7MeGEkoFG0QZGRymvkrsL+fQyg/kF/Z9hDvS8ojrm5Wg6aGPpAiN3M7SAnpgsueXMyv3/R3TV4HTTMQ96pxY1us2+6bD2CYcbYWjIE5SVdna4pUcZU124YB35WJJomqAI55vvJ0BEgIYryFGVkhZ8J2MAgX907JTV8vgCVK4tro7FqvROOkyUPC7/Vld2kqWmwlU7l5TO0bzoql0TsPtD2E4tRb3xUWLkfFdApeURTOKP/Tyc1qJDc4vEm/DRVfVLFMxEXbUvwdu/MiWVuhbahDIjWJeyRztIbD/OnoORTxrke5iRzo99G+oyVTbp8niQIWQboi9Frt7SkPPSjbwlmwj2XIkMVadfwgvG1bV0tno+wcArpHhc075mfTJPAAJj2VTXAXsWtZjt/W+S3//RoeYsGWmoDF5rK8OPEIH0tRT1wgQUnsjmTrqfAR8ze/MRLtf6p8lEgSgl5o7YN53r6X3Vliz9OzrnK9k5jxvotot8DONiklNZfXGNEBd9P9E+wXqV1TlXw+kJ1Hc+ooZvb7+4ER3it0Qbn6kc0pUEdc5PVZtKl3n+kltNwdBMkCgfzLPaWcjOnLVY8gCCIBGiqpagXjrz/jOVkAvariUSFFihTSmI678yqfOr4iCjk+JR7JpclFYs5yTgDM4WdAcSI3lMiAE+dpd7LZz9t7vxf51jZlieIO5JHouK+mdOR6jr+SM9mlE9ceDwPDYwG5AckTK8eaI+7Foa8Bo0k
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(31686004)(6486002)(316002)(36756003)(26005)(86362001)(31696002)(6512007)(186003)(8936002)(2616005)(6506007)(38100700002)(6916009)(54906003)(508600001)(66476007)(4326008)(66556008)(8676002)(5660300002)(2906002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkhWZUVSSXNIaWp0Mjlkc0d0bHRGOFBGNm5rTGkzRkZvdEg5Q1dZOU1wZFJQ?=
 =?utf-8?B?Q0ZycHllaEcvNHplcHRpYmhhL2ZmMTk1UUZ4RVFlSW5la0pRTytsN1ZZU01y?=
 =?utf-8?B?TUNwU1g5WUlMS0NJclFTRG83STJKbUxIeEsvNWw5RjZyTUZ6dld5a2hWeG85?=
 =?utf-8?B?cVdRZjdPK3hNVG9UNjhwVXlMZG1ualltUTNkSlN5aEtHeCt6ZVIyOHFvaHpx?=
 =?utf-8?B?WHlib3FyaHVlZjNLSjYyU21mWEFSeE1rWFJZcnkyN1E5dW5jd1VxVnVwYngv?=
 =?utf-8?B?U1Jqd1BzRlB0aWJmWVNCSk45TFVHL3lDeHpXc2tBeVJ6amUzVkpneFVVUkd4?=
 =?utf-8?B?MThXUllraEsxeVJkNDNDVFg1bDZRZFNIb015b2JWOHBvNHpyc1dYamJ3V3FK?=
 =?utf-8?B?R0I5Z3pGWVByNTc0ZlhiRm5qWlJtYVBGSkFUMEQ3NTJjVjZiUU9KcnB2TTdM?=
 =?utf-8?B?cmNvcGNxNmViSzA3MnNwelUwbzIzY3FCZ2Rrd091MnlnaUp3ZUliMGhBWHFz?=
 =?utf-8?B?OFAzVlRsRzBKZisvVis0ZllIRVlwQ0tMZDEvWTFlYUQ0ZjA1dWl2MDhHbGRP?=
 =?utf-8?B?WnAyVHM4V2tIM0MvcEtMZlFrUWZaejFZYTAzNW5QNnFPTVhJZnB3QXlidCs2?=
 =?utf-8?B?QnUyK2toRG0vUzVOMGk4QW5jakRFOURTU0x4WDZDR0lncVRLWklwN242bkh3?=
 =?utf-8?B?dTlFN2tUSlA0RW1DTm9SRDRENEhVei9xZ3JhbVorRTQyandIbHZxYUM1UlBw?=
 =?utf-8?B?WGJXVlQvOFE1MG1NTzdhbSt5VTJjUkp3WEJWeUcxcXpyWnZGaHo5Y1hGMmRk?=
 =?utf-8?B?Z1lHTnRyQU0xRWE1Skc0a2VJTitaanZkUFFyOFhSZVlCeWR3VU1hbzFrc0Qx?=
 =?utf-8?B?ekwvdWxteGZUaVVlM3FxaWQ3OVZ1KzUyZXM0clY0eTdHREVhUndxNW1QOUh3?=
 =?utf-8?B?YXp4SUJlZjlVMlBxMkcwTG4yTkZLcURhS2tqVW5uYXNHc2VWems1NjluWVJB?=
 =?utf-8?B?bE9aVHNBaWhxOTljd3I5WFR2dEcvLzVja0M3ZEl6aEthYkszL2ROQ2UzR3F3?=
 =?utf-8?B?c2FFN00rOE5yTndTVFhESk5rNlAzKzBVcSswVlBmUS8wNjM1UyszRHVLSHFw?=
 =?utf-8?B?ckRIOTdZdE5vUW5IWE1pc1JhQmJlNnpZeFZBUFMvTzdzTlVVK1BwVUc3UmJn?=
 =?utf-8?B?UStRRSt2K1RWUVlnK0E0dnkzdTlwL1AwdDR0dnc0ZE5WRXgwdVFEZFlQVVlT?=
 =?utf-8?B?bldzZDJSc21NK0NQUm5RU2g5d2RsS1VhMWt2eE52TXhkL2FYWG9UQnIzUC9l?=
 =?utf-8?B?TUpWVFZEMmFPT3VGV1UwcFAraEo1TFdwWjU1Z1FZRFRZRm81Sy9XRXhXbnA5?=
 =?utf-8?B?NXBjcVBqaFI4U0VQNFIwUlNiWE5BZ1ZabXhuSzVUOStvZU9YenRwaUd6MFhi?=
 =?utf-8?B?R29MWXlMSlZnTFdOQTlkWHU1dHVNalJBaWh2bEhqVG4wVWdldjY4Q2F6VjVK?=
 =?utf-8?B?R2FTVHlNVitCVkJQQjF4MnZUWnE0ankrUXJHYVFCWlZ2V0cwQ3dnQVJVL0Nz?=
 =?utf-8?B?Tnhxazh2czAxaEpyUnRGeUhiQjNSN1N5ZHZzdEwzL0lTMk9mQS9XZE5UclNQ?=
 =?utf-8?B?L2dnTDJxSTV4TFhQVTlzVkI1MCs5QStBbTF5UEFJdkpwemNBVWZCc2NrRngr?=
 =?utf-8?B?VmErc1lxNVhUNkFiS1A5ejY5NGdqU3hoN2M0azJJZkFLS3AvUlArUDU0WXRh?=
 =?utf-8?B?dXhGd3o1RnorMnRYdjZGbGhoekVUZGlucXFSSW5mU2dTOWV6WmtzVEhTckRD?=
 =?utf-8?B?UzFZem16Szd1TUd0b0dKSC9hTFVaV21ZV3hzNHNkRnl1VkJFM1JKQXpQZ21T?=
 =?utf-8?B?L21EbkRHUzVzdU82a3pqNE5lVy83SDdDTHFJVy9mcFdDK21CVHUyb3VOYUNL?=
 =?utf-8?B?cFRXNDJ2RXRYcExPOTcvL1pTemM4TVFpZFpISklOMCttVmxRUWlvMlQ1ZFp6?=
 =?utf-8?B?ZmdTQ1gzTjRaTU1YcEpqU3llY2hGN0pGY2VDVnVHWHhDMFJveDAvRUl2NXcw?=
 =?utf-8?B?UWZPTUFHQldSOXVHT1JSdE5ucldFRm84NlhMYUIzTWJHTEZ3eFcvYUtxbmxT?=
 =?utf-8?B?NUZlNTZGaFhCbWN4d1FQQ0l0ejY1NlNlN2dDZVdJaUI5Q0R6ckhSWTRNRGlH?=
 =?utf-8?B?ZTdTY0JuN0VHTUoya2ozZHBqc3p5MVErbjlPL21MWUR0UDZNcWlwT3Y1MzZG?=
 =?utf-8?B?NDN5UEVEVUVlMTJwK084dWp2NXpVbnFlWEgxVENIVWRSV2RSN0RMWmNpWnlp?=
 =?utf-8?B?bDBhb3RDWmFUWjlqelByM3FDc09sb3J5OHVMUHZQNG1QWDR5d3g3UT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1532c4d-c4c0-45ca-5f99-08da4eb9e99f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 10:29:22.3204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vMLTNJLCNk85fP8qTMq3A8br4LZxAsiG7RRwII0ku8mGAQmpXsLlARJy7qHGGyoyJU7UQ62OXcQHmCzJKGwPZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7332

While, as before, this leverages that the Map6 encoding space is a very
sparse clone of the "0f38" one, switch around the simd_size overriding
for opcode 2D. This way less separate overrides are needed.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -646,6 +646,8 @@ static const struct test avx512_fp16_all
     INSN(fnmsub231sh,   66, map6, bf,    el, fp16, el),
     INSN(fpclassph,       , 0f3a, 66,    vl, fp16, vl),
     INSN(fpclasssh,       , 0f3a, 67,    el, fp16, el),
+    INSN(getexpph,      66, map6, 42,    vl, fp16, vl),
+    INSN(getexpsh,      66, map6, 43,    el, fp16, el),
     INSN(getmantph,       , 0f3a, 26,    vl, fp16, vl),
     INSN(getmantsh,       , 0f3a, 27,    el, fp16, el),
     INSN(maxph,           , map5, 5f,    vl, fp16, vl),
@@ -656,10 +658,16 @@ static const struct test avx512_fp16_all
     INSN(movsh,         f3, map5, 11,    el, fp16, el),
     INSN(mulph,           , map5, 59,    vl, fp16, vl),
     INSN(mulsh,         f3, map5, 59,    el, fp16, el),
+    INSN(rcpph,         66, map6, 4c,    vl, fp16, vl),
+    INSN(rcpsh,         66, map6, 4d,    el, fp16, el),
     INSN(reduceph,        , 0f3a, 56,    vl, fp16, vl),
     INSN(reducesh,        , 0f3a, 57,    el, fp16, el),
     INSN(rndscaleph,      , 0f3a, 08,    vl, fp16, vl),
     INSN(rndscalesh,      , 0f3a, 0a,    el, fp16, el),
+    INSN(rsqrtph,       66, map6, 4e,    vl, fp16, vl),
+    INSN(rsqrtsh,       66, map6, 4f,    el, fp16, el),
+    INSN(scalefph,      66, map6, 2c,    vl, fp16, vl),
+    INSN(scalefsh,      66, map6, 2d,    el, fp16, el),
     INSN(sqrtph,          , map5, 51,    vl, fp16, vl),
     INSN(sqrtsh,        f3, map5, 51,    el, fp16, el),
     INSN(subph,           , map5, 5c,    vl, fp16, vl),
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -2050,6 +2050,14 @@ static const struct evex {
     { { 0x6e }, 2, T, R, pfx_66, WIG, L0 }, /* vmovw */
     { { 0x7e }, 2, T, W, pfx_66, WIG, L0 }, /* vmovw */
 }, evex_map6[] = {
+    { { 0x2c }, 2, T, R, pfx_66, W0, Ln }, /* vscalefph */
+    { { 0x2d }, 2, T, R, pfx_66, W0, LIG }, /* vscalefsh */
+    { { 0x42 }, 2, T, R, pfx_66, W0, Ln }, /* vgetexpph */
+    { { 0x43 }, 2, T, R, pfx_66, W0, LIG }, /* vgetexpsh */
+    { { 0x4c }, 2, T, R, pfx_66, W0, Ln }, /* vrcpph */
+    { { 0x4d }, 2, T, R, pfx_66, W0, LIG }, /* vrcpsh */
+    { { 0x4e }, 2, T, R, pfx_66, W0, Ln }, /* vrsqrtph */
+    { { 0x4f }, 2, T, R, pfx_66, W0, LIG }, /* vrsqrtsh */
     { { 0x96 }, 2, T, R, pfx_66, W0, Ln }, /* vfmaddsub132ph */
     { { 0x97 }, 2, T, R, pfx_66, W0, Ln }, /* vfmsubadd132ph */
     { { 0x98 }, 2, T, R, pfx_66, W0, Ln }, /* vfmadd132ph */
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -358,7 +358,7 @@ static const struct ext0f38_table {
     [0x2a] = { .simd_size = simd_packed_int, .two_op = 1, .d8s = d8s_vl },
     [0x2b] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
     [0x2c] = { .simd_size = simd_packed_fp, .d8s = d8s_vl },
-    [0x2d] = { .simd_size = simd_packed_fp, .d8s = d8s_dq },
+    [0x2d] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
     [0x2e ... 0x2f] = { .simd_size = simd_packed_fp, .to_mem = 1 },
     [0x30] = { .simd_size = simd_other, .two_op = 1, .d8s = d8s_vl_by_2 },
     [0x31] = { .simd_size = simd_other, .two_op = 1, .d8s = d8s_vl_by_4 },
@@ -909,8 +909,8 @@ decode_0f38(struct x86_emulate_state *s,
         ctxt->opcode |= MASK_INSR(s->vex.pfx, X86EMUL_OPC_PFX_MASK);
         break;
 
-    case X86EMUL_OPC_EVEX_66(0, 0x2d): /* vscalefs{s,d} */
-        s->simd_size = simd_scalar_vexw;
+    case X86EMUL_OPC_VEX_66(0, 0x2d): /* vmaskmovpd */
+        s->simd_size = simd_packed_fp;
         break;
 
     case X86EMUL_OPC_EVEX_66(0, 0x7a): /* vpbroadcastb */
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -7780,6 +7780,8 @@ x86_emulate(
         generate_exception_if(evex.w, EXC_UD);
         goto avx512f_all_fp;
 
+    case X86EMUL_OPC_EVEX_66(6, 0x2c): /* vscalefph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0x42): /* vgetexpph [xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(6, 0x96): /* vfmaddsub132ph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(6, 0x97): /* vfmsubadd132ph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(6, 0x98): /* vfmadd132ph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
@@ -7804,6 +7806,8 @@ x86_emulate(
             avx512_vlen_check(false);
         goto simd_zmm;
 
+    case X86EMUL_OPC_EVEX_66(6, 0x2d): /* vscalefsh xmm/m16,xmm,xmm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0x43): /* vgetexpsh xmm/m16,xmm,xmm{k} */
     case X86EMUL_OPC_EVEX_66(6, 0x99): /* vfmadd132sh xmm/m16,xmm,xmm{k} */
     case X86EMUL_OPC_EVEX_66(6, 0x9b): /* vfmsub132sh xmm/m16,xmm,xmm{k} */
     case X86EMUL_OPC_EVEX_66(6, 0x9d): /* vfnmadd132sh xmm/m16,xmm,xmm{k} */
@@ -7823,6 +7827,19 @@ x86_emulate(
             avx512_vlen_check(true);
         goto simd_zmm;
 
+    case X86EMUL_OPC_EVEX_66(6, 0x4c): /* vrcpph [xyz]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0x4e): /* vrsqrtph [xyz]mm/mem,[xyz]mm{k} */
+        host_and_vcpu_must_have(avx512_fp16);
+        generate_exception_if(evex.w, EXC_UD);
+        goto avx512f_no_sae;
+
+    case X86EMUL_OPC_EVEX_66(6, 0x4d): /* vrcpsh xmm/m16,xmm,xmm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0x4f): /* vrsqrtsh xmm/m16,xmm,xmm{k} */
+        host_and_vcpu_must_have(avx512_fp16);
+        generate_exception_if(evex.w || evex.brs, EXC_UD);
+        avx512_vlen_check(true);
+        goto simd_zmm;
+
     case X86EMUL_OPC_XOP(08, 0x85): /* vpmacssww xmm,xmm/m128,xmm,xmm */
     case X86EMUL_OPC_XOP(08, 0x86): /* vpmacsswd xmm,xmm/m128,xmm,xmm */
     case X86EMUL_OPC_XOP(08, 0x87): /* vpmacssdql xmm,xmm/m128,xmm,xmm */


