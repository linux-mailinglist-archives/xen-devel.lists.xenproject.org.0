Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCD654C629
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jun 2022 12:31:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.349949.576168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1QJ5-0007kJ-Jx; Wed, 15 Jun 2022 10:31:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 349949.576168; Wed, 15 Jun 2022 10:31:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1QJ5-0007hI-Ez; Wed, 15 Jun 2022 10:31:27 +0000
Received: by outflank-mailman (input) for mailman id 349949;
 Wed, 15 Jun 2022 10:31:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=56zs=WW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o1QJ3-0007gz-MR
 for xen-devel@lists.xenproject.org; Wed, 15 Jun 2022 10:31:25 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on062b.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3beb87d1-ec96-11ec-bd2c-47488cf2e6aa;
 Wed, 15 Jun 2022 12:30:54 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6876.eurprd04.prod.outlook.com (2603:10a6:10:116::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.20; Wed, 15 Jun
 2022 10:30:52 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.020; Wed, 15 Jun 2022
 10:30:52 +0000
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
X-Inumbo-ID: 3beb87d1-ec96-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DE0NnyhkLT+KxeYdCD6VvVynLmARSPYuxsy2X0bbwIPJrypbjKwYjUZQKcf37uka9z7chsfR8oJ6KrsAAdRhIaqQBG+TkVm9tpQhivpo4ESCCUUe+We8LloTiooCX9ez33ujcuq1iSyJSt41GuoPuc4vAqLXJNwuCUI28uG2h+bUc7OW0AaWlSDEXS9cNbsQgvgmVKqqv9nIXekrfNJV+51Hin3FWLMW7l4NK6JYBzLFKX1VtKX32//K1NaOXm4DkEozXY46tHhsVbxJuwOu0qkObG5LQpQe3mG87utKT3Z6mhs3Fk54hFyG7zOZO+jMYKYqvpfc8Ug3fh3sWKZ4TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k2dOvs6g6kpvHhFE2Cq6miTN2SdtjeNE6N4Fh2/FJ04=;
 b=Q3JUbM4c/zh9J4OIqT5nY/7nWOP4SlMe0Fx3s/q7pr6nHe1C8o6EqXk+60TPR0Zkrffi2RDSBkCoJITgpgq9nMa9+vIET3sfI3b5qUlZUzbPAHiqbJgNOHNi3xcRuOqvAJ56ObSE51LJZL16643UAOMoAptPLgEmKJyTPAddBKNAp6K90PLZrYmzzHa4flSCQ1fenKK+I9x0gPEH508yj7dvbl9R5qidKgqb9qPJ5OgnbDXb+4C3ku7Szj39MG8S8JUV7JEvg2Np1/LfGPKAq41WUrwS6HgoAIESsRCAdYMpP0q5wlroNwo2PLXBKUjBEsg1UIgTLwg2M80DaywgpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k2dOvs6g6kpvHhFE2Cq6miTN2SdtjeNE6N4Fh2/FJ04=;
 b=bY3fkeDUYNXJz5EB4PHT0YKB6FK7T6TjQkOi7NNPZkzdcQb2I/Kr+LYXzTMjgf3LlBCaDTYlZAEV83jPt6uJVLv9lTPabdUe4jK92QSMAAB8INQ3TSwSPc6h6B+A5OG4awUvVjncLT+S1NwRp4hd/SKQbe3GA0EFXomEk4gwMq6tEFhx3XxYSXKl5ApgCwPQ1nn5goZ0SsMq8Td/GdeuYxgt0HNz9glFxMhK52MyW3QBpC2XVuuFA7CidYyc9/5Mo1xMMyuw5mODJPmUGAGbHR942sk7UAF5rvQQCR0gWrDLsPi8wL5cDGUPCrl7Gh43/pzNZwWhDaIRTpCr+nOOdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4d9c76d3-763c-c1e6-f38b-9282f023a995@suse.com>
Date: Wed, 15 Jun 2022 12:30:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: [PATCH 09/11] x86emul: handle AVX512-FP16 floating point conversion
 insns
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <9ba3aaa7-56ce-b051-f1c4-874276e493e1@suse.com>
In-Reply-To: <9ba3aaa7-56ce-b051-f1c4-874276e493e1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9P194CA0029.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:20b:46d::35) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7da50cf-ece9-4bad-2d56-08da4eba1f48
X-MS-TrafficTypeDiagnostic: DB8PR04MB6876:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB6876C0A6FB79533D50AB4AB3B3AD9@DB8PR04MB6876.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zR/6NkwkcywMZtd0xmdG34avwsFW9weN3rw6DSXBgIGbg4ftmMjNmETqcOMjWgH0Al5SbXaSzh1Y5yMkkPSdhrJksZTRomfMYRCATfjNZlNCoY6zKz7TPG56a9aHm/Navq2BmD6H6wgKcqcuzSDfztC9iNXVUF4p5qX/8hFPB04gMKASZW8os1DhEx+e+D4RbHK2KMPGh2/tSjSYk8djEWM1Y2WZsBtshc7OXKckUYesG24TnOS3YIwUw6TbHTFSak0rDJteqyX3F5DM9CCUnhva2tZvQE2r8Z2MLUwaukeMJeemP6HzqqA4pKZMXqsSfhvsMihM89GtZ56H/KwThjFMY3boASddHBb/grvpgg7Y91bTrexYsrMtYtW67w7ZaeK9fqVKINMw2vxdihZe5SpDtZBJc30u2t99tQSerU3S6niOl8CpMf+JZynX6wFe16MGGq4GmhTrQy/H6xIKcV0YZNhgbhR5YuWyjkdbKsZNeXpI/hGBYBqgXM49rEx+EoVdXmGlRp18g5H/uAYNbHIFsIp4E/EhhNz1K2r6pDvpBMzgA66MpvUQKkiE5VNdgggCjJBVYbChfEtosDGRk5KrrgFUSUW4MBzMoZOwXmn799OJtnma6+Z8t2TjFgvwWSN+OrjfLWPmbmi9LzVxw2QtnDvx1Ho2+4ywbpmhC0mp2XfGoir9cGgl+zznBYdyDwsxugGAjax51UcTJUfCtMeJeFc6F/8Q7XQ63fH70or4Nq8vTZknslsWsg1s+yD6
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(6512007)(66556008)(26005)(54906003)(5660300002)(6506007)(316002)(186003)(2906002)(31686004)(36756003)(508600001)(6486002)(8936002)(66946007)(86362001)(4326008)(8676002)(6916009)(66476007)(38100700002)(31696002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dEs0R1VIN0hWMDM5cHoxTi9oaUh1WTlpZDB0SU5uci8xZEdEblh1NTJoOHRS?=
 =?utf-8?B?NU1CcHR3cVNTRXFObDBlREh3UlFDbmhqWDZza2RWUFJsenB2VkczRThMMFlF?=
 =?utf-8?B?blBkdlJ0bmRDSm5rS3ZLSlg2NThVQWtBcEhlVHFheHRrbzFmTktpNHNub3ZV?=
 =?utf-8?B?eHBqYWZqeHZRMjBEblNXbS81OE4rV3RVS2ttL29LUDdPQ1ZyZmRjOHlLTnBH?=
 =?utf-8?B?M0pxOG1BeFVOMUZkOFFNb0pzUGZGRFhuL3FCRGl3MjRXWXh1NXQ4c2ZmWXNR?=
 =?utf-8?B?NlNVYzNqU29lRTRoT1hzVlplR3I1ZzE1QWRjd0Fsci9HaDhLN0Zrb2Jtb0w0?=
 =?utf-8?B?WkcxRm1VUkxNdEhId2ZFZ296eUNUWmR5YjFxWExBc29tVitoUHQrc3NZZDFM?=
 =?utf-8?B?MTVXY21tR0FzMHUrYmxST0IzbVgrVE1RY0ZDRHRFN2liVXh4SkRMTDcxeThQ?=
 =?utf-8?B?UFFFS3pwd253VC9Qc2tzYlNaQ1dHa0crTTFTU25jbDRxK2ZEY3lXQ0tkM1NZ?=
 =?utf-8?B?YU5DM0Jlc3BnLzBhaFV0SUhBcWplanM1b2ljQ09Ea0p0dXBtZ1pHT3I3b0RE?=
 =?utf-8?B?TjhpSGJyeUMzNDVnY2QrVUl4dTdGZWxTaVRTNkZhdXNtd1BnRElLWHRHUnNt?=
 =?utf-8?B?VW8xYTZEblN5clc5S0FkOFZBY3kvOGxsOG91c2E3YzNsNEk5d2lZSEIxMGhm?=
 =?utf-8?B?bFBvUmVIN1o0Uk5lSjJnbkhjQWRPaVNqaDFlRmF3TkhPZThSVmpMTFUzVnY1?=
 =?utf-8?B?ZlZ2RmRLNXBIaWsyallBb0x4Y1hBK1JWbWZBZy8yVmVoVVJrdW11bzVWaWtE?=
 =?utf-8?B?bmw4MmF1TVNtdE5SVThCMmp6N0x0U2h6SGd4VnZkejU5eDk0TC92b2ZYSnVu?=
 =?utf-8?B?cG05Vnc1MjVNZFI3TXV0K2ZDY2NxWHRtTDdOTHhUM3pQK3hQMTdaUGIvMUt5?=
 =?utf-8?B?SWtYSjhDSjBJL1ZqZndCaU4vanBEWUQ4amZEcW9LRVJ2L3kyY29uQ1dSZ3pz?=
 =?utf-8?B?dlhiQ1hpTzd3TklmODRYUFhQOVg1UTk0ZDlabmVmdGNQVSs5eEtPYXhKOUt5?=
 =?utf-8?B?ZDdPZlJxNFordFZPY1N3TXBpQXNxZlY4aEIrR2Q5akJFbkk5UEZrSXdBcVpx?=
 =?utf-8?B?QzlZRzNtcFoyRWdSc3U2RDl0aDRmOHJwTmNJbkhRbXJ0dnhPTXZHY0doRWVv?=
 =?utf-8?B?MlQyMDFVRkVqYnBvVDZkMENCK3c5SnAya3pJLzFXZndjaEZDUHVicVdPSktJ?=
 =?utf-8?B?RUl0YXlONkhCS3JoMHhvblE5K28wRnplN1hvZ2wvMEFGRUpvdlNyVmdUTTM4?=
 =?utf-8?B?S0FVTXFYYlVaR3FPczVTUHA3aTUrTDZOYXNwR2FlZmhCUFROdGo5bFZXVWhL?=
 =?utf-8?B?SGJvOHB2N3ZuRXhrVXd0NCtqSVN2UGhhZWY2aWs4d0h1RXpUS2xGVHUyRGFG?=
 =?utf-8?B?N3Y3ZDBFL1lwMC93M1RQYUR5cDhGWTF5cTBVaGhEQnMzaWNaUnhzcFNyVjV6?=
 =?utf-8?B?YlZ4ZHdINmhQOS9jcG16MXBnVVhubjNxWkZpTHN1L09hUXI0YU1vNUFKQmNv?=
 =?utf-8?B?N0VGc0lmYUdDc0hIOVErWitLVzE2czhpbDRteVpZWVFKb1k5aGNhTHJ2a1B6?=
 =?utf-8?B?RGUrZ2o1Q3RQOW9XQnFjV00rQ1kxdVc1R3VnMEl6Tlp2TmhTUlc2S2kzTzND?=
 =?utf-8?B?K2R1VEJMWmFvZGtONmoxUzdOd2RaT3JRdkw0MVNQanpQREdFRjVVK0lNb2Zm?=
 =?utf-8?B?UVBURGgrak14a2JOMzhlS3FuYmJXdzRvOUhNb1h3UE1xQnZRUXZvWTUzZm8v?=
 =?utf-8?B?TVdYR2VQbVNkOElGdWs0azNrR2lCbHFvZ1VvcFlYRjkrZU9TR0FrbVlwdE5w?=
 =?utf-8?B?N3RxVXpmbkc1d256K2cvRG5Hai9DcnVXTzZnS1NHTWNvQzlnQStzNWwvQ244?=
 =?utf-8?B?M2s4R1UrWUlIcGNKU1ZPSTNLK09DbzdUSUJuWVJuWXRsdzRzSEUwQy9ORkhl?=
 =?utf-8?B?YUx0VUpBV2YxbzFzaEtHOXorYUVlSXJiZGVVYmF1MTVOWTF1UXNHN2pET0Nt?=
 =?utf-8?B?dkVRREY5K0hmNXY1RUp6RTJQempwaFdGdGFaSXlteWU0QWJkM3VFLytmOWY2?=
 =?utf-8?B?WEM1UURkMzNqTzFrRFZTNU5BSTduelNaUDJaUEV4ZXRhMXlhWjFjVHNHNElI?=
 =?utf-8?B?eDdIM09wSDV1akFFRncwUUFTZW5GZkpndXpXQXRrSmZrbUtucHVhaDVwcVl5?=
 =?utf-8?B?b1NvWlNYRWhRVXdLRXNNZXVzNTA4aEZ1MUhkT2M3VXhpKzdNWlZiOEZRbkhP?=
 =?utf-8?B?U1pHNy9ZZTRNVlF3dHNXazlaVmVwdnU0d0w3OEo5MHlaY0FQSjBldz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7da50cf-ece9-4bad-2d56-08da4eba1f48
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 10:30:52.3616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kg9J8dmX9prMY3qcHatrkZtAYJpAtmZNu/Ya0Vj8AG1zupNmBVq2ULGHJH1SNYsEKpxMB6leG0VlH9SbZ+raWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6876

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -612,8 +612,16 @@ static const struct test avx512_fp16_all
     INSN(cmpph,           , 0f3a, c2,    vl, fp16, vl),
     INSN(cmpsh,         f3, 0f3a, c2,    el, fp16, el),
     INSN(comish,          , map5, 2f,    el, fp16, el),
+    INSN(cvtpd2ph,      66, map5, 5a,    vl,    q, vl),
+    INSN(cvtph2pd,        , map5, 5a,  vl_4, fp16, vl),
+    INSN(cvtph2psx,     66, map6, 13,  vl_2, fp16, vl),
     INSN(cvtph2uw,        , map5, 7d,    vl, fp16, vl),
     INSN(cvtph2w,       66, map5, 7d,    vl, fp16, vl),
+    INSN(cvtps2phx,     66, map5, 1d,    vl,    d, vl),
+    INSN(cvtsd2sh,      f2, map5, 5a,    el,    q, el),
+    INSN(cvtsh2sd,      f3, map5, 5a,    el, fp16, el),
+    INSN(cvtsh2ss,        , map6, 13,    el, fp16, el),
+    INSN(cvtss2sh,        , map5, 1d,    el,    d, el),
     INSN(cvttph2uw,       , map5, 7c,    vl, fp16, vl),
     INSN(cvttph2w,      66, map5, 7c,    vl, fp16, vl),
     INSN(cvtuw2ph,      f2, map5, 7d,    vl, fp16, vl),
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -2031,6 +2031,8 @@ static const struct evex {
 }, evex_map5[] = {
     { { 0x10 }, 2, T, R, pfx_f3, W0, LIG }, /* vmovsh */
     { { 0x11 }, 2, T, W, pfx_f3, W0, LIG }, /* vmovsh */
+    { { 0x1d }, 2, T, R, pfx_66, W0, Ln }, /* vcvtps2phx */
+    { { 0x1d }, 2, T, R, pfx_no, W0, LIG }, /* vcvtss2sh */
     { { 0x2e }, 2, T, R, pfx_no, W0, LIG }, /* vucomish */
     { { 0x2f }, 2, T, R, pfx_no, W0, LIG }, /* vcomish */
     { { 0x51 }, 2, T, R, pfx_no, W0, Ln }, /* vsqrtph */
@@ -2039,6 +2041,10 @@ static const struct evex {
     { { 0x58 }, 2, T, R, pfx_f3, W0, LIG }, /* vaddsh */
     { { 0x59 }, 2, T, R, pfx_no, W0, Ln }, /* vmulph */
     { { 0x59 }, 2, T, R, pfx_f3, W0, LIG }, /* vmulsh */
+    { { 0x5a }, 2, T, R, pfx_no, W0, Ln }, /* vcvtph2pd */
+    { { 0x5a }, 2, T, R, pfx_66, W1, Ln }, /* vcvtpd2ph */
+    { { 0x5a }, 2, T, R, pfx_f3, W0, LIG }, /* vcvtsh2sd */
+    { { 0x5a }, 2, T, R, pfx_f2, W1, LIG }, /* vcvtsd2sh */
     { { 0x5c }, 2, T, R, pfx_no, W0, Ln }, /* vsubph */
     { { 0x5c }, 2, T, R, pfx_f3, W0, LIG }, /* vsubsh */
     { { 0x5d }, 2, T, R, pfx_no, W0, Ln }, /* vminph */
@@ -2056,6 +2062,8 @@ static const struct evex {
     { { 0x7d }, 2, T, R, pfx_f2, W0, Ln }, /* vcvtuwph */
     { { 0x7e }, 2, T, W, pfx_66, WIG, L0 }, /* vmovw */
 }, evex_map6[] = {
+    { { 0x13 }, 2, T, R, pfx_66, W0, Ln }, /* vcvtph2psx */
+    { { 0x13 }, 2, T, R, pfx_no, W0, LIG }, /* vcvtsh2ss */
     { { 0x2c }, 2, T, R, pfx_66, W0, Ln }, /* vscalefph */
     { { 0x2d }, 2, T, R, pfx_66, W0, LIG }, /* vscalefsh */
     { { 0x42 }, 2, T, R, pfx_66, W0, Ln }, /* vgetexpph */
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -224,7 +224,9 @@ static const struct twobyte_table {
     [0x14 ... 0x15] = { DstImplicit|SrcMem|ModRM, simd_packed_fp, d8s_vl },
     [0x16] = { DstImplicit|SrcMem|ModRM|Mov, simd_other, 3 },
     [0x17] = { DstMem|SrcImplicit|ModRM|Mov, simd_other, 3 },
-    [0x18 ... 0x1f] = { ImplicitOps|ModRM },
+    [0x18 ... 0x1c] = { ImplicitOps|ModRM },
+    [0x1d] = { ImplicitOps|ModRM, simd_none, d8s_vl },
+    [0x1e ... 0x1f] = { ImplicitOps|ModRM },
     [0x20 ... 0x21] = { DstMem|SrcImplicit|ModRM },
     [0x22 ... 0x23] = { DstImplicit|SrcMem|ModRM },
     [0x28] = { DstImplicit|SrcMem|ModRM|Mov, simd_packed_fp, d8s_vl },
@@ -1474,6 +1476,19 @@ int x86emul_decode(struct x86_emulate_st
                     s->fp16 = true;
                 break;
 
+            case 0x1d: /* vcvtps2phx / vcvtss2sh */
+                if ( s->evex.pfx & VEX_PREFIX_SCALAR_MASK )
+                    break;
+                d = DstReg | SrcMem;
+                if ( s->evex.pfx & VEX_PREFIX_DOUBLE_MASK )
+                {
+                    s->simd_size = simd_packed_fp;
+                    d |= TwoOp;
+                }
+                else
+                    s->simd_size = simd_scalar_vexw;
+                break;
+
             case 0x2e: case 0x2f: /* v{,u}comish */
                 if ( !s->evex.pfx )
                     s->fp16 = true;
@@ -1497,6 +1512,15 @@ int x86emul_decode(struct x86_emulate_st
             }
 
             disp8scale = decode_disp8scale(twobyte_table[b].d8s, s);
+
+            switch ( b )
+            {
+            case 0x5a: /* vcvtph2pd needs special casing */
+                if ( !s->evex.pfx && !s->evex.brs )
+                    disp8scale -= 2;
+                break;
+            }
+
             break;
 
         case ext_map6:
@@ -1513,6 +1537,17 @@ int x86emul_decode(struct x86_emulate_st
                     s->fp16 = true;
                 break;
 
+            case 0x13: /* vcvtph2psx / vcvtsh2ss */
+                if ( s->evex.pfx & VEX_PREFIX_SCALAR_MASK )
+                    break;
+                s->fp16 = true;
+                if ( !(s->evex.pfx & VEX_PREFIX_DOUBLE_MASK) )
+                {
+                    s->simd_size = simd_scalar_vexw;
+                    d &= ~TwoOp;
+                }
+                break;
+
             case 0x56: case 0x57: /* vf{,c}maddc{p,s}h */
             case 0xd6: case 0xd7: /* vf{,c}mulc{p,s}h */
                 break;
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -7780,14 +7780,25 @@ x86_emulate(
         generate_exception_if(evex.w, EXC_UD);
         goto avx512f_all_fp;
 
+    CASE_SIMD_ALL_FP(_EVEX, 5, 0x5a):  /* vcvtp{h,d}2p{h,d} [xyz]mm/mem,[xyz]mm{k} */
+                                       /* vcvts{h,d}2s{h,d} xmm/mem,xmm,xmm{k} */
+        host_and_vcpu_must_have(avx512_fp16);
+        if ( vex.pfx & VEX_PREFIX_SCALAR_MASK )
+            d &= ~TwoOp;
+        op_bytes = 2 << (((evex.pfx & VEX_PREFIX_SCALAR_MASK) ? 0 : 1 + evex.lr) +
+                         2 * evex.w);
+        goto avx512f_all_fp;
+
     case X86EMUL_OPC_EVEX   (5, 0x7c): /* vcvttph2uw [xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(5, 0x7c): /* vcvttph2w [xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX   (5, 0x7d): /* vcvtph2uw [xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(5, 0x7d): /* vcvtph2w [xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_F3(5, 0x7d): /* vcvtw2ph [xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_F2(5, 0x7d): /* vcvtuw2ph [xyz]mm/mem,[xyz]mm{k} */
-        op_bytes = 16 << evex.lr;
+    case X86EMUL_OPC_EVEX_66(6, 0x13): /* vcvtph2psx [xy]mm/mem,[xyz]mm{k} */
+        op_bytes = 8 << ((ext == ext_map5) + evex.lr);
         /* fall through */
+    case X86EMUL_OPC_EVEX_66(5, 0x1d): /* vcvtps2phx [xyz]mm/mem,[xy]mm{k} */
     case X86EMUL_OPC_EVEX_66(6, 0x2c): /* vscalefph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(6, 0x42): /* vgetexpph [xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(6, 0x96): /* vfmaddsub132ph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
@@ -7814,6 +7825,8 @@ x86_emulate(
             avx512_vlen_check(false);
         goto simd_zmm;
 
+    case X86EMUL_OPC_EVEX(5, 0x1d):    /* vcvtss2sh xmm/mem,xmm,xmm{k} */
+    case X86EMUL_OPC_EVEX(6, 0x13):    /* vcvtsh2ss xmm/mem,xmm,xmm{k} */
     case X86EMUL_OPC_EVEX_66(6, 0x2d): /* vscalefsh xmm/m16,xmm,xmm{k} */
     case X86EMUL_OPC_EVEX_66(6, 0x43): /* vgetexpsh xmm/m16,xmm,xmm{k} */
     case X86EMUL_OPC_EVEX_66(6, 0x99): /* vfmadd132sh xmm/m16,xmm,xmm{k} */


