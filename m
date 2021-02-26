Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8099B32633D
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 14:25:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90302.170888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFd6u-00035j-13; Fri, 26 Feb 2021 13:24:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90302.170888; Fri, 26 Feb 2021 13:24:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFd6t-00035K-U5; Fri, 26 Feb 2021 13:24:47 +0000
Received: by outflank-mailman (input) for mailman id 90302;
 Fri, 26 Feb 2021 13:24:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eEmz=H4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lFd6s-00035F-SN
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 13:24:46 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 56aa94ae-98bf-4783-861e-817ff318cb2e;
 Fri, 26 Feb 2021 13:24:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 903F8AE03;
 Fri, 26 Feb 2021 13:24:42 +0000 (UTC)
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
X-Inumbo-ID: 56aa94ae-98bf-4783-861e-817ff318cb2e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614345882; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OUpcpPMutVwL7WbdAb54o2pRIBfzT/3WyF0xRDCbN5U=;
	b=uI03xR78/W73PAWoxsNWqSWxiIq3+t67AQo+C4nQzaYDjTsHotzXAcumaL/L2gaeB3u8PN
	nl+hnVLX5zo4HNls/gyh9gK4vdP25VZ14O2BAmmxfgQ3EqlqhzVzH48lESoadfoq5LHJ//
	qWFKTkPfYrbWUQAR1/Scq+2Pnp8OdfQ=
Subject: Re: [PATCH for-4.15 2/3] firmware: provide a stand alone set of
 headers
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210226085908.21254-1-roger.pau@citrix.com>
 <20210226085908.21254-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2133ba4c-5120-30ca-1328-c8700fd2db94@suse.com>
Date: Fri, 26 Feb 2021 14:24:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210226085908.21254-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 26.02.2021 09:59, Roger Pau Monne wrote:
> The current build of the firmware relies on having 32bit compatible
> headers installed in order to build some of the 32bit firmware, but
> that usually requires multilib support and installing a i386 libc when
> building from an amd64 environment which is cumbersome just to get
> some headers.
> 
> Usually this could be solved by using the -ffreestanding compiler
> option which drops the usage of the system headers in favor of a
> private set of freestanding headers provided by the compiler itself
> that are not tied to libc. However such option is broken at least
> in the gcc compiler provided in Alpine Linux, as the system include
> path (ie: /usr/include) takes precedence over the gcc private include
> path:
> 
> #include <...> search starts here:
>  /usr/include
>  /usr/lib/gcc/x86_64-alpine-linux-musl/10.2.1/include
> 
> Since -ffreestanding is currently broken on at least that distro, and
> for resilience against future compilers also having the option broken
> provide a set of stand alone 32bit headers required for the firmware
> build.
> 
> This allows to drop the build time dependency on having a i386
> compatible set of libc headers on amd64.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with possibly small adjustments:

> ---
> There's the argument of fixing gcc in Alpine and instead just use
> -ffreestanding. I think that's more fragile than providing our own set
> of stand alone headers for the firmware bits. Having the include paths
> wrongly sorted can easily make the system headers being picked up
> instead of the gcc ones, and then building can randomly fail because
> the system headers could be amd64 only (like the musl ones).
> 
> I've also seen clang-9 on Debian with the following include paths:
> 
> #include "..." search starts here:
> #include <...> search starts here:
>  /usr/local/include
>  /usr/lib/llvm-9/lib/clang/9.0.1/include
>  /usr/include/x86_64-linux-gnu
>  /usr/include
> 
> Which also seems slightly dangerous as local comes before the compiler
> private path.
> 
> IMO using our own set of stand alone headers is more resilient.

I agree (in particular given the observations), but I don't view
this as an argument against use of -ffreestanding. In fact I'd
rather see this change re-based on top of Andrew's changes. Then ...

> --- a/tools/firmware/Rules.mk
> +++ b/tools/firmware/Rules.mk
> @@ -17,3 +17,14 @@ $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
>  
>  # Extra CFLAGS suitable for an embedded type of environment.
>  CFLAGS += -fno-builtin -msoft-float
> +
> +# Use our own set of library headers to build firmware.
> +#
> +# Ideally we would instead use -ffreestanding, but that relies on the compiler
> +# having the right order for include paths (ie: compiler private headers before
> +# system ones). This is not the case in Alpine at least which searches system
> +# headers before compiler ones, and has been reported upstream:
> +# https://gitlab.alpinelinux.org/alpine/aports/-/issues/12477
> +# In the meantime (and for resilience against broken compilers) use our own set
> +# of headers that provide what's needed for the firmware build.
> +CFLAGS += -nostdinc -I$(XEN_ROOT)/tools/firmware/include

... the initial part of the comment here would want re-wording.

> --- /dev/null
> +++ b/tools/firmware/include/stdint.h
> @@ -0,0 +1,39 @@
> +#ifndef _STDINT_H_
> +#define _STDINT_H_
> +
> +#ifdef __LP64__
> +#error "32bit only header"
> +#endif

Could I talk you into extending this to also cover __P64__? (The
alternative I see would be to omit this altogether.)

Jan

