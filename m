Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B3C79FF04
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 10:52:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602145.938535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgi4r-0004zP-6a; Thu, 14 Sep 2023 08:51:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602145.938535; Thu, 14 Sep 2023 08:51:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgi4r-0004xj-3l; Thu, 14 Sep 2023 08:51:57 +0000
Received: by outflank-mailman (input) for mailman id 602145;
 Thu, 14 Sep 2023 08:51:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nkWz=E6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qgi4p-0004xc-Ez
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 08:51:55 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f42c273a-52db-11ee-8787-cb3800f73035;
 Thu, 14 Sep 2023 10:51:54 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB8PR04MB6796.eurprd04.prod.outlook.com (2603:10a6:10:11e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20; Thu, 14 Sep
 2023 08:51:51 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.020; Thu, 14 Sep 2023
 08:51:51 +0000
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
X-Inumbo-ID: f42c273a-52db-11ee-8787-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OtY8fkcxiGI3rwQsDMGWqgUY8J8ZGzdipPC9K1Wil2cEL4jKWg5IoAd1v9J5dF3jemW3VN1d2lL+a4Sy43fRWz3d4gdAeZ+aVRNKKQ8v5x+0/ZFSSHGN/AuQjhUluJVTpxrJPSOE9v5PViqVPRz/yfMWlhlbbi7VePvp15Icdn74cCAIQzvfAYl9k0FVPraX5hQ92qu94/3vfU3BW6Z5BAr2h/i0raqtoNPuhqx9YzzA9YYyTdHiGt6KYwRNNNv141qWG0hmEarNkL5szRopz0dF8olfWnIuhCtWe9vDriOQshg7VzOCXHnK1V10DzxUYCymP4Gcs0dFwo2gNzll/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/xpLRWMJeoA4uiNwQLu+0ffYTos7ZC54hw6Zsv0VRAg=;
 b=IG5/wsMGQ8D0omUZ3+1DoVMkAWwme9IMoYAmvR5+uSJXadyMzmSDPz+l5a2pgxeqDpOIssoFeeu/qYtLGT/nB++BZcv2ueDKLvnO8nKxvMvRzQKSqTpBOAEBQKvUYOx8LMF5CfX7FSOkQ8JygAgUtWZHfyh9qLiSDuC9nJj602qsqGsllZbkTrn1v7BQieGLTHxHzIG4+epvWcoP084EUnyKH9wD5mGyjsVNeZAXGMLSz+Xo0bgQxN7KB4byXSxdKp9D6ETW2YycbeHM4s62dgg3HbI0HL6UsQJrZWflEjb0Zt1zm0ZlwJWDctCI4N8B48WP8bncpeYHc6IsOMQE/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/xpLRWMJeoA4uiNwQLu+0ffYTos7ZC54hw6Zsv0VRAg=;
 b=fw/rHg/5NeD0ESKXJStYn98yY7lgU+ijWMsGwKWB2KvMwHhahsCegvhBFtiXuWQdOuTl2wTKTULOG2lX5aDPhYzrc/xDps4PojMZWP5TNlZyVs8YokEjJIM/EGbrZmXFV0nanZNhWAfJXaupREzJrK1Hy58ygmmMoZajiD6JAR88CaaFN8tQSCrcYNZ1WLSI6db4bN12qCgqzytQ5efQKrhqffCjR0ZJ4Of8030HekmqhAbc82w1yDa/YeubALqbKlgBQme2r0IewPIiMtSV8SKqJct1dYcZofBGtyTcFbuvs5/iAbEVVI8VlD9MbP1Q3wh5VV0cxN8htBpgd5LDIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <099ac89d-ea37-352e-940e-91993c1649d9@suse.com>
Date: Thu, 14 Sep 2023 10:51:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 5/8] x86/entry: Adjust restore_all_xen to hold stack_end
 in %r14
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230913202758.508225-1-andrew.cooper3@citrix.com>
 <20230913202758.508225-6-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230913202758.508225-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0021.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB8PR04MB6796:EE_
X-MS-Office365-Filtering-Correlation-Id: b123a57d-122e-4ac8-19df-08dbb4ffd6c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jsiItBg6nDuDcfssxECR59xBvZEOBIQMIMF42F1ffcDiawj1RlsqeAADWaKyb9gVq0MNYCfrPYDFtlrHpboLw9uHv+foRCffx4JnctR1kPdaMKWebtI7zmWozYkzNVs3SOv4OJp+5fRq5d4MOLf4D2lM7DOWs/USM7TmbZJDK+KOgGY48pdNjYigSAEQAGFkldjpl0Z81DaaRaswxQAWWQOruLKdaSOiKEnWloJGhRF9xWEH6VEUi51Tc3JejRzXLfisHDwWkb7dPVVV653G44kO3f9R53VOnfvPVFiK5PGVPDwhifsFmsQmKJZHj28BuaxfWXLj1xIVn0DGChpSpbnjV0PhRxzDa1465AFRjxhO2UdhsDu3KZ5mXeBsFXtyV5Qe+TYy61sjSIW8Whl6c2Zu+g8u7KxqolE3BWvFFrtw8v5bc+y/RcPJOP8sQ8djmd8ldHx3Iq8Pgl4+sCV/uMBLQ92Pp7o1gC0IEs1CiCRPV4mvddHT7Z5jGQUl5PNd0+67RA7apBJGjdibbDcuRiGaxSfFyf+rQB4kGVtHjSF6mYlnvH/qUXw0LK607vi++k+loJ+azQj5X5oxCrFEmSexYwRl/wPKAXcON5sFrs4MAvidSr8Cs3H8MOX3v3e13DEUwaNw34w/37kJKKfEZw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(366004)(39860400002)(396003)(376002)(451199024)(186009)(1800799009)(26005)(478600001)(2616005)(2906002)(6512007)(6486002)(6506007)(6666004)(53546011)(4744005)(66476007)(66556008)(31696002)(66946007)(86362001)(41300700001)(36756003)(6916009)(8676002)(54906003)(4326008)(31686004)(316002)(8936002)(38100700002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3FlTEc5WVJKaklKZVFxOGxUdFNyQzZJdkl3SjlhWDdkYjl4VnZTYnY2RERh?=
 =?utf-8?B?RE9rQjdZRFdzY05leWp3YmgzM1F2S1Z2M00vV2VSQjRQMnFtb1VlN1VPL3Zi?=
 =?utf-8?B?cGIvdk9pMElWR0ZxdXkvdEhtM2haN1lEL3hLL05kbjdDSVNSS1Vza0lESEFD?=
 =?utf-8?B?ZkwvVWI5dW81TkJpSlliQm12OWExdUc1WnIzRWY1d0syT3hqY2tpL2tHVERG?=
 =?utf-8?B?WkpnZy9WR3lWcUNLeDk5dW1KTUd3Nk9FaHcza1NidldXT0p6SUowVjIxejB4?=
 =?utf-8?B?M01MTjB3Z1BCOVBnVExQSGVkbk9xRXdvdDgrYU9hK2p3UGphK3g2T3J6YzRl?=
 =?utf-8?B?bXdRdEpTVHVzcUM0QitqTFFzd1d1VnI2MkZGMDVXNnUyRjB5Z1lDMEplVHZL?=
 =?utf-8?B?YnBwZVBOL0t2VzllQVplcEZmR3RiVDU2djZUckk5N00rVnlZT2pWcGNpRDB5?=
 =?utf-8?B?WTI5d3F5QW1yZWR6dC9IS2ZMSTRETnNFb0RRbTloWDZaV1pjZnZBYUM1QnZ5?=
 =?utf-8?B?MEtYWk9jWUZrSUI3cnJsNjlBOFVWWUYyTytTRTNtM2pLQVhRQ29qcHBsWVNr?=
 =?utf-8?B?VnpnOHU4dnV1aWFQY1NBcTlydjhvd05mdHJkSUNFRzQybHF4cllaQzRXb1BZ?=
 =?utf-8?B?R1RyY1hVb1dTZHdsM1k5bDg3SlNtSTFuemlIdklHNTVyRjlJL1RqUlZEMGhX?=
 =?utf-8?B?UzA1cmhCOVpoL0gzbk5MUWpnaVdpdWhXUXpsUG96ZStwOVVkTTYrNVAyWk5r?=
 =?utf-8?B?c2ZlU1VwSER3VFpva0RXVG1ML2VoeklBaXVmZVdxc1VZUlpRSFJHVXVRS1dD?=
 =?utf-8?B?OE51Y3ZqZnlGbWpoa3l3d3JjZDJJZktIaWIzMEhMbmtmV0hLMVFQdCtBaWFj?=
 =?utf-8?B?Tk45T1VPY0VOeWRuOWdwV3B4YlBMMHhuZldrLytFYVBVZ2VuaUJ0WUlRaVVz?=
 =?utf-8?B?cFBTODEyUTI3T0V2dkRDZUJWVzJhZEhEZGN5QllXb1NJZ3BWaDBjb29sKzF1?=
 =?utf-8?B?NVNvbTE5MEZUenExQVpBQzBHV2tFdC8vRitHcnhWeW9pVU5rNFFsKy9yNy82?=
 =?utf-8?B?dFhsWmh1NkN0aXNsY2QraFk3M0tRZDNIRlZWSjlJOTJxYlRobElXTnAvSXg2?=
 =?utf-8?B?alY2L2UrckxQVmhwVUpDcHY3ZGRZMWpBZ251Q2VCL3h5YWpCVlRob2ZTdjVh?=
 =?utf-8?B?TzM5K1h6aUhoeGk0V1EzUHdTNHJWR2FJcy9sNFQySFF6QTlXUXV2MS81Yi9i?=
 =?utf-8?B?Wmp0WWhLSTJnZ2doQURrTWZSb2ZQcnN2S2RRYUhMNXJCZEFrK2FvMlNEQmVZ?=
 =?utf-8?B?MHNodHlxQXNNNGJLWVFmZWtQaFJZWENQZWtUUE1iS2tGeXg2RFpnYThMd1FP?=
 =?utf-8?B?UkgxekV4bXhIL0ptUEdKQ1lnQVpzckpTdWh2THJhVVZKcnZYRGp1SmFCNEtx?=
 =?utf-8?B?dzBlOEdYcDI1SWJRTEhzVU5FZEp6TUEwU2lGRXorRkdLVnB1VTk5NDM0bXZO?=
 =?utf-8?B?aVNQNWdlejFzSGlscW5lYnM1NnZlOUY4SWRSMksrcHg4anR0cVZVOC84L01I?=
 =?utf-8?B?RkdEU0RYWHFSZGRGV3pkUWpQQWtLTVZsS29FVGY2NzNlK2paQUpqeWZpQlFs?=
 =?utf-8?B?aHdiVURwS1owK3FLKzZaTHByakxLdU1ycDBIbHdXS1BtM3lEOUl4NVhuNmZB?=
 =?utf-8?B?YitJRWlueE43UUlvcVBLcnQ5cHNKWVptakxUd011VkRXc0g2RFlVR0hnK1lQ?=
 =?utf-8?B?TTNOTi8zUkltdkJzWWx4ZFB4T0crWGVKNWxuMzF5cnI0cnp6ZTY3ajVRSnJG?=
 =?utf-8?B?eTEwSEhHc1h2Ym13aXp1QWQ0VHE3dmIyeDdMOTRBYW4vVHc0ZlZEZERGS0hi?=
 =?utf-8?B?b2djL2lWNXplWEhRa24vSDdvdUwvUXpWN3hnZVd6SmlmN3psOHk3MWpmaVNU?=
 =?utf-8?B?aHJOR05nY1JNZWZpd2FnemNsdHhsSFMxbFBhR25Wa3NEUWJxdnVRTVVUS2lP?=
 =?utf-8?B?WUk0V2RYTUhwR082L0c0WVY5VGhMbkFGVStpditLVzlhVzA2YUtTUHNwRklJ?=
 =?utf-8?B?UERhaThQZE1qendERUpub1RUU2FPeHlRcnBmU0RLSzVNeWtmZ2Vxcjc0dUw3?=
 =?utf-8?Q?2cr870sPQi5LebHa0+Ra+CE/7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b123a57d-122e-4ac8-19df-08dbb4ffd6c7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 08:51:51.7633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S6/ZtIHJDPgrbcNkj7YkCJMrMT6+MVTAC81HC1gKJIE5M2wpX84PNMMb3ilQo+/2ZAoiP6AWqWZx3pbrWA0PnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6796

On 13.09.2023 22:27, Andrew Cooper wrote:
> All other SPEC_CTRL_{ENTRY,EXIT}_* helpers hold stack_end in %r14.  Adjust it
> for consistency, freeing up %rbx to be used differently.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

The choice of %rbx was, iirc, for avoiding unnecessary code size increase
(due to extra REX prefixes needed in some of the affected insns). I
understand you view this as not a real concern, but I think saying so
explicitly in the description would be at least desirable. After all there
would also be the alternative of further parametrizing the involved macros.

Jan

