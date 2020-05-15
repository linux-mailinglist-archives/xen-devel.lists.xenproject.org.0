Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B15991D55C7
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2020 18:22:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZd5J-0007J0-1Z; Fri, 15 May 2020 16:21:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CqcK=65=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jZd5H-0007Iv-UC
 for xen-devel@lists.xenproject.org; Fri, 15 May 2020 16:21:15 +0000
X-Inumbo-ID: 18876e7f-96c8-11ea-a594-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 18876e7f-96c8-11ea-a594-12813bfff9fa;
 Fri, 15 May 2020 16:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589559674;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gTDncA46BJ3IXjS8vTOnondOAUPsB/a2ijpHo0ua58s=;
 b=SV9H0NtLJ+XNO93eXEW2dBw6izrFRIKyZQCm7zLYf3wcrHLOwt7ZR8zb
 7yBFwSigwZqY0WwZzA9nODe5LzAnTLelQ4w38iA1PedJnXOwAnHl+eB91
 TmU8H+rQ/sLt2tNJfTctNafI/3BwWqVjrST6ce7C+WxHcXHdWAr+e12jm M=;
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: got8mvFOKaDV5eQwxeRoQ+nLzxGoxx5NCZZVwfEnoPBCAlnfuvf6FdnK9H6xy5x5NHCH6hstV9
 g/wlhiY/HKRQe5hYUOC+7bNSdkTKQ1PvEubs5yhnZydD2+AfuoSv0l9DQk2LIGxM5Kl8FEENBe
 azR73aRASpO8eIorwtChbREzrWv18AIqbFitbuxTGxt5m+BUNKDCZ4/kLPNaxy+9rM0WZc1rD6
 7xucs80M64rCV7VqQ4LO4fG+PuPDr42E0AG7hSmLhWmaUStQDH+PQF1TJyCGez6qi86ZRHEEVa
 u74=
X-SBRS: 2.7
X-MesageID: 17915855
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,395,1583211600"; d="scan'208";a="17915855"
Date: Fri, 15 May 2020 17:21:08 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 05/16] x86/shstk: Introduce Supervisor Shadow Stack support
Message-ID: <20200515162108.GM2116@perard.uk.xensource.com>
References: <20200501225838.9866-1-andrew.cooper3@citrix.com>
 <20200501225838.9866-6-andrew.cooper3@citrix.com>
 <d0347fec-3ccb-daa7-5c4d-f0e74b5fb247@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d0347fec-3ccb-daa7-5c4d-f0e74b5fb247@suse.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, May 04, 2020 at 03:52:58PM +0200, Jan Beulich wrote:
> On 02.05.2020 00:58, Andrew Cooper wrote:
> > --- a/xen/scripts/Kconfig.include
> > +++ b/xen/scripts/Kconfig.include
> > @@ -31,6 +31,10 @@ cc-option = $(success,$(CC) -Werror $(CLANG_FLAGS) $(1) -E -x c /dev/null -o /de
> >  # Return y if the linker supports <flag>, n otherwise
> >  ld-option = $(success,$(LD) -v $(1))
> >  
> > +# $(as-instr,<instr>)
> > +# Return y if the assembler supports <instr>, n otherwise
> > +as-instr = $(success,printf "%b\n" "$(1)" | $(CC) $(CLANG_FLAGS) -c -x assembler -o /dev/null -)
> 
> CLANG_FLAGS caught my eye here, then noticing that cc-option
> also uses it. Anthony - what's the deal with this? It doesn't
> look to get defined anywhere, and I also don't see what clang-
> specific about these constructs.

It's because these constructs are gcc-specific :-). Indeed CLANG_FLAGS
probably needs to be defined as I don't think providing the full
AFLAGS/CFLAGS is going to be a good idea and may change the result of
the commands.

Linux has a few clang specific flags in CLANG_FLAGS, I have found those:
    The ones for cross compilation: --prefix, --target, --gcc-toolchain
    -no-integrated-as
    -Werror=unknown-warning-option
And that's it.

So, I think we could keep using CLANG_FLAGS in Kconfig.include and
define it in Makefile with a comment saying that it's only used by
Kconfig. It would always have -Werror=unknown-warning-option and have
-no-integrated-as when needed, the -Wunknown-warning-option is present
in clang 3.0.0, according Linux's commit 589834b3a009 ("kbuild: Add
-Werror=unknown-warning-option to CLANG_FLAGS").

The options -Werror=unknown-warning-option is to make sure that the
warning is enabled, even though it is by default but could be disabled
in a particular build of clang, see e8de12fb7cde ("kbuild: Check for
unknown options with cc-option usage in Kconfig and clang")

I'll write a patch with this new CLANG_FLAGS.

-- 
Anthony PERARD

