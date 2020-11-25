Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB2B2C3DCB
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 11:38:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37527.69933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khsB2-0005PD-AJ; Wed, 25 Nov 2020 10:37:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37527.69933; Wed, 25 Nov 2020 10:37:32 +0000
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
	id 1khsB2-0005Oo-6z; Wed, 25 Nov 2020 10:37:32 +0000
Received: by outflank-mailman (input) for mailman id 37527;
 Wed, 25 Nov 2020 10:37:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fqhz=E7=gmail.com=andy.shevchenko@srs-us1.protection.inumbo.net>)
 id 1khsB0-0005Oj-LC
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 10:37:30 +0000
Received: from mail-pl1-x642.google.com (unknown [2607:f8b0:4864:20::642])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c458a78b-3e5a-4c47-81b9-20085582c7f5;
 Wed, 25 Nov 2020 10:37:29 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id bj5so914846plb.4
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2020 02:37:29 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=fqhz=E7=gmail.com=andy.shevchenko@srs-us1.protection.inumbo.net>)
	id 1khsB0-0005Oj-LC
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 10:37:30 +0000
X-Inumbo-ID: c458a78b-3e5a-4c47-81b9-20085582c7f5
Received: from mail-pl1-x642.google.com (unknown [2607:f8b0:4864:20::642])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c458a78b-3e5a-4c47-81b9-20085582c7f5;
	Wed, 25 Nov 2020 10:37:29 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id bj5so914846plb.4
        for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2020 02:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lG3+Uwz8lZti6FSb8xjGyaQfdt5OwV03xvf6+L3ZqWc=;
        b=YCtEdyPA4vCzWZsMjIt3djSgR9gg7vMRhn3I5LT7lEmWHdT3b/jEkR0QdduouORJ7k
         kiuUl5RijkS3EJmc3PIdIbhuWrYEtLAccN+wdoprBDsU56ruoUGszfH1Sxvuy4WXIhMK
         0dDt7R//JtRYOU1+gQ96Rpa2FinP3O1pFccTMutbPTGjvqTac0chojMQO8cZdySzLIim
         HHsTKo91pUaUTwyxPnWizwDASocTC+n+eyDdN/HKPn9pe4V2vLDA/DOFrCcWbsrVXkvE
         5CsjPeXzCB0gF8EvrEVdW+qQjVnUcViOyjSAD57xy0gbwLs+FCHLejwxIxOdH/xJHiTG
         +NRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lG3+Uwz8lZti6FSb8xjGyaQfdt5OwV03xvf6+L3ZqWc=;
        b=b0r7y1/0+LDs9OGnXxmtXu8MGgKwS9sZESqtyut8RIlAN4qB/0bwSruDKgviHYtDpS
         WIBKMFZGGctYBfPJv0sIQA4Drvt23oLHutSTo78/l+1vKyPFaFOP+4O74hphwYksyGwB
         HPY1hFlIuNwEGgY4rLWnwRYLJHf0O3K5V3mONy2v5VnRq2T5l8gC92zjXRVD6TZfBI8W
         Td0FFsmGpG3HEHQfZguUcXtDKKa9/CMYaAlwDrAO+kzkcs4bxYJCGHq0he0egW5E1ub9
         C2+Aypma95RCebYLBdRhYrGq+ZFjB/CV6ZWq2EwIoAqgFjfRbXdulQSxFy5Ov1ckTNyS
         Inaw==
X-Gm-Message-State: AOAM532fK9zp40dPTZRt79gSEFOMi8PU8lIyYEvP5jCFAOqjBynz8xxs
	6hUBpKGxQwzpBBVuAr/SSat6hpoCj3d8D4a0wWM=
X-Google-Smtp-Source: ABdhPJzEY8ebPN4xZ4jf0ZFVw9i65L6qlCom+E751HZA34/qY3SkadUuuLf2HukIG4qONDPWI5feIsM1VQGLuSbFYSc=
X-Received: by 2002:a17:902:ead2:b029:da:2596:198e with SMTP id
 p18-20020a170902ead2b02900da2596198emr1937529pld.21.1606300648824; Wed, 25
 Nov 2020 02:37:28 -0800 (PST)
MIME-Version: 1.0
References: <cover.1605896059.git.gustavoars@kernel.org> <20201120105344.4345c14e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011201129.B13FDB3C@keescook> <20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011220816.8B6591A@keescook> <9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com>
 <CANiq72nZrHWTA4_Msg6MP9snTyenC6-eGfD27CyfNSu7QoVZbw@mail.gmail.com>
 <1c7d7fde126bc0acf825766de64bf2f9b888f216.camel@HansenPartnership.com>
 <CANiq72m22Jb5_+62NnwX8xds2iUdWDMAqD8PZw9cuxdHd95W0A@mail.gmail.com>
 <fc45750b6d0277c401015b7aa11e16cd15f32ab2.camel@HansenPartnership.com>
 <CANiq72k5tpDoDPmJ0ZWc1DGqm+81Gi-uEENAtvEs9v3SZcx6_Q@mail.gmail.com> <4993259d01a0064f8bb22770503490f9252f3659.camel@HansenPartnership.com>
In-Reply-To: <4993259d01a0064f8bb22770503490f9252f3659.camel@HansenPartnership.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 25 Nov 2020 12:38:17 +0200
Message-ID: <CAHp75VfaewwkLsrht95Q7DaxFk7JpQjwx0KQ7Jvh5f7DUbZkRA@mail.gmail.com>
Subject: Re: [PATCH 000/141] Fix fall-through warnings for Clang
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Kees Cook <keescook@chromium.org>, 
	Jakub Kicinski <kuba@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	ALSA Development Mailing List <alsa-devel@alsa-project.org>, amd-gfx@lists.freedesktop.org, 
	bridge@lists.linux-foundation.org, ceph-devel@vger.kernel.org, 
	cluster-devel@redhat.com, coreteam@netfilter.org, 
	"open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>, 
	device-mapper development <dm-devel@redhat.com>, drbd-dev@lists.linbit.com, 
	dri-devel <dri-devel@lists.freedesktop.org>, GR-everest-linux-l2@marvell.com, 
	GR-Linux-NIC-Dev@marvell.com, intel-gfx <intel-gfx@lists.freedesktop.org>, 
	intel-wired-lan@lists.osuosl.org, keyrings@vger.kernel.org, 
	linux1394-devel@lists.sourceforge.net, 
	ACPI Devel Maling List <linux-acpi@vger.kernel.org>, linux-afs@lists.infradead.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-arm-msm@vger.kernel.org, 
	linux-atm-general@lists.sourceforge.net, linux-block@vger.kernel.org, 
	linux-can@vger.kernel.org, linux-cifs@vger.kernel.org, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, linux-decnet-user@lists.sourceforge.net, 
	Ext4 Developers List <linux-ext4@vger.kernel.org>, 
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>, linux-geode@lists.infradead.org, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-hams@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org, 
	linux-ide@vger.kernel.org, linux-iio <linux-iio@vger.kernel.org>, 
	linux-input <linux-input@vger.kernel.org>, 
	linux-integrity <linux-integrity@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, linux-mmc <linux-mmc@vger.kernel.org>, 
	Linux-MM <linux-mm@kvack.org>, 
	"open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>, linux-nfs@vger.kernel.org, 
	"open list:HFI1 DRIVER" <linux-rdma@vger.kernel.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, linux-scsi <linux-scsi@vger.kernel.org>, 
	linux-sctp@vger.kernel.org, 
	linux-security-module <linux-security-module@vger.kernel.org>, 
	linux-stm32@st-md-mailman.stormreply.com, USB <linux-usb@vger.kernel.org>, 
	linux-watchdog@vger.kernel.org, 
	linux-wireless <linux-wireless@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, netfilter-devel@vger.kernel.org, 
	nouveau@lists.freedesktop.org, op-tee@lists.trustedfirmware.org, 
	oss-drivers@netronome.com, patches@opensource.cirrus.com, 
	rds-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org, 
	samba-technical@lists.samba.org, selinux@vger.kernel.org, 
	target-devel <target-devel@vger.kernel.org>, tipc-discussion@lists.sourceforge.net, 
	usb-storage@lists.one-eyed-alien.net, 
	virtualization@lists.linux-foundation.org, wcn36xx@lists.infradead.org, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, xen-devel@lists.xenproject.org, 
	linux-hardening@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, 
	Nathan Chancellor <natechancellor@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Joe Perches <joe@perches.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 23, 2020 at 10:39 PM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
> On Mon, 2020-11-23 at 19:56 +0100, Miguel Ojeda wrote:
> > On Mon, Nov 23, 2020 at 4:58 PM James Bottomley
> > <James.Bottomley@hansenpartnership.com> wrote:

...

> > But if we do the math, for an author, at even 1 minute per line
> > change and assuming nothing can be automated at all, it would take 1
> > month of work. For maintainers, a couple of trivial lines is noise
> > compared to many other patches.
>
> So you think a one line patch should take one minute to produce ... I
> really don't think that's grounded in reality.  I suppose a one line
> patch only takes a minute to merge with b4 if no-one reviews or tests
> it, but that's not really desirable.

In my practice most of the one line patches were either to fix or to
introduce quite interesting issues.
1 minute is 2-3 orders less than usually needed for such patches.
That's why I don't like churn produced by people who often even didn't
compile their useful contributions.

-- 
With Best Regards,
Andy Shevchenko

