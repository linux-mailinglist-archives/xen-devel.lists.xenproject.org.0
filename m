Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA922DB9E5
	for <lists+xen-devel@lfdr.de>; Wed, 16 Dec 2020 05:01:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54987.95599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpNyg-0005v0-12; Wed, 16 Dec 2020 03:59:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54987.95599; Wed, 16 Dec 2020 03:59:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpNyf-0005ub-U2; Wed, 16 Dec 2020 03:59:49 +0000
Received: by outflank-mailman (input) for mailman id 54987;
 Wed, 16 Dec 2020 03:59:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iRal=FU=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kpNye-0005uW-Ah
 for xen-devel@lists.xenproject.org; Wed, 16 Dec 2020 03:59:48 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d08d3efc-737e-4c92-9806-fc6cf0d8b089;
 Wed, 16 Dec 2020 03:59:47 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 0BG3xRCV034767
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 15 Dec 2020 22:59:33 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 0BG3xRRO034766;
 Tue, 15 Dec 2020 19:59:27 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: d08d3efc-737e-4c92-9806-fc6cf0d8b089
Date: Tue, 15 Dec 2020 19:59:27 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Roman Shaposhnik <roman@zededa.com>, Julien Grall <julien@xen.org>,
        Oleksandr_Andrushchenko@epam.com,
        Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Xen-ARM DomUs
Message-ID: <X9mGH9SPoC5cfpSu@mattapan.m5p.com>
References: <X9gcZu5uJpXx8wNn@mattapan.m5p.com>
 <alpine.DEB.2.21.2012150828170.4040@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2012150828170.4040@sstabellini-ThinkPad-T480s>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

On Tue, Dec 15, 2020 at 08:36:34AM -0800, Stefano Stabellini wrote:
> On Mon, 14 Dec 2020, Elliott Mitchell wrote:
> > The available examples seem geared towards Linux DomUs.  I'm looking at a
> > FreeBSD installation image and it appears to expect an EFI firmware.
> > Beyond having a bunch of files appearing oriented towards booting on EFI
> > I can't say much about (booting) FreeBSD/ARM DomUs.
> 
> Running EFI firmware in a domU is possible with both Tianocore and
> U-Boot. You should be able to build the firmware and pass it as a
> kernel= binary in the xl file. Then the firmware will be able to load
> the necessary binaries from the virtual disk.

Hmm, no mention of this on:
https://wiki.xenproject.org/wiki/OVMF

In fact that appears 100% x86.  Perhaps tools/firmware needs to be
adjusted to make it work on ARM?

Really the xlexample files in tools/examples need equivalents for ARM...

*This* reads like the approach I'm looking for, but building Tianocore
is an adventure even with a good guide.

> I ran Tianocore this way years ago. Recently, u-boot has been ported to
> be run in a domU by Oleksandr Andrushchenko (CCed).

The Xen wiki has no information on this.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



