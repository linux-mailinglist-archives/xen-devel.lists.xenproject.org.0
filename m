Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC86A449947
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 17:12:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223501.386248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk7G4-0002Sr-G3; Mon, 08 Nov 2021 16:12:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223501.386248; Mon, 08 Nov 2021 16:12:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk7G4-0002PY-CU; Mon, 08 Nov 2021 16:12:32 +0000
Received: by outflank-mailman (input) for mailman id 223501;
 Mon, 08 Nov 2021 16:12:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tVlX=P3=gmail.com=geert.uytterhoeven@srs-se1.protection.inumbo.net>)
 id 1mk7G3-0002PS-9x
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 16:12:31 +0000
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com
 [209.85.222.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id abe4b77b-40ae-11ec-a9d2-d9f7a1cc8784;
 Mon, 08 Nov 2021 17:12:30 +0100 (CET)
Received: by mail-ua1-f50.google.com with SMTP id q13so32559676uaq.2
 for <xen-devel@lists.xenproject.org>; Mon, 08 Nov 2021 08:12:30 -0800 (PST)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com.
 [209.85.221.181])
 by smtp.gmail.com with ESMTPSA id j126sm2496418vsc.17.2021.11.08.08.12.27
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 08:12:27 -0800 (PST)
Received: by mail-vk1-f181.google.com with SMTP id f78so6379000vka.5
 for <xen-devel@lists.xenproject.org>; Mon, 08 Nov 2021 08:12:27 -0800 (PST)
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
X-Inumbo-ID: abe4b77b-40ae-11ec-a9d2-d9f7a1cc8784
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hEQQmRj7LTpJogPgt2xRVOX7N+txus6iMmGepIZghfU=;
        b=2VnckiAsO1uFXGD9Dj9uNSq4IgEVrO2agSPymZUuhgt19s1rkmvKNjJI7HffiXt6vV
         hKK2eYLULtWgQSOTmIWMOhQsAPVHeOdO0XYpkTRDYlYMW2glUeYYDBAm2Iaj21VOEPXF
         7EDCSSHZsD2Sf0l7SObWtpPq+7mIoXjsKbskMCIpVt25bHLBwS5g1zIZiPdn0eYoz47n
         ks4lY0eMmkCd3+vsqwQIczfZChbchTYgiSMlDtaAqM6CpDAE14gFw6gAZiAFYELC9z1v
         kfaJKHMI7bzXvJQrWM2XRmAWhzayE3nVr68iWoNiMjA8PzYabZvzraLHEkKjJeKssQL+
         J3kg==
X-Gm-Message-State: AOAM530kFlxdU/rlTS1nf6+WNrrus2fx9WyNPL/kr/oY4opT18CZCwiU
	9va/B+iS4/o2EDZKf3jZfRT/6ia7mnw5cY2N
X-Google-Smtp-Source: ABdhPJwc2ba8eTqzvs6aoNFZVs4yF8uM0d7uC7CRQe40pper06ZJi4ustzn2kVfixLKu6jTcU7igOg==
X-Received: by 2002:a67:d491:: with SMTP id g17mr137662vsj.41.1636387948682;
        Mon, 08 Nov 2021 08:12:28 -0800 (PST)
X-Received: by 2002:a1f:f24f:: with SMTP id q76mr347755vkh.11.1636387947335;
 Mon, 08 Nov 2021 08:12:27 -0800 (PST)
MIME-Version: 1.0
References: <20211108101157.15189-1-bp@alien8.de> <20211108101157.15189-43-bp@alien8.de>
 <CAMuHMdWH+txiSP_d7Jc4f_bU8Lf9iWpT4E3o5o7BJr-YdA6-VA@mail.gmail.com>
 <YYkyUEqcsOwQMb1S@zn.tnic> <CAMuHMdXiBEQyEXJagSfpH44hxVA2t0sDH7B7YubLGHrb2MJLLA@mail.gmail.com>
 <YYlJQYLiIrhjwOmT@zn.tnic>
In-Reply-To: <YYlJQYLiIrhjwOmT@zn.tnic>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 8 Nov 2021 17:12:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXHikGrmUzuq0WG5JRHUUE=5zsaVCTF+e4TiHpM5tc5kA@mail.gmail.com>
Message-ID: <CAMuHMdXHikGrmUzuq0WG5JRHUUE=5zsaVCTF+e4TiHpM5tc5kA@mail.gmail.com>
Subject: Re: [PATCH v0 42/42] notifier: Return an error when callback is
 already registered
To: Borislav Petkov <bp@alien8.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Arnd Bergmann <arnd@arndb.de>, Ayush Sawal <ayush.sawal@chelsio.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rohit Maheshwari <rohitm@chelsio.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Vinay Kumar Yadav <vinay.yadav@chelsio.com>, 
	ALSA Development Mailing List <alsa-devel@alsa-project.org>, 
	bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, 
	Intel Graphics Development <intel-gfx@lists.freedesktop.org>, intel-gvt-dev@lists.freedesktop.org, 
	alpha <linux-alpha@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-clk <linux-clk@vger.kernel.org>, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, linux-edac@vger.kernel.org, 
	Linux Fbdev development list <linux-fbdev@vger.kernel.org>, linux-hyperv@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-leds <linux-leds@vger.kernel.org>, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, Parisc List <linux-parisc@vger.kernel.org>, 
	Linux PM list <linux-pm@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	"open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, linux-s390 <linux-s390@vger.kernel.org>, 
	scsi <linux-scsi@vger.kernel.org>, Linux-sh list <linux-sh@vger.kernel.org>, 
	linux-staging@lists.linux.dev, linux-tegra <linux-tegra@vger.kernel.org>, 
	linux-um <linux-um@lists.infradead.org>, USB list <linux-usb@vger.kernel.org>, 
	"open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>, netdev <netdev@vger.kernel.org>, 
	openipmi-developer@lists.sourceforge.net, rcu@vger.kernel.org, 
	sparclinux <sparclinux@vger.kernel.org>, "the arch/x86 maintainers" <x86@kernel.org>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

Hi Borislav,

On Mon, Nov 8, 2021 at 4:59 PM Borislav Petkov <bp@alien8.de> wrote:
> On Mon, Nov 08, 2021 at 04:25:47PM +0100, Geert Uytterhoeven wrote:
> > I'm not against returning proper errors codes.  I'm against forcing
> > callers to check things that cannot fail and to add individual error
> > printing to each and every caller.
>
> If you're against checking things at the callers, then the registration
> function should be void. IOW, those APIs are not optimally designed atm.

Returning void is the other extreme ;-)

There are 3 levels (ignoring BUG_ON()/panic () inside the callee):
  1. Return void: no one can check success or failure,
  2. Return an error code: up to the caller to decide,
  3. Return a __must_check error code: every caller must check.

I'm in favor of 2, as there are several places where it cannot fail.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

