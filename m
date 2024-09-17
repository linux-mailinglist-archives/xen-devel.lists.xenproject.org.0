Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 966FA97B2DE
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2024 18:17:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800023.1209940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqarw-0001Ol-Rm; Tue, 17 Sep 2024 16:16:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800023.1209940; Tue, 17 Sep 2024 16:16:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqarw-0001Mh-Of; Tue, 17 Sep 2024 16:16:00 +0000
Received: by outflank-mailman (input) for mailman id 800023;
 Tue, 17 Sep 2024 16:15:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fqUh=QP=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sqarv-0001Mb-Sc
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2024 16:15:59 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ff8a649-7510-11ef-a0b7-8be0dac302b0;
 Tue, 17 Sep 2024 18:15:58 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-535be093a43so7211455e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Sep 2024 09:15:58 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5368704da27sm1234574e87.83.2024.09.17.09.15.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 09:15:57 -0700 (PDT)
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
X-Inumbo-ID: 1ff8a649-7510-11ef-a0b7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726589758; x=1727194558; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ydIJdffigflz2rMkSF3GBi0PQY/WHWAO2gacyvOv1es=;
        b=DkeEU+7m+HAyopNZzOU+RRrPs8Dx8Sr52horDTJIak8Z9xTbK9AzF8oBSv8Ocmoc6Z
         LAn7WhstkaqxwCXFjLTq+dJ49Pan7fCaKz/ejIHBgLxbi4VIDw2H4JPP1d7AjpfY3hTq
         7DQcvDizNOI1/Nr5/uYWXJWq0+oyeM4K+goxW8fivDDgSja/A+QluNUA9vD9q5X7RkQ3
         ibnLCUl/52gqfZWZaeG6CTL14TjCCpqXPmVHS/0GDBcHfcHrQAYs8uNvOXwppQS8QFu8
         7nkAh4d7c0J4FXeRzivAo51DFUwnJRBJj41q9HOIHLEpaRt0C84Wof4BJGecFX3XEZU9
         2yFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726589758; x=1727194558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ydIJdffigflz2rMkSF3GBi0PQY/WHWAO2gacyvOv1es=;
        b=D8c8zZ713w49VGTehJCicgUFpCOHt8LAjhPFVLzh12NhR/t6OWbwWUsIwdeTmng7i2
         fEXYe9OtelQOSoFpG3/Qv50B2wYA4I8z8UpxQBRmhRQLkfTwIwcyKkt+dYprW5272x5W
         wvvUZ8hHQR3Ve+S+ZGeR4oSq7FERLC3xjXmtoOfQfM0JvYEeMv79oB228gPunDMkSMUK
         W68exxuUo4ZdEtApAc8d7jSH1e8DR03p+b+4PnIZ86KobIdbEM8TiCpPxM25ppCn37T9
         6hc06w3sLVtDwP7GEU/2fw3Cnk74W38d3aHNHTd7WD0tatxjpYROytN0mtHQ+5GoFLJx
         bEKw==
X-Gm-Message-State: AOJu0Yy8Pb4Gh1iHNUq47ILYLSJQgDqcxtZBWyoLIK0jK0sGxLMLb4xf
	eNV1EMmlUIsgrtz9MOM7ibm0kND78uB040kM0oG7jmRCRVLdynZRFCL70w==
X-Google-Smtp-Source: AGHT+IGBqAn0NDZ/3bteKJhx7nC2k5toznmpyJk6N2kO0BnJjI5yrztzmj/ZMniAqgjytVCG6L9sOQ==
X-Received: by 2002:ac2:4bc4:0:b0:533:cf5a:eb32 with SMTP id 2adb3069b0e04-53678fba457mr11171797e87.19.1726589757775;
        Tue, 17 Sep 2024 09:15:57 -0700 (PDT)
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
Subject: [PATCH v2 0/5] Move {acpi_}device_init() and device_get_class() to common code
Date: Tue, 17 Sep 2024 18:15:50 +0200
Message-ID: <cover.1726579819.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.0
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
 xen/arch/arm/xen.lds.S    | 14 +------
 xen/arch/ppc/xen.lds.S    |  3 ++
 xen/arch/riscv/xen.lds.S  |  3 ++
 xen/common/Kconfig        |  8 ++++
 xen/common/Makefile       |  1 +
 xen/common/device.c       | 82 +++++++++++++++++++++++++++++++++++++++
 xen/include/xen/xen.lds.h | 26 +++++++++++++
 8 files changed, 127 insertions(+), 81 deletions(-)
 create mode 100644 xen/common/device.c

-- 
2.46.0


