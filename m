Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E54294B96
	for <lists+xen-devel@lfdr.de>; Wed, 21 Oct 2020 12:59:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10014.26396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVBpY-0000bS-1k; Wed, 21 Oct 2020 10:58:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10014.26396; Wed, 21 Oct 2020 10:58:56 +0000
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
	id 1kVBpX-0000b3-UN; Wed, 21 Oct 2020 10:58:55 +0000
Received: by outflank-mailman (input) for mailman id 10014;
 Wed, 21 Oct 2020 10:58:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hwko=D4=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kVBpW-0000ay-9F
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 10:58:54 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a51e6f7a-89d1-4fc3-ba3d-148d59eece99;
 Wed, 21 Oct 2020 10:58:53 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Hwko=D4=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kVBpW-0000ay-9F
	for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 10:58:54 +0000
X-Inumbo-ID: a51e6f7a-89d1-4fc3-ba3d-148d59eece99
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id a51e6f7a-89d1-4fc3-ba3d-148d59eece99;
	Wed, 21 Oct 2020 10:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603277934;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=4iSsupOD6Q4gc152pUGIf39Oy9WL839bdkn4POmCRe8=;
  b=ewhVWz7iiiy6kqMoALQGiYMfhrSIRSD7xzFAveKdAVIuZdgBqYovJG8t
   UFCEYueCnz48FzBXn0SGzkMd2apj/DlKh3737pv9P+djmUmVEco2yXrQr
   pbszDxjegU3ZBW/Gn3dy7Y8KtL4ETy2Xwlsw0/e/65N663BJWMzCuGoKa
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Abx5GA9fO+utGWBYzMaxwLe+qjMt0rrBzzDV383h303FqESbIrdEq9BZqvUIZUodt6aPVybGnL
 BsxayAldXeSqpMVJfhjmzq5yCv+qCz/8Gc3Ds67QpL3tDgeRoekZDIWG2qbI0MNdGQeyHCozhD
 PBJyknQHZR7q6k19N2W15bCU8uckNOPnb19Hdj3CjOIEhJPgAhllApScmdrzx+y0tILg7IcDBh
 InVSVIRLzW7EKLW/TTjdyQ9T5d74O3LV3Y3ISB3zKG/m32zCD/7r7DFBcBQlbO8kIgPqYXCIK+
 qFU=
X-SBRS: 2.5
X-MesageID: 29441339
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,401,1596513600"; 
   d="scan'208";a="29441339"
Date: Wed, 21 Oct 2020 12:58:41 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<George.Dunlap@eu.citrix.com>
Subject: Re: [PATCH] x86: XENMAPSPACE_gmfn{,_batch,_range} want to special
 case idx == gpfn
Message-ID: <20201021105841.dqx3tnw3pkys5mun@Air-de-Roger>
References: <920fa307-190e-dc11-f338-5b44a2126050@suse.com>
 <20201021093958.e4kopykalddam7pk@Air-de-Roger>
 <a979d21d-efed-9493-efd1-2643bddbbdd9@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a979d21d-efed-9493-efd1-2643bddbbdd9@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL06.citrite.net (10.13.108.179)

On Wed, Oct 21, 2020 at 12:38:48PM +0200, Jan Beulich wrote:
> On 21.10.2020 11:39, Roger Pau Monné wrote:
> > On Fri, Oct 16, 2020 at 08:44:10AM +0200, Jan Beulich wrote:
> >> --- a/xen/arch/x86/mm.c
> >> +++ b/xen/arch/x86/mm.c
> >> @@ -4555,7 +4555,7 @@ int xenmem_add_to_physmap_one(
> >>          if ( is_special_page(mfn_to_page(prev_mfn)) )
> >>              /* Special pages are simply unhooked from this phys slot. */
> >>              rc = guest_physmap_remove_page(d, gpfn, prev_mfn, PAGE_ORDER_4K);
> >> -        else
> >> +        else if ( !mfn_eq(mfn, prev_mfn) )
> >>              /* Normal domain memory is freed, to avoid leaking memory. */
> >>              rc = guest_remove_page(d, gfn_x(gpfn));
> > 
> > What about the access differing between the old and the new entries,
> > while pointing to the same mfn, would Xen install the new entry
> > successfully?
> 
> Yes - guest_physmap_add_page() doesn't get bypassed.

But will it succeed if the default access is different from the one
the installed entry currently has? Will it update the access bits
to match the new ones?

> 
> > Seems easier to me to use guest_physmap_remove_page in that case to
> > remove the entry from the p2m without freeing the page.
> 
> Why do any removal when none is really needed? I also don't see
> this fit the "special pages" clause and comment very well. I'd
> question the other way around whether guest_physmap_remove_page()
> needs calling at all (the instance above; the other one of course
> is needed).

Right, replying to my question above: it will succeed, since
guest_physmap_add_entry will overwrite the previous entry.

I agree, it looks like the guest_physmap_remove_page call done for
special pages is not really needed, as guest_physmap_add_entry would
already overwrite such entries and not free the associated mfn?

Roger.

