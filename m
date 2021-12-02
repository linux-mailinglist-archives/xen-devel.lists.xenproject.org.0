Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BE2466678
	for <lists+xen-devel@lfdr.de>; Thu,  2 Dec 2021 16:29:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236778.410651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mso14-0002w3-2y; Thu, 02 Dec 2021 15:28:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236778.410651; Thu, 02 Dec 2021 15:28:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mso13-0002tR-VX; Thu, 02 Dec 2021 15:28:57 +0000
Received: by outflank-mailman (input) for mailman id 236778;
 Thu, 02 Dec 2021 15:28:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9SUj=QT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mso12-0002tL-Qo
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 15:28:56 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f953b53-5384-11ec-b1df-f38ee3fbfdf7;
 Thu, 02 Dec 2021 16:28:55 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-10-p98n0vVfP0S3jMuLLFm__g-2; Thu, 02 Dec 2021 16:28:54 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6301.eurprd04.prod.outlook.com (2603:10a6:803:f1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Thu, 2 Dec
 2021 15:28:52 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Thu, 2 Dec 2021
 15:28:51 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0087.eurprd04.prod.outlook.com (2603:10a6:20b:313::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16 via Frontend
 Transport; Thu, 2 Dec 2021 15:28:51 +0000
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
X-Inumbo-ID: 8f953b53-5384-11ec-b1df-f38ee3fbfdf7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638458935;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q88K8pn8Nw8IHl5j2+PVH1iFSZi2GkXijGSgEyeOOPE=;
	b=GsBARSWMvnAlrtbkkk7qcTw+JVVRqUXu9ZwuAcYhx0pjKBXOewkIgColN2SxEV65b3sCaD
	Fg38iq/fmndX8E01Ml8cBncGtW2+lG/LgeVLpxRP0YbpetMDFRkyxg21ziFsWKKcXPDaGu
	PvBay5gAYgf/UZemiHp608eniSq5zRs=
X-MC-Unique: p98n0vVfP0S3jMuLLFm__g-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Afhz33SX5zvT4d6Uwi35vkZ2tc8PcdSzwYBgeMgkKFfnEk5NtTZCdRaoUKmYnFo4IVz6w240MTL4pdcU0K9/X5IQrLZYjpOI6BzXW/GEzC7oxwF0q+7SREBJG/c4VtPA/OkoNwSve44/LQX4UwH5YRy1auktl4akd4URSbeuPrspFnrjxAYugMq6aNVC1ksvB3CEcmOSkfK3oAN8uSJJYUJOTaeD8hb+rWENb89zHkiznEG4cY0SFRgSdGFfocpPqA2xu4QoC/pgB5oTsUSxRqECkFteisEZyMWWys8a+9uSo4IgRxwA3IW5JMqn9t2MqLeaF97myN4eKBKvHlN8xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tb0t2KfkfAMzetSGxn1iGQUoLKqADfeLjajK4h8gn64=;
 b=c7ifWTaTC3PFqtc3Cm7JOowAIa9o2daIP5h+e1TKMaubJGFyFBX7stlnwU4gotiAdOFoimcnWJTgE9fZAmXEvcpX3C6GgbZWLwzrmnpJH24tsmQMP5ig4OfYR01cttk955txsgSCSQDDPyCohZl7optrNOj+BKq/hgdUqX2dmR4z+yj/Mm+hxxfs3hQKpJUNO7JjNFaZ5f/wc015lTM5I+pRM6Ig4jaTTR9+zqkjZqeLXT1gGefa5XMRyitOqD101oDgj7a5ficVKmCukWIcDvWd/iSCwAXZ6BIwyLCrveIVEbzwCb1/RGpRnwFQUbBJ1fmCL6XcKk1B1nKe8EIxHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <49991d39-f976-af50-b203-152564fa458e@suse.com>
Date: Thu, 2 Dec 2021 16:28:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2 06/18] IOMMU/x86: restrict IO-APIC mappings for PV Dom0
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <f66b6403-13dd-cb05-7411-20efd7364b08@suse.com>
 <Yac7uLaQ1+YdCqtW@Air-de-Roger>
 <fd5ff1e0-88f0-3fba-4573-b007afdbb3a5@suse.com>
 <YadPLZqfN2pu5SeG@Air-de-Roger>
 <8b2c09f5-1f64-9754-17a4-936f1e496a82@suse.com>
 <YajiQeaPx7KcL0Tw@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YajiQeaPx7KcL0Tw@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0087.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b141b17-090a-4272-2c8b-08d9b5a8719c
X-MS-TrafficTypeDiagnostic: VI1PR04MB6301:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB63016120AD5B36FF74D6E055B3699@VI1PR04MB6301.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8xBXqIRbW9xdikWUBmfH/7OFQEIYZB+q452Qz96y5i1ZhVuILqaNmUFPeClrwALubvVZiut8t6qlrpPxO56Eyk6EKyI9v7fBedBRUsNGMMT/5cEdA4NVWdgsRFY6PgTweVtWjXxI9jDc8EJMPjNHc0EDDPmFQcgAYNQsPtFMwq3a4O6bBi2SXW7EiUvSmvthFCRSq+xd+U6zya3IEXas8zFKfFTRIJVkicoioxi6w2EF08JrtdPjHoVgYWIMtorSlAa3K7FmRSuFIM9dKaVCFlPx/0sWoZVOHojqTFkSMJHKXcS5VPCIXfAFS0XtO2sdM0iIuLcxEVS19IniPXrHE6Rfm+8HPdtVQbEnLH6WloI+PjzJi8NKGlBzMm33o4EZ2XQDctDJy0KYY8hzZfDKLcqzj5cdNLzNqhjf78WmsqLVta/R2qzM0ylTc2pNOOON030CnE3U9zc2U+yespEmHzmjDCmXcytXF1R0kCvfs8RUMWpDuWhimDujH7gV7ePVvUDPeVyNxm76z/bEaw8hELt5cGqEhQNBr/YEUinAcjg+oW19zDUgvwsXLsimBUXQGEb8156hoeEeqpY+winIuDMFTkG5LTFmim3fUZYWNO6ZnmRCDkHpY7QSutrahzkSEwcS8c9CGEAwXxBEXYkeE7FeJc9LJcH2bwoi7DUYTSv0liQF8lsvhhSna4azWMjX60ZAYGu/ow6mS4tooHUlkw/EILMqflzAcILSuf+/vEs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(110136005)(316002)(38100700002)(16576012)(956004)(66476007)(8936002)(31696002)(26005)(83380400001)(66946007)(31686004)(508600001)(8676002)(86362001)(186003)(6486002)(54906003)(36756003)(53546011)(4326008)(66556008)(5660300002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UKkHk0kAEKImCDCBFPG14pL7bUgxuQqQA2atlgpcRmYryBzDcSOWIg4i443K?=
 =?us-ascii?Q?x/VorbHKHB1QMRPaEqpk06sb/JQmqxS5kqsoLGTz4CpG1hpp2iPoLs72TPul?=
 =?us-ascii?Q?NQkfuN2an88hnYKHovXgN0+TDCtCvSNl31aHe+vQaQxobWqXwAxtsC8LhZHs?=
 =?us-ascii?Q?lHWTPjo4UR1cLWBm095ACQWbtUMpXa7KVXq90tE8V67v0auZ8d8GgQpk6Cu3?=
 =?us-ascii?Q?/OSIEDc6PyiYS805OtgnAUrFgJ8KO75PyYTq4veGkIy/dDBnKH377/ldbfly?=
 =?us-ascii?Q?lfTYkI8/h+8R3HjUTbvi38EBVYmmHFW9errDXvJfZNHG8zuMsKdk6wPOphrR?=
 =?us-ascii?Q?otpx/sGIWaVbJB/6RXlrFBi3ofCcHhgrmDY2Doh3aXNkHLmDhNM0MoZlxb7C?=
 =?us-ascii?Q?AnW+UL2LzQjJoh8eLYMbnPcvzxEiqSqos/USm2MM7G+AKJdzgOxurbF4aSpb?=
 =?us-ascii?Q?ZxlPDXL0Hw0/B32qUFwssLESoWAsCnaJ5oQIy6DMpnmTbZW4cTaX+OWNLKjh?=
 =?us-ascii?Q?gB4aBa871T8B2IBWEaMaxKLNBY+ieGBg8wpDqNIAYpys57zQNlcqc2ZcLcAS?=
 =?us-ascii?Q?hV6xDAa7aCQeQ7yCfzPZCI0/UsiyVqh85zEfZWQ1Mo1CQJRvH/h/P5XwC5ST?=
 =?us-ascii?Q?1nkD7yNobigoqZX5FoG7mAZNxeaQ6hRKyzkVQBNxIyECGfNshHQAqkllNlSP?=
 =?us-ascii?Q?Irete9ozpl7TJWW1sTlWZGxDW1lWlXcuY4ONUNQI/luP3ONuB4t2VbRNMxrS?=
 =?us-ascii?Q?knhwWWSsFrdDucCsYep5fTa0VL2pQQtO3Phpy/M1RT+RgfJ9Q01HLBWYERal?=
 =?us-ascii?Q?PPeSHM+LLIHpqGGIkfcFD35jUF6kyF6wskKpocY6fYM+fQ4qA7FSJ+ut7DVK?=
 =?us-ascii?Q?Y4vY+lfVRxXjv7pOmR/fdoMlp/S6WOa3e95aHhnN0SBV7FdK6NGp0k6las6K?=
 =?us-ascii?Q?v6o2EDoAWSQDbPAg0tuHHD1xhYTS76IuRnpdeILjjACBwmEjPGlQUrHV64UM?=
 =?us-ascii?Q?ofT67h+IE0f4nWwj2iNZiRxh2A3sd0Cj2mC0u8mfPkrra6bGGkyg7wQxPmzN?=
 =?us-ascii?Q?GxDyFHidoyWYphXa4Fx0Pl+D46hA3uhJT0C2682Wa/w5f0HKntEdwfwpWl6Y?=
 =?us-ascii?Q?wb/PoxWP8fZArBjfHWWUb9cQ2wQDjIyr2hY3mEbt5CjgzS7Io4vrMhaiIExL?=
 =?us-ascii?Q?yMpbHnD3rtPVcvnSPgzKVt5M881kl3taSNL2jAMFfNWvyAyvaciqK+7WAvhR?=
 =?us-ascii?Q?Zd7KdjxTiIHWU5/Yq6mpSVHr0M3Y8pyv7aLOJDcT32UQxth77Ug9vEr49tiR?=
 =?us-ascii?Q?bfSgTSBistJi0l6F90QvS36pmBLXlry9oIquYg3W36AEbinqfcr5GrwqHHLP?=
 =?us-ascii?Q?BgOoHrtxNG/hYbTmSQojjFbIi7+ttOYA8Y8btqggy+DGx38JvGulPgVC1/BA?=
 =?us-ascii?Q?UROkP/LRJCSAR6UcqkEwpW8zDK/6ct6KBCXR6AnDNgxBNYqoMsnpEnp3B3HM?=
 =?us-ascii?Q?L9W/g9jR+KNKy+SjrBM6+bQmSkqPv5L1SkoCJ7VgKnpRrOiywIVjQMWtlOcD?=
 =?us-ascii?Q?an4iya+clZpQlGA1bKoMn4ITrUONK89/Us95cElUAYuubyCRfprgBSsjJFyz?=
 =?us-ascii?Q?Ly6QOUBIMuS6BOwvtBPyxvM=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b141b17-090a-4272-2c8b-08d9b5a8719c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 15:28:51.7188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a4ToyLg7Sml4jnC5XN/fTpQNkRaEgQNfwY5GaRAtbehBW9nSjVLFgBpm7NEj/PbPgUbFjWImVpcAwGgcgpUOcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6301

On 02.12.2021 16:12, Roger Pau Monn=C3=A9 wrote:
> On Wed, Dec 01, 2021 at 12:45:12PM +0100, Jan Beulich wrote:
>> On 01.12.2021 11:32, Roger Pau Monn=C3=A9 wrote:
>>> On Wed, Dec 01, 2021 at 10:27:21AM +0100, Jan Beulich wrote:
>>>> On 01.12.2021 10:09, Roger Pau Monn=C3=A9 wrote:
>>>>> On Fri, Sep 24, 2021 at 11:46:57AM +0200, Jan Beulich wrote:
>>>>>> @@ -267,44 +267,60 @@ static bool __hwdom_init hwdom_iommu_map
>>>>>>       * that fall in unusable ranges for PV Dom0.
>>>>>>       */
>>>>>>      if ( (pfn > max_pfn && !mfn_valid(mfn)) || xen_in_range(pfn) )
>>>>>> -        return false;
>>>>>> +        return 0;
>>>>>> =20
>>>>>>      switch ( type =3D page_get_ram_type(mfn) )
>>>>>>      {
>>>>>>      case RAM_TYPE_UNUSABLE:
>>>>>> -        return false;
>>>>>> +        return 0;
>>>>>> =20
>>>>>>      case RAM_TYPE_CONVENTIONAL:
>>>>>>          if ( iommu_hwdom_strict )
>>>>>> -            return false;
>>>>>> +            return 0;
>>>>>>          break;
>>>>>> =20
>>>>>>      default:
>>>>>>          if ( type & RAM_TYPE_RESERVED )
>>>>>>          {
>>>>>>              if ( !iommu_hwdom_inclusive && !iommu_hwdom_reserved )
>>>>>> -                return false;
>>>>>> +                perms =3D 0;
>>>>>>          }
>>>>>> -        else if ( is_hvm_domain(d) || !iommu_hwdom_inclusive || pfn=
 > max_pfn )
>>>>>> -            return false;
>>>>>> +        else if ( is_hvm_domain(d) )
>>>>>> +            return 0;
>>>>>> +        else if ( !iommu_hwdom_inclusive || pfn > max_pfn )
>>>>>> +            perms =3D 0;
>>>>>
>>>>> I'm confused about the reason to set perms =3D 0 instead of just
>>>>> returning here. AFAICT perms won't be set to any other value below,
>>>>> so you might as well just return 0.
>>>>
>>>> This is so that ...
>>>>
>>>>>>      }
>>>>>> =20
>>>>>>      /* Check that it doesn't overlap with the Interrupt Address Ran=
ge. */
>>>>>>      if ( pfn >=3D 0xfee00 && pfn <=3D 0xfeeff )
>>>>>> -        return false;
>>>>>> +        return 0;
>>>>>>      /* ... or the IO-APIC */
>>>>>> -    for ( i =3D 0; has_vioapic(d) && i < d->arch.hvm.nr_vioapics; i=
++ )
>>>>>> -        if ( pfn =3D=3D PFN_DOWN(domain_vioapic(d, i)->base_address=
) )
>>>>>> -            return false;
>>>>>> +    if ( has_vioapic(d) )
>>>>>> +    {
>>>>>> +        for ( i =3D 0; i < d->arch.hvm.nr_vioapics; i++ )
>>>>>> +            if ( pfn =3D=3D PFN_DOWN(domain_vioapic(d, i)->base_add=
ress) )
>>>>>> +                return 0;
>>>>>> +    }
>>>>>> +    else if ( is_pv_domain(d) )
>>>>>> +    {
>>>>>> +        /*
>>>>>> +         * Be consistent with CPU mappings: Dom0 is permitted to es=
tablish r/o
>>>>>> +         * ones there, so it should also have such established for =
IOMMUs.
>>>>>> +         */
>>>>>> +        for ( i =3D 0; i < nr_ioapics; i++ )
>>>>>> +            if ( pfn =3D=3D PFN_DOWN(mp_ioapics[i].mpc_apicaddr) )
>>>>>> +                return rangeset_contains_singleton(mmio_ro_ranges, =
pfn)
>>>>>> +                       ? IOMMUF_readable : 0;
>>>>>> +    }
>>>>
>>>> ... this return, as per the comment, takes precedence over returning
>>>> zero.
>>>
>>> I see. This is because you want to map those in the IOMMU page tables
>>> even if the IO-APIC ranges are outside of a reserved region.
>>>
>>> I have to admit this is kind of weird, because the purpose of this
>>> function is to add mappings for all memory below 4G, and/or for all
>>> reserved regions.
>>
>> Well, that was what it started out as. The purpose here is to be consist=
ent
>> about IO-APICs: Either have them all mapped, or none of them. Since we m=
ap
>> them in the CPU page tables and since Andrew asked for the two mappings =
to
>> be consistent, this is the only way to satisfy the requests. Personally =
I'd
>> be okay with not mapping IO-APICs here (but then regardless of whether t=
hey
>> are covered by a reserved region).
>=20
> I'm unsure of the best way to deal with this, it seems like both
> the CPU and the IOMMU page tables would never be equal for PV dom0,
> because we have no intention to map the MSI-X tables in RO mode in the
> IOMMU page tables.
>=20
> I'm not really opposed to having the IO-APIC mapped RO in the IOMMU
> page tables, but I also don't see much benefit of doing it unless we
> have a user-case for it. The IO-APIC handling in PV is already
> different from native, so I would be fine if we add a comment noting
> that while the IO-APIC is mappable to the CPU page tables as RO it's
> not present in the IOMMU page tables (and then adjust hwdom_iommu_map
> to prevent it's mapping).

Andrew, you did request both mappings to get in sync - thoughts?

> I think we should also prevent mapping of the LAPIC, the HPET and the
> HyperTransport range in case they fall into a reserved region?

Probably.

> TBH looks like we should be using iomem_access_permitted in
> arch_iommu_hwdom_init? (not just for the IO-APIC, but for other device
> ranges)

In general - perhaps. Not sure though whether to switch to doing so
right here.

>>>>>> @@ -346,15 +362,19 @@ void __hwdom_init arch_iommu_hwdom_init(
>>>>>>      for ( ; i < top; i++ )
>>>>>>      {
>>>>>>          unsigned long pfn =3D pdx_to_pfn(i);
>>>>>> +        unsigned int perms =3D hwdom_iommu_map(d, pfn, max_pfn);
>>>>>>          int rc;
>>>>>> =20
>>>>>> -        if ( !hwdom_iommu_map(d, pfn, max_pfn) )
>>>>>> +        if ( !perms )
>>>>>>              rc =3D 0;
>>>>>>          else if ( paging_mode_translate(d) )
>>>>>> -            rc =3D set_identity_p2m_entry(d, pfn, p2m_access_rw, 0)=
;
>>>>>> +            rc =3D set_identity_p2m_entry(d, pfn,
>>>>>> +                                        perms & IOMMUF_writable ? p=
2m_access_rw
>>>>>> +                                                                : p=
2m_access_r,
>>>>>> +                                        0);
>>>>>>          else
>>>>>>              rc =3D iommu_map(d, _dfn(pfn), _mfn(pfn), 1ul << PAGE_O=
RDER_4K,
>>>>>> -                           IOMMUF_readable | IOMMUF_writable, &flus=
h_flags);
>>>>>> +                           perms, &flush_flags);
>>>>>
>>>>> You could just call set_identity_p2m_entry uniformly here. It will
>>>>> DTRT for non-translated guests also, and then hwdom_iommu_map could
>>>>> perhaps return a p2m_access_t?
>>>>
>>>> That's an orthogonal change imo, i.e. could be done as a prereq change=
,
>>>> but I'd prefer to leave it as is for now. Furthermore see "x86/mm: spl=
it
>>>> set_identity_p2m_entry() into PV and HVM parts": In v2 I'm now also
>>>> adjusting the code here=20
>>>
>>> I would rather adjust the code here to just call
>>> set_identity_p2m_entry instead of differentiating between PV and
>>> HVM.
>>
>> I'm a little hesitant, in particular considering your suggestion to
>> then have hwdom_iommu_map() return p2m_access_t. Andrew has made quite
>> clear that the use of p2m_access_* here and in a number of other places
>> is actually an abuse.
>>
>> Plus - forgot about this in my earlier reply - there would also be a
>> conflict with the next patch in this series, where larger orders will
>> get passed to iommu_map(), while set_identity_p2m_entry() has no
>> respective parameter yet (and imo it isn't urgent for it to gain one).
>=20
> I've seen now as the iommu_map path is modified to handle ranges
> instead of single pages. Long term we also want to expand this range
> handling to the HVM branch.

Long (or maybe better mid) term, yes.

Jan


