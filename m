Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8914B1F583
	for <lists+xen-devel@lfdr.de>; Sat,  9 Aug 2025 19:03:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1076097.1437813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukmyt-00053z-3S; Sat, 09 Aug 2025 17:03:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1076097.1437813; Sat, 09 Aug 2025 17:03:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukmyt-00051j-0e; Sat, 09 Aug 2025 17:03:43 +0000
Received: by outflank-mailman (input) for mailman id 1076097;
 Sat, 09 Aug 2025 17:03:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gHj1=2V=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ukmys-00051d-0b
 for xen-devel@lists.xenproject.org; Sat, 09 Aug 2025 17:03:42 +0000
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch
 [79.135.106.30]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc8c6ee6-7542-11f0-a325-13f23c93f187;
 Sat, 09 Aug 2025 19:03:40 +0200 (CEST)
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
X-Inumbo-ID: cc8c6ee6-7542-11f0-a325-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=2f2zkja2czcx3jpxbatzd55lfa.protonmail; t=1754759019; x=1755018219;
	bh=Q7zJ6sf0bST3mqohqkgLyO9t4SoH2/P+M4nqRjXd4d8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=IgxXmbgIAc6UI6ewuk89A/d4G1AJdvyyl493lUpHQLCwpn1N0lYV+ZhpCQ0/4teIA
	 qL+O3kU6h8nH6W5Ud9EWTqO1fLAD37AebeGSiqOcsKsibvEQ5u597QOtM+eUo/fYfL
	 zQgtJBD8jPQL9YfmAWrtKQNq9dUExAT1Y3LJoN2Q7TwOcbMA3jv6WVvw9IiPFGFzG4
	 afruwn2r9phaXvA3bSa7ck3rZf10AGbIXyHPQ8Qg1gv6tBKJjtDBEam8cTN6UdfxqD
	 G2FrBj5MP0jT3v1ehHYwP+2UjqT55TPDbGnfBvOtpbpeTi4g9vlLpNMMKmc6FwAPKE
	 IiDR7bgoqJAiw==
Date: Sat, 09 Aug 2025 17:03:34 +0000
To: Julien Grall <julien@xen.org>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: Re: [PATCH v14 3/4] tools/tests: introduce unit tests for domain ID allocator
Message-ID: <aJd/Yha2Rih9FyMw@kraken>
In-Reply-To: <230593d5-f3a2-4be8-973a-530c2debcb08@xen.org>
References: <20250808021938.669855-1-dmukhin@ford.com> <20250808021938.669855-4-dmukhin@ford.com> <230593d5-f3a2-4be8-973a-530c2debcb08@xen.org>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 28dfc7dac1275fc42928ad150f4a0c3f300a8aaf
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 08, 2025 at 06:56:16PM +0100, Julien Grall wrote:
> Hi Denis,
>=20
> On 08/08/2025 03:20, dmkhn@proton.me wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > Introduce some basic infrastructure for doing domain ID allocation unit=
 tests,
> > and add a few tests that ensure correctness of the domain ID allocator.
>=20
> I am quite happy to see more unit tests for Xen :).
>=20
> >
> > Use <xen-tools/bitops.h> and xen/lib/find-next-bit.c in test hardness c=
ode.
> >
> > Adjust find-next-bit.c to be compiled with __XEN_TOOLS__.
> >
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
>=20
> With a couple of remarks below:
>=20
> Acked-by: Julien Grall <jgrall@amazon.com>
>=20
> > ---
> > Changes since v13:
> > - reworked bitops integration
> > - hooked xen/lib/find-next-bit.c
> > - cleaned up harness.h code
> > - made test to use more IDs
> > ---
> >   tools/include/xen-tools/bitops.h       | 10 +++
> >   tools/tests/Makefile                   |  2 +-
> >   tools/tests/domid/.gitignore           |  2 +
> >   tools/tests/domid/Makefile             | 56 +++++++++++++++++
> >   tools/tests/domid/harness.h            | 54 ++++++++++++++++
> >   tools/tests/domid/include/xen/domain.h |  1 +
> >   tools/tests/domid/test-domid.c         | 86 +++++++++++++++++++++++++=
+
> >   xen/lib/find-next-bit.c                |  5 ++
> >   8 files changed, 215 insertions(+), 1 deletion(-)
> >   create mode 100644 tools/tests/domid/.gitignore
> >   create mode 100644 tools/tests/domid/Makefile
> >   create mode 100644 tools/tests/domid/harness.h
> >   create mode 120000 tools/tests/domid/include/xen/domain.h
> >   create mode 100644 tools/tests/domid/test-domid.c
> >
> > diff --git a/tools/include/xen-tools/bitops.h b/tools/include/xen-tools=
/bitops.h
> > index 681482f6759f..3b98fba6d74c 100644
> > --- a/tools/include/xen-tools/bitops.h
> > +++ b/tools/include/xen-tools/bitops.h
> > @@ -12,6 +12,16 @@
> >   #define BITS_PER_LONG 32
> >   #endif
> >
> > +#define ffsl(x)       __builtin_ffsl(x)
> > +
> > +#define BIT_WORD(nr)  ((nr) / BITS_PER_LONG)
> > +
> > +#define BITS_TO_LONGS(bits) \
> > +    (((bits) + BITS_PER_LONG - 1) / BITS_PER_LONG)
> > +
> > +#define DECLARE_BITMAP(name, bits) \
> > +    unsigned long name[BITS_TO_LONGS(bits)]
> > +
> >   #define BITMAP_ENTRY(_nr,_bmap) ((_bmap))[(_nr) / 8]
> >   #define BITMAP_SHIFT(_nr) ((_nr) % 8)
> >
> > diff --git a/tools/tests/Makefile b/tools/tests/Makefile
> > index 36928676a666..ff1666425436 100644
> > --- a/tools/tests/Makefile
> > +++ b/tools/tests/Makefile
> > @@ -1,7 +1,7 @@
> >   XEN_ROOT =3D $(CURDIR)/../..
> >   include $(XEN_ROOT)/tools/Rules.mk
> >
> > -SUBDIRS-y :=3D
> > +SUBDIRS-y :=3D domid
>=20
> I would prefer if we keep SUBDIRST-y :=3D as it is and add a new line
> SUBDIRS-y +=3D. This is mostly to reduce the chance that someone will add
> a new directory "abc" and forgot to update the line containing "domid".

Ack.

>=20
> >   SUBDIRS-y +=3D resource
> >   SUBDIRS-$(CONFIG_X86) +=3D cpu-policy
> >   SUBDIRS-$(CONFIG_X86) +=3D tsx
> > diff --git a/tools/tests/domid/.gitignore b/tools/tests/domid/.gitignor=
e
> > new file mode 100644
> > index 000000000000..70e306b3c074
> > --- /dev/null
> > +++ b/tools/tests/domid/.gitignore
> > @@ -0,0 +1,2 @@
> > +*.o
> > +test-domid
> > diff --git a/tools/tests/domid/Makefile b/tools/tests/domid/Makefile
> > new file mode 100644
> > index 000000000000..d96ceca6d954
> > --- /dev/null
> > +++ b/tools/tests/domid/Makefile
> > @@ -0,0 +1,56 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +#
> > +# Unit tests for domain ID allocator.
> > +#
> > +# Copyright 2025 Ford Motor Company
> > +
> > +XEN_ROOT=3D$(CURDIR)/../../..
> > +include $(XEN_ROOT)/tools/Rules.mk
> > +
> > +TESTS :=3D test-domid
> > +
> > +vpath domid.c $(XEN_ROOT)/xen/common/
> > +vpath find-next-bit.c $(XEN_ROOT)/xen/lib/
> > +
> > +.PHONY: all
> > +all: $(TESTS)
> > +
> > +.PHONY: run
> > +run: $(TESTS)
> > +=09$(foreach t,$(TESTS),./$(t);)
> > +
> > +.PHONY: clean
> > +clean:
> > +=09$(RM) -- *.o $(TESTS) $(DEPS_RM)
> > +
> > +.PHONY: distclean
> > +distclean: clean
> > +=09$(RM) -- *~
> > +
> > +.PHONY: install
> > +install: all
> > +=09$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC)/tests
> > +=09$(INSTALL_PROG) test-domid $(DESTDIR)$(LIBEXEC)/tests
> > +
> > +.PHONY: uninstall
> > +uninstall:
> > +=09$(RM) -- $(DESTDIR)$(LIBEXEC)/tests/test-domid
> > +
> > +CFLAGS +=3D -D__XEN_TOOLS__
> > +# find-next-bit.c
> > +CFLAGS +=3D '-DEXPORT_SYMBOL(x)=3D' \
> > +          -Dfind_first_bit \
> > +          -Dfind_first_zero_bit \
> > +          -Dfind_next_bit \
> > +          -Dfind_next_bit_le \
> > +          -Dfind_next_zero_bit_le
> > +CFLAGS +=3D $(APPEND_CFLAGS)
> > +CFLAGS +=3D $(CFLAGS_xeninclude)
> > +CFLAGS +=3D -I./include/
> > +
> > +LDFLAGS +=3D $(APPEND_LDFLAGS)
> > +
> > +test-domid: domid.o find-next-bit.o test-domid.o
> > +=09$(CC) $^ -o $@ $(LDFLAGS)
> > +
> > +-include $(DEPS_INCLUDE)
> > diff --git a/tools/tests/domid/harness.h b/tools/tests/domid/harness.h
> > new file mode 100644
> > index 000000000000..b043519dcb35
> > --- /dev/null
> > +++ b/tools/tests/domid/harness.h
> > @@ -0,0 +1,54 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Unit test harness for domain ID allocator.
> > + *
> > + * Copyright 2025 Ford Motor Company
> > + */
> > +
> > +#ifndef _TEST_HARNESS_
> > +#define _TEST_HARNESS_
> > +
> > +#include <assert.h>
> > +#include <stdbool.h>
> > +#include <stdint.h>
> > +#include <stdio.h>
> > +
> > +#include <xen-tools/common-macros.h>
> > +#include <xen-tools/bitops.h>
> > +
> > +typedef bool spinlock_t;
> > +typedef uint16_t domid_t;
> > +
> > +extern domid_t domid_alloc(domid_t domid);
> > +extern void domid_free(domid_t domid);
> > +
> > +extern unsigned long find_next_zero_bit(const unsigned long *addr,
> > +                                        unsigned long size,
> > +                                        unsigned long offset);
> > +
> > +#define __test_and_set_bit(nr, addr)    test_and_set_bit(nr, addr)
> > +#define __test_and_clear_bit(nr, addr)  test_and_clear_bit(nr, addr)
> > +#define __set_bit(nr, addr)             set_bit(nr, addr)
> > +
> > +#define BUG_ON(x)                       assert(!(x))
> > +#define ASSERT(x)                       assert(x)
> > +
> > +#define DEFINE_SPINLOCK(l)              spinlock_t l
> > +#define spin_lock(l)                    (*(l) =3D true)
> > +#define spin_unlock(l)                  (*(l) =3D false)
>=20
> NIT: For hardening purpose, I wonder whether we should also assert that
> "l" is "false" for spin_lock() and "true" for spin_unlock(). This would
> help catching any bug in the locking.

Good idea! Will do.

>=20
> > +
> > +#define printk                          printf
> > +
> > +#define DOMID_FIRST_RESERVED            (100)
> > +#define DOMID_INVALID                   (101)
> > +
> > +#endif /* _TEST_HARNESS_ */
> > +
> > +/*
> > + * Local variables:
> > + * mode: C
> > + * c-file-style: "BSD"
> > + * c-basic-offset: 4
> > + * indent-tabs-mode: nil
> > + * End:
> > + */
> > diff --git a/tools/tests/domid/include/xen/domain.h b/tools/tests/domid=
/include/xen/domain.h
> > new file mode 120000
> > index 000000000000..2eda9aed088e
> > --- /dev/null
> > +++ b/tools/tests/domid/include/xen/domain.h
> > @@ -0,0 +1 @@
> > +../../harness.h
> > \ No newline at end of file
> > diff --git a/tools/tests/domid/test-domid.c b/tools/tests/domid/test-do=
mid.c
> > new file mode 100644
> > index 000000000000..7b6fb5ee2a7b
> > --- /dev/null
> > +++ b/tools/tests/domid/test-domid.c
> > @@ -0,0 +1,86 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Unit tests for domain ID allocator.
> > + *
> > + * Copyright 2025 Ford Motor Company
> > + */
> > +
> > +#include "harness.h"
> > +
> > +#define verify(exp, fmt, args...) do { \
> > +    if ( !(exp) ) \
> > +        printf(fmt, ## args); \
> > +    assert(exp); \
> > +} while (0);
> > +
> > +/*
> > + * Fail on the first error, since tests are dependent on each other.
> > + */
> > +int main(int argc, char **argv)
> > +{
> > +    domid_t expected, allocated;
> > +
> > +    /* Test ID#0 cannot be allocated twice. */
>=20
> For future improvement, we could check that for any domid [0;
> DOMID_FIRST_RESERVED[, we can allocate domid_alloc().
>=20
> This would also confirm that domid_alloc() *only* allocates *one* ID.

Will update.

>=20
> Cheers,
>=20
> --
> Julien Grall
>=20
>=20


