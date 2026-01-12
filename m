Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFF4D156CB
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 22:25:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1200961.1516740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfPPO-0000Pf-3c; Mon, 12 Jan 2026 21:25:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1200961.1516740; Mon, 12 Jan 2026 21:25:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfPPO-0000OE-0x; Mon, 12 Jan 2026 21:25:06 +0000
Received: by outflank-mailman (input) for mailman id 1200961;
 Mon, 12 Jan 2026 21:25:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m3HA=7R=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vfPPN-0000O8-JY
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 21:25:05 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2814db26-effd-11f0-b15e-2bf370ae4941;
 Mon, 12 Jan 2026 22:25:03 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id F3EA543C9D;
 Mon, 12 Jan 2026 21:25:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3527C116D0;
 Mon, 12 Jan 2026 21:25:00 +0000 (UTC)
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
X-Inumbo-ID: 2814db26-effd-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768253101;
	bh=9TJ2zq5kVoWmdfkYndTPjlMxuq+AXg1uQo5D5++arps=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NrQXjvbQr8q3cKvjwuvZvhQfaKOX/Uotvz1v7VbOtwNxYvpoE1L07X7Olw4NtrILK
	 KAeNaXOT/OvQcOoOmdI7BqO84DtX7Dyxy2oWxkGTTGhpxxKnFBfofir9dTmUBRAwe9
	 9O9JSfqe7ZwSQasWV/FrSXsr6zF1TuDncpj8zx/I4AE0VOe48uMZj30YqNBLgpAIGs
	 MaALMVEx4k3OyTlagUg5w+gRe5p8mok6Sh+I92hTV146m42MxwQQnnzDigRgZix7xK
	 Eq4y6uJxrmj0bZZWBcJhmGYQaPoaLcyP4yQvC/OUtj2vyqI15AyDVWxunHvau8aW/l
	 TQB7XLICD9wog==
Date: Mon, 12 Jan 2026 13:24:58 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [PATCH] CI/randconfig: Disable CONFIG_CONDITION_COVERAGE
In-Reply-To: <20260112163827.1023401-1-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2601121324520.992863@ubuntu-linux-20-04-desktop>
References: <20260112163827.1023401-1-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1006624351-1768253101=:992863"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1006624351-1768253101=:992863
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 12 Jan 2026, Andrew Cooper wrote:
> In addition to GCC not liking x86_emulate(), it turns out that Clang is still
> rather more a work in progress than a usable feature, causing failures in the
> FreeBSD builds:
> 
>   https://cirrus-ci.com/task/5934059060199424
> 
> Exclude CONFIG_CONDITION_COVERAGE from Ranconfig until it gets a bit more
> stable.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
>  xen/tools/kconfig/allrandom.config | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/tools/kconfig/allrandom.config b/xen/tools/kconfig/allrandom.config
> index f04b589a80af..8127ebb57090 100644
> --- a/xen/tools/kconfig/allrandom.config
> +++ b/xen/tools/kconfig/allrandom.config
> @@ -1,2 +1,2 @@
>  # Explicit option choices not subject to regular RANDCONFIG
> -
> +CONFIG_CONDITION_COVERAGE=n
> 
> base-commit: a2a34d76643e49ccc949296c9a45888034e50b55
> -- 
> 2.39.5
> 
--8323329-1006624351-1768253101=:992863--

