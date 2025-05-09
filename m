Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3A5AB1E9C
	for <lists+xen-devel@lfdr.de>; Fri,  9 May 2025 22:59:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.980357.1366808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDUnc-0003ch-N8; Fri, 09 May 2025 20:58:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 980357.1366808; Fri, 09 May 2025 20:58:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDUnc-0003aS-IV; Fri, 09 May 2025 20:58:28 +0000
Received: by outflank-mailman (input) for mailman id 980357;
 Fri, 09 May 2025 20:58:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/D4s=XZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uDUnb-0003WD-9I
 for xen-devel@lists.xenproject.org; Fri, 09 May 2025 20:58:27 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58e758b4-2d18-11f0-9ffb-bf95429c2676;
 Fri, 09 May 2025 22:58:25 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EF5CB5C6FC1;
 Fri,  9 May 2025 20:56:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72EBFC4CEE4;
 Fri,  9 May 2025 20:58:21 +0000 (UTC)
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
X-Inumbo-ID: 58e758b4-2d18-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746824302;
	bh=u2AWSetSUJhmNlXEH4dSW8wBTn5jC6BHIXmV000zeG4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=uq8+iXX4ScflS/6+388EIRegAAde8w+ii4f6tysBLk17s1tDHuKUlC9KSgw706RMd
	 I+aC4YUBCY8KH+AAeqN/l5qVxY0LeMBcdXvKhSDkBevDaMcUFUDB9mZ+bDAV6wmumD
	 9uzbZbMKBqP/7I/4Fm8cyIdqo7rb4kIGb33QEGAPPtyu4xPuNrnKwDgNuIPedKYF0w
	 ENqXpnD4n3b1UwUFRCEe/Oaia21xI2U7pNJe+JaVvJtJ/+npaoY54WXm+vU+3tif7u
	 M8VuDjeiOAeResXkrksj1fFFR35WuUIX8AsB9/yTLfQYcfav2/ePzn1SnZqXhnRTJ+
	 nyyW+sR7EpZ+A==
Date: Fri, 9 May 2025 13:58:20 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
cc: Stewart Hildebrand <stewart.hildebrand@amd.com>, 
    xen-devel@lists.xenproject.org, 
    Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Jiqian Chen <Jiqian.Chen@amd.com>, 
    Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: Re: [PATCH v21 2/2] vpci: translate virtual PCI bus topology for
 guests
In-Reply-To: <aB3Ld3Lia7KXh3t4@macbook.lan>
Message-ID: <alpine.DEB.2.22.394.2505091358140.3879245@ubuntu-linux-20-04-desktop>
References: <20250508104608.531079-1-stewart.hildebrand@amd.com> <20250508104608.531079-3-stewart.hildebrand@amd.com> <aB3Ld3Lia7KXh3t4@macbook.lan>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-287068339-1746824302=:3879245"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-287068339-1746824302=:3879245
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 9 May 2025, Roger Pau Monné wrote:
> On Thu, May 08, 2025 at 06:46:07AM -0400, Stewart Hildebrand wrote:
> > From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> > 
> > There are two originators for the PCI configuration space access:
> > 1. The domain that owns physical host bridge: MMIO handlers are
> > there so we can update vPCI register handlers with the values
> > written by the hardware domain, e.g. physical view of the registers
> > vs guest's view on the configuration space.
> > 2. Guest access to the passed through PCI devices: we need to properly
> > map virtual bus topology to the physical one, e.g. pass the configuration
> > space access to the corresponding physical devices.
> > 
> > Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> > Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> > Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> There's the addition of the ASSERTs in vpci_mmio_{read,write}() which
> could do with an ARM maintainer Ack/RB.

Acked-by: Stefano Stabellini <sstabellini@kernel.org>
--8323329-287068339-1746824302=:3879245--

