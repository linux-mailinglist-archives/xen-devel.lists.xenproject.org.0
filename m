Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3A932498F
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 04:45:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89581.168836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lF7a5-0007rx-GJ; Thu, 25 Feb 2021 03:44:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89581.168836; Thu, 25 Feb 2021 03:44:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lF7a5-0007rY-Cz; Thu, 25 Feb 2021 03:44:49 +0000
Received: by outflank-mailman (input) for mailman id 89581;
 Thu, 25 Feb 2021 03:44:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pmh/=H3=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1lF7a3-0007rT-Rb
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 03:44:47 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a5535efb-b9c4-46f0-99e8-79e54643f33f;
 Thu, 25 Feb 2021 03:44:46 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 11P3iU8M056842
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 24 Feb 2021 22:44:36 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 11P3iT24056841;
 Wed, 24 Feb 2021 19:44:29 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: a5535efb-b9c4-46f0-99e8-79e54643f33f
Date: Wed, 24 Feb 2021 19:44:29 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Roman Shaposhnik <roman@zededa.com>
Cc: J??rgen Gro?? <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Xen-devel <xen-devel@lists.xenproject.org>,
        Jan Beulich <jbeulich@suse.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        Roger Pau Monn?? <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
        George Dunlap <george.dunlap@citrix.com>
Subject: Re: Linux DomU freezes and dies under heavy memory shuffling
Message-ID: <YDcdHcpN+GywAUKv@mattapan.m5p.com>
References: <CAMmSBy-_UOK6DTrwGNOw8Y59Muv8H8wxmsc4-BXcv3N_u5USBA@mail.gmail.com>
 <alpine.DEB.2.21.2102161232310.3234@sstabellini-ThinkPad-T480s>
 <45b8ef4c-6d36-e91b-ca1a-a82eeca5aaf5@suse.com>
 <CAMmSBy8k0Y50Xkq9Kq+oES27gsoG==T++Hz9SiR0gDgAKnpvRA@mail.gmail.com>
 <49344e8d-5518-68c6-a417-68522a915e72@suse.com>
 <CAMmSBy-3y+Y3nhyf1uGN6KB_wNLVAqYRfc0hpkdKHtvdGSM5wg@mail.gmail.com>
 <b6b694f6-61ed-c0b7-5980-88ddb5e1616c@suse.com>
 <CAMmSBy8pSZROdPo+gee8oxrU9EL=k+QTJj0UxZTi3Bh+S_g2_w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMmSBy8pSZROdPo+gee8oxrU9EL=k+QTJj0UxZTi3Bh+S_g2_w@mail.gmail.com>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

On Wed, Feb 24, 2021 at 07:06:25PM -0800, Roman Shaposhnik wrote:
> I'm slightly confused about this patch -- it seems to me that it needs
> to be applied to the guest kernel, correct?
> 
> If that's the case -- the challenge I have is that I need to re-build
> the Canonical (Ubuntu) distro kernel with this patch -- this seems
> a bit daunting at first (I mean -- I'm pretty good at rebuilding kernels
> I just never do it with the vendor ones ;-)).
> 
> So... if there's anyone here who has any suggestions on how to do that
> -- I'd appreciate pointers.

Generally Debian-derivatives ship the kernel source they use as packages
named "linux-source-<major>.<minor>" (guessing you need
linux-source-5.4?).  They ship their configurations as packages
"linux-config-<major>.<minor>", but they also ship their configuration
with their kernels as /boot/config-<version>.

If you're trying to create a proper packaged kernel, the Linux kernel
Make target "bindeb-pkg" will create an appropriate .deb file.

If you wish to extract a Debian package, they're some tarballs and a
marker file wrapped in a ar archive.  You're likely interested in
control.tar.?z* and data.tar.?z*.  Older packages used gzip-format
(.tar.gz), newer packages use xz-format (.tar.xz).

If you want to extract current Ubuntu kernel source on a different
distribution (or even an unrelated flavor of Unix), likely you would
want `ar p linux-source-5.4.deb data.tar.xz | unxz -c | tar -xf -`.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



