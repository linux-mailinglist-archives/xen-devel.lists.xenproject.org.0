Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD569849DE
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 18:42:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803179.1213667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st8cb-0007YD-K9; Tue, 24 Sep 2024 16:42:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803179.1213667; Tue, 24 Sep 2024 16:42:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st8cb-0007SI-Ed; Tue, 24 Sep 2024 16:42:41 +0000
Received: by outflank-mailman (input) for mailman id 803179;
 Tue, 24 Sep 2024 16:42:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vi3U=QW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1st8ca-0006l4-C5
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 16:42:40 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02749c78-7a94-11ef-99a2-01e77a169b0f;
 Tue, 24 Sep 2024 18:42:38 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5c40aea5c40so94150a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 09:42:38 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c5cf4972f8sm925880a12.36.2024.09.24.09.42.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 09:42:37 -0700 (PDT)
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
X-Inumbo-ID: 02749c78-7a94-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727196158; x=1727800958; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JpiTxUeUSpHZmFA9gDCH6CikYygBa+0X5ZnJt34uvZk=;
        b=mJ5rTO0D8ZmPXvvIEvYYkkfecNOItq1Dg9gB9Yv4jaiqnR4du+4fx1NaHUTKNtkd2b
         StY864oe8ibLpcgyoceLpbt3hmck8z1XurElpVw3rZjJxqcXOUO0opGjGj58OA8URhCe
         /wcUXt3vbgNmKwZFJg3CMh/WmlyFtx7z3dWl0X0UU/LGqSDeFbzr/wk3j92wX2P8ERO2
         HxDMjN1T/i913BWCCjFwFDTA+W13WRqssCuuB5YEvjWTDLviuYY2rblTfUEfrN1gfOqE
         lWZtzOLucGltWHTmjjDOnZJggfxyn6vDDh4Ftass1bkNC6/sS7kAdLf8ruKaILRKnpus
         X0uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727196158; x=1727800958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JpiTxUeUSpHZmFA9gDCH6CikYygBa+0X5ZnJt34uvZk=;
        b=ZnUYkefX/8yTPOX+nfLc2kCrO0jJjmvngRMremo0Yl/PkzimH9Eo7/3DHlyq1t3g01
         9edfwIOizWJnLK+j8tkdybxLBCaOvDcKaOscfETZc8JSIEuzkJcyJIijWhmf1GnBew+s
         HBJnGxMwNM2BJ53cleYls7tePNNfh6AaPihMRMjzdJnKUwTz62v7SMEDbJvMyZ6jwykp
         /2Pg7Ax71tlFr68M2Kzf3jGwWHeI9VBt/iJ9SHSMuNWlpUIi+rwPYJ1zzrCwY+nFkh//
         2aIA/kLj6p9ObqnEfAkxw1/U5T2mJdneP1A2AuLkinhtWqFQVygsMupWEyBe3wX2tq6B
         WG4w==
X-Gm-Message-State: AOJu0YyHi+fa+JSq+NL9VPVkmj3Z7Pe4Kf+m1DTFGsFlCbRAvCzg+B+r
	/DTU79w0tCXCvXrA5TmaUXcJMzZstCMdqo7q7ds6XmOyVmcEX+J3Lbaidw==
X-Google-Smtp-Source: AGHT+IEUnXM7IZTZCimwbNEeZWLMVxAbf54udbfeB7ku6paT9NPSl/Lecl68FtioNsEGg/0eYCXzBw==
X-Received: by 2002:a05:6402:4313:b0:5c7:18c7:a005 with SMTP id 4fb4d7f45d1cf-5c718c7a1ebmr2282328a12.10.1727196157622;
        Tue, 24 Sep 2024 09:42:37 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v3 0/5] Move {acpi_}device_init() and device_get_class() to common code
Date: Tue, 24 Sep 2024 18:42:29 +0200
Message-ID: <cover.1727193766.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The {acpi_}device_init() and device_get_class() functions are identical across
Arm and RISC-V, and they are likely to remain the same for other architectures
like PPC.
Since there is no architecture-specific logic within these functions, they are
good candidates to be moved to the common codebase.

This patch series refactors the code by moving these functions to the common
directory, reducing code duplication and simplifying future maintenance.

---
Changes in V3:
 - drop _SECTIONS from the name of the macros ADEV_INFO and DT_DEV_INFO
 - update the definion of macros ADEV_INFO and DT_DEV_INFO
 - drop DEVICE_INIT config.
---
Changes in v2:
 - Introduce macros for definition of ACPI and Device Tree sections.
 - Introduce CONFIG_DEVICE_INIT to make common/device.o compilable only for Arm,
   PPC and RISC-V.
---

Oleksii Kurochko (5):
  xen: define ACPI and DT device info sections macros
  xen/arm: use {DT,ACPI}_DEV_INFO for device info sections
  xen/ppc: add section for device information in linker script
  xen/riscv: add section for device information in linker script
  xen/common: move device initialization code to common code

 xen/arch/arm/device.c     | 71 +--------------------------------
 xen/arch/arm/xen.lds.S    | 10 +----
 xen/arch/ppc/xen.lds.S    |  5 +++
 xen/arch/riscv/xen.lds.S  |  5 +++
 xen/common/Makefile       |  2 +
 xen/common/device.c       | 82 +++++++++++++++++++++++++++++++++++++++
 xen/include/xen/xen.lds.h | 10 +++++
 7 files changed, 108 insertions(+), 77 deletions(-)
 create mode 100644 xen/common/device.c

-- 
2.46.1


