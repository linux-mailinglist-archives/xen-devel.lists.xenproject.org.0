Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3022C55E524
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jun 2022 15:59:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357122.585548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6Bjn-0006XQ-UZ; Tue, 28 Jun 2022 13:58:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357122.585548; Tue, 28 Jun 2022 13:58:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6Bjn-0006VY-Rr; Tue, 28 Jun 2022 13:58:43 +0000
Received: by outflank-mailman (input) for mailman id 357122;
 Tue, 28 Jun 2022 13:58:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nsoM=XD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o6Bjl-0006VS-Od
 for xen-devel@lists.xenproject.org; Tue, 28 Jun 2022 13:58:41 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140043.outbound.protection.outlook.com [40.107.14.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69c254ca-f6ea-11ec-b725-ed86ccbb4733;
 Tue, 28 Jun 2022 15:58:40 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB6PR0402MB2725.eurprd04.prod.outlook.com (2603:10a6:4:95::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Tue, 28 Jun
 2022 13:58:38 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5373.018; Tue, 28 Jun 2022
 13:58:38 +0000
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
X-Inumbo-ID: 69c254ca-f6ea-11ec-b725-ed86ccbb4733
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UQsRSBnSKztSRaqxGxNp+msaGtSnB1LQs9+u2zxpYpq7BZYytXgMxM+xVmnGrEoe40MIPFiut+blTzX2p9QuF1t7z/KqaBMBGx9eFpFJy4CQrRQEx+OK0Ucik9KwJuHZ0Df6vSA++2vfUxRmXpEbQhJX53p/eLFrf9KXaes8FvigU3xhXV2GL1UpFVHwOjaNxnkyRLocHLR5gpP/4ul158sngYZmIaATUD0tnwfhGGserMwhxAAfvFlAtHkhO6raHloy7NGFvjh20cGi6e741XWwaczK6z98gyubkVgR4gWPqPYBblgcXq98FUyClq4TXHJdUdtlmiBhf2yFDy1wiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HjZFOURuPIESZfi6d8SlnLFqG4BLVKxR6BwdSzb4BBE=;
 b=Uc19MZe4LiKX7bd7U5CKgbHwxpzPoCVlTwRbCz9Ik9O+2LYoUhj5wPF/YG3WBd/VFRYcncZZnxFRcfJD5NoQrP+F+4GVxfIRkNMhSbtBd3tn7Ta/qkjIDHmG37K7sb8LeZZWA5GXCLxWcV90WRKdbDzNZ9WCnb3Vxs5ZoaUPUTN8LQw6h/108aqRJNP4o4vkBrOu5A+I+SDx7smyV86+FKsjwjpsyFhxHergc1UGwWPdSgvE/4lTyhyO89xg0SC2VdfoJNP/EJ3zaMPH5jq18Zku/SVzQVLkmq3GLzYGl21piUraJxn06rnW4b5rKv8Y+JQLzzNWUnQikfUF1Cokzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HjZFOURuPIESZfi6d8SlnLFqG4BLVKxR6BwdSzb4BBE=;
 b=Fm5WXIxyb0lhp1zPIuki7KUwXkdAwN1u/JP8q2iG7em2Dq4Kw9o2x3x+RhG5+2EnVzhYki9qNSlITdF/GbHtiloApdDOeqeGLcjTK6kxFm1E5fROEfKFk6DWpwi2V+yZMu4F4i8L/DFQLn4A4oxeRkqZNGXof9DMv9hsbqxycCRc45VklbdkAQUYU9B0p59ilxO6VmdNIcgdjuUAALwzEG4FyoaTAAkMLTjbSYXHIsG6VJLK8uvOilvd5rX9Tou5gJ4P0/AtCWKh0RhQ4gBhn+IHRhBKqwBvLPw22BORM3YCY5+Ek1LcBXS4092hYFs2JYGllU9boOgsmmXGO2Eo8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <890322f8-1ff2-aa74-f7dc-435d744f01ab@suse.com>
Date: Tue, 28 Jun 2022 15:58:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] iommu: add preemption support to iommu_{un,}map()
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20220610083248.25800-1-roger.pau@citrix.com>
 <a968598e-cacc-d762-46b8-579e18f64d12@suse.com>
 <Yrr9XUxZCrjLFGDL@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yrr9XUxZCrjLFGDL@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR08CA0021.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::33) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42e53399-46ce-4f96-e533-08da590e4cc5
X-MS-TrafficTypeDiagnostic: DB6PR0402MB2725:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RvTXHf0UaAgOtPOEDa1ddVkerEjj+rDgWgUPtCaXCcEA1WTywYmXDkAGTi7Y9kCuJd4Jgswi4fAKps+NuZCnNOOuQ/bPBp2xyRkY5ZWJsYe0HUlP+wBplJ3RGg+t5GlBf/zGl+OX+XmQIKseRMb3HKgIlZ4SqH3cNe44F3ykJMc9QKiVgrzLDgd9SZWX9S7YazPiMHh7HK5+UJRXIpdawmjv5CBVwtP9fBV2Gil4iOrg1DFzvs1uWDNVrCGwsL/6ee28uYzVi6k7ZFMxbcb0vrIP/Au39UqDH35ltEXBLiQnFOI6BAUmd51I6smghVW0+MdsdYBEBw8s8PIKbNdN3JUk9wnvz08bEhTn0irp/TKY1Ern73IbUPAvlcRhBHjsx++WOvNith2OyBbg5LbjpFFZwAk9U04GtYacpQgWsKEUCRqkhjMwm8rWWGNB2zMFvyJILif52Mmwgrryop2cOdEIRhSjU+TuqgoUVm+k+0CaAWnHyhP8Z5luEzLbELpPM8PpkbE9vlvhzERtT0q70cQ/doQ9lGd0qYWwoWf6q0v8OWN0N7EOg3sugL+z2s83GtyY5iZ8/9ffEeHx0ueoIFQ+T4/rociI1TGLS8OHDLnMGkXhfGCaooaLSjL0paTxZ0YNz/FaPMWZzEdbVVDrBzGS3clVG5H8JroY4xSqpH0OCusqvcqOjYT4VSFeJ7JnSodAO4wO3pb2SAMTIyAgTDJClxJDz0hsp7QEg0T+Dm+ZsSc8h+sbTx2aJM8pNYBCgzMtL3b8uglVmZ97ERBO8eo6tpnsz5P321TUkTAMvNA1gWcIGjOej7fjBuwPE+OjWZIetazAyutojWmud0520A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(39860400002)(346002)(366004)(396003)(376002)(478600001)(6486002)(41300700001)(4326008)(36756003)(31696002)(8676002)(26005)(86362001)(6512007)(186003)(83380400001)(38100700002)(31686004)(66946007)(54906003)(5660300002)(2616005)(8936002)(53546011)(6506007)(66476007)(6916009)(66556008)(2906002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ME9BdlJ1ZktlTUQ3MGVuMmU0S0RON05BNit6VGlnTUR2V0tuYlM3V3lwYndn?=
 =?utf-8?B?Q0ErRmdmMU83RjhvSkVnYXRHcWgrRnRkWGRGMnZBLzFkZWtjaDlNRVE4UVQr?=
 =?utf-8?B?S0t3VFVNNVFSM2wvNHNqZEg1L3d1NzJwaktRZkJaRVBXekhqcG9zamtvUjAw?=
 =?utf-8?B?aWtBMlRJNFFMbndqSU8xdHJGY2NuV1VxRW9VRmx0cXpwS2MzbjIzdUhTTzFi?=
 =?utf-8?B?dk1KVWpGaTZPOU5nbzJ6T09XbEVNbzVETm1ERHkxeWRYczN6SHZyYXFydUdZ?=
 =?utf-8?B?RXF3VGs3RWlhU2paM05rQ2lqcjQ4Vlc3c1R0MEd0SEVTYVVvS2pwVG5GQ01V?=
 =?utf-8?B?NGxsZGZKWWhia0Nub2ljc2Q1M1MrSVViSlNGWFpOZlhlblczNUtlajJCSkZw?=
 =?utf-8?B?SWpIbHNlYmtoaTRuK0pCb2g1VnJqUW9KaTZSZVF2NTF6MkRUeE5ESEN4ZVdj?=
 =?utf-8?B?MlgrclJNR0JHTlI0N015cm5UYW5LcFgrb0Rud0xjSzluN25vS3N3K2xjNHIw?=
 =?utf-8?B?RFNUenpNVTRSVE40TnVDZkZtU2RYR1JFMkhKZW5WZzhmWCtXTkQwbk9TU01i?=
 =?utf-8?B?VUN5Y1NKckcwdGNlQkJpZUdZSXJieklLN3ZvS3hzUXRLZ2t0MW5wN2l5Q0h5?=
 =?utf-8?B?OU82SllNaVJLeGxQY1FTdlk5YzkwOW9FM21CWnNjV1VhcURJMFZlYkV0SE11?=
 =?utf-8?B?VmVCNzJVZm5YUFRiRUowMUs5ZllXUHZqc2NKSmF5UkJSbkE2RSthLzN1Q3pq?=
 =?utf-8?B?OE4ybzRGeEE2YzREdElHWXBEeW1TeVFuSEJuMFZSMkRDd1RuL2hOVVFHSGF1?=
 =?utf-8?B?b2RKWUJTRllZQ3kySUptVVRYZE51SG1WTCt6clR2YlNPMFl2V044dVhLNUxn?=
 =?utf-8?B?ejlJT2xRVnRiVFRJOEpyRlJsU3UzcW9pOXBheXJqbFNYZFpmWGFwMFRxT29J?=
 =?utf-8?B?RWxqRVJza3kxQjgvV0lKWTFFNUtzMWdKT0FYeEFCc25jUy90ZTdFR1h1MFFS?=
 =?utf-8?B?bjhTQ3RaQnV3YVdmN09sckpTUHlubmU5eGIyUXhzSERmQ1ZQNXdycE9NeC81?=
 =?utf-8?B?a1JWVE9GZjk3eEJhdHBhNXNqYmVkNHdJS2M0d0hhdlRUUkZ6ZUdQTlYvU0VL?=
 =?utf-8?B?R1BQeGhueU43NXdaMWx5QjZXd0JlNjR0TEJjYWtrQ2s4RGNPQnpqVTBzQWFL?=
 =?utf-8?B?b0VSanZtYi9rdWRVUElEbG5kU0FCaDhZVnFxYVY4MFBoS21kV2FQaTBOL3dH?=
 =?utf-8?B?TjNEeTVpTThjekpJelM1WnQwY2IxUnZ2bHdIM2NWUUowc1Bwbk5aUFByb2dv?=
 =?utf-8?B?cC96anpzRVdSL3kwK2ROdHZSYklMSWtqNml1TkxBbXVUbjRiMVhacU1LUzNH?=
 =?utf-8?B?Zjc4dHpTdEdxWksrMGlvdlhlN0VjNk9yeFZLNmJMVTF5d05JemVDNk0yb21I?=
 =?utf-8?B?aFVtKzhtQzR0eVBKTTA1MVhOVHRQRWI0ZzZOc25KV1k1dUJGTzJSMXp3a3ZS?=
 =?utf-8?B?TW9UM1MvNnJ1THRjNWdnVERPeWNYYnUrdnlqME11RXZhSDFPNXJ1TDdVekF1?=
 =?utf-8?B?aUdIczZ5bENVWWRUdzJBaWlST25oVlpveFBLZVpZd2pYcVZ0d2lOZkNsdTdk?=
 =?utf-8?B?MUpzQXE0SHhHSW1sZmVrN1BHRVN4Nm1SdDkyMGtpaDU4S09yU1NiZmFIWlBX?=
 =?utf-8?B?NXVlcGhCYWxlb1BiYXVhV1RQd1ZPV29DZ29OaThUc0VWMEFIcHpMZ1E1N2V6?=
 =?utf-8?B?UzBzdll0YWtyRnZyWGd6UDRRQVVuNnpTbVhzMi9Uc09nNE5pWnBDTWlZd3dV?=
 =?utf-8?B?UGo0UjhmSXJiOUJobjREWDJJdjVtWHVXclBIT2orRGE2M2pQb0p2QWdxTXV0?=
 =?utf-8?B?ZWVTMGxCM1NITUZVa1dpZXBqNWpudzc1RDQwYkxmSm5ITG5iVk1pTVBnNFZY?=
 =?utf-8?B?TXpzNUxIdGluZjk2c0pXYnEzcHlBZ0phaFVnbkF4aXA3K1BLNFhmYWpJNWQv?=
 =?utf-8?B?MXhhYWhXbDhHMWZNdGVnZEpZQWUxUTR3N2VNNisweGtXU3Y3emFNVWxFdEpo?=
 =?utf-8?B?RjRBaGt5R1V3aXk2UWxWT1pnM2hIWEdNaEs5blg1bTFQRlJXY2hJVzBHOHdl?=
 =?utf-8?Q?bU3owXtXaEME4dJkliokhYwFZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42e53399-46ce-4f96-e533-08da590e4cc5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2022 13:58:38.0829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CwF7lPsodvesod1jH4wb/AHO69VQW+L7ZxjROe4QY/eQ9xErB2tmt6UCGqhMP7jQxpa8B8aCikXo01imuctyRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2725

On 28.06.2022 15:08, Roger Pau Monné wrote:
> On Thu, Jun 23, 2022 at 11:49:00AM +0200, Jan Beulich wrote:
>> On 10.06.2022 10:32, Roger Pau Monne wrote:
>>> --- a/xen/include/xen/iommu.h
>>> +++ b/xen/include/xen/iommu.h
>>> @@ -155,10 +155,10 @@ enum
>>>  
>>>  int __must_check iommu_map(struct domain *d, dfn_t dfn, mfn_t mfn,
>>>                             unsigned long page_count, unsigned int flags,
>>> -                           unsigned int *flush_flags);
>>> +                           unsigned int *flush_flags, unsigned long *done);
>>>  int __must_check iommu_unmap(struct domain *d, dfn_t dfn,
>>>                               unsigned long page_count,
>>> -                             unsigned int *flush_flags);
>>> +                             unsigned int *flush_flags, unsigned long *done);
>>
>> While I'm okay with adding a 6th parameter to iommu_unmap(), I'm afraid
>> I don't really like adding a 7th one to iommu_map(). I'd instead be
>> inclined to overload the return values of both functions, with positive
>> values indicating "partially done, this many completed".
> 
> We need to be careful then so that the returned value is not
> overflowed by the input count of pages, which is of type unsigned
> long.

Of course.

>> The 6th
>> parameter of iommu_unmap() would then be a "flags" one, with one bit
>> identifying whether preemption is to be checked for. Thoughts?
> 
> Seems fine, but we migth want to do the same for iommu_unmap() in
> order to keep a consistent interface between both?  Not strictly
> required, but it's always better in order to avoid mistakes.

That was the plan - both functions would then have a "flags" parameter,
replacing unmap()'s order one.

> Are you OK with doing the changes and incorporating into your series?

Of course. I was merely waiting with doing the integration until having
feedback from you on my questions / remarks. Thanks for that.

Jan

