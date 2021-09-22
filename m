Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50105414A99
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 15:32:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192750.343365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT2MP-0002c8-LH; Wed, 22 Sep 2021 13:32:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192750.343365; Wed, 22 Sep 2021 13:32:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT2MP-0002Zn-HK; Wed, 22 Sep 2021 13:32:29 +0000
Received: by outflank-mailman (input) for mailman id 192750;
 Wed, 22 Sep 2021 13:32:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cZP0=OM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mT2MO-0002ZN-KT
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 13:32:28 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fcdde9c9-ebbf-44ae-8a01-a40a4d0d9069;
 Wed, 22 Sep 2021 13:32:27 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2173.outbound.protection.outlook.com [104.47.17.173])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-37-f0_X8DqKMJSIQKW5zG7RFw-1; Wed, 22 Sep 2021 15:32:25 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3776.eurprd04.prod.outlook.com (2603:10a6:803:18::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17; Wed, 22 Sep
 2021 13:32:22 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.013; Wed, 22 Sep 2021
 13:32:22 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P189CA0043.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:53::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.17 via Frontend Transport; Wed, 22 Sep 2021 13:32:21 +0000
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
X-Inumbo-ID: fcdde9c9-ebbf-44ae-8a01-a40a4d0d9069
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632317546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lQyZzJYG4n4Q/DInJuPD6p0wKrbfJsMFM9zgITV+VVQ=;
	b=AN4a5sYLvO21iaN1ZSUHyNJ/ldV8HuuSYe2aRE8+uzYgsL5Jucs7YBqKKfC7HR7EciUsup
	P5k+qGjLfH7hco3+VPYyYt0HoKgcu+K0cROIbf0cJ6Krmapyv1+irmM+fd9WRhC7uVa6Mm
	tLINllazkqvXHZO+tdSQQFQnDhX4dWw=
X-MC-Unique: f0_X8DqKMJSIQKW5zG7RFw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RspPyOh12ZW+UJPpN8y2b8h1b+XCxY0tVHTW24WH0CvvdlEAKtBiW+CMYYke5r7pzLS9g0xc4I/7kQq35QHiARKsxW3IoUB/TSDNvffqb6h8S2+DVSieukenFRakmdpkp8gBUNt2iuojHSpFQAOqbxVhclnrjcynP193ci90rEgOcatJMuuJg2g3W2Q4TJGUFLk4A2mY2PxcTMTjRvYs/ud6nU9WGmztqXEsfYiaePKyv5WunhhZFu5hdR55ROssAvr9vaPneMi7WKKE7IdizW1Q0u6D55df+a7Qhbt1fMAfrE/jizPJw+ipDCuJvyG9YN/CTiDnUWjZuX9/ZBaPdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=XL+HUY7F10vHh34JRGh2KOMVdV4ZxdX/D4lnoLJjpJ8=;
 b=KGV072eSzBZBsT9+t+CAnQ1Au6J15xSWoXra1CbHcWEj3UOfatft8aPn6LS5ol/YYv1rQQpb/YkAEVpJwFyvO2IO/NZNPFQf7K9Whc2ZTCRO2fqf2kuRDjJMlpwa4u0+rEy5UJmtC8X18tGOBcdyuDLHljXYTsRKM+ZvHZduUT5NohEb3HwoXu6nghmvt9IzNxkmbO6WuPzPQraN3HOsJJE3CUsNzlnAm58KZbStOm511Hvs5rDDpisQg2Iu51coJ/knOToZSD8Hum+X5TfsIu9t1nooHQN7WM8OBAcLe8HuGbqFwMtIFxCuQeajB+fIJXrXioCCX6ehqU/dMGYayg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 01/12] xen/trace: Don't over-read trace objects
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
 <julien@xen.org>, Dario Faggioli <dfaggioli@suse.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210920172529.24932-1-andrew.cooper3@citrix.com>
 <20210920172529.24932-2-andrew.cooper3@citrix.com>
 <731e3474-77bc-b11b-41ca-5dff57831264@suse.com>
 <171e6f01-63cc-e453-7268-1bf2ec6fe7cf@citrix.com>
 <69770706-85f6-6509-b5c4-bda61dfdf994@suse.com>
 <84b780c0-7177-d1ba-fabd-9a6258985f9d@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c6a2b222-3298-e3a4-9842-10ca3fea2de1@suse.com>
Date: Wed, 22 Sep 2021 15:32:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <84b780c0-7177-d1ba-fabd-9a6258985f9d@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR3P189CA0043.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:53::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a5319605-3fe6-4721-c58a-08d97dcd6858
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3776:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3776709771103A756A59E9D6B3A29@VI1PR0402MB3776.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	e5KzaN86Cy35ssn9N6214jSjA3HYK4NTZnoFA/erZDDXtSHAJFzizQ5VXu/yVMWHFUJcJZlZW02CHqJ8ErXkgl/0InpPwXyjyDD2A+PhFiPq4IK69mCHNNZLSyDzPEe6ZM8DDM4kr8iVfNOo4PTdPL1VZE4l4yNv3/T2qW6luh+bHU2bwt3qnoY6Z+ei1xZa0fbyvgOA/2qwgeSoj1p7f7eGikpl0iykKASDGRS34m3Nyv0Q7eDL6GLK1rM2uZAbJQ/yYNXu+sIBjSYSDwEUAjU22iplSUSy53fmjGvnNuuzlhOJuRf4TM73rzq+2C0L5TVm2OgtPcIrL+6xuC6XX0DaLJ2pahKTrovi+Lzpc5Z+DHHFj0c7d33rHGohDO1ksYkdtjH/q6d5SdVI98Fb3hEfshhnAq9nGzbRG63uF8hRni2z6ELNmjZbgfzRxAh3/HcwuUTxGHtQ8/S0C+Gk9uq0OXD2ePmhiXfEaFAKNwWbjtm7v/gg/F/MOP7G83eua6xFO6YqNv8sNI6WriMmJW7lKl+Hiy386XNpg0LmJ4bvXz9/ZvfcuVcJ052Tjz3TRnHPVWS7ZhUkNb8GdFlG93Q1rrFBw4v8E361IwVaL67Mbg7j1tlANmFjn1KocJs3d0izvOEGKxZEacCZFkPeEz7PEcxwvUqwmuvGdxAA+KBEu3G+PU49OAHwVVweStKdi8zkQKKaFc+V4korN7n8RIB+tfAqFX6Dsx2zUtYpf0Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66556008)(66476007)(38100700002)(5660300002)(86362001)(4326008)(6486002)(16576012)(53546011)(316002)(54906003)(956004)(66946007)(8676002)(31696002)(36756003)(31686004)(6916009)(26005)(2616005)(186003)(8936002)(508600001)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Rn+eIjnxfa5x3lH+knk/fzZgnWcsZ32sec78zq7bnfre6xVLY4XZP0z3b5tE?=
 =?us-ascii?Q?JIFXRiJwK7i2icYkvjXlrB0vUK5N1yxyAKDWNQVDJT4bOYcG7M6G7zVK0xAc?=
 =?us-ascii?Q?QwKTPwS3RCibk2axaHwhMbKwTzyQFE8qyi2ZA8pYY3n5ghPZWGLluckqlsBm?=
 =?us-ascii?Q?i/gfBvBWZtK4rHojTp0SYujMMD4VghmQ5PsZtaJsxFwoO728MtBFfqGOVxUU?=
 =?us-ascii?Q?bcQtHgNUrx/8JgCZQjWZUihCXE/wMCK97xpKpzuRGezIStKYXaQeN5SKE9GA?=
 =?us-ascii?Q?497KSNZq1oZP1cjkquWpoHgMEY2VpVSGxqP1KpyxVTmR1iJUQDK3fjC65N6N?=
 =?us-ascii?Q?JtLDU32QbjIuEVnl2acwpI/II3uVWFIbuI3QwCfIC5LLbeAKfyxs+ib0dL2C?=
 =?us-ascii?Q?Gz+Te3jCip/zeGLTYR4jo78gUWhDjLIxghunUjP5FDdPv+jsASal/vSUZ4gu?=
 =?us-ascii?Q?BlBsHWo1gjZ7ao3hCgHDNUTyULjQPGiKFpOev5u/KZMWPjY5qb7L8B4HpYP7?=
 =?us-ascii?Q?iJB2U857p8t+zJdAGraJFGpp5H6+8AUNuqSqOXslCrWvDfcN+EqUvgz9lMj0?=
 =?us-ascii?Q?nKEnWqtV+NQyDxPe+HcuGtN6TXrABbd0in6vCQIng1BmH2uBIyFlphDwTt1i?=
 =?us-ascii?Q?zhO3LCOQlInsbBPEnF/3ZvvNFyKldWWWIg7qa76aGAa9RxzW+ATxa5qsqZSr?=
 =?us-ascii?Q?g+okCQ1W5IfDyNfpnO9ZWKqbHuSuvLysow1Y6f1MLe+log74g79n9wuB6Oo9?=
 =?us-ascii?Q?r8lwtpTQFeItGn0pGiw2776kpf6ks3n3ibc00eaeY0A7B5LlhAOH46noVLF2?=
 =?us-ascii?Q?A3//zj9G5jW9WZ+szBPSy9UAl7BSQw/jQTU2+Xzis5cQu/CrxysrYYocaIgR?=
 =?us-ascii?Q?cCeveMZVCKWgxbdf+DtQoWyIZWJb3U8Nk95tpTqN3Uc1Au3M0hOPudLCpXlI?=
 =?us-ascii?Q?DMBn7FGtRLquPgj+WlhIr0pTJsZ7oxy6DVDUdqWPTaSOFX0rQkLoek9EZETz?=
 =?us-ascii?Q?q/cy2/3PnoHl4W8Fge2jxdKwmSwujygmpszPSldIRRYVMhyT0fiiaG64+FHd?=
 =?us-ascii?Q?rAC8ELb6X9jcWIBKSB2veUWExoNqvzbWCtpefwgW4ocxHm0g20PpvFPtC/VU?=
 =?us-ascii?Q?N89VNIQGEJIiw+msERDIvxmD42AJoNqwwlLhNDUVyxDsakXfE38wsRhPEAEY?=
 =?us-ascii?Q?GwfAt810HYwc259nO+27U6BqPMA/ZzvRQYiUnlnRbJcCkpZN4UV4O7Q3wdWv?=
 =?us-ascii?Q?w+8oQocO272571yaITfSgFeo3p1+YQS5NIXuH45DQCWb3WvKV97Lrr1RiY+0?=
 =?us-ascii?Q?0bIMvohn1qyWrDzQ9ejH5UJP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5319605-3fe6-4721-c58a-08d97dcd6858
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 13:32:22.2721
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4zm2Er9lAIC1z+RF2cQ67H8QATlV23ShVasvgxmgJkAYpTyGzC4Fgq9839oy8sBk0hucXOB7/83bSL+nfJ77QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3776

On 22.09.2021 14:58, Andrew Cooper wrote:
> On 22/09/2021 08:01, Jan Beulich wrote:
>> On 21.09.2021 19:51, Andrew Cooper wrote:
>>> On 21/09/2021 07:53, Jan Beulich wrote:
>>>> On 20.09.2021 19:25, Andrew Cooper wrote:
>>>>> --- a/xen/arch/x86/hvm/hvm.c
>>>>> +++ b/xen/arch/x86/hvm/hvm.c
>>>>> @@ -5063,8 +5063,9 @@ long do_hvm_op(unsigned long op, XEN_GUEST_HAND=
LE_PARAM(void) arg)
>>>>>          if ( copy_from_guest(&tr, arg, 1 ) )
>>>>>              return -EFAULT;
>>>>> =20
>>>>> -        if ( tr.extra_bytes > sizeof(tr.extra)
>>>>> -             || (tr.event & ~((1u<<TRC_SUBCLS_SHIFT)-1)) )
>>>>> +        if ( tr.extra_bytes % sizeof(uint32_t) ||
>>>>> +             tr.extra_bytes > sizeof(tr.extra) ||
>>>>> +             tr.event >> TRC_SUBCLS_SHIFT )
>>>>>              return -EINVAL;
>>>> Despite this being a function that supposedly no-one is to really
>>>> use, you're breaking the interface here when really there would be a
>>>> way to be backwards compatible: Instead of failing, pad the data to
>>>> a 32-bit boundary. As the interface struct is large enough, this
>>>> would look to be as simple as a memset() plus aligning extra_bytes
>>>> upwards. Otherwise the deliberate breaking of potential existing
>>>> callers wants making explicit in the respective paragraph of the
>>>> description.
>>> It is discussed, along with a justification for why an ABI change is fi=
ne.
>> What you say is "This has no business being a hypercall in the first
>> place", yet to me that's not a justification to break an interface.
>=20
> No, but "cannot be used outside of custom debugging" means there are no
> users in practice, and therefore it really doesn't matter.
>=20
>> It is part of the ABI, so disallowing what was previously allowed
>> may break people's (questionable, yes) code.
>>
>>> But I could do
>>>
>>> tr.extra_bytes =3D ROUNDUP(tr.extra_bytes, sizeof(uint32_t));
>>>
>>> if you'd really prefer.
>> I would, indeed, and as said ideally alongside clearing the excess
>> bytes in the buffer.
>=20
> Why?=C2=A0 The entire structure is copied out of guest memory, with a fix=
ed size.
>=20
> It's not Xen's fault/problem if the VM didn't initialise it correctly,
> and an explicit ROUNDUP() here maintains the current behaviour.

What I don't understand is what you derive "didn't initialise it correctly"
from. The public header says nothing. The data field being of type uint8_t[=
]
may very well suggest that any size is fine. Propagating rubbish instead of
predictable values (zeroes) seems wrong to me.

Anyway - I'm not going to insist; I merely think we should be as forgiving
as possible in situations like this.

>>>>> --- a/xen/common/sched/rt.c
>>>>> +++ b/xen/common/sched/rt.c
>>>>> @@ -968,18 +968,20 @@ burn_budget(const struct scheduler *ops, struct=
 rt_unit *svc, s_time_t now)
>>>>>      /* TRACE */
>>>>>      {
>>>>>          struct __packed {
>>>>> -            unsigned unit:16, dom:16;
>>>>> +            uint16_t unit, dom;
>>>>>              uint64_t cur_budget;
>>>>> -            int delta;
>>>>> -            unsigned priority_level;
>>>>> -            bool has_extratime;
>>>>> -        } d;
>>>>> -        d.dom =3D svc->unit->domain->domain_id;
>>>>> -        d.unit =3D svc->unit->unit_id;
>>>>> -        d.cur_budget =3D (uint64_t) svc->cur_budget;
>>>>> -        d.delta =3D delta;
>>>>> -        d.priority_level =3D svc->priority_level;
>>>>> -        d.has_extratime =3D svc->flags & RTDS_extratime;
>>>>> +            uint32_t delta;
>>>> The original field was plain int, and aiui for a valid reason. I
>>>> don't see why you couldn't use int32_t here.
>>> delta can't be negative, because there is a check earlier in the functi=
on.
>> Oh, yes, didn't spot that.
>>
>>> What is a problem is the 63=3D>32 bit truncation, and uint32_t here is
>>> half as bad as int32_t.
>> Agreed. Whether the truncation is an issue in practice is questionable,
>> as I wouldn't expect budget to be consumed in multiple-second individual
>> steps. But I didn't check whether this scheduler might allow a vCPU to
>> run for this long all in one go.
>=20
> I expect it's marginal too.=C2=A0 Honestly, its not a bug I care to fix r=
ight
> about now.=C2=A0 I could leave a /* TODO: truncation? */ in place so whom=
ever
> encounters weird behaviour from this trace record has a bit more help of
> where to look?

Would seem reasonable to me, but really needs to be answered by the
maintainers of this code.

Jan


