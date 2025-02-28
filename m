Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5128A4A382
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2025 21:08:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.899108.1307545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to6ea-0005tH-3i; Fri, 28 Feb 2025 20:08:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 899108.1307545; Fri, 28 Feb 2025 20:08:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to6ea-0005ql-13; Fri, 28 Feb 2025 20:08:12 +0000
Received: by outflank-mailman (input) for mailman id 899108;
 Fri, 28 Feb 2025 20:08:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2kAP=VT=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1to6eZ-0005OT-8P
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2025 20:08:11 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb1a4746-f60f-11ef-9898-31a8f345e629;
 Fri, 28 Feb 2025 21:08:09 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-abbb12bea54so465324366b.0
 for <xen-devel@lists.xenproject.org>; Fri, 28 Feb 2025 12:08:09 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf1d1a84b7sm267586566b.19.2025.02.28.12.08.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2025 12:08:08 -0800 (PST)
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
X-Inumbo-ID: bb1a4746-f60f-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740773289; x=1741378089; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TJ+oN53hfxQTn5Nt8nerxsJsdoEiF0OiX6DvICjw7HY=;
        b=bCxZd9cJtRLRouzMs0foyxRTPUZm3ILBKuWnP4W9/1DxWy2O4JjM1SRCx0KQJCGr0N
         XFn+2ksbmbCz7FrwDpW+QtjAmmimaYAKePW5pWulJ4+BxsGZby+3U0HsiWmukRff5mmP
         X3FFJSG68xNhfc2iIG91/B2tzttkkjze6W4byShPU3LaRh5Zszg9GnUbwOWi9RYNfS5s
         p++ViXXqPEvbrTg8VyU+Yu2u06Ms8dg3+zxpNSutkZWZmgUciiUR7YE1QRq1cXdR6Mm4
         KqlwGwOWRI+MupN0ipefjqVn8oOw+vjkIFu6qXIXmtVIjdSvb0ub5Dwqo5yT9OndCiVY
         pV5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740773289; x=1741378089;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TJ+oN53hfxQTn5Nt8nerxsJsdoEiF0OiX6DvICjw7HY=;
        b=jUUuU0L6qNnNnTZN61f8QtFvqTgcbpK+e9sRCP03isJLWyf8MgFJ5TybnXCHWAhMDG
         ma5Cq0cBt7rk/mvuvs2tpbfJWK6xUymR0eUccqwOcYx/stJlmip7+yXB8CHBBV3SRcnH
         NK1YvHwjeZWrnrQckkjfPAlMI/rz+mfwahxvbxvaP6YjGDIR7JdnFAydNx0Q2XKqeHvk
         ozTs+tPVeyn0O2jtrtB83GHP4At3oYa7ceseUIHmGOn3aYKjCzgKfqgANv2PA/Mxtycf
         dTetFTBnvRRSAbW/K9H7atigAhoM6IrKXUE9YpHGVPbtT/GoLV4eImcqN8NkHUIQpT1I
         ZF6A==
X-Gm-Message-State: AOJu0YyVN7xHICdqLrKlaJA/orK8yv+qUzMCv9io2BbF//mQhAbGUYlX
	GnlzoTdonlz7J25ZbZWwewmFJkL9Vg6ClZpSLWdzYo0dr1Ur76shBKtKUw==
X-Gm-Gg: ASbGncuQsU7I5lhJmlIoYKHM6ttRMlGrH8zlCpSDVh8/vwZsTOqaSw1yI7ftv9PoEus
	k4okVwHoL2XIUUjvt96BTF0NcwKYXSen+arkDenxEeDTCAIzfB+rpnQz02wtazOWlGoJVxu+xBY
	BehfdTNhG2ITjhvG1A3xo+T1p/NtLyBi7tMMmD/JjT/xEnxFLeBEj1CjP0xmAvU3FHgu57iKW2M
	ZGPraJWtNrq9+RISB4f3krbIPwLFl7OA9iFBximP8ouWdYtWwKzxhlnCjcyNFZYx4RA2PSi7PnG
	pSGpEnNquhcdDk20zh5HwMgku/c=
X-Google-Smtp-Source: AGHT+IHVEHhodg+shrekfdRcDxf0itq30YrSaYPgFZKlDk74rGNUaQ6H3np9wOgokQhCZvYrYJdccw==
X-Received: by 2002:a17:907:7210:b0:ab6:f789:6668 with SMTP id a640c23a62f3a-abf25fda834mr496051166b.17.1740773288746;
        Fri, 28 Feb 2025 12:08:08 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Doug Goldstein <cardoe@cardoe.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v8 0/6] RISC-V runtime detection of extenstions
Date: Fri, 28 Feb 2025 21:07:38 +0100
Message-ID: <cover.1740764258.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Based on riscv,isa property of device tree file parse extenstions which are
available in CPU.

As a part of this feature, drop CONFIG_RISCV_ISA_RV64G and explicitly use
extensions 'i', 'm', 'a', 'zicsr', 'zifencei' as they are necessary for a work
if Xen and it should be true not only for RISC-V 64 (but also for 32 and 128)

---
Changes in v8:
 - Add patch from Andrew which use Zbb to provide arch-optimised bitops
   as in this patch series we made zbb mandatory.
 - Other changes are patch specific please look at specific patch
---

Andrew Cooper (1):
  RISCV/bitops: Use Zbb to provide arch-optimised bitops

Oleksii Kurochko (5):
  xen/README: add compiler and binutils versions for RISCV-64
  automation: drop debian:11-riscv64 container
  xen/riscv: drop CONFIG_RISCV_ISA_RV64G
  xen/riscv: make zbb as mandatory
  xen/riscv: identify specific ISA supported by cpu

 README                                  |   3 +
 automation/gitlab-ci/build.yaml         |  14 -
 automation/scripts/containerize         |   1 -
 xen/arch/riscv/Kconfig                  |  18 -
 xen/arch/riscv/Makefile                 |   1 +
 xen/arch/riscv/arch.mk                  |  13 +-
 xen/arch/riscv/cpufeature.c             | 504 ++++++++++++++++++++++++
 xen/arch/riscv/include/asm/bitops.h     |   7 +
 xen/arch/riscv/include/asm/cmpxchg.h    |  15 +-
 xen/arch/riscv/include/asm/config.h     |   4 +
 xen/arch/riscv/include/asm/cpufeature.h |  59 +++
 xen/arch/riscv/setup.c                  |   3 +
 12 files changed, 588 insertions(+), 54 deletions(-)
 create mode 100644 xen/arch/riscv/cpufeature.c
 create mode 100644 xen/arch/riscv/include/asm/cpufeature.h

-- 
2.48.1


