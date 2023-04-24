Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B726ED19B
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 17:42:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525529.816801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqyK7-0002QA-Qr; Mon, 24 Apr 2023 15:41:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525529.816801; Mon, 24 Apr 2023 15:41:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqyK7-0002NE-N1; Mon, 24 Apr 2023 15:41:51 +0000
Received: by outflank-mailman (input) for mailman id 525529;
 Mon, 24 Apr 2023 15:41:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0Hh8=AP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pqyK6-0002N8-25
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 15:41:50 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2042.outbound.protection.outlook.com [40.107.7.42])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85f71c48-e2b6-11ed-8611-37d641c3527e;
 Mon, 24 Apr 2023 17:41:48 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS5PR04MB9924.eurprd04.prod.outlook.com (2603:10a6:20b:67e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 15:41:14 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 15:41:14 +0000
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
X-Inumbo-ID: 85f71c48-e2b6-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PL0oGI07z4QE8O8szRsq+aSj0XxBxT88I4JUwdvWJEDyq2riz16ZC4MIHxM2eiWS7VPi8VCyWPz2v6dRvWXk1z7AB6Ku+jylkJvnJGATBW9M6IVVv1ZIV0ub6bHTtrZyRwnFyfGn+jsMu8HddEk8sOc3tPrcgGC9J1LhKpUMv+O/a4kPAgGFaqRalZK2+rfl57LxGQY0T1vcp0U1r/kwBqwICNz5z9qwGe0WpBcgdiaSBd6HKpB/RhiToO34hxz/98SqYvAphf2NrgyXd/858Fl+pTh/yTfiVz0mvKocPsCkFawRPvdGO+KaJyM73YD2OGPCTaRdPVUN2PRKMgAdRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z0ZOhIcLVtB9txDqrr0krIMyUlDPGIGDdINws1TZPyw=;
 b=g3OztvzWg7M1rBGO/dz9qXRZEo85WV2/XYaqirtN6ynNvzEvT9gY1SR/z8qrl42BAaTXAVrpfQ/0Co9d0koBpwvzi5WzG5LZHuhf6/RqMnx5MzR4RwvcLpyAUg0YVoMqIcNBpyGQdTw5YCSHMAeYiCBxioiExNYkzk6PyPQKDeppCDrFMtVAPqUYVedXTO2F3ipLM7LC/nkJeea6wW0yjXRYVolWCAY07ZF4wMtlKl/KuruCkJ3Q1U7JWX7Je/1NyYgFjiCgzgtojNrlnNOweljCGpTQCB+m73HhUt7SeGBM6lTgQS1p/h9E2XDTryz29lFkkeWvLgtXyzIJOf28kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z0ZOhIcLVtB9txDqrr0krIMyUlDPGIGDdINws1TZPyw=;
 b=sYdpWbD4oszrm62wKTRumHTePksiISuMzQvpOhPnMnKqUFfu4uj+4jaS77fvwbSQnznr6bD5QhkF5mxZag1j+ytcI/pzWNFRyhlGV5Zrf/8G096Uwlt4fCSJMRWVMUAkrw2rdXVeu8yrwaK1I2FIQQnNpSL+spVg5U1ZnvkVebNj5Xv+YF08dKi7eSbJXefwu45djrGH7d290v77UWiey4zb13fmDd2WLMLqYE8C2w/L2+F1klFDxJDor1scdWcDPzIGuB5pSka0+jSYS6IvV2gdLdKeUnjWu2rWvmoJ6M6j8d5KgVEVr6BEu+toSBy+bOlaXHP2EG2ZCFsndxtNwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a268313d-03be-9281-3627-c38115d3e5de@suse.com>
Date: Mon, 24 Apr 2023 17:41:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v6 07/12] xen: enable Dom0 to use SVE feature
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230424060248.1488859-1-luca.fancellu@arm.com>
 <20230424060248.1488859-8-luca.fancellu@arm.com>
 <589fdeec-a0cf-1dc0-18b2-bd20c76832d2@suse.com>
 <7064B21E-414F-4FB5-BCC9-349388B32EA5@arm.com>
 <11e92082-6603-7180-f405-b96a14d430dd@suse.com>
 <37C35493-D5DA-4102-9B93-0045732E6F94@arm.com>
 <d49f1df6-ac49-27ef-d55f-b6284c76b055@suse.com>
 <5535FDB0-989E-4536-AF7B-8F0BB561667A@arm.com>
 <bd064b44-3531-a1b0-a7a8-1ad7ae434394@suse.com>
 <300BE89F-CA37-4A28-9CC5-5875E10D4A0C@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <300BE89F-CA37-4A28-9CC5-5875E10D4A0C@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0173.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS5PR04MB9924:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fd0f126-100b-4734-0ade-08db44da55eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NiICn67UTafGcmutt/tY833yipZeROyBZN01VTlKtf3RaDx+zYAuSID39Q+CRFlJh2i+ZcOav6gOlSXjeDgZX9VaWd9Pcentpxmf/NwtK57I2V9ajZEnQ4ffXy8uRYxhLeu5DHN9sIqYZ+4ljX0hWrqz8ylbvCrvQMecyXbpx3CkYfKRPoHyda2ApeqJQnXtRtpti74B+6gZXxY+ofVJBm+JjqKoIObvfyP7GyODtjSJtWnnEESIQoh+Lczh3tuxGGDOcDbG4qTvhoDZEnNF6Lvc7NErD6I02qEoItdeQsS2Hjt8WYnkrsQzhPM/LxMHMpuHHKWMRYoec3JnOjV8pBF7RT+3EnBNW/UI5bbAti1vOydyjuheSkRzLzhz3nK4hKLhAQCTdU4FDnrIKjEMVu4V/vfEb01A5ss6YSr8M+jlDyPrMMGTQtwmipKs7AJYV4u3Dz3nTMyk5FUMw4glhW409yPT8JvY3G2IKmTw7K9rD7HvzJo+1Zdejley0n9261KnLnEYfBUpxnkf1DYSGt9LhQcosNz9SWP5pUkWM626bo3bd33+CUAg+ICrJ3h/OHiWDYIufak82qmyGAjzabYPSE/5oKHIRPL1Z8ubGiLGJO9Z1XAxsO7KUP88U8rMBI1sb5dc1v4dgx2Yi0tG/A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(396003)(376002)(136003)(366004)(451199021)(31696002)(54906003)(86362001)(478600001)(36756003)(186003)(53546011)(6486002)(6512007)(6506007)(26005)(316002)(41300700001)(4326008)(6916009)(66946007)(66556008)(66476007)(83380400001)(8936002)(8676002)(5660300002)(7416002)(31686004)(2906002)(38100700002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UkI2NGp2SDN3eElTeTk0RmFrYjlZd0VPWDYxanJpcFpHSDBjMXJnclFZRlhr?=
 =?utf-8?B?K2p5YUtxT3o2UWxxcldUa1pwR2dxQUJaTm1la0dvU2Q2RlZkdW5tQ0IvcEI2?=
 =?utf-8?B?RWpmM0FSNndFR2ZXZVE0UTYxRyt5aTZLU2M5bjVpTnFvcUwyRCtXVUVEdllL?=
 =?utf-8?B?TG43OWVSa3ZEQUhtMEFNcy91ZUxMblpIbTJ2OXNnempybjJ4bDNvRTVSOXly?=
 =?utf-8?B?aEZRTDhiYnVvMXBaN2loVW1qaDhpMjVYamxLQjRkZ1RHSGduU0JhRElGb243?=
 =?utf-8?B?Rld3ZWIrMUFYLzExemVJNVJuYmNtL3ZYTS81MndlTXQvUGlkeGg4M1FYYnVO?=
 =?utf-8?B?RDQwQVBDQXprL0tZUGRPSWRwU1VzT0Z1SWVUbENaditIOEpoSktld3BrcTJU?=
 =?utf-8?B?ZEFKSURiNnJ5RkJLbE1Wcjg3NlVLczhWblM2SmtzM1BpUmd3ZVNqalNrVVlM?=
 =?utf-8?B?dktvR2pRb2dXbXdMc254dEM0ZEQvQlB5RHY0cnlzcHI4THp4MFN0UTdhUWhB?=
 =?utf-8?B?RDBDdmppREkzczFwM0VGZkplbGpUMjE3WlhocC9FWUIvalVsNUhhczloSURQ?=
 =?utf-8?B?WUMwdXpFNmgzS3JHZ0hjRlNwUzRPZXI5dW1XSm93QUZqK1ZFc0xvSk9QSmZl?=
 =?utf-8?B?QVpSWDJUeXUrMUV0MVBxMU90OXVIWGFQQlFOUkxDNjFtNFUzWDdTSi9Ha3NQ?=
 =?utf-8?B?Z0l6Rlp1dUtkTlBKaDhNaWF3SURheDBnNjRWNGw4eURNaWpad1ZRS1FHbzBB?=
 =?utf-8?B?aXdwVEFoeDJ6Njl1OEJMNTVHd3FrUGxaUkEzNFlFVHQ0QmFLQ2p5VC9LZGZm?=
 =?utf-8?B?eHE2TTJ1VkF0ZDR3TE1saXZEaDUrRlRVSWUyZDhPKzRpQ2J6SEpSZjh4S3Vw?=
 =?utf-8?B?cDVKOE4xYTJYTVdqS04vRnJFcjFHSmIyTnZZTlhzTjFiUVorUFQ1S3UwVkVy?=
 =?utf-8?B?S0U5WWFmZ3kyNFpQMWFaSEhVU1RtZ1RyMExjazFieXU3Yi9LMmxGTC8yWWFE?=
 =?utf-8?B?TmVhYVEweGR3S3NrTTNWOWFkdGVJdUFxWVlieDNLNHNGMjJtclFibkZNZ1hk?=
 =?utf-8?B?WDA5R3M2UU1Pa0JzNTRaU1doaHltZE1TRTNvd2c2Ujh3bmIxTE9KVnIxa2I2?=
 =?utf-8?B?VXBzZ1ZXN2twdGMzbTNGcUJFVldHZGVhM2FpRENrTE5qTm9FNklTM1RLcitp?=
 =?utf-8?B?Yys5bjM4OUo1ZmZuK0tOYnZUS3EwWVl1aEZ2Rzdielg5UjhvWms0QjJXVW56?=
 =?utf-8?B?UHVlUzg0ZS9weGt5QlV0YzF1azF2Q3RSS0txZCtsbHNZNTNZZDlpKzFOb0Nv?=
 =?utf-8?B?UEs3UC9OREw1QXovYnVNWWlsd0FkOElURXdhVU04RnllZ3VPSG5JWmNnZjVY?=
 =?utf-8?B?YmxwbjRRQlpTMnQrZWNyQlVpMy9sOWhEc1p6aDd0MnAraUZVenNRbjU1aXhM?=
 =?utf-8?B?dXFFNERRc3FjZGpPbmxxczNqbHZpeUNNQXJ2dXdQdGUyMXBHMytzc1VuV2Uz?=
 =?utf-8?B?Q0NpeWtoRlZGZi83OXJGNmgzNzlUaVJrU213TTE1RVA2YWdJVmtOcldhd3dS?=
 =?utf-8?B?ZGw2R094THU5b2NMOE92L3hwSUU4N1RYVW95aWkwTFdjN3lsMFUxRi9MRkdY?=
 =?utf-8?B?N2NvMkZmTURLcHpBalRxbzlEMXpYL3pvL013TC9ySUpFUlVHTkI2REFFUkNT?=
 =?utf-8?B?QjhuekVLRXU1STBlWlFlWE9YTDFGQ1NZU0U5bTQvZFlLazJzNGpQWGVBTGN1?=
 =?utf-8?B?M1lxRVhveWVkVzN1dXZpYVZ1T0ROYkNYMWxwMTFKaG54S3liUXhBZ1Y3cUtr?=
 =?utf-8?B?cVFBdkd6TVF5THllUVI4WGhMbnF2U1JzWjNGdDhzT0JqaVF1Q1pIYlFCOVQ2?=
 =?utf-8?B?ZUhKZ2tkRnFPMXVvQ05vWHllMWhhWmJ6bktEeWx2Sk5VYXlJMytKMlNCcEJB?=
 =?utf-8?B?cGJYRTZzMEZtN09pMmVmTEw0M256WFhFN0NDM013eWNRQ0R5eUVkMXhzZmVK?=
 =?utf-8?B?bWFwUXM1Z2Q2KzBGYXE1dUZZUVpUM3ZHZjJ2VnBhRHNLazNVS1JPc2w0NDAr?=
 =?utf-8?B?YkgwR3hMTS9DZ2g1UU1aa2ZLY2dEQWdyT2U0WnR6UjFZSTlta1NqblRaQjdJ?=
 =?utf-8?Q?moVk1+JWtGlBhePmfz1StHD6X?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fd0f126-100b-4734-0ade-08db44da55eb
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 15:41:13.9368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WvDFgTI8Ybhq2betzyJ6w6Jh9NtFqw/RBdHep+/syw/BVpplguPS4smYmKWAhGgVDWCmGSdRgg86UGZfNd3h2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9924

On 24.04.2023 17:34, Luca Fancellu wrote:
>> On 24 Apr 2023, at 16:25, Jan Beulich <jbeulich@suse.com> wrote:
>> On 24.04.2023 17:18, Luca Fancellu wrote:
>>>> On 24 Apr 2023, at 16:06, Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 24.04.2023 16:57, Luca Fancellu wrote:
>>>>>> On 24 Apr 2023, at 15:05, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>> On 24.04.2023 16:00, Luca Fancellu wrote:
>>>>>>>> On 24 Apr 2023, at 12:34, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>>>> On 24.04.2023 08:02, Luca Fancellu wrote:
>>>>>>>>> @@ -30,9 +37,11 @@ int sve_context_init(struct vcpu *v);
>>>>>>>>> void sve_context_free(struct vcpu *v);
>>>>>>>>> void sve_save_state(struct vcpu *v);
>>>>>>>>> void sve_restore_state(struct vcpu *v);
>>>>>>>>> +bool sve_domctl_vl_param(int val, unsigned int *out);
>>>>>>>>>
>>>>>>>>> #else /* !CONFIG_ARM64_SVE */
>>>>>>>>>
>>>>>>>>> +#define opt_dom0_sve     (0)
>>>>>>>>> #define is_sve_domain(d) (0)
>>>>>>>>>
>>>>>>>>> static inline register_t compute_max_zcr(void)
>>>>>>>>> @@ -59,6 +68,11 @@ static inline void sve_context_free(struct vcpu *v) {}
>>>>>>>>> static inline void sve_save_state(struct vcpu *v) {}
>>>>>>>>> static inline void sve_restore_state(struct vcpu *v) {}
>>>>>>>>>
>>>>>>>>> +static inline bool sve_domctl_vl_param(int val, unsigned int *out)
>>>>>>>>> +{
>>>>>>>>> +    return false;
>>>>>>>>> +}
>>>>>>>>
>>>>>>>> Once again I don't see the need for this stub: opt_dom0_sve is #define-d
>>>>>>>> to plain zero when !ARM64_SVE, so the only call site merely requires a
>>>>>>>> visible declaration, and DCE will take care of eliminating the actual call.
>>>>>>>
>>>>>>> I’ve tried to do that, I’ve put the declaration outside the ifdef so that it was always included
>>>>>>> and I removed the stub, but I got errors on compilation because of undefined function.
>>>>>>> For that reason  I left that change out.
>>>>>>
>>>>>> Interesting. I don't see where the reference would be coming from.
>>>>>
>>>>> Could it be because the declaration is visible, outside the ifdef, but the definition is not compiled in? 
>>>>
>>>> Well, yes, likely. But the question isn't that but "Why did the reference
>>>> not get removed, when it's inside an if(0) block?"
>>>
>>> Oh ok, I don’t know, here what I get if for example I build arm32:
>>>
>>> arm-linux-gnueabihf-ld -EL -T arch/arm/xen.lds -N prelink.o \
>>> ./common/symbols-dummy.o -o ./.xen-syms.0
>>> arm-linux-gnueabihf-ld: prelink.o: in function `create_domUs':
>>> (.init.text+0x13464): undefined reference to `sve_domctl_vl_param'
>>
>> In particular with seeing this: What you copied here is a build with the
>> series applied only up to this patch? I ask because the patch here adds a
>> call only out of create_dom0().
> 
> No I’ve do the changes on top of the serie, I’ve tried it now, only to this patch and it builds correctly,
> It was my mistake to don’t read carefully the error output.
> 
> Anyway I guess this change is not applicable because we don’t have a symbol that is plain 0 for domUs
> to be placed inside create_domUs.

Possible, but would you mind first telling me in which other patch(es) the
further reference(s) are being introduced, so I could take a look without
(again) digging through the entire series?

Jan

