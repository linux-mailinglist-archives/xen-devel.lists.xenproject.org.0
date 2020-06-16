Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 365731FBFD7
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 22:16:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlI0L-00038F-Ps; Tue, 16 Jun 2020 20:16:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S/rR=75=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jlI0K-00037i-KU
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 20:16:20 +0000
X-Inumbo-ID: 3c966126-b00e-11ea-b94a-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3c966126-b00e-11ea-b94a-12813bfff9fa;
 Tue, 16 Jun 2020 20:16:18 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 49490208B3;
 Tue, 16 Jun 2020 20:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592338577;
 bh=zmH4JSlt9cywnDKhObbKR2vrK/IfOElB1ppkvvzcKQc=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=DevMpiVp3dhXuh4jWdE29eCx3s5S5AfgXWRF15GTHzv9m/Cos65TMlLCbSH3scoLF
 ohpQwG36Bn/XbnWesFSNEt6ubG6Bc24dBAeAO26J5zJjcqqANjWE/OzTFxzmpsfjEs
 vTOOrWAp/obMezn+jN/dt1mQKZ0SqFo1E4p3/YqE=
Date: Tue, 16 Jun 2020 13:16:10 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Subject: Re: [RFC XEN PATCH 00/23] xen: beginning support for RISC-V
In-Reply-To: <20200616035100.GA19383@piano>
Message-ID: <alpine.DEB.2.21.2006161315200.24982@sstabellini-ThinkPad-T480s>
References: <cover.1579615303.git.bobbyeshleman@gmail.com>
 <alpine.DEB.2.21.2006151802470.9074@sstabellini-ThinkPad-T480s>
 <f1bff09cf101b185efe7c2f7d53d64b0aeee84a2.camel@wdc.com>
 <20200616035100.GA19383@piano>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "dan@dlrobertson.com" <dan@dlrobertson.com>,
 "julien@xen.org" <julien@xen.org>, "wl@xen.org" <wl@xen.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "bobby.eshleman@starlab.io" <bobby.eshleman@starlab.io>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, 15 Jun 2020, Bobby Eshleman wrote:
> On Tue, Jun 16, 2020 at 01:10:17AM +0000, Alistair Francis wrote:
> > On Mon, 2020-06-15 at 18:03 -0700, Stefano Stabellini wrote:
> > > Any updates? I am looking forward to this :-)
> > 
> 
> It has been on a slow burn since I became a new dad (shortly after the RFC).
> I've gradually regained free time, and so I've been able to change that
> slow burn to a moderate burn in the last couple weeks.
> 
> Most of my progress has been around build environment improvements.  I've done
> some work stripping it down to the bare minimum required to build a new arch
> and rooting the commit history from there, and some work with incorporating it
> into the gitlab CI, containerizing the build and QEMU run, etc...
> 
> As far as hypervisor status:  I'm just about done with incorporating the boot
> module FDT parsing code, extracting kernel info and ram regions
> (taken/generalized from arch/arm), plus implementing the arch-specific pieces
> of domain_create().
> 
> On the verge of being able to dive into a guest kernel and see what breaks
> first :)
> 
> I'm expected to commit an extra day or two per week in the next month or so at
> Vates, so this will considerably bump up my cadence in comparison to the last
> few months.

Great to hear and congratulations! I'll stay tuned. Next time I'll try
to rebuild and run your series on QEMU, I might ask you for some help
with the setup.


> > FYI, I would like to talk more about RISC-V Xen at the Xen Virtual
> > summit. I'll put it forward as a BoF subject.
> > 
> > I haven't worked on this, although the RISC-V Hypervisor spec is
> > progressing towards ratification.
> > 
> > Alistair
> > 
> 
> That would be great :)

Indeed!

