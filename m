Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E26CE3064D8
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 21:13:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76389.137822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4rBi-0007Xv-Fa; Wed, 27 Jan 2021 20:13:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76389.137822; Wed, 27 Jan 2021 20:13:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4rBi-0007XW-C6; Wed, 27 Jan 2021 20:13:14 +0000
Received: by outflank-mailman (input) for mailman id 76389;
 Wed, 27 Jan 2021 20:13:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rW5C=G6=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1l4rBh-0007XP-HY
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 20:13:13 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b4f0d5fa-10d9-4883-acab-686cba1ba37d;
 Wed, 27 Jan 2021 20:13:10 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 10RKCx8g027114
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 27 Jan 2021 15:13:05 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 10RKCxFw027113;
 Wed, 27 Jan 2021 12:12:59 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: b4f0d5fa-10d9-4883-acab-686cba1ba37d
Date: Wed, 27 Jan 2021 12:12:59 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
        Roger Pau Monn?? <roger.pau@citrix.com>,
        xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/pod: Do not fragment PoD memory allocations
Message-ID: <YBHJS3NEX5+iEqyd@mattapan.m5p.com>
References: <202101242308.10ON8Umj004866@m5p.com>
 <b2ad35f1-3adf-a78a-5e82-2ac4a672d624@suse.com>
 <YA8D85MoJ9lG0KJS@mattapan.m5p.com>
 <c0a70f39-d529-6ee4-511d-e82730c14879@suse.com>
 <YBBWj7NO+1HVKEgX@mattapan.m5p.com>
 <f6a75725-edc2-ee2d-0565-da1efae05190@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6a75725-edc2-ee2d-0565-da1efae05190@suse.com>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

On Wed, Jan 27, 2021 at 10:47:19AM +0100, Jan Beulich wrote:
> On 26.01.2021 18:51, Elliott Mitchell wrote:
> > Okay, this has been reliably reproducing for a while.  I had originally
> > thought it was a problem of HVM plus memory != maxmem, but the
> > non-immediate restart disagrees with that assessment.
> 
> I guess it's not really clear what you mean with this, but anyway:
> The important aspect here that I'm concerned about is what the
> manifestations of the issue are. I'm still hoping that you would
> provide such information, so we can then start thinking about how
> to solve these. If, of course, there is anything worse than the
> expected effects which use of PoD can have on the guest itself.

Manifestation is domain 0 and/or Xen panic a few seconds after the
domain.cfg file is loaded via `xl`.  Everything on the host is lost and
the host restarts.  Any VMs which were present are lost and need to
restart, similar to power loss without UPS.

Upon pressing return for `xl create domain.cfg` there is a short period
of apparently normal behavior in domain 0.  After this there is a short
period of very laggy behavior in domain 0.  Finally domain 0 goes
unresponsive and so far by the time I've gotten to the host's console it
has already started to reboot.

The periods of apparently normal and laggy behavior are perhaps 5-10
seconds each.

The configurations I've reproduced with have had maxmem substantially
larger than the total host memory (this is intended as a prototype of a
future larger VM).  The first recorded observation of this was with
Debian's build of Xen 4.8, though I recall running into it with Xen 4.4
too.

Part of the problem might also be attributeable to QEMU touching all
memory on start (thus causing PoD to try to populate *all* memory) or
OVMF.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



