Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9C5288AAD
	for <lists+xen-devel@lfdr.de>; Fri,  9 Oct 2020 16:23:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.4781.12588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQtI5-00010n-Du; Fri, 09 Oct 2020 14:22:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4781.12588; Fri, 09 Oct 2020 14:22:37 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQtI5-00010O-Ad; Fri, 09 Oct 2020 14:22:37 +0000
Received: by outflank-mailman (input) for mailman id 4781;
 Fri, 09 Oct 2020 14:22:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBQf=DQ=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kQtI3-00010J-Nj
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 14:22:35 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c9d0aeb7-6b76-4e93-8c59-c3284f96d9cb;
 Fri, 09 Oct 2020 14:22:34 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 099EM9Eo063688
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Fri, 9 Oct 2020 10:22:15 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 099EM8Rk063687;
 Fri, 9 Oct 2020 07:22:08 -0700 (PDT) (envelope-from ehem)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=bBQf=DQ=m5p.com=ehem@srs-us1.protection.inumbo.net>)
	id 1kQtI3-00010J-Nj
	for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 14:22:35 +0000
X-Inumbo-ID: c9d0aeb7-6b76-4e93-8c59-c3284f96d9cb
Received: from mailhost.m5p.com (unknown [74.104.188.4])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id c9d0aeb7-6b76-4e93-8c59-c3284f96d9cb;
	Fri, 09 Oct 2020 14:22:34 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 099EM9Eo063688
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 9 Oct 2020 10:22:15 -0400 (EDT)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.15.2/8.15.2/Submit) id 099EM8Rk063687;
	Fri, 9 Oct 2020 07:22:08 -0700 (PDT)
	(envelope-from ehem)
Date: Fri, 9 Oct 2020 07:22:08 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Julien Grall <julien@xen.org>
Cc: Elliott Mitchell <ehem+xen@m5p.com>,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        xen-devel@lists.xenproject.org, Alex Benn??e <alex.bennee@linaro.org>,
        bertrand.marquis@arm.com, andre.przywara@arm.com,
        Julien Grall <jgrall@amazon.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
        Wei Liu <wl@xen.org>, Roger Pau Monn?? <roger.pau@citrix.com>
Subject: Re: [PATCH 0/4] xen/arm: Unbreak ACPI
Message-ID: <20201009142208.GA63582@mattapan.m5p.com>
References: <20200926205542.9261-1-julien@xen.org>
 <CAA93ih3-gTAEzV=yYS-9cHGyN9rfAC28Xeyk8Gsmi7D2BS_OWQ@mail.gmail.com>
 <20201008183904.GA56716@mattapan.m5p.com>
 <f0976c17-ad36-847b-7868-f6bb13948368@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0976c17-ad36-847b-7868-f6bb13948368@xen.org>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

On Fri, Oct 09, 2020 at 10:39:26AM +0100, Julien Grall wrote:
> On 08/10/2020 19:39, Elliott Mitchell wrote:
> > Your (Masami Hiramatsu) patch seems plausible, but things haven't
> > progressed enough for me to endorse it.  Looks like something closer to
> > the core of ACPI still needs further work, Julien Grall?
> 
> I didn't go very far during my testing because QEMU is providing ACPI 
> 5.1 (Xen only supports 6.0+ so far).
> 
> For your log above, Xen finished to boot and now dom0 should start 
> booting. The lack of console output may be because of a crash in Linux 
> during earlyboot.
> 
> Do you have the early console enabled Linux? This can be done by adding 
> earlycon=xenboot on the Linux command line.

Finding all the command-line console settings can be a challenge.  I had
thought it was supposed to be "console=hvc0 earlycon=hvc0".

With that though I finally have some output which claims to come from the
Linux kernel (yay! finally hit this point!).  As we were both guessing,
very early kernel panic:

[    0.000000] efi: Getting EFI parameters from FDT:
[    0.000000] efi: Can't find 'System Table' in device tree!
[    0.000000] cma: Failed to reserve 64 MiB
[    0.000000] Kernel panic - not syncing: Failed to allocate page table page

I don't know whether this is a problem with the mini-DT which was passed
in versus ACPI tables.  I note a complete lack of ACPI table information.
The kernel is from a 5.6-based kernel tree.  I'm unsure which portion to
try updating next.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



