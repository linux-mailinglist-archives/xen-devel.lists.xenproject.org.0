Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE7267E2E5
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 12:15:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485448.752673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLMhk-0003A4-No; Fri, 27 Jan 2023 11:15:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485448.752673; Fri, 27 Jan 2023 11:15:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLMhk-00037g-Kt; Fri, 27 Jan 2023 11:15:36 +0000
Received: by outflank-mailman (input) for mailman id 485448;
 Fri, 27 Jan 2023 11:15:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dhsa=5Y=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pLMhj-00037V-BA
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 11:15:35 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea36d1b5-9e33-11ed-b8d1-410ff93cb8f0;
 Fri, 27 Jan 2023 12:15:33 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id n7so4662194wrx.5
 for <xen-devel@lists.xenproject.org>; Fri, 27 Jan 2023 03:15:33 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr. [90.112.199.53])
 by smtp.gmail.com with ESMTPSA id
 b11-20020adfd1cb000000b002bcaa47bf78sm4106257wrd.26.2023.01.27.03.15.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 03:15:31 -0800 (PST)
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
X-Inumbo-ID: ea36d1b5-9e33-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lz2mgXwLTWCl1I59Rv0my1BKuIzJqIzO3ZVsL2+1V3g=;
        b=EBzFA1lfLpj+CHt+fMqPJJwwyeFRVuZPU+o96w3rFK42jo8UIUoyDwlBpjyFQGIVzT
         N6RRzuXGwxUxA9VXiWAjWSpzoXvhVWxMEH6Fs0/YWVdTgxJrHMrDBrfCE1Lx3bGuM3iM
         my9t5wRbgSPIyI11SEtgokeJRsXM1n812yZy7i6RvkQ6gj4fJq2ST/GQHFOPw/3RrHmU
         FHhwOveIOFJeaPcJXqQVM2j/QV/lm7PPogUoox5XRJm2Lq9wLANURHpNfbYKuXfjB9tI
         IKaBVLtENmhk6ruSjkKmR/yR6EWGE2rmBD1xESx1oA3f38NXrbo6Gk2bFnyPNY2CbtxG
         sQSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lz2mgXwLTWCl1I59Rv0my1BKuIzJqIzO3ZVsL2+1V3g=;
        b=77JICDworXjO6K94OGSYex1RIy6fqedyg584mbNnIgTRoa4hRkXcjCJK9WTcPcLb5v
         q+820RBY0xibpRu5rGdB89K1iZ17FnjGwuDAz/Qw4Y53eOeFqCVgx0izOFm6IhinFW+G
         54ITAalxMZ69YPyO5MDSfwXcnpMJHSyovlShRGL4wmKx9XfgdUTlS6B55mjucLBRs0Ff
         rxiOfr0lCPm+5Jhq31JO4/KSQMxtSy3YRVFPtoi02Fq7sOmwt+MvDV8MkmAqF/Yy6Zh/
         KJoU8ldyJ1TOdhcpnV5ha0/RN3Q8rYWiOXaBzH1Hydgge0+iEu3e3KGSgxB6Y/2/Xg/k
         UGZw==
X-Gm-Message-State: AFqh2korccWzJ9QgwxktWtvMNdx5p4Sud/Yex38kNc1ks5S6JGKz0dKB
	nlFcNXoiXUAvygamdufaNjtrBdrzsIo=
X-Google-Smtp-Source: AMrXdXuUW7BN9obL7kxRsNDFyUvor/T96MarEA3quMv8bQxI5AXuimX9cT8H/1It8OdW8fJFp3jeow==
X-Received: by 2002:a05:6000:98d:b0:2a5:6244:329e with SMTP id by13-20020a056000098d00b002a56244329emr32912973wrb.40.1674818132029;
        Fri, 27 Jan 2023 03:15:32 -0800 (PST)
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
Subject: [PATCH v6 0/2]  Basic early_printk and smoke test implementation
Date: Fri, 27 Jan 2023 13:15:22 +0200
Message-Id: <cover.1674816429.git.oleksii.kurochko@gmail.com>
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
Changes in V6:
  - Remove patches that were merged to upstream:
      * xen/include: Change <asm/types.h> to <xen/types.h>
      * xen/riscv: introduce asm/types.h header file
      * xen/riscv: introduce sbi call to putchar to console
  - Remove __riscv_cmodel_medany check from early_printk.C
  - Rename container name in test.yaml for .qemu-riscv64.
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


