Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 508763F0CC4
	for <lists+xen-devel@lfdr.de>; Wed, 18 Aug 2021 22:30:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168316.307320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGSCC-00073a-NL; Wed, 18 Aug 2021 20:29:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168316.307320; Wed, 18 Aug 2021 20:29:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGSCC-00071A-JV; Wed, 18 Aug 2021 20:29:56 +0000
Received: by outflank-mailman (input) for mailman id 168316;
 Wed, 18 Aug 2021 20:29:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ydNC=NJ=gmail.com=bobby.eshleman@srs-us1.protection.inumbo.net>)
 id 1mGSCA-000714-VF
 for xen-devel@lists.xenproject.org; Wed, 18 Aug 2021 20:29:55 +0000
Received: from mail-pj1-x102c.google.com (unknown [2607:f8b0:4864:20::102c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d740647c-5eb4-4007-8751-e66f4540bb92;
 Wed, 18 Aug 2021 20:29:53 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 j12-20020a17090aeb0c00b00179530520b3so9804908pjz.0
 for <xen-devel@lists.xenproject.org>; Wed, 18 Aug 2021 13:29:48 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:4c02:4c00::1])
 by smtp.gmail.com with ESMTPSA id h25sm663775pfo.68.2021.08.18.13.29.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 13:29:46 -0700 (PDT)
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
X-Inumbo-ID: d740647c-5eb4-4007-8751-e66f4540bb92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b02+86zjfz6ve6S+6y+p2A99AWJfDb+ZIKYvJJ1KYDk=;
        b=J1DjSPDAIKhgk/ykpGGR/BFcIkjx4/jHakJ3N6hc8QWv3gy2gxwdwHl4Fyhyo3YEXW
         Nbtsdyp5b2Ohrda8MMa8xij5qqQbHPXCDLX9aeRm/Q/sgZx9lzSASNFaCIsoHM8w2r0N
         KGxbV0272EynGg5VSSjtw5+DXWPntzJ2QYWgJog/GvPEQy3M1lJzS26jD+l1zOWE2H7b
         NjDIe2Pn0gRw6y0rs+iqJ0cMQ4PrlygVycuMYATH293NsnmJ5Cb95hqRN53JcrvZvA0O
         AmQAYCJfwOfzysEgwwYxl/4mv66BSBgPLhC42PzGSGIx7hUAqD8sWXG47ASz8FfUBaNN
         5adA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=b02+86zjfz6ve6S+6y+p2A99AWJfDb+ZIKYvJJ1KYDk=;
        b=QgYzD/33ZehUzl2gc0NZIM84dFLQpa0X3k0+5zQsMf7htN7IeW46tH4TjMfkwisrCB
         akCZBt5kpDYc66bQV3HhWWFJTYfkcjnhme+PoS57agrGmFk7+GPlnFbGA7YxTB4WDre8
         ri7p2QtolElQQ1vemb+dbVaPFYCtw7Kh9Ue0yV2aOA0biVuYfZcbpUkm537bQFLsfgSX
         PzX8WCZr+3SkvdD6Gfw1PvpENo3EaCzaKzXU+YrLOHlZ968VL9Yw6du2UN39t86mO8d1
         9YfCTCR0Thnh2gnIwKmIsScySNjVWYedqVbzsm/M5r8oe2wnSK1xo42ffuG4MSs+R6/H
         IxKA==
X-Gm-Message-State: AOAM533UfhBI2/z5o+eHTvT1L0opheI3x8HJlJTH5ZOEYcVY8nA6+nts
	w8QOJlkmpCVTmepk3IMB3U5LJj9lNVqhgmkV
X-Google-Smtp-Source: ABdhPJxSIgLQuhU1DK4rqJWjaewv3zLATJ6PVJ7XzJXqs3cciIGI7Zqg/Xp1nxAyRGijlXMMzSnHqA==
X-Received: by 2002:a17:902:ed82:b029:ef:48c8:128e with SMTP id e2-20020a170902ed82b02900ef48c8128emr8801565plj.72.1629318586973;
        Wed, 18 Aug 2021 13:29:46 -0700 (PDT)
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
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>
Subject: [PATCH v3 0/6] Remove unconditional arch dependency on asm/debugger.h 
Date: Wed, 18 Aug 2021 13:29:01 -0700
Message-Id: <cover.1629315873.git.bobby.eshleman@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series removes the unconditional requirement that all architectures
implement asm/debugger.h. It additionally removes arm's debugger.h and
disentangles some of the x86 gdbsx/gdbstub/generic debugger code.

Additionally, this series does the following:
- Provides generic stubs when !CONFIG_CRASH_DEBUG
- Adds stronger separation between gdbstub, gdbsx, and generic debugger
  code.

The patches in this v3 are quite a bit different than in v2, so
per-patch changes are omitted. This difference in the patchset version
is largely due to the need to decouple the debugger_trap_* functions.

Changes from v2:
- The first patch drops ARM's calls to the debugger stubs, removing the
  need to add fake values.
- No debugger.c is added, as it was unnecessary when code was moved into
  existing and appropriate files.
- debugger_trap_entry() expands inline into its few call sites
- debug.c becomes gdbsx.c
- All gdbsx functions move into gdbsx.c and become dependent on
  CONFIG_GDBSX (instead of CONFIG_CRASH_DEBUG as was the case for
  domain_pause_for_debugger(), for example)

It's worth noting that debugger.h is still not truly generic as
debugger_trap_fatal() for x86 necessarily calls into the gdbstub… but
further generalization is unnecessary while it is still only
backed by the gdbstub.

As I'm not *exactly* an expert on this code, so feel free to inform me of my
confusion where you see it.

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
 xen/arch/x86/{debug.c => gdbsx.c} | 30 +++++++-------
 xen/arch/x86/hvm/svm/svm.c        |  2 +-
 xen/arch/x86/hvm/vmx/realmode.c   |  2 +-
 xen/arch/x86/hvm/vmx/vmx.c        |  2 +-
 xen/arch/x86/nmi.c                |  1 -
 xen/arch/x86/traps.c              | 51 ++++++++++++++----------
 xen/common/domain.c               |  2 +-
 xen/common/gdbstub.c              |  2 +-
 xen/common/keyhandler.c           |  2 +-
 xen/common/shutdown.c             |  2 +-
 xen/drivers/char/console.c        |  2 +-
 xen/include/asm-arm/debugger.h    | 15 -------
 xen/include/asm-x86/debugger.h    | 65 +------------------------------
 xen/include/asm-x86/domain.h      |  2 +
 xen/include/asm-x86/gdbsx.h       | 17 ++++++++
 xen/include/xen/debugger.h        | 51 ++++++++++++++++++++++++
 20 files changed, 127 insertions(+), 144 deletions(-)
 rename xen/arch/x86/{debug.c => gdbsx.c} (89%)
 delete mode 100644 xen/include/asm-arm/debugger.h
 create mode 100644 xen/include/asm-x86/gdbsx.h
 create mode 100644 xen/include/xen/debugger.h

-- 
2.32.0


