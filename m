Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED72E7F1884
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 17:21:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637103.992842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r571j-0006Dw-8W; Mon, 20 Nov 2023 16:21:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637103.992842; Mon, 20 Nov 2023 16:21:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r571j-0006B7-5M; Mon, 20 Nov 2023 16:21:35 +0000
Received: by outflank-mailman (input) for mailman id 637103;
 Mon, 20 Nov 2023 16:21:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9+lD=HB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r571h-0006Ak-PG
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 16:21:33 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062c.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ddbefd6e-87c0-11ee-98df-6d05b1d4d9a1;
 Mon, 20 Nov 2023 17:21:33 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS4PR04MB9364.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.16; Mon, 20 Nov
 2023 16:21:29 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.015; Mon, 20 Nov 2023
 16:21:29 +0000
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
X-Inumbo-ID: ddbefd6e-87c0-11ee-98df-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XNB21WztLCqmYtUv/th9GhSwPFbQTL+QSahS46OfyMIVuUtzQu4+XftGFgXn+XusFyXxWCvmM4zsHZWG5wS1uJCoeBENr4oIMmG2ouIpf8bgdnSqRWrgfKfoJhLvwcfTNmuKJNPjDx97f+KZQAphirURUk/acBpH+HKlR/COt3drsyINWFwu+lROTtufhBDKrG6ZOz1jQHlY258lVE3XtmvXUvWlarnW2cIiJzxNGt41TRdrxS43SI8f6WFbboqWiEnOdmrJaChQYsBlDK7X12zeR49PVIlxNhV/LigJOzIliBXrJ0Kwhy6GjbRK2j+ZzBT4cr09B6k31l9VYmfHkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0TXhZdvNeag9MoJq53HDCaS8i9hhhG1lp0lqEYY5eMU=;
 b=EfzN/D2BEF2iV2iz8A/LYA3lPSH1FH+JAvfsr5/5HMTTp6bJ82bBF+zmtr3Z9jC+WdI+Q1tMDKOq+YocoL7CTDUj3bDncpChmvK0Q1zvkzxCai9HhyqgklR1lAB0W2aniccHFbP06haPf6P3lPkCz8tffkmSS6pd9U18exnV8uY2pil++MkcRo6zieGknZhUZxG2haPsoiGtOlBO9s9x9NJeKK/RrBZwnDL+HZO1LeUIZH7N8QYCGppI0ZIDlvwsQt5dhkqJI45z5XaX1Hw6dxDbio4mpF/vE8IdUr/zpMN/ToB3c99skKbd3PHERveV7//kTOdndi3NN+wWakGiWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0TXhZdvNeag9MoJq53HDCaS8i9hhhG1lp0lqEYY5eMU=;
 b=D9RITzEk72LRLnMglNVGx9MGnwerBvG1JdT6iz1NlgKhSTyTNKCI/PggagpP1wphMGLUfUUab3gZtCR646ANhAZGFpFtTCOeD4dAtSU8EFD0xO8zj3ZV2vaOueUDk2j5BxGln+cUngktQTvSlxiZ4DbXHdJ4CKd9FRhQXMdnK//VHD6NqN/Om0SGHPzREVEYvyTrmqko0mFFtbAe795MNvvlwR6CO9Te+xTtEdtwQzVeQgdgrIOnsauZmNrk/z2/00TJ3MingMkk/Qly+yryU58vlwdbuRgnKMXEmhDEvAOJeehd12rDBL2l9V/RBH6LB4cvEMuJprUTyf6DBpOocg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <79ae6437-6e2b-47d6-87c1-5bddcba51633@suse.com>
Date: Mon, 20 Nov 2023 17:21:29 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] xen: Drop bool_t
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20231120145623.167383-1-andrew.cooper3@citrix.com>
 <20231120145623.167383-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20231120145623.167383-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0032.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS4PR04MB9364:EE_
X-MS-Office365-Filtering-Correlation-Id: cd7d94e7-9ce1-4f7a-bf82-08dbe9e4c099
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0WDnLJ4Wm1f6+pm+Wzf/+NDEOWcpvP7vaLuxCDmGiDPEvcjgxm6eKhQK8Izi+RuJTWy5+C5BclhQ/iEp/X+bRaW1GcDavBmjDo5S7Er4EBqgobbEDBG9oLziyR+SIrKrmnmE+neTz2Ncrr/umwHPCdLgtJCK3KGVpPwI4/Fh1CSNbuV3GYV6GW0YtCCH9VNRLnuH2retwFsDEmAy1TmrqQ8pb8RKLmqKqdYRwO+1rwyV+JwLGfwatgji5VMNi2bXaK5NaJ+3pr9KVDglFmPZRgDz6G52qbUMbSs+r/DbgbK9cyDpO37em0mf+GCpJCBYNaRh0tZQ/D7US2PVkhhL+iu7Yc9C1yz5cadFFFIl5tP4aqItjAiOXg1OyrmMArSmu1tEIBa11iw33mywVYwE1jBp1p7/Jgb7eD8YWazKcAvQR4zRJJRfaNBO7Q+3/aPST4bdNmJ64+8nr7/ydDsu6GcWCuWEIDJixnzEsh+GWKJC5K+bPDdSltYqg5pRa0Thgrl2klCzUaJcTMX+mlqnCI2KVxCA96+Gt4iAHK4rwLrk9d2Wj/e8OhYgrYx23ETyDRSiMKbBoHuWpz6tZe44dZvbRwXka0EkPNwCz+ym/wluhaYJpYjgsKMCYNsJdDehhJFugY9JT78NPpFUNO6Rog==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(39860400002)(366004)(346002)(376002)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(41300700001)(36756003)(86362001)(5660300002)(31696002)(2906002)(558084003)(6512007)(6506007)(478600001)(53546011)(6486002)(26005)(2616005)(38100700002)(8676002)(4326008)(8936002)(54906003)(66476007)(66556008)(316002)(6916009)(31686004)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzVXZWp3VHZyQWtTMjhkUTQ1djU2ZzlBZklLYlNKV1JhU0lIcFI0aVc0eXdG?=
 =?utf-8?B?YmVPbmlMVUFIVGkzbkhGU3lRUG9UMmo2dnhXQjg4VGI2T2Qyck5ybGNqdStG?=
 =?utf-8?B?MGZSZDZQUVJEL04rNkJ2d2hEcXZPbXNEakFMbVpSTnBiZEFiN3d5c2NOQWVB?=
 =?utf-8?B?NG9DRDhkdXU1eUxUSi8xUjJDaWNGVFpoSy9QSXYrVU0vNWF6QkhMajhhQzhB?=
 =?utf-8?B?R3JueEJqcWk0amZUVG1LcmwweDNETW44amFIQktaclp0VzJlU20zM1dHZGYz?=
 =?utf-8?B?NXZPdFRGZjlRK1AzL1hGWWkzUDVBb25DNW5rcng2V3VTNWNuZVp2U2l5eDc2?=
 =?utf-8?B?THR3dUdmR3JxbG5kK1RQRnZUM1hjZU41c0FpVUtOTGowYWp2WVplMFBIQmtG?=
 =?utf-8?B?UjFvN3Rlcmo3NlIvK0Npd0NTVlBxVVJxKys4QlhGRURmY3dFVGs5ejIwTzk2?=
 =?utf-8?B?dDZtaHNIVzFHNis1ZUh4M1plNWhva1FNWU5NL0toVkVjTDF1N1NmTWQwQ0Ex?=
 =?utf-8?B?T0ozL2oyYVU5dHVldFpha09CMUhuQW5QK0hMVDd4MmgzR09oMXpFL0EzY1R5?=
 =?utf-8?B?a05nWGdid3EvQ3RQS0IxVHUrbndnVWtocnZJRFM4S2pYRS9lL3ZaY0xOWG9S?=
 =?utf-8?B?Zkw4amZpbGJKN2NxZStkYlorQmJuREE5VEt3R0xQSVY3RlJGVEI3WHByNXJx?=
 =?utf-8?B?YWdmMG5hTURRWGdHM0xlc3JhZUt3d0lyUGhOZWtnRktjUUNJdmM3YndsVjFk?=
 =?utf-8?B?bEdnblFBREZabzZpRVYwQmI4aUFZMlV5c29jSnVqdDRpVkN4MUJZWU5mbGRa?=
 =?utf-8?B?QlBYb0JGT3A2N29aS2w3RGxON2hKYmZUeDdHYWxOb2dKM1h4elVpUHErUFl4?=
 =?utf-8?B?aFY2cmhYRWcyelh6MGdSdlJPN2JIWUwvaVREQllDU0UrajhyL2ovbThoaGl6?=
 =?utf-8?B?K2lNSG53WXJIZS9Md2tDdDBoY2dPZ2txa1BuS1ozTTZNVTltcjBqUkNESHdI?=
 =?utf-8?B?VW1tdFFxdEZrQjNFUDdIN2MwejNPenR6TjRQN09Eb0VmdmtRd09uWFFPMTdS?=
 =?utf-8?B?TzlQYmtXaVVRUU8xRCtlZXl0ZFdMNUErWnpMY3JJOHI1QnBMZmhXamcvb1Rl?=
 =?utf-8?B?N0dsR0hxbXNzc0xpMzBacUVSRzl2SXM0WS8rRlhSV0NqZS93L1k1UXlZSW43?=
 =?utf-8?B?bEpLOGFzS001ZjlFdFhLZnI0bFBzSUFVK0FGNEd0dGwyeU1uVVpMcnVXVHhT?=
 =?utf-8?B?TGxFMy9VOUcvVHg0dGU4c2xEUVhiSTMwN1VFYkFUQzF1dlR4Z2N2VlBIckU3?=
 =?utf-8?B?YWsrbzk1OXExRXhMRzY0ZEpXdUc2U0Q1aVA1WUhPV0NjcTZGdzI3YWFnekgz?=
 =?utf-8?B?SUhaTDN0MEpJaUdWb0diRnd5OEFhNzdUS3dxSFFsQ2dFeVdHM2phQlJrRHlv?=
 =?utf-8?B?VUhrMVZXUUkyOEpqcGRCY2w5dG5WbTd1MjFOT2RETy9aaEJzbUVxaDV1Mm0v?=
 =?utf-8?B?TFpoUWlMUzhVUlNVMmR5STdkZ2thS09qY041R1N2Wjd5TGdzQXNESnkvTkRK?=
 =?utf-8?B?cTg5cGNSR0gyQUNsRzNLS1F2QlBIbDkyR2RZZ0ZPdFlGb0JoZm5QT3BoaGRY?=
 =?utf-8?B?YUJoWVc1S1hIQzZmanRFNnpPTERsYVN3U0ZseURFbUM3MWhmSmZUUjVQeFBI?=
 =?utf-8?B?eGFKV0Mxek80NzUvWTB0WTd0SStLaVVHUkRQakNVZ3R5NjlHNENyZEpzMXdu?=
 =?utf-8?B?L2JzcUp2cWk4TWNUb0Yzb0ZzVEhjajNFV01wUklMNkVFbmsyKzZsRkt2aXM1?=
 =?utf-8?B?RTF3Nnc0TjhJdzFjTnRNRENLQzc3R2c2TFhheEQxcUtBQ05OOGEvSldGSHM5?=
 =?utf-8?B?MHc1SWFEWDhibFRCZzJzVms5NlVkdXp6UkZEbCtWUytoTFJWS1dNbU5ZT3Zh?=
 =?utf-8?B?RnRmelFmWS8yRGQ3UGExRWZtTTFQUGZtMTRIRHEvOUNGS280WktVSEJPdzdW?=
 =?utf-8?B?NEdXT05TVENwSXF4d3c5UWFXVmdGRUpTMm5MNW9xVGtKZ09JM3h2bjNZTHhH?=
 =?utf-8?B?Y3ZsN1JYN0RqOVdzbmo2MTRKazFNNmFDeFloWWE4a0J4MUJQSjhqVXpzZGFY?=
 =?utf-8?Q?bn3QwR0vlm6/4YwlUlaffj0Oa?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd7d94e7-9ce1-4f7a-bf82-08dbe9e4c099
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 16:21:29.7382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oM3S1bngvTKAuni7pD9OfkBoZDwxNCeT/Xe30qmaJAYl+r2hGIEQI3koGz3iZnTmsGdg6MvCi6LOWrdcq7f/HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9364

On 20.11.2023 15:56, Andrew Cooper wrote:
> No more users.
> 
> This completes the work started in commit 920234259475 ("xen/build: Use C99
> booleans"), July 2016.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



