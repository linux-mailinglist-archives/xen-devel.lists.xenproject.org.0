Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB10ADE03A
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jun 2025 02:49:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018667.1395569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRgz0-0000A3-Fl; Wed, 18 Jun 2025 00:48:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018667.1395569; Wed, 18 Jun 2025 00:48:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRgz0-00007a-Cl; Wed, 18 Jun 2025 00:48:54 +0000
Received: by outflank-mailman (input) for mailman id 1018667;
 Wed, 18 Jun 2025 00:48:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8JDB=ZB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uRgyy-00007S-Tw
 for xen-devel@lists.xenproject.org; Wed, 18 Jun 2025 00:48:52 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ffc0c61c-4bdd-11f0-b894-0df219b8e170;
 Wed, 18 Jun 2025 02:48:50 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9DC705C5516;
 Wed, 18 Jun 2025 00:46:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B647C4CEE3;
 Wed, 18 Jun 2025 00:48:47 +0000 (UTC)
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
X-Inumbo-ID: ffc0c61c-4bdd-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750207728;
	bh=UAw8UxiK2ci4QjrfhyEPKCzc8CQhr4sgjiQ16wZ/jKk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=t1nlekeaY/ZFX81zu7znZGyTQpUiriQU+hfOVl7hI0WVpCglCNBjaGDH7CobmJxM5
	 JeiZCbmxvUsxJ4DYXQrnGFty4QRLvJjVfzOzDghVXW/GR1zGCFphYl5pSZEZXhrlV4
	 Rl3eNu8Qgy390mzHVJAsW+a0PQsoVLi3IjDdDaDf8MCGvpa7TDQ97Be/d90QiqTXMz
	 JPNlu3NNN/q+7RVRj0AMIe57b/nr7UiOOabtTYiZecGy+vS96XC3tGMALPnXMwoNkg
	 8GIGveQ/XPmJUg3lnFcZARSdkaON7E/v5cw82p44bWRoLp8MIr/n8XtNoQ/YgWZBKv
	 bvzoCuCkB5SoQ==
Date: Tue, 17 Jun 2025 17:48:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Victor Lira <victorm.lira@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=83=C2=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Federico Serafini <federico.serafini@bugseng.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH v2 3/3] xen/x86: add missing noreturn attributes
In-Reply-To: <20250606212712.1901838-3-victorm.lira@amd.com>
Message-ID: <alpine.DEB.2.22.394.2506171748370.1780597@ubuntu-linux-20-04-desktop>
References: <20250606212712.1901838-1-victorm.lira@amd.com> <20250606212712.1901838-2-victorm.lira@amd.com> <20250606212712.1901838-3-victorm.lira@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 6 Jun 2025, victorm.lira@amd.com wrote:
> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> The marked functions never return to their caller, but lack the
> `noreturn' attribute.
> 
> Functions that never return should be declared with a `noreturn'
> attribute.
> 
> The lack of `noreturn' causes a violation of MISRA C Rule 17.11 (not
> currently accepted in Xen), and also Rule 2.1: "A project shall not
> contain unreachable code". Depending on the compiler used and the
> compiler optimization used, the lack of `noreturn' might lead to the
> presence of unreachable code.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Signed-off-by: Victor Lira <victorm.lira@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


