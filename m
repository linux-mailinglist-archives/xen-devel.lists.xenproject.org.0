Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DDB83AD24
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 16:21:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671085.1044221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSf40-0005em-Jl; Wed, 24 Jan 2024 15:21:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671085.1044221; Wed, 24 Jan 2024 15:21:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSf40-0005cG-Gv; Wed, 24 Jan 2024 15:21:16 +0000
Received: by outflank-mailman (input) for mailman id 671085;
 Wed, 24 Jan 2024 15:21:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z0X+=JC=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1rSf3y-0005cA-9i
 for xen-devel@lists.xen.org; Wed, 24 Jan 2024 15:21:14 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 343f0909-bacc-11ee-98f5-6d05b1d4d9a1;
 Wed, 24 Jan 2024 16:21:12 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 40OFKuFs071729
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 24 Jan 2024 10:21:02 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.17.1/8.15.2/Submit) id 40OFKuS8071728;
 Wed, 24 Jan 2024 07:20:56 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 343f0909-bacc-11ee-98f5-6d05b1d4d9a1
Date: Wed, 24 Jan 2024 07:20:56 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xen.org
Subject: Re: Thoughts on current Xen EDAC/MCE situation
Message-ID: <ZbEq2JLY25TyLltX@mattapan.m5p.com>
References: <Za7Vr+Rb25y/+MSy@mattapan.m5p.com>
 <111f5551-70fa-4ded-a62a-e0aa967b3c29@suse.com>
 <ZbBDJGKqTU9rdpgD@mattapan.m5p.com>
 <e7d67831-d7b9-48fd-9478-f89e85ce0422@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7d67831-d7b9-48fd-9478-f89e85ce0422@suse.com>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-14) on mattapan.m5p.com

On Wed, Jan 24, 2024 at 08:23:15AM +0100, Jan Beulich wrote:
> On 23.01.2024 23:52, Elliott Mitchell wrote:
> > On Tue, Jan 23, 2024 at 11:44:03AM +0100, Jan Beulich wrote:
> >> On 22.01.2024 21:53, Elliott Mitchell wrote:
> >>
> >>> I find the present handling of MCE in Xen an odd choice.  Having Xen do
> >>> most of the handling of MCE events is a behavior matching a traditional
> >>> stand-alone hypervisor.  Yet Xen was originally pushing any task not
> >>> requiring hypervisor action onto Domain 0.
> >>
> >> Not exactly. Xen in particular deals with all of CPU and all of memory.
> >> Dom0 may be unaware of the full amount of CPUs in the system, nor the
> >> full memory map (without resorting to interfaces specifically making
> >> that information available, but not to be used for Dom0 kernel's own
> >> acting as a kernel).
> > 
> > Why would this be an issue?
> 
> Well, counter question: For all of ...
> 
> > I would expect the handling to be roughly:  NMI -> Xen; Xen schedules a
> > Dom0 vCPU which is eligible to run on the pCPU onto the pCPU; Dom0
> > examines registers/MSRs, Dom0 then issues a hypercall to Xen telling
> > Xen how to resolve the issue (no action, fix memory contents, kill page).
> > 
> > Ideally there would be an idle Dom0 vCPU, but interrupting a busy vCPU
> > would be viable.  It would even be reasonable to ignore affinity and
> > grab any Dom0 vCPU.
> > 
> > Dom0 has 2 purposes for the address.  First, to pass it back to Xen.
> > Second, to report it to a system administrator so they could restart the
> > system with that address marked as bad.  Dom0 wouldn't care whether the
> > address was directly accessible to it or not.
> > 
> > The proposed hypercall should report back what was effected by a UE
> > event.  A given site might have a policy that if $some_domain is hit by a
> > UE, everything is restarted.  Meanwhile Dom0 or Xen being the winner
> > could deserve urgent action.
> 
> ... this, did you first look at code and figure how what you suggest
> could be seamlessly integrated? Part of your suggestion (if I got it
> right) is, after all, to make maintenance on the Dom0 kernel side easy.
> I expect such adjustments being not overly intrusive would also be an
> acceptance criteria by the maintainers.

Maintenance on the Dom0 kernel isn't the issue.

One issue is for reporting of MCEs when running on Xen to be consistent
with MCE when not running on Xen.  Notably similar level of information
and ideally tools which assist with analyzing failures working when
running on Xen.

Another issue is to do a better job of keeping Xen up to date with MCE
handling as new hardware with new MCE implementations show up.

> Second - since you specifically talk about UE: The more code is involved
> in handling, the higher the chance of the #MC ending up fatal to the
> system.

Indeed.  Yet right now I'm more concerned over whether MCEs reporting is
happening at all.  There aren't very many messages at all.

> Third, as to Dom0's purposes of having the address: If all it is to use
> it for is to pass it back to Xen, paths in the respective drivers will
> necessarily be entirely different for the Xen vs the native cases.

I'm less than certain of the best place for Xen to intercept MCE events.
For UE memory events, the simplest approach on Linux might be to wrap the
memory_failure() function.  Yet for Linux/x86,
mce_register_decode_chain() also looks like a very good candidate.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



