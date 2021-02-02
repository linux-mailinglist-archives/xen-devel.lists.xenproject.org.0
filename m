Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 079AB30B78C
	for <lists+xen-devel@lfdr.de>; Tue,  2 Feb 2021 07:00:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80350.146934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6oiW-0000kT-6k; Tue, 02 Feb 2021 05:59:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80350.146934; Tue, 02 Feb 2021 05:59:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6oiW-0000k4-3M; Tue, 02 Feb 2021 05:59:12 +0000
Received: by outflank-mailman (input) for mailman id 80350;
 Tue, 02 Feb 2021 05:59:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TyQM=HE=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1l6oiV-0000jz-6h
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 05:59:11 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 575553cc-0f5a-42f4-9c70-75cb4e06bc2f;
 Tue, 02 Feb 2021 05:59:07 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 1125wsaL019305
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 2 Feb 2021 00:58:59 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 1125wrwD019304;
 Mon, 1 Feb 2021 21:58:53 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 575553cc-0f5a-42f4-9c70-75cb4e06bc2f
Date: Mon, 1 Feb 2021 21:58:53 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: George Dunlap <George.Dunlap@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
        Roger Pau Monne <roger.pau@citrix.com>,
        "open list:X86" <xen-devel@lists.xenproject.org>,
        Andrew Cooper <Andrew.Cooper3@citrix.com>
Subject: Re: [PATCH] x86/pod: Do not fragment PoD memory allocations
Message-ID: <YBjqHZIRCzdW7RX7@mattapan.m5p.com>
References: <YBBWj7NO+1HVKEgX@mattapan.m5p.com>
 <f6a75725-edc2-ee2d-0565-da1efae05190@suse.com>
 <YBHJS3NEX5+iEqyd@mattapan.m5p.com>
 <67ef8210-a65f-9d6a-bea1-46ce06d47fb7@citrix.com>
 <YBHo/gscAfcAZqst@mattapan.m5p.com>
 <44450edc-9a64-8a6e-e8d3-3a3f726a96bc@suse.com>
 <YBMB1VUhYd3RUuDO@mattapan.m5p.com>
 <DC18947E-BC67-4BF8-A889-04B812DACACC@citrix.com>
 <YBbzXQt2GBAvpvgQ@mattapan.m5p.com>
 <E8806231-28EE-4618-B6A5-1B50813BF4B1@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E8806231-28EE-4618-B6A5-1B50813BF4B1@citrix.com>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

On Mon, Feb 01, 2021 at 10:35:15AM +0000, George Dunlap wrote:
> 
> 
> > On Jan 31, 2021, at 6:13 PM, Elliott Mitchell <ehem+xen@m5p.com> wrote:
> > 
> > On Thu, Jan 28, 2021 at 10:42:27PM +0000, George Dunlap wrote:
> >> 
> >>> On Jan 28, 2021, at 6:26 PM, Elliott Mitchell <ehem+xen@m5p.com> wrote:
> >>> type = "hvm"
> >>> memory = 1024
> >>> maxmem = 1073741824
> >>> 
> >>> I suspect maxmem > free Xen memory may be sufficient.  The instances I
> >>> can be certain of have been maxmem = total host memory *7.
> >> 
> >> Can you include your Xen version and dom0 command-line?
> > 
> >> This is on staging-4.14 from a month or two ago (i.e., what I happened to have on a random test  box), and `dom0_mem=1024M,max:1024M` in my command-line.  That rune will give dom0 only 1GiB of RAM, but also prevent it from auto-ballooning down to free up memory for the guest.
> >> 
> > 
> > As this is a server, not a development target, Debian's build of 4.11 is
> > in use.  Your domain 0 memory allocation is extremely generous compared
> > to mine.  One thing which is on the command-line though is
> > "watchdog=true".
> 
> staging-4.14 is just the stable 4.14 branch which our CI loop tests before pushing to stable-4.14, which is essentially tagged 3 times a year for point releases.  It???s quite stable.  I???ll give 4.11 a try if I get a chance.
> 
> It???s not clear from your response ??? are you allocating a fixed amount to dom0?  How much is it?  In fact, probably the simplest thing to do would be to attach the output of `xl info` and `xl dmesg`; that will save a lot of potential future back-and-forth.
> 
> 1GiB isn???t particularly generous if you???re running a large number of guests.  My understanding is that XenServer now defaults to 4GiB of RAM for dom0.
> 

I guess it comes to setup, how careful one is at pruning unneeded
services and whether one takes steps to ensure there aren't extra qemu
processes hanging around (avoiding hvm VMs in most cases).


release                : 4.19.160-2
version                : #5 SMP Sat Dec 5 09:58:41 PST 2020
machine                : x86_64
nr_cpus                : 8
max_cpu_id             : 7
nr_nodes               : 1
cores_per_socket       : 4
threads_per_core       : 2
cpu_mhz                : 4018.086
hw_caps                : 178bf3ff:b698320b:2e500800:0069bfff:00000000:00000008:00000000:00000500
virt_caps              : hvm
total_memory           : 16110
free_memory            : 781
sharing_freed_memory   : 0
sharing_used_memory    : 0
outstanding_claims     : 0
free_cpus              : 0
xen_major              : 4
xen_minor              : 11
xen_extra              : .4
xen_version            : 4.11.4
xen_caps               : xen-3.0-x86_64 xen-3.0-x86_32p hvm-3.0-x86_32 hvm-3.0-x86_32p hvm-3.0-x86_64 
xen_scheduler          : credit
xen_pagesize           : 4096
platform_params        : virt_start=0xffff800000000000
xen_changeset          : 
xen_commandline        : placeholder watchdog=true loglvl=info iommu=verbose cpuidle dom0_mem=384M,max:640M dom0_max_vcpus=8
cc_compiler            : gcc (Debian 8.3.0-6) 8.3.0
cc_compile_by          : pkg-xen-devel
cc_compile_domain      : lists.alioth.debian.org
cc_compile_date        : Fri Dec 11 21:33:51 UTC 2020
build_id               : 6d8e0fa3ddb825695eb6c6832631b4fa2331fe41
xend_config_format     : 4


> > I've got 3 candidates which presently concern me:ble:
> > 
> > 1> There is a limited range of maxmem values where this occurs.  Perhaps
> > 1TB is too high on your machine for the problem to reproduce.  As
> > previously stated my sample configuration has maxmem being roughly 7
> > times actual machine memory.
> 
> In fact I did a number of binary-search-style experiments to try to find out boundary behavior.  I don???t think I did 7x memory, but I certainly did 2x or 3x host memory, and the exact number you gave that caused you problems.  In all cases for me, it either worked or failed with a cryptic error message (the specific message depending on whether I had fixed dom0 memory or autoballooned memory).
> 

Hmm, may have to mem-set Dom0 to max then retry the crash configuration
with maxmem just greater than machine memory...    Do have that downtime
due to kernel update...


> > 2> Between issuing the `xl create` command and the machine rebooting a
> > few moments of slow response have been observed.  Perhaps the memory
> > allocator loop is hogging processor cores long enough for the watchdog to
> > trigger?
> 
> I don???t know the balloon driver very well, but I???d hope it yielded pretty regularly.  It seems more likely to me that your dom0 is swapping due to low memory / struggling with having to work with no file cache.  Or the OOM killer is doing its calculation trying to figure out which process to shoot?  
> 

I know which process it shoots.  One ideal is to have memory just high
enough for the OOM-killer not to trigger.  Under this idea you *want* to
use some swap, as some portions of process address space are left idle
99.99% of the time and don't need to waste RAM.  This though is a bit
funky with SSDs taking over for which writes are more precious.
Difficulty then becomes some of Xen's odd Dom0 memory behavior.

According to `xl list` it isn't possible to set Dom0's memory to maximum.
I've been theorizing this might be due to memory used for DMA needing to
be inside the maxmem region, but isn't counted in `xl list`...


> > 3> Perhaps one of the patches on Debian broke things?  This seems
> > unlikely since nearly all of Debian's patches are either strictly for
> > packaging or else picks from Xen's main branch, but this is certainly
> > possible.
> 
> Indeed, I???d consider that unlikely.  Some things I???d consider more likely to cause the difference:
> 
> 1. The amount of host memory (my test box had only 6GiB)
> 
> 2. The amount of memory assigned to dom0 

I consider this unlikely.  Due to a downtime I got a chance to try this
issue from the console and *nothing* appeared.  If there was a memory
issue with domain 0 then I would have expected messages from the
OOM-killer before restart.


> 3. The number of other VMs running in the background

During that downtime other VMs had been saved to storage (I didn't want
to lose their runtimes).  As such all memory was available to domain 0
and the problematic VM configuration.


> 4. A difference in the version of Linux (I???m also running Debian, but deban-testing)
> 

Not impossible, but seems improbable to me.  This has also been observed
when domain 0 had a 4.9 kernel.  Perhaps 5.x includes some fix which
works around the issue, but I'm very doubtful of this.

> 5. A bug in 4.11 that was fixed by 4.14.

This isn't confined to 4.11.  I observed this with 4.8 and I recall
running into suspiciously similar things with 4.4.  The bug may well have
been fixed between 4.11 and 4.14 though.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



