Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 216AC1DE51E
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 13:12:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc5an-0008Jb-P3; Fri, 22 May 2020 11:11:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L400=7E=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jc5al-0008JU-OO
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 11:11:55 +0000
X-Inumbo-ID: 0b5442fe-9c1d-11ea-ae69-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0b5442fe-9c1d-11ea-ae69-bc764e2007e4;
 Fri, 22 May 2020 11:11:55 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: cmEcbCWDR4PUoj0+CoKGxJixscdbKuGR2xM4meav+piJVMvswePK4yf8NwykuYcJm3jgo/YvM0
 meq4BlCiqbIWJzCgfJHPKPgbNsev7BFeLSafRqr8aDmQvx6Kl0rHwcGOCTDrvQF/iUMfalz+Q3
 PpRDtwXPrVbgBJr7QMRkxJRE3NSxuMyTbv1ej4SImqJPdl7sha6mU4U3fDHi4v953S7gQ3DIcI
 xMaIkvZtwlxW43aQkzBy7TXoe0KUreORonwk+X5SZoFyuduTQSYtXopZfh3rYeW/8RpkQKRKSG
 dXM=
X-SBRS: 2.7
X-MesageID: 18888693
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,421,1583211600"; d="scan'208";a="18888693"
Date: Fri, 22 May 2020 13:11:46 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Subject: Re: [PATCH] x86/svm: retry after unhandled NPT fault if gfn was
 marked for recalculation
Message-ID: <20200522111146.GZ54375@Air-de-Roger>
References: <1590097438-28829-1-git-send-email-igor.druzhinin@citrix.com>
 <20200522100846.GV54375@Air-de-Roger>
 <04ec4ab4-a121-c5be-0a65-316e237dd793@citrix.com>
 <20200522102339.GX54375@Air-de-Roger>
 <fe6e5c7f-df0f-5436-a7cd-2949464ab9a7@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fe6e5c7f-df0f-5436-a7cd-2949464ab9a7@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, wl@xen.org, jbeulich@suse.com,
 andrew.cooper3@citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, May 22, 2020 at 11:27:38AM +0100, Igor Druzhinin wrote:
> On 22/05/2020 11:23, Roger Pau Monné wrote:
> > On Fri, May 22, 2020 at 11:14:24AM +0100, Igor Druzhinin wrote:
> >> On 22/05/2020 11:08, Roger Pau Monné wrote:
> >>> On Thu, May 21, 2020 at 10:43:58PM +0100, Igor Druzhinin wrote:
> >>>> If a recalculation NPT fault hasn't been handled explicitly in
> >>>> hvm_hap_nested_page_fault() then it's potentially safe to retry -
> >>>> US bit has been re-instated in PTE and any real fault would be correctly
> >>>> re-raised next time.
> >>>>
> >>>> This covers a specific case of migration with vGPU assigned on AMD:
> >>>> global log-dirty is enabled and causes immediate recalculation NPT
> >>>> fault in MMIO area upon access. This type of fault isn't described
> >>>> explicitly in hvm_hap_nested_page_fault (this isn't called on
> >>>> EPT misconfig exit on Intel) which results in domain crash.
> >>>
> >>> Couldn't direct MMIO regions be handled like other types of memory for
> >>> the purposes of logdiry mode?
> >>>
> >>> I assume there's already a path here used for other memory types when
> >>> logdirty is turned on, and hence would seem better to just make direct
> >>> MMIO regions also use that path?
> >>
> >> The proble of handling only MMIO case is that the issue still stays.
> >> It will be hit with some other memory type since it's not MMIO specific.
> >> The issue is that if global recalculation is called, the next hit to
> >> this type will cause a transient fault which will not be handled
> >> correctly after a due fixup by neither of our handlers.
> > 
> > I admit I should go look at the code, but for example RAM p2m types
> > don't require this fix, so I assume there's some different path taken
> > in that case that avoids all this?
> > 
> > Ie: when global logdirty is enabled you will start to get nested page
> > faults for every access, yet only direct MMIO types require this fix?
> 
> It's not "only MMIO" - it's just MMIO area is hit in my particular case.
> I'd prefer this fix to address the general issue otherwise for SVM
> we would have to write handlers in hvm_hap_nested_page_fault() for
> every case as soon as we hit it.

Hm, I'm not sure I agree. p2m memory types are limited, and IMO we
want to have strict control about how they are handled.
hvm_hap_nested_page_fault is already full of special casing for each
memory type for that reason.

That being said, I also don't like the fact that logdity is handled
differently between EPT and NPT, as on EPT it's handled as a
misconfig while on NPT it's handled as a violation.

Thanks, Roger.

