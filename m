Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D0B51A16D
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 15:55:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320770.541677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmFTJ-0001pk-Ds; Wed, 04 May 2022 13:55:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320770.541677; Wed, 04 May 2022 13:55:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmFTJ-0001mf-Ad; Wed, 04 May 2022 13:55:17 +0000
Received: by outflank-mailman (input) for mailman id 320770;
 Wed, 04 May 2022 13:55:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IBxS=VM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nmFTI-0001mZ-6W
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 13:55:16 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d2cb2991-cbb1-11ec-8fc4-03012f2f19d4;
 Wed, 04 May 2022 15:55:15 +0200 (CEST)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2057.outbound.protection.outlook.com [104.47.9.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-8-a3ICA7YwOkCtEghQRwfAJw-1; Wed, 04 May 2022 15:55:12 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by PAXPR04MB8624.eurprd04.prod.outlook.com (2603:10a6:102:21b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Wed, 4 May
 2022 13:55:11 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Wed, 4 May 2022
 13:55:11 +0000
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
X-Inumbo-ID: d2cb2991-cbb1-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651672514;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3/DdxjlIAG8lNDxhGLr6KR/UDC21Cct/DVLYgehZGFk=;
	b=csJrXdsK8LHFlbRafvkfPmeGwjg+tpGPfr/ysWKFXt09lV66q/xtqyXQOWssYkrWa8UAye
	gqdD0ITcw3fOj3gYuQG9iNnCqpE6mZBfaI0sqxkOdszmhbCeNFdx9WcUFF8zunFz1sMbPK
	Wcw+dKunhmon84oDCLjHItoK/RrzAfc=
X-MC-Unique: a3ICA7YwOkCtEghQRwfAJw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DhxpunzOERdyZktJGWpF//1HIBaa6KrWo31E6lTdgRAtQ63G7FTHV3ylcYNHtOhDVoDCwy0FTG2k8pjmMGz8XqttHIKmHzUBWFkDWhdaR/GAxQi0jSyLCoOlE5/MZJrMClj+eXyvlssecWh9O3Pcb74/0wV3zdam4z6WbLT1fCJF5l160XVLgZ5euVk+wpqtLplAspoObbPzaJVBSX0gU9s/xAURL5Rn6gALeMiAFr/vqUCjveKZkGbxT4nnek2+wZCaKwn+GoJVLdFVIuxl8AUwJ8m/mps5cfr6LkByX3vTMB8N/5rN+F9EE5G8cA8elBhmIzKEhhWogsUhrrNExQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aW8AT++bJb62FkOPESWChfbU83/meKwieafmErQ6Vag=;
 b=iPfw0F5U0I1FigbQ3wLRvxj9S4uXptSNdCrD9zRCePi1uqGtxt4FD0EJzhKc8rIWtuKzNDsf+0Yd09ux5sE7VlO+qYI9TlvHQDzJa6HuMPe5Ea2C3I2k9bsLu/dzdeXjR1mMAIE6y/V3pO5ME7oZkk2qgOmfz9sMhuw7FRw6yqeg4Nzy5MOLrjFH3DCVUpkyonPGUgDbDW4X8QgO3EZrHrEHPZOHUYH7GsiZWOblv5MzgYeIZvq6L5YnTM8EHrhtW0x6g4ZxqZYq598vRec2AeIr4+0g0iXZQn+Ja8UJm5+Yy/B8/mO8mIoeJ99BAjqhv59PSWYXDqhV9YqSXArcpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2018a835-e924-7d70-1160-227acd75947c@suse.com>
Date: Wed, 4 May 2022 15:55:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 05/21] IOMMU/x86: restrict IO-APIC mappings for PV Dom0
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <5cb4dc1b-f6b0-89cc-e21c-a27a5daf0290@suse.com>
 <YnEngsDG9BiiyzXj@Air-de-Roger>
 <6ffd48ee-9356-2f22-415e-03e172eabb55@suse.com>
 <6f45248b-2f49-0834-e801-d298ea680a33@suse.com>
 <YnJV3EYq7E+4ajPN@Air-de-Roger>
 <e40d5b56-e52c-34fc-fcfb-ebf136135271@suse.com>
 <YnJrBNkGl8Em0gTN@Air-de-Roger>
 <fa6e35ac-66f9-76f2-1dd7-f1175c65e3cd@suse.com>
 <YnJ5AeB0k4SQ4hhI@Air-de-Roger>
 <66587a43-02b8-20c6-2663-4a6fc3e010e2@suse.com>
 <YnKDm3fHHyjQ8vV6@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YnKDm3fHHyjQ8vV6@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P194CA0063.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::40) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 657c2f71-f445-4183-74cd-08da2dd5b4de
X-MS-TrafficTypeDiagnostic: PAXPR04MB8624:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB86248EA1C310A24ABCA00081B3C39@PAXPR04MB8624.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dcM6DKYb0frNhbzpWpvXX/1xaNH8zOY8IvB8DM9tMfqVqx0JowtqJ0iVd0EfbIR28DerpDRTnhTNFjhljyj+nStyaxUmBT8xmf6PxsFaSRhbJ774puc5ks8feDFTkmXk0Zws9SHhlSu3Jzntj3S3/iqc2XPjGV/pgeom6wv06tcLj1NUSnl5fFe8FruRKI45u4R7puQXjXwvb9+/bcSWO9xmL8KCVKULrXBMkakKTuCzj+xbt9yMkNvSoq9xEToldodZI4g5i6NkNgw4fdvID+EQULU9ebpQPWHvg0rnhMTdItZm9nsB5/gGaYeWSLHm1sMsjgcXaT87ZIqIqQ0uIPDo3PCMUH+rJ/J38/ZcbKJAMyh/dVJYPM71zvnjS+xUkl4RTo51NHj6PFzYiQNsHbvKjvHpaWmumx1AQr6VsquazvxOrz5IGFbhGrTiiMinc8nAWGkvyTqol8Kw2P+6ppjzmio3CxKnHRzuVkD7Tf2572n9B/5pjEX8GlTNaBCQZh+nukS1MPIlGbdLc287cIQPIn3lp1h06SLweJNCi0llpWmLkABjYXHdw4pQjazQ9eFOKGTxv2t2dbX9acl9IBWNfnjfGokLG3jvhRW3VspVALxBTa4j797bIiLYj1sxhT+E14OO63Q3C9KaGXLT2kVPks3rEqF+33PB+uelgbTkDikYQPHeuPVDARxCFODrfr4iMGc0vPoQ1e/wa5Nqr5n8a06CBxPh6tcsl3P7OmmFTcuih0hIVySnJcHl9wYu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(6506007)(54906003)(53546011)(508600001)(6486002)(6916009)(2906002)(31696002)(38100700002)(86362001)(36756003)(316002)(66946007)(66556008)(31686004)(186003)(4326008)(66476007)(8676002)(2616005)(8936002)(5660300002)(6512007)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aSTnrFFkbeLKM4MFMuUauFIfhpzPLx4P1OVqpiCZXTwnmwX/PdEoyQs+3q6S?=
 =?us-ascii?Q?JDOX43x/QTRpHcWvsBeGrvxKwqG2Gixyn/72+sNOBWpaYMu1f89LueVgDQWo?=
 =?us-ascii?Q?7YpbJ8KCZR/VdvC+CfNipl0UZtWwi9qRUMUDraE2d96SHZqW8QvLAvZ+B5aN?=
 =?us-ascii?Q?CF4Uy+nqng+rDH5jXbDkvwu4oqL7MZcjZy9B8BZbezhOWaqE1+brZYfm5Oxh?=
 =?us-ascii?Q?evSpQm7GkE+DpfLFnTo2YeGPTqk6o0NuPqAkpSZhmOhED9IJj9ZOCY63l2ZM?=
 =?us-ascii?Q?c8n+C0u/Y+qKoria2Epb/NOvlfEnxhd+Kvmwnh6oJNcCiKrwdlvZO7aTB7Ng?=
 =?us-ascii?Q?8iU6B89Aq5Hi9+EIOPF8rbdESz5MPJ1LyD1VEKnMA3/ADy7zjOP9lct5bGyY?=
 =?us-ascii?Q?IjymjJ+fC31bD1BhSM/COU9rCYxr11bzLT7SQZIIVo0OqC+pbTRLnU6Dsph6?=
 =?us-ascii?Q?c0l75vsuYrIzDX94r5Dw4HPWQLepiTAry58oBL9Hu6LDUXHki+eYnhaA72eP?=
 =?us-ascii?Q?8P3G6qcw+xSsYhNcgM7YzDjy2iTI6FO6QZUS83Li37rWvPGeP5okeBsclQZN?=
 =?us-ascii?Q?C2aY5nPv2mddtfHKWZQzsqENsvOrXPd4gyvStJeWMBQYChzBbtJK0PCO163n?=
 =?us-ascii?Q?RuG61RU8gDSAgTRkQgku0N5CDUwZ3WDDZLo3LgBbwJIJU8G+qi6sIihkgVcI?=
 =?us-ascii?Q?igRvKd1shHz8EfqaNw4qvYR9kdB9WaG7iuJQ6xcN6xWdinem7zT+eeCIiH+X?=
 =?us-ascii?Q?q4V2h9xoU/AHDGv9E8l0VEGX4GMF4cfbggpbYG2Q2PLql4M2O+h44U4gEJQq?=
 =?us-ascii?Q?D+AOvNZFOTlUSoSeuGmTZcZvhYSdZZ6doIesYPUbSqa7hOK55YniN66bkXk3?=
 =?us-ascii?Q?Vv/ooJ6U4T50pQz+X+XypWTMosoGQ2CkxZlqw5voOxr4qW5ufTII2mAYj4+m?=
 =?us-ascii?Q?NaojiuL6SwXb6YRM7L3U4rxjxYN8v1PZmJAYdaJeVjxtFEE6Mv4c4jmajyTc?=
 =?us-ascii?Q?Otscudzg3ITpl2zkmSKt03cRvPS/0luLe1w/J816JEqb3VAYJwEbj7R9far8?=
 =?us-ascii?Q?E+pLannc361lb8/9Evds/YpLQQ+ktDUzXlWsQCxoo36RhIN4AnUP83gTNk7p?=
 =?us-ascii?Q?RbFpvHPKa2ygEU2YQEe1aXxbZIFBKejSiWmQaVlnvxSuI39OuQlGsbiBNlcQ?=
 =?us-ascii?Q?Dc8yoNZ0bQ1eIekfN01Jjg8tYnpSTpO9YVP0GKSPO7U7HLjGihDDfdLKRaK0?=
 =?us-ascii?Q?w0qkJ7wtPRQw+md/IGduxcOikgIeGSMFgyeGsRpcdkViL4vcTlMHEkRUZlAh?=
 =?us-ascii?Q?NMlO/4MPdPEJpzUjvh1TVkqwL7xvjtLiiuz06XGClMbv38RLmTfVkuFAKnK9?=
 =?us-ascii?Q?rkbghtumYGzMDjEUx+wDes7AblrWtAdB09PFnjHoZKGNUzeW8SC1DLWw/TNc?=
 =?us-ascii?Q?D4ad783T0VfRX1EoQZouGx/Qd4jM9iVm+ya942e+JNqtgKs4VE6tLfZfDvqO?=
 =?us-ascii?Q?0Ea1hiKx3va3CMSTH+6lfGMeYw1zsYYlWJZPf46nePHcngqLwOI3Yfmzm2B5?=
 =?us-ascii?Q?WhJaxiMCF4gK17FpazICcZrZ941e310+3KXmDB6/+lcNEyJe2xqeCg9Hqacc?=
 =?us-ascii?Q?/7uUvDDplIr6VWd/ba1KGZP+6JKtrCjW/5gEwWVK5/fIBNTdxd0OsdzR8EeV?=
 =?us-ascii?Q?ZyDl0gMCu0d+H2yEnJxT+9INpwpXYVzVHLTmIA8giMZvu48XYZ6GoE+YNVzl?=
 =?us-ascii?Q?Z7fBXLiTAw=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 657c2f71-f445-4183-74cd-08da2dd5b4de
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 13:55:11.3350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qKX9ABaBh07WTJJruKPoNYOcbDDYDj/+C9mb8yAC9LWNeSyRnLM/y4b8FDrvESuHqHK9tK+w8RLitYRfYWy2rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8624

On 04.05.2022 15:46, Roger Pau Monn=C3=A9 wrote:
> On Wed, May 04, 2022 at 03:19:16PM +0200, Jan Beulich wrote:
>> On 04.05.2022 15:00, Roger Pau Monn=C3=A9 wrote:
>>> On Wed, May 04, 2022 at 02:12:58PM +0200, Jan Beulich wrote:
>>>> On 04.05.2022 14:01, Roger Pau Monn=C3=A9 wrote:
>>>>> On Wed, May 04, 2022 at 12:51:25PM +0200, Jan Beulich wrote:
>>>>>> On 04.05.2022 12:30, Roger Pau Monn=C3=A9 wrote:
>>>>>>> Right, ->iomem_caps is indeed too wide for our purpose.  What
>>>>>>> about using something like:
>>>>>>>
>>>>>>> else if ( is_pv_domain(d) )
>>>>>>> {
>>>>>>>     if ( !iomem_access_permitted(d, pfn, pfn) )
>>>>>>>         return 0;
>>>>>>
>>>>>> We can't return 0 here (as RAM pages also make it here when
>>>>>> !iommu_hwdom_strict), so I can at best take this as a vague outline
>>>>>> of what you really mean. And I don't want to rely on RAM pages being
>>>>>> (imo wrongly) represented by set bits in Dom0's iomem_caps.
>>>>>
>>>>> Well, yes, my suggestion was taking into account that ->iomem_caps fo=
r
>>>>> dom0 has mostly holes for things that shouldn't be mapped, but
>>>>> otherwise contains everything else as allowed (including RAM).
>>>>>
>>>>> We could instead do:
>>>>>
>>>>> else if ( is_pv_domain(d) && type !=3D RAM_TYPE_CONVENTIONAL )
>>>>> {
>>>>>     ...
>>>>>
>>>>> So that we don't rely on RAM being 'allowed' in ->iomem_caps?
>>>>
>>>> This would feel to me like excess special casing.
>>>
>>> What about placing this in the 'default:' label on the type switch a
>>> bit above?
>>
>> I'd really like to stick to the present layout of where the special
>> casing is done, with PV and PVH logic at least next to each other. I
>> continue to think the construct I suggested (still visible below)
>> would do.
>>
>>>>>>>     if ( rangeset_contains_singleton(mmio_ro_ranges, pfn) )
>>>>>>>         return IOMMUF_readable;
>>>>>>> }
>>>>>>>
>>>>>>> That would get us a bit closer to allowed CPU side mappings, and we
>>>>>>> don't need to special case IO-APIC or HPET addresses as those are
>>>>>>> already added to ->iomem_caps or mmio_ro_ranges respectively by
>>>>>>> dom0_setup_permissions().
>>>>>>
>>>>>> This won't fit in a region of code framed by a (split) comment
>>>>>> saying "Check that it doesn't overlap with ...". Hence if anything
>>>>>> I could put something like this further down. Yet even then the
>>>>>> question remains what to do with ranges which pass
>>>>>> iomem_access_permitted() but
>>>>>> - aren't really MMIO,
>>>>>> - are inside MMCFG,
>>>>>> - are otherwise special.
>>>>>>
>>>>>> Or did you perhaps mean to suggest something like
>>>>>>
>>>>>> else if ( is_pv_domain(d) && iomem_access_permitted(d, pfn, pfn) &&
>>>>>>           rangeset_contains_singleton(mmio_ro_ranges, pfn) )
>>>>>>     return IOMMUF_readable;
>>>>>
>>>>> I don't think this would be fully correct, as we would still allow
>>>>> mappings of IO-APIC pages explicitly banned in ->iomem_caps by not
>>>>> handling those?
>>>>
>>>> CPU side mappings don't deal with the IO-APICs specifically. They only
>>>> care about iomem_caps and mmio_ro_ranges. Hence explicitly banned
>>>> IO-APIC pages cannot be mapped there either. (Of course we only do
>>>> such banning if IO-APIC pages weren't possible to represent in
>>>> mmio_ro_ranges, which should effectively be never.)
>>>
>>> I think I haven't expressed myself correctly.
>>>
>>> This construct won't return 0 for pfns not in iomem_caps, and hence
>>> could allow mapping of addresses not in iomem_caps?
>>
>> I'm afraid I don't understand: There's an iomem_access_permitted()
>> in the conditional. How would this allow mapping pages outside of
>> iomem_caps? The default case higher up has already forced perms to
>> zero for any non-RAM page (unless iommu_hwdom_inclusive).
>=20
> It was my understanding that when using iommu_hwdom_inclusive (or
> iommu_hwdom_reserved if the IO-APIC page is a reserved region) we
> still want to deny access to the IO-APIC page if it's not in
> iomem_caps, and the proposed conditional won't do that.
>=20
> So I guess the discussion is really whether
> iommu_hwdom_{inclusive,reserved} take precedence over ->iomem_caps?

I think the intended interaction is not spelled out anywhere. I
also think that it is to be expected for such interaction to be
quirky; after all the options themselves are quirks.

> It seems a bit inconsistent IMO to enforce mmio_ro_ranges but not
> ->iomem_caps when using iommu_hwdom_{inclusive,reserved}.

In a way, yes. But as said before - it's highly theoretical for
IO-APIC pages to not be in ->iomem_caps (and this case also won't
go silently).

Jan


