Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4184ED13C
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 03:16:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296591.504900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZjPJ-0000lr-Gx; Thu, 31 Mar 2022 01:15:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296591.504900; Thu, 31 Mar 2022 01:15:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZjPJ-0000iu-Dg; Thu, 31 Mar 2022 01:15:25 +0000
Received: by outflank-mailman (input) for mailman id 296591;
 Thu, 31 Mar 2022 01:15:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Dd35=UK=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1nZjPI-0000io-8V
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 01:15:24 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 07899a54-b090-11ec-8fbc-03012f2f19d4;
 Thu, 31 Mar 2022 03:15:20 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 22V1F15g072423
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 30 Mar 2022 21:15:07 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 22V1F1qW072422;
 Wed, 30 Mar 2022 18:15:01 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 07899a54-b090-11ec-8fbc-03012f2f19d4
Date: Wed, 30 Mar 2022 18:15:01 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
        xen-devel@lists.xenproject.org
Subject: Re: OS Headers hypercall.h/hypervisor.h
Message-ID: <YkUAlWH6imVV9D00@mattapan.m5p.com>
References: <Yj+ekdLdRa9U7dfa@mattapan.m5p.com>
 <alpine.DEB.2.22.394.2203281523230.2910984@ubuntu-linux-20-04-desktop>
 <c999faa3-ded7-64af-7bf1-f6b8e5620425@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c999faa3-ded7-64af-7bf1-f6b8e5620425@suse.com>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.5
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

On Tue, Mar 29, 2022 at 08:27:24AM +0200, Jan Beulich wrote:
> On 29.03.2022 00:25, Stefano Stabellini wrote:
> > On Sat, 26 Mar 2022, Elliott Mitchell wrote:
> >> The hypercalls implementation for Linux and FreeBSD have two key headers,
> >> hypercall.h and hypervisor.h.  I'm curious why the implementations for
> >> x86 and ARM* are so distinct.
> >>
> >> I found it fairly straightforward to implement ARM* versions of the x86
> >> _hypercall#() macros.  Once that is done, most of the wrappers in the x86
> >> hypercall.h can be moved to a shared hypervisor.h header.
> >>
> >> Why does Xen/ARM on Linux still have hypercall.S when merging the
> >> headers should reduce maintainance?
> >>
> >> Was GCC extended inline assembly language for ARM* thought too awful?
> >>
> >> I'm also curious why these headers are part of the Linux kernel, instead
> >> of being maintained by the Xen Project?
> > 
> > I would have to dig through ancient archives to give you a full answer
> > but the reason was that the asm inline on ARM didn't provide enough
> > guarantees on ordering and registers it would use and clobber.
> 
> While there may be ordering issues (albeit most ought to be taken care
> of by marking the asm() volatile and having it have a memory clobber),
> registers used / clobbered ought to always be expressable by asm() -
> if not by constraints covering just a single register (such frequently
> simply don't exist), then by using register variables tied to a
> particular register. Of course in all of this there's an assumption of
> no bugs in this area in the compilers claimed as being supported ...

I'm merely been working with recent versions of Clang on FreeBSD, but
I've got something which appears to work.

I would be somewhat hopeful GCC might have fewer bugs on ARM as
registers aren't so precious.  Yet that could well be a minefield.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



