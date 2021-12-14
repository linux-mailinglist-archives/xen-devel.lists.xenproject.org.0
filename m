Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8134E4745F3
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 16:06:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246812.425642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx9N0-0003On-Pc; Tue, 14 Dec 2021 15:05:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246812.425642; Tue, 14 Dec 2021 15:05:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx9N0-0003Md-Ku; Tue, 14 Dec 2021 15:05:34 +0000
Received: by outflank-mailman (input) for mailman id 246812;
 Tue, 14 Dec 2021 15:05:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pVj/=Q7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mx9Mz-0003MX-BI
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 15:05:33 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 480b3dde-5cef-11ec-85d3-df6b77346a89;
 Tue, 14 Dec 2021 16:05:32 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2054.outbound.protection.outlook.com [104.47.2.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-37-7Fvbs2vmPoaQMb7XzMBq6w-1; Tue, 14 Dec 2021 16:05:30 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2446.eurprd04.prod.outlook.com (2603:10a6:800:4e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.15; Tue, 14 Dec
 2021 15:05:29 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4778.018; Tue, 14 Dec 2021
 15:05:29 +0000
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
X-Inumbo-ID: 480b3dde-5cef-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639494331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OyJ+Wbqp164NKnahUrTP17xVfBzStMIpJ8JrKNVysVQ=;
	b=QBEX5PUvIdgupVgRwZHD4KZ2nxDGGpv5ftEQxu/V8Do4zWWHgfE+uD0UW+oy6OR+Jjn7/D
	gJW/TYcMCIw0vXHqjBtX0+Tk9pn/d8i0wPGdvNcx/MhM/0dCXnqdbra+fMAfsFy3BcsyD7
	eC8DbW4/loOR5avaUZSM5bzx2BDYrcY=
X-MC-Unique: 7Fvbs2vmPoaQMb7XzMBq6w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e0mg2JjXLXDD7HE53879p1t60/oMhZ595EzxAOIgu4dLKvWRzuH9o69RjllXDBtqMSAB/pAlGU9Zu2Q+9IiNJY0ReEHVn9T6aOO7sXOj6+3aVnFLOZpFZnkLIVSPFHFPnqOko3wEHPoZfyz1keCynMknW7MnVCIu07GsPkpZEdIfOvbzaFte0l9wjOKICEjZp3Epa0IQh0xHkbFOUn3dHKrFfAeDOHjRTGSSBvG53PsF/e0zyKwemTj7Sd3MMwMK+Cp+ob+nFNab1YF9Xh1HTihv9fsVYFNnryIDrnVpcIyfIijkpcmnDpKnNPlBOC8W79NA3OFu6LVIDd8hFeOnQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vTLdYKmzRkDQfscq7wXpk9Qe9lHGXyErjVwWdJjcN/o=;
 b=JJsEdG4PPXScyqVF+fY62UtK3DWvlxcP85vQAJOXXO3efDCfeZ6v3btfPEzg2CzheEFNxMvbhbp/YFBlGpHQb6lNr0o++fyCwRUFtvv3XVNRiGyXgUQdKTuRFgLa539xkzEMsfPa7WYzoZGwH0U6UKcGT+QCLFpi8u0C0upm7JjoWaquperHfZ6B7yV6jso9DLl3XgC3Rz+VIgEuxzSY+dff7wUUDDdThIp++lkzLPwb+7+mpDg31mDh9E0/eRla1GvoxtFW8Auw0ky5QCL3Mn4A3Le5h8egH1XrcyrBOJKWK54ROHTC4NW8nX0GfWriqY7UuOAMadZtA339bTkt2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fb221da6-2ad5-e298-c582-364943b95198@suse.com>
Date: Tue, 14 Dec 2021 16:05:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 15/18] IOMMU/x86: prefill newly allocate page tables
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Kevin Tian <kevin.tian@intel.com>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <2656844d-47cc-70c3-d7ce-7d83967d576e@suse.com>
 <YbivUH/Er0o2PwsG@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YbivUH/Er0o2PwsG@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0701CA0067.eurprd07.prod.outlook.com
 (2603:10a6:203:2::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e316d130-3e2d-4e39-6d52-08d9bf132a8f
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2446:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB24462A77166A76ADCA1592B0B3759@VI1PR0401MB2446.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Gmu6Gxz8BgYmsyF2CgHshFp6xp9impx3f/afkUqwqEXXzbGkj/Gt3TX+Og25OpxypTlqw27wTx39p2hqc9ho4w44SYDuwxMlCwiaDQyrkVIeYv9e0KSsuWGQztaiA51q6QM7HWjBp1+/5MYLQCrKtmSYevPS/+BAjezEa5bk08tPbjQuKukT33+lbpz8EoKjCXUt+z4sNf4Xeq+2+Bay15iIj6+OH/j6Nsx+TM0Ix94QGwyIFYwOmu6R4lV53xlG0KcmmnWwyekB2EABQkms34Mt27tGBEL78ssytMDcU7GbRPaKzgL9zRnVM5xjiliYDxP8OaiHeCpOAqGnCThX8Pqp5gAYswI/InQoN92WTeAiC01FVcqkHW4hxKnexD+Ys5fCNesyrjBi4Tq+/6B38tgb+pzS9KHaZwAB/0lU5/zmRwbd2+1KCcFc1JSioaNy7g3IUADkVQlf6Oujj+HqXPB1IcwRdGL7xnceptdXDtnGj4Vd2rr4oWr0G8WhKoNn+8QVKKt5A0rg0i+DleVHZIikAUg9nVkIyOk2wwSJvqIt8HAfW4fU7vZLiD0j9fm0fev34GSpXZNModtf9dWhSCNwzWA5i1pIOVUvLIYCFoo9yHJsF6t/iAxhWs8LG2IcmdG+ZgtYKeuQ7aJd4CkGDWwSjDZHV3OjiucJvY6Ugps/o8BpcYuJYZ6CxqorlPqqMUFhfkLUgTr2ruvg2sV2VuEJcA72Cj32fm92JP0to+c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(8676002)(31696002)(508600001)(4326008)(2906002)(66476007)(6916009)(66946007)(66556008)(31686004)(2616005)(54906003)(316002)(38100700002)(83380400001)(5660300002)(26005)(36756003)(186003)(6486002)(6506007)(53546011)(86362001)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?u9zjwjsKDdPYgxFPv1b07/ABt8YZBVkFkWDlM9Cag/OvWecaIIWz4J/kKuz8?=
 =?us-ascii?Q?ews/ctn4fHE5Mlm8P8kJVviCjb0RF3FA4dXNaUvpENdS7urgV8RGJarv/Hxi?=
 =?us-ascii?Q?3tv0pT89prObh5kUibbrNyBIK8rqVpEgqJzGjfSPhX3JJo9+OeqV9NxqD7qe?=
 =?us-ascii?Q?rDyRqObye/otPx9fimrsbaiY/X0dnJB89j9XqdL1jOYlqrrny/Z/yyKVwOgc?=
 =?us-ascii?Q?J/xg8JHQoYs5rbrZdA7SunfpAFY+xU1vTF7+3TRwFHvbx9aUtB3Y8zAQUcMF?=
 =?us-ascii?Q?3L6I5y0X9NefBJvsNMPEDYBN8iApcBybHjpuQ+Nd4SqOC0vTTGsBNtgtSda5?=
 =?us-ascii?Q?vanfLJjjqWg4Ou8n3yojJ+nM4BAjDXsgWqbv6rpyIeZ7lUD8ceRAeN3WsJNw?=
 =?us-ascii?Q?3Er/XYfxbJDGhVWc+wYXiRGo5xyPS+yJhD5dd5VebpXXBv3ppjA0tTfW1oBs?=
 =?us-ascii?Q?ACBAJTtWJZNTZQ4qKJmP0PMMrFf+hFkNN3E/fsD2QgUkgmNpiVRPEjlM5hJM?=
 =?us-ascii?Q?HRB/D/Kpr/CxmUd2qyViMWW5xzSVY2X746Vzo97BYQLKCXELpkWkdfS16htR?=
 =?us-ascii?Q?qlLixuwcxusrXyegGe6uiwDrV6aEdws7mG44Puae4XP58vJ5WA4AUA1Bm162?=
 =?us-ascii?Q?RVJwdVfl6TTRw04s1p70kiW7IxLbqAwXaVGquESzzCv+UQtrlAHXe1GqZusV?=
 =?us-ascii?Q?+exI2/5cVP5IwQjg+5d+tE/d5zklK93KlG7QG6Pz9mCddo3JOABaZHJ9NN3c?=
 =?us-ascii?Q?l/lHPQ4YRHoyj0Lovqf1mZ4x9ptozDgPJ0WiXQru9WTsM+pI3ZcidIDsBAmF?=
 =?us-ascii?Q?MX4UnvLCkM1PH22VrDeNe2PmJQ7EkRi1gD1d1JcdgtkozeMXvVPKOFwn/qEO?=
 =?us-ascii?Q?1MP6gR4/tAZk5PZp7m8Xvh+JClMO0K3vUIOry9qolCxIWUKRrghHcG5KtBLz?=
 =?us-ascii?Q?nu+aepG98Rvs/T2hY6frsJJmPj4fYtDH5bn71nGRA9WOEqYSzh9qCcmh4JhQ?=
 =?us-ascii?Q?xwZrhRsOXqFV4cFKDOp2MpTFIIqQu2oSCUxzdrSIVzZmbSVNpv5wDb0SP6zI?=
 =?us-ascii?Q?Y/iHvVcoo8NjFfqJOdvI5DFYhq2O9zlAYIRuPac/NJrK9RLTpYPRN3t98b0i?=
 =?us-ascii?Q?HLUMxPqZgIiSdINupjsl4986QdmTAHQ2uHeCH6JyucasgaBLiP6QflVDbkFF?=
 =?us-ascii?Q?pvK5iax/bVrT36Ty8eVnpKPDsRQ6Y0I9Z+jaxMM0bIhZci2vvfhrKU4wt5Bc?=
 =?us-ascii?Q?A8uQfZaSLxbn99XhHqEAX6H+pwSg8zYMg85i7m1u80MtyRUYPcag9YgWMHYZ?=
 =?us-ascii?Q?TIxgbqoQb/T6fjq1EE2XetxQGjNmCMNaPLQECfVnYup2qZF9r2KoEXn67h4e?=
 =?us-ascii?Q?cOCZK3rPZtCjQTCQhDl53weoRZEb4lO2zzmBd3k3BPyNc+xTDuhcapI185gx?=
 =?us-ascii?Q?ck7dqR4qySi+00dYaBAoaT7LgGWV0U26ZQSNKannMC6tpCtB7lGQ3v6ipQ5g?=
 =?us-ascii?Q?BoNkHDqroMlZmtvdHkidIzF10HyLpvpJMa6rjzz0XH2+WMDuqaCv41kCX3Zy?=
 =?us-ascii?Q?eTBgS1k5Z5yhjOybKYwv085u/vp6sWRhYnnZht7wsotwUq4lyJFKw5DGugmx?=
 =?us-ascii?Q?108vNNnuaDkryMmRbVl3h6w=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e316d130-3e2d-4e39-6d52-08d9bf132a8f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 15:05:29.0051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: myAhpSR8RTSrQux/nRrwhAJn63bdkfKZVFa0xurxQmqrNhyALbZeZdZ333R53HWNYoSw7NsSr7CG+5y7oH1MSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2446

On 14.12.2021 15:50, Roger Pau Monn=C3=A9 wrote:
> On Fri, Sep 24, 2021 at 11:54:58AM +0200, Jan Beulich wrote:
>> Page table are used for two purposes after allocation: They either start
>> out all empty, or they get filled to replace a superpage. Subsequently,
>> to replace all empty or fully contiguous page tables, contiguous sub-
>> regions will be recorded within individual page tables. Install the
>> initial set of markers immediately after allocation. Make sure to retain
>> these markers when further populating a page table in preparation for it
>> to replace a superpage.
>>
>> The markers are simply 4-bit fields holding the order value of
>> contiguous entries. To demonstrate this, if a page table had just 16
>> entries, this would be the initial (fully contiguous) set of markers:
>>
>> index  0 1 2 3 4 5 6 7 8 9 A B C D E F
>> marker 4 0 1 0 2 0 1 0 3 0 1 0 2 0 1 0
>>
>> "Contiguous" here means not only present entries with successively
>> increasing MFNs, each one suitably aligned for its slot, but also a
>> respective number of all non-present entries.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Obviously this marker only works for newly created page tables right
> now, the moment we start poking holes or replacing entries the marker
> is not updated anymore. I expect further patches will expand on
> this.

Well, until there's a consumer of the markers, there's no need to
keep them updated. That updating is indeed going to be added in
subsequent patches. I've merely tried to split off pieces that can
go one their own.

>> --- a/xen/drivers/passthrough/amd/iommu-defs.h
>> +++ b/xen/drivers/passthrough/amd/iommu-defs.h
>> @@ -445,6 +445,8 @@ union amd_iommu_x2apic_control {
>>  #define IOMMU_PAGE_TABLE_U32_PER_ENTRY	(IOMMU_PAGE_TABLE_ENTRY_SIZE / 4=
)
>>  #define IOMMU_PAGE_TABLE_ALIGNMENT	4096
>> =20
>> +#define IOMMU_PTE_CONTIG_MASK           0x1e /* The ign0 field below. *=
/
>=20
> Should you rename ign0 to contig_mask or some such now?

Not sure. I guess I should attach a comment linking here.

> Same would apply to the comment next to dma_pte for VT-d, where bits
> 52:62 are ignored (the comments seems to be missing this already) and
> we will be using bits 52:55 to store the contiguous mask for the
> entry.

Same here then.

>> --- a/xen/drivers/passthrough/amd/iommu_map.c
>> +++ b/xen/drivers/passthrough/amd/iommu_map.c
>> @@ -116,7 +116,19 @@ static void set_iommu_ptes_present(unsig
>> =20
>>      while ( nr_ptes-- )
>>      {
>> -        set_iommu_pde_present(pde, next_mfn, 0, iw, ir);
>> +        ASSERT(!pde->next_level);
>> +        ASSERT(!pde->u);
>> +
>> +        if ( pde > table )
>> +            ASSERT(pde->ign0 =3D=3D find_first_set_bit(pde - table));
>> +        else
>> +            ASSERT(pde->ign0 =3D=3D PAGE_SHIFT - 3);
>=20
> You could even special case (pde - table) % 2 !=3D 0, but this is debug
> only code, and it's possible a mod is more costly than
> find_first_set_bit.

Not sure why I would want to special case anything that doesn't need
special casing. The pde =3D=3D table case needs special care because there
find_first_set_bit() cannot be called.

>> @@ -450,7 +450,28 @@ struct page_info *iommu_alloc_pgtable(st
>>          return NULL;
>> =20
>>      p =3D __map_domain_page(pg);
>> -    clear_page(p);
>> +
>> +    if ( contig_mask )
>> +    {
>> +        unsigned int i, shift =3D find_first_set_bit(contig_mask);
>> +
>> +        ASSERT(((PAGE_SHIFT - 3) & (contig_mask >> shift)) =3D=3D PAGE_=
SHIFT - 3);
>> +
>> +        p[0] =3D (PAGE_SHIFT - 3ull) << shift;
>> +        p[1] =3D 0;
>> +        p[2] =3D 1ull << shift;
>> +        p[3] =3D 0;
>> +
>> +        for ( i =3D 4; i < PAGE_SIZE / 8; i +=3D 4 )
>> +        {
>> +            p[i + 0] =3D (find_first_set_bit(i) + 0ull) << shift;
>> +            p[i + 1] =3D 0;
>> +            p[i + 2] =3D 1ull << shift;
>> +            p[i + 3] =3D 0;
>> +        }
>=20
> You could likely do:
>=20
> for ( i =3D 0; i < PAGE_SIZE / 8; i +=3D 4 )
> {
>     p[i + 0] =3D i ? ((find_first_set_bit(i) + 0ull) << shift)
>                  : ((PAGE_SHIFT - 3ull) << shift);
>     p[i + 1] =3D 0;
>     p[i + 2] =3D 1ull << shift;
>     p[i + 3] =3D 0;
> }
>=20
> To avoid having to open code the first loop iteration.

I could, but I explicitly didn't want to. I consider conditionals
inside a loop which special case just the first (or last) iteration
quite odd (unless they really save a lot of duplication).

> The ternary
> operator could also be nested before the shift, but I find that
> harder to read.

If I was to make the change, then that alternative way, as it would
allow to avoid the addition of 0ull:

    p[i + 0] =3D (i ? find_first_set_bit(i)
                  : PAGE_SHIFT - 3ull) << shift;

I could be talked into going that route (but not the intermediate
one you've suggested).

Jan


