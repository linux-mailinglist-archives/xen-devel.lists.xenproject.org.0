Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DDBAA9CDA
	for <lists+xen-devel@lfdr.de>; Mon,  5 May 2025 21:54:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.976366.1363534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uC1tF-0001Ty-Gz; Mon, 05 May 2025 19:54:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 976366.1363534; Mon, 05 May 2025 19:54:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uC1tF-0001RM-D9; Mon, 05 May 2025 19:54:13 +0000
Received: by outflank-mailman (input) for mailman id 976366;
 Mon, 05 May 2025 19:54:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9/1y=XV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uC1tE-0001RG-Bx
 for xen-devel@lists.xenproject.org; Mon, 05 May 2025 19:54:12 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b612bd06-29ea-11f0-9eb4-5ba50f476ded;
 Mon, 05 May 2025 21:54:11 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B14445C0717;
 Mon,  5 May 2025 19:51:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1ED7C4CEE4;
 Mon,  5 May 2025 19:54:08 +0000 (UTC)
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
X-Inumbo-ID: b612bd06-29ea-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746474849;
	bh=FI7V+8ZY3yhDWgiLgRNVXUBi91dr2BoVnQYvjNbejrk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VH8r5luMZInYS0Ehg/OUWFKUfVTrO95eBf/5sImLPEaYwzFNDCqRbSsGqnsMbGXec
	 AGr12hfJgCOB3Jg7gNTHQv2Updk5exKhQJ75fx1t6MpdI6LXkU9rvutSunpikUcQQN
	 cU8szMyZxLBagwhDVGP6LnDr5B3Na8uy6sWqIMqblPFTGIFOjyOXGYu+rbm5tiakbw
	 E7JKvm2InGa+G+l6Yll2MkI4tli1q3UoBnz+X6+J+oh+dkKVuPEOC/ZRseKfB2/S8I
	 TPt1dSNZvobDbQvI5VtNFqPypJ9ENPaJQDj1P/YCUgGRB0TEUd4ZHZK1DWtLNiAaHN
	 99poqgtjNnHAQ==
Date: Mon, 5 May 2025 12:54:07 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 4/8] arm/static-shmem.h: drop inclusion of
 asm/setup.h
In-Reply-To: <2b126e4fde36d2a93c4a1ff6cb7266710738340a.1746468003.git.oleksii.kurochko@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2505051254000.3879245@ubuntu-linux-20-04-desktop>
References: <cover.1746468003.git.oleksii.kurochko@gmail.com> <2b126e4fde36d2a93c4a1ff6cb7266710738340a.1746468003.git.oleksii.kurochko@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 5 May 2025, Oleksii Kurochko wrote:
> Nothing is dependent from asm/setup.h in asm/static-shmem.h so inclusion of
> asm/setup.h is droped.
> 
> After this drop the following compilation error related to impicit declaration
> of the following functions device_tree_get_reg and map_device_irqs_to_domain,
> device_tree_get_u32 occur during compilation of dom0less-build.c ( as they are
> declared in asm/setup.h ).
> 
> Add inclusion of <asm/setup.h> in dt-overlay.c as it is using handle_device()
> declared in <asm/setup.h>.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>


Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

