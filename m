Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 034E06D4B3E
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 16:58:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517493.802893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjLdn-0008GS-8N; Mon, 03 Apr 2023 14:58:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517493.802893; Mon, 03 Apr 2023 14:58:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjLdn-0008DR-40; Mon, 03 Apr 2023 14:58:39 +0000
Received: by outflank-mailman (input) for mailman id 517493;
 Mon, 03 Apr 2023 14:58:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dypz=72=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pjLdl-00066R-6c
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 14:58:37 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0630.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02a1081e-d230-11ed-85db-49a42c6b2330;
 Mon, 03 Apr 2023 16:58:36 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8760.eurprd04.prod.outlook.com (2603:10a6:10:2e3::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 14:58:35 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.033; Mon, 3 Apr 2023
 14:58:35 +0000
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
X-Inumbo-ID: 02a1081e-d230-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C+EmADf+8qQGDOO2a63j7D3UXeDO17W/stMUvc3IZ+UhA4blbOiYj63+46myvKLXBRP02wPDZVgOQhVpceSXxPbN8OwJPSY3qnH5qnJo/XIju6/J15bQLgskU8QDDC9B3oIie6i1xjXYeerLReCeeCJsErm8aJQZelkbRQqRUGQXZLeHYfgwHbF46/ymma/9Bdg1FikzP6iyiNmGb6wsxWt+I9ctyU2EPeCA3mpPs78dHURoQEuf7AwkTjyYv/2Rvz+/7+l2LtBacGWhMY1gR+oIxaMNf+0UvxBFyxz5S6gBTrGGiUBoauzDUrEgbnxmU31wRqEdfgyWpUVCna14XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ur6LIVsIiGjC3p7/RJj3JA9BWiqIOjVGL814s+UqimA=;
 b=KMD8RGMvfkIZLn4GC2cUTaf+ESHTasZiPA5BTKcjR7BaRPa/cTC1hvMKzIFBngILXUP1+4lJGlWxgBkhjp4i17Nvv9PvqkUOT4y1pidJ/fJ5FiFOWtb82eOhQmxSd1dyfIYjjJw3DeTrrNNfkUeinIXpRX4maEU1y4absn3UILqX5tCDSYhB8NvDTp3EhsvkZYvwk23CR93+APjS23LFq6TQABaTTpDxO6eGWeMIq4ZR+eAEAag6HHGTh6Ba68qeTm3S0OG8gKqzJRuUaINiSaV5OI1dunOOKKHjPnAUM5QpupB9kKMEUsRimElvrhgladaNDALyVOgbmj4l1rAaNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ur6LIVsIiGjC3p7/RJj3JA9BWiqIOjVGL814s+UqimA=;
 b=G33wVPMKVv7m65GBYqJyXhsLSsnI41uo1yTsRsp6JmvhbZAD/ulN4EY//VWEuvo752DLlEb3IfQt5wQ7T1dgUkDogypy0Xw83RV440jgPW9JwihA02ZyaW08BD/GK6OiRb0gSjIYl+lp/7FHVsjCFL3DZHgjhHIqOJdZBd4drph1eY1VNABMq+JkJYtrZaEicv8VQRI+cUW1WIAl5S9gb2HQppymfMM+e+TrHQkcCyL0unGAkpVSnaHhO0KLg8BT1xVmnVFeDdXE1Nliz+mO1YLuWw2PYq7muDr/AsA2BNSClIjOhmOa7m/bY0D6kjJEQGS2U7Rfuk/FwbCTk+l0bg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5ae781d5-0c8d-3c7e-31ea-b54e1eee6573@suse.com>
Date: Mon, 3 Apr 2023 16:58:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: [PATCH v2 05/10] x86emul: handle AVX512-FP16 Map6 misc insns
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <8cbbab55-d670-5632-30ee-3e8ca352f048@suse.com>
In-Reply-To: <8cbbab55-d670-5632-30ee-3e8ca352f048@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0016.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8760:EE_
X-MS-Office365-Filtering-Correlation-Id: aa5fd024-27bb-482a-2236-08db3453e617
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qrk9KyUj4cU/pfT5MM0EPK48DtshvMOhIQWZBj30v8IeYswXQvByOSI7E95RnMKSxCQ2n2QBcUc/KparlVb8Z+ddlKk2n5NDR4a5OQN5/I1VaHiQPTEWVa51Ta4PZ5dSvXixFwShLzCU9QTgEOvJfLpTN1A6AnRtTLWm301i0aWRE7T3K2AJV14e1WoHwK9+0vPeGnIJP4FeLX4uw2JxOradHhCaKDWOGdwhi/UxwY0K1h+sLlP3PJqlWJUGx4y4ppriTr0mujAIOjI/3o4+a0Iem8rbbBCB1DEs1qMZVhWRg/7jbZjvozFm6BDC/xKxLTGBeMaOvNop5EkmjZtABvGjlSaqxLhhae9Vt6txn3fT7d2vZN/R+CqYx/yga4LSNEAqfGZRAwEqruL1gibb6Sz4hU1o/eb+O/fnjB5TA1VLRsHqx5jpCw8DZHbIDKnT4PIejQQHgS1XEr+OTdp2+WScCMF5xL7ryRdS+Y77hHmOz7ICOLuWgI/s8wPHlvTpRb8uqwXut5DA4/YEbUCGN45ZUrKPoUU625QCC822rgEY9Zg7w8x+MLO531TgDMhf5hTl1U0X29V6aVxzMxhLWTBORJdybfBdJBFJXPLownAzZXi/wwxKPVDnGv7KINyGzirDx3I8kHP9qAk3vH8coQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(136003)(346002)(39860400002)(376002)(451199021)(6916009)(8676002)(66476007)(4326008)(66556008)(66946007)(478600001)(316002)(54906003)(8936002)(41300700001)(38100700002)(5660300002)(186003)(2616005)(6486002)(26005)(6506007)(6512007)(86362001)(31696002)(36756003)(2906002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWFHR1ZCcmhyQkN5ZnhPMEI5RkZQZzdlbERkakd0elQyUzVEdW9UOWhqVXRQ?=
 =?utf-8?B?dVRtMHFxZlg5L3hkQkJlRDRDRGZyZHdYM0daNVRGVnZMeU5DM3VYa3NDaUhC?=
 =?utf-8?B?RVRDYjBxWWZRQWtEbVl2QklXRUxPOFV4VHArK3ppMEZSMTYvUDdpSmZaR2Zz?=
 =?utf-8?B?ZzhHcU0vdlA3QmZDc29tb3ZuVDlCYzczTG5WQkhtTjNtQjNIOStMM2FFK2lt?=
 =?utf-8?B?Q3BVUVk2RWQ1YlAvUVA1ZXVYN0Vzc1pQcUdaVnRxMjltcG1QbkQ4aW9mS0FX?=
 =?utf-8?B?QzhpSzJ4T1B0WmxmWHpQdWJ5OG9xR0xQZ1haU0RlZy9JOCtrTDMxc1c4aTBx?=
 =?utf-8?B?YlNMTXdQWG1OZnZBbmtLZXcxUFEyaDZLZ0grOXZPcnJSaXYwSmZqZnBIRnRl?=
 =?utf-8?B?NDl1bEtIMTNMelNFRHFBN01CQkNhVU1OK0QzeU5YUnA5d25hcnRqWU12ZEpP?=
 =?utf-8?B?TWVFSlYzbjltUk9KWno4bUEyOVIrS3lFc1dBeng1T2FXT1IvY1BqTWlKd2VZ?=
 =?utf-8?B?ejlTdlpyWDJxTHQrK0VNSnlpOXdwQmdsWUw2UDFEZG1jY2V6QnNRbnkzRUs5?=
 =?utf-8?B?cFJEbDRrSWgwNDJpaEhqN2ZpaVFzSllncm9uUmthQVVSaGd1S1F5akszcVhm?=
 =?utf-8?B?RktCUDJYQnlPZkVrZEQ3czFmaVBxNzIxdUd3K1hDeThVOFVqbCtOc3hPUWln?=
 =?utf-8?B?TjV3YVVuNFJFWExDK1NSVVp1cEVuT1FqQmJXZDZLUUtYQlBNanhTWXZiTTVs?=
 =?utf-8?B?bjVFck5udzV4V1JhMTFvWHlBaXk3bDlRVVdoOEwvcDVPVDlvelVwZTlDbnBW?=
 =?utf-8?B?clNGN1huMWJnREFlWDl2dUtjUTJzQzdHaVdUQTFPTVhLWTZlTE1Qd1pxaEgw?=
 =?utf-8?B?OE5NKy9Jd1d2ZVFyeHduVG5QSGpHSCtDZ2xCTmMwL05vd0NLZE50NXZ4bGxP?=
 =?utf-8?B?TStsb09ZU084RmdmWnlMQlFwMjdKc212MXhzZDBxaUo3TVlkcjBkS0szemhn?=
 =?utf-8?B?V3JXU0ZyRWlaMmdhaURQZDdlUkpWcjNiOWFlbTBRSEQ1eitkNElKU1RGbG5u?=
 =?utf-8?B?TVloUUdrZkNheHpvWTcrMGxKZ3hqTlNqM2RzYnh6ck1vWnZ5UUtLaVVmejc3?=
 =?utf-8?B?SE5INWM2UHpRWjhDQ0NZMEhHcmFRL3RVSkFQWFRnUFNIYUhkeEdUZyt3c200?=
 =?utf-8?B?Nk1saWFTb1BtM1ZmZGh3MDZwaEtQRVFoc29HdzE0K0RlOFRuSExETEhrL1Yz?=
 =?utf-8?B?L3IzZ0huRmNWRFhFVGg0bVBtajdhOURTRm5VVDFCK3lZVGJjc0tSZjVKRkpx?=
 =?utf-8?B?eGh1Q014UkxMM2JZRDUzdkVtKzV1VXdFdng0ditLaEZlUGMvV3I1akUxeERa?=
 =?utf-8?B?L3lOUmpqSVV2ZTVXVnBzSFdBUWNSWmROeWJ6N25pV0VHMGRpRHlNRTVSUFNC?=
 =?utf-8?B?NGEzRDBaSmRDZ2hJVHBkMEtkWFBSWWhrVkYvdlRFTS93USswMXhKQk4vQXJi?=
 =?utf-8?B?VHRId3dkalpQSVMzQmRhY0ROalBqZ20yRlBzMVBLejQ4bU5qRE90N1B6QXIr?=
 =?utf-8?B?M0VuMGJhb0R0dm8vUVB0dFU0bFhPd2lnVzlaYXhzZER4cHFJeE5IWkxCQlZp?=
 =?utf-8?B?OUN0a3dFS0E3ZWozSEVxQXlPVEJsZ2JwNDkxWWd5OEVuVDZSVTdSZVhqTFJP?=
 =?utf-8?B?UWh5RUZJYlVubVA3M09yUXFKREwvbGVNZyt2ODhLeWhwb2ovaklPYzRNdjJx?=
 =?utf-8?B?bFJVdWxqUkxXQ01HOVBLWTVGNi9mYUFRQk9YVmd3QlF2ZVJkdW8wOGlrRjVQ?=
 =?utf-8?B?UVlJbjhMUFhLbGRYdlBvZUs3TVJYZEJPOGtMd0thckVXMHJNQmlFL1o4WmE5?=
 =?utf-8?B?M0U0Zk1rdXpXYkhqSHFJWHM0RG0zRjRiMXNQdDFjMGJlTERMZVJ3T09DaHNh?=
 =?utf-8?B?K3UwYkZadjVzbEdocTk3WXFEazJXVG1leWN0ekRLR0VrUXZFMW5TT1JIdmtr?=
 =?utf-8?B?NmJvOTVLWFU5SkFPUE1Rc0dLakpQUHI2MSs1TGRuWWJZbVBmT00wSFZ6OUVM?=
 =?utf-8?B?dnA4ZVI0V01McGsvWjlUYmRuR1laRXlKY3ZGNWZjOGtqWnhRMXRoQWRnWHh2?=
 =?utf-8?Q?7BdQf2nmxLP95Z94xSINsGY0N?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa5fd024-27bb-482a-2236-08db3453e617
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 14:58:35.2251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CQfmDPtMjrBdlQJ3a375nZ7gluGXBUKFVDWw3vZQCNOxI/82FCyTZFWkxcxYHxZdhNE2uheuqBKc1vb9IiQb0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8760

While, as before, this leverages that the Map6 encoding space is a very
sparse clone of the "0f38" one, switch around the simd_size overriding
for opcode 2D. This way fewer separate overrides are needed.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

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
@@ -7778,6 +7778,8 @@ x86_emulate(
         generate_exception_if(evex.w, EXC_UD);
         goto avx512f_all_fp;
 
+    case X86EMUL_OPC_EVEX_66(6, 0x2c): /* vscalefph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0x42): /* vgetexpph [xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(6, 0x96): /* vfmaddsub132ph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(6, 0x97): /* vfmsubadd132ph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(6, 0x98): /* vfmadd132ph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
@@ -7802,6 +7804,8 @@ x86_emulate(
             avx512_vlen_check(false);
         goto simd_zmm;
 
+    case X86EMUL_OPC_EVEX_66(6, 0x2d): /* vscalefsh xmm/m16,xmm,xmm{k} */
+    case X86EMUL_OPC_EVEX_66(6, 0x43): /* vgetexpsh xmm/m16,xmm,xmm{k} */
     case X86EMUL_OPC_EVEX_66(6, 0x99): /* vfmadd132sh xmm/m16,xmm,xmm{k} */
     case X86EMUL_OPC_EVEX_66(6, 0x9b): /* vfmsub132sh xmm/m16,xmm,xmm{k} */
     case X86EMUL_OPC_EVEX_66(6, 0x9d): /* vfnmadd132sh xmm/m16,xmm,xmm{k} */
@@ -7821,6 +7825,19 @@ x86_emulate(
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


