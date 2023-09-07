Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8960797343
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 17:16:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597479.931737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeGju-0003iJ-Uu; Thu, 07 Sep 2023 15:16:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597479.931737; Thu, 07 Sep 2023 15:16:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeGju-0003em-Rn; Thu, 07 Sep 2023 15:16:14 +0000
Received: by outflank-mailman (input) for mailman id 597479;
 Thu, 07 Sep 2023 15:16:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3tY2=EX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qeGju-0003AH-6Z
 for xen-devel@lists.xenproject.org; Thu, 07 Sep 2023 15:16:14 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 786b24cb-4d91-11ee-9b0d-b553b5be7939;
 Thu, 07 Sep 2023 17:16:08 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2be5e2a3c86so26308231fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Sep 2023 08:16:08 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 x2-20020a2e8802000000b002bbacc6c523sm3944055ljh.49.2023.09.07.08.16.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Sep 2023 08:16:06 -0700 (PDT)
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
X-Inumbo-ID: 786b24cb-4d91-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694099767; x=1694704567; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yiHIyQ5Tr9cx6A1jdYsDd7Gaoqb8wHX3d7uubm9fFDQ=;
        b=KFeW2uYhkjApCMPi28MIqgJ80rw6iXCsTqBU0A+i2N8yHIIRPoaUFar8gGNErlVPoZ
         qwqdAzWYj2w7ufVUygHrEwHMbl+RTidIK1d7GBEaXNymuO8x3qPSezUrGaHkhmo1kDy4
         sGeIxyNeYiv3e5dvMq78s3pknty2FOpstDpOeXgLvl4nBxkqBtdUgNga9fh6L3q4Tua8
         WWX7Pb14zXBnhT6KVll2G34B8ZgTPtKIosBUqX1zDypMJgYZLkv9SdUrcexLY/y/e8X6
         wiiOenqwUfIEo9muqXnL3ZhIqp+oKNhf8Zvua2l3QX/a9p9SXicijRVl1DXff/cbbpm0
         uS5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694099767; x=1694704567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yiHIyQ5Tr9cx6A1jdYsDd7Gaoqb8wHX3d7uubm9fFDQ=;
        b=IKO71ld/99dFdXW04ru6a3nZbIqZEqoGzROtm7Np4II0+uouCTJP6PDUIT3y3ZC/DE
         UOXPKvDgFzC0/NkOpnDMDykzsf18OIUbpTcJr44B12abWLMBvgzjuZN1jIQjiO7udCoa
         g9LsXMIoilaL8BZfMIttdpl6IrrWk2RlxLDeViCQfdUbe/oXlD5nvc9lBKDL0xDAK+13
         QR+S+nbHpVeO9xfjAROlfLgtos+uxbgE8V6rQfUTNqzjEsPqpO70A7Ll84nWAToasyn0
         6PFzeG6Pk5eRWMO6f4S17IYeaSPt+65um10xyK7mXrE8DMZRthnAkNUi3tMT75cIN9JE
         WqHg==
X-Gm-Message-State: AOJu0Yz0cs86mfRU0IYZRlMI1S9594+s8AfdF9rjB+3m2iFJI6/ZESMM
	vhljrPhaTXMU/nV5d85k+yryMCNswgM=
X-Google-Smtp-Source: AGHT+IEB1c/IgDOlFuASSTXfyMPbM7kDmoGNZk6jbUQJeDMm2P23+WP5DGc2hk0+xdVQM7uDHioA7A==
X-Received: by 2002:a2e:9d90:0:b0:2bc:e470:1401 with SMTP id c16-20020a2e9d90000000b002bce4701401mr1224763ljj.24.1694099767105;
        Thu, 07 Sep 2023 08:16:07 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@citrix.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v7 0/2] introduce stub directory to storing empty/stub headers
Date: Thu,  7 Sep 2023 18:15:58 +0300
Message-ID: <cover.1694097564.git.oleksii.kurochko@gmail.com>
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
Changes in V7:
- update warning message in Makefile.asm-generic
- add Reviewed-by: Anthony PERARD <anthony.perard@citrix.com> for patch 1
- add Acked-by: Jan Beulich <jbeulich@suse.com> for patch 1
- update header guards in asm-generic/vm_event.h.
- add Acked-by: Tamas K Lengyel <tamas@tklengyel.com> for patch 2
---
Changes in V6:
 - introduce $(asm-generic) macro in Kbuild.include.
 - move "asm-generic" after the rule "__distclean".
 - update the commit message.
---
Changes in V5:
- Update SPDX license.
- Remove code related to UML in Makefile.asm-generic.
- Include $(src)/Makefile instead of $(kbuild-file).
- Update comment message in Makefile.asm-generic.
- Update .gitignore.
- Update path to generated headers in CFLAGS.
- Use the latest version of Linux's Makefile.asm-generic.
- Introduce asm-generic's vm_event.h.
- Switch ARM to use asm-generic/vm_event.h.
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

 .gitignore                          |  1 +
 xen/Makefile                        |  9 +++-
 xen/arch/arm/include/asm/Makefile   |  2 +
 xen/arch/arm/include/asm/vm_event.h | 66 -----------------------------
 xen/include/asm-generic/vm_event.h  | 55 ++++++++++++++++++++++++
 xen/scripts/Kbuild.include          |  6 +++
 xen/scripts/Makefile.asm-generic    | 53 +++++++++++++++++++++++
 7 files changed, 125 insertions(+), 67 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/Makefile
 delete mode 100644 xen/arch/arm/include/asm/vm_event.h
 create mode 100644 xen/include/asm-generic/vm_event.h
 create mode 100644 xen/scripts/Makefile.asm-generic

-- 
2.41.0


