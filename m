Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F77A2BC867
	for <lists+xen-devel@lfdr.de>; Sun, 22 Nov 2020 20:13:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.33452.64487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kgumx-0008Jq-I6; Sun, 22 Nov 2020 19:12:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 33452.64487; Sun, 22 Nov 2020 19:12:43 +0000
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
	id 1kgumx-0008JQ-E1; Sun, 22 Nov 2020 19:12:43 +0000
Received: by outflank-mailman (input) for mailman id 33452;
 Sun, 22 Nov 2020 19:12:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=08CP=E4=hansenpartnership.com=james.bottomley@srs-us1.protection.inumbo.net>)
 id 1kgumv-0008JL-Tf
 for xen-devel@lists.xenproject.org; Sun, 22 Nov 2020 19:12:41 +0000
Received: from bedivere.hansenpartnership.com (unknown [96.44.175.130])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f673d10d-689f-4e95-8b82-0ce987f19af3;
 Sun, 22 Nov 2020 19:12:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by bedivere.hansenpartnership.com (Postfix) with ESMTP id 96EF41280181;
 Sun, 22 Nov 2020 11:12:34 -0800 (PST)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id T_J7YGNeXPBb; Sun, 22 Nov 2020 11:12:34 -0800 (PST)
Received: from jarvis.int.hansenpartnership.com (unknown
 [IPv6:2601:600:8280:66d1::527])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id D7CFF128010B;
 Sun, 22 Nov 2020 11:12:30 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=08CP=E4=hansenpartnership.com=james.bottomley@srs-us1.protection.inumbo.net>)
	id 1kgumv-0008JL-Tf
	for xen-devel@lists.xenproject.org; Sun, 22 Nov 2020 19:12:41 +0000
X-Inumbo-ID: f673d10d-689f-4e95-8b82-0ce987f19af3
Received: from bedivere.hansenpartnership.com (unknown [96.44.175.130])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f673d10d-689f-4e95-8b82-0ce987f19af3;
	Sun, 22 Nov 2020 19:12:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 96EF41280181;
	Sun, 22 Nov 2020 11:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1606072354;
	bh=RkMkP78xnGMXpQYwW6B64FZnxQgTZZOXvlSf0xxLQvs=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=cqs+SSmhVi1ZEA6KYpGlCOCKLLv9H3tmiNoTpcFF7F+1vb1QgbekNgnLlgvfKOfrE
	 OZFKROCwJ+4Dh9AKsWr2ZhTbG6lfWTbk5QBrrreOMOUbINEmr9+ncDNzytUg1VYukU
	 VtKrfA4fWPJSjG94bNM6AxKG7W4waC4yzJNdPcng=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T_J7YGNeXPBb; Sun, 22 Nov 2020 11:12:34 -0800 (PST)
Received: from jarvis.int.hansenpartnership.com (unknown [IPv6:2601:600:8280:66d1::527])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id D7CFF128010B;
	Sun, 22 Nov 2020 11:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1606072354;
	bh=RkMkP78xnGMXpQYwW6B64FZnxQgTZZOXvlSf0xxLQvs=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=cqs+SSmhVi1ZEA6KYpGlCOCKLLv9H3tmiNoTpcFF7F+1vb1QgbekNgnLlgvfKOfrE
	 OZFKROCwJ+4Dh9AKsWr2ZhTbG6lfWTbk5QBrrreOMOUbINEmr9+ncDNzytUg1VYukU
	 VtKrfA4fWPJSjG94bNM6AxKG7W4waC4yzJNdPcng=
Message-ID: <0147972a72bc13f3629de8a32dee6f1f308994b5.camel@HansenPartnership.com>
Subject: Re: [PATCH 000/141] Fix fall-through warnings for Clang
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Joe Perches <joe@perches.com>, Kees Cook <keescook@chromium.org>, Jakub
	Kicinski <kuba@kernel.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, 
 amd-gfx@lists.freedesktop.org, bridge@lists.linux-foundation.org, 
 ceph-devel@vger.kernel.org, cluster-devel@redhat.com,
 coreteam@netfilter.org,  devel@driverdev.osuosl.org, dm-devel@redhat.com,
 drbd-dev@lists.linbit.com,  dri-devel@lists.freedesktop.org,
 GR-everest-linux-l2@marvell.com,  GR-Linux-NIC-Dev@marvell.com,
 intel-gfx@lists.freedesktop.org,  intel-wired-lan@lists.osuosl.org,
 keyrings@vger.kernel.org,  linux1394-devel@lists.sourceforge.net,
 linux-acpi@vger.kernel.org,  linux-afs@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,  linux-arm-msm@vger.kernel.org,
 linux-atm-general@lists.sourceforge.net,  linux-block@vger.kernel.org,
 linux-can@vger.kernel.org,  linux-cifs@vger.kernel.org,
 linux-crypto@vger.kernel.org,  linux-decnet-user@lists.sourceforge.net,
 linux-ext4@vger.kernel.org,  linux-fbdev@vger.kernel.org,
 linux-geode@lists.infradead.org,  linux-gpio@vger.kernel.org,
 linux-hams@vger.kernel.org,  linux-hwmon@vger.kernel.org,
 linux-i3c@lists.infradead.org,  linux-ide@vger.kernel.org,
 linux-iio@vger.kernel.org,  linux-input@vger.kernel.org,
 linux-integrity@vger.kernel.org,  linux-mediatek@lists.infradead.org,
 linux-media@vger.kernel.org,  linux-mmc@vger.kernel.org,
 linux-mm@kvack.org, linux-mtd@lists.infradead.org, 
 linux-nfs@vger.kernel.org, linux-rdma@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-sctp@vger.kernel.org, linux-security-module@vger.kernel.org, 
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
 linux-hardening@vger.kernel.org,  Nick Desaulniers
 <ndesaulniers@google.com>, Nathan Chancellor <natechancellor@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>
Date: Sun, 22 Nov 2020 11:12:30 -0800
In-Reply-To: <ca071decb87cc7e905411423c05a48f9fd2f58d7.camel@perches.com>
References: <cover.1605896059.git.gustavoars@kernel.org>
	 <20201120105344.4345c14e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
	 <202011201129.B13FDB3C@keescook>
	 <20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
	 <202011220816.8B6591A@keescook>
	 <9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com>
	 <ca071decb87cc7e905411423c05a48f9fd2f58d7.camel@perches.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Sun, 2020-11-22 at 10:25 -0800, Joe Perches wrote:
> On Sun, 2020-11-22 at 10:21 -0800, James Bottomley wrote:
> > Please tell me our reward for all this effort isn't a single
> > missing error print.
> 
> There were quite literally dozens of logical defects found
> by the fallthrough additions.  Very few were logging only.

So can you give us the best examples (or indeed all of them if someone
is keeping score)?  hopefully this isn't a US election situation ...

James



