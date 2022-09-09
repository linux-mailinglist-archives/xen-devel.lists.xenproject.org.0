Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A30425B418D
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 23:40:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404567.647112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWlil-0005uz-9b; Fri, 09 Sep 2022 21:39:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404567.647112; Fri, 09 Sep 2022 21:39:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWlil-0005rZ-6W; Fri, 09 Sep 2022 21:39:31 +0000
Received: by outflank-mailman (input) for mailman id 404567;
 Fri, 09 Sep 2022 21:39:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5CMf=ZM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oWlij-0005rT-9I
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 21:39:29 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e02810e6-3087-11ed-a31c-8f8a9ae3403f;
 Fri, 09 Sep 2022 23:39:27 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id C7EB6CE2462;
 Fri,  9 Sep 2022 21:39:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E625C433C1;
 Fri,  9 Sep 2022 21:39:22 +0000 (UTC)
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
X-Inumbo-ID: e02810e6-3087-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662759563;
	bh=WF9a+4xTSooI6ApIP+0Yd/CoT9WZkHMvxCNn2JHTzl8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=C224UHW/od2vUWJUV5sxndFt1RKPY3I1HW7bNLuitOWhEVpluU8FDnqbEPEJM8zls
	 oAJDzm4i0KYqqawZnS+rWLq4UVHrwcgpyVg8FFBevKmBm4sA4uBMoz1tESLr0xzz2X
	 nY3kBYYJ8CiZnsEjAvFQjJ3TPwIU6C284qr/0dJxIWTRVyfgOvjHIaG1QA5H/4sNaY
	 fsEBJGj9sOl6d0CE3n3ClBppRd7/Mn7KHa8i3CBxV4W3ChODWy21iGhLGz6J6Gu9JO
	 9GCEs0WhiyhwhBcjRAlYyr+DA8MUWt60+M1MBo2e5NyI3ctR7x9jisEPp9nk5gxUZa
	 syFozcvgSoZkQ==
Date: Fri, 9 Sep 2022 14:39:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <volodymyr_babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH] zap linking-only option from EMBEDDED_EXTRA_CFLAGS
In-Reply-To: <d640d386-8b6d-5e1c-4dd5-b5d928ab8b2b@suse.com>
Message-ID: <alpine.DEB.2.22.394.2209091413070.157835@ubuntu-linux-20-04-desktop>
References: <d640d386-8b6d-5e1c-4dd5-b5d928ab8b2b@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 9 Sep 2022, Jan Beulich wrote:
> While I was suspicious of the compiler issuing a diagnostic about an
> unused linking-only option when not doing any linking, I did check this
> with a couple of gcc versions only, but not with Clang. (Oddly enough at
> least older Clang versions complain about the use of '-nopie' now that
> we actually use '-no-pie'.) Filter out the problematic option in all
> cases where the variable is consumed for compilation only (which right
> now is everywhere).
> 
> Fixes: ecd6b9759919 ("Config.mk: correct PIE-related option(s) in EMBEDDED_EXTRA_CFLAGS")
> Reported-by: Stefano Stabellini <sstabellini@kernel.org>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I don't think I can review the patch but it made the pipeline pass
again: 

https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/636189844

So:

Tested-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Arguably with all users of EMBEDDED_EXTRA_CFLAGS using these just for
> compiling, the option could be omitted from that variable right away.
> But if any compile-and-link-in-one-go use appeared, there would be an
> issue.
> 
> --- a/tools/firmware/Rules.mk
> +++ b/tools/firmware/Rules.mk
> @@ -13,7 +13,7 @@ endif
>  
>  CFLAGS += -Werror
>  
> -$(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
> +$(call cc-options-add,CFLAGS,CC,$(filter-out -no-pie,$(EMBEDDED_EXTRA_CFLAGS)))
>  
>  $(call cc-option-add,CFLAGS,CC,-fcf-protection=none)
>  
> --- a/tools/tests/x86_emulator/testcase.mk
> +++ b/tools/tests/x86_emulator/testcase.mk
> @@ -2,7 +2,7 @@ XEN_ROOT = $(CURDIR)/../../..
>  CFLAGS :=
>  include $(XEN_ROOT)/tools/Rules.mk
>  
> -$(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
> +$(call cc-options-add,CFLAGS,CC,$(filter-out -no-pie,$(EMBEDDED_EXTRA_CFLAGS)))
>  
>  CFLAGS += -fno-builtin -g0 $($(TESTCASE)-cflags)
>  
> --- a/xen/arch/arm/arch.mk
> +++ b/xen/arch/arm/arch.mk
> @@ -1,7 +1,7 @@
>  ########################################
>  # arm-specific definitions
>  
> -$(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
> +$(call cc-options-add,CFLAGS,CC,$(filter-out -no-pie,$(EMBEDDED_EXTRA_CFLAGS)))
>  $(call cc-option-add,CFLAGS,CC,-Wnested-externs)
>  
>  # Prevent floating-point variables from creeping into Xen.
> --- a/xen/arch/x86/arch.mk
> +++ b/xen/arch/x86/arch.mk
> @@ -10,7 +10,7 @@ CFLAGS += -DXEN_IMG_OFFSET=$(XEN_IMG_OFF
>  # Prevent floating-point variables from creeping into Xen.
>  CFLAGS += -msoft-float
>  
> -$(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
> +$(call cc-options-add,CFLAGS,CC,$(filter-out -no-pie,$(EMBEDDED_EXTRA_CFLAGS)))
>  $(call cc-option-add,CFLAGS,CC,-Wnested-externs)
>  $(call as-option-add,CFLAGS,CC,"vmcall",-DHAVE_AS_VMX)
>  $(call as-option-add,CFLAGS,CC,"crc32 %eax$$(comma)%eax",-DHAVE_AS_SSE4_2)
> --- a/xen/arch/x86/boot/Makefile
> +++ b/xen/arch/x86/boot/Makefile
> @@ -12,7 +12,7 @@ endif
>  $(obj)/head.o: $(head-bin-objs:.o=.bin)
>  
>  CFLAGS_x86_32 := $(subst -m64,-m32 -march=i686,$(XEN_TREEWIDE_CFLAGS))
> -$(call cc-options-add,CFLAGS_x86_32,CC,$(EMBEDDED_EXTRA_CFLAGS))
> +$(call cc-options-add,CFLAGS_x86_32,CC,$(filter-out -no-pie,$(EMBEDDED_EXTRA_CFLAGS)))
>  CFLAGS_x86_32 += -Werror -fno-builtin -g0 -msoft-float
>  ifdef building_out_of_srctree
>  CFLAGS_x86_32 += -I$(objtree)/include
> 

