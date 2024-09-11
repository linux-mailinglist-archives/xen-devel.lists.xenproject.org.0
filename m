Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E1B974F37
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 12:05:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796366.1205926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soKDS-0003fh-5M; Wed, 11 Sep 2024 10:04:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796366.1205926; Wed, 11 Sep 2024 10:04:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soKDS-0003dr-1T; Wed, 11 Sep 2024 10:04:50 +0000
Received: by outflank-mailman (input) for mailman id 796366;
 Wed, 11 Sep 2024 10:04:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TDmC=QJ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1soKDR-0003dj-3r
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 10:04:49 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4722219c-7025-11ef-a0b5-8be0dac302b0;
 Wed, 11 Sep 2024 12:04:48 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2f762de00e5so44921561fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Sep 2024 03:04:48 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f75bffc9d6sm15338281fa.42.2024.09.11.03.04.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2024 03:04:46 -0700 (PDT)
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
X-Inumbo-ID: 4722219c-7025-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726049087; x=1726653887; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pn0sbp0UwkZ8169k+iUtfqTJyB1BGsroFkTPWXEUMwg=;
        b=loM3W04zwYUdthA+WrynwoYReSdGLxJ2oO1PWCzI5PRPtxww7vcH4nY/63AGRlBOys
         cMp1ZwI3r8tWy7LGnSmGgxCvHllpEM7jKUzpnEg72mQZA/CXXfW+Lv2oD9qLZ1lOEW7i
         bVoj7I4ia3pmhlJuHdLeYC/3hgGAmj0CYU3LYTUkqU/EOrFoW4l45u2FWpDA++szhATn
         YSimYUT2W5WQIWDNQ7167Q4HPH+sk1StwQMhoSSbI1ELbWukflsAHACD5NfkDdGqd41A
         zlga1uMhnmOR+Wj87wlTMtPGzbDv0pOPpQGIAlk78XS1rcEZHyO2LJCU/PPxeR9j7NaE
         sLcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726049087; x=1726653887;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pn0sbp0UwkZ8169k+iUtfqTJyB1BGsroFkTPWXEUMwg=;
        b=r0Mfsqt0G4YTwLJFLq+KxX3FiBisWJdoCUvjc6o3s4MmzaxSOHg5RHZhZgfh8Jdski
         tI50Ns494sHVReKj+jl0sV4muWlk0gTc5kXOLZF8+5C0WY+qS78wSI8H/2HXDgQ1hMND
         aXksJpcE9WkUz9RdK3hXvi0RJjR5NrkCf5z14AUOsYVLuU3iiruq+KpqXIYlNlhMVvZN
         zRYODV9aA7qMTAloLdl4/62QAMfJLfxEM44Hw1UZ+xPs1KFqdkZyQhCSJQcuB5ltSqQe
         838b5J6NLeRPHqVEGwgMoKCwpWlMkXahhYwjlnDkqfTj6iL0jnvvnpIWAdQC4JHNfLkJ
         PqUw==
X-Gm-Message-State: AOJu0YxovG5jBPKH3YFmKgxrWoGJX+L/2UmbEJQYF7VRUDmXOrJcSaK2
	jh0knBl2HszeUV6uHJ65N/qYb+wFXeaupW5unft7O3tfD4pGMVuE75S6BA==
X-Google-Smtp-Source: AGHT+IHQiCPC03SY3xZPiA1TcURdqn2QC7GOR2aGuYB3YZRcQK9B8zSy5V84poFdEesSPu7gcMb47Q==
X-Received: by 2002:a05:651c:1501:b0:2f7:631a:6e0c with SMTP id 38308e7fff4ca-2f7631a71f6mr83341001fa.35.1726049086548;
        Wed, 11 Sep 2024 03:04:46 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v1 0/3] Move {acpi_}device_init() and device_get_class() to common code
Date: Wed, 11 Sep 2024 12:04:40 +0200
Message-ID: <cover.1726048521.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The {acpi_}device_init() and device_get_class() functions are identical across Arm and
RISC-V, and they are likely to remain the same for other architectures like PPC.
Since there is no architecture-specific logic within these functions, they are good
candidates to be moved to the common codebase.

This patch series refactors the code by moving these functions to the common directory,
reducing code duplication and simplifying future maintenance.

Oleksii Kurochko (3):
  xen/ppc: add section for device information in linker script
  xen/riscv: add section for device information in linker script
  xen/common: move device initialization code to common code

 xen/arch/arm/device.c    | 71 +---------------------------------
 xen/arch/ppc/xen.lds.S   |  7 ++++
 xen/arch/riscv/xen.lds.S |  8 ++++
 xen/common/Makefile      |  1 +
 xen/common/device.c      | 82 ++++++++++++++++++++++++++++++++++++++++
 5 files changed, 100 insertions(+), 69 deletions(-)
 create mode 100644 xen/common/device.c

-- 
2.46.0


