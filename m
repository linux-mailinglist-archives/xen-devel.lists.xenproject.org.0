Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FADB6E4309
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 11:02:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521855.810807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poKje-0004rS-I5; Mon, 17 Apr 2023 09:01:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521855.810807; Mon, 17 Apr 2023 09:01:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poKje-0004on-FI; Mon, 17 Apr 2023 09:01:18 +0000
Received: by outflank-mailman (input) for mailman id 521855;
 Mon, 17 Apr 2023 09:01:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1poKjd-0004og-JQ
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 09:01:17 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2088.outbound.protection.outlook.com [40.107.6.88])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68152019-dcfe-11ed-8611-37d641c3527e;
 Mon, 17 Apr 2023 11:01:14 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS5PR04MB9971.eurprd04.prod.outlook.com (2603:10a6:20b:67f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.36; Mon, 17 Apr
 2023 09:00:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 09:00:45 +0000
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
X-Inumbo-ID: 68152019-dcfe-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U5MEbVQYpXp5+8DjxUGREWFi9Gid34VIU2/OVfpI4sUbn+DK3nc4kSjQhnq+4+nkB3V+N+KV3t3liCeV6ve5hdvbqZxmHyzzE1Ldq+qAFTq6+lMDOt8nnTjC0KSTfqOkE+6U24a5oZemNx9xxhIIM7eyrFEeC02F3rpYFOX/7CO5UCteRIuEo7tSrsiEqzsKkqbhyrZJ1jPSeMXJqspMnIJCktE7n0UBH4UAM3s0v61ot+Tv1WQjikM9MwrVf5FsVXrSK/b78S3UtftRmOWrrc/FgdpOHEiF3W1aNE+zXtXn+QANhY7EhQ5Xrsx9yHxh07r4X1MxLrajlmNkfFAfpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AgHRfUQQeZNGr1AjVim4LvKvPYhcoG7vYUgFT7X9IFY=;
 b=kDlSdJwwK6BCWRf5KCtOBNKr2JppkacJ2LknFWkdxY/oI30EFVY8tnX+fSJXa0vn+Y7/Eqh4IItjzpO00q4RhNkghxVgHYN4NJg3UY4evX9t30HG3UG7WSI1t+8q55LR57x3LpRW8QwDiHylOtceiNDAp3aRj0YRFIItbnCZhONArZS8bFjnSwBmJPZkrQbxDRVzvIAMTtQtlA1p+wWrhOyag/tl0EwEu5YJFEKtePuMr+6Tx7M/69fIn7r/W5N5aJnTcluvcqHX4RNQFZNdx9vEuKEqFKVIkkGccHVJsvtvb4NHsKyVzglmGf+IFypVWAIQSEr7E2gR5JHH0m/3Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AgHRfUQQeZNGr1AjVim4LvKvPYhcoG7vYUgFT7X9IFY=;
 b=xp9O8jrzt0/kPHH8v24MO/VMqr26ZNvPC8PJYdRujpu/uCtou0oNoXpPPj5z5/6OsbcpnKi1IwCIQunJbdBNv14huxbbR7+kqI0MJ3ri7uDoIM/cxAmLlbhOB7KOfDtGkn2phFyhRf//3qn+ZZUck+88tgLQwCmKXzljbSeRGGw5XOeB/Rgbcquylu+E/cEImCSSMBEszmtG9gj1Bsph8nUU4fsL0mR879oLB6e3Ux6DwfX86Bn2FTCLjbDayD68EbIA9ttuLeDd5lrHzddvWRtEL2yczOv/W4tefML1177I8UDIMI9BwqL5SKvwSPKyqZnfu7S+6wjuIKXb+YROZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dfc9f77c-ab6e-a4cb-7fcf-4fa1d8371902@suse.com>
Date: Mon, 17 Apr 2023 11:00:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] xen: Fold exit paths in find_text_region()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230413192201.3255984-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230413192201.3255984-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0247.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS5PR04MB9971:EE_
X-MS-Office365-Filtering-Correlation-Id: b3434130-07dc-4fda-7cc1-08db3f223991
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	p4EfVokCjyx7fK1NvJKTqwhPUtTDoNp9UZrhH3AygOEAj7oDuwZ4stV1I2r9eFRQ26fKRuwmVldr1As9EVbmQHHUhUH1DKlwaz0XkYGZy3xDmb8UxqHKP5nZGdScZBXR9hojIbZAgyyafmLBqrY/Siq7OKp9Ni+ED1Ku/f7bxyaOsDA14XyQCxEEDgAUhIA/j8UlXYNHaGnpgFkfFM+5e0NT5Z3f/fQkiiu+dpPGb0mSo7uOtxrsynreA1AEkRHuX0pRmat/ThSg9qF6qsGcTp4iGZuMNEqN8GrwZJtppqKUi3Pe8JyGfVmXMKhZgwtIz2IZWOfugKGVB8PFUhBvJaeUxsISPut1kYz2f4rdfNtMBApXo9YdutN9CLzvzbRHSbr3xVYnQiB5BaMiehiw9AweEMUGWGEmpVxKbJQwtgbjt36tba15lkoltRW8HySk3y2CEFzMPD54NLsjHrZYjleqNrO4LJOF4OzKNqe0xSnPt1ehmGq7JASG9lev2k4yxJFlTLTwEE4pcaFE6ODwz8zyk1zbHAEB8LvKoeeiqj+ob2uE8RFm0pb51zlFC1lxcMr3/IqaYhY+DicQ4yFVBMnAyb4WBRArzijGK/bc00I/SmKkZe5GJv2qndms3PwzYf7zacCgS10nG/U2qbQBPg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(366004)(136003)(346002)(376002)(451199021)(316002)(31686004)(54906003)(66946007)(86362001)(8676002)(53546011)(66476007)(4326008)(31696002)(66556008)(6916009)(478600001)(38100700002)(186003)(2616005)(26005)(6506007)(41300700001)(36756003)(6512007)(2906002)(83380400001)(8936002)(6666004)(5660300002)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VytHZlJUWU5Lb1NPS0lub0FDS3oxVkJ4YVZ6SU9RTVdxQnRZREM1b0htejZJ?=
 =?utf-8?B?YWgwbW02TktpVVZxZXFUeWlWYzZzWGFzVVBZMmw3MmQrS1JoWWFKbU5zWjNh?=
 =?utf-8?B?QmtHVkQwM2c0ZkpMU01pWTZDakR2SHVPdHM3aStLa1V3RHNFczJyNTg5dFVH?=
 =?utf-8?B?Z1lRdllKK3NtNGZTaEx3NDY2Z1BoYTJxWHphaHE0ZGRQclhDOVNhQ1VDdHJH?=
 =?utf-8?B?OVFuQ0l4cnk0L2puWk1yZVZPMDhSM2QvZ2VyQnBuUXkrczFxeGlvZ0gwVDEx?=
 =?utf-8?B?TkcyUUxHbmd5ZFRDcGl1UUIwSENNYjlDazdSNUtZbVNhSWo5QTdVc2VYSjQz?=
 =?utf-8?B?QVQxRHQrREFJbmV5WE11YjRkbXVmVkJINDZoVndtNlRPQnFSN0xjUFRJb0Jv?=
 =?utf-8?B?SWd2OUNRSmpPYzNpbER3ZGhab212RjdBbXhtaHdSV1A4b1RMbzJXVCtnMWZZ?=
 =?utf-8?B?THN5S0FxbWtNM0xPeU9MVWhvTlJiNHI2UWY2MUtCQ3k1bHErMmM1bjJJRzhY?=
 =?utf-8?B?aDRCaC8vRXQ2UEU1cG40OU11Z2cyU0xMdkhzVExHdkV1cXNKWC9aTFF0NExL?=
 =?utf-8?B?WFhGK0JDdlpIcHdSTXJRcWpMOUtPTWRXL2tnRHlaQWw4V2p6NmpUYzcveGxU?=
 =?utf-8?B?ZFF0eVJYVHJUMUtpQVBlUCsyZTNnRjdmZVQvam9MUU9tNmdXbzdnRU0weVFX?=
 =?utf-8?B?OWZ5eG5JclNGMm5XYUNNK2Yvc0laMUIwM0hmaWVNSjFGRkd0dE12aThXV1Ba?=
 =?utf-8?B?T0g2bVVXeXlkSWlTTVlNcGNxUTJCaHoxVHdJbS9LWEdja2tFYWlPREdzTlBP?=
 =?utf-8?B?dnVJRlpQOW9xV1FKTXZ4bXBSSW5KS002YXZIRlBuUmFJMFJqcEZ3WmkvZlhP?=
 =?utf-8?B?UFNqNHo0eFk2NHQ1NG9wMTg0UnpEZ3FpK1RJTWErSmpzbDgxbHVUaFNGTmNj?=
 =?utf-8?B?OUpPMUwrZ3FQSkdmaENPOUR2ZU4yeEFPeEQ4Q3dJTmo3T1FJcG95ZHdaaHpm?=
 =?utf-8?B?T0NRN2Fkak5DK2Y1dDZNYkJSQ2VIamx0dy93ckh6SU9QR3Y2bU1vMnJJR0pl?=
 =?utf-8?B?YkxZYVN6R0tWTG9xTnBTSnpRc3UxYlZCRi9GNjFOTzBXRnJPbWJrL2R4S2U4?=
 =?utf-8?B?U3BtdHMvUTJYdDZFSkdmVytka3l4YjlpT1NBaGF2N3JvTnVDdHowUEw4NWVa?=
 =?utf-8?B?cTlQYit5Z0dOOGRGK2dOTTBOaTdVc01lRmZRTkhZNkZhcnRaNVptR2xSdVdJ?=
 =?utf-8?B?V2hFdVIyNkxpQlBDV256K0h0b0ZyeEhsVmZEMzBObzgvUUhwV3JyekVHVGNp?=
 =?utf-8?B?Y0JobEtvSmEwMGs3NGJyTEYxb3lsbXVyUlBzVDNNdk9JZ1p2Zjc2eUJ4U3JM?=
 =?utf-8?B?T0ZvUmt6cVIvZ0ZXYzB2YXJ1Y29JdCt3SmxzeC9TT0JPM0lNTlo5TDFWNnJ5?=
 =?utf-8?B?M0ZVclYzT3RMMzB2K0ExdlNwRnpCUmV2QnRwMWJVSGJIK3Nhb3IvbGo4Ynoz?=
 =?utf-8?B?L25pMk5TYlkzWm9PNDltMy9vbmk4Yk1nMm1rKzZxNHZnSWd2Mm1vTXlqcEll?=
 =?utf-8?B?RGVKOWFrcTExcEVkdWtkNEZKZEEveTV5d3FBUHR1NjN2WDBsRUZ3Um5aUkd1?=
 =?utf-8?B?WEJUalBZMEx1a2pKaEdPRnF4NmN6Vnp4T0VrSzNsWlNVYlJNclFrQmluS3lt?=
 =?utf-8?B?V1o2VXB3ZEh3MGdyUzFJMTV6YXNZbHdCYlg4b1VKakFkRmR0OUlYMHJFVHR2?=
 =?utf-8?B?WmNkRXNxbmVUL3BDNDk3QWQvb3BoZTJleVA0RzlzeFlqRm9ZUUJWTmxPM1dl?=
 =?utf-8?B?aWtlb2N5NTZaVXRkRVk1YjVHRDBSL2NQSlBtaVNwNldmOWtFSHd5SVgxU1JK?=
 =?utf-8?B?YnN4V2RacXplREV2TWZvSFlmc3ZqdkNMeGdwTGJMaXJuS01pWEwwQjJ0cjZD?=
 =?utf-8?B?NGhKSC9uOTZQSDJrbGxOYi96Qk1NNUZoVU9tTEFDS1V1S0xoVkZwVDJOK1VH?=
 =?utf-8?B?UjkzTkpBeW1TWm04UzhIL3M1TFYwQTRuaUlDZHVBSnBCVXBxYkVFSHpySWQ0?=
 =?utf-8?B?VVB6RWdMQ2Z0RFY0OWtGZWFrN01vb1c1TUJ3R3BhcVEvY01zc2xEcTR4bHZn?=
 =?utf-8?Q?RDfCTthOrSiVMQcysSr44CVb6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3434130-07dc-4fda-7cc1-08db3f223991
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 09:00:45.1986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QXPas/VWi0Nb1+HRfvMt2817jxRuaSK50OnDuXBgx54uxidUwkmoprWzj0EMTmnZ40wPO49dcglNGXZ56hqV+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9971

On 13.04.2023 21:22, Andrew Cooper wrote:
> Despite rcu_read_unlock() being fully inlineable, the optimiser cannot fold
> these exit paths, because of the various compiler barriers providing RCU
> safety.  Help the compiler out.

Mind me asking about "cannot"? Iirc the compiler is permitted to fold
even volatile asm()s, as long as certain guarantees aren't violated.
With "... often won't ..." or alike I'd be happy to give my ack, albeit
doing so with another maintainer's questions pending (and imo wrongly
taken by you as possibly insulting) it's never really clear to me
whether doing so is appropriate. I would specifically argue that ...

> This compiles to marginally better code in all cases.  No functional change.

... even minor improvements are worth it.

> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Preferably (unless proven wrong) with said adjustment and on the basis
that Julien signals his question as addressed (once it really is, of
course):
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

