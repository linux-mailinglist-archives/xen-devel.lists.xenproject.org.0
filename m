Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A3052B7B5
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 12:26:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331911.555536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrGse-000816-B7; Wed, 18 May 2022 10:26:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331911.555536; Wed, 18 May 2022 10:26:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrGse-0007yN-7f; Wed, 18 May 2022 10:26:12 +0000
Received: by outflank-mailman (input) for mailman id 331911;
 Wed, 18 May 2022 10:26:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nrGsc-0007yH-TH
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 10:26:10 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eee01b2e-d694-11ec-bd2c-47488cf2e6aa;
 Wed, 18 May 2022 12:26:09 +0200 (CEST)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2052.outbound.protection.outlook.com [104.47.2.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-34-08_ARvgmNw6PfkPLAlGH4Q-1; Wed, 18 May 2022 12:26:08 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7347.eurprd04.prod.outlook.com (2603:10a6:20b:1d0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Wed, 18 May
 2022 10:26:06 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.014; Wed, 18 May 2022
 10:26:06 +0000
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
X-Inumbo-ID: eee01b2e-d694-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1652869569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pmGU5NItwdQtckzwIkwK1lEXygQooNH5fZX2CyiXxW8=;
	b=WA1KKCHIgsmzj1NswFSUl/a9hTgSx52wlvHSDWQ1m5HYNMurfX7MZl/+FvEAqzxyNooEnY
	jwPxx/DLYwKubATzO8QQiSkHCURYTAV5oSdFuVB6DtYlRGzkq7LDxQ0ptPJgLak3ez+DFd
	VgpATYLeIuOucglnxY5znxCDCISpPPU=
X-MC-Unique: 08_ARvgmNw6PfkPLAlGH4Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kjI8N/Xx7kF3tWhxC1SVU2atY7AQMT6KOfgXU8OCWUcnvnKBYCY+V3plZXCFezkcu0YJtKqQY3BMIbirXwI+WCgHgHta8YKqDHlyic8dBHIukipmeQrxY/ZkBl+QItvO5PPe6jFtE+/kA6EfyzbquddwQZ4mSJ7DCcXB0UlE35QqwqtBxDNSaH6v9eO0F19VUPfFKnAvfzGk3x6Zp7QzEL5pKYm4ilyeVLqudJS66z7LIXrU4Q6I3izqYnlxufW3419NfRl4aKaOykK3zhA/o0G9vSf+mf3W6gZnkBUcPAWKq5ERV1JgSamVvpvrBz5f2kucHwDlU6Pbr76BvruKfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BEXgRyi4Kx70iWWfzPx0MrfXl2zNjsllzDLpLgsv1+8=;
 b=CN/4gNHiLl+u0Ho3z4/Y+xJ1eA48ke0JjVRgsi8Vdya5SH3jnsd62TDiIoVc8MkQpeNzdU3/T2Tqxj2VeuDQbAMFS1EcbgbcLdWSi425mjyFQc3ZgcHr85kcKrmq9cBUSubS6Yu9uqtzn76KmHQbo7iE+CIA71zKM9ApBn5njrVje5/V3ZGns2Y9xpInDsjqbNliGZE0yKn2HH0lawq/zjrKKQtFWiGC5snMk29t1M/4lAidDjgRjLSHvQBRDDQbrnPBnX8xHZaj439Fxo4q2tIAeNwXofNxxbNJ6AgzmCs7kMsA2DP8Y2SRht/jGq9e6FDjEUzC9SNXgDfBPTe3bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <597c3630-b69f-e885-bb08-a52d2c6e7f92@suse.com>
Date: Wed, 18 May 2022 12:26:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v4 16/21] VT-d: free all-empty page tables
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Kevin Tian <kevin.tian@intel.com>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <b9a2be8d-3bb9-3718-6e3b-f07f6dcdde20@suse.com>
 <Ynp2+faOjZguAUVP@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Ynp2+faOjZguAUVP@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0107.eurprd06.prod.outlook.com
 (2603:10a6:20b:465::31) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ee8287e-9919-49d6-f93e-08da38b8d11a
X-MS-TrafficTypeDiagnostic: AM8PR04MB7347:EE_
X-Microsoft-Antispam-PRVS:
	<AM8PR04MB7347FA0169C08B9494FE8252B3D19@AM8PR04MB7347.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Gd4khmBtLycO6GdGkZCcerrMF8N6hKw0vsTA0smdDjimqLoj2jIAbnJ/Xg1aheABi6l1o9sU/eooh1V/CCSs83WEUVaIaFMccuwqUdR04j2LsbBvJ14U+aG3jQAKQKM8UToyrCXGg68LfWyNETEk2zVTxMDaE0oNzxrCQqt0P7V0KcYJYhcH0Plh1izms37QbllpBKdzwj+7CQeWU17RN9NvgguUGYo9ejcmkVDjLuspGxQ22niPBvJcU9pjpUtDjAYGAK/9/BoG0smHpdfIdkywThyy29j72b140AyaXVVCUm9QTFkIIY4TtClNB/SKJ3NnoxIfQZv/xWrS2yKPtSCMEH0tJUzHgPM3J/cvytV0gEdOB+qzmYsAwpgDU4Rpu5P1fn2j4f8ikQ2mIRXSwzVmiib3b6t4F+8edk7U9xvvnIyduIhYY3O+onlxpcwOHq8Hk4foPqMOSSidNxb4iTjsYy0GFCpB+ZoT7tp4QeL6MqzJOIMnxNXAI4uMn+z+K3uc9rfLt9G6aVVso8rfiY5bBgq5JcVCmaVFxroiO9/qYG6WXwB/llx6s4Q8kQjL2hSJY6cV25b6ZqFFPLW3dmrPFQArNAq9+iw78qrkwCmRzlOc12iVXP0B6CRqgnyh5y5M9Vny71UhFqIb1muZZMvpMGc+2PGHF3i5YKmYKL5B1/vpEFx29FjqrOnL/NKwvHe0TmY8PzTIH0o7hONHUjLVQVoFrclnrJ7n87+Ry8xC6Tv8f4/EwRFSaqHlQjMb
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(6666004)(508600001)(5660300002)(31696002)(8676002)(54906003)(66946007)(6916009)(6486002)(4326008)(86362001)(316002)(66476007)(66556008)(186003)(6512007)(31686004)(2616005)(53546011)(26005)(6506007)(2906002)(83380400001)(36756003)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xtaSdrGfpsQjJzm/8/K3ur5Euz5nL3ae4OF3WdqtZ2Ka+0VcOvmfHlso/O9b?=
 =?us-ascii?Q?zAhqniMgMu43LMEvEEvwOlhca0vxuoNe5WgknYGqSlgiq0VVl7D6BD0OnR6U?=
 =?us-ascii?Q?ptuuHSB1ddGzfL3ZCgwvQgG40+H4uQl5YU5Am5O0I5DlAcwl6wbd23pIz1o3?=
 =?us-ascii?Q?d6G4ROD2Fi1SVtGDgQ6i7/QCEaMsy3JWC4UgJti9XzCtU+dMuQZWaw8C6zha?=
 =?us-ascii?Q?LBfNN2Q1QC9HEcWNXtA9qcNwYeNSZ00jaFGJ6SPrmjhHb2VdgrxxeVwP6UvP?=
 =?us-ascii?Q?twnDB7LckMQoyHw4m2UIPvM4qyMMvaco/xEjV3KBtPqoxGWCNQVFQJnJzn3E?=
 =?us-ascii?Q?qrUc1dAMagJS9ENV+FHKMcH95+RuYTN7o0/UWpB+SF3kHbfTStUrkGEaRjNr?=
 =?us-ascii?Q?VOWHvancgZt/IrNg9K51OwDdHka6gxydfifhbcitwhEfIpbW+5qFuszU2veU?=
 =?us-ascii?Q?02tGAHBY4yPyngrdEtUifImnnaoTUOFbVDLMQoRE/kZDsKXH+s4ch7nUw7h1?=
 =?us-ascii?Q?GQS5iQ01Zf35ZIeEAvV7NrDHLIR9Ls0LRe+VjHtPqTUqzZABZ3GzSQopFU4U?=
 =?us-ascii?Q?0eoXCBiW9lqmFYHGYHCxgOod1gIbgpVjEUj2uSlBVLZF/IJTO5W04MnGJKFN?=
 =?us-ascii?Q?fLit76ktJPJUpAplvtp+MoZmq26+a7Oa3UH/6Gl0MB6xBAPBSpUaUsAT2tws?=
 =?us-ascii?Q?zH0WwYQyyVHm0dvYkhOl+lUfY5IMr+HCrDKogFVWixwNK5Q9w+cHG+ywbc5j?=
 =?us-ascii?Q?FvxyJPDm4nni5Ag0OaJ/EkQyVLgjRkD7h5qDZf8F9TIpTCcM31jZfpodOOKp?=
 =?us-ascii?Q?NB/8ml9X26FIsttq9yXmtL5sxfXqG3UxkbyVyKIhcbSA5NC5RhkniCCN88bL?=
 =?us-ascii?Q?i/NQqLkIjELa5s8wdfGw0CL5jOzq6pfFnDEv7eXuGOcsKH/79rG18b2yOlJ4?=
 =?us-ascii?Q?hV9+W3mhmoztd1GVW9yCQmjuFRwwgX6+d+oP9ezvFF95az5r6YS4RLUcL4UW?=
 =?us-ascii?Q?mcZ4+h8EGKSTkIa5HEwrHPNDyN1qJTNZiCP1FN7LwHfoqSnxRvrD/Lyb4k+t?=
 =?us-ascii?Q?RHI2KVonUwo37gDSBBfJ8vGW7gvVfiGeheE2NayJuA2f5iTQTGdyGjQmBgja?=
 =?us-ascii?Q?7K9kQJHsoO54076WYcZFXNxAdKbGklFTWIBZDCeBpUKKI1yj1dto333zNmin?=
 =?us-ascii?Q?icLFgRMtlh0TxIbyFj7CQ259Gp9hAdOURHWadCtkV3B0z9Itrbo1szLtcDuX?=
 =?us-ascii?Q?61cbTzoWKoSAO2bkZ/30OQ4y3dk2DnSndtUH8cEOFIA0+vksZSb0KlQHkfBG?=
 =?us-ascii?Q?Ni6tHy+vl3FJLUxgP0KOsE86mB+n/yN0xIZa3+gSq/8q0fVVq+zklzbH2PcU?=
 =?us-ascii?Q?dQ0xcQkAretqcwrUOG6cYWVnM3DLTWZ9Qj0S1QYMeechdegkbLrqZWZETaz6?=
 =?us-ascii?Q?64H81fBa4N0ynQLBVOgSwamEeG1aTNRQ3zkG52qAG4xyXQi4ivizOZ7veS7f?=
 =?us-ascii?Q?B6eD0zlxA/UqwmL+yIg33P2hoW3DrBqCfABb0bn8wIu2E5g639gp0KbpFSSl?=
 =?us-ascii?Q?EbvycCLOaoz3hk8KGDWIY7O0l6IaxRfbaKs0lQI/upoRBqkI2DfiQYz4p5oM?=
 =?us-ascii?Q?muSM6ZnhXCyXgDpsMR5k6ZkUCSRzRXZtrZOEcHIiQo1qXtvhOfik0TgxtXSi?=
 =?us-ascii?Q?JHML7eE/dQ3/e0kWpDYHCL524qmLpekF8k2fBLfTCyKNbmD5zaQBPEqKdv0U?=
 =?us-ascii?Q?ywOmr9zMxw=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ee8287e-9919-49d6-f93e-08da38b8d11a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2022 10:26:06.5315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PVBwRRLEkI0mMKte0iEHFSpjwEOlVroE52KKRBUxnV1utn9Af9HbS9xRwLEyUjkizLn2uDWOe+US1qB6H7RuoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7347

On 10.05.2022 16:30, Roger Pau Monn=C3=A9 wrote:
> On Mon, Apr 25, 2022 at 10:42:50AM +0200, Jan Beulich wrote:
>> When a page table ends up with no present entries left, it can be
>> replaced by a non-present entry at the next higher level. The page table
>> itself can then be scheduled for freeing.
>>
>> Note that while its output isn't used there yet,
>> pt_update_contig_markers() right away needs to be called in all places
>> where entries get updated, not just the one where entries get cleared.
>>
>> Note further that while pt_update_contig_markers() updates perhaps
>> several PTEs within the table, since these are changes to "avail" bits
>> only I do not think that cache flushing would be needed afterwards. Such
>> cache flushing (of entire pages, unless adding yet more logic to me more
>> selective) would be quite noticable performance-wise (very prominent
>> during Dom0 boot).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> v4: Re-base over changes earlier in the series.
>> v3: Properly bound loop. Re-base over changes earlier in the series.
>> v2: New.
>> ---
>> The hang during boot on my Latitude E6410 (see the respective code
>> comment) was pretty close after iommu_enable_translation(). No errors,
>> no watchdog would kick in, just sometimes the first few pixel lines of
>> the next log message's (XEN) prefix would have made it out to the screen
>> (and there's no serial there). It's been a lot of experimenting until I
>> figured the workaround (which I consider ugly, but halfway acceptable).
>> I've been trying hard to make sure the workaround wouldn't be masking a
>> real issue, yet I'm still wary of it possibly doing so ... My best guess
>> at this point is that on these old IOMMUs the ignored bits 52...61
>> aren't really ignored for present entries, but also aren't "reserved"
>> enough to trigger faults. This guess is from having tried to set other
>> bits in this range (unconditionally, and with the workaround here in
>> place), which yielded the same behavior.
>=20
> Should we take Kevin's Reviewed-by as a heads up that bits 52..61 on
> some? IOMMUs are not usable?
>=20
> Would be good if we could get a more formal response I think.

A more formal response would be nice, but given the age of the affected
hardware I don't expect anything more will be done there by Intel.

>> @@ -405,6 +408,9 @@ static uint64_t addr_to_dma_page_maddr(s
>> =20
>>              write_atomic(&pte->val, new_pte.val);
>>              iommu_sync_cache(pte, sizeof(struct dma_pte));
>> +            pt_update_contig_markers(&parent->val,
>> +                                     address_level_offset(addr, level),
>=20
> I think (unless previous patches in the series have changed this)
> there already is an 'offset' local variable that you could use.

The variable is clobbered by "IOMMU/x86: prefill newly allocate page
tables".

>> @@ -837,9 +843,31 @@ static int dma_pte_clear_one(struct doma
>> =20
>>      old =3D *pte;
>>      dma_clear_pte(*pte);
>> +    iommu_sync_cache(pte, sizeof(*pte));
>> +
>> +    while ( pt_update_contig_markers(&page->val,
>> +                                     address_level_offset(addr, level),
>> +                                     level, PTE_kind_null) &&
>> +            ++level < min_pt_levels )
>> +    {
>> +        struct page_info *pg =3D maddr_to_page(pg_maddr);
>> +
>> +        unmap_vtd_domain_page(page);
>> +
>> +        pg_maddr =3D addr_to_dma_page_maddr(domain, addr, level, flush_=
flags,
>> +                                          false);
>> +        BUG_ON(pg_maddr < PAGE_SIZE);
>> +
>> +        page =3D map_vtd_domain_page(pg_maddr);
>> +        pte =3D &page[address_level_offset(addr, level)];
>> +        dma_clear_pte(*pte);
>> +        iommu_sync_cache(pte, sizeof(*pte));
>> +
>> +        *flush_flags |=3D IOMMU_FLUSHF_all;
>> +        iommu_queue_free_pgtable(hd, pg);
>> +    }
>=20
> I think I'm setting myself for trouble, but do we need to sync cache
> the lower lever entries if higher level ones are to be changed.
>=20
> IOW, would it be fine to just flush the highest level modified PTE?
> As the lower lever ones won't be reachable anyway.

I definitely want to err on the safe side here. If later we can
prove that some cache flush is unneeded, I'd be happy to see it
go away.

>> @@ -2182,8 +2210,21 @@ static int __must_check cf_check intel_i
>>      }
>> =20
>>      *pte =3D new;
>> -
>>      iommu_sync_cache(pte, sizeof(struct dma_pte));
>> +
>> +    /*
>> +     * While the (ab)use of PTE_kind_table here allows to save some wor=
k in
>> +     * the function, the main motivation for it is that it avoids a so =
far
>> +     * unexplained hang during boot (while preparing Dom0) on a Westmer=
e
>> +     * based laptop.
>> +     */
>> +    pt_update_contig_markers(&page->val,
>> +                             address_level_offset(dfn_to_daddr(dfn), le=
vel),
>> +                             level,
>> +                             (hd->platform_ops->page_sizes &
>> +                              (1UL << level_to_offset_bits(level + 1))
>> +                              ? PTE_kind_leaf : PTE_kind_table));
>=20
> So this works because on what we believe to be affected models the
> only supported page sizes are 4K?

Yes.

> Do we want to do the same with AMD if we don't allow 512G super pages?

Why? They don't have a similar flaw.

Jan


