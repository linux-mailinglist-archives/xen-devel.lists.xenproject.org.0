Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA33B1B61F
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 16:15:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070514.1434123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujIS0-0005w8-Si; Tue, 05 Aug 2025 14:15:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070514.1434123; Tue, 05 Aug 2025 14:15:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujIS0-0005uG-Oj; Tue, 05 Aug 2025 14:15:36 +0000
Received: by outflank-mailman (input) for mailman id 1070514;
 Tue, 05 Aug 2025 14:15:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xkmx=2R=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ujIRz-0005uA-S9
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 14:15:36 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a485ab5d-7206-11f0-b898-0df219b8e170;
 Tue, 05 Aug 2025 16:15:30 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-45896cf24ebso43697815e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 Aug 2025 07:15:30 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b79c47ae8esm19225911f8f.61.2025.08.05.07.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 07:15:29 -0700 (PDT)
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
X-Inumbo-ID: a485ab5d-7206-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754403330; x=1755008130; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ffnWRVP2Ls0R/vrhiM3IPX9bMDwbvYWsFvuRv1NRtUQ=;
        b=pJyEqOPK7TQhZF9FEqv744PaL/N1/86owwOzkgmO9CczZQstbTjefSSeSri/cIyKu8
         5omo2IxLLGLv0YK6zmVqFdnyOQ994/ahIK+l96L2ObiQmuRFqOqy5mmFwxl4cWLLGv+H
         ZeO5/NUlOm9leW0VbuKskKZEFvTL+sKOA3P9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754403330; x=1755008130;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ffnWRVP2Ls0R/vrhiM3IPX9bMDwbvYWsFvuRv1NRtUQ=;
        b=PRSfWdEpxmnK7tIkNvzup6Wj2I6bl1CTx/oFyiZsRaXQL61p/rk4xB2WsI5Q0UEhDa
         MXk5w/ar2PFLaSqo4Y3yJ3E4Wud//GaNHjXjU0rD/5ShNQptikmao/8Lw+r0D3zNhgeP
         YeeMy+xWOHrXMSMaOWSBQ22jz5Wqjz6ddppjhxEDffBaKhW0NFRGTlv76GpCGqn12+B7
         srCvwyTC7qZx5mW5pG4BR47cOf2bk6KN3slPDxMjQnPw6Xp8FjEkXvKVRie+48zvC1eX
         u/ty4ai9JyyCwXPpGbdw7tyb8PEY/m24+hZVVA0p6GJxjkhuqp+nvkRFzGCcQfa0w2pe
         IQxQ==
X-Gm-Message-State: AOJu0Yyl/M3akLibwZZsjedG9/GWA+pTmhSmfem46UcMpL0dkdU4ep6r
	ANdQFJcvD3PZVwdBZZ3BlgNtOLhi48js5eGc/Mmo2A+Y283upGLu96FF8n3Jho4ouW0=
X-Gm-Gg: ASbGncv6Bmc+p9SayZXowo5uzP7h2hFPG32zGjDj4IjyJZFRR/whmgMzrd4Ms54tnrH
	AbR+7jZ6YjMU7HHpGAuvdZ/DNa59ePZubvUwyzLnnhKkkxhviSS5D+gzHC034TYfkciK2UResK6
	GqlWQeOidx+brs2gAfywjBlmrLZM8/2ppAat5oP6SlbPeBLSrWnscjuC33tlI0m9yEPDahR50J8
	T1TA6kBw7f6J36VopNnacv8dOnINScVHORTJ4SreBIQZJm+aJQMx6WhiI4mY8fKWKccs9Ab1hro
	rO1FySJMf70R2lcqi0tI8bZ6HcIKe6hje5pZraIn9VsP9grcb2ty5dvDVicPlQz7qWMNriCg/QE
	yDuojGx9YZxm+QJwahI/kRmHNDvkoefUQLFMDyVMJoMvHynBVL5lmpcP8pxv7apzdbg==
X-Google-Smtp-Source: AGHT+IFfT8AR4yMn3w6ao/Z/xbbkpGIJW5UevPfl4ArJQpcrF5CLUcMfBeAl6GAhIMVRc4jIkKNT9g==
X-Received: by 2002:a05:600c:1d07:b0:43c:fe5e:f03b with SMTP id 5b1f17b1804b1-458b6b796e5mr125471395e9.30.1754403329850;
        Tue, 05 Aug 2025 07:15:29 -0700 (PDT)
Date: Tue, 5 Aug 2025 16:15:28 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, alejandro.garciavallejo@amd.com,
	andrew.cooper3@citrix.com, anthony.perard@vates.tech,
	jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com,
	sstabellini@kernel.org, dmukhin@ford.com
Subject: Re: [PATCH v13 2/3] tools/tests: introduce unit tests for domain ID
 allocator
Message-ID: <aJISADd9g16o8nud@macbook.local>
References: <20250730174042.1632011-1-dmukhin@ford.com>
 <20250730174042.1632011-3-dmukhin@ford.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250730174042.1632011-3-dmukhin@ford.com>

On Wed, Jul 30, 2025 at 05:41:00PM +0000, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Introduce some basic infrastructure for doing domain ID allocation unit tests,
> and add a few tests that ensure correctness of the domain ID allocator.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v12:
> - fixed Makefile
> - dropped unused symbols/includes from the test harness header
> - s/printk/printf/g in the test code
> ---
>  tools/tests/Makefile                   |   2 +-
>  tools/tests/domid/.gitignore           |   2 +
>  tools/tests/domid/Makefile             |  48 ++++++++++
>  tools/tests/domid/include/xen/domain.h | 126 +++++++++++++++++++++++++
>  tools/tests/domid/test-domid.c         |  78 +++++++++++++++
>  5 files changed, 255 insertions(+), 1 deletion(-)
>  create mode 100644 tools/tests/domid/.gitignore
>  create mode 100644 tools/tests/domid/Makefile
>  create mode 100644 tools/tests/domid/include/xen/domain.h
>  create mode 100644 tools/tests/domid/test-domid.c
> 
> diff --git a/tools/tests/Makefile b/tools/tests/Makefile
> index 36928676a666..ff1666425436 100644
> --- a/tools/tests/Makefile
> +++ b/tools/tests/Makefile
> @@ -1,7 +1,7 @@
>  XEN_ROOT = $(CURDIR)/../..
>  include $(XEN_ROOT)/tools/Rules.mk
>  
> -SUBDIRS-y :=
> +SUBDIRS-y := domid
>  SUBDIRS-y += resource
>  SUBDIRS-$(CONFIG_X86) += cpu-policy
>  SUBDIRS-$(CONFIG_X86) += tsx
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
> index 000000000000..08fbad096aec
> --- /dev/null
> +++ b/tools/tests/domid/Makefile
> @@ -0,0 +1,48 @@
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
> +CFLAGS += $(APPEND_CFLAGS)
> +CFLAGS += $(CFLAGS_xeninclude)
> +CFLAGS += -I./include/
> +
> +LDFLAGS += $(APPEND_LDFLAGS)
> +
> +test-domid: domid.o test-domid.o
> +	$(CC) $^ -o $@ $(LDFLAGS)
> +
> +-include $(DEPS_INCLUDE)
> diff --git a/tools/tests/domid/include/xen/domain.h b/tools/tests/domid/include/xen/domain.h
> new file mode 100644
> index 000000000000..e5db0235445e
> --- /dev/null
> +++ b/tools/tests/domid/include/xen/domain.h
> @@ -0,0 +1,126 @@
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
> +
> +#define BUG_ON(x)               assert(!(x))
> +#define ASSERT(x)               assert(x)
> +
> +#define DOMID_FIRST_RESERVED    (10)
> +#define DOMID_INVALID           (11)
> +
> +#define DEFINE_SPINLOCK(x)      unsigned long *(x)

I think this shouldn't be a pointer?  As you otherwise trigger a NULL
pointer dereference in the increases and decreases done below?

> +#define spin_lock(x)            ((*(x))++)
> +#define spin_unlock(x)          ((*(x))--)

FWIW, I would use a plain bool:

#define DEFINE_SPINLOCK(l)      bool l
#define spin_lock(l)            (*(l) = true)
#define spin_unlock(l)          (*(l) = false)

As you don't expect concurrency tests, you could even assert the lock
is in the expected state before taking/releasing it.

> +
> +#define printk printf
> +
> +#define BITS_PER_LONG           sizeof(unsigned long)

That's BYTES_PER_LONG, BITS_PER_LONG would be (sizeof(unsigned long) * 8).

> +#define BITS_PER_WORD           (8U * BITS_PER_LONG)
> +#define BITS_TO_LONGS(bits) \
> +    (((bits) + BITS_PER_LONG - 1) / BITS_PER_LONG)
> +#define DECLARE_BITMAP(name, bits) \
> +    unsigned long name[BITS_TO_LONGS(bits)]
> +
> +static inline int __test_and_set_bit(unsigned int nr, unsigned long *addr)
> +{
> +    unsigned long mask = 1UL << (nr % BITS_PER_WORD);
> +    unsigned long *p = addr + (nr / BITS_PER_WORD);
> +    int old = (*p & mask) != 0;
> +
> +    *p |= mask;
> +
> +    return old;
> +}
> +
> +static inline int __test_and_clear_bit(unsigned int nr, unsigned long *addr)
> +{
> +    unsigned long mask = 1UL << (nr % BITS_PER_WORD);
> +    unsigned long *p = addr + (nr / BITS_PER_WORD);
> +    int old = (*p & mask) != 0;
> +
> +    *p &= ~mask;
> +
> +    return old;
> +}

Could you somehow use the generic__test_and_set_bit() and
generic__test_and_clear_bit() implementations in bitops.h?

> +
> +static inline void __set_bit(unsigned int nr, volatile unsigned long *addr)
> +{
> +    unsigned long mask = 1UL << (nr % BITS_PER_WORD);
> +    unsigned long *p = (unsigned long *)addr + (nr / BITS_PER_WORD);

Why do you need the cast to drop the volatile here?

> +
> +    *p |= mask;
> +}

I think you could possibly simplify to a single line:

    ((unsigned int *)addr)[nr >> 5] |= (1u << (nr & 31));

That's the implementation of constant_set_bit() in x86.

> +
> +static inline void __clear_bit(unsigned int nr, volatile unsigned long *addr)
> +{
> +    unsigned long mask = 1UL << (nr % BITS_PER_WORD);
> +    unsigned long *p = (unsigned long *)addr + (nr / BITS_PER_WORD);
> +
> +    *p &= ~mask;
> +}

I don't think you need __clear_bit()?  It's not used by domid.c AFAICT.

> +
> +static inline unsigned long find_next_zero_bit(const unsigned long *addr,
> +                                               unsigned long size,
> +                                               unsigned long offset)
> +{
> +    unsigned long idx = offset / BITS_PER_WORD;
> +    unsigned long bit = offset % BITS_PER_WORD;
> +
> +    if (offset >= size)
> +        return size;
> +
> +    while (offset < size)
> +    {
> +        unsigned long val = addr[idx] | (~0UL >> (BITS_PER_WORD - bit));
> +
> +        if (~val)
> +        {
> +            unsigned long pos = __builtin_ffsl(~val);
> +
> +            if (pos > 0)
> +            {
> +                unsigned long rc = idx * BITS_PER_WORD + (pos - 1);
> +
> +                if (rc < size)
> +                    return rc;
> +            }
> +        }
> +
> +        offset = (idx + 1) * BITS_PER_WORD;
> +        idx++;
> +        bit = 0;
> +    }
> +
> +    return size;
> +}

Hm, you need a full find_next_zero_bit() implementation here because
addr can be arbitrarily long.  Could you somehow include
xen/lib/find-next-bit.c and set the right defines so only the
implementation of find_next_bit() is included?

> +
> +typedef bool spinlock_t;

You want to put this ahead, so that DEFINE_SPINLOCK can be:

#define DEFINE_SPINLOCK(l)      spinlock_t l

> +typedef uint16_t domid_t;
> +
> +/* See include/xen/domain.h */
> +extern domid_t domid_alloc(domid_t domid);
> +extern void domid_free(domid_t domid);
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
> diff --git a/tools/tests/domid/test-domid.c b/tools/tests/domid/test-domid.c
> new file mode 100644
> index 000000000000..d52eaf5f1f55
> --- /dev/null
> +++ b/tools/tests/domid/test-domid.c
> @@ -0,0 +1,78 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Unit tests for domain ID allocator.
> + *
> + * Copyright 2025 Ford Motor Company
> + */
> +
> +/* Local test include replicating hypervisor includes. */
> +#include <xen/domain.h>

I think this is a difficult to maintain position.  Right now domid.c
only includes xen/domain.h, so you can easily replace this in
user-space.  However if/when domid.c starts including more headers,
replicating this in user-space will be cumbersome IMO.

I would just guard the includes in domid.c with #ifdef __XEN__ for the
preprocessor to remove them when domid.c is compiled as part of the
unit-tests harness.

I usually include a harness.h that contains the glue to make the
imported code build (much like what you have placed in the test
harness xen/domain.h header.

> +
> +int main(int argc, char **argv)
> +{
> +    domid_t expected, allocated;
> +
> +    printf("DOMID_FIRST_RESERVED=%u DOMID_INVALID=%u\n",
> +            DOMID_FIRST_RESERVED, DOMID_INVALID);
> +
> +    /* Test ID#0 cannot be allocated twice. */
> +    allocated = domid_alloc(0);
> +    printf("TEST 1: expected %u allocated %u\n", 0, allocated);
> +    ASSERT(allocated == 0);
> +    allocated = domid_alloc(0);
> +    printf("TEST 1: expected %u allocated %u\n", DOMID_INVALID, allocated);
> +    ASSERT(allocated == DOMID_INVALID);
> +
> +    /* Ensure ID is not allocated. */
> +    domid_free(0);
> +
> +    /*
> +     * Test that that two consecutive calls of domid_alloc(DOMID_INVALID)
> +     * will never return the same ID.
> +     * NB: ID#0 is reserved and shall not be allocated by
> +     * domid_alloc(DOMID_INVALID).
> +     */
> +    for ( expected = 1; expected < DOMID_FIRST_RESERVED; expected++ )
> +    {
> +        allocated = domid_alloc(DOMID_INVALID);
> +        printf("TEST 2: expected %u allocated %u\n", expected, allocated);
> +        ASSERT(allocated == expected);
> +    }
> +    for ( expected = 1; expected < DOMID_FIRST_RESERVED; expected++ )
> +    {
> +        allocated = domid_alloc(DOMID_INVALID);
> +        printf("TEST 3: expected %u allocated %u\n", DOMID_INVALID, allocated);
> +        ASSERT(allocated == DOMID_INVALID);
> +    }
> +
> +    /* Re-allocate first ID from [1..DOMID_FIRST_RESERVED - 1]. */
> +    expected = 1;
> +    domid_free(1);
> +    allocated = domid_alloc(DOMID_INVALID);
> +    printf("TEST 4: expected %u allocated %u\n", expected, allocated);
> +    ASSERT(allocated == expected);
> +
> +    /* Re-allocate last ID from [1..DOMID_FIRST_RESERVED - 1]. */
> +    expected = DOMID_FIRST_RESERVED - 1;
> +    domid_free(DOMID_FIRST_RESERVED - 1);
> +    allocated = domid_alloc(DOMID_INVALID);
> +    printf("TEST 5: expected %u allocated %u\n", expected, allocated);
> +    ASSERT(allocated == expected);
> +
> +    /* Allocate an invalid ID. */
> +    expected = DOMID_INVALID;
> +    allocated = domid_alloc(DOMID_FIRST_RESERVED);
> +    printf("TEST 6: expected %u allocated %u\n", expected, allocated);
> +    ASSERT(allocated == expected);

I would make this a bit less chatty maybe?

I think you only need to print on errors, and you probably don't want
to ASSERT() on failure, and rather try to finish all the tests in
order to report multiple failures in a single run.

Thanks, Roger.

