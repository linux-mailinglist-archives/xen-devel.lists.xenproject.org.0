Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CCF1DE53F
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 13:20:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc5iP-0000Bb-V5; Fri, 22 May 2020 11:19:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L400=7E=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jc5iO-0000BW-Bl
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 11:19:48 +0000
X-Inumbo-ID: 24f6bd45-9c1e-11ea-abb2-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 24f6bd45-9c1e-11ea-abb2-12813bfff9fa;
 Fri, 22 May 2020 11:19:47 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 827xNiK5/8ob4m5UXYy49GyQHOI+OOajdsyGOfrpNNOw+xD7Da6ppFGieENMyiTEC5vQevqbtq
 F6OlV5OqrVzO9bUf1a7DEhyF3MxhNH0LDJqU0voMxjQxVoBu+oA1/8m2iOVXZ24KU2AWH1q6Dc
 ZRW1v9MXlsQ3IO+bxOgM2yRTF56PiFfH/YBa+yIGIukFNZiMgpjM1G7JCEYECaVvpDNw605dlV
 nmlvcvK50NjsrLjlOTaWRkMzQnoMJhnS/mVzeHIzezt9ZJ1kTo8U4GyswtLIspg47fdjJ9sgHi
 gkc=
X-SBRS: 2.7
X-MesageID: 18452004
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,421,1583211600"; d="scan'208";a="18452004"
Date: Fri, 22 May 2020 13:19:40 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/3] configure: also add EXTRA_PREFIX to {CPP/LD}FLAGS
Message-ID: <20200522111940.GB54375@Air-de-Roger>
References: <20200505092454.9161-1-roger.pau@citrix.com>
 <20200505092454.9161-3-roger.pau@citrix.com>
 <C053A44F-FFDE-4C07-B1FD-76FA8456ADCD@arm.com>
 <20200522090553.eegs4fcltfqjuhzo@debian>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200522090553.eegs4fcltfqjuhzo@debian>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, May 22, 2020 at 10:05:53AM +0100, Wei Liu wrote:
> On Fri, May 22, 2020 at 08:41:17AM +0000, Bertrand Marquis wrote:
> > Hi,
> > 
> > As a consequence of this fix, the following has been committed (I guess as a consequence of regenerating the configure scripts):
> > diff --git a/tools/configure b/tools/configure
> > index 375430df3f..36596389b8 100755
> > --- a/tools/configure
> > +++ b/tools/configure
> > @@ -4678,6 +4678,10 @@ for ldflag in $APPEND_LIB
> >  do
> >      APPEND_LDFLAGS="$APPEND_LDFLAGS -L$ldflag"
> >  done
> > +if  ! -z $EXTRA_PREFIX ; then
> > +    CPPFLAGS="$CPPFLAGS -I$EXTRA_PREFIX/include"
> > +    LDFLAGS="$LDFLAGS -L$EXTRA_PREFIX/lib"
> > +fi
> >  CPPFLAGS="$PREPEND_CPPFLAGS $CPPFLAGS $APPEND_CPPFLAGS"
> >  LDFLAGS="$PREPEND_LDFLAGS $LDFLAGS $APPEND_LDFLAGS”
> > 
> > This should be:
> > if  [ ! -z $EXTRA_PREFIX ]; then
> > 
> > As on other configure scripts.
> > 
> > During configure I have not the following error:
> > ./configure: line 4681: -z: command not found
> > 
> > Which is ignored but is adding -L/lib and -I/include to the CPPFLAGS and LDFLAGS
> > 
> > What should be the procedure to actually fix that (as the problem is coming from the configure script regeneration I guess) ? 
> 
> Does the following patch work for you?
> 
> diff --git a/m4/set_cflags_ldflags.m4 b/m4/set_cflags_ldflags.m4
> index 08f5c983cc63..cd34c139bc94 100644
> --- a/m4/set_cflags_ldflags.m4
> +++ b/m4/set_cflags_ldflags.m4
> @@ -15,7 +15,7 @@ for ldflag in $APPEND_LIB
>  do
>      APPEND_LDFLAGS="$APPEND_LDFLAGS -L$ldflag"
>  done
> -if [ ! -z $EXTRA_PREFIX ]; then
> +if test ! -z $EXTRA_PREFIX ; then
>      CPPFLAGS="$CPPFLAGS -I$EXTRA_PREFIX/include"
>      LDFLAGS="$LDFLAGS -L$EXTRA_PREFIX/lib"
>  fi

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

My bad, I assume [] is expanded by m4, as that seems to be part of the
language?

Thanks, Roger.

