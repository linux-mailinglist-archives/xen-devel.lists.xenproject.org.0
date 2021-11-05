Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F77E4466ED
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 17:23:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222541.384797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mj1zm-0001q5-G7; Fri, 05 Nov 2021 16:23:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222541.384797; Fri, 05 Nov 2021 16:23:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mj1zm-0001nm-Cz; Fri, 05 Nov 2021 16:23:14 +0000
Received: by outflank-mailman (input) for mailman id 222541;
 Fri, 05 Nov 2021 16:23:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mj1zk-0001ng-EQ
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 16:23:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mj1zk-00031o-C2
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 16:23:12 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mj1zk-00087J-AL
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 16:23:12 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mj1zd-0006bx-D4; Fri, 05 Nov 2021 16:23:05 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=nMKZ3UYv/kkT4uVQ4Ooy+r3P3hVBcGwfDbCLXpwqLa0=; b=uAxVHL3IIA9J0YD11XNcQT/ed8
	z32oCVBjEmhvqjVJzsSlwMu9Uy18M+RaJ0lFze+ZfX9B6sdnUL1cEBNpboauOFHhkVqRKEhLUg9pd
	gFzWO+9agjCd6A1lPDkoDKzes/3DznY2IvwODwW5kxLu/poHWnDC2XkHSiHfYnV/yF6E=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24965.23144.983207.25672@mariner.uk.xensource.com>
Date: Fri, 5 Nov 2021 16:23:04 +0000
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
    Luca Fancellu <Luca.Fancellu@arm.com>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Wei  Chen <Wei.Chen@arm.com>,
    Julien Grall <julien@xen.org>,
    Volodymyr  Babchuk <Volodymyr_Babchuk@epam.com>,
    Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH-4.16 v4] xen/efi: Fix Grub2 boot on arm64
In-Reply-To: <alpine.DEB.2.22.394.2111050914390.284830@ubuntu-linux-20-04-desktop>
References: <20211105130728.30648-1-luca.fancellu@arm.com>
	<445836DF-C831-4478-B4C7-2D98E2258FD2@arm.com>
	<24965.21767.924957.937812@mariner.uk.xensource.com>
	<alpine.DEB.2.22.394.2111050914390.284830@ubuntu-linux-20-04-desktop>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Stefano Stabellini writes ("Re: [PATCH-4.16 v4] xen/efi: Fix Grub2 boot on arm64"):
> I had a question for Jan, but in reply to the previous version of the
> patch so you might have missed it:
> 
> https://lore.kernel.org/all/alpine.DEB.2.22.394.2111050825240.284830@ubuntu-linux-20-04-desktop/

Ah.  Yes.  I saw that but hadn't realised it might be a blocker.

> However, the concern is about resource utilization and slowness, rather
> than correctness, so I think the version of the patch you committed
> should work OK (unless it turns out that with broken EFI firmware
> opening HandleProtocol/OpenVolume and closing it many times causes
> some sort of error.) So maybe for 4.16 we are OK as is and we can make
> any changes (if necessary) for 4.17.

I hope you are OK with this being in-tree now.  If not please let me
know ASAP and I could revert it.  I'd be happy to consider a followup
patch on its merits, of course.

Thanks,
Ian.

