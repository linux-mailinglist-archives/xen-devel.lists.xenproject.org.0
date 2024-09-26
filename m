Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 440189877DE
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 18:56:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805750.1216948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1strlB-0001Ud-P0; Thu, 26 Sep 2024 16:54:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805750.1216948; Thu, 26 Sep 2024 16:54:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1strlB-0001Sk-KX; Thu, 26 Sep 2024 16:54:33 +0000
Received: by outflank-mailman (input) for mailman id 805750;
 Thu, 26 Sep 2024 16:54:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ukdd=QY=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1strlA-0001ST-Bq
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 16:54:32 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff68d35c-7c27-11ef-99a2-01e77a169b0f;
 Thu, 26 Sep 2024 18:54:30 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a86e9db75b9so192386166b.1
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 09:54:30 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2979e00sm16981566b.158.2024.09.26.09.54.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 09:54:28 -0700 (PDT)
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
X-Inumbo-ID: ff68d35c-7c27-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727369669; x=1727974469; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rVRhj9zDoK0/DYhHxG2WDnIOLYaCDMG4ApkFr0LcAfk=;
        b=R3m59SuzzKp3rxm7q9ymgjSJSnEoTcKchRMgdDMXtdcbLrBVzq4zU5xHqITe85pchS
         E/4YXtMKEzttvIwPB6u1yxl+Vx/7QZWT+NXUwtwMRzoOd5IwkGnXddMlQ81ZaXGGM8W+
         G4o5ZMxdz1VClfrm8Fy1kDCyBdqObnUblKJFY67EvUk63RZkm2O9uYEd3XNDaxTJeupi
         SuvIiDEo8/P/y8GMHIH00H4PxGzMxbHPXVVOhya3NrS+IXcvhX/rM4v3FCo6j5yaNiXY
         MHSBAE3jPnQefRSYkrVxeoQrPa6NndmKMI85JE7J65vjWUL+p/pATfXylu/EFFPT0XRl
         X4aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727369669; x=1727974469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rVRhj9zDoK0/DYhHxG2WDnIOLYaCDMG4ApkFr0LcAfk=;
        b=C4wzkpSzla5y8QEhd5kG4/uO+J5DWeB4PowDKn1oEX+6C7OviSytfW1wH8D553vbg3
         ym7KLccfmSvjr7mnVszLGUpuOzJ75feeLZeta/0DwfFlrXsBEcEw4K6KmVMvqZTsvSzn
         q1lXMMN4p7rQ/CGzXtImVb/eGadT46bqxwyoSALkoVTkQrnQP/CGzGMI81PniKKtrSXM
         5UgkEHMoMT155VRY1EP0MzxNxFcKk4FqOZobJubP92u5ACuE27LT2r5y5k+ax4T3UmTM
         Ezcx3hxf3UpKgd1/u8xC+Fwd+ubJhHIDwODNqRZ+5WNEQkZcR7hIIYl52IN/9KaOvWKd
         xZnA==
X-Gm-Message-State: AOJu0Yx7APVd9A8vOeVhOMpYc5pITZ25ekKMxwfXq4KzeeGWW78R2wax
	clOWOGuvA9xDcw62ZnOy+R02VY7sGjp9TiB/snYIAw6mCX5TzlEjKtWTFg==
X-Google-Smtp-Source: AGHT+IE++6FjARUAhE8aSVIh4Qy07JfmQNl4bcPw+wJagj4tFz1L9OTXt4oi/WC//AACVBozzZ9xAw==
X-Received: by 2002:a17:906:c147:b0:a86:ac9e:45fd with SMTP id a640c23a62f3a-a93c4aab953mr11824466b.62.1727369669237;
        Thu, 26 Sep 2024 09:54:29 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v4 0/6] Move {acpi_}device_init() and device_get_class() to common code
Date: Thu, 26 Sep 2024 18:54:19 +0200
Message-ID: <cover.1727365854.git.oleksii.kurochko@gmail.com>
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
Changes in V4:
 - Introduce SIMPLE_DECL_SECTION to cover the cases when an architecture wants
   to use section declaration without specifying an load address.
 - Refactor macors ACPI_DEV_INFO and DT_DEV_INFO and update their defintion.
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

Oleksii Kurochko (6):
  xen: introduce SIMPLE_DECL_SECTION
  xen: define ACPI and DT device info sections macros
  xen/arm: use {DT,ACPI}_DEV_INFO for device info sections
  xen/ppc: add section for device information in linker script
  xen/riscv: add section for device information in linker script
  xen/common: move device initialization code to common code

 xen/arch/arm/device.c     | 71 +--------------------------------
 xen/arch/arm/xen.lds.S    | 16 ++------
 xen/arch/ppc/xen.lds.S    |  2 +
 xen/arch/riscv/xen.lds.S  |  4 ++
 xen/arch/x86/xen.lds.S    |  6 ++-
 xen/common/Makefile       |  2 +
 xen/common/device.c       | 82 +++++++++++++++++++++++++++++++++++++++
 xen/include/xen/xen.lds.h | 22 +++++++++++
 8 files changed, 122 insertions(+), 83 deletions(-)
 create mode 100644 xen/common/device.c

-- 
2.46.1


