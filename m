Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E842736D2B
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 15:21:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551864.861612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBbI0-0006cT-6n; Tue, 20 Jun 2023 13:20:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551864.861612; Tue, 20 Jun 2023 13:20:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBbI0-0006aK-3h; Tue, 20 Jun 2023 13:20:56 +0000
Received: by outflank-mailman (input) for mailman id 551864;
 Tue, 20 Jun 2023 13:20:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lS3L=CI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qBbHy-0006aE-NI
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 13:20:54 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0605.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 480abd27-0f6d-11ee-b234-6b7b168915f2;
 Tue, 20 Jun 2023 15:20:53 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DUZPR04MB9899.eurprd04.prod.outlook.com (2603:10a6:10:4de::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Tue, 20 Jun
 2023 13:20:51 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 13:20:51 +0000
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
X-Inumbo-ID: 480abd27-0f6d-11ee-b234-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e7ruIj/ePbABAKh7M355D1dDGL4KccwLIVbJgz1qJSoSW5CKa2U4++JAimoR+b3SHnt7/3zm2Elu6YLzrAhYqQVElqfldeW2IIJ9ArRqC4i6ABemtCW9y5V+XEvDFlwbGXEr/O+QHRa4i5YH9upl5aOaPTJGMmOTvRyQqAX7etas/Hprjb5DPgMFIp7Ko7V5RfQ1JKicGZ1JSApqyzDk72BBoFy1eS8Rw9d0V029hQwo0Rz6tdBVuuEYte7QjBWufAj3HYHQOhEFY4LkMB5IagITDRiUGiSDK6UYMjCFJfzNfY9M++dno04gIQoiHpFLOwKoSWevRqNIrISSzGXiRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3W3Q4/gEpez7UTZK/oBjLPGe8Qea/qB5WAOwzl/epaQ=;
 b=Tjflp5nFCX5qLfvNPeF9AYkR0nG45lfQrKSP3vv+5+03UXiEOJDCu9AgrJRdKGYP63szkq+0U5M/brGIYMvdXY79euxJkmz64sTFQyNKVoWBKiRv/I5SCVBKeI/QArX+cxkX0tB8D1qy7BpQ2N4XnObrUlYnsyIIF6bKAy0wXEULajPuklkInhcifMaOMu1NUjWf3YLeaAV3FNsvDGhIIjdb7Ovj5fOqEmJQOBCxyekQp03FRjieFFuAoD+5a8JjuUxel+Zcrpfu2KSvRLDaFPtYCV6WrHKQDkcXK8DRdOpPG135Lj8ASNV4MaZkTMJr/u927GvRdgO0B+UROvxXhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3W3Q4/gEpez7UTZK/oBjLPGe8Qea/qB5WAOwzl/epaQ=;
 b=IdFNoHvte/s6M2Kv6+Lb+d5Eag1qSFxbDUF4Zs88nOpQAIZg0/+w+Ov1YkojGi6VKu1sAlHLq2AuPVM6tzeiSicggzG5WoALEZZoWeaF6RWkkd/M1NyhCWZsRENhONxxXeQTscnohoIRYjWYvBG4X8RCymXU1gXrU1QZimx/LcDt3/pShyP7Hx1DpFGFXGkD03eLLfdAWUcef2avWZTG8rlwtGJ7qgPXt7pzZLQbvgf4M8PAYORKJy98YCmyfsg1ttf3ISI4XCxiRSuIvT05rZK2PeYruVElGCmmREhTuPRoF5qFSvwJoFxZzdxJnJqnGuxcY9xfTh4J7pZspEbu6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7837d4f0-ebb2-b420-7af6-d8b3c6b2daa3@suse.com>
Date: Tue, 20 Jun 2023 15:20:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH 13/13] xen: fixed violations of MISRA C:2012 Rule 7.2
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, Gianluca Luparini
 <gianluca.luparini@bugseng.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
 Ayan Kumar <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1687250177.git.gianluca.luparini@bugseng.com>
 <3560de5fd05a67cc10c9426ffd55639ebe24d98d.1687250177.git.gianluca.luparini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3560de5fd05a67cc10c9426ffd55639ebe24d98d.1687250177.git.gianluca.luparini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0095.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DUZPR04MB9899:EE_
X-MS-Office365-Filtering-Correlation-Id: 7df3f54e-2e74-4193-c5eb-08db71912b1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hMWrrCJWUbN9QJ9wCZWXlQKlxW8069a6wELQ5Kl/77ShjYNb+XrOasK+I+AvjMog0xQ4yUZlvLazhi9eYRhI+TW/oSYgg5kolJH5YXtA7amkfQtAz9cq5ch9S7rwXFJH55G3RhX4elRe7KeRAcJyX65PAy74frwsuK1IpwcnwB0BheLtGy5g8hPttLjYbNttfMrGM6Q76T75iH428fvnLA8YJIJOOdryZuwmZuoG2YfyK2egH2p4ixgm97Dff3KXd7idkF5zS6QLrXAP0ojkzTIFAfMp9VPSs3SWhygHFEuqqopxdwGToH0k7llOIczG5xfNrz1HtnW8YUEE1p4ehe4w7VdH2l5eN92zNfXLAAeiktrpWvpynUuCR0PU8j5gL892HVUi04wJxUxPrT1OMC6DLMexggTnY6dRzIijMvrqLGqa/VylQOuvDp4288dzd8cITZK0C90Ld2gM76JaxwzrOzC0pYhiIV1/viZBmrnoCfK2mwPP14W5FS4anJ2CGU05E7G2FMaF+p19uvFFWIJat1ZerBlqOko0/rbUhuNneaVQDsFXe3l6BPXiEijj1xg4wlRFiziEmu+vra95CDOqPxq83ItcTizLV0nMqLNbc2DQBCBYQgGVZEBg1YZeWZPAB5/UNH/yeS03SDnVbw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(136003)(366004)(39860400002)(396003)(451199021)(478600001)(4744005)(2906002)(6486002)(54906003)(38100700002)(316002)(7416002)(31696002)(31686004)(5660300002)(41300700001)(66946007)(66476007)(66556008)(53546011)(6916009)(6512007)(36756003)(26005)(86362001)(8676002)(8936002)(6506007)(186003)(4326008)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WnhSd3VSTlVkZDBkZGNPTVQzajdWV1pNTmxXdVIxTU1UOGVZMHA5SFdmMFQw?=
 =?utf-8?B?ejFmUWxIS2ZYbmRUUkx4c29MclV5ckFWYmdLK0tVbXRTMDNsN1ZUL1RON3ZZ?=
 =?utf-8?B?ZDJIeDhyQlNNeEJVYlduSWY4akFmdGVlYlF1VUt2VFZaK1ZScHNZS25yOWgx?=
 =?utf-8?B?d3FrMlA3RTJKQndWcHpxemlaeWt6Vkc0UHBxQVRHK3RHWHM1MExmVHJvbkVm?=
 =?utf-8?B?aUFSWlMvaDdPQitIYjVtRTAwdUFDb29pSDZIdmVCQ1VHak5XMGtBZC9wNnpY?=
 =?utf-8?B?S0puK3BLejVGa2RDNmtrSTZFYldNcHVjalU5TXh4c3FUcEFOUmVDY2N1TkNw?=
 =?utf-8?B?cVkyQWpnYWpvM1BYdzBCMmJGaHpzanIwTmJ5U2M4WlJNYlRBUUZxQ2NrT25B?=
 =?utf-8?B?T0xySnpLK3lQbVF2dmpSVjRQY2xmWXNTSC9oSDk4cjRQeDNDNk5GZFlsbXpy?=
 =?utf-8?B?QXVsUkp1dk1Vam9JZ3NrV2RYNExRK3Ewd1pieU5vWU53VFcwUUhwaUcxTnEy?=
 =?utf-8?B?bFFibHAyZ3dLdEMvL29obThWWjYxcE5udmpxQUdtakxRUGl3MjlpSE85bFJO?=
 =?utf-8?B?d1k4cTZocS96TGYvZzE0NFVMWngvTHRwYjd3cFREc2creEpoRHpOVU1MMlpT?=
 =?utf-8?B?ckNhU2ljK1RUTkI4MC9PL3lUTUFReW8yVnFLMG5NVFR0cVNsazZlbDc3WjZv?=
 =?utf-8?B?M1pmdUlvSXFXc1NucG03QytMQXZDSFYrT3AvemFvbEE4REhXMzVxOThpbndN?=
 =?utf-8?B?UkdaUW1MSGJTMlF6MHRIMlRZMU5tUzdEVTVnSGtDd2xrUzhKZGhNUHQ3U0J5?=
 =?utf-8?B?dlIvVG5oZHo0SHo3RUFlZHFJblBIN1Q3NnJ5WFZ6SmlXNkQyYkU1a3hhRGRr?=
 =?utf-8?B?SlNleGtTMTJHcmZLZC91SWNLQXBYUXRIaTFHQXNTMlBST3NoZi82UlpCbVVj?=
 =?utf-8?B?L3NMMzIrVHExaWdEb2diRGNBQlFKQWFlekpMMTZLV2NZeWZZQS9IOGFUY2dV?=
 =?utf-8?B?UllZVzNLaDRoSTNYbldVa2o0bkd0RzV4V0VDMHR5eTE4QlpHb1RpSExyR1Fq?=
 =?utf-8?B?Vm1KZkExRlFiVjN1WVlpVldxWTlGMTMvRU1rd1doenhWNzZDZkFDUnVUcEJK?=
 =?utf-8?B?b0dweC9JVUFoOGNESXY2TXp2TnRIamdCRUNrVXRJOXpXN0t5b2tzMWNYZ0dw?=
 =?utf-8?B?azBOZFZSQlJzOXp2UFlSQlBBaXJia291Q3R0RGFIeHBvRkZyTWJQWjNBeWFV?=
 =?utf-8?B?OTh3RVJPa3FTSUFqSHk4ZFh0bGJSczh0ZUdIeElYQmg5UnRoeHp5OEZIUzBo?=
 =?utf-8?B?dHg2Mmlnam9nY1dQREVWZlM5UG5GRTlQbTAzcTNOSFBCMVhIOEZnaXdUZk1Y?=
 =?utf-8?B?dXhrK3FFUW1aZUNBQW5Sdzk3WXozcE1QbjB2aXFPZGdUSG9vWWdCNU1ON0Zo?=
 =?utf-8?B?WXZ1eHQ1VG91RzNwMW1lWFdiRUVZeUtqdTFxTTJjbnlpYTF1L0MvWnMrSFBY?=
 =?utf-8?B?a1E3dHJCVjZBWVBGSU42K1l5Mlk4cGc5M2oxMFlyZVJDbHA5cW9IU2lEa2Zu?=
 =?utf-8?B?MWNRa1ZmL3NkZzJ3eEdhOHBCNU9RSFRsZWpJYlBkTzQrU3VHcDNrT0R1a2tp?=
 =?utf-8?B?bTZKOHpkblVhcUxTRzhFcWU0SEVZUWJtdTZ2RnFQU3BNVjI1V3NhYk55MmNm?=
 =?utf-8?B?UnNNSmlRK0hpSWFoOS83enY4bGdseUFvbFdDeWQ4WW9iZ2U5dXpIUDBRTjFk?=
 =?utf-8?B?T015bGNYcnRJNHNCTlcwREdSemJ0RmFuMVE2c3RhUkVYRENuYXBvWmNQekNH?=
 =?utf-8?B?djMrcityRW9kSGI4blMvWkRRczhtcDlmRnFLQ0p6d21wZndVRUU5MTlEd0My?=
 =?utf-8?B?MFh2VWFvSlRaSk5PcHBjR3NlcWtPTklDTE4wSU5TNnNPRVAydExXelVZdUp2?=
 =?utf-8?B?aXo3OHV5NHBJZDF5WUFIYlNJWlByOEY3QW9IdU9nQ0oyM3JtTnd3YmxxcHgx?=
 =?utf-8?B?dDZseXFBenZnZWxMMXN1YURhYjFCSzRLeU1aYk9zQTZad1p0ckNxTXpaYjVL?=
 =?utf-8?B?MnRwTTdUUXJ0MGFpamo4aFRlWGJieUNQSTAyUEVKNU02Wm84ZzEzbytMMldY?=
 =?utf-8?Q?WzTBh1bt7MP/LA/bgLIRIR9PJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7df3f54e-2e74-4193-c5eb-08db71912b1d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 13:20:51.2395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d4f0BNJ/N+V7BGMyMZh66gasnuFgAq1bTU8AZVGsK9Y0t5xvKBFNFWcpGqHz9g4F7H53mlz+5jK47ERuCoXEJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9899

On 20.06.2023 12:35, Simone Ballarin wrote:
> --- a/xen/common/gunzip.c
> +++ b/xen/common/gunzip.c
> @@ -11,7 +11,7 @@ static unsigned char *__initdata window;
>  static memptr __initdata free_mem_ptr;
>  static memptr __initdata free_mem_end_ptr;
>  
> -#define WSIZE           0x80000000
> +#define WSIZE           0x80000000U

This again is an imported file, which I'm not sure we want to touch like
this. (Then again it's only a single line change.)

> --- a/xen/lib/muldiv64.c
> +++ b/xen/lib/muldiv64.c
> @@ -27,7 +27,7 @@ uint64_t muldiv64(uint64_t a, uint32_t b, uint32_t c)
>      rh = (uint64_t)u.l.high * (uint64_t)b;
>      rh += (rl >> 32);
>      res.l.high = rh / c;
> -    res.l.low = (((rh % c) << 32) + (rl & 0xffffffff)) / c;
> +    res.l.low = (((rh % c) << 32) + (rl & 0xffffffffU)) / c;

This might be neater and more consistent with surrounding code if
switched to (uint32_t)rl.

Jan

