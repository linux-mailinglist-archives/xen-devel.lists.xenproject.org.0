Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B842C33DE
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 23:25:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37027.69171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khgjP-0005GK-I9; Tue, 24 Nov 2020 22:24:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37027.69171; Tue, 24 Nov 2020 22:24:15 +0000
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
	id 1khgjP-0005Fy-F6; Tue, 24 Nov 2020 22:24:15 +0000
Received: by outflank-mailman (input) for mailman id 37027;
 Tue, 24 Nov 2020 22:24:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=53sX=E6=telegraphics.com.au=fthain@srs-us1.protection.inumbo.net>)
 id 1khgjO-0005Ft-Lw
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 22:24:14 +0000
Received: from kvm5.telegraphics.com.au (unknown [98.124.60.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 9b456be2-7f04-4efc-a6b2-430180eb9459;
 Tue, 24 Nov 2020 22:24:13 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by kvm5.telegraphics.com.au (Postfix) with ESMTP id 8A96E22AD6;
 Tue, 24 Nov 2020 17:24:09 -0500 (EST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=53sX=E6=telegraphics.com.au=fthain@srs-us1.protection.inumbo.net>)
	id 1khgjO-0005Ft-Lw
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 22:24:14 +0000
X-Inumbo-ID: 9b456be2-7f04-4efc-a6b2-430180eb9459
Received: from kvm5.telegraphics.com.au (unknown [98.124.60.144])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id 9b456be2-7f04-4efc-a6b2-430180eb9459;
	Tue, 24 Nov 2020 22:24:13 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by kvm5.telegraphics.com.au (Postfix) with ESMTP id 8A96E22AD6;
	Tue, 24 Nov 2020 17:24:09 -0500 (EST)
Date: Wed, 25 Nov 2020 09:24:08 +1100 (AEDT)
From: Finn Thain <fthain@telegraphics.com.au>
To: Kees Cook <keescook@chromium.org>
cc: James Bottomley <James.Bottomley@HansenPartnership.com>, 
    "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
    Joe Perches <joe@perches.com>, Jakub Kicinski <kuba@kernel.org>, 
    alsa-devel@alsa-project.org, linux-atm-general@lists.sourceforge.net, 
    reiserfs-devel@vger.kernel.org, linux-iio@vger.kernel.org, 
    linux-wireless@vger.kernel.org, linux-fbdev@vger.kernel.org, 
    dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
    Nathan Chancellor <natechancellor@gmail.com>, linux-ide@vger.kernel.org, 
    dm-devel@redhat.com, keyrings@vger.kernel.org, 
    linux-mtd@lists.infradead.org, GR-everest-linux-l2@marvell.com, 
    wcn36xx@lists.infradead.org, samba-technical@lists.samba.org, 
    linux-i3c@lists.infradead.org, linux1394-devel@lists.sourceforge.net, 
    linux-afs@lists.infradead.org, usb-storage@lists.one-eyed-alien.net, 
    drbd-dev@lists.linbit.com, devel@driverdev.osuosl.org, 
    linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com, 
    Nick Desaulniers <ndesaulniers@google.com>, linux-scsi@vger.kernel.org, 
    linux-rdma@vger.kernel.org, oss-drivers@netronome.com, 
    bridge@lists.linux-foundation.org, linux-security-module@vger.kernel.org, 
    amd-gfx@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
    cluster-devel@redhat.com, linux-acpi@vger.kernel.org, 
    coreteam@netfilter.org, intel-wired-lan@lists.osuosl.org, 
    linux-input@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
    tipc-discussion@lists.sourceforge.net, linux-ext4@vger.kernel.org, 
    linux-media@vger.kernel.org, linux-watchdog@vger.kernel.org, 
    selinux@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
    intel-gfx@lists.freedesktop.org, linux-geode@lists.infradead.org, 
    linux-can@vger.kernel.org, linux-block@vger.kernel.org, 
    linux-gpio@vger.kernel.org, op-tee@lists.trustedfirmware.org, 
    linux-mediatek@lists.infradead.org, xen-devel@lists.xenproject.org, 
    nouveau@lists.freedesktop.org, linux-hams@vger.kernel.org, 
    ceph-devel@vger.kernel.org, virtualization@lists.linux-foundation.org, 
    linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org, 
    x86@kernel.org, linux-nfs@vger.kernel.org, GR-Linux-NIC-Dev@marvell.com, 
    linux-mm@kvack.org, netdev@vger.kernel.org, 
    linux-decnet-user@lists.sourceforge.net, linux-mmc@vger.kernel.org, 
    linux-renesas-soc@vger.kernel.org, linux-sctp@vger.kernel.org, 
    linux-usb@vger.kernel.org, netfilter-devel@vger.kernel.org, 
    linux-crypto@vger.kernel.org, patches@opensource.cirrus.com, 
    linux-integrity@vger.kernel.org, target-devel@vger.kernel.org, 
    linux-hardening@vger.kernel.org, 
    Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
    Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [Intel-wired-lan] [PATCH 000/141] Fix fall-through warnings for
 Clang
In-Reply-To: <202011241327.BB28F12F6@keescook>
Message-ID: <alpine.LNX.2.23.453.2011250859290.15@nippy.intranet>
References: <202011201129.B13FDB3C@keescook> <20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com> <202011220816.8B6591A@keescook> <9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com> <ca071decb87cc7e905411423c05a48f9fd2f58d7.camel@perches.com>
 <0147972a72bc13f3629de8a32dee6f1f308994b5.camel@HansenPartnership.com> <d8d1e9add08cdd4158405e77762d4946037208f8.camel@perches.com> <dbd2cb703ed9eefa7dde9281ea26ab0f7acc8afe.camel@HansenPartnership.com> <20201123130348.GA3119@embeddedor>
 <8f5611bb015e044fa1c0a48147293923c2d904e4.camel@HansenPartnership.com> <202011241327.BB28F12F6@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 24 Nov 2020, Kees Cook wrote:

> On Mon, Nov 23, 2020 at 08:31:30AM -0800, James Bottomley wrote:
> > Really, no ... something which produces no improvement has no value at 
> > all ... we really shouldn't be wasting maintainer time with it because 
> > it has a cost to merge.  I'm not sure we understand where the balance 
> > lies in value vs cost to merge but I am confident in the zero value 
> > case.
> 
> What? We can't measure how many future bugs aren't introduced because 
> the kernel requires explicit case flow-control statements for all new 
> code.
> 

These statements are not "missing" unless you presume that code written 
before the latest de facto language spec was written should somehow be 
held to that spec.

If the 'fallthrough' statement is not part of the latest draft spec then 
we should ask why not before we embrace it. Being that the kernel still 
prefers -std=gnu89 you might want to consider what has prevented 
-std=gnu99 or -std=gnu2x etc.

> We already enable -Wimplicit-fallthrough globally, so that's not the 
> discussion. The issue is that Clang is (correctly) even more strict than 
> GCC for this, so these are the remaining ones to fix for full Clang 
> coverage too.
> 

Seems to me you should be patching the compiler.

When you have consensus among the language lawyers you'll have more 
credibility with those being subjected to enforcement.

