Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F1B302897
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 18:19:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74211.133346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l45VE-0005g0-IP; Mon, 25 Jan 2021 17:18:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74211.133346; Mon, 25 Jan 2021 17:18:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l45VE-0005fb-Ev; Mon, 25 Jan 2021 17:18:12 +0000
Received: by outflank-mailman (input) for mailman id 74211;
 Mon, 25 Jan 2021 17:18:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F5Bc=G4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l45VC-0005fW-TL
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 17:18:11 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8f64df77-6f08-48a4-937d-db74aaec5e9d;
 Mon, 25 Jan 2021 17:18:09 +0000 (UTC)
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
X-Inumbo-ID: 8f64df77-6f08-48a4-937d-db74aaec5e9d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611595089;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3HLsNpxsflKLcWvVC9cco8AZoyb2tvgKKBT3k6iA8lE=;
  b=NJmpyB8si7Sl62kUlrlr44NpUPLZRK7O2wR5DuX3gOiORmK+2Yd6A1w3
   812uRobIg2dcx256tqEncXWUlDx97zW4MBFnQtKUBnwe5mRtUBvD/uHty
   ElvsMcOD+x+TumwfrcDdbXqilZNWhscd+iSMc4dzRJaOPRCnSonGrcq1I
   w=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: VeOJjNfafU/b95QELGCu6SLxN0Jk2+kFUaFV2xSoY1JmGW7SJGPbZg0Nc9BYVwlKTvZpLgDBJA
 n53O/5RbazmZv2zJLNMpH10CHm25e3WkoFBRP6gH8dL1WVr5DSLE2Gg62CLEA62SBaJrr+Mw/d
 WpibM7eC2/u2Qdh5BXKPskt4uj2I+gQxQexXByqJgPzaCWHZtVnmbTvKHcNVcti91H70347Nj3
 KNS4wQjpSCTsPpudBeppYeWUECSAhEPlpTkF6LR0GYZpr5JWEYOn+AmXu/9awOWqYzxBrTmEdZ
 FSQ=
X-SBRS: 5.2
X-MesageID: 36012127
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,374,1602561600"; 
   d="scan'208";a="36012127"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KdIPbtdixOS600K15jm5RSpy7dwdSs3Cgt/mUDupkNfnVqC7E8ZaRnI07qReTZ2KoXuGePNJHe9GRO4H9JKyuFuVhFNm7ApRDL2jF/wPvYwZu/YyhzJS7s9DMqAGjDxe3Vz31xq+G2MWyjZVYBGeLNvmfNZez36M5joLvnFbBPNPYGmrovF/iFq65NvvW+xlVvFtmDu0yUPRoRb/TeENTRRyE0zbFK9dyJH5krbdgx0AYw35208m+d5D7hm7f9en6TKrPVn1CE9AZhKoyoFJzd0DFp9GlrQ5BBClBLE4e/aVJebl+4UFVvcoegI+0ch2vb8U4krhw1ds3q02pFpeGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+E/m1jdPGxJSVzx9pg2xeFVN/RCDQ552GuAra5/gR0=;
 b=YtXSGgk2KqdHUriDg0PWFKFexe/nkmecONdw2ERvv5zonufvtJ/qwBa/lIWvUmSr+zJ2qwpcS28nE8coLDfddZPkjEqt/ywRaVzKtzT4rkxu4mfCQMKKS8qhpBwIZhsryLMHeKqQuJ+cJetuy4VrxodnnB89BeAX5Jvs4awMHimoPBy2zmt7mdNClwPW2jotTAomKuobelR5dl2VRMSxrSnyMtnZqzCWoQfCySf3vxqMuV5OyExcTLSwPsU/Mj77qcxcdKimiMuaOhWV9n0RV3uggyvfGPLJCZO+xgh2ik+dP7oaXCHcDPw3EGNVKIkgSEQPGu5k+pNHNbAP5N7ooA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+E/m1jdPGxJSVzx9pg2xeFVN/RCDQ552GuAra5/gR0=;
 b=A6JRwuwp3DjxqrQwZpsm12m5OiUAfIX8Pqq51IBewuiYaT240tYAdCnXis2dZH2+VrwLilPf6USKmXdZH97lm6x0FE6wYjAATODI7QbXrAtQAr/lwVgtck189vFcUAWoG32RK9K4abSxeRhnTQPy+yU7zI4RLBMTO+1ykYbOHPA=
Subject: Re: [PATCH v7 02/10] xen/domain: Add vmtrace_frames domain creation
 parameter
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Tamas K Lengyel
	<tamas@tklengyel.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210121212718.2441-1-andrew.cooper3@citrix.com>
 <20210121212718.2441-3-andrew.cooper3@citrix.com>
 <752e7de2-b95e-f7ab-0d14-877c72c66134@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <b4ccc233-d006-1f7b-0c0a-8fd8034a25cd@citrix.com>
Date: Mon, 25 Jan 2021 17:17:50 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <752e7de2-b95e-f7ab-0d14-877c72c66134@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0495.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::20) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9747f388-9282-46e6-4e07-08d8c1552e7a
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5405:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB540561D98BB3FE499B2F7682BABD9@SJ0PR03MB5405.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: exFlsiJHb0vRTj9iEWCicEc0Uhw/TZ53jWlo6pjcFcKO8T087oSeWFdS5JGxk06DLXmTtktx8ZLW5H+RPXKjNMFGR++qffz7NQBCGtmW+R4gXK84ALRyYj/ak8r4VewXvy69Hq5ORJBteXpvgsbUzEduKI8lzQozo4Damw4AY681zbMcjORhc/5OQjNx2/04dovomw3X3zbPz4w0sKr+e7xTha6t/IhSyyZNv8XWtmm/Wyt5ulBEB4bsV53eqiNBXyeGAnh2OJkaIFeUzG3mUYhYbMhT7ONpMoJgF7ahJiG/AJHKMO33K1ApumBU8BIf3wJiqUeIto5A1n/tTN4gHY4TDXKLZLh1tmrLqMr2SctmdHr9ZzM5ZXvaR9Tb2HhTmzHgnCOL/UgusT/mBBuoRQzLzUenKPhweMmXZ0rkOoqqr45HGLplMYTti24RbWg0zjYdvBL39iLFcbHCr3NYHcZgyaUWmy6/UsV4pAnjonc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(39860400002)(366004)(136003)(346002)(186003)(16526019)(54906003)(316002)(8676002)(16576012)(53546011)(26005)(36756003)(66476007)(31696002)(31686004)(66556008)(478600001)(2616005)(6666004)(6486002)(956004)(2906002)(83380400001)(6916009)(86362001)(66946007)(4326008)(8936002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MkJrekhxMVpZUnJCY0tOWWoydU9kcVgwWU9QdzhTYkNyTENPSExtanBIQnNK?=
 =?utf-8?B?em9LQTlLSGtZWnR3T3RmVmYwYVRhVmJCMUFNUWtaRU9EOUxCV2l6aktGRndD?=
 =?utf-8?B?Q2pMWUFhMExpSXVJNFRWang3cTNKTDlPYTMwUktCTnJiRFJTVVkvbEdrZ3o2?=
 =?utf-8?B?Vm5kemF2RHJyMXAxWlRNU2JsYWlhYzZjR0c4emlIbVdYZ2NZQUVVamxVZzFB?=
 =?utf-8?B?Q0RNaE5kekhDYWdrN1ArMmxwZ2tyeS9RZkZMd3dWZklrMDdoNmtqK1RTdGNU?=
 =?utf-8?B?SGx4UmNXNUUyNUZwNUM5cGhta3VTVlgvRDRYQnRnbDJkTkd0RHhENm9oUld2?=
 =?utf-8?B?aGlIT1R2OEhZYzMwWjhielFIOWVDai9sb0VCS3NuRmRGR3E1MzZLTEJZcGRR?=
 =?utf-8?B?YWJ1NDVtOGxsTVpRdDVxbUp3b2ZSUEZ3Q1VTZVdVQXY4SzJLRkM0aHpzMGpz?=
 =?utf-8?B?ZXZTZXhBcnJIeEtidGlhOEtMc2hvZWRmVTZ2QkpES0tScnN5OHVYeHBBNWlx?=
 =?utf-8?B?Q016eTZTMFVreW1PSnZ6S1dNbkNDV1Rqc2ZDUEt4Rzc4NUFENnFwZE84Zm4y?=
 =?utf-8?B?Q0ljNlFyU0hlbUFPcEJjUFgvdXJOWnp5Y243YXpJQ2hrd0RJVDQzTk5IaHRv?=
 =?utf-8?B?N0U0ZDBRTzY1S0ZFN0VFejFFUmdzZ3RGTVp3b0E4NTFnbHA3S2RaWmhCa3Jh?=
 =?utf-8?B?dGJCbHl4ditNYjZIeFI3eEtzS2ZlSS9aNkd3QjVuK1FZamRXaWF6MjJjSnNa?=
 =?utf-8?B?WkNqTkkwMHJUUGQxcE1KZUFCYXVMT2hXTVMzVzRoWEtpVitsWWtoekdBZm1o?=
 =?utf-8?B?bDVGbWtKZ0g5Vno1b1A1UkVvTFhoeStld1JDZCsyYzhYMkhZbmorSk9ZYnpn?=
 =?utf-8?B?RnpuQnJOcGlVTiswM0pEV2FoM2sxVitFWjJkODg0TEtWb0Z0bS8xSjhWaUpX?=
 =?utf-8?B?VTFtNzV2WnNlV0tvRi9CeHpOYjh3YVZHMUdyTDZmSlpQVHBQOUYwV2poTG5N?=
 =?utf-8?B?cVk3ZmJoQnRDMWVwY1NvbkRTcU5zUUxjRkRFazhsZ2FJaG1HUzN3T3Q3MWlq?=
 =?utf-8?B?OGNWeStvY3czSDVHUnEyOVZYdndJdXZXZVRwaERGQVlQcXRmdnFySEhKRURY?=
 =?utf-8?B?ZFB6anYwNTBTSCtZaGpSMy8zY1lNcmdCT2ErNEoxZHdGcWUrMlZOY3kxdTJC?=
 =?utf-8?B?WkhNUWRrL2xKR0pMQnFOZWlOMm16dUVhTmJqbnMyYy9aMy9LOEZ5OGJUTFdY?=
 =?utf-8?B?MnR1UUllRUtyWXNUU0toVURaVzNQWFNqcEtHdG13cHhFRHV5aTBOV0NBNjN4?=
 =?utf-8?Q?tavZLnIhVXSienzvm9Xp8OWdrlZV+bN1Eo?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9747f388-9282-46e6-4e07-08d8c1552e7a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 17:18:07.0612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FpobUwi5CDwsRy7W3NYwXvdiw9g8Q/N0A45Dt7/69VrigF2kdGBsxarlL34BD+dmP9AW4jYGm98huVzlQR8CCdPPc6wmi2IrWlI+qfEa3v0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5405
X-OriginatorOrg: citrix.com

On 25/01/2021 15:08, Jan Beulich wrote:
> On 21.01.2021 22:27, Andrew Cooper wrote:
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -132,6 +132,48 @@ static void vcpu_info_reset(struct vcpu *v)
>>      v->vcpu_info_mfn = INVALID_MFN;
>>  }
>>  
>> +static void vmtrace_free_buffer(struct vcpu *v)
>> +{
>> +    const struct domain *d = v->domain;
>> +    struct page_info *pg = v->vmtrace.buf;
>> +    unsigned int i;
>> +
>> +    if ( !pg )
>> +        return;
>> +
>> +    for ( i = 0; i < d->vmtrace_frames; i++ )
>> +    {
>> +        put_page_alloc_ref(&pg[i]);
>> +        put_page_and_type(&pg[i]);
>> +    }
>> +
>> +    v->vmtrace.buf = NULL;
> To set a good precedent, maybe this wants moving up ahead of
> the loop and ...
>
>> +}
>> +
>> +static int vmtrace_alloc_buffer(struct vcpu *v)
>> +{
>> +    struct domain *d = v->domain;
>> +    struct page_info *pg;
>> +    unsigned int i;
>> +
>> +    if ( !d->vmtrace_frames )
>> +        return 0;
>> +
>> +    pg = alloc_domheap_pages(d, get_order_from_pages(d->vmtrace_frames),
>> +                             MEMF_no_refcount);
>> +    if ( !pg )
>> +        return -ENOMEM;
>> +
>> +    v->vmtrace.buf = pg;
> ... this wants moving down past the loop, to avoid
> globally announcing something that isn't fully initialized
> yet / anymore?

Fine.

>
>> +    for ( i = 0; i < d->vmtrace_frames; i++ )
>> +        /* Domain can't know about this page yet - something fishy going on. */
>> +        if ( !get_page_and_type(&pg[i], d, PGT_writable_page) )
>> +            BUG();
> Whatever the final verdict to the other similar places
> that one of your patch changes should be applied here,
> too.

Obviously, except there's 0 room for manoeuvring on that patch, so this
hunk is correct.

>
>> --- a/xen/include/public/domctl.h
>> +++ b/xen/include/public/domctl.h
>> @@ -94,6 +94,7 @@ struct xen_domctl_createdomain {
>>      uint32_t max_evtchn_port;
>>      int32_t max_grant_frames;
>>      int32_t max_maptrack_frames;
>> +    uint32_t vmtrace_frames;
> Considering page size related irritations elsewhere in the
> public interface, could you have a comment clarify the unit
> of this value (Xen's page size according to the rest of the
> patch), and that space will be allocated once per-vCPU
> rather than per-domain (to stand a chance of recognizing
> the ultimate memory footprint resulting from this)?

Well - its hopefully obvious that it shares the same units as the other
*_frames parameters.

But yes - the future ABI fixes, it will be forbidden to use anything in
units of frames, to fix the multitude of interface bugs pertaining to
non-4k page sizes.

I'll switch to using vmtrace_size, in units of bytes, and the per-arch
filtering can enforce being a multiple of 4k.

>
>> --- a/xen/include/xen/sched.h
>> +++ b/xen/include/xen/sched.h
>> @@ -257,6 +257,10 @@ struct vcpu
>>      /* vPCI per-vCPU area, used to store data for long running operations. */
>>      struct vpci_vcpu vpci;
>>  
>> +    struct {
>> +        struct page_info *buf;
>> +    } vmtrace;
> While perhaps minor, I'm unconvinced "buf" is a good name
> for a field of this type.

Please suggest a better one then.  This one is properly namespaced as
v->vmtrace.buf which is the least bad option I could come up with.

>
>> @@ -470,6 +474,9 @@ struct domain
>>      unsigned    pbuf_idx;
>>      spinlock_t  pbuf_lock;
>>  
>> +    /* Used by vmtrace features */
>> +    uint32_t    vmtrace_frames;
> unsigned int? Also could you move this to an existing 32-bit
> hole, like immediately after "monitor"?

Ok.

~Andrew

