Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F5B449980
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 17:22:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223508.386259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk7P8-0003xX-CT; Mon, 08 Nov 2021 16:21:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223508.386259; Mon, 08 Nov 2021 16:21:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk7P8-0003ut-8O; Mon, 08 Nov 2021 16:21:54 +0000
Received: by outflank-mailman (input) for mailman id 223508;
 Mon, 08 Nov 2021 16:21:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uasK=P3=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1mk7P6-0003uX-Uf
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 16:21:52 +0000
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fae40eea-40af-11ec-9787-a32c541c8605;
 Mon, 08 Nov 2021 17:21:51 +0100 (CET)
Received: from zn.tnic (p200300ec2f331100181cb4ce2fe9e1de.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f33:1100:181c:b4ce:2fe9:e1de])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 071501EC0503;
 Mon,  8 Nov 2021 17:21:51 +0100 (CET)
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
X-Inumbo-ID: fae40eea-40af-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1636388511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=BmhP/O36y2kgWhY9wVesOsCT3VZHRN0l2HSALpf1H38=;
	b=PwrrR1/9r0PtkEkx8l94Lq5o8cthN3NxILevAwj1LoIRoN/B58W84rM+iyPPtwIBmVMRtG
	8jlUd2DAmGqQe7+sK0xny6az8RzdndQG0jeU2pdwyReIQXuaywQhQg+JKE/uRG6ku5v9jN
	K5y81X7+5Pp2iJVW5AZDozV+KOdqQTY=
Date: Mon, 8 Nov 2021 17:21:45 +0100
From: Borislav Petkov <bp@alien8.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, Arnd Bergmann <arnd@arndb.de>,
	Ayush Sawal <ayush.sawal@chelsio.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rohit Maheshwari <rohitm@chelsio.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Vinay Kumar Yadav <vinay.yadav@chelsio.com>,
	ALSA Development Mailing List <alsa-devel@alsa-project.org>,
	bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
	Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
	intel-gvt-dev@lists.freedesktop.org,
	alpha <linux-alpha@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	linux-edac@vger.kernel.org,
	Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
	linux-hyperv@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-leds <linux-leds@vger.kernel.org>,
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
	Parisc List <linux-parisc@vger.kernel.org>,
	Linux PM list <linux-pm@vger.kernel.org>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	"open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	linux-s390 <linux-s390@vger.kernel.org>,
	scsi <linux-scsi@vger.kernel.org>,
	Linux-sh list <linux-sh@vger.kernel.org>,
	linux-staging@lists.linux.dev,
	linux-tegra <linux-tegra@vger.kernel.org>,
	linux-um <linux-um@lists.infradead.org>,
	USB list <linux-usb@vger.kernel.org>,
	"open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>,
	netdev <netdev@vger.kernel.org>,
	openipmi-developer@lists.sourceforge.net, rcu@vger.kernel.org,
	sparclinux <sparclinux@vger.kernel.org>,
	the arch/x86 maintainers <x86@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v0 42/42] notifier: Return an error when callback is
 already registered
Message-ID: <YYlOmd0AeA8DSluD@zn.tnic>
References: <20211108101157.15189-1-bp@alien8.de>
 <20211108101157.15189-43-bp@alien8.de>
 <CAMuHMdWH+txiSP_d7Jc4f_bU8Lf9iWpT4E3o5o7BJr-YdA6-VA@mail.gmail.com>
 <YYkyUEqcsOwQMb1S@zn.tnic>
 <CAMuHMdXiBEQyEXJagSfpH44hxVA2t0sDH7B7YubLGHrb2MJLLA@mail.gmail.com>
 <YYlJQYLiIrhjwOmT@zn.tnic>
 <CAMuHMdXHikGrmUzuq0WG5JRHUUE=5zsaVCTF+e4TiHpM5tc5kA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdXHikGrmUzuq0WG5JRHUUE=5zsaVCTF+e4TiHpM5tc5kA@mail.gmail.com>

On Mon, Nov 08, 2021 at 05:12:16PM +0100, Geert Uytterhoeven wrote:
> Returning void is the other extreme ;-)
> 
> There are 3 levels (ignoring BUG_ON()/panic () inside the callee):
>   1. Return void: no one can check success or failure,
>   2. Return an error code: up to the caller to decide,
>   3. Return a __must_check error code: every caller must check.
> 
> I'm in favor of 2, as there are several places where it cannot fail.

Makes sense to me. I'll do that in the next iteration.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

