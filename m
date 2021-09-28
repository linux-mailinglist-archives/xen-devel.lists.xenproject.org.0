Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9497941B855
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 22:31:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198414.351892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVJka-0004Qn-Jw; Tue, 28 Sep 2021 20:30:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198414.351892; Tue, 28 Sep 2021 20:30:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVJka-0004OB-G8; Tue, 28 Sep 2021 20:30:52 +0000
Received: by outflank-mailman (input) for mailman id 198414;
 Tue, 28 Sep 2021 20:30:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sVw8=OS=gmail.com=bobby.eshleman@srs-us1.protection.inumbo.net>)
 id 1mVJkY-0004O5-CI
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 20:30:50 +0000
Received: from mail-pl1-x62e.google.com (unknown [2607:f8b0:4864:20::62e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3f939467-5c9f-4369-ab96-b758b676660c;
 Tue, 28 Sep 2021 20:30:49 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id t11so14978206plq.11
 for <xen-devel@lists.xenproject.org>; Tue, 28 Sep 2021 13:30:49 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:4c02:4c00::5])
 by smtp.gmail.com with ESMTPSA id p15sm44201pfn.31.2021.09.28.13.30.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 13:30:47 -0700 (PDT)
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
X-Inumbo-ID: 3f939467-5c9f-4369-ab96-b758b676660c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iMtwLZAVHJpOgTEsa8hy0GrKBs2oDP5skUKZH5QnAzE=;
        b=MdvmXi2rLQvaG35/zPwUQl1d0zlrBnvQd+JZZB+3OBpO4ucZ0L0cR2iMgIgPdnFh40
         AUNMeDwXUTD3E7sK1zFCCcL42xG6x8ZeBIKKIcQj6QU/+VTeoYF+A7X8chfvxKE0ANhm
         wYa/vxi7IkYa0lkiyfLCE7BHBNv0bE3COmv3TltALbCx+bgrmFE/MH/MbUL3iF2xznVA
         BjMODhCb7RhTgjtBQwVxeBreOqD1z9kLCVlJIwNq+ySbvWlucKBk/XpTp6rFuOmr07U4
         Z4enqqdDMEuI6cXGoCyqIL5VBQ2sCoJoDN/P1pGx+sN2A8wML9eZcgYtym8IMjAMQAuG
         lfgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=iMtwLZAVHJpOgTEsa8hy0GrKBs2oDP5skUKZH5QnAzE=;
        b=X3VQ1rDfLLzcfBGTRAKYw9AWJoYOqH0nKzJ1fMV5njrBa+gwZ0xge1GlcjVzPDAoai
         eMDQddb6SLOEIvZa/nWLtGb85bx+P5fiw1EdQoh1b0MJxIqA1oddP/jydLXZt5xiISZ8
         QDZJZFhEda3woWASzWOQzwC6VlE03nVxLbWKr3rWBPbIze5ux4tWp+scnR7zbdKpiVTE
         kMDBnG+n9G6mP55aUMcaMTTj6cNwRNJ+Moq0lUjyjxhUIhgCJXDGArKKs/eyBsL0iUdq
         lIbOhhteAcdUxIodL56mRocKadCBwdaVqTABvy00Qfgo5hka2I+t/kOY6wx4nm/Uj+p5
         bZhg==
X-Gm-Message-State: AOAM532j1jvIXHQBSxuv3jJHqN1t+V3YhIvV43EKgnTWpbFnWrynmy6w
	M7nbmzCO2d1RSI7aQuuuJmOMmgUB1cjzr2kk
X-Google-Smtp-Source: ABdhPJwasL3UEmuqkANz46DT2jx1ehatfui8bqdx78Wjd7m9F9uqIeOmdvEAXPfWmoAvdox65yG51w==
X-Received: by 2002:a17:90b:224b:: with SMTP id hk11mr2044203pjb.231.1632861048275;
        Tue, 28 Sep 2021 13:30:48 -0700 (PDT)
Sender: Bobby Eshleman <bobbyeshleman@gmail.com>
From: Bobby Eshleman <bobby.eshleman@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Bobby Eshleman <bobby.eshleman@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>
Subject: [PATCH v4 0/6] Remove unconditional arch dependency on asm/debugger.h
Date: Tue, 28 Sep 2021 13:30:23 -0700
Message-Id: <cover.1632860589.git.bobby.eshleman@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes the unconditional requirement that all architectures
implement asm/debugger.h. It additionally removes arm's debugger.h and
disentangles some of the x86 gdbsx/gdbstub/generic debugger code.

Additionally, this series does the following:
- Provides generic stubs when !CONFIG_CRASH_DEBUG
- Adds stronger separation between gdbstub, gdbsx, and generic debugger
  code.

v4 simply includes the review feedback from v3 with no other big changes
(as was the case for v3 in comparison to v2).

Bobby Eshleman (6):
  arm/traps: remove debugger_trap_fatal() calls
  x86/debugger: separate Xen and guest debugging debugger_trap_*
    functions
  arch/x86: rename debug.c to gdbsx.c
  x86/gdbsx: expand dbg_rw_mem() inline
  arch/x86: move domain_pause_for_debugger() to domain.h
  x86: change asm/debugger.h to xen/debugger.h

 xen/arch/arm/traps.c              |  7 ----
 xen/arch/x86/Makefile             |  2 +-
 xen/arch/x86/domain.c             |  2 +-
 xen/arch/x86/domctl.c             | 12 +-----
 xen/arch/x86/{debug.c => gdbsx.c} | 28 ++++++-------
 xen/arch/x86/nmi.c                |  1 -
 xen/arch/x86/traps.c              | 52 +++++++++++++++----------
 xen/common/domain.c               |  2 +-
 xen/common/gdbstub.c              |  2 +-
 xen/common/keyhandler.c           |  2 +-
 xen/common/shutdown.c             |  2 +-
 xen/drivers/char/console.c        |  2 +-
 xen/include/asm-arm/debugger.h    | 15 -------
 xen/include/asm-x86/debugger.h    | 65 +------------------------------
 xen/include/asm-x86/domain.h      |  2 +
 xen/include/asm-x86/gdbsx.h       | 19 +++++++++
 xen/include/xen/debugger.h        | 51 ++++++++++++++++++++++++
 17 files changed, 125 insertions(+), 141 deletions(-)
 rename xen/arch/x86/{debug.c => gdbsx.c} (89%)
 delete mode 100644 xen/include/asm-arm/debugger.h
 create mode 100644 xen/include/asm-x86/gdbsx.h
 create mode 100644 xen/include/xen/debugger.h

-- 
2.32.0


