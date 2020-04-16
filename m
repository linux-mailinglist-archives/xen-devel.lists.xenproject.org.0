Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F72B1ABD72
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2020 11:58:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jP1HO-0006op-UE; Thu, 16 Apr 2020 09:57:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IxKm=6A=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jP1HN-0006ok-TZ
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2020 09:57:53 +0000
X-Inumbo-ID: bcb57a20-7fc8-11ea-8b6f-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bcb57a20-7fc8-11ea-8b6f-12813bfff9fa;
 Thu, 16 Apr 2020 09:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587031072;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Lc///ge52iw6+SY+Ikb3wdVYUDR30932DvTdJF2/5RI=;
 b=aqyUnyZ4yfixQu1nSKxO6lzfBKIDOjKTvX5pZZgaHNcDJ7d+B0NfgLyR
 lEJkQeYMLD6Wi6CRlZD1Rf5EajESOFOUq46L5+dxPLacLZlD/tI4wNBmS
 w+MNm71yMolSQxVa+/dFic9EpSgWUmyP6d5wwLOwgKRm5TF2KCxOY+70l U=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: NBCwOs6L7lM5ap3HreIV8567cRrZGOYjTTB3j4cvb+j0upve7c3RFcsP+COBqS2AeYhbkn8Cb0
 gn4QOnbNl6xHV0rl/y3Ewh4HW7UnvXaXEo8NUXlUCq1OzX7Dsimlar2Z+tjtLyZWkFzi0JfNRp
 t+914568NNWaGlOIhll6aiaGfPHXb9OuCllJ6KTLhUboSWfeXqv8Q50U8mm6iSvDers0ZK/Vi2
 f2L3MJ/CaVh+djtdwLMz7OLpFqBq8v4TSpLYUM1+nDyUd84kC0BqQ+nTmt9A58gvwWl3vRP6mU
 I7Q=
X-SBRS: 2.7
X-MesageID: 16168719
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,390,1580792400"; d="scan'208";a="16168719"
Date: Thu, 16 Apr 2020 10:57:47 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [XEN PATCH v4 12/18] xen/build: factorise generation of the
 linker scripts
Message-ID: <20200416095747.GF4088@perard.uk.xensource.com>
References: <20200331103102.1105674-1-anthony.perard@citrix.com>
 <20200331103102.1105674-13-anthony.perard@citrix.com>
 <af0121cc-c282-ceb0-b5e8-44ac0ba6ebfb@suse.com>
 <20200415165832.GE4088@perard.uk.xensource.com>
 <6001a8a3-aed6-0e74-f82d-823853e44483@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6001a8a3-aed6-0e74-f82d-823853e44483@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Apr 16, 2020 at 09:36:15AM +0200, Jan Beulich wrote:
> On 15.04.2020 18:58, Anthony PERARD wrote:
> > On Wed, Apr 08, 2020 at 02:46:42PM +0200, Jan Beulich wrote:
> >> On 31.03.2020 12:30, Anthony PERARD wrote:
> >>>     - avoid using "define" for cmd_cc_lds_S, as adding '; \' on each line is
> >>>       still mandatory for if_changed (or cmd) macro to work.
> >>
> >> I still don't believe in there being a need for "; \" there. This
> >> actually breaks things, after all:
> >>
> >>> --- a/xen/Rules.mk
> >>> +++ b/xen/Rules.mk
> >>> @@ -236,6 +236,12 @@ cmd_s_S = $(CPP) $(filter-out -Wa$(comma)%,$(a_flags)) $< -o $@
> >>>  %.s: %.S FORCE
> >>>  	$(call if_changed,cpp_s_S)
> >>>  
> >>> +# Linker scripts, .lds.S -> .lds
> >>> +quiet_cmd_cc_lds_S = LDS     $@
> >>> +cmd_cc_lds_S = $(CPP) -P $(filter-out -Wa$(comma)%,$(a_flags)) -o $@ $<; \
> >>> +    sed -e 's/.*\.lds\.o:/$(@F):/g' <$(dot-target).d >$(dot-target).d.new; \
> >>> +    mv -f $(dot-target).d.new $(dot-target).d
> >>
> >> if $(CPP) or sed fail, previously the whole rule would have failed,
> >> which no longer is the case with your use of semicolons. There
> >> ought to be a solution to this, ideally one better than adding
> >> "set -e" as the first command ("define" would at least deal with
> >> the multi-line make issue, but without it being clear to me why the
> >> semicolons would be needed I don't think I can suggest anything
> >> there at the moment).
> > 
> > The only macro that will consumes cmd_cc_lds_S (and other cmd_*) is
> > "cmd", it is defined as:
> >     cmd = @set -e; $(echo-cmd) $(cmd_$(1))
> > So, "set -e" is already there, and using semicolons in commands is
> > equivalent to using "&&".
> > 
> > With "cmd" alone, multi-line command would work as expected (unless
> > $(echo-cmd) is is trying to print the command line).
> > 
> > It's "if_changed" macro that doesn't work with multi-line commands.
> > It does:
> >     $(cmd); printf '%s\n' 'cmd_$@ := $(make-cmd)' > $(dot-target).cmd
> > With a multiple line command, $(make-cmd) get's expanded to multiple
> > line, so the second argument of "printf" is going to be spread over
> > multiple line in make, and thus multiple shell. We run into this error:
> >     /bin/sh: -c: line 0: unexpected EOF while looking for matching `''
> >     /bin/sh: -c: line 1: syntax error: unexpected end of file
> > 
> > This is why we need to have commands on a single line.
> > 
> > I hope the explanation is clear enough.
> 
> Yes, thanks. One question remains though: Why do we need multiple
> commands here in the first place, when Linux gets away with one?

Actually, Linux also has multiple commands as well. After running CPP,
it runs ./fixdep (via if_change_dep) which does at least the same thing
as our sed command. We can't use fixdep yet, but I'm working toward it.

> Two other remarks: For one the command's name, aiui, ought to be
> cmd_cpp_lds_S (see Linux). And there ought to be cpp_flags, which
> would then also be used by e.g. cmd_s_S (instead of both having
> $(filter-out -Wa$(comma)%,$(a_flags)) open-coded).

When switching to use CPP instead of CC, I forgot to rename the command,
so I'll fix that.

I'll look at introducing cpp_flags.

Thanks,

-- 
Anthony PERARD

