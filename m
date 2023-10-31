Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D45017DCA77
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 11:13:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625590.975016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxlk0-0002dS-IY; Tue, 31 Oct 2023 10:12:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625590.975016; Tue, 31 Oct 2023 10:12:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxlk0-0002aE-FT; Tue, 31 Oct 2023 10:12:56 +0000
Received: by outflank-mailman (input) for mailman id 625590;
 Tue, 31 Oct 2023 10:12:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yzb5=GN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qxljz-0002a8-Cn
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 10:12:55 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20610.outbound.protection.outlook.com
 [2a01:111:f400:7d00::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d82a14e-77d6-11ee-9b0e-b553b5be7939;
 Tue, 31 Oct 2023 11:12:53 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU0PR04MB9227.eurprd04.prod.outlook.com (2603:10a6:10:352::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.17; Tue, 31 Oct
 2023 10:12:50 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.016; Tue, 31 Oct 2023
 10:12:50 +0000
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
X-Inumbo-ID: 0d82a14e-77d6-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wy01ypS1EUrSk5LEpr/nD4s4O0qZGbUjhqBsiOmnRMpp6aB4CwRSrvrK9CdWwBTSI6vYZ2Pl4CpnXeidayyJUAy54xK8vUcAu10vNAm2dmvCLje93LSquyaRYRCTQwsAHyqh6+iY7/9BBQvKepcYjtKu/cObnpOWFwcUmStLI6Pgvu1NHGIQpGRj/2sj9NKSbtAtBeGnK1LOGczqJ01ccWXWIqoq55NKGPb4RyUOlhtTyrzd3tpZbvoEFiwcI5+ekYhO/qwETQYWO4hokxpTqIzghCwG/C1KlXamBz+qJ4Rh48rk1y84P9vWxKwhJHWT2DW5iavv1gNlfVgAm2xNnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LZa/JEOQGel2g+jZK1neLxJBnxevcXhAWuaZC84T+Ko=;
 b=i9bvoYID03eaMUHtOfRVIEps0PlGlKtQCjQieUT3qXV3O3T7XqatJZxKgdZYUNMbaWBK9+nnN+9sgOHxA5aHM4ytS1lRJTLV9uhyEEBVBOYvDx99XNOGxfUhCQPuMbSWuqWBUzR3mzCPomJ2YyHzyIDR8Vw6xwk9H+yrvAl+dak6mXYcbXdP0YvnWtpWnoZU+Q4UwOe0bavLwNurC3X/TLmw9ioROF03tYHY7KsL950kj5aglI247R2DP1DKGjOiPLddCK5XFZpFhObdqiNhEsG05qkn+AQYIy4zn55kZyDLumMhsVOed0BC59ArrXee10FP/SFmuJ+H0w3Cx26Zfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LZa/JEOQGel2g+jZK1neLxJBnxevcXhAWuaZC84T+Ko=;
 b=uQ1lK9NeCWjhYW7WOFlYh0uKMCkvVW5MVhRZYoS6akJ0PfzhA1MBMe9uklB4aPHBJ8/M5Ed5A06JHFYPz4YHEs2+8kRQ7lgRIGxrgj6MXid0+Xk9Gipdi7bp4HoFXir4qb2fGSaYZcsHgryN1I5Q0KXG2QGxgalay5vBXQAA9rkYoQwiTILmBEHXO+BfHnKSayMLyTvt2g5umn2ec8HPfWpHDyoT7p0hzVVjwcwCQ1ZkMBr0TZ9Lki8a6nNpMSURBP8krnddSWdsOtFkQPOQ77qN1uIryuAHxYilN+VOTLASs0tHMQrKmhqd396YZmois/8YPPwFG9Pc1h8DVIz71g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7af0ab93-1b49-0b8e-70f8-5bfd8167dbfb@suse.com>
Date: Tue, 31 Oct 2023 11:12:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [RFC PATCH 03/22] x86/msr: always allow a pinned Dom0 to read any
 unknown MSR
Content-Language: en-US
To: Edwin Torok <edwin.torok@cloud.com>
Cc: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
References: <cover.1698261255.git.edwin.torok@cloud.com>
 <4c04e5661688cf1de3e3fd668b0a78b23b6d7b2e.1698261255.git.edwin.torok@cloud.com>
 <ac2eaa4a-36da-9d77-f682-a6bef25e27f0@suse.com>
 <46B60857-CC42-45D6-96E5-04F5CB1C7A7B@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <46B60857-CC42-45D6-96E5-04F5CB1C7A7B@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0125.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU0PR04MB9227:EE_
X-MS-Office365-Filtering-Correlation-Id: b01a71bd-fbfa-41b6-c328-08dbd9f9f02f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	u6iVumyMAuKN+KwSRKbxVNyU1mQy9zX7/spKkB9juIziuHJ7ZEFKQT9PRe/FZzT7+5HcVVnevQep5KZLnVbkH4YYEvLeRrjBFvVE6NccqBF7E8bZMYM6fJd1oen8AUOprIYYT5r0rO83fpLBfDrpKlHQWwK9RZOOxIa62HK3318yhShMgSZPcA1Csy6JwzKFc5YRlmsS/0horSUsjzjJLrz806fEIeer7RInwFCf8m5LBOw52vUV8KpYdqlf8htVU/D2EjEkmuCyhu3DWOo3picKR6lWquw1K5mnJMEFTV5GKdSqwrKkw9eJ1nikJy5b7960CHxLz1ko6CKAz6tNO7K+hhhmHYqxKybNHgfwai6RwrzYa2syZP0lCL+Vv/M9KrQ2tTilFyePWX5TfCO3Xq7sR0ctO4kt4/KlaM4s1R61ygsjV3hp7KC3mAdjVhaWm2GKNMBr2iA7tcYqKeUm/+rM71LtGaI6AsD9T7ASVgaapfD7m61ftnQGuDShLqqQ9l8MUjipaIog4j/5UtiYOP8Q2Lok+8rC+1jctosoQhhGQGXQPnOCTLsREfTbq+/XcFKv5qUr/DpaYkc9ditdB/9kCVqYCbN/0i89Cq8kFRPTCCF1pcWVMQQTQpx+YfwV7fS5pX2AGM6Z+KNn13sRWQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(396003)(366004)(346002)(376002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(5660300002)(66476007)(54906003)(66556008)(41300700001)(6916009)(66946007)(316002)(31686004)(4326008)(8676002)(8936002)(2906002)(478600001)(6486002)(6512007)(83380400001)(36756003)(6506007)(53546011)(26005)(66574015)(86362001)(2616005)(31696002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGt5ODV4MUFBQzFXYURuNFJ0TXdXLzN1bFNOY3JTaFRaTnowRmxIdjA4SVVj?=
 =?utf-8?B?cFRtdlUwUW4xc05rZ0w1MUxQam05d0FIUHlqWjVpYU9zSUxmcEtTdTFib28w?=
 =?utf-8?B?N1dHQnlQYTBiYkZIMkNQRVU5ZEUxYmRmUGd6RVM5a29ZTWhnSEF0QS80QUIz?=
 =?utf-8?B?NzRXMHlya2FoYUxDVjFGSVI5K2RPdCttamdYb1VsZmZ3aFhESWpua2M5TFZk?=
 =?utf-8?B?SzlRa0JIbTNEY254dElvTWI5MjRweW5vb0VQdXBpWThoY0g5ZWlWUUxpeTU2?=
 =?utf-8?B?ZUsxNEI3SEdJYlhrM0NDY09VMmFIZDk1VzhLelBIOTc0bDYwaE9lam9rVVVs?=
 =?utf-8?B?d1d2UUhsZUpSZDhkT3hXdEJBcWhIVHU4L2ZxdGpYYWc4TVJFajZPNlcyeWFI?=
 =?utf-8?B?S3ZVZ05MeHJZTUZ6a0JQTGpyZlplYXJOS0JDSkZtYlNuRzk5aEVZNXZkYUlO?=
 =?utf-8?B?L3g4UnZ0TG5GYWFkbk1TZHdRaXJ2SDF4RmZSVmVTYmtUdEd3a254NUYyTmdY?=
 =?utf-8?B?ZnVUOG9ldk5OVGJsaVNwUm9HSE1DUDhsSHpsd0ZoU1ZibE93OURDd1piaGVM?=
 =?utf-8?B?VEl1bi9XaFkxQ292ZnpxQzlnZUo0SU9rcTQ2dEdoRlRyeXpPQ2VtWVYxRnli?=
 =?utf-8?B?WnR2bUJhOXNNNGQrYUJYNUFuQ3c5ZUdESU9KdzlXWWNjZXFUdXhySzJzQjFD?=
 =?utf-8?B?ZGlNWVM4U1VsUURSTTZ5VzRGMWg3QzJ2VDZVbXhjQllWSEJoaHhmTzRlbDg5?=
 =?utf-8?B?ZWQzVHFwVkhUYVJjQ2pHbEhpY1dHOEY2ZFY5RHJaRFZLQnpKdFJyc1phZC9w?=
 =?utf-8?B?Qm9nZ0lrNUtnTkFzMU9QTGxHYTlPYVYvUVV0ZzdKSStadzY2WmFoeW01TzBa?=
 =?utf-8?B?V0lKUytWS0JiU1ZhYlZpQ3lQdUF0OWNpN2NZU0cxaXg5VDF0R0E5Yi9SN00w?=
 =?utf-8?B?TDR0dTJkdVhXM1VXcUZrZitGK1ZSanIvV0dneVMydXhPMnRQenkrN2Z2cThD?=
 =?utf-8?B?eDlVOFJPK0tFaFBCNWJrbGhyakdoczRINTBxcEVKMGQyRVdSWVRQTnFRM3Qy?=
 =?utf-8?B?TDZLbjIwc0tveVR4bHZKTmx3SFZleUw4aVYzd0ExajRNdE5razZBRGVOR2Vm?=
 =?utf-8?B?LzZWZmUrMkpGaTh1b2VRbVNNL2tOb3JPTnZHaUJJdjZhUTVPVjZWTG5QTnVu?=
 =?utf-8?B?VVFnZG1jYmh0ZGhOVk9hM3RKVzNJaXI4N2NDbmdFNFNkU0gwZk94M0Y2Vk9u?=
 =?utf-8?B?eWhiR25uaXZjVmZkTlF6UHB1NWJqVHBRaXUyQS9za1o0Q0d3Y2IveC80NStV?=
 =?utf-8?B?aTdsK09FbnVzd01NRW1yNXA1WkpUS3lLRW9CMEcxTytPOVpCc0l5WXMraFpR?=
 =?utf-8?B?N0pSd3Q4bmFoZVcxdnNOMVBhUC9rY0JOeFYxK1pzblJlT1Vqak1hcmpYclpn?=
 =?utf-8?B?V21NaER6WFZ1cDNrNU5QREVTVVJVMytrRTFoelhMMU1ZNGtJQ2VKQzRNbWIz?=
 =?utf-8?B?eU1xczFMZHJLK28zVjZPZ1hraXhYRjlrNWRiR05kWWt3cjdBZ2k5bHJFTjJC?=
 =?utf-8?B?NVpjRDg4K241S2lJZVhmVGUvS1g0MStLUGxaRitwbDZibXFKVGQ1aVpydEFs?=
 =?utf-8?B?QjhUMm1rYXBhRkJ2Z0ZRWWRYd1BhZytaNDdLZTlTL2JlSzBjNmpsUlBmLzcx?=
 =?utf-8?B?RmlMeEk3eDlnSWxWM1IzandHSEpPTFF3dnY5bTlYc0ZzWlR6alVWd3hpcTlD?=
 =?utf-8?B?Z09Cd2hZcndvdm9SMVhWWGZNSmJjVjJ5UXZvamRjSEhaa2ZMR2dnN1VJZHMv?=
 =?utf-8?B?OWFqWlBxNlFYZFRuWFBzejFzUTJhdTlRSDVwTXVOYU9sNlkxeVJFdE94UnY4?=
 =?utf-8?B?RzliblFWZWJIeXFLdFN1dzVtQkhhR1AwNnFhYUNkVU1qbnEwR2M5RjZqUU9Y?=
 =?utf-8?B?N05BcjdudEhiMHlwbHU4ZVBwa2NGa21nTGxhTzNMdnFNZVE5K3UrUUJGb1ps?=
 =?utf-8?B?RzgvYzVrZTUrWHpYZ1o3RTM3U0xUY3hKbHpXeUYwMVhtZWs1QnA3d2VicGNV?=
 =?utf-8?B?NzJCNUdFdjlWVUxpbG9WRklCNWprN3M1SVN0WTJqMkcwRVR3S0lrRitxMXV3?=
 =?utf-8?Q?ZPnsAckBN06Bo33QDi6mQD3RR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b01a71bd-fbfa-41b6-c328-08dbd9f9f02f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 10:12:50.4243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yi8J1w2s3qxpLNrH2d6ZLEZ5ftj4za2iO+GA/NBska54TvBddphqoIdWrvNm9pNJxUWWnGYHkxLJg+q0xdqnnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9227

On 31.10.2023 10:31, Edwin Torok wrote:
>> On 30 Oct 2023, at 16:29, Jan Beulich <jbeulich@suse.com> wrote:
>> On 25.10.2023 21:29, Edwin Török wrote:
>>> This can be useful if you realize you have to inspect the value of an
>>> MSR in production, without having to change into a new Xen first that
>>> handles the MSR.
>>
>> Yet on a non-pinned Dom0 you'd still be lost. Since iirc we generally
>> advise against pinning,
> 
> You can temporarily pin while debugging the issue (e.g. pin just 1 CPU from Dom0, and "walk" all your physical CPUs with it if you have to,
> so that you query them all), e.g. with 'xl vcpu-pin'.
> Although that is more invasive than reading a value.
>  
> Or alternatively have another (privileged) interface to read the MSR for a given core without exposing it to any guests, that way you don't affect the running system at all
> (which would be preferable in a production environment), i.e. a Xen equivalent of 'rdmsr'.

The interface we have (XENPF_resource_op) is, despite being privileged,
deliberately (so far at least) not permitting access to arbitrary MSRs.

In our old XenoLinux forward port we had an extension to the msr.ko
module to allow pCPU-based MSR accesses (and I had a private extension
to the rdmsr/wrmsr user space tools making use of that), but even that
would have been subject to restrictions enforced by Xen as to which
MSRs are accessible.

>> I wonder of how much use such a change would be,
>> when it effectively undoes what we deliberately did a while ago.
>>
>>> --- a/xen/arch/x86/hvm/svm/svm.c
>>> +++ b/xen/arch/x86/hvm/svm/svm.c
>>> @@ -1933,6 +1933,9 @@ static int cf_check svm_msr_read_intercept(
>>>         break;
>>>
>>>     default:
>>> +        if ( is_hwdom_pinned_vcpu(v) && !rdmsr_safe(msr, *msr_content) )
>>> +            break;
>>> +
>>>         if ( d->arch.msr_relaxed && !rdmsr_safe(msr, tmp) )
>>>         {
>>>             *msr_content = 0;
>>
>> If we went as far as undoing some of what was done, I'd then wonder
>> whether instead we should mandate relaxed mode to be enabled on such a
>> Dom0. Then, instead of returning fake 0 here, the actual value could
>> be returned in the specific case of (pinned?) Dom0.
> 
> 
> Can relaxed mode be enabled at runtime?

Not right now, no. But a hypfs control could certainly be added, with
suitable justification.

> I'd be happy with either solution, but it should be something that can be enabled at runtime
> (if you have to reboot Xen then you may lose the bug repro that you want to gather more information on).
> Although changing such a setting in a production environment may still be risky, because the guest will then become very confused that it has previously read some 0s, now there are some real values, and later when you flip the switch off it gets 0s again.

Indeed. If you flipped such a control for any domain at runtime, you'd
better first check that this wouldn't cause any such issues.

Jan

