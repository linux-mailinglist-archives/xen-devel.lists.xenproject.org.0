Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FC71DE291
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 11:06:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc3cw-0002X4-B2; Fri, 22 May 2020 09:06:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ov9E=7E=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jc3cu-0002Wz-FH
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 09:06:00 +0000
X-Inumbo-ID: 7328e0c2-9c0b-11ea-ab9c-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7328e0c2-9c0b-11ea-ab9c-12813bfff9fa;
 Fri, 22 May 2020 09:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NptQTuAO8IEJYISt6o+AcAVPdDuMKGkci5lUD57jJ18=; b=7H4VvtjQLmfL8lgKqr75GBfG/f
 nNVfxly/JDWO31KKsgC5bBmRd0U1USt5m+ZddlWdWe2oL6VbqZ0tstO0/XxslYzKO0NZHX0oAeMev
 0EM9xAgyzNYX9zXCFJSnoinjuNisS5FH2doG43bNsSGmS36y75q//A/meeE19vrGVSws=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <wl@xen.org>)
 id 1jc3cq-0005m6-6W; Fri, 22 May 2020 09:05:56 +0000
Received: from 82.149.115.87.dyn.plus.net ([87.115.149.82] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jc3cp-0006E0-Ry; Fri, 22 May 2020 09:05:56 +0000
Date: Fri, 22 May 2020 10:05:53 +0100
From: Wei Liu <wl@xen.org>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: [PATCH 2/3] configure: also add EXTRA_PREFIX to {CPP/LD}FLAGS
Message-ID: <20200522090553.eegs4fcltfqjuhzo@debian>
References: <20200505092454.9161-1-roger.pau@citrix.com>
 <20200505092454.9161-3-roger.pau@citrix.com>
 <C053A44F-FFDE-4C07-B1FD-76FA8456ADCD@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <C053A44F-FFDE-4C07-B1FD-76FA8456ADCD@arm.com>
User-Agent: NeoMutt/20180716
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, May 22, 2020 at 08:41:17AM +0000, Bertrand Marquis wrote:
> Hi,
> 
> As a consequence of this fix, the following has been committed (I guess as a consequence of regenerating the configure scripts):
> diff --git a/tools/configure b/tools/configure
> index 375430df3f..36596389b8 100755
> --- a/tools/configure
> +++ b/tools/configure
> @@ -4678,6 +4678,10 @@ for ldflag in $APPEND_LIB
>  do
>      APPEND_LDFLAGS="$APPEND_LDFLAGS -L$ldflag"
>  done
> +if  ! -z $EXTRA_PREFIX ; then
> +    CPPFLAGS="$CPPFLAGS -I$EXTRA_PREFIX/include"
> +    LDFLAGS="$LDFLAGS -L$EXTRA_PREFIX/lib"
> +fi
>  CPPFLAGS="$PREPEND_CPPFLAGS $CPPFLAGS $APPEND_CPPFLAGS"
>  LDFLAGS="$PREPEND_LDFLAGS $LDFLAGS $APPEND_LDFLAGS”
> 
> This should be:
> if  [ ! -z $EXTRA_PREFIX ]; then
> 
> As on other configure scripts.
> 
> During configure I have not the following error:
> ./configure: line 4681: -z: command not found
> 
> Which is ignored but is adding -L/lib and -I/include to the CPPFLAGS and LDFLAGS
> 
> What should be the procedure to actually fix that (as the problem is coming from the configure script regeneration I guess) ? 

Does the following patch work for you?

diff --git a/m4/set_cflags_ldflags.m4 b/m4/set_cflags_ldflags.m4
index 08f5c983cc63..cd34c139bc94 100644
--- a/m4/set_cflags_ldflags.m4
+++ b/m4/set_cflags_ldflags.m4
@@ -15,7 +15,7 @@ for ldflag in $APPEND_LIB
 do
     APPEND_LDFLAGS="$APPEND_LDFLAGS -L$ldflag"
 done
-if [ ! -z $EXTRA_PREFIX ]; then
+if test ! -z $EXTRA_PREFIX ; then
     CPPFLAGS="$CPPFLAGS -I$EXTRA_PREFIX/include"
     LDFLAGS="$LDFLAGS -L$EXTRA_PREFIX/lib"
 fi


You will need to run autogen.sh to regenerate tools/configure.

Wei.

> 
> Bertrand
> 
> > On 5 May 2020, at 10:24, Roger Pau Monne <roger.pau@citrix.com> wrote:
> > 
> > The path provided by EXTRA_PREFIX should be added to the search path
> > of the configure script, like it's done in Config.mk. Not doing so
> > makes the search path for configure differ from the search path used
> > by the build.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Please re-run autoconf.sh after applying.
> > ---
> > m4/set_cflags_ldflags.m4 | 4 ++++
> > 1 file changed, 4 insertions(+)
> > 
> > diff --git a/m4/set_cflags_ldflags.m4 b/m4/set_cflags_ldflags.m4
> > index cbad3c10b0..08f5c983cc 100644
> > --- a/m4/set_cflags_ldflags.m4
> > +++ b/m4/set_cflags_ldflags.m4
> > @@ -15,6 +15,10 @@ for ldflag in $APPEND_LIB
> > do
> >     APPEND_LDFLAGS="$APPEND_LDFLAGS -L$ldflag"
> > done
> > +if [ ! -z $EXTRA_PREFIX ]; then
> > +    CPPFLAGS="$CPPFLAGS -I$EXTRA_PREFIX/include"
> > +    LDFLAGS="$LDFLAGS -L$EXTRA_PREFIX/lib"
> > +fi
> > CPPFLAGS="$PREPEND_CPPFLAGS $CPPFLAGS $APPEND_CPPFLAGS"
> > LDFLAGS="$PREPEND_LDFLAGS $LDFLAGS $APPEND_LDFLAGS"])
> > 
> > -- 
> > 2.26.2
> > 
> > 
> 

