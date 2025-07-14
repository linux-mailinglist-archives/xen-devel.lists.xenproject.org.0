Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEC7B0369E
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jul 2025 08:11:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1042504.1412531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubCOv-0005iZ-Om; Mon, 14 Jul 2025 06:10:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1042504.1412531; Mon, 14 Jul 2025 06:10:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubCOv-0005hB-Il; Mon, 14 Jul 2025 06:10:57 +0000
Received: by outflank-mailman (input) for mailman id 1042504;
 Mon, 14 Jul 2025 06:10:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+BP=Z3=flex--ardb.bounces.google.com=3bp90aAgKCckp6sq+vx8v33v0t.r31Ct2-stAt00x787.Ct2463ytr8.36v@srs-se1.protection.inumbo.net>)
 id 1ubCOu-0005h5-GL
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 06:10:56 +0000
Received: from mail-ed1-x54a.google.com (mail-ed1-x54a.google.com
 [2a00:1450:4864:20::54a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d48d3b4-6079-11f0-a318-13f23c93f187;
 Mon, 14 Jul 2025 08:10:55 +0200 (CEST)
Received: by mail-ed1-x54a.google.com with SMTP id
 4fb4d7f45d1cf-60785c45274so2846160a12.2
 for <xen-devel@lists.xenproject.org>; Sun, 13 Jul 2025 23:10:55 -0700 (PDT)
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
X-Inumbo-ID: 4d48d3b4-6079-11f0-a318-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752473455; x=1753078255; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=G9Tn70FKTpBDzek73ufnJv469R3NOa6ous5bCCu5m1U=;
        b=1Aw7skWXihdJIazMic3Sg5Gke/+hkgT6NFqxCMAhXjDJ2bLYKL9sw7SA57DPoEhTHo
         JjhAEnkXpdhHxYClALCAUNzq9hKT0HeSRKvtyAH9N2/qMZixTuW/7NJqNrxk5L7H7lWJ
         Jz3WyVSRt1+9Z1cwdJ3txPRbWoTUdz+xqoLVqniSftw7w+cTOeTi9P8OXfddnTzuqbry
         Zav9kKSXU9Mj2gsAE7Y1WkZZi8g+EkbC+CJmR9kjdOnh2YTtmb2+6zfL/d+E1ZTBAohx
         rdABHjVeie5TEFV1PHTtZoNTz1u2LwGtf1wuqWA9wV8rx30t1rjzoAvFm+ClIBBEHf/Q
         Vosw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752473455; x=1753078255;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G9Tn70FKTpBDzek73ufnJv469R3NOa6ous5bCCu5m1U=;
        b=ps0UsiDwdse5pj61zXbOhCK4t6yzXI/933PEoeUAWPUBr5w35lmJbnszBh5ZRy7eAk
         Ru3aosapnskVoe2bkS+OmI+wj1Ex0n8cfiVmAW5fXODv8fCiNKDIWR/YHKMEV9HWjAy+
         2OxHK8HupDMUNGDLEIvGFM5AimNoCmZ047bioCEgKsnYa79yYAYLq4c99q8hgOFFn5yz
         rD9LAmswCvmrzFXvQ2FaU0771upFSqjeo2Sfq5oHhgFqOnIYwHXCnSh99mTBS4RUGYmV
         17RMiM+KGedKNnHPPqh/F1+sLgMrY2RwB9iR29vAeJGVwDzmGNbhs6dRblyDKHvBPDkY
         6bEg==
X-Forwarded-Encrypted: i=1; AJvYcCVs9dfEfA6lbj4QM64JwqRWzMMxFdo+QnOQOv9Uz0cI4RyQysHYREiVcYHVcjY8n9tQ5W5X3zNPnvc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwZ7vUqHTF5IZEDn1+tomqyXSDW/ypadAjlGM+ha+rZ5TG0jNkL
	KW7/qSJWZ3j6Lmmv9YIm8nkG3wi0zmkOBe5Euy2mMON48pMXs/G5CYmOE4F6kTs0Nppr/88NFQ=
	=
X-Google-Smtp-Source: AGHT+IHnMYU1tdLUgCWCMkDHtV2ofJo8Kj1jhtO5SeCzNxOoPrZb9dQJqddWyqsdiNjGgTivJJ6PBrvn
X-Received: from edbec48.prod.google.com ([2002:a05:6402:d70:b0:612:b2a:492f])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:2551:b0:60c:6c85:48dd
 with SMTP id 4fb4d7f45d1cf-611e84d5ce0mr9692143a12.23.1752473454949; Sun, 13
 Jul 2025 23:10:54 -0700 (PDT)
Date: Mon, 14 Jul 2025 08:08:44 +0200
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2042; i=ardb@kernel.org;
 h=from:subject; bh=lBZw99MDLRGQYnmUAEaW8S2w5GuCP7F3IekTWgHFi6g=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIaNk3vvT+9Y9uuM3TXFJnJtsxIyzqcz/eR/PsPqzeEKNP
 R/foYsSHaUsDGJcDLJiiiwCs/++23l6olSt8yxZmDmsTCBDGLg4BWAiJ5gZGS5KK9wuT5s0Q+Ja
 CftM/4wbF554nvlzf3ftBpG1fNZ/k0QY/nDa+K/0XKev99bz53mu6oadcpenx9Ud4TpWE21YcXy aJQ8A
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250714060843.4029171-5-ardb+git@google.com>
Subject: [RFC PATCH 0/3] Remove unused EFI runtime APIs
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Feng Tang <feng.tang@linux.alibaba.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Sunil V L <sunilvl@ventanamicro.com>, 
	Bibo Mao <maobibo@loongson.cn>, linux-rtc@vger.kernel.org, linux-efi@vger.kernel.org, 
	xen-devel@lists.xenproject.org, x86@kernel.org, 
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Using EFI runtime services to program the RTC to wake up the system is
supported in theory, but rarely works in practice. Fortunately, this
functionality is rarely [if ever] used to begin with so we can just drop
it. (Note that the EFI rtc driver is not used by x86, which programs the
CMOS rtc directly)

The same applies to GetNextHighMonoCount(), which, if implemented,
usually relies on SetVariable() under the hood *, which is often not
supported at runtime by non-x86 platforms. But it has no known users
either so let's drop support for it as well.

This means we need to drop the slightly pointless tests for it too.

* EDK2 based EFI implementations usually have a MTC variable carrying
  the monotonic counter variable, which is therefore not truly
  monotonic, given that SetVariable() will happily overwrite it. 

Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Feng Tang <feng.tang@linux.alibaba.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com> 
Cc: Sunil V L <sunilvl@ventanamicro.com>
Cc: Bibo Mao <maobibo@loongson.cn>
Cc: linux-rtc@vger.kernel.org
Cc: linux-efi@vger.kernel.org
Cc: xen-devel@lists.xenproject.org
Cc: x86@kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: loongarch@lists.linux.dev

Ard Biesheuvel (3):
  efi-rtc: Remove wakeup functionality
  efi/test: Don't bother pseudo-testing unused EFI services
  efi: Remove support for pointless, unused EFI services

 arch/x86/platform/efi/efi_64.c          |  22 ----
 drivers/firmware/efi/runtime-wrappers.c |  68 ------------
 drivers/firmware/efi/test/efi_test.c    | 108 +-------------------
 drivers/rtc/rtc-efi.c                   |  76 +-------------
 drivers/xen/efi.c                       |  56 ----------
 include/linux/efi.h                     |   6 --
 6 files changed, 4 insertions(+), 332 deletions(-)

-- 
2.50.0.727.gbf7dc18ff4-goog


