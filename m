Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEFE986295
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 17:14:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804079.1214999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTip-000653-Sn; Wed, 25 Sep 2024 15:14:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804079.1214999; Wed, 25 Sep 2024 15:14:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTip-00062a-PY; Wed, 25 Sep 2024 15:14:31 +0000
Received: by outflank-mailman (input) for mailman id 804079;
 Wed, 25 Sep 2024 15:01:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jtd1=QX=flex--ardb.bounces.google.com=33SX0ZggKCTgUlXV+acnaiiafY.WigrYh-XYpYffcmnm.rYhjlidYWn.ila@srs-se1.protection.inumbo.net>)
 id 1stTWZ-0002UM-GT
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 15:01:51 +0000
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [2607:f8b0:4864:20::b49])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17967bee-7b4f-11ef-a0ba-8be0dac302b0;
 Wed, 25 Sep 2024 17:01:50 +0200 (CEST)
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-e1a8de19f7aso10184459276.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 08:01:50 -0700 (PDT)
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
X-Inumbo-ID: 17967bee-7b4f-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727276509; x=1727881309; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6z7k17OsGZKMVFB80yPIaoy18RpZ7zGlccSFIk096uA=;
        b=Y8Pxkh03lOr7UvEKpxuNrTTd7acwrxwD0a4rWS+pN83SoOuNuoj4gA4jOdmyK/5W+L
         268NN2PLmYoyPat1dAKYRFygxsL7TY1fU0EVDnqzUjMob8FFTBFbc1Q0vlmevcoLpCbs
         qlAVUUvcEkYeyNlsnFWdZ8trhO7xv7IQNNw5UwHcHVUt+l0gKodXoVQ9kh7GnjSeJ9bj
         zd1vFgAOQCGvgXGSAf+ozU3OP32jy5Pb7ny9rKm/4U7OUAAPHfXp7WYCRRcUzRsyduzl
         NGmbbc6/1lj1pNeyzguGHLAHok1koIShr0sIPHoqoi90kwx1W2pshWhAgkh4PFVaFxQ1
         Ii4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727276509; x=1727881309;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6z7k17OsGZKMVFB80yPIaoy18RpZ7zGlccSFIk096uA=;
        b=bt+Ult+//YJhCn0v0SRcPTXvNrS71xmh0Ode4Mm2qaA8Ec7ZvjgC+vjVeCtsd+TCkD
         o8TIvpxE4X6HtSpLPd9hNTKlmFjvOVafejiKIj6A9bktu+h2jfBj8eeJpFtKkJcBKDDV
         sbfFrqNeHa8xSZsbvYMF4cZIc4YKdrf86MnkAYTkwz2cBEX105PV9aXljpFXf+niRu70
         q7dsik27Hd66m3Kxnoch4iKOjw8gVlhgunCi9XqkxfUQDLL8lb51gMkTLGu32lSmZaGa
         TlD/43zwHNpqhnQfqDMzluQdZXrTlq7NvBzKlNvIBdnJnjrjnE2Ih4l7jny880mekWY4
         abeg==
X-Forwarded-Encrypted: i=1; AJvYcCXhknjDDiDTnh84JQRR9uOFn14TMgWjPqD9tdn6aM2kpB8KUTtOAoOKImTfrUAZpkOxPQEvCtoxxUQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzxEWTcAZBqnzGdC7hUNDdscajB2oxyJ6WMsj682/S8Gu/ApxLb
	fKroJ/Ie1uFyTwUnAtmB7IQ31qbHPnkD+fEOgrYyGI0agFmnmHqb1/IHGDC4YUrzOCD/dQ==
X-Google-Smtp-Source: AGHT+IGRJUFrs1DoPRrR5c+MJEZ6tG0DheITTu8FPFLiXZOk+NGplm3eXqMcHGaqBYVKwyJOtED+Rs3U
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a25:d695:0:b0:e24:9ec4:7297 with SMTP id
 3f1490d57ef6-e24da58666emr14424276.11.1727276509248; Wed, 25 Sep 2024
 08:01:49 -0700 (PDT)
Date: Wed, 25 Sep 2024 17:01:00 +0200
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=9188; i=ardb@kernel.org;
 h=from:subject; bh=vMX7ogGZLEc8VPljv97RuDVJFn/JAzUBXeH6mBcebRA=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIe2L6pr9k37ZPn8uK8IvcW92T9PETT9Xrz4h19DckCOrf
 uS7om11RykLgxgHg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZiIeBIjQ8cjt/vNFnlpcQoK
 wSbqqaeUo8XjLsnZ2/zNu6XorPO9luG/9+LkrdV5d/tnvdg2VzHvwaxNexRvHney2v1TP02udn4 IIwA=
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240925150059.3955569-30-ardb+git@google.com>
Subject: [RFC PATCH 00/28] x86: Rely on toolchain for relocatable code
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Uros Bizjak <ubizjak@gmail.com>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Keith Packard <keithp@keithp.com>, 
	Justin Stitt <justinstitt@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, linux-doc@vger.kernel.org, 
	linux-pm@vger.kernel.org, kvm@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-efi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-sparse@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

The x86_64 port has a number of historical quirks that result in a
reliance on toolchain features that are either poorly specified or
basically implementation details of the toolchain:

- the 'kernel' C model implemented by the compiler is intended for
  position dependent code residing in the 'negative' 2 GiB of the
  virtual address space, but is used to create a position independent
  executable (for virtual KASLR);

- the 'kernel' C model has other properties that are not written down
  anywhere, and may therefore deviate between compilers and versions,
  which now includes the Rust compilers too (e.g., use %gs not %fs for
  per-CPU references); 

- the relocation format used to perform the PIE relocation at boot is
  complicated and non-standard, as it deals with 3 types of
  displacements, including 32-bit negative displacements for
  RIP-relative per-CPU references that are not subject to relocation
  fixups (as they are places in a separate, disjoint address space);

- the relocation table is generated from static relocation metadata
  taken from the ELF input objects into the linker, and these describe
  the input not the output - relaxations or other linker tweaks may
  result in a mismatch between the two, and GNU ld and LLD display
  different behavior here;

- this disjoint per-CPU address space requires elaborate hacks in the
  linker script and the startup code;

- some of the startup code executes from a 1:1 mapping of memory, where
  RIP-relative references are mandatory, whereas RIP-relative per-CPU
  variable references can only work correctly from the kernel virtual
  mapping (as they need to wrap around from the negative 2 GiB space
  into the 0x0 based per-CPU region);

The reason for this odd situation wrt per-CPU variable addressing is the
fact that we rely on the user-space TLS arrangement for per-task stack
cookies, and this was implemented using a fixed offset of 40 bytes from
%GS. If we bump the minimum GCC version to 8.1, we can switch to symbol
based stack cookie references, allowing the same arrangement to be
adopted as on other architectures, i.e., where the CPU register carries
the per-CPU offset, and UP or boot-time per-CPU references point into
the per-CPU load area directly (using an offset of 0x0).

With that out of the way, we can untangle this whole thing, and replace
the bespoke tooling and relocation formats with ordinary, linker
generated relocation tables, using the RELR format that reduces the
memory footprint of the relocation table by 20x. The compilers can
efficiently generate position independent code these days, without
unnecessary indirections via the Global Object Table (GOT) except for a
handful of special cases (see the KVM patch for an example where a
GOT-based indirection is the best choice for pushing the absolute
address of a symbol onto the stack in a position independent manner when
there are no free GPRs)

It also brings us much closer to the ordinary PIE relocation model used
for most of user space, which is therefore much better supported and
less likely to create problems as we increase the range of compilers and
linkers that need to be supported.

Tested on GCC 8 - 14 and Clang 15 - 17, using EFI and bare metal boot
using a variety of entry points (decompressor, EFI stub, XenPV, PVH)
 
Cc: x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Uros Bizjak <ubizjak@gmail.com>
Cc: Dennis Zhou <dennis@kernel.org>
Cc: Tejun Heo <tj@kernel.org>
Cc: Christoph Lameter <cl@linux.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Kees Cook <kees@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Keith Packard <keithp@keithp.com>
Cc: Justin Stitt <justinstitt@google.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>
Cc: Jiri Olsa <jolsa@kernel.org>
Cc: Ian Rogers <irogers@google.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Kan Liang  <kan.liang@linux.intel.com>
Cc: linux-doc@vger.kernel.org
Cc: linux-pm@vger.kernel.org
Cc: kvm@vger.kernel.org
Cc: xen-devel@lists.xenproject.org
Cc: linux-efi@vger.kernel.org
Cc: linux-arch@vger.kernel.org
Cc: linux-sparse@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org
Cc: linux-perf-users@vger.kernel.org
Cc: rust-for-linux@vger.kernel.org
Cc: llvm@lists.linux.dev

Ard Biesheuvel (28):
  x86/pvh: Call C code via the kernel virtual mapping
  Documentation: Bump minimum GCC version to 8.1
  x86/tools: Use mmap() to simplify relocs host tool
  x86/boot: Permit GOTPCREL relocations for x86_64 builds
  x86: Define the stack protector guard symbol explicitly
  x86/percpu: Get rid of absolute per-CPU variable placement
  scripts/kallsyms: Avoid 0x0 as the relative base
  scripts/kallsyms: Remove support for absolute per-CPU variables
  x86/tools: Remove special relocation handling for per-CPU variables
  x86/xen: Avoid relocatable quantities in Xen ELF notes
  x86/pvh: Avoid absolute symbol references in .head.text
  x86/pm-trace: Use RIP-relative accesses for .tracedata
  x86/kvm: Use RIP-relative addressing
  x86/rethook: Use RIP-relative reference for return address
  x86/sync_core: Use RIP-relative addressing
  x86/entry_64: Use RIP-relative addressing
  x86/hibernate: Prefer RIP-relative accesses
  x86/boot/64: Determine VA/PA offset before entering C code
  x86/boot/64: Avoid intentional absolute symbol references in
    .head.text
  x64/acpi: Use PIC-compatible references in wakeup_64.S
  x86/head: Use PIC-compatible symbol references in startup code
  asm-generic: Treat PIC .data.rel.ro sections as .rodata
  tools/objtool: Mark generated sections as writable
  tools/objtool: Treat indirect ftrace calls as direct calls
  x86: Use PIE codegen for the core kernel
  x86/boot: Implement support for ELF RELA/RELR relocations
  x86/kernel: Switch to PIE linking for the core kernel
  x86/tools: Drop x86_64 support from 'relocs' tool

 Documentation/admin-guide/README.rst    |   2 +-
 Documentation/arch/x86/zero-page.rst    |   3 +-
 Documentation/process/changes.rst       |   2 +-
 arch/x86/Kconfig                        |   3 +-
 arch/x86/Makefile                       |  22 +-
 arch/x86/boot/Makefile                  |   1 +
 arch/x86/boot/compressed/Makefile       |   2 +-
 arch/x86/boot/compressed/misc.c         |  16 +-
 arch/x86/entry/calling.h                |   9 +-
 arch/x86/entry/entry_64.S               |  12 +-
 arch/x86/entry/vdso/Makefile            |   1 +
 arch/x86/include/asm/desc.h             |   1 -
 arch/x86/include/asm/init.h             |   2 +-
 arch/x86/include/asm/percpu.h           |  22 -
 arch/x86/include/asm/pm-trace.h         |   4 +-
 arch/x86/include/asm/processor.h        |  14 +-
 arch/x86/include/asm/setup.h            |   3 +-
 arch/x86/include/asm/stackprotector.h   |   4 -
 arch/x86/include/asm/sync_core.h        |   3 +-
 arch/x86/include/uapi/asm/bootparam.h   |   2 +-
 arch/x86/kernel/acpi/wakeup_64.S        |  11 +-
 arch/x86/kernel/head64.c                |  76 +++-
 arch/x86/kernel/head_64.S               |  40 +-
 arch/x86/kernel/irq_64.c                |   1 -
 arch/x86/kernel/kvm.c                   |   8 +-
 arch/x86/kernel/relocate_kernel_64.S    |   6 +-
 arch/x86/kernel/rethook.c               |   3 +-
 arch/x86/kernel/setup_percpu.c          |   9 +-
 arch/x86/kernel/vmlinux.lds.S           |  75 ++--
 arch/x86/platform/pvh/head.S            |  57 ++-
 arch/x86/power/hibernate_asm_64.S       |   4 +-
 arch/x86/realmode/rm/Makefile           |   1 +
 arch/x86/tools/Makefile                 |   2 +-
 arch/x86/tools/relocs.c                 | 425 +++-----------------
 arch/x86/tools/relocs.h                 |  11 +-
 arch/x86/tools/relocs_64.c              |  18 -
 arch/x86/tools/relocs_common.c          |  11 +-
 arch/x86/xen/xen-head.S                 |  16 +-
 drivers/base/power/trace.c              |   6 +-
 drivers/firmware/efi/libstub/x86-stub.c |   2 +
 include/asm-generic/vmlinux.lds.h       |  10 +-
 include/linux/compiler.h                |   2 +-
 init/Kconfig                            |   5 -
 kernel/kallsyms.c                       |  12 +-
 scripts/kallsyms.c                      |  53 +--
 scripts/link-vmlinux.sh                 |   4 -
 tools/objtool/check.c                   |  43 +-
 tools/objtool/elf.c                     |   2 +-
 tools/objtool/include/objtool/special.h |   2 +-
 tools/perf/util/annotate.c              |   4 +-
 50 files changed, 380 insertions(+), 667 deletions(-)
 delete mode 100644 arch/x86/tools/relocs_64.c

-- 
2.46.0.792.g87dc391469-goog


