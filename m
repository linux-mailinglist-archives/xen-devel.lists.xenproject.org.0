Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 293E359FAD8
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 15:05:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392576.631019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQq4G-00026G-1Y; Wed, 24 Aug 2022 13:05:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392576.631019; Wed, 24 Aug 2022 13:05:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQq4F-00024Q-Um; Wed, 24 Aug 2022 13:05:11 +0000
Received: by outflank-mailman (input) for mailman id 392576;
 Wed, 24 Aug 2022 13:05:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=M3pU=Y4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oQq4E-00024K-Bt
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 13:05:10 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20073.outbound.protection.outlook.com [40.107.2.73])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60dcea9a-23ad-11ed-9250-1f966e50362f;
 Wed, 24 Aug 2022 15:05:08 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8419.eurprd04.prod.outlook.com (2603:10a6:20b:3fc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Wed, 24 Aug
 2022 13:05:06 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5566.015; Wed, 24 Aug 2022
 13:05:05 +0000
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
X-Inumbo-ID: 60dcea9a-23ad-11ed-9250-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HdwtNxCFDtnFIuZST8uW/RQqwmoilrhc4aRJIU+hBpL8w2kcf+C6kOKfXIXMbxRrWqmfPwbj+XskAAlnwlpLXM3Emtg8zDEmutgvQjYpEyPjM4/wiBJL1L2pdYd2SsUnD7t6GuUskTAopPtICdn99r5AgmvKmQL/IjhCUYjDISpfQpATvADHCDGloYVrvXhldpw4HVtHYn6EjwNNqm3RzbhBKs2Efqi8lcCFGmAGY1ujsqHJ4yPiHlYb45QBpws7/vg1leKGULza6L2YVMJStVkSrOcfka5qNo4JBs8iqgkaQR23qQ7b5crkznqs/5JNGcnjNghvmmdniGob2XxlpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ie6dxQve/Zt2WSnieDcVoP0CEePnw5LG9pR8riFSqzE=;
 b=DuP1Kgm/BFJm3pdVvcP3/paSerap0i6ljCht9pwS8Y5ZvjrpCjE4KNyB/GlsQeJrsbLrUtoxqw0EYo8VO8LbtT1HyywAs8QcJ1OoiWeBYJU52KLa9Cm0ZmQOnoSlusDfZVt/BOOmsz5r0GT0CPDngwLcJPKuO2g/Ku69SeN2jwdNcUQ1++RKWEB5Adqdg0zcJJmL2iLaO0BEgcd/QT6fStbBYRaGL3HcPvJih2/pbvf0cxa30J1XxOiu/H130+vbK3RmejESEkxGi8zfnGlcg9Sk/IKv3gSdTVjeY2VGsGU93zmNWlrzqIh4oPjL7ODeaFoIoWaejmh8Lg5IXm4eAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ie6dxQve/Zt2WSnieDcVoP0CEePnw5LG9pR8riFSqzE=;
 b=uTogo49sz9yBRT2M4cbXwsAhRsyx5r3kJSy0pmR9CasE0Jb0YX0hQa0T1y7hD3f3jeVkZwscjfBh9hY7HWsTmLHxGUbhX4HLVt4Nw25rbBG9Xa8XE5TB06C2wQHVGnKlVIOWpvuif/zpaEbjFmFNaRDNMrDRDC7uUWqvxTDNCFvWQ1K7eNXQA4pptnv2EAZvKKdXEemCBjSDpV9vTe4SFxGtLkO6/LpOnZntNWDGnD22QyDb3v5ut42LScOJJJfZO4slkg66o++JflxUXzTJntstPxqckXPDmHGyEdw6vExYGhAtnnuRc982CXmp4y1ONLS0UBzGPP5YCK7HF7WmTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <df2790eb-c4c0-9fdd-b0fe-f98810fe6741@suse.com>
Date: Wed, 24 Aug 2022 15:05:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [RFC PATCH] libacpi: Fix cross building x86 on arm
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c3d431217010f669de809a76c2f1c15a0313ae53.1661246753.git.bertrand.marquis@arm.com>
 <844e0164-96b1-8a56-a9c0-0f432b9e648a@suse.com>
 <B2DC2AC4-E59C-4C96-8993-D4812D73E799@arm.com>
 <74994bdd-8c70-7f5c-2146-157a36c843a0@suse.com>
 <87AD61AE-5C50-4F04-AF60-300C6A113A85@arm.com>
 <C7766EB8-B741-4443-99C3-EB14C1EA9804@arm.com>
 <348e6d5c-d846-3d8a-e26c-316ba6a98938@suse.com>
 <F1E1B306-5C4C-44C1-B4BE-E546B0B67C97@arm.com>
 <3a4cbf36-ff90-bf7d-b7e6-5d8a49880f2d@suse.com>
 <6692B919-268F-461C-B5CE-DF07914DAFCF@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6692B919-268F-461C-B5CE-DF07914DAFCF@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0106.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9cc3acda-9c4a-4e1f-a900-08da85d143bf
X-MS-TrafficTypeDiagnostic: AS8PR04MB8419:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2mpRNchtDf9ZMRyTLNGo4IU3SbG5RE1zTtKGq6ORRyDT7/rP7YppB6ZVl0AK5nB99QKq0zq9J++KIn5l/Ylvi6DrWpFDQT+jNEnJMr1QNkypdR3x+MlPfBSyP6v/LrIaKcraX30USQD28u3yTXwRaqDuxJzR3prwyBb+JgvVKNvbjgnNHUeKhz1f7ibTaTfgjgO5cHCShtlncn6V5PqanNtrUBBlDoEX5zTEjQJW/JM6JRbn8CYWKvxUON3/+Wo9kEZ/YeZ+tkKnhhmHKpf4Ih3K1aFHmEupiZAUGzGtHkfDix70LcV4MFKrXOssuqn96Q6eBrfGmc1l1S/v1EWMosT/R35ME+s3WYDQD5byj1M295N40QK77ZmZPD2y9DI8Ycnr+XOqcUn7btYrR808AZANvHZlloxbTk1M0zno1PfchIs1IBsQGfcT3WSxBfRdf9GJKwXbO5Sf49cX/uLu2VyCl2DsqTSUiQJx+ySAgkPfUD85IRehJzWPIJiDDdOXrNnAknyvoV3Nkb6hmRxHQbKo26/w/LV8cbJrQQr4v4woaewtz02//bEU+EO0Jp2qNi5SJ+mxvEIJoAZ61Iz/J8zyyU1H7bv3phZ4u0US23P6j3b8pfc+3BBdjb1OjCLjcbiOUWm5L6NaeDWOiOnJgFm57Sk7453OjQ0z1Ve/RgD1CJ4U3Yg8caO5ZzgdorSEE8Tf6ld6eo8xOgi3vjoUEDkb4wg/noEch6vCjOyGs0fYqVS9vU1ifDfIgy4DKaR7w+1QDrZg/zBiFYVSH4PI55toLlP4Gb98zVk3KjyN/ls=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(136003)(366004)(396003)(376002)(39860400002)(6486002)(38100700002)(66946007)(66476007)(316002)(8676002)(4326008)(66556008)(31686004)(2616005)(186003)(2906002)(36756003)(86362001)(53546011)(31696002)(83380400001)(478600001)(8936002)(6916009)(5660300002)(54906003)(41300700001)(6512007)(6506007)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cTlueFlBa0FNUnlWdzVSb0xIY2ZxUHZDQjRZUW5tSXV1TkVpY25obHgwUzZV?=
 =?utf-8?B?MlZNaGx2TWNrZm5sZzBmL3BBVTRrWTIwTG16QVJuZjRTdkVEVVJZcHZLQm9P?=
 =?utf-8?B?YnkzY1RiUHVObVdMTnZFSjdWTWdGQmpFZkFLNHA3VE9XZ2tOWDlVckZQaVJY?=
 =?utf-8?B?MVZ3NGNVWXlSdHBEZGxBUTYwWFVXemw4VzY3dHVXU1lOSWVreWRRaFU1bW5k?=
 =?utf-8?B?Q2llN1N6cDlsN1RtL09XRGV0cW5XcC9qVWN2dWxQRk50a2tZbEk5ZDJwZGRX?=
 =?utf-8?B?MkdFYnhyVFJVNU1VRURqTlNqa05PQkZyU2lIa0tUekIyclprTTdtenl4RGtn?=
 =?utf-8?B?RDR6aFhJdEtSbC90V2tDQmd1VGlQdlB3OGNGRUg2enJXb0Y5ZFQwT0pnU1VJ?=
 =?utf-8?B?S1hncVJRVnNlMERzYVVzSXE5SFhYZ25BbjEva2RabXpLUUdGRDNhR2Z1UXVR?=
 =?utf-8?B?T0w2aDNQaVRTU1lWUDZoY2FCY2ZkWEU0YVhuY1U4LzRJOGJpbEhPajVpVEIy?=
 =?utf-8?B?NE8vL1Y0ZDBDVXM5RjhSUnB2UlBta3BEa2FsWlVHUHNBbHc5WDlFQTR3RWZ1?=
 =?utf-8?B?c3BEZWlFaDRzR3dySVJTbzRXVC8yVjUwNGZ1RUJoM0NJWG8vS0R4R2tiVTlL?=
 =?utf-8?B?SFNDci9WWGhxUmdIZHJNTXRhWmM1RXdkUVlNTWZmdHFrUFJQQzdZQmNMTXYy?=
 =?utf-8?B?b0JCWTJiRzR6Q1duTENFY0o0OVA4VkpXbm1oM3lXZXZoTnA3QjZtRTlTLy9Z?=
 =?utf-8?B?cHVtclJKMG5SYTZ6dGhGTDRBMDJHTlcrVEN3WFB3TG1ZeXByVzErSDV6d2Nm?=
 =?utf-8?B?Q2RYWUVYNEVlU2p3aE9yVENLUlhRMkdWQnRjUEZlMzZTV1I3SEhYWUVMdHJz?=
 =?utf-8?B?U1AwRHhkOHlJN1JoRHZUSmdpNFh3S21mUFhIblltcjFkSHRKYjdZRWtLQmdY?=
 =?utf-8?B?VFB3NGRXcXNDWVBYcEZSczJUeHZsVWcwYy9EU0Ntc0dZNk5hajQ4dFJNRStM?=
 =?utf-8?B?dWdsNlFSRHpVdTdTS0hTQkk1WjVudkxzb01HSUtxdnlqd0NWenlscjlFYVhC?=
 =?utf-8?B?a2ZFWmJ3cDFzVW1teGhyQTJlNm5GVWw2cnE2eU53dXMwSFdmQTdNd3lWTTA2?=
 =?utf-8?B?LytNMjFmcnY0ZlR3bDVQR0J0aFVqYnpmMXNkWDFOVzRPQnRQbTlKZmdPdG5R?=
 =?utf-8?B?ZDdIRDduM1JOT2RiVWc0S2Qra0VDQy9xWW1zQXRxT1VnNWdhQkNTenZPLzBh?=
 =?utf-8?B?Z0VUaEJMbUpFM1E3MUdNMVF3RnFVVmRhd2ErU2V4c3BpNkhBbHVHQnovbGE3?=
 =?utf-8?B?SHBtL293M2lsUVJWNDgvWlBKYktqR3kvVlB2WE4rbWtZYUZ6Z01NY3pIMVky?=
 =?utf-8?B?d05hUWx2MDlHSVhUR1M3emxOUEVXdTk3WWZJOFdCd0M3WGFpdzJIVlVEczBw?=
 =?utf-8?B?c3QzcWFGY2dubFdoMFR4Nm5qWU13T05jK0tETGVjOEswa1R0RDFXb1hUNUZy?=
 =?utf-8?B?RWs4OURMUko1cFZrSEtDcFVvVmlSRGQySHlpSXVWWkVXdXpIQ08zYlNWQmtM?=
 =?utf-8?B?THFNUVlDRjdwcjQvdTBiU1hvRGZ2V2dWUlFWMmVkWmczcVA4c2ZnbjlFSmpJ?=
 =?utf-8?B?OG9NMFMvOEo2T3V3aG9Vd242UXBFSk44UWg1UDN6RGpxTGdaSndISHNvNzQr?=
 =?utf-8?B?clJrR1JlelliTGxJLzhnWERoNkRsK3QxUWMyK3ZxRmJFYlR2ZGpabzRwSE9D?=
 =?utf-8?B?TC9JT0g2UXI5NFN1WXdVZlRBb3JrRW5sd1N3cWF6ZStSc0FadUVhTjV1NlBX?=
 =?utf-8?B?a21TSERLa3YrOFNsd3dSTnBPdGJFOUZIdEY5eDdtRVM0RHdTOGRRUGhJc2Zv?=
 =?utf-8?B?dGsyMFlTRm4xVzFIdmFwYndvTDRHZkZCM2lsL2xsRU9IckN6Zk9zRmY3S3py?=
 =?utf-8?B?OUxoampPNVBpRmplczhmSkdlY3dURnFkZTA2TFlLVDRKOHhyYkhhVExUYTZt?=
 =?utf-8?B?UEVmY1B0ZHZSdGZZZXJabzdGRjB0elFtQkh4K2lTUnBsUHhEcGdqSWl5b1B1?=
 =?utf-8?B?UGhEZmkzTC83WENmcVQrYlNhM2hxajdFcHBqbmdtUFMrOUgxK3hRN0VMVURX?=
 =?utf-8?Q?BhSjhoNIoKE7xdnhNd/aZMeMQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cc3acda-9c4a-4e1f-a900-08da85d143bf
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2022 13:05:05.9045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TQqleUj0DmR+9pcCjG6LWj3ovJx+r12QTu3P9V5u5haSCJZjRAkfq0bDkX+uLGOygFIJpQmna73U7GhE6T4a5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8419

On 24.08.2022 14:43, Bertrand Marquis wrote:
> 
> 
>> On 24 Aug 2022, at 08:37, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 23.08.2022 17:56, Bertrand Marquis wrote:
>>>> On 23 Aug 2022, at 16:45, Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 23.08.2022 17:09, Bertrand Marquis wrote:
>>>>> How about moving those to a xen-acpi.h header and include that one in xen.h ?
>>>>
>>>> In principle okay, if there wasn't the need for HVM_MAX_VCPUS. With a
>>>> suitable comment it may be okay to live there. I'd be curious what
>>>> others think.
>>>
>>> The problem with this already exists in the current status as this is defined in
>>> hvm_info_table.h which is never included from arch-x86/xen.h
>>
>> You're referring to it being necessary to explicitly include both headers.
>> That's not what I'm referring to, though: The tool imo shouldn't include
>> hvm_info_table.h, and hence the HVM_MAX_VCPUS would need to move as well.
> 
> Any suggestion where ?

Not really, no. That's why I said this is the one part where improvement
is more difficult. Otoh hvm_info_table.h is self-contained right now and
doesn't even produce potentially misleading struct layout for the one
struct it declares. So perhaps not too bad if left alone.

> The more I dig, the more I find that everything is including xen.h and going round.
> Arch-x86_*.h headers are including arch-x86/xen.h including xen.h

Indeed, all quite odd.

>>> Including hvm_info_table.h from xen-acpi.h could create include path issues.
>>
>> Include path issues? Both are / would be public headers. But as said, I
>> don't think any new header introduced for the purpose at hand should
>> include _any_ other public header.
> 
> For now I can create a arch-x86/xen-acpi.h and move there the XEN_ACPI_*
> definitions and include that one instead in mk_dsdt.h.
> The change will be small and should not have much impact.
> 
> Modifying HVM_MAX_VCPUS is not per say needed and I think would not be
> enough to make the situation cleaner.
> 
>>
>>> But as those are used nowhere apart from mk_dsdt, I would probably skip the
>>> include of xen-acpi.h from xen.h.
>>
>> Hmm, yes, that's reasonable I guess as far as XEN_ACPI_* go. Of course
>> HVM_MAX_VCPUS is a different matter.
>>
>>> Any chance that those XEN_ACPI_ are needed by some external tools that
>>> could get broken by this modification ?
>>
>> Requiring them to include another header is, I think, a tolerable form
>> of breakage, the more that such breakage isn't very likely anyway.
> 
> Then if you are ok with it, I will just submit the xen-acpi.h creation patch and fix
> mk_dsdt compilation for x86 on arm.
> 
> The rest would require more thinking and I do not think it should be done now.
> 
> Can you confirm you agree ?

Almost - I don't like xen-acpi.h as the name of the new header. Just
arch-x86/acpi.h would likely be too generic, so I'd like to suggest
arch-x86/hvm-acpi.h or arch-x86/guest-acpi.h. I have a slight
preference to the latter, because "hvm" also covers "pvh", yet PVH
Dom0 is dealt with entirely differently ACPI-wise. Plus "guest"
isn't misleading as to PV, because PV guests don't have ACPI anyway.

Jan

