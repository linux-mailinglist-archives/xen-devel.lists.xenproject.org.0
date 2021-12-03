Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A4C46744A
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 10:50:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237232.411421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt5CS-0008Rt-GC; Fri, 03 Dec 2021 09:49:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237232.411421; Fri, 03 Dec 2021 09:49:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt5CS-0008PI-Cu; Fri, 03 Dec 2021 09:49:52 +0000
Received: by outflank-mailman (input) for mailman id 237232;
 Fri, 03 Dec 2021 09:49:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EuM9=QU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mt5CR-0008PC-3x
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 09:49:51 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b49a720-541e-11ec-b1df-f38ee3fbfdf7;
 Fri, 03 Dec 2021 10:49:50 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2051.outbound.protection.outlook.com [104.47.0.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-11-a1VoRgelPK23GsCUwZxcfQ-1; Fri, 03 Dec 2021 10:49:49 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4384.eurprd04.prod.outlook.com (2603:10a6:803:6f::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Fri, 3 Dec
 2021 09:49:47 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.028; Fri, 3 Dec 2021
 09:49:47 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P194CA0015.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.23 via Frontend Transport; Fri, 3 Dec 2021 09:49:46 +0000
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
X-Inumbo-ID: 5b49a720-541e-11ec-b1df-f38ee3fbfdf7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638524989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eqSXSstyLMTUQNI+LzHk8CyY/WovHMKTvBKvYKOjefM=;
	b=bdiTFYSgMmAZwXvjzdXsd014qBw79MgMQDRcqAuGmxCvPgdCmBFnd9FForvocA7IvqilNi
	Krk/pLCEVLMxwfLCUiyvNbHSuFPU6xvSe57Lg7yK9hmwBX2aL+6tU5715T2paEugqfadoC
	lMohxYTd9YBfNvSd7WAeOvKMnvFP6uo=
X-MC-Unique: a1VoRgelPK23GsCUwZxcfQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ac7I2tu+SKBfJEbFYD5aUo6xWrRj+QMwRlrrCGv4hkPtz2rG3xAUP8/BczqjFh5CNwATs2ECs24sHsDZA4l7bx6elM+KejZG2gGRhaCdSDqa+TMPj2MfZFGlz2c3WYSCLHfcv6X8G7roQuFLJ1oQEoBkTZPLJK+JW6yo5qiRQPIkxSRoILSTDg9yIkdAdh84KJCPuRq8ppLjNEso7exYLusQClR320j2PiilPeJBZ0tsSG+q/9OhF5KmtTC8CeUbMmlr2Qyu+QYtMg0h5UNeUBr2AmusLjHryrV3LyerMJM4aRUqWfsXcVP4IeoTTREf+p8wMVMI6sV/y1g5r8OnNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q48zdZyWDlR1289W+uk0J3K8xDTO3BiLFkx+IdDW/Rw=;
 b=mYkaBAxWBZO5/fB51YWCQ3mAKz2R+D05Dr2N9kveQshtXGDOBx6J2CRJpIdF4vfjgNQUpASWMK8+32bBdFj9DlchUTXE9E2b475kd6WI9bLYV4mnESN5lvVnVTboU0P+CXt6IqzljL+sHNTSFzR0DwvkmwD07qAhEgRY4uWCf0uPsGKJWXnqz/qfhQIoDdWwpQmqI5O5igS7EwHKlRa/NFLY8iYQtbpo9hf5zYmz2YSqdO0nssmSYMF6VP9py5OlF9I5d81epddh/ncHqXRQahyaWA25LX59zZsiDnHDIYD57W/G8XiiIW3xZf7V7iFmfWCaC98bx3KYsnGfA6g71w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <66539595-ded3-b60f-8892-dfb391621a1c@suse.com>
Date: Fri, 3 Dec 2021 10:49:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2 10/18] AMD/IOMMU: walk trees upon page fault
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <5d4a4cd8-ffb0-951a-c86d-98f659ab8d0b@suse.com>
 <YandfTCG9nkWoyrz@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YandfTCG9nkWoyrz@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P194CA0015.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1c64839-c6c3-4d3d-b7db-08d9b6423dae
X-MS-TrafficTypeDiagnostic: VI1PR04MB4384:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4384D6099EE04F894A416504B36A9@VI1PR04MB4384.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nPmPQpSUdAvhH6dUJhglJbSo3sRGf9igTjIXnGslipG0lYOQAtH38OGSQscN1gqVzQK9jqwCy1bDiVTBqib8Eo/SluRC5qnDCKIxx0ujQuqdxSdxcK5C0PcxXX3qk3HuZMCWChqqjO55PT2QK2W4COnd2oJnWNE1cPq3aJKJ25Vh53EZaUZXE4vnVVoVpLLAX8tlMRKkRRDJ+Gk67ok+kp9HyXDRiehmZJiiMyJcr6VoQlhMOE1OarTjnEex6okCMgRVvFR2tbuSGj/qfD3M+mKyfrgvTiANEbo2ELmbvXZcdCzAtCbzbSpgatnrlYso9/dhuH4Z5V1UelSeam2Lqmk2YqXuKov3eTzdC+OxCrNh6yeX2YQ3nFSHRNKgg4amt7Fl2kLfwQMvAHdh2SwCflKL/fiqKwIRbdCRlzyjJaFjwI3VtK6CqNRrURW7JU5RQCtasYV7jsZQuW3yMdKMBxRpGGs0KNcuzSh+sHYsq8n1u2c9pIDc8QTb2yRqwLsUqnN19ltHBPWILcwJzzwlPENEjS6cozbCMqNnnz6sYkncm5ZMLXLSpDZYn0Bv2Vw64Th50gSIPW5q0VFlOxy79y4GvgNbHUyttDpwrAdRXGsilHnvbrYpx1pJWhyQluEmYGfF6Pw0tS1nDI4i2OcDAaOsaNGTQrVW18fkSFjuz0GxhS+sAzji24e+hlcgo+UEJnZo+9acTSZtsBG3/aYaa0OB+SyvS6HBm8QDJ7126Ds=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6916009)(4326008)(508600001)(6486002)(86362001)(53546011)(16576012)(2906002)(2616005)(54906003)(956004)(26005)(8936002)(8676002)(83380400001)(316002)(66946007)(36756003)(186003)(38100700002)(5660300002)(66476007)(66556008)(31696002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oq/XtXXmJ5Q2r3pgokeyYoKbOOmDbaOI4yiOv8xLFGPIEUxNmlkpQ6SPwfhW?=
 =?us-ascii?Q?e71q7oDJb3DgTZEHkjfRtOFMHGn618Fcv2o3EMzp+MKyqQEB/p1cb78aAjFb?=
 =?us-ascii?Q?S4e+1RZX1Q6yWNdmT+HP9qIYYe7CJBUso6Ygqqpak2N+CyQT99YwNixOPSI7?=
 =?us-ascii?Q?B3HEIr/kQFFUG/lhSbt5k051+RveZ/kjNZmmfOm2tCYpXuMDmgLKM5QLtyGl?=
 =?us-ascii?Q?H2oqSSl80UALMXHz4zjVR9I49PCq2qy6keLpd59+2rm+VhcN4T8HPbiauYx6?=
 =?us-ascii?Q?+ssg2om+sCU8ppjKnBlRWtt38eonp1+0fvuHaUQ1Z9WkgV6ePu1eu2bzBPmo?=
 =?us-ascii?Q?Q5DK5/oN9YBLnsn7MGJECdwmSjazO4UzPiCEab60Sp6Jg68b2stZoW9HBOgr?=
 =?us-ascii?Q?lIKcpUoLBCPHydxe3Pi2Rf+knweNhQpGRAWjdGk2SNH4s907v5tvFNJZNTde?=
 =?us-ascii?Q?iNZMiLX/mw+uB9WZK0slPyKjBq6RI+8/dgpGuOSozHrqjy8jJkntL9g3Qwro?=
 =?us-ascii?Q?XyHCJfQnx2nXBfZM8W11zeCdTiAGjndua9OigafVeAN9/K/Moponrbp+fec/?=
 =?us-ascii?Q?+/VTGzd3LyWO7MYi9raMSlIeNjcu+2Bi1i1bw4DAh3PFEvoc9GuYOkjiL2u7?=
 =?us-ascii?Q?W21b5jjHWrBoSdW5vCbIZt06v7cRVWtePXm8kq69UvUznEq3j8mtpNTO2yDi?=
 =?us-ascii?Q?519mgbTTU0NEIdIjl//redqCKNMAeJoky2S6ihGKvObGYEDQZsgIIxxTywul?=
 =?us-ascii?Q?YVQSe0uaN7fNAfNdRdNAML5OZ7CVbYkrrlqG8QwfFBCB/HNjmnz1xfy86Ap9?=
 =?us-ascii?Q?n266Yr2ah/pfg73Qmezgte/JrgaB9cuUw/fiqn80DKbH9nVNIcsOkOA5MaZJ?=
 =?us-ascii?Q?d2IGJ1hrj+TcuHZIwUl+ASm7+yMTSN0bxdXmmZUsAEihlljP/+L9+ymeW7HP?=
 =?us-ascii?Q?qpgolF4WKJa2ukLi4F41jqNGEOPIQ5BSJ09zeM/b598VuEdarQnTRrFUTu8c?=
 =?us-ascii?Q?cTwM4DV20j2lTraPKDKVcbjIKuGtr5kLMUIZeVTnVJrO5tUSRz0ExizCSxw6?=
 =?us-ascii?Q?Q1TgYbDX7UwlOaSpewL3EMqm7gHXL57ybxwW8ZzDkIM+2H90Gx+/QE7WXlaA?=
 =?us-ascii?Q?8cvHclEgnKceV4M130aBn347q240NRK3BFyQ149Iyqj/Y8nXAAgpeJYKyumk?=
 =?us-ascii?Q?9wEZvqUXkxnpXChETyhvB9JfWGp/YyKx5/21mljhoMV57G5bYb33ESXWQhmh?=
 =?us-ascii?Q?yg6/qPqukLPMIz/xKvOZKla5+PCgf3lR/dpUQ1YRsPgNbghX8oRyDoAOy7jx?=
 =?us-ascii?Q?v8MrsCCLihkLxvUUXZIKpQmJSbpYdg6J4WpUYcQ+R1RHxlUyKq5tbdkiMvqD?=
 =?us-ascii?Q?REOpYWfi5RR4Fd1qEbgfUYAImZU6YqwFy/V/hwFuwx8quNwJJQkX5PacWbxR?=
 =?us-ascii?Q?Oz6q2t/8SlfCwzNeP47e6BYhlBTf9KjBgIt+zmWAsEXBlU0fDGovQQhEQ3pD?=
 =?us-ascii?Q?2MsI403jlhw9xeUkUmRVCdm7we+/i+B7j/rW1sLZ/uVf4QMmcOvIbQeiGivi?=
 =?us-ascii?Q?WPB0ksVUK436194b/7Mo3F/1gvETJc0zBBnMAbvMJieGXV+6wITjt/HNTw18?=
 =?us-ascii?Q?1xWVXH90RoXYcJh2bHyg/n8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1c64839-c6c3-4d3d-b7db-08d9b6423dae
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 09:49:46.9732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8jOgDwXKEtclrchB4PrmjdIKvb162K8lNtDF5cZ9xOs2XHvV6cWHx9DY7DJICEZX/bzUQ+3ouNAaySiCfEH8dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4384

On 03.12.2021 10:03, Roger Pau Monn=C3=A9 wrote:
> On Fri, Sep 24, 2021 at 11:51:15AM +0200, Jan Beulich wrote:
>> This is to aid diagnosing issues and largely matches VT-d's behavior.
>> Since I'm adding permissions output here as well, take the opportunity
>> and also add their displaying to amd_dump_page_table_level().
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/drivers/passthrough/amd/iommu.h
>> +++ b/xen/drivers/passthrough/amd/iommu.h
>> @@ -243,6 +243,8 @@ int __must_check amd_iommu_flush_iotlb_p
>>                                               unsigned long page_count,
>>                                               unsigned int flush_flags);
>>  int __must_check amd_iommu_flush_iotlb_all(struct domain *d);
>> +void amd_iommu_print_entries(const struct amd_iommu *iommu, unsigned in=
t dev_id,
>> +                             dfn_t dfn);
>> =20
>>  /* device table functions */
>>  int get_dma_requestor_id(uint16_t seg, uint16_t bdf);
>> --- a/xen/drivers/passthrough/amd/iommu_init.c
>> +++ b/xen/drivers/passthrough/amd/iommu_init.c
>> @@ -573,6 +573,9 @@ static void parse_event_log_entry(struct
>>                 (flags & 0x002) ? " NX" : "",
>>                 (flags & 0x001) ? " GN" : "");
>> =20
>> +        if ( iommu_verbose )
>> +            amd_iommu_print_entries(iommu, device_id, daddr_to_dfn(addr=
));
>> +
>>          for ( bdf =3D 0; bdf < ivrs_bdf_entries; bdf++ )
>>              if ( get_dma_requestor_id(iommu->seg, bdf) =3D=3D device_id=
 )
>>                  pci_check_disable_device(iommu->seg, PCI_BUS(bdf),
>> --- a/xen/drivers/passthrough/amd/iommu_map.c
>> +++ b/xen/drivers/passthrough/amd/iommu_map.c
>> @@ -363,6 +363,50 @@ int amd_iommu_unmap_page(struct domain *
>>      return 0;
>>  }
>> =20
>> +void amd_iommu_print_entries(const struct amd_iommu *iommu, unsigned in=
t dev_id,
>> +                             dfn_t dfn)
>> +{
>> +    mfn_t pt_mfn;
>> +    unsigned int level;
>> +    const struct amd_iommu_dte *dt =3D iommu->dev_table.buffer;
>> +
>> +    if ( !dt[dev_id].tv )
>> +    {
>> +        printk("%pp: no root\n", &PCI_SBDF2(iommu->seg, dev_id));
>> +        return;
>> +    }
>> +
>> +    pt_mfn =3D _mfn(dt[dev_id].pt_root);
>> +    level =3D dt[dev_id].paging_mode;
>> +    printk("%pp root @ %"PRI_mfn" (%u levels) dfn=3D%"PRI_dfn"\n",
>> +           &PCI_SBDF2(iommu->seg, dev_id), mfn_x(pt_mfn), level, dfn_x(=
dfn));
>> +
>> +    while ( level )
>> +    {
>> +        const union amd_iommu_pte *pt =3D map_domain_page(pt_mfn);
>> +        unsigned int idx =3D pfn_to_pde_idx(dfn_x(dfn), level);
>> +        union amd_iommu_pte pte =3D pt[idx];
>=20
> Don't you need to take a lock here (mapping_lock maybe?) in order to
> prevent changes to the IOMMU page tables while walking them?

Generally speaking - yes. But see the description saying "largely
matches VT-d's behavior". On VT-d both the IOMMU lock and the mapping
lock would need acquiring to be safe (the former could perhaps be
dropped early). Likewise here. If I wanted to do so here, I ought to
add a prereq patch adjusting the VT-d function. The main "excuse" not
to do so is/was probably the size of the series.

Jan


