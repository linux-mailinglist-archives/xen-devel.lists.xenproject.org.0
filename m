Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4CFA5D01A
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 20:58:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908967.1316012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts5k3-000719-GX; Tue, 11 Mar 2025 19:58:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908967.1316012; Tue, 11 Mar 2025 19:58:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts5k3-0006zF-B9; Tue, 11 Mar 2025 19:58:19 +0000
Received: by outflank-mailman (input) for mailman id 908967;
 Tue, 11 Mar 2025 19:58:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EQfW=V6=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1ts5k1-0006Vp-9A
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 19:58:17 +0000
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [2607:f8b0:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2911048d-feb3-11ef-9ab9-95dc52dad729;
 Tue, 11 Mar 2025 20:58:12 +0100 (CET)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-22398e09e39so111117945ad.3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 12:58:12 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736a6e5c13asm9646981b3a.157.2025.03.11.12.58.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 12:58:10 -0700 (PDT)
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
X-Inumbo-ID: 2911048d-feb3-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741723091; x=1742327891; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BJxldrM9ls/rNwHOkfKDTsLlkFzxI4z634GC5RzciYk=;
        b=orfmFdNRqNculAonDC3XWTfCxovbgkTX1Ib2cWeMu1xhP+mzl57lZlHgL78LN/8xCF
         30DhzAwVihQSWI8227+l64dbXcflrtAuHd00QXfWUjdedBAcWJ+lQ/sAURXO5gBQk1Wh
         +K1MHVwf60CaKVXHH2Bmc0TZSVqdMOGeseWbulz1lN0QZUWhKoxQRt2ZsHvJVzTqGtLr
         ZsNhsg8Df8HJ77zb5+ZWU2hhL9gI7t3zSKkQmyXiZ/sB49bvd0Bn/8mpOScUK9+Vnw2X
         YIZmLcvoRS9xWHP1hj+txAaK8wD76Ot7XTWAJ1+laxhVMfLfmNud8VEoD1uCNuFfvPxM
         o/Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741723091; x=1742327891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BJxldrM9ls/rNwHOkfKDTsLlkFzxI4z634GC5RzciYk=;
        b=jAO62UcgOKRgbXWr1EqGG/rnypEffXBHKJ2dyj+7J5/JkzRW/DxHDJld6A+zTEKJFl
         PnrV12Bm93N23cqe/+tJsiirmk6P9Eadbl48oE03UrfOgpp9eHASPl+HvNNEHgXSy9jk
         qUgemCv1Izxy4MG+6lXSQTZatfdp9UrpG+Kd+Ze/RTjGzZBxcU6p28J4xvf/YdGednpL
         mNXVGJVWc+CiZIUo7+vmtE1GdM1Ph/YQyd25wffKXKBCRv0HFVo4JlCDTKPG64TtoGPB
         5U6jZUGN8Ur5ndLTaxh/6oFXEF8F1PjT/zinoDUI9tHjmxcFyPEeX8zTgCx5BYNaXAhy
         AaZQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2pghR2axqoNBS+UXdpzmKC6AcyzBFqj71SvU0Vyc7t+BIMUTQ9Ye6Sbozlr77zt07Sqbr+pBh9Qg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzcc7FtqkpLkg8nzTvMMUpJ9WuovD1LoNdcR8XbUl3bWPxN5UTV
	HTkfPZH9EM4BF05rHOo68AHk66dAKQzsQoXh/iC9y+ocftAvjK2O39S3/xdPjsU=
X-Gm-Gg: ASbGnctRaTqk2C9Zlu2YCsVSexbZToT26pVKdL/0ka/V63LTMhtX231zTeOH7wWd7r1
	TBD6UwdSue1mk2mUfkKDIRG3yRSadfLxl9D1SO/2fikv1Q+b+DxV+CGireul+8VPySiwasS2i7L
	xJfvN3LvEBsevUOhiSFOozpNK6ZLtR8IOLOgirM4kQi6nJStagoneLtQM54QGWjuKCQDfJiqjo4
	Nh/JhmPrUHi+3Z0xVIEP62FE0nDPnJViOK8T1s4EvDw6shelxqqnv4ccP6pUY2c+/fIKPYWmdZ1
	XHfYAA/w3vMCMPSdH63FooIEcEZ0Z/VHEkWWRHCeGeCt
X-Google-Smtp-Source: AGHT+IHOrb1ktHbDIJg0LAeBD9OfAq2o4wANofPbWEj8d4iUXmKit5ZY6qUoI1jOxUcgyXZ2QfV68A==
X-Received: by 2002:a17:903:32ce:b0:223:39ae:a98 with SMTP id d9443c01a7336-22428a98102mr318619255ad.22.1741723090697;
        Tue, 11 Mar 2025 12:58:10 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Anthony PERARD <anthony@xenproject.org>,
	xen-devel@lists.xenproject.org,
	Nicholas Piggin <npiggin@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Weiwei Li <liwei1518@gmail.com>,
	kvm@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paul Durrant <paul@xen.org>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	manos.pitsidianakis@linaro.org,
	Peter Xu <peterx@redhat.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	alex.bennee@linaro.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	qemu-riscv@nongnu.org,
	qemu-ppc@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 00/17] make system memory API available for common code
Date: Tue, 11 Mar 2025 12:57:46 -0700
Message-Id: <20250311195803.4115788-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The main goal of this series is to be able to call any memory ld/st function
from code that is *not* target dependent. As a positive side effect, we can
turn related system compilation units into common code.

The first 5 patches remove dependency of memory API to cpu headers and remove
dependency to target specific code. This could be a series on its own, but it's
great to be able to turn system memory compilation units into common code to
make sure it can't regress, and prove it achieves the desired result.

The next patches remove more dependencies on cpu headers (exec-all,
memory-internal, ram_addr).
Then, we add access to a needed function from kvm, some xen stubs, and we
finally can turn our compilation units into common code.

Every commit was tested to build correctly for all targets (on windows, linux,
macos), and the series was fully tested by running all tests we have (linux,
x86_64 host).

v2:
- reorder first commits (tswap change first, so memory cached functions can use it)
- move st/ld*_p functions to tswap instead of bswap
- add define for target_words_bigendian when COMPILING_PER_TARGET, equals to
  TARGET_BIG_ENDIAN (avoid overhead in target code)
- rewrite devend_memop
- remove useless exec-all.h in concerned patch
- extract devend_big_endian function to reuse in system/memory.c
- rewrite changes to system/memory.c

v3:
- move devend functions to memory_internal.h
- completed description for commits removing cpu.h dependency

Pierrick Bouvier (17):
  exec/tswap: target code can use TARGET_BIG_ENDIAN instead of
    target_words_bigendian()
  exec/tswap: implement {ld,st}.*_p as functions instead of macros
  exec/memory_ldst: extract memory_ldst declarations from cpu-all.h
  exec/memory_ldst_phys: extract memory_ldst_phys declarations from
    cpu-all.h
  exec/memory.h: make devend_memop "target defines" agnostic
  codebase: prepare to remove cpu.h from exec/exec-all.h
  exec/exec-all: remove dependency on cpu.h
  exec/memory-internal: remove dependency on cpu.h
  exec/ram_addr: remove dependency on cpu.h
  system/kvm: make kvm_flush_coalesced_mmio_buffer() accessible for
    common code
  exec/ram_addr: call xen_hvm_modified_memory only if xen is enabled
  hw/xen: add stubs for various functions
  system/physmem: compilation unit is now common to all targets
  include/exec/memory: extract devend_big_endian from devend_memop
  include/exec/memory: move devend functions to memory-internal.h
  system/memory: make compilation unit common
  system/ioport: make compilation unit common

 include/exec/cpu-all.h              | 66 -----------------------
 include/exec/exec-all.h             |  1 -
 include/exec/memory-internal.h      | 21 +++++++-
 include/exec/memory.h               | 30 ++++-------
 include/exec/ram_addr.h             | 11 ++--
 include/exec/tswap.h                | 81 +++++++++++++++++++++++++++--
 include/system/kvm.h                |  6 +--
 include/tcg/tcg-op.h                |  1 +
 target/ppc/helper_regs.h            |  2 +
 include/exec/memory_ldst.h.inc      |  4 --
 include/exec/memory_ldst_phys.h.inc |  5 +-
 cpu-target.c                        |  1 +
 hw/ppc/spapr_nested.c               |  1 +
 hw/sh4/sh7750.c                     |  1 +
 hw/xen/xen_stubs.c                  | 56 ++++++++++++++++++++
 page-vary-target.c                  |  2 +-
 system/ioport.c                     |  1 -
 system/memory.c                     | 17 ++----
 target/riscv/bitmanip_helper.c      |  2 +-
 hw/xen/meson.build                  |  3 ++
 system/meson.build                  |  6 +--
 21 files changed, 192 insertions(+), 126 deletions(-)
 create mode 100644 hw/xen/xen_stubs.c

-- 
2.39.5


