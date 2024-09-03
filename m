Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E2C969AED
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 12:55:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788960.1198477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slRBg-00048q-JU; Tue, 03 Sep 2024 10:55:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788960.1198477; Tue, 03 Sep 2024 10:55:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slRBg-00046h-GM; Tue, 03 Sep 2024 10:55:04 +0000
Received: by outflank-mailman (input) for mailman id 788960;
 Tue, 03 Sep 2024 10:55:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nxvv=QB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1slRBe-00043J-C4
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 10:55:02 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f76dbda8-69e2-11ef-99a1-01e77a169b0f;
 Tue, 03 Sep 2024 12:55:00 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a8a1acb51a7so123599466b.2
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 03:55:00 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8988feb410sm670104666b.21.2024.09.03.03.54.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 03:54:59 -0700 (PDT)
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
X-Inumbo-ID: f76dbda8-69e2-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725360900; x=1725965700; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ruuHfA1CZgr/tpy4Mx17uVhrV0mGyNg08qZWplCX61w=;
        b=rnQ9JvujBhYn0OmQ0D/2ueuSsEH7E7STNu1HeodKgAeJK1WBn50Xqn5OeVZZuEh5xO
         ghUSQjq3RM28edInjWaCwfWT+/m2rK1pC13o/Kv7/ESYCtdd3iK1fh1zp/OZvfzPxrcA
         nrpc/iIElbyctVWOKJiW5XJRY8eLfkWR2MNy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725360900; x=1725965700;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ruuHfA1CZgr/tpy4Mx17uVhrV0mGyNg08qZWplCX61w=;
        b=Jrrvd8mcKy3YBr8d3n9nCE/NeW99rPBwMrKJShElLooJhFWOJfjUD90ilgjRxgRfRA
         wP0nigRkF/N29PJZ4X5nAtqEBEH6sl89xVMDfh3V+0SlvsJ5h3vuZnyMM8qRhO5rtLp4
         SAt7PIoRu6KC6fHiju4bX/46SWb5qV7GWC0F5Up3Exh0/6uU9rJhIPVmUatisPdLK57s
         11VRW5tsPTarTvy8Qy8kav5r0vtja+zEGAIMMY+HvhTwbhV6rn8WoCpw+vTQAJoDVM8Q
         rmgA7lTm50XbGdAeSDLqdSJ8SLnSg3iJF2KgoG5wgkDDGo/ePZW5pF1UPONC0AS0Kx+M
         Q3fA==
X-Gm-Message-State: AOJu0Yx/3PlAA4wf9Y7mGd17NTMlshcQ0vVSe2GVePTDvmnH10wev3uJ
	fPzkI12DZBsWLVpdkPz8bzNYm9gE+Doswmvn2GBPWInG80rlwWn5MKX0jc+O9NQ=
X-Google-Smtp-Source: AGHT+IE4Bz1aGacfkFx4t4KEo5zmsJzQa9EY0RUgpugPvc1GdvdRjFj/v++D4a7SWt8Y/Hk35BiU6A==
X-Received: by 2002:a17:907:72c9:b0:a7a:ab8a:38f with SMTP id a640c23a62f3a-a8a1d3356bcmr212050266b.41.1725360899536;
        Tue, 03 Sep 2024 03:54:59 -0700 (PDT)
Date: Tue, 3 Sep 2024 12:54:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH] x86/boot: Reinstate -nostdinc for CFLAGS_x86_32
Message-ID: <ZtbrAnF97EXZvr8t@macbook.local>
References: <20240903104940.3514994-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240903104940.3514994-1-andrew.cooper3@citrix.com>

On Tue, Sep 03, 2024 at 11:49:40AM +0100, Andrew Cooper wrote:
> Most of Xen is build using -nostdinc and a fully specified include path.
> However, the makefile line:
> 
>   $(head-bin-objs): XEN_CFLAGS := $(CFLAGS_x86_32) -fpic
> 
> discards XEN_CFLAGS and replaces them with CFLAGS_x86_32.
> 
> Reinstate -nostdinc, and add the arch include path to the command line.  This
> is a latent bug for now, but it breaks properly with subsequent include
> changes.
> 
> Fixes: d58a509e01c4 ("build,x86: remove the need for build32.mk")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Anthony PERARD <anthony.perard@vates.tech>
> ---
>  xen/arch/x86/boot/Makefile | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
> index 03d8ce3a9e48..19eec01e176e 100644
> --- a/xen/arch/x86/boot/Makefile
> +++ b/xen/arch/x86/boot/Makefile
> @@ -13,11 +13,11 @@ $(obj)/head.o: $(head-bin-objs:.o=.bin)
>  
>  CFLAGS_x86_32 := $(subst -m64,-m32 -march=i686,$(XEN_TREEWIDE_CFLAGS))
>  $(call cc-options-add,CFLAGS_x86_32,CC,$(EMBEDDED_EXTRA_CFLAGS))
> -CFLAGS_x86_32 += -Werror -fno-builtin -g0 -msoft-float
> +CFLAGS_x86_32 += -Werror -nostdinc -fno-builtin -g0 -msoft-float
>  ifneq ($(abs_objtree),$(abs_srctree))
> -CFLAGS_x86_32 += -I$(objtree)/include
> +CFLAGS_x86_32 += -I$(objtree)/include -I$(objtree)/arch/$(SRCARCH)/include
>  endif
> -CFLAGS_x86_32 += -I$(srctree)/include
> +CFLAGS_x86_32 += -I$(srctree)/include -I$(srctree)/arch/$(SRCARCH)/include

I think it might be best to just filter out the include paths from
XEN_CFLAGS, iow:

CFLAGS_x86_32 += $(filter -I%,$(XEN_CFLAGS))

Instead of having to open-code the paths for the include search paths
here again.  Using the filter leads to the following CC command line:

clang -MMD -MP -MF arch/x86/boot/.cmdline.o.d -m32 -march=i686 -DBUILD_ID -fno-strict-aliasing -std=gnu99 -Wall -Wstrict-prototypes -Wno-unused-but-set-variable -Wno-unused-local-typedefs   -fno-pie -fno-stack-protector -fno-exceptions -fno-asynchronous-unwind-tables -Werror -fno-builtin -g0 -msoft-float -mregparm=3 -I./include -I./arch/x86/include -I./arch/x86/include/generated -I./arch/x86/include/asm/mach-generic -I./arch/x86/include/asm/mach-default -fpic '-D__OBJECT_LABEL__=arch/x86/boot/cmdline.o'    -c arch/x86/boot/cmdline.c -o arch/x86/boot/.cmdline.o.tmp -MQ arch/x86/boot/cmdline.o

Thanks, Roger.

