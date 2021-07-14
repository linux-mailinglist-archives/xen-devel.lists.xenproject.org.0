Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 914533C9243
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jul 2021 22:38:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156211.288250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3ldy-0008Tm-G3; Wed, 14 Jul 2021 20:38:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156211.288250; Wed, 14 Jul 2021 20:38:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3ldy-0008R9-CE; Wed, 14 Jul 2021 20:38:10 +0000
Received: by outflank-mailman (input) for mailman id 156211;
 Wed, 14 Jul 2021 20:38:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kxbS=MG=gmail.com=bobby.eshleman@srs-us1.protection.inumbo.net>)
 id 1m3ldw-0008R3-ES
 for xen-devel@lists.xenproject.org; Wed, 14 Jul 2021 20:38:08 +0000
Received: from mail-pj1-x1033.google.com (unknown [2607:f8b0:4864:20::1033])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 575e2b66-9645-42dc-abe3-f8229d8b3b29;
 Wed, 14 Jul 2021 20:38:07 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id cu14so2389933pjb.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jul 2021 13:38:07 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:4c02:4c00::1])
 by smtp.gmail.com with ESMTPSA id b17sm1785084pfm.54.2021.07.14.13.38.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 13:38:05 -0700 (PDT)
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
X-Inumbo-ID: 575e2b66-9645-42dc-abe3-f8229d8b3b29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eXcmPYRmIZRKai4yvtuLaU2ooiqorDKfUQfup3P5Zt4=;
        b=Sx4ofn3BsRNqQBpJ2nDg9fTrutZKk0CwtgNd79WCd/1koyMUyoq+HYtahHHYEQQenA
         1imXWXjGuM/vMd4JiSb468D1fB7WoNfPQVStakW3yPMQbwZop5aVbAG/6x3g/VNZmi2h
         JMAZ0e25Xs1VtzBJbJiGqTqxRO5KnTjCbAkb/M4+pZ+xAo8hRBxY0z5B44ywtg0UKbZe
         Nc6fMKwo4KI+ZaN314XXjghIBdTFEB4ZRCNCwmrQlU9t7/5f9YzkAWOHYh4AjYR7aS+b
         Vi64pEUVM0RqTby9if0BAF+vI01zmQj7G8J+4nvIh1QQR91+MfHup4/TWH4lZjcqz8na
         GK/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=eXcmPYRmIZRKai4yvtuLaU2ooiqorDKfUQfup3P5Zt4=;
        b=EmDXFdTZu9Oc/0zBQKyzCvEenwxWnfQLuCo/MndNA3aiE0V8dYRKRZnbJyitKIjUWe
         QWzFMwoDdux7FAsSrji0ld2Rg/OzahbXZ+lVBB77xHXejhykXATXd0AUBxrfgrhgaYuD
         H/xkRzlj0eZYljHQ20DVbizV7Lh4HaLwy0JtnOZTk4IFk1mVaq0fLfaKVLbGxDCwlXV7
         molaxvyyA+oepxMJeUUazeYTu5ShmHuqfskT85MT311BoYdyY5nbGXB2gJlgYmZ8WeMV
         c++UlybEs+PLy8Y/TVb8mOVEgFJfBfr4bI6toggRfzNUin2zXN5VwTpAGYsIxtWUZVbx
         GhVA==
X-Gm-Message-State: AOAM533ZLWJTCS49CQwrCjBqJTPYZA+CnBlG/uU4F8VIiu0CXCrft9AG
	r2TDHCXNrWRNpXvMZeD6Ha/z+cve5UtbsyzK
X-Google-Smtp-Source: ABdhPJwoG2TovbVlMxzfxRY6/Ca8T2EZEP7yktYl5Aj24XP0eW14eOrl/rmJNgSSgzOvHSpVEoq+PA==
X-Received: by 2002:a17:90a:7489:: with SMTP id p9mr5559384pjk.101.1626295086392;
        Wed, 14 Jul 2021 13:38:06 -0700 (PDT)
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
Subject: [PATCH v2 0/4] Remove unconditional arch dependency on asm/debugger.h 
Date: Wed, 14 Jul 2021 13:37:43 -0700
Message-Id: <cover.1626286772.git.bobby.eshleman@gmail.com>
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
* Moves parts of the x86 implementation to "arch/x86/debugger.c".
* Removes the ARM calls to its stubs.
* Centralizes non-inlined x86 code conditionally compiled by CONFIG_CRASH_DEBUG
  into arch/x86/debugger.c, which is now conditionally built for
  CONFIG_CRASH_DEBUG via Kbuild (i.e., obj-$(CONFIG_CRASH_DEBUG)).
* Tries to improve the x86 implementation by not inlining large
  functions (but preserving inlining for those that seemed "small").

Bobby Eshleman (4):
  arm/traps: remove debugger_trap_fatal() calls
  build: use common stubs for debugger_trap_* functions if
    !CONFIG_CRASH_DEBUG
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
 xen/include/asm-x86/debugger.h  | 86 ++++++---------------------------
 xen/include/xen/debugger.h      | 69 ++++++++++++++++++++++++++
 21 files changed, 157 insertions(+), 122 deletions(-)
 create mode 100644 xen/arch/x86/debugger.c
 delete mode 100644 xen/include/asm-arm/debugger.h
 create mode 100644 xen/include/xen/debugger.h

-- 
2.30.0


