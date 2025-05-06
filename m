Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95158AACAD0
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 18:24:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977522.1364506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCL5J-0005SO-KU; Tue, 06 May 2025 16:23:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977522.1364506; Tue, 06 May 2025 16:23:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCL5J-0005Q5-HX; Tue, 06 May 2025 16:23:57 +0000
Received: by outflank-mailman (input) for mailman id 977522;
 Tue, 06 May 2025 16:23:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oEbg=XW=cloud.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1uCL5H-0005Pz-L9
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 16:23:55 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 810252f5-2a96-11f0-9eb4-5ba50f476ded;
 Tue, 06 May 2025 18:23:54 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-ac2bdea5a38so838325766b.0
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 09:23:54 -0700 (PDT)
Received: from fedora.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1891a2b6esm728346966b.42.2025.05.06.09.23.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 09:23:52 -0700 (PDT)
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
X-Inumbo-ID: 810252f5-2a96-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1746548634; x=1747153434; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pX0tE6d9iyJtA57cH8JYgABeCFhCYSub4Ng4AeJsFh4=;
        b=jMFZ4yI9iCXyY7GTD3rM7jwMWotxnbb6cZ5A2z2JqQOGppZJgsVOCN+8BIiO+zlNsQ
         YIfHbgAH2WLdYwrvR8Mia7ee/N9OhDtwWwm6tft3obR1SsMbpIo3758LlT+jR9wKUT1L
         7bPfF5jmKoGwZC2e4StSWOmImQ0/4v6Uak9Sk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746548634; x=1747153434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pX0tE6d9iyJtA57cH8JYgABeCFhCYSub4Ng4AeJsFh4=;
        b=e6tReGoQKsUFQNOb50eLWXOyqcpgJ3uuyjrRnQLpBx5SZ95mOHxSDyh08xMJJ4u+u6
         nbmlKCxotGc3DbXcECw6Bj/U87JQ8Vv4MZn+sXpiHH9cDvFFMOVfHQ9Bnf6l2npE66WC
         zn8OkC9APfharKUmR7jUOwpCW/TE/ldgzG+lUEqcCPtgpha4ODwmhJpuZGe1RIRifyi/
         RjhHSfSP/uOzq0VW8XCINXA0VJly8NQqUatWbJeEv/rBEGTnP/XWL5rCE0AT8+XMHy1n
         U1Nw070vYTBub2llOgWP0togojK504xVo87tJT+Y/BjI/QkNMkpOcAV217FIhHH8uRe5
         3Wag==
X-Gm-Message-State: AOJu0YwsWrJ/Ptz3qkUdQbnoMzONWpfdsMnezNEMsASpM5OMMyW0dliJ
	6d2WpVg6Q6GT2P25LMGPuBwD6Eq+Svy/rRKecPXmkD7Vxr/jj2V1G9Z2T2oZReyojgdCu+KCW7x
	B
X-Gm-Gg: ASbGncu9NIH+W88zILaeKwDQsEbwyNvYuPT5a+1FI9c5Y073Quy0Te5nAmiZMolkmP0
	1xKLUtCaH6uJxbEZn47wPy+q1dQu2Do+s8ISaHebv5Ef+t0kt9ujQHiHOMJO01/Cd9pDUKnWQZO
	H9oFRRPNv4FLc0lpb5VVKP7XsVoF8QiaHuUem8xCoQrFeAkHOIEa97rFM7R8c3Kp7O8+plE69MT
	3EfgEi0YwWZk6maNHmaFty0okMdG2/OC6EdNBRUQ2uftQSg+Sj2lHSSL+BwFE4mmmzAMLEnsVLD
	ThkIJDBcu3hX0v3vcUSMskKkAMAB6/48ZPeeKB0R1vQdoYGv0Olvu0EKXw==
X-Google-Smtp-Source: AGHT+IGeFqKlWrGxDGL/AHfXImClFuXG52wLkRmdzmWdGMR2tjxT88U5g3IbeLvHo+uS3ui90aH6Bg==
X-Received: by 2002:a17:907:9717:b0:ac8:1798:c2e7 with SMTP id a640c23a62f3a-ad1e8e34073mr5035166b.41.1746548633619;
        Tue, 06 May 2025 09:23:53 -0700 (PDT)
From: Kevin Lampis <kevin.lampis@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Kevin Lampis <kevin.lampis@cloud.com>
Subject: [PATCH 0/4] Add lockdown mode
Date: Tue,  6 May 2025 17:23:47 +0100
Message-ID: <20250506162347.1676357-1-kevin.lampis@cloud.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add lockdown mode

The intention of lockdown mode is to prevent attacks from a rogue dom0
userspace from compromising the system. Lockdown mode can be controlled by a
Kconfig option and a command-line parameter. It is also enabled automatically
when Secure Boot is enabled and it cannot be disabled in that case.

Ross Lagerwall (3):
  lib: Add strcspn function
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
 xen/include/xen/string.h              |  1 +
 xen/lib/Makefile                      |  1 +
 xen/lib/strcspn.c                     | 22 ++++++++++++
 32 files changed, 200 insertions(+), 35 deletions(-)
 create mode 100644 xen/common/lockdown.c
 create mode 100644 xen/include/xen/lockdown.h
 create mode 100644 xen/lib/strcspn.c

-- 
2.42.0


