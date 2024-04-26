Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DCE8B4277
	for <lists+xen-devel@lfdr.de>; Sat, 27 Apr 2024 01:04:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.713146.1114169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0UcP-0001k2-Sb; Fri, 26 Apr 2024 23:04:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 713146.1114169; Fri, 26 Apr 2024 23:04:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0UcP-0001hv-Pj; Fri, 26 Apr 2024 23:04:37 +0000
Received: by outflank-mailman (input) for mailman id 713146;
 Fri, 26 Apr 2024 23:04:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/tzl=L7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s0UcO-0001hp-Ir
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 23:04:36 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 581f355f-0421-11ef-909a-e314d9c70b13;
 Sat, 27 Apr 2024 01:04:35 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 90921CE1D5E;
 Fri, 26 Apr 2024 23:04:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26E25C113CD;
 Fri, 26 Apr 2024 23:04:29 +0000 (UTC)
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
X-Inumbo-ID: 581f355f-0421-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714172670;
	bh=aG0wMtmsgv/Qr/54VJjrVs73zpWfjihc5euZvlvW/Sk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MzzrVtSk5xn22YIMbeoyV1xQoiH+bOQ4OhNGRZfCMPEm1UIDz31udFQZb34vKTm9z
	 W8/PoVtXkDwOZiZkQADGuySNc+0KQRBW30dygaj739SL4ZblfYC7krVmdRXh1oSrhz
	 zxLH41Z0Os3nbWAxko+OBsN+glbnlw12u9I/3LpCD/us/U1CqBZsTtW2vRmdCAvkdu
	 UA/GvXYRQmqp2FGjiglngKrbJx4+zMixA9SsHHB6RlgZsJwyGU8T1bJc8YXwR1kbh9
	 S0eyebYY8+kpJONq8LHrb8d5kKl53BjWmiINF1zKFf3ginA6Dzui7PKGlX9Rdrerst
	 1tgP8+eeW9cMA==
Date: Fri, 26 Apr 2024 16:04:27 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v1 2/7] x86/intel: guard vmce_has_lmce() with INTEL
 option
In-Reply-To: <5e26895d84f8b7750799740ac2324b2cb92fa97e.1713860310.git.Sergiy_Kibrik@epam.com>
Message-ID: <alpine.DEB.2.22.394.2404261602590.3940@ubuntu-linux-20-04-desktop>
References: <cover.1713860310.git.Sergiy_Kibrik@epam.com> <5e26895d84f8b7750799740ac2324b2cb92fa97e.1713860310.git.Sergiy_Kibrik@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 23 Apr 2024, Sergiy Kibrik wrote:
> Since MCG_LMCE_P bit is specific to Intel CPUs the code to check it can
> possibly be excluded from build if !CONFIG_INTEL. With these guards
> calls to vmce_has_lmce() are eliminated and mce_intel.c can end up
> not being built.
> 
> Also replace boilerplate code that checks for MCG_LMCE_P flag with
> vmce_has_lmce(), which might contribute to readability a bit.
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


