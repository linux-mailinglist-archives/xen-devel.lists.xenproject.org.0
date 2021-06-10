Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 398973A294C
	for <lists+xen-devel@lfdr.de>; Thu, 10 Jun 2021 12:24:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139813.258450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrHqU-0001bo-E4; Thu, 10 Jun 2021 10:23:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139813.258450; Thu, 10 Jun 2021 10:23:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrHqU-0001Zx-An; Thu, 10 Jun 2021 10:23:30 +0000
Received: by outflank-mailman (input) for mailman id 139813;
 Thu, 10 Jun 2021 10:23:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iP0d=LE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lrHqT-0001Zr-IG
 for xen-devel@lists.xenproject.org; Thu, 10 Jun 2021 10:23:29 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0bc8fc67-5c8b-4521-88f7-c2a9011d52ec;
 Thu, 10 Jun 2021 10:23:27 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2109.outbound.protection.outlook.com [104.47.18.109])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-31-XxQ8Lki0Nyul9gAtzBrvTw-1; Thu, 10 Jun 2021 12:23:25 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB7375.eurprd04.prod.outlook.com (2603:10a6:800:1a8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Thu, 10 Jun
 2021 10:23:24 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4219.022; Thu, 10 Jun 2021
 10:23:23 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P191CA0014.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:54::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Thu, 10 Jun 2021 10:23:23 +0000
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
X-Inumbo-ID: 0bc8fc67-5c8b-4521-88f7-c2a9011d52ec
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623320606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XjK+LwKx4hRb33TMruVqDXAuyc8ZGjXa5fzsOdWOTpg=;
	b=IuplYSgKVgije5ypRIHwLPDpjAvofZZ+mUkRWZYSc4S+I1XBhU7PH+2ioebqr6HuQ+PQnB
	ScmlprMi6twp4I5UhZ4DwY2ItPH02s3fsuYcYUr6ZXjdHZY0bIDLCX9N7vPjlwpbgNuHpR
	Mf8GEpwkfJSN4tvFEmbkdMPwMKlap3I=
X-MC-Unique: XxQ8Lki0Nyul9gAtzBrvTw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fE9QE1YSni9zNONL+XONWAEhWOaJDG/ro4HM8iwpnGufUgbyCkxwYXKeiJV3FwaQIyd7Vgqeaf6f3cNaxK5AW1cqlOJKAzZPDqnEuIWiGezK7JxXyJcbzhydYKdoqL54/Mk7FIRFATPAoGPck8Ls4O+KGNvMpcEmevZSwnjJG8Y2vxTPah54gUbDPxC8fh3redJQW5Wu4d8VXZikR18+gco+kU3ZNP+SCz8US8fcEVzX4ZWQkVKMtw+zBlncieoTDPlOIbNMYAskCK4bHPlMDYKPojU3w2BUceEAqKDhHMXO98srKXFJ/oQZzfiDhQM3IY7lnEsqPIYhoaztRP7w9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XjK+LwKx4hRb33TMruVqDXAuyc8ZGjXa5fzsOdWOTpg=;
 b=OIkNrWWBb8ayyf1Ab+BVe1BKW/Si7QnkplKxNatR1jOre9zJ54qO+GvqJ0LVbCOFeytwrqCLd2mxTdYbMXxBV8PR8tm2fallSsvVdAJwEecmBAcODBNXJgIlZjjNuTWD4a5t+NYW2vkZT3nf9vHvtYk4TZZwU4aynUL9/GFdqQDUaH6k5/DgeUrSeZzJFPurWtIsxb0ouF+2Q5K8/t4CLpL9FA56MPCfgrTkBN5gFCR/3ZHDJM7G8VL8yv5S4SjpvIjEGr2ekWfbryKuiHzNn0+0hRCflha4DAPKqQ7tbzSpTtE5W2ZBU87ySw6JPqRUEnW+TFGdumK/0OOxVchasg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 6/9] xen/arm: introduce alloc_staticmem_pages and
 alloc_domstatic_pages
To: Penny Zheng <penny.zheng@arm.com>
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com,
 xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org
References: <20210607024318.3988467-1-penny.zheng@arm.com>
 <20210607024318.3988467-7-penny.zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c31a85c3-89ea-76a4-3b29-a411d419fb59@suse.com>
Date: Thu, 10 Jun 2021 12:23:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210607024318.3988467-7-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3P191CA0014.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8df58d2-e24e-471b-eef7-08d92bf9c70a
X-MS-TrafficTypeDiagnostic: VE1PR04MB7375:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB73750D4DD26840470C084248B3359@VE1PR04MB7375.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	P3TMtJnHEm8L0/o+fwDYi1GBiTG5FqICquHc0z6KE18NEjMukwzIoNOKeMc//+8LGguFV7i3I66gi3djQGdHSokBsAqc4PvSkLYfivrAyWQ6gnqNSyaPAbniTwrwDfF5TLyJKMtpl+VkyjIxXjKxYvp/oJIY0SZRY0H7+gxNFdyBSqb7DAdhwhR8fchjHZC2Tm2IEOVj/JFIrDogIO5YYeT3i3RsBiNPwV5fSb7mZyoyNb962Xu061u9JMyEoAJrgSleMWvFiwUJ5UlFrxdDGEMa+TXSfIkoTBOXH3qgs4x+oKYEidVMzUszdH0Mm+AeGeeBfdySw/V74U1gMRCk7FIDDPuiwz4e+eFAZ/arDWpFJVNOjXhmU6uXyAPn9g1tE02CHjpvsvHR5bZBqyS2hws/BWsz5kiuN56hycK3addHqH61eBSLsZY+L0460YiNsuA2HusRhPBzyZJ8hRxw2upoXNt3X4kQIriYGbaKBB9QilxJito/IYdnkj3znzVkG579ekQBs8uiFLTsOP+0Xi+HfEHn1GN6CyLOHulu1BTAT0f5Y6r6fteD2wtCCqaXs0kJM7topgmYpg6JnBTjXSRpDdwPuz5KAdjeT10Le3kVlCSn+stYrh4QZUHt9m8ROVFLhufaIMdgHV4L37uwMlGsOSw5kF/+trKl6dVE3wPqht5vPzArpwHYoxs19Xl2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(346002)(39860400002)(136003)(396003)(86362001)(8936002)(316002)(31686004)(16526019)(6916009)(66946007)(2906002)(4326008)(66476007)(16576012)(36756003)(38100700002)(66556008)(2616005)(5660300002)(956004)(26005)(53546011)(478600001)(6486002)(8676002)(31696002)(186003)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?utf-8?B?SUZPTnA1V25SOHkyZ2FkQWpUMUlrck1HNDArTENyVHcreHB2VWZzblRPZFVy?=
 =?utf-8?B?V2FBRm1HQUdoRkJjWW96eldsdFZjaTNyV0xzQVczbHE4elFPQ2QyY0lPcUZj?=
 =?utf-8?B?R282V1lxNnlqN0x4Kzg1UVdKbXQwd1dvNXpRNWRGbnpEdFV3SEFjVkdBMVFx?=
 =?utf-8?B?cE8vb1JtalQwTzBEYUVtaGNDVUFwU3R4WXVRZlBQeWNEaVlTajEwL1VsN0R2?=
 =?utf-8?B?bUxnYWhUWTBsSlJucnRhSjRHTW5pVkk5b21jZ2R1bGpkay9jZHk0blFtU2xv?=
 =?utf-8?B?RnpyNjhRQklBc0tmbDhCdXZnMW9YVThzQUZTaWMzOUJJSkljenJsNGhkMitE?=
 =?utf-8?B?bjN6elVJR2h3bDBneldKR1BBTFBqMVdlRlM3SGR1U0VpMWhvRS90WmRwOHBU?=
 =?utf-8?B?Y3VnQmRLbElCMWhHMHZVYUJLVmk2VVU5cUFYQ2IwZnN1MnRsd3RuWllXaFFP?=
 =?utf-8?B?Y0JoRk1NcGVDUHg4aUozT3c1UUR2WUpZcFFqeXVWV0RCNnFpRHF5NWV1TGFq?=
 =?utf-8?B?ZjIxVk5RYzV4bTJrVThTV3pEWDZueXpZRlYvQVd4cHJ3Y3FjUHVpZGR4NUJ1?=
 =?utf-8?B?QThJMkN1TGZaR3UzTEhnMmF0WFAyR1BaSkJ0OEUrbStBNVl1TGVSQ0lWTmpW?=
 =?utf-8?B?MzdZYnU3UEc2cDIwOEZmdzBNOG15dkE5aGNSdTJTTUY3WUJRVEpmV1I5bVY2?=
 =?utf-8?B?amZoR0hicVhUbGI4WHZROE1wc0RlU3ZRUElTVjA5V3FZQ3hKUXYzWDhGeGV4?=
 =?utf-8?B?WkUrVkFYWHFWQldqdkFZald1Q1c4bGRlcFZDTEw5Q081S0I0VDJNWDJuU0JB?=
 =?utf-8?B?UlhJeWFMOHRPMlpTZjVSaXYrKzdaNzZOUVNSZ2xHVEJNc2lyT1lZNndLTU00?=
 =?utf-8?B?TG5NNXJ5bVIxYXNNUWkzU29NUEZpUEdoVzM2WWVSZG1uMGRLT09kUUtCTnI3?=
 =?utf-8?B?Zmoyd0o4S1BIcExkRFo3Y08wRGRUZUhWeEoydmNTL3RjN3gvZ0dzeTlaV0hO?=
 =?utf-8?B?TURzb01LN2x3ZFgyTFQ5R3RQb2EreDlaRkdyM3B4SHNZbzQ5NTVSN2k0VklH?=
 =?utf-8?B?RnJRUnhOZGVYZ0NmZW85cVg2c09FcHMrcVZQdGJjbUVkdnlmRnIySm5HNUto?=
 =?utf-8?B?VitNV25CdFU0L0tYTnpmT3JTMzFhejhsNStQRzNUdmlDbzQ3OVhVdkpBTnh2?=
 =?utf-8?B?aXhkM1RyejgyVlVDWnliWlVzQmI5dDg4RnpuSTJJMmRTWHJnSXlBRWxTY2xK?=
 =?utf-8?B?YVZSZlIrZEx0ckhrL2hiZEJVOVErRnZ3V3NUemd2SWtWMENac0VxQXFucHd1?=
 =?utf-8?B?OEhMMEVhYkxVaXhkK3dwNlR2anFQNEMzb3FZVkF6NUR2MHhsK1FOdjVFQ25z?=
 =?utf-8?B?aWFxN3ZKdDdPR2hKUktqTDRmRVhRa1FVMmhBV3JRUmtsdGlZR3oxditRc0hv?=
 =?utf-8?B?ckE1QnErckwycTF0N2JiNEFpdDU4c0E1UkJmMVpPcmFBTnl4dFhFamc3OEZY?=
 =?utf-8?B?cVlFVUErRnFpUmM4VndwTDE3emhVUzlmb3VzR1VDK3pVa3R4Wi9oaXdUZjZM?=
 =?utf-8?B?MzdBMXJTVG1CRk5hcmhrakRRTGk4S2NwY1ppYU95MlVyZWFjT1JaZHBETk0r?=
 =?utf-8?B?NlFRNlZ0ZElTVUxkWG5LdWJsUldjbkpWUFZPMHZmQXhMd1NMckFRZmpCZWgr?=
 =?utf-8?B?UlpXN2YyY2xuQzZvQzlPTUtDd2p4YzRwelBJT05QWEw5QnBIbVNZOFVuckZC?=
 =?utf-8?Q?W17RSsSy6Fn1N1MUJKt0zZmJYWCe+JsX05MEsgm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8df58d2-e24e-471b-eef7-08d92bf9c70a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 10:23:23.7168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KUAJc7dYOx40YFVPnS8ahfGSzist9MMxmC/kUW3y2jutFQHCqlIreNgsBpS7enpRMZHfDppQv6eDzpfXDj+Apw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7375

On 07.06.2021 04:43, Penny Zheng wrote:
> alloc_staticmem_pages aims to allocate nr_mfns contiguous pages of
> static memory. And it is the equivalent of alloc_heap_pages for static
> memory. Here only covers allocating at specified starting address.
> 
> For each page, it shall check if the page is reserved(PGC_reserved)
> and free. It shall also do a set of necessary initialization, which are
> mostly the same ones in alloc_heap_pages, like, following the same
> cache-coherency policy and turning page status into PGC_state_inuse, etc.
> 
> alloc_domstatic_pages is the equivalent of alloc_domheap_pages for
> static mmeory, and it is to allocate nr_mfns pages of static memory
> and assign them to one specific domain.
> 
> It uses alloc_staticmen_pages to get nr_mfns pages of static memory,
> then on success, it will use assign_pages_nr to assign those pages to
> one specific domain.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
> changes v2:
> - use mfn_valid() to do validation
> - change pfn-named to mfn-named
> - put CONFIG_STATIC_ALLOCATION around to remove dead codes
> - correct off-by-one indentation
> - remove meaningless MEMF_no_owner case
> - leave zone concept out of DMA limitation check
> ---
>  xen/common/page_alloc.c | 129 ++++++++++++++++++++++++++++++++++++++++
>  xen/include/xen/mm.h    |   2 +
>  2 files changed, 131 insertions(+)
> 
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index e244d2e52e..a0eea5f1a4 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -1065,6 +1065,75 @@ static struct page_info *alloc_heap_pages(
>      return pg;
>  }
>  
> +#ifdef CONFIG_STATIC_ALLOCATION
> +/*
> + * Allocate nr_mfns contiguous pages, starting at #smfn, of static memory.
> + * It is the equivalent of alloc_heap_pages for static memory
> + */
> +static struct page_info *alloc_staticmem_pages(unsigned long nr_mfns,
> +                                               mfn_t smfn,
> +                                               unsigned int memflags)
> +{
> +    bool need_tlbflush = false;
> +    uint32_t tlbflush_timestamp = 0;
> +    unsigned long i;
> +    struct page_info *pg;
> +
> +    /* For now, it only supports allocating at specified address. */
> +    if ( !mfn_valid(smfn) || !nr_mfns )
> +    {
> +        printk(XENLOG_ERR
> +               "Invalid %lu static memory starting at %"PRI_mfn"\n",

Reading a log containing e.g. "Invalid 0 static memory starting at
..." I don't think I would recognize that the "0" is the count of
pages.

> +               nr_mfns, mfn_x(smfn));
> +        return NULL;
> +    }
> +    pg = mfn_to_page(smfn);
> +
> +    for ( i = 0; i < nr_mfns; i++ )
> +    {
> +        /*
> +         * Reference count must continuously be zero for free pages
> +         * of static memory(PGC_reserved).
> +         */
> +        ASSERT(pg[i].count_info & PGC_reserved);

What logic elsewhere guarantees that this will hold? ASSERT()s are
to verify that assumptions are met. But I don't think you can
sensibly assume the caller knows the range is reserved (and free),
or else you could get away without any allocation function.

> +        if ( (pg[i].count_info & ~PGC_reserved) != PGC_state_free )
> +        {
> +            printk(XENLOG_ERR
> +                   "Reference count must continuously be zero for free pages"
> +                   "pg[%lu] MFN %"PRI_mfn" c=%#lx t=%#x\n",
> +                   i, mfn_x(page_to_mfn(pg + i)),
> +                   pg[i].count_info, pg[i].tlbflush_timestamp);
> +            BUG();
> +        }

The same applies here at least until proper locking gets added,
which I guess is happening in the next patch when really it would
need to happen right here.

Furthermore I don't see why you don't fold ASSERT() and if into

        if ( pg[i].count_info != (PGC_state_free | PGC_reserved) )

After all PGC_reserved is not similar to PGC_need_scrub, which
alloc_heap_pages() masks out the way you also have it here.

As to the printk() - the extra verbosity compared to the original
isn't helpful or necessary imo. The message needs to be
distinguishable from the other one, yes, so it would better
mention "static" in some way. But the prefix you have is too long
for my taste (and lacks a separating blank anyway).

As a separate matter - have you given up on the concept of
reserving particular memory ranges for _particular_ guests? The
cover letter, saying "Static Allocation refers to system or
sub-system(domains) for which memory areas are pre-defined by
configuration using physical address ranges" as the very first
thing, doesn't seem to suggest so.

> +        if ( !(memflags & MEMF_no_tlbflush) )
> +            accumulate_tlbflush(&need_tlbflush, &pg[i],
> +                                &tlbflush_timestamp);
> +
> +        /*
> +         * Preserve flag PGC_reserved and change page state
> +         * to PGC_state_inuse.
> +         */
> +        pg[i].count_info = (pg[i].count_info & PGC_reserved) | PGC_state_inuse;

Why not

        pg[i].count_info = PGC_state_inuse | PGC_reserved;

? Again, PGC_reserved is sufficiently different from PGC_need_scrub.

> +        /* Initialise fields which have other uses for free pages. */
> +        pg[i].u.inuse.type_info = 0;
> +        page_set_owner(&pg[i], NULL);
> +
> +        /*
> +         * Ensure cache and RAM are consistent for platforms where the
> +         * guest can control its own visibility of/through the cache.
> +         */
> +        flush_page_to_ram(mfn_x(page_to_mfn(&pg[i])),
> +                            !(memflags & MEMF_no_icache_flush));
> +    }
> +
> +    if ( need_tlbflush )
> +        filtered_flush_tlb_mask(tlbflush_timestamp);

Depending on whether static pages have a designated owner, this may
(as suggested before) not be necessary.

> @@ -2326,7 +2395,11 @@ int assign_pages_nr(
>  
>          for ( i = 0; i < nr_pfns; i++ )
>          {
> +#ifdef CONFIG_STATIC_ALLOCATION
> +            ASSERT(!(pg[i].count_info & ~(PGC_extra | PGC_reserved)));
> +#else
>              ASSERT(!(pg[i].count_info & ~PGC_extra));
> +#endif
>              if ( pg[i].count_info & PGC_extra )
>                  extra_pages++;
>          }
> @@ -2365,7 +2438,12 @@ int assign_pages_nr(
>          page_set_owner(&pg[i], d);
>          smp_wmb(); /* Domain pointer must be visible before updating refcnt. */
>          pg[i].count_info =
> +#ifdef CONFIG_STATIC_ALLOCATION
> +            (pg[i].count_info & (PGC_extra | PGC_reserved)) | PGC_allocated | 1;
> +#else
>              (pg[i].count_info & PGC_extra) | PGC_allocated | 1;
> +#endif

Both hunks' #ifdef-ary needs to be avoided, e.g. by

#ifndef CONFIG_STATIC_ALLOCATION
# define PGC_reserved 0
#endif

near the top of the file.

> @@ -2434,6 +2512,57 @@ struct page_info *alloc_domheap_pages(
>      return pg;
>  }
>  
> +#ifdef CONFIG_STATIC_ALLOCATION
> +/*
> + * Allocate nr_mfns contiguous pages, starting at #smfn, of static memory,
> + * then assign them to one specific domain #d.
> + * It is the equivalent of alloc_domheap_pages for static memory.
> + */
> +struct page_info *alloc_domstatic_pages(
> +        struct domain *d, unsigned long nr_mfns, mfn_t smfn,
> +        unsigned int memflags)
> +{
> +    struct page_info *pg = NULL;
> +    unsigned long dma_size;
> +
> +    ASSERT(!in_irq());
> +
> +    if ( !dma_bitsize )
> +        memflags &= ~MEMF_no_dma;
> +    else
> +    {
> +        if ( (dma_bitsize - PAGE_SHIFT) > 0 )
> +        {
> +            dma_size = 1ul << (dma_bitsize - PAGE_SHIFT);
> +            /* Starting address shall meet the DMA limitation. */
> +            if ( mfn_x(smfn) < dma_size )
> +                return NULL;

I think I did ask this on v1 already: Why the first page? Static
memory regions, unlike buddy allocator zones, can cross power-of-2
address boundaries. Hence it ought to be the last page that gets
checked for fitting address width restriction requirements.

And then - is this necessary at all? Shouldn't "pre-defined by
configuration using physical address ranges" imply the memory
designated for a guest fits its DMA needs?

Jan


