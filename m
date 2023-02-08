Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D8768F76F
	for <lists+xen-devel@lfdr.de>; Wed,  8 Feb 2023 19:52:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491960.761337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPpXW-0001Jr-3l; Wed, 08 Feb 2023 18:51:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491960.761337; Wed, 08 Feb 2023 18:51:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPpXW-0001Ha-0v; Wed, 08 Feb 2023 18:51:30 +0000
Received: by outflank-mailman (input) for mailman id 491960;
 Wed, 08 Feb 2023 18:51:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IZ02=6E=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1pPpXU-0001HU-Vf
 for xen-devel@lists.xenproject.org; Wed, 08 Feb 2023 18:51:28 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95999630-a7e1-11ed-93b5-47a8fe42b414;
 Wed, 08 Feb 2023 19:51:25 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 318Ip1Px061004
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 8 Feb 2023 13:51:07 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 318Ip1ro061003;
 Wed, 8 Feb 2023 10:51:01 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 95999630-a7e1-11ed-93b5-47a8fe42b414
Date: Wed, 8 Feb 2023 10:51:01 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>,
        Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH] tools: Have flex and bison mandatory
Message-ID: <Y+PvFfDQU5GXV57m@mattapan.m5p.com>
References: <20230207160948.3169-1-anthony.perard@citrix.com>
 <a11b962e-7422-a197-4ff4-fcac9963364d@suse.com>
 <Y+KSRY+5SmrNYpJ/@perard.uk.xensource.com>
 <7e01f840-1d42-f31e-4471-ee06820b4b31@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e01f840-1d42-f31e-4471-ee06820b4b31@suse.com>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

On Wed, Feb 08, 2023 at 09:02:35AM +0100, Jan Beulich wrote:
> On 07.02.2023 19:02, Anthony PERARD wrote:
> > 
> > I think the issue that Andrew saw in the CI with "libxlu_cfg_y.o"
> > failing to build while "libxlu_cfg_l.[ch]" are been regenerated is
> > probably because make doesn't consider "libxlu_cfg_l.[ch]" as a group of
> > targets.
> > 
> > If for some reason we have:
> >     libxlu_cfg_l.h newer than libxlu_cfg_l.l newer than libxlu_cfg_l.c
> > 
> > Then make seems to take two parallel decision:
> >     When building libxlu_cfg_y.o:
> >         libxlu_cfg_l.h is newer than libxlu_cfg_l.l
> >         -> libxlu_cfg_l.h is up-to-date, start building libxlu_cfg_y.o
> >     When building libxlu_cfg_l.o:
> >         libxlu_cfg_l.c is older than libxlu_cfg_l.l
> >         -> we need to generate libxlu_cfg_l.c first
> > Then, libxlu_cfg_y.o fails to build because libxlu_cfg_l.h is been
> > updated do to the parallel build of libxlu_cfg_l.o.
> > 
> > I can easily reproduce the issue with:
> >     touch libxlu_cfg_l.c; sleep .1; touch libxlu_cfg_l.l; sleep .1;
> >     touch libxlu_cfg_l.h; sleep .1; make -j
> > And having "sleep 1" in "%.c %.h: %.l" recipe, between `rm` and `flex`.
> 
> Interesting. In my somewhat similar experiments I found that an issue
> exists only when one of the .c files is missing. Things looked to work
> properly when both were there, but one was outdated. Clearly that's
> yet more surprising behavior than, as you appear to observe, the issue
> simply being tied too "needs updating".

The actual problem is flex and bison output both files at the same time.
One process sees all of its prerequisites are up to do and therefore
proceeds to the next step.  A second process sees an out of date
prerequisite, and starts to run flex which wipes out the prerequisite of
the first process.


Crucially libxlu_cfg_y.o does NOT depend on libxlu_cfg_l.c, therefore GNU
Make is allowed to proceed with building libxlu_cfg_y.o even if
libxlu_cfg_l.c is out of date.

The problem is the rule to update libxlu_cfg_l.c ALSO updates
libxlu_cfg_l.h as a side-effect.


As such libxlu_cfg_y.o needs an order-only dependency (assuming GNU Make
syntax is allowed) on libxlu_cfg_l.c, so the two rules DON'T run in
parallel and cause havoc.


> > I don't know how to properly fix this yet.
> > Event writing "%.c %.h &: %.l" doesn't work, with make 4.3, which is
> > supposed to be grouped targets. But that's is maybe fixed in 4.4.
> 
> Well, in my tests while 4.4 has fixed one issue with intermediate files
> affecting the behavior here, the issue we're possibly running into is
> still there. I've sent an inquiry to bug-make@gnu.org.

I do not believe this is a bug in GNU Make.  Merely double-output rules
cause precisely this sort of trouble in Make when run in parallel.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



