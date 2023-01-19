Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D7D673B4D
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jan 2023 15:08:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481129.745824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIVZp-00030r-1X; Thu, 19 Jan 2023 14:07:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481129.745824; Thu, 19 Jan 2023 14:07:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIVZo-0002xY-Tj; Thu, 19 Jan 2023 14:07:36 +0000
Received: by outflank-mailman (input) for mailman id 481129;
 Thu, 19 Jan 2023 14:07:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qz+V=5Q=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pIVZn-0002xN-7c
 for xen-devel@lists.xenproject.org; Thu, 19 Jan 2023 14:07:35 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ea73882-9802-11ed-91b6-6bf2151ebd3b;
 Thu, 19 Jan 2023 15:07:33 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 q10-20020a1cf30a000000b003db0edfdb74so2861033wmq.1
 for <xen-devel@lists.xenproject.org>; Thu, 19 Jan 2023 06:07:33 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr. [90.112.199.53])
 by smtp.gmail.com with ESMTPSA id
 m27-20020a05600c3b1b00b003db012d49b7sm7710178wms.2.2023.01.19.06.07.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 06:07:32 -0800 (PST)
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
X-Inumbo-ID: 9ea73882-9802-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xpr2uf8npxwXpcyJBFnTtrCJsIs2f2Gz+5f3ThRTvss=;
        b=fGEadkPpLrWopmV8jAeLgieIRkOkzcOXNzVDAeFWDFU3tzfEF4oMGuISb6Qqp+3O+Y
         9GSMbsgdpCLs+7C2/saNzNF9ZGhdZTYIaZTmKi2O8NfPm/WA1O+43ynX4s+eUKvP36RC
         vondfMTSTFgVyo72kZSZLbdgEIxUt7kMg7CYijFvxlHy5GKSbNIO9+J7f+k/Q9dZBkZT
         7zLFrwpVGETpoIPCTyxxhVdc0wE4QrDTIRgCZ8ipJQ4YBDem9bcY5BRfhYoeUwi6GkWx
         3Qx2n13Q0l0g90lNhjXYS9NBJOSx5RUAiHU7IAeBDWEyMzMeGvIfjfvzlddDWfGMt2Uq
         A1zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xpr2uf8npxwXpcyJBFnTtrCJsIs2f2Gz+5f3ThRTvss=;
        b=NJj5f+pSUBjLWiUFp/XokfxdCatG/dYMl9bZyU0C8fJ6ek8PvEQZZhUaMMp6WkQASu
         hutQag1A2p9GmguWCwQbzhK9xRyIptTQmrgTR/pOE6sLvCixGNLxgY9qYDCbQv4E6kpM
         EQUzHWYigAQFqKWQXa6LL4E7C0Sc1n/QPiasfVsD/zHh585yAcfZWGB1DFUx6WwsdFg4
         iQq3TRVgKOCWCtkYQQySaFnSIRsnQzowgIscUNQhuArPtBtHHEsMrNpkVy2R9q4rkhFH
         sIJBhtJfqyKiNdFdqEhvMXnQCsuhcEvmJklSxLxCNT8Mbyg0cGraRAPJ353p+zbp51mB
         eojg==
X-Gm-Message-State: AFqh2kpDuQj3YAmyBiE2ZEK39f/t00kORRKch7bUXXHVtaQNEQN2sA+X
	z2Q7UmFT+6MMCET4vqJf8vDajh2RsRqKnbVk
X-Google-Smtp-Source: AMrXdXtRJwAkOtx/qVNfyL9WXQMOg8KfxHeU+1sAFlqO4pUmTiEZ9Kt8H7bHUzuSaqixcgVJnO49ng==
X-Received: by 2002:a7b:c4ca:0:b0:3da:17f5:57b9 with SMTP id g10-20020a7bc4ca000000b003da17f557b9mr10744380wmk.5.1674137253027;
        Thu, 19 Jan 2023 06:07:33 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v5 0/5]  Basic early_printk and smoke test implementation
Date: Thu, 19 Jan 2023 16:07:17 +0200
Message-Id: <cover.1674131459.git.oleksii.kurochko@gmail.com>
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
Changes in V5:
  - Code style fixes
  - Remove size_t from asm/types after rebase on top of the patch
    "include/types: move stddef.h-kind types to common header". [1]

    All other types were back as they are used in <xen/types.h>
  - Update <xen/early_printk.h> after rebase on top of [1] as size_t was moved from
    <asm/types.h> to <xen/types.h>
  - Remove unneeded <xen/errno.h> from sbi.c
  - Change an error message of #error in case of __riscv_cmodel_medany isn't defined
---
Changes in V4:
    - Patches "xen/riscv: introduce dummy asm/init.h" and "xen/riscv: introduce
      stack stuff" were removed from the patch series as they were merged separately
      into staging.
    - Remove "depends on RISCV*" from Kconfig.debug as Kconfig.debug is located
      in arch specific folder.
    - fix code style.
    - Add "ifdef __riscv_cmodel_medany" to early_printk.c.  
---
Changes in V3:
    - Most of "[PATCH v2 7/8] xen/riscv: print hello message from C env"
      was merged with [PATCH v2 3/6] xen/riscv: introduce stack stuff.
    - "[PATCH v2 7/8] xen/riscv: print hello message from C env" was
      merged with "[PATCH v2 6/8] xen/riscv: introduce early_printk basic
      stuff".
    - "[PATCH v2 5/8] xen/include: include <asm/types.h> in
      <xen/early_printk.h>" was removed as it has been already merged to
      mainline staging.
    - code style fixes.
---
Changes in V2:
    - update commit patches commit messages according to the mailing
      list comments
    - Remove unneeded types in <asm/types.h>
    - Introduce definition of STACK_SIZE
    - order the files alphabetically in Makefile
    - Add license to early_printk.c
    - Add RISCV_32 dependecy to config EARLY_PRINTK in Kconfig.debug
    - Move dockerfile changes to separate config and sent them as
      separate patch to mailing list.
    - Update test.yaml to wire up smoke test
---

Bobby Eshleman (1):
  xen/riscv: introduce sbi call to putchar to console

Oleksii Kurochko (4):
  xen/include: Change <asm/types.h> to <xen/types.h>
  xen/riscv: introduce asm/types.h header file
  xen/riscv: introduce early_printk basic stuff
  automation: add RISC-V smoke test

 automation/gitlab-ci/test.yaml            | 20 +++++++
 automation/scripts/qemu-smoke-riscv64.sh  | 20 +++++++
 xen/arch/riscv/Kconfig.debug              |  5 ++
 xen/arch/riscv/Makefile                   |  2 +
 xen/arch/riscv/early_printk.c             | 45 +++++++++++++++
 xen/arch/riscv/include/asm/early_printk.h | 12 ++++
 xen/arch/riscv/include/asm/sbi.h          | 34 +++++++++++
 xen/arch/riscv/include/asm/types.h        | 70 +++++++++++++++++++++++
 xen/arch/riscv/sbi.c                      | 44 ++++++++++++++
 xen/arch/riscv/setup.c                    |  4 ++
 xen/include/xen/early_printk.h            |  2 +-
 11 files changed, 257 insertions(+), 1 deletion(-)
 create mode 100755 automation/scripts/qemu-smoke-riscv64.sh
 create mode 100644 xen/arch/riscv/early_printk.c
 create mode 100644 xen/arch/riscv/include/asm/early_printk.h
 create mode 100644 xen/arch/riscv/include/asm/sbi.h
 create mode 100644 xen/arch/riscv/include/asm/types.h
 create mode 100644 xen/arch/riscv/sbi.c

-- 
2.39.0


