Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3388B908CC0
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2024 15:51:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740714.1147803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI7Kg-0002HN-LU; Fri, 14 Jun 2024 13:51:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740714.1147803; Fri, 14 Jun 2024 13:51:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI7Kg-0002Ff-If; Fri, 14 Jun 2024 13:51:10 +0000
Received: by outflank-mailman (input) for mailman id 740714;
 Fri, 14 Jun 2024 13:51:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9HBj=NQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sI7Kf-0002FW-UP
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2024 13:51:09 +0000
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [2607:f8b0:4864:20::731])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 252b5ffc-2a55-11ef-b4bb-af5377834399;
 Fri, 14 Jun 2024 15:51:06 +0200 (CEST)
Received: by mail-qk1-x731.google.com with SMTP id
 af79cd13be357-7955ddc6516so141691585a.1
 for <xen-devel@lists.xenproject.org>; Fri, 14 Jun 2024 06:51:06 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b2a5c20f53sm18354606d6.52.2024.06.14.06.51.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 06:51:04 -0700 (PDT)
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
X-Inumbo-ID: 252b5ffc-2a55-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718373065; x=1718977865; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lL/roLVeJrxRc9BOdQ3ATJcgWgV8aNLf03wtQeihneo=;
        b=U1TnUvn7hlXjYqObVYha4Ac4ss6KSUU/FFPB8ybxDfT9nWdofqpNUt6tzWQCOTPMdk
         bvITgHQRj4Qd1saaAepH6QxUn75r9NtnfgIFpk4IiatIWAPftdTrzV+quJAdHZdOYP1o
         cZg1D7/h+j4LiC0YrVeowcSbAN9JgWW35MmUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718373065; x=1718977865;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lL/roLVeJrxRc9BOdQ3ATJcgWgV8aNLf03wtQeihneo=;
        b=bI5upXs9OsLaNfdU6OHz7miwnHbq9Tge7s7bTTKSiw+uETQngfBpUQOirb5ef41xUu
         G7cecSLMS2HuLTKkxa9Oe8cSOy6WcAOUuxXX5LIVKIUpUCe0K+pWZolM6dEVI2BEGMTw
         5FizjMBIF0fZy2jVP2NNfQ89y4pNo+GfbVeCtHhRtXKHVi5r5vRjIhAv5mhqJUNzQxex
         9R14zIqSa4YvVFp+GqOOmO0NAX34iwFyI6InpUGEooXO1950thZc03v60tYxrRqhVmx7
         Vf7Gjfjn06fIpNzDH/Sx5S+4uO6mSjiRp0KpwLERzrt/5gYw47hXFdDmoQu4zQw7JjQ5
         G//A==
X-Gm-Message-State: AOJu0Yz1Ub4KqM1ETV+TSZnKtyN8pi8VYanPpU4YgAmA664zbqqaiAOX
	TtWVNyw75yRJsJRi7y5uNbb8aG4LCR4Sim9wQ3eomqKWedVanYdzgQviOnzD34k=
X-Google-Smtp-Source: AGHT+IEVb6mR2a1WL/ir6xYvS9r7GSEHw+uF2sOMFs3/1AWICfiujuV+pf+dOsFZEFxAEBcNMFZbOQ==
X-Received: by 2002:a05:6214:2a2:b0:6ae:2da4:fd74 with SMTP id 6a1803df08f44-6b2afc6efcfmr26644376d6.6.1718373064891;
        Fri, 14 Jun 2024 06:51:04 -0700 (PDT)
Date: Fri, 14 Jun 2024 15:51:02 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: Re: [PATCH for-4.19] xen/arch: Centralise __read_mostly and
 __ro_after_init
Message-ID: <ZmxKxob_5LZHvCaa@macbook>
References: <20240614124950.1557058-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240614124950.1557058-1-andrew.cooper3@citrix.com>

On Fri, Jun 14, 2024 at 01:49:50PM +0100, Andrew Cooper wrote:
> These being in cache.h is inherited from Linux, but is an inappropriate
> location to live.
> 
> __read_mostly is an optimisation related to data placement in order to avoid
> having shared data in cachelines that are likely to be written to, but it
> really is just a section of the linked image separating data by usage
> patterns; it has nothing to do with cache sizes or flushing logic.
> 
> Worse, __ro_after_init was only in xen/cache.h because __read_mostly was in
> arch/cache.h, and has literally nothing whatsoever to do with caches.
> 
> Move the definitions into xen/sections.h, which in paritcular means that
> RISC-V doesn't need to repeat the problematic pattern.  Take the opportunity
> to provide a short descriptions of what these are used for.
> 
> For now, leave TODO comments next to the other identical definitions.  It
> turns out that unpicking cache.h is more complicated than it appears because a
> number of files use it for transitive dependencies.

I assume that including sections.h from cache.h (in the meantime)
creates a circular header dependency?

> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: Shawn Anastasio <sanastasio@raptorengineering.com>
> 
> For 4.19.  This is to help the RISC-V "full build of Xen" effort without
> introducing a pattern that's going to require extra effort to undo after the
> fact.
> ---
>  xen/arch/arm/include/asm/cache.h |  1 +
>  xen/arch/ppc/include/asm/cache.h |  1 +
>  xen/arch/x86/include/asm/cache.h |  1 +
>  xen/include/xen/cache.h          |  1 +
>  xen/include/xen/sections.h       | 21 +++++++++++++++++++++
>  5 files changed, 25 insertions(+)
> 
> diff --git a/xen/arch/arm/include/asm/cache.h b/xen/arch/arm/include/asm/cache.h
> index 240b6ae0eaa3..029b2896fb3e 100644
> --- a/xen/arch/arm/include/asm/cache.h
> +++ b/xen/arch/arm/include/asm/cache.h
> @@ -6,6 +6,7 @@
>  #define L1_CACHE_SHIFT  (CONFIG_ARM_L1_CACHE_SHIFT)
>  #define L1_CACHE_BYTES  (1 << L1_CACHE_SHIFT)
>  
> +/* TODO: Phase out the use of this via cache.h */
>  #define __read_mostly __section(".data.read_mostly")
>  
>  #endif
> diff --git a/xen/arch/ppc/include/asm/cache.h b/xen/arch/ppc/include/asm/cache.h
> index 0d7323d7892f..13c0bf3242c8 100644
> --- a/xen/arch/ppc/include/asm/cache.h
> +++ b/xen/arch/ppc/include/asm/cache.h
> @@ -3,6 +3,7 @@
>  #ifndef _ASM_PPC_CACHE_H
>  #define _ASM_PPC_CACHE_H
>  
> +/* TODO: Phase out the use of this via cache.h */
>  #define __read_mostly __section(".data.read_mostly")
>  
>  #endif /* _ASM_PPC_CACHE_H */
> diff --git a/xen/arch/x86/include/asm/cache.h b/xen/arch/x86/include/asm/cache.h
> index e4770efb22b9..956c05493e23 100644
> --- a/xen/arch/x86/include/asm/cache.h
> +++ b/xen/arch/x86/include/asm/cache.h
> @@ -9,6 +9,7 @@
>  #define L1_CACHE_SHIFT	(CONFIG_X86_L1_CACHE_SHIFT)
>  #define L1_CACHE_BYTES	(1 << L1_CACHE_SHIFT)
>  
> +/* TODO: Phase out the use of this via cache.h */
>  #define __read_mostly __section(".data.read_mostly")
>  
>  #ifndef __ASSEMBLY__
> diff --git a/xen/include/xen/cache.h b/xen/include/xen/cache.h
> index f52a0aedf768..55456823c543 100644
> --- a/xen/include/xen/cache.h
> +++ b/xen/include/xen/cache.h
> @@ -15,6 +15,7 @@
>  #define __cacheline_aligned __attribute__((__aligned__(SMP_CACHE_BYTES)))
>  #endif
>  
> +/* TODO: Phase out the use of this via cache.h */
>  #define __ro_after_init __section(".data.ro_after_init")
>  
>  #endif /* __LINUX_CACHE_H */
> diff --git a/xen/include/xen/sections.h b/xen/include/xen/sections.h
> index b6cb5604c285..6d4db2b38f0f 100644
> --- a/xen/include/xen/sections.h
> +++ b/xen/include/xen/sections.h
> @@ -3,9 +3,30 @@
>  #ifndef __XEN_SECTIONS_H__
>  #define __XEN_SECTIONS_H__
>  
> +#include <xen/compiler.h>
> +
>  /* SAF-0-safe */
>  extern char __init_begin[], __init_end[];
>  
> +/*
> + * Some data is expected to be written very rarely (if at all).
> + *
> + * For performance reasons is it helpful to group such data in the build, to
> + * avoid the linker placing it adjacent to often-written data.
> + */
> +#define __read_mostly __section(".data.read_mostly")
> +
> +/*
> + * Some data should be chosen during boot and be immutable thereafter.
> + *
> + * Variables annotated with __ro_after_init will become read-only after boot
> + * and suffer a runtime access fault if modified.
> + *
> + * For architectures/platforms which haven't implemented support, these
> + * variables will be treated as regular mutable data.
> + */
> +#define __ro_after_init __section(".data.ro_after_init")

Is it fine for MISRA to have possibly two identical defines in the
same translation unit?

Thanks, Roger.

