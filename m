Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1642AB453E
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 21:56:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.982142.1368702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEZGI-0006om-26; Mon, 12 May 2025 19:56:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 982142.1368702; Mon, 12 May 2025 19:56:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEZGH-0006nB-UG; Mon, 12 May 2025 19:56:29 +0000
Received: by outflank-mailman (input) for mailman id 982142;
 Mon, 12 May 2025 19:56:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f4yg=X4=cloud.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1uEZGG-0005qp-Hg
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 19:56:28 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3054e78a-2f6b-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 21:56:26 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5f3f04b5dbcso7842988a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 12:56:26 -0700 (PDT)
Received: from fedora.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2197be0c5sm656407366b.153.2025.05.12.12.56.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 12:56:24 -0700 (PDT)
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
X-Inumbo-ID: 3054e78a-2f6b-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1747079786; x=1747684586; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hc2UwIOft6g44ulLRyYuoDx+xTjE0jFaTJyTkT+U7m8=;
        b=dsZP1/4tPXcaSzmw3sw1uynawBmwjyzwIBtpt6wxNXkzujDGvcFYaGQM9gFnCKJNS/
         OwGF8FVmiVBgRhH+zT3gWiyXNfVzSzMTXmPW19o0Wlaj7L/ckF8T+FAbvB0uEevm9wwv
         M5CpWDVMS1I73BhX54RLo86qk5L2Y8VHnlBwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747079786; x=1747684586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hc2UwIOft6g44ulLRyYuoDx+xTjE0jFaTJyTkT+U7m8=;
        b=ejS8pxpblmPf7Nlbdjv7H2w635v56wQArdQqOzKU/QI6gWsJHw/8n69VEvQKGG75Mr
         jQPXcD9Bf4gcwmk5WCeWPj2lrlspuMjONoqI9MLsk6H14drPybdt7lnNDsm9RDvORQ9H
         uEBSv1Jrh7EpE//fYl3T4ulGeaJIuI5BM1QmLGnerBfJ4Y3lKN+NiFzqr8x0lxMdqHRE
         I7wEzBXqXO89sg0EroxVzwNKn6Sj1SFThysbbtSTM4dQVBzGVA2aOpX+V8OT0DpBMUPC
         iYn1zRg6HXCYpCRYmQlFI1XYIwF9PWOCwhIb6wdgOGhwKnqAM8fm0qPH40NIJXA5F54G
         +wlQ==
X-Gm-Message-State: AOJu0YwZ9SGuTUyZQTz2lODdibyzjkFQzPVqdLzFEOMZBH0/P/DZEiqg
	KM0m7G+byhc/hKEutWZo84a4V4fcvW7urjdfMKg478lSL1rZwYdegyPKWiypowU/FDDLHw89M5S
	g
X-Gm-Gg: ASbGnct2648/EmuICubTUfFkoa/ADU3HEYsgrOhsJyZq79z5/WVAtD5/v8vL7i476uu
	Mr8HSDQcwrpryPWf2R7QyNt/qTx2S1di08QzEtpMAPw0re2avibry1prGwLaiEBbj9iv1KD/ehI
	RM87jxEibd+tyqUKHvOdmgGD98aK0G6dSWE0TKmBhzxX9jVzwQVER5FGU+DGjgfVP0SuR3vtbX0
	CEAKnoHGa8f/djfXFSjs2rsvQzAPx8hEX3o8OuMA36hl98iYdesdsAZRDRMKJQR8VoR3FArsjW2
	93HcK8v/Ux0et78VIVGNeGg1A5U/E8mFuS9/12Gq3tPkEvNiSlt2MWbwbNAzzgrFnCOH
X-Google-Smtp-Source: AGHT+IE9pvRn/xzAKnL4oS+dppcEd/5LA1WeGBehGBHA2P6lkqTp22UHhwOgcTndSpr/HPMiJ/w8fw==
X-Received: by 2002:a17:907:968b:b0:ad2:2417:12d2 with SMTP id a640c23a62f3a-ad224173b1cmr1150435066b.42.1747079785599;
        Mon, 12 May 2025 12:56:25 -0700 (PDT)
From: Kevin Lampis <kevin.lampis@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Kevin Lampis <kevin.lampis@cloud.com>
Subject: [PATCH 0/3] Add lockdown mode
Date: Mon, 12 May 2025 20:56:25 +0100
Message-ID: <20250512195628.1728455-1-kevin.lampis@cloud.com>
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

 xen/arch/arm/domain_build.c           |  4 +--
 xen/arch/x86/acpi/cpu_idle.c          |  2 +-
 xen/arch/x86/cpu/amd.c                |  2 +-
 xen/arch/x86/cpu/mcheck/mce.c         |  2 +-
 xen/arch/x86/cpu/microcode/core.c     |  2 +-
 xen/arch/x86/dom0_build.c             |  4 +--
 xen/arch/x86/hvm/hvm.c                |  2 +-
 xen/arch/x86/irq.c                    |  2 +-
 xen/arch/x86/nmi.c                    |  2 +-
 xen/arch/x86/setup.c                  |  3 +-
 xen/arch/x86/traps.c                  |  2 +-
 xen/arch/x86/x86_64/mmconfig-shared.c |  2 +-
 xen/common/Kconfig                    |  8 +++++
 xen/common/Makefile                   |  1 +
 xen/common/domain.c                   |  2 +-
 xen/common/efi/boot.c                 | 23 ++++++++++++
 xen/common/efi/runtime.c              |  3 ++
 xen/common/kernel.c                   | 13 ++++++-
 xen/common/kexec.c                    |  2 +-
 xen/common/lockdown.c                 | 52 +++++++++++++++++++++++++++
 xen/common/numa.c                     |  2 +-
 xen/common/page_alloc.c               |  2 +-
 xen/common/shutdown.c                 |  2 +-
 xen/drivers/char/console.c            |  2 +-
 xen/drivers/char/ns16550.c            |  4 +--
 xen/drivers/video/vga.c               |  2 +-
 xen/include/xen/efi.h                 |  6 ++++
 xen/include/xen/lockdown.h            |  9 +++++
 xen/include/xen/param.h               | 49 +++++++++++++++++++------
 29 files changed, 176 insertions(+), 35 deletions(-)
 create mode 100644 xen/common/lockdown.c
 create mode 100644 xen/include/xen/lockdown.h

-- 
2.42.0


