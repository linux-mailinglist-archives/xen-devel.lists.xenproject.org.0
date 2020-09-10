Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DBF264CF9
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 20:31:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGRLs-0003MU-9o; Thu, 10 Sep 2020 18:31:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nxmn=CT=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kGRLq-0003MP-Ky
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 18:31:18 +0000
X-Inumbo-ID: ed163d78-7ade-4e6b-b7c7-e8badee8751a
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ed163d78-7ade-4e6b-b7c7-e8badee8751a;
 Thu, 10 Sep 2020 18:31:17 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 08AIV0I9045982
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Thu, 10 Sep 2020 14:31:06 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 08AIV0S2045981;
 Thu, 10 Sep 2020 11:31:00 -0700 (PDT) (envelope-from ehem)
Date: Thu, 10 Sep 2020 11:31:00 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Doug Goldstein <cardoe@cardoe.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: Re: [PATCH 00/11] Major rework of top-level .gitignore
Message-ID: <20200910183100.GC45655@mattapan.m5p.com>
References: <202009092152.089Lqhmn039171@m5p.com>
 <7b7d69c5-5237-2290-06d8-3aae436257dc@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b7d69c5-5237-2290-06d8-3aae436257dc@suse.com>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
 autolearn=unavailable autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Sep 10, 2020 at 08:10:08AM +0200, Jan Beulich wrote:
> On 09.09.2020 03:28, Elliott Mitchell wrote:
> > The top-level .gitignore file for Xen has gotten rather messy.  Looks
> > like at times a few people may have added some blank lines looking
> > towards some later cleanup.  Alas no one ever got around to that later
> > cleanup.
> > 
> > When looking at one portion of the situation I ended up doing some
> > cleanup and it got out of hand.  Hence I'm not sending in these patches
> > which hopefully make things better.
> > 
> > Please note these are somewhat better than work-in-progress status.
> > There are several places I'm unsure of which direction to go in.  Likely
> > several of these will need more or less information in their commit
> > messages.
> > 
> > Overall pattern is first some initial cleanup on the top-level
> > .gitignore.  It is easier to spot targeted file matches which overlapped
> > general globs before breaking things apart.  This is followed by breaking
> > all targeted matches off of the global .gitignore file.  Lastly the
> > global .gitignore file was sorted and I've commented on a few of the
> > things which remain.
> > 
> > Recent versions of `git` include a "check-ignore" command.  For testing
> > new patterns `git check-ignore -vn --no-index <pattern>` will tell you
> > whether a given filename would be ignored without "add -f".
> > 
> > I think patches 01 and 02 are near ready for being committed.
> 
> Provided we as a community basically agree on the splitting. I'm
> not sure I've read this out of prior discussion.

Looking at things, I think this is the way to go.  The older OCAML pieces
needs some ignores which are distinct from what C or Python need.
Several portions of Xen appear to need some local patterns which differ
from what is in the general portion.

The downside of splitting is it makes it harder to identify patterns
which everyone has implemented variants of and should be moved to a
general pattern in the top-level .gitignore file.

> >  Patches
> > 03-09 need varying degrees of polish before being in an official tree.
> > Patches 10 and 11 are pretty well initial rough outlines.
> > 
> > Elliott Mitchell (11):
> >   gitignore: Move ignores from global to subdirectories
> >   gitignore: Remove entries duplicating global entries
> >   gitignore: Add/Generalize entries
> >   gitignore: Create .gitignore file for tools/firmware/
> >   gitignore: Create .gitignore file for tools/ocaml/
> >   gitignore: Create .gitignore file for xen/
> >   gitignore: Create .gitignore file for docs/
> >   gitignore: Create .gitignore file for stubdom/
> >   gitignore: Create .gitignore file for config/
> >   gitignore: Create .gitignore file for tools/
> >   gitignore: RFC Prelimiary final cleanup of top-level .gitignore
> 
> I'm confused about whether what I have in my inbox is complete and
> consistent: 01-11 don't look to be "in reply to" this one, and they
> all pre-date this mail by a varying number of days (Aug 27 ... Sep 3).
> Additionally, unlike what happens for every other sender these days,
> I've also got two copies of most (but not all) of them. Prior to our
> mail setup over here having changed over a year ago this was the
> normal way when I was Cc-ed on patches, but the server nowadays
> de-duplicates the mails. So something is likely odd with your setup.

I think there is a distinct chance I screwed up and got things mixed
together (joy! more strong evidence I'm not all here, now to win that
war to put me back together).


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



