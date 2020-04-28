Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F801BC073
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 16:02:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTQnh-00040N-Dc; Tue, 28 Apr 2020 14:01:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xuLu=6M=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jTQnf-00040I-9p
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 14:01:27 +0000
X-Inumbo-ID: bfb32e4a-8958-11ea-ae69-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bfb32e4a-8958-11ea-ae69-bc764e2007e4;
 Tue, 28 Apr 2020 14:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588082486;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3ZI32rbX7vbjAnfVe3E63LPPSn3OkMfFTsauLKrnmIo=;
 b=WDY89AaC4IG1IBupmpKds+db7lSHvuaxZXykpkIkcoqOW3ney0451LDx
 GZkFonoo6GukzcI1xAsc2wtMhLkxTbJFdXZf2IJhKJgVR8yBOmAOsL2c4
 wAhchPcwNIvlrHinVolFJ3EzRRLpq4qORgv0QS9X4Mwsgk80wuiIC/QdO I=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: z3GuTzryai4oOgRNCvJGwRm3OLXhYUCVzzYaBSEdTPcuAoeKjszrM1F6qT+MwLrsDzsB9qFU9Y
 iI6x8+k2pl47aMJfSRGEU+OEzOf0ZZ5INi4qWPKWLDrw6ZmzRJqeSJricfezHlBZQhPDNRtbTe
 6/vZi4EjkUb3EySiIFlWGlypI635jtoE8zI+i+QPr3FwDRaE8ozmoLPlZboHcAHy0neBCZJAV6
 LRh7QCswcKGvjmw6R1vdT7kv/YYZSDNIhxKUChnWoTvolP+D7EK7fZ0HLgcSUnLJj+mDahyfFk
 /0c=
X-SBRS: 2.7
X-MesageID: 16626119
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,327,1583211600"; d="scan'208";a="16626119"
Date: Tue, 28 Apr 2020 15:01:19 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [XEN PATCH v5 08/16] build: Introduce $(cpp_flags)
Message-ID: <20200428140119.GC2116@perard.uk.xensource.com>
References: <20200421161208.2429539-1-anthony.perard@citrix.com>
 <20200421161208.2429539-9-anthony.perard@citrix.com>
 <62011f46-b208-334a-4070-0bd72cb21d28@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <62011f46-b208-334a-4070-0bd72cb21d28@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Apr 23, 2020 at 06:48:51PM +0200, Jan Beulich wrote:
> On 21.04.2020 18:12, Anthony PERARD wrote:
> > --- a/xen/Rules.mk
> > +++ b/xen/Rules.mk
> > @@ -123,6 +123,7 @@ $(obj-bin-y): XEN_CFLAGS := $(filter-out -flto,$(XEN_CFLAGS))
> >  
> >  c_flags = -MMD -MP -MF $(@D)/.$(@F).d $(XEN_CFLAGS) '-D__OBJECT_FILE__="$@"'
> >  a_flags = -MMD -MP -MF $(@D)/.$(@F).d $(XEN_AFLAGS)
> > +cpp_flags = $(filter-out -Wa$(comma)%,$(a_flags))
> 
> I can see this happening to be this way right now, but in principle
> I could see a_flags to hold items applicable to assembly files only,
> but not to (the preprocessing of) C files. Hence while this is fine
> for now, ...
> 
> > @@ -207,7 +208,7 @@ quiet_cmd_cc_s_c = CC      $@
> >  cmd_cc_s_c = $(CC) $(filter-out -Wa$(comma)%,$(c_flags)) -S $< -o $@
> >  
> >  quiet_cmd_s_S = CPP     $@
> > -cmd_s_S = $(CPP) $(filter-out -Wa$(comma)%,$(a_flags)) $< -o $@
> > +cmd_s_S = $(CPP) $(cpp_flags) $< -o $@
> 
> ... this one is a trap waiting for someone to fall in imo. Instead
> where I'd expect this patch to use $(cpp_flags) is e.g. in
> xen/arch/x86/mm/Makefile:
> 
> guest_walk_%.i: guest_walk.c Makefile
> 	$(CPP) $(cpp_flags) -DGUEST_PAGING_LEVELS=$* -c $< -o $@
> 
> And note how this currently uses $(c_flags), not $(a_flags), which
> suggests that your deriving from $(a_flags) isn't correct either.

I think we can drop this patch for now, and change patch "xen/build:
factorise generation of the linker scripts" to not use $(cpp_flags).

If we derive $(cpp_flags) from $(c_flags) instead, we would need to
find out if CPP commands using a_flags can use c_flags instead.

On the other hand, I've looked at Linux source code, and they use
$(cpp_flags) for only a few targets, only to generate the .lds scripts.
For other rules, they use either a_flags or c_flags, for example:
    %.i: %.c ; uses $(c_flags)
    %.i: %.S ; uses $(a_flags)
    %.s: %.S ; uses $(a_flags)

(Also, they use -Qunused-arguments clang's options, so they don't need
to filter out -Wa,* arguments, I think.)

So, maybe having a single $(cpp_flags) when running the CPP command
isn't such a good idea.

So, would dropping $(cpp_flags) for now, and rework the *FLAGS later, be
good enough?

Thanks,

-- 
Anthony PERARD

