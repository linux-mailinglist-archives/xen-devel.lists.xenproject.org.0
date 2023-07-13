Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36024752900
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 18:48:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563332.880515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJzTe-0003XV-9m; Thu, 13 Jul 2023 16:47:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563332.880515; Thu, 13 Jul 2023 16:47:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJzTe-0003UX-6T; Thu, 13 Jul 2023 16:47:38 +0000
Received: by outflank-mailman (input) for mailman id 563332;
 Thu, 13 Jul 2023 16:47:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LNpG=C7=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qJzTc-0003UR-VN
 for xen-devel@lists.xenproject.org; Thu, 13 Jul 2023 16:47:36 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f7539f51-219c-11ee-b239-6b7b168915f2;
 Thu, 13 Jul 2023 18:47:35 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 36DGlKgX097332
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Thu, 13 Jul 2023 12:47:26 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 36DGlILG097329;
 Thu, 13 Jul 2023 09:47:18 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: f7539f51-219c-11ee-b239-6b7b168915f2
Date: Thu, 13 Jul 2023 09:47:18 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 2/3] x86/APIC: modify error_interrupt() to output
 using single printk()
Message-ID: <ZLAqlsvIvzOPMdOV@mattapan.m5p.com>
References: <cover.1689191941.git.ehem+xen@m5p.com>
 <7771343b52e6769d7670ad73094f5276025a10fe.1689191941.git.ehem+xen@m5p.com>
 <3b16e1d8-acfb-8dd4-763b-57908ea6a2a1@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3b16e1d8-acfb-8dd4-763b-57908ea6a2a1@suse.com>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

On Thu, Jul 13, 2023 at 03:12:55PM +0200, Jan Beulich wrote:
> On 17.03.2023 20:53, Elliott Mitchell wrote:
> > --- a/xen/arch/x86/apic.c
> > +++ b/xen/arch/x86/apic.c
> > @@ -1419,12 +1420,13 @@ static void cf_check error_interrupt(struct cpu_user_regs *regs)
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
> > +        "%s%s%s%s%s%s%s%s" "\n",
> > +        smp_processor_id(), v , v1,
> > +        entries[7], entries[6],
> > +        entries[5], entries[4], entries[3], entries[2], entries[1], entries[0]);
> 
> While pre-existing in both cases, two nits: There's a stray blank before one
> of the commas, and indentation is wrong too.

I don't see anything which could be called an indentation error.  The
very first added line is attached to the `for ()`, therefore it correctly
has one more indent.

I guess this is an advantage of rewriting the loop as part of this patch.
The correct indentation is clearer.

> Furthermore there's no reason to split the format string, especially not
> ahead of the \n. Plus line wrapping for the 8 entries[] references could
> also be done more evenly.
> 
> Since these are all cosmetic, I guess I'll do adjustments while committing:
> Acked-by: Jan Beulich <jbeulich@suse.com>

Yeah, that seems the best approach here.  I'm unsure how likely it is for
additional bits in the ESR register to be allocated.  Ideal is to format
this in such a way that adding bits causes a smaller delta.  I was
thinking high-order bits were likely to be reportted at start, hence the
last line would be best filled first.

Though one does not know the future and trying to anticipate it may well
yield worse results.  This really does seem a place where it should be
adjusted to taste during final commit.  Otherwise there are too many
minor nits and things get bogged down in trivial issues.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



