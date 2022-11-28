Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F44B63A3F8
	for <lists+xen-devel@lfdr.de>; Mon, 28 Nov 2022 10:02:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.448800.705357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oza1w-0007yV-0V; Mon, 28 Nov 2022 09:02:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 448800.705357; Mon, 28 Nov 2022 09:02:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oza1v-0007wL-Ts; Mon, 28 Nov 2022 09:02:23 +0000
Received: by outflank-mailman (input) for mailman id 448800;
 Mon, 28 Nov 2022 09:02:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Emon=34=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oza1t-0007vJ-K5
 for xen-devel@lists.xenproject.org; Mon, 28 Nov 2022 09:02:21 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2041.outbound.protection.outlook.com [40.107.13.41])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5cfcdb6b-6efb-11ed-8fd2-01056ac49cbb;
 Mon, 28 Nov 2022 10:02:19 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB8043.eurprd04.prod.outlook.com (2603:10a6:10:1e7::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.21; Mon, 28 Nov
 2022 09:01:50 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5857.023; Mon, 28 Nov 2022
 09:01:50 +0000
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
X-Inumbo-ID: 5cfcdb6b-6efb-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=caIBJf+thrHVzjZIP2HXAYsyX8fMDXvbPP7EOgfU0qHUhVBGpENu0RPoUZSTupURSzPaZ6pEMkbbkTQJxk0zy7GM/VZYbUHcCpET5XyrYli73OGCrUSsZ/rJ7EIdwKOdoqUePzbmhpyN0PTic6ktq7gNkKupv4K+0gtpACdSdPJCPaocIwUXADNj0UFl5xKHcGRWD8BHWu6ur2s61fLwxKkqhB6s526GTFoHVf00ld6WEbQHOCSXFZx5FjMQ+TOtHJwgowRyOpshUuncJuvAGiYSS7vQTQ//YyC3+1SD36qtxODTTfQwLMu/vjNJwAcA3rs7m10uKw/uA2qvJC2C6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XfzsaMtroem9sNXWRAgAQe2QVEJEa1tD8rIN8Lj/yw0=;
 b=Uij3GX8Ug2A3jCvO3uCgUZoPpjkRjyIo/kIP1IQMjq41CUlRtgH07kY2fjR7MyxwpnT2YKcRO2fOziTeWX6JlD7xIhnqUX8yZzXblMd5KMdAzOVTTUcy/NhBr7Vp+gUCpjFDF7A7HAhTcYW+5Up/LyKa7sBk0q/pzF/arXFVoHrrC8lxUMg2irmdbQmcFItb7cPaSxM0v8vTfvpIRXp+wnmK5xHNu7chxZgAkKoP0D0QBEQ1bSB+Aaq3sNbFYJ93G/vk7SbKilLVZ8bAt6iv/l3LtE6KK+Px8PbwlA/mjn41kEIEdQXuaKdPa+wVVOEChAEWbVwgTpg6Z7APuGGLGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XfzsaMtroem9sNXWRAgAQe2QVEJEa1tD8rIN8Lj/yw0=;
 b=1ydCeGTbFwKU9GH8T6RKUl7Fouprh++CU46CxyXCtD7QyPUUsWpTOWW8bPWE2C2GmleSpBCUGtD+X7AVUK5+Qp8Wb0+Zb6gqnzp8sljrW+yyoaRGLt1UDYC/wJ7h2PPb5rxPM5Cpur13zsHC9bdOgIvRBrnvmdC15iKfUOGx3vxXLjS3bgjiV2o6d3CLlzI9szZg1Urwo7GP94fWfWMIKBJwL8RPQu8TzN2cVARq+VUnlz5rM/1cJDM2af64hqaPec4QXk1or6QI5X0pLDNbQBokAkJkbegemC9timtefaXQOqT9mpjowNs4Ui1gH805orbJKE25UAWOnn23bEfCbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c8f79867-42b3-a23f-6fe0-de8b698c6b0c@suse.com>
Date: Mon, 28 Nov 2022 10:01:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH RFC 07/10] domain: map/unmap GADDR based shared guest
 areas
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bcab8340-6bfd-8dfc-efe1-564e520b3a06@suse.com>
 <5a571fd9-b0c2-216e-a444-102397a22ca0@suse.com>
 <f1229a27-f92c-a0dc-928e-1d78b928fdd0@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f1229a27-f92c-a0dc-928e-1d78b928fdd0@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0102.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB8043:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ba39a24-c850-4e84-ee5e-08dad11f2f94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	V/jUrHJ51bP4vC5go5MXhWpZwsefB4Lhsrc/sv1eSgbr3Ri4V5kHqQ0b5MmdUaR7jvmwsCCM3hUmSj/gCJItCIUTk086yENFjErB2hBnG/iIzValjrdpzlKn/djxB3Uwmd9YdfGGAE0BhlGY2pBnil7J2bxZjjkasd6bEoL/oYYVgBFVf5Pq82oLOiWUnWIrR1yAoclUx38GnU7OfM4RtoHXJJctcgWCz5Lxl+81zEjW6ze/sAY7R7uJHXNCVbZkwlF4yokFIyAaoaXfpmrTQ2MrvgKtueoIvjEYi117kuzesgbmBtx8QlW+hN01ITgX5ZvxzouTAex/yz9obucPatXgxEec4MvBYmSYX3GpTb82zQlxVJ9epD6yh29aboHYLJVwM+zu1loPpCoGkXJpOkIuxK6omiwjbG0LEWq34Wwtg+iaJtY6ayo5iMZYoxOfKqHNk4zuBXbvyixW6uN/tnjv4ibwYWuiOuIAHASfxMlME4Xt/oVc4i6pPjmKnORrCXO23y9nq071Gqyh/D5XmFyyD94ffxpsYMHVC6dLNnzb9BGz3KLGhZ+a+vPnwQLF2yA+zYeBmjwpQVLE5Mlv3wn6KKdLPUSkLXJcgSeBrK9dUpd3QFItzuzJh6Z2CnVs60Mx7SX8uZYSS8Yi9eAIFcKQRqRh/78ZOyE88PLhSjwJdcB3Dv/GAaR/CTMwJ2RiRc5CGTwIBCGaQ61EeUUGLblTmYEv7QsKdc/2tbp6glQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(39860400002)(136003)(396003)(366004)(376002)(451199015)(31686004)(38100700002)(6486002)(6916009)(54906003)(316002)(478600001)(8936002)(41300700001)(2906002)(83380400001)(6512007)(26005)(86362001)(2616005)(36756003)(6506007)(66476007)(66556008)(53546011)(186003)(8676002)(31696002)(4326008)(5660300002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGFBRTVnN1lUSjRRSFJCbjZ6YW80aDNLdmJIalJBVXJFK1VLeVg3a3M0MDVV?=
 =?utf-8?B?dzhLNVIvK1podkdGeGQ0WGs2VFZXeitGeFQ0ekNNK0daZlpQdW5HdEVUUWZ6?=
 =?utf-8?B?bjV1eWVZeEZvRm1QSTZ2RWlPc1FNb1pndjd0NS9TTlVnRDhkTE16ZjFIWEl5?=
 =?utf-8?B?d2ZJWm9Eenk2UHF5ejZwZmJyd2JvdkI2VnU2eDF0WFVRbklSL09LaDJncExO?=
 =?utf-8?B?c1ROWk4xb1U3aDhjZTl6c2RjSnNEeHp2ckh4QVQ4TWlnR01GOFM1SXAyTnZo?=
 =?utf-8?B?TDFtVjZ5MktBWitWc3FDZnhJc1JvblVuRGUvbmJIQ0dBYUV6U0pVYmhzSHgw?=
 =?utf-8?B?NWU3S3F5OEN6bnVFb2pvdWt2bG9ud25HSW4vUHR6ZlplTTlRbzkwNGFuV2Ri?=
 =?utf-8?B?SUxia0xGZXZYeThpNkhVeDlhTmt4Zml0c1hGRmFrdEJYWkZUYXgxQ0srUlYw?=
 =?utf-8?B?YmxieFR0SUFHZ2RhN0F3eitkSVpaOVdMdWhQU3JWeUFhUHlsY3IrTStnOUkw?=
 =?utf-8?B?M3ZxK2ZDWDhyWjc1UHJ3M0JXYWR5bU9mRWZDQjg3NnljZytGZ2lNM3RiSTVl?=
 =?utf-8?B?aG50d291d1NTWTNETUhMQmpKNkdhMnNqUWR1bE1CNkwrYUdFN29QVUxqVWtz?=
 =?utf-8?B?SXFSeWxPTzFiUjByNktHck4zV2FmQnZjdTBESGhHbXgrUnhXVXdzR0d0SmdB?=
 =?utf-8?B?eFNxNVFQeCthU2NyYmhRVnZoM3JEcXhGdFIwMzRVUFAxak9VRElnSVR6WTEy?=
 =?utf-8?B?azVVMGZIZDk0bSs0cUNWbGVBdUcvSHZoRW9UMTRPNFBHY0RzeVVES01LaStE?=
 =?utf-8?B?bndVc0VxMXhZT1l4QUxIMGJMemNlaytkVE80Z3hacldNS0dzVzRxMDZPVXFk?=
 =?utf-8?B?czU2cjRzR3dySXNyYytJOSt0ejN3dkxYRGZlY1Q5WDR0ZmxNTGxNaURBSEZl?=
 =?utf-8?B?eHFtUWR6YkFxVS9DajdZRXFXdERBc2hySys5VTY2emxTakJZSS9WTzNlbzg2?=
 =?utf-8?B?a0s1TDlHbTc1VnNvL0RRczhjUVloSmFjTmJOdERSRXZkazRXOEhJcHIrMmlN?=
 =?utf-8?B?RGM4NmtGSlpKM1cyY252UlBWOFJMMFhlamxWQlZka2QvajV0SGNobi9IVm9h?=
 =?utf-8?B?dEpsUG9rZms1Q1R5cmRydW5WeWJlWXgyRnd0MTVFdjRFMGprdDA5eEhaS21P?=
 =?utf-8?B?SGZseVF4NEg4MURjWVNHajI5ZzlmbWNWTjIrcS9IaG05ZVZoZXU3MDJKeGtD?=
 =?utf-8?B?UUwrMTFiN3BOeWhKUnVXb01IQmd1bWFxOVRYV1gzWENEOXg5QURCaFVQVWdM?=
 =?utf-8?B?RWFONjd4YTFOaFV6Y2tuZWNRMm1obFVaQ3RIRTIybUFlMTJwUmF2K29qbmlu?=
 =?utf-8?B?RGJ6dGJOb2lVbld2MUpBYlMyZzdPQ0NybmtIY1NFYWNSSWRXd2hWUEMwOVUx?=
 =?utf-8?B?Vy9wR3N3VmFqOTRwVGdpUjZLY3FTdkZNY1RLc09UNFdzN2s2K0tSbzYzeHNw?=
 =?utf-8?B?aC9Zc0JLZjlJWEZxcWIvYjZFMnpCUVJiSU1Wb3ZSakJzUnN0dHhCdGF2Y2Ev?=
 =?utf-8?B?T2RZYVozOG51ZzdxU2FwZUUwajN6b1p6a0Z4ZW9EcG0rVnIrLy9aNnZIVnJU?=
 =?utf-8?B?NU9vNlFkYzZ1MFppYm1EM0Z3VUs3R085bi9hSDFVVjVsN2JxY281eHRzbDJn?=
 =?utf-8?B?bTFvbTRKcmhYQi9objMrcGRlZHdaRXY4d1p1OXdpdFVHVGUwS1ZobHRkNFdE?=
 =?utf-8?B?SVlSdE9iRlJZeHliOEVtTkppT094a1JZTUx0bTBhYzJXMzc3bU92bVE4RHRj?=
 =?utf-8?B?OU83U1R5b1pmbGxrSkNhbElDNyt4aXVZTGJPSzBQbUQveW4zUlArazI5Rk1M?=
 =?utf-8?B?dVNab3JvTEloYW0wRGU5L2Y4N21qVGxSVGxxS25jNFNrcnVsU1hnVUhvaXhz?=
 =?utf-8?B?N2oxMjA1UVBJRENRRTBWZFF5dmd2M2NOczNZb0l6YjNDNC9UelhjaWgyWnYz?=
 =?utf-8?B?RlBkWnVkY3RQclY0YUd3N3ZkTmM5V1lmVnhITVR1QUl4Tmt6WmZSNmZGcWFz?=
 =?utf-8?B?T21vYjZMNlprUzJlMmpiTlVGeEFOZm8xRWpFT0Z3UTNod3dVMnloOExBM1dz?=
 =?utf-8?Q?eJFhdSceVxSseHx8BerZp7bHV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ba39a24-c850-4e84-ee5e-08dad11f2f94
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2022 09:01:50.0233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WkQMq4Ad7bc25vVrlB24tlOZM5N5A8a89QID6imqcbfwmR5hvm9+XsnM2hEE5dnLaXapQFnyYtv2RoVLWyxcmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8043

On 24.11.2022 22:29, Julien Grall wrote:
> On 19/10/2022 09:43, Jan Beulich wrote:
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -1563,7 +1563,82 @@ int map_guest_area(struct vcpu *v, paddr
>>                      struct guest_area *area,
>>                      void (*populate)(void *dst, struct vcpu *v))
>>   {
>> -    return -EOPNOTSUPP;
>> +    struct domain *currd = v->domain;
>> +    void *map = NULL;
>> +    struct page_info *pg = NULL;
>> +    int rc = 0;
>> +
>> +    if ( gaddr )
> 
> 0 is technically a valid (guest) physical address on Arm.

I guess it is everywhere; it certainly also is on x86. While perhaps a
little unfortunate in ordering, the public header changes coming only
in the following patches was the best way I could think of to split
this work into reasonable size pieces. There the special meaning of 0
is clearly documented. And I don't really see it as a meaningful
limitation to not allow guests to register such areas at address zero.

>> +    {
>> +        unsigned long gfn = PFN_DOWN(gaddr);
> 
> This could be gfn_t for adding some type safety.

Indeed I did consider doing so, but the resulting code would imo be
less legible. But this difference perhaps isn't significant enough
for me to object to changing, in case you (or others) think the
type safety is really a meaningful gain here.

>> +        unsigned int align;
>> +        p2m_type_t p2mt;
>> +
>> +        if ( gfn != PFN_DOWN(gaddr + size - 1) )
>> +            return -ENXIO;
>> +
>> +#ifdef CONFIG_COMPAT
>> +        if ( has_32bit_shinfo(currd) )
>> +            align = alignof(compat_ulong_t);
>> +        else
>> +#endif
>> +            align = alignof(xen_ulong_t);
>> +        if ( gaddr & (align - 1) )
>> +            return -ENXIO;
>> +
>> +        rc = check_get_page_from_gfn(currd, _gfn(gfn), false, &p2mt, &pg);
>> +        if ( rc )
>> +            return rc;
>> +
>> +        if ( !get_page_type(pg, PGT_writable_page) )
>> +        {
>> +            put_page(pg);
>> +            return -EACCES;
>> +        }
>> +
>> +        map = __map_domain_page_global(pg);
>> +        if ( !map )
>> +        {
>> +            put_page_and_type(pg);
>> +            return -ENOMEM;
>> +        }
>> +        map += PAGE_OFFSET(gaddr);
>> +    }
>> +
>> +    if ( v != current )
>> +    {
>> +        if ( !spin_trylock(&currd->hypercall_deadlock_mutex) )
>> +        {
>> +            rc = -ERESTART;
>> +            goto unmap;
>> +        }
>> +
>> +        vcpu_pause(v);
> 
> AFAIU, the goal of vcpu_pause() here is to guarantee that the "area" 
> will not be touched by another pCPU.

Hmm, I find the way you put it a little confusing, but yes. I'd express
it as "The purpose of the vcpu_pause() is to guarantee that the vCPU in
question won't use its own area while the location thereof is being
updated." This includes updates by Xen as well as guest side consumption
of the data (with focus on the former, yes).

> However, looking at the function context_switch() we have:
> 
> sched_context_switched(prev, next);
> _update_runstate_area();

With this really being

    _update_runstate_area(next);

...

> The first function will set v->is_running to false (see 
> vcpu_context_saved()). So I think the "area" could be touched even afte 
> vcpu_pause() is returned.
> 
> Therefore, I think we will need _update_runstate_area() (or 
> update_runstate_area()) to be called first.

... I don't see a need for adjustment. The corresponding

    _update_runstate_area(prev);

sits quite a bit earlier in context_switch(). (Arm code is quite a bit
different, but this particular aspect looks to apply there as well.)

>> @@ -1573,6 +1648,22 @@ int map_guest_area(struct vcpu *v, paddr
>>    */
>>   void unmap_guest_area(struct vcpu *v, struct guest_area *area)
>>   {
>> +    struct domain *d = v->domain;
>> +    void *map;
>> +    struct page_info *pg;
> 
> AFAIU, the assumption is the vCPU should be paused here.

Yes, as the comment ahead of the function (introduced by an earlier
patch) says.

> Should we add an ASSERT()?

I was going from unmap_vcpu_info(), which had the same requirement,
while also only recording it by way of a comment. I certainly could
add an ASSERT(), but besides this being questionable as to the rules
set forth in ./CODING_STYLE I also view assertions of "paused" state
as being of limited use - the entity in question may become unpaused
on the clock cycle after the check was done. (But yes, such are no
different from e.g. the fair number of spin_is_locked() checks we
have scattered around, which don't really provide guarantees either.)

Jan

