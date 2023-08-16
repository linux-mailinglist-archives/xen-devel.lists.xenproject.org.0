Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3AC77E24E
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 15:14:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584757.915566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWGM0-0004Qg-Os; Wed, 16 Aug 2023 13:14:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584757.915566; Wed, 16 Aug 2023 13:14:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWGM0-0004Oz-Lp; Wed, 16 Aug 2023 13:14:28 +0000
Received: by outflank-mailman (input) for mailman id 584757;
 Wed, 16 Aug 2023 13:14:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8IcS=EB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qWGLz-0004Ot-AT
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 13:14:27 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061e.outbound.protection.outlook.com
 [2a01:111:f400:7d00::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2e772aa-3c36-11ee-8779-cb3800f73035;
 Wed, 16 Aug 2023 15:14:26 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB8020.eurprd04.prod.outlook.com (2603:10a6:20b:244::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Wed, 16 Aug
 2023 13:14:24 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.029; Wed, 16 Aug 2023
 13:14:24 +0000
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
X-Inumbo-ID: d2e772aa-3c36-11ee-8779-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jerp3QSBSyExu3bBUvvTnndF1OAhChe/9vFqJ9zpvkFtppB2XkyvFhuNb96w1Zv0xLHRuJN6G68BsHM9S3pYJj3Fo20rBY3lUjuFBToFvaaRAYGxXi/JXt73KX6OX+mcNkvVS2dP+9OP3oKzlRWqnNcwfxyGJApepN8gLRXiSqrxqr3hzl7iD1hL4hR3uzu/LAvLk0ojKpvuJFfx/EjPfO44Vb8dzw6J7XUm4z2jygpHYNGLnNxDmWoSE4PGO0oluSOUtAzgpXB8Ra8zfvHW+oVFZ8ErojzW86nDt3Ms9q3448qwVoPArp1Yonx5O69Ci+cjMED3nwIyb5g5XvqiBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4dgxFjyYkxlIbeE0c5m5wuyChWy9m0OlTyGZlyHOw6I=;
 b=R3lH3TO+N0n9m35GXRNiX7qDKxvzliWJ/7PoDOF+jtBdihXqfECeg5RTZJMtKUZpQwRanPaWetmjrFhV36MjrmKkubXG466qoN1qWXDRgTogxWW3irdm0JYDxdrMFuq/7Pz4ug9xgSPkSshrjr25CCJQHe/avp4s34nYsSScsfg1F3286wFOzT12EtOMt7+32Rh4n2JGPkKa/Y45JfHawNuneZEjpUXGDv9IyHb2PVHGHOfKYgDQAoZlk3Qnx+s5BAZ+LRVaKn/EQO0V7/rtySCVgyY4jM+zxNsqPG9/FN9rJdTMaHx/BPDL6PX26KA6NaAYc29z6d5CfcnyrUqLhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4dgxFjyYkxlIbeE0c5m5wuyChWy9m0OlTyGZlyHOw6I=;
 b=x+62sIBT5v3LFVmU+6voz479wwVMD0k+gd+icyepQiyyf2N+QuDZtnufvcg7GDiDcNxJKVErFHd2NzP7O37jJ6jUb8nAShUrOV0uM4e8XJl0bW96a19Vy2WPYSep1sARDjITFSPabHngUKuSbElBFvS5CU9KmrGrKa8OWRGRQLJL9soji8idGHFF07w9UoliPzXW4MkXFczAS6s6DLSuUJUf7rT9/Tgl9MIF2mEcemIqbWyY5jlFWM/JlSlYFCrnRcyoGMkSefvr5ugOO2qcjsM+3NTRtZtjOXvCjfTHgB4ykOnui6+Tb6K5bjP58QmK74SiJiPKLnOYD1THDslszg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <25f27f25-3b5a-691d-fd2c-682b7452a1bf@suse.com>
Date: Wed, 16 Aug 2023 15:14:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 0/4] Make PDX compression optional
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>
References: <20230808130220.27891-1-alejandro.vallejo@cloud.com>
 <64dc988b.df0a0220.d6d82.abb3@mx.google.com>
 <f8d43f0e-bceb-674d-c3d9-ddca4fd491df@suse.com>
 <0912c8ed-f2a3-4fdd-a210-f015c0e3f48f@xen.org>
 <44d233c3-4b85-c70b-0ab1-a67452884025@suse.com>
 <d3777547-cc5b-409e-b236-d502f1133443@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d3777547-cc5b-409e-b236-d502f1133443@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0004.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::23) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB8020:EE_
X-MS-Office365-Filtering-Correlation-Id: df1fc1f2-6e00-4ec1-be09-08db9e5ab5f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QWbgHte/+0rOdW+LqnwMSmEsinA9D+YzPga04guLmgXE0h1wqGcRjzTaRpwIf2d4pDL8G5dE46x/q29fGXFpi1U+wcZbzjZrLSYtlSveXPm8zUdBrBYCvRwmjFC+jq6mK0Ffaipb30r1lyfLjQZ3RVcv7RC1sqY/bWfrKqdPtMHK/Hk3ybiPcDyaz2MdUlrtS5G9Bo5r2GXwhT/4klcXGW1/x51b4nBhr+hKx6LrhZLn/ilbf1Py+9sqHQbYAfaB3W81SWJW75/G8LhkADHu/KSGoAjMfvRy7eWAOd0eVyoi2Q7zhpl6IjXmbcLQxPFi/2dU3o16ay759NZ2zEft2KnGYdWuxxlBZH7RdsBnmuKrFs86DUhd4gwMiFM+dCjLYYPp1FWAB/bJLARL/ZuyRg/BldEfHFDbNcmiKKj57BH6/wNnFf2XFAWa6lPHAaUd8VuN/irZk8JIqwa+fcAKW4Da2/U5AJ0keLrP4W7vTKf9iUJjwSy0Taevdw4Svwztae2PTh+1FeDURLe5q0YesNmTaYA2V+hOB44Oc9qlVXVUz2sovwZnlEWC9OsLRGPJYJdcMsfBLWkU9odVvgsPGvsvosFuKYQq2mv/p1JK/kFJ8sk8H2jMdMWGUim4aJC0H/ACZAqdB5HCBYbX0h7wZQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(346002)(366004)(376002)(136003)(1800799009)(451199024)(186009)(316002)(54906003)(6916009)(66946007)(66476007)(66556008)(966005)(41300700001)(5660300002)(38100700002)(31686004)(8676002)(4326008)(8936002)(2906002)(83380400001)(26005)(478600001)(7416002)(86362001)(31696002)(6512007)(53546011)(6506007)(36756003)(6666004)(2616005)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0tXbVZJYThyektwVzhRUW0xK1RCd2xtdlA0OTh1Q1Ztdk93YS90b1h6ejVL?=
 =?utf-8?B?akRldVlTWXI0a2JRYTl1MHNPa0hIZXBlK1ZyZkNwU3cybGNaOEpROFhmU3dr?=
 =?utf-8?B?NlJHbmRwYnkzZHZvOWNIdXhJTXJhSTM0S21FeEJXRnZDZ2pxbXg1bnpGdmt0?=
 =?utf-8?B?WHVHc0FycDZGQzNDZUowOFdLRGVBNFByd1ZhSVp0RHh5b01kdmRCbEtxbXl3?=
 =?utf-8?B?TUNsY2VnM1ExTmgyVTlleWJGeGpKcW85bm5jV2Nrclo5R3RtT3JmbWg5SDVX?=
 =?utf-8?B?SFJlNHZSNFUvaWZyVllXVHQveUZiY0x0ZXIwUGN2VkpPbTdQbitKd01EVEQ5?=
 =?utf-8?B?Mlg5a0l3emdhaWJhT1l5N2QzcWtNWHdrN0tVOUxSZlJ5T3Btdlc0MWk5WERF?=
 =?utf-8?B?RXhBYU1uZGc5TWtuSk05OHdrM3llNzNpaExQVE03UlBEN3htVFdIR2JUZ2Er?=
 =?utf-8?B?ZmVGSE4wWS9GRXZ1eUxLZjlHUnpjRnFJcWVucklNczRDZmRoWE1iOWJkckho?=
 =?utf-8?B?UjdrSzVYczA2QmxLR3dxWXA0SDdmbUhEVVpKKzRoRE1MRWV1ZUNHdnJ5NmlQ?=
 =?utf-8?B?SENyRXBpemFoUmFNN1lpbVpkYVlDWWlQa2tKUFB2SEJuTGpzQ3pvYVhvenh6?=
 =?utf-8?B?SmJqK1E0L09mOW0wQnpBSnFmblowSTlLNThkLzdpVHV5YlFIRis0L1pyZjJD?=
 =?utf-8?B?K2hSb3dhMTlMU3gxOXZvT0dYUWc3aHdXMkczL0NVa1dZaHpvdE1qK1VtRTZ2?=
 =?utf-8?B?bWsxQlEyOFFSd3NFc0E4cEtadlF3VkVYZ2hUOHg5bkFIYS96Q2lIY3A1QlFJ?=
 =?utf-8?B?Rms3TnNqeDNCR2lLS0ZBcEhrWFRtMTZIYXFRRzBPRENpVmFTRm5BSzBpNS9h?=
 =?utf-8?B?QS9Od2h6WnhOQm4vZTU1bDJZRi93ekRlZDhjL3F1eE1Pa1dKckJ4NTNlQ1E1?=
 =?utf-8?B?Vjl1VG5ESTY4VXplV1VFNDNoNXIwSlM3YnRLSWRLbmtzSkN2bWFSTEFaUkxu?=
 =?utf-8?B?TWs3RFJsNm1QUTZaeWhtamFwdVVWWkVCZXd3Q3YyWis2eGJWQmhoYk1ZemJ1?=
 =?utf-8?B?SjJEQWo3d1U2NVhsSmphUXAwVWlNalM4V0dFMEN6V2pxTXRjMkttS0ZsTUJp?=
 =?utf-8?B?MUFmVU43MnhsWEx6ZFVQSkh4cHhZOFFudkJEUUdFc0JwY2NhRGlXOElFQlNv?=
 =?utf-8?B?NnJiemRhMlphM21zNzNlc2xDbGo4UG43d3E4eG14OUc2Tm1JUmtRbVE4bjdm?=
 =?utf-8?B?b1lFMGJnUTdSMWVIelFreUVUWmJDYVpwcnJ4TitjQTJXMXR0NG9IME4yUy93?=
 =?utf-8?B?WDUvODhHMTFpazNBUjdkaFRlSVFYaWJ4QTZWaFJjbHRQWWxTcUduR3FaaFJR?=
 =?utf-8?B?VTZDT2o4N3hVVTczSEM4REFiYm80QjJ1dHBPTzN0TXBQOW1YdzBTSFM3NVFK?=
 =?utf-8?B?dnlrbTVtbGNWS3U1OWFQY3lrRmJZOExLSWw2aGdXZytoSnVUV0tYNitGc0VT?=
 =?utf-8?B?bXMySmlBSnM3KzNNS0c3ZlRZZitQTWhyampZdExaNGRQN1JjNkJxZE5IMWpx?=
 =?utf-8?B?Z29taFlqRmFVdFl3UTh2RlMrMExRS1lFK1hzQzAxTVFKUkJNUERYM29oT3RP?=
 =?utf-8?B?SGVXTnM1azUrRkJZYVhaWGthakRBcmNwUHZOclR3WFY0aTZlSURvbHJHQnhj?=
 =?utf-8?B?NjNTQ29GZC90Um5MYVdpb29rWEwzVk1FNFF4MGxrK1o3ZXB1OTFaWTVGV3FI?=
 =?utf-8?B?M0traEp5Rm5tejZwRzZYWFZkdE1GWEpaR3ZHNlF6SHpRRnh0VlJFc0UyL2JK?=
 =?utf-8?B?cVEzOFVNc3FmU2twUHowcEVFdGo0MUx0bE5adWNUdXVOQ3ZFN1ZlWWdiSGU5?=
 =?utf-8?B?NVVpQlJBdWxOMVVHOGZ6VkVJdUQ5SGs0UHBvN2RpcDM0TGx0eEdmTEVKQlRK?=
 =?utf-8?B?QU1ZaTVkRTU4dWpRazVDdlJ2NGZXQktvcDlJOCtGZUZ0bnNyRk5ZQkRiWVQ5?=
 =?utf-8?B?T2sxVE5nV2dMV2hCMGhoWnRFTXdVSDBQR1MyVmpuMGFoR1RwQW5UTG15RUFC?=
 =?utf-8?B?WFVqdklIM25EVUxhQm5kREZ3d2RhWk55bW5WL3ltajJZQjVHam1mOHZrSHB2?=
 =?utf-8?Q?Hf+VQP3wQXvbqXef27zblSlBQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df1fc1f2-6e00-4ec1-be09-08db9e5ab5f2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 13:14:24.1198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aRvL2VrlV+aBmpJkRGHpfgk8insS4cG4VT8KN8u/B3hlkayHsc+4WvLCaLjaL34I6vVhiq6Mi31HMgmB3mbvqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8020

On 16.08.2023 15:06, Julien Grall wrote:
> Hi,
> 
> On 16/08/2023 12:27, Jan Beulich wrote:
>> On 16.08.2023 13:12, Julien Grall wrote:
>>> Hi Jan,
>>>
>>> On 16/08/2023 10:43, Jan Beulich wrote:
>>>> On 16.08.2023 11:36, Alejandro Vallejo wrote:
>>>>> On Tue, Aug 08, 2023 at 02:02:16PM +0100, Alejandro Vallejo wrote:
>>>>>> Currently there's a CONFIG_HAS_PDX Kconfig option, but it's impossible to
>>>>>> disable it because the whole codebase performs unconditional
>>>>>> compression/decompression operations on addresses. This has the
>>>>>> unfortunate side effect that systems without a need for compression still
>>>>>> have to pay the performance impact of juggling bits on every pfn<->pdx
>>>>>> conversion (this requires reading several global variables). This series
>>>>>> attempts to:
>>>>>>
>>>>>>     * Leave the state of pdx and pdx compression documented
>>>>>>     * Factor out compression so it _can_ be removed through Kconfig
>>>>>>     * Make it so compression is disabled on x86 and enabled on both Aarch32
>>>>>>       and Aarch64 by default.
>>>>>>
>>>>>> Series summary:
>>>>>>
>>>>>> Patch 1 Moves hard-coded compression-related logic to helper functions
>>>>>> Patch 2 Refactors all instances of regions being validated for pdx
>>>>>>           compression conformance so it's done through a helper
>>>>>> Patch 3 Non-functional reorder in order to simplify the patch 8 diff
>>>>>> Patch 4 Adds new Kconfig option to compile out PDX compression and removes
>>>>>>           the old CONFIG_HAS_PDX, as it was non removable
>>>>>>
>>>>>> Already committed:
>>>>>>
>>>>>> v1/patch 1 documents the current general understanding of the pdx concept and
>>>>>>              pdx compression in particular
>>>>>> v1/patch 3 Marks the pdx compression globals as ro_after_init
>>>>>> v2/patch 1 Documents the differences between arm32 and arm64 directmaps
>>>>>>
>>>>>> Alejandro Vallejo (4):
>>>>>>     mm: Factor out the pdx compression logic in ma/va converters
>>>>>>     mm/pdx: Standardize region validation wrt pdx compression
>>>>>>     pdx: Reorder pdx.[ch]
>>>>>>     pdx: Add CONFIG_PDX_COMPRESSION as a common Kconfig option
>>>>>
>>>>> @Jan: Just making sure, are you generally ok with this series as-is?
>>>>
>>>> Well, okay would be too strong; I still don't see why my runtime patching
>>>> series isn't re-considered.
>>>
>>> Do you have a pointer to the series? I would be interested to have a look.
>>
>> Sure, I can dig it out a 2nd time:
>> https://lists.xenproject.org/archives/html/xen-devel/2018-09/msg01616.html
> 
> Thanks! AFAIU, the optimization would only happen after the alternative 
> has been patched. This is happening after initializing the heap. With 
> Alejandro series, you will have some performance gain for the boot which 
> I care about.

Fair aspect.

>>> That said... the problem with alt-patching is this is architectural
>>> specific. Right now, this seems to be a bit unnecessary given that we
>>> believe that virtually no-one will have a platform (I know we talked
>>> about a potential one...) where PDX is compressing.
>>
>> But it defaults to enabled on other than x86 anyway. So it seems like
>> it's generally wanted everywhere except on x86, and on x86 it can
>> (could) be patched out.
> 
> IIUC, you are saying that we would want both Alejandro series (to allow 
> an admin to disable PDX at boot) and your series (to fully optimize the 
> PDX at runtime). Is that correct?

Not really, no. I don't view a build-time decision as necessary; I favor
runtime decisions whenever possible. But as said I also don't mind this
series going in.

> If so, it is unclear to me why you want your series to be re-considered 
> now. Can't this be done as a follow-up if there is a desire to further 
> optimize?

In principle it could be, yes, but I'm afraid I know that no follow-up
is going to happen (and me trying to revive the earlier work would be
yet another case of pointlessly invested time).

Jan

