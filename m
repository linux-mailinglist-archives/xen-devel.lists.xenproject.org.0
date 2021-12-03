Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFF9467469
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 10:59:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237248.411454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt5Lh-0002lL-U9; Fri, 03 Dec 2021 09:59:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237248.411454; Fri, 03 Dec 2021 09:59:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt5Lh-0002if-Qc; Fri, 03 Dec 2021 09:59:25 +0000
Received: by outflank-mailman (input) for mailman id 237248;
 Fri, 03 Dec 2021 09:59:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EuM9=QU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mt5Lg-0002C7-70
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 09:59:24 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b084e227-541f-11ec-b1df-f38ee3fbfdf7;
 Fri, 03 Dec 2021 10:59:22 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2053.outbound.protection.outlook.com [104.47.0.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-34-S7LYzUvYNg6BYry-1T4A1w-1; Fri, 03 Dec 2021 10:59:22 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4352.eurprd04.prod.outlook.com (2603:10a6:803:4a::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Fri, 3 Dec
 2021 09:59:20 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.028; Fri, 3 Dec 2021
 09:59:20 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0002.eurprd06.prod.outlook.com (2603:10a6:20b:462::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.11 via Frontend Transport; Fri, 3 Dec 2021 09:59:20 +0000
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
X-Inumbo-ID: b084e227-541f-11ec-b1df-f38ee3fbfdf7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638525563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wCMK48uKgAuqLl9dq2R1ke66y/Wm4yaI7xna1jQNkXw=;
	b=nTlPkScOJ4AZ+C2azyYjiRLRvBpL43eJwBw7kBcCE0F6dOk0uu0SOvszBDdwofi56lyvJl
	QbPIJjNDjkugmUp5ubxFgzubrX8St0HrpneqNfZKZsyZ5KoXz3bxFeKLyFnSOEp0C9Q39m
	UkDikjQmXhiF2rWY0CB8H7tyPJC+yTY=
X-MC-Unique: S7LYzUvYNg6BYry-1T4A1w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XlZXeVwBQqWJbFzz04rJ+egjA/I8sxbhB3rwBayOUhEbVxjmqRiHAltm8CQxP/7HAIxkEYzHaIJnUj//baTf0xUTMpQdmQj/SBR3WrkqZx36aeDG3G2BQDVA5V8MEF5cds7AJip0xHOPoPi9JBP4/omBwcJlHdN06mR7wS5u8fscnjXc/kZs3TxreP7PlfsaJUG2KQs9ThFExBfDZzrkfHuJp5KmXxtfpu9N6Mnu3+znRRAb4x0yofTVJqEn3YQvuxmmD8DFmFlrvsv534OHW7140Yz7KSsnl70SzWAaQhRutV8twr1fl7iLuGW4cIFeGIS5buzTBIqu+4QdElAcaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7pJYkEFfoVelKKBPMScwRw0db81zBvMrRG7Nva4I1B8=;
 b=etKp+rW1rJGwbthkHn+9CKMHO5VESXCTTAL9vwIrBWGrsVF9AydOiN3Z2pw8qBN64Rqq1TJAjUHSOH12WXJRGB6DHzDjesm+R6nsy/yQCfT/TL0/aFt4D+zFyCFZ5vrfRGpV2jMCTTGFsEEOGrMwJrCsNXNVXp9Z8+RRjOfrgMzXK+bWc/kFWwD+c+3t3uSpeCWtieJAHeoY17TYYgWTK9sxY4kSqhYA/tBI+KA8B61WbaD0JCUIiEL9F7gW2+yxanQQrykiUxcH5021piR4Piyi/dw2oqEa5JQ52/LA1LMYq1jkk9Fh8dfubc7ZgZ615HaRaqHQc9OrfL23aYRfFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <066ff819-de46-4c0a-d32b-bd9fb97c12d5@suse.com>
Date: Fri, 3 Dec 2021 10:59:19 +0100
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
X-ClientProxiedBy: AS9PR06CA0002.eurprd06.prod.outlook.com
 (2603:10a6:20b:462::7) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dec698a7-1b94-4d90-6221-08d9b64393b7
X-MS-TrafficTypeDiagnostic: VI1PR04MB4352:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4352902119DA20050896875FB36A9@VI1PR04MB4352.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ok9bQfmI0HLLWvfhtZZkSnMnBo95/UMLqdtDxRLQJTUNnS54TqBJ8BrcUYwS/RxwmVoUL9ZZt4DyNkddyTaS4EJVva3LMMteANIiIc9GJdYEwGOdsMtBRpPJJBQxtNMNVW23flXiZ7CS2xNCSdPEFmWeGU+ArOsQUGZwRCvyuuis0mOVsFITBc2+63aMQ4i/uq235kaJnN+xPHmlJSlHl17tJ8ujS1oA/t3ZDlWG0dW5usJK6QfxIoVY+Db9vlmdAIyJ62IKYx1nShMTfulhQ9Nx0heN3WVURB+vUal+Ti33W/IfBciBTmRUEL0XNqJPh02hdaAgHehu0BUjTFWlTbmm96nSrXONG4WSOyZxJTeDi4wNYKV8DodaLze3ENSK8Lyh678TGeIH8etCYD3+cJzuUgjurpdlXDMPVOaNtKo2Wgdb2CGhoTSBS0A/JlrZEL7iXZsVCyel2rA2vJZnrFwvO8xcmIFpxGJKvyuJn7dMv0uGkZT6j8/PwlPatl3rPide05c8s7cFXe7FGTk5h9OTvXP/B9ZwDqjPu74uTsEJC4Nhc+i0BUcPlXrLOSqkzOdlF4kgSDcIfn3CRniIsjNc4OgCP4n8rEK6DJ0+eSA+ALV5YbULgWSd/w6w7eE/POuoMTE6j2GfrACSwTpaCOg+joxXChdWq6swFxc8gf06Ushri7+KsHmIoPy6e/Gm87tXcG1nnK5isXISRqJPp0EBvpyog4oXJHTo5AL9QqI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(2906002)(31696002)(31686004)(956004)(8936002)(508600001)(36756003)(54906003)(86362001)(16576012)(53546011)(316002)(26005)(186003)(83380400001)(38100700002)(66556008)(66946007)(5660300002)(66476007)(8676002)(6916009)(6486002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MbDbgyIFDDZrFtRrxWm9pFAQZLAkJjqccUQg360GXjfr0g9BAqE23e9oYZ9Y?=
 =?us-ascii?Q?DE+1MWIgt5+NT2ehs6Xc2c7n/fiUZjEHLWakBuhgxnykCY/tuleCBvxRZPh3?=
 =?us-ascii?Q?6cK32JOfAVqJaLCB92Ob0LzBW6XsMzDzHkP8uEbumIVQH4nz7fcPOh11p9cF?=
 =?us-ascii?Q?ICpen7eybQ5zt/O67ryn1gh2dEy/t3PN9fJLV+NnySzLn/R4DR9CNGf2Zink?=
 =?us-ascii?Q?+/BRtyxg+N+tW7kuUaKXcLT43AzlUYuNziYKrDbEFciU9XF1HRbkX2pUR4uL?=
 =?us-ascii?Q?90g7ra07S6x/pbD6yks6Gp3LWqihhgNIyL7jqKpBSSKqwky/A4LBe7mbXPN9?=
 =?us-ascii?Q?Mn9HVbpJBnUy4vZSfZTsITJIPCtJHxGcQRI0NupOICrUL70l3ELc9laycbcz?=
 =?us-ascii?Q?ANuIJnk7N6EXKsTRWd1+rIw8f409qbFY48FiCOt28hcZ4NjkUWhZsGKE++0b?=
 =?us-ascii?Q?NG90OKC15FTTEuRF5xeM4szXG98veQAhPGP/QqMzjTHquAuNCyuFVZVeG0dS?=
 =?us-ascii?Q?VT659htPbAw/miTeWOkf65+k5/trQCefmqt8IGVr8nVsORB6j7FPA9XFKmKS?=
 =?us-ascii?Q?uhMr0KmPCwBWvle7lHmm7joo5e8Jz1YW21ppbblA0AmAM9xSKxmM5bZ247WY?=
 =?us-ascii?Q?1uJvkiK3lX3U+o2r8aj05PKuEqHQJfld0wAjij29+M3fNs2uwEEjikhkorhH?=
 =?us-ascii?Q?UCR8WcIWvs56H1oozmySFVOFHFdh2v+dEa5xZ/wzV5fskzgVK+QHwUaqx/p0?=
 =?us-ascii?Q?TDaJ3Tssz3SyvjG/BkOJXAlE7e5fXSjFnRFYjSktNM6s7iBJefoKKAOUfXGK?=
 =?us-ascii?Q?G6XNarUQCbmSm9Eh0btA1tV46t/Bbm2t26lbmARUAEVWgt+Msa2IsQW0b+2I?=
 =?us-ascii?Q?8g667tc6oMxUn5KMz8VlrgVkSWCjSvCCjF23XJw2J8Lo9Yyz9MBKfE+a2D7+?=
 =?us-ascii?Q?i2GDlPD48AX2FHMtlCj2vkYv9tc29/t7ez+ZgzYwEAbCJ5jB1ZnPTXn2ZV1s?=
 =?us-ascii?Q?3RkXtXmao7YxEs9z1udPx6mHcFgQN+BBApR9zhMzyiNmVRfRMPBv4vW6+g8+?=
 =?us-ascii?Q?/Q5Kj+VqpKQrI1voPVjDuIQagCHU5ko+Jn21p/aukgO8LsnfNDuCx8rlab6I?=
 =?us-ascii?Q?Z5SRaFzc8ume+1jr1GmtQG4gedkliEfygsl4V60C1ljSBP6UG5cJw3zfKq+a?=
 =?us-ascii?Q?3k9VXFfBn/y05LzbQiYIiFfM2DVCMJaNNlraLg7y3OtWUU+IbA7H/GRXpToK?=
 =?us-ascii?Q?6NF24XXol1Rjlx9jNxYUqdMQT6GwjNlc4bNfGU7rJrT2DB0Q96jMhkbueOdq?=
 =?us-ascii?Q?j7S+S+PyU8ZvCrpmF3IyqOWJhY1WOBKQ0JM/07YFV4oJaw2LQPD0omENsdf5?=
 =?us-ascii?Q?VT1dMI+7aRXWRpNE30J9K26RdywZdbZZApDviqCawyCjPjepxvVSl7Vb2yME?=
 =?us-ascii?Q?M/+fHpTFdu00WRPMGG+uC5D6s5L0RGJ4lQZw+eKbV6yh65jYSghiLVNOo4gD?=
 =?us-ascii?Q?FtD3LxtvvY7LgFnoBuwkFcbfBAlMgDErOH3iSRbEGYcED/jWJfVQfQoys9tY?=
 =?us-ascii?Q?v3RFDTQp2owb9Ts+4NOefASnmqy7NJCOIiFaUGbPWsz/X6HhNDLhNeq/ZWCy?=
 =?us-ascii?Q?ifhudvNO0rZf2CPhTJr6Kk4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dec698a7-1b94-4d90-6221-08d9b64393b7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 09:59:20.8068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MEHp0layjt3eHxENso9uA1odvoH17YoJrNOLWJXV3Nm60hidoCVKIiYkq/yEYeK4gaqWsAqAPcC8OZgNp0zubQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4352

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

Further to my earlier reply, taking the mapping lock here isn't
straightforward, as that would mean determining the correct domain.

Jan


