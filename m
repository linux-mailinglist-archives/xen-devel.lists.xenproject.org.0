Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA8168D731
	for <lists+xen-devel@lfdr.de>; Tue,  7 Feb 2023 13:49:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491101.760067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPNPN-0003Mn-O3; Tue, 07 Feb 2023 12:49:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491101.760067; Tue, 07 Feb 2023 12:49:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPNPN-0003Ji-LC; Tue, 07 Feb 2023 12:49:13 +0000
Received: by outflank-mailman (input) for mailman id 491101;
 Tue, 07 Feb 2023 12:49:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BG9e=6D=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pPNPM-0003Jc-7k
 for xen-devel@lists.xenproject.org; Tue, 07 Feb 2023 12:49:12 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d19d08bc-a6e5-11ed-933c-83870f6b2ba8;
 Tue, 07 Feb 2023 13:49:11 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id a2so13164080wrd.6
 for <xen-devel@lists.xenproject.org>; Tue, 07 Feb 2023 04:49:11 -0800 (PST)
Received: from 34-6F-24-FC-D2-65..
 (46.204.109.85.nat.umts.dynamic.t-mobile.pl. [46.204.109.85])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a5d59aa000000b002be5401ef5fsm11468388wrr.39.2023.02.07.04.49.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 04:49:10 -0800 (PST)
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
X-Inumbo-ID: d19d08bc-a6e5-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4zkAUWp9Lxhlr3VSmKMwlZzj2U9syX3G3ZQDSxEtKDs=;
        b=alUaR2YHRN8AOm95OB86CMZSplcxFy0gBvAnfbanCDdbZVaLjwB0DrLosNyVpid2FC
         i7uQYNH6QlfUEsWoas0kyVQEYHFjaaAoI/T768CXRqE+wwB8bnpDfvWzwNFwejHNBZs8
         jXWyoua0eKBCDkQgyjAAY4rXVu25ILDV1ZqXMERkpiuaEQZ2EKT0JAk7hYmGR5gxFm9U
         m5HCLUrOn+etxArpRFbUAG4vDFm9MtrWjaQxt27qBkugPH70fw2cNbaaITW7Y045seWh
         M/cGPI2JJThDDXC2xWNXpcw62Z4noBEhEwP55wL+LFuZO9YeFec62t45hVS2n/VJSK0z
         DXmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4zkAUWp9Lxhlr3VSmKMwlZzj2U9syX3G3ZQDSxEtKDs=;
        b=JFIqsjr5554w1rSMPa1/7Rnv2rt3NgOAsi0Gi8zgl6r4W69nSu7GUnW+RvgUJ9S3nX
         QYnIazH/YdrluStctnIWmPfjv9IaXUngFLZTBjaQgQuGgtbuAv+jZ7CN8jYrky9TyseZ
         tmbYXN0W99chXqRK0yemei/SAeJj0afMRCIR7Hd/BqgeZ2w37ckcDSZGv+PZ/LlU35mn
         zt2BL4zt+kIbUg634EngSTg+MJnUZ0I9mxdJlQC2Lu0AL1HXfyP8lqci5vPD2DudPjZZ
         BuCJc3a6fkXe5M8ntpiqhqhslLmg9r/5Dk5rL8W6A+c7IMXXmhrnMbEuMfsLYEozNdqA
         WuZA==
X-Gm-Message-State: AO0yUKVfJybDSPKfTxX728EvL4kkajodJBae2qjrylhGw3AlsbpmpqZo
	KqOnTBwri/AOoKLbGYTSfVb+32+Edcs=
X-Google-Smtp-Source: AK7set8nbfSycTUaWY/Sf0u5R8Nl3Mpvjk2TKArDTh55EsigXiThcS1XEpNpIF3oQb1e7oiZcVswmQ==
X-Received: by 2002:a5d:524b:0:b0:2c3:ea65:cc7d with SMTP id k11-20020a5d524b000000b002c3ea65cc7dmr2910272wrc.55.1675774150757;
        Tue, 07 Feb 2023 04:49:10 -0800 (PST)
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
Subject: [PATCH v10 0/2] Basic early_printk and smoke test implementation
Date: Tue,  7 Feb 2023 14:49:04 +0200
Message-Id: <cover.1675773832.git.oleksii.kurochko@gmail.com>
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
Changes in V10:
 - Add changes mentioned in V9 (forget to do in previous version)
---
Changes in V9:
 - Bring "cmodel=medany" check back to be sure that C function is safe to be
   called in early boot when MMU is off ( e.g. VA != PA ) 
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

 automation/gitlab-ci/test.yaml            | 20 +++++++++++
 automation/scripts/qemu-smoke-riscv64.sh  | 20 +++++++++++
 xen/arch/riscv/Kconfig.debug              |  5 +++
 xen/arch/riscv/Makefile                   |  1 +
 xen/arch/riscv/early_printk.c             | 44 +++++++++++++++++++++++
 xen/arch/riscv/include/asm/early_printk.h | 12 +++++++
 xen/arch/riscv/setup.c                    |  4 +++
 7 files changed, 106 insertions(+)
 create mode 100755 automation/scripts/qemu-smoke-riscv64.sh
 create mode 100644 xen/arch/riscv/early_printk.c
 create mode 100644 xen/arch/riscv/include/asm/early_printk.h

-- 
2.39.0


