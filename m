Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEA4770A1D
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 22:53:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577331.904392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qS1nm-0004Np-Kz; Fri, 04 Aug 2023 20:53:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577331.904392; Fri, 04 Aug 2023 20:53:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qS1nm-0004Ln-Hc; Fri, 04 Aug 2023 20:53:38 +0000
Received: by outflank-mailman (input) for mailman id 577331;
 Fri, 04 Aug 2023 20:53:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zgx5=DV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qS1nl-0004Lh-2T
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 20:53:37 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa7e1c5d-3308-11ee-b271-6b7b168915f2;
 Fri, 04 Aug 2023 22:53:35 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B62B6620D0;
 Fri,  4 Aug 2023 20:53:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5161C433C7;
 Fri,  4 Aug 2023 20:53:32 +0000 (UTC)
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
X-Inumbo-ID: fa7e1c5d-3308-11ee-b271-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691182414;
	bh=HoZei8B2R8a954IClspujnbBZ8uQoJ9HV9nW8Z0GorI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cs3QZWeKyzoKCDh8eLdlrRWuBNl8pk1Qs9MKlyKgSa9uY787YMbMhIdwcI+pArC3/
	 NdoN48bIA8xcouEQn9B18s9IbWlQSeZKiqxjGCsrYe+N5iLN4JO9dhZqU5r5OsoBDh
	 niFWLcR8CVxhdj9IKrYXoKk2ygHAvfYip796V1sKQ2dtuLbkZgJZDrOSJAV3Eu4Eyl
	 Q9pUo4oZxG45OdM0PIy50BA/guRePs5uRp0cIJzwWutA2oVhypYyyNjYRN9KfUH3SJ
	 w3e9hV+hYHb3Aj0jEWi42D5hu5MG/QpX/uK4GWv6EzMfRmEO+Lr3TIWSJsq2BKjwFs
	 O/JGZdhoQmmRA==
Date: Fri, 4 Aug 2023 13:53:31 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Xenia Ragiadakou <xenia.ragiadakou@amd.com>, 
    Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: Re: [XEN PATCH] x86: Address violations of MISRA C:2012 and drop
 bool_t
In-Reply-To: <2cd78bd0d39b36fe73e87cd1011658a54c2c729d.1691158092.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308041350590.2127516@ubuntu-linux-20-04-desktop>
References: <2cd78bd0d39b36fe73e87cd1011658a54c2c729d.1691158092.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 4 Aug 2023, Federico Serafini wrote:
> Give a name to unnamed parameters to address violations of
> MISRA C:2012 Rule 8.2 ("Function types shall be in prototype form with
> named parameters").
> Keep consistency between object and function declarations thus
> addressing violations of MISRA C:2012 Rule 8.3 ("All declarations of an
> object or function shall use the same names and type qualifiers").
> Replace the occurrences of bool_t with bool.
> 
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

