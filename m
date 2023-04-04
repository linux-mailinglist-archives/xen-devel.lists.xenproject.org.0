Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 659536D58E3
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 08:47:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517652.803322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjaRQ-0003ww-Ic; Tue, 04 Apr 2023 06:46:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517652.803322; Tue, 04 Apr 2023 06:46:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjaRQ-0003uj-Fo; Tue, 04 Apr 2023 06:46:52 +0000
Received: by outflank-mailman (input) for mailman id 517652;
 Tue, 04 Apr 2023 06:46:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pjaRP-0003uN-70
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 06:46:51 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2062a.outbound.protection.outlook.com
 [2a01:111:f400:fe13::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7937d7a4-d2b4-11ed-b464-930f4c7d94ae;
 Tue, 04 Apr 2023 08:46:49 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7972.eurprd04.prod.outlook.com (2603:10a6:20b:236::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 06:46:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 06:46:44 +0000
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
X-Inumbo-ID: 7937d7a4-d2b4-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TD9pz/84qduABV1TQTEYHXOTnwmLiWEAMoA+2g9ssPxxgi6MeQd+6+5daIlhUApcY6yR/u4PRqCTC9BKfixH/i/5f+JvQv2ewH2hj6PAyk+7ZQ68kRslOt9aTosFnz9e/sJyC0z1pBMnlfAor/1DTbKvfYLs44JfTC8OWUSNPQr2w/xpWRW/lTG+SXLLCu4kZx+T2tlrT2ziDufPLAUxooaIOrwKoODhbkFQqcgUjoU+8H/vphqLKtlJqvx8O2+vomcx6T3uk3qaKg6L+g49+CoL2JcXuYAdr1L8Da0GBiNynGODo1AwcLnFxYuypGQJV/k+pSCK4Ykd2lH9O8uFSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TawaQTZiKD5mX4SgPj1LVmMbrtcalac5mcR+lI2S6YE=;
 b=PbEgIQUgk7uMQwu6SJnS7QJWhWBXXZg/9q6LbHU4XaMu+xWrWrbIkKxSMcwVtnOCwFZA+WpSJbXv2pF/NVi2ct4xIJYnMh/tp3FU+CtA7Iid7wjQKbqSKjuBIIF4qBIvv/DoLSRXo2Os6ZZ61K94OSnbm4iQwP1lc2hSrczyiGkjnNY+XVOhQwWuh/cm86zB0YEBeEgOkPmSutBgmTR9oarxLwpwzICKTaqPWgPayIoq9sJKmFswaQapdpIhxL3vuk9eO/ObB0TUNWW8DeZpFKnutejcnE5KeIi1hFaogc+F9QdVQg9d9tTvTdY3mngg7UH5bmc5tMN1bPed96BCBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TawaQTZiKD5mX4SgPj1LVmMbrtcalac5mcR+lI2S6YE=;
 b=iv4anSFO6uQ3O9YPyLXDqs0JGJ6EdWUKaDfL10lxcXkgUmUOzhVeNG9S/aByRwMjXl21QppamL8QcICNmpX8Jx3b496aPuQzPGgFVRVzE8CcWMIkagntBw0Y6NsrTkxt7/BoYEC95+xJ+iajmsiAIAkT52/7B/ClfqbxjimiW/vJv47YWUVnNBu8kLq5yaOJa3enw0YvAiO8y+ktwEcqlFd6rSj7XlbDB89PHZYUdmLVom/cdlvSeAOH54IjBEKGNg/cOOoGDB6ZjiwhYDgQRxh6ZMiVXOvrNGm6Yja3XxJ94YnN2mgMeITaQDFrWnTEPcxV2NTpBDeB14x+T0NwuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d4fc10a3-abe7-1298-daac-00c96147c7a5@suse.com>
Date: Tue, 4 Apr 2023 08:46:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] cmdline: document "extra_guest_irqs" upper bound
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0044.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7972:EE_
X-MS-Office365-Filtering-Correlation-Id: 437e3e65-02c1-4b8f-0f43-08db34d85a9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Pr12zN8Ib6ncSZuJ+iYF+JZnzH+p8BIvHQO7mK4qXsovcfBs9A+bDw6o9hT/OTlv3TJxkw0ia9qiJmsRAPReYgkw0p8YxlKf8nWyVqaVdCMaK/gmEMbm5OTEv2BdbJ7xWsQh/ZXfWbuNFkS0ST/A7fJBkDGi6sqOPVnaX371bXcJE1GXb638ykHe1CnKAoXtnh+Hc5U1T1vB9a2JEzG4wGh7QP6zB0bkpyyvXdq5gggEzon2/lCJKvRnJ8qzK2ljO6jgF/saVpwrnm6koHMFmWu47l+PxWPv+FqPiHBDgSMg+CAO4TyQjUr0n0sAXYaCoXu3w6JWExkPyH8ZR+YIRAbPorn2a31nsLFts7gqEM0zY0M13YjNmHbmgXVcCqvC2shkbyYQecDiVy9yWtWquZ99pWVsAh5o/92NYI5Kf1ch+SpPbaEQYUvLdpyepUes61K2423mC6tB6lcKkCg4dCiuQTYcDBqiJU6hci1KYsW+pg8u62mRxjuMIskKtEv4kp7HDqeOkt7EXBSpDkFZnVTg06aRCaOEqWzgOwj4MwCJDH6QeIXCpP0F7aKwBN5ykArtgljq2FaFxsoSIouD3foRVpb+yuL6KqfRbAFJVJnqKXC1vCWOfc0baLLGM2/etIDljBR6tSqdIUutnzipBA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(346002)(396003)(366004)(136003)(451199021)(6486002)(83380400001)(36756003)(2616005)(38100700002)(31696002)(86362001)(6512007)(26005)(6506007)(186003)(54906003)(2906002)(316002)(31686004)(5660300002)(41300700001)(8936002)(66946007)(4326008)(6916009)(8676002)(66476007)(66556008)(4744005)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGdLa0Z6Mll6Tml0a080S2oyWm1GQXVOUTFPOXNZa3ZSeWUyalVycms4amN1?=
 =?utf-8?B?bVJrY3dqTlhGaUVuand2ZWM2QmMzNHFMK1Z4ZTZSdzBzSVI3dDI1a3EzSXFK?=
 =?utf-8?B?MVpDRnJBeGswYTlJcGo5Tzl4Tis1c3JPdUs3N0FWT0VxdTZXRXNYK05oQjVW?=
 =?utf-8?B?UE1kaEFSU0VKZ2UvV1ozR2NGZm1LZGNJa2tFMGVHSDh3b0RBMGVRUWJjQWYx?=
 =?utf-8?B?U1BxWXYrNzFaZzRGN2JwTW10RFhLZHkwOEU3VHdYZm5QZVhpU0p2KzlzaThS?=
 =?utf-8?B?OHd1S0lwMzFEM1dtY0ZHbHVqbWtobWtCK3BxdGdMMnlENVI4OW5wamJNR3Ur?=
 =?utf-8?B?MTRYZ0FZRnVQWHRHeGEyaEdsdFdOaU5PVmF0b1U1dDlmaXQ2ZDd5V0txVUxU?=
 =?utf-8?B?aFN3Y2JwWTBuTFE3TnAyVkpzU0VBN3A1Tzl4U0p5UkhoalRwbUhSRmo3ZFds?=
 =?utf-8?B?Y3k1NU5ZR3U0akVjUXlKaFRTeHppTFRSM2FKeTVNMWFzY1NDK0t6RUpPOGhn?=
 =?utf-8?B?K2ZRdUptMkV4bzJNTE5SdTZEb1V4cXdpVEZ0Zkx6NnpkN1V3QW81Si9jTVhh?=
 =?utf-8?B?d1pOK05NMndMQmNYWHZlbXdWcXlpelVodVpLa090NHV5cTJDMElPZXZqaDdH?=
 =?utf-8?B?TWZ0VjJEUjRiRHF1QzN2OU10RXJLOGRoSmMxeXl2TUdQamFVbDh6ZThqN2c2?=
 =?utf-8?B?bGlnNEdBV0RBbm5BVXpRZXFPYUNlK3BRajN3MnJCS3kzaVVmRkJLb21ucHZF?=
 =?utf-8?B?UEJ6am1uT3U5ZVkwMEZicW1NK1pzN0VaQ1p4OS85WjlNWUl2dXVua0VHWHVy?=
 =?utf-8?B?U2VYbUt0akNhckxveHAzamxEMzVGbFArdVhnY1lFNWFuektQUFljOGxBT0Rj?=
 =?utf-8?B?d3VWYmlTRU95Y3ZNSm5tRUdhMEtNTllBWXQrUEpJN21lRTgvTGdpUjhtdXNF?=
 =?utf-8?B?UHQvR3dJZ29BdXUxRzZSN3dGdmplUkV3bTJrbWFlTWVyUXd2RzQxb0ZwRDM3?=
 =?utf-8?B?R0NjWjlqdzRvK25Qcy8xYmxaUU9BenNRaGlxMVJDcG96K0U0WEV0QmRGdzdU?=
 =?utf-8?B?Um9CK2dORVkxMEJYaHRqMWxibi9hRURTZS9oR2d2Wk4wd25pZE5pRjM3MVNW?=
 =?utf-8?B?eXpUODN5cEpkS2NrNUxEMTN6WUJYSEFDbDNVSlpZYlNJRVNzK2tNQWw5YWRn?=
 =?utf-8?B?aytTdzUzNy9HTmZveUdscHlneXYvL013TzFTemRldFBOYWt2bTl0bUpQWlFl?=
 =?utf-8?B?K2hIKzE5V2dnYWtraUttdGNLc0RVODJOeTZDazMvY2VDUklwSmZiT01TelpO?=
 =?utf-8?B?OXVJVWszR2F3TVlFSGg3cHRJa0lnK1pMZi80dGRkR0QwQmNxWWVHdkNqVkRO?=
 =?utf-8?B?cVRDSmh3WDVSNWUxVWNSVi9BbUVIelZBdkpCRTNVZW5HdHNtYTBzZDNSQytt?=
 =?utf-8?B?WTlDREtxTXdvaEdyWnpOajY1ZnBsYjc1SzNKamtiN3N6c2ZLTmQvd2dJS05x?=
 =?utf-8?B?d0RKaTNlOVhGc1REQW14aG14OW50UHZ5Qk5Pd2hJOGU3R3NicGxaWko5dnFH?=
 =?utf-8?B?UmtOeHVNU1YxRXZVd0o2Ni9Gb0N3ckoyZ29qeGVSajdsQzA2OHFTQlVIWHEr?=
 =?utf-8?B?WnErdkZqM1VoL3VKbDhFdFpNWDVKckJiM0d3cjNTcXRrdE9lRk51OGR4UmxU?=
 =?utf-8?B?ZHBBVDhPTFhLOUQrUm9jYW1zSVBYOFpKNjdVa29aWlpHS2hEbTNQQTRQNjh2?=
 =?utf-8?B?VUcrOWx2RnBrc085REZUY0QvaDFzVnlvblJSQ24vdGIranpsTUQwU0tKbGVP?=
 =?utf-8?B?OGhRczlDY3RBTGZIZEdlZk1uSWp1SXZ6VzNqaHBzbDFjbWNaeDJBMDRwYkYr?=
 =?utf-8?B?UDlWTVJYQ2RZRFJ0S0I2c3c3TjUyQm1tMW5HMmVqMkVEVnVid3RDOFZWSDBS?=
 =?utf-8?B?ekRaTklXQTVjTzV1MjF3RC9pRTBuY1ZMZGo5eXMvdWtNUXlnMnNIdWkvS1BD?=
 =?utf-8?B?SHhlbUhvM3FhaS9MYXNVSnp4VGFEcHZMNU1hRVV5ajJlWWpja0xPSC85OTZz?=
 =?utf-8?B?SE1TYTNuNVJsUk1BL1BBamh0L0d4RGF1czVZY3ZlU0Q3Z08wUUJmUEk5ZXRO?=
 =?utf-8?Q?rp02GRQEk9P0u4r93OZNwJB1Q?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 437e3e65-02c1-4b8f-0f43-08db34d85a9c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 06:46:44.2529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l/hi71BTg5MHwRvQJhIZ8g67SWKG8zgRh9eV57sLX+DeVGP+ETWKB42St/lMBlGfn22XFCbemf4x3lB7HdL6TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7972

PHYSDEVOP_pirq_eoi_gmfn_v<N> accepting just a single GFN implies that no
more than 32k pIRQ-s can be used by a domain. Document this upper bound.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I was uncertain about also introducing a bounds check in code: We don't
check for bogus / abusive values elsewhere either.

--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1130,7 +1130,8 @@ common for all domUs, while the optional
 is for dom0.  Changing the setting for domU has no impact on dom0 and vice
 versa.  For example to change dom0 without changing domU, use
 `extra_guest_irqs=,512`.  The default value for Dom0 and an eventual separate
-hardware domain is architecture dependent.
+hardware domain is architecture dependent.  The upper limit for both values is
+32768.
 Note that specifying zero as domU value means zero, while for dom0 it means
 to use the default.
 

