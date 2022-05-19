Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A694152D225
	for <lists+xen-devel@lfdr.de>; Thu, 19 May 2022 14:12:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332874.556642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrf0o-0000Pk-BV; Thu, 19 May 2022 12:12:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332874.556642; Thu, 19 May 2022 12:12:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrf0o-0000NG-7s; Thu, 19 May 2022 12:12:14 +0000
Received: by outflank-mailman (input) for mailman id 332874;
 Thu, 19 May 2022 12:12:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zL4X=V3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nrf0m-0000Mm-OT
 for xen-devel@lists.xenproject.org; Thu, 19 May 2022 12:12:12 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9290906-d76c-11ec-bd2c-47488cf2e6aa;
 Thu, 19 May 2022 14:12:11 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2051.outbound.protection.outlook.com [104.47.12.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-3-FbQc3NKYMi6lnrlHbzcS1Q-1; Thu, 19 May 2022 14:12:09 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9343.eurprd04.prod.outlook.com (2603:10a6:102:2a7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Thu, 19 May
 2022 12:12:07 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.016; Thu, 19 May 2022
 12:12:07 +0000
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
X-Inumbo-ID: e9290906-d76c-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1652962331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b5ga6yALPUAqDCnoSZUd/muUM4D2vsSXqVizLBb/0Nw=;
	b=cFvauXg4r20zk16RPOsJxwyvaGJ9+/E4fyu6kNClndX6URl/Nbl11dfJC866Z/kQnqUf4k
	tL6Av8eOui/QnSxm+w0zaiP6uLWqE+uQtI0kRwKC8U9IhrRcjOv5AYVb4XWTKr/GtpfNvQ
	X/xGG3cruXm5bqZALxMyZOGC/uoMY2Y=
X-MC-Unique: FbQc3NKYMi6lnrlHbzcS1Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mrHgEkKElhNbdz18OKCAS2qyp7R4nslFZxwu/ZfRBEQeED4UnWTvlU5IDZfUFP4ccpmju7u2wFUnIBgs7DBAFrkWBG+O9mJ0J5jwaDXrZ5GqwM9Q3MZy6kAHwdmsNm308cipjbN3JmCJITZZLnopTihdU7lKYkRrRaosKzdXowoMcaXVg64827MIkzByH1SQ4R5eoSpcnpJYo/LkP2WjA/mnbHAs8qZoReuHGJvfRWRP3w5cUwChGvJX0ZRarKLTyNJpMEntWG8Z2CKKwZL1lXyr9zYlpTifaspl4/AS/nwH5E8QrT9lsVNSvPI0uYVYsrkMq2baegQ1rWzCfXwBRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8KdnmbeScEm0NJAmg+0qpTXR6rHCOI4fCV4TpPpLV64=;
 b=P61VkcH96GEx+ZpEOOUryobC2RWPOBBwaE7les21thUQw2xLU4NQG+LKzEg7EAd3mP0bpf5thz+WvC/eEiAa7Iy+xtx/o2xyirynfuppZQsNI4Wqjy6+1/L4gyd+l26ifkh1wr+HZq8R0OaUXEQ+2gD2UjhpuTiMB7UpuosmnbwgPQZjQuKwzgqh8SFICjriZiBoEgcIFz3nA+klkaJdBsZGo0UrYlDUmczvSOeWXPACkX/dWQQXqAQ7V7RJawq38gjjyNx7Nb3PGG6mMXuPYxsg4OrjcTshziRLMDfFi8w7MlTmTlFjN1v2p5oQ7+8zGcI01dTnzT5zeJTL+ZXZ7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6666ab70-b68a-eac5-a632-893f950a984a@suse.com>
Date: Thu, 19 May 2022 14:12:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v4 13/21] IOMMU/x86: prefill newly allocate page tables
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <9d073a05-0c7d-4989-7a38-93cd5b01d071@suse.com>
 <YnUDeR5feSsmbCVF@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YnUDeR5feSsmbCVF@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0310.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bae4c71d-d430-4249-4d8f-08da3990cb0b
X-MS-TrafficTypeDiagnostic: PA4PR04MB9343:EE_
X-Microsoft-Antispam-PRVS:
	<PA4PR04MB9343BED1B8441F598ED087C3B3D09@PA4PR04MB9343.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UM2N4i+OO/UCi6bVOOUtTi84lWuIO7hf7jSAORhcTItDbl1LvZ3BTGJPlQPMW4AzRNybDseHPqZP7ekTXATzySH59kHUXJ9y2DoPtFs86Un08FE8Y3TRg5WzXLxpbfqm5K87vG9EeFb84uSXKCM+zUB86q8nl3rbY7awJaP4esBkrN6oA9Q8TlJ+6CmpOhUIn7J6NxJL/yUuIFk/O71M2nDTW8tSQxCq0pseOmoX4oqztvhnS6kgPHqcxOZczHvftGvJAhz9q9RuWbK0wREyOfCJXzQeu+/Hu83ois+3w5sZ4tQveX4CGIdR11u3jgAgwOKBWqH4T0oE2P8fwbYRgHjqNqe/dyPWzYdNalrWPNYIw/xJBnHejErJid33CUdYL0N9YE1lk+MnstWBXjbDIlcmSEN36KAVCGUiQZfvUKkJBzcYZCBGrOgcFQUzyoT9gzE7oJGUeVni+Zy8RvGSyh0txxPzK1a+I1NfVe37pXYnrTvcRlPeAMZf7X7MpITdO69fHckLBOt520L3OI43yrnncBRJnA5sRucGSCkzH/OA/9UYTLaYVCDPhcc2ukEgRQCMrtwGFYuxmcI/bm2i4sHV1ZzgwyHFeOG/SOC1CdY9iUdqsFllLTRJqFsbLkqk4m+x+bSr/SBHuaooBEQrw8PhzLIsMWXMIFFJVn0Vz/nLcDGIDYYdxhzgEsimaERs/YKmCHZTkixngQoW1qILbrznd6QvPH6EMBNs0zljElw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(2616005)(8936002)(6486002)(186003)(38100700002)(54906003)(31696002)(86362001)(6512007)(26005)(31686004)(5660300002)(83380400001)(6916009)(66946007)(6666004)(2906002)(53546011)(6506007)(8676002)(66556008)(66476007)(4326008)(316002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yq8GjNWNcukqSP5sTVEUGc0obRW2T73KegqwRcDZeHSId1Zy/I7oam3H2zw1?=
 =?us-ascii?Q?8NSidcHg5qWGcK2s1EU8L3aGkrzCLbImXe/vn6RmIsz8/S3YCcg0Gfph2vAX?=
 =?us-ascii?Q?1yPcCXGXoT0ieOQR7GhlieFuxhp9TTEERm1RidyTKGU7ZGLXdEnsUeUM/i4B?=
 =?us-ascii?Q?eDnI9gNleQIvxpdAUToGHQsSLon9/1jOWFdrw/HraOJFdGDuxlMjgzvEAOFG?=
 =?us-ascii?Q?WaafgHlstZ6U2SsfXlOb5UYgH8rlKy0kHCgA/73rDTUK6QxcVYYV9QxHNAQw?=
 =?us-ascii?Q?ON9qZXbcYH7E7AfzSBzkz9o9rhXutvyLrCBkISKtWqUTBEi5EOw1mZeiT//Z?=
 =?us-ascii?Q?AXGKhdgAxalk3qVtvCnsLZ4KdHszJmUfXhSjfSESpFUKp/Yr+5cRHwhqMbaF?=
 =?us-ascii?Q?WioHBg9BL1YvMA/sAeVtbqswnRhNkKp2l1lljSLA8HjRbprhY2Z5WomHYpmh?=
 =?us-ascii?Q?weHKdoaCBu4UoQ/0HfEkw3uXsr3ug5DjuJJPPYTp3CB8DmyqtX+xjkXOgIyF?=
 =?us-ascii?Q?oAYTz+5WCEDtQzMLerrfBPmqvC+dFYBN9XZwBL7dwojeMcsCdis9Xf3BFn31?=
 =?us-ascii?Q?cMy+2hxi1ItzxSgrjUKxoe+b8NQfuEVTKacyNUiJPUv4LLuu5MBj+/mIIPR6?=
 =?us-ascii?Q?YY87486fKraOS6IrdV0SOwlGnEIEwmdz2SogGN9SLFu0+7NbP6g5408dl1kK?=
 =?us-ascii?Q?Vcpmotn7RmyY6OIt6+t9K7a+p7jFSimuEi0wtN62chTJwKDl34OD+1R8bViB?=
 =?us-ascii?Q?zjHEqTLOcMFkwHTQ7V2MkeTyf8NZALL8W39ep88jeYK1/tgSj11Utx8r29Lt?=
 =?us-ascii?Q?PIlzNNc4OqAILEcrQHUekZg/v7DLJ8PkiH537A+J1zRDmZmIA6GBN84Km2vN?=
 =?us-ascii?Q?FUB9F/MWx2PAVDBgLgpCcR2Rh5cnHG3ZUihxMOOYizeUL2r+HtWnbYIZSnRg?=
 =?us-ascii?Q?KU8oT1CqMnXfFvkuLN8MYi7Tiv1slnGqwK6psJ41F0xgFwxEa59X5T54KgRN?=
 =?us-ascii?Q?YnvI4MPzbC5YYgmFkzvACpUPdoDFhHaRnBvegxH3WjJEnd3ALCPYbQJPlfGD?=
 =?us-ascii?Q?/iHYOHKYM9UX2satNqqCSc+mfxBaKufbnGHe9ZJzGEdUzSf+PpHuVlYvfun/?=
 =?us-ascii?Q?eUBcZUZQ6BEO3S641dvhR2LEM4Mf019EUciEqWU8sBlh3F9tQHKmsWWs2HEy?=
 =?us-ascii?Q?qshalceuMLGVKDdTcyiZryVpOpr4Mg/W3C2DbzcZTEQx365IUF8dXWKKGOME?=
 =?us-ascii?Q?0tjPS3g6BMAlw9Awp8bkGWKeIjzy9ANs8vWmAXhqxBq/KjbzbXELNxmY/16q?=
 =?us-ascii?Q?QigwDvCJIzJfSWhNQBfTOigJwLrate9MVcUxDqugHpv8lMxji7XpK9HCc/lQ?=
 =?us-ascii?Q?CKmBFGestM79PsnjQeVCOMdD7/qh/41kbzbt1iGAYm8+uSSPxjlRjjyM6bgN?=
 =?us-ascii?Q?bhAKBWKf1+HZl5wRXc9giibGUgdNe8UIp5j7Ddb32U5NaieuGRCgL+Schur+?=
 =?us-ascii?Q?1XsgP8B2ejRjX6cT0kwUE8PtFA2qCuhUQccamzyE4xo7XUe6Nmq/KG91o/md?=
 =?us-ascii?Q?qPHDyTj0912CVVFdMzO7lxamtzFBPr96xE0HanjTkXCnTR31ngcc6XqpjTpE?=
 =?us-ascii?Q?fpAffc2aWXX/Vvh0LSliQ7LFQYNWwxmZ8cM/HaufvfCq15W8RbCDUNb9Vs30?=
 =?us-ascii?Q?qc14uqJLYKDSlJgW3BJy0m6yYgdaZlg2vw6I94B+CHNEX2qeYdXEkthYxuEk?=
 =?us-ascii?Q?rVuV4kSc2w=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bae4c71d-d430-4249-4d8f-08da3990cb0b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2022 12:12:07.2654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PMnxSeZG/g4RJK2zHOlu2lZ9zXOCHkFk8DBYLW6P2JtjEH589W7s79BWE5BiBadhuA470U7LS7JdNzUczDyMKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9343

On 06.05.2022 13:16, Roger Pau Monn=C3=A9 wrote:
> On Mon, Apr 25, 2022 at 10:40:55AM +0200, Jan Beulich wrote:
>> ---
>> An alternative to the ASSERT()s added to set_iommu_ptes_present() would
>> be to make the function less general-purpose; it's used in a single
>> place only after all (i.e. it might as well be folded into its only
>> caller).
>=20
> I would think adding a comment that the function requires the PDE to
> be empty would be good.

But that's not the case - what the function expects to be clear is
what is being ASSERT()ed.

>  Also given the current usage we could drop
> the nr_ptes parameter and just name the function fill_pde() or
> similar.

Right, but that would want to be a separate change.

>> --- a/xen/drivers/passthrough/amd/iommu_map.c
>> +++ b/xen/drivers/passthrough/amd/iommu_map.c
>> @@ -115,7 +115,19 @@ static void set_iommu_ptes_present(unsig
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
> I think PAGETABLE_ORDER would be clearer here.

I disagree - PAGETABLE_ORDER is a CPU-side concept. It's not used anywhere
in IOMMU code afaics.

> While here, could you also assert that next_mfn matches the contiguous
> order currently set in the PTE?

I can, yet that wouldn't be here, but outside (ahead) of the loop.

>> @@ -717,7 +729,7 @@ static int fill_qpt(union amd_iommu_pte
>>                   * page table pages, and the resulting allocations are =
always
>>                   * zeroed.
>>                   */
>> -                pgs[level] =3D iommu_alloc_pgtable(hd);
>> +                pgs[level] =3D iommu_alloc_pgtable(hd, 0);
>=20
> Is it worth not setting up the contiguous data for quarantine page
> tables?

Well, it's (slightly) less code, and (hopefully) faster due to the use
of clear_page().

> I think it's fine now given the current code, but you having added
> ASSERTs that the contig data is correct in set_iommu_ptes_present()
> makes me wonder whether we could trigger those in the future.

I'd like to deal with that if and when needed.

> I understand that the contig data is not helpful for quarantine page
> tables, but still doesn't seem bad to have it just for coherency.

You realize that the markers all being zero in a table is a valid
state, functionality-wise? It would merely mean no re-coalescing
until respective entries were touched (updated) at least once.

>> @@ -276,7 +280,7 @@ struct dma_pte {
>>  #define dma_pte_write(p) (dma_pte_prot(p) & DMA_PTE_WRITE)
>>  #define dma_pte_addr(p) ((p).val & PADDR_MASK & PAGE_MASK_4K)
>>  #define dma_set_pte_addr(p, addr) do {\
>> -            (p).val |=3D ((addr) & PAGE_MASK_4K); } while (0)
>> +            (p).val |=3D ((addr) & PADDR_MASK & PAGE_MASK_4K); } while =
(0)
>=20
> While I'm not opposed to this, I would assume that addr is not
> expected to contain bit cleared by PADDR_MASK? (or PAGE_MASK_4K FWIW)

Indeed. But I'd prefer to be on the safe side, now that some of the
bits have gained a different meaning.

>> @@ -538,7 +539,29 @@ struct page_info *iommu_alloc_pgtable(st
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
>> +        ASSERT(((PAGE_SHIFT - 3) & (contig_mask >> shift)) =3D=3D PAGE_=
SHIFT - 3);
>=20
> I think it might be clearer to use PAGETABLE_ORDER rather than
> PAGE_SHIFT - 3.

See above.

Jan


