Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4242BFCB6
	for <lists+xen-devel@lfdr.de>; Sun, 22 Nov 2020 23:55:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.33538.64618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kgyFx-0001w7-Hn; Sun, 22 Nov 2020 22:54:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 33538.64618; Sun, 22 Nov 2020 22:54:53 +0000
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
	id 1kgyFx-0001vi-ER; Sun, 22 Nov 2020 22:54:53 +0000
Received: by outflank-mailman (input) for mailman id 33538;
 Sun, 22 Nov 2020 22:54:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TnN1=E4=telegraphics.com.au=fthain@srs-us1.protection.inumbo.net>)
 id 1kgyFv-0001vd-QP
 for xen-devel@lists.xenproject.org; Sun, 22 Nov 2020 22:54:51 +0000
Received: from kvm5.telegraphics.com.au (unknown [98.124.60.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id c37dab44-18c0-4949-8564-38411d5c7c86;
 Sun, 22 Nov 2020 22:54:51 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by kvm5.telegraphics.com.au (Postfix) with ESMTP id BF98E29DB3;
 Sun, 22 Nov 2020 17:54:47 -0500 (EST)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=TnN1=E4=telegraphics.com.au=fthain@srs-us1.protection.inumbo.net>)
	id 1kgyFv-0001vd-QP
	for xen-devel@lists.xenproject.org; Sun, 22 Nov 2020 22:54:51 +0000
X-Inumbo-ID: c37dab44-18c0-4949-8564-38411d5c7c86
Received: from kvm5.telegraphics.com.au (unknown [98.124.60.144])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id c37dab44-18c0-4949-8564-38411d5c7c86;
	Sun, 22 Nov 2020 22:54:51 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by kvm5.telegraphics.com.au (Postfix) with ESMTP id BF98E29DB3;
	Sun, 22 Nov 2020 17:54:47 -0500 (EST)
Date: Mon, 23 Nov 2020 09:54:48 +1100 (AEDT)
From: Finn Thain <fthain@telegraphics.com.au>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
cc: James Bottomley <James.Bottomley@hansenpartnership.com>, 
    Kees Cook <keescook@chromium.org>, Jakub Kicinski <kuba@kernel.org>, 
    "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
    linux-kernel <linux-kernel@vger.kernel.org>, alsa-devel@alsa-project.org, 
    amd-gfx@lists.freedesktop.org, bridge@lists.linux-foundation.org, 
    ceph-devel@vger.kernel.org, cluster-devel@redhat.com, 
    coreteam@netfilter.org, devel@driverdev.osuosl.org, dm-devel@redhat.com, 
    drbd-dev@lists.linbit.com, dri-devel@lists.freedesktop.org, 
    GR-everest-linux-l2@marvell.com, GR-Linux-NIC-Dev@marvell.com, 
    intel-gfx@lists.freedesktop.org, intel-wired-lan@lists.osuosl.org, 
    keyrings@vger.kernel.org, linux1394-devel@lists.sourceforge.net, 
    linux-acpi@vger.kernel.org, linux-afs@lists.infradead.org, 
    Linux ARM <linux-arm-kernel@lists.infradead.org>, 
    linux-arm-msm@vger.kernel.org, linux-atm-general@lists.sourceforge.net, 
    linux-block@vger.kernel.org, linux-can@vger.kernel.org, 
    linux-cifs@vger.kernel.org, 
    Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, 
    linux-decnet-user@lists.sourceforge.net, 
    Ext4 Developers List <linux-ext4@vger.kernel.org>, 
    linux-fbdev@vger.kernel.org, linux-geode@lists.infradead.org, 
    linux-gpio@vger.kernel.org, linux-hams@vger.kernel.org, 
    linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org, 
    linux-ide@vger.kernel.org, linux-iio@vger.kernel.org, 
    linux-input <linux-input@vger.kernel.org>, linux-integrity@vger.kernel.org, 
    linux-mediatek@lists.infradead.org, 
    Linux Media Mailing List <linux-media@vger.kernel.org>, 
    linux-mmc@vger.kernel.org, Linux-MM <linux-mm@kvack.org>, 
    linux-mtd@lists.infradead.org, linux-nfs@vger.kernel.org, 
    linux-rdma@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
    linux-scsi@vger.kernel.org, linux-sctp@vger.kernel.org, 
    linux-security-module@vger.kernel.org, 
    linux-stm32@st-md-mailman.stormreply.com, linux-usb@vger.kernel.org, 
    linux-watchdog@vger.kernel.org, 
    linux-wireless <linux-wireless@vger.kernel.org>, 
    Network Development <netdev@vger.kernel.org>, 
    netfilter-devel@vger.kernel.org, nouveau@lists.freedesktop.org, 
    op-tee@lists.trustedfirmware.org, oss-drivers@netronome.com, 
    patches@opensource.cirrus.com, rds-devel@oss.oracle.com, 
    reiserfs-devel@vger.kernel.org, samba-technical@lists.samba.org, 
    selinux@vger.kernel.org, target-devel@vger.kernel.org, 
    tipc-discussion@lists.sourceforge.net, 
    usb-storage@lists.one-eyed-alien.net, 
    virtualization@lists.linux-foundation.org, wcn36xx@lists.infradead.org, 
    "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, 
    xen-devel@lists.xenproject.org, linux-hardening@vger.kernel.org, 
    Nick Desaulniers <ndesaulniers@google.com>, 
    Nathan Chancellor <natechancellor@gmail.com>, 
    Miguel Ojeda <ojeda@kernel.org>, Joe Perches <joe@perches.com>
Subject: Re: [PATCH 000/141] Fix fall-through warnings for Clang
In-Reply-To: <CANiq72nZrHWTA4_Msg6MP9snTyenC6-eGfD27CyfNSu7QoVZbw@mail.gmail.com>
Message-ID: <alpine.LNX.2.23.453.2011230938390.7@nippy.intranet>
References: <cover.1605896059.git.gustavoars@kernel.org> <20201120105344.4345c14e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com> <202011201129.B13FDB3C@keescook> <20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com> <202011220816.8B6591A@keescook>
 <9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com> <CANiq72nZrHWTA4_Msg6MP9snTyenC6-eGfD27CyfNSu7QoVZbw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Sun, 22 Nov 2020, Miguel Ojeda wrote:

> 
> It isn't that much effort, isn't it? Plus we need to take into account 
> the future mistakes that it might prevent, too.

We should also take into account optimisim about future improvements in 
tooling.

> So even if there were zero problems found so far, it is still a positive 
> change.
> 

It is if you want to spin it that way.

> I would agree if these changes were high risk, though; but they are 
> almost trivial.
> 

This is trivial:

 case 1:
	this();
+	fallthrough;
 case 2:
 	that();

But what we inevitably get is changes like this:

 case 3:
        this();
+       break;
 case 4:
        hmmm();

Why? Mainly to silence the compiler. Also because the patch author argued 
successfully that they had found a theoretical bug, often in mature code.

But is anyone keeping score of the regressions? If unreported bugs count, 
what about unreported regressions?

> Cheers,
> Miguel
> 

