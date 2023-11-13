Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5C27E9710
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 08:35:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631324.984546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2RSz-0007vy-3s; Mon, 13 Nov 2023 07:34:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631324.984546; Mon, 13 Nov 2023 07:34:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2RSz-0007u2-1A; Mon, 13 Nov 2023 07:34:41 +0000
Received: by outflank-mailman (input) for mailman id 631324;
 Mon, 13 Nov 2023 07:34:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OC0U=G2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r2RSy-0007tw-B0
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 07:34:40 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2040.outbound.protection.outlook.com [40.107.13.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 17febcd1-81f7-11ee-9b0e-b553b5be7939;
 Mon, 13 Nov 2023 08:34:36 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8334.eurprd04.prod.outlook.com (2603:10a6:102:1cc::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.15; Mon, 13 Nov
 2023 07:34:07 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.015; Mon, 13 Nov 2023
 07:34:07 +0000
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
X-Inumbo-ID: 17febcd1-81f7-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GoDywfOx8t2+R7p3pmdABxqNnngqJmlyf8UOtiKQmAuMbLStoA4ODbr/o4rCE9p5D/vM0/X+ViZYIB8gAb0Bi6MrD08bd65RuU/Oj6T31sI6JET3Jt5l1M4O89DGMSQEGp4Rmzy20t0ibLPNW/SGHxxjGXZZKDbJBHp2JnbiisdumpcXeZroEju3tFZme3rTEgMAKtCGuJN439vRqxedMfFUaIUkkEpRRVqOlmCBETr/Prm956wksDLdzlK8IcV9+DjA+rOtZS2NS8u++pC4vjsh584yzr+DCn61P9mqX464x974h9G0Rpuor9tnrGfPjo2SWFNfUXcrQYL+F8OBbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cvFA9mQBKyyRZbN5UVnqD8Ge0EpTSq4ZkynkZUuWjc0=;
 b=WEGe7pURzHIUdvCRSygDkOJK3Cem3XLAJIDMq1nh6J4GxtG6ionc9oaY/W5R+JhBlYVOzTT9PFJQl8ljoXEf3ys+NVo5szCHL7/xXbJgAZjvs8lomP1R/IQJ2wXRBerZVzCTidVkkdfik3v9kK0oK5JwvUOdAiPlkXmwjddwZ2DFO2DRMrvJaNR6mL0P4GRM/sc0wE/cUw75oDSyNGlKFu/8VSoEx3q3OtobwUpziTzp5dOISFHhdgYihZ/SqFdoKS3rJmRAMhdC2boX8X7KcuyOYFhwsbA6hwR9/EN1peW+abGfLdtFF0W40srvaJU3NAgM7ajsHtRSrdSyjX5nzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cvFA9mQBKyyRZbN5UVnqD8Ge0EpTSq4ZkynkZUuWjc0=;
 b=ktJfdWFwm1gJxcoM95nBw0Y5LhbAt/PxuKU+2wp/kQI+xzslu9GE3JWyT86YrdU2izPF6ft2CFQnKSYH1NNgulZ3Ocs2LCkjDfACR5SmQVqflylOkHkh9886gQH3jc63v6vW7aQxPv+2ctwUx4Cb7sNsBWo6je+cw4OyUtHUugxi0/UiV8pBv3+FA5alwzbn7aDXokxDQSdP6H+sdJm+Qf08STZBNNSnKuWz25CoZmhH1YFoln3rIgeGY4et5vsKmXK2G9qpPYG1aobdAEXkaMdUwpGKASFrKTnXBfL4BpPJjI5lOnxBFlm1Kqnd+RQh+z0kVpwNsAlXiMsUW6dN4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ce41e6c7-8fff-5bb8-7866-903631490f7e@suse.com>
Date: Mon, 13 Nov 2023 08:34:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH] automation/eclair: add a deviation for MISRA C:2012
 Rule 8.6
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <4de6c01f8af987750e578b3d5733dcd4ca536a9b.1699615143.git.federico.serafini@bugseng.com>
 <bd82d5d8-5bff-cbfa-2014-8be866892a8e@suse.com>
 <1d1baf90-d21f-49b0-91c1-219653aa99ee@bugseng.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1d1baf90-d21f-49b0-91c1-219653aa99ee@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0155.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8334:EE_
X-MS-Office365-Filtering-Correlation-Id: 356f01ec-bce0-4f50-ac05-08dbe41aeb1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	s+kxFRf+Lm/9ldvOvFKln/tbkEikBpAMAyio2uK8tecxf4C82kkw1rZhaH1LI3MJRLp90hYbxPjLEa7+L3zD0KdAK5qRb/3V40GFQyfZ2AQQHj6mkoWFWgQo3X1K/w4TNQPsci+M/jPIRlfNA8f796+3EfGpHFD4zGHJ3Qw0Q2OV54f5IvNFMX4MTSdVZ4IcXcuW1E4W1uf3ulfBud/dNNsWkMGzGO1mOWBDz9dtVDhnDJ6DSPHbKSy1WJB9qfqijuuCGhhb1jFCDlY97GBC/RjPZ6nsOSLd+paxcXu4iZnul6q8x04YHm3FNL9AMNPl2W1Im2eEJSPfR2NUrgYSc5D+Vm7WdUCS2TVYKwkpn4kxqLikoCd4zPaU0jEUbl0H84ARVA90rHQr9gbGRFbZF72o6lE5i4/z/h6fQ79yUcalkIJh4E2lSzoxngRpAYZL0Wf81XpHyhUQiSpF+eZESAo/f45yrIfcexuP2Cg/DiSdFBVCNstLYp2Bszgnd6wlq8PZSymH6B1G/rUQdwNNfIVD11dueJzOJTb37IR/qZBV/hTTeSYsPTE+g/Y/MFsncNHey/f0QRYQHMpwq2eFQry4hHypPUwMudl683op5fV0SsTLwG177qlgNfJiXDrIklROhF7PWBCOxvv37INRDA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(39860400002)(366004)(376002)(136003)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(54906003)(66946007)(66476007)(66556008)(6916009)(316002)(478600001)(6486002)(45080400002)(86362001)(5660300002)(31696002)(41300700001)(36756003)(2906002)(4326008)(8676002)(8936002)(38100700002)(2616005)(83380400001)(26005)(31686004)(6512007)(53546011)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OFZiWi9zMG4xc3FBdC8rdXRIYU9RZDVFcHBMUStzVTlLci9FUXA3NXhIeEZZ?=
 =?utf-8?B?S3hWU3hzdkFSR2lBWkZnS0dyQWNUOFd3WUM1TmxlL2hPUHhqdzFHR3RNYXRV?=
 =?utf-8?B?dUp3RHlwQkhwZStkaFBVK1hsQ3FKWmxMT1FENmgzbHEza0EyOXRFbGlQaDUz?=
 =?utf-8?B?QnRlbjVPVGlOV1ovRnNlUEhqZG9BbTg2U1FRSWxMSkNnWkxJd1F0VHhTRkcr?=
 =?utf-8?B?TGo0NE9OeUp4L0NEQnowN09GWXduQVVhcjVJc0lDa3ZWeEM4a01tdHUwTEwr?=
 =?utf-8?B?alBxYnY3VUlEalcrMEZ6OGUwVTBaNlMvYitDazhPVFBoN1djbmw1MVhiSksx?=
 =?utf-8?B?b1NkaG5FcnF6cWN3QUJ2WS8wQkxvZUFuVlV6WWhiRGNSdXNBcTB5RWU3RFo5?=
 =?utf-8?B?Qk0wWkxpOUprcUlQQ1pHTnlaOXoxdmJIcWwvV1JsWHRUUDN6dmxnMDVWRkVi?=
 =?utf-8?B?L1FTd0NManMyWTJ4azVwM3Z1aWVyUm00cG9tYVhWekdJbmF6R3o3aUVZenVx?=
 =?utf-8?B?cSt4ZHV1WEdVNGo1clcyOTJWYm8xOE9IOW4yblA3eWIwZW01NWFLZnpSL1F5?=
 =?utf-8?B?eHF1MStkbHl5eGdoQlpvbTlBamZYa2lQSHZKNzdDUU0wQXBIckJXTzF5SThS?=
 =?utf-8?B?ZVJsMGJaelM0M2RkZHhkQmVLUllTMmY1dFJXZEN0Y2tHYTEzWW9MSndxdG1h?=
 =?utf-8?B?aE13NmJVU0FlOGc3UHc1RUZpcjVUS2JqMDQxNXphNjVEaFRQNTVycjZaeENp?=
 =?utf-8?B?TUZleHM2bGlrdWRRbkllcTZVNVppc0F4U014dWlrZUhjTlRQbWpyN0xyWkNr?=
 =?utf-8?B?T1F1UGViVkFDb3NhRTY3TkpvTXQ5ZThMZ3g4bUc3ZU9RZEdJamdtODhJdWlO?=
 =?utf-8?B?UWVPUXJ2djZjZDFBanNoOHpKK2ZWNDUyUWJ5RGhMaVQ3alQ2bXhLWTdBQ0hT?=
 =?utf-8?B?NTY1TXZHeExtNTlRbXlCV2VZQ2lTNUkrRXZZMDYwVTRVN1hMWDdUblBHam9q?=
 =?utf-8?B?K0xNc0Y0YSt1cExyVEJGVzNZcndxeWF0YTZHNDRjMkhoUHdlV2NjY3BGNXZM?=
 =?utf-8?B?SWw4TGxlaktoLzJ0eHV2Nm5kbndTT1VSV3NUMjUrVDVEY0R6RmVQR1FoS3Nq?=
 =?utf-8?B?aGZLRUxRSzZOTmxQTnBhTkJES3Q1YmdWekpPZm9tNFhtYlV6eloyb2FLaGJl?=
 =?utf-8?B?c0pCbXp1Ukl1N0NBTkd0OFp4UVlrMEpxNVZuZXhRdTRsNFZ2aFJkWmV3WUlk?=
 =?utf-8?B?ek5WN014MENWdjhvamFmeTNwRnFnU2JiYlVSOTUvR3d5NWRGRTAxcVBtQW52?=
 =?utf-8?B?ZXlLZGs4OFBBOVNjK0RBMjQ1T08zS1FjcDd0WllWYlJDVUNaK2k1MUxNMGdT?=
 =?utf-8?B?NkYvajBhVW9PbVRNOHNqNHhLQkc0eVlYOW9XR0NzUk1GcDZnY2dwcHZmNERs?=
 =?utf-8?B?Tm5iUDRvNHdQNkZIaHd2UWJxcUQ4akdmNFRDcGpGUm4wYWZackR5MHVNYm9W?=
 =?utf-8?B?aktxeE9RTnlQQ21WN0NJL1dsZ0JDUTRPZ21RQmxvNlFTdzlYZEJQUzc3VVp0?=
 =?utf-8?B?NWlYSkJyZlNxSVdtdGpscVFEUVNncVk5RXlPa3FBVkt6MWl5R2NzeTBJdkxR?=
 =?utf-8?B?N1RvODYyaURSTi91TEtyYUQxZU9YZXpNbHpNWkNrMnZGcGc1VXBWYWo3VUZK?=
 =?utf-8?B?WEg0M0FhU3hSNER4R21teEVDb05XbTdVaUVnWE5VcnNibXR6SUxPYXpGVXdt?=
 =?utf-8?B?cDM2ZVJkV2xIblBmVmZOb0s2eTdnYnh2N093MlZxaFQxSzAzdEZsMUoyK0xl?=
 =?utf-8?B?bUV4Ri9HZGI1Um51MlRTSE9tOExjd3dsNEhQYkFpd2pZQ29sV2J6d0JmdHBG?=
 =?utf-8?B?dkdncGtGcW5uWmNqMkNVMW11eE02Vk13L3lGNXVnQk5acUdSUHRQK0JXOVNn?=
 =?utf-8?B?Vk00TW1MK3JXVG5NRXZ3ZllrYmJlcE10VDYvV1BnZlVMZ2pUcFhtTGxVYXRE?=
 =?utf-8?B?Q3puQ0t6RTJtRXJkWU8zVVR2NmNKUUluTWJLQjU3dExOY1dnOUVEV2NrUUYr?=
 =?utf-8?B?TkkzaERSTWxWK2RoRnV2U29md0NCSDFRazlGUGhXaVNaYTdmMk0rM1VOTEds?=
 =?utf-8?Q?hTd+9bj4zp5ZgaIDhRbc+4Q8Q?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 356f01ec-bce0-4f50-ac05-08dbe41aeb1c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 07:34:06.9632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OHlz+Bu4nnI4GaPcmAhOi/wMabqxams2+hFVZw6ihyGXkJEWOczZFP3gs8p6F2bpyQt5hRNIKybDp5FKUcGYEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8334

On 10.11.2023 17:54, Federico Serafini wrote:
> On 10/11/23 13:41, Jan Beulich wrote:
>> On 10.11.2023 12:23, Federico Serafini wrote:
>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> @@ -214,6 +214,15 @@ definition is compiled-out or optimized-out by the compiler)"
>>>   -config=MC3R1.R8.6,reports+={deliberate, "first_area(^.*has no definition$)"}
>>>   -doc_end
>>>   
>>> +-doc_begin="For functions memcpy(), memmove() and memset(), if there are
>>> +multiple definitions, those belong to different archives and the behavior of
>>> +linking is well defined by the toolchain: only one of the definitions will be
>>> +linked in (the first that is encountered searching the archives in the order
>>> +they appear on the command line)."
>>> +-config=MC3R1.R8.6,declarations+={deliberate, "name(memcpy||memmove||memset)"}
>>> +-doc_end
>>
>> Why would this be limited to mem*()? Anything put into lib.a is going to
>> be treated like that.
> 
> If one day another arch-specific definition for a function will be
> introduced, a violation will appear but that is not necessarily a bad
> thing because it will lead to another check of the compilation scripts
> to ensure objects and archives are linked in the right order.
> However, if in your opinion this will be a waste of time,
> I can propose another deviation based on "xen/lib/*".

I think that's the route to go. As said, the whole purpose of xen/lib/'s
lib.a is to satisfy any "library" references which haven't been supplied
by other means.

>> The description also isn't quite accurate: Per-arch mem*() won't be put
>> in archives, but in .o files. Those are always linked in. Anything not
>> otherwise resolved may then be resolved by picking objects from
>> archives (appearing later on the command line, unless specially grouped).
> 
> What do you think of the following as justification:
> 
> The search procedure for Unix linkers is well defined, see ld(1) manual:
> "The linker will search an archive only once, at the location where it
> is specified on the command line. If the archive defines a symbol which
> was undefined in some object which appeared before the archive on the
> command line, the linker will include the appropriate file(s) from the
> archive."
> In Xen, thanks to the order in which file names appear in the build
> commands, if arch-specific definitions are present, they get always 
> linked in before searching in the lib.a archive resulting from
> "xen/lib".

Sounds much better to me, thanks.

Jan

