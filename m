Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 980BD54C62A
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jun 2022 12:31:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.349952.576178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1QJ8-00081W-34; Wed, 15 Jun 2022 10:31:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 349952.576178; Wed, 15 Jun 2022 10:31:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1QJ7-0007yS-UY; Wed, 15 Jun 2022 10:31:29 +0000
Received: by outflank-mailman (input) for mailman id 349952;
 Wed, 15 Jun 2022 10:31:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=56zs=WW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o1QJ6-0007gz-G4
 for xen-devel@lists.xenproject.org; Wed, 15 Jun 2022 10:31:28 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on062b.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4eb47bed-ec96-11ec-bd2c-47488cf2e6aa;
 Wed, 15 Jun 2022 12:31:25 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6876.eurprd04.prod.outlook.com (2603:10a6:10:116::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.20; Wed, 15 Jun
 2022 10:31:11 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.020; Wed, 15 Jun 2022
 10:31:11 +0000
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
X-Inumbo-ID: 4eb47bed-ec96-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EvwiM6N8HVmwTxiIQoHRpvSK8v76sNx61DemjfPJXfGBkHPlwOY7r+TQFnQMjrwGA8+H+l6O15fHtM/atjvoknZs6QFC1cj9sM2SWsN+LRDsrTR+xa8AYf1whTZ6PopL2+xSpYmlL2VJLrwQkTIUkLK7wD3shomNMQV/EYlaPrScn1iMt6dFOit6ILiL5LiugkgIyTbN7IqNxEO0TKiiiGc9dl8t+0iV3xSpmVsM+0Xv8YVgINl+qUEhlcLqOE9COLX+ttiD9JJlUCkT1CObChAL/wdcnYlAKsDOv8fmaX/KmncPPDHIoWHopGLjFwJIqRpUyomw70EdE6DlET28Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=72avtIJigMrJ/t9S9LNVdKFGNIXvlVkWO5c2zIOjy7c=;
 b=ZqTHbFdGBDATJ5lryi3tsw/74ur0CLsmgtOjdhth2+LIUNTjH3mj3VwoUBkKvKVSMxkpNecCMc6NdqqrxqTda49qGygkReGgVaDDfxUTSOtDUDIxmw2NA3w9NFYdRjo+xS4aKyOQk0bVyZzUL8R71s0Q7G1POINrQqwTs3jSLlrjXYI9fFflqdDsn/bwR4Ws+A8o6pOdvjS0Pz6qADhZ5PSs/KlGA/0OGvNePGY/0QVpYB/C4JE7mGSTUeGLZVFRYmst6jlT0DJOvS+TdLrFBgAmh7jo/5KdVA9Qv+0RrciJladYkHtV1JmPz2MRgiSMTowhjFFRW6sljyUODBZ59A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=72avtIJigMrJ/t9S9LNVdKFGNIXvlVkWO5c2zIOjy7c=;
 b=Ho20m5UqcMFYc8glAAesLdknesp4AZFzPE9puhuR8GWOicdhA9zSwk0ENheOhGnzQsAqpJnEff5viSMSuKCQq9MRsQd0v2GO2mi/rOhawwqR71kJI37o0cq0vvkLgfaFQVD/nwt2ocT6NzGmEoYos9lrV6y82jYSWd7GaynWOG2j9TIlSOzTsANboFFSOYa2XYMRf2szlWrArlFqhG4zUQZLA8xYhXbcAL2N/2ganBg3UDfw3fYN7CsIJSK284ocpypMCDJAN4rfipUjBE56ssviOBzMNj33V6eb0PIQvCs25S+U5ONAY1uyIXJ8oA/IqKdwCBV50/IRmEo5PJ0N9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2f99e91d-6a91-f860-45d0-9c8b67c9b2b8@suse.com>
Date: Wed, 15 Jun 2022 12:31:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: [PATCH 10/11] x86emul: handle AVX512-FP16 conversion to/from (packed)
 int{32,64} insns
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <9ba3aaa7-56ce-b051-f1c4-874276e493e1@suse.com>
In-Reply-To: <9ba3aaa7-56ce-b051-f1c4-874276e493e1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0177.eurprd06.prod.outlook.com
 (2603:10a6:20b:45c::34) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b40be030-3b1c-45f7-64ee-08da4eba2a96
X-MS-TrafficTypeDiagnostic: DB8PR04MB6876:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB6876ACC5098E76DCD0B4879FB3AD9@DB8PR04MB6876.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HpyGpaQG1k86byOWZpbOIUF7cv4TuO/y5yO2L0RMSKuaP0wjCvGnjrGhtvk/g8utz9EhGBOInDbxNVVvU50YEpjpONi2b4M86gLKyaeyuNdVmKi5TrRVWxFzzUszGeSBbaLo+ipTm9G1aHHPp23160EPehX5xHUhJM2HHWycqZ3BTTfpYHEea50BHi01QqbTJUuIBMSMg+w4Orqpio43Bk+ZqDDT20NnJft4mUWiiwOywH3Y8HNIrSbeyyYQqYPGwIXzlJm4uPWc+b3AH04vo3nHyFshDShsEWOF8JnKD3xECbJlpyToa+agqkIVtktOEnHj6OXUe8wFGcBaz0VQ9dSaz++25vA3FRNerPChlY6/UktbpQVobbD97r3sC/8wAPgxyIXOdKTaXjuY9326t2EC0Wf7C3F7kvnH7zuA+5YmV8BlYjr6v2e0yZ1a0sBZy2MxyhekrIdXbAyBhi9L1sDDWQ/Kty1q6LcRA5DiFY75uQI1gT+GbLVmZ0f6r9z6eGocj2S2kXuWtXk8bV85Z88LDypTEocwK8/oF4UL99yrkD360NjNyUueZW2XqavERcerGK5t92l+60zWb/eddMVm7CDA0X5i4exGPYVxSQ47SOyIFZ3m1GAsWGsRLBMFXkm90NCEf6H8t/jAg+b8JPsEALV7ZvmMYUz9O5O7i8MtKZWL9hI6wPx1vGC5QX2wVal+SXqxiBzlC952bQXJqynggp0FEl0tJYjv2IVF8/4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(6512007)(66556008)(26005)(54906003)(5660300002)(6506007)(316002)(186003)(2906002)(31686004)(36756003)(508600001)(6486002)(8936002)(66946007)(86362001)(4326008)(8676002)(6916009)(66476007)(38100700002)(31696002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2xwcURieWxDajd4L21PZlA3SklNQjJKUDFQZmJCbURnZ3AxZGNrTUJERGQx?=
 =?utf-8?B?VElhbW03NzVMME5VN0UrRUpqNkFjTFo0M1czaUQyMk50dVRDak5HWlNBU0p1?=
 =?utf-8?B?Q0o3Z3ZBaFRvWnZaTUZNbEtGaWtrdU92OURtMjgzVHRYcE1NWTdlMWdZNWNQ?=
 =?utf-8?B?VkpIZTI2NzNja2VEU2hRZ3VoTGh6R01ibHpFd3NMOTZ2Y3BSK1luKy9leUlY?=
 =?utf-8?B?ZmxvRklSdU44UzRXeENsYjFLdlBiL2FGWFF6c05tcVhHUmxkanA1ekFoQW44?=
 =?utf-8?B?b2RLRHJITUJvZU1FSHgybWJ5aERid0FmS0pDQWlDVTA3cXE2YTE5NlhXZndS?=
 =?utf-8?B?OVNPaDVqYklnamZreTdKYUlCRXd4a0twMkNhYlNkQTRnL0JVKzRBcDBNdXgw?=
 =?utf-8?B?dS8vdVpSajRtcDJDTWhDYWJhTlFhS0JxQ1h2ZGxYakVDcUdsRXJ5cWtmN3Bu?=
 =?utf-8?B?M3A4SlVhdDN5eUVhc2N4M1JOR0NFUkxRWDJUSjRmTW5WVU14OXMzbXFKU1Zq?=
 =?utf-8?B?YWt1TlpmaXNoaW1PUWxnNElDTWJ5dTF6Z1MrQm9qbFk0MGhCOFhUalU2cUZV?=
 =?utf-8?B?YWE3UDgybTdEUWxyQy9jNlJOMlZ5R0RXbXZkYy8wd3AyaWdDbHlYZ2h1S1ZQ?=
 =?utf-8?B?UHAwbW1PdFBNSmNEZVJCcFBhdkxJZEFZTG12WEp1NS9YalNhSUZUSUZqVHNi?=
 =?utf-8?B?NStYdGFRS0NPTURTTlpZOHE3UGJnWkJhZE5HdFludW9velhXQi85bCtNUkE1?=
 =?utf-8?B?UHJYRUJ5SXZDVHdrZmd4a1E2RVBCTURBTWljbGdwVGc3bjZ4QVg0QmFQSzY4?=
 =?utf-8?B?K2lFZzd6R0hLREM1TWRJOTZwOFdRclpqRTdzbXFJVVVaQndLejFUUFBJeGNR?=
 =?utf-8?B?R2JmeXZUVGVuQ1ZJY01oWk1wb01kbmxKMXNJdDVyNXlsYTRWZ1JxVXE4cktl?=
 =?utf-8?B?M29SQW1kNTR2UFZ4MVpWejU3VTNPcXZpaG5UNUlFVzFLVm9hbk5pKzc2NHdJ?=
 =?utf-8?B?ZE9kQ1pLUVZYOVhRYlAzY0JESDhUODJ0cERNaVRjNHlITmlOclJZYzBMekUv?=
 =?utf-8?B?TGRETWVucTBQSVQ2TTFVbUlvM203azM0MjNnS2NoaTlDWDI3bW9TS0laaThi?=
 =?utf-8?B?aUpzZUFPeXZkMUtwd0ZTaENGQ0RpOG5Md1R1d3ZTY3dtSHdjSzF0TlZOd09Y?=
 =?utf-8?B?QXhzbld2Z1B4dExpTlovdFpScVpST1ZuY01ySDREcEpodHdoWVFKWXVmQ0Fm?=
 =?utf-8?B?QVN3aVFMZDdNbTRmSWlyMlZxYXdOYTBzOHRNTE5ZNGFjRW0zT3B5LzNlaWtv?=
 =?utf-8?B?MHdySjZYQi9lVmRHenpHZVh1Y2Zwc3VZUXFDaUJsSDlYWCtTMVNpYVF3alJh?=
 =?utf-8?B?dCtlNk9INXpOTXVZbG1jVTByaEdjRlhZa0tYL2M3bExaZjVIclZWQjJPUERW?=
 =?utf-8?B?TFpjL013S0tjSEwvZTY1ZVh1NDBKKzAxYkIxRHk1UU9JZlY0RUtWOWlWejNS?=
 =?utf-8?B?VkVqZXVyWENldFIxSTNmWTFUc3gyNHI3a29DQWMyenNOeDhpbUVPRU1PeGZF?=
 =?utf-8?B?Y1NJYmFMaE1lQ0p0K0xjSHhacnRJK1NSVjREZk4zMHZNQnVPNDdXWm1BZkts?=
 =?utf-8?B?bUprTWVGUjJKMEJWcFduTllhZUM4OS8rNUtGL21sNkVsWkwxelVNaXN1eHUy?=
 =?utf-8?B?azJDQlBoMTJ0MWVzUEk4dHdPVGZaR3VSTllFOExKU0RpZE9lRURjR2I2V2k4?=
 =?utf-8?B?NjVhTlZheENiMy9NaDIvTFVLZjFaQStPMEZvWGJmRFdaN0YwRjgrdEhzSHpr?=
 =?utf-8?B?Qm9UOUprNU9QNXNHay8xTUhJRzVWc0tyUGNBdmE4WHQ5N2swYVYrZ3V1Yzl4?=
 =?utf-8?B?ZUN4YS9ZVlBGQ0VYWTlWM2dJVkp6RWZLQnczSy9HQXZtTzEzV29uS0FlZEp4?=
 =?utf-8?B?QzVMR1IrSHBSZnlCUTNJZ2E1Wm1vbXNIZjlmQmNwZGF1dGZJaENVZmpwL2pS?=
 =?utf-8?B?ZEtmSWpQcXlCRHNEOWwwbmVKTDBadGZ6amF0d1ZXaCt6eVYrUEdJV20xN1do?=
 =?utf-8?B?L0tjQkY3akgzQ290eWxwMllSZEdmTElYc2c3UmlWNUxyL0Yzdm5hSXJsN1hC?=
 =?utf-8?B?SGd0ME14bTNvRnZVdG1GQzFYMTQ3eGJPc0JUQ2lhOU9tcE5Jdmc0R3l1TC9I?=
 =?utf-8?B?dkdnNkl1Y2duaDViak9XMVdibUZodDdtSlJqQ1RCQkpuZG1wYk9ybGNHTTlS?=
 =?utf-8?B?clh3SUtWbkY3cy9RUnlOSjkyRlRsbFRBcm1NLzlYeTM3MFp0QjUzRWttQ1JJ?=
 =?utf-8?B?Y0JnenUrWFo3Q1VuV1BwSVNSc3B3aXg3R3BQMThoM21obERXWEp3UT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b40be030-3b1c-45f7-64ee-08da4eba2a96
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 10:31:11.4229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AxjTwJ6iXyCayFDYrKJR/1HEXoLcFjwEzpiP6JQgZ1cc+U0FDlgWs2M6jc/orN6mnBP2aCEqAXcEvswPRO2fHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6876

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -612,18 +612,36 @@ static const struct test avx512_fp16_all
     INSN(cmpph,           , 0f3a, c2,    vl, fp16, vl),
     INSN(cmpsh,         f3, 0f3a, c2,    el, fp16, el),
     INSN(comish,          , map5, 2f,    el, fp16, el),
+    INSN(cvtdq2ph,        , map5, 5b,    vl,    d, vl),
     INSN(cvtpd2ph,      66, map5, 5a,    vl,    q, vl),
+    INSN(cvtph2dq,      66, map5, 5b,  vl_2, fp16, vl),
     INSN(cvtph2pd,        , map5, 5a,  vl_4, fp16, vl),
     INSN(cvtph2psx,     66, map6, 13,  vl_2, fp16, vl),
+    INSN(cvtph2qq,      66, map5, 7b,  vl_4, fp16, vl),
+    INSN(cvtph2udq,       , map5, 79,  vl_2, fp16, vl),
+    INSN(cvtph2uqq,     66, map5, 79,  vl_4, fp16, vl),
     INSN(cvtph2uw,        , map5, 7d,    vl, fp16, vl),
     INSN(cvtph2w,       66, map5, 7d,    vl, fp16, vl),
     INSN(cvtps2phx,     66, map5, 1d,    vl,    d, vl),
+    INSN(cvtqq2ph,        , map5, 5b,    vl,    q, vl),
     INSN(cvtsd2sh,      f2, map5, 5a,    el,    q, el),
     INSN(cvtsh2sd,      f3, map5, 5a,    el, fp16, el),
+    INSN(cvtsh2si,      f3, map5, 2d,    el, fp16, el),
     INSN(cvtsh2ss,        , map6, 13,    el, fp16, el),
+    INSN(cvtsh2usi,     f3, map5, 79,    el, fp16, el),
+    INSN(cvtsi2sh,      f3, map5, 2a,    el, dq64, el),
     INSN(cvtss2sh,        , map5, 1d,    el,    d, el),
+    INSN(cvttph2dq,     f3, map5, 5b,  vl_2, fp16, vl),
+    INSN(cvttph2qq,     66, map5, 7a,  vl_4, fp16, vl),
+    INSN(cvttph2udq,      , map5, 78,  vl_2, fp16, vl),
+    INSN(cvttph2uqq,    66, map5, 78,  vl_4, fp16, vl),
     INSN(cvttph2uw,       , map5, 7c,    vl, fp16, vl),
     INSN(cvttph2w,      66, map5, 7c,    vl, fp16, vl),
+    INSN(cvttsh2si,     f3, map5, 2c,    el, fp16, el),
+    INSN(cvttsh2usi,    f3, map5, 78,    el, fp16, el),
+    INSN(cvtudq2ph,     f2, map5, 7a,    vl,    d, vl),
+    INSN(cvtuqq2ph,     f2, map5, 7a,    vl,    q, vl),
+    INSN(cvtusi2sh,     f3, map5, 7b,    el, dq64, el),
     INSN(cvtuw2ph,      f2, map5, 7d,    vl, fp16, vl),
     INSN(cvtw2ph,       f3, map5, 7d,    vl, fp16, vl),
     INSN(divph,           , map5, 5e,    vl, fp16, vl),
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -2033,6 +2033,9 @@ static const struct evex {
     { { 0x11 }, 2, T, W, pfx_f3, W0, LIG }, /* vmovsh */
     { { 0x1d }, 2, T, R, pfx_66, W0, Ln }, /* vcvtps2phx */
     { { 0x1d }, 2, T, R, pfx_no, W0, LIG }, /* vcvtss2sh */
+    { { 0x2a }, 2, T, R, pfx_f3, Wn, LIG }, /* vcvtsi2sh */
+    { { 0x2c }, 2, T, R, pfx_f3, Wn, LIG }, /* vcvttsh2si */
+    { { 0x2d }, 2, T, R, pfx_f3, Wn, LIG }, /* vcvtsh2si */
     { { 0x2e }, 2, T, R, pfx_no, W0, LIG }, /* vucomish */
     { { 0x2f }, 2, T, R, pfx_no, W0, LIG }, /* vcomish */
     { { 0x51 }, 2, T, R, pfx_no, W0, Ln }, /* vsqrtph */
@@ -2045,6 +2048,10 @@ static const struct evex {
     { { 0x5a }, 2, T, R, pfx_66, W1, Ln }, /* vcvtpd2ph */
     { { 0x5a }, 2, T, R, pfx_f3, W0, LIG }, /* vcvtsh2sd */
     { { 0x5a }, 2, T, R, pfx_f2, W1, LIG }, /* vcvtsd2sh */
+    { { 0x5b }, 2, T, R, pfx_no, W0, Ln }, /* vcvtdq2ph */
+    { { 0x5b }, 2, T, R, pfx_no, W1, Ln }, /* vcvtqq2ph */
+    { { 0x5b }, 2, T, R, pfx_66, W0, Ln }, /* vcvtph2dq */
+    { { 0x5b }, 2, T, R, pfx_f3, W0, Ln }, /* vcvttph2dq */
     { { 0x5c }, 2, T, R, pfx_no, W0, Ln }, /* vsubph */
     { { 0x5c }, 2, T, R, pfx_f3, W0, LIG }, /* vsubsh */
     { { 0x5d }, 2, T, R, pfx_no, W0, Ln }, /* vminph */
@@ -2054,6 +2061,17 @@ static const struct evex {
     { { 0x5f }, 2, T, R, pfx_no, W0, Ln }, /* vmaxph */
     { { 0x5f }, 2, T, R, pfx_f3, W0, LIG }, /* vmaxsh */
     { { 0x6e }, 2, T, R, pfx_66, WIG, L0 }, /* vmovw */
+    { { 0x78 }, 2, T, R, pfx_no, W0, Ln }, /* vcvttph2udq */
+    { { 0x78 }, 2, T, R, pfx_66, W0, Ln }, /* vcvttph2uqq */
+    { { 0x78 }, 2, T, R, pfx_f3, Wn, LIG }, /* vcvttsh2usi */
+    { { 0x79 }, 2, T, R, pfx_no, W0, Ln }, /* vcvtph2udq */
+    { { 0x79 }, 2, T, R, pfx_66, W0, Ln }, /* vcvtph2uqq */
+    { { 0x79 }, 2, T, R, pfx_f3, Wn, LIG }, /* vcvtsh2usi */
+    { { 0x7a }, 2, T, R, pfx_66, W0, Ln }, /* vcvttph2qq */
+    { { 0x7a }, 2, T, R, pfx_f2, W0, Ln }, /* vcvtudq2ph */
+    { { 0x7a }, 2, T, R, pfx_f2, W1, Ln }, /* vcvtuqq2ph */
+    { { 0x7b }, 2, T, R, pfx_66, W0, Ln }, /* vcvtph2qq */
+    { { 0x7b }, 2, T, R, pfx_f3, Wn, LIG }, /* vcvtusi2sh */
     { { 0x7c }, 2, T, R, pfx_no, W0, Ln }, /* vcvttph2uw */
     { { 0x7c }, 2, T, R, pfx_66, W0, Ln }, /* vcvttph2w */
     { { 0x7d }, 2, T, R, pfx_no, W0, Ln }, /* vcvtph2uw */
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -1489,12 +1489,25 @@ int x86emul_decode(struct x86_emulate_st
                     s->simd_size = simd_scalar_vexw;
                 break;
 
+            case 0x2a: /* vcvtsi2sh */
+                break;
+
+            case 0x2c: case 0x2d: /* vcvt{,t}sh2si */
+                if ( s->evex.pfx == vex_f3 )
+                    s->fp16 = true;
+                break;
+
             case 0x2e: case 0x2f: /* v{,u}comish */
                 if ( !s->evex.pfx )
                     s->fp16 = true;
                 s->simd_size = simd_none;
                 break;
 
+            case 0x5b: /* vcvt{d,q}q2ph, vcvt{,t}ph2dq */
+                if ( s->evex.pfx && s->evex.pfx != vex_f2 )
+                    s->fp16 = true;
+                break;
+
             case 0x6e: /* vmovw r/m16, xmm */
                 d = (d & ~SrcMask) | SrcMem16;
                 /* fall through */
@@ -1504,6 +1517,17 @@ int x86emul_decode(struct x86_emulate_st
                 s->simd_size = simd_none;
                 break;
 
+            case 0x78: case 0x79: /* vcvt{,t}ph2u{d,q}q, vcvt{,t}sh2usi */
+                if ( s->evex.pfx != vex_f2 )
+                    s->fp16 = true;
+                break;
+
+            case 0x7a: /* vcvttph2qq, vcvtu{d,q}q2ph */
+            case 0x7b: /* vcvtph2qq, vcvtusi2sh */
+                if ( s->evex.pfx == vex_66 )
+                    s->fp16 = true;
+                break;
+
             case 0x7c: /* vcvttph2{,u}w */
             case 0x7d: /* vcvtph2{,u}w / vcvt{,u}w2ph */
                 d = DstReg | SrcMem | TwoOp;
@@ -1515,10 +1539,34 @@ int x86emul_decode(struct x86_emulate_st
 
             switch ( b )
             {
+            case 0x78:
+            case 0x79:
+                /* vcvt{,t}ph2u{d,q}q need special casing */
+                if ( s->evex.pfx <= vex_66 )
+                {
+                    if ( !s->evex.brs )
+                        disp8scale -= 1 + (s->evex.pfx == vex_66);
+                    break;
+                }
+                /* vcvt{,t}sh2usi needs special casing: fall through */
+            case 0x2c: case 0x2d: /* vcvt{,t}sh2si need special casing */
+                disp8scale = 1;
+                break;
+
             case 0x5a: /* vcvtph2pd needs special casing */
                 if ( !s->evex.pfx && !s->evex.brs )
                     disp8scale -= 2;
                 break;
+
+            case 0x5b: /* vcvt{,t}ph2dq need special casing */
+                if ( s->evex.pfx && !s->evex.brs )
+                    --disp8scale;
+                break;
+
+            case 0x7a: case 0x7b: /* vcvt{,t}ph2qq need special casing */
+                if ( s->evex.pfx == vex_66 && !s->evex.brs )
+                    disp8scale = s->evex.brs ? 1 : 2 + s->evex.lr;
+                break;
             }
 
             break;
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -3581,6 +3581,12 @@ x86_emulate(
         state->simd_size = simd_none;
         goto simd_0f_rm;
 
+#ifndef X86EMUL_NO_SIMD
+
+    case X86EMUL_OPC_EVEX_F3(5, 0x2a):      /* vcvtsi2sh r/m,xmm,xmm */
+    case X86EMUL_OPC_EVEX_F3(5, 0x7b):      /* vcvtusi2sh r/m,xmm,xmm */
+        host_and_vcpu_must_have(avx512_fp16);
+        /* fall through */
     CASE_SIMD_SCALAR_FP(_EVEX, 0x0f, 0x2a): /* vcvtsi2s{s,d} r/m,xmm,xmm */
     CASE_SIMD_SCALAR_FP(_EVEX, 0x0f, 0x7b): /* vcvtusi2s{s,d} r/m,xmm,xmm */
         generate_exception_if(evex.opmsk || (ea.type != OP_REG && evex.brs),
@@ -3659,7 +3665,9 @@ x86_emulate(
             opc[1] = 0x01;
 
             rc = ops->read(ea.mem.seg, ea.mem.off, mmvalp,
-                           vex.pfx & VEX_PREFIX_DOUBLE_MASK ? 8 : 4, ctxt);
+                           vex.pfx & VEX_PREFIX_DOUBLE_MASK
+                           ? 8 : 2 << !state->fp16,
+                           ctxt);
             if ( rc != X86EMUL_OKAY )
                 goto done;
         }
@@ -3689,6 +3697,12 @@ x86_emulate(
         state->simd_size = simd_none;
         break;
 
+    case X86EMUL_OPC_EVEX_F3(5, 0x2c):      /* vcvttsh2si xmm/mem,reg */
+    case X86EMUL_OPC_EVEX_F3(5, 0x2d):      /* vcvtsh2si xmm/mem,reg */
+    case X86EMUL_OPC_EVEX_F3(5, 0x78):      /* vcvttsh2usi xmm/mem,reg */
+    case X86EMUL_OPC_EVEX_F3(5, 0x79):      /* vcvtsh2usi xmm/mem,reg */
+        host_and_vcpu_must_have(avx512_fp16);
+        /* fall through */
     CASE_SIMD_SCALAR_FP(_EVEX, 0x0f, 0x2c): /* vcvtts{s,d}2si xmm/mem,reg */
     CASE_SIMD_SCALAR_FP(_EVEX, 0x0f, 0x2d): /* vcvts{s,d}2si xmm/mem,reg */
     CASE_SIMD_SCALAR_FP(_EVEX, 0x0f, 0x78): /* vcvtts{s,d}2usi xmm/mem,reg */
@@ -3760,8 +3774,6 @@ x86_emulate(
         ASSERT(!state->simd_size);
         break;
 
-#ifndef X86EMUL_NO_SIMD
-
     case X86EMUL_OPC_EVEX(5, 0x2e): /* vucomish xmm/m16,xmm */
     case X86EMUL_OPC_EVEX(5, 0x2f): /* vcomish xmm/m16,xmm */
         host_and_vcpu_must_have(avx512_fp16);
@@ -7789,6 +7801,38 @@ x86_emulate(
                          2 * evex.w);
         goto avx512f_all_fp;
 
+    case X86EMUL_OPC_EVEX   (5, 0x5b): /* vcvtdq2ph [xyz]mm/mem,[xy]mm{k} */
+                                       /* vcvtqq2ph [xyz]mm/mem,xmm{k} */
+    case X86EMUL_OPC_EVEX_F2(5, 0x7a): /* vcvtudq2ph [xyz]mm/mem,[xy]mm{k} */
+                                       /* vcvtuqq2ph [xyz]mm/mem,xmm{k} */
+        host_and_vcpu_must_have(avx512_fp16);
+        if ( ea.type != OP_REG || !evex.brs )
+            avx512_vlen_check(false);
+        op_bytes = 16 << evex.lr;
+        goto simd_zmm;
+
+    case X86EMUL_OPC_EVEX_66(5, 0x5b): /* vcvtph2dq [xy]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_F3(5, 0x5b): /* vcvttph2dq [xy]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX   (5, 0x78): /* vcvttph2udq [xy]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX   (5, 0x79): /* vcvtph2udq [xy]mm/mem,[xyz]mm{k} */
+        host_and_vcpu_must_have(avx512_fp16);
+        generate_exception_if(evex.w, EXC_UD);
+        if ( ea.type != OP_REG || !evex.brs )
+            avx512_vlen_check(false);
+        op_bytes = 8 << evex.lr;
+        goto simd_zmm;
+
+    case X86EMUL_OPC_EVEX_66(5, 0x78): /* vcvttph2uqq xmm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(5, 0x79): /* vcvtph2uqq xmm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(5, 0x7a): /* vcvttph2qq xmm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(5, 0x7b): /* vcvtph2qq xmm/mem,[xyz]mm{k} */
+        host_and_vcpu_must_have(avx512_fp16);
+        generate_exception_if(evex.w, EXC_UD);
+        if ( ea.type != OP_REG || !evex.brs )
+            avx512_vlen_check(false);
+        op_bytes = 4 << (evex.w + evex.lr);
+        goto simd_zmm;
+
     case X86EMUL_OPC_EVEX   (5, 0x7c): /* vcvttph2uw [xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(5, 0x7c): /* vcvttph2w [xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX   (5, 0x7d): /* vcvtph2uw [xyz]mm/mem,[xyz]mm{k} */


