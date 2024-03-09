Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A3D876E7E
	for <lists+xen-devel@lfdr.de>; Sat,  9 Mar 2024 02:26:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690444.1076447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rilTz-0007wt-Cd; Sat, 09 Mar 2024 01:26:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690444.1076447; Sat, 09 Mar 2024 01:26:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rilTz-0007uG-9J; Sat, 09 Mar 2024 01:26:39 +0000
Received: by outflank-mailman (input) for mailman id 690444;
 Sat, 09 Mar 2024 01:26:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VWqy=KP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rilTy-0007u8-6k
 for xen-devel@lists.xenproject.org; Sat, 09 Mar 2024 01:26:38 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11822305-ddb4-11ee-afdb-a90da7624cb6;
 Sat, 09 Mar 2024 02:26:37 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D82CECE1DF4;
 Sat,  9 Mar 2024 01:26:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4A80C433F1;
 Sat,  9 Mar 2024 01:26:27 +0000 (UTC)
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
X-Inumbo-ID: 11822305-ddb4-11ee-afdb-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709947589;
	bh=N4Zlr2YBEF2Zmj+/2VFqqlC0xz7Y3kl8JtrrJtLq/F4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=D59PEel4gAxnPjFERTRN8Yn1NLQqlINo+xEZWOHj6sgJzPulHYE91La8WBhZ8GJWT
	 0VUgNTTCHHyoFiilOI1d6En8jp3u0HO4NFCV2s32fu6A0GLqEvUZasT4QM0pXfe2+J
	 VvIR6hepT1d5/ZlI0WDHNHnjTbS486ThUjG7gyEtWRJhdAyOWbwr6s/Gy5Z9uZk64Q
	 TLy6BaorAi79+ECNoJLsR/HscOezukYlJJ0M6R9BhhWGr6GKT+ErQ+QKWRQvxMtNXC
	 FSxB3PzHvsQTw75sI1VY3q9RLpggvTjk1Rcf0Kl0IDBPtWAVfNY9tyPKAaHd7suerO
	 +bV3SY6jLPgkw==
Date: Fri, 8 Mar 2024 17:26:26 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, bertrand.marquis@arm.com, julien@xen.org, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH v2 2/7] xen/include: address violations of MISRA C
 Rule 20.7
In-Reply-To: <5be252bfb30682d33aecca11921dcdfcc17f9ae6.1709896401.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2403081726170.853156@ubuntu-linux-20-04-desktop>
References: <cover.1709896401.git.nicola.vetrini@bugseng.com> <5be252bfb30682d33aecca11921dcdfcc17f9ae6.1709896401.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 8 Mar 2024, Nicola Vetrini wrote:
> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
> of macro parameters shall be enclosed in parentheses". Therefore, some
> macro definitions should gain additional parentheses to ensure that all
> current and future users will be safe with respect to expansions that
> can possibly alter the semantics of the passed-in macro parameter.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

