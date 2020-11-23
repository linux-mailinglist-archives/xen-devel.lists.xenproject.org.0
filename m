Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6DD2C135F
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 19:56:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.35130.66520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khH0Z-00074V-CN; Mon, 23 Nov 2020 18:56:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 35130.66520; Mon, 23 Nov 2020 18:56:15 +0000
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
	id 1khH0Z-000746-8g; Mon, 23 Nov 2020 18:56:15 +0000
Received: by outflank-mailman (input) for mailman id 35130;
 Mon, 23 Nov 2020 18:56:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0pQc=E5=gmail.com=miguel.ojeda.sandonis@srs-us1.protection.inumbo.net>)
 id 1khH0X-000741-Ip
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 18:56:13 +0000
Received: from mail-yb1-xb41.google.com (unknown [2607:f8b0:4864:20::b41])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4ea3ab6f-d25f-4f22-850e-06b44c785b68;
 Mon, 23 Nov 2020 18:56:12 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id 2so16859257ybc.12
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2020 10:56:12 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=0pQc=E5=gmail.com=miguel.ojeda.sandonis@srs-us1.protection.inumbo.net>)
	id 1khH0X-000741-Ip
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 18:56:13 +0000
X-Inumbo-ID: 4ea3ab6f-d25f-4f22-850e-06b44c785b68
Received: from mail-yb1-xb41.google.com (unknown [2607:f8b0:4864:20::b41])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 4ea3ab6f-d25f-4f22-850e-06b44c785b68;
	Mon, 23 Nov 2020 18:56:12 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id 2so16859257ybc.12
        for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2020 10:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KNG9rf3jiBLOHJ1Qe+5HClUHwDC8G2v5PJoNSRMQj2o=;
        b=ZA1WcoeOdsWbRfOoumZEJTLTRH6V2Lpq2CDbZ0VVs1hbOT/vd/v8/YkJaULhb4MkV5
         MHmDtgQZ7Y6vQOoRafNcjdab1m8jmYbh8Ox0xcyAJF866JXyArBCoNYzebFkQV1wRZF3
         r3hM3WSnIq7Ht5VQ2PIwvurJMfamtV7PLgYZxEoHoT74qEv3IGeXPryfDRdu7AW/qetQ
         L1ocOXaYsoIrsq1AVQ8cgaa4G2qWRkZviQ+mOBHOVW/MFUti3ALLJAr2MKUeWh+s4BW6
         tAJsdEl41qUIuUvcW5DdLnVlmhWMC8lZFuXyyo4x1R3eX3DaWLHh1JzDrRZDt/CN6qga
         036w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KNG9rf3jiBLOHJ1Qe+5HClUHwDC8G2v5PJoNSRMQj2o=;
        b=mdEyKoFaBnLfIEt61bzk0FujwNNJPAE11KkmI8FFlXeH6s33/pjmuhEQVMemcevFb0
         SmT0TP/HIHWynbLxcFblxw6Wfq5EXzn+TnUigHSJUMVXJeLkeZAPWTpuTRkUngviK4pL
         eL4G5fX41+OfwbsXNUNhSNPnNQqAFlITDhmwxWEgu6GCe17G4vUvzUp9b/Ofp2E6B4+Y
         Rz65yt7Nt0SR1JoayEzf2/tE4eaNXAmjgOmP9d9m5w8RnyCr+FPQg+zcgy5vMNHSvkQ4
         4IrtNVeBtlf2+0zKCVk5dh7wi3UVrM3qWVXss2B6E5tM4wMYarMnOJdg35l/HQgpcTv/
         QTXA==
X-Gm-Message-State: AOAM532Tk7wz2J1xhBBCli8QUhC3ZYx6DLRJiOvnIXma92PYyVMhaGvA
	bRlyP3JBBTqBnrFYrGe7p+lUg1Ygb7e7InKSwuM=
X-Google-Smtp-Source: ABdhPJyhWLCSkpSmtD0p55Cmpr9Ao1aJs0IYHWLu4Tcyj9q39OBvqgrIxMZMaEy7w1zacpD3mVr5R93EsjzwMBkGuSA=
X-Received: by 2002:a25:df55:: with SMTP id w82mr977719ybg.135.1606157772316;
 Mon, 23 Nov 2020 10:56:12 -0800 (PST)
MIME-Version: 1.0
References: <cover.1605896059.git.gustavoars@kernel.org> <20201120105344.4345c14e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011201129.B13FDB3C@keescook> <20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011220816.8B6591A@keescook> <9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com>
 <CANiq72nZrHWTA4_Msg6MP9snTyenC6-eGfD27CyfNSu7QoVZbw@mail.gmail.com>
 <1c7d7fde126bc0acf825766de64bf2f9b888f216.camel@HansenPartnership.com>
 <CANiq72m22Jb5_+62NnwX8xds2iUdWDMAqD8PZw9cuxdHd95W0A@mail.gmail.com> <fc45750b6d0277c401015b7aa11e16cd15f32ab2.camel@HansenPartnership.com>
In-Reply-To: <fc45750b6d0277c401015b7aa11e16cd15f32ab2.camel@HansenPartnership.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Nov 2020 19:56:01 +0100
Message-ID: <CANiq72k5tpDoDPmJ0ZWc1DGqm+81Gi-uEENAtvEs9v3SZcx6_Q@mail.gmail.com>
Subject: Re: [PATCH 000/141] Fix fall-through warnings for Clang
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Kees Cook <keescook@chromium.org>, Jakub Kicinski <kuba@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	alsa-devel@alsa-project.org, amd-gfx@lists.freedesktop.org, 
	bridge@lists.linux-foundation.org, ceph-devel@vger.kernel.org, 
	cluster-devel@redhat.com, coreteam@netfilter.org, devel@driverdev.osuosl.org, 
	dm-devel@redhat.com, drbd-dev@lists.linbit.com, 
	dri-devel@lists.freedesktop.org, GR-everest-linux-l2@marvell.com, 
	GR-Linux-NIC-Dev@marvell.com, intel-gfx@lists.freedesktop.org, 
	intel-wired-lan@lists.osuosl.org, keyrings@vger.kernel.org, 
	linux1394-devel@lists.sourceforge.net, linux-acpi@vger.kernel.org, 
	linux-afs@lists.infradead.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-arm-msm@vger.kernel.org, 
	linux-atm-general@lists.sourceforge.net, linux-block@vger.kernel.org, 
	linux-can@vger.kernel.org, linux-cifs@vger.kernel.org, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, linux-decnet-user@lists.sourceforge.net, 
	Ext4 Developers List <linux-ext4@vger.kernel.org>, linux-fbdev@vger.kernel.org, 
	linux-geode@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-hams@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-i3c@lists.infradead.org, linux-ide@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-input <linux-input@vger.kernel.org>, 
	linux-integrity@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, linux-mmc@vger.kernel.org, 
	Linux-MM <linux-mm@kvack.org>, linux-mtd@lists.infradead.org, 
	linux-nfs@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-sctp@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-usb@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, 
	linux-wireless <linux-wireless@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, netfilter-devel@vger.kernel.org, 
	nouveau@lists.freedesktop.org, op-tee@lists.trustedfirmware.org, 
	oss-drivers@netronome.com, patches@opensource.cirrus.com, 
	rds-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org, 
	samba-technical@lists.samba.org, selinux@vger.kernel.org, 
	target-devel@vger.kernel.org, tipc-discussion@lists.sourceforge.net, 
	usb-storage@lists.one-eyed-alien.net, 
	virtualization@lists.linux-foundation.org, wcn36xx@lists.infradead.org, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, xen-devel@lists.xenproject.org, 
	linux-hardening@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, 
	Nathan Chancellor <natechancellor@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Joe Perches <joe@perches.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 23, 2020 at 4:58 PM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> Well, I used git.  It says that as of today in Linus' tree we have 889
> patches related to fall throughs and the first series went in in
> october 2017 ... ignoring a couple of outliers back to February.

I can see ~10k insertions over ~1k commits and 15 years that mention a
fallthrough in the entire repo. That is including some commits (like
the biggest one, 960 insertions) that have nothing to do with C
fallthrough. A single kernel release has an order of magnitude more
changes than this...

But if we do the math, for an author, at even 1 minute per line change
and assuming nothing can be automated at all, it would take 1 month of
work. For maintainers, a couple of trivial lines is noise compared to
many other patches.

In fact, this discussion probably took more time than the time it
would take to review the 200 lines. :-)

> We're also complaining about the inability to recruit maintainers:
>
> https://www.theregister.com/2020/06/30/hard_to_find_linux_maintainers_says_torvalds/
>
> And burn out:
>
> http://antirez.com/news/129

Accepting trivial and useful 1-line patches is not what makes a
voluntary maintainer quit... Thankless work with demanding deadlines is.

> The whole crux of your argument seems to be maintainers' time isn't
> important so we should accept all trivial patches

I have not said that, at all. In fact, I am a voluntary one and I
welcome patches like this. It takes very little effort on my side to
review and it helps the kernel overall. Paid maintainers are the ones
that can take care of big features/reviews.

> What I'm actually trying to articulate is a way of measuring value of
> the patch vs cost ... it has nothing really to do with who foots the
> actual bill.

I understand your point, but you were the one putting it in terms of a
junior FTE. In my view, 1 month-work (worst case) is very much worth
removing a class of errors from a critical codebase.

> One thesis I'm actually starting to formulate is that this continual
> devaluing of maintainers is why we have so much difficulty keeping and
> recruiting them.

That may very well be true, but I don't feel anybody has devalued
maintainers in this discussion.

Cheers,
Miguel

