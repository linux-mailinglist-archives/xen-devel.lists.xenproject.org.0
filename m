Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3383C6854
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 04:01:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.154937.286155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m37j4-00019i-Ov; Tue, 13 Jul 2021 02:00:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 154937.286155; Tue, 13 Jul 2021 02:00:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m37j4-00017C-LR; Tue, 13 Jul 2021 02:00:46 +0000
Received: by outflank-mailman (input) for mailman id 154937;
 Tue, 13 Jul 2021 02:00:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yAHm=MF=gmail.com=bobby.eshleman@srs-us1.protection.inumbo.net>)
 id 1m37j3-000176-4j
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 02:00:45 +0000
Received: from mail-pl1-x62a.google.com (unknown [2607:f8b0:4864:20::62a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6bd7ad08-2fb5-4a1e-b973-6d5dbdb8c28f;
 Tue, 13 Jul 2021 02:00:44 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id a14so10270753pls.4
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jul 2021 19:00:44 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:4c02:4c00::1])
 by smtp.gmail.com with ESMTPSA id o20sm19285728pgv.80.2021.07.12.19.00.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 19:00:42 -0700 (PDT)
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
X-Inumbo-ID: 6bd7ad08-2fb5-4a1e-b973-6d5dbdb8c28f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TJffYyNEYPV7UUGUzzKW/M1E28weI4MdqsDg7hJV21Q=;
        b=Enz2IR2ui9Lm/csfiIqHAkSlODOLLVEBqz0DgAFNvvIZIQBX6mDlWZJpjBpambWFIL
         MHhh17gAaWEeEEb6KXyhNAc/DsiIqhc6hY/eAbA3CyXcITmZLlqHx1SguRpW1CS7OjVr
         PLfZZv/kTOeKR1JUH7xmfkNFTUYZNAHi4e8gwsy1setka5FHhFlRFMCWbNQCnMKmNJ09
         YVE4XGFRyd94QYp2pUC6K2cthmxyXM+ExKug3d5o7Eufh5m5/EmfJjeiiGb7F5XfjXZM
         QKMUKAcrrHkyuXrOkefxvLP8VOe0D5xhIG1wzaju37RxHtWkNt3F5sXSYRVfSkAhXLuD
         EMKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=TJffYyNEYPV7UUGUzzKW/M1E28weI4MdqsDg7hJV21Q=;
        b=ZMkkivhqbUHM6UcuTpToPN4TDvU13onIlxbMbBhYTg9u9o9yrLVe6oi/QOC3qKQd88
         sfjdpC3xhwpUiQK27sXTnwqFvAsC1MszMXAqHj6DXFbx0o333N8xR3P1AvSamT1Ka8Qr
         C/w4lig8fj1LFUmPoJrLkfLGmUdGJykw2niGx82EgykaWLec886qCdEMd7rzuNG+vwba
         pDFDdEhOG4/SYrYeCWF3JgdO01Lx8VcGP31FPXQtjJdxjdUyVOhYXwcG/Ch8sMHHVYA6
         L21SMD9Hul5Sxmv+Ru6UMUE+soJuYbidwcC+Z5Al47A/ZA7IAsumuWF620KRducsYjBZ
         OsnA==
X-Gm-Message-State: AOAM532n2aizVxwey0cIGFcN5nJudnzKc65vTmwkKWbXXu2kwbVbGMpK
	36ubEbjUvoSyXpAbo7EbcFE5TbrTu8MqVL+S
X-Google-Smtp-Source: ABdhPJzNjulYimGQpHlHc9BG4XxMgISJNxKkD/IERvShv13AmrJE+pPTkSytcvoREsdUEMUeHZfdJA==
X-Received: by 2002:a17:90a:fb51:: with SMTP id iq17mr17121198pjb.36.1626141642969;
        Mon, 12 Jul 2021 19:00:42 -0700 (PDT)
Sender: Bobby Eshleman <bobbyeshleman@gmail.com>
From: Bobby Eshleman <bobby.eshleman@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Bobby Eshleman <bobby.eshleman@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH 0/4] Remove unconditional arch dependency on asm/debugger.h
Date: Mon, 12 Jul 2021 18:59:52 -0700
Message-Id: <cover.1626134829.git.bobby.eshleman@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, any architecture wishing to use common/ is likely
to be required to implement the functions found in "asm/debugger.h".
Some architectures, however, do not have an actual use for these
functions and so are forced to implement stubs.  This patch does the
following:

* Supplies common stubs if !CONFIG_CRASH_DEBUG for any architecture,
  removing the need for all new architectures to have "asm/debugger.h".
* Moves the x86 implementation to "arch/x86/debugger.c".
* Removes the ARM calls to its stubs.
* Centralizes x86 code conditionally compiled by CONFIG_CRASH_DEBUG
  into arch/x86/debugger.c, which is now conditionally built for
  CONFIG_CRASH_DEBUG via Kbuild (i.e., obj-$(CONFIG_CRASH_DEBUG)).
* Tries to improve the x86 implementation by not inlining large
  functions (but preserving inlining for those that seemed "small").

Bobby Eshleman (4):
  build: use common stubs for debugger_trap_* functions if
    !CONFIG_CRASH_DEBUG
  arm/traps: remove debugger_trap_fatal() calls
  x86/debug: move debugger_trap_entry into debugger.c not inlined
  x86/debug: move domain_pause_for_debugger to debugger.c

 xen/arch/arm/traps.c            |  8 +--
 xen/arch/x86/Makefile           |  1 +
 xen/arch/x86/debug.c            |  2 +-
 xen/arch/x86/debugger.c         | 53 ++++++++++++++++++++
 xen/arch/x86/domain.c           | 15 +-----
 xen/arch/x86/domctl.c           |  2 +-
 xen/arch/x86/gdbstub.c          |  4 +-
 xen/arch/x86/hvm/svm/svm.c      |  2 +-
 xen/arch/x86/hvm/vmx/realmode.c |  2 +-
 xen/arch/x86/hvm/vmx/vmx.c      |  2 +-
 xen/arch/x86/nmi.c              |  2 +-
 xen/arch/x86/traps.c            |  2 +-
 xen/arch/x86/x86_64/gdbstub.c   |  3 +-
 xen/common/domain.c             |  2 +-
 xen/common/gdbstub.c            |  3 +-
 xen/common/keyhandler.c         |  2 +-
 xen/common/shutdown.c           |  2 +-
 xen/drivers/char/console.c      |  2 +-
 xen/include/asm-arm/debugger.h  | 15 ------
 xen/include/asm-x86/debugger.h  | 89 ++++-----------------------------
 xen/include/xen/debugger.h      | 81 ++++++++++++++++++++++++++++++
 21 files changed, 166 insertions(+), 128 deletions(-)
 create mode 100644 xen/arch/x86/debugger.c
 delete mode 100644 xen/include/asm-arm/debugger.h
 create mode 100644 xen/include/xen/debugger.h

-- 
2.30.0


