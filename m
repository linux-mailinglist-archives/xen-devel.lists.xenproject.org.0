Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CCF8B4282
	for <lists+xen-devel@lfdr.de>; Sat, 27 Apr 2024 01:08:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.713151.1114180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0UgM-0002Jv-Bp; Fri, 26 Apr 2024 23:08:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 713151.1114180; Fri, 26 Apr 2024 23:08:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0UgM-0002IP-91; Fri, 26 Apr 2024 23:08:42 +0000
Received: by outflank-mailman (input) for mailman id 713151;
 Fri, 26 Apr 2024 23:08:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/tzl=L7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s0UgK-0002IJ-Ob
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 23:08:40 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e925b295-0421-11ef-909a-e314d9c70b13;
 Sat, 27 Apr 2024 01:08:38 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 99F7CCE1D5E;
 Fri, 26 Apr 2024 23:08:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4FABC113CD;
 Fri, 26 Apr 2024 23:08:33 +0000 (UTC)
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
X-Inumbo-ID: e925b295-0421-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714172914;
	bh=mWKZC4+woYfTDVy4/Km9DdKRE+inb9dZ7wGSkDL99ks=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ko3ffcb7modPVTUAL2dKlsazGq5+UDYU0cp+nXw4nvgWF7WdxBsKfWw6+hG6pODgf
	 JAjejCn6L1YK69lcoYA8fhSWdfnWvYafHWfoOLdcrJz5r7eXkEbPTQZ1UjAP1dyUXY
	 Nk0MxYRU1OkqKgsgBglKD20UGSP8Wos4FnbPYo0V2A2Q0igSZIxNwje7FoXPTIeRk/
	 aQDGUrWnxEk8pUVXXtWXMOmMHs8ci2hrAOFND2+aQkihxova3Dg5uzKSoC37zexS/y
	 rHVr51j6NzXxkCcvwYB6PebtIBBLJYxzqfExRTkGRe0Uafv5Q//MHCgV9DFVtP6NpG
	 hMpQZpSv+VO4g==
Date: Fri, 26 Apr 2024 16:08:32 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v1 3/7] x86/MCE: guard access to Intel/AMD-specific
 MCA MSRs
In-Reply-To: <d187db984b9b5413d73849594985e10c2c2fdc03.1713860310.git.Sergiy_Kibrik@epam.com>
Message-ID: <alpine.DEB.2.22.394.2404261607210.3940@ubuntu-linux-20-04-desktop>
References: <cover.1713860310.git.Sergiy_Kibrik@epam.com> <d187db984b9b5413d73849594985e10c2c2fdc03.1713860310.git.Sergiy_Kibrik@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 23 Apr 2024, Sergiy Kibrik wrote:
> Add build-time checks for newly introduced INTEL/AMD config options when
> calling vmce_{intel/amd}_{rdmsr/wrmsr}() routines.
> This way a platform-specific code can be omitted in vmce code, if this
> platform is disabled in config.
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


