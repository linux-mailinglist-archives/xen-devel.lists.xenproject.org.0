Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9DB68E0EF
	for <lists+xen-devel@lfdr.de>; Tue,  7 Feb 2023 20:13:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491400.760481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPTOX-0005y8-BL; Tue, 07 Feb 2023 19:12:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491400.760481; Tue, 07 Feb 2023 19:12:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPTOX-0005w0-7u; Tue, 07 Feb 2023 19:12:45 +0000
Received: by outflank-mailman (input) for mailman id 491400;
 Tue, 07 Feb 2023 19:12:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SVd9=6D=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1pPTOW-0005vu-G7
 for xen-devel@lists.xenproject.org; Tue, 07 Feb 2023 19:12:44 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64b02c5e-a71b-11ed-93b5-47a8fe42b414;
 Tue, 07 Feb 2023 20:12:42 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 317JCUdF055038
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 7 Feb 2023 14:12:35 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 317JCUs8055037;
 Tue, 7 Feb 2023 11:12:30 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 64b02c5e-a71b-11ed-93b5-47a8fe42b414
Date: Tue, 7 Feb 2023 11:12:30 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
        Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH] tools: Have flex and bison mandatory
Message-ID: <Y+KinmC34qwz4FY3@mattapan.m5p.com>
References: <20230207160948.3169-1-anthony.perard@citrix.com>
 <a11b962e-7422-a197-4ff4-fcac9963364d@suse.com>
 <Y+KSRY+5SmrNYpJ/@perard.uk.xensource.com>
 <Y+KdGBSukPdVR0hz@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+KdGBSukPdVR0hz@mattapan.m5p.com>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

On Tue, Feb 07, 2023 at 10:48:56AM -0800, Elliott Mitchell wrote:
> On Tue, Feb 07, 2023 at 06:02:45PM +0000, Anthony PERARD wrote:
> > On Tue, Feb 07, 2023 at 06:03:12PM +0100, Jan Beulich wrote:
> > > On 07.02.2023 17:09, Anthony PERARD wrote:
> > > > This also remove the way the missing binaries are been handled, with
> > > > double-column-rules, which might be an issue sometime.
> > > 
> > > These double-colon rules should never have been introduced. Double
> > > colons have a different meaning ("terminal rule") for pattern rules.
> > > In fact they were my initial suspects when looking into that odd build
> > > failure in CI.
> > 
> > After some more investigation, I don't think anymore the double-colon
> > rules here is an issue.
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
> > 
> > I don't know how to properly fix this yet.
> > Event writing "%.c %.h &: %.l" doesn't work, with make 4.3, which is
> > supposed to be grouped targets. But that's is maybe fixed in 4.4.
> 
> Might this be solved with:
> 
> %.c: %.l | %.h
> 
> I'm unsure whether order-only dependencies are GNU-make only (there is a
> good chance).  There is also the option of using .PRECIOUS

Then upon more reading wouldn't:

%_y.c: | %_l.c

Accomplish the job?  (assuming GNU-make or everyone has copied that
feature)


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



