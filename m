Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 389D52C1052
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 17:32:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34843.66091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khEkk-0007cS-4N; Mon, 23 Nov 2020 16:31:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34843.66091; Mon, 23 Nov 2020 16:31:46 +0000
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
	id 1khEkk-0007c2-0S; Mon, 23 Nov 2020 16:31:46 +0000
Received: by outflank-mailman (input) for mailman id 34843;
 Mon, 23 Nov 2020 16:31:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6H7V=E5=hansenpartnership.com=james.bottomley@srs-us1.protection.inumbo.net>)
 id 1khEki-0007bx-9X
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 16:31:44 +0000
Received: from bedivere.hansenpartnership.com (unknown [2607:fcd0:100:8a00::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 00706bbb-d52e-4f7c-a3a8-1c6873558f91;
 Mon, 23 Nov 2020 16:31:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by bedivere.hansenpartnership.com (Postfix) with ESMTP id 7EDBD12808F6;
 Mon, 23 Nov 2020 08:31:35 -0800 (PST)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id S05__PC1UR2d; Mon, 23 Nov 2020 08:31:35 -0800 (PST)
Received: from jarvis.int.hansenpartnership.com (unknown
 [IPv6:2601:600:8280:66d1::527])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 9FAA112808A8;
 Mon, 23 Nov 2020 08:31:31 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=6H7V=E5=hansenpartnership.com=james.bottomley@srs-us1.protection.inumbo.net>)
	id 1khEki-0007bx-9X
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 16:31:44 +0000
X-Inumbo-ID: 00706bbb-d52e-4f7c-a3a8-1c6873558f91
Received: from bedivere.hansenpartnership.com (unknown [2607:fcd0:100:8a00::2])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 00706bbb-d52e-4f7c-a3a8-1c6873558f91;
	Mon, 23 Nov 2020 16:31:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 7EDBD12808F6;
	Mon, 23 Nov 2020 08:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1606149095;
	bh=+IhPqZ/v6VfDyyXzj4lMu9axEsbedJZyqBpFfwsfG+g=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=taYTQdLWt1uKXwIt/3Ve/mEupTdq+Wcpdv+UXp5WQMTWxY34l98m0qHLcdAiwuo2t
	 gwBg46qri78QHRql74q8THMzP+7WPx9XqttvrPch20gBcYUMT4pLXQarcLhIoin1Gp
	 Z+ziweydBKwdaV8ZmrW12X55c5G6vUR8Kiznotik=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S05__PC1UR2d; Mon, 23 Nov 2020 08:31:35 -0800 (PST)
Received: from jarvis.int.hansenpartnership.com (unknown [IPv6:2601:600:8280:66d1::527])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 9FAA112808A8;
	Mon, 23 Nov 2020 08:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1606149095;
	bh=+IhPqZ/v6VfDyyXzj4lMu9axEsbedJZyqBpFfwsfG+g=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=taYTQdLWt1uKXwIt/3Ve/mEupTdq+Wcpdv+UXp5WQMTWxY34l98m0qHLcdAiwuo2t
	 gwBg46qri78QHRql74q8THMzP+7WPx9XqttvrPch20gBcYUMT4pLXQarcLhIoin1Gp
	 Z+ziweydBKwdaV8ZmrW12X55c5G6vUR8Kiznotik=
Message-ID: <8f5611bb015e044fa1c0a48147293923c2d904e4.camel@HansenPartnership.com>
Subject: Re: [Intel-wired-lan] [PATCH 000/141] Fix fall-through warnings for
 Clang
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Joe Perches <joe@perches.com>, Kees Cook <keescook@chromium.org>, Jakub
 Kicinski <kuba@kernel.org>, alsa-devel@alsa-project.org,
 linux-atm-general@lists.sourceforge.net,  reiserfs-devel@vger.kernel.org,
 linux-iio@vger.kernel.org,  linux-wireless@vger.kernel.org,
 linux-fbdev@vger.kernel.org,  dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Nathan Chancellor <natechancellor@gmail.com>,
 linux-ide@vger.kernel.org, dm-devel@redhat.com,  keyrings@vger.kernel.org,
 linux-mtd@lists.infradead.org,  GR-everest-linux-l2@marvell.com,
 wcn36xx@lists.infradead.org,  samba-technical@lists.samba.org,
 linux-i3c@lists.infradead.org,  linux1394-devel@lists.sourceforge.net,
 linux-afs@lists.infradead.org,  usb-storage@lists.one-eyed-alien.net,
 drbd-dev@lists.linbit.com,  devel@driverdev.osuosl.org,
 linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com,  Nick Desaulniers
 <ndesaulniers@google.com>, linux-scsi@vger.kernel.org,
 linux-rdma@vger.kernel.org,  oss-drivers@netronome.com,
 bridge@lists.linux-foundation.org,  linux-security-module@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,  linux-stm32@st-md-mailman.stormreply.com,
 cluster-devel@redhat.com,  linux-acpi@vger.kernel.org,
 coreteam@netfilter.org,  intel-wired-lan@lists.osuosl.org,
 linux-input@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 tipc-discussion@lists.sourceforge.net,  linux-ext4@vger.kernel.org,
 linux-media@vger.kernel.org,  linux-watchdog@vger.kernel.org,
 selinux@vger.kernel.org,  linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org,  linux-geode@lists.infradead.org,
 linux-can@vger.kernel.org,  linux-block@vger.kernel.org,
 linux-gpio@vger.kernel.org,  op-tee@lists.trustedfirmware.org,
 linux-mediatek@lists.infradead.org,  xen-devel@lists.xenproject.org,
 nouveau@lists.freedesktop.org,  linux-hams@vger.kernel.org,
 ceph-devel@vger.kernel.org,  virtualization@lists.linux-foundation.org, 
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org, 
 x86@kernel.org, linux-nfs@vger.kernel.org, GR-Linux-NIC-Dev@marvell.com, 
 linux-mm@kvack.org, netdev@vger.kernel.org, 
 linux-decnet-user@lists.sourceforge.net, linux-mmc@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-sctp@vger.kernel.org, 
 linux-usb@vger.kernel.org, netfilter-devel@vger.kernel.org, 
 linux-crypto@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-integrity@vger.kernel.org, target-devel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>,  Greg KH <gregkh@linuxfoundation.org>
Date: Mon, 23 Nov 2020 08:31:30 -0800
In-Reply-To: <20201123130348.GA3119@embeddedor>
References: <cover.1605896059.git.gustavoars@kernel.org>
	 <20201120105344.4345c14e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
	 <202011201129.B13FDB3C@keescook>
	 <20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
	 <202011220816.8B6591A@keescook>
	 <9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com>
	 <ca071decb87cc7e905411423c05a48f9fd2f58d7.camel@perches.com>
	 <0147972a72bc13f3629de8a32dee6f1f308994b5.camel@HansenPartnership.com>
	 <d8d1e9add08cdd4158405e77762d4946037208f8.camel@perches.com>
	 <dbd2cb703ed9eefa7dde9281ea26ab0f7acc8afe.camel@HansenPartnership.com>
	 <20201123130348.GA3119@embeddedor>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Mon, 2020-11-23 at 07:03 -0600, Gustavo A. R. Silva wrote:
> On Sun, Nov 22, 2020 at 11:53:55AM -0800, James Bottomley wrote:
> > On Sun, 2020-11-22 at 11:22 -0800, Joe Perches wrote:
> > > On Sun, 2020-11-22 at 11:12 -0800, James Bottomley wrote:
> > > > On Sun, 2020-11-22 at 10:25 -0800, Joe Perches wrote:
> > > > > On Sun, 2020-11-22 at 10:21 -0800, James Bottomley wrote:
> > > > > > Please tell me our reward for all this effort isn't a
> > > > > > single missing error print.
> > > > > 
> > > > > There were quite literally dozens of logical defects found
> > > > > by the fallthrough additions.  Very few were logging only.
> > > > 
> > > > So can you give us the best examples (or indeed all of them if
> > > > someone is keeping score)?  hopefully this isn't a US election
> > > > situation ...
> > > 
> > > Gustavo?  Are you running for congress now?
> > > 
> > > https://lwn.net/Articles/794944/
> > 
> > That's 21 reported fixes of which about 50% seem to produce no
> > change in code behaviour at all, a quarter seem to have no user
> > visible effect with the remaining quarter producing unexpected
> > errors on obscure configuration parameters, which is why no-one
> > really noticed them before.
> 
> The really important point here is the number of bugs this has
> prevented and will prevent in the future. See an example of this,
> below:
> 
> https://lore.kernel.org/linux-iio/20190813135802.GB27392@kroah.com/

I think this falls into the same category as the other six bugs: it
changes the output/input for parameters but no-one has really noticed,
usually because the command is obscure or the bias effect is minor.

> This work is still relevant, even if the total number of issues/bugs
> we find in the process is zero (which is not the case).

Really, no ... something which produces no improvement has no value at
all ... we really shouldn't be wasting maintainer time with it because
it has a cost to merge.  I'm not sure we understand where the balance
lies in value vs cost to merge but I am confident in the zero value
case.

> "The sucky thing about doing hard work to deploy hardening is that
> the result is totally invisible by definition (things not happening)
> [..]"
> - Dmitry Vyukov

Really, no.  Something that can't be measured at all doesn't exist.

And actually hardening is one of those things you can measure (which I
do have to admit isn't true for everything in the security space) ...
it's number of exploitable bugs found before you did it vs number of
exploitable bugs found after you did it.  Usually hardening eliminates
a class of bug, so the way I've measured hardening before is to go
through the CVE list for the last couple of years for product X, find
all the bugs that are of the class we're looking to eliminate and say
if we had hardened X against this class of bug we'd have eliminated Y%
of the exploits.  It can be quite impressive if Y is a suitably big
number.

James



