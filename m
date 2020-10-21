Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B21294AB0
	for <lists+xen-devel@lfdr.de>; Wed, 21 Oct 2020 11:40:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9903.26167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVAbO-0000Vb-Lo; Wed, 21 Oct 2020 09:40:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9903.26167; Wed, 21 Oct 2020 09:40:14 +0000
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
	id 1kVAbO-0000VC-Hw; Wed, 21 Oct 2020 09:40:14 +0000
Received: by outflank-mailman (input) for mailman id 9903;
 Wed, 21 Oct 2020 09:40:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hwko=D4=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kVAbN-0000V1-0k
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 09:40:13 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 58e4250a-0d48-4fed-ba3e-54f8472fffac;
 Wed, 21 Oct 2020 09:40:10 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Hwko=D4=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kVAbN-0000V1-0k
	for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 09:40:13 +0000
X-Inumbo-ID: 58e4250a-0d48-4fed-ba3e-54f8472fffac
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 58e4250a-0d48-4fed-ba3e-54f8472fffac;
	Wed, 21 Oct 2020 09:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603273211;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=y1TlbR+gOi1GdVpz8eW7YhNSSQuTMe9zPWilDB21238=;
  b=JCpsK14gIfrlyjo9Fj4svhsqeVojhIBuN4Zuup0JfS9n/9IVy55pcoU/
   cEaMSSKk5iGbJuUkhMKsqMk6XiD/iMalF2jSqVy1B0jE7Eu2kV2k0yYTb
   xhRKTy5LdpLT61s1UzMLb7EvYou5foUxGwP6u1UBCSaoY7pliq+lTFMFB
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: ejDPsS1yydqkXGHoLjqb7zQa3VP6PPuatcMBvrV2pOrFGJkjxFRvYRGIN8nypJRlITckiI0IfD
 jp68bV+s8DY3oUCycMhvqkutwOdR52g7kZq0PZBWYoM0Wt4q/bTPCRFM/gU0Rsei6LuyMX9XNW
 ko7O9O/7ll+Xj6taOiffM8FYI4IKKjB80Q2V4jAt0/KnObfQRmLKK7zqWZW4J87aNAzG5Gw7l3
 MKjVp3RS7e69bOhYhlj2WnaDaKsBnwCgRX4Cpweo5IeKhUvcez+/fDRL+F+lo1JGykfCbuxGz5
 WWg=
X-SBRS: 2.5
X-MesageID: 29467375
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,400,1596513600"; 
   d="scan'208";a="29467375"
Date: Wed, 21 Oct 2020 11:39:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<George.Dunlap@eu.citrix.com>
Subject: Re: [PATCH] x86: XENMAPSPACE_gmfn{,_batch,_range} want to special
 case idx == gpfn
Message-ID: <20201021093958.e4kopykalddam7pk@Air-de-Roger>
References: <920fa307-190e-dc11-f338-5b44a2126050@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <920fa307-190e-dc11-f338-5b44a2126050@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL06.citrite.net (10.13.108.179)

On Fri, Oct 16, 2020 at 08:44:10AM +0200, Jan Beulich wrote:
> In this case up to now we've been freeing the page (through
> guest_remove_page(), with the actual free typically happening at the
> put_page() later in the function), but then failing the call on the
> subsequent GFN consistency check. However, in my opinion such a request
> should complete as an "expensive" no-op (leaving aside the potential
> unsharing of the page).
> 
> This points out that f33d653f46f5 ("x86: replace bad ASSERT() in
> xenmem_add_to_physmap_one()" would really have needed an XSA, despite
> its description claiming otherwise, as in release builds we then put in
> place a P2M entry referencing the about to be freed page.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I've been considering to make such operations "cheap" NOPs rather than
> "expensive" ones, by comparing idx and gpfn early in the function in
> the XENMAPSPACE_gmfn case block, but I've come to the conclusion that
> having the operation perform otherwise normally is better - this way,
> errors that would result if idx != gpfn will still result. While I'm
> open to reasons towards the other alternative, having the added check be
> MFN-based makes crystal clear that we're dealing with the same
> underlying physical resource, i.e. also covers the hypothetical(?) case
> of two GFNs referring to the same MFN.
> 
> I'm unconvinced that it is correct for prev_mfn's p2mt to not be
> inspected at all - I don't think things will go right if p2m_shared()
> was true for it. But I'm afraid I'm not up to correcting mem-sharing
> related logic.
> 
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -4555,7 +4555,7 @@ int xenmem_add_to_physmap_one(
>          if ( is_special_page(mfn_to_page(prev_mfn)) )
>              /* Special pages are simply unhooked from this phys slot. */
>              rc = guest_physmap_remove_page(d, gpfn, prev_mfn, PAGE_ORDER_4K);
> -        else
> +        else if ( !mfn_eq(mfn, prev_mfn) )
>              /* Normal domain memory is freed, to avoid leaking memory. */
>              rc = guest_remove_page(d, gfn_x(gpfn));

What about the access differing between the old and the new entries,
while pointing to the same mfn, would Xen install the new entry
successfully?

Seems easier to me to use guest_physmap_remove_page in that case to
remove the entry from the p2m without freeing the page.

Thanks, Roger.

