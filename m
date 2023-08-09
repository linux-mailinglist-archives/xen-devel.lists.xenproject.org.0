Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9757776939
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 21:52:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581289.909904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTpDL-0006YE-EE; Wed, 09 Aug 2023 19:51:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581289.909904; Wed, 09 Aug 2023 19:51:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTpDL-0006WX-Ar; Wed, 09 Aug 2023 19:51:27 +0000
Received: by outflank-mailman (input) for mailman id 581289;
 Wed, 09 Aug 2023 19:51:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JRC9=D2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qTpDK-0006WR-6P
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 19:51:26 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d80763a-36ee-11ee-8613-37d641c3527e;
 Wed, 09 Aug 2023 21:51:23 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4DD3563D2A;
 Wed,  9 Aug 2023 19:51:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCD31C433C8;
 Wed,  9 Aug 2023 19:51:18 +0000 (UTC)
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
X-Inumbo-ID: 1d80763a-36ee-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691610680;
	bh=n7HxIyR3ae7w/kdJbvhrByOAckYn8xYNfuHb2yW74Eo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=i0DfBHWmBP1cB2JvGyBPMQY+ZroqyFkuREBbr86B2Q5O5uGqNRkOKfMxEavWN7ggC
	 itIQ6cHJaYfEzhgKDOcO9tg6sq+fqHzkJZdIH76rszvmxeKxjkEF0JwNAhnGcbTmYI
	 SCt83ImNSJuPIWHjR93NsEhlfiIyAiBQQhpxVa59g72Us+cayUPKvaBIHOAMSH/rsc
	 PxfW/EOOiHNjpj+vXZfalC7TFQSWnCGtZ+z+G++aAHBi6K0knnVgNtWnJctgXMV0ie
	 7O9JNkxwqcaRJUIXAuCVtq72sDZ+Q9NgCtZP1X8oA8lNTgHH2Rog8XVktFcQUPq/D+
	 qsXIJ/Ob41VQA==
Date: Wed, 9 Aug 2023 12:51:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <luca.fancellu@arm.com>, jbeulich@suse.com, 
    andrew.cooper3@citrix.com, roger.pau@citrix.com
cc: xen-devel@lists.xenproject.org, wei.chen@arm.com, rahul.singh@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, george.dunlap@citrix.com, 
    christopher.w.clark@gmail.com, dpsmith@apertussolutions.com
Subject: Moving Dom0less to common, Was: [PATCH 0/5] Fine granular
 configuration
In-Reply-To: <20230808080010.3858575-1-luca.fancellu@arm.com>
Message-ID: <alpine.DEB.2.22.394.2308091243280.2127516@ubuntu-linux-20-04-desktop>
References: <20230808080010.3858575-1-luca.fancellu@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Adding hyperlaunch and x86 maintainers.


Hi Luca,

This patch series is very timely. You might not have realized but we
were just discussing with the hyperlaunch guys to move dom0less code to
common.

Your series is a great step in the right direction. However, we don't
want to move the dom0less code twice because it would make 'git blame'
very hard to use.

I wonder if I could ask you to move the code to xen/common/ instead. I
am not asking you to make it buildable on x86, as that would take more
work and also something along the lines of this patch series from
Christopher:
https://patchew.org/Xen/20230701071835.41599-1-christopher.w.clark@gmail.com/

The new code could be protected by CONFIG_DOM0LESS, and CONFIG_DOM0LESS
could only be selectable on ARM, not on x86.

Would you be OK with doing some extra work to move it to xen/common
instead?

Would the x86 maintainers be OK with it too? Of course further changes
will be needed to make it useable on x86, but looking at the series from
Christopher, the two sets of internal interfaces (dom0less/ARM and
hyperlaunch/x86) are very much aligned and similar already.

Cheers,

Stefano


On Tue, 8 Aug 2023, Luca Fancellu wrote:
> This serie aims to add more modularity to some feature that can be excluded
> without issues from the build.
> 
> The first patch is already reviewed.
> 
> Luca Fancellu (5):
>   arm/gicv2: make GICv2 driver and vGICv2 optional
>   xen/arm: Add asm/domain.h include to kernel.h
>   arm/dom0less: put dom0less feature code in a separate module
>   xen/arm: Move static memory build code in separate modules
>   arm/dom0less: introduce Kconfig for dom0less feature
> 
>  xen/arch/arm/Kconfig                      |   28 +
>  xen/arch/arm/Makefile                     |    7 +-
>  xen/arch/arm/bootfdt.c                    |  161 +-
>  xen/arch/arm/dom0less-build.c             | 1086 ++++++
>  xen/arch/arm/domain_build.c               | 4096 ++++++---------------
>  xen/arch/arm/efi/efi-boot.h               |    4 +
>  xen/arch/arm/gic-v3.c                     |    4 +
>  xen/arch/arm/include/asm/dom0less-build.h |   35 +
>  xen/arch/arm/include/asm/domain_build.h   |   33 +
>  xen/arch/arm/include/asm/kernel.h         |    1 +
>  xen/arch/arm/include/asm/setup.h          |    1 -
>  xen/arch/arm/include/asm/static-memory.h  |   50 +
>  xen/arch/arm/include/asm/static-shmem.h   |   72 +
>  xen/arch/arm/setup.c                      |   58 +-
>  xen/arch/arm/static-memory.c              |  294 ++
>  xen/arch/arm/static-shmem.c               |  515 +++
>  xen/arch/arm/vgic.c                       |    2 +
>  xen/arch/arm/vgic/Makefile                |    4 +-
>  18 files changed, 3357 insertions(+), 3094 deletions(-)
>  create mode 100644 xen/arch/arm/dom0less-build.c
>  create mode 100644 xen/arch/arm/include/asm/dom0less-build.h
>  create mode 100644 xen/arch/arm/include/asm/static-memory.h
>  create mode 100644 xen/arch/arm/include/asm/static-shmem.h
>  create mode 100644 xen/arch/arm/static-memory.c
>  create mode 100644 xen/arch/arm/static-shmem.c
> 
> -- 
> 2.34.1
> 

