Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9DC79006A
	for <lists+xen-devel@lfdr.de>; Fri,  1 Sep 2023 18:03:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594651.928040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qc6bH-0005HP-82; Fri, 01 Sep 2023 16:02:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594651.928040; Fri, 01 Sep 2023 16:02:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qc6bH-0005E6-4M; Fri, 01 Sep 2023 16:02:23 +0000
Received: by outflank-mailman (input) for mailman id 594651;
 Fri, 01 Sep 2023 16:02:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bo8w=ER=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qc6bG-0005Dt-3c
 for xen-devel@lists.xenproject.org; Fri, 01 Sep 2023 16:02:22 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id edecf90b-48e0-11ee-8783-cb3800f73035;
 Fri, 01 Sep 2023 18:02:19 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4ff8cf11b90so3944092e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 01 Sep 2023 09:02:19 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 d23-20020ac25457000000b0050097974ec8sm685782lfn.216.2023.09.01.09.02.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Sep 2023 09:02:17 -0700 (PDT)
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
X-Inumbo-ID: edecf90b-48e0-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693584139; x=1694188939; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hGaFAm7Nc0hwxi3jZc3J8mm6pOQjYTxnZIGA//eoISs=;
        b=qK0zZNwaLLuPAeNP8TeAEOtaYIf21+k1F0iK3YiE1MVS+PPj7Y+7B+FRHA507QMjdz
         C5FIf6f/VsFDbNZ+PB5oOYem9OaOaiMALTMtLayEZqsG5NZ0swkoqCz9j/ce/V7ao3Y8
         EuGDHrJ5aZIksRZ7afn3LwgfByXm+pG8N6NbuhHaQN/dhoHa5PqUgtIJ2GQ2ynBNm/Db
         H2isOzgfzNCkB5j0bccyXv4xDHl3XjYybfRw0MRbEYzt1sK7EA6ctn43kT/QJS2fsuJJ
         4b8lfxCn9J9wkrtuwJDuMeuYxUg6lDrN2V2QIYLEggqwsu3CeBf4uTWMdI9MY11DguwQ
         lLwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693584139; x=1694188939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hGaFAm7Nc0hwxi3jZc3J8mm6pOQjYTxnZIGA//eoISs=;
        b=lF5DBD/YFJhQQEdlai/eUp3VGxQOQcP9mB2UOLoDduD/6W5PVYzr0mmTyJgHyIuHsj
         lptb7UK1oUvzgg/K2tHGInzoOGRWFfmA8JVk+eOl2TPm0AejEcxr+TjibpdDCh7+aj/D
         +PxtHJbu0asvn4hDt4/vmlqD/RQ7eSBgZ3SpfYaP2Uo28AXdfGchhbZWyFnIBVBXzMmz
         ECJP20ThKWM+8V7YPXLw7e2Iu/424Ny78W2x141359lNIOIt3xIKFIvDD1AP2hip3TRQ
         Az/aRFUYAxwOp7IL5Wt/UmQS6HrzK9Q5a535EYPiQkCa00c+WJTKM/JxUELRDMNVljwa
         B9Cw==
X-Gm-Message-State: AOJu0Yzb18QuUiianzOImFziRVl7UPCBaAGSoATEs8C+RP1Lv60rmu7u
	92jDqu/62479bIuqN9wSPBQf2oTg9DI=
X-Google-Smtp-Source: AGHT+IEsqSdGk4iuWWeZOHs2bdV3eTIoiB9YFeNx3Bo8wPWAZb2iVAvMMWkiOapXB8PhcIoIDnLiGQ==
X-Received: by 2002:a05:6512:b15:b0:4fe:af1:c3ae with SMTP id w21-20020a0565120b1500b004fe0af1c3aemr2442996lfu.15.1693584138474;
        Fri, 01 Sep 2023 09:02:18 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: [PATCH v4 0/2] introduce stub directory to storing empty/stub headers
Date: Fri,  1 Sep 2023 19:02:13 +0300
Message-ID: <cover.1693583721.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A lot of empty/stub headers should be introduced during the early steps of adding
support of new architecture.

An example can be found here:
1. https://lore.kernel.org/xen-devel/cover.1692181079.git.oleksii.kurochko@gmail.com/
2. https://lore.kernel.org/xen-devel/a92f99e8f697da99d77bfde562a549dbef3760ce.1692816595.git.sanastasio@raptorengineering.com/

As part of the patch series, asm/vm_event.h was moved to the stubs directory because
It is the same for ARM, PPC, and RISC-V.

---
Changes in V4:
 - add asm-generic support
 - update path of vm_event.h from include/asm-generic/asm to include/asm-generic
---
Changes in V3:
 - add Acked-by: Stefano Stabellini <sstabellini@kernel.org> for "xen: move arm/include/asm/vm_event.h to asm-generic"
 - update SPDX tag.
 - move asm/vm_event.h to asm-generic.
 - rename stubs dir to asm-generic.

---
Changes in V2:
 - change public/domctl.h to public/vm_event.h.
 - update commit message of [PATCH v2 2/2] xen: move arm/include/asm/vm_event.h to stubs


Oleksii Kurochko (2):
  xen: asm-generic support
  xen: move arm/include/asm/vm_event.h to asm-generic

 xen/Makefile                       | 10 +++++-
 xen/arch/arm/include/asm/Kbuild    |  1 +
 xen/arch/ppc/include/asm/Kbuild    |  1 +
 xen/arch/riscv/include/asm/Kbuild  |  1 +
 xen/arch/x86/include/asm/Kbuild    |  1 +
 xen/include/asm-generic/vm_event.h | 55 ++++++++++++++++++++++++++++++
 xen/scripts/Makefile.asm-generic   | 23 +++++++++++++
 7 files changed, 91 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/arm/include/asm/Kbuild
 create mode 100644 xen/arch/ppc/include/asm/Kbuild
 create mode 100644 xen/arch/riscv/include/asm/Kbuild
 create mode 100644 xen/arch/x86/include/asm/Kbuild
 create mode 100644 xen/include/asm-generic/vm_event.h
 create mode 100644 xen/scripts/Makefile.asm-generic

-- 
2.41.0


