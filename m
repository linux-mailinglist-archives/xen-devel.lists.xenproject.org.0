Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20788519F52
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 14:27:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320682.541535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmE6F-0002eT-HK; Wed, 04 May 2022 12:27:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320682.541535; Wed, 04 May 2022 12:27:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmE6F-0002bP-CW; Wed, 04 May 2022 12:27:23 +0000
Received: by outflank-mailman (input) for mailman id 320682;
 Wed, 04 May 2022 12:27:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IBxS=VM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nmE6D-0002bH-Ot
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 12:27:21 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ac3316f-cba5-11ec-a406-831a346695d4;
 Wed, 04 May 2022 14:27:20 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2172.outbound.protection.outlook.com [104.47.17.172]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-15-5WsEpDGDN9usLJanCc4cwg-1; Wed, 04 May 2022 14:27:17 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB6PR0401MB2423.eurprd04.prod.outlook.com (2603:10a6:4:4a::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.25; Wed, 4 May
 2022 12:27:16 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Wed, 4 May 2022
 12:27:15 +0000
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
X-Inumbo-ID: 8ac3316f-cba5-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651667239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T64vUcl2cITlN8kw2alyFq0hnF6Tt8pAGQC7aNyyV0c=;
	b=iAHKqXljsvsGQnl9U8sy0MWxJnbo5nnz+ElZ9BDIkZ3zx1db4qa3IDLuxgPfMJyvpOWTNv
	yCpvA4uwFpj51PeISB/WVwz39x9lXaik5PuLU6sqgP2W7srkp+qbgPSsnK+Q6NJD33Zl28
	lD0cb5bQwvEbM6o7f5ucC3QJeUdr9OY=
X-MC-Unique: 5WsEpDGDN9usLJanCc4cwg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bht570VS3z7fLjIsDFX0khUuSufN/U/raUNVOulikpGF4IRLPuGsZ5yzDRHqCRbMw1v+lzByG4P6833vs4HRH6CqTSAFmDBocJv2vFBPMEzbO7cfIJe2j3UKHck37UJIbOuxePbHkv/vevHwBgmHgFSgJQ5uaz6YMzWvXf5jIjceqw3d5K/9fAY/NihvH2Q7qkvDLshitxXgJf9gGG4BUoN1Ulz9TYKzYLwBwWOZA60mkqZO681IJitWN/4pI9m42PJ7W6OndLMgz70Bdo/Q4JBLG1mdxWTIe3jCMvmoWXWgWshUN26No7a+SLkdInsFepKBh9GluIfdzH5wGRSiZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JoiT2BJkTZzhDs6QCYmjh86fvZROusCbPCGoXiSewzY=;
 b=PzMR9swBkyIi3G8aKpJ2XUaRow0BN3+Oj1ctrENa4tuli95nKrX9UE7sK9rxLCgiXk5KOkQBed8u9Sr89jSL5tstG8Go6EZNUCgysjaToQqX7jeNy3B/eVwfNjj/opqyPvNemFglpcPxvCtl5xqlntouxyIaI+0+IWXlMp133rIB9GlScJpSN49bg24GRDiKdyqJND7oWOHuGA7f/r8hPPyCIwYLvQl9FR1rAX5eV9KqoHBW+0EQwWkFHR5Icpe1G2Pf8mz/wa89IIuPQ0DG1iy3/1ANIZUlkyQM8Ii6ZLMDXlc2CkDSq7sieYaVxl5cEvxuYCi/Hi61vH1LttO3Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7675bc21-e951-0d75-844c-94ddf47dd343@suse.com>
Date: Wed, 4 May 2022 14:27:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 06/21] IOMMU/x86: perform PV Dom0 mappings in batches
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <f85a5557-3483-8135-ff47-a15474aaebb4@suse.com>
 <YnFBDsEdaMiMv+8O@Air-de-Roger>
 <73aabaf9-4509-53f9-8af4-354fd3d13fb3@suse.com>
 <YnJhYJSZ2IXxPEyz@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YnJhYJSZ2IXxPEyz@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR0301CA0013.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::13) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e4ad616-0896-4da5-f681-08da2dc96c5c
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2423:EE_
X-Microsoft-Antispam-PRVS:
	<DB6PR0401MB2423D63DC55786CD51EF34D7B3C39@DB6PR0401MB2423.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	keSkOfMrtorves7Fv69vhXpEvCxX6R/QfQeum/on9Dp5IUGbIdyL42rOL/G4LOBdLbjlagF235CjarKQEEwy8zN1DySkLe5nfmUsUrxr4CZqkH7jcXmL75BJiZ5Q4qysX11i+MoQoTNoFRZ5mgHGT+AqfOFTVSD3O/bOhRKnbD4c6XW01h6DyJIclqzdVbLAwscn4dWWlMjRLCcm+qxBHCZ3LaS1fW1thdMaOFk41bCuyyxiVcXlD/Sy7SCmRTdBWXY3AuGqQD0o91N5bDcU8bbyaWy+DC1TToMlHQZOhA6GD/VKLy55fJtfC1Eu1hkQ5H9A7XSzZFfA073EWFOi8v3GEkXHDyPl/T64Al76lAOAe3Z+o7D27jyksu96k4zHwGx4oKs61bGiGiHsPUl1/a5KuR54cvJmaPuVhxyj+xG5by4borKtyEijnEusjAnrEvJ3hfGFCZYf0r31zhzjMlhcRHxa339aqumu5wBzmfQqmzdwLjtVqCTf1s9/Qy0SACFbajCz7epy2DcYZJ3/TtydW3OywqRNI2pmLFnikAACt15nUJ5gLz9lRmA8SHgt9YCjZ4hf+AOxITq0Nflm2Lk6cQhK4txJyrdwGIuTq9lmcUgH1k5hB05N75SXoXUwi6dnUyzxP8cVpr/tcDfEC+AAk5x5Rbyh+rxbeR6FbOqWqHjY5oAGI7vSq1fpqw/6Q4NIGF5BBZ1KDSraBSbb7fa93LAfaVOewvCbf7NY7ifD9miWxw3v1iddSAWYDGq0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(53546011)(6486002)(38100700002)(2906002)(31686004)(6506007)(8936002)(508600001)(4326008)(86362001)(6916009)(6512007)(2616005)(186003)(54906003)(26005)(5660300002)(31696002)(316002)(66946007)(8676002)(83380400001)(66556008)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zX6jB/88jOsZpk6ynL4p7kX1IEwSwMx8yMwoWleWhcDyXqDE4RflV3qF20RJ?=
 =?us-ascii?Q?H0tCmYO4m3Cs38n6lQ2OConHDCH2xHgUC/Wgt99R3biL5XQlT/x9rKwqAqPw?=
 =?us-ascii?Q?FU7N7a9UPKvNgAQ9v699BUu4zvugl+Tnua7c8olEN5FtWRFZeNwYJGg96SKk?=
 =?us-ascii?Q?8sGHxsWa0kYyI4+7m/keCTe6nSqMrXDd1aTpUKw+Vm7AFHA96ZZYXd2VEfpT?=
 =?us-ascii?Q?Eedenay0I8O8F8Kj0XbPRkLG3HaYFTNTMJlUucF0pL0R1SQVEoy3S/InJOAI?=
 =?us-ascii?Q?UIkTx4wGsBzN3vEP+vKU+GqZOzxnUUHyAjlvtDzQLuGqwOOsxcY2DfKo7pj0?=
 =?us-ascii?Q?gPdPJdLsat4vW+ML4FeFX2lt57zsd116/ClJjeUd6q55A7q7MPjDjP9U/Z8X?=
 =?us-ascii?Q?7uO8saQwPFok1e7cs7qi4jIdZDKNFvBtOoX4724xOKMzuPZ5SC/ipkwN5N1J?=
 =?us-ascii?Q?okh59r4tYgyPMuF/YPpmK3Jdmm4Tr/h8T7NgB7Pa3ygpLsne2u9aR6cEktV0?=
 =?us-ascii?Q?n+rfWeXoKeawEZ08NXWEQwfpceJYa+oCXADz2ZXRq2vXmmKz0oGhus9HbB3D?=
 =?us-ascii?Q?3uZX9huS/HE2nKHNpgAvKHrkWZKh/j6dTDtfVxd+bM9EYybTPSAADODO7xR4?=
 =?us-ascii?Q?HhLeIMIOnjLkfVaP52tc6Tz28q8dAo+hZ8cMwHBAc8oeBYxCEJ7kMm5mzL82?=
 =?us-ascii?Q?5LZeZQazBvSCwhV3jXQWII8HlZ1Q6tlmYhkPdn5CHGuyvxvSYulG1Ocp/7oG?=
 =?us-ascii?Q?5gK3avMBpTUgP2s5P4GX2IoJIc7kK/7fXukikgtzTl30QBIVtQhCR7cuaiXc?=
 =?us-ascii?Q?gQD4FFXORr+WAHydaOEspa8VBq3I8W5I6Ra+FRSjgEhBgf3tz7ikGWScUFoq?=
 =?us-ascii?Q?VjZg2oB/wJL/BTUusQDaUyyQOMWuKOPKD9JSa1+gzH2zOGvAPXq2Fm3aUei0?=
 =?us-ascii?Q?rgxZri3ijxDV8/35JA0n06cDjxfvvApZdSxABWeEnEFf+PO2r+aBjeBou43f?=
 =?us-ascii?Q?XIrOiFe1RcN7YIpdz/9mad98N3UPxbhDeftRYRP13memFfhgQMlkxxskpc6C?=
 =?us-ascii?Q?fJkIv1C3+pfyvuQAgrNS4zVtBYLWQ83U6E3xln469clbGfzp6OVMr5xCXObm?=
 =?us-ascii?Q?lr3N0a53ymrCnWtvEFOgiF6NGKCIUtHnWbQHbreXCYvufcEDvZ8PA+/Nux7D?=
 =?us-ascii?Q?Hal8cDYLfg6vRKAX32gpb26Bfyzg1a8uxVVszOJU36saluadUn0SFq5/Fope?=
 =?us-ascii?Q?ZiqiG2tpHW29UVHcqyvuzmfULMduPzVXU3gOJePJvCe7QWPTeaQRkSwffHA2?=
 =?us-ascii?Q?CHZJ/5nAdX72HsVJp64hg+kIqVSFm2a30eF6wNPjGaVc4FFV20OnWOoEryVY?=
 =?us-ascii?Q?oCmjKSb8VOBkP3Q8Hc4GHvpOlhC6M7h7tQD3gqgdLSRkZxCXwcOjmUXyzNHy?=
 =?us-ascii?Q?GDkbWTFCYWsODCtkb6xDdSj+cgP9suFQ+UpV1mlW+mbTgpA6MCQOiCU3iUlr?=
 =?us-ascii?Q?3AzB+eWy1qnHzCKYkOwTPNz35cVxMMclUBfQ/9JSVrmUv/XQduS+nm+GVV4y?=
 =?us-ascii?Q?G1Z6fPVv82Aczt1EPpHRNrFTn6AR6yzU10XvWK0OYPaG9Q+zhSISa9uEns+b?=
 =?us-ascii?Q?vXBZ9iyATXNtlepLB6qrRAAhqQo0qEfsazbPzrbckKrj7lwwsCHlQq90NB4e?=
 =?us-ascii?Q?sOEz/UFRh7+yTD+vQq4iyzY6Y1VUXANypNHz8m/yu8YTMcRUHEcslSNeU4dr?=
 =?us-ascii?Q?GevoxQw8wg=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e4ad616-0896-4da5-f681-08da2dc96c5c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 12:27:15.7148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pjd6s8Hk7gsMB2fYV9CfSxH0PKow4w4lP3mlpmdtuYGgxGFELqcJJrLhetQwAxSVA3FEkJ7RZUewHRRC95bD9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2423

On 04.05.2022 13:20, Roger Pau Monn=C3=A9 wrote:
> On Wed, May 04, 2022 at 11:46:37AM +0200, Jan Beulich wrote:
>> On 03.05.2022 16:49, Roger Pau Monn=C3=A9 wrote:
>>> On Mon, Apr 25, 2022 at 10:34:59AM +0200, Jan Beulich wrote:
>>>> For large page mappings to be easily usable (i.e. in particular withou=
t
>>>> un-shattering of smaller page mappings) and for mapping operations to
>>>> then also be more efficient, pass batches of Dom0 memory to iommu_map(=
).
>>>> In dom0_construct_pv() and its helpers (covering strict mode) this
>>>> additionally requires establishing the type of those pages (albeit wit=
h
>>>> zero type references).
>>>
>>> I think it's possible I've already asked this.  Would it make sense to
>>> add the IOMMU mappings in alloc_domheap_pages(), maybe by passing a
>>> specific flag?
>>
>> I don't think you did ask, but now that you do: This would look like a
>> layering violation to me. I don't think allocation should ever have
>> mapping (into the IOMMU or elsewhere) as a "side effect", no matter
>> that ...
>=20
> Hm, I'm certainly not that familiar with PV itself to likely be able
> to make a proper argument here.  I fully agree with you for translated
> guests using a p2m.
>=20
> For PV we currently establish/teardown IOMMU mappings in
> _get_page_type(), which already looks like a layering violation to me,
> hence also doing so in alloc_domheap_pages() wouldn't seem that bad if
> it allows to simplify the resulting code overall.

That's a layering violation too, I agree, but at least it's one central
place.

>>> It would seem to me that doing it that way would also allow the
>>> mappings to get established in blocks for domUs.
>>
>> ... then this would perhaps be possible.
>>
>>>> The installing of zero-ref writable types has in fact shown (observed
>>>> while putting together the change) that despite the intention by the
>>>> XSA-288 changes (affecting DomU-s only) for Dom0 a number of
>>>> sufficiently ordinary pages (at the very least initrd and P2M ones as
>>>> well as pages that are part of the initial allocation but not part of
>>>> the initial mapping) still have been starting out as PGT_none, meaning
>>>> that they would have gained IOMMU mappings only the first time these
>>>> pages would get mapped writably. Consequently an open question is
>>>> whether iommu_memory_setup() should set the pages to PGT_writable_page
>>>> independent of need_iommu_pt_sync().
>>>
>>> I think I'm confused, doesn't the setting of PGT_writable_page happen
>>> as a result of need_iommu_pt_sync() and having those pages added to
>>> the IOMMU page tables? (so they can be properly tracked and IOMMU
>>> mappings are removed if thte page is also removed)
>>
>> In principle yes - in guest_physmap_add_page(). But this function isn't
>> called for the pages I did enumerate in the remark. XSA-288 really only
>> cared about getting this right for DomU-s.
>=20
> Would it make sense to change guest_physmap_add_page() to be able to
> pass the page_order parameter down to iommu_map(), and then use it for
> dom0 build instead of introducing iommu_memory_setup()?

To be quite frank: This is something that I might have been willing to
do months ago, when this series was still fresh. If I was to start
re-doing all of this code now, it would take far more time than it
would have taken back then. Hence I'd like to avoid a full re-work here
unless entirely unacceptable in the way currently done (which largely
fits with how we have been doing Dom0 setup).

Furthermore, guest_physmap_add_page() doesn't itself call iommu_map().
What you're suggesting would require get_page_and_type() to be able to
work on higher-order pages. I view adjustments like this as well out
of scope for this series.

> I think guest_physmap_add_page() will need to be adjusted at some
> point for domUs, and hence it could be unified with dom0 usage
> also?

As an optimization - perhaps. I view it as more important to have HVM
guests work reasonably well (which includes the performance aspect of
setting them up).

>>> If the pages are not added here (because dom0 is not running in strict
>>> mode) then setting PGT_writable_page is not required?
>>
>> Correct - in that case we skip fiddling with IOMMU mappings on
>> transitions to/from PGT_writable_page, and hence putting this type in
>> place would be benign (but improve consistency).
>>
>>>> Note also that strictly speaking the iommu_iotlb_flush_all() here (as
>>>> well as the pre-existing one in arch_iommu_hwdom_init()) shouldn't be
>>>> needed: Actual hooking up (AMD) or enabling of translation (VT-d)
>>>> occurs only afterwards anyway, so nothing can have made it into TLBs
>>>> just yet.
>>>
>>> Hm, indeed. I think the one in arch_iommu_hwdom_init can surely go
>>> away, as we must strictly do the hwdom init before enabling the iommu
>>> itself.
>>
>> Why would that be? That's imo as much of an implementation detail as
>> ...
>=20
> Well, you want to have the reserved/inclusive options applied (and
> mappings created) before enabling the IOMMU, because at that point
> devices have already been assigned.  So it depends more on a
> combination of devices assigned & IOMMU enabled rather than just IOMMU
> being enabled.
>=20
>>> The one in dom0 build I'm less convinced, just to be on the safe side
>>> if we ever change the order of IOMMU init and memory setup.
>>
>> ... this. Just like we populate tables with the IOMMU already enabled
>> for DomU-s, I think the same would be valid to do for Dom0.
>>
>>> I would expect flushing an empty TLB to not be very expensive?
>>
>> I wouldn't "expect" this - it might be this way, but it surely depends
>> on whether an implementation can easily tell whether the TLB is empty,
>> and whether its emptiness actually makes a difference for the latency
>> of a flush operation.
>>
>>>> --- a/xen/drivers/passthrough/x86/iommu.c
>>>> +++ b/xen/drivers/passthrough/x86/iommu.c
>>>> @@ -347,8 +347,8 @@ static unsigned int __hwdom_init hwdom_i
>>>> =20
>>>>  void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
>>>>  {
>>>> -    unsigned long i, top, max_pfn;
>>>> -    unsigned int flush_flags =3D 0;
>>>> +    unsigned long i, top, max_pfn, start, count;
>>>> +    unsigned int flush_flags =3D 0, start_perms =3D 0;
>>>> =20
>>>>      BUG_ON(!is_hardware_domain(d));
>>>> =20
>>>> @@ -379,9 +379,9 @@ void __hwdom_init arch_iommu_hwdom_init(
>>>>       * First Mb will get mapped in one go by pvh_populate_p2m(). Avoi=
d
>>>>       * setting up potentially conflicting mappings here.
>>>>       */
>>>> -    i =3D paging_mode_translate(d) ? PFN_DOWN(MB(1)) : 0;
>>>> +    start =3D paging_mode_translate(d) ? PFN_DOWN(MB(1)) : 0;
>>>> =20
>>>> -    for ( ; i < top; i++ )
>>>> +    for ( i =3D start, count =3D 0; i < top; )
>>>>      {
>>>>          unsigned long pfn =3D pdx_to_pfn(i);
>>>>          unsigned int perms =3D hwdom_iommu_map(d, pfn, max_pfn);
>>>> @@ -390,20 +390,41 @@ void __hwdom_init arch_iommu_hwdom_init(
>>>>          if ( !perms )
>>>>              rc =3D 0;
>>>>          else if ( paging_mode_translate(d) )
>>>> +        {
>>>>              rc =3D p2m_add_identity_entry(d, pfn,
>>>>                                          perms & IOMMUF_writable ? p2m=
_access_rw
>>>>                                                                  : p2m=
_access_r,
>>>>                                          0);
>>>> +            if ( rc )
>>>> +                printk(XENLOG_WARNING
>>>> +                       "%pd: identity mapping of %lx failed: %d\n",
>>>> +                       d, pfn, rc);
>>>> +        }
>>>> +        else if ( pfn !=3D start + count || perms !=3D start_perms )
>>>> +        {
>>>> +        commit:
>>>> +            rc =3D iommu_map(d, _dfn(start), _mfn(start), count, star=
t_perms,
>>>> +                           &flush_flags);
>>>> +            if ( rc )
>>>> +                printk(XENLOG_WARNING
>>>> +                       "%pd: IOMMU identity mapping of [%lx,%lx) fail=
ed: %d\n",
>>>> +                       d, pfn, pfn + count, rc);
>>>> +            SWAP(start, pfn);
>>>> +            start_perms =3D perms;
>>>> +            count =3D 1;
>>>> +        }
>>>>          else
>>>> -            rc =3D iommu_map(d, _dfn(pfn), _mfn(pfn), 1ul << PAGE_ORD=
ER_4K,
>>>> -                           perms, &flush_flags);
>>>> +        {
>>>> +            ++count;
>>>> +            rc =3D 0;
>>>
>>> Seeing as we want to process this in blocks now, I wonder whether it
>>> would make sense to take a different approach, and use a rangeset to
>>> track which regions need to be mapped.  What gets added would be based
>>> on the host e820 plus the options
>>> iommu_hwdom_{strict,inclusive,reserved}.  We would then punch holes
>>> based on the logic in hwdom_iommu_map() and finally we could iterate
>>> over the regions afterwards using rangeset_consume_ranges().
>>>
>>> Not that you strictly need to do it here, just think the end result
>>> would be clearer.
>>
>> The end result might indeed be, but it would be more of a change right
>> here. Hence I'd prefer to leave that out of the series for now.
>=20
> OK.  I think it might be nice to add a comment in that regard, mostly
> because I tend to forget myself.

Sure, I've added another post-commit-message remark.

Jan


