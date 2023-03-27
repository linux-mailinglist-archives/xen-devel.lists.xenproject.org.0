Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F236CA979
	for <lists+xen-devel@lfdr.de>; Mon, 27 Mar 2023 17:46:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515348.798117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgp37-0006sN-B4; Mon, 27 Mar 2023 15:46:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515348.798117; Mon, 27 Mar 2023 15:46:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgp37-0006pl-7Q; Mon, 27 Mar 2023 15:46:21 +0000
Received: by outflank-mailman (input) for mailman id 515348;
 Mon, 27 Mar 2023 15:46:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=81wl=7T=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pgp36-0006pZ-7j
 for xen-devel@lists.xenproject.org; Mon, 27 Mar 2023 15:46:20 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061a.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8376cd50-ccb6-11ed-b464-930f4c7d94ae;
 Mon, 27 Mar 2023 17:46:18 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9940.eurprd04.prod.outlook.com (2603:10a6:10:4c1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Mon, 27 Mar
 2023 15:46:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.029; Mon, 27 Mar 2023
 15:46:16 +0000
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
X-Inumbo-ID: 8376cd50-ccb6-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nIUUhQX37WtQRRK10qZRTYyNKL3fxIzxImSOzYTF0LmocDanhpWpUZrTtfSwkxFfl6naIr28AK2+kpiSlZSFD3cRRw9t7pbbRdsq4nju7d2p2/wBEjGJsAouKSfVOjyiyr9zMV2S7nOH3hPudEwPxup+viW49A3BPCXSGoeTSKpAjfxGetUTIClu52X9K7b41KVH3du81wonsG/IxYduAMWKKQqqBtb+wmvXrcEHEmDA6PFkzjl543Kber0iczCA/ZRaFJMxGzMC98+DM78NRQjM6bZIwwCEKrqR5eKqyX61xg0vVCHAwKVIaS1Bs1ggVB1Prov41Mw8066ZTF2cUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oKCQV29iqi1PZw4lRIAffX81GSs4e6Hw0otRVjXUGc4=;
 b=abwoL6JCWiyXvA0IxmdHYmfgtWalkMFPP73Tba2jI2edYoWIgHL/bfEOTUIXZt4VFUY5ow46Tc412b0LqZRqxH0S97KoL2uREdoz6Ej5zTGh0LwYvD2C/IW/T6Xj55IGnhS1djN0CMPA+Kcm4166dLT7DX6kfdc0+QHuHtOWwJRkHzQCOuoYI/GJDDz54z376vtAvNxW7R/AHFyTSfGcUN+HJSaaDaqUOLxVl7dvJ6yCWzCVBfXnw6PnlVuyB/wZMSBZ6eKpXQ2fQlIck0bYbGS+ZPGvXDUT1oh9P1l8m4EDDIpuVWsOLMjggzUL4k3FpMkRuxbqB6esyxWP7zasdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oKCQV29iqi1PZw4lRIAffX81GSs4e6Hw0otRVjXUGc4=;
 b=Lp8+KNmeRF/IbXI+hJslXHW0ouXBODi34CKNllZRGVfkc0TMpO9mlPC8e2KN8hzahh5+6DfVq36lRDbMQpCi/tNo45Bfsa4Ggpl6iLq+P/1Lv808Bf3eq6mXpiv67nOiRzMDpPPJfiosT+8/Akot+LHKz/AWzt4dugTPL0BAi3BwfFv6514Pk983/x46px/srRknypz5FPy9QNzVdnVxM0fd80iRqbTm/jWphOKkRs7PCztK984F/iiRvZyzLQqSSv+0fvNqvRDsoIezAsWi/3dj6Z5b75Ht+IsUWj8zrCjDDmtsO4pkB/BfFNRSqVDsGAwD3iUnDtezeHG+yBE/NA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <73a85276-620a-c0e6-c0b6-79a4f6466826@suse.com>
Date: Mon, 27 Mar 2023 17:46:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v4] x86: detect CMOS aliasing on ports other than
 0x70/0x71
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>
References: <5426dd6f-50cd-dc23-5c6b-0ab631d98d38@suse.com>
 <367d0223-d481-b7a3-3b79-a9bc6f00531e@suse.com>
 <ZBxm+7/ldyHclXwc@Air-de-Roger>
 <62e5d8fe-df2e-eb95-bc8f-631dad4204f2@suse.com>
 <ZByA88LU2YgEbcK9@Air-de-Roger>
Content-Language: en-US
In-Reply-To: <ZByA88LU2YgEbcK9@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0105.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9940:EE_
X-MS-Office365-Filtering-Correlation-Id: 99977686-9f7f-4168-e011-08db2eda66e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	F/aLa+tVVWaISKOfeMxrcZZGron3/NxNkK8LkmdyjY+TmOuoFSN9TWK92634P0cJChVfDrXpRdADYetf1Px4pzodsEcDLdXCYZs44HUWwJOIv2kZ137J0XcO72pY5QTQ+XnQ45k+iBfn+s3O0imm2U4c1iYyQAZ1Zgn3DBw27dGZtWXOhGnzhlq6RS8S9BwpXWOMviDnVGlqxoWq7ciyMtOfqQL6ibDMexRm7LDycGX7XDTBSWSEOWxa5fbG3rXCgIlXWSSV7SO+FOSuimrr9RjmTCWNW9lyfFhwPK4PbV3VvUQsl0gp5fr35PwpGESEBJ18I2RQd1xC+FBo8Cc6g2g4kjjCSnrWCuFYrHiTQvo4hjQ8zXMhlAvvMhq+dI577YrzdaStBdAnHtbU9XjsOIxfqbXl5SJCrUUnE47sTaKu0piC1z+RluY2xk/HWOpT5EFZribC6+ISlZf8xBiMXBm4mkGhy4pwwV3h1ixfMe+b+UzyZJKKzv3y4Jl+Vx6YAT3wr6dro54fYu/pPXJsNtCkCnCAXOq1ujzbnsArMlvC6NY8XbLR0XFDRtLh1VKFlXgwZQ2erYFYGEwuu4fh7Frl3aXV1rTchkL0QUOzsT/sTZEW+R7vz4ThtVfgmh/dOw9q2ued8H6nYLCbwld9bw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(366004)(376002)(396003)(346002)(451199021)(31696002)(36756003)(86362001)(38100700002)(2906002)(31686004)(478600001)(6486002)(83380400001)(2616005)(26005)(6506007)(6512007)(6916009)(66556008)(66946007)(54906003)(4326008)(316002)(8676002)(66476007)(186003)(53546011)(5660300002)(41300700001)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NTgzYXdZc0xpdWsxSXluUnlTN1VxanBGNCtLcS9iMWQyWS9GZldzNWZiYjJI?=
 =?utf-8?B?bW45WTAzRjBlWDhUU3hzVE1COVNoS0RVWWZDNVFwNUN6NGtDQkxKdkl3aEl2?=
 =?utf-8?B?ODlncEVHc1pQaGU2R1ZaRTNuMW5tcGtmVDM2ZjMrL0Nldy9tdzNpMWFkSzFS?=
 =?utf-8?B?R25CUGU4YTFRdDZGVmhTQ3NMaFAyWU9Ud2pzR2hRS1p4Z3FEVGFacmNqb0hI?=
 =?utf-8?B?QUIwazAvSFYySTlZUXc2cThqZlNSdE45YVNtcndtUHVnYlZENmowelR1U0po?=
 =?utf-8?B?bVpVcW1vOEtoOCtLVEZGQUgrdCtFcFkweThNNjRicDVVcUgxRzA5SDVhRWtB?=
 =?utf-8?B?Nmx5bUhpZGkvL2xjdVZiR2M0M3pmSU9yT0pxd3d3VnZNTitCYjNHcThKYkUx?=
 =?utf-8?B?cEhWT3g3d1o0RmNEaXU4TWRyZ3JqTklmdURteExNYktKRXFFTmF4MTRXZXJz?=
 =?utf-8?B?VWRkK2VpSGpGamtteGNxQ3JnT3hkT1dmbkptRzhPRDhPVVJXRUFBeG45SXov?=
 =?utf-8?B?MHpobFFRalZMSzJTdlRqUVczZ2xxNzAvd0tQRVRyYmtnM3dxUENHU3VXc1gy?=
 =?utf-8?B?SEdYRTU1TDR0SXBHMzhGdnRBa242cE1GUXlReHMzc3ROSGpRd2JUd1NSRUlX?=
 =?utf-8?B?eFllV3pTS0p1UEg0cVR4YjkxOXc4Q1U5aHRsak05T2YxejNGZWdSckFlM1ZG?=
 =?utf-8?B?cDRWZXh5ZktxVlRUeGdrZzFGWUtpVDBYcUFIclRiWE5wZ29LTjQvQzBCc2p6?=
 =?utf-8?B?bElpVE1qa3J3LzlhdHZDZEduMTJpaVkyc3NveFNJRUlJcmNlWXVOUmVMMys0?=
 =?utf-8?B?S3o5MCs0UyswMFJDV210UmJDSFhaRzJZY1pkNW41dGVsYnY1VEZLYjkzQW1a?=
 =?utf-8?B?dzg3NzZ3RFN0RjBlYUpwT3JYOGxyOG1MQWtOd0IyRDM1YVk2VzVSdmN0NEZR?=
 =?utf-8?B?TTl6SVIvNWowTEUxQW5wY0FqWVN3RXBuZVNZZXA3aXhBcElvZVlQV01jSXRM?=
 =?utf-8?B?K0xpSUtvOU5CN29NQW1xNDhIZ042anlkcTI5dS9Pc0RjM25PdE5oS0pxcjNa?=
 =?utf-8?B?WlJhVzlsWVNScnVxMmpkK3dZNmw1NkVkS0hUT3p2M1JERnJibGNKVmQ4dUti?=
 =?utf-8?B?Y0l4SEpMOEVMMDNBUmFoWUkwRC9nQ3NMS2N1RFlvVHlydVV4NzQ3MjFQV1pO?=
 =?utf-8?B?dE5vTG51dkt1MW43bGE0aHFMRy9YV3EveHJWNVA0Tm5RNHYrMFdjeDRKUDRW?=
 =?utf-8?B?VW5wTGc0QisxbHNSVkNrQXNKOHZZaUxkbGRyWHpRUTd3M29JK0ppVFIyaHFX?=
 =?utf-8?B?L1FrRnVtWDU1eURKNVJEeEcrWUNsTHVWTks3eEltVjRVZ3FIakJNeXN5V1NH?=
 =?utf-8?B?WDVNUytVNnc1RDc0UXVzdnNMckxFZG95UWVuN0RoRDJORjFhTjNNeVU2MTNo?=
 =?utf-8?B?cjMzMlJiTzY0UGp2eGQwempTbVN5aTVkQzhMdkpOSWN4cW1xblZrRnkyRTF5?=
 =?utf-8?B?TXBibHVQMUJLYlZIOXJLak4yZ3RBTGNnR09tUE01WFB3aU1pUU1ucWdCU3lw?=
 =?utf-8?B?OHlBbmNMWWI3ZkZ4ckkvMFVxMVYvN3pMRDNIaXAvc3p5YzNCM2JZL2wydDJC?=
 =?utf-8?B?Y0d2Yy9JUlJPYUhhb1NKRG5xdUJ6TUJ6cFJjZUcvS0RSZkJCWi9LTUJxWVV6?=
 =?utf-8?B?SU9vSU1wZ1J4L1JSaHN2dndFNGVKWGVWeFpSa0x3ZGhmcWdXT1hkWVRFSUJK?=
 =?utf-8?B?THFXWGFkMHVnbGFaMktZRkdqZWJhODBYYWNsc0FVSjM4TzI3bXF4VlB5T0ZC?=
 =?utf-8?B?eFdrYzBYVEhkeUNGTFQ5TnJ5bkF1Z2dlbmR5dFZEY1RQSUpFdHhveU5UZWIv?=
 =?utf-8?B?Qjg5ZFRmWEtsdjQvU0NkOWpkN3lmK095VUVSR1NmaENha21lSldrZlFRY2VM?=
 =?utf-8?B?d21RRjdZTFoxK3RodGlCZ0RxRzgwQkxtZkRlQWFrMU85dlZyZ015SXR3ZkVo?=
 =?utf-8?B?dmtTS3BQOTZ0MDNnR21HNlVJdDZQV0loaWdXeGlPaXpxcko4TVlsTExKZW1l?=
 =?utf-8?B?TFlnMThDY2NnemJzUitCTmM1WGh6dGxPYktFZXk0L0xxcEw0b01zNHpKeVEz?=
 =?utf-8?Q?I/QWNIp+yhbQb+wNNRQ1kwySn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99977686-9f7f-4168-e011-08db2eda66e8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 15:46:16.8990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lP8+FrIFol7MyciEik58pPUunSRTn5UozkCq7h1Ld3OwuqEvcMDBAq4MtlGHvh+xRkz3WePKE+enHOCjdv7ZQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9940

On 23.03.2023 17:40, Roger Pau Monné wrote:
> On Thu, Mar 23, 2023 at 05:08:43PM +0100, Jan Beulich wrote:
>> On 23.03.2023 15:49, Roger Pau Monné wrote:
>>> On Mon, Mar 20, 2023 at 09:32:26AM +0100, Jan Beulich wrote:
>>>> --- a/xen/arch/x86/setup.c
>>>> +++ b/xen/arch/x86/setup.c
>>>> @@ -2072,37 +2072,36 @@ int __hwdom_init xen_in_range(unsigned l
>>>>  static int __hwdom_init cf_check io_bitmap_cb(
>>>>      unsigned long s, unsigned long e, void *ctx)
>>>>  {
>>>> -    struct domain *d = ctx;
>>>> +    const struct domain *d = ctx;
>>>>      unsigned int i;
>>>>  
>>>>      ASSERT(e <= INT_MAX);
>>>>      for ( i = s; i <= e; i++ )
>>>> -        __clear_bit(i, d->arch.hvm.io_bitmap);
>>>> +        /*
>>>> +         * Accesses to RTC ports also need to be trapped in order to keep
>>>> +         * consistency with PV.
>>>> +         */
>>>
>>> More than to keep consistency with PV, don't we need to trap accesses
>>> to that concurrent accesses between dom0 and Xen (when also using the
>>> device) don't overlap, as the RTC/CMOS space uses indirect indexing.
>>
>> That's what I read "consistency" to mean.
> 
> But consistency with PV?  We need to keep consistency with concurrent
> Xen (hypervisor) accesses I would think.
> 
> I would s/PV/hypervisor accesses/ in the comment above while moving
> it.

Hmm, yes, changed. (Still I'm not normally very happy about changing
comments I don't really understand the way they're written.)

>>>> +bool is_cmos_port(unsigned int port, unsigned int bytes, const struct domain *d)
>>>> +{
>>>> +    if ( !is_hardware_domain(d) )
>>>> +        return port <= RTC_PORT(1) && port + bytes > RTC_PORT(0);
>>>> +
>>>> +    if ( !(acpi_gbl_FADT.boot_flags & ACPI_FADT_NO_CMOS_RTC) &&
>>>> +         port <= RTC_PORT(cmos_alias_mask | 1) && port + bytes > RTC_PORT(0) )
>>>> +    {
>>>> +        unsigned int cmos = RTC_PORT(0), nr = 2, step;
>>>> +
>>>> +        while ( cmos_alias_mask & nr )
>>>> +            nr <<= 1;
>>>> +        for ( step = nr << 1;
>>>> +              step < cmos_alias_mask && !(cmos_alias_mask & step); )
>>>> +            step <<= 1;
>>>> +        do {
>>>> +            if ( !(cmos & ~RTC_PORT(cmos_alias_mask)) &&
>>>> +                 port <= cmos + 1 && port + bytes > cmos )
>>>> +                return true;
>>>> +            cmos += step;
>>>> +        } while ( cmos <= RTC_PORT(cmos_alias_mask) );
>>>
>>> I would use a for loop similar to the one used in probe_cmos_alias()
>>> to check for aliased accesses?
>>>
>>> if ( port <= RTC_PORT(1) && port + bytes > RTC_PORT(0) )
>>>     return true;
>>>
>>> for ( offs = 2; offs < 8; offs <<= 1 )
>>> {
>>>     if ( !(offs & cmos_alias_mask) )
>>>         continue;
>>>     if ( port <= RTC_PORT(1 + off) && port + bytes > RTC_PORT(off) )
>>>         return true;
>>> }
>>>
>>> return false;
>>>
>>> So that you can also optimize for the more common case RTC_PORT(0) and
>>> RTC_PORT(1) are used?
>>>
>>> Or there's something I'm missing?
>>
>> I'll have to check carefully, but to be honest I would prefer to not
>> touch this code again unless there's clearly something wrong with it.
> 
> TBH, I think the proposed code is extremely difficult to follow, there
> are 3 loops in a row which gives me a headache when thinking about all
> the possible combinations.
> 
> I think my proposed alternative is much easier to follow because it
> has a single loop, and it's using the same bounds used to fill the
> cmos_alias_mask in the first place.  But maybe that's just my taste.

Upon re-consideration I've adjusted the code. Iirc probe_cmos_alias()
originally had something similar, so changing it in the other place as
well is only logical.

>>>> @@ -1256,7 +1333,7 @@ unsigned int rtc_guest_read(unsigned int
>>>>      unsigned long flags;
>>>>      unsigned int data = ~0;
>>>>  
>>>> -    switch ( port )
>>>> +    switch ( port & ~cmos_alias_mask )
>>>>      {
>>>>      case RTC_PORT(0):
>>>>          /*
>>>> @@ -1264,15 +1341,16 @@ unsigned int rtc_guest_read(unsigned int
>>>>           * of the first RTC port, as there's no access to the physical IO
>>>>           * ports.
>>>>           */
>>>> -        data = currd->arch.cmos_idx;
>>>> +        data = currd->arch.cmos_idx & (0xff >> (port == RTC_PORT(0)));
>>>
>>> We do allow read access to alias ports even when the underling
>>> hardware does do so,
>>
>> I'm afraid I don't understand this, so ...
>>
>>> which I think is fine, but might be worth a
>>> comment (since we already detect whether the RTC_PORT(0) alias is also
>>> readable.
>>
>> ... I can't really derive what kind of information you're after to put
>> in a comment.
> 
> Reading from ports that alias RTC_PORT(0) might not always return the
> value written to RTC_PORT(0) (you have a check for that in
> probe_cmos_alias()).  Yet in rtc_guest_read() Xen does always return
> the cached CMOS index.  Which is likely to be all fine, but needs a
> comment to note this behavior might not match what the underlying
> hardware would return.

You do realize that this is pre-existing behavior? On many chipsets
you cannot read the index value from port 70. Yet we've always
returned it, presumably on the grounds of the value either being
rubbish (often 0xff) or the index. And rather than trying to figure
out whether to return rubbish (explicitly of via accessing the port)
I guess it was deemed easier and more helpful to always return the
index value. (I've amended the comment there nevertheless.)

Jan

