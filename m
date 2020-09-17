Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9153326D9F3
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 13:18:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIruy-0003OE-TK; Thu, 17 Sep 2020 11:17:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R7l8=C2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kIruy-0003O9-5x
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 11:17:36 +0000
X-Inumbo-ID: 7c6eb5cb-de2d-4315-ba45-c563e0840c4e
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7c6eb5cb-de2d-4315-ba45-c563e0840c4e;
 Thu, 17 Sep 2020 11:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600341455;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=1sNczSkvYKyBI6al9cR8IYNBAQmFBabuTyrgk5HaxSA=;
 b=JzD6D6NRj8gK1Y7LrXR0V33ehheH/5jod+6wXUws3SGR1sDznRrlDMop
 gGfvTGkSp5+HppfxjuYoZpvKupil1tPx3aRx7sBuMFpgmvcFKln7vb/cr
 SWctMOB7WYiymVVkuwFjQnfeC8zMrLTVBIi2rO7CjVu4vOvT8mwbOM9BZ g=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: uAhjUlCX1yIBGRHTV8x0MUV/vDhRpjHp9ggIOeOHraQXEzC+Fd1IDfINddd2l0MYiPAbEQTpYF
 dZf6DTl31HkS4o2gM8EI3Ksx3xd1b75wi9+dWjF9kQ9iCrDPDxuRw4g8bcw/QEYNW9DuiFbU0B
 WUhR4AzRBbYuRNLTeK48dmWHh+coE03WZdrU6ItH3aMnTQbInQ3jzogLmgq8JLZrO1XdXNkgHY
 VtA5WkBaZap6eHp58BrxVYJOfKjvZX0lUXDgjmXJH+XTUa/1GJ+WJEnQtpdU3WiEVClO0fnV/P
 G+U=
X-SBRS: 2.7
X-MesageID: 27252875
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,436,1592884800"; d="scan'208";a="27252875"
Date: Thu, 17 Sep 2020 13:17:12 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
 <George.Dunlap@eu.citrix.com>, Ian Jackson <ian.jackson@citrix.com>, "Julien
 Grall" <julien@xen.org>, Wei Liu <wl@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>
Subject: Re: [PATCH v4] EFI: free unused boot mem in at least some cases
Message-ID: <20200917111712.GC19254@Air-de-Roger>
References: <5dd2fcea-d8ec-1c20-6514-c7733b59047f@suse.com>
 <d8b1bcc8-ffcc-f7fe-b4ad-ce7dcdaed491@suse.com>
 <20200917104516.GB19254@Air-de-Roger>
 <37547ef8-7381-7a8e-b735-1633eab978a2@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <37547ef8-7381-7a8e-b735-1633eab978a2@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL06.citrite.net (10.13.108.179)
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Sep 17, 2020 at 12:56:41PM +0200, Jan Beulich wrote:
> On 17.09.2020 12:45, Roger Pau Monné wrote:
> > On Wed, Sep 16, 2020 at 02:20:54PM +0200, Jan Beulich wrote:
> >> --- a/xen/arch/x86/efi/stub.c
> >> +++ b/xen/arch/x86/efi/stub.c
> >> @@ -52,6 +52,13 @@ bool efi_enabled(unsigned int feature)
> >>  
> >>  void __init efi_init_memory(void) { }
> >>  
> >> +bool efi_boot_mem_unused(unsigned long *start, unsigned long *end)
> >> +{
> >> +    if ( start || end )
> > 
> > Shouldn't this be start && end?
> 
> This is consistent with "if ( !start && !end )" in the non-stub
> function, which was there in v3 already.

Right, I certainly didn't catch that passing one as NULL would cause a
deref there also.

I would be more comfortable with adding an ASSERT, but I'm not going
to insist. IIRC there was a time when Xen running as a PVH guest (like
in shim mode) would cause it to have a valid mapping at 0.

> > Or else you might be de-referencing a NULL pointer?
> 
> Intentionally so: I'd view it as worse if we didn't fill *start
> or *end if just one gets passed as NULL. The way it's done now
> it'll be a reliable crash, as the v3 issue with the shim has
> shown (where the if() here was missing).
> 
> >> @@ -1417,8 +1419,18 @@ void __init noreturn __start_xen(unsigne
> >>      if ( !xen_phys_start )
> >>          panic("Not enough memory to relocate Xen\n");
> >>  
> >> +    /* FIXME: Putting a hole in .bss would shatter the large page mapping. */
> >> +    if ( using_2M_mapping() )
> >> +        efi_boot_mem_unused(NULL, NULL);
> > 
> > This seems really weird IMO...
> 
> What I didn't like about earlier versions was the exposure of
> using_2M_mapping() outside of this CU. The way it works is
> somewhat fragile, and hence I think limiting its exposure is a
> win. This way there's also no x86-specific code in ebmalloc.c
> anymore.
> 
> I'm also slightly puzzled that you ask now when you had acked
> this same construct in v3. It's really just the stub function
> which has changed in v4.

Would you mind also adding a FIXME comment in efi_boot_mem_unused that
setting ebmalloc_allocated to sizeof(ebmalloc_mem) will be removed
once we can properly free the region regardless of whether 2M are
being used?

Seems like an abuse of that the function should be doing by passing
NULL pointers to it, or maybe I'm just being dense.

With that:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

