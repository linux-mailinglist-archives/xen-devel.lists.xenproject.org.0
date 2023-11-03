Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D92E97E032D
	for <lists+xen-devel@lfdr.de>; Fri,  3 Nov 2023 13:51:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627151.978055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qytdy-0007od-VP; Fri, 03 Nov 2023 12:51:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627151.978055; Fri, 03 Nov 2023 12:51:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qytdy-0007mZ-SX; Fri, 03 Nov 2023 12:51:22 +0000
Received: by outflank-mailman (input) for mailman id 627151;
 Fri, 03 Nov 2023 12:51:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zopV=GQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qytdw-0007mP-SQ
 for xen-devel@lists.xenproject.org; Fri, 03 Nov 2023 12:51:21 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20614.outbound.protection.outlook.com
 [2a01:111:f400:fe16::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae8a94f4-7a47-11ee-9b0e-b553b5be7939;
 Fri, 03 Nov 2023 13:51:18 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8269.eurprd04.prod.outlook.com (2603:10a6:102:1c4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19; Fri, 3 Nov
 2023 12:51:16 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.019; Fri, 3 Nov 2023
 12:51:16 +0000
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
X-Inumbo-ID: ae8a94f4-7a47-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nf6JNwdhffJXiaz2pTj7yHVFH6wxq7zweObUpga949c8Sp8CQg4gewWPpgIQGOuwsLdcYgtm0PPZYqMQGQinIrge8hiI1HS6L/umekHjwoXmbfeTx7mGHXg91BC4LQoAOmOuVTUCtTv0Kt9P1ZZj3UuGuyachU3RIBCeCFrog04yW4GS2nvQ9trxY7zy1Q09Hdb0sNmtzJ4PYZ5fSxiDicRu4LMcmAX4wqqfH1vvdsi+0gwF9Snm4Hb6a9tUJcUqVU5P1f9Itv9o5hyEb3RvQ1leSomQ63agD2BwV3fGQBew0c/+DWZr1MdgE4/wKiQI/VY8VSYCDjV+iFbScu282Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qGzGem3z0ZFDtL5rxeh0XSvIPLjEeOCyiB4G39LHwr4=;
 b=c5TOeBaiC1fMovqMrn0uR5mMooFQtaz44BVW4sGC57/Xc8V65hPjacGQyzANG7Uv+Xmq4xkyogOnM99fUfuqOV7g7H14H++yhS1rCq9ucrBOfvD5gVm6Jli3M92eblrLUt5BSvdaNUK3taMX8u7pP0NmLHXaHkOePwtr3vl5uCzX6Op//moiaM2tlLGWQLFHNOHdu0/zWdgPjxQGjk3Qklxl7AStTsd4DiI4RLQmOh5FQj6XaJuRCsDU2YulN8ay5J6ePdgB1VztAcoYx5GYAhm5rkHH1/4NRNXw+A4q6NPqcz9llkJxsNzOsKHDGJYTlevf+zh09Jz0N3hVLjXskA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qGzGem3z0ZFDtL5rxeh0XSvIPLjEeOCyiB4G39LHwr4=;
 b=fmXMsa+JYcPs9zlEGqQyXRQuMZwahQhZoR7Bof8B6hANi0Ud710G6N+qpVkgoRkIRHd5s3geWEl7wVeseSIDjXsonANsIezqg5cL6jcYteggNjf54ln3r2cNpDEQJxKx/afxJS+8QIfiH0K/aOvCgCG9/rAcA0h9PtU79Uq5nsZBb8vjfUoeehI7Yc8Iye9bEZODgnbps1ArCNyos+29t+kBeZfenYfvAX+tcYVDxKZikigYMrs7cgKBPXBUZ+RjITXTUFntx7HSe05ncAOb2nV/8g/Ijvd9UR3hLF3QAM8uuAFc0v2qIYwPVoIE+GgNZmVwi/SoqWi8Ohv/U09E9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <869b790e-91c1-f416-585e-2c14eb4a5087@suse.com>
Date: Fri, 3 Nov 2023 13:51:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2] x86/x2apic: introduce a mixed physical/cluster mode
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Henry Wang <Henry.Wang@arm.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20231031145259.77199-1-roger.pau@citrix.com>
 <e6ec9635-4856-6f3b-88f6-d1baddad4741@suse.com> <ZUTsCjVYXQzJVVJi@macbook>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZUTsCjVYXQzJVVJi@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0083.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8269:EE_
X-MS-Office365-Filtering-Correlation-Id: 286ce3a4-3d18-48fb-1478-08dbdc6b9115
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NAiHAoJkL5vwXwx1LNBqX98huE5ucuukx3j9TygI1Yu3hvlMfut5v27aII0qgycRyj7GkugHmkbHPpqhsduez37FyAhAACzgFDorN9Vn4vu/pBKOArf/qmeRFthWIoMyLtpNMfMj4palU//FEs0b6n5iy72Y+TqcEe/fURCw6z1CACDovoyJdCck6itluWnEC89IfdO1hFoKvEyEu2q497AIMT/CIASB3TEQBC27c0ChBUrKsmwW3A2Q/vcfMUHIY88+3YLd9fJhEUkQgpE0JSfdbHdE5on02JjlKNyjDilXsD+Sh2prk8YQ2uOQec6Akka2bgXjVKHEezu2Rneh1ZNIdTyC+EoZd0ahRDqLeAeWmRS6UC6Yr9eU0rcWqUrFJGpK3DypjApTq4ifIu/HtCzeMbPTFEx7VpKc93Y1LcttZESNtTwPEto7arsu4IfwbL7/os1Am70eiACVXj1bUKY2eEEvk7RGbJybpQx5qORs+ISCPIcAUAYomJnYsf5/t7oebZKaxP84EnzkjxhQcXXqSyiYhekAMoFLDBDDJ+nV7isA5J8i93Q83v3oKNBi7fLCA8RSZ4dmQxF42TRDm2s8hjmGsKtdfVgG4qf2P9b1lxT4Uo6GQ1tEHGsOPyi2Q7VxG/lTYZBIGyCqPER6MRS+x8KEQjnAU1PA8THDeeLwgzK6lm21SZ3ubTZVu5Ei
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(346002)(136003)(396003)(366004)(230273577357003)(230922051799003)(230173577357003)(186009)(1800799009)(451199024)(64100799003)(86362001)(6666004)(38100700002)(6486002)(6512007)(36756003)(6506007)(478600001)(53546011)(31696002)(2906002)(2616005)(31686004)(6916009)(54906003)(66476007)(66556008)(66946007)(316002)(26005)(5660300002)(8936002)(8676002)(4326008)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzViVEJPbzNnUWhrNmxYbmJxZ3J3RVRPRHUzdW5vTnFKN1p3RXllTGpoS2lw?=
 =?utf-8?B?R3VyTW1leFY5U241ZGprWVI0WWJXZnY5Rkp0bDhNM0dCZTB4N1F4N3RoQ3JP?=
 =?utf-8?B?TU94cGZkeldNVVRMcmNrczJubnFqNVpDQWZBUlE5WUxUZmJqanBIa0RrNlZ1?=
 =?utf-8?B?WnNWTHlMcXNaanZKRmxhb2IrNzIxNTExVzIzOHJ6NmtjWnZ0SHEwcHY5ZVpm?=
 =?utf-8?B?VWJ6V1dHdlZzSi9iRExKMjNYakNtOWU5OTUrN0VzOGMzU3VCTnJGcVdCR200?=
 =?utf-8?B?RHIzZnQvL2ZxelRHbTFnR0lTcWM5OFlScS9pNmpDdjgrVDFZbDBha2FGNTk3?=
 =?utf-8?B?RmVPNzJyN0N6NTdLTGVrVHI4Nm9HUzAwWnNuVk1jdFUrZkxQUmN4V2dTRGFJ?=
 =?utf-8?B?UkFtWjVTM2JJSi9pR29TRDJYSThuWDEvZW1NN0dPZVRoaVljSGU4TlNLRE1y?=
 =?utf-8?B?QmJneVhYbUp3Zng4SHprdFdMc3hKamdXb2NnVWZnZWNHY3QrYXJSMDI1ZXVt?=
 =?utf-8?B?NDIvWEJzVzhCZ1lKL0ZJWlBpdlVyZlc5VVBHd3FMdlN2S1d6aTZaWDFRR1px?=
 =?utf-8?B?SHVqTEpsV3FzSEQ0UmtYZnphWVFPak51UHo3V0hGMU5RMDQxd3JMT2JZMlRL?=
 =?utf-8?B?aDZObU5XdnVraGZ5V0NORU5waU1ZaG9PUFZ6MnZpcVAzQkdmUG9jc1ZEeVJR?=
 =?utf-8?B?bFE0YXh6ZVJoVVM3Nno3dzNkcXRZYld0VjBnVWFqNjE1ZlNTUDYrdlJMSlpm?=
 =?utf-8?B?UllFaUl0dFJyVTVJdGZmM1dqOXBJU3k0Zy9WVDJBczNaVG5Od0RZaFV6MG9r?=
 =?utf-8?B?ZlJ5Ukh0MEd4V3dTMVo2Z0xLbTNvdVEyZnRKc09DL0xJMktYVlVKaTNOTHdN?=
 =?utf-8?B?UUMwTVhKTDNUOGMvcUswdTRxZ1Z0b2JCN1YzVURvckpTcGZqNTN2VmdHU0kx?=
 =?utf-8?B?NTJuUERjVitwWjdBdGNiT2sraWIvL25udyt0MlhPQ2tOa3BmRGpxQmJVWVhH?=
 =?utf-8?B?ZXRqeDFVOXZ4djBsS2pkSFFvY1hXS3hUaXNrS3ptdkxzOWJNaitpV0ZvWXQr?=
 =?utf-8?B?VktrRzlDUDZJdkJ6Yk5JY0l5VGxRdnhMRndwR1ZoRWRQS2dtQW5WWENkeHhY?=
 =?utf-8?B?SXh5Z1o3bmY2c2loNXF5aURBVzk2Q1hjbTZYWU1JZk05Q1R6OCtWS3BQcGJh?=
 =?utf-8?B?Wk1NMk12MUZCbEdaTWtZZnZwMEdxYXpwUkVsNlRxaDA5VGp1UjBIaEU4TU1n?=
 =?utf-8?B?WUV5dEU3WXA1cG94UVZiRkRIM0tXSmZIT0xXbjRzSVZxdkVvYno0a0ZiOCt3?=
 =?utf-8?B?bCt3MEdqYWNYcHdsblFOa084RFpKWmxnL3kxdEFWZ01iKzdFTU50Q0dZOGdp?=
 =?utf-8?B?S0YxZmwxcTM2Y0NweUxNVURBVkJsdHRVQUNneEVXaUdqTWE2SXk4NXJSNE05?=
 =?utf-8?B?dEhDcU1zU21rY1ZVQTd4YVdJeTFicUZzbFoySFRwRFovc09McHpaRUdLejVq?=
 =?utf-8?B?aVFkTUlhYzhHc2NDUk8wK0Q1WkVKOXFER2RyeDY0TUJrR2FnV1VXMEJnYlBY?=
 =?utf-8?B?N3F5NmhpZ25RSnoremRaaVppTER1Ui9Rclp4eC9Nend3TEV2WWNkaFZVMEtm?=
 =?utf-8?B?elJGK094VVpSL2U1UW9LNEN4eXNrV250U0ZxcXdZOUVBNjdQNCtyT21VRDhM?=
 =?utf-8?B?OU9YMVM3MDZESS9MbEtBVVJKZStSYmlQSmNBSGhoSWc0MElDeDFRRk1Vb1M3?=
 =?utf-8?B?OTJnWExoNUwxMk5BdHVXdnJhSnVoOGh3OXdHTnFldlhkMTR0MXVCSTE3WVVv?=
 =?utf-8?B?Uys4REtISHlQY0VXUkdwcmxQRHZ2NHIxNFVBUVZRUWdXZTFCYWdmSzZoS3Fu?=
 =?utf-8?B?NFp4dWxSMVd4bmxNVjBtanVlRVUrazM0S3JoOS9lcHRpeFJXaEQ1ZVJ1K1dk?=
 =?utf-8?B?WnQrWm9PQmlseTJZbkM2UnZla1poTWI0a21icTBSVXlnaFVkQmhSVUw2SlQr?=
 =?utf-8?B?aDgwRWxQbzIrRWxoVXlHMG12ZW5oejFQSkpNYm5DZ3kvdEM1V3lWaVhhRFpr?=
 =?utf-8?B?QjdWVDcxVTVXQjI0enFqMUNJTS9DL2ViMmNQSnJCS0ZSMlpaLy9lNzhIN0t2?=
 =?utf-8?Q?YbTRPQku84d1eymijHedcnGAF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 286ce3a4-3d18-48fb-1478-08dbdc6b9115
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2023 12:51:16.0686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SR4o54AJJA4+NHczirJXax2DWMZ5GmT1TMJP91P64r7/S4q7EO/MQpTETEYFElRiHZal+e5FG/DnyKxNtqETjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8269

On 03.11.2023 13:48, Roger Pau Monné wrote:
> On Thu, Nov 02, 2023 at 02:38:09PM +0100, Jan Beulich wrote:
>> On 31.10.2023 15:52, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/genapic/x2apic.c
>>> +++ b/xen/arch/x86/genapic/x2apic.c
>>> @@ -180,6 +180,29 @@ static const struct genapic __initconstrel apic_x2apic_cluster = {
>>>      .send_IPI_self = send_IPI_self_x2apic
>>>  };
>>>  
>>> +/*
>>> + * Mixed x2APIC mode: use physical for external (device) interrupts, and
>>> + * cluster for inter processor interrupts.  Such mode has the benefits of not
>>> + * sharing the vector space with all CPUs on the cluster, while still allowing
>>> + * IPIs to be more efficiently delivered by not having to perform an ICR write
>>> + * for each target CPU.
>>> + */
>>> +static const struct genapic __initconstrel apic_x2apic_mixed = {
>>> +    APIC_INIT("x2apic_mixed", NULL),
>>> +    /*
>>> +     * NB: IPIs use the send_IPI_{mask,self} hooks only, other fields are
>>> +     * exclusively used by external interrupts and hence are set to use
>>> +     * Physical destination mode handlers.
>>> +     */
>>> +    .int_delivery_mode = dest_Fixed,
>>> +    .int_dest_mode = 0 /* physical delivery */,
>>> +    .init_apic_ldr = init_apic_ldr_x2apic_cluster,
>>> +    .vector_allocation_cpumask = vector_allocation_cpumask_phys,
>>> +    .cpu_mask_to_apicid = cpu_mask_to_apicid_phys,
>>> +    .send_IPI_mask = send_IPI_mask_x2apic_cluster,
>>> +    .send_IPI_self = send_IPI_self_x2apic
>>> +};
>>
>> I'm afraid the comment is still misleading in one respect: The .init_apic_ldr
>> hook is also set to its Clustered mode handler (and validly so). As before my
>> suggestion would be to leverage that we're using dedicated initializers here
>> and have a Physical mode portion and a Clustered mode one, each clarifying in
>> a brief leading comment where/how the handlers are used.
> 
> I've split this as:
> 
> /*
>  * Mixed x2APIC mode: use physical for external (device) interrupts, and
>  * cluster for inter processor interrupts.  Such mode has the benefits of not
>  * sharing the vector space with all CPUs on the cluster, while still allowing
>  * IPIs to be more efficiently delivered by not having to perform an ICR write
>  * for each target CPU.
>  */
> static const struct genapic __initconstrel apic_x2apic_mixed = {
>     APIC_INIT("x2apic_mixed", NULL),
>     /*
>      * The following fields are exclusively used by external interrupts and
>      * hence are set to use Physical destination mode handlers.
>      */
>     .int_delivery_mode = dest_Fixed,
>     .int_dest_mode = 0 /* physical delivery */,
>     .vector_allocation_cpumask = vector_allocation_cpumask_phys,
>     .cpu_mask_to_apicid = cpu_mask_to_apicid_phys,
>     /*
>      * The following fields are exclusively used by IPIs and hence are set to
>      * use Cluster Logical destination mode handlers.  Note that init_apic_ldr
>      * is not used by IPIs,

Not quite correct, I think: This is setting up the receive side of the IPIs
(iirc LDR needs to be set for logical delivery mode to be usable). Beyond
that lgtm, fwiw.

Jan

> but the per-CPU fields it initializes are only used
>      * by the IPI hooks.
>      */
>     .init_apic_ldr = init_apic_ldr_x2apic_cluster,
>     .send_IPI_mask = send_IPI_mask_x2apic_cluster,
>     .send_IPI_self = send_IPI_self_x2apic
> };
> 
> Pending whether the usage of some of the fields in connect_bsp_APIC()
> can be removed.
> 
> Thanks, Roger.


