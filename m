Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 027D5302941
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 18:47:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74233.133382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l45wn-00008c-Gx; Mon, 25 Jan 2021 17:46:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74233.133382; Mon, 25 Jan 2021 17:46:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l45wn-00008I-D1; Mon, 25 Jan 2021 17:46:41 +0000
Received: by outflank-mailman (input) for mailman id 74233;
 Mon, 25 Jan 2021 17:46:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l+K7=G4=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1l45wm-00008D-Ns
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 17:46:40 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c09683e1-25e9-4ffc-a8b2-f72b2ac7e944;
 Mon, 25 Jan 2021 17:46:39 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 10PHkSI4009791
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 25 Jan 2021 12:46:33 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 10PHkRa6009790;
 Mon, 25 Jan 2021 09:46:27 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: c09683e1-25e9-4ffc-a8b2-f72b2ac7e944
Date: Mon, 25 Jan 2021 09:46:27 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
        Roger Pau Monn?? <roger.pau@citrix.com>,
        xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/pod: Do not fragment PoD memory allocations
Message-ID: <YA8D85MoJ9lG0KJS@mattapan.m5p.com>
References: <202101242308.10ON8Umj004866@m5p.com>
 <b2ad35f1-3adf-a78a-5e82-2ac4a672d624@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b2ad35f1-3adf-a78a-5e82-2ac4a672d624@suse.com>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

On Mon, Jan 25, 2021 at 10:56:25AM +0100, Jan Beulich wrote:
> On 24.01.2021 05:47, Elliott Mitchell wrote:
> > 
> > ---
> > Changes in v2:
> > - Include the obvious removal of the goto target.  Always realize you're
> >   at the wrong place when you press "send".
> 
> Please could you also label the submission then accordingly? I
> got puzzled by two identically titled messages side by side,
> until I noticed the difference.

Sorry about that.  Would you have preferred a third message mentioning
this mistake?

> > I'm not including a separate cover message since this is a single hunk.
> > This really needs some checking in `xl`.  If one has a domain which
> > sometimes gets started on different hosts and is sometimes modified with
> > slightly differing settings, one can run into trouble.
> > 
> > In this case most of the time the particular domain is most often used
> > PV/PVH, but every so often is used as a template for HVM.  Starting it
> > HVM will trigger PoD mode.  If it is started on a machine with less
> > memory than others, PoD may well exhaust all memory and then trigger a
> > panic.
> > 
> > `xl` should likely fail HVM domain creation when the maximum memory
> > exceeds available memory (never mind total memory).
> 
> I don't think so, no - it's the purpose of PoD to allow starting
> a guest despite there not being enough memory available to
> satisfy its "max", as such guests are expected to balloon down
> immediately, rather than triggering an oom condition.

Even Qemu/OVMF is expected to handle ballooning for a *HVM* domain?

> > For example try a domain with the following settings:
> > 
> > memory = 8192
> > maxmem = 2147483648
> > 
> > If type is PV or PVH, it will likely boot successfully.  Change type to
> > HVM and unless your hardware budget is impressive, Xen will soon panic.
> 
> Xen will panic? That would need fixing if so. Also I'd consider
> an excessively high maxmem (compared to memory) a configuration
> error. According to my experiments long, long ago I seem to
> recall that a factor beyond 32 is almost never going to lead to
> anything good, irrespective of guest type. (But as said, badness
> here should be restricted to the guest; Xen itself should limp
> on fine.)

I'll confess I haven't confirmed the panic is in Xen itself.  Problem is
when this gets triggered, by the time the situation is clear and I can
get to the console the computer is already restarting, thus no error
message has been observed.

This is most certainly a configuration error.  Problem is this is a very
small delta between a perfectly valid configuration and the one which
reliably triggers a panic.

The memory:maxmem ratio isn't the problem.  My example had a maxmem of
2147483648 since that is enough to exceed the memory of sub-$100K
computers.  The crucial features are maxmem >= machine memory,
memory < free memory (thus potentially bootable PV/PVH) and type = "hvm".

When was the last time you tried running a Xen machine with near zero
free memory?  Perhaps in the past Xen kept the promise of never panicing
on memory exhaustion, but this feels like this hasn't held for some time.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



