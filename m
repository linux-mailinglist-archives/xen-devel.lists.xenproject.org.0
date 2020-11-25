Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D332C4B73
	for <lists+xen-devel@lfdr.de>; Thu, 26 Nov 2020 00:22:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.38151.70820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ki46q-0005zW-E2; Wed, 25 Nov 2020 23:22:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 38151.70820; Wed, 25 Nov 2020 23:22:00 +0000
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
	id 1ki46q-0005z7-AR; Wed, 25 Nov 2020 23:22:00 +0000
Received: by outflank-mailman (input) for mailman id 38151;
 Wed, 25 Nov 2020 23:21:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NWac=E7=telegraphics.com.au=fthain@srs-us1.protection.inumbo.net>)
 id 1ki46p-0005z2-Ht
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 23:21:59 +0000
Received: from kvm5.telegraphics.com.au (unknown [98.124.60.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 3b4109bb-4bcd-4f48-b1da-519d2fd91930;
 Wed, 25 Nov 2020 23:21:58 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by kvm5.telegraphics.com.au (Postfix) with ESMTP id 414EA2A490;
 Wed, 25 Nov 2020 18:21:54 -0500 (EST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=NWac=E7=telegraphics.com.au=fthain@srs-us1.protection.inumbo.net>)
	id 1ki46p-0005z2-Ht
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 23:21:59 +0000
X-Inumbo-ID: 3b4109bb-4bcd-4f48-b1da-519d2fd91930
Received: from kvm5.telegraphics.com.au (unknown [98.124.60.144])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id 3b4109bb-4bcd-4f48-b1da-519d2fd91930;
	Wed, 25 Nov 2020 23:21:58 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by kvm5.telegraphics.com.au (Postfix) with ESMTP id 414EA2A490;
	Wed, 25 Nov 2020 18:21:54 -0500 (EST)
Date: Thu, 26 Nov 2020 10:21:54 +1100 (AEDT)
From: Finn Thain <fthain@telegraphics.com.au>
To: Nick Desaulniers <ndesaulniers@google.com>
cc: James Bottomley <James.Bottomley@hansenpartnership.com>, 
    Kees Cook <keescook@chromium.org>, 
    "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
    Joe Perches <joe@perches.com>, Jakub Kicinski <kuba@kernel.org>, 
    alsa-devel@alsa-project.org, linux-atm-general@lists.sourceforge.net, 
    reiserfs-devel@vger.kernel.org, linux-iio@vger.kernel.org, 
    linux-wireless <linux-wireless@vger.kernel.org>, 
    linux-fbdev@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>, 
    LKML <linux-kernel@vger.kernel.org>, 
    Nathan Chancellor <natechancellor@gmail.com>, linux-ide@vger.kernel.org, 
    dm-devel@redhat.com, keyrings@vger.kernel.org, 
    linux-mtd@lists.infradead.org, GR-everest-linux-l2@marvell.com, 
    wcn36xx@lists.infradead.org, samba-technical@lists.samba.org, 
    linux-i3c@lists.infradead.org, linux1394-devel@lists.sourceforge.net, 
    linux-afs@lists.infradead.org, usb-storage@lists.one-eyed-alien.net, 
    drbd-dev@lists.linbit.com, devel@driverdev.osuosl.org, 
    linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com, 
    linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org, 
    oss-drivers@netronome.com, bridge@lists.linux-foundation.org, 
    linux-security-module@vger.kernel.org, 
    amd-gfx list <amd-gfx@lists.freedesktop.org>, 
    linux-stm32@st-md-mailman.stormreply.com, cluster-devel@redhat.com, 
    linux-acpi@vger.kernel.org, coreteam@netfilter.org, 
    intel-wired-lan@lists.osuosl.org, linux-input@vger.kernel.org, 
    Miguel Ojeda <ojeda@kernel.org>, tipc-discussion@lists.sourceforge.net, 
    linux-ext4@vger.kernel.org, linux-media@vger.kernel.org, 
    linux-watchdog@vger.kernel.org, selinux@vger.kernel.org, 
    linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
    intel-gfx@lists.freedesktop.org, linux-geode@lists.infradead.org, 
    linux-can@vger.kernel.org, linux-block@vger.kernel.org, 
    linux-gpio@vger.kernel.org, op-tee@lists.trustedfirmware.org, 
    linux-mediatek@lists.infradead.org, xen-devel@lists.xenproject.org, 
    nouveau@lists.freedesktop.org, linux-hams@vger.kernel.org, 
    ceph-devel@vger.kernel.org, virtualization@lists.linux-foundation.org, 
    Linux ARM <linux-arm-kernel@lists.infradead.org>, 
    linux-hwmon@vger.kernel.org, 
    "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, 
    linux-nfs@vger.kernel.org, GR-Linux-NIC-Dev@marvell.com, 
    Linux Memory Management List <linux-mm@kvack.org>, 
    Network Development <netdev@vger.kernel.org>, 
    linux-decnet-user@lists.sourceforge.net, linux-mmc@vger.kernel.org, 
    Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
    linux-sctp@vger.kernel.org, linux-usb@vger.kernel.org, 
    netfilter-devel@vger.kernel.org, 
    "open list:HARDWARE RANDOM NUMBER GENERATOR CORE" <linux-crypto@vger.kernel.org>, 
    patches@opensource.cirrus.com, linux-integrity@vger.kernel.org, 
    target-devel@vger.kernel.org, linux-hardening@vger.kernel.org, 
    Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
    Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [Intel-wired-lan] [PATCH 000/141] Fix fall-through warnings for
 Clang
In-Reply-To: <CAKwvOdna5Zj_O=sB7Q0jHZX0BJSaakX=ZyftwQ_3=L3-ZB54XQ@mail.gmail.com>
Message-ID: <alpine.LNX.2.23.453.2011260918510.6@nippy.intranet>
References: <202011201129.B13FDB3C@keescook> <20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com> <202011220816.8B6591A@keescook> <9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com> <ca071decb87cc7e905411423c05a48f9fd2f58d7.camel@perches.com>
 <0147972a72bc13f3629de8a32dee6f1f308994b5.camel@HansenPartnership.com> <d8d1e9add08cdd4158405e77762d4946037208f8.camel@perches.com> <dbd2cb703ed9eefa7dde9281ea26ab0f7acc8afe.camel@HansenPartnership.com> <20201123130348.GA3119@embeddedor>
 <8f5611bb015e044fa1c0a48147293923c2d904e4.camel@HansenPartnership.com> <202011241327.BB28F12F6@keescook> <a841536fe65bb33f1c72ce2455a6eb47a0107565.camel@HansenPartnership.com> <CAKwvOdkGBn7nuWTAqrORMeN1G+w3YwBfCqqaRD2nwvoAXKi=Aw@mail.gmail.com>
 <alpine.LNX.2.23.453.2011260750300.6@nippy.intranet> <CAKwvOdna5Zj_O=sB7Q0jHZX0BJSaakX=ZyftwQ_3=L3-ZB54XQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 25 Nov 2020, Nick Desaulniers wrote:

> On Wed, Nov 25, 2020 at 1:33 PM Finn Thain <fthain@telegraphics.com.au> 
> wrote:
> >
> > Or do you think that a codebase can somehow satisfy multiple checkers 
> > and their divergent interpretations of the language spec?
> 
> Have we found any cases yet that are divergent? I don't think so.

There are many implementations, so I think you are guaranteed to find more 
divergence if you look. That's because the spec is full of language like 
this: "implementations are encouraged not to emit a diagnostic" and 
"implementations are encouraged to issue a diagnostic".

Some implementations will decide to not emit (under the premise that vast 
amounts of existing code would have to get patched until the compiler goes 
quiet) whereas other implementations will decide to emit (under the 
premise that the author is doing the checking and not the janitor or the 
packager).

> It sounds to me like GCC's cases it warns for is a subset of Clang's. 
> Having additional coverage with Clang then should ensure coverage for 
> both.
> 

If that claim were true, the solution would be simple. (It's not.)

For the benefit of projects that enable -Werror and projects that 
nominated gcc as their preferred compiler, clang would simply need a flag 
to enable conformance with gcc by suppressing those additional warnings 
that clang would normally produce.

This simple solution is, of course, completely unworkable, since it would 
force clang to copy some portion of gcc's logic (rewritten under LLVM's 
unique license) and then to track future changes to that portion of gcc 
indefinitely.

