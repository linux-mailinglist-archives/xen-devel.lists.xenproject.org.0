Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6D153E4E2
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jun 2022 15:52:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.342582.567630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyD9E-0004jp-5E; Mon, 06 Jun 2022 13:52:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 342582.567630; Mon, 06 Jun 2022 13:52:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyD9E-0004gt-2F; Mon, 06 Jun 2022 13:52:00 +0000
Received: by outflank-mailman (input) for mailman id 342582;
 Mon, 06 Jun 2022 13:51:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Jy1=WN=citrix.com=prvs=14988d3bc=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nyD9D-0004gn-FG
 for xen-devel@lists.xenproject.org; Mon, 06 Jun 2022 13:51:59 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d456ad97-e59f-11ec-b605-df0040e90b76;
 Mon, 06 Jun 2022 15:51:58 +0200 (CEST)
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
X-Inumbo-ID: d456ad97-e59f-11ec-b605-df0040e90b76
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654523518;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=krnQmXKeCQBjbkfKNZD5J8NR5QGqOxG1ETCGQIW5ZF0=;
  b=Z9vtN31oZAbeFSemz4Kfb/oNcbhuu1OPwqaHaJ2Sp7jCQaJblY9lZ4iu
   N06OM7wXfhXpNCGse8dOlNJfOIQNwFGTV3zvxA6XVuZkkxf4F4APMMY1K
   73Tnsezjs4q0HDqUMI6oaL/KCdQtuUSmuhOMhdg5XIoKEwdPOMVqR1P1F
   U=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 72295383
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:RKnoRKO0DPBhgu3vrR2vl8FynXyQoLVcMsEvi/4bfWQNrUp0hTcGy
 mRLWjzUPP2OZmbyfNhyOd608x4B7MLcxodkGQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFYMpBsJ00o5wbZn2tMw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zk
 td8sLqvVFkVDqTvw/00AjMfHWJ1MvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALJc/3PIQZqzd4wCvQF/oOSpHfWaTao9Rf2V/cg+gRR6yPO
 pFJMlKDajzGWj0INHcLV6s+hd+3uSPufhoC73Ca8P9fD2/7k1UqjemF3MDuUt6XQcRYmG6Iq
 2SA+H72ajkBL8CWwzeB9nOqh8fMkDn9VYZUE6e3ntZ1hHWDy2pVDwcZPXO2ofS8yV6zXfpad
 lRS8S0rxYAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxLmoOQyNFadcmnNQrXjFs3
 ViM9+4FHhQ27ufTEyjEsO7J83XiYkD5MFPuewdeTzoAxcb+/r0DhzGUV/8yOum7zdb6TGSYL
 y+xkMQuu1kCpZdVivnhpwib2W3ESovhFVBsuFiONo6xxkYgPdP+OdT1gbTOxawYRLt1WGVtq
 5TtdyK2yOkVRa+AmyWWKAnmNOH4vq3VWNEwbLMGInXAy9hO0yT6FWyoyGsiTHqFy+5dEdMTX
 GfduBlK+LhYN2awYKl8buqZUpp3kfS9SYy9C66MPrKih6SdkyfepUlTibO4hTixwCDAb4ljU
 XtkTSpcJSlDUvk2pNZHb+wczaUq1kgD+I8nfriil07P+ePHPBa9EO5ZWHPTP7tRxP7V/23oH
 yN3apLiJ+N3C7WuPEE6MOc7cDg3EJTMLcmv+5AHKLPYe1oO9aNII6a5/I7NsrdNx8x9/tokN
 FnkMqOE4DITXUH6FDg=
IronPort-HdrOrdr: A9a23:DS2di67fvpSDH9E+PQPXwMjXdLJyesId70hD6qhwISY6TiW9rb
 HLoB17726QtN9/YhwdcLy7VJVoBEmskqKdgrNhX4tKPjOHhILAFugLhuHfKn/bak7DH4ZmpM
 FdmsNFaeEYY2IUsfrH
X-IronPort-AV: E=Sophos;i="5.91,280,1647316800"; 
   d="scan'208";a="72295383"
Date: Mon, 6 Jun 2022 14:51:51 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Elliott Mitchell <ehem+xen@m5p.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 3/4] build: replace get-fields.sh by a perl script
Message-ID: <Yp4Gd6leI/MSPkHw@perard.uk.xensource.com>
References: <20220601165909.46588-1-anthony.perard@citrix.com>
 <20220601165909.46588-4-anthony.perard@citrix.com>
 <Ypeimt5XHHog64qw@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Ypeimt5XHHog64qw@mattapan.m5p.com>

On Wed, Jun 01, 2022 at 10:32:10AM -0700, Elliott Mitchell wrote:
> On Wed, Jun 01, 2022 at 05:59:08PM +0100, Anthony PERARD wrote:
> > diff --git a/xen/tools/compat-xlat-header b/xen/tools/compat-xlat-header
> > new file mode 100755
> > index 0000000000..f1f42a9dde
> > --- /dev/null
> > +++ b/xen/tools/compat-xlat-header
> > @@ -0,0 +1,539 @@
> > +#!/usr/bin/perl -w
> > +
> > +use strict;
> > +use warnings;
> 
> I hope to take more of a look at this, but one thing I immediately
> notice:  -w is redundant with "use warnings;".  I strongly prefer
> "use warnings;", but others may have different preferences.

Sounds good, I might have copy the shebang and the "use*" from an other
script in our repo, without checking what the -w stand for.

Thanks,

-- 
Anthony PERARD

