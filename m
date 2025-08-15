Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96637B28657
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 21:24:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083758.1443214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un01l-0006sk-7U; Fri, 15 Aug 2025 19:23:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083758.1443214; Fri, 15 Aug 2025 19:23:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un01l-0006pn-41; Fri, 15 Aug 2025 19:23:49 +0000
Received: by outflank-mailman (input) for mailman id 1083758;
 Fri, 15 Aug 2025 19:23:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JuuU=23=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1un01j-0006ph-Ep
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 19:23:47 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c5e78d5-7a0d-11f0-a328-13f23c93f187;
 Fri, 15 Aug 2025 21:23:45 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4F92A61419;
 Fri, 15 Aug 2025 19:23:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8594C4CEEB;
 Fri, 15 Aug 2025 19:23:42 +0000 (UTC)
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
X-Inumbo-ID: 5c5e78d5-7a0d-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755285824;
	bh=P74Tzrd6fI9TUU1l4n0T6/+nz3Lk8dMWYKPfWd4yHus=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=C+4FEFmmHLaziaY6trd8PCfW/cjUKMgTu2Z8HHTrtiVjxlKHEa50hhdPdoWT5D4I9
	 qfvU7hzcCJm8KNXPZ1KN/HEigRRyVXRPwr8T8AmaqT6+UUCeGFf2FUKU5HKqEDQkTf
	 ZB55fCBgoZlCColS1z8YEnhTz0qGNnHC3ZvfDog9lC12GGLQskiOe0j9dUd3+jxHU7
	 N4HpSNti9DJ1Sq+H8etGzmRXv1qXaf/WC1ehpqNBrPoQoUebwMNSRP7ftG2bqaepyI
	 Uk+ycT5ghgcTmaaw78J1RxZyPMUpDb6kwrE8uCOh3w9cob90u9/93yWCg5kJXv86QX
	 /ay3HcIdgzT2Q==
Date: Fri, 15 Aug 2025 12:23:40 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@amd.com>
cc: xen-devel@lists.xenproject.org, ray.huang@amd.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen/x86: move domctl.o out of PV_SHIM_EXCLUSIVE
In-Reply-To: <20250815102728.1340505-1-Penny.Zheng@amd.com>
Message-ID: <alpine.DEB.2.22.394.2508151223300.10166@ubuntu-linux-20-04-desktop>
References: <20250815102728.1340505-1-Penny.Zheng@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 15 Aug 2025, Penny Zheng wrote:
> In order to fix CI error of a randconfig picking both PV_SHIM_EXCLUSIVE=y and
> HVM=y results in hvm.c being built, but domctl.c not being built, which leaves
> a few functions, like domctl_lock_acquire/release() undefined, causing linking
> to fail.
> To fix that, we intend to move domctl.o out of the PV_SHIM_EXCLUSIVE Makefile
> /hypercall-defs section, with this adjustment, we also need to release
> redundant vnuma_destroy() stub definition from PV_SHIM_EXCLUSIVE guardian,
> to not break compilation
> Above change will leave dead code in the shim binary temporarily and will be
> fixed with the introduction of domctl-op wrapping.
> 
> Fixes: 568f806cba4c ("xen/x86: remove "depends on !PV_SHIM_EXCLUSIVE"")
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


