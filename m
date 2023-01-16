Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C9966C261
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 15:39:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478687.742052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHQeG-0007HP-1p; Mon, 16 Jan 2023 14:39:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478687.742052; Mon, 16 Jan 2023 14:39:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHQeF-0007EP-V9; Mon, 16 Jan 2023 14:39:43 +0000
Received: by outflank-mailman (input) for mailman id 478687;
 Mon, 16 Jan 2023 14:39:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fQBk=5N=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pHQeE-0006p7-7J
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 14:39:42 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c3b18c8-95ab-11ed-91b6-6bf2151ebd3b;
 Mon, 16 Jan 2023 15:39:41 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id b5so6514212wrn.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Jan 2023 06:39:41 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr. [90.112.199.53])
 by smtp.gmail.com with ESMTPSA id
 m13-20020adfe94d000000b002714b3d2348sm26543406wrn.25.2023.01.16.06.39.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 06:39:40 -0800 (PST)
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
X-Inumbo-ID: 9c3b18c8-95ab-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aBZQnz4OW8tkz12qH7i/lg43hEmXqjuUvrMmu6ORg7s=;
        b=E03jcfzb97n8CNYtCugxiyQBH8BoE+MGGHugTO4YW9E5stDPbiv5+WQHcbclBpFhpX
         3lqvMtSAooiLKmoZi2bYseizcbk0bpuXvUYkdj1j0Jbqtm/gcaeFbJH7aAFIGKHAlLy0
         9O1NOYK/JcAopliuS298RT8Cgf4SUxzV0+QdaejlbxKlmS2jAh0iDIPkuVlxqja2V2pS
         zphEGhy0jXA/5PkX6QbhfCIFYvqBVFdC3Bvv+imMFswtKOdos8hsgpzVUrBZ33x1G5E7
         kBQKoMQ5WbslBG6bDAGbZDRcEZ5MADIdotW+VZEBx0KVmejNWfOAY6GIdNzkXzdK6XNP
         E6mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aBZQnz4OW8tkz12qH7i/lg43hEmXqjuUvrMmu6ORg7s=;
        b=wTyn8gDodKYgM4l+R25X5ycskgjM9T6fx2C86RFrldK/jOC3tf194Xx3YcM7XfJR2o
         GPQP/4VZPnlmWpqpM4ck/e3ySYkFLOJwpZb/XyCdoeLa0ic3I9YebakxfVj83aLzBpIO
         1KkANwFWki812STatVGG7z6sUb2U6+/d7mHuXAJnFqMYgjRtXssKh08IwPaR2vXg2/xQ
         +WJo789YPINC63QkbcCII1w0ELEyVFVH9lBaLYRDQiqU+rkLWHEVNFNe9AjaGzxJYyqQ
         ThL5h5x5x0pd+RdVfaq4nUb3QQPEdLpPl0/TlsiKCP+XmmZJxt8BdUy4sTc/NqKHEhru
         tFeg==
X-Gm-Message-State: AFqh2krORt7Ik+px36826QAYsveGyyBTs/O7hAZTZ7XszuFULTNQt/cw
	sRXRIBZKFuVZaYsyVyCTJvAzk/8DBjGmCQ==
X-Google-Smtp-Source: AMrXdXsoS07ykbSfghKT2t9ZmXHf738/KZleqti/mvoBBFR32Y5TwSK07k40Yqep2ZxrZRnOpJKm5w==
X-Received: by 2002:a5d:480f:0:b0:2bd:bc57:3c5b with SMTP id l15-20020a5d480f000000b002bdbc573c5bmr15387306wrq.33.1673879980409;
        Mon, 16 Jan 2023 06:39:40 -0800 (PST)
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
Subject: [PATCH v4 0/4] The patch series introduces the following:
Date: Mon, 16 Jan 2023 16:39:28 +0200
Message-Id: <cover.1673877778.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

Oleksii Kurochko (3):
  xen/riscv: introduce asm/types.h header file
  xen/riscv: introduce early_printk basic stuff
  automation: add RISC-V smoke test

 automation/gitlab-ci/test.yaml            | 20 ++++++++++
 automation/scripts/qemu-smoke-riscv64.sh  | 20 ++++++++++
 xen/arch/riscv/Kconfig.debug              |  6 +++
 xen/arch/riscv/Makefile                   |  2 +
 xen/arch/riscv/early_printk.c             | 45 +++++++++++++++++++++++
 xen/arch/riscv/include/asm/early_printk.h | 12 ++++++
 xen/arch/riscv/include/asm/sbi.h          | 34 +++++++++++++++++
 xen/arch/riscv/include/asm/types.h        | 43 ++++++++++++++++++++++
 xen/arch/riscv/sbi.c                      | 45 +++++++++++++++++++++++
 xen/arch/riscv/setup.c                    |  6 ++-
 10 files changed, 232 insertions(+), 1 deletion(-)
 create mode 100755 automation/scripts/qemu-smoke-riscv64.sh
 create mode 100644 xen/arch/riscv/early_printk.c
 create mode 100644 xen/arch/riscv/include/asm/early_printk.h
 create mode 100644 xen/arch/riscv/include/asm/sbi.h
 create mode 100644 xen/arch/riscv/include/asm/types.h
 create mode 100644 xen/arch/riscv/sbi.c

-- 
2.39.0


