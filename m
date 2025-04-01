Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C30C3A77BBB
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 15:09:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934106.1335898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzbMG-0008Lw-VB; Tue, 01 Apr 2025 13:08:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934106.1335898; Tue, 01 Apr 2025 13:08:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzbMG-0008Kf-SA; Tue, 01 Apr 2025 13:08:48 +0000
Received: by outflank-mailman (input) for mailman id 934106;
 Tue, 01 Apr 2025 13:08:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oF/L=WT=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tzbMF-0008KU-8r
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 13:08:47 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71ae02da-0efa-11f0-9ea7-5ba50f476ded;
 Tue, 01 Apr 2025 15:08:46 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5e5e0caa151so10451351a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Apr 2025 06:08:46 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 4fb4d7f45d1cf-5edfaacd006sm5569248a12.79.2025.04.01.06.08.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Apr 2025 06:08:44 -0700 (PDT)
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
X-Inumbo-ID: 71ae02da-0efa-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743512925; x=1744117725; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i+k/6xoif6G18S7LhhZwjPIf1Qq+MJLqrDCjFM/tlQQ=;
        b=KG7jlfx2h3clYX3yZjWwy6VoyhJ2aSZzl2hzNdfIMKt33n7tqPxdYOLo5wAb3s/wGc
         dL3t4vvzaiA4KxImfS5gfZdYqb0r+RUuPPvIxb5QX/4atHBpipiR685i09/uDGGs7DWF
         2AhUiTpitdHzEg/nEevOj+dK/ayLLT7lQ9A30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743512925; x=1744117725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i+k/6xoif6G18S7LhhZwjPIf1Qq+MJLqrDCjFM/tlQQ=;
        b=Kldm8DOy7ctGkOumSsFeJYTN/1ODI/goL4BGKXgKZyU1cww1QDbgJf8LSa3EChsM4M
         98NFXNfwVWmoCtSiTzA25/0tZxJwaqfeJ+ztOR6h3JzVwCD6S02aD8TBDWyF4kK6pUqC
         S33hlAOL47MN0zhL7X3+p7jzfHpEu6H0rlD7RKGNlDVWrcHhsTw38wOs29y0Q8JfaEnA
         As/ZaEvZ1W2Sr8OtXTzOlbQeQgBh/TjFGWO2YH7kjCcPMheqIqURB9mmLxX2hk4G2STg
         WRYZPm13zLJw71qZRsaxiYC7PKdnstQTtEP72N+FmQ8IxwfUvMA2/oQU04t6uBue0llr
         f5Ow==
X-Gm-Message-State: AOJu0YxWjSUbar1603Ce7xOnNM9wuZbJd/qm7wirGmEMVJnQdTqE4XxT
	YmiUOeLUVDDIeV+zkGvbK26mYy8zeUgGEwDIKuPN7xsQY/fs83srod6zBJlsj5TbLBIbWqojuGo
	5
X-Gm-Gg: ASbGnctpCsupgem9f6PQ1tCjY4aKiiE8oeaFZ1B5uOhsrbiQo/iaZEb7QToo4NPccfq
	9ZOLiB+WmQ2vU6pMaaxzNtPqbVikkSdIEU8byYGaDaIgIuKNVccL/VP0p5bqqdoJV1ylgQnRhSo
	th+553sHiTxT6nSpslZ2e6xApwrF6O/3dEOFLAjl122j2SPi545KzU8/kddIIh3+NRzZfQqYcEA
	gyX+jysCTJxEW1PinK7CuOnIImuh8+I7eg0Kr1PiaCOTQ60/eCdbqxuyuM91YmTaPHG58Yx/CmW
	Qq0bJaH2dfuBXsNRymf4u1MUH4WgBgMbM/cuu5euuGq5h+7l2g==
X-Google-Smtp-Source: AGHT+IEuEIE9Um3D9BJs1q1bWJlf4SLyF9szb3Oq6jabVbWM/EGS4SqMEm9R6Rb1xVrprqgO28w0PA==
X-Received: by 2002:a05:6402:3229:b0:5ee:486:ea33 with SMTP id 4fb4d7f45d1cf-5ee0486eb5amr11074834a12.33.1743512925295;
        Tue, 01 Apr 2025 06:08:45 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v2 00/11] x86/EFI: prevent write-execute sections
Date: Tue,  1 Apr 2025 15:08:29 +0200
Message-ID: <20250401130840.72119-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

The following series aim to remove the presence of any write and execute
section in the PE Xen image.  This is required to support the NX
compatible flag in the PE header.   By the end of the series the
resulting PE image has no relocations that apply to text sections, as
text sections are strictly mapped read-execute only.  Xen itself
attempting to apply relocations to text would result in page-faults.

A smoke test is added to Gitlab to ensure the PE NX support doesn't
regress.

Only patches 5 and 10 are carried over from v1, the rest are new.

Thanks, Roger.

Roger Pau Monne (11):
  automation/dockers: add to README how to rebuild all containers
  x86/mkreloc: fix obtaining PE image base address
  x86/mkreloc: use the string table to get names
  x86/mkreloc: print the linear address of relocations to read-only
    sections
  xen: remove -N from the linker command line
  x86/efi: discard .text.header for PE binary
  x86/efi: discard multiboot related entry code for PE binary
  x86/boot: place trampoline code in a non-execute section
  x86/efi: avoid a relocation in efi_arch_post_exit_boot()
  x86/efi: do not merge all .init sections
  automation/x86: add a xen.efi test with a strict NX OVMF build

 automation/build/README.md                   |  7 ++
 automation/build/fedora/41-x86_64.dockerfile |  5 ++
 automation/gitlab-ci/test.yaml               |  9 +++
 automation/scripts/qemu-smoke-x86-64-efi.sh  | 22 +++++-
 xen/arch/arm/Makefile                        |  6 +-
 xen/arch/ppc/Makefile                        |  6 +-
 xen/arch/riscv/Makefile                      |  6 +-
 xen/arch/x86/Makefile                        | 12 +--
 xen/arch/x86/boot/head.S                     |  3 +-
 xen/arch/x86/efi/efi-boot.h                  |  7 +-
 xen/arch/x86/efi/mkreloc.c                   | 77 +++++++++++++++++---
 xen/arch/x86/xen.lds.S                       | 20 +++--
 12 files changed, 138 insertions(+), 42 deletions(-)

-- 
2.48.1


