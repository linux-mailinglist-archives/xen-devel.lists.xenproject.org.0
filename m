Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9DA6C14BA
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 15:30:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511957.791437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peGWD-0007Qu-AL; Mon, 20 Mar 2023 14:29:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511957.791437; Mon, 20 Mar 2023 14:29:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peGWD-0007Nu-7S; Mon, 20 Mar 2023 14:29:49 +0000
Received: by outflank-mailman (input) for mailman id 511957;
 Mon, 20 Mar 2023 14:29:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W9b8=7M=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1peGWC-0007No-L3
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 14:29:48 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8860ee6-c72b-11ed-b464-930f4c7d94ae;
 Mon, 20 Mar 2023 15:29:45 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 32KETY6n086168
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 20 Mar 2023 10:29:40 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 32KETXQn086167;
 Mon, 20 Mar 2023 07:29:33 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: a8860ee6-c72b-11ed-b464-930f4c7d94ae
Date: Mon, 20 Mar 2023 07:29:33 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/2] x86/APIC: modify error_interrupt() to output
 using single printk()
Message-ID: <ZBhtzfhumm9AWqte@mattapan.m5p.com>
References: <cover.1679084101.git.ehem+xen@m5p.com>
 <4db49e192b6829e520cf497481a51deef227b23b.1679084101.git.ehem+xen@m5p.com>
 <f945860e-6a82-7070-3a1b-2e73a53040de@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f945860e-6a82-7070-3a1b-2e73a53040de@suse.com>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

On Mon, Mar 20, 2023 at 09:56:54AM +0100, Jan Beulich wrote:
> On 17.03.2023 20:53, Elliott Mitchell wrote:
> > This takes care of the issue of APIC errors tending to occur on multiple
> > cores at one.  In turn this tends to causes the error messages to be
> 
> Nit: "at once"?

https://en.wiktionary.org/wiki/at_once

Adverb #2, synonym of "simultaneously".


> > @@ -1419,12 +1420,12 @@ static void cf_check error_interrupt(struct cpu_user_regs *regs)
> >      v1 = apic_read(APIC_ESR);
> >      ack_APIC_irq();
> >  
> > -    printk(XENLOG_DEBUG "APIC error on CPU%u: %02x(%02x)",
> > -            smp_processor_id(), v , v1);
> >      for ( i = 7; i >= 0; --i )
> > -        if ( v1 & (1 << i) )
> > -            printk("%s", esr_fields[i]);
> > -    printk("\n");
> > +        entries[i] = v1 & (1 << i) ? esr_fields[i] : "";
> > +    printk(XENLOG_DEBUG "APIC error on CPU%u: %02x(%02x)"
> > +            "%s%s%s%s%s%s%s%s" "\n",
> > +            smp_processor_id(), v , v1, entries[0], entries[1], entries[2],
> > +            entries[3], entries[4], entries[5], entries[6], entries[7]);
> 
> Two style nits: Indentation wants fixing here (it was wrong in the original
> code already), and the stray blank between v and the comma also wants
> dropping at this occasion.

There are several minor issues here which may be best handled during
commit as they're very small items about how precisely you want this to
look.

First, I later realized I goofed the argument order.  In order to match
the original implementation, it needs to be entries[7] ... entries[0]
(could though be the low-order bits should be reported first).

Second, the order of the for loop no longer matters.  Using
ARRAY_SIZE(esr_fields) and increment should now be more maintainable
(this would also allow i to be unsigned).

Third, I'm simply unsure how you would prefer to format the printk().
I imagine at some future point the register may have additional bits
allocated.  At such point esr_fields[] would grow, but this would also
require adding to the format string and adding an argument.

Seems like several fiddly bits which mostly effect look and don't really
effect the implementation.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



