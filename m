Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3102DC792
	for <lists+xen-devel@lfdr.de>; Wed, 16 Dec 2020 21:15:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.55577.96739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpdBN-0004IR-QL; Wed, 16 Dec 2020 20:13:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55577.96739; Wed, 16 Dec 2020 20:13:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpdBN-0004I2-Mq; Wed, 16 Dec 2020 20:13:57 +0000
Received: by outflank-mailman (input) for mailman id 55577;
 Wed, 16 Dec 2020 20:13:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ehtw=FU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kpdBM-0004Hx-1H
 for xen-devel@lists.xenproject.org; Wed, 16 Dec 2020 20:13:56 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8699f4fb-d4ff-49a4-9aa3-4e9909a94125;
 Wed, 16 Dec 2020 20:13:55 +0000 (UTC)
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
X-Inumbo-ID: 8699f4fb-d4ff-49a4-9aa3-4e9909a94125
Date: Wed, 16 Dec 2020 12:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1608149634;
	bh=IJ4Mr7DeeTOalLyT7XjVXCXQlaTQ8u0dmKNL/VnGG2I=;
	h=From:To:cc:Subject:In-Reply-To:References:From;
	b=Gfn7GygXSmuVfYvoxVehZcyahmbZuqu8uiNW3H00Es93FmVz3CugGgzvBIl4srA3W
	 hudeY8pgjNWXdHf4vkPTSQj+Y1088GMH44aputV7V+/Be9IctNnAGasLmIiuGstgG8
	 obUJMsu4lSpVZA4tsvaZQnnKqB0q87txOElKQHcMkU/jnt2QwlDtML19qJW07w2Vko
	 RCJITIX5Jqqx4+oXDOVFQGfche3PKL4ZC+Dvyrl7TCiUAxI8ZUkTYuZSQpGbpIGv8u
	 9Au77uvJNqre8zHCG4/Ilk3zTBMgAYWMowhKz4D2O4g+kCDIdTp19dEebAJDpRUX+j
	 rKULVX53s/4sg==
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Elliott Mitchell <ehem+xen@m5p.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Roman Shaposhnik <roman@zededa.com>, Julien Grall <julien@xen.org>, 
    Oleksandr_Andrushchenko@epam.com, 
    Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Xen-ARM DomUs
In-Reply-To: <X9mGH9SPoC5cfpSu@mattapan.m5p.com>
Message-ID: <alpine.DEB.2.21.2012161206420.4040@sstabellini-ThinkPad-T480s>
References: <X9gcZu5uJpXx8wNn@mattapan.m5p.com> <alpine.DEB.2.21.2012150828170.4040@sstabellini-ThinkPad-T480s> <X9mGH9SPoC5cfpSu@mattapan.m5p.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 15 Dec 2020, Elliott Mitchell wrote:
> On Tue, Dec 15, 2020 at 08:36:34AM -0800, Stefano Stabellini wrote:
> > On Mon, 14 Dec 2020, Elliott Mitchell wrote:
> > > The available examples seem geared towards Linux DomUs.  I'm looking at a
> > > FreeBSD installation image and it appears to expect an EFI firmware.
> > > Beyond having a bunch of files appearing oriented towards booting on EFI
> > > I can't say much about (booting) FreeBSD/ARM DomUs.
> > 
> > Running EFI firmware in a domU is possible with both Tianocore and
> > U-Boot. You should be able to build the firmware and pass it as a
> > kernel= binary in the xl file. Then the firmware will be able to load
> > the necessary binaries from the virtual disk.
> 
> Hmm, no mention of this on:
> https://wiki.xenproject.org/wiki/OVMF
> 
> In fact that appears 100% x86.  Perhaps tools/firmware needs to be
> adjusted to make it work on ARM?
> 
> Really the xlexample files in tools/examples need equivalents for ARM...
> 
> *This* reads like the approach I'm looking for, but building Tianocore
> is an adventure even with a good guide.

Tianocore has been working for many years as domU kernel, but I haven't
tried it in a while. You should definitely be able to get it to boot.
Linaro offers pre-built binaries of it with Xen enabled:

http://snapshots.linaro.org/components/kernel/leg-virt-tianocore-edk2-upstream/4123/XEN-AARCH64/RELEASE_GCC5/


> > I ran Tianocore this way years ago. Recently, u-boot has been ported to
> > be run in a domU by Oleksandr Andrushchenko (CCed).
> 
> The Xen wiki has no information on this.

This is relatively new. Maybe Oleksandr should add a page to the wiki
when he gets a chance :-)

