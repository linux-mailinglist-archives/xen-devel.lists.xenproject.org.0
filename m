Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4208C3249DD
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 05:48:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89592.168866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lF8ZP-0005VD-OJ; Thu, 25 Feb 2021 04:48:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89592.168866; Thu, 25 Feb 2021 04:48:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lF8ZP-0005Uo-Kj; Thu, 25 Feb 2021 04:48:11 +0000
Received: by outflank-mailman (input) for mailman id 89592;
 Thu, 25 Feb 2021 04:48:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pmh/=H3=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1lF8ZO-0005Uj-Ah
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 04:48:10 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0fac5ea6-4131-472a-afc8-6a6492936374;
 Thu, 25 Feb 2021 04:48:08 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 11P4lrGB057101
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 24 Feb 2021 23:47:58 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 11P4lqcN057100;
 Wed, 24 Feb 2021 20:47:52 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 0fac5ea6-4131-472a-afc8-6a6492936374
Date: Wed, 24 Feb 2021 20:47:52 -0800
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
Message-ID: <YDcr+Dd2hz9IK6BT@mattapan.m5p.com>
References: <CAMmSBy-_UOK6DTrwGNOw8Y59Muv8H8wxmsc4-BXcv3N_u5USBA@mail.gmail.com>
 <alpine.DEB.2.21.2102161232310.3234@sstabellini-ThinkPad-T480s>
 <45b8ef4c-6d36-e91b-ca1a-a82eeca5aaf5@suse.com>
 <CAMmSBy8k0Y50Xkq9Kq+oES27gsoG==T++Hz9SiR0gDgAKnpvRA@mail.gmail.com>
 <49344e8d-5518-68c6-a417-68522a915e72@suse.com>
 <CAMmSBy-3y+Y3nhyf1uGN6KB_wNLVAqYRfc0hpkdKHtvdGSM5wg@mail.gmail.com>
 <b6b694f6-61ed-c0b7-5980-88ddb5e1616c@suse.com>
 <CAMmSBy8pSZROdPo+gee8oxrU9EL=k+QTJj0UxZTi3Bh+S_g2_w@mail.gmail.com>
 <YDcdHcpN+GywAUKv@mattapan.m5p.com>
 <CAMmSBy91csJ3MGrV8CPYX-fNdkFu6P12zEr2LjCbchvAeEsTKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMmSBy91csJ3MGrV8CPYX-fNdkFu6P12zEr2LjCbchvAeEsTKA@mail.gmail.com>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

On Wed, Feb 24, 2021 at 08:30:45PM -0800, Roman Shaposhnik wrote:
> Right -- but that's not what distro builders use, right? I mean they do
> the whole sdeb -> deb business.
> 
> In fact, to stay as faithful as possible -- I'd love to:
>    1. unpack SDEB
>    2. add a single patch to the set of sources
>    3. repack SDEB back
>    4. do whatever it is they do to go SDEB -> DEB

Oh, that close to the original distribution package.  For
Debian-derivatives, install the package "dpkg-dev".

Generally the distribution will have a page somewhere where you can get
the files, but often it is handiest to run `apt-get source <package>` (I
believe `apt source <package>` also works, but I'm used to `apt-get`).
This will grab the tarballs for the source and unpack them.

Go into the unpacked directory and run `dpkg-buildpackage -b`
(optionally, patch first).  This creates the package in the starting
directory.

The tarballs left behind in the starting directory can be nuked or saved.
If saved, the build directory can be recreated by running
`dpkg-source -x <src-package-name>_<ver>.dsc`.  This lets you reset the
build directory to original state.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



