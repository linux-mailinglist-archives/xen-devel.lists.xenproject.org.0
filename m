Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A587B29F5
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 02:48:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610142.949425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm1fd-00074j-6r; Fri, 29 Sep 2023 00:47:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610142.949425; Fri, 29 Sep 2023 00:47:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm1fd-00071m-3z; Fri, 29 Sep 2023 00:47:53 +0000
Received: by outflank-mailman (input) for mailman id 610142;
 Fri, 29 Sep 2023 00:47:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xnwI=FN=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qm1fc-00071g-7p
 for xen-devel@lists.xenproject.org; Fri, 29 Sep 2023 00:47:52 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cfdf2589-5e61-11ee-878b-cb3800f73035;
 Fri, 29 Sep 2023 02:47:50 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 38T0lH4M008150
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Thu, 28 Sep 2023 20:47:23 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.17.1/8.15.2/Submit) id 38T0lHkZ008149;
 Thu, 28 Sep 2023 17:47:17 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: cfdf2589-5e61-11ee-878b-cb3800f73035
Date: Thu, 28 Sep 2023 17:47:17 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
        Julien Grall <julien@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        xen-devel@lists.xenproject.org
Subject: Re: [PATCH WIP] xen/public: move incomplete type definitions to xen.h
Message-ID: <ZRYelcEKD63xl2Uj@mattapan.m5p.com>
References: <7a880e33ff91d0c76986159e3559c56ee6894d21.1695324653.git.ehem+xen@m5p.com>
 <7aaf91c7-6330-fffc-8df6-4be4b531f456@suse.com>
 <ZQ21//HP/d2Ppdrh@mattapan.m5p.com>
 <b9966ac8-dfc6-b6c4-bf61-05a8b61f9ac3@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9966ac8-dfc6-b6c4-bf61-05a8b61f9ac3@suse.com>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

On Mon, Sep 25, 2023 at 08:27:31AM +0200, Jan Beulich wrote:
> On 22.09.2023 17:42, Elliott Mitchell wrote:
> > On Fri, Sep 22, 2023 at 10:21:21AM +0200, Jan Beulich wrote:
> >> On 21.09.2023 18:18, Elliott Mitchell wrote:
> >>>  As such these incomplete definitions should be
> >>> in xen.h next to their hypercalls, rather than spread all over.
> >>
> >> Perhaps s/incomplete definitions/forward declarations/.
> >>
> >> There's a downside to the movement, though: You now introduce items
> >> into the namespace which may be entirely unused. The two contradicting
> >> goals need weighing as to their usefulness.
> > 
> > For the case which this is part of, they're not 100% unused.
> > 
> >>> trap_info_t is particularly notable since even though the hypercall is
> >>> x86-only, the wrapper is likely to be visible to generic source code.
> >>
> >> Why would it be?
> > 
> > Related to converting ARM to using inline assembly-language wrappers
> > instead of the current declarations+small assembly wrapper function.
> > 
> > The first step is you split the Linux header
> > arch/x86/include/asm/xen/hypercall.h.  The upper portion (the x86
> > inline assembly language) remains in arch/x86/include, all the
> > HYPERVISOR_*() wrappers go into include/xen/$somewhere.  Several months
> > ago I sent a candidate header to implement _hypercall#() for ARM.
> > 
> > Problem is:
> > static inline int
> > HYPERVISOR_set_trap_table(struct trap_info *table)
> > {
> >         return _hypercall1(int, set_trap_table, table);
> > }
> > Without without `struct trap_info;` somewhere, this fails.
> > 
> > Now, this isn't used on ARM, but this is tricky to guess.  Someone
> > setting this up won't know whether any given function is absent due to
> > being legacy and unlikely to ever be on non-x86.  Versus simply not /yet/
> > being available on non-x86 (vPCI).
> > 
> > Perhaps xen/include/public/xen.h should only conditionally #define some
> > of the __HYPERVISOR_* constants.  Likely there should be a way to force
> > all the hypercall numbers to be available (for linting).  Yet as the
> > current Linux header hints, perhaps there should be a way to disable the
> > PV constants even on x86.
> 
> Downstream consumers of the public headers are free to adjust them to their
> needs. The upstream form wants to remain sufficiently generic, which to me
> includes not exposing types which aren't relevant for a particular arch.

Problem with not exposing the type is you instead get inconsistency,
which can be worse than pollution of the namespace.  There is the case
I'm bring up here which makes sharing headers difficult.

What if some project was developed to run on Xen/ARM.  Such a project
might create a "trap_info" structure for something unrelated to the
Xen/x86 one, they might similarly create a "trap_info_t" type definition.
If such a hypothetical project later tried to port to Xen/x86, the
inconsistency would be painful to deal with.

So might consistency be a rather more important virtue?


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



