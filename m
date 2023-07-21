Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DC475C758
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 15:08:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567535.886721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMprh-0005CX-Gh; Fri, 21 Jul 2023 13:08:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567535.886721; Fri, 21 Jul 2023 13:08:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMprh-0005AC-DR; Fri, 21 Jul 2023 13:08:13 +0000
Received: by outflank-mailman (input) for mailman id 567535;
 Fri, 21 Jul 2023 13:08:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FBlW=DH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qMprf-00059l-5X
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 13:08:11 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3a23212-27c7-11ee-b23a-6b7b168915f2;
 Fri, 21 Jul 2023 15:08:09 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PR3PR04MB7241.eurprd04.prod.outlook.com (2603:10a6:102:92::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Fri, 21 Jul
 2023 13:08:06 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 13:08:06 +0000
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
X-Inumbo-ID: a3a23212-27c7-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mc3DdGP7lnFt++9UkmnJam40DDas2OT80rWfv+xQm/ZpnVRocP/iVgZC15MENu8XHGQGiG6CDnafkiKvE9AgugoRr5kgrj2AYuBKbDBhqnrCG5oMxW9iYm8VKKfsb8nRpX9OE1GuLDgCGDP/4YoOKHFqijBQ8jxFTrxDl8c/3pSVmup/8+nJAJaH32ympVKH077VkJvfVbwfCaL0YcL9n+KDgDUbkvEWNf7CrL1iSAUfEBwkuc4VSIZYF1SJsWXD1arNAfV8RAsJqLR+x40qQ+rrHHQK3oImAFEGVrZkzFikuCodv5RAO9zy8Y6Y0rlall5InbE90L9GsAUhfMTayw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wO/zXt2A6oeKhu/5wzxD6GGL5EOBASzIU5Bvhpl1mP0=;
 b=EIFBuDV88YeLhOguPIeXjOzhdxs+WRl4XS5P1LbK/uYTsTaR9qleN7nuP3UsE9kEdrNZ7nmNx9Qpi9Rn1J6rx2DvKaayg3Er3oM91QpwPdcM1KEihroebzFnyJQcrV8HzeODU1ULU7DXJ7ppUwZRDVgSl78P1OB+f/foyICKnvE5PWdxRwor2JOdlEYf8DZDGM6I4r107vHUaeqa+071KtTP/6w+kmVNU04wrYU0N447I43ZOIMbBeMj+AGyxlE/cvWxqBJyoFz8uQ/v/+SIiQwc2KA2J7MjffaxcClNP8eLFW09RuAj+UbbUQI0vGV5/S55rYyZNVz2UkNd7rI5iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wO/zXt2A6oeKhu/5wzxD6GGL5EOBASzIU5Bvhpl1mP0=;
 b=tZNviXhqmyXuEZ5fyj4f2VfgriD+PBLcrAQsb0BxYIco+khalCLAUOD9S1IHlQx/fBNtP8FDfbvOqKIKtqZ8Xuu9lhYs/3o2yPGs0FID1wu6s6q7jreYRwFr3dE8ZMUR57wB6L1OJadFCpjKdzhjpwGdgtK3WOhanMaatZDp5Vs47X5c+H8CBcuV6IWk3WTFix1XsvnaWm8/f7DlTEE7v10buuALTE/3xlLIqauLMwTbVtjKAtQeeoNPTu8R2hXIA2gGbaqTjWZ1trwbGK5CayV1sFHF2oj0TX2MYLRb/uVcdmQJ7gVl2lPdTokgkdtq/3jU2UrV+Aj8KIDPu1B3Zg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <47ab1431-6a0b-6e74-92ec-8495c6bf8fbd@suse.com>
Date: Fri, 21 Jul 2023 15:08:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] xen/arm: Move TEE mediators in a kconfig submenu
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a44f74559f52d1fa90a3f77390e7d121c9cd848e.1689926422.git.bertrand.marquis@arm.com>
 <cb7b53bc-2440-8619-61ce-39c967b56eb7@suse.com>
 <DFD07AA0-E7E2-400B-8961-A646E5531DF7@arm.com>
 <6b24847c-5cd2-877a-bc72-16bb732e0ca2@suse.com>
 <C63A942A-AC5D-46CD-81B3-50B6376860E7@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <C63A942A-AC5D-46CD-81B3-50B6376860E7@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0225.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PR3PR04MB7241:EE_
X-MS-Office365-Filtering-Correlation-Id: ebbec8bd-812a-4ce6-2615-08db89eb864c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Hr89hdBLKJgvdM9Hj7GKCDcezUsgWITA9q36qrRhZE4CjL7q6PrDMZglO0wER7nvOx9qpypAFyQc0wRusD4rF9xIzfkBGimVr57tCWT+9zZjDrIpOH3aeoXwSCTtL7YzPAUCTey/mk/LnFCs4T71XYZtCdB1U1Zgk9tD6F323jns1W8UShedw8TkSc5nqFogxUb5DaxHnkhp0Gxj37CZMTNNtwI9IGklRqM0k1dyLyWhl/Tq44zj3DImjrvloSUaMPASfSN19/j4Hi7y2j24hFBFXnd3m82how/zBdzsC+eFmSNLowsWdaqOQKYI0ubhqZCVCet/VtxLZFFH/bpVMvkKlxbWz2aPksc9kKAM8OgyuBt4GiiZOSmJYFhxe0pJ6KUEpgZC0EJeOA7UtPvLmhpmqWkwvsIEoKKTFlA9uuvV9XNOQcg9PLOvYv/BVjmRWanXehZmtHZ9myW153zyOOXc1WP34J/d1RV2c+rCm5IBpS+z96dH9r+xUADwYonUT5zghRj3B3QiKHU0OfUS+2128Juhw8DNuYMBKK2ETrk5jI9D1APk0H9yJmlUsIkJ/vM6gK2pGnkA8+F4xFkpwNw6sxtskwL/grHXO/w4PVpLKh3bnuqIyewO/NKutFyeRAPY+/VbnmK8FuT5IrZ+AxZ2tXQj/3dsW8p5j1rg4zjuGcpnX/+LsIIBhc+GPSSc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(346002)(376002)(136003)(39860400002)(366004)(451199021)(31686004)(6512007)(66946007)(4326008)(6916009)(66556008)(66476007)(36756003)(6486002)(2906002)(54906003)(316002)(31696002)(478600001)(86362001)(53546011)(6506007)(83380400001)(2616005)(186003)(38100700002)(5660300002)(8936002)(8676002)(41300700001)(26005)(76704002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVhCNDh0SHZHKzMxTGJscWk2U1JvYld3cFV5YnNrQkZJSCtraEFRL2ovUlhB?=
 =?utf-8?B?MXlNNThvekllS1hTVnh3VjlqNjNqN0JwaWRrMDFwZHQ4MHF6b0JmeTJvdTN4?=
 =?utf-8?B?TzZHOEdQa2o4ZDRZdTdvNDByRE0zM0xleC9UdlZrOVNKM29PUmprTDErck5Q?=
 =?utf-8?B?UHY3T01DN3Z6WVFWVUhWUU42TU9JdUg0OUpXbnJnNFBCMXVDRnFYSEtVdmFj?=
 =?utf-8?B?dkc3RVkzbXFNb1ZRcW8zaFcxMFhUMHVnWFdXNEp4eGg5Y2l3T2V4TTJoYVpW?=
 =?utf-8?B?NFZtT2NVTDdLMjU0ZlFrRFVQNUFmS0dWT3BZak8wc1JTQjlUOER0NnRYSHQ0?=
 =?utf-8?B?ZXVwTmJJczFxRml3RncwK2NGQVFuSjRnM2Q4RTFSanJlcWRZYkw0NUYwdzZj?=
 =?utf-8?B?bzQycGc4Sk4xL1FoU3A4aGIwVWk4NFRvZlMrbi9zUzlTcGkrL25YU1dMYVY2?=
 =?utf-8?B?VEZJT3laaDRrYWlBK0g0WEJiMWZwUzg0VnV1RHdzT3JIMUZ6Z0lWZkhsRDNt?=
 =?utf-8?B?MWNkcE9CNi9xOHFsWGdJdzI5aVJ1NFF4Z3MvYSs0YWdZcFE1a1ZJMHZmVW9X?=
 =?utf-8?B?SlpFYTVkVUU1NHVQcFJJV2cvVTJrYWRRTDEyNEhrZDgyNkUvaU1VMkpuNFRj?=
 =?utf-8?B?eXNtd0xMb1BxMWdhV2lML1BYc3gwYUZzYVM2RmpvMVlaamxZNTFrNHcycy9h?=
 =?utf-8?B?L3BCQWRXUGZxb3g1T0FwTzZzZGlrdy82UjdWOElRdVJZZHhLeFZkNnZSY2NS?=
 =?utf-8?B?NzVNV0VKVTBCQVlHd0lKaEdyVmU5YWx3RkdZWktxSENYNmFibmdYdnNlbDF1?=
 =?utf-8?B?OGFmWDIxcGtYOVRyTGd6eFcvdDBOWnlnd05oN3luZHlrSCtXckRrNXp3bDNS?=
 =?utf-8?B?Y3NkZ3N1U1hMeW1LLzU5cVNENXR0dy9GTjhnbWo2cTZwVm9MZEwrOFNOYTRV?=
 =?utf-8?B?OVhuTlozVzlOOUpRcnhMY2ttZVp1UXgvUzdvMFl0dkpNNCtRWXN1eGROWitX?=
 =?utf-8?B?Wk9jNUQzU1RyUERIdFdmWitWV3BmOVBweHdtdUxnaFU5Z3Jjb0JBSlBDV0p3?=
 =?utf-8?B?QUFJOHZIZGticmRmcS9ZZEVlY2J6WHp4THBqUG0rb2xtMHdhK2puTDJzMGRR?=
 =?utf-8?B?bjltT2VIT0dBSWtvZlJuU05QdDJtcUNUNnM4ajBPTWlEcU5RZjVabHJ0Y0cy?=
 =?utf-8?B?ZkFnYWl1RDljZ0J1S2s5Y1hxL2JhdnlZVzkyUzJYSWowN1IyMmFja2R1c01a?=
 =?utf-8?B?YTUvRmtYVXlWazJ5Ni9lRkVHWWZQVW80WEZEWWdXblNPMThwSzZza3RSMk9K?=
 =?utf-8?B?Qkh1UXQ3LzY3K1BZYks2aVp0ZmNIZ3poVHJGMkFxYlVlSVlIeEJWQzVKenFN?=
 =?utf-8?B?N29zQWludmdOTmZPSU1SUVFrdjR1M2NhQUFueHFYREVaZDBmcm5wMTlGQXI4?=
 =?utf-8?B?NWJSNWpoaEU2RDlBd0YvV1AvNFF5anpiY1pFZ2FWbG54MjFsQ0JSYlBEZXNQ?=
 =?utf-8?B?RllOTkUvcGlBMjJzenRUSFdUVnBjWUx1KzFzOXUvcy9vQzBWdjk0TEZYN3U1?=
 =?utf-8?B?eWtoaTZpY0ZJRE1NU3c2MUtHczZRaVkzU0x0Tmdyb01vQTZqM1U0ZHNSbkZD?=
 =?utf-8?B?NDVFUnlCVWZ6YVpqQmZOQ3haVGFwMjBSclJNNEVUZDQ3MUtKRXlJeDJlbjk2?=
 =?utf-8?B?OVB0NGVWRHl3eVVHbU1xZUNpQVQyQzhhSGVrMTdPTDBrMG1nSFY2dmNQUWNG?=
 =?utf-8?B?R0N1NlpFYmxsOXhlTHMwcWFKdk4zcStQb24wbzMveXhVbWk3WllkYm50Rk9s?=
 =?utf-8?B?ZTdJWVN0U2treXlNcWg3VXF2OUdraTlzMDN1bUZsdktGOVY0YVhRTm1pRmgz?=
 =?utf-8?B?TFdDd01BZ0p4d1l1SS9LOWNjQ014azdRN09TRTF0cThEUUlLRWwrdXE1RjBS?=
 =?utf-8?B?OERtOWFtR1d0VEU3cStwZlRQUFBlY2RRcHlZamU0L1FxdHZlaDV5SFZsaFNo?=
 =?utf-8?B?RFZWMjZodGZjS215ZXpWNlpjR2tQNVlKdk5WUTVRMUlsakw4d0NXSUQxQXBm?=
 =?utf-8?B?d1hrOG9DNys2Rlo1dEd4amtEcHdFK3NhbWlYNUlXbExhNXhORzNBM05DQisx?=
 =?utf-8?Q?TKpxAbyL9y97CaVL6FJ0AljuB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebbec8bd-812a-4ce6-2615-08db89eb864c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 13:08:06.8089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IEvBUYKY7iB6RK48p5ZUbG9mCBuvSLZ+0Z4OnR/Kj7YHkCZdgO5GLKHShnlbAMjvEG+7xEML/16kVfUU8X0fCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7241

On 21.07.2023 14:27, Bertrand Marquis wrote:
> Hi Jan,
> 
>> On 21 Jul 2023, at 12:45, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 21.07.2023 11:02, Bertrand Marquis wrote:
>>>> On 21 Jul 2023, at 10:52, Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 21.07.2023 10:02, Bertrand Marquis wrote:
>>>>> --- a/xen/arch/arm/tee/Kconfig
>>>>> +++ b/xen/arch/arm/tee/Kconfig
>>>>> @@ -1,7 +1,17 @@
>>>>> +menu "TEE mediators"
>>>>> + visible if UNSUPPORTED
>>>>
>>>> With this ...
>>>>
>>>>> +config TEE
>>>>> + bool
>>>>> + default n
>>>>> + help
>>>>> +  This option enables generic TEE mediators support. It allows guests
>>>>> +  to access real TEE via one of TEE mediators implemented in XEN.
>>>>> +
>>>>> config OPTEE
>>>>> - bool "Enable OP-TEE mediator"
>>>>> + bool "Enable OP-TEE mediator (UNSUPPORTED)" if UNSUPPORTED
>>>>
>>>> ... you shouldn't need the "if" here, and ...
>>>>
>>>>> default n
>>>>> - depends on TEE
>>>>> + select TEE
>>>>> help
>>>>> Enable the OP-TEE mediator. It allows guests to access
>>>>> OP-TEE running on your platform. This requires
>>>>> @@ -13,9 +23,13 @@ config FFA
>>>>> bool "Enable FF-A mediator support (UNSUPPORTED)" if UNSUPPORTED
>>>>
>>>> ... you could drop the one here. I think.
>>>
>>> visible if is only for the GUI/ncurse display but the if is required
>>> to make sure that a .config file cannot set CONFIG_TEE or
>>> CONFIG_FFA if. UNSUPPORTED is not selected.
>>
>> Is what you describe "depends on"? "if" controls merely prompt
>> visibility aiui.
> 
> So you think that having  CONFIG_FFA without CONFIG_UNSUPPORTED
> would be a valid configuration and the if is only here for the gui ?
> 
> I tested that with the following procedure:
> - use menuconfig, select UNSUPPORTED and FFA
> - edit .config and disable UNSUPPORTED but keep FFA
> - build
> - CONFIG_FFA is removed from .config
> 
> Now what puzzles me is that i did the same but removing the if UNSUPPORTED
> for TEE and FFA and i have exactly the same behaviour.
> 
> So it seems that "if UNSUPPORTED" and visibility all behave in the same way
> as depends on which i was not expecting.

Hmm, maybe that's a bug in our variant of kconfig (we didn't sync
for quite some time)?

> So what should i keep or remove here ?

My understanding so far was that "visibility" merely hides all prompts
underneath (but then I use the command line version of the tool, not
menuconfig), so it largely is shorthand for adding "if" to all enclosed
prompts. Therefore I think all the "if UNSUPPORTED" are redundant and
could be dropped. But then I'm also working from the understanding that
"depends on" would behave somewhat differently ...

Jan

