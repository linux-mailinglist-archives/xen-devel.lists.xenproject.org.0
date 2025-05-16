Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FC1ABA627
	for <lists+xen-devel@lfdr.de>; Sat, 17 May 2025 01:02:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.987679.1372885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uG44Q-0001km-5q; Fri, 16 May 2025 23:02:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 987679.1372885; Fri, 16 May 2025 23:02:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uG44Q-0001j2-37; Fri, 16 May 2025 23:02:26 +0000
Received: by outflank-mailman (input) for mailman id 987679;
 Fri, 16 May 2025 23:02:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J/C0=YA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uG44P-0001iw-J2
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 23:02:25 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd54d401-32a9-11f0-9ffb-bf95429c2676;
 Sat, 17 May 2025 01:02:13 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 444665C568C;
 Fri, 16 May 2025 22:59:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC5CCC4CEE4;
 Fri, 16 May 2025 23:02:08 +0000 (UTC)
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
X-Inumbo-ID: cd54d401-32a9-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747436531;
	bh=tDBjQu8+8IotWypS/H+w6jFfC9gZHy43+yrhmUAxQ08=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hQNf0vcy0Dmpsd1/wBhb1MGEPZUX3DH8sI3pBNBpXd+cEdqae7GlRL/iWNqh10+lM
	 GJYh/jr1Jm0N5ehkGsyPfaccJplV5Juz4IuREh5c67d9ukD4hcquczFvvkkmORPWcr
	 hCueOOm2Yg8R2dwq8InQdWjujYBByLsWjhpFK5GYzh8mB21c4Rb0MNVo6bOJlQhBMq
	 qxtEAr6DiJDPBj6hXAMLn3e+zHxMMRG7jBBNRP/NSY7JANSF94mj3/Hwjzp0AsUcjA
	 XwsIhywUDOMsdT7emWg0p404tIt00+C3OXuStliREOtGuOb9LjxKI9oNuD8nciJ5HF
	 fHPmaSpDwIqCw==
Date: Fri, 16 May 2025 16:02:07 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: dmkhn@proton.me, xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, dmukhin@ford.com
Subject: Re: [PATCH v3 2/3] xen/console: introduce console_puts()
In-Reply-To: <alpine.DEB.2.22.394.2505161600240.145034@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2505161601460.145034@ubuntu-linux-20-04-desktop>
References: <20250504181423.2302345-1-dmukhin@ford.com> <20250504181423.2302345-3-dmukhin@ford.com> <alpine.DEB.2.22.394.2505161600240.145034@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 16 May 2025, Stefano Stabellini wrote:
> On Sun, 4 May 2025, dmkhn@proton.me wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> > 
> > guest_console_write() duplicates the code from __putstr(), eliminate code
> > duplication.
> > 
> > Introduce console_puts() for writing a buffer to console devices.
> > 
> > Also, introduce internal console flags to control which console devices
> > should be used.
> > 
> > No functional change intended.
> > 
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Sorry I replied to the wrong version, I meant to ack v4.

