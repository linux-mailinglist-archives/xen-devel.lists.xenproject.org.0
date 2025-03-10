Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94157A58C30
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 07:43:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.905971.1313497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trWqu-0002ky-Kc; Mon, 10 Mar 2025 06:43:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 905971.1313497; Mon, 10 Mar 2025 06:43:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trWqu-0002Ux-7I; Mon, 10 Mar 2025 06:43:04 +0000
Received: by outflank-mailman (input) for mailman id 905971;
 Mon, 10 Mar 2025 04:59:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fu2G=V5=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1trVEJ-00070S-Lq
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 04:59:07 +0000
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [2607:f8b0:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b891409-fd6c-11ef-9898-31a8f345e629;
 Mon, 10 Mar 2025 05:58:51 +0100 (CET)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-223594b3c6dso65469345ad.2
 for <xen-devel@lists.xenproject.org>; Sun, 09 Mar 2025 21:58:51 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736d2ae318csm1708308b3a.53.2025.03.09.21.58.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Mar 2025 21:58:49 -0700 (PDT)
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
X-Inumbo-ID: 5b891409-fd6c-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741582730; x=1742187530; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CyMnY8DCOyhH4sll8UBWjGQBOdpS4N2V2sRcD5CyECM=;
        b=T5mqFkzrUgQVbUzBL0B85y3B6SqnLNGzrHsv3Bxb/R4kyBvS+USlLx0k2HscWCN2gt
         j6bEhCFCX6GUTPbTdawtKg5ufipes77/Xtgp9qN2R3IWLGAD1pnHDWKUzlpoDlBPa1jS
         9Dz8+A42USY9gBeCj2kPO4ewiGcTh7ZlnjHA5RS6VxumjazXOeCF4QCfjDZCFx+3pCW3
         fiYTEpCdm19qEfCtuotquGgTfi2O+DOSOtfmeJb/tRU6GRy4quFpSmTvxS8gDV2lub7H
         HhezNqM5520UFUilbf4QUbbA0S3BKkRgBGcaXnWqO4l+1+jn7peXCYscBVngVOECFntF
         S37A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741582730; x=1742187530;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CyMnY8DCOyhH4sll8UBWjGQBOdpS4N2V2sRcD5CyECM=;
        b=P2RlC9xV5uZTBZ6qDvwfkDxWADRsrLGvAnAxGly8e+PPg/eowyY1OkZJ0JZNT8O2xr
         Gu4C3zjVh1eiRZFUDiiWj+LCNbUgclXNFjlK6nl6HPMBhNalw0y1TY+z6UvfH/MbVJUo
         4SPDxaVLDBQ050bEyybbLkwGBoffEYexd34T0pdazsE2DGmk7N7rI7TJwQjWsAXqlali
         ZDLlsFZf9pZeRg2Ha8LeKE7a2KPN99kBPYFpGIzU0mK/8iYQ1q6KO+4FUUdjbmBH+k+B
         PGQEuuKDbSJvi3O5Pci1NOFIAlp/DJO0caqgu9cWoH/YDUmilmLXUl4bLQmuhmyorI/p
         AjRg==
X-Forwarded-Encrypted: i=1; AJvYcCVgDJ6nzhPSnf6NGu7wgKXQ1x0RQM73fzuon+DgI2ZATTP+Z17LHCtaBED6bhgFWH3V05ziNUNKv5Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyJRzmm/EGqhOLmZgGKScJZzJQ7945A+/mviOvwFnRNEIazdFf1
	sfJ65uD1DBQusQ/VYwAfxYXddadnU17VnARBgmLnSGho5TZEBznF7H2nbyl1shI=
X-Gm-Gg: ASbGncuCJUn8AptwNY/k8Ob8TCM2/uw5/OVZuxRH/cHbe8pB681WucIMhJQgFGOmPQf
	pei/mo0dI5uxEqmPeU5CZwyEFoPwyiNMpx3TN65dY1o159ydWnbRtDfiVAyOSbs+1vD0KRPYEAx
	ExeUuzKmMxaFWKjvhxmz2UTk2yTJSUrzxHxeEujj7oByc5OyWTiYceISPpJXS9UP76FKhkFKTtX
	jozcxneuJPjJ+9RBmTyLU5LJqxovdwp0wXj7qLC+FR1jhNLBpffQDBxXLndcAujhCS3dA2IEy3x
	q9I0pKneaOSvDVpJcjXivOgbNgjs2r7hl8NvwH1PLRpA10/LVz0WtXE=
X-Google-Smtp-Source: AGHT+IFBRE9vcuWy/8QGIVJH+CegCd8ZXFRntWgx7wfqbQL9hdyzkh8MEMl2t2vqfLHGN0wEW9B3Eg==
X-Received: by 2002:a05:6a00:b4e:b0:736:57cb:f2b6 with SMTP id d2e1a72fcca58-736aaa1acf0mr17943212b3a.12.1741582729877;
        Sun, 09 Mar 2025 21:58:49 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	alex.bennee@linaro.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	kvm@vger.kernel.org,
	Peter Xu <peterx@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	David Hildenbrand <david@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	manos.pitsidianakis@linaro.org,
	qemu-riscv@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 00/16] make system memory API available for common code
Date: Sun,  9 Mar 2025 21:58:26 -0700
Message-Id: <20250310045842.2650784-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The main goal of this series is to be able to call any memory ld/st function
from code that is *not* target dependent. As a positive side effect, we can
turn related system compilation units into common code.

The first 6 patches remove dependency of memory API to cpu headers and remove
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

Pierrick Bouvier (16):
  exec/memory_ldst: extract memory_ldst declarations from cpu-all.h
  exec/memory_ldst_phys: extract memory_ldst_phys declarations from
    cpu-all.h
  include: move target_words_bigendian() from tswap to bswap
  exec/memory.h: make devend_memop target agnostic
  qemu/bswap: implement {ld,st}.*_p as functions
  exec/cpu-all.h: we can now remove ld/st macros
  codebase: prepare to remove cpu.h from exec/exec-all.h
  exec/exec-all: remove dependency on cpu.h
  exec/memory-internal: remove dependency on cpu.h
  exec/ram_addr: remove dependency on cpu.h
  system/kvm: make kvm_flush_coalesced_mmio_buffer() accessible for
    common code
  exec/ram_addr: call xen_hvm_modified_memory only if xen is enabled
  hw/xen: add stubs for various functions
  system/physmem: compilation unit is now common to all targets
  system/memory: make compilation unit common
  system/ioport: make compilation unit common

 include/exec/cpu-all.h              | 52 ------------------
 include/exec/exec-all.h             |  1 -
 include/exec/memory-internal.h      |  2 -
 include/exec/memory.h               | 48 ++++++++++++++---
 include/exec/ram_addr.h             | 11 ++--
 include/exec/tswap.h                | 11 ----
 include/qemu/bswap.h                | 82 +++++++++++++++++++++++++++++
 include/system/kvm.h                |  6 +--
 include/tcg/tcg-op.h                |  1 +
 target/ppc/helper_regs.h            |  2 +
 include/exec/memory_ldst.h.inc      | 13 ++---
 include/exec/memory_ldst_phys.h.inc |  5 +-
 hw/ppc/spapr_nested.c               |  1 +
 hw/sh4/sh7750.c                     |  1 +
 hw/xen/xen_stubs.c                  | 56 ++++++++++++++++++++
 page-vary-target.c                  |  3 +-
 system/ioport.c                     |  1 -
 system/memory.c                     | 22 +++++---
 target/riscv/bitmanip_helper.c      |  1 +
 hw/xen/meson.build                  |  3 ++
 system/meson.build                  |  6 +--
 21 files changed, 225 insertions(+), 103 deletions(-)
 create mode 100644 hw/xen/xen_stubs.c

-- 
2.39.5


