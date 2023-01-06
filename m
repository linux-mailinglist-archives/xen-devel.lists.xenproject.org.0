Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEC9660102
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 14:14:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472540.732783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDmYU-00031j-9E; Fri, 06 Jan 2023 13:14:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472540.732783; Fri, 06 Jan 2023 13:14:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDmYU-0002zG-6L; Fri, 06 Jan 2023 13:14:42 +0000
Received: by outflank-mailman (input) for mailman id 472540;
 Fri, 06 Jan 2023 13:14:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QRQJ=5D=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pDmYS-0002z5-LP
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 13:14:40 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 135808af-8dc4-11ed-91b6-6bf2151ebd3b;
 Fri, 06 Jan 2023 14:14:39 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id v25so1862672lfe.12
 for <xen-devel@lists.xenproject.org>; Fri, 06 Jan 2023 05:14:39 -0800 (PST)
Received: from fedora.. ([195.234.76.149]) by smtp.gmail.com with ESMTPSA id
 f14-20020a0565123b0e00b004b7033da2d7sm150221lfv.128.2023.01.06.05.14.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 05:14:38 -0800 (PST)
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
X-Inumbo-ID: 135808af-8dc4-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V2UtY1Vvt5nd0Ps36YR7BE9Io/IKMRHuA+OuD+Ua5WU=;
        b=dEJWA4OToBPY9VGTbfJnZSgsfvptCU7zIzTVaNvbPQvAhGXP//sNT8PPf5rOffTiix
         lXAXd7mf/86mUgdQkvmqhamNAjeOq1FD3iNRV9f++Z04hf0q23EIUyT1I/L9PfNvge9q
         Oo3LDiRXtRp13jPMCGtewMHfzqD4h4FwdCs0vIhSAjVIBrWqLG4HQslgfjlK5+IWh/J2
         P07GZkxP+zJLNYMooHlcfnFw9KOAYhuCQOHtfrW6qsZKIQpnsLJNqeE/bO4N10lqSwoJ
         dgwK7cNnmmU32YaMINbQnnEFYk34QcObMVDHx/q7yFl+HxLV647YyNN1hy0u7DURGfgI
         P+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V2UtY1Vvt5nd0Ps36YR7BE9Io/IKMRHuA+OuD+Ua5WU=;
        b=GCrot8gdBjjbXAO1eTEc7y+FRWCmwGv30SFOaLDBnei0DRtjL5ObuHGBgr8eTDSzjM
         bg1q/9YcQB0zHSXyTGUDMpsooHbRMH864aYjPLH7kOqc7bgvD0ZJ5gXYXTb15EH+Jrkj
         KElkGypdf05ypVOF/nIDDQnDxT0HT3mQBCZW7YVbpHggGm7hYxQC6bJ+cpyeavbC2fEB
         WaFyVplspICmJYnWZWUT4edGFxrowmo9AKshxLsqMv5rv67JMEX4Lz4k7rGUMXv3B7Rn
         RkGdmOFaOnkC3w1JQqVLvIUVB6oHvWxdbB+kGrZaN3vUZEmQhPdOtWhesinsm4O/Bc7M
         utOA==
X-Gm-Message-State: AFqh2kobqWUNjGN/fDQUWw2yUsKplvQXHitR+1/ZnErgOB1xJu0FhCvG
	XhY4cAWoU3bLnK4N6xwX1tqwc8S6H3k4MzOm
X-Google-Smtp-Source: AMrXdXsDCwcZ3QWsZUvaCxQJXZp+bIW/488M3BCCgWqS4hkN/+qe2srwuDhBoHTrJvsHJovegdV3bg==
X-Received: by 2002:a05:6512:31cc:b0:4b5:5caf:9d62 with SMTP id j12-20020a05651231cc00b004b55caf9d62mr17690302lfe.61.1673010878710;
        Fri, 06 Jan 2023 05:14:38 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v1 0/8] Basic early_printk and smoke test implementation
Date: Fri,  6 Jan 2023 15:14:21 +0200
Message-Id: <cover.1673009740.git.oleksii.kurochko@gmail.com>
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

Oleksii Kurochko (8):
  xen/riscv: introduce dummy asm/init.h
  xen/riscv: introduce asm/types.h header file
  xen/riscv: introduce stack stuff
  xen/riscv: introduce sbi call to putchar to console
  xen/include: include <asm/types.h> in <xen/early_printk.h>
  xen/riscv: introduce early_printk basic stuff
  xen/riscv: print hello message from C env
  automation: add RISC-V smoke test

 automation/build/archlinux/riscv64.dockerfile |  3 +-
 automation/scripts/qemu-smoke-riscv64.sh      | 20 +++++
 xen/arch/riscv/Kconfig.debug                  |  7 ++
 xen/arch/riscv/Makefile                       |  3 +
 xen/arch/riscv/early_printk.c                 | 27 +++++++
 xen/arch/riscv/include/asm/early_printk.h     | 12 +++
 xen/arch/riscv/include/asm/init.h             | 12 +++
 xen/arch/riscv/include/asm/sbi.h              | 34 +++++++++
 xen/arch/riscv/include/asm/types.h            | 73 +++++++++++++++++++
 xen/arch/riscv/riscv64/head.S                 |  6 +-
 xen/arch/riscv/sbi.c                          | 44 +++++++++++
 xen/arch/riscv/setup.c                        | 18 +++++
 xen/include/xen/early_printk.h                |  2 +
 13 files changed, 259 insertions(+), 2 deletions(-)
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


