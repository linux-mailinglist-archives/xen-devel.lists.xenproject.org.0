Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0009B3419E
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 15:48:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1093189.1448748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqXY1-0000ts-JK; Mon, 25 Aug 2025 13:47:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1093189.1448748; Mon, 25 Aug 2025 13:47:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqXY1-0000sH-Fk; Mon, 25 Aug 2025 13:47:45 +0000
Received: by outflank-mailman (input) for mailman id 1093189;
 Mon, 25 Aug 2025 13:47:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uqXY0-0000sB-0q
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 13:47:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uqXXy-005tI4-1Q;
 Mon, 25 Aug 2025 13:47:42 +0000
Received: from [2a01:cb15:80df:da00:4c1a:a750:6210:2b8] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uqXXy-000U7P-0x;
 Mon, 25 Aug 2025 13:47:42 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=NVQGheeSBY4dxzD3x4yHra/8SpFGfbLE7d18BAW6qYY=; b=c8KKQ0XBn3xcPOgCNeMQfiNyS/
	AGLOKmeUE9U0Q6CiHYKUhvGazwPq5kWEl1TIAzmd2AAyWXvxoV2mV6/mBQ1e2S3ESH3l90+5cxy8r
	YDqrheREtXAj/Bh0JwLSwsnKoAFchbpUR5CuztQ3LAQ8jm38j3ZMa9wZ6BN4mqc4BK0c=;
Date: Mon, 25 Aug 2025 15:47:39 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
	michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
	dmukhin@ford.com, Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH v16 3/4] tools/tests: introduce unit tests for domain ID
 allocator
Message-ID: <aKxpe7OJ8B7Qif5c@l14>
References: <20250812223024.2364749-1-dmukhin@ford.com>
 <20250812223024.2364749-4-dmukhin@ford.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812223024.2364749-4-dmukhin@ford.com>

On Tue, Aug 12, 2025 at 10:30:50PM +0000, dmkhn@proton.me wrote:
> diff --git a/tools/tests/domid/.gitignore b/tools/tests/domid/.gitignore
> new file mode 100644
> index 000000000000..0e02715159c2
> --- /dev/null
> +++ b/tools/tests/domid/.gitignore
> @@ -0,0 +1,3 @@
> +*.o

"*.o" is already in the .gitignore at the root of the project. I don't
think it's useful here.

> +generated
> +test-domid
> diff --git a/tools/tests/domid/Makefile b/tools/tests/domid/Makefile
> new file mode 100644
> index 000000000000..0a124a8bfc76
> --- /dev/null
> +++ b/tools/tests/domid/Makefile
> @@ -0,0 +1,84 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Unit tests for domain ID allocator.
> +#
> +# Copyright 2025 Ford Motor Company
> +
> +XEN_ROOT=$(CURDIR)/../../..
> +include $(XEN_ROOT)/tools/Rules.mk
> +
> +TESTS := test-domid
> +
> +strip-list = $(sort $(strip $(foreach x,$(1),$(strip $(x)))))

What's that macro for? Also, what's a "list"?

> +define list-c-headers
> +$(shell sed -n -r \

Could you use "-E" instead of "-r"? (-r might not work on FreeBSD)

> +    's/^[ \t]*# *include[ \t]*[<"]([^">]+)[">].*/\1/p' $(1) 2>/dev/null)
> +endef
> +
> +define emit-harness-nested-rule
> +$(1): $(CURDIR)/harness.h
> +	mkdir -p $$(dir $$@)

You can use $(@D) instead of $(dir $@). The only difference is a /
not present at the end. 

> +	ln -sf $$^ $$@

This should use $<, I don't think the command is going to work if
there's multiple prerequisite.

> +endef
> +
> +define emit-harness-rules
> +ifneq ($(strip $(3)),)

How many time do you need to call $(strip) ?
Also, I think I would prefer to have $(if $(strip $(3)), [the rest])
rather than actually evaluating code and generating code that we already
know is isn't going to be executed.

> +$(foreach h,$(3),$(call emit-harness-nested-rule,$(CURDIR)/generated/$(h)))
> +vpath $(1) $(2)
> +$(1:.c=.o): $(addprefix $(CURDIR)/generated/,$(3))
> +endif
> +endef

This macro fails if there's more than one "#include" in "domid.c".

And if there's no "#include" in "domid.c", then Make doesn't know how to
make "domid.o" for "test-domid".

> +
> +define vpath-with-harness-deps
> +$(call emit-harness-rules,$(1),$(2),\
> +    $(call strip-list,$(call list-c-headers,$(2)$(1))))
> +endef
> +
> +.PHONY: all
> +all: $(TESTS)
> +
> +.PHONY: run
> +run: $(TESTS)
> +	$(foreach t,$(TESTS),./$(t);)

This recipe doesn't work as expected. You need `set -e` or only the last
tests count.

> +
> +.PHONY: clean
> +clean:
> +	$(RM) -rf $(CURDIR)/generated

$(RM) already contain the '-f' option, no need to add it a second time.

Also, we expected Make to run all commands in recipe from $(CURDIR), so
adding $(CURDIR) is unnecessary, could potentially be an issue.

> +	$(RM) -- *.o $(TESTS) $(DEPS_RM)
> +
> +.PHONY: distclean
> +distclean: clean
> +	$(RM) -- *~
> +
> +.PHONY: install
> +install: all
> +	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC)/tests
> +	$(INSTALL_PROG) test-domid $(DESTDIR)$(LIBEXEC)/tests
> +
> +.PHONY: uninstall
> +uninstall:
> +	$(RM) -- $(DESTDIR)$(LIBEXEC)/tests/test-domid
> +
> +CFLAGS += -D__XEN_TOOLS__
> +# find-next-bit.c
> +CFLAGS += '-DEXPORT_SYMBOL(x)=' \
> +          -Dfind_first_bit \
> +          -Dfind_first_zero_bit \
> +          -Dfind_next_bit \
> +          -Dfind_next_bit_le \
> +          -Dfind_next_zero_bit_le
> +CFLAGS += $(APPEND_CFLAGS)
> +CFLAGS += $(CFLAGS_xeninclude)
> +CFLAGS += -I./generated/
> +
> +LDFLAGS += $(APPEND_LDFLAGS)
> +
> +vpath find-next-bit.c $(XEN_ROOT)/xen/lib/
> +# Ubuntu {16,18}.04 need single eval at the call site.

I'd rather see a comment about what's the macro is about rather that a
comment some Linux distribution. Our target is GNU Make 3.80, without
regards to a particular distribution. (Also I don't think it's useful to
point out that `eval` is needed for older version of Make, at least in
our project.)

> +$(eval $(call vpath-with-harness-deps,domid.c,$(XEN_ROOT)/xen/common/))
> +
> +test-domid: domid.o find-next-bit.o test-domid.o
> +	$(CC) $^ -o $@ $(LDFLAGS)
> +
> +-include $(DEPS_INCLUDE)
> diff --git a/tools/tests/domid/test-domid.c b/tools/tests/domid/test-domid.c
> new file mode 100644
> index 000000000000..51a88a6a9550
> --- /dev/null
> +++ b/tools/tests/domid/test-domid.c
> @@ -0,0 +1,93 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Unit tests for domain ID allocator.
> + *
> + * Copyright 2025 Ford Motor Company
> + */
> +
> +#include "harness.h"
> +
> +#define verify(exp, fmt, args...) do { \
> +    if ( !(exp) ) \
> +        printf(fmt, ## args); \
> +    assert(exp); \

Relying on assert() for the test isn't wise. It's useful for developing
and debugging because it calls abort(), but they can easily be get rid of,
by simply building with -DNDEBUG. Could you maybe replace it with exit()
since you already check the condition?


Thanks,

-- 
Anthony PERARD

