Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9D42C61D5
	for <lists+xen-devel@lfdr.de>; Fri, 27 Nov 2020 10:37:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.38790.71905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiaBa-0001PN-BT; Fri, 27 Nov 2020 09:37:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 38790.71905; Fri, 27 Nov 2020 09:37:02 +0000
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
	id 1kiaBa-0001Oy-8I; Fri, 27 Nov 2020 09:37:02 +0000
Received: by outflank-mailman (input) for mailman id 38790;
 Thu, 26 Nov 2020 16:18:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QDyK=FA=redhat.com=kherbst@srs-us1.protection.inumbo.net>)
 id 1kiJyZ-0007gu-Ux
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 16:18:32 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id fe4b196e-02ab-4885-9a13-c0a768cb4fad;
 Thu, 26 Nov 2020 16:18:31 +0000 (UTC)
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-Vyb3LmvEO0yCfU3IWWKsNg-1; Thu, 26 Nov 2020 11:18:25 -0500
Received: by mail-qt1-f198.google.com with SMTP id i20so1507587qtr.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2020 08:18:25 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=QDyK=FA=redhat.com=kherbst@srs-us1.protection.inumbo.net>)
	id 1kiJyZ-0007gu-Ux
	for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 16:18:32 +0000
X-Inumbo-ID: fe4b196e-02ab-4885-9a13-c0a768cb4fad
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id fe4b196e-02ab-4885-9a13-c0a768cb4fad;
	Thu, 26 Nov 2020 16:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1606407510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IL7sPB68gF1YeWIUFuBJ//YIBDjI3bDL6qHHKubt/Z0=;
	b=IOmhlXVU0SbnGpY3BpOTvOF5fmmL+x3dr/igY6NQi8P5VRvzaBx7rYihsMQLnr/2wjS5ls
	lvhWzMsvGVZbuOMadN8VodSqXyxvXgSytlwV2pfW04pV/KU13GU2/Vlnjpaju/SpxStUa5
	Ap4HVqPWBmDJjfj+VUMbgiAsQoaIc4c=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-Vyb3LmvEO0yCfU3IWWKsNg-1; Thu, 26 Nov 2020 11:18:25 -0500
X-MC-Unique: Vyb3LmvEO0yCfU3IWWKsNg-1
Received: by mail-qt1-f198.google.com with SMTP id i20so1507587qtr.0
        for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2020 08:18:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IL7sPB68gF1YeWIUFuBJ//YIBDjI3bDL6qHHKubt/Z0=;
        b=G9dZgy+hfboKxAn7QJxMH5KrbOZlac7s/hADSv6HCM9jLk8BdlI+STFTz59JPgnZhQ
         TO+kppUWlqYVE5JoDI+y+S9rbPVsS7iokVTh78U1V1nRBJrz1M3UdI9fvwd1hGFzQuv3
         5ULRe/baZgsE3nXebw2V0UT7/jzcUelIbO3tvv3DwlSAwoGo0WWVqMEGqJ2NvHzfrseX
         YJOuhTfERtJRU+oZpdDGDao0tIOeU98Fw/ZD+RrGsnX/tHa4lsCvGwXSzTgr0kjpLrrI
         VnKkFCFGExnDa1AMropwgsXQ473ydc+HwT2/cc9fdAsvUl9qiKBbwNnwHJINbywtZgjf
         ERjA==
X-Gm-Message-State: AOAM530L0RUvp4fm8RTjHhox3TVlqXeNjO4gcHS/yDl8HOZ/SJbm5Eia
	0fKjZvnj0UmaHHNBwd9UGv8kDl1CA7xvV2uxthCHSkdKphkM3byDMCrs0jYWFnLPIMLv8Zr2hAd
	KtH/hgTxfv8AFEFT9fboH8ywC2veyJg+T/YwoeGR8yAc=
X-Received: by 2002:a37:ac8:: with SMTP id 191mr3793961qkk.381.1606407504845;
        Thu, 26 Nov 2020 08:18:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzCU4CKAolN2PpaYdMoKCHma/+NC3lHjkQkQkRPTWC20j3rANbYTTy+FG9V7n634RRlgf0kcsxPjR4LO+NB5fA=
X-Received: by 2002:a37:ac8:: with SMTP id 191mr3793888qkk.381.1606407504531;
 Thu, 26 Nov 2020 08:18:24 -0800 (PST)
MIME-Version: 1.0
References: <cover.1605896059.git.gustavoars@kernel.org> <20201120105344.4345c14e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011201129.B13FDB3C@keescook> <20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011220816.8B6591A@keescook> <9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com>
 <CANiq72nZrHWTA4_Msg6MP9snTyenC6-eGfD27CyfNSu7QoVZbw@mail.gmail.com>
 <1c7d7fde126bc0acf825766de64bf2f9b888f216.camel@HansenPartnership.com>
 <CANiq72m22Jb5_+62NnwX8xds2iUdWDMAqD8PZw9cuxdHd95W0A@mail.gmail.com>
 <fc45750b6d0277c401015b7aa11e16cd15f32ab2.camel@HansenPartnership.com>
 <CANiq72k5tpDoDPmJ0ZWc1DGqm+81Gi-uEENAtvEs9v3SZcx6_Q@mail.gmail.com>
 <4993259d01a0064f8bb22770503490f9252f3659.camel@HansenPartnership.com>
 <CANiq72kqO=bYMJnFS2uYRpgWATJ=uXxZuNUsTXT+3aLtrpnzvQ@mail.gmail.com>
 <44005bde-f6d4-5eaa-39b8-1a5efeedb2d3@gmail.com> <CANiq72nobq=ptWK-qWxU91JHqkKhMcRtJNnw2XJd5-vSJWZd8Q@mail.gmail.com>
 <CAMuHMdV5kOakvZJMWLxbpigFPS+Xuw6DVYsWCWZy7wGsv3idcw@mail.gmail.com>
In-Reply-To: <CAMuHMdV5kOakvZJMWLxbpigFPS+Xuw6DVYsWCWZy7wGsv3idcw@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 26 Nov 2020 17:18:13 +0100
Message-ID: <CACO55tsBj3gLECoMWtViDitd7fVTnW+Cp0LVmqYkR=QFBJkEmQ@mail.gmail.com>
Subject: Re: [PATCH 000/141] Fix fall-through warnings for Clang
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	ALSA Development Mailing List <alsa-devel@alsa-project.org>, bridge@lists.linux-foundation.org, 
	target-devel <target-devel@vger.kernel.org>, linux-iio@vger.kernel.org, 
	linux-wireless <linux-wireless@vger.kernel.org>, Linux MMC List <linux-mmc@vger.kernel.org>, 
	Linux Fbdev development list <linux-fbdev@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
	virtualization@lists.linux-foundation.org, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, linux-ide@vger.kernel.org, 
	dm-devel@redhat.com, keyrings@vger.kernel.org, 
	MTD Maling List <linux-mtd@lists.infradead.org>, GR-everest-linux-l2@marvell.com, 
	wcn36xx@lists.infradead.org, linux-i3c@lists.infradead.org, 
	linux1394-devel@lists.sourceforge.net, linux-afs@lists.infradead.org, 
	Lars Ellenberg <drbd-dev@lists.linbit.com>, driverdevel <devel@driverdev.osuosl.org>, 
	linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com, 
	scsi <linux-scsi@vger.kernel.org>, 
	ACPI Devel Maling List <linux-acpi@vger.kernel.org>, linux-rdma <linux-rdma@vger.kernel.org>, 
	oss-drivers@netronome.com, linux-atm-general@lists.sourceforge.net, 
	ceph-devel <ceph-devel@vger.kernel.org>, amd-gfx list <amd-gfx@lists.freedesktop.org>, 
	linux-stm32@st-md-mailman.stormreply.com, cluster-devel@redhat.com, 
	usb-storage@lists.one-eyed-alien.net, coreteam@netfilter.org, 
	intel-wired-lan@lists.osuosl.org, linux-input <linux-input@vger.kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Ext4 Developers List <linux-ext4@vger.kernel.org>, NetFilter <netfilter-devel@vger.kernel.org>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, Kees Cook <keescook@chromium.org>, 
	selinux@vger.kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
	Intel Graphics Development <intel-gfx@lists.freedesktop.org>, linux-sctp@vger.kernel.org, 
	reiserfs-devel@vger.kernel.org, linux-geode@lists.infradead.org, 
	linux-block@vger.kernel.org, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, op-tee@lists.trustedfirmware.org, 
	linux-mediatek@lists.infradead.org, xen-devel@lists.xenproject.org, 
	Nouveau Dev <nouveau@lists.freedesktop.org>, linux-hams@vger.kernel.org, 
	Nathan Chancellor <natechancellor@gmail.com>, linux-can@vger.kernel.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-hwmon@vger.kernel.org, 
	Nick Desaulniers <ndesaulniers@google.com>, 
	Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>, GR-Linux-NIC-Dev@marvell.com, 
	Linux-MM <linux-mm@kvack.org>, Network Development <netdev@vger.kernel.org>, 
	linux-decnet-user@lists.sourceforge.net, samba-technical@lists.samba.org, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Edward Cree <ecree.xilinx@gmail.com>, 
	linux-security-module <linux-security-module@vger.kernel.org>, 
	USB list <linux-usb@vger.kernel.org>, tipc-discussion@lists.sourceforge.net, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, patches@opensource.cirrus.com, 
	Joe Perches <joe@perches.com>, linux-integrity <linux-integrity@vger.kernel.org>, 
	"open list:NFS, SUNRPC, AND..." <linux-nfs@vger.kernel.org>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, linux-hardening@vger.kernel.org
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 26, 2020 at 4:28 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Miguel,
>
> On Thu, Nov 26, 2020 at 3:54 PM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> > On Wed, Nov 25, 2020 at 11:44 PM Edward Cree <ecree.xilinx@gmail.com> wrote:
> > > To make the intent clear, you have to first be certain that you
> > >  understand the intent; otherwise by adding either a break or a
> > >  fallthrough to suppress the warning you are just destroying the
> > >  information that "the intent of this code is unknown".
> >
> > If you don't know what the intent of your own code is, then you
> > *already* have a problem in your hands.
>
> The maintainer is not necessarily the owner/author of the code, and
> thus may not know the intent of the code.
>
> > > or does it flag up code
> > >  that can be mindlessly "fixed" (in which case the warning is
> > >  worthless)?  Proponents in this thread seem to be trying to
> > >  have it both ways.
> >
> > A warning is not worthless just because you can mindlessly fix it.
> > There are many counterexamples, e.g. many
> > checkpatch/lint/lang-format/indentation warnings, functional ones like
> > the `if (a = b)` warning...
>
> BTW, you cannot mindlessly fix the latter, as you cannot know if
> "(a == b)" or "((a = b))" was intended, without understanding the code
> (and the (possibly unavailable) data sheet, and the hardware, ...).
>

to allow assignments in if statements was clearly a mistake and if you
need outside information to understand the code, your code is the
issue already.

> P.S. So far I've stayed out of this thread, as I like it if the compiler
>      flags possible mistakes.  After all I was the one fixing new
>      "may be used uninitialized" warnings thrown up by gcc-4.1, until
>      (a bit later than) support for that compiler was removed...
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>


