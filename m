Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A1BB0E74F
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 01:49:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053122.1421893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueMj5-0007rd-5T; Tue, 22 Jul 2025 23:48:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053122.1421893; Tue, 22 Jul 2025 23:48:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueMj5-0007pF-2Y; Tue, 22 Jul 2025 23:48:51 +0000
Received: by outflank-mailman (input) for mailman id 1053122;
 Tue, 22 Jul 2025 23:48:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X0Ar=2D=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ueMj3-0007p9-Ie
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 23:48:49 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63c703bc-6756-11f0-b894-0df219b8e170;
 Wed, 23 Jul 2025 01:48:39 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 28E31668B0;
 Tue, 22 Jul 2025 23:48:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 663C0C4CEEB;
 Tue, 22 Jul 2025 23:48:36 +0000 (UTC)
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
X-Inumbo-ID: 63c703bc-6756-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753228117;
	bh=VxWahGEoXvR5nFCiQ0BptwCa+xj8XGLhW3uMWFJl5xI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Tpe6d+/AxadwWe27JGKzGCUohq9HPx9nj6SiPTsrslDgITkGcCEkspjhUP0odhlET
	 Mvl7XS7rv7bFYgtZQl69nsu48chhZHOs5Fii0eHLHv9gYYJws3+8EnSiOYA7kJ5usZ
	 zPI+rshkj+oY+TMkqziuJK2txxzeHxy/7zhhKc0p8e64h/ZKdnmz+yDrvFi00QZm7o
	 HV1xFCkKvlru4TYeNM9yZEPjRomEnwgZMfWjhXkS8JWL2J0/suKpIEyxIcrV2XUz/u
	 jIjt34CfrXxqrFCfJYS7oXgeMGx9UxsM/er1G/pp7XhlzX2/EbMgIRdmQLbau625xm
	 BtPpghxGp4Dkw==
Date: Tue, 22 Jul 2025 16:48:35 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
cc: Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    "Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH 2/2] x86: generalise vcpu0 creation for a domain
In-Reply-To: <DBF3328087KY.3CR27JZGGQXV4@amd.com>
Message-ID: <alpine.DEB.2.22.394.2507221646110.7043@ubuntu-linux-20-04-desktop>
References: <20250717175128.462996-1-alejandro.garciavallejo@amd.com> <20250717175128.462996-3-alejandro.garciavallejo@amd.com> <62d11511-b856-41c6-a2f5-5625a5e3edbc@amd.com> <alpine.DEB.2.22.394.2507171657180.15546@ubuntu-linux-20-04-desktop>
 <426330c3-ab77-46ae-89eb-1b67224afd3f@suse.com> <DBF3328087KY.3CR27JZGGQXV4@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 18 Jul 2025, Alejandro Vallejo wrote:
> Some arguments do want to be adjusted one way or the other spec_ctrl.c makes
> heavy assumptions about there not being any hwdom/ctldom separation, and both
> having domain_id == 0. There are other cases.
> 
> Yet another option is to single-out the Hyperlaunch/dom0less case and never
> apply dom0 commandline overrides there (dom0_*=). It'd be a flag in
> boot_domain. Might even allow us to compile them out altogether for
> dom0less-only configurations (e.g: CONFIG_DOM0LESS_BOOT && !CONFIG_DOM0_BOOT, or
> something like that).
> 
> Thoughts?

I have been reviewing this in more detail, including the WIP draft that
Alejandro has not yet submitted to xen-devel, which completes the
hyperlaunch/dom0less enablement on x86. I think we should apply all
dom0 command line arguments exactly as they are to both classic Dom0 and
the hardware domain (and only to the hardware domain).

This is the simplest approach and the only one that would work with the
current code.


