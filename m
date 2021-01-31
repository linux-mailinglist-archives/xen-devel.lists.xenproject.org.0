Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C04A309E2E
	for <lists+xen-devel@lfdr.de>; Sun, 31 Jan 2021 19:14:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79388.144483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6HEg-00087H-9K; Sun, 31 Jan 2021 18:14:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79388.144483; Sun, 31 Jan 2021 18:14:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6HEg-00086r-5v; Sun, 31 Jan 2021 18:14:10 +0000
Received: by outflank-mailman (input) for mailman id 79388;
 Sun, 31 Jan 2021 18:14:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WW3a=HC=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1l6HEf-00086m-Hp
 for xen-devel@lists.xenproject.org; Sun, 31 Jan 2021 18:14:09 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ee46b15e-56a4-468e-a579-48b0ae9a9760;
 Sun, 31 Jan 2021 18:14:05 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 10VIDo5J008272
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Sun, 31 Jan 2021 13:13:56 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 10VIDnC2008271;
 Sun, 31 Jan 2021 10:13:49 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: ee46b15e-56a4-468e-a579-48b0ae9a9760
Date: Sun, 31 Jan 2021 10:13:49 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: George Dunlap <George.Dunlap@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
        Roger Pau Monne <roger.pau@citrix.com>,
        "open list:X86" <xen-devel@lists.xenproject.org>,
        Andrew Cooper <Andrew.Cooper3@citrix.com>
Subject: Re: [PATCH] x86/pod: Do not fragment PoD memory allocations
Message-ID: <YBbzXQt2GBAvpvgQ@mattapan.m5p.com>
References: <YA8D85MoJ9lG0KJS@mattapan.m5p.com>
 <c0a70f39-d529-6ee4-511d-e82730c14879@suse.com>
 <YBBWj7NO+1HVKEgX@mattapan.m5p.com>
 <f6a75725-edc2-ee2d-0565-da1efae05190@suse.com>
 <YBHJS3NEX5+iEqyd@mattapan.m5p.com>
 <67ef8210-a65f-9d6a-bea1-46ce06d47fb7@citrix.com>
 <YBHo/gscAfcAZqst@mattapan.m5p.com>
 <44450edc-9a64-8a6e-e8d3-3a3f726a96bc@suse.com>
 <YBMB1VUhYd3RUuDO@mattapan.m5p.com>
 <DC18947E-BC67-4BF8-A889-04B812DACACC@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DC18947E-BC67-4BF8-A889-04B812DACACC@citrix.com>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

On Thu, Jan 28, 2021 at 10:42:27PM +0000, George Dunlap wrote:
> 
> > On Jan 28, 2021, at 6:26 PM, Elliott Mitchell <ehem+xen@m5p.com> wrote:
> > type = "hvm"
> > memory = 1024
> > maxmem = 1073741824
> > 
> > I suspect maxmem > free Xen memory may be sufficient.  The instances I
> > can be certain of have been maxmem = total host memory *7.
> 
> Can you include your Xen version and dom0 command-line?

> This is on staging-4.14 from a month or two ago (i.e., what I happened to have on a random test  box), and `dom0_mem=1024M,max:1024M` in my command-line.  That rune will give dom0 only 1GiB of RAM, but also prevent it from auto-ballooning down to free up memory for the guest.
> 

As this is a server, not a development target, Debian's build of 4.11 is
in use.  Your domain 0 memory allocation is extremely generous compared
to mine.  One thing which is on the command-line though is
"watchdog=true".

I've got 3 candidates which presently concern me:ble:

1> There is a limited range of maxmem values where this occurs.  Perhaps
1TB is too high on your machine for the problem to reproduce.  As
previously stated my sample configuration has maxmem being roughly 7
times actual machine memory.

2> Between issuing the `xl create` command and the machine rebooting a
few moments of slow response have been observed.  Perhaps the memory
allocator loop is hogging processor cores long enough for the watchdog to
trigger?

3> Perhaps one of the patches on Debian broke things?  This seems
unlikely since nearly all of Debian's patches are either strictly for
packaging or else picks from Xen's main branch, but this is certainly
possible.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



