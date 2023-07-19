Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDAD7596E4
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 15:32:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565863.884440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM7Hp-0006io-RR; Wed, 19 Jul 2023 13:32:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565863.884440; Wed, 19 Jul 2023 13:32:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM7Hp-0006gA-Nm; Wed, 19 Jul 2023 13:32:13 +0000
Received: by outflank-mailman (input) for mailman id 565863;
 Wed, 19 Jul 2023 13:32:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qM7Ho-0006g4-OD
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 13:32:12 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20612.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa229af0-2638-11ee-b23a-6b7b168915f2;
 Wed, 19 Jul 2023 15:32:11 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU0PR04MB9493.eurprd04.prod.outlook.com (2603:10a6:10:350::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Wed, 19 Jul
 2023 13:32:09 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 13:32:09 +0000
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
X-Inumbo-ID: aa229af0-2638-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZZM0a+Kit/PrUSv4WAcX2bQVQiee2bQiHCBNa2TkpA/xjuAj1JVmjkYfRJ76vgMKFqZ6fLo1kDYELKRWQKrs1FJcMKhMzoENaDMMGWAvzL+/fETbyPZqj3b3TprTXkCADWIIKRdtbOFZtOUxYmM6ir5r3T/xOK+50k/0JJEY6qUIAyN86jiakPcTQfKS5cJLzhrh1wnnJSro5LTd6eJpi/WOD36hTr0B0VnyiRjRKxKEHNhoOl9Ej5xZv6GGpM2zg6q2/kYb+jc8CqhfBFCi0cLEbfmNpnxM7wFofMd/mJ8+JI3El45HRr/2DMMYlE33RK9c/3F/ronsK7N1znWh0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5f1k70+30YSCqH+dphjBlx5tcaWKc7vKrEBYeb02Sw4=;
 b=HKZevOTT4G9DfXE8+/B2Xt0xQzFsImMyYMnFsSa7b6MeCchMUZUuD187RwtqoVH0v1EV0+YURKmmep+jNr4goHmb2O6YRksBvhXeuC4tu/oKYbAnkMpXEDYe2BcTTDDOJUYIe4i7i4ebOruT5CN9RH9IFPosGSeY6Ra9jJQB0imOtwukF7Z8yyd1VEiGgM5bh7VLmwS3sNgc9mGCQqY893pKFMtGrWkvuPFyutoGPA6M+/ImoP5mLQR0+FmmhnqQIbDsAdjsCKLNogUy/AF+aIvX1BzhUTwfBFQJXTudo25jUXXyLc1RJhfga2ft2VaarSoUdcYbQ+aewnKqa1kPbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5f1k70+30YSCqH+dphjBlx5tcaWKc7vKrEBYeb02Sw4=;
 b=hnktsmNtjbfdxGVu+y1KPos4RYz5jPA6ca191XVkS3hYtXO3XSC0LdXzQ9MA1WlrPF2S538aqciHz0NKOEW4wAsYgblGNou2ZoVahxrBTuJVBFEwSiHk4A0DsQLXXMiE9w+8k7I6nF0wcowVjUOzjrU2d+rzGfZuhOvRsZYPFd8E1C6nuWlis44J8+g+xrwF3BAIfUeS/h5xPgV85FpaOC3MoyOsacNgKDwIlHDrk864dv2fVnO1w69mBqQKK6Qg+vtNh3upQ4Kh1GZpAXzFNV8PEsS89O3UKr0tfYzxz117Fk7EIoXKX63nb6DkV1yvSKrv26FLHQrHVaXi3gfMwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <58ee9410-e758-1503-e3f1-d25989fedc1e@suse.com>
Date: Wed, 19 Jul 2023 15:32:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH] x86/hpet: Disable legacy replacement mode after IRQ
 test if not needed
Content-Language: en-US
To: Simon Gaiser <simon@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20230718122603.2002-1-simon@invisiblethingslab.com>
 <ZLaLLe2HFDN5oWUq@MacBook-Air-de-Roger.local>
 <ac77ecba-6804-1d16-60dc-f184e5d31dcb@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ac77ecba-6804-1d16-60dc-f184e5d31dcb@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0063.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU0PR04MB9493:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a9966a1-f588-4f17-fa82-08db885c8cfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	m+3hJRLf7e5wXWtMYJLYAUIQ9IYrdT0Le3N265fnVVNhkHl0/9PZ7H3YRTDHSq8AaGPPRputOwDx9RVPtBGD1GhkQtzVPA0/RojdWZOnObJEz55Ma0hOGjteXm2V3JF3RB9KUPoS+p1MRdnVNw7H7AwcDQVksRODMvilSKqlIhIW1lP8tuBH4qgYqipqOFLjn+QvCwN4YCX50pdzN5cuJEP0t1ZF7Rvpw3fw1gr4pbq1EbFpOapmWXaJ6E/uDHXyc2wZqCte++7WwQIV1BRWodwBKfX79GP+9s9uQN6npUkI8vwE410A1BbW0rX1G78f42WCP8sJGeWJDALplGztopT5Blv9RrloHrmz7sujcWHsxR4WxqlzCv4iHsd7ocTZjAbu5bFqOa0bKRpwRg5WdKG+YBlsKLAcr6E2B9uYZhgYFburFuVNubxAU4tyGJXRzKPbdVflvFmR15r+xVZtd7dHDxOC575bX8hfoE9rdLISr5yPZs3jyfOQmhH1DsEuE6ikSTZbUdXCghsbEF8zPLm6f8sp8Bq2g7Xb4DFC2nrAWQvWAZYvy5buwhsfdo3IQ3LNRqok4Z1NtLBPr/xwlyDdcTBdf4uwTQ5O2NZBqMLovRSlHp/UiP+qJNjJpjIjNCgMCmboEjjSaLlk5MICJw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(346002)(396003)(39860400002)(136003)(451199021)(2906002)(86362001)(31696002)(26005)(6506007)(186003)(53546011)(83380400001)(2616005)(38100700002)(36756003)(478600001)(6512007)(6666004)(6486002)(54906003)(316002)(41300700001)(66556008)(66476007)(4326008)(6916009)(8936002)(31686004)(8676002)(5660300002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3Z6RFdGT3A3bGJrNXAzMWdaR05XNzVOZjgxM3Q1Nitid3JNZXIyWUE4WUJU?=
 =?utf-8?B?Ulo1bHZYd2J5bGVQU21kZUdBL0R4OExLRzRhTExzcEN3Yjd4N01wOWZuUEV4?=
 =?utf-8?B?eWVINkp2bkZYanFCTEp2K1NaanJzbWpOY2lNQkZ5OWZOM29MaHF3NEtDbWJU?=
 =?utf-8?B?ejBDRzllZWxUaVJhTkg0aFJXSk9lZ3hNRGsyQ2R6MktOeEQ0bk9uS2lUN3BQ?=
 =?utf-8?B?VXNXWFJiRzR3NnFYdVVkU3ZYY0RuMCtrcmVRd3hxZnZtdW1QWlRRYzNMZGJy?=
 =?utf-8?B?elp1aU9ZUCszYmlSREEwM3k0VHJyWFRxR1VkUzRjQm9BbUdOdHBlZ0xWQ0M1?=
 =?utf-8?B?SGJNVUF3ci9nZFdXSk9CTFcxc0hwUXNFN3lCSDBxS1B6WFgrVWJQaUJNWTRC?=
 =?utf-8?B?L2ZCandOajQ1S3lEempGTmY3MnVLQzRTYVE5bm5NTVNJeFFEOUhzS0VNOVJS?=
 =?utf-8?B?aUYzR3pCbVRIWENUdHExR0hsWVkyb1Y0ek9BZFVqVG4xRm1yQ1YyQlJxUmxD?=
 =?utf-8?B?anlCS1dyTnIrK004ejkweHN6YjdQaWhZdllINzZCdm5tSG9SYVhrQVhydWhm?=
 =?utf-8?B?cFN0dDVweDY1eDk3UHdMTER4cFJBdTFxajI4eWlteGNTZ2FRdFhQQU5zVU9L?=
 =?utf-8?B?bjBTT2JvNmFXUUVHeUdtb0ozR1VrTC9GWjRmOUh1aExTbWhGWmtjZlo5Vjlt?=
 =?utf-8?B?MDEyQkRSb1VFcDVmK01VNTNGS2diUE9Dek1uZHVRdVNUUEU1bzIrSUlsRENs?=
 =?utf-8?B?M1BVbXBGODJXQ2dEZGJHc0p2STJ4bHB5QjU5YloxQWFoRW8yVGN5d3h3d2xi?=
 =?utf-8?B?NzRHRkNyWmw1TlB5R0NIOW8rdm44ZThYaExXSHVpRDNuK2dzRmZRTUpvZy94?=
 =?utf-8?B?VXNOWU9waEV5eFY5Z2xsdldwaGEwK21naVJicHhRV3RmKzA2WjZScVFuNkxW?=
 =?utf-8?B?UFhEYUhCWkJncW8ySCsxeWMxd3pzaTBmM1EreXgzZzRhNHpPdDZnby9YMW9n?=
 =?utf-8?B?QVdhZjRRbnlpUFlFSTZjZ01MOUY4ZCsydzdRTndVMXdBMnF2UEwxN1FkSExs?=
 =?utf-8?B?bGlvWWx3NVovQVhhc01IeW1iU3BvNThJZ2ZzR1F0eTdYZ1k3V2pzeUdKMjIr?=
 =?utf-8?B?MzBiVDRjY0IydnJ6MitPRGJ2dDBzbkkwVlUxQVVVUmR2bUZYaHRCaW5iNGhP?=
 =?utf-8?B?MEdEekpaUS9ZT29PT0NjR1FJeWZLN0NSMzUvMGNndkJSeE53c1J1ekdhQmVH?=
 =?utf-8?B?T1JKQnppRkdLNERKT0R1c1E2OVZ3cDZFNXExcFBlYjdEVjNieUVmUnlFMkox?=
 =?utf-8?B?THdOWDV0V3l2a093TVFnVnhHaFE3b3RDNUpsRy9iRVlEWVJiVmpUcEszRm9H?=
 =?utf-8?B?V3N0TkVucUg4cENqV1NOQWtWVWtFYjhUMGhKdzRxNmZxU2JOQjl1SzlNNHlI?=
 =?utf-8?B?RWFIZm1TYmNoak44cmdtZnZGcmY4NkF4anFEQW1uSER5S0NkcmU1eEtEaVcy?=
 =?utf-8?B?SUNhRHRPZXdjUmJVQ0JUaTcyUnBBNHo5L2k0NWtNSm5ucjBNZjFqSjNIZFB1?=
 =?utf-8?B?Y0trR25IVVcyNzRCQjIwQnhZM1lKNCsvd2J1MThPa05JT0FkdFJUOW53Vkhm?=
 =?utf-8?B?VENqMGdob25PUGJuenMvNzFlM2dOQ3BUZTFYNUR2VFhGTVNwMnI0cGhNTURM?=
 =?utf-8?B?NnVvK25yMVNIS24vMGltRlJVUXJkajZYUys1RG1GZnVLaDdpUGI1RVBuZGlG?=
 =?utf-8?B?RUFGeE1FenNXYXVMZ25vdTNveGRsTDVqSU43dWhpSWVTUVFKU29zeFJkVjRN?=
 =?utf-8?B?cUY2ZnFUSnFOVjNFeE1TYkxhWGhuN3NVamNEUVpYcjRYbWdHK01YQ0s0T3lp?=
 =?utf-8?B?bjJYSDRkNENZVU8vUUtQMFlnM0o0dC9iUmNpdUlxT3d0VUxGUFNremcwRlFI?=
 =?utf-8?B?REZxdFNVQ1lQaVB6bUtHSzZPcnhLRnFsaFBFZmUvRWdTSHgrZmJTVTRFVk5D?=
 =?utf-8?B?RStDWWIxTm4xMHBmN1lCYUZzSzkrTnFwZ3dZTkUvZFkvYlVSbWFweVlORDZn?=
 =?utf-8?B?S1JPd1JLNXZiZDZtOG9mUTd4UDFZM0ptYXFKMWNCcjgwN1llYm5EYnhJbjNl?=
 =?utf-8?Q?5z20X8FteFQfRgN1CWSocsx3G?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a9966a1-f588-4f17-fa82-08db885c8cfd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 13:32:08.9425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NkcHYxNHW9F0j5arsYjznpRkr6zCu5ZyQ2OZlWci/qM8QzXq6Zsi6seR744XnpC2yYbdSslxFCYh7dpqhWw2rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9493

On 18.07.2023 23:51, Simon Gaiser wrote:
> Roger Pau Monné:
>> On Tue, Jul 18, 2023 at 02:26:03PM +0200, Simon Gaiser wrote:
>>> As far as I understand the HPET legacy mode is not required on systems
>>> with ARAT after the timer IRQ test.
>>
>> What's the relation with ARAT here?
>>
>> It would seem to me that keeping legacy replacement enabled should
>> only be done when opt_hpet_legacy_replacement > 0, and the currently
>> modified block is already in a opt_hpet_legacy_replacement < 0 gated
>> chunk.
> 
> I was concerned that on systems without ARAT cpuidle might rely on HPET
> legacy mode being available. See _disable_pit_irq and lapic_timer_init.
> But now that I stared at this again, I think that condition isn't
> actually needed. If we reach that code we know that we have no working
> PIT, but HPET is working. So _disable_pit_irq which is run after
> check_timer (__start_xen first calls check_timer via smp_prepare_cpus
> and only later disable_pit_irq via do_initcalls) will setup HPET
> broadcast, which should succeed since HPET worked previously.
> 
> So I guess we can just drop the condition (please double check, that
> code is quite tangled and I'm not familiar with it).

What you want to respect instead though is opt_hpet_legacy_replacement.

Jan

