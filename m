Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F44C2C35E3
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 02:07:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37089.69269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khjFz-00082Y-S9; Wed, 25 Nov 2020 01:06:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37089.69269; Wed, 25 Nov 2020 01:06:03 +0000
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
	id 1khjFz-000829-P3; Wed, 25 Nov 2020 01:06:03 +0000
Received: by outflank-mailman (input) for mailman id 37089;
 Wed, 25 Nov 2020 01:06:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FqDi=E7=gmail.com=miguel.ojeda.sandonis@srs-us1.protection.inumbo.net>)
 id 1khjFy-000824-0K
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 01:06:02 +0000
Received: from mail-qk1-x742.google.com (unknown [2607:f8b0:4864:20::742])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8671d5a3-3190-443e-b734-c1f835a799c3;
 Wed, 25 Nov 2020 01:06:00 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id u4so1453692qkk.10
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2020 17:06:00 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=FqDi=E7=gmail.com=miguel.ojeda.sandonis@srs-us1.protection.inumbo.net>)
	id 1khjFy-000824-0K
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 01:06:02 +0000
X-Inumbo-ID: 8671d5a3-3190-443e-b734-c1f835a799c3
Received: from mail-qk1-x742.google.com (unknown [2607:f8b0:4864:20::742])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 8671d5a3-3190-443e-b734-c1f835a799c3;
	Wed, 25 Nov 2020 01:06:00 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id u4so1453692qkk.10
        for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2020 17:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=44pFzPZOXy9WMyxuVZ4PJwmHwfPvC91GWhNSdpkVBXk=;
        b=PLHqMkuVQ6uE1aGa3jPkk7oL0rd2+0aQGjbXwXCM1BqpOEf5R6gUmrb1tTrj75nDjD
         aG6VHTDP2JdODJ/e29C1vfEMjWhTPlycM3mNfL2JW5BhFtstP0di/Kwb3XYGnsRoKRp5
         7FVJzAE2cPEDrpLIYX3jwoIfPno8H9ArdOwpkc9HelZA+M7Eq52S4RmPBHauFrK9tfW3
         8wrBLWN/Mq7Fl9GTodmgwwudDuqrVUSiSILvkeQCl7qFs3/IjbI7/AG3m5iLRdEEw+2H
         RzsA5+EdKfz0DIt5iJKomdRqiV67cH8ZcnWPF2PnARf/ANxCrT7QZJCkY0VU2DrQ9d/L
         oW2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=44pFzPZOXy9WMyxuVZ4PJwmHwfPvC91GWhNSdpkVBXk=;
        b=fk2tYdsZeRDSOaISfzXJGVoWUXQIZA8uvM7bHj9MZev46/oFNMv8iSM7gMQaHVRu4+
         igwu54oTpaBIbKdz/rjZiDKUybZfyuRY+xHDp9LdQ9W3wMgBsvLQgL8MUKETlHYk9elk
         QUystM8hezVjrq9KJjn8pcWFx9MqZKpqBZ+ndDQ/nJcYnC9dkKH5ta0jnkh61JEw0Qk2
         srD5M+462AXQE5vgKttE49yT8np74CtN3XLCg/mYd22HyprFj6MbIHLTc58wEWFPQJxQ
         EphbrbQsejYfefv6nb+VaCPdbMKPNEhSoy1cr8qK/fXpsucbrHDsTEHqtv9bQRhuQhcK
         wmqQ==
X-Gm-Message-State: AOAM531csgQdgPQ95ovVpz/Ti9zTLMf0TZZPy0KwA7pup4LV24rhSJJe
	/VIHPF1eIW7CwHVWOPY9qTJfUVMqBUE+n4yQluU=
X-Google-Smtp-Source: ABdhPJxG2tW9FM1fAqThCcvqKAPI/OeE1R4V2//A8ePZuSketjr0yKUxoxj6t2hcKlYt9sKRSewQcSyhG/w+5cGdzqU=
X-Received: by 2002:a25:aac5:: with SMTP id t63mr1046305ybi.22.1606266360499;
 Tue, 24 Nov 2020 17:06:00 -0800 (PST)
MIME-Version: 1.0
References: <202011201129.B13FDB3C@keescook> <20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011220816.8B6591A@keescook> <9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com>
 <ca071decb87cc7e905411423c05a48f9fd2f58d7.camel@perches.com>
 <0147972a72bc13f3629de8a32dee6f1f308994b5.camel@HansenPartnership.com>
 <d8d1e9add08cdd4158405e77762d4946037208f8.camel@perches.com>
 <dbd2cb703ed9eefa7dde9281ea26ab0f7acc8afe.camel@HansenPartnership.com>
 <20201123130348.GA3119@embeddedor> <8f5611bb015e044fa1c0a48147293923c2d904e4.camel@HansenPartnership.com>
 <202011241327.BB28F12F6@keescook> <alpine.LNX.2.23.453.2011250859290.15@nippy.intranet>
 <CANiq72nUt57u5DG9rH=DB0DzQH7U6-QbG-2Ou+PyCY=p=_Ggag@mail.gmail.com> <alpine.LNX.2.23.453.2011251022550.14@nippy.intranet>
In-Reply-To: <alpine.LNX.2.23.453.2011251022550.14@nippy.intranet>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 25 Nov 2020 02:05:49 +0100
Message-ID: <CANiq72m2kGxSy2E9jgYE4_xRV6h9rFqiJP25KXs_5ObYnH_nmA@mail.gmail.com>
Subject: Re: [Intel-wired-lan] [PATCH 000/141] Fix fall-through warnings for Clang
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Kees Cook <keescook@chromium.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Joe Perches <joe@perches.com>, 
	Jakub Kicinski <kuba@kernel.org>, alsa-devel@alsa-project.org, 
	linux-atm-general@lists.sourceforge.net, reiserfs-devel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-wireless <linux-wireless@vger.kernel.org>, 
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel <linux-kernel@vger.kernel.org>, Nathan Chancellor <natechancellor@gmail.com>, 
	linux-ide@vger.kernel.org, dm-devel@redhat.com, keyrings@vger.kernel.org, 
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
	cluster-devel@redhat.com, linux-acpi@vger.kernel.org, coreteam@netfilter.org, 
	intel-wired-lan@lists.osuosl.org, linux-input <linux-input@vger.kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, tipc-discussion@lists.sourceforge.net, 
	Ext4 Developers List <linux-ext4@vger.kernel.org>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, linux-watchdog@vger.kernel.org, 
	selinux@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, linux-geode@lists.infradead.org, 
	linux-can@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-gpio@vger.kernel.org, op-tee@lists.trustedfirmware.org, 
	linux-mediatek@lists.infradead.org, xen-devel@lists.xenproject.org, 
	nouveau@lists.freedesktop.org, linux-hams@vger.kernel.org, 
	ceph-devel@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-hwmon@vger.kernel.org, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, linux-nfs@vger.kernel.org, GR-Linux-NIC-Dev@marvell.com, 
	Linux-MM <linux-mm@kvack.org>, Network Development <netdev@vger.kernel.org>, 
	linux-decnet-user@lists.sourceforge.net, linux-mmc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-sctp@vger.kernel.org, 
	linux-usb@vger.kernel.org, netfilter-devel@vger.kernel.org, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, patches@opensource.cirrus.com, 
	linux-integrity@vger.kernel.org, target-devel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 25, 2020 at 12:53 AM Finn Thain <fthain@telegraphics.com.au> wrote:
>
> I'm saying that supporting the official language spec makes more sense
> than attempting to support a multitude of divergent interpretations of the
> spec (i.e. gcc, clang, coverity etc.)

Making the kernel strictly conforming is a ship that sailed long ago,
for several reasons. Anyway, supporting several compilers and other
tools, regardless of extensions, is valuable.

> I'm also saying that the reason why we use -std=gnu89 is that existing
> code was written in that language, not in ad hoc languages comprised of
> collections of extensions that change with every release.

No, we aren't particularly tied to `gnu89` or anything like that. We
could actually go for `gnu11` already, since the minimum GCC and Clang
support it. Even if a bit of code needs fixing, that shouldn't be a
problem if someone puts the work.

In other words, the kernel code is not frozen, nor are the features it
uses from compilers. They do, in fact, change from time to time.

> Thank you for checking. I found a free version that's only 6 weeks old:

You're welcome! There are quite a few new attributes coming, mostly
following C++ ones.

> It will be interesting to see whether 6.7.11.5 changes once the various
> implementations reach agreement.

Not sure what you mean. The standard does not evolve through
implementations' agreement (although standardizing existing practice
is one of the best arguments to back a change).

Cheers,
Miguel

