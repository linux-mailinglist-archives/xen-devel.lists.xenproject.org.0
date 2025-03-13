Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 671B6A5FBF7
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 17:39:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912884.1319086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tslaZ-0001HO-QA; Thu, 13 Mar 2025 16:39:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912884.1319086; Thu, 13 Mar 2025 16:39:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tslaZ-0001F2-KZ; Thu, 13 Mar 2025 16:39:19 +0000
Received: by outflank-mailman (input) for mailman id 912884;
 Thu, 13 Mar 2025 16:39:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UNRr=WA=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1tslaX-0000Wn-SE
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 16:39:17 +0000
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [2607:f8b0:4864:20::1033])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b05472f7-0029-11f0-9898-31a8f345e629;
 Thu, 13 Mar 2025 17:39:11 +0100 (CET)
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-2fee05829edso2501302a91.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 09:39:13 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30119265938sm4020084a91.39.2025.03.13.09.39.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 09:39:11 -0700 (PDT)
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
X-Inumbo-ID: b05472f7-0029-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741883951; x=1742488751; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ffKtZZCij4vskrAA+3NvWrKzzZscOxv69bTHCnUkApM=;
        b=RKa8voWFmOpZgJrxep1GRY56p8liykwd0JspANCbrQc4lglP32/uaBZdwb4xLVs3uR
         sAtyzy6YS8KeCJ/JG/KipB2L7ZGqpuzVsWmPHmgGx8YkWTqpk8UjQIOdz5mJJnZhOiyj
         JVKq6xJeqrwvyL+yT5oLeDtc6uN/y5/d2q6YeyaBpKzXVtmnNO1sFEF1TGfIwMqFHkkR
         Fxz18uG6DXRYotsJ4uKox19q9ia/01KlBo6eBAZAhaDHREVux/Wj2VpfZS5diw19VXxj
         vDNjpYr6TZbMhW26XSq2t813s6lEACLunYqVxiWQlLI108k2fYI9D9P0ZtDLZ9TzkSrf
         NxCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741883951; x=1742488751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ffKtZZCij4vskrAA+3NvWrKzzZscOxv69bTHCnUkApM=;
        b=nuwfb3xa3dwqNfpWg69AiK5MA3NU1pIFZhIruZVqgmlp3IfB2WNl+GqHH8psiFiKo5
         70uagNNLMsmTyNNcGloA3roZdttrFHKf0UeEdb18EJqmoUoCrFthlf5oR9SrNt3d2usr
         YffCdNTXse7lVnplR57D6ZCWs6dgdOU3AygKRMJUYQvjAWZHiepGinRnqKjdpug+UVE3
         LsSgM9RABxH+wzWFYy9ngelK6/m0daRnMtbC2V1hX8yOYeLZcsKHhsMZUVAE2TrQ63zo
         OM8nt85M7cyNhHoN2acbHGu4hpXvdRg9nZ2y4R0fY5Jv9p9jB0DBNwO8WWlPBNyMPjHh
         4jag==
X-Forwarded-Encrypted: i=1; AJvYcCU7rengvZvdoy1Ne5pjlz6bUJDVskh980Umo4v6H5d4UAMvNZ7VpubU6KErR1cA12xDdwcSdCtnZT0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzUklQeYaSUwyKOurpL/Q3gfLNcKF6qJVrJ2d+g9vx1fXlbDqUn
	yFFtCXYyjr9Fv7Cqrh0V1f1UStjMR0VKoVN9Lmy2kPIR+Os6mk6GNp1QjG22uqE=
X-Gm-Gg: ASbGncuSLYWHB7qRyLIID/ddfYFphgF9+9369JgC+Eoo1YfEaPcRtF3JESZ64UpgC1J
	VsAD/QW2YAQBofYgbiQB3pZ/+62ywGk1+u5bwZevaBhEidYhypYSvLXX/itmxYcS9+FC4S/TFAJ
	/55W5/bLJ9YEgN/OLWEcYZYm8sw8xnHIcWXIP1Gm66irMFNqdw0BjSyX9XGWlf0LXAaLQuuNams
	H2oRDEkoNqNZFFKlNLGHmFnfdPAnknpyUTXXYscZRj3YdnDviwRj3uubPkreIXkvSvP7yPcR82c
	jSm2HTl07GlFVOTl1VUBgNY83AzexJ4xbnDOnNLcJvQAQefcMu+RI2I=
X-Google-Smtp-Source: AGHT+IHILZBC4XG/VXTDGPE0LXvE+Aqy8ch+S3jq5UEPqUMQPlTTQn84Hgx+UBUoAEZm2kMt8qUx5g==
X-Received: by 2002:a17:90a:e7c1:b0:2fa:137f:5c61 with SMTP id 98e67ed59e1d1-3014e843678mr320923a91.12.1741883951572;
        Thu, 13 Mar 2025 09:39:11 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org,
	Peter Xu <peterx@redhat.com>,
	alex.bennee@linaro.org,
	manos.pitsidianakis@linaro.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-ppc@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	kvm@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Weiwei Li <liwei1518@gmail.com>,
	qemu-riscv@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 00/17] make system memory API available for common code
Date: Thu, 13 Mar 2025 09:38:46 -0700
Message-Id: <20250313163903.1738581-1-pierrick.bouvier@linaro.org>
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

v4:
- rebase on top of master
  * missing include in 'codebase: prepare to remove cpu.h from exec/exec-all.h'
  * meson build conflict

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
 target/ppc/tcg-excp_helper.c        |  1 +
 target/riscv/bitmanip_helper.c      |  2 +-
 hw/xen/meson.build                  |  3 ++
 system/meson.build                  |  6 +--
 22 files changed, 193 insertions(+), 126 deletions(-)
 create mode 100644 hw/xen/xen_stubs.c

-- 
2.39.5


