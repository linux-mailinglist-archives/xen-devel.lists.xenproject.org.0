Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 374A5446749
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 17:49:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222557.384820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mj2Oo-0004sR-3E; Fri, 05 Nov 2021 16:49:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222557.384820; Fri, 05 Nov 2021 16:49:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mj2On-0004py-W0; Fri, 05 Nov 2021 16:49:05 +0000
Received: by outflank-mailman (input) for mailman id 222557;
 Fri, 05 Nov 2021 16:49:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SvBC=PY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mj2Om-0004pq-KF
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 16:49:04 +0000
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47b702f8-3e58-11ec-9787-a32c541c8605;
 Fri, 05 Nov 2021 17:49:03 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 81A3761037;
 Fri,  5 Nov 2021 16:49:01 +0000 (UTC)
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
X-Inumbo-ID: 47b702f8-3e58-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1636130941;
	bh=Ob6jmUVFHpoqp+Bd6PCq3dkOFXqAwnB25Cvt93I8oD8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kKzFo2OpPKHkjszXUh+r7Efm/L0h64e5hq5SXWvCLHVwO2KMk8KYlXFisK8DxyKr/
	 k89/UqqY1WTcH2WikNoqyIJw6e6y4NJ2FpT4JFQXIT6BLdnwamxH8z6D67PbALAsjK
	 oWTdTkVhfj3xi20/CcmpH+Hx7eZ55EPBuiAF3dO/fE9lNtmv0H5LvuBg2+jydyirgp
	 9odQa/RAB0oJBgNrzLELr9G7s9GH/1LeEpUppJekJyykjYCvDFKXB7RLXo+bnDdffW
	 uSBGa6JrUAhrtZqG0UUsKBPbvUrwG52WI+iI1eaQskkhYcx/Gd0xZ8MOe8jAxla4bX
	 kp1Gf8M7VFUTg==
Date: Fri, 5 Nov 2021 09:49:00 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ian Jackson <iwj@xenproject.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Luca Fancellu <Luca.Fancellu@arm.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Wei  Chen <Wei.Chen@arm.com>, Julien Grall <julien@xen.org>, 
    Volodymyr  Babchuk <Volodymyr_Babchuk@epam.com>, 
    Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH-4.16 v4] xen/efi: Fix Grub2 boot on arm64
In-Reply-To: <24965.23144.983207.25672@mariner.uk.xensource.com>
Message-ID: <alpine.DEB.2.22.394.2111050947360.284830@ubuntu-linux-20-04-desktop>
References: <20211105130728.30648-1-luca.fancellu@arm.com> <445836DF-C831-4478-B4C7-2D98E2258FD2@arm.com> <24965.21767.924957.937812@mariner.uk.xensource.com> <alpine.DEB.2.22.394.2111050914390.284830@ubuntu-linux-20-04-desktop>
 <24965.23144.983207.25672@mariner.uk.xensource.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 5 Nov 2021, Ian Jackson wrote:
> Stefano Stabellini writes ("Re: [PATCH-4.16 v4] xen/efi: Fix Grub2 boot on arm64"):
> > I had a question for Jan, but in reply to the previous version of the
> > patch so you might have missed it:
> > 
> > https://lore.kernel.org/all/alpine.DEB.2.22.394.2111050825240.284830@ubuntu-linux-20-04-desktop/
> 
> Ah.  Yes.  I saw that but hadn't realised it might be a blocker.
> 
> > However, the concern is about resource utilization and slowness, rather
> > than correctness, so I think the version of the patch you committed
> > should work OK (unless it turns out that with broken EFI firmware
> > opening HandleProtocol/OpenVolume and closing it many times causes
> > some sort of error.) So maybe for 4.16 we are OK as is and we can make
> > any changes (if necessary) for 4.17.
> 
> I hope you are OK with this being in-tree now.  If not please let me
> know ASAP and I could revert it.  I'd be happy to consider a followup
> patch on its merits, of course.

As mentioned on IRC, I would keep it. I think it should be OK, the only
potential issues are:
- slowness (not a blocker)
- broken firmware (this is me being a bit paranoid, with firmware one
  never knows)

We can address both later separately if we need to.

