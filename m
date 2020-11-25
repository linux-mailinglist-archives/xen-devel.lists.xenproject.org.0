Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D352C4A5F
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 23:09:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.38111.70760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ki2yY-00073C-Mv; Wed, 25 Nov 2020 22:09:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 38111.70760; Wed, 25 Nov 2020 22:09:22 +0000
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
	id 1ki2yY-00072n-Jf; Wed, 25 Nov 2020 22:09:22 +0000
Received: by outflank-mailman (input) for mailman id 38111;
 Wed, 25 Nov 2020 22:09:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ecWo=E7=google.com=ndesaulniers@srs-us1.protection.inumbo.net>)
 id 1ki2yX-00072i-Bd
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 22:09:21 +0000
Received: from mail-pg1-x543.google.com (unknown [2607:f8b0:4864:20::543])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 286c4bc4-a9fc-4e59-ae65-14f4ca5eb712;
 Wed, 25 Nov 2020 22:09:20 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id t3so3603184pgi.11
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2020 14:09:20 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ecWo=E7=google.com=ndesaulniers@srs-us1.protection.inumbo.net>)
	id 1ki2yX-00072i-Bd
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 22:09:21 +0000
X-Inumbo-ID: 286c4bc4-a9fc-4e59-ae65-14f4ca5eb712
Received: from mail-pg1-x543.google.com (unknown [2607:f8b0:4864:20::543])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 286c4bc4-a9fc-4e59-ae65-14f4ca5eb712;
	Wed, 25 Nov 2020 22:09:20 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id t3so3603184pgi.11
        for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2020 14:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u18D3LcbSYuoMMQXGcZuOSSHQ97aqFAj6PSwZPKzyfI=;
        b=WifNdkiftaOaD4ZZckvIqaLo1oDpErEfQOeEaPPqC9ugBqwKDiWX7cyNX9NNokqABc
         3rs8Xkh/xt0eSkb8xVKJLxbZ9ctD9N09POwkigNrKsLe837qPjgVNlPjii1YQ7Ys5fEN
         J1ztqI2SdAxczb+fxW5+t1BuuInt0J3EnKhYhGXUx/Ycs4OeMqDUGayCvZ/rK/2hwzHv
         fvNTfM4yxqfrW/W8EGBwEJD3ef8E6CIFveHPM/2Vwj3USBV6V1sXpGOaikzNc+dcQTTs
         sQr+N2RUFmFahGpkDJgGJRdpjSZFKGXDT4Evw9946EQKZvU8LN7QRJCs+4k3wXo2GKBl
         nncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u18D3LcbSYuoMMQXGcZuOSSHQ97aqFAj6PSwZPKzyfI=;
        b=ByV+dJ6H7QmMqWfm3SKmQksWJavW81dmr/kn9cxaQJ3Q4GVSEG2QdIPHivLob5XlDq
         BCR1qZCGaHeXTKED+l0AQ6N+qT43Ib3WeTc5jDXwIkZTtKTdjJ/Z+qidM/mki2wCpSfg
         0IdSq1RIJ/yWWoOHlavbVMoBPP5N8Yl/9O27s2PdpmGn8SddC+9bwS0848buxFJLxGsZ
         9ftqht0FfEtwnMixw2E1kQYFkLzdhGLxpSTaGnJ98kKlcc2sa0fq7n9mL01vBfufzI8d
         bb5PqfrHHSHmR+7cIFIqf5++VoxjtQXE539ITnZD4NOLzxeKGK2ssjmcxbYoxlTgprM4
         Sv2A==
X-Gm-Message-State: AOAM5339oya8H5HsA+yXd2Jh1AhjI4HzpqJlnD+/YcMkYdRC5j7C8MvV
	j+yReUEbM5Lq/Z84MbQtvDfhqT6fcbqvY0G4okc2cA==
X-Google-Smtp-Source: ABdhPJxX4YdX/dgPSH4qNW13nZ+NPFnsWrpBgteZRS2UfRF2x25a9zmwdzqZA/h0sTtapVP+ZBS7Enbowp+5Zxn/Mxo=
X-Received: by 2002:a17:90a:d250:: with SMTP id o16mr6463569pjw.25.1606342159332;
 Wed, 25 Nov 2020 14:09:19 -0800 (PST)
MIME-Version: 1.0
References: <202011201129.B13FDB3C@keescook> <20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011220816.8B6591A@keescook> <9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com>
 <ca071decb87cc7e905411423c05a48f9fd2f58d7.camel@perches.com>
 <0147972a72bc13f3629de8a32dee6f1f308994b5.camel@HansenPartnership.com>
 <d8d1e9add08cdd4158405e77762d4946037208f8.camel@perches.com>
 <dbd2cb703ed9eefa7dde9281ea26ab0f7acc8afe.camel@HansenPartnership.com>
 <20201123130348.GA3119@embeddedor> <8f5611bb015e044fa1c0a48147293923c2d904e4.camel@HansenPartnership.com>
 <202011241327.BB28F12F6@keescook> <a841536fe65bb33f1c72ce2455a6eb47a0107565.camel@HansenPartnership.com>
 <CAKwvOdkGBn7nuWTAqrORMeN1G+w3YwBfCqqaRD2nwvoAXKi=Aw@mail.gmail.com> <20201125082405.1d8c23dc@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20201125082405.1d8c23dc@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 25 Nov 2020 14:09:08 -0800
Message-ID: <CAKwvOdkWGE5qdFZUuMzcL63LDOu_iZQJOGbeBNjcPi8sJPMkag@mail.gmail.com>
Subject: Re: [Intel-wired-lan] [PATCH 000/141] Fix fall-through warnings for Clang
To: Jakub Kicinski <kuba@kernel.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Kees Cook <keescook@chromium.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Joe Perches <joe@perches.com>, alsa-devel@alsa-project.org, 
	linux-atm-general@lists.sourceforge.net, reiserfs-devel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-wireless <linux-wireless@vger.kernel.org>, 
	linux-fbdev@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>, 
	LKML <linux-kernel@vger.kernel.org>, Nathan Chancellor <natechancellor@gmail.com>, 
	linux-ide@vger.kernel.org, dm-devel@redhat.com, keyrings@vger.kernel.org, 
	linux-mtd@lists.infradead.org, GR-everest-linux-l2@marvell.com, 
	wcn36xx@lists.infradead.org, samba-technical@lists.samba.org, 
	linux-i3c@lists.infradead.org, linux1394-devel@lists.sourceforge.net, 
	linux-afs@lists.infradead.org, usb-storage@lists.one-eyed-alien.net, 
	drbd-dev@lists.linbit.com, devel@driverdev.osuosl.org, 
	linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com, 
	linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org, 
	oss-drivers@netronome.com, bridge@lists.linux-foundation.org, 
	linux-security-module@vger.kernel.org, 
	amd-gfx list <amd-gfx@lists.freedesktop.org>, linux-stm32@st-md-mailman.stormreply.com, 
	cluster-devel@redhat.com, linux-acpi@vger.kernel.org, coreteam@netfilter.org, 
	intel-wired-lan@lists.osuosl.org, linux-input@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, tipc-discussion@lists.sourceforge.net, 
	linux-ext4@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, selinux@vger.kernel.org, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, intel-gfx@lists.freedesktop.org, 
	linux-geode@lists.infradead.org, linux-can@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-gpio@vger.kernel.org, 
	op-tee@lists.trustedfirmware.org, linux-mediatek@lists.infradead.org, 
	xen-devel@lists.xenproject.org, nouveau@lists.freedesktop.org, 
	linux-hams@vger.kernel.org, ceph-devel@vger.kernel.org, 
	virtualization@lists.linux-foundation.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-hwmon@vger.kernel.org, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, linux-nfs@vger.kernel.org, GR-Linux-NIC-Dev@marvell.com, 
	Linux Memory Management List <linux-mm@kvack.org>, Network Development <netdev@vger.kernel.org>, 
	linux-decnet-user@lists.sourceforge.net, linux-mmc@vger.kernel.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, linux-sctp@vger.kernel.org, 
	linux-usb@vger.kernel.org, netfilter-devel@vger.kernel.org, 
	=?UTF-8?Q?open_list=3AHARDWARE_RANDOM_NUMBER_GENERATOR_CORE_=3Clinux=2Dcrypt?=
	=?UTF-8?Q?o=40vger=2Ekernel=2Eorg=3E=2C_patches=40opensource=2Ecirrus=2Ecom=2C_linux=2Dint?=
	=?UTF-8?Q?egrity=40vger=2Ekernel=2Eorg=2C_target=2Ddevel=40vger=2Ekernel=2Eorg=2C_linux=2D?=
	=?UTF-8?Q?hardening=40vger=2Ekernel=2Eorg=2C_Jonathan_Cameron_=3CJonathan=2ECamero?=
	=?UTF-8?Q?n=40huawei=2Ecom=3E=2C_Greg_KH?= <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 25, 2020 at 8:24 AM Jakub Kicinski <kuba@kernel.org> wrote:
>
> Applying a real patch set and then getting a few follow ups the next day
> for trivial coding things like fallthrough missing or static missing,
> just because I didn't have the full range of compilers to check with
> before applying makes me feel pretty shitty, like I'm not doing a good
> job. YMMV.

I understand. Everyone feels that way, except maybe Bond villains and
robots.  My advice in that case is don't take it personally.  We're
working with a language that's more error prone relative to others.
While one would like to believe they are flawless, over time they
can't beat the aggregate statistics.  A balance between Imposter
Syndrome and Dunning Kruger is walked by all software developers, and
the fear of making mistakes in public is one of the number one reasons
folks don't take the plunge contributing to open source software or
even the kernel.  My advice to them is "don't sweat the small stuff."
-- 
Thanks,
~Nick Desaulniers

