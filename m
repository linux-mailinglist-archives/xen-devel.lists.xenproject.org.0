Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C578449D79
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 22:00:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223604.386364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkBjv-0001QE-A8; Mon, 08 Nov 2021 20:59:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223604.386364; Mon, 08 Nov 2021 20:59:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkBjv-0001Nr-6P; Mon, 08 Nov 2021 20:59:39 +0000
Received: by outflank-mailman (input) for mailman id 223604;
 Mon, 08 Nov 2021 20:59:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ivRQ=P3=netrider.rowland.org=stern+618c59fc@srs-se1.protection.inumbo.net>)
 id 1mkBjt-0001Nk-JF
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 20:59:37 +0000
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
 by se1-gles-flk1.inumbo.com (Halon) with SMTP
 id c4776647-40d6-11ec-a9d2-d9f7a1cc8784;
 Mon, 08 Nov 2021 21:59:35 +0100 (CET)
Received: (qmail 1679175 invoked by uid 1000); 8 Nov 2021 15:59:26 -0500
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
X-Inumbo-ID: c4776647-40d6-11ec-a9d2-d9f7a1cc8784
Date: Mon, 8 Nov 2021 15:59:26 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Borislav Petkov <bp@alien8.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
  LKML <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
  Arnd Bergmann <arnd@arndb.de>, Ayush Sawal <ayush.sawal@chelsio.com>,
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
  Rohit Maheshwari <rohitm@chelsio.com>, Steven Rostedt <rostedt@goodmis.org>,
  Vinay Kumar Yadav <vinay.yadav@chelsio.com>,
  ALSA Development Mailing List <alsa-devel@alsa-project.org>,
  bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
  Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
  intel-gvt-dev@lists.freedesktop.org, alpha <linux-alpha@vger.kernel.org>,
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
  "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>,
  Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
  linux-s390 <linux-s390@vger.kernel.org>, scsi <linux-scsi@vger.kernel.org>,
  Linux-sh list <linux-sh@vger.kernel.org>, linux-staging@lists.linux.dev,
  linux-tegra <linux-tegra@vger.kernel.org>,
  linux-um <linux-um@lists.infradead.org>,
  USB list <linux-usb@vger.kernel.org>,
  "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
  netdev <netdev@vger.kernel.org>, openipmi-developer@lists.sourceforge.net,
  rcu@vger.kernel.org, sparclinux <sparclinux@vger.kernel.org>,
  the arch/x86 maintainers <x86@kernel.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v0 42/42] notifier: Return an error when callback is
 already registered
Message-ID: <20211108205926.GA1678880@rowland.harvard.edu>
References: <20211108101157.15189-1-bp@alien8.de>
 <20211108101157.15189-43-bp@alien8.de>
 <CAMuHMdWH+txiSP_d7Jc4f_bU8Lf9iWpT4E3o5o7BJr-YdA6-VA@mail.gmail.com>
 <YYkyUEqcsOwQMb1S@zn.tnic>
 <CAMuHMdXiBEQyEXJagSfpH44hxVA2t0sDH7B7YubLGHrb2MJLLA@mail.gmail.com>
 <YYlJQYLiIrhjwOmT@zn.tnic>
 <CAMuHMdXHikGrmUzuq0WG5JRHUUE=5zsaVCTF+e4TiHpM5tc5kA@mail.gmail.com>
 <YYlOmd0AeA8DSluD@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YYlOmd0AeA8DSluD@zn.tnic>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Mon, Nov 08, 2021 at 05:21:45PM +0100, Borislav Petkov wrote:
> On Mon, Nov 08, 2021 at 05:12:16PM +0100, Geert Uytterhoeven wrote:
> > Returning void is the other extreme ;-)
> > 
> > There are 3 levels (ignoring BUG_ON()/panic () inside the callee):
> >   1. Return void: no one can check success or failure,
> >   2. Return an error code: up to the caller to decide,
> >   3. Return a __must_check error code: every caller must check.
> > 
> > I'm in favor of 2, as there are several places where it cannot fail.
> 
> Makes sense to me. I'll do that in the next iteration.

Is there really any reason for returning an error code?  For example, is 
it anticipated that at some point in the future these registration calls 
might fail?

Currently, the only reason for failing to register a notifier callback 
is because the callback is already registered.  In a sense this isn't 
even an actual failure -- after the registration returns the callback 
_will_ still be registered.

So if the call can never really fail, why bother with a return code?  
Especially since the caller can't do anything with such a code value.

Given the current state of affairs, I vote in favor of 1 (plus a WARN or 
something similar to generate a stack dump in the callee, since double 
registration really is a bug).

Alan Stern

