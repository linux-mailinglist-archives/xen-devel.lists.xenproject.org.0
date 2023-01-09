Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 774B4662A66
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 16:47:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473746.734487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEuMa-0001Qe-So; Mon, 09 Jan 2023 15:47:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473746.734487; Mon, 09 Jan 2023 15:47:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEuMa-0001Oq-Pe; Mon, 09 Jan 2023 15:47:04 +0000
Received: by outflank-mailman (input) for mailman id 473746;
 Mon, 09 Jan 2023 15:47:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GnCm=5G=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pEuMZ-0001Ok-RX
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 15:47:03 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db81c3f9-9034-11ed-b8d0-410ff93cb8f0;
 Mon, 09 Jan 2023 16:47:01 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id az20so2095181ejc.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Jan 2023 07:47:01 -0800 (PST)
Received: from 2a02.2378.102e.bce5.ip.kyivstar.net
 ([2a02:2378:102e:bce5:dfc0:9312:b994:6b21])
 by smtp.gmail.com with ESMTPSA id
 22-20020a170906311600b0082535e2da13sm3851561ejx.6.2023.01.09.07.46.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 07:47:00 -0800 (PST)
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
X-Inumbo-ID: db81c3f9-9034-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=82ki1vMowwI70MnBQW3UbvNHNyHvE7BkIpy4+UwdStM=;
        b=P6CKvK20Bj18bBrI07gAlkAo+Yh+biv8P2wsY4XBiE17W9/VOgxQwXj4WfxZ8GgF9b
         jb5+vCJoOWc5JhSskjJ4rNOWFjyjdn0157mn6PM5ZJhrhCsPRkBR7mGK5rBky6YHu0zQ
         FDsbwqYM2NFzdrEKZTIRNzXE/k+WyGWCVbaWARwLtSl+hA1UqtkpCxJTDgIVJpbcN5do
         ew++PrS2RxFx89d2KNVKIirztg0CKZmpgVtlwv8iPr8Y8WmBAXarw7WPF9VrlwnJblY6
         xDl+zjil2q58/ROXxJcg61H5N5kpYC/tzQEFBiheLSto0T5Nt09iLb7IRbZQwF3kkfAe
         +UOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=82ki1vMowwI70MnBQW3UbvNHNyHvE7BkIpy4+UwdStM=;
        b=S2QxqoRYEkrTgpHaTsKHKYumuExZ+cmKOY6nVRajCji9L5PZguBOY+fs65ZlNo9sZ4
         d6XK2+51dYkQlce5mH8tSRWAkFHiWzOHUwDAKTsL6FjVV2bjfLrZO0Kyc5QbspqnW2j7
         hw8HEnrTsjjeHv+TXG3jxYcOpqQSo0ebl8MjbtkOrluz+C7BytkWEl6ePHXQTN3/swz7
         s7ycCHeUjpy3N46MePmG8GPd+x7zANR4VLbqKL9rnk4XL+EGqlRhjOZhAwwfEt8zgqei
         w2FdCufjPXNfZgXKfAlrwZM73WBQJfAp1uiW3yAlpNGsg4N5NZmauWot1aahgO1BrvjB
         BBKA==
X-Gm-Message-State: AFqh2kpz3VnOBglCDJFV052Pzu9+Fs/Y6lKzKKdBPB5AUMgy/T10jgXE
	Tnz5uDoPOSynMbsNdp5szh1QpBbPSMV/ZA==
X-Google-Smtp-Source: AMrXdXvU+k7sC2FPfjiMKXaK/O1B58hpm9yxbI09VnM1XbVfxplgRx4xurEdUsRiaY2jyMDcRpRgbQ==
X-Received: by 2002:a17:907:a782:b0:7c1:6430:e5d0 with SMTP id vx2-20020a170907a78200b007c16430e5d0mr57971201ejc.4.1673279221035;
        Mon, 09 Jan 2023 07:47:01 -0800 (PST)
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
	George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v2 0/8] Basic early_printk and smoke test implementation
Date: Mon,  9 Jan 2023 17:46:47 +0200
Message-Id: <cover.1673278109.git.oleksii.kurochko@gmail.com>
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

Oleksii Kurochko (8):
  xen/riscv: introduce dummy asm/init.h
  xen/riscv: introduce asm/types.h header file
  xen/riscv: introduce stack stuff
  xen/riscv: introduce sbi call to putchar to console
  xen/include: include <asm/types.h> in <xen/early_printk.h>
  xen/riscv: introduce early_printk basic stuff
  xen/riscv: print hello message from C env
  automation: add RISC-V smoke test

 automation/gitlab-ci/test.yaml            | 20 +++++++++++
 automation/scripts/qemu-smoke-riscv64.sh  | 20 +++++++++++
 xen/arch/riscv/Kconfig.debug              |  7 ++++
 xen/arch/riscv/Makefile                   |  3 ++
 xen/arch/riscv/early_printk.c             | 33 +++++++++++++++++
 xen/arch/riscv/include/asm/config.h       |  2 ++
 xen/arch/riscv/include/asm/early_printk.h | 12 +++++++
 xen/arch/riscv/include/asm/init.h         | 12 +++++++
 xen/arch/riscv/include/asm/sbi.h          | 34 ++++++++++++++++++
 xen/arch/riscv/include/asm/types.h        | 22 ++++++++++++
 xen/arch/riscv/riscv64/head.S             |  6 +++-
 xen/arch/riscv/sbi.c                      | 44 +++++++++++++++++++++++
 xen/arch/riscv/setup.c                    | 18 ++++++++++
 xen/include/xen/early_printk.h            |  2 ++
 14 files changed, 234 insertions(+), 1 deletion(-)
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


