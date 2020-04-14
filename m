Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2271A753A
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 09:53:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOGNV-000808-Jn; Tue, 14 Apr 2020 07:53:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=18iO=56=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jOGNU-000801-2k
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 07:53:04 +0000
X-Inumbo-ID: f6352126-7e24-11ea-88fa-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f6352126-7e24-11ea-88fa-12813bfff9fa;
 Tue, 14 Apr 2020 07:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586850782;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CFt85BU1qwoXszX5XYJ/HQmnvGzfLzj1No+G8/T/n/g=;
 b=EK8LJH+FtS8FiPSuwfrnkhhY6CUC0mLOHzLLk/Adth0pj6C8gdmPRJ5y
 pgCDP+2qivgl/gRMk3+QesIWu3RQnFIdjvIE4qdcWq/1zFwn+8Za3OQWE
 UG46/G4ThiVySkS5V0HpS6KGV5q3gtbGRK9ojEahCPklKfahyQLmwJYQK I=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 5/iclHshC0egJG/nk0FkVyQyHns2TW5GKgLrtkCMQ4STKhdXgEeEuf4CxDhkYOMlohX+UOwc0t
 D9S+NFDjymi4049FdNMHu9mMieqEIFxDRZCgP2Stgz9rKy23R9YYLM/xPJM29r4/9npeU4Qq2c
 Kqd7RxPBEavIB/6yN81+PCiiyl0Bu9J68hEi0nm4aD42DRRV4QRNdS5UirC2lYr7OYEeumbLZ7
 dpbKsulbGhSRIecd3mYaRzqGbzXr9Hbq++RkWUhnRPl+hwprknJvisWygRh+eCaKzTdpPbOQA/
 ZRg=
X-SBRS: 2.7
X-MesageID: 16296411
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,381,1580792400"; d="scan'208";a="16296411"
Date: Tue, 14 Apr 2020 09:52:45 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v9 1/3] x86/tlb: introduce a flush HVM ASIDs flag
Message-ID: <20200414075245.GC28601@Air-de-Roger>
References: <20200406105703.79201-1-roger.pau@citrix.com>
 <20200406105703.79201-2-roger.pau@citrix.com>
 <30062a0c-6587-a16e-2b31-de0dd6bf4c9a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <30062a0c-6587-a16e-2b31-de0dd6bf4c9a@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: xen-devel@lists.xenproject.org, Tim Deegan <tim@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Apr 09, 2020 at 01:54:40PM +0200, Jan Beulich wrote:
> On 06.04.2020 12:57, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/mm/hap/hap.c
> > +++ b/xen/arch/x86/mm/hap/hap.c
> > @@ -118,7 +118,7 @@ int hap_track_dirty_vram(struct domain *d,
> >              p2m_change_type_range(d, begin_pfn, begin_pfn + nr,
> >                                    p2m_ram_rw, p2m_ram_logdirty);
> >  
> > -            flush_tlb_mask(d->dirty_cpumask);
> > +            hap_flush_tlb_mask(d->dirty_cpumask);
> >  
> >              memset(dirty_bitmap, 0xff, size); /* consider all pages dirty */
> >          }
> > @@ -205,7 +205,7 @@ static int hap_enable_log_dirty(struct domain *d, bool_t log_global)
> >           * to be read-only, or via hardware-assisted log-dirty.
> >           */
> >          p2m_change_entry_type_global(d, p2m_ram_rw, p2m_ram_logdirty);
> > -        flush_tlb_mask(d->dirty_cpumask);
> > +        hap_flush_tlb_mask(d->dirty_cpumask);
> >      }
> >      return 0;
> >  }
> > @@ -234,7 +234,7 @@ static void hap_clean_dirty_bitmap(struct domain *d)
> >       * be read-only, or via hardware-assisted log-dirty.
> >       */
> >      p2m_change_entry_type_global(d, p2m_ram_rw, p2m_ram_logdirty);
> > -    flush_tlb_mask(d->dirty_cpumask);
> > +    hap_flush_tlb_mask(d->dirty_cpumask);
> >  }
> >  
> >  /************************************************/
> > @@ -798,7 +798,7 @@ hap_write_p2m_entry(struct p2m_domain *p2m, unsigned long gfn, l1_pgentry_t *p,
> >  
> >      safe_write_pte(p, new);
> >      if ( old_flags & _PAGE_PRESENT )
> > -        flush_tlb_mask(d->dirty_cpumask);
> > +        hap_flush_tlb_mask(d->dirty_cpumask);
> >  
> >      paging_unlock(d);
> >  
> 
> Following up on my earlier mail about paging_log_dirty_range(), I'm
> now of the opinion that all of these flushes should go away too. I
> can only assume that they got put where they are when HAP code was
> cloned from the shadow one. These are only p2m operations, and hence
> p2m level TLB flushing is all that's needed here.

IIRC without those ASID flushes NPT won't work correctly, as I think
it relies on those flushes when updating the p2m.

We could see about moving those flushes inside the NPT functions that
modify the p2m, AFAICT p2m_pt_set_entry which calls
p2m->write_p2m_entry relies on the later doing the ASID flushes, as it
doesn't perform any.

Thanks, Roger.

