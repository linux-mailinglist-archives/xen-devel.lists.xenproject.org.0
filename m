Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 165D42B8279
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 18:00:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.30137.59913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfQoh-0005zd-KW; Wed, 18 Nov 2020 17:00:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30137.59913; Wed, 18 Nov 2020 17:00:23 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfQoh-0005zE-H1; Wed, 18 Nov 2020 17:00:23 +0000
Received: by outflank-mailman (input) for mailman id 30137;
 Wed, 18 Nov 2020 17:00:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kfQof-0005z2-Fs
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 17:00:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfQob-0006H6-C3; Wed, 18 Nov 2020 17:00:17 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfQoa-0002z2-Vc; Wed, 18 Nov 2020 17:00:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfQof-0005z2-Fs
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 17:00:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=vYgPz77aatxOKfMFV00Xc3Exjd37I7NhhUHKvf9lVlg=; b=ECttsMDiKWIPZeSYkInbSw/2Pf
	rl3TJlzWGu7zr51xT+oZqXzA7vHykZVovpTyrsPK5B1PEh3/HiNkk0AdJLkAeB8vgsmZR9LtsD5DX
	tIB8Cs5YUIoVL+RXFR0jITD5fvozC3/FApLn7b1ortxJgjTlZrDhlAs1aUoqHQ2WasAk=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfQob-0006H6-C3; Wed, 18 Nov 2020 17:00:17 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfQoa-0002z2-Vc; Wed, 18 Nov 2020 17:00:17 +0000
Subject: Re: [PATCH v2 1/8] lib: split _ctype[] into its own object, under
 lib/
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <aa1ca5da-3ecf-8721-63f9-b86ebbc64330@suse.com>
 <8bf44bbd-8c39-7ab1-3ccb-52bf3744592b@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <0bdd27a2-f770-260b-298b-bceba9b28adc@xen.org>
Date: Wed, 18 Nov 2020 17:00:15 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <8bf44bbd-8c39-7ab1-3ccb-52bf3744592b@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 23/10/2020 11:16, Jan Beulich wrote:
> This is, besides for tidying, in preparation of then starting to use an
> archive rather than an object file for generic library code which
> arch-es (or even specific configurations within a single arch) may or
> may not need.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> ---
>   xen/Makefile     |  3 ++-
>   xen/Rules.mk     |  2 +-
>   xen/common/lib.c | 29 -----------------------------
>   xen/lib/Makefile |  1 +
>   xen/lib/ctype.c  | 38 ++++++++++++++++++++++++++++++++++++++
>   5 files changed, 42 insertions(+), 31 deletions(-)
>   create mode 100644 xen/lib/ctype.c
> 
> diff --git a/xen/Makefile b/xen/Makefile
> index bf0c804d4352..73bdc326c549 100644
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -331,6 +331,7 @@ _clean: delete-unfresh-files
>   	$(MAKE) $(clean) include
>   	$(MAKE) $(clean) common
>   	$(MAKE) $(clean) drivers
> +	$(MAKE) $(clean) lib
>   	$(MAKE) $(clean) xsm
>   	$(MAKE) $(clean) crypto
>   	$(MAKE) $(clean) arch/arm
> @@ -414,7 +415,7 @@ include/asm-$(TARGET_ARCH)/asm-offsets.h: arch/$(TARGET_ARCH)/asm-offsets.s
>   	  echo ""; \
>   	  echo "#endif") <$< >$@
>   
> -SUBDIRS = xsm arch/$(TARGET_ARCH) common drivers test
> +SUBDIRS = xsm arch/$(TARGET_ARCH) common drivers lib test
>   define all_sources
>       ( find include/asm-$(TARGET_ARCH) -name '*.h' -print; \
>         find include -name 'asm-*' -prune -o -name '*.h' -print; \
> diff --git a/xen/Rules.mk b/xen/Rules.mk
> index 891c94e6ad00..333e19bec343 100644
> --- a/xen/Rules.mk
> +++ b/xen/Rules.mk
> @@ -36,7 +36,7 @@ TARGET := $(BASEDIR)/xen
>   # Note that link order matters!
>   ALL_OBJS-y               += $(BASEDIR)/common/built_in.o
>   ALL_OBJS-y               += $(BASEDIR)/drivers/built_in.o
> -ALL_OBJS-$(CONFIG_X86)   += $(BASEDIR)/lib/built_in.o
> +ALL_OBJS-y               += $(BASEDIR)/lib/built_in.o
>   ALL_OBJS-y               += $(BASEDIR)/xsm/built_in.o
>   ALL_OBJS-y               += $(BASEDIR)/arch/$(TARGET_ARCH)/built_in.o
>   ALL_OBJS-$(CONFIG_CRYPTO)   += $(BASEDIR)/crypto/built_in.o
> diff --git a/xen/common/lib.c b/xen/common/lib.c
> index b2b799da44c5..a224efa8f6e8 100644
> --- a/xen/common/lib.c
> +++ b/xen/common/lib.c
> @@ -1,37 +1,8 @@
> -
> -#include <xen/ctype.h>
>   #include <xen/lib.h>
>   #include <xen/types.h>
>   #include <xen/init.h>
>   #include <asm/byteorder.h>
>   
> -/* for ctype.h */
> -const unsigned char _ctype[] = {
> -    _C,_C,_C,_C,_C,_C,_C,_C,                        /* 0-7 */
> -    _C,_C|_S,_C|_S,_C|_S,_C|_S,_C|_S,_C,_C,         /* 8-15 */
> -    _C,_C,_C,_C,_C,_C,_C,_C,                        /* 16-23 */
> -    _C,_C,_C,_C,_C,_C,_C,_C,                        /* 24-31 */
> -    _S|_SP,_P,_P,_P,_P,_P,_P,_P,                    /* 32-39 */
> -    _P,_P,_P,_P,_P,_P,_P,_P,                        /* 40-47 */
> -    _D,_D,_D,_D,_D,_D,_D,_D,                        /* 48-55 */
> -    _D,_D,_P,_P,_P,_P,_P,_P,                        /* 56-63 */
> -    _P,_U|_X,_U|_X,_U|_X,_U|_X,_U|_X,_U|_X,_U,      /* 64-71 */
> -    _U,_U,_U,_U,_U,_U,_U,_U,                        /* 72-79 */
> -    _U,_U,_U,_U,_U,_U,_U,_U,                        /* 80-87 */
> -    _U,_U,_U,_P,_P,_P,_P,_P,                        /* 88-95 */
> -    _P,_L|_X,_L|_X,_L|_X,_L|_X,_L|_X,_L|_X,_L,      /* 96-103 */
> -    _L,_L,_L,_L,_L,_L,_L,_L,                        /* 104-111 */
> -    _L,_L,_L,_L,_L,_L,_L,_L,                        /* 112-119 */
> -    _L,_L,_L,_P,_P,_P,_P,_C,                        /* 120-127 */
> -    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,                /* 128-143 */
> -    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,                /* 144-159 */
> -    _S|_SP,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,   /* 160-175 */
> -    _P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,       /* 176-191 */
> -    _U,_U,_U,_U,_U,_U,_U,_U,_U,_U,_U,_U,_U,_U,_U,_U,       /* 192-207 */
> -    _U,_U,_U,_U,_U,_U,_U,_P,_U,_U,_U,_U,_U,_U,_U,_L,       /* 208-223 */
> -    _L,_L,_L,_L,_L,_L,_L,_L,_L,_L,_L,_L,_L,_L,_L,_L,       /* 224-239 */
> -    _L,_L,_L,_L,_L,_L,_L,_P,_L,_L,_L,_L,_L,_L,_L,_L};      /* 240-255 */
> -
>   /*
>    * A couple of 64 bit operations ported from FreeBSD.
>    * The code within the '#if BITS_PER_LONG == 32' block below, and no other
> diff --git a/xen/lib/Makefile b/xen/lib/Makefile
> index 7019ca00e8fd..53b1da025e0d 100644
> --- a/xen/lib/Makefile
> +++ b/xen/lib/Makefile
> @@ -1 +1,2 @@
> +obj-y += ctype.o
>   obj-$(CONFIG_X86) += x86/
> diff --git a/xen/lib/ctype.c b/xen/lib/ctype.c
> new file mode 100644
> index 000000000000..7b233a335fdf
> --- /dev/null
> +++ b/xen/lib/ctype.c
> @@ -0,0 +1,38 @@
> +#include <xen/ctype.h>
> +
> +/* for ctype.h */
> +const unsigned char _ctype[] = {
> +    _C,_C,_C,_C,_C,_C,_C,_C,                        /* 0-7 */
> +    _C,_C|_S,_C|_S,_C|_S,_C|_S,_C|_S,_C,_C,         /* 8-15 */
> +    _C,_C,_C,_C,_C,_C,_C,_C,                        /* 16-23 */
> +    _C,_C,_C,_C,_C,_C,_C,_C,                        /* 24-31 */
> +    _S|_SP,_P,_P,_P,_P,_P,_P,_P,                    /* 32-39 */
> +    _P,_P,_P,_P,_P,_P,_P,_P,                        /* 40-47 */
> +    _D,_D,_D,_D,_D,_D,_D,_D,                        /* 48-55 */
> +    _D,_D,_P,_P,_P,_P,_P,_P,                        /* 56-63 */
> +    _P,_U|_X,_U|_X,_U|_X,_U|_X,_U|_X,_U|_X,_U,      /* 64-71 */
> +    _U,_U,_U,_U,_U,_U,_U,_U,                        /* 72-79 */
> +    _U,_U,_U,_U,_U,_U,_U,_U,                        /* 80-87 */
> +    _U,_U,_U,_P,_P,_P,_P,_P,                        /* 88-95 */
> +    _P,_L|_X,_L|_X,_L|_X,_L|_X,_L|_X,_L|_X,_L,      /* 96-103 */
> +    _L,_L,_L,_L,_L,_L,_L,_L,                        /* 104-111 */
> +    _L,_L,_L,_L,_L,_L,_L,_L,                        /* 112-119 */
> +    _L,_L,_L,_P,_P,_P,_P,_C,                        /* 120-127 */
> +    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,                /* 128-143 */
> +    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,                /* 144-159 */
> +    _S|_SP,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,   /* 160-175 */
> +    _P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,       /* 176-191 */
> +    _U,_U,_U,_U,_U,_U,_U,_U,_U,_U,_U,_U,_U,_U,_U,_U,       /* 192-207 */
> +    _U,_U,_U,_U,_U,_U,_U,_P,_U,_U,_U,_U,_U,_U,_U,_L,       /* 208-223 */
> +    _L,_L,_L,_L,_L,_L,_L,_L,_L,_L,_L,_L,_L,_L,_L,_L,       /* 224-239 */
> +    _L,_L,_L,_L,_L,_L,_L,_P,_L,_L,_L,_L,_L,_L,_L,_L};      /* 240-255 */
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
> 

-- 
Julien Grall

