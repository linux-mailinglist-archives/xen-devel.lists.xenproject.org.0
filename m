Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3533D6D4B43
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 16:59:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517501.802922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjLes-0001cj-63; Mon, 03 Apr 2023 14:59:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517501.802922; Mon, 03 Apr 2023 14:59:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjLes-0001YV-1o; Mon, 03 Apr 2023 14:59:46 +0000
Received: by outflank-mailman (input) for mailman id 517501;
 Mon, 03 Apr 2023 14:59:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dypz=72=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pjLeq-0000MW-GH
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 14:59:44 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20621.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28cb0595-d230-11ed-b464-930f4c7d94ae;
 Mon, 03 Apr 2023 16:59:42 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8760.eurprd04.prod.outlook.com (2603:10a6:10:2e3::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 14:59:39 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.033; Mon, 3 Apr 2023
 14:59:39 +0000
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
X-Inumbo-ID: 28cb0595-d230-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G5mq77nDTjSWCCoxWyRjwHhDlqQhIZ4O7Nys1zxdgGsK1GTEt+Ikse80QvIqBXOxaZ9bAdE3PPHxlGB1Mrs/BE9JvVGKYb3GoIiuzUy7OnPtz2psvVLX5WaHdoo1tGkHcCk6ghRvI3kto9ILk5e3ziDQunac+R2fhbe2iHd1vGqHAsWe8RwswW7u5z6k9+R+JHatzEQQrFpuo9NyosyrJI1oyIUVEhHimIFmW99O+VrarpklDmq/xx+ZdfFHXcjAa6QCe6Kz4Ym1T/0SqumFjzNzgcAtlFMCYezTi3oZRNStms0Bxrg4lHZLvSBPKdcV/QTfoTPJQP6UdnherJsU0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6C2XMdmMlevRHHkAtu6ujlq2vtpyDWTGQwl0t4wyzLM=;
 b=nANfu9XKPBGcYPRdHibN6R7xgd+IBoUVjXWEmSBzqhKBeSU8LUryeNn0ki/f3IpVgPvTYg7T181Nwjqh06xDGmscVql9xeEDQ4domX0KMONKXwXNVizVR43xiDTc4S2fNmw7Ya2qvr24c29IG/nmR2CzLNueCrcFDE3f//rUZJey0SPy0ABaSUSHdAGNBXqzpWtSzHdkbReN2WMxe8lQFXjshXQmx0VllgxFcxn/SXYNA5p9LVJwShMKdkK82JSUOGYHT/rChzZaPDoRw2qMQs1oIKZ2vkSSZRmZaKzgLxAodKzAqT31scvxr0YpHSVb2XaSPNbaUFABafBAIzZcoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6C2XMdmMlevRHHkAtu6ujlq2vtpyDWTGQwl0t4wyzLM=;
 b=QpzVia/dM/iOwWQz6zTHyK6Zrr0lxe7GLSG8WnRUZVI3rY1KyFhdx7PJiMNVpPBMrTdPjfZrxhm/UK48zx2ASboMAtjj9W6bvr4Oc0NxcYE5itUMQrNOEx5LnhavIOBemhed/BFa7E36f3WNcGKcxX+Xt9qFcRFc+8SUZU/vIlcm3ypb9GIg/88xuUV1vQoOchIXzN6RNfPwTsldd8np16/YuxX5ps9bX3PPyteTunKnm20Uma6pTbcETv9DTYPBH1oUDNRY80g9urO16zQDKToKNO8N10SZfGq1aBFql0sbZyHR/4+NjmqlvfM0ieZe3Y7hXiozJkfYk0YJf2ciqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <607132c8-2693-667d-f6a8-09f362cc7bce@suse.com>
Date: Mon, 3 Apr 2023 16:59:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: [PATCH v2 08/10] x86emul: handle AVX512-FP16 floating point
 conversion insns
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <8cbbab55-d670-5632-30ee-3e8ca352f048@suse.com>
In-Reply-To: <8cbbab55-d670-5632-30ee-3e8ca352f048@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8760:EE_
X-MS-Office365-Filtering-Correlation-Id: a1093b80-eed6-4d1f-427d-08db34540c24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Z23T6p0jTls9S1+36WHN2JS1GNM2UFWR1lXUTrmpW9Joyr7NxX2ZUt0vhAAObY+58hlQj/wUVlSuMzCgTy7wcvela4qSGxz6sluyCrZ84KIxr1oFcb6/ReaENHuxKIVq+wXb0uof34Cg/sRPIQAxWt/Ro/6LrL8murMQ2QqHR7AaylmEeW4kYC7w2HSZF6372eu6YNkldRsdBo8asUEmLa4ztGCu5rbeeOT8YnAM9sSud8WJ4Drsx7CLzG3gbTC6NNc70pPDBrVhf/H22B4JjQPA7fjSxpBXpbNfN3Hj+MMp8rmGHEMlCzNVOKXpx/uQhPACqxi3zlu943PiLH401FxDI57KYj52q0RJx15T9fptG4nysdTRJQws3U+kqBX/8Iq/42ul1Gz7yBImuaJ+rpw5fiFnmjC7Vc5p/Mtt0UrA8TXaBJGmGjR7r1HBpKb2di5Moo+VTCgf12szCVLd78kOg6hvfXTDEezrYqkXi6tmHVqbDw4eH++0Btv3tYb1VzBWE8OU3NW82htxcrm63XsVkOehC+92A3prT/FfdU45C4Momo8J+TbplagJgbnWBzQGN6dhtur/Z0HBK+IEGeCXKHPBda7tvYLoXyE9kgSc42fXz3ttwbxHztAqePuVepIbnEshEvqoJrBpB+aoAA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(136003)(346002)(39860400002)(376002)(451199021)(6916009)(8676002)(66476007)(4326008)(66556008)(66946007)(478600001)(316002)(54906003)(8936002)(41300700001)(38100700002)(5660300002)(186003)(2616005)(6486002)(26005)(6506007)(6512007)(86362001)(31696002)(36756003)(2906002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3VEQzNKREk3dkZJdERWdXlmZUZjUnQrRTBGaWFrYk1Ebm9ka0drWkluRnpU?=
 =?utf-8?B?Q0lVREczVGlMVzFJa0w5TU9IYUdZTmtCaGNOU2pvckhySUJwb2lUZmpKNFZV?=
 =?utf-8?B?SkFFYnFBQ1NOZklLSCtnWUtHYkdWQ1ZIUTZTb3VWckFKS3NXSjF3MXZ6eVA1?=
 =?utf-8?B?Y3R1cjgvMEpIb2VyVUlZREUwNElCODc1M0d5cHhBTnN5SUxFbjJpanVXVHMr?=
 =?utf-8?B?MXZucmdQZU4zN0FTYkVyaUVYdlBRZmF2cndNMWFDSHMyUTIyKzhSY0xGWnc2?=
 =?utf-8?B?NTNDak9OTXFXelQvNGlYaHlUaEpBMkJVenpQRk1mSXlCNW9SVTJWbUtkanV4?=
 =?utf-8?B?NTBNQytFYndZbUFQQ0VFWWJCMnY0Q0ZsS0t6SS9ycDlORUF0NUw0NUlmQ0sy?=
 =?utf-8?B?QzUzTjM5MUZVK1c5WVNENmFKbHVjRkpuOSttMXZVZ0pVdE1VMk9HOU5qMktZ?=
 =?utf-8?B?R1M4TTBoeXFrclBrZU40S0JjYTZjM041ZUUzN1JHRFhMZ0l2VVI1NnYzcitv?=
 =?utf-8?B?ZHp6WnR0SlhVM2c3cGpYUVYzMHdKNjJwNldWZG8xb0pwMUlscWs4TW0xWjFH?=
 =?utf-8?B?cWVwcER3VEh6TTZ1M0N3UWU4YXJVb2J3V0NodnBFWExaM0dxWmtBaDhJbHoz?=
 =?utf-8?B?ZHJGdXdzTzFkTVppYnAvVmgwN0hJcmEvQ2Q5MC9icTludExNWkJYaXE2Um9J?=
 =?utf-8?B?TkpLYTRxRld0bXdaMUFWQnlvaG9WNUtveHkzOEVJVnhVelArYmRPdm9idkNJ?=
 =?utf-8?B?eTJNcWdQdUorUkY5WXZvZUJKa1FYYUpEWWtTdHhUS1dlcDNoUWVBTXViOTdH?=
 =?utf-8?B?WHNqc3htL0lSV2h3Mm9Ybzk1dVgwOWhZTWtZbkU3c21VVE5XVkhrVGdpa1g2?=
 =?utf-8?B?TjRyS0NJZk0xRmtoczJmeVB6ZEp1WEhQWE81L0xmNXJMdFBNYWNmK1VzZ3k5?=
 =?utf-8?B?UXcwN3ZUV2hWUmVJb1V3RUZ1enNTbGVucWJWTk1MaE5kWDVMMG94UUFVU0dj?=
 =?utf-8?B?WE5GMDNBUTlqYkVpNC96RHgyYmhmSW9pWERGVms1cUJ5SkwxMFg5ZVNxQmVw?=
 =?utf-8?B?R3VJaXRmbEUxQ0d4VW9aVjFhV0dVNXhvaXBEM2Faa1EwUko4aGtOYi9SUGlL?=
 =?utf-8?B?VGx0ck1DdHBaMjVXeHJaMCtTN3JHbTRYWWZEK1FTNUJ1Nlhua1VUWVBCWHlW?=
 =?utf-8?B?Nm9FNi9neGg3YmZ4Q0VDa0lvOStYZXo1Y2s3SEpjSVJxUVI1dFN0QkM1ZDNJ?=
 =?utf-8?B?OU5HZWl3YVB1eFhRTnl2bXN2bnFTNUFNUytQcWZ5ZFpmUG5mWmUvQWpKV0g1?=
 =?utf-8?B?c3d3bmtreWxhc0xlRk44NjFEanVKMU9WUjZQOXJ5UzNmTHkrRTdzNkRCNE9X?=
 =?utf-8?B?Um5PVFllcnQxL1MyYm9uV2ZHMnFNZEhVOWdvYklKMHVNeXN2cDkyQmZ0VU9u?=
 =?utf-8?B?MVVZcE92MHhhQjlTYXlkMG9uK0xBcnVJVkhLVmRjNFJrQnQ3Zy83NFp2ZjlV?=
 =?utf-8?B?MlFnSkljbWsrTnV4SVBGaE8wa0ZpcGNlNlQ2TVVJbUVxQ2RNbGVOYjdNZ2JM?=
 =?utf-8?B?U3ZLNkgxWnhzRFRIM0xZRWppbnJ3UDJFSVJKRy9NOWMyN1Y3L2txN0x0bU1s?=
 =?utf-8?B?ZlZ4eElnSlVkWnpDRndqSTBHYWpGNm81L3o4T09DZVNkNnJ4QUFrUXNKRk5J?=
 =?utf-8?B?cWVXQXFMZjE0VUxLK3V4WFAzbUFqZ2czMnlLeUxBQUs5bUxyc0R3aGJWK2ZI?=
 =?utf-8?B?NUhjZWZqeDcvNE1nUjhaODVuZ20vNVk5REpnWENBUGg1eEpqbVlUT1pyc1Jk?=
 =?utf-8?B?MU8vN25uTUpCZGs3WEtzWjBrOUEvamlxaDZsTExLWUh5bVlhQ0VET3N4UHFz?=
 =?utf-8?B?VUdJSmg5R1BVVEtCYWVsV0xUYmhFR3hDbEFxeHp3cjA4SlFNaDAxRjZHV2hW?=
 =?utf-8?B?OTJMbllOU0tYeGhRd1prd1J2QjhpMjc5UVNDZXE4Sm95amlxSGZGUVBRdzVF?=
 =?utf-8?B?ODQrdTNRMGxxcEFGaUJZV29DdkFveld4ZEIrRVhtWnpOMzNLdGo0d3YycTE2?=
 =?utf-8?B?QUFPMnZVU0N6MVRrai9sQkNlQ2NnYnZnMS81NEVnWmc0Q0R3ZWRkMk5xczdp?=
 =?utf-8?Q?2t7JwB3yWwSvDmSy4u1XGlbed?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1093b80-eed6-4d1f-427d-08db34540c24
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 14:59:39.0230
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M/ochzW7QBuQbXIz+OxvSFpoxosAPCwq90fix46mGKLKJTCnQZk7eAIZWVrOHjHrqR3ohI/CSBo9f7VftYvnQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8760

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

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
@@ -1482,6 +1484,19 @@ int x86emul_decode(struct x86_emulate_st
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
@@ -1506,6 +1521,15 @@ int x86emul_decode(struct x86_emulate_st
 
             /* Like above re-use twobyte_table[] here. */
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
@@ -1526,6 +1550,17 @@ int x86emul_decode(struct x86_emulate_st
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
@@ -7778,14 +7778,25 @@ x86_emulate(
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
@@ -7812,6 +7823,8 @@ x86_emulate(
             avx512_vlen_check(false);
         goto simd_zmm;
 
+    case X86EMUL_OPC_EVEX(5, 0x1d):    /* vcvtss2sh xmm/mem,xmm,xmm{k} */
+    case X86EMUL_OPC_EVEX(6, 0x13):    /* vcvtsh2ss xmm/mem,xmm,xmm{k} */
     case X86EMUL_OPC_EVEX_66(6, 0x2d): /* vscalefsh xmm/m16,xmm,xmm{k} */
     case X86EMUL_OPC_EVEX_66(6, 0x43): /* vgetexpsh xmm/m16,xmm,xmm{k} */
     case X86EMUL_OPC_EVEX_66(6, 0x99): /* vfmadd132sh xmm/m16,xmm,xmm{k} */


