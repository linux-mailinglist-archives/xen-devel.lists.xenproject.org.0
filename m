Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 221C62AF064
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 13:18:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24697.52061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcp4S-00033K-Qf; Wed, 11 Nov 2020 12:17:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24697.52061; Wed, 11 Nov 2020 12:17:52 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcp4S-00032v-NL; Wed, 11 Nov 2020 12:17:52 +0000
Received: by outflank-mailman (input) for mailman id 24697;
 Wed, 11 Nov 2020 12:17:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nKbA=ER=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kcp4Q-00032q-Un
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 12:17:51 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 172adf74-d758-4783-b8bd-cdf42a36cec7;
 Wed, 11 Nov 2020 12:17:49 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nKbA=ER=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kcp4Q-00032q-Un
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 12:17:51 +0000
X-Inumbo-ID: 172adf74-d758-4783-b8bd-cdf42a36cec7
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 172adf74-d758-4783-b8bd-cdf42a36cec7;
	Wed, 11 Nov 2020 12:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605097069;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=MmxoU/uey2FSuyUgnmrRfeZ8zz1oa7egMr57xGb4FSw=;
  b=eoS53BAoTVw5BHtbnk/WLJV1a5RBPiXeULjnLnvn1clVa8YKQQ2BdH1X
   u6rTP/dGJl360iU4K4/dGQfadCIQU6Y3E/UQHSaI02qzNlHzCg2fAAjbR
   /8ExV/lFzAP0R6PtbYnJQPXxI85lumAdvGqSmnaYR4EryjVZK3jR5mnZZ
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: dI6IVFT3ur6TmEjU/XDFu0eIZ9ELEfAXIJyVmO0LWb1vAoZjulBVVmhQRN9iNcFUC3Zvf3akAw
 9WDE+SXS/slexF5iWS7rboRro6pK5MMiWSzrmpNxB/46HvHz4v7OCTP6O/McNhnfy0kiqBp0kY
 dnKzaW6mM5uSw/0CuWpRAcEEgr7fRSjOZYBGELUC6WaJEeHV1ENLTtDDwiIq1Bop3vOtA4AuO0
 tQRQ/kl6vMjydhEnAt1bqpUjKvf6PdDbqqYswqECp3rTXVRYlzgAguvl8V1Co0Bo83qhn2lJAS
 CNc=
X-SBRS: None
X-MesageID: 32060624
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,469,1596513600"; 
   d="scan'208";a="32060624"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BwBmJzZaYKhO7RXq+T61hDCtO8nrnXfNSvrqMc2pTJ4E+VCqemO8y1tq8Ek/L+mT/fhunNm/8c7uzlZjN6GfurafJUdosJ1mngx1qCuYbner7+tZxALkYL/Se9RFqp2spyiNsufGHr0xnxhbJs96OtC+AGnYlsqghQSi9cjj8WmLXi+KgxOFfnvq5aA10PJjKbWywzWlCrLTuJ1W+c/PVpdPSY1P1NSOFO8/uhc1BecTW9xVqjn0zvGIsCPLoXrVfHOdvnF5CyFJkEA/rC3BMln+8cUrwwTiyHnmkWb07f1xeLF8waznGVLcGVP7xXmXlweSS5u7RcXiLRc0ywJ+Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+d4x0ILteW7/99uP/TrVBWxyFMFgdB1qbWMO9GlMOjI=;
 b=HsDNnPsg5dHt/2Cj5OCAXrdwk9s5ulV0HPLB3gQq3dM9n0C1EC2NR0eqkAUWoAkzpTSvJinhOL7ODXx5FBLOWZA8YLJdexqLP+x/V7fPeVjN25mxvkIVRdGFN4mmkKig2AT43Aj/RYlEWVxSDQbIxHCdbXJUY6zVO8ViYTG3DSIHmpzX7K5ZRJ++FjIb24T3VUukUfjMFccDy+B1OEArxvBgLV2OBqCCom+XP/TkIRM1BHqFFk1hexseL5Gm1I6Otceqkf9uAzRZP2QgFQkFGtHdfXUZ9EjxOpzpzl6lusRb0IxHLeF58cUok3zSzcw30UGxwfoNYiDkj0lV5CDSSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+d4x0ILteW7/99uP/TrVBWxyFMFgdB1qbWMO9GlMOjI=;
 b=FNo/Gt7SU4gt8Z0Uq3X6NJbbHtmWaLBXqilu+qE3S3Ltl18tMGh0P24c6kE4pMawMnpdTWPu8rhHjhB28CT2pcSuLbrohzyZYBm7QBypIZ9ccuMGRsov6O6xrxcGpUYR6p8k56vnUgr5+kDokHxfnzyMbY5PATSBqV+qd0EfhTc=
Date: Wed, 11 Nov 2020 13:17:30 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>
Subject: Re: [PATCH 5/5] x86/p2m: split write_p2m_entry() hook
Message-ID: <20201111121730.pblsf6inot5gixfc@Air-de-Roger>
References: <29d30de1-2a8d-aee2-d3c3-331758766fc9@suse.com>
 <7b2b7cc9-8828-41bd-7949-764161bbe7ff@suse.com>
 <20201110135944.hbsojy6eeyw53has@Air-de-Roger>
 <d73234b0-f22e-0783-3fbe-759ccb0ecc48@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d73234b0-f22e-0783-3fbe-759ccb0ecc48@suse.com>
X-ClientProxiedBy: LO2P265CA0493.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: effa972b-3ef6-46a7-9c30-08d8863bc5cd
X-MS-TrafficTypeDiagnostic: DM6PR03MB3946:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB39463A3C82CAE98681B230658FE80@DM6PR03MB3946.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Eaa7MLPELrP06C+EQCG2Yxzj3R7IQSgkeOVAAvsLa0yMFI2QV9j0pLrrk+ZG+/NSYMl7ahCnnUSPKVYTaaOUPWquscjLUTwZUfTckuDA86DxCEI3OzjmvR07mt8d+sGyNdKaKGDbijrIDevnD9WY6h2oy4D4sCR78rTJgihbnKBnwpeq+E8NrAf8uoLbcPqGawkoWwjWnSMX8f7Q0C705Y4SMTxMeeHNBSuimV9poXzcFSneU0XZxWLcYhnEGG0wy4jNiPN12Nc1lhKsdMupUqub4Em/HDVXmuCAQHCIu44KEK9zePVo7E3pH+tLG+jssqOC4Z/M/eJU6XKc3MO3+v5VWdSvjMEotYJqcfkoOSC/HarYiH4qgonpM+ID4JK/
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(346002)(136003)(396003)(366004)(376002)(39860400002)(26005)(478600001)(83380400001)(66476007)(66556008)(33716001)(6666004)(6916009)(5660300002)(9686003)(16526019)(85182001)(186003)(66946007)(6486002)(54906003)(86362001)(4326008)(2906002)(8676002)(956004)(8936002)(6496006)(316002)(53546011)(1076003)(70780200001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: NqtCM3tzncCB1vYa3CMobWde4TIgCywWPZBxxRNW65MFqahS/VO1jasgTGH9CboB2LG/8SmyrYWrZqFD1KjthtVhz3kwUiranTvEOl6af8APHfq22RH7geyTwTZRtCxWfVSZiFECj6CmQ3qgyDS/oD+T76PiW4bLLhZHT3ivj5oRt/stjk0iEKF/292AosCP9e1zQ1nzGe04083EJ3CWT3scMADqNDLqWuivfUp5OalbwXJVfJpAds6r6rIS7eDKio80wilfzft5elyvGCV3VJiY/JCLXsmYmK12DggMhqSFZrRYwqbs+XkB3jFdf0/2HpGrauggWCjRszxRkV+T0PKCNIC5nl4J3P9iZYZSAIlUw4M4JTcJu8Wa5SwuO4Yb+7T8GTvhdmKGrUGthZueqblGGQbNLdD7zz0mGNCrBpszgLKCSaFOEK0BaTDGumcuVDY78NJRAx4NmsxRxZCyfX+b2c03/zccKDSTcekaBCbG49OypzcOusubfSslfEDWKlJVozWUKl5cKi7fj70jX3i8x9dxDgvgbEnFhE9OkTIGzpT4dAvn5MjI7nTFKdaqFSW2xpK794h0dAXon31vefNBNYv8tBGdjJxAZieS7K+dhLi2VncYm16u8ouTpnqFfUGKY8wn6vPlTY4SWTsuKGgzVFwceEBeRTYkyQ0XIE5XCoKwtp2cA35UG750dYDxfQSrGYG4xTjDCQvnMXghhqzYjiM9lEDGwTOm+ggxWtbF8r1iHObUsK3LbKyFFUbBFGC5VnQV4u+3Qe5uMid4ZhAhSh8d2VNZLb78ikjnDR089zp0QAJfpJmGtbQ6QdzEiYFkCoBb3lJa71mokGtg7dWtK+fdtAQkb3ud3zMVz5nTnPxKZEKk4St0LFROWTcelUdo6A21Rw/5bleKwlJMrA==
X-MS-Exchange-CrossTenant-Network-Message-Id: effa972b-3ef6-46a7-9c30-08d8863bc5cd
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2020 12:17:35.4068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TMPBFxZssIo09xXIs2pk6f/RHu8ZIx5my2QZ8s8CE6Htt7TilSPNEmwQZkutV53BXHcYPT71p3cccIj7S6kRxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3946
X-OriginatorOrg: citrix.com

On Tue, Nov 10, 2020 at 03:50:44PM +0100, Jan Beulich wrote:
> On 10.11.2020 14:59, Roger Pau Monné wrote:
> > On Wed, Oct 28, 2020 at 10:24:53AM +0100, Jan Beulich wrote:
> >> --- a/xen/arch/x86/mm/hap/nested_hap.c
> >> +++ b/xen/arch/x86/mm/hap/nested_hap.c
> >> @@ -71,24 +71,11 @@
> >>  /*        NESTED VIRT P2M FUNCTIONS         */
> >>  /********************************************/
> >>  
> >> -int
> >> -nestedp2m_write_p2m_entry(struct p2m_domain *p2m, unsigned long gfn,
> >> -    l1_pgentry_t *p, l1_pgentry_t new, unsigned int level)
> >> +void
> >> +nestedp2m_write_p2m_entry_post(struct p2m_domain *p2m, unsigned int oflags)
> >>  {
> >> -    struct domain *d = p2m->domain;
> >> -    uint32_t old_flags;
> >> -
> >> -    paging_lock(d);
> >> -
> >> -    old_flags = l1e_get_flags(*p);
> >> -    safe_write_pte(p, new);
> >> -
> >> -    if (old_flags & _PAGE_PRESENT)
> >> -        guest_flush_tlb_mask(d, p2m->dirty_cpumask);
> >> -
> >> -    paging_unlock(d);
> >> -
> >> -    return 0;
> >> +    if ( oflags & _PAGE_PRESENT )
> >> +        guest_flush_tlb_mask(p2m->domain, p2m->dirty_cpumask);
> >>  }
> > 
> > This is a verbatimi copy of hap_write_p2m_entry_post. I assume there's
> > a reason why we need both, but I'm missing it.
> 
> Only almost, since HAP has
> 
>     if ( oflags & _PAGE_PRESENT )
>         guest_flush_tlb_mask(d, d->dirty_cpumask);
> 
> instead (i.e. they differ in which dirty_cpumask gets used).

Sorry, missed that bit.

> >> --- a/xen/arch/x86/mm/p2m-pt.c
> >> +++ b/xen/arch/x86/mm/p2m-pt.c
> >> @@ -122,17 +122,55 @@ static int write_p2m_entry(struct p2m_do
> >>  {
> >>      struct domain *d = p2m->domain;
> >>      struct vcpu *v = current;
> >> -    int rc = 0;
> >>  
> >>      if ( v->domain != d )
> >>          v = d->vcpu ? d->vcpu[0] : NULL;
> >>      if ( likely(v && paging_mode_enabled(d) && paging_get_hostmode(v)) ||
> >>           p2m_is_nestedp2m(p2m) )
> >> -        rc = p2m->write_p2m_entry(p2m, gfn, p, new, level);
> >> +    {
> >> +        unsigned int oflags;
> >> +        mfn_t omfn;
> >> +        int rc;
> >> +
> >> +        paging_lock(d);
> >> +
> >> +        if ( p2m->write_p2m_entry_pre )
> >> +            p2m->write_p2m_entry_pre(d, gfn, p, new, level);
> >> +
> >> +        oflags = l1e_get_flags(*p);
> >> +        omfn = l1e_get_mfn(*p);
> >> +
> >> +        rc = p2m_entry_modify(p2m, p2m_flags_to_type(l1e_get_flags(new)),
> >> +                              p2m_flags_to_type(oflags), l1e_get_mfn(new),
> >> +                              omfn, level);
> >> +        if ( rc )
> >> +        {
> >> +            paging_unlock(d);
> >> +            return rc;
> >> +        }
> >> +
> >> +        safe_write_pte(p, new);
> >> +
> >> +        if ( p2m->write_p2m_entry_post )
> >> +            p2m->write_p2m_entry_post(p2m, oflags);
> >> +
> >> +        paging_unlock(d);
> >> +
> >> +        if ( nestedhvm_enabled(d) && !p2m_is_nestedp2m(p2m) &&
> >> +             (oflags & _PAGE_PRESENT) &&
> >> +             !p2m_get_hostp2m(d)->defer_nested_flush &&
> >> +             /*
> >> +              * We are replacing a valid entry so we need to flush nested p2ms,
> >> +              * unless the only change is an increase in access rights.
> >> +              */
> >> +             (!mfn_eq(omfn, l1e_get_mfn(new)) ||
> >> +              !perms_strictly_increased(oflags, l1e_get_flags(new))) )
> >> +            p2m_flush_nestedp2m(d);
> > 
> > It feel slightly weird to have a nested p2m hook post, and yet have
> > nested specific code here.
> > 
> > Have you considered if the post hook could be moved outside of the
> > locked region, so that we could put this chunk there in the nested p2m
> > case?
> 
> Yes, I did, but I don't think the post hook can be moved out. The
> only alternative therefore would be a 3rd hook. And this hook would
> then need to be installed on the host p2m for nested guests, as
> opposed to nestedp2m_write_p2m_entry_post, which gets installed in
> the nested p2m-s. As said in the description, the main reason I
> decided against a 3rd hook is that I suppose the code here isn't
> HAP-specific (while prior to this patch it was).

I'm not convinced the guest TLB flush needs to be performed while
holding the paging lock. The point of such flush is to invalidate any
intermediate guest visible translations that might now be invalid as a
result of the p2m change, but the paging lock doesn't affect the guest
in any way.

It's true that the dirty_cpumask might change, but I think we only
care that when returning from the function there are no stale cache
entries that contain the now invalid translation, and this can be
achieved equally by doing the flush outside of the locked region.

Roger.

