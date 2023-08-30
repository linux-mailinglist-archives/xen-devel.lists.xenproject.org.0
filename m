Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CB378D603
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 15:01:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592896.925735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbKp5-00071l-GQ; Wed, 30 Aug 2023 13:01:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592896.925735; Wed, 30 Aug 2023 13:01:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbKp5-0006z0-Cq; Wed, 30 Aug 2023 13:01:27 +0000
Received: by outflank-mailman (input) for mailman id 592896;
 Wed, 30 Aug 2023 13:01:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a0OZ=EP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qbKp3-0006yu-Uc
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 13:01:26 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0606.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5294fb25-4735-11ee-8783-cb3800f73035;
 Wed, 30 Aug 2023 15:01:24 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB8PR04MB7067.eurprd04.prod.outlook.com (2603:10a6:10:12a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Wed, 30 Aug
 2023 13:01:21 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.035; Wed, 30 Aug 2023
 13:01:21 +0000
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
X-Inumbo-ID: 5294fb25-4735-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TByL2UJeLxcb2aSk3jSxnRDVts7gNAS8IiDJIGAbeBK5GanJLiAbu8yjSysWf8XPLhCN8Tcz5Gxa3SKLe9CozjojwzByeerYiWCAjSrwDSyy8yaIbkUJx6BTtnYNA0pQ4rOtDpwIEEZ5tj3SojEPL0UeFR4epVb/kaKDBo6L5kN6gwpVg1Y4wc7akYD7Y/g6KVP4iN0dC6SdYs4iv5C/KEkQvERFoFrOHB/rOsC/rm4aEVUPw+gQzVIFDCX7sdp39bjKs3bSvsbuEswQaY6GIlwG4U9u6PHiKDbQKDtlJMd59KWby85dDWkbfYjdWESCeKn5affLYFx19biShYd8vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ORh6UHbFyylwBxgrxl2XSlrHtK6ANhtlleg4+UdIcrM=;
 b=MgGFEiYwZhjdWT5Opw3DbtXCBF84N8bAC8YhXvA1aBFjjbXEejm9mO/PgrKLB/Vq0GHRoSx02aMSZkcWmkeCtEmXl4qZA2nLNwotCQCOVW3EjnXj1OeC3ls7lH/sSLe+hrJXCtsUUWOp7mCx2LLIXvzRAuRaI3VZJns1mVBv8ZyaiV0Zel/JxgKrehHxyjYQl8SC8lqbVQpaWJ3Ezp5XGqiI2AXUSu+sUOr5AWg5wQtgIBKoYW5iE/2NEIXJUmUfSl+o8X9YB1Vi134wm7xkIrBin0KkvmR7JT2AJCy52410iW6JuNLxkFyA+g3z8v8WfMsbsQn3XWxDxlgpLb9XXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ORh6UHbFyylwBxgrxl2XSlrHtK6ANhtlleg4+UdIcrM=;
 b=5ZvtpLVsvqY4xGRbMZznxXh6LyqUhVKI9tBN5c/49Innkj8URFGtXTQ9CR+ANz7p5bI8uIpQ8D/LwiQQtjr/yhvW3z2wB/BZEPUjjA2RFVRlu/g9ifMDbXfVL9KKw8sKHG5Hn8ENaKf6zws8e9LuBN8MW6ld7M+Wfqv7pv2mL7iRAjiizabNuAfV2fazpm54iJICSmHtpKt/ID32N5cNpt+KRFeH2RvDMH4TsNa9vvTvRzwjmFhrsBuRp7gRnkd+RA+mGj8UNEVHK2aIE1SC8cczSbp47jbJ5T1wYu0QNgqO7PnDIOeuER6XdLF7TfrMi/IsFrB5ycX/k8f1yI3w+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <73b7a5e5-9fd8-27ef-b143-161d1b0ab7b0@suse.com>
Date: Wed, 30 Aug 2023 15:01:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 03/13] xen/arm: address violations of MISRA C:2012
 Directive 4.10
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, consulting@bugseng.com,
 sstabellini@kernel.org, xen-devel@lists.xenproject.org,
 Julien Grall <julien.grall.oss@gmail.com>
References: <cover.1693228255.git.simone.ballarin@bugseng.com>
 <2d37ca48cf6556ebfcb4b17cddd2446fa549f689.1693228255.git.simone.ballarin@bugseng.com>
 <CAJ=z9a2hnjCAkGN_YtCQRh8ZcyMMawxBhF8LOwgrQ5-nML1chg@mail.gmail.com>
 <8d82e827-6ad9-4695-5ec0-65c65b79b055@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8d82e827-6ad9-4695-5ec0-65c65b79b055@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB8PR04MB7067:EE_
X-MS-Office365-Filtering-Correlation-Id: cb3a8240-94c8-45b2-ce0b-08dba9593514
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3gfZck0zDPyqwQgkyPD3Hlb3RrGlXQfGSiK0qF1gc+KsNX738kE7gx++0s5zMl7gl007XVeqPmVXdQS1zJ4cDyo2TbsEpMKMI37Ur8G/LneOUCRbQ8eOjdm3elk5DK42F1yvzwaRhVmBOxHVtgls8RYH5soU52XR2lGqlnrOSJj+aZHfHD3RbecSyOHS7CoIUQ0n+FXfUVOstgzOJCovJcot+fgxlwV/PcN2n50D1KtM1jXWy3X8+vQf0SOxh+/p1kvYNFxPlH10opTS85Z/kg2as4QPgI+gNoBt7JbTaVTzjY/Ht7rwhs4PBvvGxTLpgXe4kfPY8gRpOnSxHZkdjUUFHWUH9HPM0oiGCWP4+hr+lAhZ3fvDHhWIauPtdHODKETBylMbhjCmtmX/+4Ul3RVu64NKH8nMW2ITdjXKa0C2J3premX8KIXW6UkPRvPiJbcvOTWHzZO88+fzg54A+RaxJhcXPLtaA6sS2ZpXtnwS8or27Fn23NVgx6RT3Qrz9W8zhegc9vdK1r+AhuOSQRVg4TGPm06/4PBgs6p6eCaR3Gp/0CCutXcCjdjje4NR4FiU6832Wr3K/CIBv09L5NmHtl7DRbBEJYHnivZ7xlrVcFTqbX3rOt11PmfyHPO7lBGRkhZyoYVbWsMKal0PKA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(39860400002)(136003)(396003)(366004)(451199024)(186009)(1800799009)(2616005)(5660300002)(4326008)(8936002)(8676002)(36756003)(26005)(38100700002)(6666004)(6916009)(66476007)(66556008)(66946007)(6506007)(316002)(54906003)(478600001)(31686004)(53546011)(41300700001)(6512007)(31696002)(2906002)(6486002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U05FVFZxYzBpbEFDMnRMTVVlZXdBVlpRZ0YwYmpIZytlWmlPVnZ3bHo3Q3hT?=
 =?utf-8?B?emYvVEtyTytTQmtZVnZEanQwVUFKNjV2RStTSGRaa0lJY0dnRGNHNXZDZDRQ?=
 =?utf-8?B?M2pDeDNkckdIY2FsTU9TUFVldTMrVEVTVEVMVFZZeGZwUDlFdWF2RkZtZDhk?=
 =?utf-8?B?VlFUSlIyb0VGeWorQk4wQkF2UkFSZE14SDRibTFtNFU1MGF6UVBSTElJSm5U?=
 =?utf-8?B?QnNndlVuTHAzZ2dPTURtekZuTVhNcm5qOTlReWZwTkIycjdVWU5aVFRydGlX?=
 =?utf-8?B?enFVeFZYa0l0ZUNxY1NWRWt6M3FrTmllSGxaOERmMFlpc1BBc1JpTzN5SkFk?=
 =?utf-8?B?ZXhsdlB4Z2x6aHhmdkZrS3V1TDJRRExoak9iNFBPMlYwY2oybkowZTBmcHY5?=
 =?utf-8?B?cUIyem9IT1Zua0p0RnIvTWdKc0t0MkljV0FNU1Z1OFZ3bUU3empLRGFCU1RU?=
 =?utf-8?B?cjd1QjZCVTk2UWtFV3c2UFVTUER5WitVYWFva2pnSGFuWWk4R2ZIOW9FVUZi?=
 =?utf-8?B?bnViM3BCTTU4VWRyNlJDbmVFczFDNlZ0enRQcHVCb2FEOGlYdGNqdTZoTjNC?=
 =?utf-8?B?UTFmZjRJWUpSQnhiZnRsUysxeGNzZ0NSUnpGTmdnVGhUVUNOVjkxVDVUdnY4?=
 =?utf-8?B?bFVlR20yaCtEa25pSEZtUCtiRkhpQlpZMVJsTTE0SGpyYUJuZGRIelBzcDRX?=
 =?utf-8?B?aGNDdFlMSjlDZGdoTlptQUhvTzlIbnJZWWt5RWNBZWh6eDB6SG5NdVpBdXJl?=
 =?utf-8?B?L25DTmJGc2FuK2FLeXRoUGhyYXl4amc5bFFxMGRSbTFTc21sa25LaWZTR2xR?=
 =?utf-8?B?V1ZReE55S01wWGhOZHZTeUc1ZTdnWDlBWWhTMmVwV0J2ei8yb1Arc1FrQzg5?=
 =?utf-8?B?N2xNSVN6Vk5acWlsZDE1b0ZCQXVQK0p3c3RhbFhjbkhZdTZCa05zNHFpMitO?=
 =?utf-8?B?b1hGcTJKQ09ibzk5TlpSQ2FUNW5rR1loamxJQ2NzTGNWZTVCWTFZUXgyVmhp?=
 =?utf-8?B?aUE2QWE4dEIvNHh0LzJ0SkxHQ3FXenZZZWFQbGkwV29OczB0aHdhQnhkb2Z1?=
 =?utf-8?B?Sk9mRjNjWHVzTml0VUJxUWJoTSsvWXQ2MU1nODJueGtwU1JISWZNbnFFMCtj?=
 =?utf-8?B?MGFGVEZiT3BwcURLMXRqcU5OVU5NQ1huWGlhZ1BGanBkRkpSU3pOY0pNOXlx?=
 =?utf-8?B?OHBoTUY4aTVNcElEeTV4T1J1Z1NDdHc2YUkrOUFxbU53alhHYjRkK0xhYjNZ?=
 =?utf-8?B?SHk3anhjZi9GV004YWFtM2owQmh2NkY3aGZUd1FtMlhRRlhwamRVREhObVpI?=
 =?utf-8?B?cmFxRzRXVGN5b1V6UzBiQ3g5RnNqMWdKdTFuWU5iYkI1VUl6eUhlV2dQZC9w?=
 =?utf-8?B?WkVmNWlscmlkdXdOOS94dzNhckJmWW8rV2xxcklnMmR6NWdmcUZBNk5EeWVV?=
 =?utf-8?B?cDJnN2RkbU1idHBtazA3ZnlmYlhlV2hNZlYxWXgySEh1WE9uMGpGemxUYnBR?=
 =?utf-8?B?ZFZROThDaTJXYXdYdzlheVVlK2p2bDR6MWt5dW1WeWFnSmltNXd2QzlmU3hx?=
 =?utf-8?B?S0lzUWo4VmhtbnNjM2tBRmNiR0hzMEJLeUJjWjRUelVBUWpsemlrbVBuMlVG?=
 =?utf-8?B?N3MyNGhIdW8wZHNxZ3A5ZStTamh4VUI5a25yTTFBcnRvZmVndXA5TTM5Szhw?=
 =?utf-8?B?YTNvUWFRbVp1VWlPSkR1ckNxd014a3lOb2JiOHAxNUxHTXFKWVpZTW5WaXpo?=
 =?utf-8?B?Y0p3bWNvQlZsMk0vaEZIaUFhbWhzMVJVcWNmbzNxNHl6QVNnL0c2MjBtK0Js?=
 =?utf-8?B?QzBlT2hFR24rd1loMmhLb1FuY2FDUUcvQS8zUjRtcWVhNm9sWXlYaTY1RFBl?=
 =?utf-8?B?eU83Y2EvVno3OSs0NW5yNWp5Y2RpMVc0RmpDbEdmbVc1U2d2NllGMHg4Y3FV?=
 =?utf-8?B?Ykl5WE41blV3RzVsZUFlMVNkNHpXa2puVi9SWUJPNkR2WDdMWUVZTlN3b0RJ?=
 =?utf-8?B?cjNRM3BOOHVxSTh3Z1hUNFFFRGE1ZFNwbURJMitzMXVWd1JMaFNqM2k2RW56?=
 =?utf-8?B?MzVxNmJST1Vad0x2S25PZW1WQmxNUlM5K1dUOFFHUXpwZU4wQmFVOU9LdDRI?=
 =?utf-8?Q?ZrUJT5mJ1fWgAyWJHJDHUufM/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb3a8240-94c8-45b2-ce0b-08dba9593514
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 13:01:21.2997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1XL2xgwY0qx9fKxIlcLP/0d1Am1OtR6GvcGiRMUrDoNN7BpxSi5s5VcwW01wnK+eK9FDWYHTZlopBJ9G1Yd7OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7067

On 30.08.2023 14:53, Simone Ballarin wrote:
> On 29/08/23 00:10, Julien Grall wrote:
>> On Mon, 28 Aug 2023 at 09:20, Simone Ballarin <simone.ballarin@bugseng.com>
>> wrote:
>>> --- a/xen/arch/arm/include/asm/hypercall.h
>>> +++ b/xen/arch/arm/include/asm/hypercall.h
>>> @@ -1,10 +1,10 @@
>>> +#ifndef __ASM_ARM_HYPERCALL_H__
>>> +#define __ASM_ARM_HYPERCALL_H__
>>> +
>>>   #ifndef __XEN_HYPERCALL_H__
>>>   #error "asm/hypercall.h should not be included directly - include
>>> xen/hypercall.h instead"
>>>   #endif
>>>
>>> -#ifndef __ASM_ARM_HYPERCALL_H__
>>> -#define __ASM_ARM_HYPERCALL_H__
>>> -
>>
>>
>> I understand that you are trying to fix a misra violation. However, this
>> feels like it was done on purpose.
>>
>> With the new change, you would not always check that the file were included
>> at the correct place. I am not against this change but this ought to be
>> explained.
> I don't think the semantics have changed. Please correct me if I'm wrong.
> 
> With this change, the only situation where the check is not performed is 
> when __ASM_ARM_HYPERCALL_H__ is defined (i.e. the file has already been 
> successfully included). This implies that if __ASM_ARM_HYPERCALL_H__ is 
> defined, then __XEN_HYPERCALL_H__ is also defined, so the check would be 
> useless.
> 
> The same thing happened with the code before the change: if I include 
> the file after xen/hypercall.h, the check will always succeed.

Hmm, I think you're right, but I draw a different conclusion: The check
fails to work as intended. And this can only be repaired without your
adjustment.

Jan

