Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B32B48947
	for <lists+xen-devel@lfdr.de>; Mon,  8 Sep 2025 11:59:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1115055.1461814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvYeg-0006Y7-05; Mon, 08 Sep 2025 09:59:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1115055.1461814; Mon, 08 Sep 2025 09:59:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvYef-0006Vb-Tf; Mon, 08 Sep 2025 09:59:21 +0000
Received: by outflank-mailman (input) for mailman id 1115055;
 Mon, 08 Sep 2025 09:59:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1uvYee-0006VV-E4
 for xen-devel@lists.xenproject.org; Mon, 08 Sep 2025 09:59:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uvYed-0000zy-1Q;
 Mon, 08 Sep 2025 09:59:19 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uvYed-0001pP-1M;
 Mon, 08 Sep 2025 09:59:19 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From;
	bh=ponBd/BvXf8SRYR0F16CgS3Bp6jEb5iKyZNyjPltp8o=; b=vdOXSidGM8JPSxwqpHms88wnmp
	AdBotisDuxRkTWH3RMScVtib1X0rJyOdK5ASSrNxinQGfH6hccVf8/imTndoduV+Odj2Pwxfd/SM1
	GX65re3qVuaXhut/ESwK8fuLuXJH9mJ7LU4s+calcY3EvPOhWHqtBZ2gmQO4rFfB/qUU=;
From: dmukhin@xen.org
Date: Mon, 8 Sep 2025 02:59:18 -0700
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
	michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
	dmukhin@ford.com
Subject: Re: [PATCH v6 03/15] emul/ns16x50: implement emulator stub
Message-ID: <aL6o9u0t6rtFFfaA@kraken>
References: <20250905232715.440758-1-dmukhin@ford.com>
 <20250905232715.440758-4-dmukhin@ford.com>
 <CAGeoDV8cGyKZCXpm=U5FkjBi701T2Cku39DM9iFMGRUBFN5mPA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGeoDV8cGyKZCXpm=U5FkjBi701T2Cku39DM9iFMGRUBFN5mPA@mail.gmail.com>

On Mon, Sep 08, 2025 at 11:37:03AM +0300, Mykola Kvach wrote:
> > --- a/xen/common/emul/vuart/Kconfig
> > +++ b/xen/common/emul/vuart/Kconfig
> > @@ -3,4 +3,23 @@ config VUART_FRAMEWORK
> >
> >  menu "UART Emulation"
> >
> > +config VUART_NS16X50
> > +       bool "NS16550-compatible UART Emulator" if EXPERT
> > +       depends on X86 && HVM
> 
> Currently VUART_NS16X50 depends on X86, so the code is only
> usable on x86. Are there any plans to support this vUART on non-x86
> architectures (e.g. ARM, where some UARTs are also ns16550-compatible)?

The plan is to add MMIO-based implementation for x86 first.

> 
> If not, wouldn’t it be more appropriate to move the ns16x50-specific
> implementation into x86-specific directories instead of common?

There was discussion on that and the agreement is to move all vUARTs into
  common/emul/vuart

and start using common/emul as a placeholder for common emulation code,
including vPCI.

