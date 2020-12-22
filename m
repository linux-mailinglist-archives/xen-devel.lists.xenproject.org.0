Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 201C82E0464
	for <lists+xen-devel@lfdr.de>; Tue, 22 Dec 2020 03:42:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57634.100909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krXc4-00029z-HW; Tue, 22 Dec 2020 02:41:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57634.100909; Tue, 22 Dec 2020 02:41:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krXc4-00029V-EY; Tue, 22 Dec 2020 02:41:24 +0000
Received: by outflank-mailman (input) for mailman id 57634;
 Tue, 22 Dec 2020 02:41:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZUFy=F2=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1krXc3-00029Q-3x
 for xen-devel@lists.xenproject.org; Tue, 22 Dec 2020 02:41:23 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e94b4197-1642-472e-be2f-0fca149abc9d;
 Tue, 22 Dec 2020 02:41:21 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 0BM2f0N7080944
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 21 Dec 2020 21:41:05 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 0BM2exbP080943;
 Mon, 21 Dec 2020 18:40:59 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: e94b4197-1642-472e-be2f-0fca149abc9d
Date: Mon, 21 Dec 2020 18:40:59 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
        Stefano Stabellini <sstabellini@kernel.org>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Ian Jackson <iwj@xenproject.org>
Subject: Re: [RESEND] [RFC PATCH] xen/arm: domain_build: Ignore empty memory
 bank
Message-ID: <X+Fcu5Frv2rS1DS3@mattapan.m5p.com>
References: <X+DbupqYE3rrFaIM@mattapan.m5p.com>
 <102a361a-a070-185f-c564-8e4c30f96ab6@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <102a361a-a070-185f-c564-8e4c30f96ab6@xen.org>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

On Mon, Dec 21, 2020 at 06:28:35PM +0000, Julien Grall wrote:
> I was planning to review the first version today, but as you sent a new 
> version I will answer on this one directly.

Mostly the commentary has been increasing, not so much the commit.

> On 21/12/2020 17:30, Elliott Mitchell wrote:
> > Previously Xen had stopped processing Device Trees if an empty
> > (size == 0) memory bank was found.
> > 
> > Commit 5a37207df52066efefe419c677b089a654d37afc changed this behavior to
> > ignore such banks.  Unfortunately this means these empty nodes are
> > visible to code which accesses the device trees.  Have domain_build also
> > ignore these entries.
> 
> I am probably missing something here. The commit you pointed out will 
> only take care of memory nodes (including reserved-memory).
> 
> It should not be possible to reach handle_device() with actual RAM. 
> Although, it would with the reserved memory node.
> 
> Could you provide a bit more details on the issue? In particular, I am 
> interested to see the offending node and its content.

Define "see" in this context.  The message which shows up is:
"Unable to retrieve address 0 for /scb/pcie@7d500000/pci@1,0/usb@1,0"

According to Linux "name", "reg" and "resets" exist there.

(which as stated "0" looks suspiciously like NULL, rather than an
index)

> > I doubt this is the only bug exposed by
> > 5a37207df52066efefe419c677b089a654d37afc.
> 
> Are you saying that with my patch dropped, Xen will boot but with it 
> will not?

Hmm, realizing that I'd found a fix, but not actually tested to
confirm...   Seems I had it wrong, dropping
5a37207df52066efefe419c677b089a654d37afc doesn't fix the issue, so that
is NOT the cause.

Sorry about misattributing the cause.  Now to start doing builds to
identify the cause...  (this of course will take a bit)

Hmm, this is being rather more difficult to identify than I expected.


> > As I thought the 0 it was reporting was an address of 0.  Perhaps the
> > message should instead be:
> > "Unable to retrieve address for index %u of %s\n"?
> > ---
> >   xen/arch/arm/domain_build.c | 5 +++++
> >   1 file changed, 5 insertions(+)
> > 
> > diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> > index e824ba34b0..0b83384bd3 100644
> > --- a/xen/arch/arm/domain_build.c
> > +++ b/xen/arch/arm/domain_build.c
> > @@ -1405,6 +1405,11 @@ static int __init handle_device(struct domain *d, struct dt_device_node *dev,
> >       {
> >           struct map_range_data mr_data = { .d = d, .p2mt = p2mt };
> >           res = dt_device_get_address(dev, i, &addr, &size);
> > +
> > +        /* Some DT may describe empty bank, ignore them */
> > +        if ( !size )
> > +            continue;
> 
> ... dt_device_get_address() will not set the size if the node is bogus. 
> So you can't rely on either addr or size when res is non-zero.
> 
> handle_device() (at least on unstable) will not initialize the two 
> variables to 0. So I guess you are lucky that you compiler zeroed them 
> for you, but that's not the normal behavior.
> 
> So I think we first need to figure out what is the offending node and 
> why it is dt_device_get_address() is returning an error for it.
> 
> That said, I agree that we possibly want a check size == 0 (action TBD) 
> in map_range_to_domain() as the code would do the wrong thing for 0.

Seems like returning to a working build without that commit is going to
take a bit.  :-(


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



