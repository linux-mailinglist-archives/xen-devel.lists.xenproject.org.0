Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B02ECB8E45
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 14:23:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1185383.1507554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vU36O-0000LR-Ow; Fri, 12 Dec 2025 13:22:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1185383.1507554; Fri, 12 Dec 2025 13:22:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vU36O-0000IL-Lr; Fri, 12 Dec 2025 13:22:32 +0000
Received: by outflank-mailman (input) for mailman id 1185383;
 Fri, 12 Dec 2025 13:22:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qjHH=6S=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vU36O-0008Uq-4J
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 13:22:32 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9caa8426-d75d-11f0-b15b-2bf370ae4941;
 Fri, 12 Dec 2025 14:22:31 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b770f4accc0so212953266b.1
 for <xen-devel@lists.xenproject.org>; Fri, 12 Dec 2025 05:22:31 -0800 (PST)
Received: from EPUAKYIW02F7.. (pool185-5-253-4.as6723.net. [185.5.253.4])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-649820f77fbsm5168260a12.19.2025.12.12.05.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Dec 2025 05:22:28 -0800 (PST)
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
X-Inumbo-ID: 9caa8426-d75d-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765545750; x=1766150550; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mNBx5LMsdfUd9qe82mIgOXRSWoojK++pTVS48n0owKo=;
        b=VtggWk2FvbgMoEUbCzUQO/99FI1cQ3VY2+dzn3s4Cs1tAOL8du3G1jsnXCAYX9beFO
         iA2IlMKDtC/DA2BAxVysBpoJghvN0fcneqMWwbc3beioE6GJ/UjcBdluo6Rf+6He9lT7
         Pnu7IhEL3Z647UAbE7oQFel0FmlpkQoYXXrHtbySq9RaQw8YrQfle01fz4VQ+/J6EgP7
         yleQsfylI68WTRFmcFUBz6BNFjxpczOxNKV58LYAAntoo/gAsHs0rewSIu2Mjw+jXg4C
         gLKSc8fK0ccH6kY96jelqEM2ONX/EovJgvno5nUfYiPBs1A5lf0xuVzxUzI4vQyNvx7p
         aydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765545750; x=1766150550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mNBx5LMsdfUd9qe82mIgOXRSWoojK++pTVS48n0owKo=;
        b=gnEqWYup0irIJcakHisrRGIuHINc3AM/OZujr/rxem/dKMD4YruumvETJhwDldcpdD
         iOKlL/gNgXxERAuFZf2uB02MjMQ78zOMO9+6EtMGCVnGvAo2ji1u+d4t6n2eknKi/nXe
         4ADrOqpe4RDAvJMRXt1v7+1Nj76aKUat/NF+1vpG1RKYbMDdqUL9kJQ7IT0QwaIXaVih
         H3NnQtshIY6fytNwdQFf8NYok6RTGisnEr6oJ5KujJ5Nxn4b9fviVFxqi+48YxS7YqPe
         k0TxEdCLvMTiAdvxrmqRpQosk0L14QW9IVCDE0AiIzDJLzk5cM6hFJiMzCkFpcCe5E9v
         xzUQ==
X-Gm-Message-State: AOJu0YxumzZtNC5ZBLEomboGOwuGvlSfcvozWeVFHn/er1Cmgc9+arp9
	BZEa0Yww+oD1ZLW13eiRwu+0qcv1Fo4GIs46ZIP7o0WB4pWPR8htrXpz7vqN9vFW
X-Gm-Gg: AY/fxX7u8rbHRPmK2+U/gQGWH8IFM2lfage0w3Zh/TdPSJm+FqoOqe1jDhxZtn99szg
	8PbHpqaUfBdD2uYVNbnxoQHMwjrq0swZstFw6XIz93pDj/QITgDg7c945U51EvmAE6kYLIaN/xt
	cncAlyCyIXjfjWhbWTSk9l+Ph23jHzHuyZzc1gIDazJUU88EUP45Up18tv8i676YcvhRQjlbi+Z
	KYgCbleXQMIO54Mqn9Lm00YkmIm0c+M636X5escYL2Z6rdPoolvkVd5ci5OmslO5IXrI7zVN5YJ
	Hveg6GbieaDJSDde7FJdl7KeUnHYzP3PeicjOWzTKqaRjZdipXB2VctmKia5beDLaH6qjDpH+h9
	jrKM3JIy+oNtil7eNCINbC+Y13SSjpovk6Mh41l1l4S7cgbmNcXMB5GTxZMoTzFKhTw1oZRqhg2
	yXX63zVDVyBsUJqMXu57djqRvRYF/w5ZjRflwOOAKV
X-Google-Smtp-Source: AGHT+IFAlzjqS91Cy2pbsy0MFORcZJ2T6CMF3MLzqOAFGy+vzxTyxAi0J7KoHKbKGMgOUWVKt50d9A==
X-Received: by 2002:a17:907:8694:b0:b73:1e09:7377 with SMTP id a640c23a62f3a-b7d23aa5631mr200765166b.58.1765545749714;
        Fri, 12 Dec 2025 05:22:29 -0800 (PST)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v16 0/4] Enable guest suspend/resume support on ARM via vPSCI
Date: Fri, 12 Dec 2025 15:18:17 +0200
Message-ID: <cover.1765533584.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

This patch series introduces the initial support for guest suspend
and resume on ARM platforms using the PSCI SYSTEM_SUSPEND interface. The main
goal is to allow ARM guests to request suspension using PSCI and be resumed
by the control domain (e.g., via "xl resume").


Background

The PSCI SYSTEM_SUSPEND call is part of the PSCI v1.0+ specification and is
used by guests to enter the deepest possible power state. On Xen/ARM, we
emulate this interface in the virtual PSCI (vPSCI) layer for guests.

This series includes:

1. A new vPSCI implementation of the PSCI SYSTEM_SUSPEND function for guests
2. Documentation updates to SUPPORT.md to reflect PSCI and vPSCI support status
3. Enabling "xl resume" command compilation for ARM, which was previously disabled


Usage

For Linux-based guests:
  - Suspend can be triggered using: "echo mem > /sys/power/state" or "systemctl suspend"
  - Resume can be performed from control domain using: "xl resume <domain>"

For more information, refer to the official Linux kernel documentation on power management.

Note that currently, SYSTEM_SUSPEND is supported only for guest domains (not for
the hardware domain).
---

This is the first part of previous patch series and originally consist only
with necessary changes needed for guest domain suspend.

The second part can be found here:
    https://patchew.org/Xen/cover.1765472890.git.mykola._5Fkvach@epam.com/
---

Changes in V16:
- Refactor error handling in domain_resume: move logging to generic code,
  use explicit return code checking.
- Make context clearing conditional on success in arch_domain_resume.

Mykola Kvach (4):
  xen/arm: Implement PSCI SYSTEM_SUSPEND call for guests
  tools/xl: Allow compilation of 'xl resume' command on Arm
  SUPPORT.md: Document PSCI SYSTEM_SUSPEND support for guests
  CHANGELOG: Document guest suspend/resume to RAM support on Arm

 CHANGELOG.md                          |   3 +
 SUPPORT.md                            |   5 +-
 tools/include/libxl.h                 |   1 -
 tools/xl/xl.h                         |   4 +-
 tools/xl/xl_cmdtable.c                |   4 +-
 tools/xl/xl_migrate.c                 |   2 +-
 tools/xl/xl_saverestore.c             |   2 +-
 tools/xl/xl_vmcontrol.c               |  12 +--
 xen/arch/arm/domain.c                 |  39 +++++++++
 xen/arch/arm/include/asm/domain.h     |   2 +
 xen/arch/arm/include/asm/perfc_defn.h |   1 +
 xen/arch/arm/include/asm/psci.h       |   2 +
 xen/arch/arm/include/asm/suspend.h    |  27 ++++++
 xen/arch/arm/include/asm/vpsci.h      |   5 +-
 xen/arch/arm/vpsci.c                  | 116 +++++++++++++++++++++-----
 xen/common/domain.c                   |  10 +++
 xen/include/xen/suspend.h             |  25 ++++++
 17 files changed, 223 insertions(+), 37 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/suspend.h
 create mode 100644 xen/include/xen/suspend.h

-- 
2.43.0


