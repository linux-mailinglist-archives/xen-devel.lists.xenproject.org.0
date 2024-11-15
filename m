Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A209CDDC5
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 12:53:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837165.1253095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBusp-0005k7-MF; Fri, 15 Nov 2024 11:53:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837165.1253095; Fri, 15 Nov 2024 11:53:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBusp-0005id-Il; Fri, 15 Nov 2024 11:53:03 +0000
Received: by outflank-mailman (input) for mailman id 837165;
 Fri, 15 Nov 2024 11:53:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Akm3=SK=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tBusn-0005U9-MY
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 11:53:01 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 269f80fb-a348-11ef-99a3-01e77a169b0f;
 Fri, 15 Nov 2024 12:52:56 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-aa1f73966a5so330049666b.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2024 03:52:55 -0800 (PST)
Received: from localhost.localdomain (0545937c.skybroadband.com.
 [5.69.147.124]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e0860afsm173492766b.188.2024.11.15.03.52.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 03:52:53 -0800 (PST)
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
X-Inumbo-ID: 269f80fb-a348-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzEiLCJoZWxvIjoibWFpbC1lajEteDYzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjI2OWY4MGZiLWEzNDgtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNjcxNTc2LjYyOTIxMiwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1731671574; x=1732276374; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gqmyL4WL6Ul5Yz75CfK/+hAvZBs23QkBt1Is8c3CzCk=;
        b=ECjKsOrzNPhBRnP6k6T5ob527rcaN04Dq9cpTGJCMiR4fa4Ss6vI+VS4myW/mw2DO6
         SuTDaTBhcRSLvAB6jMCLyp14qVkA5ZBplX6gBXValF8pcq32A+MXxLUoccb0gJ9aCV5I
         gUQFsf1VDFtR7wo8l0BQAVFsxLPzAfjdC6shQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731671574; x=1732276374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gqmyL4WL6Ul5Yz75CfK/+hAvZBs23QkBt1Is8c3CzCk=;
        b=nBgwBkMmYdlni+vzdJY3mF5cp9HJ9sKZptscMxDxRrJ8021jMOlOb+j5b9v9ZI0ue6
         9QpcHtwPagv+qnKRI0NFhvwdOGsShQOOETOAwjNmtxPOEQOuXToUNw8+vzPRK3rwBIqh
         lBjHubzF5T5F4ixw5tW35wM2ejBgsKdqbkSpS84PhY71IwhXQ8Qh9IozwBoqHDi/WB9C
         Lh0zopgkM+9wDtTiTnLDYoqkcC8q6eW4yhBcflf5VwDHj0876+/SSXMWUgAnlS+T61sv
         x01R6PysIMWqrTExVNjDObSpSWjHgC+kMCMeD0tLU9bXLQsn9pVBR+P7Ds1bnZ/oEQZx
         GdGw==
X-Gm-Message-State: AOJu0YzrNFfTmv2Z2XhKzNkPQh5SXGgjmtsAAYllFKTJX05/fTn2/btn
	FdAftmF6rN3TbGyELLdZvO2+UpikQWMwRaGRqhLs58GQ4WLO4lNLgXeghyyyE9ygMXu98RvI4Gi
	p
X-Google-Smtp-Source: AGHT+IFS2YdSgunXD1W7d/NoENYW4x6h1LZ/PaeuVABJKdnIfb5PSHvUMl/MSOJtn6P/tMs2KgIMHQ==
X-Received: by 2002:a17:907:2cc7:b0:a99:8a5c:a357 with SMTP id a640c23a62f3a-aa483553afbmr172036366b.58.1731671574410;
        Fri, 15 Nov 2024 03:52:54 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Tim Deegan <tim@xen.org>,
	Lukasz Hawrylko <lukasz@hawrylko.pl>,
	=?UTF-8?q?Mateusz=20M=C3=B3wka?= <mateusz.mowka@intel.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Yann Dirson <yann.dirson@vates.tech>
Subject: [RFC PATCH 00/25] Introduce xenbindgen to autogen hypercall structs
Date: Fri, 15 Nov 2024 11:51:29 +0000
Message-ID: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series is the result of my "Interfacing Rust with Xen" talk in Xen Summit.
It adds a hypercall ABI IDL parser and generator to the xen tree, replaces a
couple of existing hypercalls, creates a Rust crate with autogenerated contents
an creates a CI job to ensure nothing goes out of sync.

The changes are fairly invasive because the various autogenerated items appear
in many places (specially the domaincreate flags). However, the changes to the
hypervisor are all mechanical and not functional (not intentionally so, at
least).

I've split the generator in reasonably small pieces, but it's still not a small
tool. The Rust backend remains monolithic in a single patch until the RFC goes
further. It mirrors the C backend for the most part.

The hypercall ABI is specified in a schema of TOML. Most of it should be fairly
obvious as to what it does and means, with the possible exception of the "typ"
field. That has the look of a dictionary because that helps the deserializer to
automatically resolve the typ to a convenient Rust enum type (Typ). In time,
that will become something nicer to write, but that's fairly far in my list of
priorities at the moment.

After the series sysctl::readconsole and domctl::createdomain are autogenerated
from their formalized forms. In the course of formalizing the ABI it became
apparent readconsole has a different ABI in 32 and 64 bits. While benign in
that particular case, it's yet one more reason to formalize the ABI in a
language agnostic way and have it machine-checked.

======== The Plan ===========

So, the idea of the series is to adjust 2 meaningful hypercalls to TOML-based
specifications (sysctl::readconsole and domctl::createdomain). The series is
organised in the following chunks of work

  1. Sanitise domctl::createdomain to remove packed subfields.
  2. Introduce xenbindgen (IDL parser and generator for C).
  3. Specify hypercalls in TOML, and replace the hand-crafted public bits.
  4. Introduce Rust generator for xenbindgen.
  5. Introduce a xen-sys crate, with the autogenerated Rust constructs.
  6. Introduce CI checks for Rust linters, ABI validation and autogenerated
     file consistency.

Future work involves migrating more hypercalls, in the same way patch 12 does.
Most hypercalls should not take the amount of churn createdomain did. With the
foundations laid down the involved work should be simple.

I have considered integrating the hypercall generation in the build process.
That forces the Rust toolchain to be in the list of build dependencies for
downstreams, which might be complicated or annoying. For the time being, I
think checking in the autogenerated files and confirming in CI that they are
in-sync is (imo) more than enough.

======== Patch grouping ===========

Patches 1 and 2 remove packed subfields to allow encoding it in the TOML specs
(e.g: see patch 13, replace hand-crafted altp2m_mode). It's non-functional
changes aiming to reach simpler representability.

  Patch 1.  xen/domctl: Refine grant_opts into max_grant_version
  Patch 2.  xen/domctl: Replace altp2m_opts with altp2m_mode

Patches 3 to 10 are xenbindgen (with the C generator backend only). The
Cargo.lock file in patch 4 is required for build reproducibility and is
recommended to have checked in the repo.

  Patch 3.  tools/xenbindgen: Introduce a Xen hypercall IDL generator
  Patch 4.  tools/xenbindgen: Add a TOML spec reader
  Patch 5.  tools/xenbindgen: Add basic plumbing for the C backend
  Patch 6.  tools/xenbindgen: Add xenbindgen's Cargo.lock file
  Patch 7.  tools/xenbindgen: Add support for structs in TOML specs
  Patch 8.  tools/xenbindgen: Add support for enums in TOML specs
  Patch 9.  tools/xenbindgen: Add support for bitmaps in TOML specs
  Patch 10. tools/xenbindgen: Add support for includes in the TOML specs

Patch 11 goes a step beyond and validates the ABI has no implicit padding and
that all names are unique. In the future, when we define rules for stable ABIs,
all of those can be checked here, at generation time.

  Patch 11. tools/xenbindgen: Validate ABI rules at generation time

Patches 12 to 19 replace current items in the C headers with autogenerated
versions. They should all be mechanical translations.

  Patch 12. xen: Replace sysctl/readconsole with autogenerated version
  Patch 13. xen: Replace hand-crafted altp2m_mode descriptions with
            autogenerated ones
  Patch 14. xen: Replace common bitmaps in domctl.createdomain with
            autogenerated versions
  Patch 15. xen/arm: Replace hand-crafted xen_arch_domainconfig with
            autogenerated one
  Patch 16. xen/x86: Replace hand-crafted xen_arch_domainconfig with
            autogenerated one
  Patch 17. xen/ppc: Replace empty xen_arch_domainconfig with autogenerated
            one
  Patch 18. xen/riscv: Replace empty xen_arch_domainconfig with autogenerated
            one
  Patch 19. xen: Replace hand-crafted domctl/createdomain with autogenerated
            version

Patches 20 to 23 add a Rust backend to xenbindgen, and create a barebones
xen-sys crate containing the autogenerated constructs.

  Patch 20. tools/xen-sys: Create a crate with autogenerated Rust constructs
  Patch 21. tools/xenbindgen: Add Rust backend to xenbindgen
  Patch 22. tools/xen-sys: Add autogenerated Rust files
  Patch 23. licence: Add Unicode-DFS-2016 to the list of licences

Patches 24 and 25 include CI checks to avoid regressions in all this. A new job
under "analysis" validates ABI invariants and consistency between autogenerated
headers and specs, and lints all Rust code.

  Patch 24. tools/rust: Add deny.toml
  Patch 25. ci: Add a CI checker for Rust-related helpful properties

======== The question ===========

It would be nice to have at least the IDL parser checked in before the 4.20
freeze, but that assumes everyone is onboard with the general plan.

Patch 25 needs a dedicated container before it can go in, but otherwise
everything else should be in a pretty decent shape. With all of this on the
table, are there any reasons why this work should be deferred any longer?

Does this all sound like a credible plan?

Alejandro Vallejo (25):
  xen/domctl: Refine grant_opts into max_grant_version
  xen/domctl: Replace altp2m_opts with altp2m_mode
  tools/xenbindgen: Introduce a Xen hypercall IDL generator
  tools/xenbindgen: Add a TOML spec reader
  tools/xenbindgen: Add basic plumbing for the C backend
  tools/xenbindgen: Add xenbindgen's Cargo.lock file
  tools/xenbindgen: Add support for structs in TOML specs
  tools/xenbindgen: Add support for enums in TOML specs
  tools/xenbindgen: Add support for bitmaps in TOML specs
  tools/xenbindgen: Add support for includes in the TOML specs
  tools/xenbindgen: Validate ABI rules at generation time
  xen: Replace sysctl/readconsole with autogenerated version
  xen: Replace hand-crafted altp2m_mode descriptions with autogenerated
    ones
  xen: Replace common bitmaps in domctl.createdomain with autogenerated
    versions
  xen/arm: Replace hand-crafted xen_arch_domainconfig with autogenerated
    one
  xen/x86: Replace hand-crafted xen_arch_domainconfig with autogenerated
    one
  xen/ppc: Replace empty xen_arch_domainconfig with autogenerated one
  xen/riscv: Replace empty xen_arch_domainconfig with autogenerated one
  xen: Replace hand-crafted domctl/createdomain with autogenerated
    version
  tools/xen-sys: Create a crate with autogenerated Rust constructs
  tools/xenbindgen: Add Rust backend to xenbindgen
  tools/xen-sys: Add autogenerated Rust files
  licence: Add Unicode-DFS-2016 to the list of licences
  tools/rust: Add deny.toml
  ci: Add a CI checker for Rust-related helpful properties

 LICENSES/Unicode-DFS-2016                     |  56 ++
 automation/gitlab-ci/analyze.yaml             |  14 +
 stubdom/Makefile                              |   2 +-
 tools/helpers/init-xenstore-domain.c          |   6 +-
 tools/libs/light/libxl_create.c               |  31 +-
 tools/libs/light/libxl_x86.c                  |   4 +-
 tools/ocaml/libs/xc/xenctrl.ml                |   6 +-
 tools/ocaml/libs/xc/xenctrl.mli               |   6 +-
 tools/ocaml/libs/xc/xenctrl_stubs.c           |  21 +-
 tools/python/xen/lowlevel/xc/xc.c             |   6 +-
 tools/rust/Makefile                           |  83 +++
 tools/rust/deny.toml                          | 236 +++++++
 tools/rust/xen-sys/.gitignore                 |   2 +
 tools/rust/xen-sys/Cargo.toml                 |   8 +
 tools/rust/xen-sys/src/autogen.rs             |  27 +
 tools/rust/xen-sys/src/autogen/arch_arm.rs    |  56 ++
 tools/rust/xen-sys/src/autogen/arch_ppc.rs    |   8 +
 tools/rust/xen-sys/src/autogen/arch_riscv.rs  |   8 +
 tools/rust/xen-sys/src/autogen/arch_x86.rs    |  55 ++
 tools/rust/xen-sys/src/autogen/domctl.rs      | 104 ++++
 tools/rust/xen-sys/src/autogen/sysctl.rs      |  26 +
 tools/rust/xen-sys/src/lib.rs                 |  45 ++
 tools/rust/xenbindgen/.gitignore              |   1 +
 tools/rust/xenbindgen/Cargo.lock              | 430 +++++++++++++
 tools/rust/xenbindgen/Cargo.toml              |  15 +
 .../extra/arch-arm/domainconfig.toml          |  83 +++
 .../extra/arch-ppc/domainconfig.toml          |   4 +
 .../extra/arch-riscv/domainconfig.toml        |   4 +
 .../extra/arch-x86/domainconfig.toml          |  87 +++
 .../xenbindgen/extra/domctl/createdomain.toml | 185 ++++++
 .../xenbindgen/extra/sysctl/readconsole.toml  |  43 ++
 tools/rust/xenbindgen/src/c_lang.rs           | 267 ++++++++
 tools/rust/xenbindgen/src/main.rs             | 103 ++++
 tools/rust/xenbindgen/src/rs_lang.rs          | 227 +++++++
 tools/rust/xenbindgen/src/spec.rs             | 577 ++++++++++++++++++
 .../paging-mempool/test-paging-mempool.c      |   4 +-
 tools/tests/resource/test-resource.c          |  14 +-
 tools/tests/tsx/test-tsx.c                    |   8 +-
 xen/arch/arm/dom0less-build.c                 |   8 +-
 xen/arch/arm/domain.c                         |  12 +-
 xen/arch/arm/domain_build.c                   |   6 +-
 xen/arch/arm/tee/tee.c                        |   1 +
 xen/arch/x86/domain.c                         |  33 +-
 xen/arch/x86/hvm/hvm.c                        |  12 +-
 xen/arch/x86/include/asm/domain.h             |   4 +-
 xen/arch/x86/include/asm/hvm/nestedhvm.h      |   2 +-
 xen/arch/x86/mm/shadow/common.c               |   4 +-
 xen/arch/x86/setup.c                          |  12 +-
 xen/arch/x86/tboot.c                          |   2 +-
 xen/common/domain.c                           |  25 +-
 xen/common/grant_table.c                      |   3 +-
 xen/drivers/char/console.c                    |  12 +-
 xen/drivers/passthrough/iommu.c               |   4 +-
 xen/include/public/arch-arm.h                 |  36 --
 xen/include/public/arch-ppc.h                 |   3 -
 xen/include/public/arch-riscv.h               |   3 -
 xen/include/public/arch-x86/xen.h             |  51 --
 xen/include/public/autogen/arch_arm.h         |  59 ++
 xen/include/public/autogen/arch_ppc.h         |  14 +
 xen/include/public/autogen/arch_riscv.h       |  14 +
 xen/include/public/autogen/arch_x86.h         |  52 ++
 xen/include/public/autogen/domctl.h           | 117 ++++
 xen/include/public/autogen/sysctl.h           |  35 ++
 xen/include/public/domctl.h                   |  93 +--
 xen/include/public/sysctl.h                   |  24 +-
 xen/include/public/xen.h                      |   1 +
 xen/include/xen/grant_table.h                 |   6 +-
 xen/include/xen/sched.h                       |  10 +-
 68 files changed, 3180 insertions(+), 340 deletions(-)
 create mode 100644 LICENSES/Unicode-DFS-2016
 create mode 100644 tools/rust/Makefile
 create mode 100644 tools/rust/deny.toml
 create mode 100644 tools/rust/xen-sys/.gitignore
 create mode 100644 tools/rust/xen-sys/Cargo.toml
 create mode 100644 tools/rust/xen-sys/src/autogen.rs
 create mode 100644 tools/rust/xen-sys/src/autogen/arch_arm.rs
 create mode 100644 tools/rust/xen-sys/src/autogen/arch_ppc.rs
 create mode 100644 tools/rust/xen-sys/src/autogen/arch_riscv.rs
 create mode 100644 tools/rust/xen-sys/src/autogen/arch_x86.rs
 create mode 100644 tools/rust/xen-sys/src/autogen/domctl.rs
 create mode 100644 tools/rust/xen-sys/src/autogen/sysctl.rs
 create mode 100644 tools/rust/xen-sys/src/lib.rs
 create mode 100644 tools/rust/xenbindgen/.gitignore
 create mode 100644 tools/rust/xenbindgen/Cargo.lock
 create mode 100644 tools/rust/xenbindgen/Cargo.toml
 create mode 100644 tools/rust/xenbindgen/extra/arch-arm/domainconfig.toml
 create mode 100644 tools/rust/xenbindgen/extra/arch-ppc/domainconfig.toml
 create mode 100644 tools/rust/xenbindgen/extra/arch-riscv/domainconfig.toml
 create mode 100644 tools/rust/xenbindgen/extra/arch-x86/domainconfig.toml
 create mode 100644 tools/rust/xenbindgen/extra/domctl/createdomain.toml
 create mode 100644 tools/rust/xenbindgen/extra/sysctl/readconsole.toml
 create mode 100644 tools/rust/xenbindgen/src/c_lang.rs
 create mode 100644 tools/rust/xenbindgen/src/main.rs
 create mode 100644 tools/rust/xenbindgen/src/rs_lang.rs
 create mode 100644 tools/rust/xenbindgen/src/spec.rs
 create mode 100644 xen/include/public/autogen/arch_arm.h
 create mode 100644 xen/include/public/autogen/arch_ppc.h
 create mode 100644 xen/include/public/autogen/arch_riscv.h
 create mode 100644 xen/include/public/autogen/arch_x86.h
 create mode 100644 xen/include/public/autogen/domctl.h
 create mode 100644 xen/include/public/autogen/sysctl.h


base-commit: d2bbb0d4554aa08649985d790317ba78f0db22ff
-- 
2.47.0


