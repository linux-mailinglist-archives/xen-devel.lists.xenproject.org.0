Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F351D2C34FF
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 00:53:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37061.69220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khi7c-0004ul-69; Tue, 24 Nov 2020 23:53:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37061.69220; Tue, 24 Nov 2020 23:53:20 +0000
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
	id 1khi7c-0004uM-38; Tue, 24 Nov 2020 23:53:20 +0000
Received: by outflank-mailman (input) for mailman id 37061;
 Tue, 24 Nov 2020 23:53:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=53sX=E6=telegraphics.com.au=fthain@srs-us1.protection.inumbo.net>)
 id 1khi7a-0004uH-4G
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 23:53:18 +0000
Received: from kvm5.telegraphics.com.au (unknown [98.124.60.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id e9e2c15f-b7b9-4fc6-8ba8-46c09caa7b9a;
 Tue, 24 Nov 2020 23:53:17 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by kvm5.telegraphics.com.au (Postfix) with ESMTP id DCBBC2AA63;
 Tue, 24 Nov 2020 18:53:13 -0500 (EST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=53sX=E6=telegraphics.com.au=fthain@srs-us1.protection.inumbo.net>)
	id 1khi7a-0004uH-4G
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 23:53:18 +0000
X-Inumbo-ID: e9e2c15f-b7b9-4fc6-8ba8-46c09caa7b9a
Received: from kvm5.telegraphics.com.au (unknown [98.124.60.144])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id e9e2c15f-b7b9-4fc6-8ba8-46c09caa7b9a;
	Tue, 24 Nov 2020 23:53:17 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by kvm5.telegraphics.com.au (Postfix) with ESMTP id DCBBC2AA63;
	Tue, 24 Nov 2020 18:53:13 -0500 (EST)
Date: Wed, 25 Nov 2020 10:53:13 +1100 (AEDT)
From: Finn Thain <fthain@telegraphics.com.au>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
cc: Kees Cook <keescook@chromium.org>, 
    James Bottomley <James.Bottomley@hansenpartnership.com>, 
    "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
    Joe Perches <joe@perches.com>, Jakub Kicinski <kuba@kernel.org>, 
    alsa-devel@alsa-project.org, linux-atm-general@lists.sourceforge.net, 
    reiserfs-devel@vger.kernel.org, linux-iio@vger.kernel.org, 
    linux-wireless <linux-wireless@vger.kernel.org>, 
    linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
    linux-kernel <linux-kernel@vger.kernel.org>, 
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
    linux-input <linux-input@vger.kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
    tipc-discussion@lists.sourceforge.net, 
    Ext4 Developers List <linux-ext4@vger.kernel.org>, 
    Linux Media Mailing List <linux-media@vger.kernel.org>, 
    linux-watchdog@vger.kernel.org, selinux@vger.kernel.org, 
    linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
    linux-geode@lists.infradead.org, linux-can@vger.kernel.org, 
    linux-block@vger.kernel.org, linux-gpio@vger.kernel.org, 
    op-tee@lists.trustedfirmware.org, linux-mediatek@lists.infradead.org, 
    xen-devel@lists.xenproject.org, nouveau@lists.freedesktop.org, 
    linux-hams@vger.kernel.org, ceph-devel@vger.kernel.org, 
    virtualization@lists.linux-foundation.org, 
    Linux ARM <linux-arm-kernel@lists.infradead.org>, 
    linux-hwmon@vger.kernel.org, 
    "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, 
    linux-nfs@vger.kernel.org, GR-Linux-NIC-Dev@marvell.com, 
    Linux-MM <linux-mm@kvack.org>, 
    Network Development <netdev@vger.kernel.org>, 
    linux-decnet-user@lists.sourceforge.net, linux-mmc@vger.kernel.org, 
    linux-renesas-soc@vger.kernel.org, linux-sctp@vger.kernel.org, 
    linux-usb@vger.kernel.org, netfilter-devel@vger.kernel.org, 
    Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, 
    patches@opensource.cirrus.com, linux-integrity@vger.kernel.org, 
    target-devel@vger.kernel.org, linux-hardening@vger.kernel.org, 
    Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
    Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [Intel-wired-lan] [PATCH 000/141] Fix fall-through warnings for
 Clang
In-Reply-To: <CANiq72nUt57u5DG9rH=DB0DzQH7U6-QbG-2Ou+PyCY=p=_Ggag@mail.gmail.com>
Message-ID: <alpine.LNX.2.23.453.2011251022550.14@nippy.intranet>
References: <202011201129.B13FDB3C@keescook> <20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com> <202011220816.8B6591A@keescook> <9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com> <ca071decb87cc7e905411423c05a48f9fd2f58d7.camel@perches.com>
 <0147972a72bc13f3629de8a32dee6f1f308994b5.camel@HansenPartnership.com> <d8d1e9add08cdd4158405e77762d4946037208f8.camel@perches.com> <dbd2cb703ed9eefa7dde9281ea26ab0f7acc8afe.camel@HansenPartnership.com> <20201123130348.GA3119@embeddedor>
 <8f5611bb015e044fa1c0a48147293923c2d904e4.camel@HansenPartnership.com> <202011241327.BB28F12F6@keescook> <alpine.LNX.2.23.453.2011250859290.15@nippy.intranet> <CANiq72nUt57u5DG9rH=DB0DzQH7U6-QbG-2Ou+PyCY=p=_Ggag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Wed, 25 Nov 2020, Miguel Ojeda wrote:

> 
> The C standard has nothing to do with this. We use compiler extensions 
> of several kinds, for many years. Even discounting those extensions, the 
> kernel is not even conforming to C due to e.g. strict aliasing. I am not 
> sure what you are trying to argue here.
> 

I'm saying that supporting the official language spec makes more sense 
than attempting to support a multitude of divergent interpretations of the 
spec (i.e. gcc, clang, coverity etc.)

I'm also saying that the reason why we use -std=gnu89 is that existing 
code was written in that language, not in ad hoc languages comprised of 
collections of extensions that change with every release.

> But, since you insist: yes, the `fallthrough` attribute is in the 
> current C2x draft.
> 

Thank you for checking. I found a free version that's only 6 weeks old:

http://www.open-std.org/jtc1/sc22/wg14/www/docs/n2583.pdf

It will be interesting to see whether 6.7.11.5 changes once the various 
implementations reach agreement.

