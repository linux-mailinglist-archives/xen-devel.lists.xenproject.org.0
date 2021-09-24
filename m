Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF59417179
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 14:04:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195344.348003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTjuo-000392-Jt; Fri, 24 Sep 2021 12:02:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195344.348003; Fri, 24 Sep 2021 12:02:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTjuo-00036i-Gn; Fri, 24 Sep 2021 12:02:54 +0000
Received: by outflank-mailman (input) for mailman id 195344;
 Fri, 24 Sep 2021 12:02:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wINm=OO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mTjum-00036J-MV
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 12:02:52 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e4bbf1d8-11ed-42c9-8442-d58e8d54389d;
 Fri, 24 Sep 2021 12:02:51 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2054.outbound.protection.outlook.com [104.47.0.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-12-62rC-_ISPda0KYu9AXNEyQ-1; Fri, 24 Sep 2021 14:02:49 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4192.eurprd04.prod.outlook.com (2603:10a6:803:4c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Fri, 24 Sep
 2021 12:02:48 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 12:02:48 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0070.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.7 via Frontend Transport; Fri, 24 Sep 2021 12:02:47 +0000
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
X-Inumbo-ID: e4bbf1d8-11ed-42c9-8442-d58e8d54389d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632484970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jda2F2n00mJxCmwc2V9HhThsClvDfmqRmCUN1I/E/PE=;
	b=OlaHQsTj9qeAZ7nNbsdnM59Tmhtrb6uFREyfCIsiEzLGthyA2Mm1TMTA51np0xEd0Z9a5B
	bXZkPcFrNQF/pcZtIATahlaORDHjYG4Xhh8jHPN9K19dboJmBZk+Bvrds59Az3TuosYO9j
	lpnR3vjFLvNK2U5+yFxihTd1lb39ciY=
X-MC-Unique: 62rC-_ISPda0KYu9AXNEyQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kN0WhsvxHeKGOu05cCwFSYp6HJQ3kdfS8g8TiiabnP4SEXCNSKpYmaAR/pX+3VQz7PfEagciEvcvlS2E2XClM3+xiyacm60xiOrp5w3l4xi7NnhfhQJsOFcnSZ4Cc3V7psZDi6WJYdEAJctdyvWxCIyyfj5t0/VizJehqkZ77ZvfYnbjm8q8ggLzQQRIrhqpJwdhchYBoXbBEh3tdUtmZwJ8fudNIP8q1CIaHHMFXWP2ksXlUv0gYlc3/tYj8MKLWE4Hwd4wck5nmZByHAYRxIZeOxac5ereSkACJl3q2Y66+e4NGkAssOgKVHG84QoES5kukRk2EGTZVbT50LjHmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=tZ2JJ0qf38l3SeHPkotDBqFhOnZimuvD4duLlByCEDk=;
 b=J0P2LaSyyhgf2lAHD6ItuVqRutRly1JpDbVqQ+I0LEHswLmG8zOn1+lWZ0gQCP2Vk0Yq2dLtHio3mG1/e2mHR80QG2poNRBkxA782cLhpb/YvZ8F0W9Ho3HUCkRWiydXBEgG5oKPr7iPdslAkrsBjRtgk0BOtGHxlsUezDCHr3ZMnn6ugr/GcQ5LnnDuXfnJ95XcYsI7IJ9ZTSlp/pHXmNE6mIKWRr+KmwwcKoM522ufk2/F79YutACKZt6iOrjMc3cdjToveY+Ct4myunQHE858W78uW4hef4AseHlCtHlh752bn+d3dYF6XKruPL/XY2+bnWjYn4wISrnA0oho4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v2 01/18] AMD/IOMMU: have callers specify the target level
 for page table walks
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <57abd488-1fa1-8eae-66b9-196f32f7f4be@suse.com>
 <YU2vXU3UffSQ/iQX@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <eadb98f9-f398-aa55-641d-d4b29c1cddac@suse.com>
Date: Fri, 24 Sep 2021 14:02:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YU2vXU3UffSQ/iQX@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0070.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51f3b0c6-18b6-47c0-621a-08d97f533a00
X-MS-TrafficTypeDiagnostic: VI1PR04MB4192:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB41926109B65E330FE805F8F2B3A49@VI1PR04MB4192.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AVH1hjZpbFbVu8gpZ9GcmjKBIi8Ki8ZlrgZNXKoAa80F7DVkhB8lUssYfjUMjNwp8AUunUS98WdBEF2nrLj7bMJKOJYkcEXpqFh7n5s6M/RUYYeGyHMdCtubMJ8o0mBU9xuzNZq5NGGkriSKPCFOK7LSEf7+R8BhjXYKq3ZB7Wsyuu9GGQ342jnHP71QRAzMdP7ii76fg8k2NtCgXKv/AuPbczahEoqD9EN5TDp/Trr4eMvvX/MI1DFkhNV7uzhr4q/jXZBleu+O2/QU5PfJlos29ggr4CvR8wQnWaq+qC53/mVJEgXOg4jupWNHE2ewlUZUQk9SUBBjxVQ80ojoyYe9KqORyXy+4IF6MS5yj5hbYGAU7wtZDbhC7zvdxKRhxksCYM1nocqF4ixGeHMy34HStuYmueyC6SXgnuhBOHBohdVdd8h2kaHOWh3e+qWMdEy0UixVlj+hP+hnim2xwclhbCZQIPfvVEQj9phELvGsi8XdK5DTXjiSVg6uzQgp6AzO/yyP3NqrPgZgF+WgvOi8Wr7uxZMiQlpVDHI86kGpU6fyofjyHWTVHwUl/jRzGfVAvhUCOtxF9CUx0k9hlxtAzgBuD10mp2tQO5ZnIDVWGvbM3+sIk7y9Eh0nSS4mRnDTM96qOeNDr6fxuyfyc9jgfr5yBdoV4wg2+rpr/Zn4ed/qV9VjKQf0ull8UTCwrWH8Zzc5xibeAl11vgdKW/FkObRfCwmXBe0y0sbMnPw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(2616005)(66946007)(86362001)(8936002)(316002)(956004)(54906003)(31696002)(8676002)(66476007)(53546011)(6916009)(6486002)(186003)(4326008)(31686004)(26005)(508600001)(2906002)(66556008)(5660300002)(16576012)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QOlmqlWM1Y/Ser9t45VlW2ZXuFgiZguovRZGgmXbLnn8D7hLc1+PfNmqRJJ0?=
 =?us-ascii?Q?p0mvYUmsgJCUanPqZyWjRip9fp3DOFKxgucuhXJcQv1N+LXbXv1UFC1ZjNtm?=
 =?us-ascii?Q?OW3h2bpgJa0+HojB292r8uWwvB3fWLF4Gj/xqsVarjZl1iJjbJ3RgiYmVadJ?=
 =?us-ascii?Q?7lvzuQd+nQ/HjRIka7sxnfWOxFrz3iLMCSwGL4ZsRnB8HK6bXOUIcU4EKjiq?=
 =?us-ascii?Q?raRjv+/LFDMDO5LILAqyQXaW0BcU+ALtIZRqsSkZtS0njLPIEb+SYia47ROo?=
 =?us-ascii?Q?Fz7dKfyJE/3yL203quTbDt9gVel1jOKlxkNd3bp4Q0c/lIDqH8Nw0WoicxBj?=
 =?us-ascii?Q?dx0m4qz1fRxpqT2RDhf06Yeud0na9eZAaRcdm9uvCsmvF2BCE0M9r55RE0qw?=
 =?us-ascii?Q?Gy3C2WoMXVe23GHxyFP4BIpV12zLSb5dqo5RSx4NjknfU8aQpXJXVDWw2Kqj?=
 =?us-ascii?Q?dnuTeXQlkfnmCs/yrbms3iUDZldxIciKEn3j444LnTKumR6Z2vjCT4tl2Zdd?=
 =?us-ascii?Q?URVo7NQTNRzOxLtVcXs2draJY9412YH+CHctbhOhw8/lwRCFnv98zFx5AUVM?=
 =?us-ascii?Q?aR6n+sWIaTV3qLak66iHwShqbBjivnhiqHFRrRs+iiZtEvZDDdu/okZl4/BE?=
 =?us-ascii?Q?hqbzJ0lqcbHks+T4wcwPDJYjV5Q4PjU7ibdzQaGLQRSha2Ffp1Z4fDXSGbQy?=
 =?us-ascii?Q?hnQEl0cFoyN3EvqF4R+eJDbNjimXKUj1BVc9zysKNFefdiPtNDHEQISv5jau?=
 =?us-ascii?Q?W/LPbOBdNIsFpuM46oHw5JlO90JL5u7j2pzOX8qdz+tPpjJuKXsV833pjs9D?=
 =?us-ascii?Q?hdKKkTbr8yhl+KvpaV6BaEyNS4Z313zD01qK2urWy5x9rOlX4ApfJtCcSRe8?=
 =?us-ascii?Q?DtiQJOT+fTT9x4RfHSqtsQGaZ0gBM3dyZFNSvuVAAHiMIwy8q8DHA5xZuB1R?=
 =?us-ascii?Q?cI17XkctZ2m9X1ZF4y05kiCHi8dx1S7bb865G/nAvr6QUD3Dpvulo+yeZqIa?=
 =?us-ascii?Q?fdd7X/4MaXMJ+6I8eFuQYNBnc3luLPHcric5yf9Hy9an33I1HNScOp/gP2qX?=
 =?us-ascii?Q?4ckJY7lAJecU4SqAcNklJuxafOYLt6nwsrVBoQAvxeHFivCftR5EvEDCiVWX?=
 =?us-ascii?Q?QvXablI5UBmXRYu1vog2BNv7NX+p/Mtr0LN5L5Z/dyDpsA+Vf8k/meeXaF+8?=
 =?us-ascii?Q?4k7G/waEB85Me2I8knQn2yBTfBDglKVc5H+BRcIGci4lEkqPtuAh+SRWM1Yv?=
 =?us-ascii?Q?aNpRPxzB+tDPNH3LqGEWJuM5lyupwbi5R6jKMXU6So2xmrcd2JIT1YcI8Ew4?=
 =?us-ascii?Q?N6yJQY1FKVzBJw/k97Ogkq8h?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51f3b0c6-18b6-47c0-621a-08d97f533a00
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 12:02:48.3181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0eT8JB4p31sVrqewNdxRoQIFeRfs4w3nNpYvIpQGPvgC+PcfWGm/HSPzRezlgEB3ZeiG39BRgon7bypEpYMa9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4192

On 24.09.2021 12:58, Roger Pau Monn=C3=A9 wrote:
> On Fri, Sep 24, 2021 at 11:41:14AM +0200, Jan Beulich wrote:
>> --- a/xen/drivers/passthrough/amd/iommu_map.c
>> +++ b/xen/drivers/passthrough/amd/iommu_map.c
>> @@ -178,7 +178,8 @@ void __init iommu_dte_add_device_entry(s
>>   * page tables.
>>   */
>>  static int iommu_pde_from_dfn(struct domain *d, unsigned long dfn,
>> -                              unsigned long *pt_mfn, bool map)
>> +                              unsigned int target, unsigned long *pt_mf=
n,
>> +                              bool map)
>>  {
>>      union amd_iommu_pte *pde, *next_table_vaddr;
>>      unsigned long  next_table_mfn;
>> @@ -189,7 +190,8 @@ static int iommu_pde_from_dfn(struct dom
>>      table =3D hd->arch.amd.root_table;
>>      level =3D hd->arch.amd.paging_mode;
>> =20
>> -    BUG_ON( table =3D=3D NULL || level < 1 || level > 6 );
>> +    if ( !table || target < 1 || level < target || level > 6 )
>> +        return 1;
>=20
> I would consider adding an ASSERT_UNREACHABLE here, since there should
> be no callers passing those parameters, and we shouldn't be
> introducing new ones. Unless you believe there could be valid callers
> passing level < target parameter.

Ah yes - added.

>> @@ -200,7 +202,7 @@ static int iommu_pde_from_dfn(struct dom
>> =20
>>      next_table_mfn =3D mfn_x(page_to_mfn(table));
>> =20
>> -    while ( level > 1 )
>> +    while ( level > target )
>>      {
>>          unsigned int next_level =3D level - 1;
>=20
> There's a comment at the bottom of iommu_pde_from_dfn that needs to be
> adjusted to no longer explicitly mention level 1.

Oh, thanks for noticing. I recall spotting that comment as in
need of updating before starting any of this work. And then I
forgot ...

> With that adjusted:
>=20
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks.

> FWIW, I always get confused with AMD and shadow code using level 1 to
> denote the smaller page size level while Intel uses 0.

Wait - with "Intel" you mean just EPT here, don't you? VT-d
code is using 1-based numbering again from all I can tell.

Jan


