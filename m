Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4794466E8
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 17:21:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222536.384787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mj1xa-0001GB-3B; Fri, 05 Nov 2021 16:20:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222536.384787; Fri, 05 Nov 2021 16:20:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mj1xZ-0001DA-VZ; Fri, 05 Nov 2021 16:20:57 +0000
Received: by outflank-mailman (input) for mailman id 222536;
 Fri, 05 Nov 2021 16:20:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SvBC=PY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mj1xX-0001D4-RU
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 16:20:55 +0000
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59461bae-3e54-11ec-a9d2-d9f7a1cc8784;
 Fri, 05 Nov 2021 17:20:54 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id ED82B60187;
 Fri,  5 Nov 2021 16:20:52 +0000 (UTC)
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
X-Inumbo-ID: 59461bae-3e54-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1636129253;
	bh=d6juSpA7LnBXFINiGa7f7mQ4sgx85iIEZoxbiPJ55Hg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Kwf4Ecz4+SmPXYnfoWYAWWj3/hed07nW9iLRubOsG6narpTic5RtP2/QtqMr07OXP
	 0Cuov758sVbne8kg+QB5xIKvoxiy3xpvWKcvx4PWNqcDra0Zvj3kAMe04kDKFhqrKb
	 AtqtEqf/0ggKYOryLwNLTd/JEHwgGLXMnUrtzg1FkTK/8OvUtPhcWWFF9oGrnL1AOh
	 X/Pa+O8BmzmLH2OkhD7DVjno5eh3dTWbhcgMkWrMlBAIdHJbuPp7yZlzd6tWqIAQJs
	 Zk+U10X9VRNnX61amweRijVH19V+7nB0MAITitrWFhPHM/ZiEaMs6tgudxB1iEBmGh
	 mABXP96uTwvGw==
Date: Fri, 5 Nov 2021 09:20:52 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ian Jackson <iwj@xenproject.org>
cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Luca Fancellu <Luca.Fancellu@arm.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Wei  Chen <Wei.Chen@arm.com>, Stefano  Stabellini <sstabellini@kernel.org>, 
    Julien Grall <julien@xen.org>, 
    Volodymyr  Babchuk <Volodymyr_Babchuk@epam.com>, 
    Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH-4.16 v4] xen/efi: Fix Grub2 boot on arm64
In-Reply-To: <24965.21767.924957.937812@mariner.uk.xensource.com>
Message-ID: <alpine.DEB.2.22.394.2111050914390.284830@ubuntu-linux-20-04-desktop>
References: <20211105130728.30648-1-luca.fancellu@arm.com> <445836DF-C831-4478-B4C7-2D98E2258FD2@arm.com> <24965.21767.924957.937812@mariner.uk.xensource.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 5 Nov 2021, Ian Jackson wrote:
> Bertrand Marquis writes ("Re: [PATCH-4.16 v4] xen/efi: Fix Grub2 boot on arm64"):
> > > Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> > > Release-Acked-by: Ian Jackson <iwj@xenproject.org>
> > > Reviewed-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> 
> Thanks all, pushed.

Hey Ian,

I had a question for Jan, but in reply to the previous version of the
patch so you might have missed it:

https://lore.kernel.org/all/alpine.DEB.2.22.394.2111050825240.284830@ubuntu-linux-20-04-desktop/


However, the concern is about resource utilization and slowness, rather
than correctness, so I think the version of the patch you committed
should work OK (unless it turns out that with broken EFI firmware
opening HandleProtocol/OpenVolume and closing it many times causes
some sort of error.) So maybe for 4.16 we are OK as is and we can make
any changes (if necessary) for 4.17.

