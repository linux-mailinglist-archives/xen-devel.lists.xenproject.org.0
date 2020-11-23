Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7B22C0C92
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 15:06:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34410.65440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khCTT-0004s7-3S; Mon, 23 Nov 2020 14:05:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34410.65440; Mon, 23 Nov 2020 14:05:47 +0000
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
	id 1khCTT-0004ri-06; Mon, 23 Nov 2020 14:05:47 +0000
Received: by outflank-mailman (input) for mailman id 34410;
 Mon, 23 Nov 2020 14:05:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0pQc=E5=gmail.com=miguel.ojeda.sandonis@srs-us1.protection.inumbo.net>)
 id 1khCTQ-0004rd-PF
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 14:05:44 +0000
Received: from mail-yb1-xb44.google.com (unknown [2607:f8b0:4864:20::b44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 916664b4-7914-47a5-977f-dd2c9181dbd2;
 Mon, 23 Nov 2020 14:05:43 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id t33so16054313ybd.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2020 06:05:43 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=0pQc=E5=gmail.com=miguel.ojeda.sandonis@srs-us1.protection.inumbo.net>)
	id 1khCTQ-0004rd-PF
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 14:05:44 +0000
X-Inumbo-ID: 916664b4-7914-47a5-977f-dd2c9181dbd2
Received: from mail-yb1-xb44.google.com (unknown [2607:f8b0:4864:20::b44])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 916664b4-7914-47a5-977f-dd2c9181dbd2;
	Mon, 23 Nov 2020 14:05:43 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id t33so16054313ybd.0
        for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2020 06:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RhHqKgQbKUW77nc47JuvCnp+w8QNxENxQLSt6AHkTqQ=;
        b=uc3VE1PZNnY/Z1NgZXLeWe/Nj5hsoBfQkeeHXaE+d0SDr9xNRMPYxU1o6fpuaiqkgi
         yuFjhawxyOxFbziEfkWs4inb92LCIVTnNTVXAL7657JtY5jUPnHae9XC4JONvfltcDzK
         9TpDS0ylXwfesoyru6or5tLuj2Wgq4fxc0XGG5evkxw7F5K63x1NbbMukm854FcfQLy0
         gnTDe+NWIPcxyPxl6ZwlkcZY1OnasK1C98JFaIzSzrlrdcg6icgY2nCNokwGspTvBpMG
         u0c2fJxhgJsKPBZAzgP85ZG8VhKJUulmNcJ8sZ+phgCZ9U4trQ3IF/NnqsJiuQ1qY+5Q
         UH8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RhHqKgQbKUW77nc47JuvCnp+w8QNxENxQLSt6AHkTqQ=;
        b=IgZ/ORoME/QGAsRjzZmR1CBMJ/clqW4c9oiYxD5BDQkxL/SIX6Bhkv8qH2r0POv41O
         HD+S9H5u1t/dvOQ41KAqHKQZ/Ul4Ri3Ze5Y7GTD1XWYZjmegLJhYigukJo5DZISgc0Ju
         AddqpnhKBPbqes3VFxBXFRWn7tVl7TrlWKFUekhmpRmcqRusgzOMBUKGAuPDOld2qab3
         C67XkEUBVqPQ18xnJ6Xu9QUgWWBntLb/OKq9/4R+dmM4jAkjiX9/v0y7gmVCMywV9+Gi
         /3E0Kt73cPkd03SN+uDtOuyqbgGfwfbZUp61B1KIYSq1dLClMQseTu/Q4DKstIxyyH2a
         ktPg==
X-Gm-Message-State: AOAM531Cc1hku+sYjRtrQ8qR7b5acLYjwVnyrFYbkgR9FxRNiwgSfzsp
	hchJ1k/GDHGc/y812LpjfHHcjso0ndf7lHvwX3c=
X-Google-Smtp-Source: ABdhPJz9DsZ58e7OIIOr/VE9Xtax3PWaLuFuRyVLpjTsCzIYcuPGWJiVUhGusztX9v02ET+47HU3GtURC6oS5LfC9Lw=
X-Received: by 2002:a5b:40e:: with SMTP id m14mr35121900ybp.33.1606140343388;
 Mon, 23 Nov 2020 06:05:43 -0800 (PST)
MIME-Version: 1.0
References: <cover.1605896059.git.gustavoars@kernel.org> <20201120105344.4345c14e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011201129.B13FDB3C@keescook> <20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011220816.8B6591A@keescook> <9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com>
 <CANiq72nZrHWTA4_Msg6MP9snTyenC6-eGfD27CyfNSu7QoVZbw@mail.gmail.com> <alpine.LNX.2.23.453.2011230938390.7@nippy.intranet>
In-Reply-To: <alpine.LNX.2.23.453.2011230938390.7@nippy.intranet>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Nov 2020 15:05:31 +0100
Message-ID: <CANiq72=z+tmuey9wj3Kk7wX5s0hTHpsQdLhAqcOVNrHon6xn5Q@mail.gmail.com>
Subject: Re: [PATCH 000/141] Fix fall-through warnings for Clang
To: Finn Thain <fthain@telegraphics.com.au>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Kees Cook <keescook@chromium.org>, Jakub Kicinski <kuba@kernel.org>, 
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

On Sun, Nov 22, 2020 at 11:54 PM Finn Thain <fthain@telegraphics.com.au> wrote:
>
> We should also take into account optimisim about future improvements in
> tooling.

Not sure what you mean here. There is no reliable way to guess what
the intention was with a missing fallthrough, even if you parsed
whitespace and indentation.

> It is if you want to spin it that way.

How is that a "spin"? It is a fact that we won't get *implicit*
fallthrough mistakes anymore (in particular if we make it a hard
error).

> But what we inevitably get is changes like this:
>
>  case 3:
>         this();
> +       break;
>  case 4:
>         hmmm();
>
> Why? Mainly to silence the compiler. Also because the patch author argued
> successfully that they had found a theoretical bug, often in mature code.

If someone changes control flow, that is on them. Every kernel
developer knows what `break` does.

> But is anyone keeping score of the regressions? If unreported bugs count,
> what about unreported regressions?

Introducing `fallthrough` does not change semantics. If you are really
keen, you can always compare the objects because the generated code
shouldn't change.

Cheers,
Miguel

