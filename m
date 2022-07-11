Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DC557058B
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jul 2022 16:27:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365191.595297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAuNL-0005pZ-SM; Mon, 11 Jul 2022 14:27:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365191.595297; Mon, 11 Jul 2022 14:27:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAuNL-0005mn-NU; Mon, 11 Jul 2022 14:27:03 +0000
Received: by outflank-mailman (input) for mailman id 365191;
 Mon, 11 Jul 2022 14:27:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=79kg=XQ=citrix.com=prvs=184793b5a=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oAuNK-0005mh-4L
 for xen-devel@lists.xenproject.org; Mon, 11 Jul 2022 14:27:02 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85ae4f93-0125-11ed-bd2d-47488cf2e6aa;
 Mon, 11 Jul 2022 16:27:00 +0200 (CEST)
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
X-Inumbo-ID: 85ae4f93-0125-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1657549620;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MY570fFK4YsmxDWYZjD5dBJlRpHK/oRe5S8X0AvzdIY=;
  b=XXLKy7qYUiqTV1C/CMvONyjskHApG5jNTT/jRgPnN33N5zY3xPv44v3m
   mB2KaYOd6514Nc9RrziO64dwQltidaFZtzf0vhg1Q/7G+IilIgpe5X+Oj
   GVUozsiGbDyR0sW0M3NLascN70+z2R+MBnmqFAEwxvqxrcXJa/XzBwpxM
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: None
X-MesageID: 74830718
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:nArWqK9VDryxEi3Fnm0GDrUDN3yTJUtcMsCJ2f8bNWPcYEJGY0x3y
 zYZUWuObqyOYmanfdB1YYjioUsFsMWByNE3SFc4/iA8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ74f5fs7Rh2NQw3oHgW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnaWPGQNuApHoo85eaghGDDB+OpxF1qCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFIoZpnFnyyCfFfs8SIrPa67L+cVZzHE7gcUm8fP2O
 JZJMmIwNUSojxtnGlkaNr0FpueUnnjPcxpqlV+xqolsyj2GpOB2+P23WDbPQfSVQe1Fk0Deo
 XjJl0zpDxdfONGBxD6t9nO3mvSJjS79QJgVFrCz6rhtmlL77m4cEhoNTnOgvOK0zEW5Xrpix
 1c8o3R06/JorQryE4e7D0bQTGO4gyPwkuF4S4USgDxhAIKNi+pFLgDolgJ8VeE=
IronPort-HdrOrdr: A9a23:bF2DHKxYrFmJTa/Z1t9VKrPwLr1zdoMgy1knxilNoRw8SK2lfu
 SV7ZMmPH7P+VIssR4b9exoVJPufZqYz+8S3WBzB8bGYOCFghrKEGgK1+KLqFeMJ8S9zJ8+6U
 4JSdkGNDSaNzhHZKjBjjWFLw==
X-IronPort-AV: E=Sophos;i="5.92,263,1650945600"; 
   d="scan'208";a="74830718"
Date: Mon, 11 Jul 2022 15:26:44 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] tools/init-xenstore-domain: fix memory map for PVH
 stubdom
Message-ID: <YswzJN6UJqauUeQ8@perard.uk.xensource.com>
References: <20220624092806.27700-1-jgross@suse.com>
 <YsbxkNT+3w/lL9He@perard.uk.xensource.com>
 <165f61ae-3eae-d595-308a-d60e76cbe130@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <165f61ae-3eae-d595-308a-d60e76cbe130@suse.com>

On Thu, Jul 07, 2022 at 05:01:38PM +0200, Juergen Gross wrote:
> On 07.07.22 16:45, Anthony PERARD wrote:
> > On Fri, Jun 24, 2022 at 11:28:06AM +0200, Juergen Gross wrote:
> > > In case of maxmem != memsize the E820 map of the PVH stubdom is wrong,
> > > as it is missing the RAM above memsize.
> > > 
> > > Additionally the MMIO area should only cover the HVM special pages.
> > > 
> > > Signed-off-by: Juergen Gross <jgross@suse.com>
> > > ---
> > >   tools/helpers/init-xenstore-domain.c | 16 ++++++++++------
> > >   1 file changed, 10 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/tools/helpers/init-xenstore-domain.c b/tools/helpers/init-xenstore-domain.c
> > > index b4f3c65a8a..dad8e43c42 100644
> > > --- a/tools/helpers/init-xenstore-domain.c
> > > +++ b/tools/helpers/init-xenstore-domain.c
> > > @@ -157,21 +158,24 @@ static int build(xc_interface *xch)
> > >           config.flags |= XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap;
> > >           config.arch.emulation_flags = XEN_X86_EMU_LAPIC;
> > >           dom->target_pages = mem_size >> XC_PAGE_SHIFT;
> > > -        dom->mmio_size = GB(4) - LAPIC_BASE_ADDRESS;
> > > +        dom->mmio_size = X86_HVM_NR_SPECIAL_PAGES << XC_PAGE_SHIFT;
> > >           dom->lowmem_end = (mem_size > LAPIC_BASE_ADDRESS) ?
> > >                             LAPIC_BASE_ADDRESS : mem_size;
> > >           dom->highmem_end = (mem_size > LAPIC_BASE_ADDRESS) ?
> > >                              GB(4) + mem_size - LAPIC_BASE_ADDRESS : 0;
> > > -        dom->mmio_start = LAPIC_BASE_ADDRESS;
> > > +        dom->mmio_start = (X86_HVM_END_SPECIAL_REGION -
> > > +                           X86_HVM_NR_SPECIAL_PAGES) << XC_PAGE_SHIFT;
> > >           dom->max_vcpus = 1;
> > >           e820[0].addr = 0;
> > > -        e820[0].size = dom->lowmem_end;
> > > +        e820[0].size = (max_size > LAPIC_BASE_ADDRESS) ?
> > > +                       LAPIC_BASE_ADDRESS : max_size;
> > >           e820[0].type = E820_RAM;
> > > -        e820[1].addr = LAPIC_BASE_ADDRESS;
> > > +        e820[1].addr = dom->mmio_start;
> > 
> > 
> > So, it isn't expected to have an entry covering the LAPIC addresses,
> > right? I guess not as seen in df1ca1dfe20.
> > 
> > But based on that same commit info, shouldn't the LAPIC address part of
> > `dom->mmio_start, dom->mmio_size`? (I don't know how dom->mmio_start is
> > used, yet, but maybe it's used by Xen or xen libraries to avoid
> > allocations in the wrong places)
> 
> In my understanding this is the purpose of lowmem_end.

It looks like dom->mmio_start is used in libxenguest.meminit_hvm() to
check if a super page can be allocated, but lowmem_end would probably
prevent the check from been done in the first place. So I guess
mmio_start value doesn't matter in this case.

There is another use of mmio_start, it's in module_init_one(), which I
think is used to blobs to the guest like the firmware or the acpi
tables. It's an other check to be sure the new "module" doesn't overlap
with the mmio region. So based on that, I kind of think that mmio_start
should include the LAPIC. But on the other end, I don't think
"init-xenstore-domain" have any "module", so again, the value of
mmio_start probably doesn't matter at this point.

But maybe we should keep LAPIC in [mmio_start,mmio_size] just in case it
matter later.

> OTOH I can modify the patch to be along the lines of df1ca1dfe20.
> 
> 
> Juergen

-- 
Anthony PERARD

