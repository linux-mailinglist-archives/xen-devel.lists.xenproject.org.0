Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51ADBAD9965
	for <lists+xen-devel@lfdr.de>; Sat, 14 Jun 2025 03:22:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1015172.1393107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQFb8-00031T-0V; Sat, 14 Jun 2025 01:22:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1015172.1393107; Sat, 14 Jun 2025 01:22:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQFb7-0002yr-Tt; Sat, 14 Jun 2025 01:22:17 +0000
Received: by outflank-mailman (input) for mailman id 1015172;
 Sat, 14 Jun 2025 01:22:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SRxw=Y5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uQFb6-0002yl-U6
 for xen-devel@lists.xenproject.org; Sat, 14 Jun 2025 01:22:16 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fecf4ea0-48bd-11f0-b894-0df219b8e170;
 Sat, 14 Jun 2025 03:22:11 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3992A629D4;
 Sat, 14 Jun 2025 01:22:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D30BEC4CEE3;
 Sat, 14 Jun 2025 01:22:07 +0000 (UTC)
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
X-Inumbo-ID: fecf4ea0-48bd-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749864129;
	bh=nUVkCqf6pPRl03XJKF7KcVSRFSRbzWCyA1ncvVL4YmQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=YYcTKphWxZ/gS6kYobY020YRWNhR97/6ZuKGj0nTPM6SHSYuf5RKmwYpO4cic451N
	 qXoJzSmFGDJ1CGAoaKqmIuiP1Fr6CEuNCLWCOuYqVGOaldCH/xB/uFXXW8whh5g1ZX
	 nBcoTWQVm9zRqfaJI+A31QvPXgk1gWPeZLiKdWpmhOjxSSAGSzBParIw+jCSld48DB
	 ipKwk6hrd35z9pw6I9q3XdMpENmxeuM7VwdjWUXFu8gqHoKTd2Sswp6Co5iFNpZxkN
	 AhhdHUytWO0FJdhfi64nTjftIrR25WSKUe0SGvFwKYgKrVlv9AkFM3iNgY6cCtWDgt
	 J1bHGIYwrieiA==
Date: Fri, 13 Jun 2025 18:22:06 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alejandro Vallejo <agarciav@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Alistair Francis <alistair.francis@wdc.com>, 
    Bob Eshleman <bobbyeshleman@gmail.com>, 
    Connor Davis <connojdavis@gmail.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v3 09/14] xen/dt: Move bootinfo functions to a new
 bootinfo.h
In-Reply-To: <20250613151612.754222-10-agarciav@amd.com>
Message-ID: <alpine.DEB.2.22.394.2506131822010.8480@ubuntu-linux-20-04-desktop>
References: <20250613151612.754222-1-agarciav@amd.com> <20250613151612.754222-10-agarciav@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 13 Jun 2025, Alejandro Vallejo wrote:
> Part of an unpicking process to extract bootfdt contents independent of
> bootinfo to a separate file for x86 to take.
> 
> With this, bootfdt.h can be cleanly included from x86. A later patch
> extracts the definitions so the functions may be called too.
> 
> Not a functional change.
> 
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

