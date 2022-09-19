Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D77335BC2CA
	for <lists+xen-devel@lfdr.de>; Mon, 19 Sep 2022 08:27:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.408523.651262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaAEb-0004dz-MP; Mon, 19 Sep 2022 06:26:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 408523.651262; Mon, 19 Sep 2022 06:26:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaAEb-0004aq-Ib; Mon, 19 Sep 2022 06:26:25 +0000
Received: by outflank-mailman (input) for mailman id 408523;
 Mon, 19 Sep 2022 06:26:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6dDj=ZW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oaAEZ-0004ah-Q6
 for xen-devel@lists.xenproject.org; Mon, 19 Sep 2022 06:26:24 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2050.outbound.protection.outlook.com [40.107.22.50])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9e325a1-37e3-11ed-9761-273f2230c3a0;
 Mon, 19 Sep 2022 08:26:21 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8742.eurprd04.prod.outlook.com (2603:10a6:10:2e0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Mon, 19 Sep
 2022 06:26:18 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155%7]) with mapi id 15.20.5632.021; Mon, 19 Sep 2022
 06:26:18 +0000
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
X-Inumbo-ID: f9e325a1-37e3-11ed-9761-273f2230c3a0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gpyBR51jbHMtIxRklDKBcRa0RFpC0dtIPNaeg6yc7CQfS98JIOyw2oVcH1d1kN30IHybppToh8XPTG6AiTuXcNGNDCp/vFqusoQ2f9NkSU7SJHMrR/MaPNkX4CSqfJyTmdlQlycljy7mfb6EdpTLpm/Ez00lFin7FmF/qk4Y7pPzHgD1Jnm9Hm9UVG7GQGkwabLmdBqatExcGyFG7C9dumCWQvB9i2KNByOHiwEAaESNnNICNXqWgqOqHr1IygK8mNcEbIaP1vOukVgexQZsbMyJEBVJ0fEXINbcI1qOU84ECRNX8pb5BkkGb/bbAIIA/D/EtRF9UrMvSKuzORz36g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eckbcM2lQ6kmZ4wzMH2CUCKJ1xiHQ1Joy54oP1OZmK8=;
 b=XrblN2F2ABAXmOjT6/vwh2jEVtEAW+fRU+CxQwdtz0jDh9QA5RBKUXIG3PucKPapvWBr1xid/SZD80FS1Vr6uZ2E6TlB4wJXaxjh57QHKPOMDzDs55eE2bF7ZbVfcRX5VjgxLL2OYtoiBPLCxkiJGwDF+2o7YTtO6D7kKnhVp65bQKxUwvW45Pl/RM3dTR0SnS8krcxz2/CFQw/p3/2wQvwmtjp9LRnrF/QFw7pwdyq3WhIQVNTBByzR+T6/sJVL9OiMwUJdctnoAW9WArkJNqpoxnWxIgKTp/9pRaK0syjNY539ysTJ1e/pwaHWDerDIj/NO3PnHN2efABxsYhiHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eckbcM2lQ6kmZ4wzMH2CUCKJ1xiHQ1Joy54oP1OZmK8=;
 b=FzHWuYdQoAgeT+cdvMwfUsk9VCA8wkQbqDgLWXq2ozdZUFb2R90ZCS7S+sqGyns+Rlq29k2Dpyu7nfKABjsolLdqJaXzo3DezmqrULhNnx7EYwy70kG1Ce7oCN9o46PIUYf6T1FadNkmHuxin0LkBejK2xzd4mPk254v6z0rOspUOFIViyaiK8ePKm5+UcRwCBIlnPLDtGzxa3GYfYCeppNwvZbPhuVQX0Tm4diBIVLaTvG1ZVxGRPsdOoUV6s3RwgQGGnVEU6KCxj2X+Afs6EBzbSqa21pHggd5EvhhR9HEfIeVfpDrVS3MRizKzfWJgjdrnccXJNk9xjR/sx6wzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5e5ee6f1-a5fc-fcd4-5d61-7f1e4be6b630@suse.com>
Date: Mon, 19 Sep 2022 08:26:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 06/12] xen/common: add cache coloring allocator for
 domains
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, julien@xen.org,
 stefano.stabellini@amd.com, wl@xen.org, marco.solieri@unimore.it,
 andrea.bastoni@minervasys.tech, lucmiccio@gmail.com,
 Marco Solieri <marco.solieri@minervasys.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
 <20220826125111.152261-7-carlo.nonato@minervasys.tech>
 <32e2a752-975f-baa6-8d6c-ba27cf516c64@suse.com>
 <CAG+AhRUJ0+CszWjSzO7=v4SmKtjG7VMpZ8P050s-rLz0rgXJBw@mail.gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAG+AhRUJ0+CszWjSzO7=v4SmKtjG7VMpZ8P050s-rLz0rgXJBw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR10CA0101.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8742:EE_
X-MS-Office365-Filtering-Correlation-Id: f917cc2b-074b-443f-a660-08da9a07dc58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nd3t2oj3XgtOMbDmwMIN6qqsQPUHVH+lYjwRMgWT1qNjYgSJab0dygz0bWmDoc5wDONcOYUsOUDPhkbJI2FT66Oxm2AUVBGRBHtI2pjSgtLsn/7JEWJeteN3ArbGY2MQnzt+ltDqp1ycxbQebbHK2YR4qLNyl7OiouNv6fDD6s3NET2RrKy7W861TmcTmBdPuJzZbiRCk9BkrlYskobs7L8bQyfB5ozpMwE5AC6YjgMlLOn4SP8ZZRTujLIBAmw4iHaXWSIYNZxewy5dpYi/Q3t2zr9fXnjpN4SvMHcoUMFACa6JH/txuez/kDDnFtT4GyDct5GOQ44Q9MRqPJ7Vi0Alk48hXPNE+BH+/KTqj6mSOFjsEabb4Zcr3aN9/9la6xqV+OryKNdnDkap+hQZCV3fp9XABAXqnGBhH0IUcvf7sKypy6y12y89Tb962MoIKWKuN2+mgmyi3K9oJPiBe3oM3yvXNV5+4/dXrvdZVf5iJGq9EXz2/Uz0A6jp6BtxJ9rVkN/0dmQ/tuwvw64SZUickxEn2T4BsJufUrc9nkvroc9cDNF7qfEKEhPDHT/vqO1gOaRXh3/mH2HTIDvxM1DpGEgLQKInw50WYFMy4w3NZ2QA7E0QvrllSz7GTZe5qSD3xylVBt/TOAfpjpJPU+Y/Suw8Psqet6qM8h+RSqtmrGhGRaj4GKb+YbjiZ/QkrgLidw6qD5wwMBXoUhJuTLeOnd4LhpxjS2cZflaEZG+xb5VnRTpj9OwNAuetmGTqL/7lQmHBcnhqLqCYFUbOj7rkAH2sGChWkaqh5fROgxc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(366004)(396003)(376002)(136003)(346002)(451199015)(36756003)(66476007)(2616005)(2906002)(4326008)(66946007)(66556008)(38100700002)(186003)(83380400001)(8936002)(41300700001)(54906003)(478600001)(31696002)(86362001)(8676002)(6486002)(26005)(6512007)(6916009)(316002)(53546011)(31686004)(6506007)(5660300002)(7416002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Uk9jQWk5TVpETEY5Zmk3MHQ1NUN5S3hTeDBEcHhZWGxWdFRubWwzM1diUVhJ?=
 =?utf-8?B?cStIekRDU3FEajQzTXVBMjUrakp0VzN4M0JrRGJNMWdJN3krUEhnTzZhb01K?=
 =?utf-8?B?eHYxK1lmUkQxWk1wV3BiR2xVbUsxOGZmSVUrck55dVhwYjBMOVVCeEk2c0FM?=
 =?utf-8?B?TjNMa0lYdGpBS1gzNnY5MW1GTDN5TlRDM1ZsUXdCYnM1NVFDVXF6SDdpZTFT?=
 =?utf-8?B?anI4VEM0akpvc0NzTFp4TXZMWVFCVnJyYkhoN01kZ09rZnVRd2IvaytELzVs?=
 =?utf-8?B?NTVmR2tNUFVCMTZYZWdXMmk1cjAxKzZ3WCs3SnFtWElCZVFhb0kxWUZ2N2My?=
 =?utf-8?B?VHNycktvR3BWSVhwczE3Wlg2MUdoVEdTZGR5TC9wRTg0SUN2ZHFxOEVVM01T?=
 =?utf-8?B?TTVTVFBpeVdHRDVGVkNabDlFNVRkbENCZWE3dnJTZUxjbi9KcGxNOVNXZnZ6?=
 =?utf-8?B?VWZmU3c4Y3BkZHpjQ21CZGVnUnZzVWEwNzdockg1emRMT1lLK2FXd3lPbFJy?=
 =?utf-8?B?YUM5YU9vakMwTzlKVS9uRk9tU2dtS01qdllZbzR3NXJoSVNHdVBBelVxbm92?=
 =?utf-8?B?UVkybXUwdHJ2a0d3K0YxcGI3Y0FIdGJsSWU4eGxsaGR1OEp2bHE5Z2ovRy9V?=
 =?utf-8?B?VC9hcGpadWo1UXFwdkw5V2h3aGJxN0Q5em9rUzMrNkxkeTFKSXRhQTFmd2NX?=
 =?utf-8?B?cHF4SkhCWndscG80c0hXcnFGeG0zQzFwRjZJK0w4OWJrY1NURGhCZUVUMlBZ?=
 =?utf-8?B?WXU5eU5qa0pvVUdzYUI1Rm9jbmNTR3p5eDIvSC9nc0dSV0Z5eE1hUm1EeFdS?=
 =?utf-8?B?Q2RrbzdxUWk1S3d1dXdTVm9WSXEzdS9WNk04VVhqbUc3YUVQMUJrUzJkZVkx?=
 =?utf-8?B?eVBwQnplL1hIVlU4azY3bVNlQUFIc1VPVGdCUDFaTFFQR1JyNmRpM2ZZeE0z?=
 =?utf-8?B?WjZWMExnODFoKzZtb0FGeWI3bWswZ1pJSEVUUmZjc1BpNjkzTDFua2VIVWY3?=
 =?utf-8?B?WklkRVQvcnh6cHo5SVBwRndvWDZIMGpvanduNFVVZmkvOHA3YUZUcHo1c2J2?=
 =?utf-8?B?TFVLMTNQTkFNekg5cEloc21oN3RsOER2UCs4KzRJbFd1ZkxadUlxVGFGQ3F0?=
 =?utf-8?B?Y3JHWTZ2b3BQVVU3VXdzc2pWVk53ZWhYRzlMS1p2MjU5M0tJY29icGppcHFU?=
 =?utf-8?B?SFJMcnorRmNzZVBWcnFtY05kZ1hHNVVVQkJkU1lQNDZZN3FMUDBORmppZ0JT?=
 =?utf-8?B?QUJFNzZ3OG96c1VSdTRNYis2MXc0cUdka0JMQzY3L09nTFBBdVVPU0ZUTHJN?=
 =?utf-8?B?WFZXQytaVllGL1ZKZDErSi83cTFVV1ZXN2lZME5xMkNQSEZxWTgrL3BOM0hr?=
 =?utf-8?B?aS8rdVQ0UEl4LzVWNkQrWVRoNTJIVzUzZSsrc1pnU2R5MkxpaWpWZm1BTUIz?=
 =?utf-8?B?UWFBNTZqMWduYWxZdy9pR1dkNlZ3WDBRMmF6MDNiK05LQjRrcmdRK0xlYXZB?=
 =?utf-8?B?WlpRQnZzdFh6NHdyUGdOaEw3VDJGbEF3eXJCWjZHNUluVmNlVmRlWWRpWGpO?=
 =?utf-8?B?NjRlcVEyeGtVUlh3dWlISG5KcmpMT2RQazZqOHhlWkRGdW9HWHRXU1AyU3Fz?=
 =?utf-8?B?WDN6eGlrZWVvR01XUkZESnVoRituelNHaURpN3ZMaVJYckFnVU1EODFpRmds?=
 =?utf-8?B?SjJiM2FBNGQ3L0JYYjFJTEV1NWRqcWZDRm5QZ0FIdG45MnM0NUdRSTVMdG5F?=
 =?utf-8?B?VFlkbHl1eFZiTDNHMm82bTRVUTVoZ1cxVFNNQzJzSnV6T0ZHWU9GdlJTaTlM?=
 =?utf-8?B?VFp5VE1RSERMM2N5QVptYUpTMWlZUFJmOU9OWEZrODFOQ1AwRTUxTTlFeVdU?=
 =?utf-8?B?b2taTDQ1VFI5UWpCdnFPd3BaZGVoYlBIMHVDSElOS0lQOW9VUFVTbmRESDhv?=
 =?utf-8?B?N0xKZlMxVlhuSWJHRkt4cVpubTAraDVqQlR2c2FGZ1JJUzRlVUswTmxZQlZh?=
 =?utf-8?B?SGpCbzhuY0lUcldxWFV1ZXlzVWRWYUlIL0ZsaUxzWkhPVW11UGpsUTFZZC9X?=
 =?utf-8?B?NlZtZEhjQnBqRWFNVHFWUldHSWFabEx3eThQb1ZSenUvK2pXbVRydmk0N1Y2?=
 =?utf-8?Q?picHOjqXwB2MsodJhT2VSvJLJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f917cc2b-074b-443f-a660-08da9a07dc58
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2022 06:26:18.0467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gkj/xlhK4hoL0ESsry5vSYUBQo85NsOT5ZCmjya0gDXURVseC9pYtOhKLt58xoenhcyKaeBaddhVMGW2kHH7+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8742

On 16.09.2022 18:05, Carlo Nonato wrote:
> On Thu, Sep 15, 2022 at 3:13 PM Jan Beulich <jbeulich@suse.com> wrote:
>> On 26.08.2022 14:51, Carlo Nonato wrote:
>>> --- a/xen/arch/arm/Kconfig
>>> +++ b/xen/arch/arm/Kconfig
>>> @@ -147,6 +147,18 @@ config MAX_CACHE_COLORS
>>>         colors at boot. Note that if, at any time, a color configuration with more
>>>         colors than the maximum will be employed an error will be produced.
>>>
>>> +config BUDDY_ALLOCATOR_SIZE
>>> +     string "Buddy allocator reserved memory size" if CACHE_COLORING
>>> +     default "64M" if CACHE_COLORING
>>> +     default "0M" if !CACHE_COLORING
>>
>> I don't understand the purpose of this last line, nor the two earlier
>> "if". Why not simply
>>
>> config BUDDY_ALLOCATOR_SIZE
>>         string "Buddy allocator reserved memory size"
>>         depend on CACHE_COLORING
>>         default "64M"
> 
> This was just to have a value for the config option even with cache coloring
> disabled. All those ifs emulate the "depends on" keyword, but let the
> CONFIG_BUDDY_ALLOCATOR_SIZE takes "0M" when coloring is disabled. With just
> the "depends on" the macro isn't defined at all. I know that this can be
> handled with some simple #ifdef, but I found this way to be more elegant.
> Not an expert here so if you prefer the other way or a whole different one
> (more readable/better fitted) please let me know.

As far as I saw, the sole use was already inside a suitable #ifdef. Hence
yes, I clearly would see "depends on" as the better fit. Please also don't
forget that if later cache coloring would be enabled for another
architecture, that default of zero (pre-recorded in a .config) would get
in the way; one would need to manually change it (and remember to do so).

>> Finally - how much of this is really Arm-specific? Shouldn't this be a
>> common config option, perhaps merely restricted to Arm by the top level
>> option (CACHE_COLORING?) depending on a further HAS_CACHE_COLORING,
>> which only Arm would select?
> 
> I'm sorry, but I don't understand your suggestion. BUDDY_ALLOCATOR_SIZE
> is Arm specific because CACHE_COLORING is. In fact it depends only on this
> last config value and not on Arm config directly. Why should someone limit
> the buddy allocator when coloring isn't enabled?

My comment wasn't on this on setting alone, but on the coloring ones as a
set.

> I've lost you on the HAS_CACHE_COLORING. Why should Arm config select this
> one? Cache coloring must remain optional. I'm probably missing something.

HAS_* settings only express what an arch is capable of; they don't replace
dependent options which actually are user-selectable. (That said, we have
a number where there's no user selection possible, but that's not of
interest here.)

>>> --- a/xen/arch/arm/coloring.c
>>> +++ b/xen/arch/arm/coloring.c
>>> @@ -300,6 +300,16 @@ void prepare_color_domain_config(struct xen_arch_domainconfig *config,
>>>      config->num_colors = (uint16_t)num;
>>>  }
>>>
>>> +unsigned int page_to_color(struct page_info *pg)
>>
>> The parameter will want to be pointer-to-const and I wonder whether ...
>>
>>> +{
>>> +    return addr_to_color(page_to_maddr(pg));
>>> +}
>>
>> ... the function as a whole wouldn't be a good candidate for being an
>> inline one (requiring addr_to_color() to be available in outside of
>> this file, of course).
> 
> You mean defining it as static inline in the coloring.h header?

That would seem preferable for a simple function like this one.

>>> +static void color_heap_insert_page(struct page_info *pg)
>>> +{
>>> +    struct page_info *pos;
>>> +    struct page_list_head *head = colored_pages(page_to_color(pg));
>>> +
>>> +    pg->count_info |= PGC_colored;
>>
>> The function isn't marked __init, so runtime correctness as to the
>> (non-atomic) update here wants clarifying.
> 
> Yes. I need to check and probably add a spin lock for the color heap.

I'm afraid a spin lock won't help. May I suggest you look at some of
the staticmem discussions that had happened, including a similar
topic. (Sorry, I don't have a link at hand to the exact mail.)

>>> +    page_list_for_each( pos, head )
>>> +    {
>>> +        if ( page_to_maddr(pos) < page_to_maddr(pg) )
>>> +        {
>>> +            head = &pos->list;
>>> +            break;
>>> +        }
>>> +    }
>>
>> Wait - a linear search for every single page insertion? How well
>> is that going to perform on a multi-terabyte system?
> 
> For our test cases (embedded systems) the linear search is good enough.
> I agree with you that in the general case this is bad (even though the main
> targets are indeed embedded systems).
> Are there any already available data structures that we can exploit to get
> better performances?

I'm afraid there aren't any that I would see as a good fit here.

>>> +    page_list_add_tail(pg, head);
>>
>> page_list_head and page_list_entry are generally different things,
>> so I'm afraid this isn't correct in the common case, and you're
>> getting away with it only because only Arm currently enables this
>> code.
> 
> So how to insert in the middle of the list?

That likely would require a page_list_*() new helper function. So
far we simply had no need to insert at other than head or tail,
iirc.

>>> @@ -1939,11 +2107,24 @@ void __init end_boot_allocator(void)
>>>              break;
>>>          }
>>>      }
>>> -    for ( i = nr_bootmem_regions; i-- > 0; )
>>> +
>>> +    for ( i = 0; i < nr_bootmem_regions; i++ )
>>
>> I'm afraid you can't simply go and invert the direction this loop works
>> without any justification. It's not even clear why you need to work
>> forwards in the colored case.
> 
> The order was inverted because I'm assuming bootmem regions are stored in
> ascending order (this should be the case looking at bootmem_region_add().
> Am I wrong?) and (second assumption) pages taken from each memory region
> are sorted in ascending order relatively to their machine address.
> This means that color_heap_insert_page() is called (at least during
> end_boot_allocator()) with always increasing machine addresses and so the
> linear search should be O(1).

Indeed that was my guess. Yet the present order of processing is there
for a reason, so you need to both retain it and supply justification
(perhaps by way of a brief comment) why you need alternative code for
your allocator. Even better would of course be if insertion was more
efficient and didn't require the logic here to specifically take care.

Jan

