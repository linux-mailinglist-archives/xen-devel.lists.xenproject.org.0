Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED142AC98DB
	for <lists+xen-devel@lfdr.de>; Sat, 31 May 2025 03:41:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1001825.1381955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLBDG-0001oh-NB; Sat, 31 May 2025 01:40:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1001825.1381955; Sat, 31 May 2025 01:40:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLBDG-0001lt-Jd; Sat, 31 May 2025 01:40:42 +0000
Received: by outflank-mailman (input) for mailman id 1001825;
 Sat, 31 May 2025 01:40:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ffab=YP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uLBDF-0001kU-E5
 for xen-devel@lists.xenproject.org; Sat, 31 May 2025 01:40:41 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4194fcfa-3dc0-11f0-a300-13f23c93f187;
 Sat, 31 May 2025 03:40:40 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A5E145C0FD5;
 Sat, 31 May 2025 01:38:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05D67C4CEEB;
 Sat, 31 May 2025 01:40:36 +0000 (UTC)
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
X-Inumbo-ID: 4194fcfa-3dc0-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748655638;
	bh=cP4o468SMUz9PkGeeZgcT/TphTTCv9bNJOcBT5Pvcak=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=FiHzGjxmqJMoZvX2mT5e6VF0CEwLToHHDVrj+qyLOWtCCBLw/XRuEhsSS2yNeVbni
	 2hZBCym+N3Qb9TuHjvMVOGUyiJiQbMU7mDxkxxLTogSj+sh0KeYclXg9UdZ3Mt0lUm
	 6BnB97Yb/1z900FUKcE/kJaAEiOWc2SUrBzB5H5s/L+d9FdK0aYfdBMp5TJQ8MkOhv
	 9GQHXxmx6uJZtnFbQ0yBa2pdyai0rTLA22wZ3Z2hxbi7IPOSPBmft8w4To5GmuqtuF
	 GkhOS75TDmR7Qhd9NjL9vb/cDbnqUdkWPqf0DJzD1RrH0st96sENNfbl36UyBJjebc
	 /+ewpIzV75dLg==
Date: Fri, 30 May 2025 18:40:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alejandro Vallejo <agarciav@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH 12/19] xen/dt: Move bootfdt functions to xen/bootfdt.h
In-Reply-To: <20250530120242.39398-13-agarciav@amd.com>
Message-ID: <alpine.DEB.2.22.394.2505301840040.1147082@ubuntu-linux-20-04-desktop>
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com> <20250530120242.39398-1-agarciav@amd.com> <20250530120242.39398-13-agarciav@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-491752089-1748655625=:1147082"
Content-ID: <alpine.DEB.2.22.394.2505301840330.1147082@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-491752089-1748655625=:1147082
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2505301840331.1147082@ubuntu-linux-20-04-desktop>

On Fri, 30 May 2025, Alejandro Vallejo wrote:
> Part of an unpicking process to extract bootfdt contents independent of bootinfo
> to a separate file for x86 to take.
> 
> Move functions required for early FDT parsing from device_tree.h and arm's
> setup.h onto bootfdt.h
> 
> Declaration motion only. Not a functional change.
> 
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>

I get this build error:

  CC      common/sysctl.o
In file included from ./include/xen/fdt-kernel.h:11,
                 from ./arch/x86/include/asm/bootinfo.h:12,
                 from arch/x86/hvm/dom0_build.c:19:
./include/xen/device_tree.h:112:19: error: field ‘dev’ has incomplete type
  112 |     struct device dev;
      |                   ^~~
--8323329-491752089-1748655625=:1147082--

