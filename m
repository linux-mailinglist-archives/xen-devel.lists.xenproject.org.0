Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5DD8A0318
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 00:15:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703667.1099445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rugE9-0006o6-7n; Wed, 10 Apr 2024 22:15:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703667.1099445; Wed, 10 Apr 2024 22:15:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rugE9-0006m4-5B; Wed, 10 Apr 2024 22:15:33 +0000
Received: by outflank-mailman (input) for mailman id 703667;
 Wed, 10 Apr 2024 22:15:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rcYN=LP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rugE7-0006lw-7J
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 22:15:31 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6d17d2e-f787-11ee-b908-491648fe20b8;
 Thu, 11 Apr 2024 00:15:30 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 76D5A61EBF;
 Wed, 10 Apr 2024 22:15:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB220C433C7;
 Wed, 10 Apr 2024 22:15:26 +0000 (UTC)
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
X-Inumbo-ID: d6d17d2e-f787-11ee-b908-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712787328;
	bh=RajWWn5wHyd9SEhjABkVHwoohvGQCx9wQpPZ5Q/WPBI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Cbx45eaO7zLg0j6bZwfdJal3RCC6FmoqeOuZ+7FFFWy325e8qZU128sz7F4cUXMZE
	 mK9x+DKdGbC1jOb/k+oQmZJ9IJcboz5/S112ZcbaNG36RioLgPAmZx76Dr/h9SDIEE
	 DqlEem5gOHb1rx8Q8dhNrYGUyplU63aqs8KIZf+SZZV2JZPTCUDtm88gpvpX7SkhLV
	 a4jrWKkfmfMoFcEF9txd1FOoXrJYCcFeg4T2zez+FmcmmKHzr2YSAN0BGdeFbnkoMa
	 Kb4Le0O46QEIK77rT2gfxfun9IHo7aDmuEL0dcqmpMxvmawSk06mG3kUIeDaFWX5cA
	 9pzHmqTBDipng==
Date: Wed, 10 Apr 2024 15:15:25 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <JBeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "consulting @ bugseng . com" <consulting@bugseng.com>, 
    Roberto Bagnara <roberto.bagnara@bugseng.com>, 
    Federico Serafini <federico.serafini@bugseng.com>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [PATCH] xen/nospec: Remove unreachable code
In-Reply-To: <20240410192659.1490271-1-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2404101515190.711344@ubuntu-linux-20-04-desktop>
References: <20240410192659.1490271-1-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 10 Apr 2024, Andrew Cooper wrote:
> When CONFIG_SPECULATIVE_HARDEN_LOCK is active, this reads:
> 
>   static always_inline bool lock_evaluate_nospec(bool condition)
>   {
>       return arch_lock_evaluate_nospec(condition);
>       return condition;
>   }
> 
> Insert an #else to take out the second return.
> 
> Fixes: 7ef0084418e1 ("x86/spinlock: introduce support for blocking speculation into critical regions")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

