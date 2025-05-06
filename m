Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F95AAC717
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 15:57:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977320.1364348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCInF-0007O8-LK; Tue, 06 May 2025 13:57:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977320.1364348; Tue, 06 May 2025 13:57:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCInF-0007Mh-FV; Tue, 06 May 2025 13:57:09 +0000
Received: by outflank-mailman (input) for mailman id 977320;
 Tue, 06 May 2025 13:57:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=15Tu=XW=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uCInD-0007Kz-IO
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 13:57:07 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fef31086-2a81-11f0-9eb4-5ba50f476ded;
 Tue, 06 May 2025 15:57:06 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3912fdddf8fso4155909f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 06:57:06 -0700 (PDT)
Received: from localhost.localdomain (172.74.6.51.dyn.plus.net. [51.6.74.172])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a099b170e7sm13503239f8f.86.2025.05.06.06.57.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 06:57:05 -0700 (PDT)
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
X-Inumbo-ID: fef31086-2a81-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1746539826; x=1747144626; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oS5Ne5DXGsGr+AaaxvmOawzW3uBF8/+h3VkNJfwE/uY=;
        b=A82E9TI+D+Pbg3ACT665N9129YAH1hp2KcxwJQWvAJq4TdxZonXyBLjnajO2JFzxRu
         Y4I/JvhDO1vuF+rdfROe01AR4PG4SC0zRnf4TsZLobnbcqTubOzd/ZbeJpUS9ImZ6cMF
         LmIbObCCjZPMuuIsz9iSybrMnp7gZ3oKQXfgw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746539826; x=1747144626;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oS5Ne5DXGsGr+AaaxvmOawzW3uBF8/+h3VkNJfwE/uY=;
        b=H8Ryvx4NF6NtEECRS6C98mcopwGUVkfZ5qbPWC8dHI4X0cX/25jbh4O0VaI42iS5QK
         Mfn/+fHp3zfnBiCMgUDHlGseiDSMu1q72j8wOyAKDgFf5JEw/TjOVtNn+SiGuCinE17t
         vlxw8EZbD3SCS/16+9vD6sB0h/rYGH3SyYitTPqWLsaFEU5k9Qj7N9gmxDJncJqBgLIF
         cjQ42yaiLMvHFyNnGEHoRVgThGN3PRDh7IZI6XVjTiiNGWDwaU88MQrRf0hrbrXgQsZj
         xjdGss548wJTHBmnLYDaKo5EPlkVOKbu6SLa1cAOXRbOih5uNWY6H92LNec/jBN1YA+l
         Iusg==
X-Gm-Message-State: AOJu0Yy6Xi4clC5e7XtUUlBb5oeVcZj6JPCynLtUllbG/KSSca0k6beP
	OR5Mau91kkMbToLkoLPqPOwGI+UwXBaROuLflaK9nCWvSFlHSqv7JG28G8T1pxmLKuQjEUr2fnu
	+Fzc=
X-Gm-Gg: ASbGncvk6hEKW3MK2Wx6ibeBsQOygu3jFG3wg35fX0o4RTQSMDHVoxOV9NtKUcVouEf
	ipAy6wcDvlePR4+NRQPZRhMV5fxsnCbzsOPc0xUFpAYBn/a1y+jeyFTaSZ9DExz3jikC3hzAeXX
	um9kOAfZqsWws6DaQqSxZkxrXm+sFNLqFIeqqkpRSRvdOTfLE5U6avXM5zZgvb44F+ZZQ9G/sm/
	AqN1y/NWoK/hTF0eaoIw2lGD1yL0vePSs7MWtqENSbldXUDpNf2hrXt7aKfkIhPKexyFkiBaZpb
	pXjK2uRnaAfeDnaj23cZDDkC51Mdo0LlH92qmuAKaof06/c6w65swTGyHItlpFdWVRK7jS6QiR+
	qLYrUZw==
X-Google-Smtp-Source: AGHT+IGzszc9/3EBfIS3sHCl4SGT4EZ57L3XoI/LvsAgd2bRy2WU8PnStHg/q1uFk/uEpbIMM8BQZA==
X-Received: by 2002:a5d:59a7:0:b0:3a0:b334:6aab with SMTP id ffacd0b85a97d-3a0b3346d6dmr460785f8f.12.1746539825762;
        Tue, 06 May 2025 06:57:05 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 0/4] Allows Secure Boot for Kexec
Date: Tue,  6 May 2025 14:56:49 +0100
Message-ID: <20250506135655.187014-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using EFI Secure Boot all kernel level code should be signed and
there should be no way to run unchecked code.
For this reason the Kexec interface needs to be changed in order
to allows signature checking.

The purgatory code is included in Xen itself as passing this code
from userspace it's not secure (see patches 2/4 and 3/4).

Ross Lagerwall (4):
  xen/lib: Export additional sha256 functions
  kexec: Include purgatory in Xen
  kexec: Implement new EFI load types
  kexec: Support non-page-aligned kexec segments

 xen/arch/arm/Makefile                 |   1 +
 xen/arch/arm/kexec.c                  |  27 +
 xen/arch/x86/Makefile                 |   2 +
 xen/arch/x86/bzimage.c                |  40 +-
 xen/arch/x86/kexec.c                  | 125 +++++
 xen/arch/x86/purgatory/.gitignore     |   3 +
 xen/arch/x86/purgatory/Makefile       |  64 +++
 xen/arch/x86/purgatory/config.h       |  37 ++
 xen/arch/x86/purgatory/entry64.S      | 108 ++++
 xen/arch/x86/purgatory/purgatory.c    |  59 +++
 xen/arch/x86/purgatory/setup-x86_64.S |  63 +++
 xen/arch/x86/purgatory/stack.S        |  21 +
 xen/common/Kconfig                    |   1 +
 xen/common/kexec.c                    |  33 +-
 xen/common/kimage.c                   | 703 ++++++++++++++++++++++++--
 xen/include/public/kexec.h            |  23 +-
 xen/include/xen/kimage.h              |  57 ++-
 xen/include/xen/sha2.h                |  10 +
 xen/include/xen/x86-linux.h           |  62 +++
 xen/lib/sha2-256.c                    |  16 +-
 20 files changed, 1344 insertions(+), 111 deletions(-)
 create mode 100644 xen/arch/arm/kexec.c
 create mode 100644 xen/arch/x86/kexec.c
 create mode 100644 xen/arch/x86/purgatory/.gitignore
 create mode 100644 xen/arch/x86/purgatory/Makefile
 create mode 100644 xen/arch/x86/purgatory/config.h
 create mode 100644 xen/arch/x86/purgatory/entry64.S
 create mode 100644 xen/arch/x86/purgatory/purgatory.c
 create mode 100644 xen/arch/x86/purgatory/setup-x86_64.S
 create mode 100644 xen/arch/x86/purgatory/stack.S
 create mode 100644 xen/include/xen/x86-linux.h

-- 
2.43.0


