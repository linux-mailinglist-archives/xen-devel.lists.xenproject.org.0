Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F29C46D0D8
	for <lists+xen-devel@lfdr.de>; Wed,  8 Dec 2021 11:18:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242111.418783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muu1o-0006NW-9G; Wed, 08 Dec 2021 10:18:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242111.418783; Wed, 08 Dec 2021 10:18:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muu1o-0006Lg-5c; Wed, 08 Dec 2021 10:18:24 +0000
Received: by outflank-mailman (input) for mailman id 242111;
 Wed, 08 Dec 2021 10:18:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xuKF=QZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1muu1m-0006La-DX
 for xen-devel@lists.xenproject.org; Wed, 08 Dec 2021 10:18:22 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ae5c47a-5810-11ec-a831-37629979565c;
 Wed, 08 Dec 2021 11:18:21 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2057.outbound.protection.outlook.com [104.47.14.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-28-sN2a-SSvMcS_lnweOh-dUA-1; Wed, 08 Dec 2021 11:18:18 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3776.eurprd04.prod.outlook.com (2603:10a6:803:18::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16; Wed, 8 Dec
 2021 10:18:16 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.023; Wed, 8 Dec 2021
 10:18:16 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM7PR02CA0025.eurprd02.prod.outlook.com (2603:10a6:20b:100::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.14 via Frontend
 Transport; Wed, 8 Dec 2021 10:18:15 +0000
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
X-Inumbo-ID: 2ae5c47a-5810-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638958700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tzi2JpuMSxuilbQc59XDOI02SjQUNWltt/xmhd8YoXc=;
	b=KirQ34leMLE+oYN2IBeQjUMdg1zAF/ynhnz8FmFyRwLkQI8xM2xLgEcp4iRG05YtNgNBSr
	iCvcPCuQ2RmrZTilGOAKishBjgo3/fbqpgdRarJxQ3KNIJi1JGvBp8s4pxlX1SiNSft3vV
	tBeZJbwdCliIYD/os2BmVbAzdfC2NKU=
X-MC-Unique: sN2a-SSvMcS_lnweOh-dUA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XGAntn+QVsxROEh9cl/vJtNSeTjrIyXfZoxbE2HxdU4Y18spU8X3iSkF0Y7AOR88PjKKsQg/vakZNn8q+1x28Vq1vMcDI7U0My3EV46ZTKIJs2vRN2rGEOXC+YlYc+50l2hISToCY/HIDmmNGoXgjPJINajTw7AnpWzWciyHQ4B6e0Rsktqcw8tx3mX5N+TLoBZT85CDHe27cHcv3ZjBToQuUsuSAyyyqv4o4ZPe5XldmZImdT001P89jUStu22pYLJVqbZDu4TkARMRmQMrvl0n5i9mx9mCZc0u/5SqLNTWHiPtIrUTxeIvJYolKvabSQ/tZ2ljEEvglkspdIvsIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tzi2JpuMSxuilbQc59XDOI02SjQUNWltt/xmhd8YoXc=;
 b=XWqZWuWy1uHLvLCTQvG8G7j+irPhqeGRJukN1WzW9B9+JXzppEgEYdJDesup00HdC2WNP8LpOBbY+Mmx1jkG6bDCksQH2W1TLjAVZgowK3tPFY+wH+WkxpurO1ssvKFQfxPgQ5a+t8UkTw7EYK0S1SA9FT6nzokWmM2K+hLKKFNUore37QTEnCqRpnEREv6+YeWlEVvNV8uEh+rdgX15dqyCvU3pJUbfacc+lG9YHBNjbyl+8sHDgz/Bn4RFZY21JxxgFbwM6Q5cHHzw+tXlgaSE6FsHZDIL+Kms0OEadqBCrip+c15egPycaQri8A95ktpC3gzfOOUWu9b3QFe4Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c39427aa-1f72-a0dd-0756-5670b5a8e997@suse.com>
Date: Wed, 8 Dec 2021 11:18:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] xen/arm64: Zero the top 32 bits of gp registers on
 entry...
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org,
 Michal Orzel <michal.orzel@arm.com>
References: <20211206142032.27536-1-michal.orzel@arm.com>
 <f3573439-4893-440f-54e1-fdeba3eb4508@xen.org>
 <dc114877-b9da-7a5b-260d-b9438cddd777@arm.com>
 <b7a53384-39cb-f368-f39b-9b560336226b@xen.org>
 <6ab797ce-86dc-2c32-1cd0-417fab7516c7@suse.com>
 <73913bdf-7449-34fb-b86b-662774cb3e62@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <73913bdf-7449-34fb-b86b-662774cb3e62@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR02CA0025.eurprd02.prod.outlook.com
 (2603:10a6:20b:100::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 52366092-f735-4e9a-1874-08d9ba340c9f
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3776:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB37766625BDFE965BE64FA428B36F9@VI1PR0402MB3776.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GEikfZBC1FXbEnHvFvkSuZtz9n96OxgcRShwq8yvlhOZqDL/aKe5vf8zpx9rRMoTaEfgfTaBKNvn426iEbQYFXfa7O/Yo94H+69K5cV6EIU+3t9ZnsOhD5R5rY8/sfjb0dYOrtgCGqCXLeKNt3HfH6xtLzQgH/hHhACV7fmeFulbswzYuJEJUJq8y5IOaTKVfKuuUaWZipjJUevc9NrsMAZRI4Eo+US1SBo8w2wA4VjhuLkgUcmN2FRgm4bjBUxDVroiR7hrPSx1aBh5iQ7ONRbvS5PC8ZgPLaoIzdWAAp10RlxdKBHC2VWgbZQeRL0K62cvRkSJVL4inteWt7rw//ek/XrAyUtIgR30aCo4LkvEv8xd9t+mj+D21tD5w8+hSb9QCO5L8C9JoF3wYqr543ziBcohka1VHh8NAcqo/4wDf27KRGlRR60HegcPXnfO8EWrqdjXG180uxUqLL/cpf/+E68+eE5ydUUgIjebQvO8YyAzH33nCxE7xezoY0R/CQN4jenp6pWzEbBtyf0xM3pY7VzBrML3S2jlSGtQa5qk2vA0rRiGz7pRZcOIbnnAS8sWnNiRpxJB37SmPl0/4JW3/+0BatQmXAwFUHSgeDaheJXMCzczvAuh1jC6wvAnv/6NBgsBxrAHz3y6cpMoEBuS2P+G7YtMWuukO0pPRo4MgBVSxxr4OLf3f4hxKr7yCG1jOK28Widgp4DD7tGGkEkB1BouGjJfKC0CSxmKZu8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(83380400001)(38100700002)(36756003)(8676002)(4326008)(6486002)(508600001)(956004)(2616005)(6916009)(8936002)(53546011)(31686004)(54906003)(66476007)(5660300002)(66556008)(26005)(316002)(31696002)(186003)(66946007)(16576012)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NTZlczZtcXovQU43d2NZTzFFMmZVS0Q3bEFSenZpR2YrZ01UaFVLQ0MyNFNR?=
 =?utf-8?B?QVNhaUNzdnBwcHdTeTlENXc2QTZTODUrNkhKWnNHOFNtUmlVVlhyQUhjTG41?=
 =?utf-8?B?djZ3VS9OSFNqajNRUG5qNWFXRVRGU2JhVGVMd1pCNVRNNXl3YTk5STY3cGpz?=
 =?utf-8?B?dDd3a2FKckFWQU1oQWpneitscHBhcXdnSEwvendRYUFEOGdibEdSdko2T0dU?=
 =?utf-8?B?UkNtbXdESmNxMjMwR1Myb2xKM0dPYjBPYndjd3dGN1VLYXZiWC9sdWZNeGR6?=
 =?utf-8?B?OHl3ODIrdktmQ3VKbVYrNURhM09jRER6NmpxSVF3eWRJV0Zqdys3NFA2T1lx?=
 =?utf-8?B?Wjl2ZUFWS3hDeTM0VWFXMDN2S0l4K2Z0TjVsS1RXMGhKRVpCS3hpeUVhVXBG?=
 =?utf-8?B?Nnc5WjhjbEhuY0Vkby9BVEZRN0c5azg5d2x5akVSK1lMV2pPVHhvbzFkSUlP?=
 =?utf-8?B?MDdJb0Zhd2hLcEh3Q3NkUlVTdk5MUkU1RjZmMm1ZckhkTFhUaGV4aUthY3Bm?=
 =?utf-8?B?TEs3R3FUQU9JdzZncTdZTUZGaXZQSXNFanJ2MXEzWjhlb1BTcm1tVmk4a2RX?=
 =?utf-8?B?bjRsNlp1TEtNYlpOdVBKMDRLdkNhQTE4cExzbmxQNUtIZStDRVF4NUlyRzBy?=
 =?utf-8?B?Y0JnZENQRDkwR1ZITnl6b1dNbStETWJTN0hoTjFhWGFCcU55dlRGK0VObyt2?=
 =?utf-8?B?WTEzL0JKTkpjVE90SFNqalczcHpPek53cnJvU2JtVzJ3Z0dwMENNbkUzQkRB?=
 =?utf-8?B?MW5ES0RRWVN2RW9Hb20rZzVCWXQ3QXdnWExqcTdIemFQNzZid0xZaVJLT1JZ?=
 =?utf-8?B?dHNUM0tYanhsVVU2MzRSbG1PZGpRUlNXZS92Y1FScUl0cksxczVka0pLQ09V?=
 =?utf-8?B?RmtRUU9BZ1ZvQnY2NDdCdkRaMnpZbU9PcERwbXhvOFdZcXVxdzJhZ253SjR3?=
 =?utf-8?B?MzY4cCs3ZW1hbE9XOGJpbWZ2a0pMVWFWWUYzZkkzSXVSb3ZKV3MyS0JVK0t5?=
 =?utf-8?B?YzBhMzhmTTh5U1phZmVkM0E1aCtZeU12b3NFaEMwU1pqU09Vbmdsa3dSZDZZ?=
 =?utf-8?B?QWduV3Q2UVRJdEJ5UnJaTitlTVQ2VjVYdnNYSkd1ZWhVM3BaVXRVMnlwQUp6?=
 =?utf-8?B?S2M1eHZVQ2tuaWpybGk4U3A0N09TY3M4d25XOUVSeE03Y2oxY3VtOG5hMDRl?=
 =?utf-8?B?NTg1cUJsdFhCN1NBbExjVDJ0WFY5QTlNTngrSlY3QUZhV2hUdHdEQk9MbWFz?=
 =?utf-8?B?YXBDVHA4ZVo3U3c5Y294K3VrSWV2V0JWWHorMEZFa3V6aTJGMDEvMDVNSkxI?=
 =?utf-8?B?RzB3aElXcVN5ZVZRdk9FT0E1dnRTMVZRL0E2SEFSRXZXa0pHaDRmNGQxT1N2?=
 =?utf-8?B?Si8xQXhEMjNUQXV1V3hGLzFIbHJ4ejJ5cUFtZXdtOXRGd1BIb2NhdFh6ZkVN?=
 =?utf-8?B?a2hkU3A5RERMSWJoZFhYbUhWSTVQZGJBdjI4ejk3UUp0ZERKelpVY2pJRWg4?=
 =?utf-8?B?bHl5eFk4UlVFZ3dRQU5MSFl3QWVxeGRHUmhSLzU2QXdTaGNqSkpFWGhiZWht?=
 =?utf-8?B?b3VRcnNENEI2UmtXcDZ5SW0zY1NaZnRTSG56alJwUXdteGdDWEJlQnRFbWZu?=
 =?utf-8?B?QkdFdyt3cngxNTZZcU5xbzkrR0FmYzlua3doMHBhUWFpK0RJQVhINzZ1RG5V?=
 =?utf-8?B?cExZVTBhc3JkSGFBWVdCeUlTSVg3VjloREFFSEJoczM3ZDRjRUVKZ01USU1n?=
 =?utf-8?B?N0lNUU1wRGo2c0w1RUJWZDJkMUx3WlY0SGNxeVlxcXFKeThmUXRxSjMxZ2pl?=
 =?utf-8?B?aURTQXdFUjl0ZkhIS1JjMGhyM3FHcXZkQ3M4cGNrQnE5cFRTMDdRNHg4cWYy?=
 =?utf-8?B?bFVXQTJKTmJGRDd3UElIOHJ2cEdKdEdkZGVKOHpNUEdaUlJuVkNhd0ZqWG1o?=
 =?utf-8?B?cUI3L0pJSkxIa3g4VFlRMWRwSCtpU3VVUUhjVU9DOEg4K2FWUmtCRll0Wnor?=
 =?utf-8?B?WnlaR21JNFE5dTdRQVpxb2NVdVdiaWtCVjYxY2o3TnVHRm5JYVAveVJrRjRr?=
 =?utf-8?B?K2xsYkFkY1o4MS9qMU9zV2lNQWx3QWNUbjI1b3BndkIwUTA0ZmRFcWFGekp1?=
 =?utf-8?B?WFhvbXdBN0JsR25MTVJyRDhVYjRTVTRuZXIxTXZnbTJDcURuYlMzVm5lYStL?=
 =?utf-8?Q?o+Kj3Mb76EPFSduo775F6xo=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52366092-f735-4e9a-1874-08d9ba340c9f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2021 10:18:16.4753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jOMiT7yLJnOumI3JVjNMYk7fSS1rrtJZpIFY/Noen/5x+btnKV4832Moh3o9wsKFgfVqw+iQGcPvhNChSdc2jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3776

On 08.12.2021 10:55, Julien Grall wrote:
> Hi,
> 
> On 08/12/2021 07:20, Jan Beulich wrote:
>> On 07.12.2021 20:11, Julien Grall wrote:
>>>
>>>
>>> On 07/12/2021 08:37, Michal Orzel wrote:
>>>> Hi Julien,
>>>
>>> Hi,
>>>
>>>> On 06.12.2021 16:29, Julien Grall wrote:
>>>>> Hi,
>>>>>
>>>>> On 06/12/2021 14:20, Michal Orzel wrote:
>>>>>> to hypervisor when switching to AArch32 state.
>>>>>>
>>>> I will change to "from AArch32 state".
>>>>>> According to section D1.20.2 of Arm Arm(DDI 0487A.j):
>>>>>> "If the general-purpose register was accessible from AArch32 state the
>>>>>> upper 32 bits either become zero, or hold the value that the same
>>>>>> architectural register held before any AArch32 execution.
>>>>>> The choice between these two options is IMPLEMENTATIONDEFINED"
>>>>>
>>>>> Typo: Missing space between IMPLEMENTATION and DEFINED.
>>>>>
>>>> Ok.
>>>>>>
>>>>>> Currently Xen does not ensure that the top 32 bits are zeroed and this
>>>>>> needs to be fixed.
>>>>>
>>>>> Can you outline why this is a problem and why we need to protect? IIRC, the main concern is Xen may misinterpret what the guest requested but we are not concerned about Xen using wrong value.
>>>>>
>>>> I would say:
>>>> "
>>>> The reason why this is a problem is that there are places in Xen where we assume that top 32bits are zero for AArch32 guests.
>>>> If they are not, this can lead to misinterpretation of Xen regarding what the guest requested.
>>>> For example hypercalls returning an error encoded in a signed long like do_sched_op, do_hmv_op, do_memory_op would return -ENOSYS
>>>> if the command passed as the first argument was clobbered,
>>>> "
>>>>>>
>>>>>> Fix this bug by zeroing the upper 32 bits of these registers on an
>>>>>> entry to hypervisor when switching to AArch32 state.
>>>>>>
>>>>>> Set default value of parameter compat of macro entry to 0 (AArch64 mode
>>>>>> as we are on 64-bit hypervisor) to avoid checking if parameter is blank
>>>>>> when not passed.
>>>>>
>>>>> Which error do you see otherwise? Is it a compilation error?
>>>>>
>>>> Yes, this is a compilation error. The errors appear at each line when "entry" is called without passing value for "compat".
>>>> So basically in all the places where entry is called with hyp=1.
>>>> When taking the current patch and removing default value for compat you will get:
>>>> ```
>>>> entry.S:254: Error: ".endif" without ".if"
>>>> entry.S:258: Error: symbol `.if' is already defined
>>>> entry.S:258: Error: ".endif" without ".if"
>>>> entry.S:262: Error: symbol `.if' is already defined
>>>> entry.S:262: Error: ".endif" without ".if"
>>>> entry.S:266: Error: symbol `.if' is already defined
>>>> entry.S:266: Error: ".endif" without ".if"
>>>> entry.S:278: Error: symbol `.if' is already defined
>>>> entry.S:278: Error: ".endif" without ".if"
>>>> entry.S:292: Error: symbol `.if' is already defined
>>>> entry.S:292: Error: ".endif" without ".if"
>>>> entry.S:317: Error: symbol `.if' is already defined
>>>> entry.S:317: Error: ".endif" without ".if"
>>>> ```
>>>
>>> Thanks for input. I am concerned with your suggested approach (or using
>>> .if 0\compat as suggested by Jan) because they allow the caller to not
>>> properly specify compat when hyp=0. The risk here is we may generate the
>>> wrong entry.
>>>
>>> compat should need to be specified when hyp=1 as we will always run in
>>> aarch64 mode. So could we protect this code with hyp=0?
>>
>> Since my suggestion was only to avoid the need for specifying a default
>> for the parameter (which you didn't seem to be happy about), it would
>> then merely extend to
>>
>> .if !0\hyp && 0\compat
> Isn't it effectively the same as setting a default value?

Hmm, yes, it is.

Jan


