Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 061A96738EC
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jan 2023 13:46:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480994.745639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIUIQ-0001vr-Hb; Thu, 19 Jan 2023 12:45:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480994.745639; Thu, 19 Jan 2023 12:45:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIUIQ-0001sY-Bm; Thu, 19 Jan 2023 12:45:34 +0000
Received: by outflank-mailman (input) for mailman id 480994;
 Thu, 19 Jan 2023 12:45:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qz+V=5Q=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pIUIO-0001sI-ME
 for xen-devel@lists.xenproject.org; Thu, 19 Jan 2023 12:45:32 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2749bde2-97f7-11ed-b8d1-410ff93cb8f0;
 Thu, 19 Jan 2023 13:45:29 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id n7so1749527wrx.5
 for <xen-devel@lists.xenproject.org>; Thu, 19 Jan 2023 04:45:29 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr. [90.112.199.53])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a5d684f000000b002bddac15b3dsm17909808wrw.33.2023.01.19.04.45.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 04:45:28 -0800 (PST)
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
X-Inumbo-ID: 2749bde2-97f7-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qGInHi3/ALJ2wyDs3M8NHyBY6zC4QfJw4j5yCOiIG08=;
        b=anDyFTqjVgO8A92J4syGLyQYh7RgurCsVyC8kjj0QEbdX2+9kzc9ApUKjIC1VcjYN2
         p68TjCbyqOrQTLUKRq86ewPol0JYrUIQ7qCFyPYnOxv4yhTyy9n7scVxZ+Mr3yMhWPGY
         TizNnguz+XqtJTaDzaw6byH5+hNhrnR2AhrP483Cwxekbm1WXkIRZ+925cWXzR9wTy0N
         T9wVDfu8fOaJ3m1AxQSuMNNB8mNJUPhSl4vTnoOWopoLSapuckKvXqyAfcQM+H5MVBBa
         fG22qUYBBjCDeYTuDgM8ojJKMuB+3v0tDCUYYNE0wPQ+ATFT5VNWqVkQhXhsAtiMz0NG
         /5XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qGInHi3/ALJ2wyDs3M8NHyBY6zC4QfJw4j5yCOiIG08=;
        b=n8Xfcp+/dhQ6EeBnLUPHFPuHj41epxcYSbmuI2DCVic/3r7+JovRvusXD02Q2OIhLM
         1w7K9Rpi/Y//+MiJyT5OAnbJGnkuOouhdXHOWreXAXSdZuRDRQAm8w8bdPHhTEElNYeN
         P18FzLTbA1tKJPMS7QteZFzqx6poZ40QC4KaAllVFI5D/4CzDEvhQJ5ecCpBIqdMBgd0
         S4cA4VtpaEICD/vd5NApueWJFavmfoqn+TUX++qZxKcGTZ9V0Gdncc+ow+ZY7SfGjkSb
         zS2k6gyxT5zZOw20CicFv1AusSOifH2oBLIonashStvbiv/+nfAkakLk4GebIvSo5zCy
         QxJA==
X-Gm-Message-State: AFqh2kowYUEOfK2byIXxgst00ZD1y5nhfu9oqb1e27Wlg6wSndlDh46l
	2v2vNO158JrZrQBI01GUn9I4S5LYBMZDce+i
X-Google-Smtp-Source: AMrXdXsdO4Q0wXQenpT/evRxq/7+5VGXvo2Ai38o8gZcpSXHB5U/YIVtyNP3ZgaDNVjDdR8gNKRwRg==
X-Received: by 2002:a05:6000:1049:b0:242:15d6:1a75 with SMTP id c9-20020a056000104900b0024215d61a75mr8653629wrx.66.1674132328812;
        Thu, 19 Jan 2023 04:45:28 -0800 (PST)
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
Subject: [PATCH v4 0/4] Basic early_printk and smoke test implementation
Date: Thu, 19 Jan 2023 14:45:13 +0200
Message-Id: <cover.1673877778.git.oleksii.kurochko@gmail.com>
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


