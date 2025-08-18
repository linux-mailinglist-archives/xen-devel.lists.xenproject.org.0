Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A756B2B517
	for <lists+xen-devel@lfdr.de>; Tue, 19 Aug 2025 01:51:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1086285.1444474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uo9dc-0006Gg-LB; Mon, 18 Aug 2025 23:51:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1086285.1444474; Mon, 18 Aug 2025 23:51:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uo9dc-0006Dr-I2; Mon, 18 Aug 2025 23:51:40 +0000
Received: by outflank-mailman (input) for mailman id 1086285;
 Mon, 18 Aug 2025 23:51:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SEV0=26=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uo9db-0006Dl-6w
 for xen-devel@lists.xenproject.org; Mon, 18 Aug 2025 23:51:39 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 465b9cda-7c8e-11f0-b898-0df219b8e170;
 Tue, 19 Aug 2025 01:51:36 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1807F5C64A6;
 Mon, 18 Aug 2025 23:51:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F8BFC4CEEB;
 Mon, 18 Aug 2025 23:51:33 +0000 (UTC)
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
X-Inumbo-ID: 465b9cda-7c8e-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755561094;
	bh=ZYMkOKbnAKY/dRgl+ShMu1l56XqHPf4g8FVxUMp7qEk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=lml3iSCFlkehTOTLcJrntybZuYFoWWiN07KTFIP0Zt8MTz5AsL2qSDxGAlQ1jeKBI
	 gTsmRTYrJ0zIfMQgHeAkUh4kGP3owA5+xY+GKxwQGcISoV+fNa6VbVnvBcuHhRijTM
	 gF6vF6LsaZTfieciYY/ybdSTpmttvo+3LobKGgAgNQ3n8RTKkVhvaZ7TghCjQ9hVHL
	 MWJulqXxMW0L4iVMdZmzBcyiwfi3xgKG3hJ8M8sEJL7eKmdtlyIweU4wiCIZipeBWv
	 2thCty1dYwFdQa6hHfzjwGH+k5VQt7jmkGJz5KuJPpqmEINfricuawX54RwOplu+hl
	 ccw3SURkxMkAw==
Date: Mon, 18 Aug 2025 16:51:31 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>, ray.huang@amd.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Penny Zheng <Penny.Zheng@amd.com>
Subject: Re: [PATCH] xen/x86: move domctl.o out of PV_SHIM_EXCLUSIVE
In-Reply-To: <2035b14e-3836-4e80-9dad-8a49ca90864a@suse.com>
Message-ID: <alpine.DEB.2.22.394.2508181646220.923618@ubuntu-linux-20-04-desktop>
References: <20250815102728.1340505-1-Penny.Zheng@amd.com> <fb6f559a-b2aa-4b25-a6d3-401ecc4b4bd5@suse.com> <d6046b53-9317-43d6-bfda-e30d42c09320@gmail.com> <2035b14e-3836-4e80-9dad-8a49ca90864a@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 18 Aug 2025, Jan Beulich wrote:
> On 18.08.2025 15:28, Oleksii Kurochko wrote:
> > On 8/18/25 10:31 AM, Jan Beulich wrote:
> >> On 15.08.2025 12:27, Penny Zheng wrote:
> >>> In order to fix CI error of a randconfig picking both PV_SHIM_EXCLUSIVE=y and
> >>> HVM=y results in hvm.c being built, but domctl.c not being built, which leaves
> >>> a few functions, like domctl_lock_acquire/release() undefined, causing linking
> >>> to fail.
> >>> To fix that, we intend to move domctl.o out of the PV_SHIM_EXCLUSIVE Makefile
> >>> /hypercall-defs section, with this adjustment, we also need to release
> >>> redundant vnuma_destroy() stub definition from PV_SHIM_EXCLUSIVE guardian,
> >>> to not break compilation
> >>> Above change will leave dead code in the shim binary temporarily and will be
> >>> fixed with the introduction of domctl-op wrapping.
> >> Well, "temporarily" is now getting interesting. While v1 of "Introduce
> >> CONFIG_DOMCTL" was submitted in time to still be eligible for taking into
> >> 4.21, that - as indicated elsewhere - is moving us further in an unwanted
> >> direction.
> > 
> > Do you mean that specifically this patch or the whole patch series is moving us
> > in unwanted direction? (1)
> 
> That series. We said we don't want individual CONFIG_SYSCTL, CONFIG_DOMCTL, etc.
> Instead a single umbrella option wants introducing. Which means there series
> doesn't need re-doing from scratch, but it may end up being a significant re-
> work, especially considering that CONFIG_SYSCTL is already in the codebase and
> hence now also needs replacing.

I would not characterize this series as "moving us in an unwanted
direction". Yes, it introduces a separate CONFIG_DOMCTL, which we
agreed we do not want. However, simplifying it to reuse a single
CONFIG is a minor improvement that can be addressed in v2. The main
challenge in this series is adding the #ifdef in the appropriate
places, and using a single CONFIG for domctl and sysctl would
actually help.


> >>   Hence I'm not sure this can even be counted as an in-time
> >> submission. Plus it looks to be pretty extensive re-work in some areas.
> > 
> > It doesn't clear based on change log why this patch is sent outside "Introduce
> > CONFIG_DOMCTL" (2) as it looks the same as in (2) and it was reverted once with
> > the reason "for breaking the x86 build". (I haven't checked what was changed so
> > it won't lead to build issue again.)
> 
> Before we can even consider further work in the intended direction, the present
> randconfig build issue wants sorting. Which supposedly this patch alone does.

I think we should take this patch right away.

I also think we should consider "Introduce CONFIG_DOMCTL" for 4.21.

