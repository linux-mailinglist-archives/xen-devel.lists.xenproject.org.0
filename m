Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE51474BEC9
	for <lists+xen-devel@lfdr.de>; Sat,  8 Jul 2023 20:48:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560728.876847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qICyL-0005QK-Gs; Sat, 08 Jul 2023 18:47:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560728.876847; Sat, 08 Jul 2023 18:47:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qICyL-0005NJ-E4; Sat, 08 Jul 2023 18:47:57 +0000
Received: by outflank-mailman (input) for mailman id 560728;
 Sat, 08 Jul 2023 18:47:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QfqP=C2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qICyJ-0005ND-LT
 for xen-devel@lists.xenproject.org; Sat, 08 Jul 2023 18:47:55 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f1686be8-1dbf-11ee-8611-37d641c3527e;
 Sat, 08 Jul 2023 20:47:53 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AD21D6023E;
 Sat,  8 Jul 2023 18:47:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37FB5C433C7;
 Sat,  8 Jul 2023 18:47:49 +0000 (UTC)
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
X-Inumbo-ID: f1686be8-1dbf-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688842071;
	bh=uGNpRYjkC7KKec7r8ahS6k9himldGTYn0LcZ+4dQtEY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=R0oVVK3qz2WpK9jhqfxzmKn128GbRBZFaFoVFuiQZZnYbFtx/RHLEnTtGIpJihbxd
	 MYwmdKEgCWFriOIOez1FFuITbqgFZVkNhWEx5UmQ+gZMsKjY6OBM6IQyY57sGjycmz
	 GAxJRxQ6EkFa8EKgN5KFthqEf9QE+3TIqEz3bXg76Wi4yB0QU1Xa2ypy2tYXMZPeQ6
	 nBgphtMZDoZtCqiOiObK3dhQn6oTIRlkchRK4nwk5n0kX1zV+IGf/MXkRC+MZ2zt6l
	 yPR8TkQqF/ggyzqbBo6srgiuDlrngfOgXhMtdM6BzposqP23VsYtnObfTmba3f4RaK
	 6YpTG3UGAv9Uw==
Date: Sat, 8 Jul 2023 11:47:47 -0700 (PDT)
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
Subject: Re: [PATCH 03/10] x86 setup: change bootstrap map to accept new boot
 module structures
In-Reply-To: <20230701071835.41599-4-christopher.w.clark@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2307081144340.761183@ubuntu-linux-20-04-desktop>
References: <20230701071835.41599-1-christopher.w.clark@gmail.com> <20230701071835.41599-4-christopher.w.clark@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 1 Jul 2023, Christopher Clark wrote:
> To convert the x86 boot logic from multiboot to boot module structures,
> change the bootstrap map function to accept a boot module parameter.
> 
> To allow incremental change from multiboot to boot modules across all
> x86 setup logic, provide a temporary inline wrapper that still accepts a
> multiboot module parameter and use it where necessary. The wrapper is
> placed in a new arch/x86 header <asm/boot.h> to avoid putting a static
> inline function into an existing header that has no such functions
> already. This new header will be expanded with additional functions in
> subsequent patches in this series.
> 
> No functional change intended.
> 
> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> 

[...]

> diff --git a/xen/include/xen/bootinfo.h b/xen/include/xen/bootinfo.h
> index b72ae31a66..eb93cc3439 100644
> --- a/xen/include/xen/bootinfo.h
> +++ b/xen/include/xen/bootinfo.h
> @@ -10,6 +10,9 @@
>  #endif
>  
>  struct boot_module {
> +    paddr_t start;
> +    size_t size;

I think size should be paddr_t (instead of size_t) to make sure it is
the right size on both 64-bit and 32-bit architectures that support
64-bit addresses.


>      struct arch_bootmodule *arch;
>  };

