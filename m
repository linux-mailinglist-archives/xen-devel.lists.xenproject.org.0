Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3586EB17708
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 22:18:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1066381.1431599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhZjY-0003tR-Jd; Thu, 31 Jul 2025 20:18:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1066381.1431599; Thu, 31 Jul 2025 20:18:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhZjY-0003rB-Fa; Thu, 31 Jul 2025 20:18:36 +0000
Received: by outflank-mailman (input) for mailman id 1066381;
 Thu, 31 Jul 2025 20:18:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0qgQ=2M=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uhZjW-0003r5-N1
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 20:18:34 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84ee1066-6e4b-11f0-b895-0df219b8e170;
 Thu, 31 Jul 2025 22:18:29 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 505CB5C647C;
 Thu, 31 Jul 2025 20:18:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 156E6C4CEEF;
 Thu, 31 Jul 2025 20:18:25 +0000 (UTC)
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
X-Inumbo-ID: 84ee1066-6e4b-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753993107;
	bh=xYrStZOPqfqRYjhuEdW2QwL5ph+yRW1gy89kvD2IQV0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RHWvIhCgmgScighOlBar4Hi1Ih6ShIlZ1vd7ewauNzScgYnPXa5RDt+USa9qfJsO+
	 w767X2q6PiLhh4VXgGEu/0QNeTGnfu3BAnsg+Df+oSGfE5agaG2OWaesQm81IHlskZ
	 n/axZLae8Es1Nt5l/kDV4ue9vpBNz3Rky/SjibzGPlBo1dQpWdHXEWq/n1fbwSE8Gl
	 G7+maMIxAqeb/owwOpWbPMvITNNGp4um8mv3E/Lw+BKL3bqSI6WpgnoB93D2H6Bdtz
	 A2F9c1ZOxuVSx7VmDOBOtkWPjbrg94inJmJxeBqvTZUceUZrk7N4SyKI7mQIaLGQNa
	 2gKLz1xaI4c6Q==
Date: Thu, 31 Jul 2025 13:18:24 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Michal Orzel <michal.orzel@amd.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/2] xen/arm: Fix HAS_PASSTHROUGH selection
In-Reply-To: <06d79f28-9710-4def-9a87-1dc478f7902d@suse.com>
Message-ID: <alpine.DEB.2.22.394.2507311318070.468590@ubuntu-linux-20-04-desktop>
References: <20250731080522.810468-1-michal.orzel@amd.com> <20250731080522.810468-2-michal.orzel@amd.com> <06d79f28-9710-4def-9a87-1dc478f7902d@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 31 Jul 2025, Jan Beulich wrote:
> On 31.07.2025 10:05, Michal Orzel wrote:
> > HAS_PASSTHROUGH should only be selected on MMU systems. It's been like
> > that until commit 163c6b589879 added possibility to select HAS_PASSTHROUGH
> > if PCI_PASSTHROUGH is enabled on Arm64. This is incorrect as it may result
> > in enabling passthrough/ build on MPU systems. PCI_PASSTHROUGH should
> > depend on HAS_PASSTHROUGH instead.
> > 
> > Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

