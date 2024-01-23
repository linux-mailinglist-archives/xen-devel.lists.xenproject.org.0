Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB095839C91
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jan 2024 23:53:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670623.1043535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSPdG-00011m-W6; Tue, 23 Jan 2024 22:52:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670623.1043535; Tue, 23 Jan 2024 22:52:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSPdG-0000yz-Sk; Tue, 23 Jan 2024 22:52:38 +0000
Received: by outflank-mailman (input) for mailman id 670623;
 Tue, 23 Jan 2024 22:52:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z3da=JB=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1rSPdF-0000yt-M7
 for xen-devel@lists.xen.org; Tue, 23 Jan 2024 22:52:37 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18b543ee-ba42-11ee-98f5-6d05b1d4d9a1;
 Tue, 23 Jan 2024 23:52:35 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 40NMqLAu068160
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 23 Jan 2024 17:52:27 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.17.1/8.15.2/Submit) id 40NMqKTW068159;
 Tue, 23 Jan 2024 14:52:20 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 18b543ee-ba42-11ee-98f5-6d05b1d4d9a1
Date: Tue, 23 Jan 2024 14:52:20 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xen.org
Subject: Re: Thoughts on current Xen EDAC/MCE situation
Message-ID: <ZbBDJGKqTU9rdpgD@mattapan.m5p.com>
References: <Za7Vr+Rb25y/+MSy@mattapan.m5p.com>
 <111f5551-70fa-4ded-a62a-e0aa967b3c29@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <111f5551-70fa-4ded-a62a-e0aa967b3c29@suse.com>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-14) on mattapan.m5p.com

On Tue, Jan 23, 2024 at 11:44:03AM +0100, Jan Beulich wrote:
> On 22.01.2024 21:53, Elliott Mitchell wrote:
> 
> > I find the present handling of MCE in Xen an odd choice.  Having Xen do
> > most of the handling of MCE events is a behavior matching a traditional
> > stand-alone hypervisor.  Yet Xen was originally pushing any task not
> > requiring hypervisor action onto Domain 0.
> 
> Not exactly. Xen in particular deals with all of CPU and all of memory.
> Dom0 may be unaware of the full amount of CPUs in the system, nor the
> full memory map (without resorting to interfaces specifically making
> that information available, but not to be used for Dom0 kernel's own
> acting as a kernel).

Why would this be an issue?

I would expect the handling to be roughly:  NMI -> Xen; Xen schedules a
Dom0 vCPU which is eligible to run on the pCPU onto the pCPU; Dom0
examines registers/MSRs, Dom0 then issues a hypercall to Xen telling
Xen how to resolve the issue (no action, fix memory contents, kill page).

Ideally there would be an idle Dom0 vCPU, but interrupting a busy vCPU
would be viable.  It would even be reasonable to ignore affinity and
grab any Dom0 vCPU.

Dom0 has 2 purposes for the address.  First, to pass it back to Xen.
Second, to report it to a system administrator so they could restart the
system with that address marked as bad.  Dom0 wouldn't care whether the
address was directly accessible to it or not.

The proposed hypercall should report back what was effected by a UE
event.  A given site might have a policy that if $some_domain is hit by a
UE, everything is restarted.  Meanwhile Dom0 or Xen being the winner
could deserve urgent action.


> > MCE seems a perfect match for sharing responsibility with Domain 0.
> > Domain 0 needs to know about any MCE event, this is where system
> > administrators will expect to find logs.  In fact, if the event is a
> > Correctable Error, then *only* Domain 0 needs to know.  For a CE, Xen
> > may need no action at all (an implementation could need help) and
> > the effected domain would need no action.  It is strictly for
> > Uncorrectable Errors that action beside logging is needed.
> > 
> > For a UE memory error, the best approach might be for Domain 0 to decode
> > the error.  Once Domain 0 determines it is UE, invoke a hypercall to pass
> > the GPFN to Xen.
> 
> What GPFN? Decoding can only possibly find machine addresses in what
> hardware supplies.

I may have chosen the wrong term here.

> > The key advantage of this approach is it makes MCE handling act very
> > similar to MCE handling without Xen.
> 
> While that's true, you're completely omitting all implications towards
> what it means to hand off most handling to Dom0. While it is perhaps
> possible to make Linux'es chipset-specific EDAC drivers Xen PV aware,
> it might be yet harder to achieve the same in a PVH Dom0.

Much of it *doesn't* need to be Xen-aware.  There needs to be some
mechanism to allow Dom0 to access special MSRs, beyond that Xen would
only need to interpose between decoding and handling.

> >  Documentation about how MCEs are
> > reported/decoded would apply equally to Xen.  Another rather important
> > issue is it means less maintenance work to keep MCE handling working with
> > cutting-edge hardware.  I've noticed one vendor being sluggish about
> > getting patches into Linux and I fear similar issues may apply more
> > severely to Xen.
> 
> With all of your suggestions: Who do you think is going to do all of
> the work involved here (properly writing down a design, to take care
> of all known difficulties, and then actually implement everything)?
> We're already short on people, as you're very likely aware.

Right now I'm mostly want to know what general course of action is
planned/desired.

Several of the Linux x86 EDAC drivers have been adding a check for a
hypervisor and refusing to load if one is present.  The stated reason
being to get rid of a message.  Problem is this is being scattered into
several places and will make paravirtualized handling *much* harder.  As
such taking action to ensure this is in a single location is kind of
urgent now.

I'm kind of wonder if this is quietly being encouraged by a Redmond, WA
company to poison the well for other hypervisors...

(the OS wars are over, we're now into the hypervisor wars)


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



