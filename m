Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 816297F74DF
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 14:23:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640698.999303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6W9n-0008HX-RZ; Fri, 24 Nov 2023 13:23:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640698.999303; Fri, 24 Nov 2023 13:23:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6W9n-0008Es-OY; Fri, 24 Nov 2023 13:23:43 +0000
Received: by outflank-mailman (input) for mailman id 640698;
 Fri, 24 Nov 2023 13:23:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ulgz=HF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r6W9m-0008DX-Ss
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 13:23:42 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062b.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af884740-8acc-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 14:23:42 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8109.eurprd04.prod.outlook.com (2603:10a6:102:1c2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.14; Fri, 24 Nov
 2023 13:23:40 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.012; Fri, 24 Nov 2023
 13:23:40 +0000
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
X-Inumbo-ID: af884740-8acc-11ee-98e2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HR6SJxTTycG18YGuUHzj/0bR4Udleko2k7i2X/A9SG2rKgTzivjpKmtrkztEEB0v9alA2nQSN8Y6K8qPw2tfQnzZJ9zuB/MretiUPiYcZe9lnf15LJ8nfVi+Cb4XEPj2bBw8BcjKpYx0NUBM2zZSUAxT7aaopWXHKQKH1RrYfIsGT/DI27P+Fdvbu0LDy3R+3dUIMP/pK5Kni64BSz275GvyQBsa1kUBa7ytYZZX2EahoQNHTPxeCSob8ccbw3yS8HIwKQpf+UuGTVgbU0jTnGkI4dAgoqEH9qEl9RF/pYugd7n1ZrYIESsLVIUMVYkP1E45nHQVTc2qXz1rFLf5yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hk883fAfPN4OaAEwF8j+juDSumTorYeBNVodwbWcm78=;
 b=ZKyEZRtvBicLNZd5uXQMNE6WO1sX4kSOnOSgIAVhB3caDqkR29moUX8tGp2YNj1TvLRC3/Mn2ZCf6R3acnVGja/5bEortYLTv8vJFWFw7ElypQOM0xaU1VkJiel7JeyBoAIaJbvfLhQgTzie5nJ+xlLqe6mToPJ8jMhax/t/yo4qJ/EI3KYf8u+lAh1vNldxHPDjSYcD2Fa3YjQ8CWND0lQ4s6Leaq7eEuExkZnBaMkebtOW1lMqPcU3dtwjsm+4EljQBOPyyrXqcRBGFhyHebL25IEovTLmNLi40S29e+7ZJ/ELKX6PBgS44gJJ0XPfz9E/uGvRwpXE1lT4TJgptA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hk883fAfPN4OaAEwF8j+juDSumTorYeBNVodwbWcm78=;
 b=vvj9HQV+UOsJjKFzqZtVd3DizrJ39T/GChz9EWRz/8FX5LbffzYUoV1Sb42vRQ03IF2JqN8EffTKFZ2o9i8XgW77B7vbnQ55Y6XWz/bYZAD7NgOi5Gfd/T4LD8IzzzGCCtzPCkJobOebZAsV5xwIAtU76ehLHQO5a8/Inc6Yt7XLwbkf3MdcP48iVIOVbsXJmdccJ/KDrZDEvA/auAPePiEg9kKbYKVzY0DInHaZsr9KsjH13n5WDa4bIULTGeloUzvDlCJtv3MU8sxqKrYUnOSg3aMMioN5bteCowjrC5Ueh9zocyeKppmvlH+Y/xgpZqu+39fjZVL88FDha2LNlQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ee8e1c2c-041f-44e0-a76f-8a154e93e3c8@suse.com>
Date: Fri, 24 Nov 2023 14:23:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/14] xen/asm-generic: introduce stub header monitor.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <cover.1700221559.git.oleksii.kurochko@gmail.com>
 <4340a173244ddf933979331762ccb0d523969738.1700221559.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <4340a173244ddf933979331762ccb0d523969738.1700221559.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0128.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8109:EE_
X-MS-Office365-Filtering-Correlation-Id: a8fc6f82-5a81-4e84-3fea-08dbecf092a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Las6PxLJHvxf7Hx6kcwPb8+bCA0kyvlFY/+Jx/Vf7uqYvbjAZTKfYsjm7LoITO674FwooO+USvhM2x0zow3TEpytDXGkBVTltNcb2WUQiyMPN3ncT9URonNLnTZix7I5svBs5fI/gkQ3JN6Rn3AiJu2zxUoCPFwR6tR3ye+ou7kLWZb6Ne7VnPOCABY85rzZsVIqgeFIkwnIJ4z+modhkP+Gi3ujwo635mc2vIQCVlt1T+sSM646UDktutMv/WFjKcRcyIPcuzpdrY5ybyovTw+cBCj+YzK6pFJASUqGbUAbZZUit1afNJeEj4r1JTDvayRRq06gZT+yevyBIfoMnCTh4MB/mVarYOJId2++Lhv8+NUSuLT1VbrgY8aiJbGgA8R3Q00/2APUDmI/qjUsZmAAycZAIrvX6Xhl/07IkJb12R2IhkLJhAb9fArQG6qISrtkpjdFIWB6KrMwx+zmimEepCulnVxQXoFBV2jckQfb/9bSufpjNFyUxnl0BXLo767Fw9yipkYROVl6ZZQI37pr6foMrW88vdhyeZMhUIDepCbXZ66WKwLk5LLuK25KYvGiGn1vC2L6SJnvUNdVhYLdINnuDw8epVe6fMKcdcsMdpZHasiC27wmxOXrMA+aPvQUeyAIA89OdrGIactSjsklSmr9/fnZqun7k1c1Oww=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(136003)(366004)(376002)(396003)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(26005)(6506007)(53546011)(6666004)(2616005)(6512007)(6486002)(5660300002)(41300700001)(2906002)(8676002)(478600001)(316002)(8936002)(4326008)(66476007)(6916009)(66556008)(54906003)(66946007)(86362001)(31696002)(36756003)(38100700002)(31686004)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2Z1ZUpWcWRDT0hOT1lGbHJsWGgrK3prdmN0WmdGbmFhUnIzSlgrK05tdmFC?=
 =?utf-8?B?UUZRNTF6QnlneUNlS3c3Zno1WmYrbFg4SS9ucjM3Y2pSSEFYUlhWWjJCMUR1?=
 =?utf-8?B?RE1nRkFSd3NPR2c2R2lNMEF5dVJXYTQwcnEwbnpFU1NpbHRtQmhST1k3Slgy?=
 =?utf-8?B?amxpS2RFUEFNRk5YSTJaazQzQkRDN0lEV09IWDMxdE84NHJpeS9PbWZOZ1R5?=
 =?utf-8?B?ZDRwVERnK3J0bXI0bDNPWlJpRkxoSVVIZ1BXRER0UTMzbVhkYzYzUWVSRnFN?=
 =?utf-8?B?dDVuazQzVUdJdnBNMXlzczBwRXRKY0tiWlVTOGU0ZTA1cjd5dElMdXczRDZW?=
 =?utf-8?B?SFNyenR0VDY3Q3d6bTRFbHNSdFptVUhyTi9ueUZpZzNqejBTMTdxK0MyNmQv?=
 =?utf-8?B?VjNQWXh2V1V2Z1pBeEFRMXJVUmtMM3FDQ1Z2NEREQXRJQTBuR3FuUjBOMTVD?=
 =?utf-8?B?dDZNcG9zcGNNeEkvZkwxckgvSDM5di9Cb2t0ZTJabzhidzFkUjNRMHJVNkpU?=
 =?utf-8?B?ZEY4Q2tiOHJ4M3dEdTdyT29EUFl1RFNmUjgzcjkxckY0OHoyUW1TVk02bTZo?=
 =?utf-8?B?eUo0aDBBb0ZNdXZmWXZPOHdFTWhsK000QktwUDZyVmVGYmxmU0IyYkQ1Vzls?=
 =?utf-8?B?eXhhMWVBUEw2V0pvL3JtZUJ3OUs1QjN6QmRoQnFoczBXZFM4dkRZOTkrNGpB?=
 =?utf-8?B?dCtLdHM4UjJVT0ZLR3RUUWMvbys5TVl6aUI3MDlLRHF6cStFTGFsTzJIbWIz?=
 =?utf-8?B?SEhRdVJrZWNCMnc3bi9DcWwydXErejJTdEtLK3BjUUZISVhpTHdTcWdqd2RW?=
 =?utf-8?B?ZjMzak5BYWw2QVN6TmhrNzJTbTNiaUxNeUhaRFVwaFFpTkVJMEQyc2dLOG91?=
 =?utf-8?B?c2xCb2VHKzEvSStsejU1dlo5azZHY2N5LzFJWVB5bXQwRWxaWFgvR2tCZmMy?=
 =?utf-8?B?STI3MVlzbnlFTzRtNnRwRTNneHVzT2V4SlZ5MVBWQ3FLK2V3Ny9RRllmTjRM?=
 =?utf-8?B?RkFjcUN6dnhMQklrbyt2YkxjUVkzS1NzTk0rTW5ZelpzNjNEZWFYOExKS3pr?=
 =?utf-8?B?eGRXQ29YckFwSVJQOWlMcm51S0ZuU2EvUVZKbFcvV3dCSFAzWGZWckdZTG5C?=
 =?utf-8?B?Tzd3c0U1ZWN4YlA0cUNHNEIwRE9Uc2xRbmQxdjhlL1RYNjFwSldlNGQ2Y1cv?=
 =?utf-8?B?UG5RNjFHQ0dXTVN6OVUyVDVtRUFNcE1OR0xmcHZNeXljaHc3OHlmd1ErajJk?=
 =?utf-8?B?ckxTZTNZUlFJUHA0Z0NSOUpXZzJHMTdQcjBPZmlPYVh0aGRNa1pUQm9UUzNW?=
 =?utf-8?B?WEg3NmYvOC9KOXVNOEErVDhXYWpZWWVKMk1BM0JwU1dnYnI2V1QweU4wUFJN?=
 =?utf-8?B?bzB3UWpFN09tUVpIZndTVXY2L0o0aGtrSGRrR05vbFRXUkZMeUMxMXJGK0N4?=
 =?utf-8?B?bkd5UU0raU5yUUVxRmw3RTJMcDRyM2NYQ2JvbW5xN1c5UUtZMVYwcWVjUVZ0?=
 =?utf-8?B?NUJQbjJqWTlCaHRMMGJqZ2hHNzNqOVo3SFlBRklmckI4KytTLzU1OHJzTlA1?=
 =?utf-8?B?UHlHeVlCYUdJMVdWV0xhbHQvUHJ3eEFqUTVrbENhKzVuQlZCU0IwWDAvRm5F?=
 =?utf-8?B?NkZ3VXY0NzhtWjRsc2JhTDFQZjRqOHR0d3FnQk81T1R1SW4wM3liNWNuNW0v?=
 =?utf-8?B?Q3NqWWxaNjBsa1QySUFhWDMzdlowTlF0cStOaG5Rd1g0K3VJWVZrNUgzOWtK?=
 =?utf-8?B?TkhTWFRFaHdnUTVQOUxYcGN1UGlDb3g3aURLUGtpazhyVERPWHFIVUJQdHhI?=
 =?utf-8?B?QmhCblhOQVVhSXBxZzBheFZLRVY2OFhiYk5Jb2tPdGFWNWRYdWYwTVU3am5V?=
 =?utf-8?B?RXpQWWJsUHBCZEVGNFlrWTFKQkM5RDJzR3VvbzB6WGZaZXJydjRqTUk1U3ls?=
 =?utf-8?B?OGNTSGtMWXNYa09ScjM1TVlPUFVmZnhKK0dMRFRMRlFyaTlCQlhiV25YaTcx?=
 =?utf-8?B?ZENWdlk0VUo3OThmdlhwaWpwalBoSzFRQUcvMXRpZUcya3NSKzRTQ0Y1bDNr?=
 =?utf-8?B?TkN5WjdFNThsaEliQVFsSGlkcHpGemFMT3gvZ3MxNWpSU0RaTlljMUF0SVBS?=
 =?utf-8?Q?yJSZlbDNc0XG4YJngNHXYEE98?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8fc6f82-5a81-4e84-3fea-08dbecf092a2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2023 13:23:40.0381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7O0ciNkIwpKIrWHkudbfGcst4dLNdJpl1Hk5At243tU83RnrPq2tdgYHybsQ4HoMzL7XlfEfD1qUCEqts3Ie2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8109

On 17.11.2023 13:24, Oleksii Kurochko wrote:
> --- a/xen/arch/ppc/include/asm/monitor.h
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -/* Derived from xen/arch/arm/include/asm/monitor.h */
> -#ifndef __ASM_PPC_MONITOR_H__
> -#define __ASM_PPC_MONITOR_H__
> -
> -#include <public/domctl.h>
> -#include <xen/errno.h>
> -
> -static inline
> -void arch_monitor_allow_userspace(struct domain *d, bool allow_userspace)
> -{
> -}
> -
> -static inline
> -int arch_monitor_domctl_op(struct domain *d, struct xen_domctl_monitor_op *mop)
> -{
> -    /* No arch-specific monitor ops on PPC. */
> -    return -EOPNOTSUPP;
> -}
> -
> -int arch_monitor_domctl_event(struct domain *d,
> -                              struct xen_domctl_monitor_op *mop);
> -
> -static inline
> -int arch_monitor_init_domain(struct domain *d)
> -{
> -    /* No arch-specific domain initialization on PPC. */
> -    return 0;
> -}
> -
> -static inline
> -void arch_monitor_cleanup_domain(struct domain *d)
> -{
> -    /* No arch-specific domain cleanup on PPC. */
> -}
> -
> -static inline uint32_t arch_monitor_get_capabilities(struct domain *d)
> -{
> -    BUG_ON("unimplemented");
> -    return 0;
> -}
> -
> -#endif /* __ASM_PPC_MONITOR_H__ */
> diff --git a/xen/include/asm-generic/monitor.h b/xen/include/asm-generic/monitor.h
> new file mode 100644
> index 0000000000..57b2256db7
> --- /dev/null
> +++ b/xen/include/asm-generic/monitor.h
> @@ -0,0 +1,63 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * include/asm-GENERIC/monitor.h
> + *
> + * Arch-specific monitor_op domctl handler.
> + *
> + * Copyright (c) 2015 Tamas K Lengyel (tamas@tklengyel.com)
> + * Copyright (c) 2016, Bitdefender S.R.L.
> + *
> + */
> +
> +#ifndef __ASM_GENERIC_MONITOR_H__
> +#define __ASM_GENERIC_MONITOR_H__
> +
> +#include <xen/errno.h>
> +
> +struct domain;
> +struct xen_domctl_monitor_op;
> +
> +static inline
> +void arch_monitor_allow_userspace(struct domain *d, bool allow_userspace)
> +{
> +}
> +
> +static inline
> +int arch_monitor_domctl_op(struct domain *d, struct xen_domctl_monitor_op *mop)
> +{
> +    /* No arch-specific monitor ops on GENERIC. */
> +    return -EOPNOTSUPP;
> +}
> +
> +int arch_monitor_domctl_event(struct domain *d,
> +                              struct xen_domctl_monitor_op *mop);
> +
> +static inline
> +int arch_monitor_init_domain(struct domain *d)
> +{
> +    /* No arch-specific domain initialization on GENERIC. */
> +    return 0;
> +}
> +
> +static inline
> +void arch_monitor_cleanup_domain(struct domain *d)
> +{
> +    /* No arch-specific domain cleanup on GENERIC. */
> +}
> +
> +static inline uint32_t arch_monitor_get_capabilities(struct domain *d)
> +{
> +    return 0;
> +}
> +
> +#endif /* __ASM_GENERIC_MONITOR_H__ */
> +
> +
> +/*

With the double blank line removed here
Acked-by: Jan Beulich <jbeulich@suse.com>



