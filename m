Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3426988919
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2024 18:33:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.806398.1217750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1suDtw-0001dG-Sy; Fri, 27 Sep 2024 16:33:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 806398.1217750; Fri, 27 Sep 2024 16:33:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1suDtw-0001aY-PC; Fri, 27 Sep 2024 16:33:04 +0000
Received: by outflank-mailman (input) for mailman id 806398;
 Fri, 27 Sep 2024 16:33:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xL9K=QZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1suDtu-0001aC-SY
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2024 16:33:02 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28ecddf1-7cee-11ef-99a2-01e77a169b0f;
 Fri, 27 Sep 2024 18:33:00 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a8a897bd4f1so314418566b.3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Sep 2024 09:33:00 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c27c59bdsm150607166b.50.2024.09.27.09.32.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2024 09:32:58 -0700 (PDT)
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
X-Inumbo-ID: 28ecddf1-7cee-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727454779; x=1728059579; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a0tu7DTj5g7nVObRQTakFjT8eIHnU2aeVUoDyli4g5I=;
        b=axRvpgbXlLPJl3dJe/YQ5Efa34jIEGOwNRiHew2iUl2vI3f3lqx3gv/KbmpDD717ia
         Qcmzd9B9e/eWFoCw/e/fd5exkAuXskg1oIMBAv/XQdLQFJncuSVUGkj4FBQ0U2aMpjAW
         aqrcGjmZ4xu5e1elkQoo1nDWm8aSNaf26aoEFXo4+QXf39SV9LxFrTcukL5eK2P3LX9d
         wEDv4zgJ7z/+QK0me8IlfgA7fhBLFcY2SyYYWuVFi887ZWSOTy2PfaZt/mmYcOYg4PSG
         zmhfLCfjl+U3k372VmeLmSdWaYUk74fovFJP8L5gj1bvwvUN851rsWSoW6OyQfFa0jyx
         YP0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727454779; x=1728059579;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a0tu7DTj5g7nVObRQTakFjT8eIHnU2aeVUoDyli4g5I=;
        b=H0YxTtR5WvBPBigBI7VmWqR06dYGbQbhkxT7q3cKjC2ZBFjQNR0p1ZGkr7xl1rOrWI
         ITlIkzK/Rlo8mfngucOIscAVBqqPiWhj7Vl2V0hc9hY1REeECVJVk8mlQrTmSjEoV7aL
         XgHAQcgYlCamdzilpmjwbDk5bWCtozHzMSzS51DMtz0UQWSXGILGD7WIpQR1I8D57pHR
         r0gosBBtnIltbJtPJ4XiKTs75+mPIo2HDWq4Z9c2yQCR/2HjX28CpLIIp3rXTVsmej3f
         lbkBpPkmyI0cN/ZuAHuQQnXj7trMqvWjnFRYRa9rcz+C9d4fIkPjJpJWFTbRdCnwvP9S
         /eHA==
X-Gm-Message-State: AOJu0YxagtAdtw08bsQEy8T4mDIm6vTbRgvNIaJ/DXyefRh/F1gTI0pk
	yW2FKYb5POLUty+zyVHDpbxrzdszWewWkOVh5ivxa+urjxVBvNrf35fIiA==
X-Google-Smtp-Source: AGHT+IE8IDyalFZsKuHpj/80YtfHhAif8AUqCkfHhF+hkuOaPOM/P7GGBnvaRuQVJuGZhqjPYzJwIQ==
X-Received: by 2002:a17:907:7f8a:b0:a86:82e2:8c64 with SMTP id a640c23a62f3a-a93c492a76amr333704666b.35.1727454779160;
        Fri, 27 Sep 2024 09:32:59 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v5 0/6] Move {acpi_}device_init() and device_get_class() to common code
Date: Fri, 27 Sep 2024 18:32:50 +0200
Message-ID: <cover.1727452451.git.oleksii.kurochko@gmail.com>
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
Changes in V5:
 - Rename SIMPLE_DECL_SECTION to DECL_SECTION_WITH_LADDR and update the other
   patches correspondingly.
 - Drop macros argument for  ACPI_DEV_INFO and DT_DEV_INFO.
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
  xen: introduce DECL_SECTION_WITH_LADDR
  xen: define ACPI and DT device info sections macros
  xen/arm: use {DT,ACPI}_DEV_INFO for device info sections
  xen/ppc: add section for device information in linker script
  xen/riscv: add section for device information in linker script
  xen/common: move device initialization code to common code

 xen/arch/arm/device.c     | 71 +--------------------------------
 xen/arch/arm/xen.lds.S    | 14 +------
 xen/arch/ppc/xen.lds.S    |  4 ++
 xen/arch/riscv/xen.lds.S  |  2 +
 xen/arch/x86/xen.lds.S    |  6 ++-
 xen/common/Makefile       |  2 +
 xen/common/device.c       | 82 +++++++++++++++++++++++++++++++++++++++
 xen/include/xen/xen.lds.h | 22 +++++++++++
 8 files changed, 120 insertions(+), 83 deletions(-)
 create mode 100644 xen/common/device.c

-- 
2.46.1


