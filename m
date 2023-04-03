Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA806D4B3C
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 16:58:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517490.802882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjLdS-0007o7-V4; Mon, 03 Apr 2023 14:58:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517490.802882; Mon, 03 Apr 2023 14:58:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjLdS-0007kt-Rb; Mon, 03 Apr 2023 14:58:18 +0000
Received: by outflank-mailman (input) for mailman id 517490;
 Mon, 03 Apr 2023 14:58:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dypz=72=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pjLdQ-00066R-Ob
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 14:58:16 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062e.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6539507-d22f-11ed-85db-49a42c6b2330;
 Mon, 03 Apr 2023 16:58:16 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8760.eurprd04.prod.outlook.com (2603:10a6:10:2e3::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 14:58:14 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.033; Mon, 3 Apr 2023
 14:58:14 +0000
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
X-Inumbo-ID: f6539507-d22f-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gqnEFc9p304BbjCR28meVw3Cgt/JGP1KNLoUbKnVLacoWdsNP90bat1sFpAujaGNvQaaCSGYPqp0dMf+GVAz3TyZ6ktSAgM8ZAmqPrDNA7FC10nB7P1CAjR4kIaaPD2Ej0z9sUrm0G0eRWz/cN1MI2u1cDcVBbMZX3NdGQNsjYQDZn6F4yu4RGWX8SyKeiwHoif3JZ1JgQF4B3Etd3BZyn/IaiwoFlUx69uMxIRkZt4/M/9EJFrEwBlyt3QCQFBhChrM2HNon4x//ER/GLvcxlN84XLsaMwqa1l2IVBzi6NClJNxefrTWEtAuLIhfmD/sILk+SfRBpobGNzVyjoYNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oydr5RGLPiB/5UlaPCHWJTbrdc3fnjsbwu/jwCLiWIo=;
 b=TE+BkxGv3HX7deLzpjZOcZcPg9YOK3PVZ6EUVyuFgFy0+SnJdyPF0o8QyLYt5cOU2NGFNaRfrGMX4BrBHVpqeJwkZWrMaDqPShld/A9ZzGdKp3T3XZQ7V6rWqr39+7xWRQ3HAHieWoOlSKURUEIJrB5Rq9o7YgzT6tqe6hA2l8BFJTwji4X1vuh6RuVT70Nq1euktvc1xC0IaSgClJaS8OxyyCJAxndc+NzeEfHSn9fQ85FfMPGXgzh6dk3pbLDyikLMp4UBc9m7S5p/e8zO+6cZeI/YUaprycb9DK+QeFOnEm9y7AALs4AORHzD3+7O/0lEYZlDvPRFAgS+9fmFdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oydr5RGLPiB/5UlaPCHWJTbrdc3fnjsbwu/jwCLiWIo=;
 b=oxd/K2NL01WO8G2hQcT1QCfnVwgkyCXY6pVg2MFMtB+tf0CYWpNJhAa8XyZtcLkO6nBrOr5VRNtHx8BRCFxLOP6WRID+jNlLHFtDeUFHFU1OsRSR9Gom/up5TRXGkAhsRu8tTEuWv7SRQpnvKysk2N7SbJxYOfC+4yafMjcYIhKId932BBHXoCD0AaZzFojKgyI9OcwDCKpFC/pz3mYJnaNDrT6gTPJ7YiYTDFx1H1+rhqP+XG5z0QzDnciK6MFs43rBIMEFR+vi47rHuSQxu5is6te7+NNucFENBXKv09bn34WXohRJUPnuLfI9I9enwg8GSdfanpTT90031M20/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bd6c1183-f9aa-dbd1-84d8-c91a89dbc50f@suse.com>
Date: Mon, 3 Apr 2023 16:58:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: [PATCH v2 04/10] x86emul: handle AVX512-FP16 fma-like insns
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <8cbbab55-d670-5632-30ee-3e8ca352f048@suse.com>
In-Reply-To: <8cbbab55-d670-5632-30ee-3e8ca352f048@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0192.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8760:EE_
X-MS-Office365-Filtering-Correlation-Id: ab8862c4-b2b5-4ea6-d632-08db3453d9c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	E1FjQ3QBqYkRdozj0hcc2S4PtbKILBwA/3y5NzFay+CMFtL/sryD9cyPVOp2NFqi33rjzaB0/L/UOY85eKTaabysq4ZmMq0J1XzshAYUpo77jnh12hZp+ysdEWJZK+35BFu660Gr4ywOd18yeHGrT06l2U/QAT3gRpZmGMGuRVmhNaFpICQHjK30/PehqsJLr694fj47KFnlDwLQtfMPqNiXryC8rgUh1Pg1S4HO9e+dcTDI5DG6HCSZYnv9XN5X+PEQZZjGgPJFXLylPj+HzJVtcUYxcEVqu5Eq8lifq02axkh2Ff3NYYztVacqYj36fTSxRXv8SCmVOXORaee/9LSv5VAYHzda5qFFfvWUdCxQ7kUS9/jtkyZrYN0kmC03Bmml1UPqIOICU2AVIoRLeJs+UthTHSpuSuVLaMjuJbouI2+YwX3r2FHbDnU5hdxrbmS3vibjczAI8gIjCTMeTl2IDKQF3h3/ZeX/J849Iv6S/JvhrsSxe81YXx5FcVRrTFzw39i/cCvNLHMIgxl/xdlvVBNycTV64WishB9njWE8jKybpZI+VVK/kUm3cmVb1hbm+To8DX3Bz5mKE80odUoHBzcLsUMg5f2K9kigf7tLPr0Tq0nR3gsgR32Apg8W219LJ1caBuCQTT+APfEsXw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(136003)(346002)(39860400002)(376002)(451199021)(6916009)(8676002)(66476007)(4326008)(66556008)(66946007)(478600001)(316002)(54906003)(8936002)(30864003)(41300700001)(38100700002)(5660300002)(186003)(2616005)(6486002)(26005)(6506007)(6512007)(86362001)(31696002)(36756003)(2906002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amQxMTlIMTBPL2RhdXpwTWYxNityd2UvbVRzQWYyK0FOTFRFdFZ3bUM3dmFm?=
 =?utf-8?B?V1hoeUpJMjhlbkdIdUdwZDdjendYY1lrTE9Ia0g3MHBYU0NlNFZOUkxVTXdt?=
 =?utf-8?B?aFVSYm1FV0ZEdUFTL0FuMlhtLzR2bkREN01tdXcySldWSW9SZU1tMGhhMWpK?=
 =?utf-8?B?OUZiS3UyYXVMUTlBU1gyYTJOcGZqdTk2MjR2Zkx3UU0vby9OLzA1em5ISC9W?=
 =?utf-8?B?TTZYMGlCdC9aRk8ySis4Vzc3My8vNDFUdUtHUHQ5M01RcFRibVhIZCtXUis1?=
 =?utf-8?B?MXczZTNEWnByK2NmbFR2TGFUVW9PL0VEMDV0WGUxTHNJR0FZc0w1cFZuRE9O?=
 =?utf-8?B?NnV5cTFKTUVhaGgxaVBKWjB1Wk1lMGtFWStBZXBjcUFOSXFvZ3JaTlRTaUdY?=
 =?utf-8?B?L1M5TGVhaVBreTRNREgrWlRGaDFFSjhCMjhkM05OS1hlMnpDN2RpN2YwSWFs?=
 =?utf-8?B?T3BlMnVXUW55Qm5GMC8za3NqSEdFQjRBRlBaZ3FRVzVMRXh0TkxwS3RiN2xF?=
 =?utf-8?B?cllXQmtQaDliaEJyQ3hTdWd0WHBpRndrRE40cUFWalVtZmYxWjkvSzV6YWxo?=
 =?utf-8?B?R1lGVmdsaXJ1cnNtL216RFI1dkcwZGI4cXJrWnQ3cGxNR1JkZTg5NXpOMm45?=
 =?utf-8?B?T3RpVlcwVFM0anIyNnFmeXBOYmFmV1dacmN4UG03WWZPb3RYaXVJeWxaWFhQ?=
 =?utf-8?B?VHNBQzhVYjJwdWsyaFJreHZmZ0x0ZkN1REtqRG41WTMzN0w5ZDYzWFJOK3pR?=
 =?utf-8?B?ay9FWUZkRkg2Ni85MXRUa3NJTTZnNlhCMlI4YjMrNDFlV2dVdjNHTnJreUN3?=
 =?utf-8?B?MEJrN2F0THFUUHljSnNvaUhZZ0xkWlZJbzJMYjBhbHFtWFBReTNEN1Y4NXdX?=
 =?utf-8?B?TUFSVnlqWCtBYUUydjBWL1g5WkUxTzdFaDJjRFl3eFBqSWZvVHBiZmhwY0pj?=
 =?utf-8?B?UWxTaFRwSE0yMVRwR053VkZxQzFRVHhhNVJveGpsTXVaTTZDa3pOSC9rU2hX?=
 =?utf-8?B?czRTdUdZWHlZVGJXVWw5L3NlN2lPQXI4cGdGakEvV2NuSmV6WXJmRUVRUmRk?=
 =?utf-8?B?WmR4NXpablk5M1FhL1Fpd09PZXlVVVQvVEZBTWxqNGtoS1hJSy9WZFI5eWRX?=
 =?utf-8?B?QTBZcEsrT1BzMXR0VEtoMUx3UzNYTmhCY3Yya29RcVd5YU9DN1Vxamlpb00r?=
 =?utf-8?B?NEJZOGpWSDZJYkFRWlQwVFAxNFdqVzkvYlhvVnBKZ1lXeGVJQU9HTklkK3pu?=
 =?utf-8?B?Rk1Bd3Jnc2pLeVQzK0ZBTGFrQmJac0llNUJFVzJZdFZKN2UxNFB0ZWYrQnA2?=
 =?utf-8?B?TTdBcDNDM1RXekR2Mi9WY0NxZU56b3R4N2w5dHpvUkhxbVNyOUQxeFlxN0di?=
 =?utf-8?B?S3I0aDNoM3FTRFBpeTFRd2FlMWZ3bExsc1BjZDRhUXZveG1ib1ZtT3ZNNnZ3?=
 =?utf-8?B?cHlOMWtJblZiUnZickhvYlR2SXAxbUlYSFpVTytReHJMSTJLK0t0MXZZcHVa?=
 =?utf-8?B?R0RDWm41aDRuRXpydWVZUGhCckI0UlpmVVpxS1JLaVd6QXdGNjZYSExPZy83?=
 =?utf-8?B?Z2FpUnJEVGllVGRsZ3d4M3BGeklKa3pQRXF6LzFxcWNoSzV1VmpHanhBbE9R?=
 =?utf-8?B?QkcvZjBmai9EeExXaUZNSzdiUVYzNmoxRnJoZWsxcjNXaVMyQUhVbzVsczJT?=
 =?utf-8?B?cmxsWEFmNkFsSEpydGp3UmRDcHlGc1hUNnhsWWhsOXMxajNiUktZSFJZL1BU?=
 =?utf-8?B?WG5ERllsK0drLytpNk5SMWgwOURHZytYKzNKajVCVlE2V0lqWEkrZnQrWXlm?=
 =?utf-8?B?clQyUWY1alA2cDNZTHJXZEdIV0FWK1dlMlFxU1JMQ055N0hVdFNzdUN1T1Aw?=
 =?utf-8?B?bmMyU3Q0OVJDMmRjaWxZVTJTMFJYaUlxdnJqUlVrcm50alNyMGlwYnlrQmRv?=
 =?utf-8?B?czBmZDQ2ZHlRL3QwdUFaR3I0eGcrQ05NR05UZzVSRjRYYmZYa1NudUF6Y1p3?=
 =?utf-8?B?anFjbHd6RWJrcHgzQi9NcmZjZVlvb3BtRldFNnNTalBFb2NPNEdzanluM0FJ?=
 =?utf-8?B?ZWRFUzMyeWlGOW1QS3hOVWIyVklMZkErWWRsTVFlSkhvYmlPYVdDUTR0MjY3?=
 =?utf-8?Q?0hPKYHiLprcAFzWGZCWDt3XG3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab8862c4-b2b5-4ea6-d632-08db3453d9c9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 14:58:14.5414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3x+Uzm4zH6donlyxuL75jxyuHt+D/xbAzaajYG4qAd4Qko+8JLXJLQwDQ0J0p40YT+YeB28eETP9++rQ2XEmvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8760

The Map6 encoding space is a very sparse clone of the "0f38" one. Once
again re-use that table, as the entries corresponding to invalid opcodes
in Map6 are simply benign with simd_size forced to other than simd_none
(preventing undue memory reads in SrcMem handling early in
x86_emulate()).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Add comments.

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -614,6 +614,36 @@ static const struct test avx512_fp16_all
     INSN(comish,          , map5, 2f,    el, fp16, el),
     INSN(divph,           , map5, 5e,    vl, fp16, vl),
     INSN(divsh,         f3, map5, 5e,    el, fp16, el),
+    INSN(fmadd132ph,    66, map6, 98,    vl, fp16, vl),
+    INSN(fmadd132sh,    66, map6, 99,    el, fp16, el),
+    INSN(fmadd213ph,    66, map6, a8,    vl, fp16, vl),
+    INSN(fmadd213sh,    66, map6, a9,    el, fp16, el),
+    INSN(fmadd231ph,    66, map6, b8,    vl, fp16, vl),
+    INSN(fmadd231sh,    66, map6, b9,    el, fp16, el),
+    INSN(fmaddsub132ph, 66, map6, 96,    vl, fp16, vl),
+    INSN(fmaddsub213ph, 66, map6, a6,    vl, fp16, vl),
+    INSN(fmaddsub231ph, 66, map6, b6,    vl, fp16, vl),
+    INSN(fmsub132ph,    66, map6, 9a,    vl, fp16, vl),
+    INSN(fmsub132sh,    66, map6, 9b,    el, fp16, el),
+    INSN(fmsub213ph,    66, map6, aa,    vl, fp16, vl),
+    INSN(fmsub213sh,    66, map6, ab,    el, fp16, el),
+    INSN(fmsub231ph,    66, map6, ba,    vl, fp16, vl),
+    INSN(fmsub231sh,    66, map6, bb,    el, fp16, el),
+    INSN(fmsubadd132ph, 66, map6, 97,    vl, fp16, vl),
+    INSN(fmsubadd213ph, 66, map6, a7,    vl, fp16, vl),
+    INSN(fmsubadd231ph, 66, map6, b7,    vl, fp16, vl),
+    INSN(fnmadd132ph,   66, map6, 9c,    vl, fp16, vl),
+    INSN(fnmadd132sh,   66, map6, 9d,    el, fp16, el),
+    INSN(fnmadd213ph,   66, map6, ac,    vl, fp16, vl),
+    INSN(fnmadd213sh,   66, map6, ad,    el, fp16, el),
+    INSN(fnmadd231ph,   66, map6, bc,    vl, fp16, vl),
+    INSN(fnmadd231sh,   66, map6, bd,    el, fp16, el),
+    INSN(fnmsub132ph,   66, map6, 9e,    vl, fp16, vl),
+    INSN(fnmsub132sh,   66, map6, 9f,    el, fp16, el),
+    INSN(fnmsub213ph,   66, map6, ae,    vl, fp16, vl),
+    INSN(fnmsub213sh,   66, map6, af,    el, fp16, el),
+    INSN(fnmsub231ph,   66, map6, be,    vl, fp16, vl),
+    INSN(fnmsub231sh,   66, map6, bf,    el, fp16, el),
     INSN(fpclassph,       , 0f3a, 66,    vl, fp16, vl),
     INSN(fpclasssh,       , 0f3a, 67,    el, fp16, el),
     INSN(getmantph,       , 0f3a, 26,    vl, fp16, vl),
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -2049,6 +2049,37 @@ static const struct evex {
     { { 0x5f }, 2, T, R, pfx_f3, W0, LIG }, /* vmaxsh */
     { { 0x6e }, 2, T, R, pfx_66, WIG, L0 }, /* vmovw */
     { { 0x7e }, 2, T, W, pfx_66, WIG, L0 }, /* vmovw */
+}, evex_map6[] = {
+    { { 0x96 }, 2, T, R, pfx_66, W0, Ln }, /* vfmaddsub132ph */
+    { { 0x97 }, 2, T, R, pfx_66, W0, Ln }, /* vfmsubadd132ph */
+    { { 0x98 }, 2, T, R, pfx_66, W0, Ln }, /* vfmadd132ph */
+    { { 0x99 }, 2, T, R, pfx_66, W0, LIG }, /* vfmadd132sh */
+    { { 0x9a }, 2, T, R, pfx_66, W0, Ln }, /* vfmsub132ph */
+    { { 0x9b }, 2, T, R, pfx_66, W0, LIG }, /* vfmsub132sh */
+    { { 0x9c }, 2, T, R, pfx_66, W0, Ln }, /* vfnmadd132ph */
+    { { 0x9d }, 2, T, R, pfx_66, W0, LIG }, /* vfnmadd132sh */
+    { { 0x9e }, 2, T, R, pfx_66, W0, Ln }, /* vfnmsub132ph */
+    { { 0x9f }, 2, T, R, pfx_66, W0, LIG }, /* vfnmsub132sh */
+    { { 0xa6 }, 2, T, R, pfx_66, W0, Ln }, /* vfmaddsub213ph */
+    { { 0xa7 }, 2, T, R, pfx_66, W0, Ln }, /* vfmsubadd213ph */
+    { { 0xa8 }, 2, T, R, pfx_66, W0, Ln }, /* vfmadd213ph */
+    { { 0xa9 }, 2, T, R, pfx_66, W0, LIG }, /* vfmadd213sh */
+    { { 0xaa }, 2, T, R, pfx_66, W0, Ln }, /* vfmsub213ph */
+    { { 0xab }, 2, T, R, pfx_66, W0, LIG }, /* vfmsub213sh */
+    { { 0xac }, 2, T, R, pfx_66, W0, Ln }, /* vfnmadd213ph */
+    { { 0xad }, 2, T, R, pfx_66, W0, LIG }, /* vfnmadd213sh */
+    { { 0xae }, 2, T, R, pfx_66, W0, Ln }, /* vfnmsub213ph */
+    { { 0xaf }, 2, T, R, pfx_66, W0, LIG }, /* vfnmsub213sh */
+    { { 0xb6 }, 2, T, R, pfx_66, W0, Ln }, /* vfmaddsub231ph */
+    { { 0xb7 }, 2, T, R, pfx_66, W0, Ln }, /* vfmsubadd231ph */
+    { { 0xb8 }, 2, T, R, pfx_66, W0, Ln }, /* vfmadd231ph */
+    { { 0xb9 }, 2, T, R, pfx_66, W0, LIG }, /* vfmadd231sh */
+    { { 0xba }, 2, T, R, pfx_66, W0, Ln }, /* vfmsub231ph */
+    { { 0xbb }, 2, T, R, pfx_66, W0, LIG }, /* vfmsub231sh */
+    { { 0xbc }, 2, T, R, pfx_66, W0, Ln }, /* vfnmadd231ph */
+    { { 0xbd }, 2, T, R, pfx_66, W0, LIG }, /* vfnmadd231sh */
+    { { 0xbe }, 2, T, R, pfx_66, W0, Ln }, /* vfnmsub231ph */
+    { { 0xbf }, 2, T, R, pfx_66, W0, LIG }, /* vfnmsub231sh */
 };
 
 static const struct {
@@ -2060,6 +2091,7 @@ static const struct {
     { evex_0f3a, ARRAY_SIZE(evex_0f3a) },
     { NULL,      0 },
     { evex_map5, ARRAY_SIZE(evex_map5) },
+    { evex_map6, ARRAY_SIZE(evex_map6) },
 };
 
 #undef Wn
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -1235,6 +1235,20 @@ int x86emul_decode(struct x86_emulate_st
                         d = twobyte_table[b].desc;
                         s->simd_size = twobyte_table[b].size ?: simd_other;
                         break;
+
+                    case evex_map6:
+                        if ( !evex_encoded() )
+                        {
+                            rc = X86EMUL_UNRECOGNIZED;
+                            goto done;
+                        }
+                        opcode |= MASK_INSR(6, X86EMUL_OPC_EXT_MASK);
+                        /*
+                         * Re-use twobyte_table[]'s 0x38 entry here, for the
+                         * similarity of the 0F38 entries with map 6.
+                         */
+                        d = twobyte_table[0x38].desc;
+                        break;
                     }
                 }
                 else if ( s->ext < ext_8f08 + ARRAY_SIZE(xop_table) )
@@ -1484,6 +1498,28 @@ int x86emul_decode(struct x86_emulate_st
             disp8scale = decode_disp8scale(twobyte_table[b].d8s, s);
             break;
 
+        case ext_map6:
+            /*
+             * Re-use ext0f38_table[] here, for the similarity of the entries
+             * valid in map 6.
+             */
+            d = ext0f38_table[b].to_mem ? DstMem | SrcReg
+                                        : DstReg | SrcMem;
+            if ( ext0f38_table[b].two_op )
+                d |= TwoOp;
+            s->simd_size = ext0f38_table[b].simd_size ?: simd_other;
+
+            switch ( b )
+            {
+            default:
+                if ( s->evex.pfx == vex_66 )
+                    s->fp16 = true;
+                break;
+            }
+
+            disp8scale = decode_disp8scale(ext0f38_table[b].d8s, s);
+            break;
+
         case ext_8f09:
             if ( ext8f09_table[b].two_op )
                 d |= TwoOp;
@@ -1703,6 +1739,7 @@ int x86emul_decode(struct x86_emulate_st
         break;
 
     case ext_map5:
+    case ext_map6:
     case ext_8f09:
     case ext_8f0a:
         break;
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -196,6 +196,7 @@ enum vex_opcx {
     vex_0f38,
     vex_0f3a,
     evex_map5 = 5,
+    evex_map6,
 };
 
 enum vex_pfx {
@@ -251,6 +252,7 @@ struct x86_emulate_state {
         ext_0f38 = vex_0f38,
         ext_0f3a = vex_0f3a,
         ext_map5 = evex_map5,
+        ext_map6 = evex_map6,
         /*
          * For XOP use values such that the respective instruction field
          * can be used without adjustment.
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -7778,6 +7778,49 @@ x86_emulate(
         generate_exception_if(evex.w, EXC_UD);
         goto avx512f_all_fp;
 
+    case X86EMUL_OPC_EVEX_66(6, 0x96): /* vfmaddsub132ph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0x97): /* vfmsubadd132ph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0x98): /* vfmadd132ph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0x9a): /* vfmsub132ph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0x9c): /* vfnmadd132ph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0x9e): /* vfnmsub132ph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0xa6): /* vfmaddsub213ph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0xa7): /* vfmsubadd213ph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0xa8): /* vfmadd213ph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0xaa): /* vfmsub213ph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0xac): /* vfnmadd213ph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0xae): /* vfnmsub213ph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0xb6): /* vfmaddsub231ph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0xb7): /* vfmsubadd231ph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0xb8): /* vfmadd231ph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0xba): /* vfmsub231ph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0xbc): /* vfnmadd231ph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0xbe): /* vfnmsub231ph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+        host_and_vcpu_must_have(avx512_fp16);
+        generate_exception_if(evex.w, EXC_UD);
+        if ( ea.type != OP_REG || !evex.brs )
+            avx512_vlen_check(false);
+        goto simd_zmm;
+
+    case X86EMUL_OPC_EVEX_66(6, 0x99): /* vfmadd132sh xmm/m16,xmm,xmm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0x9b): /* vfmsub132sh xmm/m16,xmm,xmm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0x9d): /* vfnmadd132sh xmm/m16,xmm,xmm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0x9f): /* vfnmsub132sh xmm/m16,xmm,xmm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0xa9): /* vfmadd213sh xmm/m16,xmm,xmm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0xab): /* vfmsub213sh xmm/m16,xmm,xmm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0xad): /* vfnmadd213sh xmm/m16,xmm,xmm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0xaf): /* vfnmsub213sh xmm/m16,xmm,xmm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0xb9): /* vfmadd231sh xmm/m16,xmm,xmm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0xbb): /* vfmsub231sh xmm/m16,xmm,xmm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0xbd): /* vfnmadd231sh xmm/m16,xmm,xmm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0xbf): /* vfnmsub231sh xmm/m16,xmm,xmm{k} */
+        host_and_vcpu_must_have(avx512_fp16);
+        generate_exception_if(evex.w || (ea.type != OP_REG && evex.brs),
+                              EXC_UD);
+        if ( !evex.brs )
+            avx512_vlen_check(true);
+        goto simd_zmm;
+
     case X86EMUL_OPC_XOP(08, 0x85): /* vpmacssww xmm,xmm/m128,xmm,xmm */
     case X86EMUL_OPC_XOP(08, 0x86): /* vpmacsswd xmm,xmm/m128,xmm,xmm */
     case X86EMUL_OPC_XOP(08, 0x87): /* vpmacssdql xmm,xmm/m128,xmm,xmm */
--- a/xen/arch/x86/x86_emulate/x86_emulate.h
+++ b/xen/arch/x86/x86_emulate/x86_emulate.h
@@ -620,6 +620,7 @@ struct x86_emulate_ctxt
  *  0x0f38xxxx for 0f38-prefixed opcodes (or their VEX/EVEX equivalents)
  *  0x0f3axxxx for 0f3a-prefixed opcodes (or their VEX/EVEX equivalents)
  *     0x5xxxx for Map5 opcodes (EVEX only)
+ *     0x6xxxx for Map6 opcodes (EVEX only)
  *  0x8f08xxxx for 8f/8-prefixed XOP opcodes
  *  0x8f09xxxx for 8f/9-prefixed XOP opcodes
  *  0x8f0axxxx for 8f/a-prefixed XOP opcodes


