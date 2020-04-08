Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8511A2032
	for <lists+xen-devel@lfdr.de>; Wed,  8 Apr 2020 13:51:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jM9E7-0006hz-Jw; Wed, 08 Apr 2020 11:50:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=N8iV=5Y=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jM9E5-0006hu-Lh
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2020 11:50:37 +0000
X-Inumbo-ID: 28de8218-798f-11ea-81d1-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 28de8218-798f-11ea-81d1-12813bfff9fa;
 Wed, 08 Apr 2020 11:50:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 77059ABC2;
 Wed,  8 Apr 2020 11:50:34 +0000 (UTC)
Subject: Re: [XEN PATCH v4 06/18] xen/build: have the root Makefile generates
 the CFLAGS
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200331103102.1105674-1-anthony.perard@citrix.com>
 <20200331103102.1105674-7-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a2b16a74-4eed-eeae-d791-fa9fd4e63d08@suse.com>
Date: Wed, 8 Apr 2020 13:50:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200331103102.1105674-7-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 31.03.2020 12:30, Anthony PERARD wrote:
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -115,6 +115,64 @@ $(KCONFIG_CONFIG):
>  include/config/%.conf include/config/%.conf.cmd: $(KCONFIG_CONFIG)
>  	$(MAKE) $(kconfig) syncconfig
>  
> +ifeq ($(CONFIG_DEBUG),y)
> +CFLAGS += -O1
> +else
> +CFLAGS += -O2
> +endif
> +
> +ifeq ($(CONFIG_FRAME_POINTER),y)
> +CFLAGS += -fno-omit-frame-pointer
> +else
> +CFLAGS += -fomit-frame-pointer
> +endif
> +
> +CFLAGS += -nostdinc -fno-builtin -fno-common
> +CFLAGS += -Werror -Wredundant-decls -Wno-pointer-arith
> +$(call cc-option-add,CFLAGS,CC,-Wvla)
> +CFLAGS += -pipe -D__XEN__ -include $(BASEDIR)/include/xen/config.h
> +CFLAGS-$(CONFIG_DEBUG_INFO) += -g
> +
> +ifneq ($(CONFIG_CC_IS_CLANG),y)
> +# Clang doesn't understand this command line argument, and doesn't appear to
> +# have an suitable alternative.  The resulting compiled binary does function,

I realize you only move this, but it would still be nice to adjust
this to "... a suitable alternative" on this occasion.

> +# but has an excessively large symbol table.
> +CFLAGS += -Wa,--strip-local-absolute
> +endif
> +
> +AFLAGS += -D__ASSEMBLY__
> +
> +CFLAGS += $(CFLAGS-y)
> +# allow extra CFLAGS externally via EXTRA_CFLAGS_XEN_CORE
> +CFLAGS += $(EXTRA_CFLAGS_XEN_CORE)
> +
> +# Most CFLAGS are safe for assembly files:
> +#  -std=gnu{89,99} gets confused by #-prefixed end-of-line comments
> +#  -flto makes no sense and annoys clang
> +AFLAGS += $(filter-out -std=gnu% -flto,$(CFLAGS)) $(AFLAGS-y)
> +
> +# LDFLAGS are only passed directly to $(LD)
> +LDFLAGS += $(LDFLAGS_DIRECT) $(LDFLAGS-y)
> +
> +ifeq ($(CONFIG_UBSAN),y)
> +CFLAGS_UBSAN := -fsanitize=undefined
> +else
> +CFLAGS_UBSAN :=
> +endif
> +
> +ifeq ($(CONFIG_LTO),y)
> +CFLAGS += -flto
> +LDFLAGS-$(CONFIG_CC_IS_CLANG) += -plugin LLVMgold.so
> +endif
> +
> +include $(BASEDIR)/arch/$(TARGET_ARCH)/arch.mk
> +
> +# define new variables to avoid the ones defines in Config.mk

s/defines/defined/

> @@ -140,10 +95,19 @@ obj-bin-y :=
>  endif
>  
>  # Always build obj-bin files as binary even if they come from C source. 
> -$(obj-bin-y): CFLAGS := $(filter-out -flto,$(CFLAGS))
> +# FIXME LTO broken, but we would need a different way to filter -flto out
> +# $(obj-bin-y): CFLAGS := $(filter-out -flto,$(CFLAGS))

While you mention this in the description, I'm still not overly
happy with it getting commented out. What's wrong with making the
construct simply act on c_flags?

Jan

