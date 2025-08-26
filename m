Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F56AB35955
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 11:48:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094225.1449570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqqIL-0004CJ-8I; Tue, 26 Aug 2025 09:48:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094225.1449570; Tue, 26 Aug 2025 09:48:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqqIL-00049v-4f; Tue, 26 Aug 2025 09:48:49 +0000
Received: by outflank-mailman (input) for mailman id 1094225;
 Tue, 26 Aug 2025 09:48:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vqZn=3G=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uqqII-0003Hk-FV
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 09:48:47 +0000
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch
 [109.224.244.18]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db0f3ea6-8261-11f0-a32c-13f23c93f187;
 Tue, 26 Aug 2025 11:48:45 +0200 (CEST)
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
X-Inumbo-ID: db0f3ea6-8261-11f0-a32c-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1756201723; x=1756460923;
	bh=/WGfGDYzqJ/CZ4oEjMib200hZkVteXFK5ypqJ+mebiQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=jK4p1INCnzZOgLQpy4gBy8ngWs/nU1zk7bwqf11HIEIOz7bajLPJ0jWDpa2mfibEO
	 36kkdsU3Fw0NVvLu1u5PGOXyD6/nZqw6xA/SNFgtHIt6lnUDHdLdt0bdxxNaCg/gIL
	 S5XNom5vG5uM1zp/HjqwJcE8X8KP1PxQqKF5OubzrLaH83qCrdcKc3c/6DPSNokVMM
	 OjOhnbbQus3IMeIanX22aTmK8Y7PPDlBKhj2mWuL/k7i0uLoMcAk+HBeiLaFFYRC1N
	 W3oH5Yf7nsIvML3Wp7Sd7qUad/20CrPFfbJk7JtuCOLPriI3th8IrQCDfMXmaKa57f
	 /pyIUCg1vKtTA==
Date: Tue, 26 Aug 2025 09:48:38 +0000
To: Anthony PERARD <anthony@xenproject.org>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH v16 3/4] tools/tests: introduce unit tests for domain ID allocator
Message-ID: <aK2C8iPRJAns2VLu@kraken>
In-Reply-To: <aKxpe7OJ8B7Qif5c@l14>
References: <20250812223024.2364749-1-dmukhin@ford.com> <20250812223024.2364749-4-dmukhin@ford.com> <aKxpe7OJ8B7Qif5c@l14>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 62e6d3400ba2ebac7b730de1bdfcb57985856d55
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 25, 2025 at 03:47:39PM +0200, Anthony PERARD wrote:

Thanks for review!

Will address in the next revision.
Please see some responses below.

> On Tue, Aug 12, 2025 at 10:30:50PM +0000, dmkhn@proton.me wrote:
> > diff --git a/tools/tests/domid/.gitignore b/tools/tests/domid/.gitignor=
e
> > new file mode 100644
> > index 000000000000..0e02715159c2
> > --- /dev/null
> > +++ b/tools/tests/domid/.gitignore
> > @@ -0,0 +1,3 @@
> > +*.o
>=20
> "*.o" is already in the .gitignore at the root of the project. I don't
> think it's useful here.

Ack.

>=20
> > +generated
> > +test-domid
> > diff --git a/tools/tests/domid/Makefile b/tools/tests/domid/Makefile
> > new file mode 100644
> > index 000000000000..0a124a8bfc76
> > --- /dev/null
> > +++ b/tools/tests/domid/Makefile
> > @@ -0,0 +1,84 @@
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
> > +strip-list =3D $(sort $(strip $(foreach x,$(1),$(strip $(x)))))
>=20
> What's that macro for? Also, what's a "list"?
>=20
> > +define list-c-headers
> > +$(shell sed -n -r \
>=20
> Could you use "-E" instead of "-r"? (-r might not work on FreeBSD)

re: FreeBSD: I've found there's a dedicated pipeline for Xen on FreeBSD
(cirrus CI), but I did not figure how to trigger it, will appreciate help
with that.

>=20
> > +    's/^[ \t]*# *include[ \t]*[<"]([^">]+)[">].*/\1/p' $(1) 2>/dev/nul=
l)
> > +endef
> > +
> > +define emit-harness-nested-rule
> > +$(1): $(CURDIR)/harness.h
> > +=09mkdir -p $$(dir $$@)
>=20
> You can use $(@D) instead of $(dir $@). The only difference is a /
> not present at the end.
>=20
> > +=09ln -sf $$^ $$@
>=20
> This should use $<, I don't think the command is going to work if
> there's multiple prerequisite.
>=20
> > +endef
> > +
> > +define emit-harness-rules
> > +ifneq ($(strip $(3)),)
>=20
> How many time do you need to call $(strip) ?
> Also, I think I would prefer to have $(if $(strip $(3)), [the rest])
> rather than actually evaluating code and generating code that we already
> know is isn't going to be executed.
>=20
> > +$(foreach h,$(3),$(call emit-harness-nested-rule,$(CURDIR)/generated/$=
(h)))
> > +vpath $(1) $(2)
> > +$(1:.c=3D.o): $(addprefix $(CURDIR)/generated/,$(3))
> > +endif
> > +endef
>=20
> This macro fails if there's more than one "#include" in "domid.c".
>=20
> And if there's no "#include" in "domid.c", then Make doesn't know how to
> make "domid.o" for "test-domid".
>=20
> > +
> > +define vpath-with-harness-deps
> > +$(call emit-harness-rules,$(1),$(2),\
> > +    $(call strip-list,$(call list-c-headers,$(2)$(1))))
> > +endef
> > +
> > +.PHONY: all
> > +all: $(TESTS)
> > +
> > +.PHONY: run
> > +run: $(TESTS)
> > +=09$(foreach t,$(TESTS),./$(t);)
>=20
> This recipe doesn't work as expected. You need `set -e` or only the last
> tests count.
>=20
> > +
> > +.PHONY: clean
> > +clean:
> > +=09$(RM) -rf $(CURDIR)/generated
>=20
> $(RM) already contain the '-f' option, no need to add it a second time.
>=20
> Also, we expected Make to run all commands in recipe from $(CURDIR), so
> adding $(CURDIR) is unnecessary, could potentially be an issue.
>=20
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
> > +CFLAGS +=3D -I./generated/
> > +
> > +LDFLAGS +=3D $(APPEND_LDFLAGS)
> > +
> > +vpath find-next-bit.c $(XEN_ROOT)/xen/lib/
> > +# Ubuntu {16,18}.04 need single eval at the call site.
>=20
> I'd rather see a comment about what's the macro is about rather that a
> comment some Linux distribution. Our target is GNU Make 3.80, without
> regards to a particular distribution. (Also I don't think it's useful to
> point out that `eval` is needed for older version of Make, at least in
> our project.)

Ack.

>=20
> > +$(eval $(call vpath-with-harness-deps,domid.c,$(XEN_ROOT)/xen/common/)=
)
> > +
> > +test-domid: domid.o find-next-bit.o test-domid.o
> > +=09$(CC) $^ -o $@ $(LDFLAGS)
> > +
> > +-include $(DEPS_INCLUDE)
> > diff --git a/tools/tests/domid/test-domid.c b/tools/tests/domid/test-do=
mid.c
> > new file mode 100644
> > index 000000000000..51a88a6a9550
> > --- /dev/null
> > +++ b/tools/tests/domid/test-domid.c
> > @@ -0,0 +1,93 @@
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
>=20
> Relying on assert() for the test isn't wise. It's useful for developing
> and debugging because it calls abort(), but they can easily be get rid of=
,
> by simply building with -DNDEBUG. Could you maybe replace it with exit()
> since you already check the condition?

Yep, will do.

>=20
>=20
> Thanks,
>=20
> --
> Anthony PERARD
>=20


