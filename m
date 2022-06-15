Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B08D54C613
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jun 2022 12:28:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.349925.576133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1QGQ-0004rA-C6; Wed, 15 Jun 2022 10:28:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 349925.576133; Wed, 15 Jun 2022 10:28:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1QGQ-0004pE-8p; Wed, 15 Jun 2022 10:28:42 +0000
Received: by outflank-mailman (input) for mailman id 349925;
 Wed, 15 Jun 2022 10:28:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=56zs=WW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o1QGP-0004ln-Ho
 for xen-devel@lists.xenproject.org; Wed, 15 Jun 2022 10:28:41 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20613.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea4b0d04-ec95-11ec-ab14-113154c10af9;
 Wed, 15 Jun 2022 12:28:37 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7332.eurprd04.prod.outlook.com (2603:10a6:20b:1db::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.13; Wed, 15 Jun
 2022 10:28:35 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.020; Wed, 15 Jun 2022
 10:28:35 +0000
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
X-Inumbo-ID: ea4b0d04-ec95-11ec-ab14-113154c10af9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vv3uR1Z8PmkV0s3l4DeGVDZAtNjgJsQsqYSGtuyHvKBoMDDuv35rizHT2qTPTORTNmsV0ToMhVXaCrww9ak8qgcJ8M8241uFwEjniUlMe5d3329dKGoK96yZXz+prGAAT5nf6HSjFXcCKhTXXI3sGQCYEWyfZIjUXLTb/wx7lUpsf7mMn+VEfYLNUSCXT27+awNVNt2Ll8FN/i5F5lkWDavzMkVxknvdbnB12gKoun6vJzgcSq8wZd6jg2+66XfZLkZ3cz7uN4J7heYnB2tOet0KPmfNaQGChuCV7iOiyyUUPhZU+7T/wZ/dQEtGUQsVq4ynXMtzktGCwUSh+d3+8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X56RGauel3ny1RfLPnM3lAMmDmDld+kl8ioALSznTgc=;
 b=da75xEhaJG0HO6/QWNl0CBBjWS5LOUy4wY6VqfEFN1/R8pI3X7Bp6d6OK36DPSE95qINflheGyNVlU7sYc99pAIcd86HDDVr/UmhTAUheVniDPLz+JpkKrMuFBE3xtPcJZvnlfdnfaj9BZ9KOp028RiY4AjiU7fGqHrLzIrgGqkRGlOgjpuR2N1TseSLebGN3zj5GnIfMJPZm4bamZgadKfXT8WPHcs9b1ojXIGLJEAmFIWkqRv9CX64Ef6+VXPZZV9jC9BaNilcdjJjmneg1aEwRA7TbS7VJRiGq+sDar4gwkR4jvM1/YAGlBRcsA7ARLtrkAnRsoxMuW9qvkZNwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X56RGauel3ny1RfLPnM3lAMmDmDld+kl8ioALSznTgc=;
 b=MykJ0BW3lS2bIMxe16Mua0aFUZBiOt6fZ3a7kjrdqG0PvlIDRhFaxQkJ8m52AX5RQiXylKlw+hxZBtfTWO4sBBKwOGvLsrFqO2ct8fimfcagQFoa6K23az2uhMfLagBPhwEx1vSCAMARUah1Mz+h8JQ+VJtjmFIkpERT17pGuh0ItiurXSFg4+LKiqksgZFNgoTwRIN6wfyUoJwVPxsUTp3wThSbKG62FYL1PL13Hd2CFETXgL71gwLzsK/ZQ+gc9HemQ80YwyoSAfo0P81WBc+J6w6d49K3JsWtCFpPa5yUlebrnGEWAblbtOcT7B0QktOUcY4ELAv9gm+CplbKRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3e7f95f0-fded-74e3-d4b5-da185a7ab8d8@suse.com>
Date: Wed, 15 Jun 2022 12:28:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: [PATCH 04/11] x86emul: handle AVX512-FP16 move insns
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <9ba3aaa7-56ce-b051-f1c4-874276e493e1@suse.com>
In-Reply-To: <9ba3aaa7-56ce-b051-f1c4-874276e493e1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR0301CA0025.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9bf93028-4b83-46e9-6c35-08da4eb9cdb6
X-MS-TrafficTypeDiagnostic: AM8PR04MB7332:EE_
X-Microsoft-Antispam-PRVS:
	<AM8PR04MB7332FDE222FD6F455F7580B2B3AD9@AM8PR04MB7332.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6d4f184XJ04WAAMYZ3LdVFI3SK782RBn7U9GuILlAM7t8H9yVZ+41wi7qc6uq6CTvbZei0IV1kMz4W5A+cN8bDU1REstvIloooQdJLHMcLtFjBgBOJB1Wif5vEY95rbNYrtCZqr8g6tv1xElYpHRCrVBrrVyQivzQqQmO9qOQbJKUMPo8r+PBl+BBFz0YKT6h5x0rqpfvwEUVyjgRQClm1uB0F3JAl1wreXMBrcte8LNav+oz4PQB+Turdb+WcPt3f18jEVnmv1W0MveJw6jFgYsI4HonOoFZz8Q1vGbvZ99osqbaoP2NITsKGXL9x5oXOtQZhi8ydLytkdUY3nFY4O8RecUluoLiwQEMsu1bQjVanRgM8ZRkoK2mBCBNyTqr+K3Poa6mEiwtKYf7ihlkWFMg2YtNPY6B74tOc/q+lxDtY0F4f+tL45Bo5y9vV2elLi2Bo0Zkp3yqN5GqViCb46a45kQ4HsO4Cb2d1YnyYlegM6j7045/5rl8bNg8scgnb+mN2lZR1utqs1Y69WpR+48mHl1Ju7QIe6+EjGdMqx0eHvM2aZhfjv5Qj/gVJ11bs/0WZeR1wSTOBfyUcYfK0M7D1OTns+ka2exrPXbCTzcWBIQB0LAj7IcBPUYxu3MjWKp5O2TFfYVHc9OSc5il02+tp27SIMIT2Y6e7eb4tBewAhcli73JnEFUONqcf1L2nR0EzeaRbVgVVT8qH9D7A3w3h0uNver6X9ojVraUeNmBfeRyt8+TNonejpRv5sE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(31686004)(6486002)(316002)(36756003)(26005)(86362001)(31696002)(6512007)(186003)(8936002)(2616005)(6506007)(38100700002)(6916009)(54906003)(508600001)(66476007)(4326008)(66556008)(8676002)(5660300002)(2906002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SS9YS2dGLzZieW1BdFcwQXFCcHZVdXNTWHNVaWZoZGNTUkRVVnBHb1JMWVJB?=
 =?utf-8?B?eVNZR3E0bGpRcTVwanNDUmFPTmQrWWZqekNndElVd1NPeVdNWXM1VEx5NENq?=
 =?utf-8?B?VGZNWUN2R09kNGxNcUpmNlQ3TWJDd09PaUhJZDhrRklWcXBMSU1MR05kOWRs?=
 =?utf-8?B?N0FjWEJTaGsxTGhpZjhXK1N5M1IwYjduR3Y0cHJBcCtPbU44RE13SVAwS0lF?=
 =?utf-8?B?ajJKRWdaQk0zYkJMSllGR0NKV1ZSRUQzNnVtV1Jvb3Z0MkRpaEMyZ0k1a3ZL?=
 =?utf-8?B?aVhEakpKWE9zZUVWT09KcjNZSWJIYXNpL2FxMG53WjBvbDVTTWhsZGs3WkN3?=
 =?utf-8?B?dmRaS0xrTm82Tk5JdVVFNjNlZXExNlBmSFljV1FJSWJEVDF1c3RUcFQ5ZHNK?=
 =?utf-8?B?V3hRQzJzSG5ydnVYYnRVZlU2cWNnOXVJSFFsQmx1aDBHaXBDNkdNUU9YcEJz?=
 =?utf-8?B?Q1Nid2NTazByREUvYzRYbDlGT29pYnRuS0NxWTNYZk9JdjFhblV3a01MeGNz?=
 =?utf-8?B?bEdyR1dNbFhTVnV0R3k1ZE02aHkvaytmMVRTQk5oSG5xQTRveStmNWU2UC9v?=
 =?utf-8?B?UUNDdTk1TUg2N3lTTVJrZTlMY21Xd0h1MytFdTRrTlRsUVhvRDBhNHFzbVBD?=
 =?utf-8?B?a3F4eG1FcHVzWlJCS1BmMmwxNVZ2bithOTZ5TGJvRC9mc2cwSXRtZjZIcDYx?=
 =?utf-8?B?d3grVWc3Q3o5bEI2a0x3WC9jb2psNHVkTW1nd0RXbmdNWThBeHZSeEt2d2cz?=
 =?utf-8?B?dG01eHpSU1pKRFBxNDlLek1xU2t6TEpKZDhkREJQbDFFZVJmbHdJZElhU3ll?=
 =?utf-8?B?ZFc3b3Y5enRqdmJKcnRHbVFFeWFpSTV0cjh2RmlmUzVBakg2MERvVFE5YSti?=
 =?utf-8?B?MjVXazRuaDArV0RORlNzeGpOY2laMGlZeE92ZkJHaTJ6dVJFME5wRHVEWlQ1?=
 =?utf-8?B?MzZFNzl6NStsQWpHcG9LYittT01rZzRKTkFYVURuSWpXY1pBWGdtTGtDeDdV?=
 =?utf-8?B?VnVSTXc1MHNIdGVjRzk5c3B4ZmVyVlRIdDAyc3FXMVVVRno5YjFac3Nud01m?=
 =?utf-8?B?OGoycXo2SkJ6RHNvcWdPN3lGdVA5VWxBd3JEQ3YwVHltZlVjRG1kMzB1OHVj?=
 =?utf-8?B?Y0dueFFMY0xLWitSNmdRSGxFZE82UlJraDJxRVpIZUtBcGc5ZVp2a01Tbzgx?=
 =?utf-8?B?cjk5dFhyV0E3NlkveXBNQ3Y4cm5acjZjUEJzY0paZGlkYmhGNG5DeEtEVHht?=
 =?utf-8?B?SlJBQUdkQy9XcE81NEl6b3JDOXNxR2gwL0tIV3duLytabDRkQVg4ckNlcXhQ?=
 =?utf-8?B?bkNvZmd6dCtoUnFJNE9ZZTkrRDlXQUNtRkJMZW45UzAwdUpqbmR6OHhCRG9v?=
 =?utf-8?B?Q2JqbGc0UDREbGtQeVpXWFBNdkZXRlFLOXY4Wmh3M3lWYmVFYnlwSjJmZFho?=
 =?utf-8?B?SGRvYlgxc1lCSk16em9zZHZYb3RNZGhmaHRiWmpRQi9ma0NUR3Ruc0ZpMWQ1?=
 =?utf-8?B?eVdXd3NOdFYwbWNiZXlncEZkYzNkUS9DaUd1RE96S2xCc3k0QWdETHRCMERV?=
 =?utf-8?B?RDZrV09XZW5xazhDZHBXa3JOVWhQZEs0azJhUEh5UE03VFRWQXArV2FtVzY1?=
 =?utf-8?B?Vi9sMW1qcVltSDBnRSs4LzZUUk9wNjRBcTR5ZzFBM09PbXVKUmF2VlZ6MU1u?=
 =?utf-8?B?Q3VBbjFFMVRuZnhCeXNtS1hQZ1h6WVdEM2VIY3pBZUlWTDJJUjlwNld0Z1J1?=
 =?utf-8?B?RVJndjBiK3dsOEt0cUxySlRRYXFIc0xCblJvL1JIbElvUTRwT1BoM3pHK2NU?=
 =?utf-8?B?R1l2Q2ZyU0dhR2M5Z0ZSeWxDdDBpaHpBeHJsRkQwem5LWWFvMTduUDJVV1FE?=
 =?utf-8?B?LzJhUXNWT25uV29rQUprbTJJZy9zMVVET0UycEJjd2NybHFUWkRKRkd0Z3RM?=
 =?utf-8?B?cUtsaXlHbG5VVzNTR3dQUzhURThhSS84VVcvVS9kb2o0T1J5R2xncEZESk52?=
 =?utf-8?B?eVRoWkVJV1lTbm5wNDJXbVZkdFl4SnVCeXNtTjhXTDNBYWtsWTAvTUFDMFpo?=
 =?utf-8?B?LzJZVG4vWDhQS1EyNDF1ZUU1WVY2dUQ2Tzg0L3R1Rjh4ZUVRQ0RSVk80a0Nl?=
 =?utf-8?B?blkrU2IwMTluUzlPZmRjeFJ1RVpjOHgwK2Rac0NzWVBpTUVIY2MwbS92SUo3?=
 =?utf-8?B?RC9LY1FCeHphdUFlS2NXOU9CV0Q0Z2RJeWF0Tks3NkliVXNtWWg5SHM0T0ZS?=
 =?utf-8?B?WVdjMVY1ckwwNTlRRDN3c1FuQjJBby83UFByRzU2OWI4Y1dlTWVpcXhmT083?=
 =?utf-8?B?OE5SNTFFdHZCWmZIZFo0N2xHK0xocmxQdFk4MzNic3IyaEltM2tqUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bf93028-4b83-46e9-6c35-08da4eb9cdb6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 10:28:35.4953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: emWtnPt9iLE+5rAoDeC19MCvSZoVgrjMlGqZrA9tH//D4UxqQMiMSV7WlDad8l+Xxwkk1t8P3zA3ToQ2FrMSTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7332

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
@@ -5137,6 +5137,76 @@ int main(int argc, char **argv)
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
@@ -1465,6 +1465,15 @@ int x86emul_decode(struct x86_emulate_st
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
 
             disp8scale = decode_disp8scale(twobyte_table[b].d8s, s);
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -4394,6 +4394,15 @@ x86_emulate(
 
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
@@ -7747,8 +7756,18 @@ x86_emulate(
 
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


