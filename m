Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE3C41EF65
	for <lists+xen-devel@lfdr.de>; Fri,  1 Oct 2021 16:24:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200672.355223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWJSV-0001TU-KR; Fri, 01 Oct 2021 14:24:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200672.355223; Fri, 01 Oct 2021 14:24:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWJSV-0001RR-HQ; Fri, 01 Oct 2021 14:24:19 +0000
Received: by outflank-mailman (input) for mailman id 200672;
 Fri, 01 Oct 2021 14:24:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KCT2=OV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mWJSV-0001RL-26
 for xen-devel@lists.xenproject.org; Fri, 01 Oct 2021 14:24:19 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 42a668a8-22c3-11ec-bdad-12813bfff9fa;
 Fri, 01 Oct 2021 14:24:18 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2050.outbound.protection.outlook.com [104.47.4.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-24-5VccNSuFOPa-Df0pm1P35g-1; Fri, 01 Oct 2021 16:24:16 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7150.eurprd04.prod.outlook.com (2603:10a6:800:12a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.19; Fri, 1 Oct
 2021 14:24:15 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Fri, 1 Oct 2021
 14:24:15 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0353.eurprd06.prod.outlook.com (2603:10a6:20b:466::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Fri, 1 Oct 2021 14:24:14 +0000
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
X-Inumbo-ID: 42a668a8-22c3-11ec-bdad-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633098257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i6DXaUMdkvaSJhGgZy3nnIavS2SZ7o5MouOVK78/7VM=;
	b=Md3e9vCK8mJ3PXMCwfrUXUQzWrfqU40MoXuv2UbXmqZoqBFAKyRyL9Xo4A0U4Dq0dhx0OL
	aR2hRWquDrp750bOml9PWMBCU7HQRxFJCxS2G32q2WPRLMh+C8IvLZBYNHA7cL8qDVglCn
	uauPWyNywc8oCjjzofH2fMpTBbzg64g=
X-MC-Unique: 5VccNSuFOPa-Df0pm1P35g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rj8K8KfdNl9olEgPnIxJHmeXSdNCduqItLkemPqYAOf6M8wuILtoVxX0f6Ft3IpKXcUL6g8OBmib6P3e4cGJu7C5uAMGuUAtQvTnC6+/SWJUCqOgHXjmC7Fwpva1Gf1cZj/KxXaDc0dFeDgKjnWgg2ktzMKVVNBM+Oxxh2S8RfelRq2suInW4suAcmnusne8pgIEpBR6sV+LETcOzMJ/Iz/2wL/cNp4SUzdlh3zxR2JTquPlc09uK3A/B02RuodgMzZMhJhS6l2jnkegwwaVbFO45u6qiey+8rZY/M+FRW5P7L8csPjQpRfwrX/JMDrDorXwN9wPWnNCoXy4DtM9Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i6DXaUMdkvaSJhGgZy3nnIavS2SZ7o5MouOVK78/7VM=;
 b=GS7ygT4CkPj3GTz731FHsQyyxs1SzUIYqd1HSEhhKwgf0AkMYCCrzhbp56w7zGx2lpRPKqxXlCc3hevUFf+/kuiFsfKHLZRgcRTwPIKcxXOi6mYdXk3WXA+XtGN8hkI6RzVXOGNFUGzdluUY18oJBfopRq0F8PFukO4aLDzX85n/lMOExqRPl/ZefG5e95DD+yOsV6pvMIWNs9H7GJ3HLRntP8W4tFW1GBeTAMbvc9OSj9d/sc8o7JEY6ZWXE8XLUj+xVT+2FNg7i1XsB2s03Mtydr3YLIEm/doRPPakHzymCfmGISbeK1t9BhvxOnl+KONtg/RweEG3E2T1ZcFrQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v4 3/3] arm/efi: load dom0 modules from DT using UEFI
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210930142846.13348-1-luca.fancellu@arm.com>
 <20210930142846.13348-4-luca.fancellu@arm.com>
 <21f9af33-0d09-fb2e-95fa-f4c5796671ca@suse.com>
 <29BFC7F8-5173-4395-952C-FFF0E1F4C9FB@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0fc3fc76-30f6-4683-6bac-2b1adbe56cfc@suse.com>
Date: Fri, 1 Oct 2021 16:24:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <29BFC7F8-5173-4395-952C-FFF0E1F4C9FB@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0353.eurprd06.prod.outlook.com
 (2603:10a6:20b:466::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: feed6e4f-0aa5-46dc-452f-08d984e72579
X-MS-TrafficTypeDiagnostic: VI1PR04MB7150:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB715050E16C8369F7EB2632BBB3AB9@VI1PR04MB7150.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lXer9a/qe0v01f0aCH9J4i1n52oKJ5URyB5Q5LrgXN0UZ3wPmaaPzqay6t05I0NSOYO7HivyOZ6HzDQIRKb8Lb/vXBxyJ7KsJOx+2Lhu4ZLza9T0xEyKtVWwqJomj+MQV6MWh7cgmtD8KajGe9duOAaPwtFLDprXyO9JLGqiBFGgiWXNqO0+StobHxFtBMIq3cRTVUWmTvMiCiuQG5PZqckCpC+ed/9Ab4sDVwp2Xw5BVZlNjwjk8n05TP1Lejle0r4CoBUKNkhukVPGtuTGQu5A13/dPN82WQwpfT+r1QFDGJAzC1aq5Xi5eOJlCisCSo/psMGB9lejq3ztDy26rZvQfzsUttwt76hhzRUgJhYEGODPXOHL0vrUUJehS5WmSBuSX7L/cB2+eC9HblMemDaeERRz9kKIdjcVwZq6p1XPNFKBrJ9DoM11t1FVeGYhtYTkpfbr2PgJ2HO1qQGjUHOFf4DiJmB0GJq9sEuE6rzldV8ZysYKE9J3Fv093JOcS6AXLftygOp5U7Xsr+OCC54wOInwTW7JFrbNsJ2rsGZVrN394zuBWAvCtXONmCAwn77jaqQxH+nOGqAA+xM3u4Oym40SsAT6IXUOXdynS/oDAVRvCmKhRW5JVLycZ+WVbucZ9aT0KHmV/DpsG5zH2LcM5uEm3R0uo28Ha8CTeh0Dpr69+0Voa07IGJTXXqqkqmZa7aXN9GsrU3VDQv64LrGfUwPjNgyFxPo5VjtSDWjSQNT3yCSfYsnMrO1xHmLf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(83380400001)(36756003)(956004)(66946007)(66476007)(8936002)(2616005)(66556008)(86362001)(508600001)(6486002)(6916009)(186003)(8676002)(26005)(16576012)(7416002)(53546011)(54906003)(5660300002)(2906002)(316002)(38100700002)(31686004)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?STJKRnBDUzZvVzZ3cElhS2p0Sjh1cytEUFQ2c2UrK0VYWEpnV2dhZFVsNnZX?=
 =?utf-8?B?YjZnWHo4MXZVZjFaVnBOelpHS1BWbHJHTnZtMFBlS3JyS0VpYkJtbzRXUzEx?=
 =?utf-8?B?UGZnU2VCWkJZaTYrTWQxa0FQd2hRZDNmcVZoVWhtVExqaktIeVhiQUx0REhj?=
 =?utf-8?B?NjEvalRNbGlYeVMzWXpodGJHcUZvRTJycDMvTWdDaUxzRVV6c3NyU3FJTUs4?=
 =?utf-8?B?M0xUQitpUEVpb2R1bTludk5jZXprTWkybUhENWdsWnNTU3NkVEl1MDFiYjlw?=
 =?utf-8?B?dFhCV0tlS1BDc05vTllpSnhZbzU3aDdCa0w5UjRFaElMa1hpczAwTWZ1RExS?=
 =?utf-8?B?STNVMk9uVWNNOVp1d3lmSTY4RWR2MkJhcmFremlkM21FbHFSZFVjZi9VYm50?=
 =?utf-8?B?cTBLS01RYU9rdFBqOUw0SE9Mc1V4YnBZWTN4ekRRQWRIZ2JydVB1OElSQ2Iz?=
 =?utf-8?B?ZFBSczNzd3R2TUg5MmM1cjRsU213dmpXSXJES2o0R3I0Z3lKN1BZRUxtVjR1?=
 =?utf-8?B?Y1Y0NEM4Tm5zTHd1WTRtWDVmbGdFekdxRGVMbmw2bnlPc253Z3liZEttY0Zv?=
 =?utf-8?B?SC9SQWdxVGQwaWNSbWFaTWVnVzNqUGRYRENkQzhYRXJqMW8zMERrZzZVazdP?=
 =?utf-8?B?MCtzbldMd3Rzek5iSVd6QjlEaU8rd1MvejkrU1lKd0t4cm9qL254dmt5VkFn?=
 =?utf-8?B?OC8ycnRxRE1YVzNFZ000SDNySkhvY3A0V215bHRDd21GcG9sK0h5SWlMMG95?=
 =?utf-8?B?Y295TlAxOWNzQkcxR2M0Qm5BdkNtbi9sMzZ2RWhqdlFxTzRLQmlhSjVWVEl0?=
 =?utf-8?B?ZWFtWExNNmVOcmVYOVdCOVhEYzdDWFpZNFEvd3N3bHZBZzFUUWNCZWdhNGNY?=
 =?utf-8?B?U3NmQ2hmT2t3QkYxNTJ2eS9BS013ZlFqZ2wrUjFUaUlTenBWQ0o0Sk5tdnc1?=
 =?utf-8?B?UCtnQTBsQ3cxeGZUM2dTUUtWT1MyVWlBbTNPY3lZSEExbzgyZktYL1Q3cEtX?=
 =?utf-8?B?UDltNWlpNWJTa3dkNFZGR3VEalR1YS9YeXJxMDJ2Z1B3aHdabXB4WCthc0Vm?=
 =?utf-8?B?eXpZUWMraHN3S01zSWlGMHdleUJtSk5IcjhoUzhkQkFNdnZOS2ptVVNSbEtt?=
 =?utf-8?B?RTNPa1RwMmo1Z09PMGdhcW5GK1VvWjZvSEVneGtjbzk2NVh2Y0pQRnJyNkNW?=
 =?utf-8?B?emFsU2tsVG5VczJTU3B1bSthT3ArblJuWU1xaGl2aTR0Z2RYdi92ckR1NSsx?=
 =?utf-8?B?ZFhYbHd0SlNmbG1pRUhmMmZ5MEZkZ1g0US82UnExcFdhWUpDRURNNi9lQzdC?=
 =?utf-8?B?bnNPdFNOcGlDcnltOXlxMXBTTWVuNC9FYzI4RUs0RlBvWjZ2Skp4Qk9hTzVG?=
 =?utf-8?B?VzVDdGg1Q2NqUWxMSjZLajc0R3c2UVZ1RkZFcUVsZVJZWmJmLzZWSzN6RUEz?=
 =?utf-8?B?cEtnSzQvNEM5V3A5U2FmVVpDeDBTckdEdkJ4SG9DTkEzZGNESHQ0c0NnOWw0?=
 =?utf-8?B?WFdYQkR6RnN3b0NHUjdOcDBjY3NXRmV1TXA3a21NUTV2Q3NteldSMnR0MUpC?=
 =?utf-8?B?M3BESGV6YWNvT1MxcDNHOTBSa3k5Zk1LaHRINjBpQ0JJN05BbHgxNldQU2g5?=
 =?utf-8?B?OTVVUy9jVjgrcXVoRU5wOHpMMEw0WkYxaFc1RkgzY0lxa2pFRHVMWXFHeXhs?=
 =?utf-8?B?MFBnTXBYOWVXbHBycU92bnJHdS9UVHJXbWFZTTBUOWpDeXJ1WE9wS3JBNWRH?=
 =?utf-8?Q?jvET3sXKf1XpSDwbsaifQaSZ+GP8lYhpBJPBCcj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: feed6e4f-0aa5-46dc-452f-08d984e72579
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2021 14:24:15.1841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2JdVPWlYofTHBUqBR4NleoezPjuMDy+1NeSnulfjfKKdkEK2FoNYBWXEvsBlo88+jJU6olG+fQ2H646yuHwp/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7150

On 01.10.2021 16:08, Luca Fancellu wrote:
> 
> 
>> On 1 Oct 2021, at 12:16, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 30.09.2021 16:28, Luca Fancellu wrote:
>>> Add support to load Dom0 boot modules from
>>> the device tree using the xen,uefi-binary property.
>>>
>>> Update documentation about that.
>>>
>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
>> despite ...
>>
>>> @@ -1385,6 +1380,17 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
>>>     if ( !dt_modules_found && !kernel.addr )
>>>         blexit(L"No Dom0 kernel image specified.");
>>>
>>> +    /*
>>> +     * The Dom0 kernel can be loaded from the configuration file or by the
>>> +     * device tree through the efi_arch_check_dt_boot function, in this stage
>>> +     * verify it.
>>> +     */
>>> +    if ( kernel.addr &&
>>
>> ... me still being a little unhappy with the inconsistent use of the
>> union fields so close together: This one is now consistent with the
>> one visible further up in context, but ...
>>
>>> +         !EFI_ERROR(efi_bs->LocateProtocol(&shim_lock_guid, NULL,> +                                           (void **)&shim_lock)) &&
>>> +         (status = shim_lock->Verify(kernel.ptr, kernel.size)) != EFI_SUCCESS )
>>
>> ... is now inconsistent with this use. But yeah - read_file() is
>> even worse in that sense, except that there the different uses are
>> for specific reasons, while here the only requirement is to satisfy
>> shim_lock->Verify().
>>
>> Please feel free to retain my ack in case you decide to use .ptr in
>> all three places.
> 
> Hi Jan,
> 
> Sure I will do the modification you suggested, I will fix also my silly mistake that
> Stefano pointed out.
> 
> Just to be sure, I explain what I will do:
> 
> In the second patch I will change:
> 
>     if ( !dt_modules_found && !kernel.addr )
> 
> To 
> 
>     if ( !dt_modules_found && !kernel.ptr )
> 
> 
> And in this patch I will use:
> 
> if ( kernel.ptr &&
>          !EFI_ERROR(efi_bs->LocateProtocol(&shim_lock_guid, NULL,
>                                            (void **)&shim_lock)) &&
>          (status = shim_lock->Verify(kernel.ptr, kernel.size)) != EFI_SUCCESS )
>         PrintErrMesg(L"Dom0 kernel image could not be verified", status);
> 
> Do you agree on them?

Yes and ...

> Can I retain your ack to this patch doing these changes?

... as previously said, yes.

Jan


