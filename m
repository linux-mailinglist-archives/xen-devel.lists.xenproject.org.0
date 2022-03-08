Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5904D1AD7
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 15:42:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287026.486799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRb22-0007aJ-Pv; Tue, 08 Mar 2022 14:41:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287026.486799; Tue, 08 Mar 2022 14:41:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRb22-0007X5-Md; Tue, 08 Mar 2022 14:41:46 +0000
Received: by outflank-mailman (input) for mailman id 287026;
 Tue, 08 Mar 2022 14:41:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KW+D=TT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRb20-0007Wz-Kf
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 14:41:44 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df32c3d4-9eed-11ec-8eba-a37418f5ba1a;
 Tue, 08 Mar 2022 15:41:43 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2059.outbound.protection.outlook.com [104.47.8.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-34-sLsD5SIEPJWZaXxTb0Mhpg-2; Tue, 08 Mar 2022 15:41:41 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR0402MB3505.eurprd04.prod.outlook.com (2603:10a6:208:25::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Tue, 8 Mar
 2022 14:41:38 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 14:41:38 +0000
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
X-Inumbo-ID: df32c3d4-9eed-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646750502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+cgG0//hIHaspjE/CaTJsuSW09ANHbGVepaerfAXTuI=;
	b=ORe22/XbXOfMZryYSbjjGmoga6pLbTU1Y1fplzXwA0UUzx0Lh75eFBQWPDSm5aqmafJHgu
	xOmRKpqZw33d+JpyI87ZwsEiV1ASVhqTSdHeHdcj2NnQezAWa0+SaK3+efS/biyjQ+ajL8
	yjUGTbkzNUENvvr91gkfS2MLuhwvZx8=
X-MC-Unique: sLsD5SIEPJWZaXxTb0Mhpg-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P0FrHZg8tmhoT1PXfF0Na8i+gH6HTA7MYs34R4Gcq4ra3nlbLaD6VA/bbTY7q/FSALXGnkcJb9dtSPVs/7Q9VuXtdmwQzY2KP+v9f+X447XnR9pbxKZvcy7JXQZjld17ixbk6O7eM1zPHIh68cgMyRMcKUYS0VSBuVh9/fRx5nBOnkXqXJPhtb0hbo+7GfmKqwzTK2DquZyT4NWVdqLJunlg9pEDdY7FS9akxhdocxI8cXLxD5xjqusaZPZTdtEd+Qh9Utp1J9Kbel+xwajk1acS+hBw7cQ7g1DfLeXE3aZhJmqb/3bKHKzSPoO0nFSp8/9zEel8Qe0EhFAcHMZObw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dRJbbw8RKZBUsizhXOee5Nq2pKGJMFK/bDcUUObziAw=;
 b=Q/GhT4/VQEyxtt/J3NTbODD5XuuU+Cj+uiKM+E7zI3rW5c4fxhr3IGWSP6TmTH66KlNgr8z7Gb6wEyi3si/YcM2/7Xp0sFSqsNDUahvZBS2lvhDnc8Ty7Tji3RgSYIJomxnQL+eS3YLYjCKOh0nCSNaBP98gVytv/Q9wG3OD8o++HXyP1xY3n/YXgoKwWXNP+SVGTZJRwbM0sQaxipW+wqpz3LMUG0OBm5t29AtFMJJDqvhAAFDhWZyF4nonhfQnbZjPDNYJnUzWLAbbv760nak43nnmkrI3Bp3R5bUfE6zmGbtbCY1c2L2+8RdaiSO5aBaBDCmcO1HhA8FOfNJPtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6a0f4d8f-581d-20cc-07bc-ffbf9a04cfe0@suse.com>
Date: Tue, 8 Mar 2022 15:41:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v5 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Content-Language: en-US
To: Jane Malalane <Jane.Malalane@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
References: <20220307150609.10662-1-jane.malalane@citrix.com>
 <20220307150609.10662-3-jane.malalane@citrix.com>
 <YidAU63TsVO/X1Q+@Air-de-Roger>
 <b633f92a-151f-c7ca-0d91-cfad8d2edcbe@suse.com>
 <YidM/Wu5lqF48zg2@Air-de-Roger>
 <81dc2758-accc-25a3-7b3c-d9988757dd0c@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <81dc2758-accc-25a3-7b3c-d9988757dd0c@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM7PR04CA0011.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39a19afd-4de3-4e28-ea20-08da0111c0c3
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3505:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM0PR0402MB3505E33917EF3FD55F6FE2BDB3099@AM0PR0402MB3505.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5OAno8qcbyUwzH0ACidqSUnLkQmECRNMWIZRhhu75Rv3b0XJNWOiVHR4a2cy2J6N8iaZaYLrMIi9PrqYmVSsRHHNDDKygeNfqfKZHvi3ZnYfGMpMJVonvVgCV0vWx6EAAsXtkrdGGZtfUTWh3kDKH+p8zfnaDJagVVEtncmBNXMiBxqacORYtc9eRnHFJUnkbeovApe+DyVyS0W7xCH7IVNYqVy0J2v1aLcUMeb1cF7DVW5tnH8nf2Gqd7Ac+gS991BJqqv5y+ulZ7xs6g04xAv1zpky9eMMyz7UR7vGGQ8xMx1amP/A9mjEj2pwphSJWJxFMK8CCbrzge5gicOiF2oULe1R65vIl/RSYdAfzpYm+wwEUOTvxTnUMWhHYN3P9bam5vUvhPJ1E/8eKU0hOJuXwyC1Vul3sBLuTakIWnCgBIZsFEIgKxhOStHhvP4z0lD29St8DGS4Za41Z1wMdlkrp+8D0z8iMozMjpJcCeSdgrHZ5P1r5eM90LxLDSfiCpBo6N3ynMtRXpOejDgFzD+ObmPBiWOfqEFOSRoOQ9ejkPA6Nk6uAZPkPx4SOBf5SiUvV9cRyLcoAotDRZQEBHu6X+B2ga5Jk5wOQUmmYWi7p3IxTHgBBOJPoO+BQs6ybSA693F0ScAU+09Acu55e4lYZ/P7/W/y1bB7JifosfEA71ur/pz0+X+RevEgeQMlziqgGw9TE3bcL77kHUx3daH1yEBi9JqaG4oWzVHauqI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(86362001)(7416002)(38100700002)(31696002)(508600001)(8936002)(66556008)(66946007)(5660300002)(36756003)(83380400001)(4326008)(31686004)(8676002)(54906003)(2906002)(66476007)(26005)(53546011)(6512007)(6916009)(186003)(2616005)(316002)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3Y7EekIci+Dmk0999cWSys/w7WUhCg5ZHeNhVyBLlVKKaubjFkhb81pPpRaL?=
 =?us-ascii?Q?gLpJWPmgE7fd+92AeTpj+JsUShBaXppvrKT2LilQAMSbd4jIGElOon6asDcV?=
 =?us-ascii?Q?DSPqal9VZW+7oFWLdGKO/U1yEIRBGIwKFyrAFysXC9hhoGQffOaOeD4wXJgP?=
 =?us-ascii?Q?B1pN3T+IsaplThzD4LC1C9A9gqHfial0KMzqXBF/zEkrTrYwhGaZyOVfh+WC?=
 =?us-ascii?Q?uWfMdJLKQHNZq4vm0F15zPNmzcMq037mMjDD1HiFNjpH/duXttb9F3DnDsGz?=
 =?us-ascii?Q?64kRnvWje7YDyCnm6v1NLp6NyQ6yREZ1m97PMLp4VWLrhD9o3q96nlKRKxsw?=
 =?us-ascii?Q?xOCcKm/K4McCr3xrFSYjltEAXwODh2/GNl9hxSPe/EjsIKhVJeypL9UHC+NW?=
 =?us-ascii?Q?vmfKvej67mUPQPRmJRiFvUpuuQ7d/4vG3zQLnwEqqxIsU+oELAw+0WibSe7P?=
 =?us-ascii?Q?X01Nclc69OJXNIwzGn3HSIsYft7bUJ1ae32Xon+cC520FYNf80H3V90wc2jl?=
 =?us-ascii?Q?hmGAEAEX0rGsu7qEZ0CLyvWDKwpANNH2XQc9eILAaGT4JjmYiOetT9usbm9L?=
 =?us-ascii?Q?NxoOWTC5tNKlofZTK3gwSSrjIheHdgJoC/b8cSMM/jKQDiPdupMG+zDlR9xa?=
 =?us-ascii?Q?VRMCKRLcJKumEPGO3A6PLcxUM5LrzpZnfUcZ5QUuj1m3IJqao2JBmxaaVYVh?=
 =?us-ascii?Q?KXZKN/QZpvQrSnMZVZdBejYzKnW60l3FZNF3wNG7P9OleruK1GNwbJxT5A4M?=
 =?us-ascii?Q?RCwWJJZvN9zsgwHSWVSysvd9FHw459yJ8ilfo00EOnci5qzdnCLDahlWvgDQ?=
 =?us-ascii?Q?5ZU4LgJqaOey8CrSp6/8QeQbm23Wn9i8518BoS8n5JgHWvjjb/xx88Vc5L10?=
 =?us-ascii?Q?zOf+MNXnnOcbIv6KvD/CZjRQk7TlVye1+qqOieopq0nL3X8uwHZH2CGmigIr?=
 =?us-ascii?Q?LPJ4dbDuv9EV8se6ZJPVSraWoqtgqlU/2FAi2R+JePxXHYzAnuHTKBgQ64LT?=
 =?us-ascii?Q?h6AASpmS9YAY3/66v34rtIOHO1vat+Gath0H0ar9JPbUcyz77xGclLiGyjrs?=
 =?us-ascii?Q?+MVamIvj0TzFY8emEFUlJR6uqjVghwjy5P+BPFiY2b6Of8KXRh4McbOkBfrU?=
 =?us-ascii?Q?YRbuAhG9LkInN/fmND7caFR75ubLw42iI9q5g7ePg+DnRxQtYiz9leJq7yaA?=
 =?us-ascii?Q?4DOYWVcnfNw9SCIzZFKhLHc+Y8kWCjr37jFg9oSX5aGzB5g3Bkp0t5yuY3vV?=
 =?us-ascii?Q?Zy3ng9bTvD6F9//BRannZxcTBHro8O5C564Y144D2GT15OU/3pu+kAPWIhq9?=
 =?us-ascii?Q?LLyqCf38nox6t2ROq9FeqTFJFeDovQGPQuskbineefoq4Br7WXbdpYaBuEez?=
 =?us-ascii?Q?fDxXukPJcZxKeGppLUAsgL7/5pwEFR1kiyJl8Q6kJRbRQJiAxLTdGFkm/00q?=
 =?us-ascii?Q?DxNXet3sWpzQ8DXbo1Dr0Yf7WfcatTkDSUHh6+Ek6Ze4fkVjGxMp0rB/ZIi1?=
 =?us-ascii?Q?GGAvFb54l2Tyf3LGsaQoRIAM3zR8A92fN7N3rsE5ezQ7cWioayMpratBTy8k?=
 =?us-ascii?Q?6X+2TynblHtMqhFLAOksjqR3uVfgd+BuGZLn7/11349QkWsmJlyUo/odPNoY?=
 =?us-ascii?Q?CWRS9C0A5aGQx/0/OFQhCXw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39a19afd-4de3-4e28-ea20-08da0111c0c3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 14:41:38.7889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s4I56YXh+tyn208k5NbBygouOY2zz7jbbxMTuRNClW90Netg6jPbTUyAAsMtzMILNHf3xqjUsONqFOJY+afgOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3505

On 08.03.2022 15:31, Jane Malalane wrote:
> On 08/03/2022 12:33, Roger Pau Monn=C3=A9 wrote:
>> On Tue, Mar 08, 2022 at 01:24:23PM +0100, Jan Beulich wrote:
>>> On 08.03.2022 12:38, Roger Pau Monn=C3=A9 wrote:
>>>> On Mon, Mar 07, 2022 at 03:06:09PM +0000, Jane Malalane wrote:
>>>>> @@ -685,13 +687,31 @@ int arch_sanitise_domain_config(struct xen_domc=
tl_createdomain *config)
>>>>>           }
>>>>>       }
>>>>>  =20
>>>>> -    if ( config->arch.misc_flags & ~XEN_X86_MSR_RELAXED )
>>>>> +    if ( config->arch.misc_flags & ~(XEN_X86_MSR_RELAXED |
>>>>> +                                     XEN_X86_ASSISTED_XAPIC |
>>>>> +                                     XEN_X86_ASSISTED_X2APIC) )
>>>>>       {
>>>>>           dprintk(XENLOG_INFO, "Invalid arch misc flags %#x\n",
>>>>>                   config->arch.misc_flags);
>>>>>           return -EINVAL;
>>>>>       }
>>>>>  =20
>>>>> +    if ( (assisted_xapic || assisted_x2apic) && !hvm )
>>>>> +    {
>>>>> +        dprintk(XENLOG_INFO,
>>>>> +                "Interrupt Controller Virtualization not supported f=
or PV\n");
>>>>> +        return -EINVAL;
>>>>> +    }
>>>>> +
>>>>> +    if ( (assisted_xapic && !assisted_xapic_available) ||
>>>>> +         (assisted_x2apic && !assisted_x2apic_available) )
>>>>> +    {
>>>>> +        dprintk(XENLOG_INFO,
>>>>> +                "Hardware assisted x%sAPIC requested but not availab=
le\n",
>>>>> +                assisted_xapic && !assisted_xapic_available ? "" : "=
2");
>>>>> +        return -EINVAL;
>>>>
>>>> I think for those two you could return -ENODEV if others agree.
>>>
>>> If by "two" you mean the xAPIC and x2APIC aspects here (and not e.g. th=
is
>>> and the earlier if()), then I agree. I'm always in favor of using disti=
nct
>>> error codes when possible and at least halfway sensible.
>>
>> I would be fine by using it for the !hvm if also. IMO it makes sense
>> as PV doesn't have an APIC 'device' at all, so ENODEV would seem
>> fitting. EINVAL is also fine as the caller shouldn't even attempt that
>> in the first place.
>>
>> So let's use it for the last if only.
> Wouldn't it make more sense to use -ENODEV particularly for the first? I=
=20
> agree that -ENODEV should be reported in the first case because it=20
> doesn't make sense to request acceleration of something that doesn't=20
> exist and I should have put that. But having a look at the hap code=20
> (since it resembles the second case), it returns -EINVAL when it is not=20
> available, unless you deem this to be different or, in retrospective,=20
> that the hap code should too have been coded to return -ENODEV.
>=20
> if ( hap && !hvm_hap_supported() )
>      {
>          dprintk(XENLOG_INFO, "HAP requested but not available\n");
>          return -EINVAL;
>      }

This is just one of the examples where using -ENODEV as you suggest
would introduce an inconsistency. We use -EINVAL also for other
purely guest-type dependent checks.

Jan


