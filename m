Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A747A4498D0
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 17:00:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223492.386236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk739-00083L-C7; Mon, 08 Nov 2021 15:59:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223492.386236; Mon, 08 Nov 2021 15:59:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk739-00080w-8x; Mon, 08 Nov 2021 15:59:11 +0000
Received: by outflank-mailman (input) for mailman id 223492;
 Mon, 08 Nov 2021 15:59:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uasK=P3=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1mk738-00080S-71
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 15:59:10 +0000
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce9f4b34-40ac-11ec-9787-a32c541c8605;
 Mon, 08 Nov 2021 16:59:09 +0100 (CET)
Received: from zn.tnic (p200300ec2f331100b486bab6e60d7aaf.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f33:1100:b486:bab6:e60d:7aaf])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 341131EC04DE;
 Mon,  8 Nov 2021 16:59:08 +0100 (CET)
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
X-Inumbo-ID: ce9f4b34-40ac-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1636387148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=JALJsenIQCt4BletZS/B+Zq0YBxBp6L9Ch45cvOw8XQ=;
	b=LCBDSZEhct23FIVquhfAlhIS3MpLXm84rotG+ppp99dGMPWi9iJHGgKkfiFg0DoLQ+NSWf
	ixY2Bl+WafqAknd6kFkKb4q9SvLPR/pI4iyCTMD6S/zki4CWzqH6/1ZBq8awazUNWt4Xi0
	idSLz3mdlao9wfI9n1SzGKhLH2sR0dI=
Date: Mon, 8 Nov 2021 16:58:57 +0100
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
Message-ID: <YYlJQYLiIrhjwOmT@zn.tnic>
References: <20211108101157.15189-1-bp@alien8.de>
 <20211108101157.15189-43-bp@alien8.de>
 <CAMuHMdWH+txiSP_d7Jc4f_bU8Lf9iWpT4E3o5o7BJr-YdA6-VA@mail.gmail.com>
 <YYkyUEqcsOwQMb1S@zn.tnic>
 <CAMuHMdXiBEQyEXJagSfpH44hxVA2t0sDH7B7YubLGHrb2MJLLA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdXiBEQyEXJagSfpH44hxVA2t0sDH7B7YubLGHrb2MJLLA@mail.gmail.com>

On Mon, Nov 08, 2021 at 04:25:47PM +0100, Geert Uytterhoeven wrote:
> I'm not against returning proper errors codes.  I'm against forcing
> callers to check things that cannot fail and to add individual error
> printing to each and every caller.

If you're against checking things at the callers, then the registration
function should be void. IOW, those APIs are not optimally designed atm.

> Note that in other areas, we are moving in the other direction,
> to a centralized printing of error messages, cfr. e.g. commit
> 7723f4c5ecdb8d83 ("driver core: platform: Add an error message to
> platform_get_irq*()").

Yes, thus my other idea to add a lower level __notifier_chain_register()
to do the checking.

I'll see if I can convert those notifier registration functions to
return void, in the process. But let's see what the others think first.

Thanks for taking the time.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

