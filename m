Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 351FE6C1A6A
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 16:55:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511991.791516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peHqP-00040m-Dr; Mon, 20 Mar 2023 15:54:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511991.791516; Mon, 20 Mar 2023 15:54:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peHqP-0003xc-Ay; Mon, 20 Mar 2023 15:54:45 +0000
Received: by outflank-mailman (input) for mailman id 511991;
 Mon, 20 Mar 2023 15:54:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W9b8=7M=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1peHqN-0003xW-33
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 15:54:43 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86431f64-c737-11ed-87f5-c1b5be75604c;
 Mon, 20 Mar 2023 16:54:41 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 32KFsUNu086652
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 20 Mar 2023 11:54:35 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 32KFsU1b086651;
 Mon, 20 Mar 2023 08:54:30 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 86431f64-c737-11ed-87f5-c1b5be75604c
Date: Mon, 20 Mar 2023 08:54:30 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/2] x86/APIC: modify error_interrupt() to output
 using single printk()
Message-ID: <ZBiBtiSKkaCmtMAB@mattapan.m5p.com>
References: <cover.1679084101.git.ehem+xen@m5p.com>
 <4db49e192b6829e520cf497481a51deef227b23b.1679084101.git.ehem+xen@m5p.com>
 <f945860e-6a82-7070-3a1b-2e73a53040de@suse.com>
 <ZBhtzfhumm9AWqte@mattapan.m5p.com>
 <5b62c34e-5013-50ba-b218-925fe4eb6c0d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b62c34e-5013-50ba-b218-925fe4eb6c0d@suse.com>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

On Mon, Mar 20, 2023 at 04:39:48PM +0100, Jan Beulich wrote:
> On 20.03.2023 15:29, Elliott Mitchell wrote:
> > 
> > There are several minor issues here which may be best handled during
> > commit as they're very small items about how precisely you want this to
> > look.
> > 
> > First, I later realized I goofed the argument order.  In order to match
> > the original implementation, it needs to be entries[7] ... entries[0]
> > (could though be the low-order bits should be reported first).
> 
> I'm not really concerned of the order. A change of order wants
> mentioning in the description though.

Seemed simple enough to fix on commit (simply switch the order of
numbers).

> > Second, the order of the for loop no longer matters.  Using
> > ARRAY_SIZE(esr_fields) and increment should now be more maintainable
> > (this would also allow i to be unsigned).
> 
> Indeed. But that would better done in a separate patch then anyway.

Feel free to split.

> > Third, I'm simply unsure how you would prefer to format the printk().
> 
> About any way matching style guidelines is okay. There are two more
> things to mention though (sorry for not noticing earlier): We aim at
> keeping the entire format string on one line, for grep-ability. And
> there's no need (and in fact no reason) to split the sequence of %s
> from the \n. To summarize:
> 
>     printk(XENLOG_DEBUG
>            "APIC error on CPU%u: %02x(%02x)%s%s%s%s%s%s%s%s\n",
> 
> (unless of course it all fits on one line, which it looks like it
> does).

I like keeping the "%s%s%s%s%s%s%s%s" section separated since it needs to
match the number of arguments.  In the future where more bits of the
register are defined, both sections will need to be modified together.


This seems to be a spot where there are large numbers of similarly
functional, but mildly different style variants.  As such I suspect this
is best left in your hands as this is a bog of trivial style
considerations which have no real functional effect.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



