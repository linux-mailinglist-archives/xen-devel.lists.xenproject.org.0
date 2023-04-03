Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9776D4B35
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 16:57:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517483.802861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjLci-0006XR-B3; Mon, 03 Apr 2023 14:57:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517483.802861; Mon, 03 Apr 2023 14:57:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjLci-0006VD-7j; Mon, 03 Apr 2023 14:57:32 +0000
Received: by outflank-mailman (input) for mailman id 517483;
 Mon, 03 Apr 2023 14:57:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dypz=72=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pjLch-00066R-0F
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 14:57:31 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db14c9b8-d22f-11ed-85db-49a42c6b2330;
 Mon, 03 Apr 2023 16:57:30 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8760.eurprd04.prod.outlook.com (2603:10a6:10:2e3::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 14:57:28 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.033; Mon, 3 Apr 2023
 14:57:27 +0000
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
X-Inumbo-ID: db14c9b8-d22f-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UMX/oiOvfeZBVNHcbouIPbM3AbxdRxjiOtL9x3JLGk1sZoQ9BtjJpE5Rr9HDWw8HphwMd/jYD22Udb1uZTT9LHQPHCKcDFGkW9GZrrPBEJOye87zWjTSqaMi4ML3mO3WGkkNRDojBNk9klh8o5XBpdipMkqKaBjUoJ3psIxWLfCclwgMBSCWf0m2AJOx3lQQ03busDcU4sysBO3Pm3dXGgIkUWiJzqBGIbWjfqV/ZPGjxIyqveHBe3pWZyeBJ0wr1Y1ETOz5ewAsSxVQXM4aKUmKb3bawOvzlzUa+HMGTiUuV6z1+1K6u1HDY7OKR/sCSD2Umt72z49UNypny8A4Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ssUjHs4HRn1b92pvEP2D8LrncOpBCibcR/DS6rD4XMw=;
 b=BrQX8T1/bUH8Xy6WLQ/2NC62yROU8KjcQ9L/LAJtMhbEeqs6NNLPfZbLVVvPpOWAIjv+A5bAtgMblDnQYMhhQoY4FeaE1pgdzAuIUPbxQj6z0h8M4MAsiwvS3ZE+n30xAKBkURPkRbMSjWDmNppuW9zSP7pwAJh6oqK91nH8QqgB33Zp74E21P6dSUPoGTuHbNtAnQBlNwT3C2jiwOC062XtXFb3v0k2iSOlxXHf44sEhwFoS2DWkjcytPmzsakTeZJjANc1Pu+UGFQKDzE2//A2jkWE75WnO67vJjjvsYamHjOQQUTmbL8lTH22hmdi6etigxy4cAWgZZ8V8OAHtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ssUjHs4HRn1b92pvEP2D8LrncOpBCibcR/DS6rD4XMw=;
 b=o5RVHHfqLGXbNMPqfLnyNN0oyTzROtsUC8vJyGyf6I1/oqrpgn2UXeQJpzoAc3gdVG6sEcd7+orQ710AJxrlvEykaRppSTtozKRPATsTKplIVw756v+NJj7bbK7vG7XwTdOklFxMTw7dsmYo6SHSyLuR+LjhPLTMD6n4lZ5i7YdLzgq7MLaWGpFGjo+ok84vcCiLTLToJan1tfZEjeridVjxpaXEgftc383cJ1wjTXB82hPvpHrKfeHNj2UA7jSY184MpErTds2U8azJEFnAXbpRloRMKzZTujJxwG5xT6oW2YwiM5VDHnlQrIA9+nYnIn9SFxUlWe+U0tFmE8YfmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <111f6a32-0c2c-f586-f599-dd0c4451ba4e@suse.com>
Date: Mon, 3 Apr 2023 16:57:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: [PATCH v2 02/10] x86emul: handle AVX512-FP16 Map5 arithmetic insns
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <8cbbab55-d670-5632-30ee-3e8ca352f048@suse.com>
In-Reply-To: <8cbbab55-d670-5632-30ee-3e8ca352f048@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0178.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8760:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e6ca9d1-9c36-4c89-1486-08db3453bdaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MZl8oLiU2OSkr+EBCj64noQekDKaqy6rI5lW79mgjxOjZiF+vWhovzGbIYH2TXVCsNuG8Wj/pMJAzLvWHmkJLYxH9jx3Jbxz/q9DY7RiL+dIQqT4FQu1KB3kQSDn2pYsuJvmn0QVsRjX75lh432wsNbtBaWTEoV6AwI0olPVrf8sr3LZzACccakHLipARDvttiEW90cfH+HJ2cAx6NqgOJNNGoYZxTxBSGN2Bs/HtCIVIYEkFcke3IQy1Y2jOGvFyIoZsNWS9mNdiIKrVAKASqvUQEoPYfLYO8FgkkdeDL688PihN1Z18SoBJW57zS4K8CBTpUsPMCNVKiZZ+TPKAh6ULzxHoZejm6XKqtp7RhlSrYm5PpGNr5Oafia0FCVLjC54CdQ9FhQvm95tnS13lFK6LY8BrBz3hyM08dECWDvmjz7+IiM7drhkBPyWhgmu2F94bG6H61ZIOUeK6zzCHfSVGYkg0qlCkIEK5uJzGxBFngWarfATIFm/Qq60Cus7AsK4jJOKsW84qzNvPEF7HiiWZ14CWXbHwBUTCbKljGGHQ7T8vgsRbeD5YSk0kmJE6ln1k0iqexzt3nifkzTs9G6DSv84B3MUxv/VZWZGVd9fkM+kuJlt1dwyG7IF652O/jzhI8fw6mFT3+wv5CgRag==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(136003)(346002)(39860400002)(376002)(451199021)(6916009)(8676002)(66476007)(4326008)(66556008)(66946007)(478600001)(316002)(54906003)(8936002)(41300700001)(38100700002)(5660300002)(186003)(2616005)(6486002)(26005)(6506007)(6512007)(86362001)(31696002)(36756003)(2906002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cm5FSlBNZGE2Q0R5MGFaK2ZKZlRMbWZVeGlramNFWnlhNkxhczhyQnMrVFhj?=
 =?utf-8?B?ME1VMWlXdmRTUEhxRG9NOGNnQ3dnVnpQYnVoVXZTeU85UjVXaitCZGViODBx?=
 =?utf-8?B?KzdhTjB5bGdWQm85UVlINUpmUjErVXBWRmpsS3NRVGVnblltazVsSEYwYVo2?=
 =?utf-8?B?MHQ5cm15Q093b0dMRnppelRkMUJXTXU2cmlkNmJ1T3NiWWJTeHkwK1pYTEhq?=
 =?utf-8?B?UXBjVlVCcUdSQ0Mwb3RlN3lLK3hVY00yOHZrZk51OWluaCt3NWR1S3h1NHBV?=
 =?utf-8?B?VTdVaHhRM29Vc0o4NlhFS2p5OWRpVUh2Rmk2NHRaRHJvVEFvMlJlamVEOUxJ?=
 =?utf-8?B?eXZqMitkTnpLMkJ6RVVtRkY0YTlyTlppcCtPdi91VmZRZlYrZDBSa2NXWTZP?=
 =?utf-8?B?YUlnWlYrUGNpUVJTNTNETUg3VnZDVGVGQlRiRUxYWU9rM0dIb011S2ZiU1NI?=
 =?utf-8?B?UWFJR2RYNGxLVFRTZy91V3VJQjVWK0p4bjMrcjYrVDVneS82UnVjWnhJbmhH?=
 =?utf-8?B?UHNzWUhVeWhIUVpGZVpEWTVveGFvUlVFemhUUnFEL0YyeHNUWThyTjZkano5?=
 =?utf-8?B?WjNLWUxHdGQ2OUNkQjE3V0Z2cTdyU1V6bVVjMitYY25rTmMra2Q0eVpTNzFu?=
 =?utf-8?B?cHlKeW1jY2gvaVhVbkwyYzcvbFlQVVBORW9yMDRENG1Bc1JsOTVXTjRDVzlw?=
 =?utf-8?B?alU2K3IrSStVWWVHVlFEU0hkN05YQkdQUStGdWYrNDY2QU0vYUZqMkhRQXNL?=
 =?utf-8?B?dElnbkVPY3c3b0tNTHlWTEthWis5VFBRMytwMHVTTGI2OUcxUkwwbEdHQzZQ?=
 =?utf-8?B?Z3BhVlhNdWo1Ung2RWxyeHJJTVh0RUJNSmhhVFpBeWVpN0ZPQzc0S20vbFZm?=
 =?utf-8?B?Tm5PMGpjaTZrNkxRSGxwSTZDU2NmaTdmZk8wSDhLd0tmVWFWRndUZUZsVXA2?=
 =?utf-8?B?TlNUZGlEV0RWckVhK1Y4VTNBVWhEVzJZNnRyUndrbWxac1Z3cTRwSWh6OEUr?=
 =?utf-8?B?dGRBV0hNclpmd3JtbHk0Vy9YbHZ0WDNIQVgwdXNjNlQ2RmpSZDQ1WG9KNnFV?=
 =?utf-8?B?NHl4NXIxMGExcmFSV1NzaFBNWVBNcXgvaDRPMVRUWjJxYnJLYnlObTFwZksr?=
 =?utf-8?B?dnRlVmFCMWIxTlRDeUtzOWRHOU5FMnVBYUZ6VmxmNjZ4Qm9LTFVQVDFhUUN0?=
 =?utf-8?B?QWRDbXlOc0NCcCswQ1VhWlkxSWpIcjJuK0Z3bklETGJabmJnV0NvODF4WVYy?=
 =?utf-8?B?QXFDVU1lZnFRdUJlcUxGL1c4amI5NFZiOEsrZ1hqNTJBUkNzN2FEMkVhYmpV?=
 =?utf-8?B?L3lVeng5a2ZsUnZWN1FJNWZVSGVta3FMcXh2VmgzUXpuakE5UFJDNTZXWlVZ?=
 =?utf-8?B?MEZhNDVSckQ3V1J0bUxaZGZvNkNiMVB6NWg1SGYyWWI5S3ltN1BxSW1YWk4x?=
 =?utf-8?B?d3Z6S1R0aGF3NWxTdVRUVFR4WG1rRXZlbEZTMko5bnJxVzlNc1ZYUUNQdmEv?=
 =?utf-8?B?blk3eXRMazE4dkF6YVphWFNxc2RGSmE4QitNd01FMHlVVEE3YzVoaHNJM0h6?=
 =?utf-8?B?YjhZNzR6SzEreTRkN3NVMFcyNE5BdHZuekhpTkEvcExSSEtSOEQ5Y3h3OFFn?=
 =?utf-8?B?OUE0R1RJZmJCeWcvS2NGNGJLeFdiaHZVRmlzdEFqeVRLT3Y0anZEOTBFZnhW?=
 =?utf-8?B?cE1mRWdOeWYzTDNqTmpJRVJMTHJ1NkYray9CSWFPTjYvWTFhYjBuU2FCeTdw?=
 =?utf-8?B?MjYwQnN2bFFUdXprQU4wcUJ0RHdRU0dwQy8vL3M5dE5VQmc5Q01CdmdRZDhk?=
 =?utf-8?B?cUtidUVCemhxazJMYWJzckpwbjdaUy9Oai9qTWRtSVI4aGt0cy8waElvbCt1?=
 =?utf-8?B?NnNuYmcwZzUrK2d0czhOeHFFOWU4UGVUbkZib1NlTGF0clFOcGI2YWxuR3Yw?=
 =?utf-8?B?Z3p2bCs0SkdVWFZGZlhLNFdGVmhYTjduWkdaUiticTd0V2NYbmlJQnVPazRP?=
 =?utf-8?B?Z05HNDlJcCtYNk52bmxVR212MUNyQmNZcVpOam1ZNStvaFN3RStNZkJVaGZr?=
 =?utf-8?B?VnMwbUtjWXJsUVJBQmhINzlVOXdmUm5yODc2dFc2V0V4d0lIWWdLU2U5N1J3?=
 =?utf-8?Q?3vM0szKgt2TwLvoJNt+Wv3XnP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e6ca9d1-9c36-4c89-1486-08db3453bdaa
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 14:57:27.3441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: no+s59NY7tbs+KlkGZaWRTTg5bS6SZ+QKvVAYQH7a4jGr2EGzAhKY4kRg1FimUp9XYHgDcCl0kw4pEcFvsR65w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8760

This encoding space is a very sparse clone of the "twobyte" one. Re-use
that table, as the entries corresponding to invalid opcodes in Map5 are
simply benign with simd_size forced to other than simd_none (preventing
undue memory reads in SrcMem handling early in x86_emulate()).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Add comments.

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
@@ -1219,9 +1219,22 @@ int x86emul_decode(struct x86_emulate_st
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
+                        /*
+                         * Re-use twobyte_table[] here, for the similarity of
+                         * the entries valid in map 5.
+                         */
+                        d = twobyte_table[b].desc;
+                        s->simd_size = twobyte_table[b].size ?: simd_other;
+                        break;
                     }
                 }
                 else if ( s->ext < ext_8f08 + ARRAY_SIZE(xop_table) )
@@ -1443,6 +1456,25 @@ int x86emul_decode(struct x86_emulate_st
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
+            /* Like above re-use twobyte_table[] here. */
+            disp8scale = decode_disp8scale(twobyte_table[b].d8s, s);
+            break;
+
         case ext_8f09:
             if ( ext8f09_table[b].two_op )
                 d |= TwoOp;
@@ -1661,6 +1693,7 @@ int x86emul_decode(struct x86_emulate_st
         s->simd_size = ext8f08_table[b].simd_size;
         break;
 
+    case ext_map5:
     case ext_8f09:
     case ext_8f0a:
         break;
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -195,6 +195,7 @@ enum vex_opcx {
     vex_0f = vex_none + 1,
     vex_0f38,
     vex_0f3a,
+    evex_map5 = 5,
 };
 
 enum vex_pfx {
@@ -223,8 +224,8 @@ union vex {
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
@@ -249,6 +250,7 @@ struct x86_emulate_state {
         ext_0f   = vex_0f,
         ext_0f38 = vex_0f38,
         ext_0f3a = vex_0f3a,
+        ext_map5 = evex_map5,
         /*
          * For XOP use values such that the respective instruction field
          * can be used without adjustment.
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -3756,6 +3756,13 @@ x86_emulate(
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
@@ -3768,9 +3775,11 @@ x86_emulate(
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
@@ -7736,6 +7745,20 @@ x86_emulate(
 
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


