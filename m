Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A007275286A
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 18:34:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563326.880505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJzGW-0001sc-42; Thu, 13 Jul 2023 16:34:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563326.880505; Thu, 13 Jul 2023 16:34:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJzGW-0001qT-0s; Thu, 13 Jul 2023 16:34:04 +0000
Received: by outflank-mailman (input) for mailman id 563326;
 Thu, 13 Jul 2023 16:34:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LNpG=C7=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qJzGU-0001qN-Lj
 for xen-devel@lists.xenproject.org; Thu, 13 Jul 2023 16:34:02 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11dfc01e-219b-11ee-b239-6b7b168915f2;
 Thu, 13 Jul 2023 18:34:00 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 36DGXMxF097255
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Thu, 13 Jul 2023 12:33:28 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 36DGXMtE097254;
 Thu, 13 Jul 2023 09:33:22 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 11dfc01e-219b-11ee-b239-6b7b168915f2
Date: Thu, 13 Jul 2023 09:33:22 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 1/3] x86/APIC: include full string with
 error_interrupt() error messages
Message-ID: <ZLAnUg7qnaL2XfaI@mattapan.m5p.com>
References: <cover.1689191941.git.ehem+xen@m5p.com>
 <062ed51e7529d282b6e336c8b62734afaf21979f.1689191941.git.ehem+xen@m5p.com>
 <5a3664ef-6b58-cefd-ba42-f4b70da348b0@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5a3664ef-6b58-cefd-ba42-f4b70da348b0@suse.com>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

On Thu, Jul 13, 2023 at 03:08:56PM +0200, Jan Beulich wrote:
> On 17.03.2023 20:45, Elliott Mitchell wrote:
> > Rather than adding ", " with each printf(), simply include them in the
> > string initially.  This allows converting to strlcat() or other methods
> > which strictly concatenate, rather than formatting.
> > 
> > Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> Nevertheless I wonder ...


> > @@ -1423,7 +1423,7 @@ static void cf_check error_interrupt(struct cpu_user_regs *regs)
> >              smp_processor_id(), v , v1);
> >      for ( i = 7; i >= 0; --i )
> >          if ( v1 & (1 << i) )
> > -            printk(", %s", esr_fields[i]);
> > +            printk("%s", esr_fields[i]);
> 
> ... whether the extra level of indirection (by using %s) is then still
> necessary: There are no % characters in any of the individual strings.
> Then again iirc this goes away anyway in the next patch ...

I suspect most development guidelines generally discourage this.  Too
easy for someone to later add a '%' to the string, or make it a dynamic
string coming from some random location.

More notable is that last point.  Emphasis here is the ", " being merged
into the strings and the line is being completely replaced in the next
patch.  v0 was to strcpy() into a buffer, but this is simpler.

I also suspect "%s" may be faster if the string is sufficiently long,
as this amounts to a strcpy() info printk's buffer.  Whereas avoiding the
indirection causes the string to be scanned for '%' which will be slower
than strcpy().


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



