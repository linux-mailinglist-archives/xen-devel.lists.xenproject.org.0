Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3997488EF
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 18:10:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559410.874358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH54X-0007Ba-70; Wed, 05 Jul 2023 16:09:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559410.874358; Wed, 05 Jul 2023 16:09:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH54X-00078f-3m; Wed, 05 Jul 2023 16:09:41 +0000
Received: by outflank-mailman (input) for mailman id 559410;
 Wed, 05 Jul 2023 16:09:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIgq=CX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qH54V-00078Z-7a
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 16:09:39 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0621.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 552c9573-1b4e-11ee-8611-37d641c3527e;
 Wed, 05 Jul 2023 18:09:35 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7661.eurprd04.prod.outlook.com (2603:10a6:102:e3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Wed, 5 Jul
 2023 16:09:32 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Wed, 5 Jul 2023
 16:09:32 +0000
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
X-Inumbo-ID: 552c9573-1b4e-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iixZgmlfQZdmARS041G/rfHmjfzJwrfs8edlyuMbqPqDWn2XH/YGFkoIxVIldsUHObgIryMiFPFPC+Xj5/38bvAJvZo9qGlm8G3uhNVEI20bp9GIynt1QfPKBI9lTqcP0htiywLkLe08/hTdTpLfKEWhkOUxHTP4QXbtmB8NBmQ7OgokZIOS6wo0bjGxZOtg6fFjBYBY7z1L17e84lEhuUg+du1EpZDYFmA3Sno4zoP0h5P47RYiraH55k9Tmbk2U+7w5nzYz3hGcR73Q/cNRRj/SGuy43C0L1xNOJMhiPzqwc3g1bNovg5lHvSIwKGAroZE8IHYrO6d6iO+N2nMwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0VKhlOi63tb7CSHiqLYBRVxGNILIVhDrL9rIEgQudYE=;
 b=RshxQBN4SqiqmGUOPvMk3V3g1V74eD/TPbvPQqaa46+oZ73llx9kfMV4fVtSvDW/wgkLzfEdHHNHru85NWGi0z8AOcCx+yGgsKsjhVay/syDm2CLr6JNqiTiG4m6haGlcJF1LinCKaw1VfTQJt7TGP4CtpF6PsWmSvG4fSYkc7kPCnN8NuWgXtzkGJKsAH1gp2lAxogohaBOXBA4B6cbafX8Hs9jgawrgRrXOESsPUb/35w6+Zshuo6ReF95I4Da8NsIg9dmXfDrRF3ve+ucYPR4hEVFqyJPBB2hROri4GJ+s+vNUfYWD8YHYdkeIJqXd4T/Yb0DOgqSidMRDhLWSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0VKhlOi63tb7CSHiqLYBRVxGNILIVhDrL9rIEgQudYE=;
 b=2ODfQnnYKii9mE/mOqYittRxNqyXw8JoUDGc0rJAG0OPzeefnAU/pt2T1BueRr0FVAwSt/UnEBaUAYMwPfAVB2y91gRHcZegMnyqJyNw/UlLBJS081Jqe6Nw6m8M0KETnZS5xCp78ok1YdDc3MhwN98Lg4jsZAublvmMxGvqcIy8WfZsknzXxNiyKBrYNDP2rSAwEV0zCgFPW8NapjCpekdYLuV1663vgEn3DMhqnQ4ldRGHjwOe4ZX5ZNKHeV7ef8bVH1A2IwAF287ZiiqTgqk/Mb8gKYlqkZkyio7V51ZnGsRkRlNelp/YgRlkZTBa6c/BS8jXhdBUnVKXqmAMOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cbf263fe-9221-018d-b187-3d17be76e937@suse.com>
Date: Wed, 5 Jul 2023 18:09:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] ppc: make also linking work with big-endian tool chain
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f56a208f-97d1-b7ec-afad-3b7bc180cf87@suse.com>
 <4725795c-3f0e-af91-5683-1059ba6163c9@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4725795c-3f0e-af91-5683-1059ba6163c9@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0087.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7661:EE_
X-MS-Office365-Filtering-Correlation-Id: ed88e716-7413-4cca-1dab-08db7d723839
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TE3J/Yx5tX9y2ZAdJcsyYgjq6RtFLTZ4MngECr8obGmeOSAsgCY+cKznjSAIambFHp5QXNYwqGNi3OU2chQSkhSN2Nrh4ByEq6rqV4XVioQfCZMIi6tklOxdGptOQBIqhLReqoI1HQa9DOmmhGPb6IRDn/k4q7/KvCBPkd6fMV0KKbGm/Tbk7e/JXUr+3i4cMbGJeSVSppMFWBRpPNCwsJ9mtXx1oq4NitCBXDkND8OzGnN4ekXM9LocyTyS8wFcOfok8pWsd0Uy+TCqv1KJT9m1QXtE15IWHJpcAPH8QpiHib3FKCn5iXdE+iv7qZgUtxgWGMzo5junMYJWA3rCmdocxQRgnu9lL8W/u1sZMS0Fb8fT58EXkHvhDxODwX3SLTIDgL1KkHsky3tgOeOEsIPtHWf0CQBPGgjhGkzzc+8upF2xKyfpnn9eAAlCavtGRz37ipFkLYD4On2ZBzsspy7+Fc3f0Ozg6qql0/2pGXQHpghZzryzz8e3EL/Yz/50hFyoEyfFiMmoiVLl6mpN9IAyGE37x6AMRgtKqe9mjshyGcrRNcLzhkhsnBDREEzjBtLgvABGEAdbI/pn6BnW1NniZHI1UL//nXFo7sDLXf2nsNF9Luhun3prWLDcc58YlitjM6pbimIV3UpqHdUvPA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(136003)(39860400002)(366004)(396003)(451199021)(26005)(31686004)(478600001)(6512007)(6506007)(31696002)(86362001)(2616005)(186003)(38100700002)(53546011)(66946007)(66476007)(66556008)(110136005)(6486002)(316002)(8676002)(8936002)(41300700001)(2906002)(5660300002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bE1EbW56ZE5DN3IwZXpzV2llcTY0WmN6eEdLT1JRQkxyTGxPdzN3R0Z5OVZz?=
 =?utf-8?B?bUdUMWpaTE42dVZPQzAwMytWaFVqYXFRcjNrOVkwQnlPd05UV2ZHdTNiVmRK?=
 =?utf-8?B?VnkrUXJBeTV1RlFIaVFwSEpDZ2t6dU9SZXhmeFpZMWk5ektlUU92aGdHa1pE?=
 =?utf-8?B?YVg4Lzc1OU5hbXR4QVZFdTJnbkxSMkxRWVZhK2MvclBmU053cG15K1htZklD?=
 =?utf-8?B?TTFHRS90bXUxUExZTWpac0RvNW9FQnl0VFJXOGFhUWlLcG9ZVG5ZbzBFeG1a?=
 =?utf-8?B?RDJSNVdqcnNhbVVlc3hSUXU3Qi8wbHNzZVZ3UmI0dlNaS1duTEt4SW95c3Fz?=
 =?utf-8?B?OC9qMm1Db3VKc1JpQzZDdUJOS2tsSUpBYmpEZGszNlFmVVQyYkZZY1l3aER0?=
 =?utf-8?B?Ukx4VkgwYnlib21ENXlBOTAzTTRST2tNZ1hwOUZTMFI1SkczRjFWY0I3aVhq?=
 =?utf-8?B?Tk1nbTlUSVdqemhMeUg2N21CWTZGRUZsMDU0TWhJR1JLZHdEdG50S2QzYkdP?=
 =?utf-8?B?T0ovcWxJRjlQOUhyMzNCd2lUS2xkTXl4OTdIb2hKZ2tKNW5DRERzNzRmOU9r?=
 =?utf-8?B?Rkd3ZThVWU1NdnZOd1ViSmpLNDhiZ3d5WkFZS3JOWmlOejkzY3JhRUlkZnZV?=
 =?utf-8?B?RUFmdjhEdDZlQUh0cTJnVEZ1empZUXJna2NtWnplNVNOR3A0RXJBVDlwcm8x?=
 =?utf-8?B?a2tzYzIvejdSeHczYUg4UjE5MkRLN2dITjdpUGM1enJGV3NaMTNTMDh0Si9N?=
 =?utf-8?B?ditnRTYydU1GbnFNVVVDbERSTHFpblF3dDhpM2ttVTJZZHdVN0h2WUZuSEJj?=
 =?utf-8?B?TklQQmkrOXA5L0pyekpkTFZnOC9PNGNRRDhmcTY1MHBBL0V3UjhwS3BPU2FO?=
 =?utf-8?B?L3RGb1orRmJjUW9XcGpySnd1eCtQVHJOMkUxU1QyYUVFY0x1QkFBK0pCM21m?=
 =?utf-8?B?blZhV21RZEd0SktjZXQ4VStaSmhqb2UyQWpRMFR2SGZ1SXhXenc3V3ZTYjFB?=
 =?utf-8?B?MGt1QWhTWHpoSFVBU3RWWkFMam9YVWV1emcxVUtBazIzNm9ZQ3FrbEhOZHpz?=
 =?utf-8?B?SngrQTd1cFp4RU9uY0hCMHBLTXhzcG9WbmpTQVp4bDN4WjgvYjJzTHBDdkhq?=
 =?utf-8?B?cGFkM25NcElDbTJwbG1UelI0N0FpaEpWd29UOFczNC9RQnQ1blVRR2pZNVd4?=
 =?utf-8?B?TnlWb0UwbFFHQlh2MzNLMDI3WW9xTEF3UmtXYzcrMmJSQnQ2SnZubzZpYjZF?=
 =?utf-8?B?T0k5UHJZL0hrbDNMUUpNTVY4a2IxTXFEQ0hCREtmZ3prVE9RMVR4T1pCak9S?=
 =?utf-8?B?eTFhMGwvV1FrR0hwY05tN0N2MDFzZlIwTGVBTnMveURTcnJUS0ZUS004amd4?=
 =?utf-8?B?Y1pMK2Z1bmhKS0FZMHFEcUd3a20vUk5oditTYm1PckZWODlGZnVlN2w3VDFH?=
 =?utf-8?B?ZjE2TzFwSTZoUEZSY0NQZWRtcGQyVi9vUmVyZ09TT2dhNVhrbUpQejVXQkpw?=
 =?utf-8?B?czhVallpR25tblJubjFKOUJDeFRDVjZ5akRJUkV6WHlPYXZnQlRSTDFJaVJv?=
 =?utf-8?B?c3dKTTRvK2x2dll1azRFQ2NHUnFJVmExWUNpRmJrcTJSd1hYODQyUFlNNndM?=
 =?utf-8?B?eXdveDlkdkFCUURtMGRZcEQ3Sm1RU2ozemdCbjgySHc2NlFBOW5EbjJTMGFW?=
 =?utf-8?B?bFN6bXlPSkJxQThCL1JHM0pzVi9SaVdDVVJiTU96T2NVdmJveDhlM1FDS3B0?=
 =?utf-8?B?REpFb1ZlT3BmT2c2VTFZdW50aTFXbTAxN213MDFqekxIc3gvMzM4dVJ3TllX?=
 =?utf-8?B?cTlUdlJIYklYYjd4a1Q3MnRsYXJQb3NiVFpNbzhvUFlwa1oxYUxXbUVRVk9z?=
 =?utf-8?B?N1J4cFRZdlNVdkhoQXZlZldQSm1RN1pwTnVtbUVVY1FOYm9HaVE1UXlGdkpS?=
 =?utf-8?B?aWpOSjNOdTJpVEdlMUFMdXF3cG0ycEE1LzVNaEhsem1vbStqYnh6d1N0TW1m?=
 =?utf-8?B?bS9EZ2hXRUtuemp1dWd1dFJpY2NrSmFMY1hzRTFYU2J0ZDZsUHBycEpKMEU5?=
 =?utf-8?B?YkY3TUhoMFY2RDRsdG5aTWYyZ3R3RldMdFhIUUFRNzZNdk5zUWZlOWZuMnNy?=
 =?utf-8?Q?DeKK+18Wr9Do85L9A4byWlnW9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed88e716-7413-4cca-1dab-08db7d723839
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 16:09:32.7564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JsdVM3c+nJOYSmMDQ+KDBIwnlpPdym61wXDWmkjrTh7KY/7MNAtjfN1QtvrYDSB+LNYDSf9HyiLSWoSzGOjaMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7661

On 05.07.2023 17:10, Shawn Anastasio wrote:
> On 7/5/23 9:44 AM, Jan Beulich wrote:
>> Telling just the compiler to produce little-endian objects isn't enough.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/arch/ppc/arch.mk
>> +++ b/xen/arch/ppc/arch.mk
>> @@ -7,6 +7,8 @@ ppc-march-$(CONFIG_POWER_ISA_3_00) := po
>>  CFLAGS += -m64 -mlittle-endian -mcpu=$(ppc-march-y)
>>  CFLAGS += -mstrict-align -mcmodel=large -mabi=elfv2 -mno-altivec -mno-vsx
>>  
>> +LDFLAGS += -m elf64lppc
> 
> Looking around, it seems GNU ld also has a -EL flag:
> 
>   -EL Link little-endian objects.  This affects the default output format.
> 
> Linux's build system passes both -EL and -m elf64lppc, though I'm
> wondering if -EL alone would be enough.

What I did is check what gcc passes to ld when itself passed -mlittle
or -mlittle-endian.

> In any case, this doesn't break the build with my ppc64le toolchain, so
> if this fixes issues you're seeing with BE toolchains then it's fine
> with me.
> 
>>  # TODO: Drop override when more of the build is working
>>  override ALL_OBJS-y = arch/$(SRCARCH)/built_in.o
>>  override ALL_LIBS-y =
> 
> Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Thanks.

Jan

