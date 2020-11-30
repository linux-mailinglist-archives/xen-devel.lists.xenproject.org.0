Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4EA2C9007
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 22:28:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41478.74650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjqik-0003LT-Gf; Mon, 30 Nov 2020 21:28:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41478.74650; Mon, 30 Nov 2020 21:28:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjqik-0003L4-DR; Mon, 30 Nov 2020 21:28:30 +0000
Received: by outflank-mailman (input) for mailman id 41478;
 Mon, 30 Nov 2020 21:28:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qs/p=FE=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kjqii-0003Kz-JG
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 21:28:28 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 41fb2263-0a64-41c1-a950-60869ca0f168;
 Mon, 30 Nov 2020 21:28:28 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 247E62076A;
 Mon, 30 Nov 2020 21:28:26 +0000 (UTC)
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
X-Inumbo-ID: 41fb2263-0a64-41c1-a950-60869ca0f168
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606771707;
	bh=nRkhpXnGjHJGH3BKb1G/qP5N1PKFw4d6Y40Sy/kY1ps=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DpdC9uqks5pPHPFDx2tEwTqEET2dzNOoklp05CrqT2LJiBmmRoUqE9evb4PSG+dBM
	 KZMUi6Vln0PKwwrCPqooMjAb5F/lzBougs/eR0wrGwNGLSMYsQJTHfWXDVr/nfYuaL
	 IPIwgah91UgCxyobhXyX32H4UNvRQPfYEvuvlE4s=
Date: Mon, 30 Nov 2020 13:28:25 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Anthony PERARD <anthony.perard@citrix.com>
cc: Eduardo Habkost <ehabkost@redhat.com>, 
    =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>, 
    qemu-devel@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
    Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
    Paolo Bonzini <pbonzini@redhat.com>, 
    Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
    Wainer dos Santos Moschetta <wainersm@redhat.com>, 
    Aurelien Jarno <aurelien@aurel32.net>, Thomas Huth <thuth@redhat.com>, 
    =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
    Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, 
    Richard Henderson <rth@twiddle.net>, Fam Zheng <fam@euphon.net>, 
    "Daniel P . Berrange" <berrange@redhat.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH-for-6.0 v4 15/17] gitlab-ci: Add test for Xen (on CentOS
 7)
In-Reply-To: <20201127142407.GC2098@perard.uk.xensource.com>
Message-ID: <alpine.DEB.2.21.2011301326110.1100@sstabellini-ThinkPad-T480s>
References: <20201108204535.2319870-1-philmd@redhat.com> <20201108204535.2319870-16-philmd@redhat.com> <20201126173824.GB2098@perard.uk.xensource.com> <20201126174559.GP2271382@habkost.net> <20201127142407.GC2098@perard.uk.xensource.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 27 Nov 2020, Anthony PERARD wrote:
> On Thu, Nov 26, 2020 at 12:45:59PM -0500, Eduardo Habkost wrote:
> > On Thu, Nov 26, 2020 at 05:38:24PM +0000, Anthony PERARD wrote:
> > > Is `make check` going to do something useful with the Xen support? Or is
> > > it going to need more work in order to test the Xen support of QEMU?
> > > (Like starting an actual Xen guest.)
> > 
> > I don't think it will test Xen support, but we still want to at
> > least check if --enable-xen doesn't break anything else.
> 
> That sound good.
> 
> > Is there any public CI system anywhere where Xen support is
> > tested today?
> 
> Yes, we have osstest which regularly test Xen with QEMU from upstream.
> Result are sent to xen-devel. But that might not be very useful for
> qemu-devel.
> 
> We also have a GitLab CI which does some Xen tests, but I don't think
> QEMU is tested there.
> https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=automation/gitlab-ci/test.yaml;hb=HEAD
> https://gitlab.com/xen-project/xen/

QEMU (the version of QEMU picked by the Xen tools) is built but not used
in the Xen Project CI-loop yet.

I am extending the CI-loop with more tests [1], and I would like to have at
least one QEMU test at some point soon. Probably something based on Xen 9pfs.

[1] https://marc.info/?l=xen-devel&m=160627845825763 

