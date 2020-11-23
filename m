Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0DA2C0D1E
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 15:20:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34418.65452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khChM-0006YR-CW; Mon, 23 Nov 2020 14:20:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34418.65452; Mon, 23 Nov 2020 14:20:08 +0000
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
	id 1khChM-0006Y2-9A; Mon, 23 Nov 2020 14:20:08 +0000
Received: by outflank-mailman (input) for mailman id 34418;
 Mon, 23 Nov 2020 14:20:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0pQc=E5=gmail.com=miguel.ojeda.sandonis@srs-us1.protection.inumbo.net>)
 id 1khChL-0006UD-19
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 14:20:07 +0000
Received: from mail-yb1-xb42.google.com (unknown [2607:f8b0:4864:20::b42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4095cb29-3c24-4e18-89b6-b4f387cf8a58;
 Mon, 23 Nov 2020 14:20:06 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id v92so16085706ybi.4
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2020 06:20:06 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=0pQc=E5=gmail.com=miguel.ojeda.sandonis@srs-us1.protection.inumbo.net>)
	id 1khChL-0006UD-19
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 14:20:07 +0000
X-Inumbo-ID: 4095cb29-3c24-4e18-89b6-b4f387cf8a58
Received: from mail-yb1-xb42.google.com (unknown [2607:f8b0:4864:20::b42])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 4095cb29-3c24-4e18-89b6-b4f387cf8a58;
	Mon, 23 Nov 2020 14:20:06 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id v92so16085706ybi.4
        for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2020 06:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WUYMqcUnfpAQa1YuH9tQ3ze5bp2bxaoGLXc9Sg/470Y=;
        b=b0LkeT2q71Z3peIccxL7MkU5QadaCN3igdEC89IE4ykmdOxIlhuoo/0+H7pQCoNmlh
         0UX19Z7soasUpz2fDZHX56luUWrH4GLKAJ9K28HwPu9km7qlcvasqfBffaQW+LtXvh6a
         fVP4J8wQFxbi1QWFB10Wsq9dLONxRShLcqQtcaktrZCy3tSRV5R4FOw2MSdgwNuCxNwd
         cKQMyE/jYgmlc9Qm972BZKz9xJaasT5iW6gpZgai8YpCh1sxJNgZFzlfCpv21Fvd7rwb
         akOsznbnFT4mJT95mXFDUPnplTdAJirWAcm8YfzHFRAfOGn9Vk91PuRcq7JipLelDPMB
         VWgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WUYMqcUnfpAQa1YuH9tQ3ze5bp2bxaoGLXc9Sg/470Y=;
        b=WEVpTVA0ExJe7F3FkrQ+gV5WOeNpNy7EgvnBfVaqYI1Aritms6j2zKWXZ97rwlqePN
         aQPDn2p1+U9ZSmheUB18SEtcNE6RFE4O0cdOyTgjLRuyDVQL+5PkAckHMzlgNFu7iQvw
         8F66MiIB62VDdTwdnQoLAsGO/Mooe54jf9LIT+C2x2NDJXrHo8tvTNZUY4xqihVJ+aCW
         bVspBgEhyYdB/dqc8pjDOD+016M7ucJooX3TYrUeHabNeNZLLqMmyxVdXVCyRuQwpqac
         dxIwebxtFPf2sBSIc0HpyKJWa5euiVcCGljKbTGqJswJscQ8ix3uVcNu61oHxVln5oqy
         1jQA==
X-Gm-Message-State: AOAM5335RSXeXrz/fKugIfPdsH0VtC8/mudHPYnUrSZ+Hl0R7G0LckFT
	hAdqUReZHlMQTFEVapWZlwoybRCN3mec4N72yaU=
X-Google-Smtp-Source: ABdhPJyiJqjBIpEzWlk5pyqpoGG3+KpoWdKnlyza2YA6ODhXnRhATytwh5Bq+iGOzNqc5gs+zuqHC8iB1cjfDTXU/ik=
X-Received: by 2002:a25:bcc7:: with SMTP id l7mr32380985ybm.115.1606141205830;
 Mon, 23 Nov 2020 06:20:05 -0800 (PST)
MIME-Version: 1.0
References: <cover.1605896059.git.gustavoars@kernel.org> <20201120105344.4345c14e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011201129.B13FDB3C@keescook> <20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011220816.8B6591A@keescook> <9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com>
 <CANiq72nZrHWTA4_Msg6MP9snTyenC6-eGfD27CyfNSu7QoVZbw@mail.gmail.com> <1c7d7fde126bc0acf825766de64bf2f9b888f216.camel@HansenPartnership.com>
In-Reply-To: <1c7d7fde126bc0acf825766de64bf2f9b888f216.camel@HansenPartnership.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Nov 2020 15:19:55 +0100
Message-ID: <CANiq72m22Jb5_+62NnwX8xds2iUdWDMAqD8PZw9cuxdHd95W0A@mail.gmail.com>
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

On Sun, Nov 22, 2020 at 11:36 PM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> Well, it seems to be three years of someone's time plus the maintainer
> review time and series disruption of nearly a thousand patches.  Let's
> be conservative and assume the producer worked about 30% on the series
> and it takes about 5-10 minutes per patch to review, merge and for
> others to rework existing series.  So let's say it's cost a person year
> of a relatively junior engineer producing the patches and say 100h of
> review and application time.  The latter is likely the big ticket item
> because it's what we have in least supply in the kernel (even though
> it's 20x vs the producer time).

How are you arriving at such numbers? It is a total of ~200 trivial lines.

> It's not about the risk of the changes it's about the cost of
> implementing them.  Even if you discount the producer time (which
> someone gets to pay for, and if I were the engineering manager, I'd be
> unhappy about), the review/merge/rework time is pretty significant in
> exchange for six minor bug fixes.  Fine, when a new compiler warning
> comes along it's certainly reasonable to see if we can benefit from it
> and the fact that the compiler people think it's worthwhile is enough
> evidence to assume this initially.  But at some point you have to ask
> whether that assumption is supported by the evidence we've accumulated
> over the time we've been using it.  And if the evidence doesn't support
> it perhaps it is time to stop the experiment.

Maintainers routinely review 1-line trivial patches, not to mention
internal API changes, etc.

If some company does not want to pay for that, that's fine, but they
don't get to be maintainers and claim `Supported`.

Cheers,
Miguel

