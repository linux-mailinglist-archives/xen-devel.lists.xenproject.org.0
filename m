Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C84813CF5
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 22:52:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654779.1022146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDtd1-0000FU-Sn; Thu, 14 Dec 2023 21:52:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654779.1022146; Thu, 14 Dec 2023 21:52:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDtd1-0000D0-Pc; Thu, 14 Dec 2023 21:52:23 +0000
Received: by outflank-mailman (input) for mailman id 654779;
 Thu, 14 Dec 2023 21:52:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fjLX=HZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rDtd0-0000BO-B1
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 21:52:22 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e3327bc-9acb-11ee-98e9-6d05b1d4d9a1;
 Thu, 14 Dec 2023 22:52:21 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E8F3461FE5;
 Thu, 14 Dec 2023 21:52:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B42CC433C8;
 Thu, 14 Dec 2023 21:52:18 +0000 (UTC)
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
X-Inumbo-ID: 0e3327bc-9acb-11ee-98e9-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702590739;
	bh=qIpOWTaUdB7yzkvyAE/T8SIdASjcLU5t219uTMkkb3I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=FWPtGObVkpBBTFDVjUcuSgeTyQGl90TNiQORofl0M2xOT6pgxU9hZWU6ube+RA4pg
	 hsSxXvB97DijjicSVugckN8HuvO+k5UcSyCnEbiq77PxOXz99R2bHmDdw+qpladpXD
	 0LzDHEnCbKAk/v7Lj0cvgdvqnq+7Wlncx59ZfDuaBuyAydo2tRO8d6E3n2aEv/RCW8
	 SjEpJh9RrDuzwhGjK+2xv6pXQ4nCya9AUuOPp5YpTNmZ/fJQqhsmjTBZS/1Sv3MF54
	 6Flr8HbE43aTZt+Ub65+vp2Spts72xVCXFZrJgmJajDuBELSNORi1DincWYa/sBiMo
	 mDYU++1Z/0Fmw==
Date: Thu, 14 Dec 2023 13:52:17 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH 7/9] x86/hvm: address violations of MISRA C:2012 Rule
 11.8
In-Reply-To: <bfdd8f021230224e3bb1aea2aceaf2c712615ba7.1702555387.git.maria.celeste.cesario@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2312141352100.3175268@ubuntu-linux-20-04-desktop>
References: <cover.1702555386.git.maria.celeste.cesario@bugseng.com> <bfdd8f021230224e3bb1aea2aceaf2c712615ba7.1702555387.git.maria.celeste.cesario@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 14 Dec 2023, Simone Ballarin wrote:
> From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
> 
> The xen sources contain violations of MISRA C:2012 Rule 11.8 whose
> headline states:
> "A conversion shall not remove any const, volatile or _Atomic qualification
> from the type pointed to by a pointer".
> 
> Remove unnecessary cast.
> from is a const-qualified pointer to void and the function hvm_copy_to_guest_linear
> requires a const void* type argument, therefore the cast to void* is not necessary.
> 
> No functional change.
> 
> Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
> Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

