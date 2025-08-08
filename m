Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A18BBB1EE14
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 19:57:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1074947.1437413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukRKI-0005o7-53; Fri, 08 Aug 2025 17:56:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1074947.1437413; Fri, 08 Aug 2025 17:56:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukRKI-0005mF-2P; Fri, 08 Aug 2025 17:56:22 +0000
Received: by outflank-mailman (input) for mailman id 1074947;
 Fri, 08 Aug 2025 17:56:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ukRKG-0005m9-JE
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 17:56:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ukRKF-0083zQ-2g;
 Fri, 08 Aug 2025 17:56:19 +0000
Received: from [2a02:8012:3a1:0:a91b:b567:8726:98f7]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ukRKF-009Ooj-20;
 Fri, 08 Aug 2025 17:56:19 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=JlEVCllSTcaeMn+RlU3GvP2eB8RVH/IE3eKMmcJeHkw=; b=rs6JbEL6juz8GUH7WX8JtR0O8K
	4bDFpInSurwnH9rnKJ9DlB/fQ0Jeqd8L9dvlDy07lbrWWHpm82VOh3secdw8jkxbwytLt0mPmtPQC
	SDLgJEZH7TbPNs0Y5v34R3lTwdrF3efz4a1HeEfPUUzncP16P21suzFpfzToK+YOYRrY=;
Message-ID: <230593d5-f3a2-4be8-973a-530c2debcb08@xen.org>
Date: Fri, 8 Aug 2025 18:56:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 3/4] tools/tests: introduce unit tests for domain ID
 allocator
Content-Language: en-GB
To: dmkhn@proton.me, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com
References: <20250808021938.669855-1-dmukhin@ford.com>
 <20250808021938.669855-4-dmukhin@ford.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250808021938.669855-4-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Denis,

On 08/08/2025 03:20, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Introduce some basic infrastructure for doing domain ID allocation unit tests,
> and add a few tests that ensure correctness of the domain ID allocator.

I am quite happy to see more unit tests for Xen :).

> 
> Use <xen-tools/bitops.h> and xen/lib/find-next-bit.c in test hardness code.
> 
> Adjust find-next-bit.c to be compiled with __XEN_TOOLS__.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

With a couple of remarks below:

Acked-by: Julien Grall <jgrall@amazon.com>

> ---
> Changes since v13:
> - reworked bitops integration
> - hooked xen/lib/find-next-bit.c
> - cleaned up harness.h code
> - made test to use more IDs
> ---
>   tools/include/xen-tools/bitops.h       | 10 +++
>   tools/tests/Makefile                   |  2 +-
>   tools/tests/domid/.gitignore           |  2 +
>   tools/tests/domid/Makefile             | 56 +++++++++++++++++
>   tools/tests/domid/harness.h            | 54 ++++++++++++++++
>   tools/tests/domid/include/xen/domain.h |  1 +
>   tools/tests/domid/test-domid.c         | 86 ++++++++++++++++++++++++++
>   xen/lib/find-next-bit.c                |  5 ++
>   8 files changed, 215 insertions(+), 1 deletion(-)
>   create mode 100644 tools/tests/domid/.gitignore
>   create mode 100644 tools/tests/domid/Makefile
>   create mode 100644 tools/tests/domid/harness.h
>   create mode 120000 tools/tests/domid/include/xen/domain.h
>   create mode 100644 tools/tests/domid/test-domid.c
> 
> diff --git a/tools/include/xen-tools/bitops.h b/tools/include/xen-tools/bitops.h
> index 681482f6759f..3b98fba6d74c 100644
> --- a/tools/include/xen-tools/bitops.h
> +++ b/tools/include/xen-tools/bitops.h
> @@ -12,6 +12,16 @@
>   #define BITS_PER_LONG 32
>   #endif
>   
> +#define ffsl(x)       __builtin_ffsl(x)
> +
> +#define BIT_WORD(nr)  ((nr) / BITS_PER_LONG)
> +
> +#define BITS_TO_LONGS(bits) \
> +    (((bits) + BITS_PER_LONG - 1) / BITS_PER_LONG)
> +
> +#define DECLARE_BITMAP(name, bits) \
> +    unsigned long name[BITS_TO_LONGS(bits)]
> +
>   #define BITMAP_ENTRY(_nr,_bmap) ((_bmap))[(_nr) / 8]
>   #define BITMAP_SHIFT(_nr) ((_nr) % 8)
>   
> diff --git a/tools/tests/Makefile b/tools/tests/Makefile
> index 36928676a666..ff1666425436 100644
> --- a/tools/tests/Makefile
> +++ b/tools/tests/Makefile
> @@ -1,7 +1,7 @@
>   XEN_ROOT = $(CURDIR)/../..
>   include $(XEN_ROOT)/tools/Rules.mk
>   
> -SUBDIRS-y :=
> +SUBDIRS-y := domid

I would prefer if we keep SUBDIRST-y := as it is and add a new line 
SUBDIRS-y +=. This is mostly to reduce the chance that someone will add 
a new directory "abc" and forgot to update the line containing "domid".

>   SUBDIRS-y += resource
>   SUBDIRS-$(CONFIG_X86) += cpu-policy
>   SUBDIRS-$(CONFIG_X86) += tsx
> diff --git a/tools/tests/domid/.gitignore b/tools/tests/domid/.gitignore
> new file mode 100644
> index 000000000000..70e306b3c074
> --- /dev/null
> +++ b/tools/tests/domid/.gitignore
> @@ -0,0 +1,2 @@
> +*.o
> +test-domid
> diff --git a/tools/tests/domid/Makefile b/tools/tests/domid/Makefile
> new file mode 100644
> index 000000000000..d96ceca6d954
> --- /dev/null
> +++ b/tools/tests/domid/Makefile
> @@ -0,0 +1,56 @@
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
> +vpath domid.c $(XEN_ROOT)/xen/common/
> +vpath find-next-bit.c $(XEN_ROOT)/xen/lib/
> +
> +.PHONY: all
> +all: $(TESTS)
> +
> +.PHONY: run
> +run: $(TESTS)
> +	$(foreach t,$(TESTS),./$(t);)
> +
> +.PHONY: clean
> +clean:
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
> +CFLAGS += -I./include/
> +
> +LDFLAGS += $(APPEND_LDFLAGS)
> +
> +test-domid: domid.o find-next-bit.o test-domid.o
> +	$(CC) $^ -o $@ $(LDFLAGS)
> +
> +-include $(DEPS_INCLUDE)
> diff --git a/tools/tests/domid/harness.h b/tools/tests/domid/harness.h
> new file mode 100644
> index 000000000000..b043519dcb35
> --- /dev/null
> +++ b/tools/tests/domid/harness.h
> @@ -0,0 +1,54 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Unit test harness for domain ID allocator.
> + *
> + * Copyright 2025 Ford Motor Company
> + */
> +
> +#ifndef _TEST_HARNESS_
> +#define _TEST_HARNESS_
> +
> +#include <assert.h>
> +#include <stdbool.h>
> +#include <stdint.h>
> +#include <stdio.h>
> +
> +#include <xen-tools/common-macros.h>
> +#include <xen-tools/bitops.h>
> +
> +typedef bool spinlock_t;
> +typedef uint16_t domid_t;
> +
> +extern domid_t domid_alloc(domid_t domid);
> +extern void domid_free(domid_t domid);
> +
> +extern unsigned long find_next_zero_bit(const unsigned long *addr,
> +                                        unsigned long size,
> +                                        unsigned long offset);
> +
> +#define __test_and_set_bit(nr, addr)    test_and_set_bit(nr, addr)
> +#define __test_and_clear_bit(nr, addr)  test_and_clear_bit(nr, addr)
> +#define __set_bit(nr, addr)             set_bit(nr, addr)
> +
> +#define BUG_ON(x)                       assert(!(x))
> +#define ASSERT(x)                       assert(x)
> +
> +#define DEFINE_SPINLOCK(l)              spinlock_t l
> +#define spin_lock(l)                    (*(l) = true)
> +#define spin_unlock(l)                  (*(l) = false)

NIT: For hardening purpose, I wonder whether we should also assert that 
"l" is "false" for spin_lock() and "true" for spin_unlock(). This would 
help catching any bug in the locking.

> +
> +#define printk                          printf
> +
> +#define DOMID_FIRST_RESERVED            (100)
> +#define DOMID_INVALID                   (101)
> +
> +#endif /* _TEST_HARNESS_ */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/tools/tests/domid/include/xen/domain.h b/tools/tests/domid/include/xen/domain.h
> new file mode 120000
> index 000000000000..2eda9aed088e
> --- /dev/null
> +++ b/tools/tests/domid/include/xen/domain.h
> @@ -0,0 +1 @@
> +../../harness.h
> \ No newline at end of file
> diff --git a/tools/tests/domid/test-domid.c b/tools/tests/domid/test-domid.c
> new file mode 100644
> index 000000000000..7b6fb5ee2a7b
> --- /dev/null
> +++ b/tools/tests/domid/test-domid.c
> @@ -0,0 +1,86 @@
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
> +} while (0);
> +
> +/*
> + * Fail on the first error, since tests are dependent on each other.
> + */
> +int main(int argc, char **argv)
> +{
> +    domid_t expected, allocated;
> +
> +    /* Test ID#0 cannot be allocated twice. */

For future improvement, we could check that for any domid [0; 
DOMID_FIRST_RESERVED[, we can allocate domid_alloc().

This would also confirm that domid_alloc() *only* allocates *one* ID.

Cheers,

-- 
Julien Grall


