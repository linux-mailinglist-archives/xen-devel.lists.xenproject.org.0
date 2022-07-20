Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3DA57B794
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jul 2022 15:34:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.371783.603651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oE9q3-0008Eg-MA; Wed, 20 Jul 2022 13:34:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 371783.603651; Wed, 20 Jul 2022 13:34:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oE9q3-0008CP-H2; Wed, 20 Jul 2022 13:34:07 +0000
Received: by outflank-mailman (input) for mailman id 371783;
 Wed, 20 Jul 2022 13:34:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H1QO=XZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oE9q1-0008AM-DD
 for xen-devel@lists.xenproject.org; Wed, 20 Jul 2022 13:34:05 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150083.outbound.protection.outlook.com [40.107.15.83])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f1171e4-0830-11ed-bd2d-47488cf2e6aa;
 Wed, 20 Jul 2022 15:34:04 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS1PR04MB9632.eurprd04.prod.outlook.com (2603:10a6:20b:477::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.24; Wed, 20 Jul
 2022 13:34:02 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5438.023; Wed, 20 Jul 2022
 13:34:02 +0000
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
X-Inumbo-ID: 9f1171e4-0830-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LqNYXbnbWwWaI6Qkngvd+NDonx6ne6OlbELaJ67cpXVbS6fHB8GGfjkLvx9Ov0XVXABGYK2OT5/RspZJ2jSEuI3PWS0uLnGfb9U8RN2jCAXcb/T9CjvrYPkduXx0qWXQ7P/8ccuqA3uv7fEpwYNbLo7pC3eYUFbsd22IgoeUdWO+9ZoL/Szbndqns4bWjOBuk9LhLvFe7QmW4XTJcuxc5jF5gRTGTDevkAG2ex4gXpYW2M3xWdYqq9QMAbjXBKD/S3I3wMLG+eziG0zrfk2uNT1+Beo+ufSONy86NmJfaZjA56Q5AGcQ/wiShvwWzxiLjxzR6Z4EOvmcgfJ2ckh8yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t5lc6f/KKPjMnE4ho6v1CXA8VObImOpiOEO4gX459nY=;
 b=Bb4c0YUbijF5ePm54/D+H7GEBEAmuoKq3kVi+TW98Sn8haYjwbluxtYr8nxqW1kwLzq4JeJo4AVpbpV6wy2KvlDddMFjs20ZbBXhQ4rfOT2UarURQGYga9Uwy+gBqmHzQv2e3x5vP3m1lvX4jeARyqI4zatb71nIDCItB+TqbcP7/3S4COZT93J1GPRcl+2ZNds1uQEE9AoLlMfuhsPkRks7wxzG2n5zQav+k9ukgzPq/HCHn7S+Jupnbcmr/EhfOJO84eKVuxINwmOA6EddpssmiaEednU/y1TQHCIX1ErBAtI1KPNKhvB9pKeNFXx0uR48hHlmOSqoWH7oXTTCmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t5lc6f/KKPjMnE4ho6v1CXA8VObImOpiOEO4gX459nY=;
 b=Shtcv0srKce+C00578r4tEfWAwjKUXecqI8605sgNlqAOGfAN086vSpbylE2rTT3YkcGDS6zxFD9XlAR3K2gpbig4MXpP977xjwqc9GU6sh85ZvPz7yJguq9T/BmXW0x9Cx4QuS0iqY0kO8iZejahC9kgfhchytYRjX0ar527vTJM6h8hOXa3f8vIzwGZZ+5cjYLFuXpuOZVfldr6ItIbJ3geTc+c4/5A5TtVkexM5RAtjXEut2Wx2tQlAIKCtKxuXVvwJc6DSf9JJG6EKBiR+WB+ze5dmDQX/UpX+EnGaB8/nZRhMibwxYgVFi9OJAM20v78ixMurQAipouwISbaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1a56faa9-0c62-70b8-20ab-af9347a25354@suse.com>
Date: Wed, 20 Jul 2022 15:34:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/8] xen/evtchn: modify evtchn_alloc_unbound to allocate
 specified port
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Rahul Singh <Rahul.Singh@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
References: <cover.1655903088.git.rahul.singh@arm.com>
 <5ea66595248c41a011ac465bfabd7a7a40dcd565.1655903088.git.rahul.singh@arm.com>
 <2cdde2eb-33ac-568b-a0ae-b819b7b4161b@xen.org>
 <1494EC8C-9916-472F-9285-57C0FF656919@arm.com>
 <abcf96b0-1c41-476a-de08-adb3eaaaa05d@xen.org>
 <addaeb82-2d15-a46e-f9f9-274572d2ddc2@suse.com>
 <9711c08f-7e16-daf3-f010-1e6a53b0b9a0@xen.org>
 <5f200481-ed3c-a463-90aa-3718c0ab57a3@suse.com>
 <758779b3-ef39-aa95-15c9-9b84b952e80b@xen.org>
 <3b42f9ab-383c-694c-cef0-5d24531e556a@suse.com>
 <019c5cb4-7e6a-d822-3c02-e3199d499106@xen.org>
 <93E40C29-DD1E-4C9B-936B-45ACA69BBD66@arm.com>
 <d868fab2-c55a-7e2c-cd54-6dc3eedbbf26@xen.org>
 <BB3ECBA1-A028-44A0-A6BB-5D6BD009C095@arm.com>
 <ee0a62af-fa79-3699-7652-d976a8690995@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ee0a62af-fa79-3699-7652-d976a8690995@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0044.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02e3a656-4654-4c5d-f28c-08da6a548254
X-MS-TrafficTypeDiagnostic: AS1PR04MB9632:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ibEGNl9xp3JvZd9NSLZ3TFkQqAIj6EQ+Y4IGpP946m+UVxwSFy/3RG1qSG6ESkaCayZBG3xOHWWuoVG9I6K3gHQLd8lsfu4nAbu5N2587fdX4u/DZUm9+Ora1p/KbRxVFj9FpQ4vosApmV8yrIse6EWqI/m0K2k7RkOJNjdHmBzJzAWvzO15DWDt+AeTj6S+fIPIURgrK5AQIab1U7m4axtLc3UKbqeKhV0i/X9LY0Zx1mx8dplZ+vHj1T+6zsGN4PC8LO1qpzZH1gNPLmtYpqSiD0TVOSRpHzCoaXHxSSytfqgzGfEjD6Q7UG2F1W7eQ+amjl+yITMVumyytqeycn/PB8x6obo1xil+KNQiZ7u4gbTSCK4baLBLl8nci/HXmyWLBtDyIjbtqo/q1uyzKphhuUtk/XanUnjOO5qtD+l9gyJQrIvTBM/COCOq8ItqIKJCHfPq3syQgAQ6t46dUL1xvhj/WeqCU0o+CxJlWTpmTuTc0sCkdL1U6p7AdzovhhP2b9B/TL5CSkJdS+i7OjbZIMsMCDyuxEjnWm9dS7j4jLc16d/5iVXyhwGg+1/7t0GWHlQOSP4dFpZrEPhS6mUAeHgCnIOEQsMPthk5xBzxZPUIhuUq59ToEdLDBu8adHRHCwMzaG9Eo7cUsznv5qKNwVYXli8lCPz9o+uRX+24d50/kV26OkMr17waoTVXK0L90CcAHKa55TKJN1+1g6f7RUvm6fPDBBDcw2jKjJJemtRsW8udIhSfSUEXr+FYr5RaqbuDUGyxgH3JeDwevtNnbM/ZDlkifn7fma7ngZd0Z6Y2Jn9iiMJE2+S/4bNbj0k9qrnNNtUpMLjC+XLBPw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(136003)(376002)(346002)(39860400002)(6486002)(478600001)(31696002)(38100700002)(53546011)(41300700001)(6512007)(86362001)(31686004)(26005)(54906003)(110136005)(4326008)(8676002)(2616005)(6506007)(186003)(83380400001)(316002)(66476007)(8936002)(5660300002)(66556008)(66946007)(36756003)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0NHVnJ1NmR3NG1lMURxVlBpUEhJRk12QzdGNEJ3TEE4aFdKRi8wTTcvZk05?=
 =?utf-8?B?RGRjenNNRUpQVHZQVjZDd3JxVTBZWSt5ckl5djRoUVZCZmhHMTc2cHZTbzRN?=
 =?utf-8?B?TlJFNTZ3cWxwWDVNY0JET05TNmVHZm54bzZVaHROb0xDaHN5RmpRYjBLU0dK?=
 =?utf-8?B?K1FwUDJKMU1vM2JabC91bW5HZ2YxYWFhR1hHUytzaVZwdVd6bGFZL3pOcmZW?=
 =?utf-8?B?WjJ0YTJFSGMxa1owc2wyRHlqdVNYZ2lDb0d2R3NHZzZlKzVzWWJDeEtOOUY0?=
 =?utf-8?B?Tk9VYXl1Y3lwZWxzU1FTNVIzUDFvTEhDRy9EWnhEL2ZZVXlUd0NZK0dDc2Q4?=
 =?utf-8?B?bURSdVBjdUtkTEFIZXB3RjFHaVdWTkQwQUNJU0JXcjR6Z01mNnl2cW5iS3Fl?=
 =?utf-8?B?dDhBZVQ4QmFKTVVLK0Rvc0RlWDl2NGdOR3hUNnpPWGZRSDhYRE5NcGxtUmxK?=
 =?utf-8?B?alBqYVEyVlBpNVJReVBVN1lqUVptTHZubWdaRk0yTituZG5ia0NjOGdpVXZI?=
 =?utf-8?B?RWY1L2JqU3VIS2xybU1oWDM5R1FnT0JjS09NSGdNajk1UlpES1NQc0F2KzRo?=
 =?utf-8?B?TDN1REZHWC9iR1dUd3ZlTStNNUxtUitZdVdrcHdPcEtQK1J5UmN2S0xZdXpT?=
 =?utf-8?B?ZktNYW5iVklBMndwbjg0N1ZIKzN2dUlOa0pQNDJDSm1uanBQVEkxMDFtYnBP?=
 =?utf-8?B?NGJ4ckpSZG00bUNwZTFibkZUSTMwcFg3VGg0d3hqUVU4REpTNDA0MXV2SzVU?=
 =?utf-8?B?eDY0UE1hbkpENW1PaGF5ZDZlU3FlaExiREd1dEh1NW5NLzlwMGkrNGhHRlZu?=
 =?utf-8?B?bnVKNjExQ1NVR0FwSEFodXd5Sm5vYjlkYm0wT0tDRWNnRTBmYXpyY3huejZa?=
 =?utf-8?B?eFlzUGRVTUQ0ZE0waUllT3E0SEtFc2FCVk5OUXNoc2FRSGZRNnMrSVBqWDVo?=
 =?utf-8?B?TVhlSkYrRkFWM05KMmJLejBHUEh5d01mdDd4U2hSU0pXcVpPYVF6NHBlRUY4?=
 =?utf-8?B?L3FrUkFnRnRsYUFFbnZzMVFpYm1wT2VoWituY1VMTGgwZmNjMWhqQjVYeVd5?=
 =?utf-8?B?ek41N3pLT2xVcG5peW53OHRvU1hpUzAwVDMrQ0VBNVFQT3VqUWErU3lOaU5z?=
 =?utf-8?B?TWg3Zlk2Nnd6WmdiRWhFV0RQRndmZGJHU3RVc3NadVNvTUV1cVA4N2FSajQ1?=
 =?utf-8?B?ZWNMaU9vSjZLOTAydHc5WkNnd1ByMHc3MDlyWXVqd2tEN2EyOHdoemtkUVVl?=
 =?utf-8?B?b2orUG9JOEVPTGtXaE1yYmRyREFyNDZpZHlyM2RrOGhhYWRGNE4rYnVYend2?=
 =?utf-8?B?OEhnb0J5UkZPNXRoSEduYXRpS2N4RUxYUnpEbnRZQWc5bzJGSUFYb3FITzdQ?=
 =?utf-8?B?dEhNV2crVnBKRWtFT1hJaXJ2azY1YzhIM0MyY3RHSTBIQitXOTgwM1VkVGtU?=
 =?utf-8?B?a3p0bEFiMVNPQUJaM1VNNUpnRWJFQ2NrUGdUWjhGWDYvWWxEdktIeTFpUWZp?=
 =?utf-8?B?eWd4MjBUQytvdjBDVEU1OU4xNEc5RjlpbDlMWWVlamdoaUVGamQzREZQTnVK?=
 =?utf-8?B?RENWVHVxZnhwc1RYcHlLVldPSDE2b1NQMHpJT2dEcUZvdU1lVXJWOSt6aE5G?=
 =?utf-8?B?M1BQMFlWOHc3cWZlMXQ5L3ZVNVgyQmdpbWZZN09aa3pNb0xDOEpoRzJqNjdt?=
 =?utf-8?B?Nk9VcXMyZ3gveEtEdGZUcEFDd25MOTkwc3JuU3F5dzI3S0pESGlvc2JDcVRh?=
 =?utf-8?B?TVJZQk1wdzVCVm9BcFl0WE9UWTgxdjcvdnRubjVpdDBSSTAwTFBHRUdZQm5k?=
 =?utf-8?B?aTd1a3h3SWJXcHpPcVVmbHhRTTRTSXFRSFk4R0s3VFZWV2s4L0pTRW8rbU1C?=
 =?utf-8?B?dWNvNHBSWkZEdXVUMndZZTdqWUFacTdudERwRlpSWnVmTHBFSTFmQWRtNnVx?=
 =?utf-8?B?dGFiRkIzdzFqa3dwblQ0dXpnL0VwM1FlQlpJWERjbWFnUUZJek5Ybjd4L3Bx?=
 =?utf-8?B?NWdYUVVKM3pJOFN1SlBIVlQ5dDJ1SmtnekQ4eXZUTldEbENkTXVqV3BYVTRK?=
 =?utf-8?B?c2wyeWxweU9wRnEvRWY5UFc1bUpFNHJiVklsWjFpeUZTNGlNa2lCVEhvRUY3?=
 =?utf-8?Q?P+6ZlgPQzW7NL+YcJijjkEmah?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02e3a656-4654-4c5d-f28c-08da6a548254
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2022 13:34:02.4154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TVmxeQV27/KnRarEDTTitSQdoXZniB5Vvj3CSWi6+YRIH8L/aSzg5wT2kPA0yEtJdtgHL5vXFsCAN1hK4EiD7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9632

On 20.07.2022 13:16, Julien Grall wrote:
> On 20/07/2022 10:59, Rahul Singh wrote:
>>> On 13 Jul 2022, at 1:29 pm, Julien Grall <julien@xen.org> wrote:
>>> On 13/07/2022 13:12, Bertrand Marquis wrote:
>>>>> On 13 Jul 2022, at 12:31, Julien Grall <julien@xen.org> wrote:
>>>>>> I can't
>>>>>> see why it would be wrong to have a more tight limit on static ports
>>>>>> than on traditional ("dynamic") ones. Even if only to make sure so
>>>>>> many dynamic ones are left.
>>>>>
>>>>> This is similar to Xen forbidding to close a static port: it is not the hypervisor business to check that there are enough event channel ports freed for dynamic allocation.
>>>> On other side we need to be cautious not to add too much complexity in the code by trying to make things always magically work.
>>>> If you want Xen to be accessible to non expert by magically working all the time, there would be a lot of work to do.
>>>
>>> It is not clear to me whether you are referring to a developper or admin here.
>>>
>>> On the admin side, we need to make sure they have an easy way to configure event channels. One knob is always going to easier than two knobs.
>>>
>>> On the developper side, this could be resolved by better documentation in the code/interface.
>>>
>>> Cheers,
>>
>> To conclude the discussion, If everyone agree I will add the below patch or similar in the next version to restrict the
>> max number of evtchn supported as suggested.
> 
> I am fine if the limit for domU is fixed by Xen for now. However, for 
> dom0, 4096 is potentially too low if you have many PV drivers (each 
> backend will need a few event channels). So I don't think this wants to 
> be fixed by Xen.
> 
> I am not entirely sure we want to limit the number of event channels for 
> dom0. But if you want to, then this will have to be done via a command 
> line option (or device-tree property).

Imo there would need to be a very good reason to limit Dom0's port range.

Jan

