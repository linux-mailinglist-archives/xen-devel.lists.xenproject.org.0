Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 950518CD9F6
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 20:29:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728795.1133839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sADBG-0006Nx-8r; Thu, 23 May 2024 18:28:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728795.1133839; Thu, 23 May 2024 18:28:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sADBG-0006LO-5S; Thu, 23 May 2024 18:28:46 +0000
Received: by outflank-mailman (input) for mailman id 728795;
 Thu, 23 May 2024 18:28:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GulG=M2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sADBE-0006LG-EW
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 18:28:44 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47b9feb0-1932-11ef-b4bb-af5377834399;
 Thu, 23 May 2024 20:28:42 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C949E62E44;
 Thu, 23 May 2024 18:28:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F412C3277B;
 Thu, 23 May 2024 18:28:37 +0000 (UTC)
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
X-Inumbo-ID: 47b9feb0-1932-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716488920;
	bh=qTP9TCNRUITqhF7/35KayJJ23v85C/p79Jdz5qz3R5Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hl/jkFDNjFbixWdXRPwz2a2PUAyqeHYiWtFxwc91Tuzm+nkD9fuN9rgMOIVMuaeIh
	 RZdMf5AW2b6AUEr50iW7n+wwayDe93kHjQkgz4xfKntuViK72jV2Cd3deTVZ59al3g
	 7v3pU3XHF3rAgWOQBkPN+hwPFL3bA73Lq6s2hroHTlVJNKJvZ8l7JgQNE8AOs8fdhM
	 D27TkD74g6Z26gS0vNR5xuyCaqjBK132+VSiG3h2eAh7f6pDIh1q0/mhMCt+M74m0p
	 ZUZgLR0wJ6/VfHCl8vBFfAD80Q0DSNGmDYYvbyXemCIeKLhJtoEY7NWDp1QIeqRhmZ
	 LEOF6AJ582q+A==
Date: Thu, 23 May 2024 11:28:36 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org, 
    Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Christian Lindig <christian.lindig@citrix.com>, 
    David Scott <dave@recoil.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH for-4.19 v3 2/3] xen: enable altp2m at create domain
 domctl
In-Reply-To: <Zk8qOIIYeOtnNe_0@macbook>
Message-ID: <alpine.DEB.2.22.394.2405231128300.2557291@ubuntu-linux-20-04-desktop>
References: <20240517133352.94347-1-roger.pau@citrix.com> <20240517133352.94347-3-roger.pau@citrix.com> <Zk8qOIIYeOtnNe_0@macbook>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-476071889-1716488920=:2557291"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-476071889-1716488920=:2557291
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 23 May 2024, Roger Pau Monné wrote:
> On Fri, May 17, 2024 at 03:33:51PM +0200, Roger Pau Monne wrote:
> > Enabling it using an HVM param is fragile, and complicates the logic when
> > deciding whether options that interact with altp2m can also be enabled.
> > 
> > Leave the HVM param value for consumption by the guest, but prevent it from
> > being set.  Enabling is now done using and additional altp2m specific field in
> > xen_domctl_createdomain.
> > 
> > Note that albeit only currently implemented in x86, altp2m could be implemented
> > in other architectures, hence why the field is added to xen_domctl_createdomain
> > instead of xen_arch_domainconfig.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Changes since v2:
> >  - Introduce a new altp2m field in xen_domctl_createdomain.
> > 
> > Changes since v1:
> >  - New in this version.
> > ---
> >  tools/libs/light/libxl_create.c     | 23 ++++++++++++++++++++++-
> >  tools/libs/light/libxl_x86.c        | 26 ++++++++++++--------------
> >  tools/ocaml/libs/xc/xenctrl_stubs.c |  2 +-
> >  xen/arch/arm/domain.c               |  6 ++++++
> 
> Could I get an Ack from one of the Arm maintainers for the trivial Arm
> change?

Acked-by: Stefano Stabellini <sstabellini@kernel.org>
--8323329-476071889-1716488920=:2557291--

