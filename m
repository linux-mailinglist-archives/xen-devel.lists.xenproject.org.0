Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E784EAB6E
	for <lists+xen-devel@lfdr.de>; Tue, 29 Mar 2022 12:37:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295775.503447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZ9EB-0000EG-TT; Tue, 29 Mar 2022 10:37:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295775.503447; Tue, 29 Mar 2022 10:37:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZ9EB-0000BF-Q8; Tue, 29 Mar 2022 10:37:31 +0000
Received: by outflank-mailman (input) for mailman id 295775;
 Tue, 29 Mar 2022 10:37:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kdRh=UI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nZ9EA-0000B9-Lx
 for xen-devel@lists.xenproject.org; Tue, 29 Mar 2022 10:37:30 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b57575e-af4c-11ec-8fbc-03012f2f19d4;
 Tue, 29 Mar 2022 12:37:29 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2172.outbound.protection.outlook.com [104.47.17.172]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-NUiCiBT4Mt-s93LiDB0L9Q-1; Tue, 29 Mar 2022 12:37:27 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DBBPR04MB7705.eurprd04.prod.outlook.com (2603:10a6:10:209::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.22; Tue, 29 Mar
 2022 10:37:25 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%5]) with mapi id 15.20.5102.023; Tue, 29 Mar 2022
 10:37:25 +0000
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
X-Inumbo-ID: 3b57575e-af4c-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648550248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=39ONaxOkD0qny6Fxuyogw1JKeMfuDg3BuyR738VenmQ=;
	b=QITU0wGuxLauy+QzTZo9Iy8TTcVXMdqqWCixarZM3FPPwDrT8STfAP3EemHr8NsGC360ma
	+VZvvODi79dgkMqArdhdp4r29FNmHi58HT3zHr6Y3k5qmMJFO98F/rAhIB3GDRU25n/WIz
	gMER195KLmDZPeaiCyL0+nEHvz5M600=
X-MC-Unique: NUiCiBT4Mt-s93LiDB0L9Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GLMsHg0V+02M7t/KA1q+A3K+LSswpGwFMThXf3ApiJg2nSbAvTFirO2Jxtc933MArq7vlKZrcqAJqOU0IWc0ZJrsqmBeK3QO1U8GxD4QRCMYI4NZaVY1B/uqmvcOGf8Ve3HB6pGQLKT/Sg2BW6bcQp0pYCsjiBc9nABOYLva9uT+P5mzswI13egSuDJvJCl7MU7WQtXWQjevG+Vd768DjLEdQCbWGzT7cqzsxd90zbgvZ6D4w1YFONHueuNkW8nY/V92rhNfANKNlF8vV6EGt+z9jDSv22SDIZd3DF9p8uaHzNrcRVpGPb+arHOurk3ciJ+pkUZloMsL+ZRXkWCoJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=39ONaxOkD0qny6Fxuyogw1JKeMfuDg3BuyR738VenmQ=;
 b=d0edbJB/ugE8BjG/U3YskOZttsdfKzIgyhSDCvl3OpMZXPxkHFb5OwwdO5sm+XX2tUMJgphN4A1V+tNRQ7V9LoTZRfVprCNH6+BWr1hn7ncoMNkl3DsIcmzj0sZNgiA44wNxVREEdIevmwKBYHmakaPRTKds39xwdH+X9rN0szL8SaFO7u7W4Xj2BVCjiWVVk5dB2vO+XXOxBq+OQG8rsbExw6zyxHWnBhAXpdK8gw54j7T+42UmSP2ArqtTWAzfdkYaD60xRsez/uOpNKpgSmcEHdtce52JA7mt3kqjqgc0Tu/oEPrD8OC5kfd2yVdWwhV348JYz7AjwIXag663Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <293aa4e4-ac6b-2446-ea78-986014993e89@suse.com>
Date: Tue, 29 Mar 2022 12:37:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/2] xen: Populate xen.lds.h and make use of its macros
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
References: <20220322080233.53134-1-michal.orzel@arm.com>
 <20220322080233.53134-3-michal.orzel@arm.com>
 <2940b4c8-5d44-695e-4550-0a32c3a4c053@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2940b4c8-5d44-695e-4550-0a32c3a4c053@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0201CA0021.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::31) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8a6e9c6-0a7d-4d20-fc63-08da11701d8f
X-MS-TrafficTypeDiagnostic: DBBPR04MB7705:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR04MB770585076684708006BC0136B31E9@DBBPR04MB7705.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0kx7awED/80sIvtV6tDKp9HrwQ87DThBgMDpKiKM7KnkpRosQR3HCTIc5LUMt/otED738AxmP2rE1aAWYogDhpimw+M/XfD0WvTyypxBtDhr4VPg3NEg5SDgKVZkvn59gx2MrKguel5VYdKTMsSseHX42VqzilGgOlsRDRd88sLlNuFq2MW+CWefvq1/puzJuT4WQMJl1yc11v4oU9jWBzEyhsZNFvIn7T4AAcQMIlaWY+2IgEx/5m1IwEMqPNHJYCmckaXY0GLNzKQdHukwz9vOschan4hkq6bzRudy23iAhluzm1dP4Qa2pSdn0U9awACZMUIEMDFrH6Cg8GJ7TOj7/Wn+fQ0MUM5+Ps9bcvWJD28Nz52dcTqS5JZxgLQdOO7JJ46F2iOZ39O20q9+x0yg2llw3jBZdJ3d6ibwrYGRDnzAox44C0uTtp/WrmUeHZNpInrmv9x783K0LNdjmWibEh4/tVl7fX5HKQNPJJlz2HbgC3klHSqPxUE+bC9FXAOwejoblNrn2Vm4qyN3ZO8IDB/IqTAtYWc3uZ4zDjhHREKU6WQ7QijS7b5UlenL7wOYi0EzwXVk146zW3HBOOSzacTbT2Q0ddhorvXNKbqa3so5FYgwfvL9b3bfvEkz/VEqw4+nAdNeKoCu+cEOlIkHCgv0zi4dfZ29X3SYsK8w6qFVvdlGd1AsSxJuQ/BV84hJB89MWJNKSFDb+QrTfaaBwKBxYsTOQQAVgE9OC3IpbAja96m40JKiD5a7q5yE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66476007)(508600001)(66556008)(83380400001)(53546011)(54906003)(5660300002)(6506007)(86362001)(6486002)(31696002)(6916009)(6512007)(2906002)(26005)(316002)(4326008)(2616005)(8676002)(186003)(66946007)(8936002)(36756003)(38100700002)(7416002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eE8zY3hGbEJSbXJoZ0lEMEc4MjZISGI0bWlmbjV4a2ZwN1ZPazlGT0R5L0Q2?=
 =?utf-8?B?K2RzOHNBZ3NocXNmbHNjUVI4QlJFV3ZiUi9LL2s1VG1WMS8yZmlVU0wvZXlW?=
 =?utf-8?B?d1QzR2xxTW1aS2hpRnFrcTF2eWFzd3lCc1RiWlUrTUtMdU9TUStKMzN2eUVB?=
 =?utf-8?B?YnBIMTdKNkloYVBoU1JQR1ZzS2ZtMCsxRnVQT2VKYjBqVjUzV1dWVGxVQUtt?=
 =?utf-8?B?ZVB4OTF4T0JybGxpaXBWbW1OaXY2RS9jZHVGQUxTZGhHUnE5UTdLZ1BWOTBm?=
 =?utf-8?B?VFRBK0tUcmUvdGVyeGF5Sm1wZUxnN283WjkyOFd4c28wWXhhWVZhejh5azZp?=
 =?utf-8?B?ZHBvZW9ZT01GQ3dqZEZnNWZoNmVydWFmdXZiMXpPczhkYjc0WFJZZ2pkZmhq?=
 =?utf-8?B?RHJtVTFtaGUrQSs2cUVHaWViRHJ6RVl0dkJWRVVRUWlLdEZBamx2VGFhNHlV?=
 =?utf-8?B?M2JzNEVxSGZoVmRCVTNDRVU0aEc2dy80SDZWbmlxSmZ0VEV0MXBld3JkV2ph?=
 =?utf-8?B?bEV6S3haUTJCWVE3ZE84RDdwcjB5WkxpeDNZeFJyNkVMUnFjL1FLcDV5UUdZ?=
 =?utf-8?B?UCtRME1JMmlVYmJ6Z1QrQlVPU0dFRnFoOTUwUENQMDZyc29wUFgzT042SWZx?=
 =?utf-8?B?aGR5RHRLWE5uMG1SQ2F5NnJ0emtQbDlvTHI0ZGx6NzV1Ym9LVmM1MVRORlFC?=
 =?utf-8?B?Y09qT1VBZVRnRzhtcnN1Smo3WkRrSDVyNmhRZnJBZUlMOWU5VWx1TU5sVVVU?=
 =?utf-8?B?MzBoa3FaS09QR2tRV2VBMnJpZGpXTlpNcjA3bHlraklPZ3RPQm04RlJ1WTVQ?=
 =?utf-8?B?QjUzTTdUaktBUUMzejUzaElGdFVSRzNYTUVFUnFycXVHUXloVlU2WEQvOFJu?=
 =?utf-8?B?VlJscTdoenQwbHJTSnU1S2pqSEFqWG5ZK1lIY003M3RxUUd5aFlPb01LS2ph?=
 =?utf-8?B?dy9MbFI0YzFQSFVqUXJENmFod1p3QnRud0xKS1hpYkJjYjlTOHRzVGUvelZ6?=
 =?utf-8?B?S2pvUXdvWmQrMzNsYllkTklzVE9ybEJqekQ3aHI2aUlET0xOM3N6TUNlZmwy?=
 =?utf-8?B?TERFZjVaQ2hyenFlQkorcWRqRHh3bllrNHFvUVZqTVBndGE2cEFVTUZxWGNB?=
 =?utf-8?B?ajNCSDlMK2FlS3ZrU2w4MThBcU9oNE90VXIzbmNBdnNQOHpZT3UwdzcrZGNR?=
 =?utf-8?B?ODB4Y0txbzNjeVhuRWNqRmxoeVdrQW9DYjV5NFlya2FZS1YxNUpTekhjV1RZ?=
 =?utf-8?B?ak9uNHFHZkNKTzF3Nzd6VEhCUEVaMnRUamxldGpEY2VJTXZHZ0tac3JEeHY4?=
 =?utf-8?B?T1BORFNwcHRybitTSjhmMXpETlBaMG1wRTJzeFgxaDVmeWxyWHFtZERwMkxG?=
 =?utf-8?B?bWdzdWNZa0lXQXlKM3dSTHR2ZmlFKy91RVNIaEJncHc2RWlZMzBySGcwc0pB?=
 =?utf-8?B?OGpsalRUVHVXeS9HSExXdTVYLzU1UVVSVzg2TGJ6elRrV0V2THQxYlk0VGE2?=
 =?utf-8?B?Vmo4b2RadGlJYW1FNlh5UjlSb09RUUNYdHoyK0txclhQNGFjYXdvRmhtcU1s?=
 =?utf-8?B?OXFyZW5YcFJJeXdpcHRWOU9QZXU4WllLMzA2T05USEtsSkxrQlFhTmlRSXJV?=
 =?utf-8?B?MlFJN1puVEpNSHVzSTlidytwbDJyTUlEM0lFNEJQRzRoWlh1eUF6TWYxMEFu?=
 =?utf-8?B?clUrUUhUYThDenVSb0srdVRKQytyMFZTam1SOFFoNW9aT2NUZUtwK1JYZEo1?=
 =?utf-8?B?Qy9JQWxaTmpSaTArQ1dFVCs3OUtJQkJVbFEyb2tJRkZobDhqelhyRkd4ZCtS?=
 =?utf-8?B?S3kyeWM2UDlRZEIrMGhxWWJSOHVMWWFpRzAwSUJ0ZXRVUjBQN3Z1QjVnVnY5?=
 =?utf-8?B?UnBvV3pkSW5rK3pHMUQzQW0zM05UQStNU0FUZ0R4YVh3b3RaS0lrZ09FQjBY?=
 =?utf-8?B?L0hUaDU5ZDVUREl4d3NJcW80TXUwVFI3VWZ2QWNxYXZaK0VhNElQQWllRnl2?=
 =?utf-8?B?K1IydlR4NEgwNFhIdEI4WDhhM3g5VWVHZVhGYk8wRWZvZVRMYTZvc01pYlJE?=
 =?utf-8?B?MkdhZUh4U1o5RGJPU0tWZEEwNzB4YStpNkxMbXluakhuTzVSWks4TStyWmcy?=
 =?utf-8?B?b3lJclVNa2lFaHc4bXROMlNFYU5IY1RnOFA3NWV3ZFU5Sko0Z3lZc2lSZWZB?=
 =?utf-8?B?eDdGTnFEL21FcEtnc0psRXE2S3NNajlUUHQ3R2NRVVMrSmxkU3g1U1lSRmQr?=
 =?utf-8?B?SVZHMmJ1Q3FnZkNBQTBGMHl3UlpYUmx0SVZSQXRTWk9wdVZJS3R3VW9BVldN?=
 =?utf-8?B?bDFua2xkWHlkT2JKYjI2M043blVQam5jZ3hTUXkwVXpod1llelpaQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8a6e9c6-0a7d-4d20-fc63-08da11701d8f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 10:37:25.7581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uVVuL3Q3AgeJjNrwx1KA4qiC4FxfELmb6xMmX1JnYiYqijzbBD5c9G/1SECgMSeW7EkD2KD8lkizfhNLFbP0/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7705

On 29.03.2022 11:54, Julien Grall wrote:
> On 22/03/2022 08:02, Michal Orzel wrote:
>> --- a/xen/include/xen/xen.lds.h
>> +++ b/xen/include/xen/xen.lds.h
>> @@ -5,4 +5,104 @@
>>    * Common macros to be used in architecture specific linker scripts.
>>    */
>>   
>> +/* Macros to declare debug sections. */
>> +#ifdef EFI
> 
> AFAIK, we don't define EFI on Arm (just CONFIG_EFI). Yet we do support 
> EFI on arm64.
> 
> As this #ifdef is now in generic code, can you explain how this is meant 
> to be used?

The identifier may now be somewhat misleading, yes - it has always meant
"linking a native EFI (i.e. PE/COFF) binary". The equivalence "EFI binary"
== "EFI support" has long been lost.

>> +/*
>> + * Use the NOLOAD directive, despite currently ignored by (at least) GNU ld
>> + * for PE output, in order to record that we'd prefer these sections to not
>> + * be loaded into memory.
>> + */
>> +#define DECL_DEBUG(x, a) #x ALIGN(a) (NOLOAD) : { *(x) }
>> +#define DECL_DEBUG2(x, y, a) #x ALIGN(a) (NOLOAD) : { *(x) *(y) }
>> +#else
>> +#define DECL_DEBUG(x, a) #x 0 : { *(x) }
>> +#define DECL_DEBUG2(x, y, a) #x 0 : { *(x) *(y) }
>> +#endif
>> +
>> +/* DWARF debug sections. */
>> +#define DWARF_DEBUG_SECTIONS                      \
>> +  DECL_DEBUG(.debug_abbrev, 1)                    \
>> +  DECL_DEBUG2(.debug_info, .gnu.linkonce.wi.*, 1) \
>> +  DECL_DEBUG(.debug_types, 1)                     \
>> +  DECL_DEBUG(.debug_str, 1)                       \
>> +  DECL_DEBUG2(.debug_line, .debug_line.*, 1)      \
>> +  DECL_DEBUG(.debug_line_str, 1)                  \
>> +  DECL_DEBUG(.debug_names, 4)                     \
>> +  DECL_DEBUG(.debug_frame, 4)                     \
>> +  DECL_DEBUG(.debug_loc, 1)                       \
>> +  DECL_DEBUG(.debug_loclists, 4)                  \
>> +  DECL_DEBUG(.debug_macinfo, 1)                   \
>> +  DECL_DEBUG(.debug_macro, 1)                     \
>> +  DECL_DEBUG(.debug_ranges, 8)                    \
>> +  DECL_DEBUG(.debug_rnglists, 4)                  \
>> +  DECL_DEBUG(.debug_addr, 8)                      \
>> +  DECL_DEBUG(.debug_aranges, 1)                   \
>> +  DECL_DEBUG(.debug_pubnames, 1)                  \
>> +  DECL_DEBUG(.debug_pubtypes, 1)
>> +
>> +/* Stabs debug sections. */
>> +#define STABS_DEBUG_SECTIONS                 \
>> +  .stab 0 : { *(.stab) }                     \
>> +  .stabstr 0 : { *(.stabstr) }               \
>> +  .stab.excl 0 : { *(.stab.excl) }           \
>> +  .stab.exclstr 0 : { *(.stab.exclstr) }     \
>> +  .stab.index 0 : { *(.stab.index) }         \
>> +  .stab.indexstr 0 : { *(.stab.indexstr) }
>> +
>> +/*
>> + * Required sections not related to debugging.
>> + *
>> + * LLVM ld also wants .symtab, .strtab, and .shstrtab placed. These look to
>> + * be benign to GNU ld, so we can have them here unconditionally.
>> + */
>> +#define ELF_DETAILS_SECTIONS     \
>> +  .comment 0 : { *(.comment) }   \
> 
> This is a bit confusing. Here you seem to use the section .comment. But...
> 
>> +  .symtab 0 : { *(.symtab) }     \
>> +  .strtab 0 : { *(.strtab) }     \
>> +  .shstrtab 0 : { *(.shstrtab) }
>> +
>> +#ifdef EFI
>> +#define DISCARD_EFI_SECTIONS \
>> +       *(.comment)   \
> 
> ... here you will discard it if EFI is set. Which one take precedence if 
> the caller use both ELF_DETAILS_SECTIONS and DISCARD_EFI_SECTION?

Given the above explanation I think it's clear that only one of the
two may be used at a time: ELF_DETAILS_SECTIONS when linking an ELF
binary and DISCARD_EFI_SECTIONS when linking a PE/COFF binary.

Jan


