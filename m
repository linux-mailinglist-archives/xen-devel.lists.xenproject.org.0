Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F7D1D93A1
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 11:42:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jayla-0003Qc-ST; Tue, 19 May 2020 09:42:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fY7P=7B=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jaylZ-0003QW-9q
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 09:42:29 +0000
X-Inumbo-ID: 0d1ebd40-99b5-11ea-ae69-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0d1ebd40-99b5-11ea-ae69-bc764e2007e4;
 Tue, 19 May 2020 09:42:28 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: +/BYSCIfvq6nw29ir08rVcq6LLiA3pX7CRye5gBnQTvShJ6RsbCE7b+w4fliC8pmGKv1y5T3F7
 fmDRt4ITy2qzx8VaQQ8t3WXmrfN5nNsO91aTsiwkBgvXhGS8b34h/fpU3eafCnOoiMXZuUSvm+
 DS/TbzfH1WgSHjzUNn4BEr/n/gs+HIToPLN0WuOZ1egtlevIQztconL5IcncaDzDk91UGcnDNi
 2y8XkDxEqVXzi0QvMdDwuE8VWTpkV2xYQYhP2N55sFpZflbqnj9fx/B4ACO+5BowON9Njka2Us
 WC8=
X-SBRS: 2.7
X-MesageID: 18228401
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,409,1583211600"; d="scan'208";a="18228401"
Date: Tue, 19 May 2020 10:42:22 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 1/2] tools/python: Fix install-wrap
Message-ID: <20200519094222.GB2105@perard.uk.xensource.com>
References: <20200311175933.1362235-1-anthony.perard@citrix.com>
 <20200311175933.1362235-2-anthony.perard@citrix.com>
 <20200519085815.nswits7owiutn3nc@debian>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200519085815.nswits7owiutn3nc@debian>
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, May 19, 2020 at 09:58:15AM +0100, Wei Liu wrote:
> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
> 
> On Wed, Mar 11, 2020 at 05:59:32PM +0000, Anthony PERARD wrote:
> > This allows to use install-wrap when the source scripts is in a
> > subdirectory.
> > 
> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> > ---
> >  tools/python/install-wrap | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/tools/python/install-wrap b/tools/python/install-wrap
> > index 00e2014016f9..fef24e01708d 100755
> > --- a/tools/python/install-wrap
> > +++ b/tools/python/install-wrap
> > @@ -44,7 +44,7 @@ shift
> >  destf="$dest"
> >  for srcf in ${srcs}; do
> >  	if test -d "$dest"; then
> > -		destf="$dest/${srcf%%*/}"
> > +		destf="$dest/${srcf##*/}"
> 
> This seems to have changed the pattern from "Remove Largest Suffix" to
> "Remove Largest Prefix".
> 
> What does it do in practice?
> 
> For POSIX sh
> 
> x=posix/src/std
> echo ${x%%*/} -> posix/src/std
> echo ${x##*/} -> std
> 
> I would think the former is what you want. But I could be missing
> something obvious.

The former is a noop. It's the same as not doing anything.

Unless x="dir/dir/" and in that case, the %% would remove everything,
resulting in an empty string.

$srcf contains the path to where the script which we want to install is,
which is a relative path from where the ./install-wrap is executed from.
$destf is the final destination of the script, but if $dest is a
directory, then ./install-wrap wants to install the script in $dest, not
in some sub-directory of it. ./install-wrap doesn't handle this
sub-directory it fails to execute when there is one. (It's probably the
$install that failed to copy $srcf in a non-existing directory.)

This from the next patch is probably where things fails
    $(INSTALL_PYTHON_PROG) scripts/convert-legacy-stream $(DESTDIR)$(LIBEXEC_BIN)

-- 
Anthony PERARD

