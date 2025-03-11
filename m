Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CF7A5B7C7
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 05:09:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907035.1314408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trqvn-0003uS-Mi; Tue, 11 Mar 2025 04:09:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907035.1314408; Tue, 11 Mar 2025 04:09:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trqvn-0003pX-D7; Tue, 11 Mar 2025 04:09:27 +0000
Received: by outflank-mailman (input) for mailman id 907035;
 Tue, 11 Mar 2025 04:09:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EQfW=V6=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1trqvl-0003IE-Iv
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 04:09:25 +0000
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [2607:f8b0:4864:20::102f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e488d0a-fe2e-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 05:08:59 +0100 (CET)
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-2ff799d99dcso8268249a91.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Mar 2025 21:08:58 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af28c0339cesm7324454a12.46.2025.03.10.21.08.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 21:08:57 -0700 (PDT)
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
X-Inumbo-ID: 8e488d0a-fe2e-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741666137; x=1742270937; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fGerXdOtIw0WsOiLQfJLVuAEuZhGly95KD3uNgEzFEA=;
        b=Czhpi/b55ovB++NP2xxeJf3Z1b3ttdHtpoZxJInZPLeyYzl9yx55Zf42ubt7x0otSl
         VxTjH4SbcAvN77ST/lfhvCqDjRZVRwFNE56c9Td78lvX6ycq0PiY1pifiBKVe75P/cIk
         xm/nojuWldIHR5cjG06GiUy4F5HW5mMpyU0uVKqqdRzRICfY2b6jSPuzQ4Xtwf6dnqIz
         9oFsI2jqVUgKrjL6l21A4arObhL7XHSGBO7zJN+P78dCZSfHs2aQSNk1RCtGltcQPfPt
         qMaxJqINLzn9X5GFqpgA3rISPVMg1gt1p6oy6T/zlnRBvlApnA56gZVGduf0kda7sIyD
         Adxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741666137; x=1742270937;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fGerXdOtIw0WsOiLQfJLVuAEuZhGly95KD3uNgEzFEA=;
        b=wi+VsxKd060656hIygWDyvQMx5iJ7qYnfhx4+HitRvkQ78CYy6g/UxYMLHILppJd1M
         56ketPT/nWQqeLL40W6roF8leWZWqmlNwIJkcM7JaGsO9rPKGTgXhD9uq5aV5WUyk6QM
         NWGW/k9DWpQLR0fcrcLnNg/TaUx3FmkV5s9/bWZaenCSZ7H7oi2MWD3C2upIeGPJRk3+
         m0AEgPaW8iZnieWMUE2LQnHSVByW4w9r539jmG8sxmj1hTpZqHKHTppT0HzCk/+ZaT6k
         3NJG71UH2Pv69/o8Q3XKBaZduzx4VYHYcDZbCktbAGH9eyIrbXbJcohb2O/DEuIbUNNl
         8B0w==
X-Forwarded-Encrypted: i=1; AJvYcCWNO9cAb4pI7NttlxTo8akO8maoiO0ThM4yzPV6pIQAmMdqWTBokYVyDf4SQSMEXxpQNHscWEgyohs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw6O7oivwjLNaOuKSPaSUK/HmEAtJRTUD/eXpfJ/1qW4nMcn9QB
	U9nIob5n31uEqhMkHmSqhxP7llSnSgYttiXKD1ce3EMArnRuBzp9A9CAxknVfIQ=
X-Gm-Gg: ASbGnct6nn0Cmmxg2fePLt9R0uKoGievf7t7yU+DcAAAGUcbw49rWSts4yoAKdQwgVZ
	Qk0HvkJ7hTVX48nika8Bx8qpyTLH7qCCrb7AyihdHaOhXrthL1DPmZdILJN5KAboePZpJUsx9zQ
	QqZlqO680XEHpx+71pX35ljyhk1VyxAXuKTmL1DLj3M+1WFlbYvYNG0mZQv+07sszv7/SxNhKLS
	Y0a92OQhHzM4UTpUDnGt9wsFTAh7G+1O357KVpEqmkNDwfEhdeQ0W+pGmp+9ca205TIisUxifNY
	o3P9k6MRVqoYZg9jd6gTqlnQI0itISxi0qPzZh1GkyHJ
X-Google-Smtp-Source: AGHT+IGXMO59GO84wcQfdotD1ICTUfqb/mJe9bhBOPtOn//E28HwyLyMnn+hwaJcsHLDf6vigaP+aw==
X-Received: by 2002:a05:6a21:730e:b0:1f5:64fd:68ea with SMTP id adf61e73a8af0-1f564fd6a98mr15013110637.4.1741666137431;
        Mon, 10 Mar 2025 21:08:57 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	David Hildenbrand <david@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	xen-devel@lists.xenproject.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Xu <peterx@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	alex.bennee@linaro.org,
	qemu-riscv@nongnu.org,
	manos.pitsidianakis@linaro.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 00/16] make system memory API available for common code
Date: Mon, 10 Mar 2025 21:08:22 -0700
Message-Id: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
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

Pierrick Bouvier (16):
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
  system/memory: make compilation unit common
  system/ioport: make compilation unit common

 include/exec/cpu-all.h              | 66 -----------------------
 include/exec/exec-all.h             |  1 -
 include/exec/memory-internal.h      |  2 -
 include/exec/memory.h               | 34 +++++++-----
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
 21 files changed, 184 insertions(+), 119 deletions(-)
 create mode 100644 hw/xen/xen_stubs.c

-- 
2.39.5


