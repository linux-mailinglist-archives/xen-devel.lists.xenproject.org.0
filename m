Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C58D76FA04
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 08:25:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576857.903471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRoEp-0000jZ-HV; Fri, 04 Aug 2023 06:24:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576857.903471; Fri, 04 Aug 2023 06:24:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRoEp-0000hO-EM; Fri, 04 Aug 2023 06:24:39 +0000
Received: by outflank-mailman (input) for mailman id 576857;
 Fri, 04 Aug 2023 06:24:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VoTD=DV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qRoEo-0000hI-36
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 06:24:38 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062d.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94edce62-328f-11ee-8613-37d641c3527e;
 Fri, 04 Aug 2023 08:24:35 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB9210.eurprd04.prod.outlook.com (2603:10a6:10:2f9::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.21; Fri, 4 Aug
 2023 06:24:34 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 06:24:33 +0000
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
X-Inumbo-ID: 94edce62-328f-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IPLVDuk4yMw580TDa+IEiM+SKBpGmJM+LffICCOxReSF38Y3TDFCmjBxg8wHuACcfwUmcB2LhohmEC5nNmtdoLuzsbitSaUiPOG0MJefuz7bp/BRl009wDXJckd7BJ2uN+jBAOmofWmEfYf82WZ7KTVt0/P6wCijabHhi47uA3gWtg8Vg6y+ZwtqKV/rwpPfeVPIRTSGeZa648TTB3M12+OMgMv2es4FVansk/JexfbcdofHlq2xFWYJJMkukoFvHDKbmMYCp1NR9pTCqzWTgD2hbYkitpjvAS7PRhJFTcWQMST86YxrTQNC4LBr5tFmUxdHC7VYxqP5FVyoc0zeZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=khlMCG6Lb9J8bmE3Xh+hVWhqFVltOB8R4ef78zKo+9U=;
 b=YmejZYI1aXx5x5XI5rfwgMzKt1sGu36SJJTPq+BJhShYi9m1cAQDwP/jNEz6Dr9WpcsXzGbZ8cVKOEYB76l4GSB92ZQvJpgqjUbXlXkpBGCJCDfa4PfCBHA7RJq+51hW8rTaXvkzX2cb+Ow+h5WLSafBR46C8nNO3waTSDt6TQ1Cbh/IXWjHpcfpCl5uUH4k9LguJAMN4jqbtUP5CDLpCp/a75rQXP123pKzZImgmELNVlPgA3Ad0o8EVCKMwpL7wn2cMithp3f+kZFL3/In4GDGhi/CWoC2yrNrGAxxFvWcZ/XUXq5q6g+XdXCwsc+/D5kkIbt60x3gvoSGy52zfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=khlMCG6Lb9J8bmE3Xh+hVWhqFVltOB8R4ef78zKo+9U=;
 b=H15Va7IhkvQ/rfiJbU655H3XJrkk9qgsfC5WiI106zUpWwYb8ajGk0u9q7sFGWsxxWIcpXLP7oG9Ce2qXdUZ3h2g4L4ivh2ZVj8wf9dPf4113m9Dskk2WKahApA7DgyN/WWP67nNFCKkonk/uaGNP/ZTdueD37GH6t3ssCWxhrHOQrh7xh4pYXyrSLNoxjxadrStzC8gapYccFquI+XSJplgGLh1OWA8AVkjNrSezvHt+LHIqhrYA+FFjdT0/kP5pBeg54T4PVnbrd/Ri80MG58QBra3UckYd3CZzZISZTI2NA8BXOZf6+lruYhXNSYO/hIhjlGsD/Zv3HvJ3P89mg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bfc597f3-c61c-727a-159a-859f57997d02@suse.com>
Date: Fri, 4 Aug 2023 08:24:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v4 0/8] annotate entry points with type and size
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
Content-Language: en-US
In-Reply-To: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0169.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB9210:EE_
X-MS-Office365-Filtering-Correlation-Id: 717811ca-3db6-4843-ff65-08db94b37805
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tDtWKHkcmrI4xBNjhFhf+u4RVSuXxfhCak2aEYt1l0+NWeORRo674QI18u5JUgsMvh4QtXR8bwjfdKHW1xIsSs9h2CW/PHMNmsnFqU3kblSbn7JpXYEHFhrxwQ5Zcax4qTBL6N4c8pQjyg6C3ho/Aa7lcCBVD7aSjPKHHIj4YP2VAyYAlujI1hDIokGd7vUgJLQq6VggUrnLRF/OCwNJW19/onSHr2kYoIZpjVkv3EjCPMpI5rlH/linJCrT4P/SJmCMw4iLYskdem81HOoPFyMxXNXvh/1faoi8jkChjLx0aCHAb/9yFHEJ2e0fxjLJkXC6d5h/dgZWvJw4yt0lYPGSwlSh5VwK8q8nsXAn/lJo4SStvzpF5qkdanHB+7IQSM4GYmAi1haHiMmMns3S57wwoIgT3txiAxAfjo3nbyixAxnEVgjSDz1NKGGgc/t+hjW5Em1IBEZRF6bvdLrRZ4A/8SOVIywMNaICB3JOqkV6Y78HxwEOylJelsrZt5oqf1lgFw0NFtClAWq4L7S9tXo1urTlFiAzlNWryVszdJaUSJVHpiO14zjZtiBcImReKyPSjhhWoX2cOuteR3O/kpNHwDBK0OKvcLw5aq2gAG87Zjfy9HEqFo7LSIQwloX6jEl8PlW8iv7e9el3jNNEYQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(39860400002)(396003)(376002)(366004)(346002)(451199021)(186006)(1800799003)(6486002)(6512007)(86362001)(31696002)(6506007)(26005)(2616005)(36756003)(38100700002)(5660300002)(41300700001)(8676002)(8936002)(31686004)(4326008)(6916009)(2906002)(66556008)(66476007)(66946007)(4744005)(316002)(7416002)(478600001)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGVNaGpCTkFITkFJZGVlMk83cXpHVnYxSUZwYWdFOWM2NTNFcitaOHpacElQ?=
 =?utf-8?B?Lzdyb09lQjlWQVNPL1U2a3A1N1pmcmhhd0s2T0xEdHhSY2ZJY0h0akx5M0pj?=
 =?utf-8?B?cS9wdEtkdnRCVE1GQnlIcHNVeUdtNjRXYWNMYUYzYnMzNkIxNHdXMWVIRElY?=
 =?utf-8?B?Z2xxWXlUbUhQZURJQmRlL3VOWXh4d01jL09KZmxjdXFXcGM0cTA4YThRVmR4?=
 =?utf-8?B?UVZheDg4V3hIMW1sNmZOdHhmU0FINUYxSnlmNnVFbHNMRitBUFUxWW9LNkVF?=
 =?utf-8?B?Wk5LUmxkM1FXU1ZKVkhVaXFnWVZ1Nk0vbmlaNDZZNUgyYVlYNFlFMmlNeHdF?=
 =?utf-8?B?WUw4MDl1RVp5SWhZUDAzL3VhRFBNQUJFcGFYZjl5VGN1Y3lZMUNQVWVGdVR2?=
 =?utf-8?B?NE03QVUxdmREeEdPdEx4T3luVzVybGd5Uk8vZC9iQitwTklxQU1hV0xhYzFC?=
 =?utf-8?B?M3lNN0R3czBpZ1p6TktadmZZazA0T2lSWHhwY004K1g0cVBnVVBiWmVzbFk5?=
 =?utf-8?B?TEt5Sy9EbXZ0eHdER0hVbXpkdEJzN3UrN0J1UCtEVVJGU2V5eS9yWlpvUUll?=
 =?utf-8?B?SmM2THdqMVBiSGlWTGxob3BtU1A5QytSOVYraEpUbFo2ZE9EdnJaSmJHcldR?=
 =?utf-8?B?em95Uy9UQTdZREZRZGhmdERPQlFGcUZpTzkrVkk1OVpSV2ZJVFJLL1I1UENM?=
 =?utf-8?B?SmV1SGl3bnQzY0lkeEhlZ1BBcHd3ZDRxamgzV29LU25rdS9icldZc3VrcGd5?=
 =?utf-8?B?VWZTNi9jZ05ENjBEQjAyZXdJNno5c0pBU29Ba0lMaGlDMzdZYXp3WUsra3o5?=
 =?utf-8?B?TUpZMHZYeEhQSjAreDhnelFSVDlVNmVCcTJCRHpYYmYxblhtOGQ5aDhGV3JS?=
 =?utf-8?B?TzhuUExDTC90REZxZHU2S2dSK3liaENyYXZlQXA1aldoUDVBSWNBSjVYTno1?=
 =?utf-8?B?SUNLWVVUdFlNa0dNcTdDZGJHaXJOeDZyeXhiVURYdlZEOGg3WUE2d2l1TmdQ?=
 =?utf-8?B?MzYwM3JYa0hScTFWSnQ4S2FCU3RSQVAwa2ZoUlFRSld3ak5DZ0podnV0a3ZC?=
 =?utf-8?B?ZTFucHQ3NVpuZUdMalROVG5yWERGcUJoeUVmeVZNN2MyREpHdjJBK2luUG9C?=
 =?utf-8?B?dTdWcTNKalJYenhnd0NGb3hPNEtUZStGYWNxdjRha29iT25oMWtSMTJlTllO?=
 =?utf-8?B?bDVwRjN3YmNHVklaUFRBNEUwMGhBMzhFZDU4czNTek1ZU2ZIYkIvak5SNnFQ?=
 =?utf-8?B?S21DQXR2QnhMdnhhM1JjbmxjWDEvekMyUjBFY2lqaTR5UUpQMERielpBQ25w?=
 =?utf-8?B?d01RVVFBZE8vRWhhQ3p0M3g1aWtBcEJudXJGVENXWGppcHhwcGVIM0F4R2Z3?=
 =?utf-8?B?WmhobXNwV3lBbk14N3hWaDNwczZmekREaStZWkFBcEw1MmZ2S09DemVOY1Jy?=
 =?utf-8?B?ZU9Oektzd0VCOHRRRmswWkZqSVZHd3U5RGRlc2w0V0ZqNzR1YXQyRTc0S0lS?=
 =?utf-8?B?MnBJdTRhWC9LbTFZNm5YQmZxcnJKUmYyZ2E4N1p4UEJRNHZ2bEdGcWtvTS9T?=
 =?utf-8?B?SXlISVFSK0FsNnp1REd0VXFJNWpyZkwvSjUzaXFlTzhHdlBEcXRSZ2ZSNmFW?=
 =?utf-8?B?VlgvTjVrd1BtdUsxdnlja2U0LzFFWkNWRXpCT1VaZjMzeXpSdWhmdWVvR0to?=
 =?utf-8?B?K1VOMVZYSzdaVnpJUEovemcrWTZFSGcwdTk5V29DU1NjNFFiK2RvZnFnUGpN?=
 =?utf-8?B?bFlNQm1CZnk3NXRwcHN1dXUvbnlKNFg3L2J6TG5Wb0phUWlNZnQ2Vm9uNnVP?=
 =?utf-8?B?cGNZZlY3OUFLcnFCc0JZeWNVRjhJWGE3TEwwS2dsQ2YxcGsrbS9MQlh3bkdk?=
 =?utf-8?B?aElrZkRuUmxwTFk0ZGdwVzBjclFrM0JHR2J1Rk5zS0FIa2tseGJhOFR2ZWh1?=
 =?utf-8?B?MUo0VXZpSlg2SUlyQnNVSjB5SFUrclFwbnlLbGFhamF1NThMT0pTUTlDQi80?=
 =?utf-8?B?MXhyQ0V5NUw3YnRlNENUOTBXWDV5ZmZxWUlKTlVrOUVIYnpOdVR6TVo2Zm9h?=
 =?utf-8?B?R2ZuQjBVdGl4akcwd25SMEtlZ01XVmw1ckJldkUzVmJRZDZVYk9Ed2R5VUpQ?=
 =?utf-8?Q?V4Zjpp7u8Y4end3sGYI1gorbQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 717811ca-3db6-4843-ff65-08db94b37805
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 06:24:33.8861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zLBPb3+ZRYcAaqGcUHXALFmStMibqxLic7oRqpmLpL1Shyj9c6dm2N7GUV9oxH5JKgnSUGjbLFBRLXsuMCYDBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9210

The model introduced in patch 1 is now arch-agnostic, and all arch-es
are being switched at least partly (to at least give examples of how
things will look like); PPC and RISC-V are still small enough to switch
completely in one go.

1: common: assembly entry point type/size annotations
2: x86: annotate entry points with type and size
3: x86: also mark assembler globals hidden
4: Arm: annotate entry points with type and size
5: RISC-V: annotate entry points with type and size
6: PPC: switch entry point annotations to common model
7: tools/binfile: switch to common annotations model
8: common: honor CONFIG_CC_SPLIT_SECTIONS also for assembly functions

Jan

