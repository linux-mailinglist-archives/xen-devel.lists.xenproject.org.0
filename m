Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 585D163C2D1
	for <lists+xen-devel@lfdr.de>; Tue, 29 Nov 2022 15:39:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449423.706140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p01lP-0003vY-68; Tue, 29 Nov 2022 14:39:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449423.706140; Tue, 29 Nov 2022 14:39:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p01lP-0003tU-1k; Tue, 29 Nov 2022 14:39:11 +0000
Received: by outflank-mailman (input) for mailman id 449423;
 Tue, 29 Nov 2022 14:39:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EGMg=35=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p01lN-0003tK-Al
 for xen-devel@lists.xenproject.org; Tue, 29 Nov 2022 14:39:09 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20631.outbound.protection.outlook.com
 [2a01:111:f400:7d00::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94aa6f2c-6ff3-11ed-91b6-6bf2151ebd3b;
 Tue, 29 Nov 2022 15:39:08 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8864.eurprd04.prod.outlook.com (2603:10a6:102:20f::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.20; Tue, 29 Nov
 2022 14:39:06 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 14:39:06 +0000
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
X-Inumbo-ID: 94aa6f2c-6ff3-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LQlETgz0hFhyPmHf4oxK2JSsanQdu48Q2bN4IxhLmPJ44C1t2yu2BAs/Iu0LYBONav0ejyl0xIumzRbewx9QS0m8nXY8XJ/A0y7LbKEYmphxGGOnvEcbG61umJ1yPAH4N/3C14ntP/x4rJJ+M+ha1fwAQ+agiYbwMfK07TGIK+I9ifJbdGbDdKyNXgeMen1GYMURjFKDS7Tq5LVtTd+m1PwHWr0OyDmEbShFqYtKtPr1R5KGkJdLEVjDFQZvKiMJBIvOPn/ZiZiPPZ8k9ifV8E8WQaMRtlPo+t+XpG+FVxjmvW82G/rVgCxkxF6X9K0VPoKvdT7yn/hgy/0xkJdEow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a3OpF1woK9VvvQNT661w/BfGQpJYfrcyi80/QATXGsc=;
 b=cNTCv03GkKGrecL1mwTxNBwkLNETAaK3cdtlmN5rT2LvtqMnurPP7aXxImqpRRn8AsXJlxMzcHQRjjIv28n1mHOHqemQO1C9Cq0oA2afFLu1D3oX7ucEOXy2ELptX1QG5LMm6EccyiSVozp8uocmb24pEUwPCuiqzXp9wRR8AoQIjzvPvyKD5HQcJVKKP4AnPTZLfMyVghM77yKSxAalPjGu2Am+iehCCKtQT6kwDHHdPPW9f/+tlJZS7HWoWznizFNoKnesO9MGR+9E1IWEVVEK3P1o0R64UwandqiCB+KDBEcLLjdR/O5VIUzzqTu9Oo4WoAOCb1eTN2lwpYxtzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a3OpF1woK9VvvQNT661w/BfGQpJYfrcyi80/QATXGsc=;
 b=CrkRaHFdx+a20xgMMHGaj304JWzSkxJFpNmQUpWv5/0cLAMiVOs143Q0GHR0NLjkSM4dbs0PqMNnXwkFz4qStD+NW1eautINFWuZMufE502icvl3wX0HQXgd20kAkHg738nTH+lJ4vBhyi/O203Jzv62VXbusqaR/5VE4KF5jsh5TGC44oQ0wqtfTs2wmh9j05J/CEjxhT0e7FGi76+z0n6NfKYUhZXeS39kD+gDTTO2PaDHduOiP6exJwcRbUEVux8RKQA4gqln8bzRt8SNZgI/fN0ZnP9LX1/X6uYqdWivoJ6YBjV0NJkiAIY3lM9yn7GMoTynTfS0JbVrFXAQog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5a249b00-5467-1733-cab0-fd6d55765e20@suse.com>
Date: Tue, 29 Nov 2022 15:39:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] Arm64: make setup_virt_paging()'s pa_range_info[] static
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8864:EE_
X-MS-Office365-Filtering-Correlation-Id: e7b418bc-d9f1-4c9a-8582-08dad2177803
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vBy7WDwo/pJQFl8nAQHHiPwXTgdBXRg5IoOGpHD3kyWcCv74KZkf333fPsRkvIiq+y4/+WUf8KXvzmQCwShQ2cYwU5SUO9o/pESe/PeYwnrViDvloQh6dwTLACNtUWeCRZ+V5ubxU1LqoL34yQL5VOFsuW6rqN/4xRsQR043eX6midqO45JEvM6ZrG8FVS0Xgsl/h/aKhldhOi9Yb2a1SJUIfPM0YgCJo6d9ML3vU9MovxgACcSbEvwSTUehbN3Jz9q8jnNVI0/mKS8EcAGFsMCCKP5LRPykVJLWAkDP4MSeKLjKAmm0oHq9s3HC8UIv6o0bHm0lCHj3AIP037fwSShFxKcprn2IYIvToWLB2v3RpyTQmdzc8+QfctvAeFvkdf171zf21db49ZEzfGeLzHeDnGEZgTnxj0S+adaMfe3rxzI2fU4ZdafSQojwpqrP7eXDMaoQAlshYf72p867XCgMpRl/ME5gdz5jJKtuj9+VDFTGqU62OJfsKlr7ntrgyYF2zlvRop9Mi4DHzR7D+HcCtt4wOWB0f4GUoJetjf++UlP7yrvSGF/J7wtP8D9wes2hBBjwGI5UpMODJEF/35GqlGPFX1iaMvaoEJsieJtkhhCfAQrb2U/dOmuddeKQze3ypU/7KkRiMEJxVcPGjeOLmMgsiS5B6IZf4SJc1eNtPKYl0CpTuteLrDOux+iwh/L4YG97lGoIYZwRZaHbRGSYCvZ+yu1LmeWoy0+MUF8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(39860400002)(136003)(376002)(346002)(451199015)(2616005)(8676002)(5660300002)(26005)(36756003)(6512007)(8936002)(4326008)(316002)(186003)(41300700001)(66476007)(54906003)(2906002)(6916009)(38100700002)(31696002)(86362001)(83380400001)(66556008)(6486002)(66946007)(478600001)(31686004)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NS9XRmNlNWVab2hkcXZLcTd5Y3VjaXA1RDZEZ1VXaVJvVWJmUE0wckU1UllE?=
 =?utf-8?B?dTdZQWFlSWxYTlVWOStPZFNMMUNYVWk1TXJQNkVLYXBPVUcybXNTZENVanY4?=
 =?utf-8?B?U0tick1oQStvZEtXRWpxc1VVaW5BUlZGeTZtY3lsVFI1Y1NhTFB0eUxsRkgx?=
 =?utf-8?B?cEVWOFNOSmowMm53NXZBcFVFVWNBc0NOd09UTTNrdlYvblh6VEtoOW4zZ1VZ?=
 =?utf-8?B?ZFN2dHo5NEZRZWZDTmF4ODQvOHhTR0J0TVZjcHZ0N3QrekdicDE5UFY5Q294?=
 =?utf-8?B?d0FjcFM3UUQ0M2s2TjR2VlFhY2YwcVZXOXdNQUJTUk1WYlo0UFR0dWx6alFq?=
 =?utf-8?B?MVBveWFtNDdOOVROay9FaEpnR2R6NTUxemhyUlVjK09xWHR4U3dXOGYzeS9W?=
 =?utf-8?B?Mml0NlZPbzZvVGtVWWUyZGNLNTZCT2k4YjFxeFdHbXllTVZLWm5XV1drNTUz?=
 =?utf-8?B?UHJWeEJLUmY4TGhTY2tWaVNiQXVzVytZakErc3djRndzSUVKUmVMUHhTYzB6?=
 =?utf-8?B?Z3padzR4R3R1NTFscElyWlpkVEpXUWc5RExHbDhHelZPZzVTSWhaR0F0NUZu?=
 =?utf-8?B?c3pNMjVrWXZuSnRydVN1L2p1Y3FROGpXeVRiNjMyRkU1Ym5PVitxTzE0WTFS?=
 =?utf-8?B?bjZ4blZCdUN0d2tSbnBuUy9tcDdIU2E1dFN0SGp0TlErVDFHNy9nb0ZCZUti?=
 =?utf-8?B?UlRwVkEwOVFwNHBQTmYrVC9DSVZDdGs3SndIYjM1MXZGQkZxWjFtbGl4ZkFy?=
 =?utf-8?B?c0VycXZGbitiRHRoc1ZlZkhZSDcrak13aTk2K0lIeGhZZEIwcUYrdGM0STBN?=
 =?utf-8?B?Z0d6SWp2MTFuaXJLUXI4SVBiVDhUTzJEMGNHS3J6OGd3NkRmYkR6SG9UdEJT?=
 =?utf-8?B?VFF3MmJIWkxLQ0pVdUtCaTRvaVpkWjduNUwrK1hpRkRic3p6VGNYcnNQOXNP?=
 =?utf-8?B?RnAwZW04WGNnSC9NR2NNZ0dKVlpWZkx3c2kvYSs5cTdOeGpza01pM0lWTkpn?=
 =?utf-8?B?Y0tVUGZXODFNRDRJMTAvK2NHQTBOS2dqYzNFbnBRb1VLMXNrTWRWNjdzL25w?=
 =?utf-8?B?U2NUVVh1Y1BCRW1TbjBtZE5zUDJoMEhicGhXRllaYTdrSFg0T1FUY3lqVlR3?=
 =?utf-8?B?WFZwZ2d3WWJGQnZUR2Z6TGg3aE5GQVI3RmZnc0FLVzdEUTRTTjdIV2pOL1d2?=
 =?utf-8?B?YmFSSjNtZTRVY204TnFIaWVNdmZqczA4amJQZjYyM3p3MWxPTERlNi9ROWZE?=
 =?utf-8?B?ZE4zU0hNRnBSM3FuYno5YjdaaHdDUXJ3bmJoRDV5SitmU0I5V0JBQ3ZJUGR1?=
 =?utf-8?B?T2wvdCs0SW5lSVB0QlRQaVUrbndsdlNrQ2tQVGRtakI2RDJQQzJtZC84M0Ur?=
 =?utf-8?B?RGdrVU1UeTdzWDZEVGZZbG5jU1NqOHZSeVY2aEl3cjNyTGQ0RVk0aFVkZ2Rl?=
 =?utf-8?B?eWZ3cG0yU2JUNmtaWW02VXFmL2dRbTh4cGZ4Uk9nMWdxOENjdk5xcllGY21Q?=
 =?utf-8?B?cFlITXgvNzVVaWdlYndFOGwvQjI5aG1tUWovRTJRSmx4VHAxYmx3eG9EWTdV?=
 =?utf-8?B?b29hWHg5UVdmTXJ2ZExZZ0dTUjJrSlBmc2twYTJwV2R4dzlPb0Y4eENGMTlW?=
 =?utf-8?B?dXpML1FyTVI0YUVFNzNRTWFPRUtheEhpQThuSGJCUHQzaEcxM2lUb1B6eURL?=
 =?utf-8?B?UG5VdzJFVGNnNTJUY3VYRkZ5aDEvaXg1eWxGUnl1OFRvMVZGYllNR2c1ek5T?=
 =?utf-8?B?ZGl3QTlJNzF6dXNEMnZNcVBWU25mamhIYW5kTEVCdXRNVkNEWmVyVmY0UGZ5?=
 =?utf-8?B?QVU0M1I3RzhmL1B5SzhDaXNsTVh2NlZNTVlXK1Jqb25ETURia0RVNWNlSUs2?=
 =?utf-8?B?ak5kRUEzbmdEQytidDROTEtJYmJPTVM0TmhZVGt0a1RWTGN3TW03bFV5eFA4?=
 =?utf-8?B?YzRPUFVmTFcyU3pLbGJnMnpsbDE3SHpQL1A1VEVpUWhOQ2RpSXBhbWhYbmVP?=
 =?utf-8?B?OTlBZExhNVpvaXNPVk5kN1FDUlNZTGZwY0trTFIxUHM1MUZtVTNPRmx6dEZ6?=
 =?utf-8?B?NVRlT0pzYTJ0cTNFOW5COTJEcTI1Rk1KTGd3endYM0V0T3NuZ3NTSzR5SVpK?=
 =?utf-8?Q?DH73W2IHPDXuTs8pq2hveGlPQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7b418bc-d9f1-4c9a-8582-08dad2177803
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2022 14:39:06.7642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c5MblNbD/nWZPtyH2TEI3b8Werl/J/axf5rrXh9iIoCqjF0DN/0O5AAEwDpJ2JlyespXQeUKm5Ad35gLYiPzdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8864

While not as inefficient as it would be on x86 (due to suitable constant
loading and register pair storing instructions being available to fill
some of the fields), having the compiler construct an array of constants
on the stack still looks odd to me.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Actual space savings could be had if further converting the field types
to e.g. unsigned char (all of the values fit in that type).

--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -2281,12 +2281,12 @@ void __init setup_virt_paging(void)
     val |= VTCR_T0SZ(0x18); /* 40 bit IPA */
     val |= VTCR_SL0(0x1); /* P2M starts at first level */
 #else /* CONFIG_ARM_64 */
-    const struct {
+    static const struct {
         unsigned int pabits; /* Physical Address Size */
         unsigned int t0sz;   /* Desired T0SZ, minimum in comment */
         unsigned int root_order; /* Page order of the root of the p2m */
         unsigned int sl0;    /* Desired SL0, maximum in comment */
-    } pa_range_info[] = {
+    } pa_range_info[] __initconst = {
         /* T0SZ minimum and SL0 maximum from ARM DDI 0487H.a Table D5-6 */
         /*      PA size, t0sz(min), root-order, sl0(max) */
         [0] = { 32,      32/*32*/,  0,          1 },

