Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8FF2F073B
	for <lists+xen-devel@lfdr.de>; Sun, 10 Jan 2021 13:41:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64463.113905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kya1m-0000Wq-Sk; Sun, 10 Jan 2021 12:41:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64463.113905; Sun, 10 Jan 2021 12:41:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kya1m-0000WR-PL; Sun, 10 Jan 2021 12:41:02 +0000
Received: by outflank-mailman (input) for mailman id 64463;
 Sun, 10 Jan 2021 12:41:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lRBP=GN=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1kya1l-0000WM-HM
 for xen-devel@lists.xenproject.org; Sun, 10 Jan 2021 12:41:01 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3d03f609-19eb-45dc-9382-11089c4d6a36;
 Sun, 10 Jan 2021 12:40:59 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne
 [IPv6:2001:41d0:fe9d:1100:221:70ff:fe0c:9885])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 10ACeouW009800;
 Sun, 10 Jan 2021 13:40:50 +0100 (MET)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id 4BB78281D; Sun, 10 Jan 2021 13:40:50 +0100 (CET)
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
X-Inumbo-ID: 3d03f609-19eb-45dc-9382-11089c4d6a36
Date: Sun, 10 Jan 2021 13:40:50 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH 12/24] Implement gnttab on NetBSD
Message-ID: <20210110124050.GB1966@antioche.eu.org>
References: <20201214163623.2127-1-bouyer@netbsd.org>
 <20201214163623.2127-13-bouyer@netbsd.org>
 <20201229111601.x5gmbcai4d7ex5yd@Air-de-Roger>
 <20210104102951.GE2005@antioche.eu.org>
 <20210104172411.pajmvdz45xlobq34@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210104172411.pajmvdz45xlobq34@Air-de-Roger>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [IPv6:2001:41d0:fe9d:1101:0:0:0:1]); Sun, 10 Jan 2021 13:40:51 +0100 (MET)

On Mon, Jan 04, 2021 at 06:24:11PM +0100, Roger Pau Monné wrote:
> On Mon, Jan 04, 2021 at 11:29:51AM +0100, Manuel Bouyer wrote:
> > On Tue, Dec 29, 2020 at 12:16:01PM +0100, Roger Pau Monné wrote:
> > > Might need some kind of log message, and will also required your
> > > Signed-off-by (or from the original author of the patch).
> > > 
> > > On Mon, Dec 14, 2020 at 05:36:11PM +0100, Manuel Bouyer wrote:
> > > > ---
> > > >  tools/libs/gnttab/Makefile |   2 +-
> > > >  tools/libs/gnttab/netbsd.c | 267 +++++++++++++++++++++++++++++++++++++
> > > >  2 files changed, 268 insertions(+), 1 deletion(-)
> > > >  create mode 100644 tools/libs/gnttab/netbsd.c
> > > > 
> > > > diff --git a/tools/libs/gnttab/Makefile b/tools/libs/gnttab/Makefile
> > > > index d86c49d243..ae390ce60f 100644
> > > > --- a/tools/libs/gnttab/Makefile
> > > > +++ b/tools/libs/gnttab/Makefile
> > > > @@ -10,7 +10,7 @@ SRCS-GNTSHR            += gntshr_core.c
> > > >  SRCS-$(CONFIG_Linux)   += $(SRCS-GNTTAB) $(SRCS-GNTSHR) linux.c
> > > >  SRCS-$(CONFIG_MiniOS)  += $(SRCS-GNTTAB) gntshr_unimp.c minios.c
> > > >  SRCS-$(CONFIG_FreeBSD) += $(SRCS-GNTTAB) $(SRCS-GNTSHR) freebsd.c
> > > > +SRCS-$(CONFIG_NetBSD)  += $(SRCS-GNTTAB) $(SRCS-GNTSHR) netbsd.c
> > > >  SRCS-$(CONFIG_SunOS)   += gnttab_unimp.c gntshr_unimp.c
> > > > -SRCS-$(CONFIG_NetBSD)  += gnttab_unimp.c gntshr_unimp.c
> > > >  
> > > >  include $(XEN_ROOT)/tools/libs/libs.mk
> > > > diff --git a/tools/libs/gnttab/netbsd.c b/tools/libs/gnttab/netbsd.c
> > > > new file mode 100644
> > > > index 0000000000..2df7058cd7
> > > > --- /dev/null
> > > > +++ b/tools/libs/gnttab/netbsd.c
> > > 
> > > I think this is mostly (if not equal) to the FreeBSD version, in which
> > > case we could rename freebsd.c to plain bsd.c and use it for
> > > both FreeBSD and NetBSD?
> > 
> > I can't see why they won't diverge in the future ...
> 
> True, but then let's diverge when we have to cross that bridge I would
> say.
> 
> There's IMO no point in having two verbatim copies of the same code in
> different places, it's just more churn to maintain and to remember to
> apply duplicate fixes.

Actually I just checked, the files are quite different, because the
GNTTAB ioctls are not the same, and it seems they don't work the same way
either. FreeBSD does mmap against the gnttab device; this is not supported
on NetBSD. Merging the two would cause an #ifdef maze.

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

