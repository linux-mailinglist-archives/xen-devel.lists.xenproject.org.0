Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BD2467459
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 10:56:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237237.411433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt5IQ-0001Q6-7Q; Fri, 03 Dec 2021 09:56:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237237.411433; Fri, 03 Dec 2021 09:56:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt5IQ-0001Mt-2n; Fri, 03 Dec 2021 09:56:02 +0000
Received: by outflank-mailman (input) for mailman id 237237;
 Fri, 03 Dec 2021 09:56:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EuM9=QU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mt5IO-0001Mn-HC
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 09:56:00 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 376532da-541f-11ec-976b-d102b41d0961;
 Fri, 03 Dec 2021 10:55:59 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2174.outbound.protection.outlook.com [104.47.17.174]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-37-XJ5R0sDqNpy33WKy95PwOA-1; Fri, 03 Dec 2021 10:55:58 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3775.eurprd04.prod.outlook.com (2603:10a6:803:1a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Fri, 3 Dec
 2021 09:55:56 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.028; Fri, 3 Dec 2021
 09:55:56 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P191CA0104.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::45) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.11 via Frontend Transport; Fri, 3 Dec 2021 09:55:55 +0000
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
X-Inumbo-ID: 376532da-541f-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638525359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XQLXNstpDZItO/z6896aK9fDJ8ZxkEeDypZSaiy9s7U=;
	b=mRWPFBAMudeCKBWY8IBLrLRStCHsbNXhTXM/4cTRxuYMFifIyXx3q0Sh++OdFDBLjRXlcP
	NmJedobY+ctIsneQt/0TLxZG88iq8hZl7mtygArHVo728KyCPJIxW+V61Ok3/1c5rwfQTr
	MSi+8zpCucyf4LfYcWSRt0+BeV1sdX4=
X-MC-Unique: XJ5R0sDqNpy33WKy95PwOA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SsryuQBjpqpSArOvOJdeK+LqGad5Iv57oy82yB5fZBc3I7TInpY7qsrJfo0o/4mvrT/fvFyKxzBXZHbb8OWJ/Y8maBvbp2jp7uE6Roj79TQ5rFgHY6TuxNWP66+bwxJJwGX2jIL4l5DSlvX0811PL7i2nYLwpRyJrFhouV7S8Ph2t+2XRNF19ZDc77Qlnrn6CQKeYIP5zzDZOb/Yo9/eOC3bw05gPoKw8200YeV9mhbWeFw/dniLH0quckQaNtnQHTaweRFsLmLvquiaSGF/SX4OyFHGrv9MvGKKMaP83ujKkWvUD5kaieyD1aq1un/R8UW0LVVsj6Rxcs59jkqvEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Al3bQW6tWKcg9dUEjlH6lASPwe9aXC2RzR4lbGptWvc=;
 b=S9cy82X8k714V91gcNMi36viVDOSt6pGzvFETcRH1EPuB3/tMPOXd3fHtb+dVKfFBWYjNH6yXIft6pDCgKkz3jcr7HCS6ENAoSdTWUAcTt1ZhdPY3a5+D2tecbYGqWVKQ/3GulEH3JiuqPHX9MHXp+pPxOJKb0XdJIROb5TfmCLXQu0CS7AjmRse9oP0KeGZPZEvdTCNzEJEuJD4jQMOndGL2i+NeHCRIW5IXsizMtJxqy3fShskmcn0XS/og9DSN7PGv0uVpWw5batLbjQz9TuigcHWOzvEnCULOrvBiw6woLIYWLfx3pVOKgXOPA71/9PYn2z39xYGaFGe1oZHMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b429c9f9-83f4-57e1-010e-59181ec93ce8@suse.com>
Date: Fri, 3 Dec 2021 10:55:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2 10/18] AMD/IOMMU: walk trees upon page fault
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <5d4a4cd8-ffb0-951a-c86d-98f659ab8d0b@suse.com>
 <YandfTCG9nkWoyrz@Air-de-Roger>
 <66539595-ded3-b60f-8892-dfb391621a1c@suse.com>
In-Reply-To: <66539595-ded3-b60f-8892-dfb391621a1c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P191CA0104.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8a::45) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 062c77b2-703c-4553-219b-08d9b64319e1
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3775:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3775661CA788FE2898636005B36A9@VI1PR0402MB3775.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	x9FHp0bTLMDI/a5IZBVqoeWlGjDm+fHx8fdTanWs/ZRFgHnYi/3UqLM7GRxY1HPVbb0b8EGGICBQfPAYibP4CwE+6ZeN6D/WBpmz8vJNKD1pu+d5Q4eCiqpaXO2XADhkHOFo1YqMZ6rsKTega9CaBKr4n2kvlcFoqOqvXAedYsMEDY0BNoB1bFkZ1o22tbsZnzRR6/GBw9rrpcNFde08wmWi6rBQfmd2ygxal98JQxdzBZRPNiS4gxWeVke8DM517dPaubwDurnXA6cNxQ1C+fJuPcfsx8To2lk8d2B71YoGwFENLbaBCLdkNNPh1Y2IogXLqF8EkWg8+Echqlcu48Ch4hbdAWAf/cskhAIwJHhNewDbU70r0X3PaELOowpj80DRsvNTSscmMx9ce4z/HTDYbbESWHeubpk79LrnYoyrLvR37BQNYT1A7iz0jAs5rmTCh+9Ttm4ITgN0ffLvebvbj+eVRmaPPC3h7ozLx8pHQ6G2xpfOIxqlY6YQofy24SWO1D54GuVZHktVF6ULp9Q8hsKvW78MwLTyKUle0L/pB8TKc5qhk6RwNpdtYnJ5DWt3y5cp70m5SDhkRGkd4cMBum3RIFZtnhJ3l4WXPPCKKBv6OXAkXxr0Ro7UmsK9AzGVOJkk86GYrV/vI5WW3Ii+rJowNDjdEoe47NQ7479zkSbzTlHod79sLPkWbKvvOwxo/f6XrtdhqFrvXXrrIcUwDEKJgNR/Qrj7BA3fd/E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(83380400001)(38100700002)(66946007)(53546011)(186003)(2906002)(316002)(956004)(31686004)(54906003)(4326008)(36756003)(16576012)(6486002)(66476007)(2616005)(8936002)(31696002)(508600001)(5660300002)(66556008)(6916009)(86362001)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?baxELy77Y/7eV+jQILd8CXmFABpTcYUwQfqlS8WbYuXSU7ARodukMlx6siyR?=
 =?us-ascii?Q?ieu8k2zCTNit26cdDeSs9KYomDzdaS74whm4SRUeRl3Vyfqt9HlM14QpbpH4?=
 =?us-ascii?Q?vrLuOtCsg0CP1zpF6d1Okfa0W0oQI9Ln/dQw9FwlodDhi3e9W8X+g27uivH3?=
 =?us-ascii?Q?/HPSEHZ1vvib6UsUDmYHRy8YDipyFXr8Y5CCUhDZh4co9Gym46fp5yoNVrya?=
 =?us-ascii?Q?oTTDE8zPfeuzqk+zABt1esVafrRs8KhYL9DC8GMCoI9l0j7DP39QFdFek/Dv?=
 =?us-ascii?Q?QCBJJyVxZAAyl5BtE8KmiQ49UcCexbXtW0LjtQrQMohZUqT9ASaYdIQlQi9b?=
 =?us-ascii?Q?xHABR5K3BqtrQCivgoXUy+z16r/BCUCNTjt5wycB9gAMSWk3OwKnwM4hLEzn?=
 =?us-ascii?Q?afaevIpusSI1/7ltYCpGIn5//0C6BlBNgSIfvU0CrmacltGBRvMlRTiOQr1k?=
 =?us-ascii?Q?Vato9FDqifwUpAnIPb03f5/xzLiBx6olY51/jQDiBSn+2veGZ0fvCkL8yV13?=
 =?us-ascii?Q?PWOiWSG1ey7helVkzAKx74OdNpxC+6i5SaGecrbBd/FsNCup00wg5sq/b0X5?=
 =?us-ascii?Q?18PWjfARqH51q4rsuuYQ3h5V48f94Jt40LsWAO7HGjxfMN8HFee849WmNcpS?=
 =?us-ascii?Q?9itSy88Gj6Gs3KmHefyYESGH90MNPKKGXFa1cQTJ1w7U6GXVJsqiVKZg7M2r?=
 =?us-ascii?Q?k8//9KnDfD0M9/CpB2cssHXz7rePWZhym4Sa2DkV2sTy5UYRgMc7nJbJaXZD?=
 =?us-ascii?Q?a1ex+xIX8tsqTWp3Unr0R4YKsCrs7AWyakKkqXdR19AR+dLh8NP7nIG4C0vI?=
 =?us-ascii?Q?G51Tn8qfLgEeYZ/g3i9GMFtGo5R8hB8Kfiq0+Ao+tPC4N/OlpRGXLg0K68vY?=
 =?us-ascii?Q?i4XI29yFslGCGMPc5xG42INW9tWwO1FDOVyt50L8WGvexitXoSobb017tEKc?=
 =?us-ascii?Q?gCwuC4XQCJUhs1eX9uF87Jd2m2bb3+pZcRHa9v4NKTL2C2Qr1wK1z6AveUYN?=
 =?us-ascii?Q?hlJYgR/azNEp/6fjky3d1nChs+txR9XqUTmNX4pCB2Jv49w+6bAsXW9FUQLC?=
 =?us-ascii?Q?3biwOJpTCzuw/QWSUcVbFU5vMSDulK25QJA5PAYotUOVhCKlg4HD1AktYqZj?=
 =?us-ascii?Q?i83FfKbDe6lc04wMOa6Voq9lqMyHyy3D8iOKO/LzuBQ+JCLQiTk1/23Y1fDy?=
 =?us-ascii?Q?flJ9FEmeEwiB79egoE1oH9jCfHLJ9/786xnUuaq21f979DMKJQBHPTUp3vh3?=
 =?us-ascii?Q?DJo4FJAjHNOuiilE3w4lL+m3k+V8RwMpfBqM+uzv+2qxIo5MlCki2PE/3M4c?=
 =?us-ascii?Q?+KGocUAheC04Vxxh14vbXIVjzjzosbxF3QTmCI8d+Z2ehXEZZfptMgBRYAmx?=
 =?us-ascii?Q?o7gmNeEiRXuhiE7kc995lW1zidAU2ppLRytM1HRX5B6uRcnGon9q1UaGw/RO?=
 =?us-ascii?Q?Q9s3XxEENdQeszgWAZNnW3FKEoRXO7K8ZyhkRO5vzxB7Dj837ekmAMjJqwsz?=
 =?us-ascii?Q?LI7qnlJhaI2Q64WFTLcEIqiAzQCDEH/3YQuWP1NXmkEBYrJVP9oIPubLYf9W?=
 =?us-ascii?Q?863aBM6ZZDuoxZoDA7teu85xvbQl4EHwwWlnOQACuAzQNrK2AKs+2umccV7H?=
 =?us-ascii?Q?sm5GR3o+RAYSb/RyXY7o6VE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 062c77b2-703c-4553-219b-08d9b64319e1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 09:55:56.4413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NB9kXCULz8KiAauPKILVa3eTtUoXAzDF1fOvMG3177ALQEcOcm6ElvftKWkLdVxceH8SwNvldX4hvkiESlWEUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3775

On 03.12.2021 10:49, Jan Beulich wrote:
> On 03.12.2021 10:03, Roger Pau Monn=C3=A9 wrote:
>> On Fri, Sep 24, 2021 at 11:51:15AM +0200, Jan Beulich wrote:
>>> This is to aid diagnosing issues and largely matches VT-d's behavior.
>>> Since I'm adding permissions output here as well, take the opportunity
>>> and also add their displaying to amd_dump_page_table_level().
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> --- a/xen/drivers/passthrough/amd/iommu.h
>>> +++ b/xen/drivers/passthrough/amd/iommu.h
>>> @@ -243,6 +243,8 @@ int __must_check amd_iommu_flush_iotlb_p
>>>                                               unsigned long page_count,
>>>                                               unsigned int flush_flags)=
;
>>>  int __must_check amd_iommu_flush_iotlb_all(struct domain *d);
>>> +void amd_iommu_print_entries(const struct amd_iommu *iommu, unsigned i=
nt dev_id,
>>> +                             dfn_t dfn);
>>> =20
>>>  /* device table functions */
>>>  int get_dma_requestor_id(uint16_t seg, uint16_t bdf);
>>> --- a/xen/drivers/passthrough/amd/iommu_init.c
>>> +++ b/xen/drivers/passthrough/amd/iommu_init.c
>>> @@ -573,6 +573,9 @@ static void parse_event_log_entry(struct
>>>                 (flags & 0x002) ? " NX" : "",
>>>                 (flags & 0x001) ? " GN" : "");
>>> =20
>>> +        if ( iommu_verbose )
>>> +            amd_iommu_print_entries(iommu, device_id, daddr_to_dfn(add=
r));
>>> +
>>>          for ( bdf =3D 0; bdf < ivrs_bdf_entries; bdf++ )
>>>              if ( get_dma_requestor_id(iommu->seg, bdf) =3D=3D device_i=
d )
>>>                  pci_check_disable_device(iommu->seg, PCI_BUS(bdf),
>>> --- a/xen/drivers/passthrough/amd/iommu_map.c
>>> +++ b/xen/drivers/passthrough/amd/iommu_map.c
>>> @@ -363,6 +363,50 @@ int amd_iommu_unmap_page(struct domain *
>>>      return 0;
>>>  }
>>> =20
>>> +void amd_iommu_print_entries(const struct amd_iommu *iommu, unsigned i=
nt dev_id,
>>> +                             dfn_t dfn)
>>> +{
>>> +    mfn_t pt_mfn;
>>> +    unsigned int level;
>>> +    const struct amd_iommu_dte *dt =3D iommu->dev_table.buffer;
>>> +
>>> +    if ( !dt[dev_id].tv )
>>> +    {
>>> +        printk("%pp: no root\n", &PCI_SBDF2(iommu->seg, dev_id));
>>> +        return;
>>> +    }
>>> +
>>> +    pt_mfn =3D _mfn(dt[dev_id].pt_root);
>>> +    level =3D dt[dev_id].paging_mode;
>>> +    printk("%pp root @ %"PRI_mfn" (%u levels) dfn=3D%"PRI_dfn"\n",
>>> +           &PCI_SBDF2(iommu->seg, dev_id), mfn_x(pt_mfn), level, dfn_x=
(dfn));
>>> +
>>> +    while ( level )
>>> +    {
>>> +        const union amd_iommu_pte *pt =3D map_domain_page(pt_mfn);
>>> +        unsigned int idx =3D pfn_to_pde_idx(dfn_x(dfn), level);
>>> +        union amd_iommu_pte pte =3D pt[idx];
>>
>> Don't you need to take a lock here (mapping_lock maybe?) in order to
>> prevent changes to the IOMMU page tables while walking them?
>=20
> Generally speaking - yes. But see the description saying "largely
> matches VT-d's behavior". On VT-d both the IOMMU lock and the mapping
> lock would need acquiring to be safe (the former could perhaps be
> dropped early). Likewise here. If I wanted to do so here, I ought to
> add a prereq patch adjusting the VT-d function. The main "excuse" not
> to do so is/was probably the size of the series.

Which in turn would call for {amd,vtd}_dump_page_tables() to gain proper
locking. Not sure where this would end; these further items are more and
more unrelated to the actual purpose of this series (whereas I needed the
patch here anyway for debugging purposes) ...

Jan


