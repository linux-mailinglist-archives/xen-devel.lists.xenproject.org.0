Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C32C34F1AF
	for <lists+xen-devel@lfdr.de>; Tue, 30 Mar 2021 21:36:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103669.197728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRK9O-0006Qf-KX; Tue, 30 Mar 2021 19:35:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103669.197728; Tue, 30 Mar 2021 19:35:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRK9O-0006QJ-HI; Tue, 30 Mar 2021 19:35:42 +0000
Received: by outflank-mailman (input) for mailman id 103669;
 Tue, 30 Mar 2021 19:35:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cZbh=I4=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1lRK9N-0006QE-4K
 for xen-devel@lists.xenproject.org; Tue, 30 Mar 2021 19:35:41 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 65148cdc-d458-4413-9359-6ae120513760;
 Tue, 30 Mar 2021 19:35:39 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 12UJZTJV017133
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 30 Mar 2021 15:35:34 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 12UJZSEL017132;
 Tue, 30 Mar 2021 12:35:28 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 65148cdc-d458-4413-9359-6ae120513760
Date: Tue, 30 Mar 2021 12:35:28 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Roman Shaposhnik <roman@zededa.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: multiboot2 and module2 boot issues via GRUB2
Message-ID: <YGN9gL0yl8IWSkDI@mattapan.m5p.com>
References: <CAMmSBy8Wpwgj3V0U8OhsZCgyAxOjTeHDMt-Vw+om1koopmxTsg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMmSBy8Wpwgj3V0U8OhsZCgyAxOjTeHDMt-Vw+om1koopmxTsg@mail.gmail.com>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.5
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

On Tue, Mar 30, 2021 at 11:28:49AM -0700, Roman Shaposhnik wrote:
> seems like I've run into an issue with multiboot2 and module2
> commands that I can't quite explain. Since it may be something
> super simply and silly -- I wanted to reach out here before I do
> a GRUB/Xen/LK source deepdive.
> 
> So here's the deal: whenever I boot straight up Linux kernel
> I can do the following sequence of commands:
>    linux /kernel
>    initrd foo.cpio.gz bar.cpio.gz
> and have linux kernel effectively stack content of bar.cpio.gz
> on top of foo.cpio.gz and present a unified initramfs that way.
> 
> I'm trying to replicate it with Xen, but:
>      multiboot2 /boot/xen.gz
>      module2 /kernel
>      module2 foo.cpio.gz
>      module2 bar.cpio.gz
> only seems to be picking up foo.cpio.gz
> 
> Has anyone run into this issue before?

Not I, but I asked questions elsewhere before I fought this battle.  You
should get a more recent version of GRUB.

More recent versions of GRUB (2.04) on ARM have the "xen_hypervisor" boot
mode.  With this boot mode the kernel and initrd get passed via
xen_module command.

Apparently newer GRUB versions have better boot methods for Xen, so
updating would be a Good Idea, if that is viable for you.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



