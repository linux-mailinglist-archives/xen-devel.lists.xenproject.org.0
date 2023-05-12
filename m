Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EEA7000E1
	for <lists+xen-devel@lfdr.de>; Fri, 12 May 2023 08:51:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533705.830570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxMc4-00035x-4O; Fri, 12 May 2023 06:50:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533705.830570; Fri, 12 May 2023 06:50:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxMc4-00033G-1Y; Fri, 12 May 2023 06:50:48 +0000
Received: by outflank-mailman (input) for mailman id 533705;
 Fri, 12 May 2023 06:50:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mY6V=BB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pxMc2-00033A-Ku
 for xen-devel@lists.xenproject.org; Fri, 12 May 2023 06:50:46 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2061c.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 508793b5-f091-11ed-8611-37d641c3527e;
 Fri, 12 May 2023 08:50:43 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB9083.eurprd04.prod.outlook.com (2603:10a6:10:2f2::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.21; Fri, 12 May
 2023 06:50:41 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.033; Fri, 12 May 2023
 06:50:41 +0000
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
X-Inumbo-ID: 508793b5-f091-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wtz11kCnOZudvZPrJoREUNwS3Aufk/jjUGq3lzu7XzcaAnUYp1XhYlkbruafbNYpMsIQnUVmQmj9HoQgHdvhCJfV0buv/lF31qkoHkBx1B2qes6icna+uHkqvX6XmULogiyq4VgvcqY5WAlVuJbrDJ6tbjVVp4uG1urji4x4KoH5mRJ97kxh4n1dggqsjrKQ5A93G6RCmZwtBqQFDc2OPAL7rbkenTjvw9Z29kdEQUkHeYlnGJvFEE2n3uDM29iSkLaOiIS+9yd3vjQdxc/Y6LzohSRNrP0PdYBcrjGDKfipu25Bi/PBijOrf8L8HPsFTy9UW6su9O5PTSi/oOgHPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XNG8OUxPuCywyEEjSHCJgHFlKeyS1oZ3pXQQZ4rrj20=;
 b=VpBVDK4MjubYtqmndcmfCaqYV/Rggyf9qsazfbav32kbwYle0gwzvrxqDwu4khgVdI2qWaSN5YYRkFUJWq4uNaDvRJG6jVMauG9Yr5ZTjyIsa4XvLe3sY4LukLsTckFrLwIsMfw5VIj8LDfqwX4OxTinOhGHdQBmY9IxI8EyjpsSm6i+ms5QW8jnTGCYG11cVMDgM7MFTRa3Nd3NTnHJIFv07gj5GK5oynOcACpyD9d1EJ3lcRghRlKQa5VJgZlvlmlntPuRisNDmUHH+rf8ECChg66TzObOb2fx0ZCrTNz6qafgFicMkQkOihtRtix2NWd04v5CBZXWhrAl6II4HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XNG8OUxPuCywyEEjSHCJgHFlKeyS1oZ3pXQQZ4rrj20=;
 b=a4GwAms6OS8YjpHTYrmk8AeMWDQALvxxHlItM7u6DkCjFaW1j4OHqP7ol1EipLTgxJYtebYtGm3JJmCBJxAv30wL2GYCrXJ12c3so0LXjh60Nsa+uzGa+sMWCsfFqaAcAgxW8XMAkBe5yNLRN1+1YShPjIka4dVqpP2FBxMREeSpmzEkyUp2OLwYEhbdtZxXh/krvdgHVIPBZnd5IFYBmXnY2zxZ0+fn7DfSJPq1L9+2ciS8YwC/O4nPIJRcSckIxuxXf3950uX9FlR4Ik1RB9ZVeVVQkOyGIfVDawKPkFdH44JJveT8atudfbeHYaqpvk7/TTd7va2HuDWBRWSoYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <71af3a38-378c-5147-1c44-ae84993a796c@suse.com>
Date: Fri, 12 May 2023 08:50:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] x86/vPIT: check/bound values loaded from state save
 record
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <f83213df-2433-ec51-814c-436ce5ea4967@suse.com>
 <CAKf6xpvmdVT8QWFk_V8TCoZ1YHZecTUDT3x9HuRbGmUdGYKb-Q@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAKf6xpvmdVT8QWFk_V8TCoZ1YHZecTUDT3x9HuRbGmUdGYKb-Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0075.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB9083:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b80f94a-6dd5-46f2-48d7-08db52b533d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TuJtybk13dy90Eo1xpuVOOCIwd8PezvvrHu6sOKcVODyuDWKvV6lTXeCt7pUrULt1fZwbUJCWzfVwXM/SdHEmM6AMOCuYB2oulO4LcRUodnvyMM4wQ1ZqLkWPE1itbUoZPMGeH44Wmp6A5NZaEhKE9URyrbWZYXCfZxZAHekkPGe553cuJODuCycKV8PQtWt9kTTfuxbiWNfnoTgTQv9INBDyOyj+LYzAGNYInrWYwU9MnMYUOS/1J8Oo81teyim5wlOoVQDQhsBIFrk8YlZtXUZXMfJm6bKoQax7sD1y/+85sKNdCP8p9j8YqOmvGL3PI01Hlhc85mKw3DUBMYa0VjyOSygrC/yjbk+rDL3tI+ctF0O6EYkWjYV31OGoM/xHXVsc0cYfL3bFt5tyT1xXaCN3xAvcXW+2/WoYfSr7oTw0ye8vlNLttv8INcljQmz6dSAMU/FBrOv8khwnJ9neLA31kXVPcAfx8f9i58fZeYQ5/AFAvoGHv0MOhDJ7hrcyE9AbzfuLjNMp+jXZ82vpfyZbGIvVmxjoOi3h/Lt/JePuoVtvs//MqbdoRz/6tEKcwxPzWi6Ub/KaKbTiB8q5Cbn3An4iLXnjLTedIMwvqV1RGTkp1trFZvvzNs1K0uDilOjpcKJ/Zx96JGhUGkltQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(366004)(346002)(39850400004)(376002)(451199021)(66946007)(66556008)(316002)(66476007)(478600001)(86362001)(31696002)(4326008)(6916009)(54906003)(36756003)(31686004)(2906002)(4744005)(2616005)(186003)(6486002)(26005)(38100700002)(8936002)(6506007)(53546011)(8676002)(5660300002)(6512007)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UTZyWGhHRFR4V09aak5GM1V4SlBVak1MWXdkMFREQ091WGhXT085V29Lem1o?=
 =?utf-8?B?TURLWUs0enZYVkpycndqRy90MmFyR2lxNHhxb2pBMXV5Y21yY2sxVmo5S05P?=
 =?utf-8?B?elRxaVo5Rzdka0RNektROU1waGR3UkoxcTZTTHlwOXZlUmE1cDFVS3VQS1M4?=
 =?utf-8?B?RHJSQmtObTVFZkE1ZUgwaTgwcVQ4dDdPQlR6NGQzdnhKSzM5YzJKbnlkUVpV?=
 =?utf-8?B?M2VOUWJad0t1ekZFRmlmb0FpNzFCS2VHb0UwMnpGaUN2ZzRCeEM3R210NSty?=
 =?utf-8?B?eUFZQTUvWW81WWYxWGNybzlNTWNTaS9mRndYcDBVV1V1STF4V2FYNVlvdmNH?=
 =?utf-8?B?cjdjbUlyS3hwNGZZZDVmeW9GMlNhV3pDdVVMOE5kZ1pPdGRqQVlBcjR6MHdI?=
 =?utf-8?B?VXcydWxPNEgxTEVCd0xjMGhCOGUzcnlWcy9HUGZXUjA5Unlhb3V6SHFSUDI3?=
 =?utf-8?B?QjlYV2tCZUdGejFITGkyckl6WWFoZGcwNk1SMm5HK2V6bVZzdGlOYXA0bnZx?=
 =?utf-8?B?Mm9EY3FjRm5nMG14T3lZeUZtL0tZdk5zSVVyNlRoUlZKRGQwRHoyWDRxZE5m?=
 =?utf-8?B?ajN6TzR2M29ISDRMY0thcGtHOUNuVENzd09LNTNvYjgyTFQwNU5nNWcyY1M5?=
 =?utf-8?B?RXFJbjUvclVxanE4dzZSUUx1a0NObFVYMGFaSzdkdWJMemVWK3dMMGtJdmc5?=
 =?utf-8?B?NDdsMTdhZFp6WnFVK0RMQWNoYU1ONDViSFQ2bjJUUGEwT2FkdXVwTFFyVUx3?=
 =?utf-8?B?VVBpNkNBQTR1YlJNZ296ZWpLYmxlc0ZFdUFmS1lWSW5SNzVKTmZlelZOOXBk?=
 =?utf-8?B?Zmp5Y0dzaVBnN0xZZDlGemExcEg2VDZQNE5RdFl5NDExSVFJRVl1d05MTnNW?=
 =?utf-8?B?NGZleDhzZDRKSkMwbllqM1UwL2dyWVVMNmN0bUpMa05GcGtOL3VBNjZ3Yldj?=
 =?utf-8?B?amwra0x1eXBydnQzZzdlU0NTVXpmQUd1eGN4NndURjYybVh2WWVXcGFsTzNn?=
 =?utf-8?B?NStqMkhhS3dqV2x0K3doZWtHOGNBUWVScUFZc2l5alpZdDBPQXliU1BZdlNL?=
 =?utf-8?B?bGxzNGd1c2ZYQURmdEVNZS9WSVN5b3BxSTZRQ1JvNDhYUzVPWUpzQzhBVlRJ?=
 =?utf-8?B?U1FETk50UXRxOXJ3TFljM3p5SkxvbjFUWW11VkVBQkc0VHdKM3ZaQkxEdllT?=
 =?utf-8?B?SGVhWWVNRG01clhJejRYMFlzN3QwazA5UTczWnVxM1A0N01VNFM0cnd1ZzlN?=
 =?utf-8?B?TS9taUZZRWFOanUvMURyWmhrY3VUYkhXLzBNSkRGaWIyUkpDcFBWL09LS1c1?=
 =?utf-8?B?azB2WUFjdnlIOUR6WjJOaVJBS3VJQ3pwY1NaWmdjcFZKeUc2Mkp6cm5BaDYz?=
 =?utf-8?B?MzRWVGg4QkFyVkovVGJ6QnhvdStwSWV0N2h6S2lrWGorRGtJeWhNMjJQNlAr?=
 =?utf-8?B?cnRPaWx3akxvd09lRlFUeFUwaVhKM2M0K2I4RjJnUWJqd2NZbE85dDFlZDdQ?=
 =?utf-8?B?YjQyL3ltMGl1M3hOTStJNTlCRTZQazZpMUZQbFk5K3NZdytXYkdtcHl3RUNU?=
 =?utf-8?B?dEJVNG8vQ05yaERKT1VReURsV0FrWVlaSkdaYWJzNzBSU0JnSWdBTjJMZWNs?=
 =?utf-8?B?WC94NS9lWEJKSWFUZXVZTG1QL3gyOERXbXRpQmxiWlp3a0J6aHJMTEZRY2hi?=
 =?utf-8?B?QXJjNE5CK2poSEdNVi9sdzRtTUh1T1g0MCtBZDR5cHpna1Y5bERSVFNTZVQx?=
 =?utf-8?B?RWpOSDJPU2FiT0c0RDNpeElrM0J0Nnd4ZXh6V0JDNDFtTk55TjhJSVRtWG5r?=
 =?utf-8?B?endPMDIwT1ZGd2dTZzFMcmdMRVF5ZFBiQjdDaktrejdFVmdDZmJsU1RtcXRp?=
 =?utf-8?B?VmFSRU9UeXlNeVYzZlZqQ0RwdTllSGRpMFBpQURpQ3l3aDRMKytlenFyb3ZJ?=
 =?utf-8?B?cGJ5Mzg2UUNpamhDVDc5WmFtRSsySHZVbG5uRmEzTmtGUy9LWEhRc0dhZ1d6?=
 =?utf-8?B?RlFrMVYrN2hjVGVhZFg4Z3BZRHVkNXQ1aTJNOUlDRFVDSHFWUHJ3eWdSUHdU?=
 =?utf-8?B?NWVzWHp4VngyaVk4Z203WTBSb2sxeVRVTnpwdGhDWWV1amc4SCt5SFovcVVY?=
 =?utf-8?Q?wBgJHa0mqs1WJhltooHhV579j?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b80f94a-6dd5-46f2-48d7-08db52b533d6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 06:50:41.7047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IN4EnVWI/IhWjv2k0KTULoinjRNAcm0m22cKmfB2j43It445TxdEd6dDx6IFcbnTh9PCZ+jJzPK/mi4E48Dutw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9083

On 11.05.2023 19:51, Jason Andryuk wrote:
> On Thu, May 11, 2023 at 7:50 AM Jan Beulich <jbeulich@suse.com> wrote:
>> @@ -426,6 +427,33 @@ static int cf_check pit_load(struct doma
>>      }
>>
>>      /*
>> +     * Convert loaded values to be within valid range, for them to represent
>> +     * actually reachable state.  Uses of some of the values elsewhere assume
>> +     * this is the case.
>> +     */
>> +    for ( i = 0; i < ARRAY_SIZE(pit->hw.channels); ++i )
>> +    {
>> +        struct hvm_hw_pit_channel *ch = &pit->hw.channels[i];
>> +
>> +        /* pit_load_count() will convert 0 suitably back to 0x10000. */
>> +        ch->count &= 0xffff;
>> +        if ( ch->count_latched >= RW_STATE_NUM )
>> +            ch->count_latched = 0;
>> +        if ( ch->read_state >= RW_STATE_NUM )
>> +            ch->read_state = 0;
>> +        if ( ch->read_state >= RW_STATE_NUM )
>> +            ch->write_state = 0;
> 
> Should these both be write_state?

Definitely. Thanks for noticing!

Jan

