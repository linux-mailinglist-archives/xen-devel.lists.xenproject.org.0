Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFF9AFD69A
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 20:39:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037174.1409841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZDE6-0001v3-Cg; Tue, 08 Jul 2025 18:39:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037174.1409841; Tue, 08 Jul 2025 18:39:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZDE6-0001tH-9e; Tue, 08 Jul 2025 18:39:34 +0000
Received: by outflank-mailman (input) for mailman id 1037174;
 Tue, 08 Jul 2025 18:39:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G3iI=ZV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uZDE5-0001tB-8A
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 18:39:33 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2a909c5-5c2a-11f0-a317-13f23c93f187;
 Tue, 08 Jul 2025 20:39:31 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4BC5F6112E;
 Tue,  8 Jul 2025 18:39:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE41EC4CEED;
 Tue,  8 Jul 2025 18:39:28 +0000 (UTC)
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
X-Inumbo-ID: e2a909c5-5c2a-11f0-a317-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751999970;
	bh=7/asdaQmjhQvkxgXrwA5ni3Ez0ufsOSXJEpEzQMbdmo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bMkjwl5MJ1pxxjMby5awQP6+0vvlQOltATM+JJuJz/zbANH7jXR8ng9FkUlFSurQL
	 mmznLuPY0FgjX02hB/fxHuGZl74Fc3J6K3+2bEoi8zMjMQCzyhkASKA/CGBh4LtwJO
	 SMEf/n4+0Tp3Q+mYpGU/C3aQ22SzfhibkTiWf1GMiRPFTHF0UhYkt+Wv8KNKbeEOaL
	 wA4rxgbTqoZi6koU36LMqy/SII8KMqvci1NxCGLnvNdkgrmQG+jVTKdaIHUcCn6SaS
	 bUoVKq3xGVS3CExI70aABx89HnzVOcAZzkniIJZo/am2o6JkQM9aiaXrgi1kOvWcE/
	 Kla9y9XyL3dmg==
Date: Tue, 8 Jul 2025 11:39:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v6 01/11] xen: Conditionally compile out the
 boot_module.domU
In-Reply-To: <20250708180721.2338036-2-alejandro.garciavallejo@amd.com>
Message-ID: <alpine.DEB.2.22.394.2507081137500.605088@ubuntu-linux-20-04-desktop>
References: <20250708180721.2338036-1-alejandro.garciavallejo@amd.com> <20250708180721.2338036-2-alejandro.garciavallejo@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 8 Jul 2025, Alejandro Vallejo wrote:
> ... based on CONFIG_X86. x86 won't depend on it, and it'll only be used
> by the domain builder in common/device-tree/
> 
> Moving it to an arch-specific subfield (as introduced in a later patch)
> is unwieldy, because all other arches depend on it.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> ---
> My expectation is to remove the field altogether after we reach full
> integration in common code, by deducing this boolean from the domain
> capabilities given in the "capabilities" prop.
> 
> That's not something I'm working at the moment though.

Merging, moving, and generalizing code is something we have learned from
experience often requires a few incremental steps. I believe this is
acceptable as a first step.


Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/include/xen/bootfdt.h | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
> index 236b456dd2..7f49d0ccdd 100644
> --- a/xen/include/xen/bootfdt.h
> +++ b/xen/include/xen/bootfdt.h
> @@ -96,16 +96,18 @@ struct shared_meminfo {
>      struct shmem_membank_extra extra[NR_SHMEM_BANKS];
>  };
>  
> -/*
> - * The domU flag is set for kernels and ramdisks of "xen,domain" nodes.
> - * The purpose of the domU flag is to avoid getting confused in
> - * kernel_probe, where we try to guess which is the dom0 kernel and
> - * initrd to be compatible with all versions of the multiboot spec.
> - */
>  #define BOOTMOD_MAX_CMDLINE 1024
>  struct boot_module {
>      boot_module_kind kind;
> +#ifndef CONFIG_X86
> +    /*
> +     * The domU flag is set for kernels and ramdisks of "xen,domain" nodes.
> +     * The purpose of the domU flag is to avoid getting confused in
> +     * kernel_probe, where we try to guess which is the dom0 kernel and
> +     * initrd to be compatible with all versions of the multiboot spec.
> +     */
>      bool domU;
> +#endif
>      paddr_t start;
>      paddr_t size;
>  };
> -- 
> 2.43.0
> 

