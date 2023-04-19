Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE386E746A
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 09:53:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523222.813075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp2cg-0003Tg-CP; Wed, 19 Apr 2023 07:53:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523222.813075; Wed, 19 Apr 2023 07:53:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp2cg-0003Qu-9K; Wed, 19 Apr 2023 07:53:02 +0000
Received: by outflank-mailman (input) for mailman id 523222;
 Wed, 19 Apr 2023 07:53:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8hvW=AK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pp2cf-0003Qo-1g
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 07:53:01 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2061b.outbound.protection.outlook.com
 [2a01:111:f400:fe12::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 336371d9-de87-11ed-8611-37d641c3527e;
 Wed, 19 Apr 2023 09:52:58 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7637.eurprd04.prod.outlook.com (2603:10a6:20b:29d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.20; Wed, 19 Apr
 2023 07:52:56 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 07:52:56 +0000
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
X-Inumbo-ID: 336371d9-de87-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KAgt9hFV/eVn3+fRs+I+G5h9z8SQ9PUQhvzIpPo25Wt2vJ44uo/XOfMQSolX6mGmNorV2q7K8e3Vq/fvCZ7XCKEffJk/m2ajynkM1khL/ECSrilm/vSkvfZsbiEp7euKJKGSYDbPCuCfV7ZEYJd/ZddIlixY4VJhFSV7UptHpeRfLmC4As8X44ONz1lkKs0XiTsh5E2TMB62GwIdrpbilTRu/g+ggmoS4iog8HBNjOHV2+m/tHpFlSP6sKevaRXzCSZqYy2Uaq8WuL1lsfRfMrKxeGe2xtOtObWaCdtGunkSRhGxwPwKbfexG7iGCVOIBG/7r8hxwEpIsMOqwlgzTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ce29GVfstlPFdACrx7tHmvpcZrNeT7vhdJdgK7GM+fg=;
 b=P/tVAephZybm2a2JkgAAA2Yf2pMD/JIa5w3XMhgki9e4BO6C/Hi/Q3QUXXx7JhiVvOJtA19HJLr6lW+nVa+vJHL7B6ehNiEcOkkgP+fZlSn7boqxAQyT6Mrayk2qD7nwb3vqvk5OAb5LWbxh40mn+iymzk0RgG8C8CZbS22c8IkQz9TtO3Cpbqite+KT5atOGZ3vq6OCfNw/wjk/d3tPm+xS24efwdP3YtlmclkKB3zsr+JXSz1aGB3VT+6JTmoqLyD16TwCl9cJcVC/xXbdc8oC/uzfeeXNANm6EOpMOFUz8ycpvc0IHBNozZuIbsLaObQF7UjZnHwiDmJbfyGZxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ce29GVfstlPFdACrx7tHmvpcZrNeT7vhdJdgK7GM+fg=;
 b=n+BDrI5haKLNKLXn1v+C11BTXYeEU6/NHlomMEUfzwkezyejb6pHNzO6mxrMM5ADaernyTrC7ThO6U5LUYWlpKAycSHY8nAxuU244R2klZ62lWu4go9eC0ODIGW8LFDy6cAzr765CBvin+ieLjQzRFoD+foOH9v1863n6r5RK5aRKcoeaCgUber0c20/jo4AF6agAKrD1o82YNenVS3os+cyKcs0NewzNbV0IhxhD+XSXWFdZELcGSK8w5lv8/SYr3TweUb33chmywkqiARpxwK5STPvTvjENYfVT6BHwnPrISR6TQS6JLNwCbJlIfP96WDOcVczNEvNurophAdHIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5f5b65eb-d1fc-271a-02db-aa347cc708e9@suse.com>
Date: Wed, 19 Apr 2023 09:52:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v5 00/12] SVE feature for arm guests
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Julien Grall <julien@xen.org>, Luca Fancellu <Luca.Fancellu@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Nick Rosbrook <rosbrookn@gmail.com>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Henry Wang <Henry.Wang@arm.com>,
 Community Manager <community.manager@xenproject.org>
References: <20230412094938.2693890-1-luca.fancellu@arm.com>
 <08BE4F94-C4B5-4B05-AD92-61C5C5D24F39@arm.com>
 <bdb1b5e3-c3d9-1c39-f7f7-8f48157ba7b3@xen.org>
 <4cbaaf12-bd11-ca04-eed1-f8848290a692@suse.com>
 <C21BD176-AD46-4379-947F-4271D3EE05A1@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <C21BD176-AD46-4379-947F-4271D3EE05A1@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0265.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7637:EE_
X-MS-Office365-Filtering-Correlation-Id: 22ccf7c6-f2b6-42e0-f2a8-08db40ab15ed
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ssi9xMrasnuZMTnf2JMGyLtY+S69X4jsNEv1b5/8s3PzJAci0JpRHPbZHHBNGyjpLU0Xw8/yM/3XRlKY9EbDgE+dEHdrMOTUaPH+R7DjysN2tHXbGXWzrxhCXNNiFXIZvKaL/i5mdhy2ueufog5C9PIU5T9RYc2QWirb3P9geV30uQF3ICw5eokJdqTUPczPP/hPkQQdHi5qO8LavTf/dZKHAspTQtdb6WA3NCu/VBvFJxU7W5iW2FClsuSJzdFrIUzLlxkbvemSpzLcyGmJsof1s+qMtjdXLpFbflq1giBWsx+zG7vnRD+jrFOuULxGgMYfqLzQccgLat0lh8N4eBRJ1FT7Z7ryaPaRuhj9hsAEjlsyDpRaDlsWlUAbFYLADymz1kV8sDJq5gW9xC6BRkW7GUY0IOVioTbdK36kCRdGVxJOcO0zu1imxIj/tIv/gvawsVkNRtDWKtCkhIgNBwodoR9SqbPseLo6dUdWdWkOmOKdACghSegAo4v1df7xzMtax4rC424kiyKd88ltF8x9LtHYDIxWQb2/BZJIIhg5yAMnzaFLG74UhCcvXnuZWbTIm8UBqr2FsY0GY8PGXPqiCDgrWMi805w5VGQfXXoR6Bg17vDuq7xCtiG3PCur83h3YumFGfAh8/Wu+1c/PA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(396003)(376002)(366004)(39860400002)(451199021)(186003)(6916009)(4326008)(54906003)(316002)(66946007)(66476007)(66556008)(478600001)(6486002)(8676002)(8936002)(6666004)(41300700001)(5660300002)(2906002)(7416002)(86362001)(36756003)(31696002)(38100700002)(2616005)(6512007)(26005)(6506007)(53546011)(83380400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UDN3SlR5Q1NOb0VsQkNzZUsyMmFLMUE3VkVINmFiUDUvN2xGSGV0eVJ2Qm1p?=
 =?utf-8?B?ajRCME02UjZsditKa0FCZ2FldHhjb01uMmJsVllkbHFmSTBVd2JqTEt0QWVC?=
 =?utf-8?B?Z3I3UGh3OXFPeTlCd1lxMkgyTXhjZGlGRHpYWWtyZmJtYncyak5CN0FyRkF3?=
 =?utf-8?B?SkV6VC9rbWM4VWcwRzZTcmVMV1YwTTEwUEZGakdhZk84OUViMlAvbmdTaXNx?=
 =?utf-8?B?ZC95TGZTL2pOTzZuQzZ3cVkxcXVSRUNibzJkeVc1c0xiRlRxb2ZiR3RUekd4?=
 =?utf-8?B?akgvR3l0dWxaeXVWVUtHcXRlTVFoemtqUzF4a010UkY4Nnc3ckJrRldmdkdp?=
 =?utf-8?B?OVZyYUNDbHJUeG45Unc2M0YrWFFYT1plaHR5bkx2b0IzQVVKYW4zbG1mM2Ux?=
 =?utf-8?B?bC9oNnZNYmRkVkVTR2tWZGJGaGFwNW03djUwV1F2ZTJDVzJ2RUlLM0NmNng0?=
 =?utf-8?B?K3piemc1S0Y5cWpiUk10MVZacEl2YkxWeTVwTElkYjRzb0U1OFg1TEcwdktq?=
 =?utf-8?B?MmV5R0xVUWdsQkI4RnYxdDJHUE02cWx4WElQQVNYT1I0ajlWazBYOGJzYzlF?=
 =?utf-8?B?c1N1QkdreXQwYUhLNG5rbFMzay9ncG5ZWXJzcVdUMjkyZ1VIU2VyOStEQmtD?=
 =?utf-8?B?OUZNRmI5RlZDTVFrNEQ1d1dHdXpvZzR4QWdCdGFMTm9NdVo5SkZLUkRUdHV2?=
 =?utf-8?B?UTROMFRnQXVXZTY1WXMydVhDcktMQjFDOHNPenlxY1VDUjNlUGRISm8wYzAx?=
 =?utf-8?B?Ym9hR1NSSFovZWRPbXVMTWlYYUk1UVBrdWVlWHBDUDhSQmNlZ2JVdmN1YkFZ?=
 =?utf-8?B?WU5VZy83VGFHakU2Ry96SkpYMmkyNlVWUDFZSGQ5VEdFQ2UzLyt4R1FVYkJm?=
 =?utf-8?B?UHNEQkovUGhXOFh0UEJwdTlvaGZDamJqK3FhOTRyclBFQ1R4VmhpSXVvTkU5?=
 =?utf-8?B?MFpwTmo4RDYyVlMwTHQrVTlnLzQrMW1XbDdlQlBkVldvaGx6bmRMUElEYW1p?=
 =?utf-8?B?UFFaQmQ0TTYxdnJYT3A2SVZmRlUxQkNFVFJGZ3BVaGRnQVpVaUNlVmRCZjJa?=
 =?utf-8?B?bGhvUE1VUzFzM3J6UGhWWkJCNHdFUVhmOWFXelJ6TStQKzhaaEZqNmtMSlhz?=
 =?utf-8?B?dFpTd3lmYWRtTFVwRUNRakJKZUlLUW9ENVdmTnFVR3BBd1hISFB2YXdnK0E3?=
 =?utf-8?B?bHFKSHkrNmVvVVBxbmJCd1NFUVpoZFQzMmExREpQYWZuVVVXcTdsNk5CaVFS?=
 =?utf-8?B?TmxMbzViSkxsK2lkQWZFS3poM0o2RDA0bHZidVRnZThUc21qMVYwd0FBTWVO?=
 =?utf-8?B?Q2JKQkJrbDdjK0RFY3BpYVZzSUdFeVI0RklTcUk4REhCYzY3RGR4TmtlQk85?=
 =?utf-8?B?Zk15WThYbzFEN0tmTld1eFVwSmZyVXNCUGpmUS9VTU5lT0hDa3drZ2g3SDda?=
 =?utf-8?B?MmdOY2pDSUZVdVlMN2JHck5CbTZYN2xRaVJ6a1VRNDFvbmlqVXhpQkU1eDk4?=
 =?utf-8?B?VTJ5THB5U3g4V0E4VTdnVHRJWURIRkJVVVBRamtiUTJjV2FZMmNiNmcvYW9k?=
 =?utf-8?B?ZzFNdTRxdjVpdnd6eXhJQkcvRE9icGxvOXZUdFZWblBnakp0NExxTVJNekNm?=
 =?utf-8?B?aWxuSFVrVE5CYjdyVHpmWHRPcDN3aSt0WWFLZ1pQVWpJT2NHMjEybWNkV0cy?=
 =?utf-8?B?SFkyUTJ3U0hBWSs2VWxpazU0L1pTdlVuTVdlVGxIeXMzVlJpYjk3RW5sRGR1?=
 =?utf-8?B?MVJHK0IxZmxvSUhSTGtVKzBXcHkrZjhoYnVhckZBR3NlMlRUREN3VGlxZ0Vx?=
 =?utf-8?B?U0dBejhWOU1vdXVkWllrMnFHOWlnNnNJWnE0ejhCclh1UHlZUUt4aHdLTmFs?=
 =?utf-8?B?R0YzZjR6dmpRdGpJd0hKZGx4dWtTU2hmT1l6ZEpjNERxT3Q3WE5DYVNtamlY?=
 =?utf-8?B?R1dFbWVvMHZDNm4ra0crUUIrSjk1TVpvYW44UlhmM3FHV1E4cWF6dDlyMFVI?=
 =?utf-8?B?MHZ6cklZK3VLTkNqYUYrT0NiemxJU1EwbVdEeHlqTEZvb2hyeElXand0Y0tL?=
 =?utf-8?B?MlNoYkpZZ2dHUmx2cGtzTGNiTXJXYXoxVFhzSnZjeHhybm5UYzNSeGx0Y2tk?=
 =?utf-8?Q?Gpn0/oopX5qkMB8tYF02Vt0ri?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22ccf7c6-f2b6-42e0-f2a8-08db40ab15ed
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 07:52:55.6404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2tTJho0KkQkpRisuaMp6bwEXc9YwE11+LKrTOZR49bEdvlrYhTf2GyB43mZSXU9qcJOE8Te39ahLum0kMyjxww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7637

On 19.04.2023 09:31, Bertrand Marquis wrote:
> Hi Jan,
> 
>> On 19 Apr 2023, at 08:28, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 18.04.2023 16:25, Julien Grall wrote:
>>> On 18/04/2023 14:13, Bertrand Marquis wrote:
>>>> On this serie I would like to open a discussion on how to handle the vector size
>>>> and the corresponding command line / configuration / device tree parameters.
>>>>
>>>> In general the user must either give a vector size it wants or has a solution to
>>>> just request the maximum supported size.
>>>>
>>>> In the current implementation if a size bigger than the supported one is provided:
>>>> - we silently disable SVE for dom0
>>>> - we silently disable SVE for dom0less
>>>> - we do not create a guest when done through tools
>>>>
>>>> This is not completely coherent and i think we should aim for a coherent behaviour
>>>> unless we have arguments for this status.
>>>
>>> +1.
>>>
>>>> Is there any good reason to silently disable for Dom0 and dom0less only ?
>>>>
>>>> I see some possible solutions here:
>>>>
>>>> - modify parameter behaviour to use the supported size if parameter is bigger than
>>>> it. This would at least keep SVE enabled if a VM depends on it and could simplify
>>>> some of the handling by using 2048 to use the maximum supported size.
>>>
>>> My concern with this approach and the third one is the user may take 
>>> some time to realize the problem in the xl.cfg. So...
>>>
>>>>
>>>> - coherently stop if the parameter value is not supported (including if sve is
>>>> not supported)
>>>
>>> ... this is my preferred approach because it would be clear that the 
>>> value passed to Xen is bogus.
>>
>> I did say earlier on that this comes with its own downside of preventing
>> boot to complete for no real reason. It's all Arm code, so you're fine
>> to ignore me, but in similar situations elsewhere (sorry, don't recall a
>> concrete example off the top of my head) we've aimed to allow the system
>> to boot, for the admin to then take corrective action if/as needed.
> 
> But a guest depending on the feature will just crash later when booting.
> This is making the assumption that guests are all able to properly adapt
> to different hardware possibilities. 
> This might be the case when you have a full Linux but if you consider an
> embedded use case, if something is activated due to command line parameters
> or configuration ones, it should not be expected that those are ignored I think.
> 
> There are definitely 2 different needs here, maybe we need to have something
> like a "strict" switch to allow both use cases ?

Possibly. Yet along what I've said before - would you then also mean that to
fail boot upon encountering entirely unknown command line options?

Jan

