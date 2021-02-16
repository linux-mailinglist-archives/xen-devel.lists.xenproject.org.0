Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFBC31C7EC
	for <lists+xen-devel@lfdr.de>; Tue, 16 Feb 2021 10:20:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.85462.160233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBwX1-000154-6K; Tue, 16 Feb 2021 09:20:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85462.160233; Tue, 16 Feb 2021 09:20:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBwX1-00014f-2u; Tue, 16 Feb 2021 09:20:31 +0000
Received: by outflank-mailman (input) for mailman id 85462;
 Tue, 16 Feb 2021 09:20:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IdGf=HS=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lBwWz-00014a-8o
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 09:20:29 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 898d1e5a-8ce4-475c-ada8-6bbcf7c1b1df;
 Tue, 16 Feb 2021 09:20:27 +0000 (UTC)
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
X-Inumbo-ID: 898d1e5a-8ce4-475c-ada8-6bbcf7c1b1df
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613467226;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=LWgAT44xPd6EhzLZAqorQfM5a79jN/+8hx0V0aZtcyc=;
  b=X/3YrZrr/J4lkhdb6jVC0dU9OWq6K+l+riXG7yjvJ0D+8qqPh42sejTj
   pp2nQPfyQicel8v6QtoVwvy5073eqb9JBGBMIr5ZsK5A0ohgN3ylJ0JxO
   +9kLn6ccpsVfV/arhwV3wvTcsZuwJVPds/WsJdyfibTfTwmKmiVWDQ7UD
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Xa+BZGwjOPasIgjxqnc/Hjm6KXxWJCq/YbZRo3P9rYitOgXeR87TxVTgvjhRiGvv5oe8GPEbso
 8bzBJ/ujWd2t+0126MruvFyMiM9VaI4HQHd7D5m6FVQj8jTdb59JFbfFAgPVKO+WbZt7N9Q4Qa
 i1vy1hFBEmssxJKEvcshqP34cYj+jh0+F+985b4+4ZhiBNQrdchqsw4OjV4aplKUzhDN+Uzhcc
 wjoLno8ulbr7e30IOj+cjTxp0YJXlnYtO6O5xwgS7ayyYLE04pnJHkGIO1S4tRo+atAraXmxHn
 wwI=
X-SBRS: 5.2
X-MesageID: 37306400
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,183,1610427600"; 
   d="scan'208";a="37306400"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ie2mLSSOeyTBPFRAA379GPwMFv6CXETEvmwD9NdXUFKjQSCZ0p8mepDPO+GKs202aLj6ehLbTjD5NaaEX6hpzlU7NrDV1S+IkorfzW6/bpANTSDf2L4aDefODPgmIvyJGh7+4J225nOBbhe6J9mRoYUJ63PqesUInsXJ0Y/So7DDQuzQ6lXMbUD4nBY4dsRUgOEPcB/x8SoSuJEDIzc/tNuOGNpBgRfrjFZZMu/y18iUYgpSrL5bt5lGrRgpBircHIfs8cjXm3kUPVyhrO/6XOvj6ZE6ecZ7UWAYRRPFNiZkz9ZP4nNvadlkZP1G9NOT0FAoo/qo56sg5j1bz53Zlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=50rRlYd/WoiMQgu4iiiur1BQeY/ousyczYTvbIpF768=;
 b=nz2kxoip8k4GLukuK3bUNCBYXitvMusJGRw7pYLrI21CHJ3VSgMQB8kS5xi+JTlzYY0pI1dlNCeOmjgTbCE/JbBMHFNshd+aIX/yfQdNOlY6pG3EPVHOHPwykaK/3cOY+0TNsUn9ppAT1ocdldk34vFLkufrzoz+5zCLU0NgIXpnRRm2ruqNUtQgSO5zIojvAf3jKIvZfLUH1/uzXkUAfaMgttkkd6ekyhfy3xOx9BWYVIPTx8p6s9vJ0lamgjNrzgz1oCuXP+zBFUyGhFD6BZMiX4Nflxz5xMyWyCHeVI8AEwps6eu18CLBdE2DqntAiew6FmbVKvhUsgSi6bnrYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=50rRlYd/WoiMQgu4iiiur1BQeY/ousyczYTvbIpF768=;
 b=uLjPnTFdlEvHHWfAuWrnXy6lynhgPE9Rd4n1JpKuOirrS/KtbYW+jNG4eQEJQy++q72JHO6ndH2uTX7QoARsTNsRY5EDBhu4nRcnyI6sI/uenI3mDFu82x1fzHyso42xIziHX+IFlJLQFCVN61fwJFynG4RqFQxmYpWSTjeIbKc=
Date: Tue, 16 Feb 2021 10:20:03 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "M. Vefa Bicakci" <m.v.b@runbox.com>
CC: <xen-devel@lists.xenproject.org>, <marmarek@invisiblethingslab.com>,
	<jbeulich@suse.com>
Subject: Re: [PATCH 1/1] x86/ept: Fix buggy XSA-321 backport
Message-ID: <YCuOQ3qpFD6RgIld@Air-de-Roger>
References: <20210215234619.245422-1-m.v.b@runbox.com>
 <20210215234619.245422-2-m.v.b@runbox.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210215234619.245422-2-m.v.b@runbox.com>
X-ClientProxiedBy: AS8PR04CA0025.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::30) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e09ab386-2e91-4559-4301-08d8d25c0eb3
X-MS-TrafficTypeDiagnostic: DM6PR03MB4843:
X-Microsoft-Antispam-PRVS: <DM6PR03MB484331647457DF909FD60D0F8F879@DM6PR03MB4843.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I+lETBN3pEVSIjeZAcLAoiqsVRRxD8A4oEfnvreFbIEPeZ801U/rO37F6IYrP7u0y1LpfmUBIg6GhD/dUkBCyWDJxjLykdUpcLDqWKk624qx917IRA9jbqfeuL3u6s/mssaAZWXyTyDZZGzZ9+rvl3UoRX3UZRWvDFldOE5P8iMm9KtoujGkwibFjSQsCqu1Y+PVBEk3aoWJjfphGKo4zX28ueCVfTBr/Dq+54Tl0L5TagJo9Sxn4k1AmuohrV4QyKd/J0g/iNBhUwWFTedolWtg1F8H7dr9PFltxuetrsVZct8pAH/tn3BhnP2AwaXzGXNIujkGzBzJPvP3o/+4DuQGrT2EMrYcZvtRk4EmLuCemvfQbBOOHbHu+eQZmkrKYh5L8wuVpVIQy4K3S7QbL34qb6i/DuWTs6did0LNFP6lMlr6e6MTObwoISG4HLbuXfRStHXiED+6mcH8KvG8PK2LU/pFuzlo1R4xSsCW51bp0Q20ts0WyrHY0rpoLOIeIKxigNM9a5oiXmGGyAAhUA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(376002)(366004)(136003)(396003)(39860400002)(346002)(66476007)(16526019)(83380400001)(6916009)(6496006)(6666004)(9686003)(316002)(33716001)(86362001)(66946007)(186003)(66556008)(26005)(4326008)(956004)(8676002)(5660300002)(2906002)(8936002)(6486002)(85182001)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TjVBMktXano0V0U0bEpOV2t4NEdOVENaRGNsb01YT0NVdnVmOXVFdjBTbWtZ?=
 =?utf-8?B?ZWFMcGd4ZGNFNDJrUFpjTURoZlpYVG8xYmxwd2lJTXJ1S1FLb21taHdONUdx?=
 =?utf-8?B?ejBCNWtyZTZBazZXbHZJUVBNWnVMUENGK2p2UEh4ZXN4ckR1SXlJSlAyMTVh?=
 =?utf-8?B?TkFTemZqa3FHbDR5SVdHNEhjb2hFQWwrMGt5NW1CQUJIR0hhTGNQellHYUZ0?=
 =?utf-8?B?MEdHUXVncWZ2QitYMUhGQ2M1cm13U0g0UTV1OVhXL1pDVFA5QmN2Kzc3WGVC?=
 =?utf-8?B?b3BoKzRQSStUOVZqTisweFFwaWFlaEUydlFGTE5RTTE1VzVtY1ZBOUtPcWJX?=
 =?utf-8?B?WnRCRTFyWnl2Z29xdW04V1p4UHlYYWRQWEpDcVZNM1JRai8xTDRaMkxmaTcx?=
 =?utf-8?B?Y2RxS3FSQlB0TTdrTURJK3F0bEhSSWJnZXpvOUNwMXMxS3BmTjBwdHRNOTBr?=
 =?utf-8?B?TlVpZzBkNi9qWEY5aWVRRkRTRHZBM2EwQzJhOUdvWEVQTWlpQTV0RXZzM3cx?=
 =?utf-8?B?TXlqcWR5SC96NXhlOThxOGdZOExMUkUwck14eGxpeFJHREJYbFlKZDF0Qnpi?=
 =?utf-8?B?OXFiRklYS3VqQXozQUE3Uk1GZEkrbWRaR21HWVZKN1BjQnpSZ2RKemgzOHgw?=
 =?utf-8?B?bUxaVXBCVndkZkV6dkpVYmxyRWtzL2c5Q1BtbDE5T3BlemlJeGVLcERuSXJj?=
 =?utf-8?B?RlFLN3BaTjFNUlBnVG13cFVFemFVY2lMYVVlRFdQR3RibnZxTEp4UEVvWFFs?=
 =?utf-8?B?RHhGRWs1dG5LZHh5L2F1TUd3d2EyWmFNZ2ovcTVWZVdDNmhNTkJDT2V1TkdZ?=
 =?utf-8?B?QTdGS2V1VUVZT0RhbkRuVE9CajVyRzIrbUdYNzhiUlV1Z2FiNDRwUVRjVmpk?=
 =?utf-8?B?ZWVzOHVCTzVsTDNyUlgvS3lFaW81SkZ3Q3VwKzVnQ3Z2RGl4U21GUkxhRWxo?=
 =?utf-8?B?TEZCNzlpZTFBU3BFa1BCL2lReFo1VUpBNnJlNWVBNWNmVnFsUW1lRlpNeHRt?=
 =?utf-8?B?cTB6eVVsK1ZDZWM0U29ORmlHQkdsWktJRDAvdGQ0MHdIU0tXZnE1ZEMyZ2cx?=
 =?utf-8?B?c0RVcjFqclBhS1BScWRPRkUzTEViVzdFV2cyYmsyTEpCeDlLM0lweSt3ck80?=
 =?utf-8?B?QS93YkdZdURKcEt6eG5TSGkyejFETUM1NUVEQ1ZieVV6U2R3ZkZNSU5LbWlU?=
 =?utf-8?B?UHROaDdtcWtPbW0xL3g4OFUzTEp2MTRFZWI1ZkMrOXlTdC92QUgxQ0dqY0ZY?=
 =?utf-8?B?ZjFuRDE4R3hCOURtTDA0bXBIMThveGgzNXk3eU01Yzh2Z0d6SjB6ZzNXSVd5?=
 =?utf-8?B?UUpHRmlyWVZVTzlPcVFzZWxqUmtkRlExbnF2bkVqb1pORG5Yc2Q0VEcvbzI1?=
 =?utf-8?B?OVhpb2pGdXJMaGVqbzl1YnJFVzBndnBxS041WkdjZkxFdDg0RmVTcEtUY1BR?=
 =?utf-8?B?eWRxY1ZBZzhqRHpocXI0MzRuWmdQVzZpdGtSdXZaK0xNTmJxaGlLSnlKeTlr?=
 =?utf-8?B?THN6MFIzUWJvUWZaSUZFMjlkZXdNbjBRR2hiL01QbkFreHVDbHNxeEJMYkR0?=
 =?utf-8?B?SWNkc241bFB4NkpYODNjREJnRkdUamxtYzdoVTU5V0RVeHZmRS9qOUhSQU1O?=
 =?utf-8?B?NDVFM3JUN0JmNmQ0MmlvV1pwSkNNR3FXZ1lGb1FtL1dEZ09uVGxwQjRHRnJS?=
 =?utf-8?B?cldEbG1BQmtiajhqRGlHRW5HcGxDcHg5TFlDYklzK1poSUZCYzVLUWtuMS85?=
 =?utf-8?Q?7TUXOc3MS4pqa3Yh6BYc5dAfW+RaYTWw0wqMy5G?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e09ab386-2e91-4559-4301-08d8d25c0eb3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2021 09:20:10.2998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iMUqQQH176kQzMpjL8Io3vI78BGctoU5Xj3st+fgXPIsaEieCUXNKX9w5ZWc96riXvNIUOEn5N11Ue7mPHm6qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4843
X-OriginatorOrg: citrix.com

On Mon, Feb 15, 2021 at 06:46:19PM -0500, M. Vefa Bicakci wrote:
> This commit aims to fix commit a852040fe3ab ("x86/ept: flush cache when
> modifying PTEs and sharing page tables"). The aforementioned commit is
> for the stable-4.9 branch of Xen and is a backported version of commit
> c23274fd0412 ("x86/ept: flush cache when modifying PTEs and sharing page
> tables"), which was for Xen 4.14.0-rc5 and which fixes the security
> issue reported by XSA-321.
> 
> Prior to the latter commit, the function atomic_write_ept_entry in Xen
> 4.14.y consisted mostly of a call to p2m_entry_modify followed by an
> atomic replacement of a page table entry, and the latter commit adds
> a call to iommu_sync_cache for a specific condition:
> 
>    static int atomic_write_ept_entry(struct p2m_domain *p2m,
>                                      ept_entry_t *entryptr, ept_entry_t new,
>                                      int level)
>    {
>        int rc = p2m_entry_modify(p2m, new.sa_p2mt, entryptr->sa_p2mt,
>                                  _mfn(new.mfn), _mfn(entryptr->mfn), level + 1);
> 
>        if ( rc )
>            return rc;
> 
>        write_atomic(&entryptr->epte, new.epte);
> 
>   +    /* snipped comment block */
>   +    if ( !new.recalc && iommu_use_hap_pt(p2m->domain) )
>   +        iommu_sync_cache(entryptr, sizeof(*entryptr));
>   +
>        return 0;
>    }
> 
> However, the backport to Xen 4.9.y is a bit different because
> atomic_write_ept_entry does not consist solely of a call to
> p2m_entry_modify, which does not exist in Xen 4.9.y. I am quoting from
> Xen 4.8.y for convenience:
> 
>    static int atomic_write_ept_entry(ept_entry_t *entryptr, ept_entry_t new,
>                                      int level)
>    {
>        int rc;
>        unsigned long oldmfn = mfn_x(INVALID_MFN);
>        bool_t check_foreign = (new.mfn != entryptr->mfn ||
>                                new.sa_p2mt != entryptr->sa_p2mt);
> 
>        if ( level )
>        {
>            ASSERT(!is_epte_superpage(&new) || !p2m_is_foreign(new.sa_p2mt));
>            write_atomic(&entryptr->epte, new.epte);
>            return 0;
>        }
> 
>        if ( unlikely(p2m_is_foreign(new.sa_p2mt)) )
>        {
>            rc = -EINVAL;
>            if ( !is_epte_present(&new) )
>                    goto out;
> 
>            if ( check_foreign )
>            {
>                struct domain *fdom;
> 
>                if ( !mfn_valid(new.mfn) )
>                    goto out;
> 
>                rc = -ESRCH;
>                fdom = page_get_owner(mfn_to_page(new.mfn));
>                if ( fdom == NULL )
>                    goto out;
> 
>                /* get refcount on the page */
>                rc = -EBUSY;
>                if ( !get_page(mfn_to_page(new.mfn), fdom) )
>                    goto out;
>            }
>        }
> 
>        if ( unlikely(p2m_is_foreign(entryptr->sa_p2mt)) && check_foreign )
>            oldmfn = entryptr->mfn;
> 
>        write_atomic(&entryptr->epte, new.epte);
> 
>   +    /* snipped comment block */
>   +    if ( !new.recalc && iommu_hap_pt_share )
>   +        iommu_sync_cache(entryptr, sizeof(*entryptr));
>   +
>        if ( unlikely(oldmfn != mfn_x(INVALID_MFN)) )
>            put_page(mfn_to_page(oldmfn));
> 
>        rc = 0;
> 
>     out:
>        if ( rc )
>            gdprintk(XENLOG_ERR, "epte o:%"PRIx64" n:%"PRIx64" rc:%d\n",
>                     entryptr->epte, new.epte, rc);
>        return rc;
>    }
> 
> Based on inspection of the p2m_entry_modify function in Xen 4.14.1, it
> appears that the part of atomic_write_ept_entry above the call to
> write_atomic is encapsulated by p2m_entry_modify, which uncovers one
> issue with the backport: In Xen 4.14, if p2m_entry_modify returns early
> without an error, then the calls to write_atomic and iommu_sync_cache
> will still occur (assuming that the corresponding if condition is
> satisfied), whereas in Xen 4.9.y, there is a code path that can skip the
> call to iommu_sync_cache, in case the variable level is not zero:
> 
>   if ( level )
>   {
>      ASSERT(!is_epte_superpage(&new) || !p2m_is_foreign(new.sa_p2mt));
>      write_atomic(&entryptr->epte, new.epte);
>      return 0;
>   }
> 
> This patch reorganizes the atomic_write_ept_entry to ensure that the
> call to iommu_sync_cache is not inadvertently skipped.

IMO this is likely too much change in a single patch, iff we really
wanted to do this you should have a pre-patch that re-arranges the
code without any functional change followed by a patch that fixes the
issue.

In any case I think this is too much change, so I would go for a
smaller fix like my proposal below. Can you please test it?

> Furthermore, in Xen 4.14.1, p2m_entry_modify calls
> 
>   put_page(mfn_to_page(oldmfn));
> 
> before the potential call to iommu_sync_cache in atomic_write_ept_entry.
> I am not sufficiently familiar with Xen to determine if this is a
> significant behavioural change, but this patch makes Xen 4.9.y similar
> to Xen 4.14.1 in that regard as well, by further re-organizing the code
> in atomic_write_ept_entry.

Well, that put_page is only relevant to PVH dom0, but you shouldn't
remove it. The put_page call in newer versions has been moved by
commit ce0224bf96a1a1f82 into p2m_entry_modify.

Here is my proposed fix, I think we could even do away with the else
branch, but if level is != 0 p2m_is_foreign should be false, so we
avoid an extra check.

Thanks, Roger.
---8<---
diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index 036771f43c..086739ffdd 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -56,11 +56,8 @@ static int atomic_write_ept_entry(ept_entry_t *entryptr, ept_entry_t new,
     if ( level )
     {
         ASSERT(!is_epte_superpage(&new) || !p2m_is_foreign(new.sa_p2mt));
-        write_atomic(&entryptr->epte, new.epte);
-        return 0;
     }
-
-    if ( unlikely(p2m_is_foreign(new.sa_p2mt)) )
+    else if ( unlikely(p2m_is_foreign(new.sa_p2mt)) )
     {
         rc = -EINVAL;
         if ( !is_epte_present(&new) )


