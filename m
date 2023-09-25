Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C577AD52D
	for <lists+xen-devel@lfdr.de>; Mon, 25 Sep 2023 12:00:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.607749.946034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkiNf-0006xA-Pu; Mon, 25 Sep 2023 09:59:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 607749.946034; Mon, 25 Sep 2023 09:59:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkiNf-0006uY-Mz; Mon, 25 Sep 2023 09:59:55 +0000
Received: by outflank-mailman (input) for mailman id 607749;
 Mon, 25 Sep 2023 09:59:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3u+g=FJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qkiNe-0006uS-FK
 for xen-devel@lists.xenproject.org; Mon, 25 Sep 2023 09:59:54 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20605.outbound.protection.outlook.com
 [2a01:111:f400:fe13::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4618cc6a-5b8a-11ee-878a-cb3800f73035;
 Mon, 25 Sep 2023 11:59:53 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8596.eurprd04.prod.outlook.com (2603:10a6:20b:427::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 09:59:51 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::1353:3b49:2b70:6303]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::1353:3b49:2b70:6303%3]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 09:59:51 +0000
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
X-Inumbo-ID: 4618cc6a-5b8a-11ee-878a-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LN5JWjmAHP+6V1zNTuVXHet5Yzp04FALyUScLVoPQHybrekdR0+QZfksOYYw2CTVKV/anGWi2Rdibv+yJ1BEKmTXKZ8T3LVCr3LTmCIka6z5NzfYsrgep5rONlfK28VAtMe61mycVTaUZAcWN06YVVWDt1AEh8Gj9Qpoe50ZmWQzIBBt0dPfY0CgRIVbZlObqZNUMquRpqVZriHCvpSV7XUisTue989WZ9cXU8iGUB3TL/LJHdLcUH2LHveJ+PyO2sM/KtveCgANHN7/v5UWyhlOyyVX7XdmJNuQfxY0qr19nLM9OPqZQ2A0luGFFNaW/+mMKetw6epGOvD9bEIzmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=62zxQaHEZJ7GCGTQCjS8W89lWp3d9IoPO5mQ5kZRgHA=;
 b=jVaMU3qn5+kct1nHrWMci++v9lPLVk2pykvo5sqyyPHJ8oub/ucKX9Z+apF3Dx7T1ouPmLDjBonM0WJKVeYRptF+mG2j0g3uEiSgpplCAPZIUmBBN24fgKFaNN6dIrgifupDmLVSNLIptTdNVUDKl+lNOUy8/mMWNIACT2wHjSmpJWR3KvLDMLjRkHufA7uas08hxok1Fp1wyM08pREwQjER/Fr/VtUmVU+L+pag7VIJfM+BX3fQdFhORDXZX7OKqhcmoFeXtb1BpzOTmScpBYE5SgLQQVVcgRZx+IUoHJUPXvwV12U9Cw2xK6OaGI+McL1kjLnx9BWIbNL2NPzTEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=62zxQaHEZJ7GCGTQCjS8W89lWp3d9IoPO5mQ5kZRgHA=;
 b=vC2TltEq11P0z13LVn3xNmgZLVH6XmvPwVhoPa2lKGa8ZDlKbLVcGecL4IUMR0Pk6EytEWEIhWdyfpRDStlCTIYlIxR9n3FbXlZpEO5QKppAbLIycnqYUJuuLGPxUO9ArjKx6zzFdFrOlEqVTCOr5XdJw7dg/SRbV1aa+xqbNehh+SYJIDaaa75k0ZKXIfHveAWwxYZy1HIDneyrbERoqHE7PsU8eOdN+0VI+WR3G8dqlkDik9eHzrQ9W4tJpmIhGjFnnC+V6UdhCiPzl4klaS+mPNEEje7RSp+b42TiXK/Rj11fegWIPI0zIotXfEAZt17TqbpOLvZkd3h5x3sokQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9dae5844-8d1f-9437-ca57-7ea4ea057496@suse.com>
Date: Mon, 25 Sep 2023 11:59:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 4/4] pdx: Add CONFIG_PDX_COMPRESSION as a common
 Kconfig option
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <jgrall@amazon.com>, Henry Wang <Henry.Wang@arm.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <20230808130220.27891-1-alejandro.vallejo@cloud.com>
 <20230808130220.27891-5-alejandro.vallejo@cloud.com>
 <d462f419-4cd2-53c4-7694-b43b7fa68d88@citrix.com>
 <b0296908-5081-5d34-8487-b8293eee97ca@suse.com>
 <ZRFXA0dUHk5Rmlan@MacBookPdeRoger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZRFXA0dUHk5Rmlan@MacBookPdeRoger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0163.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8596:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c1779e9-cb86-4d70-db87-08dbbdae28fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mQrhttLlqy98LTkqU1yMYcKM4EHCxfuVYUGxpMaXcKmxduRTObreuUsTaAfUctSODvF8WaIYvlwBbDzLpy79mwgxtsrgL1AKyyvFa62s0CVQrhI3cK82ErdMLFC8yM5U2uloAgOLeHNN2N5kakD1U42Dv4wS+Nj9PmKrY1bhwRMNZTaOitVFhx+DCOKhAUw60gN2pOVsTIx5I9uPer9cW8Exqj5fZ/WOjtEDk95KOuaFoYXXsQ43Xcbvhbm8NTwfD+FvUduTnJL7nvTskw33zGGvurFHg1SuKKY/X+o8dZ+WQHGBpbcdSVaBUailj8ch2aoOGwVUjgL/44r4tRQJmhwXEZmDcSROkECCCqR7VcGCmdeeGw9YRKeobq0zw1mYP+aPj3OEeTOhRQFHAAfcWLnfwiVsP8ojJSmByWi2vk8LFyba7qind1rI/UFQmL81O6MEdBKu0UcdyUNKoxuaM2ql1kG4u9an1mmEROdMsYPkhDF5xsZJNND/F6XVPkW0MY9yKuStvz2WR72K49l0Gk4fKF7O/YZgvef+ysc4C16lIK5Sa/XtmM/AcDgrxtsmLBHTuOiE6T5luvm+i5tW++Ewuh/b87lgsNchV6VBg2iLmXrnetzCTqMo/0IoxeqCROZ0UzVb+KUSTOFR/mts9w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(39860400002)(136003)(366004)(376002)(230922051799003)(186009)(451199024)(1800799009)(8676002)(4326008)(26005)(8936002)(5660300002)(66946007)(31686004)(2616005)(6486002)(6506007)(38100700002)(53546011)(6512007)(478600001)(54906003)(6916009)(66476007)(66556008)(7416002)(316002)(31696002)(86362001)(41300700001)(2906002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVk0RWEzSVg3NE9jNTNQTUFqVXRaWHlNdUJiUjN2c1RSbmxlR1RHNVJmUFhn?=
 =?utf-8?B?WDNjTVZJT2V0dlZLbm9jL05RczNhaDNYMTgvQ3hrbDJGQTJDS0dDZ1lSOWcy?=
 =?utf-8?B?VW9CM1BaT0R5S2piOTFtZXU3MGJLdGRwdWhEQU0xSGsyUXdTcHVFTHovcWYx?=
 =?utf-8?B?c01CUDBZOGhSM0o3V09vT2lsWEhqRFY2QzVnaWhycWFrcVVROENRM2ZzN1A4?=
 =?utf-8?B?aVFNb2hiTFd3TnNtb3kxdUYwSDFLUkpOcDNMa2tOeXhVOHErOG9JVGdQa0tk?=
 =?utf-8?B?SnlaRXpFOGZoVU1HTTdhNkVTSzY1N1hnbmJwc2NLWUl1cXQvclZxM3JwMDda?=
 =?utf-8?B?a3I3MmxxWlRjbFFGN0l5eHNLMEJYclJxOFdaYWtUcXZHUTVMMWpZV1Y0L0J0?=
 =?utf-8?B?UVkwTTJXYXVLUjhPTHRXbWlkTmVxQVlQcUtpOWlrMG83Zk4vUC91TkFxNHox?=
 =?utf-8?B?bnpSOUl6YWVjYXJRTWZoMHhacWd2R3hieWwzMTVUdFVMYWVzYXZPdkdkbFpX?=
 =?utf-8?B?cmFVeEN5UlI1NkZmVThMd2pqOWx0eUxQaG11d3FxMHJlL3VRMkQ0RHNyQmRz?=
 =?utf-8?B?MG9WMzJDcDdTcU5lWGZ4KzF6SFArcFFRTGJhQytXY2N0YzNrc0hlQXR4ckJF?=
 =?utf-8?B?VU9iWHRzcDJiMllXN2pGM3ZyU3JKUkpMcVNUdGNHQU5YUDdaVTBsa0pNS1VW?=
 =?utf-8?B?UkI5M2ZJNkdiNjN0bGVlU2lnUi9ueHBrbm1MdUdEdWYrUXkrYzRONlBidlBY?=
 =?utf-8?B?aUVoVW1PdkpFeU1mQUlDZkJaZkNrLzU5dzhOcHZ3RXFSSGxHbXV4ZGNlelox?=
 =?utf-8?B?a0lNLzdXd1hDZVRLeDJYcU1PNnFrLzdsdXR4dEYwWnI5WEVQMkJ2NXlQdEVj?=
 =?utf-8?B?Q3ZpS1hqWlFnbmJBaVZsODREMG9rMU0xMFQ2NU9XTmU2ckJvVnNOUERIeW9v?=
 =?utf-8?B?cVJWalhsM1pHcm9xS1RpMkVsZ1cyZklhbGkrTlBON2s2Snh4YWhSSW5PTUtG?=
 =?utf-8?B?ZUNWYjZIanMzc1NzVHpaWDBQQzBkOGZBS0NGL2ozNVJXaUtLNmhDdkQ1dzBI?=
 =?utf-8?B?UnhjaFBHeEZwUGhZN1BTdWM2MTVML1hldDVVWXIyUmkzdTVzV2VrWEtVK2Mz?=
 =?utf-8?B?aHAzWCthSE9zK3M2Y2FmTFZjTVBPYk1FZFgrbmNFditOTkFtWW5ibnh0bW1v?=
 =?utf-8?B?M2xVcGhDcVU2VlI1VHJYSFh1V0ZlaG5FMGlDYnVIb0JKS2NPUTJxdjBDU1ZH?=
 =?utf-8?B?MHladiswS3lNSWJVR3R5Y3c4UUh3a055ZW9wVnJpWDNNckdMMVFobDVlTFZR?=
 =?utf-8?B?a1RvVnhsVjZpbmszT3JUMm0vUHQvWnhqcXI4cVpLQmk1akZLME0xeFlhRFhI?=
 =?utf-8?B?OGJqZjBBTWVCTmNic0hhdC9PYURXVGI2cXcvL3BYV0ZwMmV3OEpiUkNsems5?=
 =?utf-8?B?dlViY3A1ZkdNeGhFN0p3OTVsUEtEbHdsRTF2UGFLTHFZZ2tLSG5ZTmZOZmxj?=
 =?utf-8?B?STkwWWhxNzZKOWk2TVlDMVIweXN4S0ZNcERENmUzanJNVUV6MmE0VXRWTUxJ?=
 =?utf-8?B?bnFDcTNpWWYyaTB1aUlQUytYVCtLc0dPcEhRK3luOXM4M1ZvR2t1NFlrbFhk?=
 =?utf-8?B?VStTTkU2V014QmZVNkR0aWoyTHpZOXhYQlpubXJzU1VOaHozM21rN1pHQWoz?=
 =?utf-8?B?TVZrSFk1OWFnSEFxTDNONEljSE1xL1lrK3YrR3ZLRkVqMFE0QTFBcWxEWkJR?=
 =?utf-8?B?bXN2cHZ3MzBLNytVRDN0MGQyRk9hUUZTNkxPZDZGcUc2RnBta3lpODl4QWcr?=
 =?utf-8?B?c3ZaQlFJUVhnYVROVmpoNHNkVHk1UVIxMEpuT1h1eXdSRXpzOGtSbEFvYkVo?=
 =?utf-8?B?V3psR24vU3dNQUhXMDhtV3JoK1FoQlI2QWRQb1oxM0d4czJDMjQ5TFdBaDZC?=
 =?utf-8?B?VUpZdzZOV3lvY0ZvbVJCdFpRUEk5N2VESms4WFpSdnB0Vm5WWlZoelVTUFNN?=
 =?utf-8?B?WjRzWEhBQ0xjN0lDTnVpckJSWGp3MS9BQW1ITkRLYUxSb1BBVXdiNE9CbXJG?=
 =?utf-8?B?T3Q4MHd1V2RJSjRJWm15WTFadWlnejBkRGpMTHJQd1p2RnRiQUxQN1JlVnVD?=
 =?utf-8?Q?SqdmCQ5qpd/+Y2jWpe/bk55JG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c1779e9-cb86-4d70-db87-08dbbdae28fa
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 09:59:51.3674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 76dK/OLwXk1VjwEyFNxM+XqQXbl6ihu+R40iYi7LAAtWx5vesMhKdK/0+JJB/r+/J9tM8poxGDGtiCyrWAiCeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8596

On 25.09.2023 11:46, Roger Pau Monné wrote:
> On Mon, Sep 25, 2023 at 08:36:03AM +0200, Jan Beulich wrote:
>> On 22.09.2023 22:03, Andrew Cooper wrote:
>>> On 08/08/2023 2:02 pm, Alejandro Vallejo wrote:
>>>> --- a/xen/common/Kconfig
>>>> +++ b/xen/common/Kconfig
>>>> @@ -23,6 +23,16 @@ config GRANT_TABLE
>>>>  
>>>>  	  If unsure, say Y.
>>>>  
>>>> +config PDX_COMPRESSION
>>>> +	bool "PDX (Page inDeX) compression support" if EXPERT
>>>
>>> This still needs hiding on x86.  The minimal hack for 4.18 is "if EXPERT
>>> && !X86".
>>
>> If you insist on complete hiding and I insist on allowing it to be used by
>> people who want to play with exotic hardware, then this won't go anywhere.
>> I think I've come far enough with accepting a compromise, and so I think
>> it's your turn now to also take a step from your original position.
> 
> Just because I'm not familiar with this, is there any x86 hardware
> that has such sparse memory map that would benefit from PDX?
> 
> Wouldn't anyone doing bring up on such exotic hardware also likely need to
> perform other adjustments to Xen, and hence commenting out the !X86 in
> Kconfig be acceptable? (we would likely make it selectable at that
> point if such platforms exist).

As mentioned before, the reason PDX was introduced was to actually make Xen
work on such exotic x86 hardware. While I can't tell for sure, that hardware
probably has never made it into production. Yet still things were known to
work there after the original adjustments, so no, I would not expect other
adjustments to be necessary (provided there was no bitrot).

Jan

