Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E4F27479E
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 19:41:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKmHW-0003Nc-Qe; Tue, 22 Sep 2020 17:40:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MP++=C7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kKmHV-0003M1-4T
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 17:40:45 +0000
X-Inumbo-ID: 8b49e4f6-4a2e-4ddf-abb1-e2209a734c32
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8b49e4f6-4a2e-4ddf-abb1-e2209a734c32;
 Tue, 22 Sep 2020 17:40:44 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4A39E20936;
 Tue, 22 Sep 2020 17:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600796443;
 bh=cZxd7YmYl83j6nvWCLMtvhsaIoSia+xi2NyCD6l6C5I=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=Qh6Wptjxwc3bb+oBbcv5RUUF/OlaF/FH9AYVpuJmC6yPZ2v5zwkYzmEIxkwpAjHcm
 vikTPigDRhWOWsaIxsNIJSo9AHtfpEQ8LxoLql9QalO+OoM12JsjUw8lOk5eU1EIwS
 T0x6Up5RTyzvvsBLxNMpA4hMv0+kPf5Ru8uS4yt4=
Date: Tue, 22 Sep 2020 10:40:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Jan Beulich <jbeulich@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, 
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 George Dunlap <George.Dunlap@eu.citrix.com>
Subject: Re: Ping: [PATCH 1/9] build: use if_changed more consistently (and
 correctly) for prelink*.o
In-Reply-To: <d7eb4dce-7f5f-d5de-3b6a-f136f4a7b3b5@xen.org>
Message-ID: <alpine.DEB.2.21.2009221040300.1495@sstabellini-ThinkPad-T480s>
References: <aabca463-21ed-3755-0e8d-908069f40d6e@suse.com>
 <75d94bf1-b419-8a82-2d15-fb02e56109d8@suse.com>
 <de999174-604d-5874-cf11-4fab15c583d4@suse.com>
 <43a4240c-baba-ca52-0a9f-a884c0f297be@xen.org>
 <f6de6cc3-7bde-6f99-1525-cc046a136a19@suse.com>
 <0a0ab7a6-e448-3ffe-3818-4b97edbffb72@xen.org>
 <070a7b89-28c7-a709-660e-97c3a8a93c94@suse.com>
 <d7eb4dce-7f5f-d5de-3b6a-f136f4a7b3b5@xen.org>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, 22 Sep 2020, Julien Grall wrote:
> Hi Jan,
> 
> On 22/09/2020 11:55, Jan Beulich wrote:
> > On 22.09.2020 11:24, Julien Grall wrote:
> > > On 22/09/2020 09:28, Jan Beulich wrote:
> > > > On 21.09.2020 13:39, Julien Grall wrote:
> > > > > On 21/09/2020 11:17, Jan Beulich wrote:
> > > > > > On 14.09.2020 12:15, Jan Beulich wrote:
> > > > > > > Switch to $(call if_changed,ld) where possible; presumably not
> > > > > > > doing so
> > > > > > > in e321576f4047 ("xen/build: start using if_changed") right away
> > > > > > > was an
> > > > > > > oversight, as it did for Arm in (just) one case. It failed to add
> > > > > > > prelink.o to $(targets), though, causing - judging from the
> > > > > > > observed
> > > > > > > behavior on x86 - undue rebuilds of the final binary (because of
> > > > > > > prelink.o getting rebuild for $(cmd_prelink.o) being empty, in
> > > > > > > turn
> > > > > > > because of .prelink.o.cmd not getting read) during "make
> > > > > > > install-xen".
> > > > > > > 
> > > > > > > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > > > > > > ---
> > > > > > >     xen/arch/arm/Makefile |  4 +++-
> > > > > > >     xen/arch/x86/Makefile | 18 ++++++++++--------
> > > > > > >     2 files changed, 13 insertions(+), 9 deletions(-)
> > > > > > 
> > > > > > May I ask for an Arm-side ack (or otherwise) here, please?
> > > > > 
> > > > > Acked-by: Julien Grall <jgrall@amazon.com>
> > > > 
> > > > Thanks. On the Arm side this is actually addressing a (minor) bug,
> > > 
> > > Just to confirm, the bug is: Xen will be rebuilt when it is not
> > > necessary, right?
> > 
> > Yes. When building as non-root but installing as root, this would
> > typically involve an owner change of some of the involved files.
> > That's how I did notice the issue on x86 (after switching to
> > if_changed) in the first place.
> 
> Thanks for the explanation. I think it would be fine to backport.
> @Stefano, what do you think?

I am OK with that

