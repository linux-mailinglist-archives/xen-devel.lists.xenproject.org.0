Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E50289BCE
	for <lists+xen-devel@lfdr.de>; Sat, 10 Oct 2020 00:38:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.5236.13689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kR10m-0000Cc-Nm; Fri, 09 Oct 2020 22:37:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5236.13689; Fri, 09 Oct 2020 22:37:16 +0000
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
	id 1kR10m-0000CD-KU; Fri, 09 Oct 2020 22:37:16 +0000
Received: by outflank-mailman (input) for mailman id 5236;
 Fri, 09 Oct 2020 22:37:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBQf=DQ=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kR10l-0000C8-5u
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 22:37:15 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4162e366-9131-446f-825b-eac540daf4d5;
 Fri, 09 Oct 2020 22:37:14 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 099Mar12066450
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Fri, 9 Oct 2020 18:36:58 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 099Maqhl066449;
 Fri, 9 Oct 2020 15:36:52 -0700 (PDT) (envelope-from ehem)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=bBQf=DQ=m5p.com=ehem@srs-us1.protection.inumbo.net>)
	id 1kR10l-0000C8-5u
	for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 22:37:15 +0000
X-Inumbo-ID: 4162e366-9131-446f-825b-eac540daf4d5
Received: from mailhost.m5p.com (unknown [74.104.188.4])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 4162e366-9131-446f-825b-eac540daf4d5;
	Fri, 09 Oct 2020 22:37:14 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 099Mar12066450
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 9 Oct 2020 18:36:58 -0400 (EDT)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.15.2/8.15.2/Submit) id 099Maqhl066449;
	Fri, 9 Oct 2020 15:36:52 -0700 (PDT)
	(envelope-from ehem)
Date: Fri, 9 Oct 2020 15:36:52 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Julien Grall <julien@xen.org>
Cc: Masami Hiramatsu <masami.hiramatsu@linaro.org>,
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
Message-ID: <20201009223652.GC65219@mattapan.m5p.com>
References: <20200926205542.9261-1-julien@xen.org>
 <CAA93ih3-gTAEzV=yYS-9cHGyN9rfAC28Xeyk8Gsmi7D2BS_OWQ@mail.gmail.com>
 <20201008183904.GA56716@mattapan.m5p.com>
 <f0976c17-ad36-847b-7868-f6bb13948368@xen.org>
 <20201009142208.GA63582@mattapan.m5p.com>
 <55a4ac3d-dc6f-f2f6-1a98-62d1c555d26e@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55a4ac3d-dc6f-f2f6-1a98-62d1c555d26e@xen.org>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

On Fri, Oct 09, 2020 at 07:15:20PM +0100, Julien Grall wrote:
> On 09/10/2020 15:22, Elliott Mitchell wrote:
> > Finding all the command-line console settings can be a challenge.  I had
> > thought it was supposed to be "console=hvc0 earlycon=hvc0".
> > 
> > With that though I finally have some output which claims to come from the
> > Linux kernel (yay! finally hit this point!).  As we were both guessing,
> > very early kernel panic:
> > 
> > [    0.000000] efi: Getting EFI parameters from FDT:
> > [    0.000000] efi: Can't find 'System Table' in device tree!
> 
> Thank you for sending part of the log. Looking at Linux 5.6 code, the 
> error message is printed by efi_get_fdt_params() (see 
> drivers/firmware/efi.c) when one of the property is missing.
> 
> 'System Table' suggests that Linux wasn't enable to find 
> "linux,uefi-system-table" or "xen,uefi-system-table".
> 
> Xen will only create later. Would it be possible to add some code in 
> __find_uefi_params() to confirm which property Linux thinks is missing?

Trying to rebuild a configuration long after the prior build can be
entertaining.  Finally identified one patch appears to be for 4.19, but
breaks 5.x.  With that and an appropriate adjustment:

[    0.000000] efi: __find_uefi_params(): Missing "linux,uefi-system-table"
[    0.000000] efi: __find_uefi_params(): Missing "linux,uefi-system-table"


Good news is I had been meaning to try a later kernel for a while and
thus tried building a 5.8 kernel.  Once built, the 5.8 kernel booted
successfully.  As such the next issue is the driver for the graphics chip
doesn't function under Xen as of the 5.8 kernel and Xen 4.14.

I can now state I've gotten success with a combination of Julien Grall's
patches and Masami Hiramatsu.  Certainly qualifies for:

Tested-by: Elliott Mitchell <ehem+xen@m5p.com>

For all 5 patches.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



