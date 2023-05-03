Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E546F57E0
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 14:28:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529165.823259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puBaO-00044c-CO; Wed, 03 May 2023 12:27:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529165.823259; Wed, 03 May 2023 12:27:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puBaO-00042g-9e; Wed, 03 May 2023 12:27:56 +0000
Received: by outflank-mailman (input) for mailman id 529165;
 Wed, 03 May 2023 12:27:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S1uT=AY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1puBaM-00042a-KX
 for xen-devel@lists.xen.org; Wed, 03 May 2023 12:27:54 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20625.outbound.protection.outlook.com
 [2a01:111:f400:fe13::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ebebd58c-e9ad-11ed-8611-37d641c3527e;
 Wed, 03 May 2023 14:27:51 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AM8PR04MB7332.eurprd04.prod.outlook.com (2603:10a6:20b:1db::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.21; Wed, 3 May
 2023 12:27:51 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7%6]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 12:27:51 +0000
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
X-Inumbo-ID: ebebd58c-e9ad-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qw98ewXzUnygrXuCZH3fKbYbAOyfhIiRAnG382VjQ9OleHtRNZTm8EAyvwa77hlhiZE2HbSpWx4FBXpjVfsI44kGK9eUny1lf8g1ErYFd1eOfAPfo6c67Z4vdU/L4I3hJINQKwBhQnZsCrqn2v+SKAbVX1QQMbHV+DLDwKjHN6WwWKdFkjB5RvLg5vOax76LmXuXLUAz0y5YOVkob/IteEselgtyEZSYQBOank8tpUYNu6tutXLqUvWP/4++9woknm5Bfbs9qLRRsfvZtRMm7cd70AAXAdaFWNkRe8E7VCPzU52uRm0Gi7OIzWikfWIHFcx4UCZfJ/QCnJwuf0KlPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v9M5VZYtq+Ran5nYj9i4Y8tieuCE7epdLKj66oHAKeY=;
 b=T7pBL6CYiog40yzAKvYGpCwuEF1XzzfdiX05zzz7VFoIYaZBZ4OPVUxMOUggCNgFI5CDeyFrQYFcdNVMgAcLzkn5xY3F77b6Ka6ydFJUDkpRDyGrr/KmTn9OSty4o/A6snhzdcEQUvg48N7sll4fFtpbWr70Mz1sZ+aCOB/mFG7Mkqa8CpR733uas6kI0kiKCvHk9AHWoJew0iTFrwATyh1rCrmNrLyMONeLJNkmUULLjNZ2VcqmeehzJjepVUAtPU0kNgRH4lfMpqv/WCpQ3irGLSYsTtfxtBG0MhiUM7PFctkn/3R3LkWooiPj02a9Wj4fyaKHnE1/pnMXloNE9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v9M5VZYtq+Ran5nYj9i4Y8tieuCE7epdLKj66oHAKeY=;
 b=Le1kwJhj7WPYIxOnoloTHR9k3PcyiPe0UOh314Kmst1ZmG+JelG+nye1hnFDxLYRVmvNL1bxpIhpaEp0kRvZiC3t7wG/pLhDUbSzsjefGrAMTugX4rsW5NN/RRc4gVvoiC+aSKM0PNJ34eK8l5Z8J3ceCnUopwcJoiKD7EWUsdK/oCZxVENWPN6YKVXGUBwK6pcPNocjm+9A4HGAyhGoKR9j3OtbZwZQcbwrNONyRFS3vISm/kQ62dL38OMGw24dkqWIqVUxRYnm6bFdxFkBFPGSXwFLuBP3LwwBSUOiDdJst06rwmUB7Xg6gZUmPXJROcToakQ1Qa4eNQyigfas9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7cd38c79-2876-87a5-ed2a-8a49a432d79d@suse.com>
Date: Wed, 3 May 2023 14:27:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH V3 2/2] libxl: fix matching of generic virtio device
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 stratos-dev@op-lists.linaro.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.com>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>,
 Erik Schilling <erik.schilling@linaro.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xen.org, Juergen Gross <jgross@suse.com>,
 Wei Liu <wl@xen.org>, Viresh Kumar <viresh.kumar@linaro.org>
References: <18458fa39433ce4ac950a0a20cc64da93db0b03a.1680771422.git.viresh.kumar@linaro.org>
 <888e60d2ec49f53230bc82df393b6bed4180cb8a.1680771422.git.viresh.kumar@linaro.org>
 <6d18f284-8cf9-4c21-7057-5f53bd98536e@suse.com>
 <1e34ae06-c5b1-586a-c840-1dcb768c70e9@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1e34ae06-c5b1-586a-c840-1dcb768c70e9@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::9) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|AM8PR04MB7332:EE_
X-MS-Office365-Filtering-Correlation-Id: 55303217-77ca-4134-25e4-08db4bd1cfc7
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	C7vKvupxex64WdRGeTWpDWPNpvjqQG7cZTGvlI2jj2lgLnJhfTfVbOyH8ZXTHl3VLqmvhu9xd72WNXyh15sbKpVcY+z994FB3ARliho629K/8dE94V/MXizYGvpaj1fFMjuH4TYo9zlHQlSaKJVuqlyHdYxwK0GzkNmrcXWFD80MpJvbYDnBwX5yAirFHDRTqdB7HpC+EEIXbLfijcTyGgTW45sp4XYzMlSuh72/Qikpgc29j5ztIAnqdOimtAsudg5tRggB44vLuKTLTC3S0eLzSMzfq8kvDQRCfn9z7Y6lMK4Sz1SOriBX91A1ujOcghTANeZ3YErDiMAbXIn8mqcdWQI+0Ra7eLNGn2wenIZf8T0wP5JoASJrE/OA/KvqElHW+CXALvp758OwlqMURYfhc/LE9caK5nJsRSpmf07dobEJBLidNbx0WhwqmEtnw/Vq0vXr/Mlh2b9aILPAY6EW87fVf+hIWLn3BSI2ZHjSnHwUIoSbFk8S9/oRZnSdwi0yTweZ/nXyI4sMLadQ7w4p5dmYWiCcogIFPH2v6oKMwz5yjo3JY/nlmaJ6aAID5YxtDXwqu0QlSZJi1R+58ZfRr8yOYmOX46bv4nsYykxeBwVK5QewvioT+niOYsjV8p3kRsJv0cM8cMmwomSfRyX65zSi1Rf6CDEUsNoCMPg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(136003)(39860400002)(376002)(396003)(451199021)(966005)(6506007)(6486002)(478600001)(110136005)(2616005)(6512007)(53546011)(26005)(54906003)(186003)(38100700002)(2906002)(4744005)(7416002)(36756003)(5660300002)(66556008)(66476007)(66946007)(4326008)(41300700001)(8936002)(8676002)(31696002)(316002)(86362001)(31686004)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YzhnT1hwNmN1Ynp6SVlYS3hselN5dHEwMWRPcmlVbFJXRk5ackx2cFFaaGIx?=
 =?utf-8?B?UzNMY28rVllrRjMvV3QvNC90aVRkTzdsUG43Um1zYmZLZEcxUGg5S2MvZzZ3?=
 =?utf-8?B?NUUwQjhNRzNxbndPYk9EdnE0OUhSOFRLLzdId2FrRE1naUNMaW0wdVJSdDBY?=
 =?utf-8?B?WUx1U3NFWTVSWis4c0pjaFVDSGVBQmRsMUJVaEtyY3JIS1ZLdHZDK2R2Slly?=
 =?utf-8?B?czZiUW04T1dDRFNxZVdpZzUzRGNTaThXaVFGWXFvS3kxQU5TZ3J6Ym9pVitq?=
 =?utf-8?B?STF4VnUvUHU3WlRJOW5BNzBCNkw5WUhHVkRhbG5uRTNCK2Jpc0FtR2RoQ0dP?=
 =?utf-8?B?emp5RnM5b3dmQVA5SDdrMHdiOFhTV3dSVWlxcUk1WXRhMjNVMll0UCtKWC9L?=
 =?utf-8?B?L2g4ZWlqUk9qL3dVYTBGUElmcGFrZTFYcGE2YlpVMU5YTzJBOVVlVTRLTUV6?=
 =?utf-8?B?cUFuZ3lOOFhwemFURkpEODdsVU56MzRScTZqdHJPVTIwMnB5bWsyYWtYMG9J?=
 =?utf-8?B?VUFqOWVtSHNCY2t5L2I1am4zUE01L2R0ei9WZjNUNEFkZG9OR3NFTnFWWEhv?=
 =?utf-8?B?dDR0b01vRFVkZ2FzVHNRZi81dWUyVjI5aXMrS3VSZTdBd1UvdTlsbGRzT3h4?=
 =?utf-8?B?eE9BUTF1eUNQUDhMQURQMURZQXlML28xQWt3UjgxbXdLait0NTlTbUVyVENl?=
 =?utf-8?B?aE44ejdUM0Q0WFlacjlaRmVlMFJCNFowaHIvOWpUbE96OVNtYzhLNEVnMVNS?=
 =?utf-8?B?UVhZYjBJelVDQ2V3R1V6dURmQVFROXRaY3NSZ2lKR1h2bTYvRW5laXlDemRV?=
 =?utf-8?B?czR5b2swLzdHbmNLYmtObUJ3eEIrNHJtZmJHRnZTUWRzWUZnUFFYS2FmZ0JB?=
 =?utf-8?B?MUlvcks5YW1JeHF1TmRXZ0M1b3BOYWt6VlZIWnJNQVpQNi81cEI1Y1o5eDZy?=
 =?utf-8?B?MDVkKzdYZG54SDBwaHZDSEdpcHh1QzBUQThVdjBVM1ZST2xXV0xKaFJwNFVw?=
 =?utf-8?B?TkxsY0g5VjRicHhlckVtd2x4eFF3ampMQWR2Q0o3SkJXV1RONGEvbFRWcWVo?=
 =?utf-8?B?anNHSDc4NnpvNXZCTDg2L25EWnpvOEZwT2FLRUt0ZkRTaWNYcXZmQ3c3cVND?=
 =?utf-8?B?cXJ6dUNwMnh3N1dWN1lnZEJRMW9BTFd3TmFpeDlWOHRySnhWWXNpbFZiSUl1?=
 =?utf-8?B?SjBVYUdINFVnS09GRkhmNGd0d244MFQybG1zTXlrZG96cDNFOVRVVUV3bzho?=
 =?utf-8?B?eGxBMzBOOHJPL0NYaVF4WkhneS9xdjBvYXcxQVFjeGVkdVpzZ1hpc0RLRHdB?=
 =?utf-8?B?ekdHZTRBcnhJMk1UL1E1bEQzaDk5eGhXMEpVL3FhclkwR0pPc0ZCeGt0TnFQ?=
 =?utf-8?B?cFYrd3A1RTgyajV6LzU2WGNUanhmaC80TUg0TlVuenZkd0FpN1dJVXlCTmRP?=
 =?utf-8?B?dWNORU1UK25LbFdnZ0pEeHQ4RTIwUE1qbUlqUXVTd3dKcTZxRFZkblJ4b3lu?=
 =?utf-8?B?Szlka2ZDakQ3dVprclIwNTJQUDFFeGppT0xKVm5Bc1F3c2lUY1BtZmc4MjdT?=
 =?utf-8?B?T244endpNTVBcUNSUVNCdVhnbk15c0JTTXJWSkFYREpXQ2J2U3MwSGIrblpX?=
 =?utf-8?B?UkhVd2lNNWNqVFpCbjViMjNoYWxPdzlZbm9jQXF5ZS9wMHNJRllETUw4Yy9h?=
 =?utf-8?B?SWxSTmcxS0o1VXlhOUY5OXlQa1B1azVjdVZSQVRPak16bnNLOExLWTdGcm9O?=
 =?utf-8?B?U0RHK0ZkTFgwTGNFT2F5OFlQVThRTlhRWHVqVFVLUmYxMHYvdlk2R2JDVkl2?=
 =?utf-8?B?N1RyR0JabjE0bHhaOW5nMTRVNkZMTWs5MXR1UzBuK0FSVXdTOXVuK0llK3dW?=
 =?utf-8?B?aEY5L3I1QmFuazJNQXYwNUdLTkZFUU1ia2lmYjh1Z21uWDhQNmF6WWhzNTRa?=
 =?utf-8?B?MDV6MmdhNDliUHhxRTRDdnRaVFFnTzFLNmhHRktuSUxWSDhuUWFxblZlanlZ?=
 =?utf-8?B?bWhXZ1FnYis0OUxvbGJibDQxTEE0UjRFNzZTcC9EVGUwNTlubjk0TGxhZU5l?=
 =?utf-8?B?elNleDQvK25aZGZWNTZ6MVZkZVV2bllJekIwWTZTVldwUytzaWF0VWMzbi9P?=
 =?utf-8?Q?HJfzdfY7340gKyRkVdsqpZ9Ms?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55303217-77ca-4134-25e4-08db4bd1cfc7
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 12:27:51.1052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jw+CWna+tnLJJiG4Z3q7uM1F61Cb0SU0Sm5TErcWLYM9ZsnCEwgEC9o6bnYpmbP1HbLyO7Yhq1bACT6ew+kpfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7332

On 03.05.2023 14:04, Julien Grall wrote:
> On 03/05/2023 12:42, Jan Beulich wrote:
>> On 06.04.2023 10:58, Viresh Kumar wrote:
>>> The strings won't be an exact match, as we are only looking to match the
>>> prefix here, i.e. "virtio,device". This is already done properly in
>>> libxl_virtio.c file, lets do the same here too.
>>>
>>> Fixes: 43ba5202e2ee ("libxl: add support for generic virtio device")
>>> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
>>> Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> While I've committed the doc patch (patch 1), I don't think I should
>> commit this one without a maintainer ack, even if it looks pretty
>> straightforward. Anthony, Wei?
> 
> AFAICT Anthony has already given his acked-by:
> 
> https://lore.kernel.org/xen-devel/5e98d465-be8f-4050-a988-2a0829a71a2e@perard/#R

Oh, right you are. Thanks for pointing this out. And, Anthony: I'm sorry.

Jan

