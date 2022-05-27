Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E7E535AB8
	for <lists+xen-devel@lfdr.de>; Fri, 27 May 2022 09:53:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337860.562572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuUmU-0001I1-10; Fri, 27 May 2022 07:53:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337860.562572; Fri, 27 May 2022 07:53:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuUmT-0001Fo-U7; Fri, 27 May 2022 07:53:09 +0000
Received: by outflank-mailman (input) for mailman id 337860;
 Fri, 27 May 2022 07:53:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0f/x=WD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nuUmS-0001Ff-Jn
 for xen-devel@lists.xenproject.org; Fri, 27 May 2022 07:53:08 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b94bc6c-dd92-11ec-bd2c-47488cf2e6aa;
 Fri, 27 May 2022 09:53:07 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2055.outbound.protection.outlook.com [104.47.13.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-22-Bewh6a0SPey-B_CE2LgD-Q-1; Fri, 27 May 2022 09:53:05 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR0402MB3693.eurprd04.prod.outlook.com (2603:10a6:803:18::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Fri, 27 May
 2022 07:53:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.013; Fri, 27 May 2022
 07:53:03 +0000
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
X-Inumbo-ID: 0b94bc6c-dd92-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653637986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G9C1HRqc1iVS2s5tgGNBJQHT0+CjR0l3XVIp0LNrG/U=;
	b=hhj+XiauBnCz4+q78Pda8oyGbhFbUvs2ILKEYWhzfKutdjYTwgjn1kPiAfNNA0qhG67+YD
	ferl+iUGTVDXJjV9iE68LK77NQ6qGfQwmtf34dAqzjluCgLRf6Vc2XIZmDh4ftwBnxfFBY
	Odpl5I7yKyaRG1HtYESUgDYy3JRrDyg=
X-MC-Unique: Bewh6a0SPey-B_CE2LgD-Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YW5rkfpyj17XMAC+dZ1UvtfFXJhXVPNpyqJ5FHjls2n2ZMFMjYubCUiR8/A55DLvO8HaXwHzs7jr5cc3CL7q0yShyB8/5cjeGqx7Kb47ABtcUBrHcfeQfpW1SymGaBetl4tJDusMazZXhGCNqycUL4LPU5ZOwZj5ETN8je7/QektG7Mjx66m/O8tzRSvi3piT29QBL5TTiOuBdMBOZkTGm8o4Gm7PFewZfN2AoO6OljbPyorA4SNSeD5DAkNJuBHEeCYjhkilGp97jotYMAjsI1EISfz6IEh/lUEffPHof6O2CJYhXuQEbfa6B2CJmeT5snERy7Z4aZYLFOiioUZIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VSvPm7R1X0XleUpi6y49OWGYaku6iZiDPSjq4GztORo=;
 b=e4OsjCDFxmKfjC1/ipyOF33psOpdbRAmMX90Xvh8BAbQtLV9YFdG4KLp/a9I34q1mwPePJghkh7FRyeQOlhTaMpuEINHmziK1BFRWjvFE4N9eJRS58UmDdIe/sns0up7gIjeVNxCK2gdn9xWV98ZLQfA4MEho+4cMr0zagO/cdrib0x6FvXB89n002QWRLalZAjAwfuKMdCDkF7sE99MisN6UQv5I7ivfHVG2MMzjQsjD1ETkrKTnqBdYr4pGOVRkMRld16A5hKRlOtxzEej0Zzr9qAIC+J7DHvUa6Yx6Kk7gQAnbPuHud7yOskez1silTbLXLAWNZpOd1gsnSscSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <91536f56-a94f-273c-4364-cfd5a24078e2@suse.com>
Date: Fri, 27 May 2022 09:53:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 16/21] VT-d: free all-empty page tables
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Kevin Tian <kevin.tian@intel.com>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <b9a2be8d-3bb9-3718-6e3b-f07f6dcdde20@suse.com>
 <Ynp2+faOjZguAUVP@Air-de-Roger>
 <597c3630-b69f-e885-bb08-a52d2c6e7f92@suse.com>
 <Yod3vjK44nfgvw8f@Air-de-Roger>
 <bfe87358-db9d-7c9e-d691-aee33f07bae7@suse.com>
In-Reply-To: <bfe87358-db9d-7c9e-d691-aee33f07bae7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P194CA0105.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::46) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b2762a93-c0ef-4a80-29bd-08da3fb5ed81
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3693:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3693B34C0B359E0352DDD077B3D89@VI1PR0402MB3693.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WXnQCcQ3/efUPmRcR7X3i+0uCfavbkaZzeOSogkyfIXhJGxN8+dh49nnUV31gZ765I6e1cfW0pYgXAqKTn8GWtEcjq8JMVpmZz/BNSGpKezrH5Us5QL02GEBbmmKf/T6XnolIMnDj3gMvnUAUCOFG0Se2XdBEeHEz9NyqANPMfJfl6ic3AVAhRbA1pxuvck0VLaRQutYgpbKLThoIpqdVdYRs+XNFqSE5yrfaT6wQO4M5dI943Fp8LUjSNVJVKNvQ27IpXaHa8aABub0A63fdgYBjX8xqazOJeNEk7jLKljmL8P/rw5npX39ca0w11giYAC33emrZnsvMV8mmYyyUTzsaohgs3mQk2hqcj5ZZ+H9QkN1G5s6/Np7xsH8VvzQ0sH4gs6NBRTSs3qyvYnFbuKpUpiIZxCy8+EbW2a+2JiXIpqZintmZOA9B7WNK2kRGIjK+i5VdlYWP8f89N/6nRfCGs49wcQ+mHVnmeEn2Y7mTULK1T33zXxwYawdaS69fAdQ+PxLKX8Mayv5bhDRYJZa6iPivNNvNIm34hf6kccnGmPjuZhDSopm+mAWm6TIIrZ+wIcKvXU7gzmMtFbOi2/8iuTkUxwi/WjBBxv1bk5TOjijYJkngDNiG1OOafhe6BAIUIMamCtWV+5Nxt8sWthsQQBnCEiHX135o42GD9AdU3yDp6LsbWhcOFNOSiMBasEShSgdYjwW9ocqPgQbWvBKhA4QTjGmKRXsLJLQheObt3w5hap8s46htxd1rEAi
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(186003)(66946007)(66476007)(66556008)(4326008)(8676002)(31696002)(2616005)(2906002)(86362001)(5660300002)(38100700002)(8936002)(31686004)(6512007)(36756003)(6506007)(316002)(53546011)(26005)(6486002)(508600001)(6916009)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dLI2Is47n/xf2smmkxpI83piagEYrbtHJav2qfuPHqcqra7rjHFzBK86o+WK?=
 =?us-ascii?Q?avjaTDeOF1puOWV8uAMHgHk+zBn5p4LWWgqmwafVOkU3XbXPH0D3bEZ4dPYV?=
 =?us-ascii?Q?ATF0O8XDkhq4VF1ljakNKqfX08o1SRRO3VMhmrxRTR+fn4TtZN6KX0WVctrA?=
 =?us-ascii?Q?hC9MIg810eQ+JlV5TZwjZ8oJ+IbQVRlwutr5EOfAEjhNCSHkL15qHYayoHda?=
 =?us-ascii?Q?U91UAJcW9AvUr53hb7ypPtEok/IVZRO0/SUZ2KFVGMEQfk2ljE5pPPW9Ri+c?=
 =?us-ascii?Q?Nt4BwjVRDOBPUSCH+OZ3Es3zdHSdlz3qH7HZLLvHiMmgr5sYA09UrPwUrK6y?=
 =?us-ascii?Q?uEq+hs9I60xca0i0eAh+uLWCd+iCMS1VVNaq7xE5WlqM1NYvJjjNXBEoSxhk?=
 =?us-ascii?Q?SN+2HTT9gEyeBo/5Eo8WjgGjoiOmJTsRZG8Se1hW1D3YpAwm0J7MBK4ULjkW?=
 =?us-ascii?Q?Hh9cGI/th1jKZt8+CREnVT30i2e06fIBndDTp8L1e3hjc35OhiLEzQCwJKQ0?=
 =?us-ascii?Q?utxRuwtOEikOn4ZPoNAwpeHrTYh/2EUIy7vusQV93jDLTSi5rjwKkEHb7Prg?=
 =?us-ascii?Q?U57qhODlaJ+FeGKhXUiczK4I8VV45kSPKs5rxpa5UdBuXOBgqIzgLBCHey9c?=
 =?us-ascii?Q?RZPlrVPc4EN5kQ/gJ1jqa0Kbk74qUNwrgZTDUynMET38Ika82cIZbkHInmbz?=
 =?us-ascii?Q?JjcDUI3aaw+Z9xO5CJlroA3D6E6OeFxF2vn/kS1uCoCrxF0PrGXbp+SV1mPd?=
 =?us-ascii?Q?0f1YmmRvZT1FMYCmVyBCXb3SdckCh5TRNMBPlRH2V+csF0p3mDc5hgyygB1J?=
 =?us-ascii?Q?Xlat+PP9SpAkjvoNM6nRAMwuLAd36qjBw7GuT6Q5x2ZlKiMC/E4DbS70i8Xe?=
 =?us-ascii?Q?kStkt2uoN7DSl56S5/TM7Z3aDPGqKJYk2JBmgOIWXPDH3oW5U/Rk28S6qVMw?=
 =?us-ascii?Q?TEPzIxLdSFnRCSi7kGHX1DjTVrYDDvMT6UBZk9C4jntT3GBRr12Gto7AvX3E?=
 =?us-ascii?Q?HBfBUSan0AxnC6bVFbYhBcrAJmdvDL64wDZjpeRicCmFvMmiplm0bKEpVq17?=
 =?us-ascii?Q?O08W8YBjtMKQ06kmIKnteU56L3FQjPS6hgq5pMVXAf4YxsCKPmrRvHYSBgvJ?=
 =?us-ascii?Q?fy4fPGt4ILmNhmRWCKxU3iuMv63bGIsSkxZdxIDzsuy+Nv22EPLtqLG3qAwz?=
 =?us-ascii?Q?JdYzejqPdIZ6zGCJEUVcBaNCb/UTFpZG2GGok27QJtt3+V7+JYyLawFI7BHL?=
 =?us-ascii?Q?4JUcu+Jcm6dfiMvgM9lSBm9GZpWZTV5AdUBGLKM72O58+KZvLvjN97QLdqbT?=
 =?us-ascii?Q?RwE0Q/5w5n+bkWQgQrlOcMgUKA0pcpciYlha/J8l7x0lMgGsMtN7+BnR6u2N?=
 =?us-ascii?Q?mSa/ZWKhXYli3SI8nQzBKK7IP3i81sfGSjuXabTLCpTEHcOlXZxfv3YLhsmR?=
 =?us-ascii?Q?gbmgMzrsc2SweCPzB0wZsPoI0Vi25kprXCKdSRF+yeEJ4vJkVukCtol/G9fJ?=
 =?us-ascii?Q?pCtyIqMpwW7hHQjHjoGoY3KQVy7N2WDKXWbr0dBltYnOr8dkRBU+XzxOCXMR?=
 =?us-ascii?Q?dolUF0DufJ9kv8+HwZHLQ+3uhkk5oqE7Kjs1+hMR0BqsZFJm1YrBmZBPK7CV?=
 =?us-ascii?Q?Z9NumcFz0j8RT50uz6oZBjeBxqSlrSgnMtUv5FethQBae0Vpkeh7EDqxKFPf?=
 =?us-ascii?Q?xZSeDkNethsvXT6BpnWq18ClX+mHTsJoYhQ2Yyz9KlYbx9oT7LYtPvVUMt5K?=
 =?us-ascii?Q?OJz8VonlMw=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2762a93-c0ef-4a80-29bd-08da3fb5ed81
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2022 07:53:03.4516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X7lQyN+jhQpTB05IdDbyVvPHZALEBLjdW2OAqCEHlyrdm3KGkiGNTrx051sf/7tGtNxkhkjCDydQlWRO2XKKnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3693

On 27.05.2022 09:40, Jan Beulich wrote:
> On 20.05.2022 13:13, Roger Pau Monn=C3=A9 wrote:
>> On Wed, May 18, 2022 at 12:26:03PM +0200, Jan Beulich wrote:
>>> On 10.05.2022 16:30, Roger Pau Monn=C3=A9 wrote:
>>>> On Mon, Apr 25, 2022 at 10:42:50AM +0200, Jan Beulich wrote:
>>>>> @@ -837,9 +843,31 @@ static int dma_pte_clear_one(struct doma
>>>>> =20
>>>>>      old =3D *pte;
>>>>>      dma_clear_pte(*pte);
>>>>> +    iommu_sync_cache(pte, sizeof(*pte));
>>>>> +
>>>>> +    while ( pt_update_contig_markers(&page->val,
>>>>> +                                     address_level_offset(addr, leve=
l),
>>>>> +                                     level, PTE_kind_null) &&
>>>>> +            ++level < min_pt_levels )
>>>>> +    {
>>>>> +        struct page_info *pg =3D maddr_to_page(pg_maddr);
>>>>> +
>>>>> +        unmap_vtd_domain_page(page);
>>>>> +
>>>>> +        pg_maddr =3D addr_to_dma_page_maddr(domain, addr, level, flu=
sh_flags,
>>>>> +                                          false);
>>>>> +        BUG_ON(pg_maddr < PAGE_SIZE);
>>>>> +
>>>>> +        page =3D map_vtd_domain_page(pg_maddr);
>>>>> +        pte =3D &page[address_level_offset(addr, level)];
>>>>> +        dma_clear_pte(*pte);
>>>>> +        iommu_sync_cache(pte, sizeof(*pte));
>>>>> +
>>>>> +        *flush_flags |=3D IOMMU_FLUSHF_all;
>>>>> +        iommu_queue_free_pgtable(hd, pg);
>>>>> +    }
>>>>
>>>> I think I'm setting myself for trouble, but do we need to sync cache
>>>> the lower lever entries if higher level ones are to be changed.
>>>>
>>>> IOW, would it be fine to just flush the highest level modified PTE?
>>>> As the lower lever ones won't be reachable anyway.
>>>
>>> I definitely want to err on the safe side here. If later we can
>>> prove that some cache flush is unneeded, I'd be happy to see it
>>> go away.
>>
>> Hm, so it's not only about adding more cache flushes, but moving them
>> inside of the locked region: previously the only cache flush was done
>> outside of the locked region.
>>
>> I guess I can't convince myself why we would need to flush cache of
>> entries that are to be removed, and that also point to pages scheduled
>> to be freed.
>=20
> As previously said - with a series like this I wanted to strictly be
> on the safe side, maintaining the pre-existing pattern of all
> modifications of live tables being accompanied by a flush (if flushes
> are needed in the first place, of course). As to moving flushes into
> the locked region, I don't view this as a problem, seeing in
> particular that elsewhere we already have flushes with the lock held
> (at the very least the _full page_ one in addr_to_dma_page_maddr(),
> but also e.g. in intel_iommu_map_page(), where it could be easily
> moved past the unlock).
>=20
> If you (continue to) think that breaking the present pattern isn't
> going to misguide future changes, I can certainly drop these not
> really necessary flushes. Otoh I was actually considering to,
> subsequently, integrate the flushes into e.g. dma_clear_pte() to
> make it virtually impossible to break that pattern. This would
> imply that all page table related flushes would then occur with the
> lock held.
>=20
> (I won't separately reply to the similar topic on patch 18.)

Oh, one more (formal / minor) aspect: Changing when to (not) flush
would also invalidate Kevin's R-b which I've got already for both
this and the later, similarly affected patch.

Jan


