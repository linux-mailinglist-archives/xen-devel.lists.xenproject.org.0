Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1BA736879
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 11:54:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551504.861083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBY3x-00065D-Lz; Tue, 20 Jun 2023 09:54:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551504.861083; Tue, 20 Jun 2023 09:54:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBY3x-00062r-J4; Tue, 20 Jun 2023 09:54:13 +0000
Received: by outflank-mailman (input) for mailman id 551504;
 Tue, 20 Jun 2023 09:54:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lS3L=CI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qBY3v-00062l-UV
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 09:54:11 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20624.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6708cd26-0f50-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 11:54:09 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6774.eurprd04.prod.outlook.com (2603:10a6:20b:104::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 09:54:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 09:54:01 +0000
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
X-Inumbo-ID: 6708cd26-0f50-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HWcBJP4xvzV50fCwpidkRvtkz44xNPvzz07dUNP2OOzy/woCPtBl9f82HWqPoVLLwA2vNx7k5fQxQcUjZP3u/9CRhC1KOrAE+Ic0vMe3pHCwv2SaXlIULZGjZYAZ/E/IDOO4SshK6vm1Pzx4o4XggzToiCOSaikmieKljkfIq2rtcNKhDqT6W9VGnDui0DakOscw0c+5AfUtCinB1FYrDq1Pmffel8ODyisHGTYXxl1Tpd27UEGgHVJ1hiOxVfnyNiYj+jkZMMb6Mz6WV5gSkl8VZMkP2Sa/DT1B75UtT5NYgraW+bmQK54x926Xfyy/BVdunhevZFBaBxGAmOZxaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i2C03agM/7KnNzK2x6+keGEqWaARenoNAAcf9+aqZm4=;
 b=Ic4EtTCn3oPNdVq0riZlySdctXwtS3D15wDikc/OB0gjLZX/R6qxeMUBUi2vUvZbdaLIAsMHCP5hPsp/J6YVv90MjYFYzl2GkEVJxDnIEQCYK9fpf/5nd9p1cJWlsASpwbPy3/rJhF6+fU2+kRL94H+xZiDvM3TbRMAvFr/OXGEbgoAmI8icahHhuTt0TuD/2oRxqZewZYq/lFBf7qDdXmvymEGGzInY7m6/5CjxWhMSFW3Pg8zTJEq7CnoVP6kq52hwzVfG7sDWpObjXPY77pz4zfPLpXNwlBxMimud/nH7R39FIrIjoiBnVGQUM8zOp4mOHCaVTFngZCFJn4Iaxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i2C03agM/7KnNzK2x6+keGEqWaARenoNAAcf9+aqZm4=;
 b=WuUbNgvaRQXGw5WEFe0IfkeOztjuAfW89fK8SOty39jyFF2U2BEw5ba9hQpQcucQ3xfN7XGavvCfbddbNTja22UKKuGZDcdIvUzvFauOOepQGMp7CC/PI9s3+KIteemgjIPHADDN9bWfjTeiXp8uNO/6/qtlJHhNGmM/6ggpAWABH6m1J7GGXhYUcn4qTTVaN4EHtc8krAKUIJRwSTvcfqtIshtYJVMBilw09WPE9NJfyTfyKrrbHtK60ZfUwQzr7GZWzoMFjLq2he5/yH4oDp6O4sD1A4GBsrWTdrJPQ2SJ0/Z3oemjq5tgm5RQmFnwmrQCnIRF/E3diekC7BdKjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2ba57ee7-05ed-0929-dae8-502ba58a9a07@suse.com>
Date: Tue, 20 Jun 2023 11:53:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 1/5] x86/microcode: Allow reading microcode revision
 even if it can't be updated
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230615154834.959-1-alejandro.vallejo@cloud.com>
 <20230615154834.959-2-alejandro.vallejo@cloud.com>
 <b3543c89-9df5-53dd-2b11-aff83211187f@citrix.com>
 <3a92fbe8-a9b4-f671-7895-c4d8065b61ed@suse.com>
 <867ebb90-2bd4-7500-d6db-0af08efff88c@citrix.com>
 <ad16fef3-f022-9ffa-7aa7-bdecf41e715d@suse.com>
In-Reply-To: <ad16fef3-f022-9ffa-7aa7-bdecf41e715d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0166.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB6774:EE_
X-MS-Office365-Filtering-Correlation-Id: ca168fa4-ae80-49b0-f364-08db71744629
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9WvJQUvBWtHRlK9WeJl/rlKhqLvpKB1xb8V10IgSWufISu+zlg198q9mGD5oPLSGvToxeYTz/fC6H7FVTjFhHrPe46rvO3stDSiTkXhCzxqyeeByUY8q6u7pSVcKFI9fo/nI0Pm4ve7PkWmLLd1EICK7n+PqkR+rslScewZfQr4oy347HoC3u36XT6DZtqHgAkuCGE+08l1IWS1Q4XktL1Qsv+HYWTkR3SXnQtSojsZ32NycrpeniJiAAQpvjgIMTTjH+AOKn2jNdsJ7JGWEh72JciP78VaWfLxMIsRZZgCj1VIcZrdxoCVBTdNweApygnp97+8WRHqiRTUeXx+o06xU2yirbE4LCFlosnWVF53GCI6dVAk8bOJcHY4GjQQBC9dkdv4nsguwXJD3RnXR6vAKXokuyq2mQrY0gaSMCuzMrOBrz/vSNRrLUiPeLPTRIjp/eSyB3g9bRA/BI0/s2SR+K38QTyYQVsv72OBP2J91O2i44kuR3ol2w3mFWrCeLPUnUwaOBXHlrotB1jpMhC653xbZxtnm60U//RtDoCy7RuWN6j8PqkMKucKWiUwyv4OtIS8pJUDaOzWJRmw6bdalTKFlKkz4oirTrDWFc1EouR+1m4qP4Ecs3yB36nncb9YfugwzJzgixKGwrsAzrw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(376002)(39860400002)(396003)(366004)(451199021)(6486002)(478600001)(6666004)(54906003)(83380400001)(53546011)(2616005)(6506007)(6512007)(26005)(186003)(2906002)(5660300002)(36756003)(38100700002)(66946007)(31696002)(4326008)(316002)(8936002)(8676002)(41300700001)(86362001)(66476007)(6916009)(66556008)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WDgyTHNXSDNkNWVBcjRPTURIQUYrRjhScEdtNHlmMk5ZZ05idk1XakNSOGZP?=
 =?utf-8?B?V2x3YWpMc1doekJJOWN3b1VpYU93eStFTEM5UTZKbE44ZHJ5ZlJPMDZ5S3ZW?=
 =?utf-8?B?bXVxVXcwR1U1bXNaVmQrUVB2TFNEd21tbk9iUXFlMmRpODM0M3ZPTC9yS0N6?=
 =?utf-8?B?SzR1ZUdvM2dGQ3A0VEJoODFRVXlYb3U2aVNjRHloQUR0K1FnNnFmRitJMGNE?=
 =?utf-8?B?VFZHM2RUb3M3TC9wUHV1NklKamg0R2NKYjJaM0diQ3NuMmtVdHBIUkpVWi9N?=
 =?utf-8?B?NnZBU1hveVFnLzlxMUYvOXZnNlozZUx3cENtL1VFZWtKS1lFL1NLSnVscWVM?=
 =?utf-8?B?OU1GMGUvSUlIY0NpU0ZoSEpiR2w1cm1USi9iNTh4VXh4NUw1SnFoOWJhcTVW?=
 =?utf-8?B?bEJQang2RzFlRlllNVlJSGVjYW1ZTlY4ZlFQQkdMQ24yaU9tbXJCeEdOS1cw?=
 =?utf-8?B?eW40WlBoU0FROTh2RGcwMVBpWnJoZ0FjendOV3ZobjNwQjRKeWo0OC9Ua1Zr?=
 =?utf-8?B?V01oYWlBZi9SS1B5ZFZ1Z0UxS21rQTJrcDFJS0Z0aWhKNzdnK1c4OSt3eWJs?=
 =?utf-8?B?bk1WMU43NytWa2NSZWtFNlU3OVB4dHE0L0N3VHVQeitsT09JbkRaTGpXUmZV?=
 =?utf-8?B?VlZuVDMxS2NQMTJWZ1ZBd21sTXgxZVhXbU92VDRkbFhSbUdBdFJQVlk2eXhx?=
 =?utf-8?B?c2F0UnU4bFFodUtIcXVvZG1nRmFUTENjckJMdWVhMjhtVWh0ZVlOSVg4WGwv?=
 =?utf-8?B?OHhnelB5OXB1MTF1RlRFelByVFQwdVpHRUZFbVdNZ0x3Vk5UcTBwMC9GRTha?=
 =?utf-8?B?YlcrMjBIcG44d0paaWNSYmphOUZZV2VvRi94SHJIbU5zVUV2TENNZmppN0JV?=
 =?utf-8?B?NkhQTmxTaWtFTnpJZmtLbDZDMDlSdnZYaHMvcXFNTVRjTkdPcDNRNXdHVFkr?=
 =?utf-8?B?UU00dXhGdzVjeEc0T01SbVlLVGNhRmd1RHpSRFVrdHRubmdkK0dIMWtDb1Zx?=
 =?utf-8?B?TjdTbXZlOXJDS05LaklKcHVZOStoTGNlL21vQzBrcVVac3ZYL2tuYlJlTUhO?=
 =?utf-8?B?dm5kMVNzKzZySFdUektHQmRuMmxqMkNxVXphREk2TTdzcVdpb0tQREFGdWZG?=
 =?utf-8?B?SEsvVjVEeWNQWXhaY3dtcXM5TGZQZkVsZTRLRWpKWWM4QUU2VlNpZUFlbmpY?=
 =?utf-8?B?dFdXTFRnU2ExaHZSOU5CaXhaUE42a1RWSDhnVlF5VmVwTkp0WUVyOVVMVXhX?=
 =?utf-8?B?R3duUFN1L0NhSUxYWnBTNGI5TFlqbkxWTlpVZVRYejRRUUJodGlHM0JOMGRK?=
 =?utf-8?B?ZEZVZnlaanVydVozT1Q3VGhoMVQ1cFF6QWYrbGJGYUtWRkN2UnN5eE5sU0tv?=
 =?utf-8?B?OVVLV2ZrTjd1NFN2aVI3SXJFaTNPRXpQNDBsWmsxRTlIRVdQSkVsNjkvMG50?=
 =?utf-8?B?SVh1cHVTcHNSNUNxdUNjM1N3VVFXZ2NCRk8xU05qRlVYTCt1MEYyNHdWcmRu?=
 =?utf-8?B?eDdwNkJTRHdFM1hHT3RRUmJEZ2xEZUJuKy9ueXlSb1kvKzFBeHUwWUhUdUdu?=
 =?utf-8?B?WmpGSkxzWGQ5Z1NQVVNlckl1WHkxVmw2M3orZ1NES25LS2tETWh6QzZOd0Fy?=
 =?utf-8?B?Y1FHZlYwbThjbkdweWxXZ20xN1F2RkxkWXVjTjBMYTJmZjhpSzFhTy8wVzNG?=
 =?utf-8?B?WnR0UGxXT21PWjJWNE44RkxWWGNjWEtrYnE5aGFIK3ZHMWUrMFpjaVNLOXp5?=
 =?utf-8?B?S2NQenpsWko1WC90c3o2RkRRYkp5RmhRWHF6eUJiQlg1V3BTS2V4djR4SURp?=
 =?utf-8?B?SnlJYUVDNnBxbmRySlBPcVBIajJJRzBOWU5PVU9XYzY5TU9ZZVRqWWFMUGNa?=
 =?utf-8?B?S0ZHQWZ5TkY3YyttMXVKQktxOEQ0ZjRDRTJPUXppTy9lc0lGMDJVbmViREF1?=
 =?utf-8?B?bzFIa1kxVmFYV1BjenFEVlp6cEdTUWI4YXdlcW1JQ0tnOFM5dCt6eW5JUmh6?=
 =?utf-8?B?ZEdIeGxiZHhwdHhoK0VZUFcyaG10ZnZVdGV2OVg0UVJtSDNYQ0FwVHJVWVht?=
 =?utf-8?B?c0RQeWNNcGhiZXdLVUVyQzRBVk5aOTlLRmpwVHJ5bnVMK3dwQmQyRzdMYjFF?=
 =?utf-8?Q?PFquO+54ppdt3kwdnIvnU1Ahy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca168fa4-ae80-49b0-f364-08db71744629
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 09:54:01.1642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 26L685cVuSi8B60bTZaYAq8bdzi539B51jAWBF4FwOgXiXWJefADmSlznhyViV2/C21KsMkhS6qkGub216OlSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6774

On 19.06.2023 18:10, Jan Beulich wrote:
> On 19.06.2023 18:06, Andrew Cooper wrote:
>> On 19/06/2023 4:58 pm, Jan Beulich wrote:
>>> On 19.06.2023 17:49, Andrew Cooper wrote:
>>>> On 15/06/2023 4:48 pm, Alejandro Vallejo wrote:
>>>>> diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
>>>>> index e65af4b82e..df7e1df870 100644
>>>>> --- a/xen/arch/x86/cpu/microcode/core.c
>>>>> +++ b/xen/arch/x86/cpu/microcode/core.c
>>>>> @@ -750,11 +750,12 @@ __initcall(microcode_init);
>>>>> @@ -860,6 +861,9 @@ int __init early_microcode_init(unsigned long *module_map,
>>>>>          break;
>>>>>      }
>>>>>  
>>>>> +    if ( ucode_ops.collect_cpu_info )
>>>>> +        ucode_ops.collect_cpu_info();
>>>>> +
>>>> I still think this wants to be the other side of "ucode loading fully
>>>> unavailable", just below.
>>>>
>>>> I'm confident it will result in easier-to-follow logic.
>>> Yet wouldn't that be against the purpose of obtaining the ucode
>>> revision even if loading isn't possible?
>>
>> No.  The logical order of checks is:
>>
>> if ( !ops.apply )
>>     return; // Fully unavailable
>>
>> collect_cpu_info();
>>
>> if ( rev == ~0 || !can_load )
>>     return; // Loading unavailable
>>
>> // search for blob to load
>>
>>
>> This form has fewer misleading NULL checks, and doesn't get
>> printk(XENLOG_WARNING "Microcode loading not available\n"); after
>> successful microcode actions.
> 
> But from the earlier version and from what I've seen in patches 1-4
> so far, I expect patch 5 will introduce a case with ops.apply being
> NULL but ops.collect being non-NULL. Otherwise I don't see why patch
> 2 does what it does (sacrificing cf_clobber, albeit likely not really
> intentionally).

As expected with patch 5 ops.apply can be NULL without indicating
"fully unavailable". collect_cpu_info being NULL could be taken as
indicator of "fully unavailable", though.

Jan

