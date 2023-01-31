Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CB3682B4F
	for <lists+xen-devel@lfdr.de>; Tue, 31 Jan 2023 12:18:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487532.755183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMoeM-0007ev-4G; Tue, 31 Jan 2023 11:18:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487532.755183; Tue, 31 Jan 2023 11:18:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMoeM-0007cd-15; Tue, 31 Jan 2023 11:18:06 +0000
Received: by outflank-mailman (input) for mailman id 487532;
 Tue, 31 Jan 2023 11:18:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0fq0=54=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pMoeJ-0007cK-SS
 for xen-devel@lists.xenproject.org; Tue, 31 Jan 2023 11:18:03 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec182ecf-a158-11ed-b63b-5f92e7d2e73a;
 Tue, 31 Jan 2023 12:18:01 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id qw12so24657339ejc.2
 for <xen-devel@lists.xenproject.org>; Tue, 31 Jan 2023 03:18:01 -0800 (PST)
Received: from pc-879.home (83.29.147.144.ipv4.supernova.orange.pl.
 [83.29.147.144]) by smtp.gmail.com with ESMTPSA id
 ov9-20020a170906fc0900b0087bdae9a1ebsm6712058ejb.94.2023.01.31.03.17.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 03:17:59 -0800 (PST)
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
X-Inumbo-ID: ec182ecf-a158-11ed-b63b-5f92e7d2e73a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GEm/QtivQA3wincGDxWw4an3Uc5tv8Gv005JVo7FJtA=;
        b=dVYFJyGIczdKXDLKHNNwI0E588m3OFaIT3tAJgrpzi9Igin28ui2RP7uTWIL33LRpK
         HU6LTHg5AvKPR+is88rSC7eAZKks2ncEWFp4iQ/YU974sGkvLCapydUXNwYXRZIS1lAK
         CTsZRLlvd4aZDCkD/aEf/m8+pXB06ERVfKoYGrQfhglTYHXM5rHRqitsEoMjmI21+aI+
         P1rGfe4TCuiD6hnmNw7xXTfK5rNin4XZ9gwxlRz1Dgw6E4SZGCqnEsskSk9T4LDMl2Mx
         Isi+V0+tdzpHNJatsbtmZ6VaaK2cAoaek2ukiaSX9ZmR0TJgQMAYsUzDv7DYSlGBr6dl
         Ojxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GEm/QtivQA3wincGDxWw4an3Uc5tv8Gv005JVo7FJtA=;
        b=K0rAVD9FlSYWWp5gAdHaZUfCJQM7ElibS7w2tp70ZDreRKYx04sK7beW2zErHHvj2u
         rJ5f+O2Yi6W7TgwAwiJyxSWstmVBIEavwUZSBEvFgAk7Rgh22J0S3tB0VwI2bGK7w82c
         ooljuJjCRpeft/2OONXQp9jwQEt/IKwYtENA3IpWZZKk/M4XoGZ3uEqyJ1cMB4DUNZ2N
         tLvzMcGSfcIHBZeQOxZ4TDeQbxqMH4csYzVAdZEuPsgyjMB08VeXBZfnHKJHflmJh2rD
         dkMgn37uJBKBykYIZDvIXrTZoU1Rct0yNwByJl3XpktN+VgbZR4Tos66RNgrqUvYsL51
         Ugqw==
X-Gm-Message-State: AFqh2kqFf32eF/E/qgbnTqfJNwQ2qO3pPZ1VqLivZeCX6ZZvt/PjeCnQ
	yI2X86tOy4E79oSUq7abVfowDHWkIW8=
X-Google-Smtp-Source: AMrXdXu3PY9LdnLt1HtquurHr6+C0kxfF6ouffDQ9Sbft7KapmplR8oN8XHvBg3GJmGx5o9IT0gfSg==
X-Received: by 2002:a17:906:c283:b0:86a:833d:e7d8 with SMTP id r3-20020a170906c28300b0086a833de7d8mr54335180ejz.17.1675163880154;
        Tue, 31 Jan 2023 03:18:00 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v8 0/2] Basic early_printk and smoke test implementation
Date: Tue, 31 Jan 2023 13:17:53 +0200
Message-Id: <cover.1675163330.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch series introduces the following:
- the minimal set of headers and changes inside them.
- SBI (RISC-V Supervisor Binary Interface) things necessary for basic
  early_printk implementation.
- things needed to set up the stack.
- early_printk() function to print only strings.
- RISC-V smoke test which checks if  "Hello from C env" message is
  present in serial.tmp

The patch series is rebased on top of the patch "include/types: move
stddef.h-kind types to common header" [1]

[1] https://lore.kernel.org/xen-devel/5a0a9e2a-c116-21b5-8081-db75fe4178d7@suse.com/

---
Changes in V8:
 - Set "needs: archlinux-current-gcc-riscv64-debug" in test.yaml
   for RISCV job as CONFIG_EARLY_PRINTK is available only when
   CONFIG_DEBUG is available.
---
Changes in V7:
 - Fix dependecy for qemu-smoke-riscv64-gcc job
---
Changes in V6:
 - Rename container name in test.yaml for .qemu-riscv64.
---
Changes in V5:
  - Nothing changed
---
Changes in V4:
  - Nothing changed
---
Changes in V3:
  - Nothing changed
  - All mentioned comments by Stefano in Xen mailing list will be
    fixed as a separate patch out of this patch series.
---

Oleksii Kurochko (2):
  xen/riscv: introduce early_printk basic stuff
  automation: add RISC-V smoke test

 automation/gitlab-ci/test.yaml            | 20 ++++++++++++++
 automation/scripts/qemu-smoke-riscv64.sh  | 20 ++++++++++++++
 xen/arch/riscv/Kconfig.debug              |  5 ++++
 xen/arch/riscv/Makefile                   |  1 +
 xen/arch/riscv/early_printk.c             | 33 +++++++++++++++++++++++
 xen/arch/riscv/include/asm/early_printk.h | 12 +++++++++
 xen/arch/riscv/setup.c                    |  4 +++
 7 files changed, 95 insertions(+)
 create mode 100755 automation/scripts/qemu-smoke-riscv64.sh
 create mode 100644 xen/arch/riscv/early_printk.c
 create mode 100644 xen/arch/riscv/include/asm/early_printk.h

-- 
2.39.0


