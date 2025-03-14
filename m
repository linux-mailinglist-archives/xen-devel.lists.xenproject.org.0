Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C20A617AE
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 18:31:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914966.1320602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt8sy-0002vz-JL; Fri, 14 Mar 2025 17:31:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914966.1320602; Fri, 14 Mar 2025 17:31:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt8sy-0002ty-Bx; Fri, 14 Mar 2025 17:31:52 +0000
Received: by outflank-mailman (input) for mailman id 914966;
 Fri, 14 Mar 2025 17:31:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zh9v=WB=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1tt8sx-0000xy-0L
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 17:31:51 +0000
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [2607:f8b0:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 337c03ed-00fa-11f0-9899-31a8f345e629;
 Fri, 14 Mar 2025 18:31:46 +0100 (CET)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-223959039f4so52138005ad.3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 10:31:46 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af56e9cd03bsm2990529a12.8.2025.03.14.10.31.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 10:31:44 -0700 (PDT)
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
X-Inumbo-ID: 337c03ed-00fa-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741973505; x=1742578305; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mbx4XaRe0fsea/1JxsaLA7ueH0t1s6VZZ5QhNdIFgD0=;
        b=jKSZCF2wdCaFgTLm+vOnxxAhqQVeOrl+Y58K8zfhZaT6HH1VkYo9bH+ZeSM6hev18e
         JUo/TNnyNAfIMXEYbKFbm0z4BTeykKnBSou7HhhazGeJ3ZW/wWaoKTWIhOLqMiGVVlYh
         6W1sFFSf1CWzpgqBkfNMdNTgmQYWpbr/q8v8OMjfkT5ougO0ukbqc37q0guBr7mJBwwZ
         Ec1u4aTf7EahhVGj3dRcKSp/8IlvaOqe1QeoRDB+Afzr9mJfTtkT7AQEnrhV6oSbQiLc
         aXzhagiUNx356LqOgHAM6tSgqXy1U2ztL8ZWfsLhr4HpOghjQSaPcQCzfka0bxJiqWe8
         uOpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741973505; x=1742578305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mbx4XaRe0fsea/1JxsaLA7ueH0t1s6VZZ5QhNdIFgD0=;
        b=TLCa6tqNi+iFqcIQSG6JZ28tGaO6JN12lPTgGlEMH8K6W2k4qPPE1dWx2p2JeMVQ1f
         9CCo9PEMwS+/ujl5fUn878K0687g95Spm/zkwFgHdVVDGsgh1fJPOA3R7i4DXD/KIX2l
         CBEye2521p8/n+50LmqzKIFnQagt3lpd+luSTxxNVYZ90YbfF1CL+u8oTAiyQaMT4Wcq
         mEcFFzA2sRFbEHGx0DoKFD+KnNRM4WSITOzXkt9l26w3MziJQ153FTcUG37jpvpH60H1
         DA71pIDnmhZN9IYD3PPhAcBy9AA4ZxE8O8jT0ylm3smAcL04FzS7QqITp89uaY6lpCZq
         +eGg==
X-Forwarded-Encrypted: i=1; AJvYcCX4gRgD/nBGq9jk/7FS31Xqm3k78auX5+drOhrbeeh/MkUUrhZr9EkJ6dexdmrp5AVZ0GvFvF68inc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyEsh9/YSYlIsqLabcXDHayVDAYd+VdjZrwWOOAE7gYGGH1wTbK
	r4kMwcikRBHpbN+4TQt9JhpC8d5L05xRe+ZmlntojmZWBidIM1pZRnKbKpI+nxI=
X-Gm-Gg: ASbGncsBKX6swe2uMjGYXBO/6hDNO3EZenklTKhw6m4nn6m3PHp7YsErlIMn4ToKrP3
	R5CiFFG2K0gf6Jmcb7gJmeI8ayWvv8xPOAtMlw78KcsAk97Srob5fCcvk+cDN8v6ccEpc2Y/KT4
	J/2kWLguiD/oKYY96Zciafu2pWKRKAErmF70DHKZvNaoOkyPzxbq0DYBusN27NYPJhyn4Yw8169
	LBNrQa2ViaI1CVjiMMRJPn8VyPE4rN2y3eIb7UeabBTsBR5p1IlwvXVzdG3VygGqRjGduGMXMLK
	gUPayVVU3KAQsopTQPLXSZBWGKPcEvjXf6L2m8ZV9CiW
X-Google-Smtp-Source: AGHT+IG45qOt2dgsJDV7nujhL0kdPo+5GKsExuYeufblXdBnsz6vqmVVLVscbpfExXfMyu2MvPKFvA==
X-Received: by 2002:a05:6a00:a1f:b0:732:5164:3cc with SMTP id d2e1a72fcca58-737223e7399mr3832223b3a.19.1741973504748;
        Fri, 14 Mar 2025 10:31:44 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Paul Durrant <paul@xen.org>,
	Peter Xu <peterx@redhat.com>,
	alex.bennee@linaro.org,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	David Hildenbrand <david@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	qemu-riscv@nongnu.org,
	manos.pitsidianakis@linaro.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anthony PERARD <anthony@xenproject.org>,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 00/17] make system memory API available for common code
Date: Fri, 14 Mar 2025 10:31:22 -0700
Message-Id: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
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

v5:
- remove extra xen stub xen_invalidate_map_cache()
- edit xen stubs commit message

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
 hw/xen/xen_stubs.c                  | 51 ++++++++++++++++++
 page-vary-target.c                  |  2 +-
 system/ioport.c                     |  1 -
 system/memory.c                     | 17 ++----
 target/ppc/tcg-excp_helper.c        |  1 +
 target/riscv/bitmanip_helper.c      |  2 +-
 hw/xen/meson.build                  |  3 ++
 system/meson.build                  |  6 +--
 22 files changed, 188 insertions(+), 126 deletions(-)
 create mode 100644 hw/xen/xen_stubs.c

-- 
2.39.5


