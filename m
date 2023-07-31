Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD9D769108
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 11:02:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.572832.896891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQOnX-0005l5-Ro; Mon, 31 Jul 2023 09:02:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 572832.896891; Mon, 31 Jul 2023 09:02:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQOnX-0005iO-Ok; Mon, 31 Jul 2023 09:02:39 +0000
Received: by outflank-mailman (input) for mailman id 572832;
 Mon, 31 Jul 2023 09:02:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bN9S=DR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qQOnW-0005i4-QP
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 09:02:38 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2062c.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe679efd-2f80-11ee-8613-37d641c3527e;
 Mon, 31 Jul 2023 11:02:37 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7283.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Mon, 31 Jul
 2023 09:02:34 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Mon, 31 Jul 2023
 09:02:33 +0000
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
X-Inumbo-ID: fe679efd-2f80-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZUlt8Y76Y0NXkniCzEW5TbX6IVs0tqoaeEUL3hk6zmxUhAMUvk5rXgdBT+lIRL5kZvjC++mzTnleFhZ8KNFnExThi/DmeNQCqEK6rI6OJWXn5Z4GK16h4Bp3OqqvfWSxEV1uASz8O13Y8PSOmg8jOOJpT9soxirCLBYm33KzA8CuggZ4MzMLy28iRHFh91A7nS+CbddEvTMwJimIoqO+CPhaJDBMNdqltphZ8YMg20Kmrh3ix4XFhya6Q6G1DSkKHBUGNqqaCTIv54T/MSwyE8frDPepI1Ib248+vRR8lYioN3itMkfoJ7GW5VQlezeuIKOlhICCzptiJ/1TI+Sjmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vPcyrBG36cU2uUO4yJSjElzVjCLqsd0hqdFY+PKFFtA=;
 b=GpKhWLnaAyoYf0y4QsU+7FAEElJXxelU9wPv+GVecz9YhiEByaNELFR/R7gNqsJpo9PV+UgQJh/hZNC8TAthPSZted+RscNwL8yffG27NavC51S3u1qSNb7s24TtT518HjcQyOH0smImb+GLcm41ieHk7fvgRaIqZ9sKIPcxifIASZ/sT1wq/+aIvaphLbBnaKflxSKzslOFemXjhZuSB8riEXRnGSFN6iu1vWxKzSR9izd4CleZkMezHXRDjW3Ez9gOW2uKSFtyc4sc+JudPKcedgcJTSLc0v9V0s2F4ji9ladczpsBBfKZ4SdpAYbDl3iWpfd3X6kam5a1DERprQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vPcyrBG36cU2uUO4yJSjElzVjCLqsd0hqdFY+PKFFtA=;
 b=iqoGJ6sz8eX2gL1as60v1PRdS1zY01dGOs7GEPUPJsgsP6OrqiXkRhBsxKXwRKjkRMwpzDYL/s+L52hrzn5qLQu6rhva0LWLx1JtWpocasEYJfO/wQbtfLADuPiX6yJ0exPx1LmFDkt/mCWqJ199/fTZNP+hd1AWiZ+1AmASNqT9Z+xccqf+r/7fu78tr99nBf+F4Dh14kJHOcP1+ct8wqBVms/28sxu/bjfELdIvE1OceT3oxvLJdzrUjJUTjjCM9NiuzLGBM6+1qQDUdgmrbgZbNZsPBYXrPTU/6LhQtHRy3r+mA26F+7nx9Y0WqxD2qKADATEs/guVbcos8Xy7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <de599aa6-f266-8720-71eb-a5425f9d098c@suse.com>
Date: Mon, 31 Jul 2023 11:02:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH] x86/amd: Fix DE_CFG truncation in amd_check_zenbleed()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230728181730.3065977-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230728181730.3065977-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0184.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7283:EE_
X-MS-Office365-Filtering-Correlation-Id: e450a7fb-12aa-4c9a-79b9-08db91a4e0b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5K9M8dQors1pZFO1DvI1moI2UTSvooZ8mvMob1jzK8MjAxcj6NL7KaP6DabdKKO5vlSw8NBUY2dYio28ekzHsKIJwfJ8GvQfiCefsbPLxiWXU2GN+vJx8IbYSbORPXt9l4H3oXPTUDvE5JorUcbTxg47/Gixk9L2cXHKYKPvujZJVV45Lm65cauMO2LHp33cKjxeyjT9fZVzPmqWJMxa3UpJq2RkzHZquVw9XZWds7N3Paq6OCC8gVaiS4UNH7VsWh6QG+DuK0pyEoPeSUd9xMJqt+7n4EIRlvcm3oVyOHzmfWsZYzy1pvpEy0zqBfWmm6D1QO4Yj/rkmEbJyq8faVNysLYZPas2cBPHIlefmpJeF4ivuIyU5pc7YfAFGdXVw/8N/CWbzp1y8pDJXn0eCSo2O869pMSg+tA6lINze2+EJpq5maOZkCZybefZc4jQGlCrEVEbVvCKSfswECPkBhduW24lNLgGHzFAjdx6Vj8Nz4bEWkHzTSL3u/7SwKWMzFx8UvUKTCTwR2eWipSyzWGxw4qJkMFMDKocCpixXg4l6vemYSDw7UM9vMk+fkrko1Et6Jm03Rs+G+p0LKZCG43SpYLTa0SoG4VXuaqOdHB4pK12HuCNyQU8agpp63Bjnh2d1Hr+ePhdQZ8c8OL8xg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(396003)(366004)(346002)(39860400002)(451199021)(6512007)(6486002)(186003)(2616005)(36756003)(86362001)(31696002)(38100700002)(26005)(6506007)(53546011)(5660300002)(41300700001)(8936002)(8676002)(31686004)(6916009)(66946007)(66556008)(66476007)(2906002)(4744005)(316002)(478600001)(54906003)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MkhkYnF6R0dzZkRFVHk1alozWUk1MTNIS3JGMyt6aVRKZlhic2F6aDNEeXNj?=
 =?utf-8?B?YkR1NGhqQUs3MVNTenZKK2JwbzZxU3puT054T3Jpc3ZTNG9za3h5c1l6Rmdz?=
 =?utf-8?B?bjFnLzJBMkFlbFhRT2VkSUdQZDB4YlZSRzR1TWZiTUl3YVBHNlpBc2Q4MElP?=
 =?utf-8?B?TENGaFdwQkhSVWFXb1ZLK3JEOGdDd09GeEZsZnF1R0VsV0RUczkzM1ZTWWtr?=
 =?utf-8?B?QmJuSHJaM2tZcUozU3FJb283Si9iRm1CdlhHWWxxV1dJMWpwV2hyeXpvaW1k?=
 =?utf-8?B?UndMTmZvKzUxdWc0UkVKQ2syVmJkelZQcXI0aWU4Uy9ybTRUOVIzYi9oN0dX?=
 =?utf-8?B?L0JqTkpPcHB6VHc5Tm54QVNPVjRRR3JiUUNpU3BUVitRNzFDT2hwcFh3Y0JL?=
 =?utf-8?B?KzNYcUNSR290bzhIK1pKOGNBenBheGhkTFpCWDZLajdHM2hwQ2pRcGpucDlY?=
 =?utf-8?B?alUvVDUxcUdYT1ExWCtGUGpqcFFYYWsyUGlJTWhzQjcxUTc0MGFZOWNXay9R?=
 =?utf-8?B?UlEyZ01Xd3BUSjQybitwRWErS0ZhdUFLRjczS3AzNUNzbkt3MWxUSldTUnFa?=
 =?utf-8?B?TTRRKzRWNEpNNzhvbXB0TlBwY045bUJCa2MxOFIxdHRUM0FDbjA0VTR3OGNo?=
 =?utf-8?B?YmlMbk50SXJVMEZ3L2xDbTBaeDZsRDZBVmp2RGhQZTRPQkgzbmpyVnpVMzBs?=
 =?utf-8?B?bWVKYUdEMXczL1EyamhPdk5HblBId2RCUmRrSlhJdkdDRVBOZlV0OVZvdlY3?=
 =?utf-8?B?RmplQ3B5MXRWQ3ZDT2lHcUR6MnNVY2prVyttc3NpQUsrR04wclNsZW1FK0tr?=
 =?utf-8?B?QnBRSERweGNXUk9GVkFlZEE1RXBqNnU4Q0ZpMDZVRGNoeENjaklxN2VGdFJk?=
 =?utf-8?B?d0w4TjZBWGwxSUFKeUNieWVsNXRlNHJYT3hNVlhUYnlvR2hpWVJQYms2a0l3?=
 =?utf-8?B?UHRRUCtId2RuZVNaYzZDT29MaFRzSjlUYzZCS3JnU2tWU01LbzkzeTJkV1R1?=
 =?utf-8?B?aENJY1MxM3N0YTduVkVQZTJoQkwwTEFXampscm8xY2MrUlJYTUM1L2JLelJq?=
 =?utf-8?B?TFMvQ3hvYkE3eFBTaTB5c29xbVloUmd6dXhrRnF4L2RVdHI0enF2VHYrVldn?=
 =?utf-8?B?eVZ0MVdDdTVWNXBLQmI1QXFMVWE4MlhOdWUzc3FFZ1J6QmZDbXpzbXk1ZFFp?=
 =?utf-8?B?QkdJZ0p0UXhUVzcvbkVVRHNFZmJNclpHWktPTVZRWFNPcEVKWUtKVzBoa0pa?=
 =?utf-8?B?dzFpWVlQMVlEOHgxcG5aaGRxWGgrRndLNUZQZGYyUUNwTEtpakh0TVltUGpX?=
 =?utf-8?B?QjRJYUxhY21VanREakF3cVBxNGtFOFFaTkIwb2ErNGZwQ2p4WVhEeFdtSnN2?=
 =?utf-8?B?ZzNNNWdwV3dIaEttMUZXWmhJVmx1MEorL1dmZFBVM1RZVWZmcGR1ckRpRGVQ?=
 =?utf-8?B?WVlCMEduOSsyRUZtVXFXc3JYdlRxSGpVbmRUQ1R6S0VBR1p4SmlXZWhxMGJj?=
 =?utf-8?B?UWRCd29VUlAwSXJIeVpaYmh1bCtyejlMU1hyc1lJdDUxZWdJRzF0NG1rR1dh?=
 =?utf-8?B?WC80bGxVU1RIMWVWQjZDWm5hQndmcXRXaVBNMnRSK1hjVnI3NC9LR1B0bko3?=
 =?utf-8?B?K3dPVzNrQnNjU2tpbzU5YVNNK1VXaXFwd0tScFQ3MlRpTlY3ajhPRkVBUmlk?=
 =?utf-8?B?YVJxaGNQWVd2KzltSy9aS1ZrbG50QWtUWmp2aUEvY1Arc0F1VG9zZTAvZlFE?=
 =?utf-8?B?c2lHeXVoR3ZnV2pWZFpwM1FwbjdMTW9CRTRUOHRCcFVUZ1FZeGM2ekNHa2pM?=
 =?utf-8?B?M1RaRzZmSW9lMXV4SzBzNkhxRUZyNFBjTTlVYW5qTHFteHB2RElXS0FsVFBx?=
 =?utf-8?B?ZlVkdTV6NWxwVmlqRldSOXRnT3hpWHM1Y1N6V3ZHWndVbE9KNG1zRFhTMkxu?=
 =?utf-8?B?Qk9ERFBid3ZLK2FzMW85K0gvM1haeGd2a2xDQ0p2NnIvb3FRekZBWUN3VDVX?=
 =?utf-8?B?SGt4RUEra3JTTjcrblhERzc3S2o5YlRtNHR2R3JPRkhhWnhmN0ZVc0dMVVRO?=
 =?utf-8?B?S2FhWlRjMm13RGJHMXdrNVhZZTN1WXpZZnhFYkFKRkxlN3dITVJ4cHdGOUlC?=
 =?utf-8?Q?AbODQaB7aXiudXZkmb2brHtTs?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e450a7fb-12aa-4c9a-79b9-08db91a4e0b4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 09:02:33.8123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y/IELz5bd0ju0Inf5ny+0ulzTCdCCNSH/5lH58LRs18cIAfLQdRlRkKHvi+CLrPmFl2OFKSwNo3j64Paeb9bvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7283

On 28.07.2023 20:17, Andrew Cooper wrote:
> This line:
> 
> 	val &= ~chickenbit;
> 
> ends up truncating val to 32 bits, and turning off various errata workarounds
> in Zen2 systems.
> 
> Fixes: f91c5ea97067 ("x86/amd: Mitigations for Zenbleed")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> 
> The choice is between int or uint64_t.  This is one case where the insistence
> on using unsigned int as a default data type is genuinely unsafe.

It is not. The (unsigned) type should have been wide enough. From a Misra
perspective I'm pretty sure we would be better off using uint64_t. But in
the interest of getting this in without a lot of discussion I'll leave the
decision up to you; either way
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

