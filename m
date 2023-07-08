Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E951574BEE7
	for <lists+xen-devel@lfdr.de>; Sat,  8 Jul 2023 21:16:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560734.876867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIDP5-0000jt-1a; Sat, 08 Jul 2023 19:15:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560734.876867; Sat, 08 Jul 2023 19:15:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIDP4-0000ge-TL; Sat, 08 Jul 2023 19:15:34 +0000
Received: by outflank-mailman (input) for mailman id 560734;
 Sat, 08 Jul 2023 19:15:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QfqP=C2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qIDP3-0000dy-8z
 for xen-devel@lists.xenproject.org; Sat, 08 Jul 2023 19:15:33 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc5a5fd0-1dc3-11ee-8611-37d641c3527e;
 Sat, 08 Jul 2023 21:15:28 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9FC2E60ADE;
 Sat,  8 Jul 2023 19:15:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C7B6C433C7;
 Sat,  8 Jul 2023 19:15:25 +0000 (UTC)
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
X-Inumbo-ID: cc5a5fd0-1dc3-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688843727;
	bh=P+jUqxCIKRZAn+cyLKPsfy3kw6aAismJpOKg1hmwQUs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ue7EwihpcxBmCiIthkleyNFEPj9aHsEtllqS9QxYvMxbV1boe8dP1YP6QGMlEl9v2
	 xnPz0PtOe0cF5i3kN7E0PhqQ5YTFquDur4sI+uB7VyKwvmciw3XM2Tbu6y0303PCek
	 u7WXTuRf0MLUWnt86Zhqf+GQ365anfSpkTzB8UGzqcddtVa5pIxwyfKDwQRtJBFmYN
	 6MoTfppchmiSXXKe2MO3ZuwyqfQR+AKiUDsRirz6hmj14w9KwJtD3cwvF9lpPDJH8u
	 F18D8POkzN8iQx6hhBInkItK6L7zUv7CK6Y6iuDKCDeB6HxPykIwMI8awT2BrQnBse
	 GcZWzElbRCIfw==
Date: Sat, 8 Jul 2023 12:15:23 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Christopher Clark <christopher.w.clark@gmail.com>
cc: xen-devel@lists.xenproject.org, 
    Daniel Smith <dpsmith@apertussolutions.com>, stefano.stabellini@amd.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Luca Fancellu <luca.fancellu@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Rich Persaud <persaur@gmail.com>
Subject: Re: [PATCH 02/10] x86 setup: per-arch bootmodule structure, headroom
 field
In-Reply-To: <20230701071835.41599-3-christopher.w.clark@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2307081134270.761183@ubuntu-linux-20-04-desktop>
References: <20230701071835.41599-1-christopher.w.clark@gmail.com> <20230701071835.41599-3-christopher.w.clark@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 1 Jul 2023, Christopher Clark wrote:
> Next step in incremental work towards adding a non-multiboot internal
> representation of boot modules, converting the fields being accessed for
> the startup calculations.
> 
> Add a new array of structs for per-boot-module state, though only
> allocate space for a single array entry in this change since that is all
> that is required for functionality modified in this patch: moving the
> headroom field for the image decompression calculation into a new
> per-arch boot module struct and then using it in x86 dom0 construction.
> 
> Introduces a per-arch header for x86 for arch-specific boot module
> structures, and add a member to the common boot module structure for
> access to it.
> 
> No functional change intended.
> 
> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
 
[...]


> diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
> new file mode 100644
> index 0000000000..a25054f372
> --- /dev/null
> +++ b/xen/arch/x86/include/asm/bootinfo.h
> @@ -0,0 +1,18 @@
> +#ifndef __ARCH_X86_BOOTINFO_H__
> +#define __ARCH_X86_BOOTINFO_H__
> +
> +struct arch_bootmodule {
> +    unsigned headroom;
> +};
> +
> +#endif
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */

[...]

> diff --git a/xen/include/xen/bootinfo.h b/xen/include/xen/bootinfo.h
> index 6a7d55d20e..b72ae31a66 100644
> --- a/xen/include/xen/bootinfo.h
> +++ b/xen/include/xen/bootinfo.h
> @@ -3,8 +3,19 @@
>  
>  #include <xen/types.h>
>  
> +#ifdef CONFIG_X86
> +#include <asm/bootinfo.h>
> +#else
> +    struct arch_bootmodule { };
> +#endif
> +
> +struct boot_module {
> +    struct arch_bootmodule *arch;
> +};
> +
>  struct boot_info {
>      unsigned int nr_mods;
> +    struct boot_module *mods;

Also here you already made the effort of using the same data structures
we use on ARM, you might as well use the same names too. Otherwise when
we try to use them on ARM it will require a rename somewhere.


>  };
>  
>  #endif
> -- 
> 2.25.1
> 
> 

