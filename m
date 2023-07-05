Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4C4748670
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 16:34:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559261.874098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH3aA-00005W-1T; Wed, 05 Jul 2023 14:34:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559261.874098; Wed, 05 Jul 2023 14:34:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH3a9-0008Uo-Ub; Wed, 05 Jul 2023 14:34:13 +0000
Received: by outflank-mailman (input) for mailman id 559261;
 Wed, 05 Jul 2023 14:34:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIgq=CX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qH3a8-0008Ug-5L
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 14:34:12 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20614.outbound.protection.outlook.com
 [2a01:111:f400:fe13::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 012152e3-1b41-11ee-8611-37d641c3527e;
 Wed, 05 Jul 2023 16:34:10 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PR3PR04MB7353.eurprd04.prod.outlook.com (2603:10a6:102:82::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 14:34:08 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Wed, 5 Jul 2023
 14:34:08 +0000
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
X-Inumbo-ID: 012152e3-1b41-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JD8uP3gU71VYFsyPMVvLJcUcuJm3Y8+QBQkUtc1rswzqci+69m27qxBtDz57EMtqSBMAEnAoGIm7HyD713V6cV1Q1JERZPQFQ54rUHLRw4uh8due3to2M2ro7Mi3Ki/XVcA8hMl4NsWbNNpogaHCPqZTKdWJohWyMVSRPpH05AngGZnUHVR89dsCA3LyL4Wnx8lg1Q1rnQh1nW7ezcBBDvFPjYwH4qaae0Qg9pTo+GKrzWIGml5w5+W0Y8elF35YX/97I8eWZThT8uKqeA7/X4ynRHSXqOEZV3F41FZewYag3uMHTkgNyJAzL28vW0mfosu8dvcUMNSMfMbEC6QVCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gWh8In+Ih046tj4975K2wzNVkdfZjyhtOeWDXIutzX8=;
 b=WMUJ/JISw7MeoRiFGsoJlDFXsq+fEYv5GftnQFqCkkqvKtssHPFYppBXU5vm2301HOkzzEwqdzp9ueVAi0+uieAEQhkCGIz6Qjb159XP6ngKNUyCsWdrKtAOaaSjD4NPqVOejreQVX4wKvchRdjNan/tgbzv4Rx7aBj2EhWlLhMzADxboUDAgHWVbF95cy8QUs8iuDUxz1ZJY77LLj83rP+Ffn8J7+qAP8DG5YoUcZnjXL8IfQn0M6gtnDlKIJtpoNkwp2IsmD35NoQWHsYbMjPRZCJHicyGFWn2BPm9k7De9yUQkCDuBRRklrOaR21lFt9mzHdLQE1fuznptNYI2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gWh8In+Ih046tj4975K2wzNVkdfZjyhtOeWDXIutzX8=;
 b=UpzvqXeywLM9oTRZUa4bIFkOGwANbUnEligmeB27AZzhjO54EsMdf7EJCFZxRw+1l5GbJ0ZCyuQKBWHcr8tRERqmEmWjX7a5bHozGMNnP/25bXDMWYniV928POEM682ZMuYOpg7hEHOzggchKKmvBt3rp7yUZluxfnweyXzacq1RoIGi65h1Or/a4/MdYM4X+LB4KKdcERmmbBVSb58+1L2Z7sWF546eIgupnZgVTPt8Rx/JONAPaL3ypc45j7bXp/Qh572JKNwCBbFg6KmIvSjX7j684Q/6JO/qV+yAVrQL1Hbbo13IHzqvytzLMPxx0jk/S1WxqXyfFLSR+5zhdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b41c472e-48e9-ee6a-0f4d-f927801bb26e@suse.com>
Date: Wed, 5 Jul 2023 16:34:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5 2/4] x86/microcode: Ignore microcode loading interface
 for revision = -1
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>
References: <20230629152656.12655-1-alejandro.vallejo@cloud.com>
 <20230629152656.12655-3-alejandro.vallejo@cloud.com>
 <d498ba69-564d-8232-5f5b-da52050772d8@citrix.com>
 <33af8ca2-dc65-0167-5569-c35744ea4f0d@suse.com>
 <ea4bb2c4-a099-0d89-9b9c-fe7ac8ffa0c2@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ea4bb2c4-a099-0d89-9b9c-fe7ac8ffa0c2@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0223.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PR3PR04MB7353:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a0ca372-6620-4e6d-e641-08db7d64e45f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6Xh8xbnaD6DRKjLJXzA4QDGLEA4hG7XkTzmOJeL8AWiBTsvhTSpT1qwhwQjCGjf6o5HGfkjsBE7+2uM+khqA0NWnSDCrIYamjWzD2CfWwzNfCIAV6EvSJscyEa8MvEevfSsOBG4K+ExrBgr6Y9aLtNHSOPh0A+o7MpNqhkiwSlTgk8EHgFD4iDSAYoGZyaRuXZz5MdhRa+KCgs9dpLiDnw5Ja8nqlo3JoHFCOFDIbMoLZfhYt06gMRGBTLFfhuw/pp9p3J3v02XXY/+dLrghJUNsk3gLiuQ49sPzpsIipZN+DUk6AbnYlkryEp4EOIDG3U19UUYXGQFUPaVIMJEUis+Rm0bdyYlHouM2EZJkXfFAhk1+FQm5UB8+kdlYNwWkJ2o6DZtSCeShWCWVsyoMdS272hQtLltQFfdOHa5OGuRAfvpl6eQjdhJl+0Bpzq9vaev8p1AVv49H5LMlFBHm4ZGc7wlTNvjrMkuecK/s77ixQLKlX1RMb8yWY/EnQrmDOwXXqmJ1uWS42n0dBxUIz5QQUFUw7zhvEELwzOFi0sJGKfJMJOF/0bN1fs2zOD2wqxNG0LC5FjgFtFJI8g6sEia3oAJeZw9rBiyar4byCuyS8Po9ehJuVEM+MxijTccwk+r6NE9rWGrgFQWUwvo5EA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(396003)(376002)(366004)(39860400002)(451199021)(54906003)(478600001)(6486002)(186003)(6506007)(26005)(53546011)(6512007)(2906002)(66946007)(316002)(41300700001)(66476007)(66556008)(6916009)(4326008)(8676002)(8936002)(5660300002)(38100700002)(86362001)(31696002)(2616005)(83380400001)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UUM1V3BKUCtENFNBL3NzK0wxeFc0b0dqeW1qajk1TXhFQ2oreGE2VkxMc2FB?=
 =?utf-8?B?dGtJTWpSQnl1SnRlanpMVHR2bnhzdTRrQTVncStEWHhOU2NpaTVTb3Y4RHhm?=
 =?utf-8?B?NTFFcHRqLzhQT29Hc2FLL0RzK1pWSDYwTDcySStSOGlWcGcxQjYwNUt2bUZ4?=
 =?utf-8?B?TEN3TklkM0U0cmVoeE5hTUovRkkvcFYzbHVncGE4YU50VzU4Q3BoU21mWStU?=
 =?utf-8?B?azYwaHB6WGpRVU92S0FlcXlkaUwwWk56YkZOT25GYVJCRkJJeWJXaHdKRis0?=
 =?utf-8?B?MTZNOHFVUCtERVlSeGpZTGlsRHhpaFBBb3c1WUlydHVnQ0h4engwMmViMjVO?=
 =?utf-8?B?Rm1OWFlNZmJ5K09xWk8wMXZiVVEzREN0RTYzZjRoV1c4d09kbXBKWmQzZDc2?=
 =?utf-8?B?TjIyaElXUjE4eDRYQXE2Z2xSaXE0eUdkMmc2STM0WUplNmFZSTNnTVB6NmVD?=
 =?utf-8?B?b2hKbks5TFgySHN2ZzVZV1lwUmthRWNRbVpGaU14V0NVVUVMa2Q5WGU5M2dE?=
 =?utf-8?B?anozTnZJU3VDU1J3ZHVxMzNJaFBrWVRiS1hBeTgrc2x3a2NNRG9hUmdob05v?=
 =?utf-8?B?MzlraGhDV3puUDJMS1JqL2NnOEQ5ZFdZNE9TMEFiaDdKNjE4K3Q4SnNuT1ow?=
 =?utf-8?B?cjVEM0hlUzIwOG5jeitPZXd3L01ZRmNlQWxFdUdGNTRyRXRLZ2VDUXdWOTNw?=
 =?utf-8?B?ZXVsd2lrM0F2NEUzUUFYOTUyTWZtYXBYL2RSbFpzOFBFK2UzVWUwSUZycEJv?=
 =?utf-8?B?S3Ztd0NzajkvYnhOL05YK2xQcE95THVwKzU5MjZZSGlua3VyNVhRSFF0aGZS?=
 =?utf-8?B?ZXNRS1RpL1pzUjJxT0g1VVZ0WHVleW05elJ6T1FoNHlYZVlMK05EYU8yY0pK?=
 =?utf-8?B?Z0ZrYXVxVHZrUGNDWFZKVm5oaWsyQTQ0Nm5xNUVZQmdHUzVEMWxJR2dzMmlx?=
 =?utf-8?B?VHB4cDd5SXdBcUhNQW8zSGFXWm5DRmVMUHhBOXg1Mkc3Z0R0SlI3RHpab25B?=
 =?utf-8?B?ajVhVzVPU2Q5MmNLZW9hWGk1RWV5TUVWTlM3eFhjcHlaLytVZkdJOTFoWjlr?=
 =?utf-8?B?b2hFVFJTaTB4Qyt2ZityM1lrMkR6T2dqSWF1N0VDYUcvb0ZVYXVPNW9sWDlx?=
 =?utf-8?B?YVZaY211ZzdhZ2drcEt3V3hOVWVOcUpYYkcrNm13ZEd3L0M3cVhidTlGcE05?=
 =?utf-8?B?VGRFOUwyd3dCNlYxYzA1T09VOGZxY0dGVlZzYzIzZ0RZazJETlJnY2NWS1FK?=
 =?utf-8?B?TVZtWVZ1Y1I3QVQ1czBNNGlIRWNjVXBHUUZUNjNlSXFteFArOW9hSU5ZRnRW?=
 =?utf-8?B?YUc4S0dsMkNUN1hybFVRc1QrY2NjYThidVJIREJ6UjNkQUlPbEVzdkRiakRN?=
 =?utf-8?B?WmpSZGFnVXltYTNRSzVTOWZJc1pQS2hTdlE3Wmhvd1h6TkZIdWFUUTV6TndH?=
 =?utf-8?B?MHk3Rkx0enJFN3hXMFV5Q1JwdWdzaTdBcUpRQXFuN3ZvdWduVVVpdTExNkFh?=
 =?utf-8?B?Z3loblovN3dUVDNjSlp3YUdLcXJWa1ZCUnhVOHBUNzlZcUtkUzJaaW1tVGEy?=
 =?utf-8?B?ZXZPa09DZ09hQk9aN2xxTTRUQklUYzQwK2hxNFVwRTk5K25yek92bitwR296?=
 =?utf-8?B?Z2tUUENBZnRBUitONHJ3OHhRSGZpdTdJbkZ1UjJObkkvSng5M0hJcHBMYXNX?=
 =?utf-8?B?YzRKZExsakpaZmxCQk9iMVJTNjJLOHFmYmY5WFA4YWpKTU1hbGhQR0M4Y2tm?=
 =?utf-8?B?UDM4bWZ0YnhrQnE5K2xwMEU3VWs3R3lDTVhHVTdyMVJ3QkRNMXVVZTQ0UDhM?=
 =?utf-8?B?YldqeHBobnA2ZVVLS0ZMNnFGQkJpbGk0MVpQSGoyMkx4djdXb0d1aExZbTF4?=
 =?utf-8?B?Y2hjKzFjS2VwTkc2djZnak90Z0EzWlYvcVNCODAzYnRTbUdqQTVheGFOQkp1?=
 =?utf-8?B?SXNXYzlJTjZia1JrSC9KTnprR3dxeE43M2YrWW1oR1owVmFyZ2F3ZUZpRDUx?=
 =?utf-8?B?WHBZTFk4d2dTZFVqQ0swUVpmbkR2WDVUeWpVNG1uVEcvVkRMSDRrK0Z1WFBT?=
 =?utf-8?B?QzF4R2dPcnpsa2dqWkZ4WmZlOUQ5WEFkZi9EcEVXbnJ1YzBvalFLYmIrbjYz?=
 =?utf-8?Q?en+0E3uhybFSLsC9iG/pAGKUP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a0ca372-6620-4e6d-e641-08db7d64e45f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 14:34:08.5584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6PUUBScvYS/H83jeWNpUqVYIZ894gwIsAPbl/5IFQ2UEgZ2/FFT7T1dAL6MIitOBDn9xwGh48pDtpzx5mit7ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7353

On 05.07.2023 16:28, Andrew Cooper wrote:
> On 05/07/2023 3:24 pm, Jan Beulich wrote:
>> On 05.07.2023 16:13, Andrew Cooper wrote:
>>> On 29/06/2023 4:26 pm, Alejandro Vallejo wrote:
>>>> diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
>>>> index bec8b55db2..b620e3bfa6 100644
>>>> --- a/xen/arch/x86/cpu/microcode/core.c
>>>> +++ b/xen/arch/x86/cpu/microcode/core.c
>>>> @@ -867,10 +867,22 @@ int __init early_microcode_init(unsigned long *module_map,
>>>>          return -ENODEV;
>>>>      }
>>>>  
>>>> -    microcode_grab_module(module_map, mbi);
>>>> -
>>>>      ucode_ops.collect_cpu_info();
>>>>  
>>>> +    /*
>>>> +     * Some hypervisors deliberately report a microcode revision of -1 to
>>>> +     * mean that they will not accept microcode updates. We take the hint
>>>> +     * and ignore the microcode interface in that case.
>>>> +     */
>>>> +    if ( this_cpu(cpu_sig).rev == ~0 )
>>>> +    {
>>>> +        printk(XENLOG_WARNING "Microcode loading disabled\n");
>>> XENLOG_INFO "Found microcode revision ~0;  Disabling loading because of
>>> virt\n"
>>>
>>> It's normal (and not a warning) when running under other hypervisors,
>> Except that INFO won't be visible by default in release configurations.
> 
> Well that's not a bug with microcode then, is it...
> 
> I can't believe I'm having to say no to emitting messages at the wrong
> log level to work around a bug with selecting the default log level in
> the first place.

Hmm, I think not emitting info level messages is quite right. If I'm
not mistaken we emit various others at warning level to "account" for
this (you might instead call it "to work around this").

Furthermore, as to your suggestions here: What would you expect patch
4 to do? Emit yet another message, instead of having both conditions
fold to just one of them?

Jan

