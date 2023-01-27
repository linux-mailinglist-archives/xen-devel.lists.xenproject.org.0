Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BC067E397
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 12:39:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485490.752754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLN4s-0001Y0-DC; Fri, 27 Jan 2023 11:39:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485490.752754; Fri, 27 Jan 2023 11:39:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLN4s-0001VB-AJ; Fri, 27 Jan 2023 11:39:30 +0000
Received: by outflank-mailman (input) for mailman id 485490;
 Fri, 27 Jan 2023 11:39:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dhsa=5Y=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pLN4q-0001Uz-C6
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 11:39:28 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40ef7ac6-9e37-11ed-a5d9-ddcf98b90cbd;
 Fri, 27 Jan 2023 12:39:27 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 q10-20020a1cf30a000000b003db0edfdb74so5329006wmq.1
 for <xen-devel@lists.xenproject.org>; Fri, 27 Jan 2023 03:39:27 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr. [90.112.199.53])
 by smtp.gmail.com with ESMTPSA id
 x10-20020a05600c420a00b003c6b70a4d69sm3919529wmh.42.2023.01.27.03.39.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 03:39:25 -0800 (PST)
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
X-Inumbo-ID: 40ef7ac6-9e37-11ed-a5d9-ddcf98b90cbd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=93xHdobg99NHM1CBAealBqb3ezQMD/tc5tDFhGtXYqU=;
        b=YD+3oSg57fsqTmqLNx/QPsH0gMWuiIY7q+Ott6LU6odo0ENwcCR4SAAAJSy4o2JoUq
         O74X3TH3doIFvdu7n8B0e+uHZSeOEGNJXYpV6EHatl76RKUG0hoCxjbRGUTr6TwOyQlt
         KHIuNONWg5+zQKT2nXhBj64D+IlFK8OlVdoYxYfgVIhG51UR3nSFtWLSinvOyrDnCF24
         QVIJx8PM5kJ4iwOmfrC6Bfywn5IvrvqD/U0p/ku4ZqQYJ88zO7C3bwTyJ9jflKwJJUsV
         m1mLCsZcCyeRzaq4qWXr7VkY606x9bVq4wVWKOpZeLVLNOIsgmNVEqs44MTvYQ0qisae
         9eEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=93xHdobg99NHM1CBAealBqb3ezQMD/tc5tDFhGtXYqU=;
        b=Kkn2g9oJIluNU+ZgwpTxhvIMP0gkXZfyfnlAOKnpS29Eqs/bi05zbbM9FdRWFhKqGI
         Do1OJgXGV/XYTLSzbPYu3MrJpA6u4mQ+pjERBNeCjYm4RukFLewloAapPAfcw8KZg6du
         SaLQ6d+IhqOGklwRRaHRlxSOTD9CXPa/21eZfOVyukuHKPRt4fG8snl34QdeWvONRF0l
         E20GWqm+Zkib2ZEZ9cbI5E8rvfINsgBJLb3CDI4WgrEihWOoIOmTlIFfeVBToWyQaDhP
         AUA3xwzYTZQPU8I1eC1vKtgct6hJzk5pdezzoXFjPyTvh8cWsku4dh8QWXJ4PZPFw3st
         HVng==
X-Gm-Message-State: AFqh2kpM2ZR2RJ1EtKuQ6dNht1VXOn9sRVY2bP/t4qqZRmD7IIeK1gnh
	b0hU0GgvR4/mJmAVtoW4vl78wkXeDbg=
X-Google-Smtp-Source: AMrXdXsIYjHN7H9ZA+TDIJLR8oocWmd64DZrSW8Hp8H3UKmsOpUzXNREi3DRKipbdGtWU5rE5QCm4w==
X-Received: by 2002:a05:600c:1e1d:b0:3cf:674a:aefe with SMTP id ay29-20020a05600c1e1d00b003cf674aaefemr38575760wmb.22.1674819566250;
        Fri, 27 Jan 2023 03:39:26 -0800 (PST)
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
Subject: [PATCH v7 0/2] Basic early_printk and smoke test implementation
Date: Fri, 27 Jan 2023 13:39:13 +0200
Message-Id: <cover.1674819203.git.oleksii.kurochko@gmail.com>
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
Changes in V7:
  - Fix dependecy for qemu-smoke-riscv64-gcc job
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


