Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6F81A1148
	for <lists+xen-devel@lfdr.de>; Tue,  7 Apr 2020 18:24:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLr0w-00036l-Kq; Tue, 07 Apr 2020 16:23:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Jrji=5X=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jLr0u-00036g-Un
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2020 16:23:48 +0000
X-Inumbo-ID: 28caa020-78ec-11ea-80fe-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 28caa020-78ec-11ea-80fe-12813bfff9fa;
 Tue, 07 Apr 2020 16:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Mime-Version:Content-Type:
 References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LQGP1fTF3C6QjA4Ix13jNx+O7KOuOlh/xXaCviki9NA=; b=fzoD0DuRc2B6lxQGmTO9zjKmoF
 +vRPO998bWz3ph9Z8GdNVb5UItpRm/Hml49mryPr5pJNzFbovCJ0wYG2hwIq1gL+s77LxVbi346f6
 unv9RYx3/GoDMghXS7i8JfksMKdFOslTWFOgRrFKPEvBFVQQ70hUopSm2V3pMg9r+2A0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jLr0s-0007JB-Hu; Tue, 07 Apr 2020 16:23:46 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=freeip.amazon.com) by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jLr0s-0002yN-79; Tue, 07 Apr 2020 16:23:46 +0000
Message-ID: <6507a4a619c80afce01f2eaeef1f0d772aaadfef.camel@xen.org>
Subject: Re: [PATCH 5/5] x86_64/mm: map and unmap page tables in
 destroy_m2p_mapping
From: Hongyan Xia <hx242@xen.org>
To: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Date: Tue, 07 Apr 2020 17:23:44 +0100
In-Reply-To: <7981c892-0e5c-03fb-679c-94f023a5c9fc@suse.com>
References: <cover.1584955616.git.hongyxia@amazon.com>
 <7143c2a1e0c7ca46b3ace329d7dcab85e0b5c87c.1584955616.git.hongyxia@amazon.com>
 <7981c892-0e5c-03fb-679c-94f023a5c9fc@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org,
 Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, 2020-04-01 at 14:40 +0200, Jan Beulich wrote:
> On 23.03.2020 10:41, Hongyan Xia wrote:
> > @@ -297,26 +298,33 @@ static void destroy_m2p_mapping(struct
> > mem_hotadd_info *info)
> >              continue;
> >          }
> >  
> > -        l2_ro_mpt = l3e_to_l2e(l3_ro_mpt[l3_table_offset(va)]);
> > +        l2_ro_mpt =
> > map_l2t_from_l3e(l3_ro_mpt[l3_table_offset(va)]);
> >          if (!(l2e_get_flags(l2_ro_mpt[l2_table_offset(va)]) &
> > _PAGE_PRESENT))
> >          {
> >              i = ( i & ~((1UL << (L2_PAGETABLE_SHIFT - 3)) - 1)) +
> >                      (1UL << (L2_PAGETABLE_SHIFT - 3)) ;
> > +            UNMAP_DOMAIN_PAGE(l2_ro_mpt);
> >              continue;
> >          }
> >  
> >          pt_pfn = l2e_get_pfn(l2_ro_mpt[l2_table_offset(va)]);
> >          if ( hotadd_mem_valid(pt_pfn, info) )
> >          {
> > +            l2_pgentry_t *l2t;
> > +
> >              destroy_xen_mappings(rwva, rwva + (1UL <<
> > L2_PAGETABLE_SHIFT));
> >  
> > -            l2_ro_mpt =
> > l3e_to_l2e(l3_ro_mpt[l3_table_offset(va)]);
> > -            l2e_write(&l2_ro_mpt[l2_table_offset(va)],
> > l2e_empty());
> > +            l2t =
> > map_l2t_from_l3e(l3_ro_mpt[l3_table_offset(va)]);
> 
> Why a 2nd mapping of the same L3 entry that you've already mapped
> into l2_ro_mpt?
> > +            l2e_write(&l2t[l2_table_offset(va)], l2e_empty());
> > +            UNMAP_DOMAIN_PAGE(l2t);
> 
> If this then weren't to go away, it should again be the lowercase
> variant imo, as the variable's scope ends here.

Hmm, I don't see a reason why l2_ro_mpt needs to be mapped again either
(and don't see why it was re-derived in the original code), so yes, I
think the map and unmap can just be dropped. Will revise.

Hongyan


