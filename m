Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3313ACAF66
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 15:47:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003398.1382946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM5VA-0006nz-J9; Mon, 02 Jun 2025 13:46:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003398.1382946; Mon, 02 Jun 2025 13:46:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM5VA-0006ln-Fo; Mon, 02 Jun 2025 13:46:56 +0000
Received: by outflank-mailman (input) for mailman id 1003398;
 Mon, 02 Jun 2025 13:46:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jabw=YR=cloud.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1uM5V9-0006ld-NQ
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 13:46:55 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ae89121-3fb8-11f0-a300-13f23c93f187;
 Mon, 02 Jun 2025 15:46:54 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-ad574992fcaso719113366b.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 06:46:54 -0700 (PDT)
Received: from fedora.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ada5dd04591sm790372466b.114.2025.06.02.06.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jun 2025 06:46:52 -0700 (PDT)
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
X-Inumbo-ID: 0ae89121-3fb8-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1748872013; x=1749476813; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SiLwLWHFfreci1k3/3don9flm/R9wvMppu+kYNStDuY=;
        b=Q2S7/wrsTIPUnpe7q5hS5t+azV4AUjvckPrH1vepCUYEerNJHDNvO5QC6lgIwr0fgR
         7+02JbAQ4p6wefenngf/w49lVLss0z5rN5rct+ktqv3Gku0JZRom1Kw8nPFQNpkMTN70
         X2bCogvBkNQo9Esy5087jb222E+XUH8MQ88Qg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748872013; x=1749476813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SiLwLWHFfreci1k3/3don9flm/R9wvMppu+kYNStDuY=;
        b=thew16DWdR51lgLL7fRxKwuQbPpxKju1weKIpk7t+OtRSSDYr8oYzpabdXdIMTBNjO
         JCzRsumoHmVytyqz/2eQ2HFp6aUefz58FU7I6U6o+bBELlmVkakD/iOcxT9HH+4Woagx
         X8/ELewzorLSz3LEgzv/iXEnhLzEdFk+bj0hMVhsoH9Lr2Ow/Vt+PtcGZBx11xFlPkst
         8PwGjbNJnUKg+JBG2nZOoE/GrA022hckWkUkHBo3hhbbyoxmQlX35OuSVQNiaBWnhnov
         C/mcUjnvH2IttPkZaqIPXqyg8RtlJ2cogfWkjGc6+kK03vs+FkodxbBMlDttB8CGtj0r
         DsJg==
X-Gm-Message-State: AOJu0YziAw8Mv69By34CTtOv+s8F/VMuXR/YoO9Mxxv5PhZArabLlAdc
	x2qKetsxAjk/vEk5sx3/agfu0FcgRlR3QIUlXdZSSoN1RNlyH/ZzJK7KQP2pozPsLqABjtJQ9Cz
	VkO8K
X-Gm-Gg: ASbGnctncxzLRRLjLAHR9/v8IqMZ9twh2rmT9ySbuaZvgdT39KShQ2zZuzyrGkxBP22
	5v6YJyI0H6c+RMTcJOVR06rEzUunZdJdDZ2TDwwHZc65+bQvWyTuSncpxCpaCaX+M3i/fiX6Hss
	vWzAMepLgpSjBrjCAO93/x+5jUCK1UxtFxJpU6X8JEpB+trabjcz3DJPz2oKk/E829L1QgGTF/p
	nhR+5Tikqf59dHf3vui1tR5o6GRp4BWENEys/x0+akO2AjlSLJXbi0APkcpogj5jh3x3FThqLLa
	K60XMXN7m3zO0VRhj/ejlNf6Djw1qEIymVXZ/dRbaN3vGbhgruBWv0YOOS1mcSNGwH+E
X-Google-Smtp-Source: AGHT+IEekP3SlKgi9Gm7hF2YLLrf+Abm5uS3+eZNmxPiCwBrxgYH2DuEAeJ0J0RkbFA+ZDbKJ6bRTA==
X-Received: by 2002:a17:907:980e:b0:ad8:a935:b90b with SMTP id a640c23a62f3a-adb494d689cmr839378666b.28.1748872012869;
        Mon, 02 Jun 2025 06:46:52 -0700 (PDT)
From: Kevin Lampis <kevin.lampis@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Kevin Lampis <kevin.lampis@cloud.com>
Subject: [PATCH v2 0/3] Add lockdown mode
Date: Mon,  2 Jun 2025 14:46:53 +0100
Message-ID: <20250602134656.3836280-1-kevin.lampis@cloud.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The intention of lockdown mode is to prevent attacks from a rogue dom0
userspace from compromising the system. Lockdown mode can be controlled by a
Kconfig option and a command-line parameter. It is also enabled automatically
when Secure Boot is enabled and it cannot be disabled in that case.

Ross Lagerwall (2):
  efi: Add a function to check if Secure Boot mode is enabled
  Add lockdown mode

Kevin Lampis (1):
  Disallow most command-line options when lockdown mode is enabled

 docs/misc/xen-command-line.pandoc     | 16 ++++++++
 xen/arch/arm/domain_build.c           |  4 +-
 xen/arch/x86/acpi/cpu_idle.c          |  2 +-
 xen/arch/x86/cpu/amd.c                |  2 +-
 xen/arch/x86/cpu/mcheck/mce.c         |  2 +-
 xen/arch/x86/cpu/microcode/core.c     |  2 +-
 xen/arch/x86/dom0_build.c             |  4 +-
 xen/arch/x86/hvm/hvm.c                |  2 +-
 xen/arch/x86/irq.c                    |  2 +-
 xen/arch/x86/nmi.c                    |  2 +-
 xen/arch/x86/setup.c                  |  3 +-
 xen/arch/x86/traps.c                  |  2 +-
 xen/arch/x86/x86_64/mmconfig-shared.c |  2 +-
 xen/common/Kconfig                    |  8 ++++
 xen/common/Makefile                   |  1 +
 xen/common/domain.c                   |  2 +-
 xen/common/efi/boot.c                 | 23 ++++++++++++
 xen/common/efi/runtime.c              |  3 ++
 xen/common/kernel.c                   | 17 ++++++++-
 xen/common/kexec.c                    |  2 +-
 xen/common/lockdown.c                 | 54 +++++++++++++++++++++++++++
 xen/common/numa.c                     |  2 +-
 xen/common/page_alloc.c               |  2 +-
 xen/common/shutdown.c                 |  2 +-
 xen/drivers/char/console.c            |  2 +-
 xen/drivers/char/ns16550.c            |  4 +-
 xen/drivers/video/vga.c               |  2 +-
 xen/include/xen/efi.h                 |  6 +++
 xen/include/xen/lockdown.h            | 11 ++++++
 xen/include/xen/param.h               | 49 ++++++++++++++++++------
 30 files changed, 200 insertions(+), 35 deletions(-)
 create mode 100644 xen/common/lockdown.c
 create mode 100644 xen/include/xen/lockdown.h

-- 
2.42.0


