Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCA0B1D0D9
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 04:12:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1072417.1435553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujq7C-0005Ay-E9; Thu, 07 Aug 2025 02:12:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1072417.1435553; Thu, 07 Aug 2025 02:12:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujq7C-00057r-Am; Thu, 07 Aug 2025 02:12:22 +0000
Received: by outflank-mailman (input) for mailman id 1072417;
 Thu, 07 Aug 2025 02:12:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ybbA=2T=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ujq7A-00057l-Bp
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 02:12:21 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f138c6cb-7333-11f0-a324-13f23c93f187;
 Thu, 07 Aug 2025 04:12:18 +0200 (CEST)
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
X-Inumbo-ID: f138c6cb-7333-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1754532736; x=1754791936;
	bh=pnbjNA7b84S64s2d5tVI8OT6Mn3KUydHYnfCEMr6Byk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=AwDOYtM4rGbp21lkPv3uo3qxnLYkJQZ0Yo2wF4IW4D4KFo9K8dkfeJRjn1QnLDmgg
	 P6Dac3mA38o9X3NziOM6lWOXBpMvbxkeCXGAPYeOqtRYrFDxzyjbSGCfwXJE3n9b3M
	 2MJJ88S2ME4tbVG+vagkx1xIcEl/PtJp2KaPbxVrgu2RBR3awiGeIgW1X3BmC1WjQJ
	 jGy2jT7PHB1oka9eIQMAAJ7Z2CFiUrABL/Lz4txCUQ/cbg/P7po7ET8HaCzu/F9Fu+
	 vwtPt+w0A/QmT8s0zFdrG187zfG49lG7JC/nolFuwn2UO8CFfbHXxQiEvGdHO+w+1D
	 7BNM1ZGeP2ZjA==
Date: Thu, 07 Aug 2025 02:12:10 +0000
To: =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, alejandro.garciavallejo@amd.com, andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: Re: [PATCH v13 2/3] tools/tests: introduce unit tests for domain ID allocator
Message-ID: <aJQLdgpNsMj3oMgK@kraken>
In-Reply-To: <aJISADd9g16o8nud@macbook.local>
References: <20250730174042.1632011-1-dmukhin@ford.com> <20250730174042.1632011-3-dmukhin@ford.com> <aJISADd9g16o8nud@macbook.local>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 84f27724c176e8decbd57fd9db920fe020f13f45
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 05, 2025 at 04:15:28PM +0200, Roger Pau Monn=C3=A9 wrote:
> On Wed, Jul 30, 2025 at 05:41:00PM +0000, dmkhn@proton.me wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > Introduce some basic infrastructure for doing domain ID allocation unit=
 tests,
> > and add a few tests that ensure correctness of the domain ID allocator.
> >
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> > Changes since v12:
> > - fixed Makefile
> > - dropped unused symbols/includes from the test harness header
> > - s/printk/printf/g in the test code
> > ---
> >  tools/tests/Makefile                   |   2 +-
> >  tools/tests/domid/.gitignore           |   2 +
> >  tools/tests/domid/Makefile             |  48 ++++++++++
> >  tools/tests/domid/include/xen/domain.h | 126 +++++++++++++++++++++++++
> >  tools/tests/domid/test-domid.c         |  78 +++++++++++++++
> >  5 files changed, 255 insertions(+), 1 deletion(-)
> >  create mode 100644 tools/tests/domid/.gitignore
> >  create mode 100644 tools/tests/domid/Makefile
> >  create mode 100644 tools/tests/domid/include/xen/domain.h
> >  create mode 100644 tools/tests/domid/test-domid.c
> >
> > diff --git a/tools/tests/Makefile b/tools/tests/Makefile
> > index 36928676a666..ff1666425436 100644
> > --- a/tools/tests/Makefile
> > +++ b/tools/tests/Makefile
> > @@ -1,7 +1,7 @@
> >  XEN_ROOT =3D $(CURDIR)/../..
> >  include $(XEN_ROOT)/tools/Rules.mk
> >
> > -SUBDIRS-y :=3D
> > +SUBDIRS-y :=3D domid
> >  SUBDIRS-y +=3D resource
> >  SUBDIRS-$(CONFIG_X86) +=3D cpu-policy
> >  SUBDIRS-$(CONFIG_X86) +=3D tsx
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
> > index 000000000000..08fbad096aec
> > --- /dev/null
> > +++ b/tools/tests/domid/Makefile
> > @@ -0,0 +1,48 @@
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
> > +CFLAGS +=3D $(APPEND_CFLAGS)
> > +CFLAGS +=3D $(CFLAGS_xeninclude)
> > +CFLAGS +=3D -I./include/
> > +
> > +LDFLAGS +=3D $(APPEND_LDFLAGS)
> > +
> > +test-domid: domid.o test-domid.o
> > +=09$(CC) $^ -o $@ $(LDFLAGS)
> > +
> > +-include $(DEPS_INCLUDE)
> > diff --git a/tools/tests/domid/include/xen/domain.h b/tools/tests/domid=
/include/xen/domain.h
> > new file mode 100644
> > index 000000000000..e5db0235445e
> > --- /dev/null
> > +++ b/tools/tests/domid/include/xen/domain.h
> > @@ -0,0 +1,126 @@
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
> > +
> > +#define BUG_ON(x)               assert(!(x))
> > +#define ASSERT(x)               assert(x)
> > +
> > +#define DOMID_FIRST_RESERVED    (10)
> > +#define DOMID_INVALID           (11)
> > +
> > +#define DEFINE_SPINLOCK(x)      unsigned long *(x)
>=20
> I think this shouldn't be a pointer?  As you otherwise trigger a NULL
> pointer dereference in the increases and decreases done below?

Sorry, this bitops integration is very raw.

Thanks for all your suggestions, I reworked it.

>=20
> > +#define spin_lock(x)            ((*(x))++)
> > +#define spin_unlock(x)          ((*(x))--)
>=20
> FWIW, I would use a plain bool:
>=20
> #define DEFINE_SPINLOCK(l)      bool l
> #define spin_lock(l)            (*(l) =3D true)
> #define spin_unlock(l)          (*(l) =3D false)
>=20
> As you don't expect concurrency tests, you could even assert the lock
> is in the expected state before taking/releasing it.
>=20
> > +
> > +#define printk printf
> > +
> > +#define BITS_PER_LONG           sizeof(unsigned long)
>=20
> That's BYTES_PER_LONG, BITS_PER_LONG would be (sizeof(unsigned long) * 8)=
.
>=20
> > +#define BITS_PER_WORD           (8U * BITS_PER_LONG)
> > +#define BITS_TO_LONGS(bits) \
> > +    (((bits) + BITS_PER_LONG - 1) / BITS_PER_LONG)
> > +#define DECLARE_BITMAP(name, bits) \
> > +    unsigned long name[BITS_TO_LONGS(bits)]
> > +
> > +static inline int __test_and_set_bit(unsigned int nr, unsigned long *a=
ddr)
> > +{
> > +    unsigned long mask =3D 1UL << (nr % BITS_PER_WORD);
> > +    unsigned long *p =3D addr + (nr / BITS_PER_WORD);
> > +    int old =3D (*p & mask) !=3D 0;
> > +
> > +    *p |=3D mask;
> > +
> > +    return old;
> > +}
> > +
> > +static inline int __test_and_clear_bit(unsigned int nr, unsigned long =
*addr)
> > +{
> > +    unsigned long mask =3D 1UL << (nr % BITS_PER_WORD);
> > +    unsigned long *p =3D addr + (nr / BITS_PER_WORD);
> > +    int old =3D (*p & mask) !=3D 0;
> > +
> > +    *p &=3D ~mask;
> > +
> > +    return old;
> > +}
>=20
> Could you somehow use the generic__test_and_set_bit() and
> generic__test_and_clear_bit() implementations in bitops.h?

I tried that originally, and it pulls a lot of dependencies from xen/bitops=
.h;
that will be a mini project to compile xen/bitops.h for the host, which I
think I can skip doing for the purpose of this test.

I followed another approach as discussed offline in matrix: re-purpose
tools/libs/ctrl/xc_bitops.h which seems to be working nice!

>=20
> > +
> > +static inline void __set_bit(unsigned int nr, volatile unsigned long *=
addr)
> > +{
> > +    unsigned long mask =3D 1UL << (nr % BITS_PER_WORD);
> > +    unsigned long *p =3D (unsigned long *)addr + (nr / BITS_PER_WORD);
>=20
> Why do you need the cast to drop the volatile here?
>=20
> > +
> > +    *p |=3D mask;
> > +}
>=20
> I think you could possibly simplify to a single line:
>=20
>     ((unsigned int *)addr)[nr >> 5] |=3D (1u << (nr & 31));
>=20
> That's the implementation of constant_set_bit() in x86.
>=20
> > +
> > +static inline void __clear_bit(unsigned int nr, volatile unsigned long=
 *addr)
> > +{
> > +    unsigned long mask =3D 1UL << (nr % BITS_PER_WORD);
> > +    unsigned long *p =3D (unsigned long *)addr + (nr / BITS_PER_WORD);
> > +
> > +    *p &=3D ~mask;
> > +}
>=20
> I don't think you need __clear_bit()?  It's not used by domid.c AFAICT.

Overlooked, thanks.

>=20
> > +
> > +static inline unsigned long find_next_zero_bit(const unsigned long *ad=
dr,
> > +                                               unsigned long size,
> > +                                               unsigned long offset)
> > +{
> > +    unsigned long idx =3D offset / BITS_PER_WORD;
> > +    unsigned long bit =3D offset % BITS_PER_WORD;
> > +
> > +    if (offset >=3D size)
> > +        return size;
> > +
> > +    while (offset < size)
> > +    {
> > +        unsigned long val =3D addr[idx] | (~0UL >> (BITS_PER_WORD - bi=
t));
> > +
> > +        if (~val)
> > +        {
> > +            unsigned long pos =3D __builtin_ffsl(~val);
> > +
> > +            if (pos > 0)
> > +            {
> > +                unsigned long rc =3D idx * BITS_PER_WORD + (pos - 1);
> > +
> > +                if (rc < size)
> > +                    return rc;
> > +            }
> > +        }
> > +
> > +        offset =3D (idx + 1) * BITS_PER_WORD;
> > +        idx++;
> > +        bit =3D 0;
> > +    }
> > +
> > +    return size;
> > +}
>=20
> Hm, you need a full find_next_zero_bit() implementation here because
> addr can be arbitrarily long.  Could you somehow include
> xen/lib/find-next-bit.c and set the right defines so only the
> implementation of find_next_bit() is included?

That's a good idea!

xen/lib/find-next-bit.c seems to be integrating pretty simple.

Thanks for the hint!

>=20
> > +
> > +typedef bool spinlock_t;
>=20
> You want to put this ahead, so that DEFINE_SPINLOCK can be:
>=20
> #define DEFINE_SPINLOCK(l)      spinlock_t l
>=20
> > +typedef uint16_t domid_t;
> > +
> > +/* See include/xen/domain.h */
> > +extern domid_t domid_alloc(domid_t domid);
> > +extern void domid_free(domid_t domid);
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
> > diff --git a/tools/tests/domid/test-domid.c b/tools/tests/domid/test-do=
mid.c
> > new file mode 100644
> > index 000000000000..d52eaf5f1f55
> > --- /dev/null
> > +++ b/tools/tests/domid/test-domid.c
> > @@ -0,0 +1,78 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Unit tests for domain ID allocator.
> > + *
> > + * Copyright 2025 Ford Motor Company
> > + */
> > +
> > +/* Local test include replicating hypervisor includes. */
> > +#include <xen/domain.h>
>=20
> I think this is a difficult to maintain position.  Right now domid.c
> only includes xen/domain.h, so you can easily replace this in
> user-space.  However if/when domid.c starts including more headers,
> replicating this in user-space will be cumbersome IMO.
>=20
> I would just guard the includes in domid.c with #ifdef __XEN__ for the
> preprocessor to remove them when domid.c is compiled as part of the
> unit-tests harness.
>=20
> I usually include a harness.h that contains the glue to make the
> imported code build (much like what you have placed in the test
> harness xen/domain.h header.

I like that there's no need to modify the tested code.

I reworked this slightly differently: local include/xen/domain.h is a symli=
nk
to local harness.h, and all future dependendent files will be symlinks to
harness.h as well.

>=20
> > +
> > +int main(int argc, char **argv)
> > +{
> > +    domid_t expected, allocated;
> > +
> > +    printf("DOMID_FIRST_RESERVED=3D%u DOMID_INVALID=3D%u\n",
> > +            DOMID_FIRST_RESERVED, DOMID_INVALID);
> > +
> > +    /* Test ID#0 cannot be allocated twice. */
> > +    allocated =3D domid_alloc(0);
> > +    printf("TEST 1: expected %u allocated %u\n", 0, allocated);
> > +    ASSERT(allocated =3D=3D 0);
> > +    allocated =3D domid_alloc(0);
> > +    printf("TEST 1: expected %u allocated %u\n", DOMID_INVALID, alloca=
ted);
> > +    ASSERT(allocated =3D=3D DOMID_INVALID);
> > +
> > +    /* Ensure ID is not allocated. */
> > +    domid_free(0);
> > +
> > +    /*
> > +     * Test that that two consecutive calls of domid_alloc(DOMID_INVAL=
ID)
> > +     * will never return the same ID.
> > +     * NB: ID#0 is reserved and shall not be allocated by
> > +     * domid_alloc(DOMID_INVALID).
> > +     */
> > +    for ( expected =3D 1; expected < DOMID_FIRST_RESERVED; expected++ =
)
> > +    {
> > +        allocated =3D domid_alloc(DOMID_INVALID);
> > +        printf("TEST 2: expected %u allocated %u\n", expected, allocat=
ed);
> > +        ASSERT(allocated =3D=3D expected);
> > +    }
> > +    for ( expected =3D 1; expected < DOMID_FIRST_RESERVED; expected++ =
)
> > +    {
> > +        allocated =3D domid_alloc(DOMID_INVALID);
> > +        printf("TEST 3: expected %u allocated %u\n", DOMID_INVALID, al=
located);
> > +        ASSERT(allocated =3D=3D DOMID_INVALID);
> > +    }
> > +
> > +    /* Re-allocate first ID from [1..DOMID_FIRST_RESERVED - 1]. */
> > +    expected =3D 1;
> > +    domid_free(1);
> > +    allocated =3D domid_alloc(DOMID_INVALID);
> > +    printf("TEST 4: expected %u allocated %u\n", expected, allocated);
> > +    ASSERT(allocated =3D=3D expected);
> > +
> > +    /* Re-allocate last ID from [1..DOMID_FIRST_RESERVED - 1]. */
> > +    expected =3D DOMID_FIRST_RESERVED - 1;
> > +    domid_free(DOMID_FIRST_RESERVED - 1);
> > +    allocated =3D domid_alloc(DOMID_INVALID);
> > +    printf("TEST 5: expected %u allocated %u\n", expected, allocated);
> > +    ASSERT(allocated =3D=3D expected);
> > +
> > +    /* Allocate an invalid ID. */
> > +    expected =3D DOMID_INVALID;
> > +    allocated =3D domid_alloc(DOMID_FIRST_RESERVED);
> > +    printf("TEST 6: expected %u allocated %u\n", expected, allocated);
> > +    ASSERT(allocated =3D=3D expected);
>=20
> I would make this a bit less chatty maybe?

Ack.

>=20
> I think you only need to print on errors, and you probably don't want
> to ASSERT() on failure, and rather try to finish all the tests in
> order to report multiple failures in a single run.

I thought about it originally, but my "tests" depend on each other, so I'll
keep failing on the first error as is, if there's no strong objection.

>=20
> Thanks, Roger.


