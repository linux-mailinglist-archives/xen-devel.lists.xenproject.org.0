Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 843779516A9
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 10:35:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776847.1187030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1se9T9-0003t3-DN; Wed, 14 Aug 2024 08:34:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776847.1187030; Wed, 14 Aug 2024 08:34:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1se9T9-0003pe-Af; Wed, 14 Aug 2024 08:34:59 +0000
Received: by outflank-mailman (input) for mailman id 776847;
 Wed, 14 Aug 2024 08:34:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jxPN=PN=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1se9T7-0003IY-Pv
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2024 08:34:57 +0000
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [2607:f8b0:4864:20::72c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15637184-5a18-11ef-8776-851b0ebba9a2;
 Wed, 14 Aug 2024 10:34:56 +0200 (CEST)
Received: by mail-qk1-x72c.google.com with SMTP id
 af79cd13be357-7a1df0a9281so397778685a.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 Aug 2024 01:34:56 -0700 (PDT)
Received: from fziglio-xenia-fedora.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a4c7e05595sm407786785a.122.2024.08.14.01.34.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2024 01:34:54 -0700 (PDT)
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
X-Inumbo-ID: 15637184-5a18-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1723624495; x=1724229295; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BZa9e6Ro4WdFyS/CD9RCAzzR7cxVkwW0r40u2r8Z0Ts=;
        b=bCTxZZM0tH4jjaWWvIUs2t2QyxygGWtLeyz1+Ld09kf0Bs54hlvtvt9f9X7g7mffVU
         HLip8qHQ35T+wz05l/LEh4/j6biOgpXQvRHaDelmUYUHyn2c1OtbUlfYN6evCEKCO0zG
         PS9HpKNO67MG4sUwRAhisGvzVEHwh7BthWuzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723624495; x=1724229295;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BZa9e6Ro4WdFyS/CD9RCAzzR7cxVkwW0r40u2r8Z0Ts=;
        b=o8Oh+MJTBLqy+rdvrO3IKRXKkGXILqzdMHwR8gC/Eme5+wllF2BXJAwdzdQBnCb1fQ
         Qtk2FdH3nx4XUGaAsIgVki4q+4fKpi/rY+08d5nsUpvaMRlSyB9C+iL/w+TTBCtfp//2
         Pr/Nu7RqhfAn9MaVqXww7fLvadlaJn703VtmSaVjn8pju61QGsn+A6eGqGc3Bucl9ncJ
         ffa95t0umHOjvb4IvKKc9LRMGDa0y+FO2SoQc+OgDWWRXjg2s7jtMg26e7BJ7WAd+ImM
         v8Sj+86Yx5+zmycaOCeZi1wdC18xCFnyA0FUk7fefCWqLkjgWELJ4RQVkaN9BiFTj8AX
         pZuA==
X-Gm-Message-State: AOJu0YzxsR32o3qM9/naUV0x/LY1Y9fz6AiQ9ef7s9ZFrXXjC/naN54m
	L3LyrLSpBofk8+0AxZc+cFRM4PXB5W2qyJo72gF43RTHh+TJWwIhdsuvkLG8Qxj+oJuKF6pWkFK
	z
X-Google-Smtp-Source: AGHT+IHabNrK44XvtF/+KU+rjUBwIe7O6mvUvG0svDszGSSuxM2iKcMD2fTnLWR2xukTKk8gkmQ2pw==
X-Received: by 2002:a05:620a:19a9:b0:79f:947:8915 with SMTP id af79cd13be357-7a4ee33e7b2mr298596085a.29.1723624494854;
        Wed, 14 Aug 2024 01:34:54 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v2 0/5] Support EFI multiboot loading using PE binary
Date: Wed, 14 Aug 2024 09:34:09 +0100
Message-ID: <20240814083428.3012-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Testing this feature in preparation for UEFI CA memory mitigation
requirements I found some issues causing the loading to fail and
other minor issues.
Details in series commit messages.
This is adding an additional way to boot Xen, using GrUB2+EFI
(xen.efi:__efi64_mb2_start).

Changes since v1:
- Changed title, apparently this is a kind of new mode;
- address lot of comments (see "Changes" in other messages).

Frediano Ziglio (5):
  x86: Put trampoline in .init.data section
  x86: Set xen_phys_start and trampoline_xen_phys_start earlier
  x86: Force proper gdt_boot_base setting
  x86: Compensate relocation in case of EFI
  x86: Rollback relocation in case of EFI multiboot

 xen/arch/x86/boot/Makefile          |  2 +-
 xen/arch/x86/boot/efi-reloc-image.c | 40 ++++++++++++++
 xen/arch/x86/boot/efi-reloc-image.h | 85 +++++++++++++++++++++++++++++
 xen/arch/x86/boot/head.S            | 72 ++++++++++++++++++------
 xen/arch/x86/efi/efi-boot.h         | 64 ++--------------------
 5 files changed, 187 insertions(+), 76 deletions(-)
 create mode 100644 xen/arch/x86/boot/efi-reloc-image.c
 create mode 100644 xen/arch/x86/boot/efi-reloc-image.h

-- 
2.45.2


