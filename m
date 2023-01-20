Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2F26757F7
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 16:00:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481853.747033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIssC-0006m5-KC; Fri, 20 Jan 2023 15:00:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481853.747033; Fri, 20 Jan 2023 15:00:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIssC-0006jo-HC; Fri, 20 Jan 2023 15:00:08 +0000
Received: by outflank-mailman (input) for mailman id 481853;
 Fri, 20 Jan 2023 15:00:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RVut=5R=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pIssB-0006Kg-5O
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 15:00:07 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f2cbeb6-98d3-11ed-91b6-6bf2151ebd3b;
 Fri, 20 Jan 2023 16:00:04 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id n7so5102531wrx.5
 for <xen-devel@lists.xenproject.org>; Fri, 20 Jan 2023 07:00:04 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr. [90.112.199.53])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a5d58c2000000b002bdbead763csm25349811wrf.95.2023.01.20.07.00.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 07:00:02 -0800 (PST)
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
X-Inumbo-ID: 1f2cbeb6-98d3-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b4D+uu+k0+I2IfYB1s/wnaEQNVajcaJWUGoB5Co8S0g=;
        b=o5aqMMLDum3iAFf5vYbbWfjS3IKHcX4+HgWUaNDwB9aygQPMaYFjM6xG8VvrZeqiT5
         juFi3kb3HA5KXAKDHNG8J+Uqm/F6qXJzcthIQ8y/2+j7vrHD1pp5joMCWfOJ5clyKPpM
         NTPqijSKBflLYJ8NxFcJIXPhVa5Wgltmud0qFKdQYoM+bbPSbSMsQZave4gX68JEjoGX
         MJ0tHDtcAiiz998oqSw9ZeXyWLdnOHXB1oU0n9w0EMptfkIgyN5xGGVWnwZ6wZvTKqTJ
         j8g4UDRkbnnUMts9PWJwnpZGZ9zZIs0dxhHRN0O+8BKApyINsi1WSZ3uNKEIsCWzpwU7
         AELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b4D+uu+k0+I2IfYB1s/wnaEQNVajcaJWUGoB5Co8S0g=;
        b=ckKg0OZokC7uQFGXYDKqJOBL2mHdc7yr1Q9ALZNu7/pqSW7gzX0/byvE+jtq2KAvz/
         yuqMhJwmMIp/NgibSdVMq7WnF1iDBHMcg/V+RSbTjfWRcg7TL5UHgDI1LUBvYTkm9oy3
         GjGX3kH6+VUnzKxwqO+YX/QfwWu7VHj61x02XT74ROK6+qBZn5zs5T7+GlfoE59kwSgR
         H+2siP1vRMjBVXcHF/KBAR7Omb1uqSI159dEPHzL4FPmAJ22LpHM8iuFw7vCnMplzles
         Nqek76W2gk3I89+Fm41gQOYeViEM6F1DIOp6VQoZ1G8ABgpqyrh9jp/REM4y9zyhmbdj
         KAQQ==
X-Gm-Message-State: AFqh2kqdS1JCKesJQyiPvzL+ZQzBwC4LJakjASE0rEtPbMgGagEkUtqA
	r4KbC/Zi5K5VWoLhlU+x3pxXyZ6z5U95Zg==
X-Google-Smtp-Source: AMrXdXvl8I9pwLlW83BJzfK/DNqKxEl8Cj8Lmkhd89JGrPriE66dgOepOsyIAke/nyXgFQKXXwwqFg==
X-Received: by 2002:a05:6000:1c6:b0:2bd:e40d:98d5 with SMTP id t6-20020a05600001c600b002bde40d98d5mr11462585wrx.0.1674226802982;
        Fri, 20 Jan 2023 07:00:02 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v1 00/14] RISCV basic exception handling implementation
Date: Fri, 20 Jan 2023 16:59:40 +0200
Message-Id: <cover.1674226563.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch series is based on another one [Basic early_printk and smoke
test implementation] which hasn't been commited yet.

The patch series provides a basic implementation of exception handling.
It can do only basic things such as decode a cause of an exception,
save/restore registers and execute "wfi" instruction if an exception
can not be handled.

To verify that exception handling works well it was implemented macros
from <asm/bug.h> such as BUG/WARN/run_in_exception/assert_failed.
The implementation of macros is used "ebreak" instruction and set up bug
frame tables for each type of macros.
Also it was implemented register save/restore to return and continue work
after WARN/run_in_exception.
Not all functionality of the macros was implemented as some of them
require hard-panic the system which is not available now. Instead of
hard-panic 'wfi' instruction is used but it should be definitely changed
in the neareset future.
It wasn't implemented show_execution_state() and stack trace discovering
as it's not necessary now.

Oleksii Kurochko (14):
  xen/riscv: add _zicsr to CFLAGS
  xen/riscv: add <asm/asm.h> header
  xen/riscv: add <asm/riscv_encoding.h header
  xen/riscv: add <asm/csr.h> header
  xen/riscv: add early_printk_hnum() function
  xen/riscv: introduce exception context
  xen/riscv: introduce exception handlers implementation
  xen/riscv: introduce decode_cause() stuff
  xen/riscv: introduce do_unexpected_trap()
  xen/riscv: mask all interrupts
  xen/riscv: introduce setup_trap_handler()
  xen/riscv: introduce an implementation of macros from <asm/bug.h>
  xen/riscv: test basic handling stuff
  automation: add smoke test to verify macros from bug.h

 automation/scripts/qemu-smoke-riscv64.sh    |   2 +
 xen/arch/riscv/Makefile                     |   2 +
 xen/arch/riscv/arch.mk                      |   2 +-
 xen/arch/riscv/early_printk.c               |  39 +
 xen/arch/riscv/entry.S                      |  97 ++
 xen/arch/riscv/include/asm/asm.h            |  54 ++
 xen/arch/riscv/include/asm/bug.h            | 120 +++
 xen/arch/riscv/include/asm/csr.h            |  82 ++
 xen/arch/riscv/include/asm/early_printk.h   |   2 +
 xen/arch/riscv/include/asm/processor.h      | 114 +++
 xen/arch/riscv/include/asm/riscv_encoding.h | 945 ++++++++++++++++++++
 xen/arch/riscv/include/asm/traps.h          |  13 +
 xen/arch/riscv/riscv64/head.S               |   5 +
 xen/arch/riscv/setup.c                      |  27 +
 xen/arch/riscv/traps.c                      | 229 +++++
 xen/arch/riscv/xen.lds.S                    |  10 +
 16 files changed, 1742 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/riscv/entry.S
 create mode 100644 xen/arch/riscv/include/asm/asm.h
 create mode 100644 xen/arch/riscv/include/asm/bug.h
 create mode 100644 xen/arch/riscv/include/asm/csr.h
 create mode 100644 xen/arch/riscv/include/asm/processor.h
 create mode 100644 xen/arch/riscv/include/asm/riscv_encoding.h
 create mode 100644 xen/arch/riscv/include/asm/traps.h
 create mode 100644 xen/arch/riscv/traps.c

-- 
2.39.0


