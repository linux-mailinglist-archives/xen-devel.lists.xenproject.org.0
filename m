Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A69A1C180E
	for <lists+xen-devel@lfdr.de>; Fri,  1 May 2020 16:43:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUWsE-0000Ct-Tg; Fri, 01 May 2020 14:42:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ojhz=6P=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jUWsD-0000Co-9n
 for xen-devel@lists.xenproject.org; Fri, 01 May 2020 14:42:41 +0000
X-Inumbo-ID: 01cadb44-8bba-11ea-b07b-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 01cadb44-8bba-11ea-b07b-bc764e2007e4;
 Fri, 01 May 2020 14:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588344160;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=S1rwDrLLWuY+5CaJz3cnKFA5E39iYwEwSHYTyKtmp9A=;
 b=VwFOscustoJbnOezX06bX+/TvOBtNE1XzsMKxYHxmBlG/0ShP0Vyd0aH
 w60vOdU27SGY/SBjFoEw/2gJR6zBJa4lPWjTq/4fCu1ClLkXszLJlOEh9
 kXRZqlKMi2jCRVzQeBRvNRDAuGcOApUzxk/kxdujfELv5rHB40tkDrPf2 4=;
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
IronPort-SDR: +K/FU1n3lEYyMQXxPxTLGrqiT0gB314+gbP7IN6a2FP+hvInOfAH5scWW+UeZoujJYxaUK/EaF
 9IO+AwEa6QdFqnDvKGFEH/25upZVvROVCt4hiF6K6CDngj7qijHeZO+gxmFrTvdIAQeBEs4yFn
 6I41MpnyM1tJmh7jy2EVYxTC7OxOVmh8F1Fb6gzJI7w4idm0y+PP/awJl1NhhqtxaURPnWfI5j
 gOcig+v0kuRDe/jCH9nJNEMXrbgl8JbJjwOUyywlGJfOUIhWAbOoHjaWGO8Wp0XLzgy9JQKhz2
 CmI=
X-SBRS: 2.7
X-MesageID: 16974406
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,339,1583211600"; d="scan'208";a="16974406"
Date: Fri, 1 May 2020 15:42:34 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [XEN PATCH v5 09/16] xen/build: use if_changed on built_in.o
Message-ID: <20200501144234.GE2116@perard.uk.xensource.com>
References: <20200421161208.2429539-1-anthony.perard@citrix.com>
 <20200421161208.2429539-10-anthony.perard@citrix.com>
 <6c6d20f5-d8ab-ee15-d2fc-e19b1dced99a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6c6d20f5-d8ab-ee15-d2fc-e19b1dced99a@suse.com>
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

On Tue, Apr 28, 2020 at 03:48:13PM +0200, Jan Beulich wrote:
> On 21.04.2020 18:12, Anthony PERARD wrote:
> > In the case where $(obj-y) is empty, we also replace $(c_flags) by
> > $(XEN_CFLAGS) to avoid generating an .%.d dependency file. This avoid
> > make trying to include %.h file in the ld command if $(obj-y) isn't
> > empty anymore on a second run.
> > 
> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> Personally I'd prefer ...
> 
> > --- a/xen/Rules.mk
> > +++ b/xen/Rules.mk
> > @@ -130,15 +130,24 @@ include $(BASEDIR)/arch/$(TARGET_ARCH)/Rules.mk
> >  c_flags += $(CFLAGS-y)
> >  a_flags += $(CFLAGS-y) $(AFLAGS-y)
> >  
> > -built_in.o: $(obj-y) $(extra-y)
> > -ifeq ($(obj-y),)
> > -	$(CC) $(c_flags) -c -x c /dev/null -o $@
> > -else
> > +quiet_cmd_ld_builtin = LD      $@
> >  ifeq ($(CONFIG_LTO),y)
> > -	$(LD_LTO) -r -o $@ $(filter-out $(extra-y),$^)
> > +cmd_ld_builtin = \
> > +    $(LD_LTO) -r -o $@ $(filter-out $(extra-y),$(real-prereqs))
> >  else
> > -	$(LD) $(XEN_LDFLAGS) -r -o $@ $(filter-out $(extra-y),$^)
> > +cmd_ld_builtin = \
> > +    $(LD) $(XEN_LDFLAGS) -r -o $@ $(filter-out $(extra-y),$(real-prereqs))
> >  endif
> > +
> > +quiet_cmd_cc_builtin = LD      $@
> > +cmd_cc_builtin = \
> > +    $(CC) $(XEN_CFLAGS) -c -x c /dev/null -o $@
> > +
> > +built_in.o: $(obj-y) $(extra-y) FORCE
> > +ifeq ($(obj-y),)
> > +	$(call if_changed,cc_builtin)
> > +else
> > +	$(call if_changed,ld_builtin)
> >  endif
> 
> ...
> 
>    $(call if_changed,$(if $(obj-y),ld,cc)_builtin)
> 
> but perhaps I'm the only one.

I think so. Spelling the full name of the command makes it easier to
look for where it is used, or for where it is defined.

Linux doesn't have this issue about checking $(obj-y) as they use 'ar'
to make archives of objects, an archive with 0 object is fine. But that
is something I'll look at later, to find out if it is better and why.

Thanks,

-- 
Anthony PERARD

