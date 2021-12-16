Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA944775A1
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 16:18:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248033.427777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxsW4-0005at-DS; Thu, 16 Dec 2021 15:17:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248033.427777; Thu, 16 Dec 2021 15:17:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxsW4-0005Z1-A4; Thu, 16 Dec 2021 15:17:56 +0000
Received: by outflank-mailman (input) for mailman id 248033;
 Thu, 16 Dec 2021 15:17:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VxGf=RB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mxsW3-0005Yt-2E
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 15:17:55 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56b475e4-5e83-11ec-9e60-abaf8a552007;
 Thu, 16 Dec 2021 16:17:54 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2057.outbound.protection.outlook.com [104.47.12.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-24-FdqhgrD1OVe8ueBNzLcn9g-1; Thu, 16 Dec 2021 16:17:52 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5597.eurprd04.prod.outlook.com (2603:10a6:803:dd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Thu, 16 Dec
 2021 15:17:50 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4778.018; Thu, 16 Dec 2021
 15:17:49 +0000
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
X-Inumbo-ID: 56b475e4-5e83-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639667872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KNn1epMrWUAiW9CZeXc+YGt54V/Wkg59uwUIDGnVrD4=;
	b=Fu34LIqJBnIG79b10FtHcyrFwD9wDf2gU76ELMVj+w7CdNGXsxKSswAbygyZ4+LhEIWwrs
	Yf0D2ZkZLoIHyUBMVMgEHwY7zpYxodgYZktqP9C/qNUuPWXs/7yWvuhi34eMkpvbSI8dmI
	Wc5kvgNkQ+g3F5TX/xlzdhVGCjg+RD8=
X-MC-Unique: FdqhgrD1OVe8ueBNzLcn9g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=evP2OVBLEML+2Xfm0pW+RENoX0YrGZ66m8hsMRBZFXj9aTQwWEiCKd4sjfh09XMxzTv/ZP5/bSRpL4P2vVHDEPMu6EoEhdo4OtIWOUN25DU5cZW9WbVpCb0UaR+OZ3DlXwK+Rs3GS+OgwKuapi+7eRGDneq7RcPnXESn4PuRgjGgIOdAKhWyEGuQnCryC8TAKRZHIHzrwKWzLgVcgLZrG+l0kdkd82CGBJPsZqIDXggW2diPwk+TC3JMkt2xFDhEzFO7uoCiOqlYtLs1TVf9568fJYbYDVIFNKiNGVYC09kGRRmqAZHphPD5PCoiX+S2CF946/lNdlBv1DuH7XVZpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KNn1epMrWUAiW9CZeXc+YGt54V/Wkg59uwUIDGnVrD4=;
 b=MEtFPH/3tkkUX01hq8hiDGU/klWX0gY0JbNVxQwNtdwYDx8PTBhXGyFiLyWZWhLuDOhzW0kqixtxa9mMObNzpJ5ASclW0eVBWiEw8sJcbFpcOS5ZVjpQIFmULufZy6fqMxrp1WCpjqKnQVshm6oXcLmchmwAuVPcPnvIeOQ+L7K/6DwsIfiOJiOAY8WGbRAP+UzT+ZQjDjtwZkF0L9u72njQQn51xq8gmj4Vpsj3N3rL1cX12n6XVT0OuCi82yuJ8je+z6BojXAphAZEy2GMWatv7TEUbFPjJV+hsSbZN2HwWlQxn1n4vqtCvjm0N64eRSWswxAJuJWr0MFqGh05Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cc3d5968-a9dd-dd52-fe5b-89c5fbff5a1b@suse.com>
Date: Thu, 16 Dec 2021 16:17:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2] xen/arm64: Zero the top 32 bits of gp registers on
 entry...
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
References: <20211216092134.579-1-michal.orzel@arm.com>
 <58061d10-7299-6aec-5cb4-4c2d54f0043d@suse.com>
 <56435926-e091-fe33-9044-b669ecba23f1@arm.com>
 <0ddf5147-1f72-37e2-ca56-72307800463b@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <0ddf5147-1f72-37e2-ca56-72307800463b@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0012.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 601df591-0671-4552-3939-08d9c0a738fd
X-MS-TrafficTypeDiagnostic: VI1PR04MB5597:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB559764AD6DC54ACEF99E3172B3779@VI1PR04MB5597.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YtSZaIFqZLJ5kliH15Uq2lG+sI7MlzOLdyfaukZdJduX/jrpRPuQZWlPSoIdAkDeVgbCkiK5NwuCN7XaFsm4q5rwZ2FtgNbyafczoODZEM5JFX/AfKa39ZpVrg5cofu1+JET5BuhWh2YJlLzsiKlehbJrDp+YM+z5bHkxf4lXMmJO9I414R9JRu/QtznuIAVy781hRgejrH8QlDq67eb782o5DiQQpgond2jjKJ+FuIxSEsfI+uauFsl36qyB89yaLJbiOX8RnxQlUvLZRal/zgABTU3ruFkR6g7BrSCNlEIeIEOOkClCrh8IRnQYy6wMYjyYQzPohz/V47xDQC6P2MN4koAlbDl7c2FeC20ZPcQ1OhfWIil8x1E4XZrH9SufLD4wF8zSijSX66sdq8VV49mZ7hr34jalTdoEg3ehEKnft8saWrOmwZaLkz5pl3QXcRxmVjHQj68CZCyHJuM/PHYBTeJfh76rNFOx0xpcfNrOiVc2/dF1jV1UnsdT6lEXOucyviYklR4mzjkKvlIAHaj467P+07Yra0CLSXxo9MdhH/KnWPNDBazuDz48FEw8VwP4hbO6yTQF7jUH6x+tzPjcs7b2yH08e68Xl9dAwTM/3H7gRwCqXTxEaKDnfhrE2oObRyVfL3/K8Mq4ciBurJsNhaObviIXOpLqcp07G7BCHso/m4HZvdejWlUStn/bmiUSD5Lr3PnuCclnYYfzd2MmLXjBkzJUDFuQlbEW8SbHjGGJanERMLJ1OHZjnzz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(66476007)(53546011)(31686004)(54906003)(2906002)(2616005)(26005)(31696002)(316002)(6512007)(8936002)(110136005)(5660300002)(86362001)(186003)(8676002)(6506007)(36756003)(508600001)(4326008)(83380400001)(66946007)(6486002)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHRHSDZPS0NUdlh3VWFXV1ljTzQ2c0krOXA2cmRjSytBd1A1WjJlNnRsL2lj?=
 =?utf-8?B?U3p0emJLdmE5UEcwaGpsWG1GK0tqbFdJUlMyaitmT2t5bUNYU09qTVdHRmFj?=
 =?utf-8?B?WG0zWHBDZlh6ZnJOVXhncjR4UWZaVHBMS3MzbDVVczkyczlYSlV6MGFvSEpI?=
 =?utf-8?B?N0JOSVBTQzZzbWlQN1JMVjVMaGFmRUMwdlA1UFYyb2UwNEViNkFLU0lTbTYv?=
 =?utf-8?B?ZVR0cHpxaU9WYnJPYzB1VTI3M21sZmF0MzZ6bmQ0cnBSamRuMFFVeDhFR08y?=
 =?utf-8?B?QUdyWW5WdCtWOFYwR09Ta2Vxb3AwSkM0RytHdmVGaFhkYWJkSFVmU1BhUWl3?=
 =?utf-8?B?OVhZdHNUR2pleXlPbHZib3pjYTNIQTNidFlHbkFnQUVzaHFZVFpMM0dGSE1Z?=
 =?utf-8?B?T1Q4WTFwZ2YwOEdFQlBhNGxSZjd4eWQ0V3F0K0g3MXQ5RXE0MVZ6ektCVFFm?=
 =?utf-8?B?N3dlQjk2NVFkbk1lVW9SbjcreDdWYWZCWW5QaXp5MHYzNVFWRHlHNmg1QnY1?=
 =?utf-8?B?cmV2UFAvaVFObTNWRTNSY2hKMDJxNHFDV3BnS1VWTjBOU3I5MWUxWE9GN1pa?=
 =?utf-8?B?aEJMTXExZTJhTUZ1QWZwa2Z3Q01JTUJqRXBkTVhBOTl0ZlRnTEc1MGhWUTRU?=
 =?utf-8?B?UTRnMEg1aGpkZE1jZ1IzMEl0aHZSUlVMQ1Q2aDFzMFhkSlYzMG1aUEs4WXNs?=
 =?utf-8?B?aTl1SmpqVGQ3dVpnc0R6YWtSTkdQR0F6cWpsRWsvaHNDdXhEL1lCQ29UVGVI?=
 =?utf-8?B?M1UvemQvMjZxN3Fub1lsMjBzNi9FWUQvR1pYcmtJbnRHYWZxT0pmUEtLQW55?=
 =?utf-8?B?MVVrbXpRaERjaGZibkdGdmRwNHpEQVFMTkx6cGpqckJhd0RseDlyNXdDTS9n?=
 =?utf-8?B?UUtxeHpnVlMzc3RmMUQzZTVYZjFEZldlTndreXdtWm5UQ3R2VUxmL2hqWjJJ?=
 =?utf-8?B?RUF4c1N5SnY3N1BJVnFuNU1kVE5rbkp4QU9kcFFsK3V4Q3dNc2d0d3hzTkdW?=
 =?utf-8?B?b1dEaE94a3JPa3dDYTA5SFM5dDRJakp4ZnRPbG9DN09rdVpjYTNYV3N1ajcy?=
 =?utf-8?B?U3p1ZmliQ21oOUMwS0dBa3cyWk04dXBKTkVtYUUxK21GMldtU1QzbnJjN2w5?=
 =?utf-8?B?eDY5eCs0YmR2VzFzWUwyRkltWXNHNVNGTHFScm41bjFmZk1vYTBXRUswdUNp?=
 =?utf-8?B?akdkV0NnTnVWZmE5Y2F4dVJCaEpxK0NvS1NCcW85V1lSRzMyT3FGK2d2N1pV?=
 =?utf-8?B?elhmc05XSklVLytZeWdDWGo5SFVxUUpXOTM5YldsVUdJMjhob0l6LzNJOXVk?=
 =?utf-8?B?c1pjeDBkb2xKaGt6NEQ3UDR6NVRhUUt6Wktma3NOSWJacEtnZjdmdE4vMnBO?=
 =?utf-8?B?d0pRT0MvWGkweEhRZnFPQzBjVFZESXBTYVVBSzFCb3BUckU2b2dsdTdSUTNB?=
 =?utf-8?B?bC9EazRaUUtCT0d1VDdPS2xrd3hrcHAyZEVFNzlsblkrNnpIZGdieDRTcUs1?=
 =?utf-8?B?RTZ5dFZ3ckUybXZaczlnMDh5dVBhQThQaFc0T3hwaGtkbnp2YWM4UjRNSm1O?=
 =?utf-8?B?ZjlQVUxyQ0I1TlB2MzNjcTZISlJka3R1SHNhLyt0dXE3dmo0eEN1eEV4S3hy?=
 =?utf-8?B?ODB2eW5qL3VtdUE2eVBpMGdtUHlKY1ZSQkZnaTJlWXFGODdtM2k0RmZwbS9H?=
 =?utf-8?B?S1dZUStaUUFTUlNMV1dPdG5DWkZtZGEzbmJ0NlJGZU15UUFTUHFpZGt6ODg0?=
 =?utf-8?B?VW1pVEJNWHVvZTYralhOOUYySjhLWWxMMjdmK1NVb0k2aXUyYW1PbERZQmVP?=
 =?utf-8?B?VDRzRXJPdU1tb0hGRnZNL3F0aXUvekpuZlJBMnpxOWVPMzlRN1laejl6d3hw?=
 =?utf-8?B?ZU1SQVcxeFA3alY4WHZpMC9oYW5FTDZUY0Fob3FZb09ZOVdlTGtET3ZwT3JZ?=
 =?utf-8?B?WEkrejhuM0tyRWM1WHJTZ3p0QUltdjBzT1lrUUE2V0ZHMXlWRDByRnpjN2hZ?=
 =?utf-8?B?YkdOdUtYR0RLOFQxQ0JFYUVYWW1nR1VqRlFLZGhQZkE0dklrRkhHbU5kSGFu?=
 =?utf-8?B?ZXFVSDBEQjZwNkcwQTI4OFlacmxrTjR5aXJvYlFOSTVCc3NoTWlnRy9OZlVK?=
 =?utf-8?B?QXBiU3VHdVdhMEtrTGpjVDVkcUZ4QkFnOUM1MU1nSXdBMVJPUVRZUnVzTGda?=
 =?utf-8?Q?FpleT7Co6IjkScHDjm654XU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 601df591-0671-4552-3939-08d9c0a738fd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 15:17:49.9185
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WUgdLs/81dopGS0JJ3Z7AP8tJW9U7uuOtxBZTQdfccGbnC16h7hhoddkZg9f99EpEqElf5bsU3or+oDbkP9low==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5597

On 16.12.2021 15:55, Julien Grall wrote:
> Hi,
> 
> On 16/12/2021 14:26, Michal Orzel wrote:
>> On 16.12.2021 14:50, Jan Beulich wrote:
>>> On 16.12.2021 10:21, Michal Orzel wrote:
>>>> to hypervisor when switching from AArch32 state.
>>>>
>>>> According to section D1.20.2 of Arm Arm(DDI 0487A.j):
>>>> "If the general-purpose register was accessible from AArch32 state the
>>>> upper 32 bits either become zero, or hold the value that the same
>>>> architectural register held before any AArch32 execution.
>>>> The choice between these two options is IMPLEMENTATION DEFINED"
>>>>
>>>> Currently Xen does not ensure that the top 32 bits are zeroed and this
>>>> needs to be fixed. The reason why is that there are places in Xen
>>>> where we assume that top 32bits are zero for AArch32 guests.
>>>> If they are not, this can lead to misinterpretation of Xen regarding
>>>> what the guest requested. For example hypercalls returning an error
>>>> encoded in a signed long like do_sched_op, do_hmv_op, do_memory_op
>>>> would return -ENOSYS if the command passed as the first argument was
>>>> clobbered.
>>>>
>>>> Create a macro clobber_gp_top_halves to clobber top 32 bits of gp
>>>> registers when hyp == 0 (guest mode) and compat == 1 (AArch32 mode).
>>>> Add a compile time check to ensure that save_x0_x1 == 1 if
>>>> compat == 1.
>>>>
>>>> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
>>>> ---
>>>>   xen/arch/arm/arm64/entry.S | 29 +++++++++++++++++++++++++++++
>>>>   1 file changed, 29 insertions(+)
>>>>
>>>> diff --git a/xen/arch/arm/arm64/entry.S b/xen/arch/arm/arm64/entry.S
>>>> index fc3811ad0a..01f32324d0 100644
>>>> --- a/xen/arch/arm/arm64/entry.S
>>>> +++ b/xen/arch/arm/arm64/entry.S
>>>> @@ -102,6 +102,30 @@
>>>>           .endif
>>>>   
>>>>           .endm
>>>> +
>>>> +/*
>>>> + * Clobber top 32 bits of gp registers when switching from AArch32
>>>> + */
>>>> +        .macro clobber_gp_top_halves, compat, save_x0_x1
>>>> +
>>>> +        .if \compat == 1      /* AArch32 mode */
>>>> +
>>>> +        /*
>>>> +         * save_x0_x1 is equal to 0 only for guest_sync (compat == 0).
>>>> +         * Add a compile time check to avoid violating this rule.
>>>> +         */
>>>> +        .if \save_x0_x1 == 0
>>>> +        .error "save_x0_x1 is 0 but compat is 1"
>>>> +        .endif
>>>> +
>>>> +        .irp n,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29
>>>> +        mov w\n, w\n
>>>> +        .endr
>>>
>>> What about x30 (aka lr)?
>>>
>> Well the docs says about gp registers as a whole so including lr.
>> However I do not see how clobbering lr would impact Xen.
> 
> Xen may not be directly impacted. However this may be used by some 
> userspace application (such as for VM introspection) and could be dumped 
> on the console.
> 
> So I would cover all the GPR to give a consistent view to everyone.

Consistency is how I came to think of x30.

Jan


