Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E15955A0D61
	for <lists+xen-devel@lfdr.de>; Thu, 25 Aug 2022 11:55:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393228.632045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oR9Zt-0002Zh-4W; Thu, 25 Aug 2022 09:55:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393228.632045; Thu, 25 Aug 2022 09:55:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oR9Zt-0002WQ-1E; Thu, 25 Aug 2022 09:55:09 +0000
Received: by outflank-mailman (input) for mailman id 393228;
 Thu, 25 Aug 2022 09:55:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2f78=Y5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oR9Zr-0002WK-V0
 for xen-devel@lists.xenproject.org; Thu, 25 Aug 2022 09:55:07 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00063.outbound.protection.outlook.com [40.107.0.63])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff2daf55-245b-11ed-9250-1f966e50362f;
 Thu, 25 Aug 2022 11:55:06 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9428.eurprd04.prod.outlook.com (2603:10a6:10:368::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.24; Thu, 25 Aug
 2022 09:55:05 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5566.015; Thu, 25 Aug 2022
 09:55:05 +0000
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
X-Inumbo-ID: ff2daf55-245b-11ed-9250-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jUSaBbDRE9clxi3ukGMVjwPxYhE4lxTMX6VklDIMx09WykrvsAjoOvfVBfaTB0VIHpIAgmCK6DNAQutb6kFC/jNoNFZA57TkcoZ8LWi0lWOu3G0p+Ejgp8nuAW5EVWbvqf4u1zHV+ysl4xSXTvygVx0EfxbLrC55DoGptdPvXB7An59wYlOa4v5PA/wbF+bP6lIGH33oDIBQj2hxQWYSWwAHvG1JGjt+WWKqr1tA3irViknrvtBS/rgSjSeFF4mn5wmMI63WA6RRUae6RmgrHQfmlbjHUqlAr16PjvUAcm8usplvqHGo9I1at1OCDysI24yB22cPY5Yq6QacZrKYyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sorpqu1Nu9cBh6zKWGDFGrO6MrpfPV8fPiBj7r8wJAU=;
 b=KcSyuIN7h2P9hmrpwAz1l3fVy8IUO0CHffJNjPTsQXTGow6JMocz4iO+C89YSW82nuE9kWtRNZsDpiMV9f0YqjuZZslUMnYlo/U4srnAqkQy9nYDxq3egpvgE3wDL2sSY6TZWkx5IE62AMKMLl/3RGfd+QJm6brSTylCtSZT0xRnqLevKIalbmL7myMDhWzXZXM9MYPLzFP6qerfkSViDRgRgej5wx8K63Pve7uAMKsZl6cDyEsKFyv+4Yn6VfN2+uBYkkphUMvLXC4rPAIlE4lsVFXVRUEaZwSa65FJmNdu0a3NggPHBFlkdUSeNBg8FRIhZKtlco2uSqaBCJMchA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sorpqu1Nu9cBh6zKWGDFGrO6MrpfPV8fPiBj7r8wJAU=;
 b=LUEYN/aBOnhA4tm0OcqHK6u2ucHidbK6HbpjG2HR0fvwXrWxDzfA1v5kOFdpPTwx2/WpokmoPq9TkycL4saIvjwWKTqf9SWDAmTsZlZBvDc0jzIQjKVr0uXcGr7IEWxmBf7gwi0lOH0Oeu3plWm9+CXusB0NSIJ/mEJwxy7pcCuNswJPuAEHwOnX5/fp7tH+zhXHmDig2QPMGu56gqiyQ6LNNjAalXpOHxKqo9c1Qw5Wye0adevO5G9k6EOO96xOccs0cCNDHdOwRaRXWWHdIBXg3seF7bUei3rTyEHzB9eaAKzvZRsYAg07Dk/HfSWXgQxJx/wGY63bLJioW6iUiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7dbef184-7e55-51d7-27e1-93153b5f0bc9@suse.com>
Date: Thu, 25 Aug 2022 11:55:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2] x86/public: move XEN_ACPI_ in a new header
Content-Language: en-US
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: henry.wang@arm.com, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <c869f79901968de2d71ab56e1bbb5d43048baf5d.1661420219.git.bertrand.marquis@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c869f79901968de2d71ab56e1bbb5d43048baf5d.1661420219.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0121.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f6dec042-d4f9-4d32-4a85-08da867fe2d5
X-MS-TrafficTypeDiagnostic: DB9PR04MB9428:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	r1dbXpUrZOjkXtVlbCzpRJulwh455qoQj0EofuYM2sBdp1UR1qL/8Xsro9b+CPMtGruGg5daxrFWAYeI4BbITuaQmGXfB5DfdcVOtrKikk3BVRnJoka1/IYMcOv4EpzbezfeSoerWsAWpKkKWRe7NjfaZ/32jTPHQ9BteHXqAjZr+tMAJQMPIyrVg59uogsx522tlUEJPunrUGqECjsWaWFB+F5PAYcHmxAGbiDpNvyNr2CIffo58yIyfN22pkSYeoRV6G+qebOg2owvby69sBQ6k8lLlWnjIzSNW41lXq7Ysk6SaFbCPYx1lLMlrBSc81bNBGZ97wCwNOWEZDSzuHaYPIvcWX61wgAQh6UQxGO7OSfhKsiS9pG0Z56XUigGmcCkSwKqu6i9ZTcT6q+9KNgvVpBeL7A4ICV1LEyxx5MTGNWc0KReVjXtzW+8A8Nzoa2wHYFIXFbGHFFFtiOprukY7jUFqSZvHI1c0DKWgvfI0P0QAQcO0BfoXEMC1jlsccZRIxKDD6Fr0wb1f9GkEhVMyiHAwMFka1PUeBbg1iq9DAd8AeFfexNWcYbo4iVJrttQk3OrFtRvBCQw3CLHvU+tFK7s8dqoVHS9TEVTlDMzD3Wot0pmxQiZe3t2xZA13npgloKmILPoA3+Y5VKZz1HvMltw5NtXR3bSqgS8Hc6GsmSffqAMNLMqkzEjXvdNtRiXvZSyKWTHnFKAuQRxeErLp9f/nDQR/JvjcGN/ElR4z03AnLsESkiRs7RuTiu/PCVa4D3+p0fpqSBBlnD2CG7GmlNADnu2xIWJhe6jLd8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(366004)(376002)(39860400002)(346002)(396003)(2906002)(36756003)(31686004)(66556008)(4326008)(66946007)(66476007)(53546011)(54906003)(6486002)(6506007)(478600001)(316002)(41300700001)(6512007)(26005)(6916009)(186003)(31696002)(83380400001)(38100700002)(2616005)(86362001)(5660300002)(8676002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFhOZEY4WERTTWVuZUZ3U1VUc2FrbG4raFpJVTNBZFlCaUZrVGdjMDhqeDdS?=
 =?utf-8?B?UEFOMUlUVG80WjhoTlZ5aUJhYnRYMEhPY3hqeFdscStaNE1hTHJYb20zNzJh?=
 =?utf-8?B?dlpTZC9ncFFCSHgvYVJ1Yi9oZ3NUeVg4SEMrZFR2emVOcWNkU0ZPOForWVlk?=
 =?utf-8?B?ak91ZVI0ZUJZWis4SFJJOU9MdFh6OGtoZDdRYlNJMGJQS2ZqTituaFpLOVFI?=
 =?utf-8?B?SnlTcU5VOUlqSlRLcTFCN3JRNWhkQmpiRXFxRG83aUhQSVNLVlkvWE8yMGxh?=
 =?utf-8?B?VzllOEp1S0VWY0NmYkVMTzBFYXpGV2dOVXovY0NpMXNpcU1JL2xvbTRkVnlH?=
 =?utf-8?B?VWlYOEdGeFRnYUJYM1I4a3cwbTJNeCtRTThhUFluNjBmUDNhcHRTMlZrNzhL?=
 =?utf-8?B?cjQ4eU9UWEJiTlh1QWljNFhZWDNha25oYkZ6aVB1dCs1YjluT2FuYmZOcEcy?=
 =?utf-8?B?L09KUTZsZmJtSUhRSDRmcXg3b3JSK2RCK2NqcXlORnhrbTVLNklZQk9GRnhM?=
 =?utf-8?B?ZW5wSm55RHoyZVBpdHU4WU1BeXp1anJoNzNxODR2Lzk5ak4zczV3OWpvZUV4?=
 =?utf-8?B?Tm9KRFRwbWtLOTduNjdBNGlXbEgyYkVDYWg1dzh0VmN2eGxscW9SOWlkSXRT?=
 =?utf-8?B?NkQzcHJ4eUg4dk1mZkZIb052Z0xaWVJjN2JZSU9ZaHB3akdBQjZnTURIbkZ3?=
 =?utf-8?B?YmQxcjlUYzJIVWZMSW05SmJKQ3grMkp6QVJydXBBRGtDdVdIY0xOQi9rMzhD?=
 =?utf-8?B?b3JyM1ZVV3VwQU9PNWF4NkJybFdwMUs4bFpGU09jZVN6eDZ4NXZ2U1lEaks1?=
 =?utf-8?B?WXhIRGhCeUczRkdWRXZzcXNNNGZ4UlpjV2tvNG1JZFNLY2hSeXNWWDI1ckhK?=
 =?utf-8?B?ZmZFU21URHlBYlQ3MTJGc1RlVmppK1JVYU5wdHlEQTJYMUpJTlhUN1pJaFhS?=
 =?utf-8?B?VXh0TEpXdXZwa3ZERHJXamQ0MG5wRTRGN2t3Qmh5dVBlSWdwOEcxVEJDczYv?=
 =?utf-8?B?RDlhbUFWaGpubWNlREdIS3o1ajUwcGp2UU9nT05pckk0RVZHZFNlZkxMMlBK?=
 =?utf-8?B?blR6TWo1RjRwNGZJSVV6ZkZ3MVhlS25FeDFrNG5zUlBuVCtRMmNka2k4UG8x?=
 =?utf-8?B?S3QySk9vcG5iV0pNODNvc2k1cXZGWEVpRkVYOEd5MGg1OUFhSmJKRW1uKzl1?=
 =?utf-8?B?bzZ6MlByT3hNMnFJMG5RRVprQWplemN2Z004elVhejNwbHBTV25Md1lwYjhC?=
 =?utf-8?B?SGd5TlYzSFBOdzRXZTR1NGpJRkROMEFCU0YrRXFjU0pZVjd4SDBVNzJFT2gz?=
 =?utf-8?B?dE40Mkt6c0hlSyt2K2RjaUU4c1o4dDg3ZHpTS2pTVktLSGFWZ3JBN1QzVGRp?=
 =?utf-8?B?Q0NyVTJLTDZnSThBalJYVHIva0R5V0E1a1dFTjVWa2t0RXB5WHZCaDBIQkpX?=
 =?utf-8?B?WStvdkJTZk1XeXM2MUoxOFo3d0dLSi9SWnNOMHBXNVdkeHJ1aDNmbnYzbits?=
 =?utf-8?B?MjhnMFAxUk9MRzhpdEMwSTVwUUNScXVSOE9KR1hkR3crcXg4cUowekFOOE1s?=
 =?utf-8?B?b0Jsa1AzWUthRXFtY2FITGpjLzVocFZRZHRpSmg1M2JseDJlYlFIOTVkeGRn?=
 =?utf-8?B?cDM1aDBLSlhmZ2JRdE9NenJURE9vTitvVHkyZnVoZlhTQUNXVWp3eGp3aGxM?=
 =?utf-8?B?RWVLbG5qZzQ3d3hHTllkeWh6RTVmQkJDOW5RUU9DeW04eFRLaVBuZk5JRVc3?=
 =?utf-8?B?ZWdXekNGN1BkSGpxRE1FeGgrR2lubi8rTDFHY1VaMW1Bay9Qd2phcllueDZR?=
 =?utf-8?B?cWQyd1J5REE4N0psaWRsLytmb014TzJaUjg5dHlZVGp1d2tFNjIrWFpXMWtX?=
 =?utf-8?B?NG1jem5BU0lvQmd0Y1BtNy9HQjUrMmVpVHVxaG9aRlVtYUppall6elIyZkpF?=
 =?utf-8?B?WXZUdjkrbmRQREVIYU91K0NlY2VoZ1pISEx5ejJ2NWlSRXN6RkpXOEV1RkZC?=
 =?utf-8?B?RXd3UmZwVUZCOFFZN0NIOGtjVUhJNS8yV3NhcUQrck0yclppSllKc3RoNThU?=
 =?utf-8?B?YTdrNFBZelVRM1B3cjkzTjQ0VFhoU1lMelFKQ3hhekpVQ0J6dlc3Qm5DdTMr?=
 =?utf-8?Q?SzG195yp4h7j/1uaXwWZoYSlH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6dec042-d4f9-4d32-4a85-08da867fe2d5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 09:55:05.2194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IC3V8RmM86gGteSQsOzMCqgnzPBIrRXzhEDNXu/xaiqmfI4rPAa1ksspgvMnts0QOgT06jQuLXlaej3o16KGRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9428

On 25.08.2022 11:48, Bertrand Marquis wrote:
> When Xen is compiled for x86 on an arm machine, libacpi build is failing
> due to a wrong include path:
> - arch-x86/xen.h includes xen.h
> - xen.h includes arch-arm.h (as __i386__ and __x86_64__ are not defined
> but arm ones are).
> 
> To solve this issue move XEN_ACPI_ definitions in a new header
> guest-acpi.h that can be included cleanly by mk_dsdt.c.
> Inside this header, only protect the definitions using ifdef
> __XEN_TOOLS__ as the defines are not used anywhere in the hypervisor and
> are not expected to be.
> 
> Previous users needing any of the XEN_ACPI_ definitions will now need to
> include arch-x86/guest-acpi.h instead of arch-x86/xen.h
> 
> Fixes: d6ac8e22c7c5 ("acpi/x86: define ACPI IO registers for PVH guests")
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> For the release manager:
> - risk: very low, the definitions moved are only used in mk_dsdt and
> external users would just have to include the new header.
> - advantage: we can now compile xen for x86 on arm build machines

I'll give it a little for Henry to possibly release-ack this, but since
strictly speaking this is a bug fix, I think it could also go in without
(as long as not actually objected to, of course).

Jan

