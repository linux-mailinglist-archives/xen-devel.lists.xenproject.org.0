Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D327464AA5
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 10:28:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235713.408874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msLth-0006FV-7Z; Wed, 01 Dec 2021 09:27:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235713.408874; Wed, 01 Dec 2021 09:27:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msLth-0006Cv-3a; Wed, 01 Dec 2021 09:27:29 +0000
Received: by outflank-mailman (input) for mailman id 235713;
 Wed, 01 Dec 2021 09:27:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gc09=QS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1msLtf-0006Cp-9F
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 09:27:27 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5164719-5288-11ec-976b-d102b41d0961;
 Wed, 01 Dec 2021 10:27:25 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2050.outbound.protection.outlook.com [104.47.8.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-2-vQB58STVPACvU7lcHbMWmw-1; Wed, 01 Dec 2021 10:27:24 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB2957.eurprd04.prod.outlook.com (2603:10a6:802:4::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Wed, 1 Dec
 2021 09:27:23 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Wed, 1 Dec 2021
 09:27:23 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0326.eurprd06.prod.outlook.com (2603:10a6:20b:45b::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11 via Frontend
 Transport; Wed, 1 Dec 2021 09:27:22 +0000
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
X-Inumbo-ID: e5164719-5288-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638350845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+cT5dYmJg4BpgiUZ7H2qn7Pe5rkWz1gQwZJoYb2pKGA=;
	b=Ee3Jd0C0CW0loPIHL5uzvWZjS2sqi8q2TNCSySQ0mfgdIvWubWsQMCvsfzllMh0gOgobox
	cC77sn5XSLyrVtlolooWQOIWGasPWj7C0TVwn/m5icZ1EhQhDzYaMtZYipvkj2mL4c5d6y
	gPmHouBD5VIB0Aohsf9jK2w4v74+L+8=
X-MC-Unique: vQB58STVPACvU7lcHbMWmw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fyuvMNuchfejCTJb1Io9CJly7lc3BsbiIAo+MbQpYgM9gJ+QounE+Ni2ZuhX6TlHFMCFkCl1iY43+YDYDkdY9GADzfLwSPF0qdpZdDl9Kew8OyNva8x8I9bcwoDK1K5a+0kTF3XU3q+ARbYVo/D0PHvuZh/bSkqa0/b2Co4pnNZJh00s69+3n0O9Ot8tvKSt9yt9f9YDxMczjnqbsfRcFDqwZPExdd8qX8im8tjJQWbppUdmJ6def3M14q3iYtyJFLSC9xTmwQqJLlTfrqsyOoYLiOc5/YaDGICBH/0nZktFt3uGcCf/2siabjNlshcx5MqLHHg6lY3CebkCvA7Nng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QkYb3HDaBJPuwzu7h5/sWyxPwJvQ/HUMoV5E7AoR/6U=;
 b=Oa1cFtovIWPEaASdyy3YgVkX8ln5Ujphb2xuh76Ux6HctiCPX9Hwf5EISK1t6LwsSC6ZN2dCg+ABQYWfzV0P6cDK5ucHcGF+cD5yZTcNDJCgw/TIAqedXhl8ipHhGqYGbOYwrQYcvgaEXHPEKdXWn7BOa+7lO7vnvgT05HTiAysBjhHqPdVW8BVwHcQDcml4t6gAYX5bvkLNfL4sHgVfuDnEJ7k52XbSU845v9X+im726t/GTTnDd1LJd3sEFsuP6w/Ltu06U6Q56wj1I8we2ilnuybUoXsaKncsoL2Q9rC5PI21Z8KHbycq2vOuj+GB7v0Xf3y5dyTyCDF5fiaizA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fd5ff1e0-88f0-3fba-4573-b007afdbb3a5@suse.com>
Date: Wed, 1 Dec 2021 10:27:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2 06/18] IOMMU/x86: restrict IO-APIC mappings for PV Dom0
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <f66b6403-13dd-cb05-7411-20efd7364b08@suse.com>
 <Yac7uLaQ1+YdCqtW@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yac7uLaQ1+YdCqtW@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0326.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 057eb263-e626-45f3-718a-08d9b4acc7e0
X-MS-TrafficTypeDiagnostic: VI1PR04MB2957:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB2957F3B7B265D0AB925384C1B3689@VI1PR04MB2957.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PqXm9mbfdz620/w1tYsS8MUt8WtqB7WLShoFzteLZGj1Ubrz66BaQbHHKlyrRXLyW1Zd6OAWTq1G0t3lf5tNgeOAi5JAbm1HwuBo07kUBiRMFmj8/8vDk+jRcgRSjMsRj9IRGZHcpLoiHvZhjqnYBrPsDfyISBd408royVhhvB7YMifGfCc2eYDUjE1mcwZso+6JMkJZpbS1nW1JBfdyyCNfIQJ4ze/WRV3tz6+msJO01yATXcRZgM6nVpD3T2B8OplOM3CU41JmFPWQ5DzPt2wtNRoYCkJtqYjF/JMk2Jipqpx6dLTg/iu4uGpuX7XXIMXtUrfgszh5kNdoxwbvPHcdRC8q5jJWiS57Q5rG3rUkDgJqivlfFv/ikjSe2HM7Xb/g8iq0a6YKZ/8IuSTuImAL+Lb8kJNZX3zGerD7rc1XIFpAzJdiUTUkMgh4Vs3hC3Z2458sV3i483W7gG2wqR0AERFivw9uqxn1qXYv5sBp4d1mqnmo/GfDI0rCcMXCvqdc37zDGCzAbfk+3vZlZ2s4x9UvVSQbDGGr7wB+NKenVwMo+yNL6iQQcDxFnGgUozOzAkI+Ht73l+lPVwy3UZwsPjdgNi3tGwuZvF1Hh7XKO0KB2JA6z6zXtYLSxiUmAVmP9H7p/AbUrAReFX6Ka2kWCVimkioV+LG1X3wBqwDHhpxu+X2e00jPqhwA0NQ0MnBXBF7VYBeJXOOc8zOvdJHqeBHyF+pnDUfM1vEIpU0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(6916009)(66556008)(956004)(2906002)(66946007)(38100700002)(31696002)(54906003)(36756003)(186003)(2616005)(16576012)(66476007)(508600001)(31686004)(316002)(6486002)(53546011)(83380400001)(8676002)(26005)(5660300002)(4326008)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cEEICkkauFbNrzYBbrpgWKSduhKeKnMonGi54O6jUuiwpdxQhcaLjLUEAUx4?=
 =?us-ascii?Q?WQ77f44o+oy4Mko/lz3Vchc6ZXNI4nNNnJ48VWPWiVcJIKuej+Kk3+o/jHz3?=
 =?us-ascii?Q?bVno+H8auVD2JVL/M1Ble/5Iq+NGYoCEs3OsGT9AfDs3rjxmk/F0GXl1Hhfy?=
 =?us-ascii?Q?cT7ly23y+zk5WdUIgcvFyT1HYHV7dmd7s39ZZKaoNBNu0TbgNxoeBmTgXD6q?=
 =?us-ascii?Q?Fsh8sZXo5iVQNODIkaaJZqwwIb3du8+SPXRi5yMozPWwx9RqGQFC9KhIwajQ?=
 =?us-ascii?Q?jWVKMHzW8mKBdO8xgwIsOa+sId+LCPnZ6N1ajD0rFH8AiVGiszB/lkIUsvb2?=
 =?us-ascii?Q?xbnezAJx3knwA/AAdSR8r+ZV0Ku5rXX55mAPygnQN/j/UsEG6EINWhH74/li?=
 =?us-ascii?Q?RL3yxQ7QyMKL90EVpNoNYUc6nljh+pEUSQ8tSThDNsN5TMOsRdo2ZVcTuhNj?=
 =?us-ascii?Q?l9wyxuU4HNLHpd73+OdMB0+VDrAf2DtU4ilhAabc1uJ4ttZlSpsMceR++7r3?=
 =?us-ascii?Q?9CI+K3g9Dl3kwrIicSqDU7UliKJZts6YUASH4qRvZTTZiYcfl5vWH5LhODkZ?=
 =?us-ascii?Q?IROVP9T5xq6Pah0e1XNlV6mQ1HClrmXPagOknXIcUgp/OctV2m526p21mFb/?=
 =?us-ascii?Q?qyD0Js4PpQDVt7aoyP0Pt05nPqS7YcFy5yDod7WRvdkPV3X/0HiT2HSvmLDy?=
 =?us-ascii?Q?TogR4R6kQiAtUBA3f++in87R3Zky53m1Lvt3+KabbjBGIjWe1VAVOIzfKfXo?=
 =?us-ascii?Q?1iYJS+/UIt87NPjccRUuuwQBUMMcqnUHi0vPOv6pgxTChLcDMT17cnozEG87?=
 =?us-ascii?Q?eExUcGlN6x3fORFrBvWPr1GNHT/L9jltnEDse9CBZp8iXv+h3N6tAAzYwgq6?=
 =?us-ascii?Q?rmSsPGi49e+Pz6N0hSLoOmEpwL62nhu9RDP+sJAgyAEUBnXCdloXdJzaQSgY?=
 =?us-ascii?Q?VrGaew423/BQPfOHXpgwwUSxqNi44n3TUe++iknAMBkyz3YeZmt/Kr0yhNnm?=
 =?us-ascii?Q?8PDDnHEBik/uDkJrQWqVol4ObrvzVlsmUC8SRGDwXzLn+TytIz2v4pd+DEr7?=
 =?us-ascii?Q?CPeBoQO4X/pYZltxV+QvuSeRGw1NDF0kl8loZ1TRKAoUd4/2NT8nBzzGzIPm?=
 =?us-ascii?Q?uJ3xpxuR0Qj02lZ3qdOgDhpOU7tYnfXFuZVfToV4NE73S0OtHzMv54y6yzOP?=
 =?us-ascii?Q?oUSPWJoX8CdXqcs3s1H/TGTUfhgtFGxYVkygYoL/MVFDK46PCbQMncdqtdbp?=
 =?us-ascii?Q?PriAvpWH5uwEQ0yIfUtD3yz2hVOr3LItgf64wT/ArhIda4llSQ+sQVXi1Hsq?=
 =?us-ascii?Q?Crd0rU6wmqaOWgmVVeHLafFuGTS4RrYDm0TBQnfU9ldNkFy+Um5l+MZblx6V?=
 =?us-ascii?Q?WV4wtDc+oDxH+8xT0PL48XpgMCK7qVv+Pr6KzfcpW0Hg1g+/27T9M36zfGxx?=
 =?us-ascii?Q?BLEF5+jyXsLevAUssoOf4UC4GOzQrNSoPbRh4XmxS0XzUc59RGfQXtuCx9EV?=
 =?us-ascii?Q?JDI4O8R5qHJr8Jo7HtNLUHXGy6bI8UA7dQ/biPmpCNUlSH36TPlTSw34fFiV?=
 =?us-ascii?Q?DpmAWyAaCQp5VWjbLu2U8uiLrEMdr+B8Nqv5NB07gO+vt/UgsEFMINTq86Pj?=
 =?us-ascii?Q?ppfsavZl2OWL3/GGEe98AzY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 057eb263-e626-45f3-718a-08d9b4acc7e0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 09:27:23.2064
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iMy9FdyPzwg+8J8VNY+Xak5Yid/so95xan7fTdIUbu1S6X/MSv7IeJUG2i34TLVqK8h8a4fu+IfpvwlHUx6vYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2957

On 01.12.2021 10:09, Roger Pau Monn=C3=A9 wrote:
> On Fri, Sep 24, 2021 at 11:46:57AM +0200, Jan Beulich wrote:
>> @@ -267,44 +267,60 @@ static bool __hwdom_init hwdom_iommu_map
>>       * that fall in unusable ranges for PV Dom0.
>>       */
>>      if ( (pfn > max_pfn && !mfn_valid(mfn)) || xen_in_range(pfn) )
>> -        return false;
>> +        return 0;
>> =20
>>      switch ( type =3D page_get_ram_type(mfn) )
>>      {
>>      case RAM_TYPE_UNUSABLE:
>> -        return false;
>> +        return 0;
>> =20
>>      case RAM_TYPE_CONVENTIONAL:
>>          if ( iommu_hwdom_strict )
>> -            return false;
>> +            return 0;
>>          break;
>> =20
>>      default:
>>          if ( type & RAM_TYPE_RESERVED )
>>          {
>>              if ( !iommu_hwdom_inclusive && !iommu_hwdom_reserved )
>> -                return false;
>> +                perms =3D 0;
>>          }
>> -        else if ( is_hvm_domain(d) || !iommu_hwdom_inclusive || pfn > m=
ax_pfn )
>> -            return false;
>> +        else if ( is_hvm_domain(d) )
>> +            return 0;
>> +        else if ( !iommu_hwdom_inclusive || pfn > max_pfn )
>> +            perms =3D 0;
>=20
> I'm confused about the reason to set perms =3D 0 instead of just
> returning here. AFAICT perms won't be set to any other value below,
> so you might as well just return 0.

This is so that ...

>>      }
>> =20
>>      /* Check that it doesn't overlap with the Interrupt Address Range. =
*/
>>      if ( pfn >=3D 0xfee00 && pfn <=3D 0xfeeff )
>> -        return false;
>> +        return 0;
>>      /* ... or the IO-APIC */
>> -    for ( i =3D 0; has_vioapic(d) && i < d->arch.hvm.nr_vioapics; i++ )
>> -        if ( pfn =3D=3D PFN_DOWN(domain_vioapic(d, i)->base_address) )
>> -            return false;
>> +    if ( has_vioapic(d) )
>> +    {
>> +        for ( i =3D 0; i < d->arch.hvm.nr_vioapics; i++ )
>> +            if ( pfn =3D=3D PFN_DOWN(domain_vioapic(d, i)->base_address=
) )
>> +                return 0;
>> +    }
>> +    else if ( is_pv_domain(d) )
>> +    {
>> +        /*
>> +         * Be consistent with CPU mappings: Dom0 is permitted to establ=
ish r/o
>> +         * ones there, so it should also have such established for IOMM=
Us.
>> +         */
>> +        for ( i =3D 0; i < nr_ioapics; i++ )
>> +            if ( pfn =3D=3D PFN_DOWN(mp_ioapics[i].mpc_apicaddr) )
>> +                return rangeset_contains_singleton(mmio_ro_ranges, pfn)
>> +                       ? IOMMUF_readable : 0;
>> +    }

... this return, as per the comment, takes precedence over returning
zero.

> Note that the emulated vIO-APICs are mapped over the real ones (ie:
> using the same base addresses), and hence both loops will end up using
> the same regions. I would rather keep them separated anyway, just in
> case we decide to somehow change the position of the emulated ones in
> the future.

Yes - I don't think we should bake any such assumption into the code
here.

>> @@ -346,15 +362,19 @@ void __hwdom_init arch_iommu_hwdom_init(
>>      for ( ; i < top; i++ )
>>      {
>>          unsigned long pfn =3D pdx_to_pfn(i);
>> +        unsigned int perms =3D hwdom_iommu_map(d, pfn, max_pfn);
>>          int rc;
>> =20
>> -        if ( !hwdom_iommu_map(d, pfn, max_pfn) )
>> +        if ( !perms )
>>              rc =3D 0;
>>          else if ( paging_mode_translate(d) )
>> -            rc =3D set_identity_p2m_entry(d, pfn, p2m_access_rw, 0);
>> +            rc =3D set_identity_p2m_entry(d, pfn,
>> +                                        perms & IOMMUF_writable ? p2m_a=
ccess_rw
>> +                                                                : p2m_a=
ccess_r,
>> +                                        0);
>>          else
>>              rc =3D iommu_map(d, _dfn(pfn), _mfn(pfn), 1ul << PAGE_ORDER=
_4K,
>> -                           IOMMUF_readable | IOMMUF_writable, &flush_fl=
ags);
>> +                           perms, &flush_flags);
>=20
> You could just call set_identity_p2m_entry uniformly here. It will
> DTRT for non-translated guests also, and then hwdom_iommu_map could
> perhaps return a p2m_access_t?

That's an orthogonal change imo, i.e. could be done as a prereq change,
but I'd prefer to leave it as is for now. Furthermore see "x86/mm: split
set_identity_p2m_entry() into PV and HVM parts": In v2 I'm now also
adjusting the code here (and vpci_make_msix_hole()) to call the
translated-only function.

Jan


