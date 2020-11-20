Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4320C2BB5ED
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 20:52:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.32636.63736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kgCRj-00080i-N2; Fri, 20 Nov 2020 19:51:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 32636.63736; Fri, 20 Nov 2020 19:51:51 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kgCRj-00080J-Jg; Fri, 20 Nov 2020 19:51:51 +0000
Received: by outflank-mailman (input) for mailman id 32636;
 Fri, 20 Nov 2020 19:51:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/9wm=E2=kernel.org=kuba@srs-us1.protection.inumbo.net>)
 id 1kgCRi-00080E-0T
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 19:51:50 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7b6c91e0-2be2-4f81-8acb-1de3e6c07031;
 Fri, 20 Nov 2020 19:51:49 +0000 (UTC)
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown
 [163.114.132.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ADA4D206B6;
 Fri, 20 Nov 2020 19:51:43 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=/9wm=E2=kernel.org=kuba@srs-us1.protection.inumbo.net>)
	id 1kgCRi-00080E-0T
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 19:51:50 +0000
X-Inumbo-ID: 7b6c91e0-2be2-4f81-8acb-1de3e6c07031
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 7b6c91e0-2be2-4f81-8acb-1de3e6c07031;
	Fri, 20 Nov 2020 19:51:49 +0000 (UTC)
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown [163.114.132.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id ADA4D206B6;
	Fri, 20 Nov 2020 19:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1605901908;
	bh=RBzOhaxiAPO90htsWQNreeN48VhmFALIIs8F+S8F2tg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=0HJ898xky9A4AiX47c8E/kv2vloKTCLDsa1B08r0Ns0UI6ViLC8sEEmzvLmSWmHDR
	 rh+QM7asV5JMfRqDaW/zMVHUMAG8pWVLOHT3LXTHM6aAp9QNwMcpVcVlrfF8wRUqJ9
	 pWgdeTKSVxQ+8c5KHivLBQCp2OjpIRpNZteZuQdk=
Date: Fri, 20 Nov 2020 11:51:42 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 amd-gfx@lists.freedesktop.org, bridge@lists.linux-foundation.org,
 ceph-devel@vger.kernel.org, cluster-devel@redhat.com,
 coreteam@netfilter.org, devel@driverdev.osuosl.org, dm-devel@redhat.com,
 drbd-dev@lists.linbit.com, dri-devel@lists.freedesktop.org,
 GR-everest-linux-l2@marvell.com, GR-Linux-NIC-Dev@marvell.com,
 intel-gfx@lists.freedesktop.org, intel-wired-lan@lists.osuosl.org,
 keyrings@vger.kernel.org, linux1394-devel@lists.sourceforge.net,
 linux-acpi@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-atm-general@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-can@vger.kernel.org, linux-cifs@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-decnet-user@lists.sourceforge.net,
 linux-ext4@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-geode@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-hams@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-i3c@lists.infradead.org, linux-ide@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-integrity@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-media@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mm@kvack.org,
 linux-mtd@lists.infradead.org, linux-nfs@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-sctp@vger.kernel.org,
 linux-security-module@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-usb@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, netfilter-devel@vger.kernel.org,
 nouveau@lists.freedesktop.org, op-tee@lists.trustedfirmware.org,
 oss-drivers@netronome.com, patches@opensource.cirrus.com,
 rds-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org,
 samba-technical@lists.samba.org, selinux@vger.kernel.org,
 target-devel@vger.kernel.org, tipc-discussion@lists.sourceforge.net,
 usb-storage@lists.one-eyed-alien.net,
 virtualization@lists.linux-foundation.org, wcn36xx@lists.infradead.org,
 x86@kernel.org, xen-devel@lists.xenproject.org,
 linux-hardening@vger.kernel.org, Nick Desaulniers
 <ndesaulniers@google.com>, Nathan Chancellor <natechancellor@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, Joe Perches <joe@perches.com>
Subject: Re: [PATCH 000/141] Fix fall-through warnings for Clang
Message-ID: <20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <202011201129.B13FDB3C@keescook>
References: <cover.1605896059.git.gustavoars@kernel.org>
	<20201120105344.4345c14e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
	<202011201129.B13FDB3C@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 20 Nov 2020 11:30:40 -0800 Kees Cook wrote:
> On Fri, Nov 20, 2020 at 10:53:44AM -0800, Jakub Kicinski wrote:
> > On Fri, 20 Nov 2020 12:21:39 -0600 Gustavo A. R. Silva wrote:  
> > > This series aims to fix almost all remaining fall-through warnings in
> > > order to enable -Wimplicit-fallthrough for Clang.
> > > 
> > > In preparation to enable -Wimplicit-fallthrough for Clang, explicitly
> > > add multiple break/goto/return/fallthrough statements instead of just
> > > letting the code fall through to the next case.
> > > 
> > > Notice that in order to enable -Wimplicit-fallthrough for Clang, this
> > > change[1] is meant to be reverted at some point. So, this patch helps
> > > to move in that direction.
> > > 
> > > Something important to mention is that there is currently a discrepancy
> > > between GCC and Clang when dealing with switch fall-through to empty case
> > > statements or to cases that only contain a break/continue/return
> > > statement[2][3][4].  
> > 
> > Are we sure we want to make this change? Was it discussed before?
> > 
> > Are there any bugs Clangs puritanical definition of fallthrough helped
> > find?
> > 
> > IMVHO compiler warnings are supposed to warn about issues that could
> > be bugs. Falling through to default: break; can hardly be a bug?!  
> 
> It's certainly a place where the intent is not always clear. I think
> this makes all the cases unambiguous, and doesn't impact the machine
> code, since the compiler will happily optimize away any behavioral
> redundancy.

If none of the 140 patches here fix a real bug, and there is no change
to machine code then it sounds to me like a W=2 kind of a warning.

I think clang is just being annoying here, but if I'm the only one who
feels this way chances are I'm wrong :)

