Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0222C8FF4
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 22:25:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41471.74638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjqfR-00039o-18; Mon, 30 Nov 2020 21:25:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41471.74638; Mon, 30 Nov 2020 21:25:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjqfQ-00039P-Te; Mon, 30 Nov 2020 21:25:04 +0000
Received: by outflank-mailman (input) for mailman id 41471;
 Mon, 30 Nov 2020 21:25:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qs/p=FE=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kjqfP-00039K-HM
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 21:25:03 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 99a77342-8768-4009-9563-bc1d3d4ffbc2;
 Mon, 30 Nov 2020 21:25:01 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4718A2076A;
 Mon, 30 Nov 2020 21:25:00 +0000 (UTC)
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
X-Inumbo-ID: 99a77342-8768-4009-9563-bc1d3d4ffbc2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606771500;
	bh=e540j0UGjlJbQMyrXi4CmNfYK65m/QwHyK8BV8E9HeQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=oYeuId2/wXss50ZBVp9lxYjQ7qc2/XAmsERie0V7XWJmsSKk/fT7/N+cxiqua7Tzn
	 dQm8HHCsPSxtSOFByoTITNOiMOBRe5gbCIGeOHKDAl54pXkQ0f4Y4+724uI+A2PTk5
	 ksoqwEWbZv8j2Q/a1EeemCjf5Ke/HBvhecmvGbkc=
Date: Mon, 30 Nov 2020 13:24:59 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Jan Beulich <jbeulich@suse.com>, Rahul Singh <Rahul.Singh@arm.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 3/3] ns16550: Gate all PCI code with CONFIG_X86
In-Reply-To: <F1A3739A-D07C-429F-AC7B-47F7E2710377@arm.com>
Message-ID: <alpine.DEB.2.21.2011301324510.1100@sstabellini-ThinkPad-T480s>
References: <cover.1606326929.git.rahul.singh@arm.com> <6d64bb35a6ce247faaa3df2ebae27b6bfa1d969e.1606326929.git.rahul.singh@arm.com> <bacfe1c3-d86d-95b2-c52a-4bb86f1338ea@suse.com> <F1A3739A-D07C-429F-AC7B-47F7E2710377@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 27 Nov 2020, Bertrand Marquis wrote:
> Hi Jan,
> 
> > On 27 Nov 2020, at 13:58, Jan Beulich <jbeulich@suse.com> wrote:
> > 
> > On 25.11.2020 19:16, Rahul Singh wrote:
> >> --- a/xen/drivers/char/ns16550.c
> >> +++ b/xen/drivers/char/ns16550.c
> >> @@ -16,7 +16,7 @@
> >> #include <xen/timer.h>
> >> #include <xen/serial.h>
> >> #include <xen/iocap.h>
> >> -#ifdef CONFIG_HAS_PCI
> >> +#if defined(CONFIG_X86) && defined(CONFIG_HAS_PCI)
> >> #include <xen/pci.h>
> >> #include <xen/pci_regs.h>
> >> #include <xen/pci_ids.h>
> >> @@ -51,7 +51,7 @@ static struct ns16550 {
> >>     unsigned int timeout_ms;
> >>     bool_t intr_works;
> >>     bool_t dw_usr_bsy;
> >> -#ifdef CONFIG_HAS_PCI
> >> +#if defined(CONFIG_X86) && defined(CONFIG_HAS_PCI)
> > 
> > I'm sorry to be picky, but this being a hack wants, imo, also calling
> > it so, by way of a code comment. Clearly this should go at one of the
> > first instances, yet neither of the two above are really suitable imo.
> > Hence I'm coming back to my prior suggestion of introducing a
> > consolidated #define without this becoming a Kconfig setting:
> > 
> > /*
> > * The PCI part of the code in this file currently is only known to
> > * work on x86. Undo this hack once the logic has been suitably
> > * abstracted.
> > */
> > #if defined(CONFIG_HAS_PCI) && defined(CONFIG_X86)
> > # define NS16550_PCI
> > #endif
> > 
> > And then use NS16550_PCI everywhere. I'd be fine making this
> > adjustment while committing, if I knew that (a) you're okay with it
> > and (b) the R-b and A-b you've already got can be kept.
> > 
> 
> Sounds ok to me so you can keep my R-b if you go this way.

I am OK with that too

