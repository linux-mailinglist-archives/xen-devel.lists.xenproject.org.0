Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CDB2E93C9
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 11:56:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61121.107281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwNXD-0003sS-Q6; Mon, 04 Jan 2021 10:56:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61121.107281; Mon, 04 Jan 2021 10:56:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwNXD-0003s3-MW; Mon, 04 Jan 2021 10:56:23 +0000
Received: by outflank-mailman (input) for mailman id 61121;
 Mon, 04 Jan 2021 10:56:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jmHV=GH=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1kwNXB-0003ry-Lv
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 10:56:21 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 21aafdf9-ff9e-45ec-a5ce-8704ae591ddd;
 Mon, 04 Jan 2021 10:56:20 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne
 [IPv6:2001:41d0:fe9d:1100:221:70ff:fe0c:9885])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 104AuEBf025619;
 Mon, 4 Jan 2021 11:56:14 +0100 (MET)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id 482D4281D; Mon,  4 Jan 2021 11:56:14 +0100 (CET)
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
X-Inumbo-ID: 21aafdf9-ff9e-45ec-a5ce-8704ae591ddd
Date: Mon, 4 Jan 2021 11:56:14 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH 19/24] errno may not be a gobal R/W variable, use a local
 variable instead (fix build on NetBSD)
Message-ID: <20210104105614.GI2005@antioche.eu.org>
References: <20201214163623.2127-1-bouyer@netbsd.org>
 <20201214163623.2127-20-bouyer@netbsd.org>
 <20201229143853.gikc7xqeqw6jjlvy@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201229143853.gikc7xqeqw6jjlvy@Air-de-Roger>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [IPv6:2001:41d0:fe9d:1101:0:0:0:1]); Mon, 04 Jan 2021 11:56:16 +0100 (MET)

On Tue, Dec 29, 2020 at 03:38:53PM +0100, Roger Pau Monné wrote:
> On Mon, Dec 14, 2020 at 05:36:18PM +0100, Manuel Bouyer wrote:
> > ---
> >  tools/xenpaging/xenpaging.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/tools/xenpaging/xenpaging.c b/tools/xenpaging/xenpaging.c
> > index 33098046c2..39c8c83b4b 100644
> > --- a/tools/xenpaging/xenpaging.c
> > +++ b/tools/xenpaging/xenpaging.c
> > @@ -180,10 +180,11 @@ static int xenpaging_get_tot_pages(struct xenpaging *paging)
> >  static void *init_page(void)
> >  {
> >      void *buffer;
> > +    int rc;
> >  
> >      /* Allocated page memory */
> > -    errno = posix_memalign(&buffer, XC_PAGE_SIZE, XC_PAGE_SIZE);
> > -    if ( errno != 0 )
> > +    rc = posix_memalign(&buffer, XC_PAGE_SIZE, XC_PAGE_SIZE);
> > +    if ( rc != 0 )
> 
> I think the point of setting errno here is because posix_memalign
> doesn't set it and instead returns an error code. The caller of
> init_page uses PERROR in order to print the error which his expected to
> be in errno.

I understand this. But on NetBSD, errno is:
#define errno (*__errno())

(I think this is related to thread-safety).

> 
> I don't think this is the only place in Xen code that errno is set, why
> are the others fine but not this instance?

probably this code is not used on NetBSD ?

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

