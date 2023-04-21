Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB2E6EA74C
	for <lists+xen-devel@lfdr.de>; Fri, 21 Apr 2023 11:41:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524524.815534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppnGS-0002bK-PS; Fri, 21 Apr 2023 09:41:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524524.815534; Fri, 21 Apr 2023 09:41:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppnGS-0002Yq-Mk; Fri, 21 Apr 2023 09:41:12 +0000
Received: by outflank-mailman (input) for mailman id 524524;
 Fri, 21 Apr 2023 09:41:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LFmw=AM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ppnGR-0002Yk-DI
 for xen-devel@lists.xenproject.org; Fri, 21 Apr 2023 09:41:11 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062c.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a06d6fc0-e028-11ed-8611-37d641c3527e;
 Fri, 21 Apr 2023 11:41:01 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7919.eurprd04.prod.outlook.com (2603:10a6:102:c1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Fri, 21 Apr
 2023 09:40:59 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.022; Fri, 21 Apr 2023
 09:40:59 +0000
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
X-Inumbo-ID: a06d6fc0-e028-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PLeUKQJ2cdPNFHu1Wo+KPVYkdtNaKlzkqgGg7wcYfshJdHquYb0lEmUfe0sAxn4xPSaBJkXjjJzJiP2YY2kFdPcTuSCz+sEiL/D560tNIV8qTUe4mqirpTpN7QTlkIByJed0UcEEfhS04p6zFIwDt3myU6IaUfHyzMHN04tC1sJAqYkh2+GsvnNpvj+ej8P5hbdXAncIoMQ5/b/3TNgIWU/Z0GkVER3DFESPsk8P8olFiNTrE+7auQCctTlJTi5qgxLLtb/IBxWSYgBcVnsew0US1rboU4WJgEVxojOKm4aoMNR0lVXgUmV6Adllm4Ek57z9CPvlYAR9A6qxqhmRwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qmAZ9p1cRfWGhYOZ2UGE3s1GOrkkTeFoeuzkkqjL3Ck=;
 b=aOOmI20xgqJL/qnbVIY/E3DGOEfx3z1l6F06TLcyasAC9a3TWWui6sO6zzS3Z/Zs1Yu5fyXjR+JhE2OqzQsQK3HOXXOdwR2vh7esfheVU3UiNoZADiAlwqQSnt3JO8uH1QjHFC9iJvNvwXod7L6KPR7q01Gg/5w1YdN4MZJ2wC6rNlEVFFweUmHMnWgGxD2yVj6hB6vQG0ore4z0NtYEZHVW6cqQmCfP0prr8IguQNQiC1DnbMGKG2ey+2xPbuKZ1yWkgkFKJSeJ9dlsUA7c52hAJ9Rw1uGcUV49bApR2QVG6exXRILjYeWJaqHEmOvX0YDBA0WHXHv/xWuTJE0lxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qmAZ9p1cRfWGhYOZ2UGE3s1GOrkkTeFoeuzkkqjL3Ck=;
 b=QFSvenFEi+zyIv/OATPDm392DCbynJMOVpXnlhlr2eTBxJzrpVuo3mNP1526y6Tvyyczn+rUp931ZyXMPRlT2T9lkjQhKPLl/zDu77V1Qv8HaeTmtWHKr8JTj1327Il0YrvPTSg1mCZntAvaaYYixdl+0ouabuFs9tm1WbA7hwXMWEi1nMu4bTPN7MK9bBbRJ2FsV1vCp2dg807M+a9L9NJ41TuPGlyV89P091dHfDDWtCW/IEiOtvb3V8a7YniENfEe8iUtP3CLgo7v63ZqomyL0yr+D0FQkc/tGawDNGQAnFet29iomo7APH1jSwIWCfWWBhQ4jlXeEyRZpDESJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bdf33169-4e29-8c50-ff76-16d05df81a14@suse.com>
Date: Fri, 21 Apr 2023 11:40:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 03/17] xen/arm: implement node distance helpers for Arm
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230420112521.3272732-1-Henry.Wang@arm.com>
 <20230420112521.3272732-4-Henry.Wang@arm.com>
 <ac54e04c-58b7-d0c9-2443-bb09258c8bc8@suse.com>
 <AS8PR08MB79912F294EDAC48F835FBB7A92609@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <AS8PR08MB79912F294EDAC48F835FBB7A92609@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0139.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7919:EE_
X-MS-Office365-Filtering-Correlation-Id: 162f3579-244c-4907-88fb-08db424c8360
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lcPn/mszxLokdtkR1nGokoRuUsY6jfexa+3t35rr2NB3hBW2S1dgpsq7CqR4hDcl6DBnJSKOSVV0b1eSDdTVFakO38hoDoA12P4sG8y1EIOhFUC29ku/3SYZinw0bNWDogrcM5zwm4U6qr92gfVAcZ+6ILiKZyfjkikKhNg0zWfkxmZK9NiTyxJdvw5iqHYVPup4Xt4ZC6az2sn+4ewZgLorsDHY3IPPDJDABc9so/M5l7BaQ36S5BjIyaCrrY++Xjl0Trr7WhYOH5yltqruR7L5yE/K8Hs9/tONN+asP3RBszJoN/zkCopH9IKHUvRH+B0RsV1uCVBzbwz1g8rD606GNyIR8rkvhz7SIYUNRrFvqg77UlMuSGuDbKpzg3qujR5hEWlJIU0l5+WYwFzupu3oimrpL0c584mqs1TTywpq193I5fCCe7W4S0qNvDPgglbNkNKtTQ5xN4GuBRBh5Qy5ENXI8WfDU9me9TXZjj6M552IkzIjxcCzmdeoDu2ADFRBYESBpFh3Znh1Nb/9DAQAAnRM0bKYjJQl85IBw1MClCBz9YZp5ODXwED1cijQPN5WYMzLDiA+WJC1MPDkl5jqIT4TvfZp/Vyk/aITjaxdBHsWw8vk+7NL4ipf1XPI1WomyZNOMVsQHvH0563k9g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(39860400002)(376002)(346002)(136003)(451199021)(31686004)(38100700002)(6512007)(31696002)(26005)(6506007)(186003)(6486002)(86362001)(66476007)(66556008)(66946007)(6916009)(41300700001)(83380400001)(36756003)(54906003)(478600001)(316002)(4326008)(53546011)(7416002)(8676002)(8936002)(2906002)(5660300002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUNqdCs1U1JxMUdHUmJvdWhxM3FSaWw1bjdwSTNFVjlBT1NNMlNnK0YxTWJr?=
 =?utf-8?B?cGJkNUpVRjRhT3poMCtFZlY1UUlWMGFkc1l2c1lRUVVwUG92aWU3YWQ3ZlUz?=
 =?utf-8?B?eWV6NFd4VUF2em4xRmU1SXJRVjFxdnBab2haY2ZsODhrTnZnYnBIZGorcFFO?=
 =?utf-8?B?SmE5WTJOL3lmRnBzOVJUb3lnVnU1RkdJdVZhYXZBOFVHa3VhcUZNU2dTL3Bv?=
 =?utf-8?B?TjNYR1k4eFpDNCtCNkdhamsxODhPWllUSnNKV28rVTZGa0U2ZU9LbW0wS1h2?=
 =?utf-8?B?TWFWbFlYK1NoR2hSSkw3dkk5ZGNSMlh1d0NTRFJvY1YySTdIcmZIRjA5dW5k?=
 =?utf-8?B?M2JmUGVpa3JuejZuL2F1clhrMkVjYVRYQUFsazVYanE2bHBLRzVscW8zNzdL?=
 =?utf-8?B?VEo2OHVmNHRnbTBteVM5d3pHUnhtYmVWaWczSVMyNmNOYll2RFppQnMyNk9D?=
 =?utf-8?B?Z3F5blEzbFBuSG1ua21EeHh0c2F5S2tzSi9keUFMcUJmaTIyNXhZZFVTMmkw?=
 =?utf-8?B?NWpTS1pjNTRac25ucTN4UExaN0ZZdkN6TW5aMVVuRHgwaWNsYlJMUjVqdGx5?=
 =?utf-8?B?RnRhenFpVDNLOHdPcTQ3WkxJN3JkZUNnK2ZXYzRrOURxWHVpV2VobElHL25P?=
 =?utf-8?B?R2txMkhKQW5rdTBhQkxHbkxUMnNSMDFwNkw2RVR4VktoWlFSQ282Y0ZqRnNL?=
 =?utf-8?B?MmNCd1FoUHdsVkVlR0JBNVpIL2dCa1dCSDMrNG9SZ3lHemNXQWhwWHNuZjRZ?=
 =?utf-8?B?MmU3eHFlaTM4YkUwTnNGakRoc3VwS2hXd2w3SkJDRkVoenB4K1dncWhQREJY?=
 =?utf-8?B?MURDZDlISXRuZmYzVFNqNmFzbS9Gb0dTc3p2dU16K0x3RzRJT1BqQU9JWERH?=
 =?utf-8?B?VG1XY1l0dGRvY3k0NUR5bFFRdlVTcUk3V3pPLzlrREpGVmo2ZnlxakM0aWg3?=
 =?utf-8?B?czR4TXJ4M1dQcW41bDk4bFN2YmtyLzc4cjJUd05SZmZZcys0bUxBTFBmT3dX?=
 =?utf-8?B?U2s2UXFyZk05QUFRTlp1eWE4V1U0WTE1VllteUJwaitEQ0ROditPSVNtZ1Vl?=
 =?utf-8?B?UjluWnpCRFFEMkNjYllQeDRnTko0QmZTSUZPc3EyV0U4bGRPOU4vV2tCNnBq?=
 =?utf-8?B?QzB5MGZGRFNwSHZHYzZvK1BHNUNSQTNwU00yVzE3cmFqSm43VS9mWU5SQitL?=
 =?utf-8?B?cUNhbC9CTzI4UDdsSXhETWI3bUpHN1FDWWFuTk5NK1BzZVA4bmxYR3JwTWFO?=
 =?utf-8?B?MGEvVVdaNW1IekNRSmhDK1pYdm1TVkpEeXhtLzJUM25oN1ljajFxVWpENGlr?=
 =?utf-8?B?WDl1L0dIS1ZGcVVhbi8yaUdZOUdSQmdmcktLMGJXTnRMQnNtSk5mbDhaK0Jh?=
 =?utf-8?B?dHNpU1h6VGpEWkIxcnA1eGdrU2huU1dxanpoaVgvV2RyMGNWb0c1WDVRZy9R?=
 =?utf-8?B?M1czcktXWXlsSHN3Z1dhNkRuWnFQVGFCRHNuUkk4SlhKZ2RRSG9XeTdiZDNj?=
 =?utf-8?B?ZmloeG15WFdkdE9MOUVKS1FibjZVSm9QUXhESmFDeElXYm5qQ2FJS2hwaG1X?=
 =?utf-8?B?ME5IckNtVVNSbnEzbUk1YkFoZ1YyQk92eVdtL3JFaGdORThUbmRQZEJoTTNk?=
 =?utf-8?B?MGdpdGhFK2pBUUYwdFl5NzQ4MFRyVkZJNjM1OFpmVzBESk5Oak84WHZVY3N3?=
 =?utf-8?B?WDc0R25zTVdnRnpSRlRGRnBlZ0FCTjZIUlE4MjJ1WGI5RnV2ck1WSFVjS0Fs?=
 =?utf-8?B?bGNLOXBNWTI0cXF3bEhKUFczcmlKaE1rZ21YSmdCc3JhWWJvSGI0b3BpVnFj?=
 =?utf-8?B?cmVoREZlVjB0bVp3elgwWUhNaDRUR0xmLy9RU2Z2UU9PM3ZpNlZwc0NsOHp5?=
 =?utf-8?B?TEx5UTNRNU40UFJYMncxOHZ0VEQ3SUthYzVUSVE3MmI3YlpKdG9ZMm1LOFZJ?=
 =?utf-8?B?dkdrRHQ5eTc0ZFhhU2lGeHhqTjY4QlByTkx6TTN4L1hiYkt5Skl0RGhTdGVC?=
 =?utf-8?B?dXYzdHVZRDFFc1gyTFZybGJTVDFQTGk3MjVlaE1aUjZqaEdXN2ZaQU5VYmhB?=
 =?utf-8?B?cmVaeW1obVpxT0paeXpaa1lyWjhma0xVaHFWdUZENXN2c0lXNzRCL25zN0ZU?=
 =?utf-8?Q?7x78oE7KJcr4dnmg0j8Zee4Hz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 162f3579-244c-4907-88fb-08db424c8360
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2023 09:40:59.4518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vqPAeRXZXCJLwvNDm5ooD67rVDTgfkNsNzS0rENKGJ9WRkaEitwgdwkJDP7lCVsnTDRxde9yiEEfZaGi70z50w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7919

On 21.04.2023 11:23, Henry Wang wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>>
>>> --- a/xen/arch/arm/numa.c
>>> +++ b/xen/arch/arm/numa.c
>>> @@ -28,6 +28,11 @@ enum dt_numa_status {
>>>
>>>  static enum dt_numa_status __ro_after_init device_tree_numa =
>> DT_NUMA_DEFAULT;
>>>
>>> +static unsigned char __ro_after_init
>>> +node_distance_map[MAX_NUMNODES][MAX_NUMNODES] = {
>>> +    { 0 }
>>> +};
>>
>> Nit: There's no (incomplete or complete) initializer needed here, if
>> all you're after is having all slots set to zero.
> 
> Yeah, I agree with you, so I will drop the initializer in v4, however...
> 
>>
>> However, looking at the code below, don't you mean to have the array
>> pre-set to all NUMA_NO_DISTANCE?
> 
> ...I am a bit puzzled about why pre-setting the array to all
> NUMA_NO_DISTANCE matters here, as I think the node distance map will
> be populated when parsing the device tree anyway no matter what their
> initial values.

From this patch alone it doesn't become clear whether indeed all array
slots (and not just ones for valid nodes) would be populated. I think
the code in the patch here would better not make itself dependent on
behavior of code added subsequently (which may change; recall that a
series may be committed in pieces).

>>> +unsigned char __node_distance(nodeid_t from, nodeid_t to)
>>> +{
>>> +    /* When NUMA is off, any distance will be treated as remote. */
>>> +    if ( numa_disabled() )
>>> +        return NUMA_REMOTE_DISTANCE;
>>
>> Wouldn't it make sense to have the "from == to" special case ahead of
>> this (rather than further down), thus yielding a sensible result for
>> from == to == 0? And else return NUMA_NO_DISTANCE, thus having a
>> sensible result also for any from/to != 0?
> 
> Could you please elaborate a bit more about why 0 matters here?

When NUMA is off, there's only one node - node 0. Hence 0 has special
meaning in that case.

> As from my understanding,
> (1) If from == to, then we set the distance to NUMA_LOCAL_DISTANCE
> which represents the diagonal of the matrix.
> (2) If from and to is in the matrix range, then we return
> node_distance_map[from][to].

Provided that's set correctly. IOW this interacts with the other comment
(which really I made only after the one here, just that that's of course
not visible from the reply that I sent).

> (3) Other cases we return NUMA_NO_DISTANCE.

And when NUMA is off, it should be NUMA_NO_DISTANCE in _all_ other cases,
i.e. ...

> So this diff is enough:
> diff --git a/xen/arch/arm/numa.c b/xen/arch/arm/numa.c
> @@ -98,6 +98,9 @@ void numa_detect_cpu_node(unsigned int cpu)
> 
>  unsigned char __node_distance(nodeid_t from, nodeid_t to)
>  {
> +    if ( from == to )
> +        return NUMA_LOCAL_DISTANCE;
> +
>      /* When NUMA is off, any distance will be treated as remote. */
>      if ( numa_disabled() )
>          return NUMA_REMOTE_DISTANCE;

... this return is wrong in that case (even if in reality this likely
wouldn't matter much).

Jan

> @@ -109,7 +112,7 @@ unsigned char __node_distance(nodeid_t from, nodeid_t to)
>       */
>      if ( from >= ARRAY_SIZE(node_distance_map) ||
>           to >= ARRAY_SIZE(node_distance_map[0]) )
> -        return from == to ? NUMA_LOCAL_DISTANCE : NUMA_NO_DISTANCE;
> +        return NUMA_NO_DISTANCE;
> 
>      return node_distance_map[from][to];
>  }
> 
> Would you mind pointing out why my understanding is wrong? Thanks!
> 
> Kind regards,
> Henry


