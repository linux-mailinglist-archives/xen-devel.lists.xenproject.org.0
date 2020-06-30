Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7C020F1F7
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2020 11:53:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqCwb-0002OD-Fu; Tue, 30 Jun 2020 09:52:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4gHU=AL=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jqCwZ-0002O8-ME
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2020 09:52:47 +0000
X-Inumbo-ID: 733fdabe-bab7-11ea-bb8b-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 733fdabe-bab7-11ea-bb8b-bc764e2007e4;
 Tue, 30 Jun 2020 09:52:46 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: gVZvxBZMlRM36DI2IQ85ziOnmOn8wXZFjJk5PxZidKig1Ws2jsO4QkTEQsmloz1KwMZQfvV5m5
 kYMW7FReUe/cku5IJpYhTGVONoeEjhHnZwsR7/j/K3i6JpQz2R2AiDstG+xLVBMX0opxbO7cdj
 WVo8rsWryf60yYOMp8fuB1BdZ/+rTZ/+3vwLVUA4sHJQ3YP+B3i6B4w9/OcYCHtCxJfmuL0whS
 D/ksR8l0vYJv/wvDw8nkGyPdgCmVtj7cusXhPGqt1l7K3SNfSzrWJEjHkyC3GTt1XbSjCdzNlC
 f6o=
X-SBRS: 2.7
X-MesageID: 21567700
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,297,1589256000"; d="scan'208";a="21567700"
Date: Tue, 30 Jun 2020 11:52:39 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] x86: fix compat header generation
Message-ID: <20200630095239.GK735@Air-de-Roger>
References: <0e617191-d61f-08e2-eaa9-b324cd6501f0@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <0e617191-d61f-08e2-eaa9-b324cd6501f0@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

I'm not familiar with compat header generation, sorry if the comments
below are obvious or plain wrong.

On Mon, Jun 29, 2020 at 05:50:59PM +0200, Jan Beulich wrote:
> As was pointed out by "mm: fix public declaration of struct
> xen_mem_acquire_resource", we're not currently handling structs
> correctly that has uint64_aligned_t fields. #pragma pack(4) suppresses
> the necessary alignment even if the type did properly survive (which
> it also didn't) in the process of generating the headers. Overall,
> with the above mentioned change applied, there's only a latent issue
> here afaict, i.e. no other of our interface structs is currently
> affected.
> 
> As a result it is clear that using #pragma pack(4) is not an option.
> Drop all uses from compat header generation. Make sure
> {,u}int64_aligned_t actually survives, such that explicitly aligned
> fields will remain aligned. Arrange for {,u}int64_t to be transformed
> into a type that's 64 bits wide and 4-byte aligned, by utilizing that
> in typedef-s the "aligned" attribute can be used to reduce alignment.
> 
> Note that this changes alignment (but not size) of certain compat
> structures, when one or more of their fields use a non-translated struct
> as their type(s). This isn't correct, and hence applying alignof() to
> such fields requires care, but the prior situation was even worse.

Just to clarify my understanding, this means that struct fields that
are also structs will need special alignment? (because we no longer have
the 4byte packaging).

I see from the generated headers that uint64_compat_t is already
aligned to 4 bytes, and I assume something similar will be needed for
all 8byte types?

> There's one change to generated code according to my observations: In
> arch_compat_vcpu_op() the runstate area "area" variable would previously
> have been put in a just 4-byte aligned stack slot (despite being 8 bytes
> in size), whereas now it gets put in an 8-byte aligned location.

Is there someway that we could spot such changes, maybe building a
version of the plain structures with -m32 and comparing against their
compat versions?

I know we have some compat checking infrastructure, so I wonder if we
could use it to avoid issues like the one we had with
xen_mem_acquire_resource, as it seems like something that could be
programmatically detected.

> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/include/Makefile
> +++ b/xen/include/Makefile
> @@ -34,15 +34,6 @@ headers-$(CONFIG_XSM_FLASK) += compat/xs
>  cppflags-y                := -include public/xen-compat.h -DXEN_GENERATING_COMPAT_HEADERS
>  cppflags-$(CONFIG_X86)    += -m32
>  
> -# 8-byte types are 4-byte aligned on x86_32 ...
> -ifeq ($(CONFIG_CC_IS_CLANG),y)
> -prefix-$(CONFIG_X86)      := \#pragma pack(push, 4)
> -suffix-$(CONFIG_X86)      := \#pragma pack(pop)
> -else
> -prefix-$(CONFIG_X86)      := \#pragma pack(4)
> -suffix-$(CONFIG_X86)      := \#pragma pack()
> -endif
> -
>  endif
>  
>  public-$(CONFIG_X86) := $(wildcard public/arch-x86/*.h public/arch-x86/*/*.h)
> @@ -57,16 +48,16 @@ compat/%.h: compat/%.i Makefile $(BASEDI
>  	echo "#define $$id" >>$@.new; \
>  	echo "#include <xen/compat.h>" >>$@.new; \
>  	$(if $(filter-out compat/arch-%.h,$@),echo "#include <$(patsubst compat/%,public/%,$@)>" >>$@.new;) \
> -	$(if $(prefix-y),echo "$(prefix-y)" >>$@.new;) \
>  	grep -v '^# [0-9]' $< | \
>  	$(PYTHON) $(BASEDIR)/tools/compat-build-header.py | uniq >>$@.new; \
> -	$(if $(suffix-y),echo "$(suffix-y)" >>$@.new;) \
>  	echo "#endif /* $$id */" >>$@.new
>  	mv -f $@.new $@
>  
> +.PRECIOUS: compat/%.i
>  compat/%.i: compat/%.c Makefile
>  	$(CPP) $(filter-out -Wa$(comma)% -include %/include/xen/config.h,$(XEN_CFLAGS)) $(cppflags-y) -o $@ $<
>  
> +.PRECIOUS: compat/%.c

Not sure if it's worth mentioning that the .i and .c files are now
kept.

Roger.

