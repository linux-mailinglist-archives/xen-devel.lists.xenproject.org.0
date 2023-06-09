Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C00729EAC
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 17:36:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546171.852838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7eAJ-0003oC-Hy; Fri, 09 Jun 2023 15:36:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546171.852838; Fri, 09 Jun 2023 15:36:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7eAJ-0003mW-FE; Fri, 09 Jun 2023 15:36:39 +0000
Received: by outflank-mailman (input) for mailman id 546171;
 Fri, 09 Jun 2023 15:36:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NPzv=B5=anastas.io=shawn@srs-se1.protection.inumbo.net>)
 id 1q7eAI-0003mM-93
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 15:36:38 +0000
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a9dde04-06db-11ee-8611-37d641c3527e;
 Fri, 09 Jun 2023 17:36:36 +0200 (CEST)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by alpha.anastas.io (Postfix) with ESMTPSA id AB7E83F08F;
 Fri,  9 Jun 2023 08:36:33 -0700 (PDT)
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
X-Inumbo-ID: 6a9dde04-06db-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=anastas.io; s=mail;
	t=1686324994; bh=lSXMAsYDeVWFPSY6A7qzbx7MghefxAp3atYzJrE8tNw=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=jlZ3lX+/iZkn7HXtGI2AT+Hyov382pCcygncv57dB65Y1FF28sH3HjSRrLygsTfdA
	 m47DOEa1kFhWrh4XLCmfsarAevmptmJPPQy/Bic4yxJmNq3Q2pYypo2a5bUXefXLB7
	 lAxyDr0pkFFT3AsoIgwzFTGF1cKqu/D3MzaFIzmTrxRRzaumpgTHWNim3iM9pTrSfu
	 fqEbTtqDrExZoIm8rxeQpQNtwosSP5K8YKq9Am/C3yJO8ttuUFhkjXIfmmyB2eqWHJ
	 Ho4WAJhO+Dyy8e4CapXq5FH2fS52gS0rQeHkHuk+vjppUNhoNMCytwaXYEaDT2EGDJ
	 1grzfhuKs8CXA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Jun 2023 10:36:32 -0500
Message-Id: <CT88BJ3GHD7C.3872I1B4MCAWQ@Shawns-Mac-mini.lan>
Cc: <tpearson@raptorengineering.com>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>, "George Dunlap" <george.dunlap@citrix.com>,
 "Julien Grall" <julien@xen.org>, "Stefano Stabellini"
 <sstabellini@kernel.org>, "Wei Liu" <wl@xen.org>, "Shawn Anastasio"
 <shawnanastasio@raptorengineering.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/3] xen/ppc: Implement early serial printk on
 PaPR/pseries
From: "Shawn Anastasio" <shawn@anastas.io>
To: "Jan Beulich" <jbeulich@suse.com>
References: <cover.1686148363.git.shawn@anastas.io>
 <e9a4878544d264688578d7899867df7e8207aba5.1686148363.git.shawn@anastas.io>
 <0c0a19de-dde3-8b98-4354-6d3d2019179b@suse.com>
In-Reply-To: <0c0a19de-dde3-8b98-4354-6d3d2019179b@suse.com>

On Fri Jun 9, 2023 at 4:22 AM CDT, Jan Beulich wrote:
> >  xen/arch/ppc/Kconfig.debug               |   5 +
> >  xen/arch/ppc/Makefile                    |   3 +-
> >  xen/arch/ppc/boot_of.c                   | 122 +++++++++++++++++++++++
> >  xen/arch/ppc/configs/openpower_defconfig |   1 +
> >  xen/arch/ppc/early_printk.c              |  36 +++++++
> >  xen/arch/ppc/include/asm/boot.h          |  31 ++++++
> >  xen/arch/ppc/include/asm/bug.h           |   6 ++
> >  xen/arch/ppc/include/asm/byteorder.h     |  74 ++++++++++++++
> >  xen/arch/ppc/include/asm/cache.h         |   6 ++
> >  xen/arch/ppc/include/asm/config.h        |   3 +
> >  xen/arch/ppc/include/asm/early_printk.h  |  14 +++
> >  xen/arch/ppc/include/asm/processor.h     |  54 +++++++++-
> >  xen/arch/ppc/include/asm/string.h        |   6 ++
> >  xen/arch/ppc/include/asm/types.h         |  64 ++++++++++++
> >  xen/arch/ppc/ppc64/asm-offsets.c         |  55 ++++++++++
> >  xen/arch/ppc/ppc64/head.S                |  59 +++++++++++
> >  xen/arch/ppc/setup.c                     |  20 +++-
> >  17 files changed, 555 insertions(+), 4 deletions(-)
> >  create mode 100644 xen/arch/ppc/boot_of.c
>
> Unless required, in new additions we tend to prefer dashes over
> underscores. In filenames it is pretty rare that dashes really need
> avoiding.

Thanks for pointing that out -- I'll fix this in v2.

> > --- a/xen/arch/ppc/Kconfig.debug
> > +++ b/xen/arch/ppc/Kconfig.debug
> > @@ -0,0 +1,5 @@
> > +config EARLY_PRINTK
> > +    bool "Enable early printk"
> > +    default DEBUG
> > +    help
> > +      Enables early printk debug messages
> > \ No newline at end of file
>
> There are many examples of this throughout the patch, which you want to
> take care of.

Ditto.

> > --- /dev/null
> > +++ b/xen/arch/ppc/boot_of.c
> > @@ -0,0 +1,122 @@
> > +/* SPDX-License-Identifier: GPL-2.0-or-later */
>
> By default we mean to use ...
>
> > --- /dev/null
> > +++ b/xen/arch/ppc/early_printk.c
> > @@ -0,0 +1,36 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
>
> ... the more modern form of this (GPL-2.0-only). Anything deviating from
> that may want justifying in the description.

Got it -- I'll clean this up as well.

> Jan

Thanks,
Shawn


