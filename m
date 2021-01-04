Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED032E9356
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 11:32:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61081.107202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwN9f-0001UZ-AU; Mon, 04 Jan 2021 10:32:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61081.107202; Mon, 04 Jan 2021 10:32:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwN9f-0001UA-71; Mon, 04 Jan 2021 10:32:03 +0000
Received: by outflank-mailman (input) for mailman id 61081;
 Mon, 04 Jan 2021 10:32:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jmHV=GH=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1kwN9e-0001U5-2h
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 10:32:02 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 37e98344-9bd2-4179-a578-b830f5371ab6;
 Mon, 04 Jan 2021 10:32:00 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne [10.0.0.1])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 104AVuMd028235;
 Mon, 4 Jan 2021 11:31:56 +0100 (MET)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id 8DD08281D; Mon,  4 Jan 2021 11:31:56 +0100 (CET)
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
X-Inumbo-ID: 37e98344-9bd2-4179-a578-b830f5371ab6
Date: Mon, 4 Jan 2021 11:31:56 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH 13/24] Don't assume tv_sec is a unsigned long (for NetBSD)
Message-ID: <20210104103156.GF2005@antioche.eu.org>
References: <20201214163623.2127-1-bouyer@netbsd.org>
 <20201214163623.2127-14-bouyer@netbsd.org>
 <20201229140215.zl5yju6hm7wcacht@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201229140215.zl5yju6hm7wcacht@Air-de-Roger>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Mon, 04 Jan 2021 11:31:56 +0100 (MET)

On Tue, Dec 29, 2020 at 03:02:15PM +0100, Roger Pau Monné wrote:
> On Mon, Dec 14, 2020 at 05:36:12PM +0100, Manuel Bouyer wrote:
> > ---
> >  tools/libs/light/libxl_create.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
> > index 321a13e519..44691010bc 100644
> > --- a/tools/libs/light/libxl_create.c
> > +++ b/tools/libs/light/libxl_create.c
> > @@ -496,7 +496,7 @@ int libxl__domain_build(libxl__gc *gc,
> >          vments[2] = "image/ostype";
> >          vments[3] = "hvm";
> >          vments[4] = "start_time";
> > -        vments[5] = GCSPRINTF("%lu.%02d", start_time.tv_sec,(int)start_time.tv_usec/10000);
> > +        vments[5] = GCSPRINTF("%jd.%02d", start_time.tv_sec,(int)start_time.tv_usec/10000);
> 
> You don't cast tv_sec to intmax_t here...
> 
> >  
> >          localents = libxl__calloc(gc, 13, sizeof(char *));
> >          i = 0;
> > @@ -535,7 +535,7 @@ int libxl__domain_build(libxl__gc *gc,
> >          vments[i++] = "image/kernel";
> >          vments[i++] = (char *) state->pv_kernel.path;
> >          vments[i++] = "start_time";
> > -        vments[i++] = GCSPRINTF("%lu.%02d", start_time.tv_sec,(int)start_time.tv_usec/10000);
> > +        vments[i++] = GCSPRINTF("%jd.%02d", (intmax_t)start_time.tv_sec,(int)start_time.tv_usec/10000);
> 
> ... yet you do it here. I think the first occurrence is missing the
> cast?

thanks, fixed.

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

