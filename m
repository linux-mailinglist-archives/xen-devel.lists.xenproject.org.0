Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB090653D02
	for <lists+xen-devel@lfdr.de>; Thu, 22 Dec 2022 09:30:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468283.727344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8Gxw-0007Rk-NS; Thu, 22 Dec 2022 08:30:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468283.727344; Thu, 22 Dec 2022 08:30:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8Gxw-0007OJ-KB; Thu, 22 Dec 2022 08:30:12 +0000
Received: by outflank-mailman (input) for mailman id 468283;
 Thu, 22 Dec 2022 08:30:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+oFi=4U=linux.intel.com=ville.syrjala@srs-se1.protection.inumbo.net>)
 id 1p8Gxu-0007OB-HG
 for xen-devel@lists.xenproject.org; Thu, 22 Dec 2022 08:30:10 +0000
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7343e44-81d2-11ed-8fd4-01056ac49cbb;
 Thu, 22 Dec 2022 09:30:08 +0100 (CET)
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 00:30:05 -0800
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga008.fm.intel.com with SMTP; 22 Dec 2022 00:29:58 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 22 Dec 2022 10:29:57 +0200
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
X-Inumbo-ID: d7343e44-81d2-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671697809; x=1703233809;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Rf9ZNz0+k7YDP5f695EjMvDqSxQgEwLSpAmEJPlt22M=;
  b=SKVugw5lGim4nHGRXPAB6Q9SseZAfj4SJ+OJCyC4bYyQt2VAMVEapjyb
   4FIAqvVQGh16hY6raN7POc/IB+Gl5WOZIf1g7hiOk0LhWS7s97MILF8yU
   UoiOxJzYs1anfnneaE+dX7p/C5StRyWOzNSgdA5VGk7iKSP4L+foyyJu/
   T9dS/SxdSoIoYhSOpTLj9nXh1ChS0BPSyIHbYzbOKeKVDOMPAECIK2qvY
   zOZyQY12oVNERCieXSI0WELvC/VG+ZPYLkj77PvmB4tGtswPpH59vB5JL
   p6JtWJGihkSz6W7Jk72gMC7/KHrd0Y9eXO+aTz5BDvUpSMaqNRbUch2l+
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="318771212"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; 
   d="scan'208";a="318771212"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="715081283"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; 
   d="scan'208";a="715081283"
Date: Thu, 22 Dec 2022 10:29:57 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	the arch/x86 maintainers <x86@kernel.org>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	"Demi M. Obenour" <demi@invisiblethingslab.com>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [Intel-gfx] [cache coherency bug] i915 and PAT attributes
Message-ID: <Y6QVhRP+voSLi9xm@intel.com>
References: <Y5Hst0bCxQDTN7lK@mail-itl>
 <1c326e0c-5812-083a-0739-aa20fab3efc4@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1c326e0c-5812-083a-0739-aa20fab3efc4@citrix.com>
X-Patchwork-Hint: comment

On Fri, Dec 16, 2022 at 03:30:13PM +0000, Andrew Cooper wrote:
> On 08/12/2022 1:55 pm, Marek Marczykowski-Górecki wrote:
> > Hi,
> >
> > There is an issue with i915 on Xen PV (dom0). The end result is a lot of
> > glitches, like here: https://openqa.qubes-os.org/tests/54748#step/startup/8
> > (this one is on ADL, Linux 6.1-rc7 as a Xen PV dom0). It's using Xorg
> > with "modesetting" driver.
> >
> > After some iterations of debugging, we narrowed it down to i915 handling
> > caching. The main difference is that PAT is setup differently on Xen PV
> > than on native Linux. Normally, Linux does have appropriate abstraction
> > for that, but apparently something related to i915 doesn't play well
> > with it. The specific difference is:
> > native linux:
> > x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT
> > xen pv:
> > x86/PAT: Configuration [0-7]: WB  WT  UC- UC  WC  WP  UC  UC
> >                                   ~~          ~~      ~~  ~~
> >
> > The specific impact depends on kernel version and the hardware. The most
> > severe issues I see on >=ADL, but some older hardware is affected too -
> > sometimes only if composition is disabled in the window manager.
> > Some more information is collected at
> > https://github.com/QubesOS/qubes-issues/issues/4782 (and few linked
> > duplicates...).
> >
> > Kind-of related commit is here:
> > https://github.com/torvalds/linux/commit/bdd8b6c98239cad ("drm/i915:
> > replace X86_FEATURE_PAT with pat_enabled()") - it is the place where
> > i915 explicitly checks for PAT support, so I'm cc-ing people mentioned
> > there too.
> >
> > Any ideas?
> >
> > The issue can be easily reproduced without Xen too, by adjusting PAT in
> > Linux:
> > -----8<-----
> > diff --git a/arch/x86/mm/pat/memtype.c b/arch/x86/mm/pat/memtype.c
> > index 66a209f7eb86..319ab60c8d8c 100644
> > --- a/arch/x86/mm/pat/memtype.c
> > +++ b/arch/x86/mm/pat/memtype.c
> > @@ -400,8 +400,8 @@ void pat_init(void)
> >  		 * The reserved slots are unused, but mapped to their
> >  		 * corresponding types in the presence of PAT errata.
> >  		 */
> > -		pat = PAT(0, WB) | PAT(1, WC) | PAT(2, UC_MINUS) | PAT(3, UC) |
> > -		      PAT(4, WB) | PAT(5, WP) | PAT(6, UC_MINUS) | PAT(7, WT);
> > +		pat = PAT(0, WB) | PAT(1, WT) | PAT(2, UC_MINUS) | PAT(3, UC) |
> > +		      PAT(4, WC) | PAT(5, WP) | PAT(6, UC)       | PAT(7, UC);
> >  	}
> >  
> >  	if (!pat_bp_initialized) {
> > -----8<-----
> >
> 
> Hello, can anyone help please?
> 
> Intel's CI has taken this reproducer of the bug, and confirmed the
> regression. 
> https://lore.kernel.org/intel-gfx/Y5Hst0bCxQDTN7lK@mail-itl/T/#m4480c15a0d117dce6210562eb542875e757647fb
> 
> We're reasonably confident that it is an i915 bug (given the repro with
> no Xen in the mix), but we're out of any further ideas.

I don't think we have any code that assumes anything about the PAT,
apart from WC being available (which seems like it should still be
the case with your modified PAT). I suppose you'll just have to 
start digging from pgprot_writecombine()/noncached() and make sure
everything ends up using the correct PAT entry.

-- 
Ville Syrjälä
Intel

