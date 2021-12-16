Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1824774BC
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 15:36:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248004.427723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxrr7-0006kX-1M; Thu, 16 Dec 2021 14:35:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248004.427723; Thu, 16 Dec 2021 14:35:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxrr6-0006iA-Tx; Thu, 16 Dec 2021 14:35:36 +0000
Received: by outflank-mailman (input) for mailman id 248004;
 Thu, 16 Dec 2021 14:35:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VxGf=RB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mxrr5-0006i4-PS
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 14:35:35 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6d9ed4a3-5e7d-11ec-85d3-df6b77346a89;
 Thu, 16 Dec 2021 15:35:34 +0100 (CET)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2050.outbound.protection.outlook.com [104.47.1.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-4-zi31XWl5Mz6nQ4UrXqL6Yw-1; Thu, 16 Dec 2021 15:35:33 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4847.eurprd04.prod.outlook.com (2603:10a6:803:54::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Thu, 16 Dec
 2021 14:35:30 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4778.018; Thu, 16 Dec 2021
 14:35:30 +0000
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
X-Inumbo-ID: 6d9ed4a3-5e7d-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639665334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qR/ojdJ7y1LyZctuqeg8xMofnWyJGnwbjLdx2T9ZW4w=;
	b=nSjFrSHsI1g6zOLnaYYLFDBqwrg1PJU9kt5g6Ie//imWGVmXvu7DvWmpFBvQ6QeDU9g/N+
	f4UwLVj7d5LsdqBazzQzeI0gUblC3pyma1sPp9Z4/fI042AbY0sUSCa1+Ott1svPAMMABA
	hwaDHOJ6EdG4WOk52fPk+ymLqLImwwo=
X-MC-Unique: zi31XWl5Mz6nQ4UrXqL6Yw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aabHoy7AGekg3hXo9n6dFFHWsAqcf9XF4QqzZetRn6RCLxGOLT/wV8Tp/Tfa8rIVoUtcLeu2+JtfJCCOAP6NDpkNmJ8IOEONzCsEPdmG0ybYwA6EIKugCa/Pxj81vFW+9XeiTMqDBbLi8tZpHk0DrWx7KmKa+OZXoVxSL0VfpPdjvFLLZHEvXcrYAqzF4MAPewsMrdpFAmuPt0hjEUssBGi810IOlDrfDm85Z+Rhoj6cUmXqKpM5f+JrkeyH3kERNhQwiPLwOpB80vZMOnnNSIH5O5FXJkvYsl9VP/hNDWoi9IIuGEveuMOPVpAiMI4VZas4fnonOZvqZM4JZS0T2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qR/ojdJ7y1LyZctuqeg8xMofnWyJGnwbjLdx2T9ZW4w=;
 b=GTSamvqIr9CpE3hg8Ymiwo4YBJGclXLK80ntPZ60NX12emCoca6ZOvDgwdsyZxKli4oeD446DK5fiYhXy8c99rVupybgaakaM85u8BuNUph1CsXMGhnDj3L4Box21Fh+cYEprJt+onQfDemavefPFah09bYem8MGZ9P/hl0WgB3WaviikE6ESwONoqkucCfIVhMpRVR4McckwlI+NmXWrXb3FBkaogAiPykksATGGdTIBlfaAC2RerJp8IX9vctFtr7Rxv1hCsD1DuDqdACXKvvlhiGGmZ2an+IgFSf/ODMgli2McfqkHxpZvUBZiDQFAcY88g7KQ0uDg83rnWKuhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1367a957-79f9-fc37-9f70-0523084258d3@suse.com>
Date: Thu, 16 Dec 2021 15:35:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2] xen/arm64: Zero the top 32 bits of gp registers on
 entry...
Content-Language: en-US
To: Michal Orzel <michal.orzel@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
References: <20211216092134.579-1-michal.orzel@arm.com>
 <58061d10-7299-6aec-5cb4-4c2d54f0043d@suse.com>
 <56435926-e091-fe33-9044-b669ecba23f1@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <56435926-e091-fe33-9044-b669ecba23f1@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0075.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3c62bbc-f045-4dcf-e2a2-08d9c0a14f55
X-MS-TrafficTypeDiagnostic: VI1PR04MB4847:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4847466F4787999C711F97A1B3779@VI1PR04MB4847.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vF4A/iZSJVUu3OaTktbfR/MOlenqyxl/lGiXUgzfYMWQhbcX7BCPejT/O2yC/AA04MaGa6MG4kh6qOVe/ENxJg5ks6+CrrfVwxOC0b+Or1KRMmI4xbKXyFEgbcMvOZ0zpp1jtz89Z9HBBeHj31PiPeWexLCmEn41b6DQ41xLx0A7iq6kxvUtx5RqbxA2DG8M535Yetnz+YItcUv8U1XaglA5PyHDuKGK4DAZIRN2gG1ickV7N2w9HvTzhwt/RomH3cDGg3hSTtqLCbjfJblvL+Vhhor7BGPk3jycIS2VLE+tVt3Jq1ii1CIi2aHlNraB/GnAsDa2CZlPjakCxOy7jCDLy58E7Py6WRKwzmXMWwdl2lF2g3i2lnluxGU6b5IYmGHHlbC9PFM2sFB2DhhMw3wkyCg7uhG7osJ2NJA7lJvdoPqZ4vOPHn79u5Xva+JNLSr51FSji+7jFUn6B0GEzEmE1PMCjMS7EB7yvZqLXnovPnBWOWkoWB8iwLVpRnDdg1JFII/LrBppk7jioltYLEya+5tXX8R7Waf3tS1JEEXkMOsfysORCNheja5nAmnwb6AEYEuWicGE8+IbN7O/+8v2unECiTz+hL8Af1JKmz2hbCQnKFsGwblGW444Evqb6b9/Ymqe//Tkmj/lbZCH9t2CPwwP+FnG859JuVYTVSiTJlRYeDrklt1bQ2MaZIlsMmnVEEBCIf8vrJQIVXq6Mn3nu0vorNnGhKcak+YTOLM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(53546011)(6666004)(4326008)(5660300002)(38100700002)(36756003)(2906002)(31686004)(66476007)(6916009)(31696002)(6506007)(2616005)(54906003)(86362001)(66556008)(26005)(316002)(8936002)(66946007)(186003)(508600001)(6486002)(83380400001)(8676002)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZzFnejdHMG5ObkpoeXZFdnoyVjJwM05DSGlaUUVFdEQ2UUNmRWFVVzNMSTFZ?=
 =?utf-8?B?dUJ4VGFGZlZrRHl5bnR6bVBoN2NzOXYyb2diZVJDY243TFZKckprUlRTdkRq?=
 =?utf-8?B?dzVVQm9JdEtqQUxVR2lLcGphbmVNNTlZelI3cGVLb2F2blRWZlhSai9TQmdT?=
 =?utf-8?B?REZlK1FsUWptNE5rM05iWmNNRVVGWHNjM1gxOHNLOW9lelJhVUVvUDlkSS9W?=
 =?utf-8?B?OU91OU5rakc4UXI5Nmt6V3JqQytmMlpGZmgydnhFTUpYOW9yYW0rV28yK1Vk?=
 =?utf-8?B?eUJNWUNXbUZkaXhBZUpIS0pDTlVob2FCTzB5MnVwYk9tRi8zcHBRZnI5VHFk?=
 =?utf-8?B?eW1zc1AyZ1FmNThMZnJaOFpNQzFqekZXVi8vY3FxWFQ1UXAxWHB3eGJYYU9X?=
 =?utf-8?B?TEI4ZHY1dldWNW5MTnZFWHMweVNxc0IvMXY5cjNXem9KV3RkdnZoaDE3dTlq?=
 =?utf-8?B?MW9MN3NYRUk1d2JEUFpLell2ZnFFOFBMd1NXOXFnb1pMYWZtVngxZGpSMFpz?=
 =?utf-8?B?ZFU5b2ZkNlJaQjJDQXdwV2J1ZmRKbUhuN3p3T3FGOHFldWJuUGZoVHkzZE8w?=
 =?utf-8?B?QWRaT0I5MTBUZW41VFJnSEY1dnRienAvZ082OWhMZWwzRDIxbkJsaVduRFZj?=
 =?utf-8?B?Z3ZmSGJjdk5jdDhBelJ1bWFwazNxZzFKeFJaMW15b0Zyai9XRS9QOHJyNkdB?=
 =?utf-8?B?QUp2dnBDb3FWaXpOY1l3bkRQWEdTQkthcnRCWFRCaS9HTXFFT0dOUzlUYUhD?=
 =?utf-8?B?a2VWSXFneXI5UW9KUko5bitNVlg1Z3JsSHhkbjdubUd1cTA3cEhkWlNkT2Ro?=
 =?utf-8?B?Wm1veVhDcFRna2V2OXB4aUNQN0d6eE53SVBITVk0bVdsQUZQMUtHTTU1OTU1?=
 =?utf-8?B?dnoxREc5eEtqZTFNczJpK2c4RCtwaG9qVlZJZjIxT3VhUlRVKzNrT0lnSG9x?=
 =?utf-8?B?dEU3a2U0QlZ2UGEvT1Rpemtzb2MwTVlFaVg4a1BaVmtib0JiUnYvc2Q1R0xw?=
 =?utf-8?B?UzNFOUNIUTBiMTM2T1VuNldKdmhsekZPZ0xYcWpTam9JWmdhQlFsM3FjTm9E?=
 =?utf-8?B?cmVjeWx3ZC9oNnBUOUl5OEJxRXp3a1RWZ3ZxMVFaZGgvdENRdXA3OERsQlVo?=
 =?utf-8?B?dk42UzdZZC9KNjhoOE5EMmprckcvRk4yS1Y0VitXekliUVRBZEQ1OHhVWjNW?=
 =?utf-8?B?SGdJNVB6KzJqYUdDL2t3dXZWZHFzRWxudzZvMUpiV3hiVlIyS04zeUV0Z3dY?=
 =?utf-8?B?bzBHekZhMDJwckJQdW54c3UxU0xodzltR2dIaHlIUVJWNVRXUUlmVmVjV2Jr?=
 =?utf-8?B?LythdE5lN05yaWNoNnhWZ3Z2a2xHamY3MDdXdVFuR3l3eVBwZ0dBeTV4T3hX?=
 =?utf-8?B?ditYQnpxelExOEI0ZTMxZDdFSU1ubEZHRXd6SUdKeXBCU3ZyRUd6UE5tRHVD?=
 =?utf-8?B?Y01uSHUxbWt3eFozVTB3U3VhRHk0WmYwWmpLTlJobnhBTityZHpLRXU1dE9m?=
 =?utf-8?B?WDNJclNENmU5bFEzVHdacnByN0NiTWFtcFc0b3FYbGZPeWNUaXQxOEpxVjVB?=
 =?utf-8?B?OEgxdksxSjhadG84VHFESlhDSVQ5dnJQaFVPbnhqczRhZENka1JtelRnaE9x?=
 =?utf-8?B?dUVJZ1ZwZEZORVFaaTgzd3hFL2plQ2FwM2NWZTJuajdOZ1B6QXpIc2tsT09a?=
 =?utf-8?B?OVF5V3lBdE93anFsb09NcHg1Y2VueTdkeG9WaFMyN0FWUWVoMldLVFlLdUhr?=
 =?utf-8?B?YlRyTkhlL0s4a2JjbnE0OVdXdjFxbWYxNHFQZDFDamJNZ0hVUVh1UGovNHpk?=
 =?utf-8?B?TmVDaWRkUDJqZ3I5UUJPejNVdXViME1qL3lxNi9sc084MjUwTFowRDdrcEFV?=
 =?utf-8?B?L0FvVVpORWNmQ1pWbDNndjA2eG1nWTYyb2pOdlR2TEN5SlF2KytXUi9HTTM3?=
 =?utf-8?B?V1BoTXBwSko3MnFLQVI2VkxGaWZMaDJtOXN3ZmxLYlhnS3FERFdhbEQ5NGxw?=
 =?utf-8?B?Qnp1bVAzZmNtd3FiZzB2ZG1iSjk5eDRqWUFudG1ERHZnbUtlNVVINzVYUHM3?=
 =?utf-8?B?QVN4ZVpHTERPYUIwb0dENklvWTR1NHJJNjJDcWZuc0hiQVF0U0hJdXVIRlMy?=
 =?utf-8?B?VmRhUjBSdHJZcTNMYW00UVlENERGMlpJekZCait5TU1aMlZpMWRMSGdsVzlG?=
 =?utf-8?Q?UfanDU3rZ5WBtqCsW1+Z8wI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3c62bbc-f045-4dcf-e2a2-08d9c0a14f55
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 14:35:30.4331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: exG5f7TdiyAiJDYo/MHWdmfeiuoiiZAASjLhjDTycFSRoyZuEtbNkQwuYtV6K4WTgz8yUUPsU+XB6mjiytS4Gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4847

On 16.12.2021 15:26, Michal Orzel wrote:
> 
> 
> On 16.12.2021 14:50, Jan Beulich wrote:
>> On 16.12.2021 10:21, Michal Orzel wrote:
>>> to hypervisor when switching from AArch32 state.
>>>
>>> According to section D1.20.2 of Arm Arm(DDI 0487A.j):
>>> "If the general-purpose register was accessible from AArch32 state the
>>> upper 32 bits either become zero, or hold the value that the same
>>> architectural register held before any AArch32 execution.
>>> The choice between these two options is IMPLEMENTATION DEFINED"
>>>
>>> Currently Xen does not ensure that the top 32 bits are zeroed and this
>>> needs to be fixed. The reason why is that there are places in Xen
>>> where we assume that top 32bits are zero for AArch32 guests.
>>> If they are not, this can lead to misinterpretation of Xen regarding
>>> what the guest requested. For example hypercalls returning an error
>>> encoded in a signed long like do_sched_op, do_hmv_op, do_memory_op
>>> would return -ENOSYS if the command passed as the first argument was
>>> clobbered.
>>>
>>> Create a macro clobber_gp_top_halves to clobber top 32 bits of gp
>>> registers when hyp == 0 (guest mode) and compat == 1 (AArch32 mode).
>>> Add a compile time check to ensure that save_x0_x1 == 1 if
>>> compat == 1.
>>>
>>> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
>>> ---
>>>  xen/arch/arm/arm64/entry.S | 29 +++++++++++++++++++++++++++++
>>>  1 file changed, 29 insertions(+)
>>>
>>> diff --git a/xen/arch/arm/arm64/entry.S b/xen/arch/arm/arm64/entry.S
>>> index fc3811ad0a..01f32324d0 100644
>>> --- a/xen/arch/arm/arm64/entry.S
>>> +++ b/xen/arch/arm/arm64/entry.S
>>> @@ -102,6 +102,30 @@
>>>          .endif
>>>  
>>>          .endm
>>> +
>>> +/*
>>> + * Clobber top 32 bits of gp registers when switching from AArch32
>>> + */
>>> +        .macro clobber_gp_top_halves, compat, save_x0_x1
>>> +
>>> +        .if \compat == 1      /* AArch32 mode */
>>> +
>>> +        /*
>>> +         * save_x0_x1 is equal to 0 only for guest_sync (compat == 0).
>>> +         * Add a compile time check to avoid violating this rule.
>>> +         */
>>> +        .if \save_x0_x1 == 0
>>> +        .error "save_x0_x1 is 0 but compat is 1"
>>> +        .endif
>>> +
>>> +        .irp n,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29
>>> +        mov w\n, w\n
>>> +        .endr
>>
>> What about x30 (aka lr)?
>>
> Well the docs says about gp registers as a whole so including lr.
> However I do not see how clobbering lr would impact Xen.
> lr is not used to pass any data.

And all of x0...x29 are used (somewhere) to pass data?

Jan


