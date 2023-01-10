Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB4C664466
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 16:18:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474741.736054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFGO8-0005JR-O1; Tue, 10 Jan 2023 15:18:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474741.736054; Tue, 10 Jan 2023 15:18:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFGO8-0005GE-KI; Tue, 10 Jan 2023 15:18:08 +0000
Received: by outflank-mailman (input) for mailman id 474741;
 Tue, 10 Jan 2023 15:18:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ek+I=5H=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pFGO6-0005Fu-Jq
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 15:18:06 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa8d639d-90f9-11ed-b8d0-410ff93cb8f0;
 Tue, 10 Jan 2023 16:18:04 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id m6so18936872lfj.11
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jan 2023 07:18:04 -0800 (PST)
Received: from fedora.. ([195.234.76.149]) by smtp.gmail.com with ESMTPSA id
 y19-20020a0565123f1300b00498fc3d4cfdsm2203396lfa.189.2023.01.10.07.18.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 07:18:03 -0800 (PST)
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
X-Inumbo-ID: fa8d639d-90f9-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YBsjKUp8Q0MJVa4U8jLERfOVLa8Dy11fP2YftT+HK8o=;
        b=kq/zQiOkycbQd2vJsbKmXLcsas+LrxbnyQrtti3+ZDmfMEZMkEWAGYSZN8yPXmTKUZ
         AQQ3E36PmaXQWHSzjpKqRaplR2iVAw8JkJHRnjXhnt3glv1pX4SltIBZJuTO3hMNHBu8
         bmOpy0E5keYh74mqjJzuiPVZA5elE1E9ToloXjt+VJt21ax86XZDbIaDp0aHp+VXtuHK
         uEW7GaGMn9maChekZ4CvlXtFl34uEQ+iwRdhFuwJScWBUws6219KwhImILBu2HLTRnVy
         8g3KoGY7M77bUEO/f+WuHcelqExclqk+++fylbW3z8LOyZ+faIcLbrKmkXvzZH7/TdcE
         rKRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YBsjKUp8Q0MJVa4U8jLERfOVLa8Dy11fP2YftT+HK8o=;
        b=22Lhz3XcryslhVXCJq4dBhyTMw/aqyZHvZLgvaxCOWC1oX/WndsbNH9XVl26Am6oln
         mOeJtqIZzZNfJWWe6txm1PIB25ibMCsWJP3WXzS7XVSlSFFF+/uIqDmv8JtgDEA7dPBE
         obel0aLcjQd1hZaScx9FEYCwY8CLp34wTHoiPOCqTIq0zyacy7JZfTpTJTybU112v+qt
         K3lVZ7e5P3MKPpPBSZwX08cuSF7h0nX+ENR/K8XdqhIIFa2FZnRzGe1ZMoQgzSDCZnPf
         v6tWxnIzEnRtiWol6IB/e1jazLJKPoQTmlOX3733o+nMNLPLZs9DJEycKkwihAJKmLhi
         kSOA==
X-Gm-Message-State: AFqh2kpLC8W/hB0p2AOvMin+xSJLt+k7el6GXv13O+3DJ40okQJLThvw
	PggheFIa3lv6iWDkuy7bj3kzNi6WgKUS3GNn
X-Google-Smtp-Source: AMrXdXvXpC0EKi01o6/2pO961wMBIghk3H0JjKUb10Q2NykRSL8BarfmO5dt1oElN7Azs6RW7MuXTg==
X-Received: by 2002:ac2:4ac3:0:b0:4b5:7e4c:dcea with SMTP id m3-20020ac24ac3000000b004b57e4cdceamr23303366lfp.51.1673363883688;
        Tue, 10 Jan 2023 07:18:03 -0800 (PST)
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
Subject: [PATCH v3 0/6] Basic early_printk and smoke test implementation
Date: Tue, 10 Jan 2023 17:17:53 +0200
Message-Id: <cover.1673362493.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.38.1
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

Bobby Eshleman (2):
  xen/riscv: introduce sbi call to putchar to console
  xen/riscv: introduce early_printk basic stuff

Oleksii Kurochko (4):
  xen/riscv: introduce dummy asm/init.h
  xen/riscv: introduce asm/types.h header file
  xen/riscv: introduce stack stuff
  automation: add RISC-V smoke test

 automation/gitlab-ci/test.yaml            | 20 ++++++++++
 automation/scripts/qemu-smoke-riscv64.sh  | 20 ++++++++++
 xen/arch/riscv/Kconfig.debug              |  7 ++++
 xen/arch/riscv/Makefile                   |  3 ++
 xen/arch/riscv/early_printk.c             | 33 +++++++++++++++++
 xen/arch/riscv/include/asm/config.h       |  2 +
 xen/arch/riscv/include/asm/early_printk.h | 12 ++++++
 xen/arch/riscv/include/asm/init.h         | 12 ++++++
 xen/arch/riscv/include/asm/sbi.h          | 34 +++++++++++++++++
 xen/arch/riscv/include/asm/types.h        | 22 +++++++++++
 xen/arch/riscv/riscv64/head.S             |  6 ++-
 xen/arch/riscv/sbi.c                      | 45 +++++++++++++++++++++++
 xen/arch/riscv/setup.c                    | 18 +++++++++
 13 files changed, 233 insertions(+), 1 deletion(-)
 create mode 100755 automation/scripts/qemu-smoke-riscv64.sh
 create mode 100644 xen/arch/riscv/early_printk.c
 create mode 100644 xen/arch/riscv/include/asm/early_printk.h
 create mode 100644 xen/arch/riscv/include/asm/init.h
 create mode 100644 xen/arch/riscv/include/asm/sbi.h
 create mode 100644 xen/arch/riscv/include/asm/types.h
 create mode 100644 xen/arch/riscv/sbi.c
 create mode 100644 xen/arch/riscv/setup.c

-- 
2.38.1


