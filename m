Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2D672540C
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 08:25:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544380.850124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6mbE-0004oU-1t; Wed, 07 Jun 2023 06:24:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544380.850124; Wed, 07 Jun 2023 06:24:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6mbD-0004lb-Up; Wed, 07 Jun 2023 06:24:51 +0000
Received: by outflank-mailman (input) for mailman id 544380;
 Wed, 07 Jun 2023 06:24:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdix=B3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q6mbC-0004lV-Ur
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 06:24:50 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20629.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 009f296e-04fc-11ee-8611-37d641c3527e;
 Wed, 07 Jun 2023 08:24:49 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7671.eurprd04.prod.outlook.com (2603:10a6:20b:299::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 06:24:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 06:24:46 +0000
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
X-Inumbo-ID: 009f296e-04fc-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kkQGP5tfcGqMaD8p38YWo2ltz7SXevsPbfOZQxPxq7SBY9oMfxSjD0eI+XmoRkZW6jG7JOKaAxzFs8RXeV/dp8UYrZkuNlq1lP/g3vcVIBpe40UaGwO46J+n8BIxU+bg4Y3gjCku7xBo33/oLZ5MvDfaxlKka2RA2h5Bisw5VKnoZRjZxIZ5RFjJFBs8VmG8BgWRIcdHGF4fc6O0Pgka8/jzQEryjzD2KGup+zFlw12AzKmsRvTpGhCphps39bUpEQCgHAAh4FdsOykQJaV0qYkErW0uoTtci3Dl8ZkgeZOo9/Jk/6wAiyTIQi8c0+vnBb5RgxL8qRNu1J1gFMzFAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4p+bzo5gEg8xMHp4vUEkRwzl4DVSpUCuCRh4tkO0vf0=;
 b=KUu8NBNiqC2qaKoAdc5e4t31kAc8AcU2GsGAzxrjeki3KE0S9BTEJ8zMTpBJ1Hraerj65mOiqH/FLKgDbC4LFumCElK/d5UUZXA2yCsshzZ5xx9NPAJI51fHQq70hhLU57JMNtQT4SfacVKD49OVDtkkWpPXuW4RRz6rhhzeChXIDhv1BKJtDBqLRVq41ILPpACzj9v5pFPb2RwWBIP1PHI1VSjTJJPRcAGwhlEmcWYxFW3+cZKpc15LdKyAZxW5Nl57JSCQpDXJ5KTu0Adc6aiOT47TsNAtfvRHsw2MuR3pgRpbD2EupfcBK31ZflkRMaCIrENWQqiAKkauE4pCeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4p+bzo5gEg8xMHp4vUEkRwzl4DVSpUCuCRh4tkO0vf0=;
 b=UvwytD7JnW20EmL+4zeIBaDf6MIrgwKbh1aRAPSTYYdrUeqHC1lK50cXbb+mBuaqW+gskME8Gc8LhMrGPUaoX8Qhh3/xXE1UdHE+YXBd1ItjftuqlK5DCz6VSTDw7g5Kq0mzbC/3VmWQJgdwtGa1JRILnEiuTt/zeN/OW5FlIps6NCEHTCc2/dsaweshIxHlJAefuCIBzUr5+U8T94Yw6qtblI0HE6HwVi5u+r2FsL+f5Z9iPPHVJAjOelYxy8tVr0tw+TedDlGYZuFSmxMfO/MDz9qWpkbjVZL4IVZ+g6Lqkou+sp9j4pIF1+KjyLoWDhulZ/k3ixS/nuTNlXSlrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <37c77ba3-ea7c-f9ee-1725-f2c27b8afe8e@suse.com>
Date: Wed, 7 Jun 2023 08:24:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] amd: disable C6 after 1000 days on Fam17h models 30-3fh
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20230605151036.18085-1-roger.pau@citrix.com>
 <c0c4142d-586f-09be-b2d1-502be72e7968@suse.com>
 <ZH8q+bXqAab3sICI@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZH8q+bXqAab3sICI@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P190CA0040.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7671:EE_
X-MS-Office365-Filtering-Correlation-Id: a29fafe1-57fb-41f8-40ef-08db671fe357
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WDmQrDKT+6TCiBRwJHTPq8g81CbnKeEfiA2Hj7k0WletKM+W1udF8wpo8oq6migGqxQasRG/+SAmdp0DifNC+mHfA70X9GbDFfy30wHCVwcrYxfK2AYQOimLewcFx5eLkhDWYQnfPYYHjCT39vQ4X6ytXN0I8sjUfAMOsutGB+VWWhJVCHzfXPApaw1eCcwwZh8fMckU8pNXyHhiXXPDEHRWHAgq/12+Y38A6GEdl8rDOxdxVxqYVhQSV4pmoga3tslo2fWCik2ZmaeHikZUgqXTZ15dM1nr8yq3z+Ri8qE2sVgxE/eK1Kxc29V09JndaNF321od4qDJ8OQx/zvOsGd/rUGXX/KLIpbkQ/2ajgREwXrYbjRxdjg5R6QHncMPgfy72U7zHyT36mrJ5xD3qCrxouidRRCsfg/nKiGomHvMf949ejKrC5sFQ5HgH+hutyvrBA6sl87HZi6/KfscY9us70PYiRBdo0/tYPj2hWKiZVHXa9kpZXNfu/ndtCZ0aK5B/5ThjZsku5OGGgFtGku87lOpP64uZC/FWor/Y5AYTileHzYPpJxEUtaUTIJjQH3B9cBY6KmXGAlerOItTgRqIl+BynRj60wsMD6Ai7D43jim+Q7u70ezmyKJ7MjetmTx0J6KHVDnIQ3Le9laMXfdsJ0DaTAlVno9VquNYTahSgJgtyOka7p2lciQl2cj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(39860400002)(136003)(346002)(366004)(451199021)(36756003)(41300700001)(186003)(26005)(6512007)(6506007)(53546011)(5660300002)(83380400001)(2616005)(8676002)(8936002)(54906003)(478600001)(66946007)(66556008)(66476007)(4326008)(316002)(6486002)(38100700002)(2906002)(86362001)(6916009)(31696002)(31686004)(221023011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVBNR3RXMm43cXdJOENqTm15T1N4TUVaeERwdC9rSlc2UGxnS1V1MnpqMmpF?=
 =?utf-8?B?MHcrT2V0TWpMWjRMbkpQaFU0ZytGUjg4NVRrZ2ZoV3pCTjBUOVMrSFNxL3Z6?=
 =?utf-8?B?d2xNVTR0b0tlUmd3Rkk1dlJGbnYxQkt4TXBCU2VBc0FvNzB2bjNyeU01RkZs?=
 =?utf-8?B?bmNMS1MxcEpLcGg1UHRlV3NhN0JWSjBqMXZaQnNLcEtIalFxZUNTaDEvRU4z?=
 =?utf-8?B?MHZhNXJQd3Y3TGNvK0RCVkdqc2haV29DQjdvYzk2QWcydmIzMWQxa2oyRnVW?=
 =?utf-8?B?Yy82Q2hFUUh6TU5CK2tRSTVrMTV2YUs4Sldtck9WZzhndHhxMVhsanNYcVFa?=
 =?utf-8?B?c2FjTGZPN0ZMNnFvM1piVCt3ZUx2Z1phbEJDNGFmSnVEeE00NG40U0lWTkFw?=
 =?utf-8?B?bUdPUGtSQjB6c1ZWY082NFE0WGIyZUhvRkczZE9iK0pxK1EvN1FDMThVTTRQ?=
 =?utf-8?B?YXptbUlBT0NCb2FrQ1hZTjgxbzlTejlJU2lHS1V6WGR2bm9PYjFsUjlvZmo1?=
 =?utf-8?B?L05lS3UzOGVqYjZ3dVhoTFRJQVc1ckV6alJ6RlBoVUNEVlVOQWVZZ0dPTE9J?=
 =?utf-8?B?Z3U2NXNjMEs2M09FWFBaZ0d2L0dtMUpzWC9OdEFwcTB5eklKd1dhZjZWeVVM?=
 =?utf-8?B?RitqTWNQYno1ZHV0YjBHT3pOWnlZTUx0eWpRdnZNdGpYakNhUWZuTkNFcGtU?=
 =?utf-8?B?dXRKZVVqbTBjaWtNRTVzaG5yUmZrVUNrb3ZvN08wYTQ4b0tOVlg4b1M0N29Z?=
 =?utf-8?B?aEREak9EbHNYWVJrQUhLT0ZlYW9EWE5QaU11ZnZLbWpKN3p4MTdlME1kbHpR?=
 =?utf-8?B?T3AvTXJZR1M3RXd3RVBFdDNFR1dIWWZiTVFkWDdKL0FDTEF6OGRyVllzU0F1?=
 =?utf-8?B?NC9FNFB4YU5JZmRjdnlDMG1wYyt2ZnBMaStCcnZLa2tEdW9OK0Zsa1ZlaHlK?=
 =?utf-8?B?TTNOOTlaeVNpLzBTVmJkMVZZaFV1TjZaVDZNbUxTRi9uM1ROSkY1LzZCaSs4?=
 =?utf-8?B?Ukg3d1JiZFJqOXBvMFpJSStFODhMbC9kZmlQWkwyRC9sSlg1TEtTUThrR3R3?=
 =?utf-8?B?VGphb1BXUDFGenF2UDFXWjRaOXhnc3l5RXBENnF4aDNLNnVXSjUrSldyb3BL?=
 =?utf-8?B?RzlQbks0WXVDajFsdWJwaldaS2Nzc0hXbXdlWWhhL1FURG9RWldTQVhXZUNk?=
 =?utf-8?B?Nkx2c3RxQnJISjV1MWNjUmZaZVEwMms2QS9OaWtsOUdxRVJoUTc1bGFROXM0?=
 =?utf-8?B?Y2RLY3F6SDI5aVJHWUdCT2piZ01CMzRBbWF5VjVSYVplRlpZU0NsditTbnNL?=
 =?utf-8?B?NmZ5MFcrK3FWMlRPM3JQdVQ0TWluemdCRHVoN2d4QjVwSzVPOGwyZGhub3ZG?=
 =?utf-8?B?d3BoYStYZXo0aUdpekE3ak1EN01BMlRyWUxBOWZBVERVQ3RkNnYzQVMxV2Za?=
 =?utf-8?B?dnFFaHJaSWNDSjIxL2VtdS9nUmpReWlseGlYUWcwckNjd2s2R2NCY0E5MkVE?=
 =?utf-8?B?dFhzS1lNM2VYMzliSlhnaCtWc0xWMmZ2N0tZNDFnR3loM3BTQkZwMENma0tn?=
 =?utf-8?B?T1Q4QVBKd1FnQWlnUENZQWxQN0hhdld0RVBzOUtaai9lSEwxQy9kNzZ0NU1P?=
 =?utf-8?B?M0lEVnZRNWZGYkFJSjE4eWE0akY0OWMzZk5qdkFOYUpWVC9LVFpnTVA4N3RB?=
 =?utf-8?B?UE9tV3pFLzg2RjRsM0JIbDJKakIwYnBHbm5HYU5BcXJTenowU3Zhc3BNaFRo?=
 =?utf-8?B?Vmw2Z3Zid3UzMFp3SFdRd0tDU2k1VGpRaGRxZlBaTFk1SXdTWTFiTEJuRmpR?=
 =?utf-8?B?cG9yR05kRzU5ZFpnQnUwZTFLazhaRFZNSXRXcFNob1RUekRBeFNOdVZmTzA3?=
 =?utf-8?B?SHpzdHlUbXkwMTJLclM3WERpZEQwM1NNb3g2YXNtdGFKK2lvQWVMMnR5aFM5?=
 =?utf-8?B?YnppWUg2Sk41Nm9YenZmZ0Z2S3RMM21iMUU5QllsRUlsOHRWSzIyRFRkZC9k?=
 =?utf-8?B?Sy9zUXhQSjN1YklZVWhmWVZPaFJ3aWF6S1BiTjZtSmZiQi9TYlp2RUptMzdK?=
 =?utf-8?B?SmxJdW92L0VuS3JqVkFVb0gxNjI1aUgzdDJUb2FBcEsrOHdjV01uVDJYeWpn?=
 =?utf-8?Q?y3rXHajis+EXCNdY/TCKnUhJP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a29fafe1-57fb-41f8-40ef-08db671fe357
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 06:24:46.0225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x81aylLIycQL0gvfwQJw34m328m8xTg7SLov4WKPMQ1cGO3YObrol6OJ1OonxNki/aYjKOSbS2X9XJwfvxAMnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7671

On 06.06.2023 14:47, Roger Pau Monné wrote:
> On Mon, Jun 05, 2023 at 05:54:50PM +0200, Jan Beulich wrote:
>> On 05.06.2023 17:10, Roger Pau Monne wrote:
>>> As specified on Errata 1474:
>>>
>>> "A core will fail to exit CC6 after about 1044 days after the last
>>> system reset. The time of failure may vary depending on the spread
>>> spectrum and REFCLK frequency."
>>>
>>> Detect when running on AMD Fam17h models 30h-3fh and setup a timer to
>>> prevent entering C6 after 1000 days have elapsed.  Take into account
>>> the TSC value at boot in order to account for any time elapsed before
>>> Xen has been booted.
>>
>> Models 6x are also affected as per their RG. I have some trouble with
>> the site, so it's too slow going to actually try and fish out the RGs
>> for the other possible models.
>>
>> Given more than one set of models is affected I of course also wonder
>> whether Hygon CPUs wouldn't be affected, too. But I realize we have
>> hardly any means to find out.
> 
> I've considered Hygon, but as you say I have no way I know to figure
> out what models are affected.

Well, see also Andrew's reply.

>>> +static int __init cf_check amd_c6_errata(void)
>>> +{
>>> +	/*
>>> +	 * Errata #1474: A Core May Hang After About 1044 Days
>>> +	 * Set up a timer to disable C6 after 1000 days uptime.
>>> +	 */
>>> +	s_time_t;
>>> +
>>> +	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD ||
>>> +	    boot_cpu_data.x86 != 0x17 ||
>>> +	    (boot_cpu_data.x86_model & 0xf0) != 0x30)
>>
>> Perhaps better ... & ~0xf, just to be future-proof?
> 
> Right, will need to change anyway to account for 0x60 models.  But
> x86_model is a char, and hence the mask is 0xff only (8 bits).

I understand it is right now, hence why I said future proof. I consider
it possible that upon widening the field an expression like the one
above might be overlooked.

>>> +		return 0;
>>> +
>>> +	/*
>>> +	 * Deduct current TSC value, this would be relevant if
>>> +	 * kexec'ed for example.
>>> +	 */
>>> +	delta = DAYS(1000) - tsc_ticks2ns(rdtsc());
>>
>> Generally the TSC can be written (and we actually do so under certain
>> circumstances), so deriving any absolute time from the TSC value is of
>> at best questionable value.
> 
> It's IMO better than not accounting for the TSC at all. Worst
> case is we end up disabling C6 before actually required, but that
> would leave us in safe position anyway.

Hmm, yes, fair point.

>>> +	if (delta > 0) {
>>> +		static struct timer errata_c6;
>>> +
>>> +		init_timer(&errata_c6, disable_c6, NULL, 0);
>>> +		set_timer(&errata_c6, NOW() + delta);
>>> +	} else
>>> +		disable_c6(NULL);
>>
>> The log message is going to be misleading in this case. Maybe pass
>> that as the so far unused handler argument? Albeit I realize that this
>> will mean casting away const-ness, which isn't very nice.
> 
> I think we could use the same message in both cases, what about:
> 
> "Disabling C6 after 1000 days hardware uptime due to AMD errata 1474"

But that's still misleading if TSC was ever written. The message is
pretty long already, but inserting "apparent" would address this.

>>> --- a/xen/include/xen/time.h
>>> +++ b/xen/include/xen/time.h
>>> @@ -53,6 +53,7 @@ struct tm wallclock_time(uint64_t *ns);
>>>  
>>>  #define SYSTEM_TIME_HZ  1000000000ULL
>>>  #define NOW()           ((s_time_t)get_s_time())
>>> +#define DAYS(_d)        ((s_time_t)((_d)  * 86400000000000ULL))
>>>  #define SECONDS(_s)     ((s_time_t)((_s)  * 1000000000ULL))
>>>  #define MILLISECS(_ms)  ((s_time_t)((_ms) * 1000000ULL))
>>>  #define MICROSECS(_us)  ((s_time_t)((_us) * 1000ULL))
>>
>> While consistent with the other macros we have here, I think this would
>> be neater as
>>
>> #define DAYS(_d)        SECONDS((_d) * 86400ULL))
> 
> Hm, it would make more sense to introduce the missing macros between
> DAYS() and SECONDS() (MINUTES() and HOURS()) and use HOURS() in DAYS()?

Probably, but I didn't want to go as far as asking for this.

Jan

