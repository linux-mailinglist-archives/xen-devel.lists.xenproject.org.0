Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F92C75652B
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 15:35:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564551.882043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLOO0-00012d-6E; Mon, 17 Jul 2023 13:35:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564551.882043; Mon, 17 Jul 2023 13:35:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLOO0-00010j-2S; Mon, 17 Jul 2023 13:35:36 +0000
Received: by outflank-mailman (input) for mailman id 564551;
 Mon, 17 Jul 2023 13:35:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hD51=DD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qLONx-00010d-Uh
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 13:35:33 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2047.outbound.protection.outlook.com [40.107.7.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd8ea0b4-24a6-11ee-b23a-6b7b168915f2;
 Mon, 17 Jul 2023 15:35:32 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS1PR04MB9582.eurprd04.prod.outlook.com (2603:10a6:20b:471::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Mon, 17 Jul
 2023 13:35:03 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 13:35:03 +0000
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
X-Inumbo-ID: cd8ea0b4-24a6-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G1pacMSTvMgMte4W+JS7eBFFO0ozcvCD8c0BzYO1BXk8D/kHP1XGMgUeLZrscfHv4Y80n0Y7P7shTrt77BWQEUYsRlsD8oCAuvZWPaUSb0+q4nx/KtaZML2zRgvXRl5Y7N2sgcYzoDbnauRCFjRHL5lEAKjqu4lG/DV6RI/U66zLht5kLC2g/kUi8UcHb6A84WVkLFCQeGzaaDjQw2FAKhDNKwfVyzekWAk1Or5JyG6Bw+5UsScQ+t5/Uw7iRP6/4i2EKe18kUnSHUjAQJ787dFnH49kHNxw4fVHpyKPfHeqA+R/B4fxkxjd7Ije6jlpHSwHqavG3/SMguTKx3D0pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RzwQTFjZ57qzFp07BpNhwxBISUTlC0GUMABmg8ADWpw=;
 b=F+U8ClBTF2tckBpKQ9h9ZAiLHJ5Wfk14qWHuUEVacHq68SuQlUC0pcEGk5i2vU7uUsw3SOZ+k34mTxVqckaR3UDub/imjlQPCX0Ya7ayOyd3TfcZH6sw/Ky4iM5FPzsgq/FgKrpMrinv1xFFlSfJhMVfB++pGHg6jnVHch28+AP1Oa3DqQFDwr8N3uCxgJdsAYbAM2J7tFoMIBWAGA41rH9kJk9VDjioUqhOhisgvxyV2n9z5P68ItSKt7oym2P8S+Do5v4vvyiU81H0nACBz3W6nYurYWLuP6xQ4Clf2nPZO3SWRO3nwJhzVcGBTdWIFotcaozmu0J5GbtScYT+CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RzwQTFjZ57qzFp07BpNhwxBISUTlC0GUMABmg8ADWpw=;
 b=tQTNPJP0n1Lz8nD+z1vTNpPI9s8TbRjEPk9n6gGUQwPr5U61zqDTb9jEyEV1Wcl6fiIecYC2hpRpI4NETzWb2WtPKtUAxvtoRORE4vn9dOyPqZ0+CnZwnffgvqMIzU22JXiRxS/DwL8jOVbMKFrAbfg/wp9lJrm3vmXlvqyxkb8BsHjTEjTM/pgtsWqFDlsLLso8gmLC/yU7CSmIbUrbH5RxkP9otE5O6O42/uoRpGFsQjkGvCGfrjITwkthBP9B6tKAVhPrYtuyYVEpJqMPaDi9xprRNyfoK+Pz12b5sbwH5W7E+EcF7Yqe7SrA49F3qhX0VprnidCBKnv+GI3FaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3f413bfc-ba5d-5370-f474-8036f5f1c02f@suse.com>
Date: Mon, 17 Jul 2023 15:35:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/3] x86: allow Kconfig control over psABI level
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <0b45bc88-fe5f-77f1-9f9c-37d9ea1ec73c@suse.com>
 <6f462a2f-2e91-6397-a527-18eeade19476@suse.com>
 <CAKf6xpvCFyQOqzekw7hV++yMPBDRCZxTagMQ7Fvbq244RrR9CA@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAKf6xpvCFyQOqzekw7hV++yMPBDRCZxTagMQ7Fvbq244RrR9CA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS1PR04MB9582:EE_
X-MS-Office365-Filtering-Correlation-Id: d0ee5211-0cdd-44b0-d9f1-08db86caa032
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ANFXjEf0AvtYIuvDoS3IuBxFiUi8bw6q3YvlCKNciUxyFPDwQ9UahcYSEwh1JAkOGe4ZwmdycDJW/H+yZk7GJ2ORoIQ7tRVRYST6pIK8syRn+picODs9a78hIHBUwQ4oAarEnig11NS3uezj6vX2drC2qje6tgwZxgwBkttMRpunMICMdNz17GjfIsa8vDwu/PuQ/saBEwMvcI3jgr9htr494J5Wulk1RujQ9z9EWIav8hEgOBU4m877hPnXaEafr2a4I18fgWkP7zhjCh2p0NAvz44/7xX55Fkw88Gdu7bYfBWVKoCRNB2ichMvH216Pn34J7Eoxk08ufowQ/UTFADR7Ra0IZVj6QCphxGx3BFNnNDOMG2t/hamOl448jITbcp/oDkOOdFdVzH3jRZTJ0XxleJGjFVE2KgAzFK4rUQct3G35knbupriRlEwVbojYVplq92IebL9o6hU6vDrjPbEIYJK5ZfAgyF3ii4qbdVSjDmysDUV9g7i2XyuiB3jwwwxukwQNkI8GbdPOvb53Se8qJnplX8XdWad4vzE5FtEaMmJPxFTraztVbYz2ygy8bmxCgEcdPab3l+WkXdakTHC6xOdOXmfCNWQYMK5qf9TooPq2ImnJmktqVS0OVO6Vph4Zvb8JKMOI1EhPRhzpA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(396003)(376002)(39860400002)(346002)(451199021)(478600001)(6486002)(54906003)(186003)(53546011)(6506007)(26005)(6512007)(966005)(2906002)(41300700001)(4326008)(316002)(66556008)(66946007)(5660300002)(36756003)(8936002)(8676002)(66476007)(38100700002)(6916009)(86362001)(31696002)(2616005)(83380400001)(31686004)(66899021)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bnFZRUNJSUxFSTVVbjk0Qlc1RDU3QUl2RWxkMjFqVnBsSFhJdjJmNHd0a25k?=
 =?utf-8?B?cGduYUNHQ28vU0lYdzhZeTdob3FXQ3pNU1pZdjBRKzlhMzZ3ZFBsWlhQTzgr?=
 =?utf-8?B?QzdMRTdmeTYzR2l5VkxUUnZlRDBJeUpJRlN5Y1ExZXExdnJpZzgzMlFHMDF4?=
 =?utf-8?B?Tmx6WWJNMWx4Z1krWUJPWnZFMmh0d2ZSYWp6UFN4NUJZUEtUcGZiSFVhNVZm?=
 =?utf-8?B?Y2dZclAzZG5JTDZkVXdhQW5rSTdGUjRYa2M4a29MNS9HRHorQkhPa0tKdUo1?=
 =?utf-8?B?ZkQ4T2NmMnJRNTJ5cnMwYmdaenBFbWQ1bEcvcGVpZ0dkc0hRbThUQWNvV0k4?=
 =?utf-8?B?VVhZWUdwbFFmS3RZWUZZbEw4ZWdaS1dJemp5cFhaVU1US2NpZWNWVFZTTHFC?=
 =?utf-8?B?b1JTOTlERWlYU1hYTm9xMUhIeHlqSUlNblQ1dStpMjNrVUxiTGxMQXZLWmpF?=
 =?utf-8?B?dC9mZjI0UUllbzBUN3JpQUlzVGQ4VjRWaDh6K0tzQzhCU2ZCcGpiUVZXVlo0?=
 =?utf-8?B?WlFIWWJuMUxPM0psR0FYd0duRk1KWEF1S29LZnlaTnZlcHJ2Q1I0WGFzVmFS?=
 =?utf-8?B?aFQxN2M1S1lkem5GMy8xY0pTOGVuVEVGOS9XKzRnektIOUt3QUVkaDhSMDND?=
 =?utf-8?B?VDdtbTdSeTNrVkJzNm5vNTExU3hjajhSTEZmTitwWTRhNmtnTGRpQzAvYXhy?=
 =?utf-8?B?UStZYzdDazVJNkUxZE1icE9vV0NXOXlBZDlpbElCZnMvMm5LNkplNXNKTGRT?=
 =?utf-8?B?N0IyZTJqVUtHSTdwOWIvbDN0VzJxUmU1aktHTk9mQldlRkxtRkJ3R1Q5dGVF?=
 =?utf-8?B?L043bVhWdGc0ajcvZ01VcXNPNUQrN0dVMUN1QlJKQjMwZjU1c0c4cWVqTmMy?=
 =?utf-8?B?Y1VFMzBTRmk4aUlpYjdLeCtkR1JhTVFybEY0Rk5GaHBnNHNHS2xrSHFDaHFJ?=
 =?utf-8?B?YWlVSUJNbzFGMzlXemlrVnUrS1hHZnBNQTRBb1RNS3NiNUFDQ0hqVVBJZjFL?=
 =?utf-8?B?QkRvdHQ2bktBVDdXTkRwbTBWNVNSUHdFZ3VwWEtSdW9RZDh2OVlhQm5iN2VC?=
 =?utf-8?B?d0pESzdNSlVDZWhsZVA5d0JaODBRM0RITVNpL0tjQ2IvUnVMSWxKOFpyR1Qz?=
 =?utf-8?B?NmcwQ3hlUDV0WE9Xdk81T3dnRjYvMmY1djh4R3JkaGhPV1l6eldRNnRCMU9V?=
 =?utf-8?B?Z3o1UW5FQjc4eVF3Z0lhM2FTY0ZoWHlVY2VrYzM4Wi9nSHJPSDJwRUZWM3BY?=
 =?utf-8?B?NFE4SUtLQ1RWckJ0cWVwZ0tZcE5seDB6ZDVQODhmMHJBQTNPUGh2bTc3WjYy?=
 =?utf-8?B?ckdoS212ZUFiTEpLcjFQeGdXVUY1Qk5pUGlyZlBDT3Y2QWFlNHEySk1CdUw4?=
 =?utf-8?B?aFJ6WmNwS2lKdGE1YUhFOXJRUnFTNGZER2V4cnVMaTFjUU8rQ2h0M0c5OURr?=
 =?utf-8?B?OVdVZmVBYWViSktSUEVINVBHUE5SalJMVysyMFhoY3pNbmZvV0hSbkRxY2tw?=
 =?utf-8?B?azNlME1uckkwYWlMdGtyM29Zcm9YdzMvSTZoNDdJTFRyRVVLcjg5ZjJLTnBW?=
 =?utf-8?B?aVBUcklPWGh4MjZFUlI5eVYybkFQQjNTM1o0cFZrdW0xRlU2K0k1dXAyUDlH?=
 =?utf-8?B?UFZsdk04bzdaemJsSkUzUVQ5dzJ3aWoxd09qZVYyWm5vcTRRTDgwdU5ZL1hs?=
 =?utf-8?B?V3pwdTBrWHlvanBxTVZlK3RUb2phMSs5T29NNFdyUkVDWExLOE0zYmZkNmRG?=
 =?utf-8?B?SWhTb3BnWDVSU00yM1BQWjJnQ3dOZFRHblpuNHNhU09JZ0dwSVdNcnpxTHEv?=
 =?utf-8?B?NUJOdU5SOHlHNDdneUhoSjhGYldMNW56eTNLZDFKY1BTc2RoYW1PL3dCdDgw?=
 =?utf-8?B?eHZwcE1US1liVHg3VDNzUmhHRm1RWmVxMzltYmFkRHM4VjVXaTRtSmZNRjc1?=
 =?utf-8?B?bi9ETHoyZVJpZm1JR1pQOFhXR0RrUUtWSXkvUGlhbWdPVWZxUnpvcUhGNVdx?=
 =?utf-8?B?a2QvWWQ4dFJSK0tqaFFUcHBoZ1RoaDRVNkxRQnprU0pqQ0hvL3ZzOVA4Vm53?=
 =?utf-8?B?V1BvUlBDcUc2c3NmOFZjaS9mbm9ZUjc4anAwa0lWSG5vMFI2a1BqSjdjY2Np?=
 =?utf-8?Q?DLjUVFeeOCJ7bkasWfRLEdtY3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0ee5211-0cdd-44b0-d9f1-08db86caa032
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 13:35:03.3335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aqKQHfon3oJSK2kNXUMIDfwxE8di2fx5Uletb+0OR/OXCMGuyRhoT7cbGQ6rw3NQvJMW0Kw9TXU/h78bQKWitw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9582

On 17.07.2023 14:23, Jason Andryuk wrote:
> On Wed, Jul 12, 2023 at 8:34 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> Newer hardware offers more efficient and/or flexible and/or capable
>> instructions, some of which we can make good use of in the hypervisor
>> as well. Allow a basic way (no alternatives patching) of enabling their
>> use. Of course this means that hypervisors thus built won't work
>> anymore on older, less capable hardware.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Thanks.

> With two comments.
> 
>> ---
>> TBD: Should we, just like for NX, add an early check in assembly code,
>>      to have a "clean" failure rather than a random crash?
> 
> That is less confusing than a random crash.

Of course. My thinking behind not doing this right away was that people
aren't supposed to use such a hypervisor on incapable hardware. So we
would likely add code for something which ought to never happen. Still
for v2 I guess I'll add such code (then of course invalidating your R-b
again); in the worst case it should be easy to rip out again from the
patch.

>> --- a/xen/arch/x86/Kconfig
>> +++ b/xen/arch/x86/Kconfig
>> @@ -118,6 +118,36 @@ config HVM
>>
>>           If unsure, say Y.
>>
>> +choice
>> +       prompt "base psABI level"
>> +       default X86_64_BASELINE
>> +       help
>> +         The psABI defines 4 levels of ISA extension sets as a coarse granular
>> +         way of identifying advanced functionality that would be uniformly
>> +         available in respectively newer hardware.  While v4 is not really of
>> +         interest for Xen, the others can be selected here, making the
>> +         resulting Xen no longer work on older hardware.  This option won't
>> +         have any effect if the toolchain doesn't support the distinction.
>> +
>> +         If unsure, stick to the default.
>> +
>> +config X86_64_BASELINE
>> +       bool "baseline"
>> +
>> +config X86_64_V2
>> +       bool "v2"
>> +       help
>> +         This enables POPCNT and CX16, besides other extensions which are of
>> +         no interest here.
>> +
>> +config X86_64_V3
>> +       bool "v3"
>> +       help
>> +         This enables BMI, BMI2, LZCNT, and MOVBE, besides other extensions
>> +         which are of no interest here.
> 
> Would it make sense to try and specify models?  According to this:
> https://en.wikipedia.org/wiki/X86-64#Microarchitecture_levels
> 
> x86-64-v2
> (circa 2009: Nehalem and Jaguar)
> Atom Silvermont (2013)
> VIA Nano and Eden "C" (2015)
> 
> x86-64-v3
> (circa 2015: Haswell and Excavator)
> Atom Gracemont (2021)

I'm not sure how useful this would be without supplying a reasonably
complete list of models. I don't think we can expect people to be aware
of the sequence of model names, without which specifying just the first
respective models isn't very useful.

Jan

