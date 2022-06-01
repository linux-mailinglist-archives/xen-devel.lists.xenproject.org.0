Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1F253A5C9
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 15:18:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340485.565527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwOEQ-0002kc-9T; Wed, 01 Jun 2022 13:17:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340485.565527; Wed, 01 Jun 2022 13:17:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwOEQ-0002i9-5R; Wed, 01 Jun 2022 13:17:50 +0000
Received: by outflank-mailman (input) for mailman id 340485;
 Wed, 01 Jun 2022 13:17:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z6G0=WI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nwOEO-0002i3-Py
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 13:17:48 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a8031e3-e1ad-11ec-bd2c-47488cf2e6aa;
 Wed, 01 Jun 2022 15:17:47 +0200 (CEST)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2052.outbound.protection.outlook.com [104.47.4.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-9-uoUGJAbWOcWg7ewFWM4tPg-1; Wed, 01 Jun 2022 15:17:44 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR0402MB3528.eurprd04.prod.outlook.com (2603:10a6:209:7::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Wed, 1 Jun
 2022 13:17:43 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5314.012; Wed, 1 Jun 2022
 13:17:43 +0000
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
X-Inumbo-ID: 3a8031e3-e1ad-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654089466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nwyAR43lH8ZC4s6XbtYja3+J4TMTpoVqjUwK1EY+knw=;
	b=ejHgVBODZzY7auPNAVIbTHFrbo27Kl0mrqh4PdHSs+MF8ULOZsWu1Ftu48IlBfiigajhuX
	1qsZm8EvMTRNSpj3gzkS8qGtrjNuhFbuFC6u7MbLS4zd2UqLwWUZrmWEF/oP2rLhRNRyCk
	tcnVm8jIiHtI8rpv16F0xJouVrCQAnM=
X-MC-Unique: uoUGJAbWOcWg7ewFWM4tPg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S1ONOQ5EU5k0up1ibaycvbszqVF3O+AQxSx2iw5tWzxRnBEpURqbGe5mQrjrc4sejcb8Gs1fMmmROJ4QRPiQOqOZUa9K6ZcTpKi8AHXSomaHQUUWKAPl48kWSzQj0Zu+V2BQNMAGCWpmKTZeU5HlQ0/DcDI9j5V6jpK4nKwHL1OqYfYUkuVNAHrKKpwJU+0ZXRKqN3dft5kD1vH8dFNjm6Y5lASR1hksz8Xvmroxe/6XLo2y2T+jaZH9pc9Bstxw4ddxnScuDgtPAwAiM3Iu5lxW1+ywVFYX3Jk93z4INxgQ6w+zMyhb22jc5J8bcXCT9fHzQ7zTa4GJbGwjmWZm6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sM2fFa2IAObPD+hod78iFnVgnTcoQ+gaVMhdkgBq2aQ=;
 b=N8zWE3kR6yDGQxvT/5h0RTjhJwJiQUaeF8Lw62C7ac3cU0Ss7QoV8IEvW1qkgu4657/JCEq2uArgcDM50CqTFX3iDsbfwWIdhGStSfdWpYB/3B/ce24Dxjvv0u0RcH+wp84gr6XVYv5CXcGUduKk7G5IvAj9+FkIy0aBzgkwlJxMNuEjrrmVflJG2sS0ZS0hSXSqB1z4EBwmQh4Ud91ksg9laSzg1YPJVwdsjroJsufyGIO7sVV/8hJq2ufVxjv4bqXP61ZMpKvacEOHq55tFgkshaJN5jjQ7KMCC6fXWnG8d++xleIrjYiibaab3adiVDe5SAiEjcFa2EenHp7qnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b57e7c46-338e-c4e7-d9ed-b8c52e710ece@suse.com>
Date: Wed, 1 Jun 2022 15:17:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v5 08/15] IOMMU/x86: prefill newly allocate page tables
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <80448822-bc1c-9f7d-ade5-fdf7c46421fe@suse.com>
 <1df469a9-ddf2-2036-105a-f303f0554f06@suse.com>
 <YpdivYC3MlpYPBLB@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YpdivYC3MlpYPBLB@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0081.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2258de46-1a90-4957-2194-08da43d11c78
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3528:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR0402MB35287E5A19423827F5714A42B3DF9@AM6PR0402MB3528.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nVBtnfiFIbmFNKMhIdEoeRB5qlfdk0AGYd1S+ebyu2DuxUioQw+D0AXPu+/iTSWg1cpGaA+2qXWmxspvYSDrjgW/L5WadiFvAosq2JmeeugGq2XoSAHXBX1TIizdHwhM5fJwCVoZozIlonzqpsY2IJb17AyasdQSpGmKvaSb6LBxZ/kaE0amyFbeCCHULKVlCKdUGZmsoKVSPC+d4Qg9jLB+uw29386f67aNxyNrw9o8R0MWa7s95b19L6Lf9METzwOT7ld6vzwN8ojQENcdBDcZ3YOQ77OoNUix76lJ+eu3KoBJ5JfDEfZKp5cSfytg5gKvdQtcRzP6PUAq9qepeborT1S1x5/A8no87tH4TyjND5FF1TQ6TXFDzlzAuiflTNmi8IbZtxIpU+7XkrvI4bne21Ryl5JL0SLfYmm0Zm4r7z4yLS4WsK/MkXAKE+SH5C1z4APmPRCFO3Lnz6LbtlPNIclqppNM/nFfjYkXSBfaqyZwl5V7J5znDOx8mNKJO4X5ta9VWOo5LYncNnzquf7g1SSzsZzUEmK3vTGqwMy9LDtYEg/GXzsvlncyNPnsp9rKjs1oPG0AYUxZzyVHSZOpB5o8Qw0A04zh0TRWfQ73pV+ka2vbITUPVLTHACaFFW5I0U7M2k+VjzODWkisW24EFSRyws2tyai8tWsCNOLq9wKdcR3Z6/Z8VDo80rFrWUkVoGeCRmpiNCJxxfnePYjzok4SiiOWCSddBd6aVAE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(38100700002)(508600001)(36756003)(316002)(31686004)(6506007)(53546011)(8936002)(86362001)(31696002)(26005)(6512007)(83380400001)(6916009)(6486002)(54906003)(2906002)(8676002)(2616005)(66946007)(66556008)(66476007)(186003)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rvJhBVoP6eNaexA5/M5Tf1ceYGV00yCWojJoBaXWWkmTlAbr7kI+LZU4L3+h?=
 =?us-ascii?Q?o3Odm2E+eLKS3J2uQAJV10HEzSNB9lyBq4fxwHW0wDidKyqNSB6AgHjtDRLZ?=
 =?us-ascii?Q?vCTG7dAeeUp0aEaNZsmSWVHmNM05fuyytL7/5A2aZTQJaSaPjoqq4RcA++ym?=
 =?us-ascii?Q?cHjminU0t8iHKJWGtjd3GeoA96XzfHtPogZH17ZOlhNvclrJEriU7w9hWQQ3?=
 =?us-ascii?Q?HGT/rzpuqkaOhEVTYMOgoci6Vs8UUxx5MekVhhhChfIDvj8hE+Czzu4oMZ9W?=
 =?us-ascii?Q?ieJzwNA+ywR1kMTchO1yf1IWpNObZ8uxf+hemMP0PvZdXbjg0XTATyV39ZSH?=
 =?us-ascii?Q?krqdNDLQvvaBdglRjKnSwzQdq8Z9IrvN2r2V0XJwx0PvKUdYa6Rn9R0vRDvM?=
 =?us-ascii?Q?CZK97TtfCPv8G4lf7p8wqdeJyFiT7sr/KMO9Jlf9bkgtc4ZeFpOjvpRWdLN1?=
 =?us-ascii?Q?sbwa3JWik9xWGuqNYMxfCyt9N/tdT3JcOWj6/cSQuvbRQV34RNqL5LuqSLnC?=
 =?us-ascii?Q?abikRc24YSW20WHIk8cIlGy2NTpFLB2tlfwIWv6GzVtq34Dz4K90PsApTqxF?=
 =?us-ascii?Q?L3yPXxOwvxSKqdQnjW/+/ejnG1H2VNPEoPhqof8NeVYFvD1F7SFbQdMW33ON?=
 =?us-ascii?Q?p0914cdGor+CNF/Kn8U40472MP964C0loQWVir/d6ziXvfmJXEdXdHr+YWuT?=
 =?us-ascii?Q?15z21XsFhJiEZgCUSMkq5XNsiWTNKVaQOBgAW0yy72F2xFvb2M9ZoK9yfsW4?=
 =?us-ascii?Q?IW77psxBnLEkVn6/d3Rw95rDXAehjy1FswOeB/hI4P1fLi/QQmup+q6BXzfN?=
 =?us-ascii?Q?pbPrs9MksJrKl3afivO65jWYiyOS9icpmNc+4V88aaZVo4w9GWx2KS1o8f6U?=
 =?us-ascii?Q?Iv6zm2kD7qzeOSdq90zE34EYW35AtAihbTwmB3wuxWlb0KGxz7OMWPTU81GW?=
 =?us-ascii?Q?NdLT0Pc2z5xshOpNrCX6PfwA9muJVl7MtctPSxmWJhRkCgYToQ5Redgv2mdE?=
 =?us-ascii?Q?kYCBs0p3a6LTEjjKDP9qIKrw6U/TP0AJ7QqYkkWVgcfQZx3PADjk2sSGl2yE?=
 =?us-ascii?Q?y4RoY8M8jkbO+SQmtr90SImWFx1v7HV4WBBld0DLv6Vh6BzpI8wWmTyVs9Jh?=
 =?us-ascii?Q?DIpgqUeinmkBqjRqmdDi53ZfD/UWVU9BFMCr+ac24rO8/ozZYf8j27ycktFc?=
 =?us-ascii?Q?tYQaDKekoCNG5dPH3TcpUY+GpI5pLzf3dweNMJSL6igVi06FpFWBSlbJC2VO?=
 =?us-ascii?Q?o3LJAHxgDHC/j2CIcUClPJMU0eoulqgWbGydBWv8wFFI+curqe2EuB/jCRba?=
 =?us-ascii?Q?SsDiRpPsI/LQFwxsHxPlXhFzVdC3EK1InRJ8sM0XiT9WXfq4RMiE4NP6Q8zI?=
 =?us-ascii?Q?XJFjLUR1ISI9YLSfaXtUNKNGi9JEXCAYT6Z7ZqeeN9hLJ1WN6WIoNit82U07?=
 =?us-ascii?Q?Jq915MsUGj9NaCNJxrhnK+L9lX5tCcH0I/9gc+lMRgicHTacnLnnwF+m75LF?=
 =?us-ascii?Q?sQ3r31CxaAmKLRFo4SM1stkw/YUI6DHeAdmPoE3IuP1a4xQN3vppOvGp7G+V?=
 =?us-ascii?Q?g1ddeTjlyjdafKl5XiFVHaC1S3HZS209NUBJACFjW9FL3cG/s52IeCkzj7dV?=
 =?us-ascii?Q?epw9gIHfKo3M6NYAi4WulWl6HdSzpkVbVROYHqHXltg5Cw8pn+OuNq9UEN7h?=
 =?us-ascii?Q?7PXWrx+zmIG4yoLpaw8fSg/z6u9FEqbp3F2WJs6M9J9iXxAE4F7gw2F6w761?=
 =?us-ascii?Q?CyzkK4runw=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2258de46-1a90-4957-2194-08da43d11c78
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 13:17:43.3707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T+vG0SOHjCq9RWrJGRq1DkjGUO8ufq5MjfR8IaPs6fhijLEoIdOqeAxnkVN1DI17rIFS2KIVLJd1bD0kpt5oeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3528

On 01.06.2022 14:59, Roger Pau Monn=C3=A9 wrote:
> On Fri, May 27, 2022 at 01:17:35PM +0200, Jan Beulich wrote:
>> Page tables are used for two purposes after allocation: They either
>> start out all empty, or they are filled to replace a superpage.
>> Subsequently, to replace all empty or fully contiguous page tables,
>> contiguous sub-regions will be recorded within individual page tables.
>> Install the initial set of markers immediately after allocation. Make
>> sure to retain these markers when further populating a page table in
>> preparation for it to replace a superpage.
>>
>> The markers are simply 4-bit fields holding the order value of
>> contiguous entries. To demonstrate this, if a page table had just 16
>> entries, this would be the initial (fully contiguous) set of markers:
>>
>> index  0 1 2 3 4 5 6 7 8 9 A B C D E F
>> marker 4 0 1 0 2 0 1 0 3 0 1 0 2 0 1 0
>>
>> "Contiguous" here means not only present entries with successively
>> increasing MFNs, each one suitably aligned for its slot, and identical
>> attributes, but also a respective number of all non-present (zero except
>> for the markers) entries.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
>=20
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks.

>> @@ -538,11 +539,12 @@ int iommu_free_pgtables(struct domain *d
>>      return 0;
>>  }
>> =20
>> -struct page_info *iommu_alloc_pgtable(struct domain_iommu *hd)
>> +struct page_info *iommu_alloc_pgtable(struct domain_iommu *hd,
>> +                                      uint64_t contig_mask)
>>  {
>>      unsigned int memflags =3D 0;
>>      struct page_info *pg;
>> -    void *p;
>> +    uint64_t *p;
>> =20
>>  #ifdef CONFIG_NUMA
>>      if ( hd->node !=3D NUMA_NO_NODE )
>> @@ -554,7 +556,29 @@ struct page_info *iommu_alloc_pgtable(st
>>          return NULL;
>> =20
>>      p =3D __map_domain_page(pg);
>> -    clear_page(p);
>> +
>> +    if ( contig_mask )
>> +    {
>> +        /* See pt-contig-markers.h for a description of the marker sche=
me. */
>> +        unsigned int i, shift =3D find_first_set_bit(contig_mask);
>> +
>> +        ASSERT((CONTIG_LEVEL_SHIFT & (contig_mask >> shift)) =3D=3D CON=
TIG_LEVEL_SHIFT);
>> +
>> +        p[0] =3D (CONTIG_LEVEL_SHIFT + 0ull) << shift;
>> +        p[1] =3D 0;
>> +        p[2] =3D 1ull << shift;
>> +        p[3] =3D 0;
>> +
>> +        for ( i =3D 4; i < PAGE_SIZE / 8; i +=3D 4 )
>=20
> FWIW, you could also use sizeof(*p) instead of hardcoding 8.

Indeed. Changed.

Jan


