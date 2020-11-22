Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D373E2BC957
	for <lists+xen-devel@lfdr.de>; Sun, 22 Nov 2020 21:37:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.33485.64548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kgw5k-00036F-0m; Sun, 22 Nov 2020 20:36:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 33485.64548; Sun, 22 Nov 2020 20:36:11 +0000
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
	id 1kgw5j-00035q-Tw; Sun, 22 Nov 2020 20:36:11 +0000
Received: by outflank-mailman (input) for mailman id 33485;
 Sun, 22 Nov 2020 20:36:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0jIZ=E4=gmail.com=miguel.ojeda.sandonis@srs-us1.protection.inumbo.net>)
 id 1kgw5i-00035i-OB
 for xen-devel@lists.xenproject.org; Sun, 22 Nov 2020 20:36:10 +0000
Received: from mail-yb1-xb31.google.com (unknown [2607:f8b0:4864:20::b31])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f5b45d64-3f5d-439d-b491-8476191028e2;
 Sun, 22 Nov 2020 20:36:10 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id x17so14047820ybr.8
 for <xen-devel@lists.xenproject.org>; Sun, 22 Nov 2020 12:36:10 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=0jIZ=E4=gmail.com=miguel.ojeda.sandonis@srs-us1.protection.inumbo.net>)
	id 1kgw5i-00035i-OB
	for xen-devel@lists.xenproject.org; Sun, 22 Nov 2020 20:36:10 +0000
X-Inumbo-ID: f5b45d64-3f5d-439d-b491-8476191028e2
Received: from mail-yb1-xb31.google.com (unknown [2607:f8b0:4864:20::b31])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f5b45d64-3f5d-439d-b491-8476191028e2;
	Sun, 22 Nov 2020 20:36:10 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id x17so14047820ybr.8
        for <xen-devel@lists.xenproject.org>; Sun, 22 Nov 2020 12:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GG13N+h9bYKW0tA8PzZdEh0PqD5/qSPuWfMm4/MLZZE=;
        b=tX7AFJY3IoP+sTWjLWjwUeA0EiMqyjgmEMGUK52Uheybmur4GieXYHjq/4452d4+Q2
         I9IJc2W+KgP7eM5cLMrffBSaL1fq5VPLYq7a7Nqy7aqiJs+SWc7hYJy9lsWlIs20dLH2
         W28Iwaw2K1E1/9bR59jMmk/7Gq8vv14a82SqbrX8Cr26/AWqo5ergIUL6PfX6EI1DxrF
         H3tDAymEGdy6lnWgT39rAP3JOfP6UnfKa9FSSCeE7ggKiNT9+2hZ/9zdGiTOU+6HH+d5
         TmFQQAuEaRP9Z2Bh9bU0txdUhaZCbT+Ezs+qExtvq1zOJlrZzRYF6kJpZnKXIPWyTN/2
         bJqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GG13N+h9bYKW0tA8PzZdEh0PqD5/qSPuWfMm4/MLZZE=;
        b=j/aXgW7DLOtU+2TcuTdXKrACQI3AYt5/cf/S+wGFFutaQL0kIOXGwZtZ8kJjX3q7R2
         5WEdw821k410rQbklUS1ZMqcv+pNlTtuGkNvOLtvCm5QHvAUpvDCOYw93CMekefxBAXh
         MqRKOCQDFVAJ1n1fXXhYRz8jLIgqgKTz+Foes3Rw9K2ypGTWH+KTw0XBtE9rHiclT2UD
         1lzrrsUf65o5QRY39sRBcO+2z4i6T43jpCMYIvd9Aj+88FMif9m2jSJiqPuBv/OKbIm3
         TMbuV85UEvYB+L19702MbyNf8njC5qFv6EtDZY4GnSxraSTW4YpjA+Js+8wPgqyLIGs/
         SnaQ==
X-Gm-Message-State: AOAM531xYi3IrkA45j2oFLL7/AAoFIhmEcy08G4bM2NBuQbnx9wgG+tj
	8yQrwhs1u2mFYTSO6bGPN1Weq8Ot9njnuEVYZF4=
X-Google-Smtp-Source: ABdhPJzCLkP7XKvI+ogPcqXNjFlbBz0ulixnxLa8L+LTJiC1sb757UHHSouM0vJ9LX/4+Ocy8hzM6Anb9s4lPpy7cZY=
X-Received: by 2002:a25:6986:: with SMTP id e128mr4956056ybc.93.1606077369721;
 Sun, 22 Nov 2020 12:36:09 -0800 (PST)
MIME-Version: 1.0
References: <cover.1605896059.git.gustavoars@kernel.org> <20201120105344.4345c14e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011201129.B13FDB3C@keescook> <20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011220816.8B6591A@keescook> <9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com>
In-Reply-To: <9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 22 Nov 2020 21:35:58 +0100
Message-ID: <CANiq72nZrHWTA4_Msg6MP9snTyenC6-eGfD27CyfNSu7QoVZbw@mail.gmail.com>
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

On Sun, Nov 22, 2020 at 7:22 PM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> Well, it's a problem in an error leg, sure, but it's not a really
> compelling reason for a 141 patch series, is it?  All that fixing this
> error will do is get the driver to print "oh dear there's a problem"
> under four more conditions than it previously did.
>
> We've been at this for three years now with nearly a thousand patches,
> firstly marking all the fall throughs with /* fall through */ and later
> changing it to fallthrough.  At some point we do have to ask if the
> effort is commensurate with the protection afforded.  Please tell me
> our reward for all this effort isn't a single missing error print.

It isn't that much effort, isn't it? Plus we need to take into account
the future mistakes that it might prevent, too. So even if there were
zero problems found so far, it is still a positive change.

I would agree if these changes were high risk, though; but they are
almost trivial.

Cheers,
Miguel

