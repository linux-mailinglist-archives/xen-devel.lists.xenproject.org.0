Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 385B2431AB6
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 15:25:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212263.370073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcSdy-0003za-Ar; Mon, 18 Oct 2021 13:25:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212263.370073; Mon, 18 Oct 2021 13:25:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcSdy-0003wr-6d; Mon, 18 Oct 2021 13:25:34 +0000
Received: by outflank-mailman (input) for mailman id 212263;
 Mon, 18 Oct 2021 13:25:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=628V=PG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcSdw-0003wj-S0
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 13:25:32 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f289198a-f5d4-4f79-9980-091f49a22ae6;
 Mon, 18 Oct 2021 13:25:31 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2054.outbound.protection.outlook.com [104.47.4.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-26-P3oYGPTWPFalbyxKVTSM4g-1; Mon, 18 Oct 2021 15:25:29 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4383.eurprd04.prod.outlook.com (2603:10a6:803:6b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Mon, 18 Oct
 2021 13:25:28 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 13:25:28 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR04CA0052.eurprd04.prod.outlook.com (2603:10a6:20b:46a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend
 Transport; Mon, 18 Oct 2021 13:25:27 +0000
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
X-Inumbo-ID: f289198a-f5d4-4f79-9980-091f49a22ae6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634563530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4P8Woev+XF47DAYisPnHcFWfKJ49yuCTydDc5pMJ8YU=;
	b=KEDwf8nr2KgNOb9YAEpLXDNMsH4V1XIT7/MuWFMCm/nfSROCp7RAeAOARQhsGlgfSEeOvO
	0kWsPQZ9WZLJp3gMndqoQFbk+TBVRRwV7YnpHioqOtmj3H0TFbJPlgdlob9bP3FZqQlU6b
	IN3JaU8MbrDDsP3Xg/X9atkVWdgl83Y=
X-MC-Unique: P3oYGPTWPFalbyxKVTSM4g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DjLbBMssJD0Q+puGFHk/Y3kakXNcjr47H3TwUqCkXDSsRSJoSJ+/rfNC0cbj5T8GoE/y7nD5toqU9Gh9wxsYR8pTp5uuyR69rkbGoRP8MC6HWM42b1RfRCPd8Qu1bj7RI1c6QB7hp1WjCjibjrF3A7r+SCA8SwCFqnp0W4rC9aEERnh/Zz3WwGci/FydosyFAe3JGy9114p5/R81md9OkPQrB6DsBbuJhukhJJ6iC73rvTJfwibGeiDJzYMvTocQa7O/ACqZb+3rQKFte2oq4zategy8AdQlDssu8csb533Rk5hMV76GX5GGa6db5sPMO6ZNbPqRB1aBbpFfmcac5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4P8Woev+XF47DAYisPnHcFWfKJ49yuCTydDc5pMJ8YU=;
 b=VVlX2r4COTbZ2fonRxIDCzWFIsjDkrBlz+ZOFyyFG+0y6LD/JzMUczFlrvOj0XNoeH2irKPAv8bpOCcnki5RUTMx8PY3a5YV6NqUeGn+VXcreA+0nOvI9WmWG4R2UThO/NtkO8x+hu6B1EKV61OSZzBKJuCkIB3n4e1MDjFWgRJgKEaYZzx+1Toe9Rx1DEnGBpveudM/Zg5X5FSh03ahv5NNSofyuSMFoVjA5AVRqM8UYg8fhHP8CsvmB5XJBJGY1CcTWeFPe60Ze/rkueBBLgxl1vCcRM7T5l2Ss/e+8+K0QJ+H8Ip46iErknG7h33/p7s2zkZKHNnIfHo/F3evvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 2/2] memory: XENMEM_add_to_physmap (almost) wrapping
 checks
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4f54456b-e8da-f67f-b6a0-b5ce2cf12cae@suse.com>
 <f78f8a30-39b7-cec2-2af0-27ebab28cedd@suse.com>
 <561dcb90-7b6d-4dd6-2ca7-a4a5ec1c5e35@xen.org>
 <5e829583-d593-3b19-ea54-acb31ee8eec9@suse.com>
 <de2a74f3-5b7d-d0b2-28a1-c3efe5ae05de@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2e60ea4d-ecf1-b93d-540f-2da24383d060@suse.com>
Date: Mon, 18 Oct 2021 15:25:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <de2a74f3-5b7d-d0b2-28a1-c3efe5ae05de@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0052.eurprd04.prod.outlook.com
 (2603:10a6:20b:46a::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ced92c6-3738-4bbc-f8be-08d9923ac060
X-MS-TrafficTypeDiagnostic: VI1PR04MB4383:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4383B0649884AD524F641F06B3BC9@VI1PR04MB4383.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PsxGhT7nIHkxeCr5sWXW9qhIOj957z0VpEmYstzkbU8SaCIflPuUcC8O3plyJqJq5szJhLG/WkFWcX/KVqAvPakdWRXFubBWWW/acXCDuywBb6veJ0+BznDn/YfURQcgnzSozAZKCo12yR37dTjmmCxqrJXBcqIfTEMaJFtQNhK9Nz75PehDNfboBlVoD2OrvRVBcWMqw3ArJFksgde0gy+6GSfC1WK39X7EVDGskxqQuBxAnVFFwhyA/tvclaM19jk6R+VRvT2TWg9VQJJ0oO23KeiH403r3N14mkKgr2M0IkQGrLPkjLDQyz8tUFXT6ao9CkDHItLVnnxTJ40VSiMDkgIOk6AZV3yy2IqV50idzo02KirrUfnVTrYG1Q+gopr3dGrCQmKKGtxRi27UdlJ+ms0QsYpMKEEkyln5eqe0vtjaGF5/1k0lRCyIW797agR3dA3zBqijsKrBncQBaJIRWzwZrwPkV9S0jz9qvfB9KHFixStRgCLBh1kudEQgGLzm+Vj2bJ3IIYFiscIhdWG3hakIoFUol2UPpdieuqJFzjndPJGJVkZU55O41yhaiPpqqovPMaB4DmzMhkzNWfldGtwkkVPES1zt7mTMLJzHUY/OTyi+DF0fD625M8s4HpYWzBWWJ41LzT/WuCNhAqBig8XtkJ8HZj4oHOKM3LS74PK5cNdmUqw8FV9BxaxWmjQyHFbvDu1xptvGS/rrrXYMta8GUD7B/wCKbKTZlizUDL0ueSyKOr9v9Hr6nWdq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66946007)(6486002)(5660300002)(36756003)(186003)(8676002)(31696002)(8936002)(2616005)(66556008)(956004)(508600001)(66476007)(316002)(38100700002)(31686004)(26005)(86362001)(54906003)(6916009)(4326008)(83380400001)(2906002)(16576012)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NmFKRVRuSXV3SkVNaDMxdHZoZWVSYms2d0F1M1ZJQUI2VU1FWXZ4OXJjanFQ?=
 =?utf-8?B?TnJabnFRY1hNSjlMajZZTjNsS3hMWGZSWWc1SGZPSmhwMFhaV2x1Mi9WRXVG?=
 =?utf-8?B?MURLa0d5NDVHK3M3UFhYS0hZVWthUE45ZlRtVkx2UzVkUWtESWV2UjlGb0Fz?=
 =?utf-8?B?WVM1VUUwdUtsTFFoYzNDdHpLVmRabi83Nk5udUtQekRJQUp5TDZTWlZWR2w3?=
 =?utf-8?B?WXBRa1F0UU9ITFhRMGRoT1ZOeWFWVDIrakRFOEhUZkpKbytsRG9nTmpuNVRY?=
 =?utf-8?B?Z29hSzJFNWRHM0FubnBuUmEyekdqek1QQmJIY2JEY1ZqVkR1ZUQya0FzN0Nj?=
 =?utf-8?B?bENzNGhkb05ZOHZzUTJQTEVJR1B4UjMvbUU0SlNnNThKSUs5TzYyRXkzSzU3?=
 =?utf-8?B?NzNYMUdGT1dtTDNaTGJUTnU5WGphK3VzUi9aUmJuMDcxMWNrVmk4Wkw2L3VR?=
 =?utf-8?B?M0h6ODd1bGdCZnA3TW5mODNDS0d3WmxiUnMxMFUrM1ZHUy94VGVId251TzRL?=
 =?utf-8?B?QndXZ1N4TjFsaXBCZ2lSckxTMC9sano4SkhYYU1IamRvYURlUlp1Y1d5RHVG?=
 =?utf-8?B?a2o5Ny96YzlXa2pqSis4SjAzMUNyMGhDRm5lYm0xSkJ0N2Z0NGMra0RGc3Vi?=
 =?utf-8?B?ay9vZFFybGlMYWhaRjNVK0R3aDVqZnhQcnFJcXNIMFg1eVlRdmZtZWlqZjRh?=
 =?utf-8?B?U1JLdUpaRnpsMnNRRVdlMEUrTGZ6UThMOFVQano4bWRMTU5qWWZWWmRtVnF0?=
 =?utf-8?B?MzZlYW9jN2c3MGowL3pUVC84Z0Q2cktmK1pEczFKdXFVSXR3SjRHc3ZQUXRZ?=
 =?utf-8?B?YVFCRGNDY3I5ZHNEWitqdVdET0xYMXhLb21DWjJpdDk3M2lkRDJzNk1HMVE1?=
 =?utf-8?B?eXFjb0c4TklBTUdKeUZ1N09QWDVhNGFSd01rQUV6aVdsYTNXek9CWkluVWw5?=
 =?utf-8?B?WjhweVcvcmpZUXZncU8vNTBuUHA0SENjT1o1RGV6elFMVjhld1Y0SFN6VUdD?=
 =?utf-8?B?YitMNUp1ZklSaXFJbEFNM1NPNVpMcVBrbVRXVk81azVHWEs2N2h6Y0ZEYmVN?=
 =?utf-8?B?cHNYR1piWkI0SmZ5ckdmWFlDU29PSnpEb2ttZURpOUhSSzVjdTVzQTZValZL?=
 =?utf-8?B?WWsrcmp2SlhENlV3alJxWkwyd21rUjRwZTllNlYwV096ckRMLzdaT1Era2Nk?=
 =?utf-8?B?MEdxN2xLSUdFdU8xODU2eTB4RVNTbUJ2WDM4b3hEaEtFWHdUVVY1MUxNRklE?=
 =?utf-8?B?ZE53ZURPd2tZWjlXTWZWZ0NvVUdya1Z3ZFJoQWlyM2FjVW1wVXdIQzhIRUZz?=
 =?utf-8?B?UmpEN3R2bEdSQ3A1TUpONmxrZUJWZHhZNDNNNDhseHpYUXhONGxPd25wOURr?=
 =?utf-8?B?dlNWTmpDakc0MnlYTisxVkVFdkY0RzFmTzlvemtjaG42dFBCSU5tWk4vbm9Z?=
 =?utf-8?B?Tnh0M3NzWFQrL1FyY082Qk1RWFEvY0I3Uzc5ODR0THdrTTllSnFsS1YvSUd2?=
 =?utf-8?B?eW9Eemx4TUR2VldJQi9LR1k2bG5wLzYzcVI0dUtqVHJ3V2tuTHkxdGtCcTN3?=
 =?utf-8?B?bG1vM1RFb2tCRklDUm5RcGdaZk1vZ2w4SldYbGJoVG80dGZRbzd5T2Q3NTE1?=
 =?utf-8?B?M1NWUXNRR3pkL3J2a2lHR1p2d0hPM0lKQnhRT0FUb1QyNk5WSmJFdkpPeDZ2?=
 =?utf-8?B?ZXBKWmJGSjJQRmpobENQYy94OUR0UFpSOFEyZi8rY3RTVU15Skw0aUxWRG81?=
 =?utf-8?Q?NqEFWytsiW+JhqN2te9WvMtDnCKSgmcRXplibzZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ced92c6-3738-4bbc-f8be-08d9923ac060
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 13:25:28.4314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t7xSbmri7S2gV842V5/74lHzVG1w8E4kQGBFJVd6QZFENgXos1q3jh2R2E3YBSrAxvWTNb5UNlmCaIRmH/VXUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4383

On 15.10.2021 11:26, Julien Grall wrote:
> On 14/10/2021 15:10, Jan Beulich wrote:
>> On 14.10.2021 13:29, Julien Grall wrote:
>>> On 13/09/2021 07:42, Jan Beulich wrote:
>>>> Determining that behavior is correct (i.e. results in failure) for a
>>>> passed in GFN equaling INVALID_GFN is non-trivial. Make this quite a
>>>> bit more obvious by checking input in generic code - both for singular
>>>> requests to not match the value and for range ones to not pass / wrap
>>>> through it.
>>>>
>>>> For Arm similarly make more obvious that no wrapping of MFNs passed
>>>> for XENMAPSPACE_dev_mmio and thus to map_dev_mmio_region() can occur:
>>>> Drop the "nr" parameter of the function to avoid future callers
>>>> appearing which might not themselves check for wrapping. Otherwise
>>>> the respective ASSERT() in rangeset_contains_range() could trigger.
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> I find it odd that map_dev_mmio_region() returns success upon
>>>> iomem_access_permitted() indicating failure - is this really intended?
>>>
>>> AFAIR yes. The hypercall is not used as "Map the region" but instead
>>> "Make sure the region is mapped if the IOMEM region is accessible".
>>>
>>> It is necessary to return 0 because dom0 OS cannot distinguished between
>>> emulated and non-emulated. So we may report error when there is none.
>>
>> Odd, but I clearly don't understand all the aspects here.
>>
>>>> As per commit 102984bb1987 introducing it this also was added for ACPI
>>>> only - any reason XENMAPSPACE_dev_mmio isn't restricted to CONFIG_ACPI
>>>> builds?
>>>
>>> There is nothing specific to ACPI in the implementation. So I don't
>>> really see the reason to restrict to CONFIG_ACPI.
>>>
>>> However, it is still possible to boot using DT when Xen is built with
>>> CONFIG_ACPI. So if the restriction was desirable, then I think it should
>>> be using !acpi_disabled.
>>
>> My point was rather about this potentially being dead code in non-ACPI
>> builds (i.e. in particular uniformly on 32-bit).
> 
> The hypercall is already wired and a dom0 OS can use it today even on 
> non-ACPI. Whether a dom0 OS will use it is a different question. I know 
> that Linux will limit it to ACPI. It is likely not used by other OS, but 
> I can't guarantee it.
> 
> In this case, the hypercall is only a few lines and already restricted 
> to dom0 only (see xapt_permission_check()). So to me, the #ifdef here is 
> not worth it.

Well, okay then - I've removed that remark.

>>>> @@ -841,6 +844,15 @@ int xenmem_add_to_physmap(struct domain
>>>>        if ( xatp->size < start )
>>>>            return -EILSEQ;
>>>>    
>>>> +    if ( xatp->gpfn + xatp->size < xatp->gpfn ||
>>>> +         xatp->idx + xatp->size < xatp->idx )
>>>> +    {
>>>> +#define _gfn(x) (x)
>>>
>>> AFAICT, _gfn() will already be defined. So some compiler may complain
>>> because will be defined differently on debug build.
>>
>> No - _gfn() is an inline function as per typesafe.h. (Or else it
>> wouldn't be just "some" compiler, but gcc at least would have
>> complained to me.)
> 
> Ah. somehow I thought it was a macro. But looking at the implementation, 
> it makes sense to be an inline funciton.
> 
> Sorry for the noise.
> 
>>
>>> However...
>>>
>>>> +        BUILD_BUG_ON(INVALID_GFN + 1);
>>>
>>> ... I might be missing something... but why can't use gfn_x(INVALID_GFN)
>>> + 1 here?
>>
>> Because gfn_x() also is an inline function, and that's not suitable
>> for a compile-time constant expression.
> 
> Right. How about introduce INVALID_GFN_RAW in mm-frame.h? This could 
> also be used to replace the open-code value in INVALID_GFN and 
> INVALID_GFN_INITIALIZER?

Can do, but that'll be a prereq patch then also taking care of INVALID_MFN.

>>> In fact, I am not entirely sure what's the purpose of this
>>> BUILD_BUG_ON(). Could you give more details?
>>
>> The expression in the surrounding if() relies on INVALID_GFN being the
>> largest representable value, i.e. this ensures that INVALID_GFN doesn't
>> sit anywhere in [xatp->gpfn, xatp->gpfn + xatp->size).
> 
> Thanks the explanation. Can you add the rationale in a comment on top of 
> BUILD_BUG_ON()?

Sure, done.

Jan


