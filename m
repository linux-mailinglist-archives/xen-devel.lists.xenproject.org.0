Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CCC519BE0
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 11:33:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320495.541256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmBNW-0006Cu-Kl; Wed, 04 May 2022 09:33:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320495.541256; Wed, 04 May 2022 09:33:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmBNW-0006Aq-H3; Wed, 04 May 2022 09:33:02 +0000
Received: by outflank-mailman (input) for mailman id 320495;
 Wed, 04 May 2022 09:33:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IBxS=VM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nmBNU-0006Ak-UR
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 09:33:01 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2eb15e3c-cb8d-11ec-8fc4-03012f2f19d4;
 Wed, 04 May 2022 11:32:57 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2052.outbound.protection.outlook.com [104.47.13.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-3-wH463SmSO2ibocIu2JhI5Q-1; Wed, 04 May 2022 11:32:55 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB7PR04MB5114.eurprd04.prod.outlook.com (2603:10a6:10:23::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Wed, 4 May
 2022 09:32:53 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Wed, 4 May 2022
 09:32:53 +0000
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
X-Inumbo-ID: 2eb15e3c-cb8d-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651656777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=saOCQtuwdFVHnqgJh7Wl6ao1vYeQgeyjg/m/LJXlpW0=;
	b=MHx8EKWB+ZVmfeWuCJ9HVSv8/pK1l336nH7baFf0LO3yZpH6syccIz8/NXqWCb3QGnnCtn
	J75aS6fhUSBfiPxQFwywaflguRo4gEkRxnUTOVqqUhvS9AEQB6g6eKTnumw5Qsyu8WzoOS
	CzUeB6R7lEUPlohSeVaYTkS4mRmjB+c=
X-MC-Unique: wH463SmSO2ibocIu2JhI5Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DAjJvvNxReMUyN4Grc0eOympn80EAirPFWe/RUoOrzR1JtC4LIVJQAoeZ2OLXCzYe/pwltlcgg8ddZruEqGgrzwyr597Nd8hvuqMOHedtrqvi93Y2QF8hO+P+nQqygKetiTQXjqReOaeB1m74B3rXTK8byGFrPw8X7H4rwj9dWU5nvtQk+FPiMatYh5nTG3km+ysKj6UHmHbRJqYke1x+md1dZI3tyyV/dgPwxd5m1f9CLS+4dJaz1hPOmUpZnaA2AM22AXMJZ3U+05S5fpndY3n13d+L/IiX2ujWz2f0EQMzR968i7gzOHG+BrMZ5CcYdDS0jp+fYgJemv+E+Yuaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qQ/tWqPXcQF2o2dkJ8KHWyYx75+mzdxX5FgcKh1v/Fc=;
 b=hPmdY8KKolCcgvffgrvs2KVczXum3JmFaWIqGA6116ZOiw6n91bFk3MbjE+67ChgZivheyGUOmkXOnIhEOC218xUH/Bcxm+YEwkOnkJyLH+CgR0b0a5GS5oR4drK+5SoLSlhUwDk9XAEI3y+QDAYRg1k3uJNpn91NUKYWDnI+fH58KP1kr+cjLb4nw+Osmj3oG7o8ZtDC2goW5FuiPuilxYu8ULA+YRLK553zS55aN3aUL/dqlTrEyUBhUQUE59J59D5xLsXlmzlyJb//mthibd/KoE9p7Nj9QAfIRV/tR7w1jMRDtMk+5pbawrgZ5lSISioW5uxvSVEeC2qihizTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6f45248b-2f49-0834-e801-d298ea680a33@suse.com>
Date: Wed, 4 May 2022 11:32:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 05/21] IOMMU/x86: restrict IO-APIC mappings for PV Dom0
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <5cb4dc1b-f6b0-89cc-e21c-a27a5daf0290@suse.com>
 <YnEngsDG9BiiyzXj@Air-de-Roger>
 <6ffd48ee-9356-2f22-415e-03e172eabb55@suse.com>
In-Reply-To: <6ffd48ee-9356-2f22-415e-03e172eabb55@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0013.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::18) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7be8e082-31a0-4e48-bcbd-08da2db11048
X-MS-TrafficTypeDiagnostic: DB7PR04MB5114:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB5114A784F5C58311C5145454B3C39@DB7PR04MB5114.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4jgI2zPzovdDHQZ+MS5EJxh7Hb6xYVGvKwwY2GJj8FEbhDZvkmY+My+3mm19J7CsWj80tN8X8eRZKbosGSa30AwZ6CCGH4VZfW0ZcdWnD/rZbEAvOuG19C9jQs5N0uGCqPGyoU4JMIMfEb8c3N6ISKzv5o9WwuaIhiSfWtApN1TWCa4HhOua/0jzFaHXcfiakCdDxbSWvP+jsiSF92Tv3MfchtQaxtHGTiJlaRfP/DyKJAGVRH8eXRavu1AQWK1HEsNqcS0KRaOB0dV6CSf7jBEk+j1FvNLlIsjf64FtPyOgstKucW3qv8QdHqSjko8cv4LRDguIg6GQsYeZdz0yh3xeJEAsO4Z54A0l3DzVpSAGgEyWGkeVaRTv2NMKFEndkBW9NSWliGSQSi/7c8wPZ9hWMoceE8S0pbYUpjbLtyfPfRGg9c0RMocTgDL7n18F2I3IaRca4QoXmXacp/wcQ5ZmLB6eVn16t+hM18XKCA845iVXL8QurPRQgYlUzhJBwL1HroPehDw4iIg2UJ5Wkka9vacJqatYY1/K2yyel3ZK8b5chlTmpKz//jlLQ0xaJ6SMU+yqwFLqM4rpxswA654Q0ef8TCVberZoG3rXpgZGHjkVFWgtJK5B9f0QQLOG24vi0/1FNgDkhWIV4Wj+XYwveniHUTVVbhY418NyUnkLiZuYk1TJZg+a9BApHv9ZV5QBrG99XGxUEBBSP/H0lkXUJNsuu1yAjoLtjm46HejInVxca19hVL9WpLaQTLxQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(4326008)(66476007)(66556008)(66946007)(8936002)(8676002)(2616005)(5660300002)(36756003)(31696002)(83380400001)(31686004)(86362001)(53546011)(316002)(2906002)(54906003)(6916009)(186003)(6512007)(26005)(38100700002)(6506007)(508600001)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/dkG1mIsduCJI3sHyiO+Qn6GMaZP6OhLZm9zkSx6ZrWxIJ3jGVQeZ9Zl37d+?=
 =?us-ascii?Q?lc2PxMcxd0gHFtlkYiV9tQq5Qa/FtPbZHZhuVuCV9r4Wy8/ZFQ6y+KmskFkn?=
 =?us-ascii?Q?qQa9AHF9CDeZdVTSsN4EAy2q/jWeg+RJs/qDM2yEF5bXWRRV3Nr34zeWIwZx?=
 =?us-ascii?Q?orKfT7ABSm7IJJ4JFf0grd7A0yp6hhHTmfZu3w1pMo/Bdbg31fpWBexXWwPq?=
 =?us-ascii?Q?GbPCGkWgRFupB5ICd1/7bN4uq9rchQoWGSZpaOjlj/UXd9p/nKgbsiroRHpU?=
 =?us-ascii?Q?656Hfi4wxuHQxNs6MH9gAUeOf7DB+EMDXSYPbaYJAHPd025z8FeqRJ1UCVGK?=
 =?us-ascii?Q?70oqpw5y6rjUBaQreoRZ5SNtCWAIoUQh5BKDgIwmo00l2D+eXF7YNyEh9yLO?=
 =?us-ascii?Q?xiupLVu53V4rOL+Ia3d8NqnwWkWbo/bkOANYeKR6SXGJ+GFbZKT3lP/DjlSv?=
 =?us-ascii?Q?shiiJsf6EE0XXqEMYRavzK2+rR+0Nns6E3Ihdg4NywcnxLbigxGE76tYHeqn?=
 =?us-ascii?Q?pnzNon30iAGQdEZTsZ8OlHTcYFNJtzx9oyzpHDmcGZ7rgFchtCQM56HZKt6H?=
 =?us-ascii?Q?6RM+tC5iAszbi0ypC+dAXgaHuHPM8f4GH1z4zFipvggkEe+xIGmItvpJcmY5?=
 =?us-ascii?Q?WLQxK0JWUlkm2GjBMHbZphOy2KTbnzryS9LSPVFFOzV2HDJzkeeaMhoJnE4w?=
 =?us-ascii?Q?SSLu0IbseYv7mQ7AfB2xn0MExrlWjsKW+A2IwNzYjRKx8oemUIeAMmnGhiYq?=
 =?us-ascii?Q?cstygD/JPSHg0iLPbO0exr86KJgnmrDQDnKLY0r+1doG5FKQjTExtu40Exun?=
 =?us-ascii?Q?b3F1OJ1Z2VxBFL2D60GqkHj41x0BwXwdyWlLvi1scRcIg0BltCXfj8x0MjK/?=
 =?us-ascii?Q?Vu9lUopq2a0+Cjv68f1P2SKN9XSt9kdwjjn4CN6lCxBITdD00bQJ0QISPb5L?=
 =?us-ascii?Q?5aM8iAb+BIlLN06QeNF16sA/wOj1eG2ryZOQdXtG7feLxnmNAdTI6iFp/47F?=
 =?us-ascii?Q?wKSWn/udA2M58yG8XZfiFpGJ8swTxxnMg+UMJzjF+o6JpRCG3epAaCSk3HeZ?=
 =?us-ascii?Q?+P0XEljq360v+56nkqcx2rEBL2S1nnpJGAaETkRH/Tns2jDDP1Fc1+97Jlr3?=
 =?us-ascii?Q?Hn5hlKSU7UGL8m8606Hr7zoi1TgVDpvbL63XpXmtLPViabOgJQQuZofeWIZD?=
 =?us-ascii?Q?5Uc6vvaliCsXqHYBd3lGX8on7tsxqpSGRfMs2M41tlPgirh+SW4MLZ0xftcd?=
 =?us-ascii?Q?ax+houkPje/KhKeW9pBzDwXPlj4oRu/msZ/dTaqC8+oe4I+sfY0e/dM8/cD0?=
 =?us-ascii?Q?AWoqYakSufbTsObWKIU1n5tdxCLVYpRFEC9ad6rfyetCvGYyvHPq0yYf3KId?=
 =?us-ascii?Q?vPiFxNfgelhznbajfxx8q0KjlQMVGRE8FhNfF/wHK947sdvVoMrTzQyHRLcI?=
 =?us-ascii?Q?EPPeX0v2Cq4e1l4HEgNF/qpar9WB9b1CrAu5otJ0ES25LPO8nEUBjOFWoTYO?=
 =?us-ascii?Q?lOJwXV0k7+ooIf4OjoH+JO46Q1HCMnVHfrCPfOpo+vY1R5oVpXgeSJStH9Er?=
 =?us-ascii?Q?9A2kNa8DfztcN+7McOSSv0lRSur93zegcwcx3aCabc4g0Ju2JwCXUdi+Jm89?=
 =?us-ascii?Q?hTfruvigtMlaN5nKWFpDH0Y5ShlyL0vCupZPPauE3pz/ETo6v9fOxJppo50p?=
 =?us-ascii?Q?wdCpnLPbfhi0r7K+U1gpnB6u24lX86aEh8+C98yLftrwXKStvOOVcMFTwWge?=
 =?us-ascii?Q?GdCExBfJRw=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7be8e082-31a0-4e48-bcbd-08da2db11048
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 09:32:53.3259
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kGefTwdi/4UYF7FrPqQwngqPsFvxdapEDxneQAXgB52xXcB8M2GDKK1+j8ZrFAkSwuJhFrrF+WrsX1kH9Do4Cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5114

On 03.05.2022 16:50, Jan Beulich wrote:
> On 03.05.2022 15:00, Roger Pau Monn=C3=A9 wrote:
>> On Mon, Apr 25, 2022 at 10:34:23AM +0200, Jan Beulich wrote:
>>> While already the case for PVH, there's no reason to treat PV
>>> differently here, though of course the addresses get taken from another
>>> source in this case. Except that, to match CPU side mappings, by defaul=
t
>>> we permit r/o ones. This then also means we now deal consistently with
>>> IO-APICs whose MMIO is or is not covered by E820 reserved regions.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> [integrated] v1: Integrate into series.
>>> [standalone] v2: Keep IOMMU mappings in sync with CPU ones.
>>>
>>> --- a/xen/drivers/passthrough/x86/iommu.c
>>> +++ b/xen/drivers/passthrough/x86/iommu.c
>>> @@ -275,12 +275,12 @@ void iommu_identity_map_teardown(struct
>>>      }
>>>  }
>>> =20
>>> -static bool __hwdom_init hwdom_iommu_map(const struct domain *d,
>>> -                                         unsigned long pfn,
>>> -                                         unsigned long max_pfn)
>>> +static unsigned int __hwdom_init hwdom_iommu_map(const struct domain *=
d,
>>> +                                                 unsigned long pfn,
>>> +                                                 unsigned long max_pfn=
)
>>>  {
>>>      mfn_t mfn =3D _mfn(pfn);
>>> -    unsigned int i, type;
>>> +    unsigned int i, type, perms =3D IOMMUF_readable | IOMMUF_writable;
>>> =20
>>>      /*
>>>       * Set up 1:1 mapping for dom0. Default to include only convention=
al RAM
>>> @@ -289,44 +289,60 @@ static bool __hwdom_init hwdom_iommu_map
>>>       * that fall in unusable ranges for PV Dom0.
>>>       */
>>>      if ( (pfn > max_pfn && !mfn_valid(mfn)) || xen_in_range(pfn) )
>>> -        return false;
>>> +        return 0;
>>> =20
>>>      switch ( type =3D page_get_ram_type(mfn) )
>>>      {
>>>      case RAM_TYPE_UNUSABLE:
>>> -        return false;
>>> +        return 0;
>>> =20
>>>      case RAM_TYPE_CONVENTIONAL:
>>>          if ( iommu_hwdom_strict )
>>> -            return false;
>>> +            return 0;
>>>          break;
>>> =20
>>>      default:
>>>          if ( type & RAM_TYPE_RESERVED )
>>>          {
>>>              if ( !iommu_hwdom_inclusive && !iommu_hwdom_reserved )
>>> -                return false;
>>> +                perms =3D 0;
>>>          }
>>> -        else if ( is_hvm_domain(d) || !iommu_hwdom_inclusive || pfn > =
max_pfn )
>>> -            return false;
>>> +        else if ( is_hvm_domain(d) )
>>> +            return 0;
>>> +        else if ( !iommu_hwdom_inclusive || pfn > max_pfn )
>>> +            perms =3D 0;
>>>      }
>>> =20
>>>      /* Check that it doesn't overlap with the Interrupt Address Range.=
 */
>>>      if ( pfn >=3D 0xfee00 && pfn <=3D 0xfeeff )
>>> -        return false;
>>> +        return 0;
>>>      /* ... or the IO-APIC */
>>> -    for ( i =3D 0; has_vioapic(d) && i < d->arch.hvm.nr_vioapics; i++ =
)
>>> -        if ( pfn =3D=3D PFN_DOWN(domain_vioapic(d, i)->base_address) )
>>> -            return false;
>>> +    if ( has_vioapic(d) )
>>> +    {
>>> +        for ( i =3D 0; i < d->arch.hvm.nr_vioapics; i++ )
>>> +            if ( pfn =3D=3D PFN_DOWN(domain_vioapic(d, i)->base_addres=
s) )
>>> +                return 0;
>>> +    }
>>> +    else if ( is_pv_domain(d) )
>>> +    {
>>> +        /*
>>> +         * Be consistent with CPU mappings: Dom0 is permitted to estab=
lish r/o
>>> +         * ones there, so it should also have such established for IOM=
MUs.
>>> +         */
>>> +        for ( i =3D 0; i < nr_ioapics; i++ )
>>> +            if ( pfn =3D=3D PFN_DOWN(mp_ioapics[i].mpc_apicaddr) )
>>> +                return rangeset_contains_singleton(mmio_ro_ranges, pfn=
)
>>> +                       ? IOMMUF_readable : 0;
>>
>> If we really are after consistency with CPU side mappings, we should
>> likely take the whole contents of mmio_ro_ranges and d->iomem_caps
>> into account, not just the pages belonging to the IO-APIC?
>>
>> There could also be HPET pages mapped as RO for PV.
>=20
> Hmm. This would be a yet bigger functional change, but indeed would furth=
er
> improve consistency. But shouldn't we then also establish r/w mappings fo=
r
> stuff in ->iomem_caps but not in mmio_ro_ranges? This would feel like goi=
ng
> too far ...

FTAOD I didn't mean to say that I think such mappings shouldn't be there;
I have been of the opinion that e.g. I/O directly to/from the linear
frame buffer of a graphics device should in principle be permitted. But
which specific mappings to put in place can imo not be derived from
->iomem_caps, as we merely subtract certain ranges after initially having
set all bits in it. Besides ranges not mapping any MMIO, even something
like the PCI ECAM ranges (parts of which we may also force to r/o, and
which we would hence cover here if I followed your suggestion) are
questionable in this regard.

Jan


