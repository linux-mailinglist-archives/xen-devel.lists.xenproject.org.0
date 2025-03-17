Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F1DA65D05
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 19:41:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.917856.1322691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuFOs-0006lA-CO; Mon, 17 Mar 2025 18:41:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 917856.1322691; Mon, 17 Mar 2025 18:41:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuFOs-0006iN-9H; Mon, 17 Mar 2025 18:41:22 +0000
Received: by outflank-mailman (input) for mailman id 917856;
 Mon, 17 Mar 2025 18:41:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q3WP=WE=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1tuFIT-0006uj-HX
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 18:34:45 +0000
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [2607:f8b0:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73f1d6e0-035e-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 19:34:26 +0100 (CET)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-22622ddcc35so20268085ad.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 11:34:26 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73711695a2esm8188770b3a.144.2025.03.17.11.34.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 11:34:24 -0700 (PDT)
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
X-Inumbo-ID: 73f1d6e0-035e-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742236465; x=1742841265; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RPbHwvloYIySCZWmnoL8Q2AUPe8llNmEPWBrsL/waLI=;
        b=N3aXQC5DH12GsMRfxKixN/FRxFobfboLUhGyq2i2oFCV5Dqf9jmfmxyIG15ykABmHc
         lrL1YLPJ4lXiB/cpCfB7f+Vah24mPnPgnuvid19A+ATaRjzLp8fXECl4Fey/a6CGRXpI
         RFqp7rggDrTO79X9mquZ+3aZlvRxL3sRcgRfBXUOFmJPkWnIIfuiqi8a3qFLUEkhPIOL
         rpxEWbaHkvtVlYCZbF3kRnI/3MceBSKb6BhDcGds7pym+Wpnm0Gz6Es510z2opBLOQPf
         9ZUcODmbXqHndObAzKztSxTXU0kj9zp1+kBqtZmJx1YT2CERTgQU3VM3StHAVTd9wErb
         M6xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742236465; x=1742841265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RPbHwvloYIySCZWmnoL8Q2AUPe8llNmEPWBrsL/waLI=;
        b=PXk/sdgHUOsPVooqP8wLL/ojp+cxl8VqUE3P3wpVre/9KJbOTsWL9mdDrGkswRJedk
         XiQtUY2icBb6zO1cXwTNpax7/V835VZrT+TZjEjrLvSqZLOtnyNQyNYKrGIkEsqO6754
         q1sOKInm3qM5g2hqdF+UDP3CoE4a5fDSMiZYdmYzUMMW2vetDrc4W/fTw//0/bwXkif5
         dJAAe5RO4EpkmW2CYVvrs+M0+bs3+K2o92G3Fr9XmU3lhyWJELjdTNPowuh0CdzcXkVP
         uT8aFwWVzPGZ8rCoEUwyAL+KNCIdMmLy+AcQ+xVlnxyRFlTFp0wCy9mMq5ska5W0ftCk
         xF4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXoCiBRMRRFH2Chn0jMmKK9KhKnHXG/poEmqy8+tdanD6toZPNoazjMAZ1Y3LEvTt1hDDAwtlDq6o8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxClRIKCbOBjAb2OCyomVA9ZADYxQJY+OOAgwpE9VRijc3vtra3
	b+lO9mqUyBVi1uK9a0NXPZnUUTdYD7NVZP5cHNJ8WcxqEOAflNFITJEiOlD0YyQ=
X-Gm-Gg: ASbGnct9HK7aMt9ol89tobKok5lk4b9GkYCLMeAPsH7UgR4xtkkekKu0KrpJHUW75F9
	2D0U2EZniNI9QncFsNI4LP2XfiOpy4GDzIOStnDV9uRxExEzsCC75O+FP59RULTWwjclhq/B721
	HN6nnWpxzJyHUm+AZiRTVORcVelrfZHwTYtBw/l7rtexx6H3w76zrvnGRfS//lrhrVu8YsPGOxd
	CdBE90rcbvKZbnIrlbh4WL0CvCe2Or4kIZbnRSMgwKWI6Zp3o96okk5ius0/CUmr6eQAwQYLYef
	a0Ddi3VAh4OoGTLRFDizlKbYs+XH2P02mjoaTCi6vXU2
X-Google-Smtp-Source: AGHT+IHpwrE/9GG9C2SlpcasgbLprVybd7V3qfmK368RSyHmuII8fQHqzJpX5Xu5Sns9RSpMe6xOTQ==
X-Received: by 2002:a05:6a20:6a0c:b0:1f5:8903:860f with SMTP id adf61e73a8af0-1fa4428f303mr888720637.14.1742236464910;
        Mon, 17 Mar 2025 11:34:24 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org,
	David Hildenbrand <david@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	qemu-riscv@nongnu.org,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	alex.bennee@linaro.org,
	manos.pitsidianakis@linaro.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Weiwei Li <liwei1518@gmail.com>,
	kvm@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Xu <peterx@redhat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Anthony PERARD <anthony@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 00/18] make system memory API available for common code
Date: Mon, 17 Mar 2025 11:33:59 -0700
Message-Id: <20250317183417.285700-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

v4:
- rebase on top of master
  * missing include in 'codebase: prepare to remove cpu.h from exec/exec-all.h'
  * meson build conflict

v5:
- remove extra xen stub xen_invalidate_map_cache()
- edit xen stubs commit message

v6:
- remove xen inline stubs from headers

Pierrick Bouvier (18):
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
  system/xen: remove inline stubs
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
 include/system/xen-mapcache.h       | 41 ---------------
 include/system/xen.h                | 21 ++------
 include/tcg/tcg-op.h                |  1 +
 target/ppc/helper_regs.h            |  2 +
 include/exec/memory_ldst.h.inc      |  4 --
 include/exec/memory_ldst_phys.h.inc |  5 +-
 cpu-target.c                        |  1 +
 hw/ppc/spapr_nested.c               |  1 +
 hw/sh4/sh7750.c                     |  1 +
 hw/xen/xen_stubs.c                  | 51 ++++++++++++++++++
 page-vary-target.c                  |  2 +-
 system/ioport.c                     |  1 -
 system/memory.c                     | 17 ++----
 target/ppc/tcg-excp_helper.c        |  1 +
 target/riscv/bitmanip_helper.c      |  2 +-
 hw/xen/meson.build                  |  3 ++
 system/meson.build                  |  6 +--
 24 files changed, 191 insertions(+), 185 deletions(-)
 create mode 100644 hw/xen/xen_stubs.c

-- 
2.39.5


