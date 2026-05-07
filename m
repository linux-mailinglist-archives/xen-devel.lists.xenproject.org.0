Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGnaD97J/GlhTwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 19:20:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD3B4ECCDA
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 19:20:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1302930.1576582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wL2OF-0000KM-5B; Thu, 07 May 2026 17:19:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1302930.1576582; Thu, 07 May 2026 17:19:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wL2OF-0000Hj-1a; Thu, 07 May 2026 17:19:59 +0000
Received: by outflank-mailman (input) for mailman id 1302930;
 Thu, 07 May 2026 17:19:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wL2OD-0000Hd-K5
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 17:19:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wL2OD-00A91N-0y
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 19:19:57 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69fcc999-5cb7-0a2a0a5109dd-0a2a450887cc-48
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 19:19:56 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69fcc9bc-63b5-0a2a45080019-d1558029eda1-3
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 19:19:56 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4891e86fabeso13866345e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 10:19:56 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-454177de66esm389236f8f.33.2026.05.07.10.19.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2026 10:19:53 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1778174396; x=1778779196; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=POphwgzYYY47GxmVRbKvii2lv0wTm8GzuHURFZ5pxEU=;
        b=EH/lDY5u1GiiYZyVWRLoK3xyP73V1xCB49fR7SxTaWFU3cNA/G3n3yoJnq1M1eDyxt
         8ydelOQeVx3AO1l0EwtVw+NGqxNx6ipc15so7E8P/l9nfjSgP+zwxgD29+U6aABYZAsA
         MZp6aancCJOm/I+7sgOZ8M0uKXG3ByXtEe5ck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778174396; x=1778779196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=POphwgzYYY47GxmVRbKvii2lv0wTm8GzuHURFZ5pxEU=;
        b=GW0EWvQDpe5n1JRnuVB2M9bcljjBIzFLZIdL5Jc+6zxjf6vhOocptzA7C7qsnw+nrJ
         tqH44qSj7jWLNGMjLVXsEYFWIWUbdJfhwJqeFLBUFqNnlkh6ldU6ycDc+IXD/v4WLF0+
         Tzo0daMXgELlX8VU9o309s4jPR4WhYObD/Q1CmG2WtYJb4G53aO2DSSStWY7hilG/F02
         mrwy8AYbep4YGP0uDLC0jUfrBLL5J8AgBUOSgWrIdbRaSuGxNx78nYIT/xurnRLs4SN9
         mNhHAxhWHY1XlFXZaNr0l0a3TbjrdwRrGXT9j2So6JP5Gn7+vmLAjm4D3oDS/0JYXJP9
         YddA==
X-Gm-Message-State: AOJu0Ywa9h6fO9C0FTmPemxOPEVu2/cfsRuAWzwWbwDcU/jw5gIo1P20
	6AeBK0/eKamPWF01iwXmUese1DXMyXIcMt+w/72QhjBb9dMdfe3R1q27wQ6L5dqhSj4RotibldE
	zD9Q6zXU=
X-Gm-Gg: AeBDieuxtOMqUdBJ7G9BwjHy84k5A9JR7n85c9ovDTant8ywtvCYulCpoXJ4+ZoJKhx
	97ussJDzYk4x8oSTl/08YXYRT8uQ8FPXRgE2EulgW/Jc8gu4b2GXSPEwBgBwTMj2TDflQEvOywy
	V2Bo82HY5Bp+FRfRdKKz2GwFbe5XaLDnevcBQ62UwpGvQcN2V4Bmc4wPg2xnqo6XfqZx+oHyq6Y
	3nooGPaLhaApvdKRmHzVuHdw+vCSNyDW7LfpkcVueKASgpeDFqrzrficC1FPLK/ynJwZ9WViCz7
	x9zmBXZ2k9vAMlrBBqQAT+NQy3Mzh2qClcpb/KYrfGa8j5D4/mVfxpjrkMuEntxveiNtcpyzOzP
	6g5lYoLt6vtW4qSp5ryZ/Cmxh6lazpjGmUmjuA0+WHX/KKCYy6HBkbir+W+O1Yt9/rD3+fcDjir
	M3hMHiToGj8153SNRZ/HqhJqaYpXYJsE2d9t+f0SrGbmmkWRPV2mGPUHFvQwgYRsDFxsFQrQ0a3
	NoJHrr7yDX1kt0=
X-Received: by 2002:a05:600c:34c8:b0:486:fba7:b150 with SMTP id 5b1f17b1804b1-48e51f2ed22mr162785645e9.15.1778174394962;
        Thu, 07 May 2026 10:19:54 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH] Drop xenpaging
Date: Thu,  7 May 2026 18:19:33 +0100
Message-Id: <20260507171933.1573983-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1778174396-BDD6BE11-C7921207/10/73395122804
X-purgate-type: spam
X-purgate-size: 130750
X-Rspamd-Queue-Id: 3CD3B4ECCDA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:jgross@suse.com,m:tamas@tklengyel.com,m:dpsmith@apertussolutions.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org,tklengyel.com,apertussolutions.com,gmail.com];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

This capability is experimental, has seen no development since 2011, and these
days only gets edited to fix the build.

While it can be compiled out (of Xen at least), it is a maintenance burden on
surrounding code that we'd prefer to stop paying.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Juergen Gross <jgross@suse.com>
CC: Tamas K Lengyel <tamas@tklengyel.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Slightly RFC.  I'm suspect I might be asked to split this up a bit, but if so,
suggestions on where to draw the lines please.

The diffstat speaks for itself, including the invasiveness on surrounding
code.  PFEC_page_paged and HVMTRANS_gfn_paged_out weren't even able to be
elimiated by the compiler in !CONFIG_MEM_PAGING configurations.
---
 .gitignore                             |    1 -
 CHANGELOG.md                           |    3 +
 MAINTAINERS                            |    4 -
 automation/gitlab-ci/analyze.yaml      |    1 -
 config/Paths.mk.in                     |    1 -
 configure                              |    4 -
 docs/INDEX                             |    1 -
 docs/configure                         |    4 -
 docs/misc/xenpaging.txt                |   45 -
 m4/paths.m4                            |    3 -
 tools/Makefile                         |    1 -
 tools/configure                        |    4 -
 tools/hotplug/common/hotplugpath.sh.in |    1 -
 tools/include/xenctrl.h                |   20 +-
 tools/libs/ctrl/Makefile.common        |    1 -
 tools/libs/ctrl/xc_mem_paging.c        |  130 ---
 tools/xenpaging/Makefile               |   43 -
 tools/xenpaging/file_ops.c             |   71 --
 tools/xenpaging/file_ops.h             |   41 -
 tools/xenpaging/pagein.c               |   79 --
 tools/xenpaging/policy.h               |   48 --
 tools/xenpaging/policy_default.c       |  186 ----
 tools/xenpaging/xenpaging.c            | 1084 ------------------------
 tools/xenpaging/xenpaging.h            |  152 ----
 xen/arch/x86/hvm/Kconfig               |    4 -
 xen/arch/x86/hvm/dm.c                  |    6 -
 xen/arch/x86/hvm/emulate.c             |    9 +-
 xen/arch/x86/hvm/hvm.c                 |   21 +-
 xen/arch/x86/hvm/intercept.c           |    2 -
 xen/arch/x86/hvm/vmx/vvmx.c            |    2 -
 xen/arch/x86/include/asm/hvm/support.h |    1 -
 xen/arch/x86/include/asm/mem_paging.h  |   24 -
 xen/arch/x86/include/asm/p2m.h         |   39 +-
 xen/arch/x86/include/asm/processor.h   |    1 -
 xen/arch/x86/livepatch.c               |    4 -
 xen/arch/x86/mm.c                      |   21 +-
 xen/arch/x86/mm/Makefile               |    1 -
 xen/arch/x86/mm/altp2m.c               |    2 +-
 xen/arch/x86/mm/guest_walk.c           |    9 -
 xen/arch/x86/mm/hap/guest_walk.c       |   16 -
 xen/arch/x86/mm/hap/nested_ept.c       |    5 -
 xen/arch/x86/mm/hap/nested_hap.c       |    2 +-
 xen/arch/x86/mm/mem_paging.c           |  487 -----------
 xen/arch/x86/mm/mem_sharing.c          |   30 -
 xen/arch/x86/mm/p2m-ept.c              |    3 -
 xen/arch/x86/mm/p2m-pt.c               |    7 +-
 xen/arch/x86/mm/p2m.c                  |   15 +-
 xen/arch/x86/mm/shadow/hvm.c           |    1 -
 xen/arch/x86/msr.c                     |    6 -
 xen/arch/x86/x86_64/compat/mm.c        |    6 -
 xen/arch/x86/x86_64/mm.c               |    6 -
 xen/common/domain.c                    |    3 -
 xen/common/domctl.c                    |    3 -
 xen/common/keyhandler.c                |    6 -
 xen/common/memory.c                    |   37 +-
 xen/common/page_alloc.c                |    3 +-
 xen/common/vm_event.c                  |   83 --
 xen/drivers/passthrough/x86/iommu.c    |    2 -
 xen/include/public/memory.h            |    2 +-
 xen/include/public/vm_event.h          |    2 +-
 xen/include/xen/sched.h                |   18 +-
 xen/include/xsm/dummy.h                |    8 -
 xen/include/xsm/xsm.h                  |   11 -
 xen/xsm/dummy.c                        |    4 -
 xen/xsm/flask/hooks.c                  |   11 -
 xen/xsm/flask/policy/access_vectors    |    2 -
 66 files changed, 27 insertions(+), 2826 deletions(-)
 delete mode 100644 docs/misc/xenpaging.txt
 delete mode 100644 tools/libs/ctrl/xc_mem_paging.c
 delete mode 100644 tools/xenpaging/Makefile
 delete mode 100644 tools/xenpaging/file_ops.c
 delete mode 100644 tools/xenpaging/file_ops.h
 delete mode 100644 tools/xenpaging/pagein.c
 delete mode 100644 tools/xenpaging/policy.h
 delete mode 100644 tools/xenpaging/policy_default.c
 delete mode 100644 tools/xenpaging/xenpaging.c
 delete mode 100644 tools/xenpaging/xenpaging.h
 delete mode 100644 xen/arch/x86/include/asm/mem_paging.h
 delete mode 100644 xen/arch/x86/mm/mem_paging.c

diff --git a/.gitignore b/.gitignore
index bfc7bdf043c3..043e7b166ecc 100644
--- a/.gitignore
+++ b/.gitignore
@@ -161,7 +161,6 @@ tools/xcutils/lsevtchn
 tools/xcutils/readnotes
 tools/xenmon/xentrace_setmask
 tools/xenmon/xenbaked
-tools/xenpaging/xenpaging
 tools/xenpmd/xenpmd
 tools/xentop/xentop
 tools/xentrace/xentrace_setsize
diff --git a/CHANGELOG.md b/CHANGELOG.md
index ce46020dbdb4..56ea17275b8e 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -41,6 +41,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
      a guest, but the vendors have been diverging since then in ways that Xen
      cannot compensate for, and the advent of speculative security issues has
      put to rest any possibility of this being a viable option.
+   - The xenpaging userspace daemon, and MEM_PAGING hypervisor infrastructure.
+     This never got beyond an experimental feature and hasn't seen any real
+     work since 2011.
 
  - Removed xenpm tool on non-x86 platforms as it doesn't actually provide
    anything useful outside of x86.
diff --git a/MAINTAINERS b/MAINTAINERS
index 77f72e52f46d..8df2700dd40b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -633,10 +633,6 @@ F:	tools/misc/xen-cpuid.c
 F:	tools/tests/cpu-policy/
 F:	tools/tests/x86_emulator/
 
-X86 MEMORY PAGING
-S:	Orphaned
-F:	xen/arch/x86/mm/mem_paging.c
-
 X86 MEMORY SHARING
 M:	Tamas K Lengyel <tamas@tklengyel.com>
 S:	Odd Fixes
diff --git a/automation/gitlab-ci/analyze.yaml b/automation/gitlab-ci/analyze.yaml
index b3f99f472d9e..f94f1be0aa89 100644
--- a/automation/gitlab-ci/analyze.yaml
+++ b/automation/gitlab-ci/analyze.yaml
@@ -52,7 +52,6 @@ eclair-x86_64-allcode:
       CONFIG_EXPERT=y
       CONFIG_HYPERV_GUEST=y
       CONFIG_LATE_HWDOM=y
-      CONFIG_MEM_PAGING=y
       CONFIG_MEM_SHARING=y
       CONFIG_PERF_ARRAYS=y
       CONFIG_PERF_COUNTERS=y
diff --git a/config/Paths.mk.in b/config/Paths.mk.in
index 6aa392b9f299..0cf6bb574a0a 100644
--- a/config/Paths.mk.in
+++ b/config/Paths.mk.in
@@ -40,7 +40,6 @@ INITD_DIR                := @INITD_DIR@
 CONFIG_LEAF_DIR          := @CONFIG_LEAF_DIR@
 BASH_COMPLETION_DIR      := $(CONFIG_DIR)/bash_completion.d
 XEN_LOCK_DIR             := @XEN_LOCK_DIR@
-XEN_PAGING_DIR           := @XEN_PAGING_DIR@
 XEN_DUMP_DIR             := @XEN_DUMP_DIR@
 DEBUG_DIR                := @DEBUG_DIR@
 
diff --git a/configure b/configure
index 1dbaeb3c5cfa..152c478abfd3 100755
--- a/configure
+++ b/configure
@@ -627,7 +627,6 @@ xen
 subdirs
 DEBUG_DIR
 XEN_DUMP_DIR
-XEN_PAGING_DIR
 XEN_LOCK_DIR
 INITD_DIR
 SHAREDIR
@@ -2215,9 +2214,6 @@ esac
 printf "%s\n" "#define XEN_LOCK_DIR \"$XEN_LOCK_DIR\"" >>confdefs.h
 
 
-XEN_PAGING_DIR=$localstatedir/lib/xen/xenpaging
-
-
 XEN_DUMP_DIR=$xen_dumpdir_path
 
 
diff --git a/docs/INDEX b/docs/INDEX
index e673edd75c31..6eec23f5cbc2 100644
--- a/docs/INDEX
+++ b/docs/INDEX
@@ -18,7 +18,6 @@ misc/distro_mapping		Distro Directory Layouts
 misc/dump-core-format		Xen Core Dump Format
 misc/vtd			VT-d HOWTO
 misc/xen-error-handling		Xen Error Handling
-misc/xenpaging			Xen Paging
 misc/xsm-flask			XSM/FLASK Configuration
 misc/arm/booting		How to boot Xen on ARM
 misc/arm/early-printk		Enabling early printk on ARM
diff --git a/docs/configure b/docs/configure
index 8871914dcbe1..c8ef084e7ee3 100755
--- a/docs/configure
+++ b/docs/configure
@@ -626,7 +626,6 @@ POD2MAN
 FIG2DEV
 DEBUG_DIR
 XEN_DUMP_DIR
-XEN_PAGING_DIR
 XEN_LOCK_DIR
 INITD_DIR
 SHAREDIR
@@ -2020,9 +2019,6 @@ esac
 printf "%s\n" "#define XEN_LOCK_DIR \"$XEN_LOCK_DIR\"" >>confdefs.h
 
 
-XEN_PAGING_DIR=$localstatedir/lib/xen/xenpaging
-
-
 XEN_DUMP_DIR=$xen_dumpdir_path
 
 
diff --git a/docs/misc/xenpaging.txt b/docs/misc/xenpaging.txt
deleted file mode 100644
index 742523e145bc..000000000000
--- a/docs/misc/xenpaging.txt
+++ /dev/null
@@ -1,45 +0,0 @@
-Warning:
-
-The xenpaging code is new and not fully debugged.
-Usage of xenpaging can crash Xen or cause severe data corruption in the
-guest memory and its filesystems!
-
-Description:
-
-xenpaging writes memory pages of a given guest to a file and moves the
-pages back to the pool of available memory.  Once the guests wants to
-access the paged-out memory, the page is read from disk and placed into
-memory.  This allows the sum of all running guests to use more memory
-than physically available on the host.
-
-Requirements:
-
-xenpaging relies on Intel EPT or AMD RVI, other hardware is not
-supported. Only HVM guests are supported.  The dom0 kernel needs
-paging-aware backend drivers to handle paged granttable entries.
-Currently only dom0 kernels based on classic Xen Linux support this
-functionality.
-
-Usage:
-
-Up to now xenpaging is not integrated into libxl/xend, so it has to be
-started manually for each guest.
-
-Once the guest is running, run xenpaging with the guest_id and the path
-to the pagefile:
- 
- /usr/lib/xen/bin/xenpaging -f /path/to/page_file -d dom_id &
-
-Once xenpaging runs it needs a memory target, which is the memory
-footprint of the guest. This value (in KiB) must be written manually to
-xenstore. The following example sets the target to 512MB:
-
- xenstore-write /local/domain/<dom_id>/memory/target-tot_pages $((1024*512))
-
-Now xenpaging tries to page-out as many pages to keep the overall memory
-footprint of the guest at 512MB.
-
-Todo:
-- integrate xenpaging into libxl
-
-# vim: tw=72
diff --git a/m4/paths.m4 b/m4/paths.m4
index 3f94c62efb99..e9382fd6534b 100644
--- a/m4/paths.m4
+++ b/m4/paths.m4
@@ -158,9 +158,6 @@ esac
 AC_SUBST(XEN_LOCK_DIR)
 AC_DEFINE_UNQUOTED([XEN_LOCK_DIR], ["$XEN_LOCK_DIR"], [Xen's lock dir])
 
-XEN_PAGING_DIR=$localstatedir/lib/xen/xenpaging
-AC_SUBST(XEN_PAGING_DIR)
-
 XEN_DUMP_DIR=$xen_dumpdir_path
 AC_SUBST(XEN_DUMP_DIR)
 AC_DEFINE_UNQUOTED([XEN_DUMP_DIR], ["$XEN_DUMP_DIR"], [Xen's dump directory])
diff --git a/tools/Makefile b/tools/Makefile
index 6ecf7c0da821..8752c9369688 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -32,7 +32,6 @@ SUBDIRS-$(CONFIG_GOLANG) += golang
 SUBDIRS-y += xl
 SUBDIRS-y += helpers
 SUBDIRS-y += 9pfsd
-SUBDIRS-$(CONFIG_X86) += xenpaging
 SUBDIRS-$(CONFIG_X86) += debugger
 SUBDIRS-$(CONFIG_TESTS) += tests
 
diff --git a/tools/configure b/tools/configure
index 6f69b0b52634..9e8790d90a8a 100755
--- a/tools/configure
+++ b/tools/configure
@@ -742,7 +742,6 @@ rpath
 werror
 DEBUG_DIR
 XEN_DUMP_DIR
-XEN_PAGING_DIR
 XEN_LOCK_DIR
 INITD_DIR
 SHAREDIR
@@ -4558,9 +4557,6 @@ esac
 printf "%s\n" "#define XEN_LOCK_DIR \"$XEN_LOCK_DIR\"" >>confdefs.h
 
 
-XEN_PAGING_DIR=$localstatedir/lib/xen/xenpaging
-
-
 XEN_DUMP_DIR=$xen_dumpdir_path
 
 
diff --git a/tools/hotplug/common/hotplugpath.sh.in b/tools/hotplug/common/hotplugpath.sh.in
index 1036b884b804..d8e257170605 100644
--- a/tools/hotplug/common/hotplugpath.sh.in
+++ b/tools/hotplug/common/hotplugpath.sh.in
@@ -9,7 +9,6 @@ XEN_CONFIG_DIR="@XEN_CONFIG_DIR@"
 XEN_SCRIPT_DIR="@XEN_SCRIPT_DIR@"
 XEN_LOCK_DIR="@XEN_LOCK_DIR@"
 XEN_RUN_DIR="@XEN_RUN_DIR@"
-XEN_PAGING_DIR="@XEN_PAGING_DIR@"
 XEN_DUMP_DIR="@XEN_DUMP_DIR@"
 XEN_LOG_DIR="@XEN_LOG_DIR@"
 XEN_LIB_DIR="@XEN_LIB_DIR@"
diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index d5dbf69c8968..a46a6cfd42ac 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2012,22 +2012,6 @@ int xc_altp2m_get_vcpu_p2m_idx(xc_interface *handle, uint32_t domid,
 int xc_altp2m_set_visibility(xc_interface *handle, uint32_t domid,
                              uint16_t view_id, bool visible);
 
-/** 
- * Mem paging operations.
- * Paging is supported only on the x86 architecture in 64 bit mode, with
- * Hardware-Assisted Paging (i.e. Intel EPT, AMD NPT). Moreover, AMD NPT
- * support is considered experimental.
- */
-int xc_mem_paging_enable(xc_interface *xch, uint32_t domain_id, uint32_t *port);
-int xc_mem_paging_disable(xc_interface *xch, uint32_t domain_id);
-int xc_mem_paging_resume(xc_interface *xch, uint32_t domain_id);
-int xc_mem_paging_nominate(xc_interface *xch, uint32_t domain_id,
-                           uint64_t gfn);
-int xc_mem_paging_evict(xc_interface *xch, uint32_t domain_id, uint64_t gfn);
-int xc_mem_paging_prep(xc_interface *xch, uint32_t domain_id, uint64_t gfn);
-int xc_mem_paging_load(xc_interface *xch, uint32_t domain_id,
-                       uint64_t gfn, void *buffer);
-
 /** 
  * Access tracking operations.
  * Supported only on Intel EPT 64 bit processors.
@@ -2160,8 +2144,8 @@ int xc_memshr_control(xc_interface *xch,
  * ENOMEM happens when unsharing pages: a Copy-on-Write duplicate needs to be
  * allocated, and thus the out-of-memory error occurr.
  *
- * For complete examples on how to plumb a notification ring, look into
- * xenpaging or xen-access.
+ * For complete examples on how to plumb a notification ring, look at
+ * xen-access.
  *
  * On receipt of a notification, the helper should ensure there is memory
  * available to the domain before retrying.
diff --git a/tools/libs/ctrl/Makefile.common b/tools/libs/ctrl/Makefile.common
index 68137d42f2b5..c955f54743da 100644
--- a/tools/libs/ctrl/Makefile.common
+++ b/tools/libs/ctrl/Makefile.common
@@ -18,7 +18,6 @@ OBJS-y       += xc_vm_event.o
 OBJS-y       += xc_vmtrace.o
 OBJS-y       += xc_version.o
 OBJS-y       += xc_monitor.o
-OBJS-y       += xc_mem_paging.o
 OBJS-y       += xc_mem_access.o
 OBJS-y       += xc_memshr.o
 OBJS-y       += xc_hcall_buf.o
diff --git a/tools/libs/ctrl/xc_mem_paging.c b/tools/libs/ctrl/xc_mem_paging.c
deleted file mode 100644
index 999a572cefdc..000000000000
--- a/tools/libs/ctrl/xc_mem_paging.c
+++ /dev/null
@@ -1,130 +0,0 @@
-/******************************************************************************
- *
- * tools/libxc/xc_mem_paging.c
- *
- * Interface to low-level memory paging functionality.
- *
- * Copyright (c) 2009 by Citrix Systems, Inc. (Patrick Colp)
- *
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation; either
- * version 2.1 of the License, or (at your option) any later version.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
- */
-
-#include "xc_private.h"
-
-static int xc_mem_paging_memop(xc_interface *xch, uint32_t domain_id,
-                               unsigned int op, uint64_t gfn, void *buffer)
-{
-    xen_mem_paging_op_t mpo;
-    DECLARE_HYPERCALL_BOUNCE(buffer, XC_PAGE_SIZE,
-                             XC_HYPERCALL_BUFFER_BOUNCE_IN);
-    int rc;
-
-    memset(&mpo, 0, sizeof(mpo));
-
-    mpo.op      = op;
-    mpo.domain  = domain_id;
-    mpo.gfn     = gfn;
-
-    if ( buffer )
-    {
-        if ( xc_hypercall_bounce_pre(xch, buffer) )
-        {
-            PERROR("Could not bounce memory for XENMEM_paging_op %u", op);
-            return -1;
-        }
-
-        set_xen_guest_handle(mpo.buffer, buffer);
-    }
-
-    rc = xc_memory_op(xch, XENMEM_paging_op, &mpo, sizeof(mpo));
-
-    if ( buffer )
-        xc_hypercall_bounce_post(xch, buffer);
-
-    return rc;
-}
-
-int xc_mem_paging_enable(xc_interface *xch, uint32_t domain_id,
-                         uint32_t *port)
-{
-    if ( !port )
-    {
-        errno = EINVAL;
-        return -1;
-    }
-
-    return xc_vm_event_control(xch, domain_id,
-                               XEN_VM_EVENT_ENABLE,
-                               XEN_DOMCTL_VM_EVENT_OP_PAGING,
-                               port);
-}
-
-int xc_mem_paging_disable(xc_interface *xch, uint32_t domain_id)
-{
-    return xc_vm_event_control(xch, domain_id,
-                               XEN_VM_EVENT_DISABLE,
-                               XEN_DOMCTL_VM_EVENT_OP_PAGING,
-                               NULL);
-}
-
-int xc_mem_paging_resume(xc_interface *xch, uint32_t domain_id)
-{
-    return xc_vm_event_control(xch, domain_id,
-                               XEN_VM_EVENT_RESUME,
-                               XEN_DOMCTL_VM_EVENT_OP_PAGING,
-                               NULL);
-}
-
-int xc_mem_paging_nominate(xc_interface *xch, uint32_t domain_id, uint64_t gfn)
-{
-    return xc_mem_paging_memop(xch, domain_id,
-                               XENMEM_paging_op_nominate,
-                               gfn, NULL);
-}
-
-int xc_mem_paging_evict(xc_interface *xch, uint32_t domain_id, uint64_t gfn)
-{
-    return xc_mem_paging_memop(xch, domain_id,
-                               XENMEM_paging_op_evict,
-                               gfn, NULL);
-}
-
-int xc_mem_paging_prep(xc_interface *xch, uint32_t domain_id, uint64_t gfn)
-{
-    return xc_mem_paging_memop(xch, domain_id,
-                               XENMEM_paging_op_prep,
-                               gfn, NULL);
-}
-
-int xc_mem_paging_load(xc_interface *xch, uint32_t domain_id,
-                       uint64_t gfn, void *buffer)
-{
-    errno = EINVAL;
-
-    if ( !buffer )
-        return -1;
-
-    return xc_mem_paging_memop(xch, domain_id, XENMEM_paging_op_prep,
-                               gfn, buffer);
-}
-
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * indent-tabs-mode: nil
- * End: 
- */
diff --git a/tools/xenpaging/Makefile b/tools/xenpaging/Makefile
deleted file mode 100644
index 835cf2b96553..000000000000
--- a/tools/xenpaging/Makefile
+++ /dev/null
@@ -1,43 +0,0 @@
-XEN_ROOT=$(CURDIR)/../..
-include $(XEN_ROOT)/tools/Rules.mk
-
-CFLAGS += $(CFLAGS_libxentoollog) $(CFLAGS_libxenevtchn) $(CFLAGS_libxenctrl) $(CFLAGS_libxenstore) $(PTHREAD_CFLAGS) $(CFLAGS_libxencall)
-LDLIBS += $(LDLIBS_libxentoollog) $(LDLIBS_libxenevtchn) $(LDLIBS_libxenctrl) $(LDLIBS_libxenstore) $(PTHREAD_LIBS)
-LDFLAGS += $(PTHREAD_LDFLAGS)
-
-POLICY   := default
-
-OBJS-y   := file_ops.o
-OBJS-y   += xenpaging.o
-OBJS-y   += policy_$(POLICY).o
-OBJS-y   += pagein.o
-
-CFLAGS   += -Wno-unused
-
-TARGETS := xenpaging
-
-all: $(TARGETS)
-
-xenpaging: $(OBJS-y)
-	$(CC) $(LDFLAGS) -o $@ $^ $(LDLIBS) $(APPEND_LDFLAGS)
-
-install: all
-	$(INSTALL_DIR) -m 0700 $(DESTDIR)$(XEN_PAGING_DIR)
-	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
-	$(INSTALL_PROG) $(TARGETS) $(DESTDIR)$(LIBEXEC_BIN)
-
-uninstall:
-	rm -f $(addprefix $(DESTDIR)$(LIBEXEC_BIN)/, $(TARGETS))
-
-clean:
-	rm -f *.o *~ $(DEPS_RM) TAGS $(TARGETS)
-
-distclean: clean
-
-.PHONY: clean install distclean uninstall
-
-.PHONY: TAGS
-TAGS:
-	etags -t *.c *.h
-
--include $(DEPS_INCLUDE)
diff --git a/tools/xenpaging/file_ops.c b/tools/xenpaging/file_ops.c
deleted file mode 100644
index 301fb3427cc5..000000000000
--- a/tools/xenpaging/file_ops.c
+++ /dev/null
@@ -1,71 +0,0 @@
-/******************************************************************************
- *
- * Common file operations.
- *
- * Copyright (c) 2009 by Citrix Systems, Inc. (Patrick Colp)
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
- */
-
-
-#include <unistd.h>
-#include <xenctrl.h>
-
-static int file_op(int fd, void *page, int i,
-                   ssize_t (*fn)(int, void *, size_t))
-{
-    off_t offset = i;
-    int total = 0;
-    int bytes;
-
-    offset = lseek(fd, offset << XC_PAGE_SHIFT, SEEK_SET);
-    if ( offset == (off_t)-1 )
-        return -1;
-
-    while ( total < XC_PAGE_SIZE )
-    {
-        bytes = fn(fd, page + total, XC_PAGE_SIZE - total);
-        if ( bytes <= 0 )
-            return -1;
-
-        total += bytes;
-    }
-
-    return 0;
-}
-
-static ssize_t my_write(int fd, void *buf, size_t count)
-{
-    return write(fd, buf, count);
-}
-
-int read_page(int fd, void *page, int i)
-{
-    return file_op(fd, page, i, &read);
-}
-
-int write_page(int fd, void *page, int i)
-{
-    return file_op(fd, page, i, &my_write);
-}
-
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * indent-tabs-mode: nil
- * End: 
- */
diff --git a/tools/xenpaging/file_ops.h b/tools/xenpaging/file_ops.h
deleted file mode 100644
index ee3fd7d8b86c..000000000000
--- a/tools/xenpaging/file_ops.h
+++ /dev/null
@@ -1,41 +0,0 @@
-/******************************************************************************
- * tools/xenpaging/file_ops.h
- *
- * Common file operations.
- *
- * Copyright (c) 2009 by Citrix Systems, Inc. (Patrick Colp)
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
- */
-
-
-#ifndef __FILE_OPS_H__
-#define __FILE_OPS_H__
-
-
-int read_page(int fd, void *page, int i);
-int write_page(int fd, void *page, int i);
-
-
-#endif
-
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * indent-tabs-mode: nil
- * End: 
- */
diff --git a/tools/xenpaging/pagein.c b/tools/xenpaging/pagein.c
deleted file mode 100644
index 1c8a7d983dc2..000000000000
--- a/tools/xenpaging/pagein.c
+++ /dev/null
@@ -1,79 +0,0 @@
-/* Trigger a page-in in a separate thread-of-execution to avoid deadlock */
-#include <pthread.h>
-#include "xenpaging.h"
-
-struct page_in_args {
-    domid_t dom;
-    unsigned long *pagein_queue;
-    xc_interface *xch;
-};
-
-static struct page_in_args page_in_args;
-static unsigned long page_in_request;
-static unsigned int page_in_possible;
-
-static pthread_t page_in_thread;
-static pthread_cond_t page_in_cond = PTHREAD_COND_INITIALIZER;
-static pthread_mutex_t page_in_mutex = PTHREAD_MUTEX_INITIALIZER;
-
-static void *page_in(void *arg)
-{
-    struct page_in_args *pia = arg;
-    void *page;
-    int i, num;
-    xen_pfn_t gfns[XENPAGING_PAGEIN_QUEUE_SIZE];
-
-    while (1)
-    {
-        pthread_mutex_lock(&page_in_mutex);
-        while (!page_in_request)
-            pthread_cond_wait(&page_in_cond, &page_in_mutex);
-        num = 0;
-        for (i = 0; i < XENPAGING_PAGEIN_QUEUE_SIZE; i++)
-        {
-            if (!pia->pagein_queue[i])
-               continue;
-            gfns[num] = pia->pagein_queue[i];
-            pia->pagein_queue[i] = 0;
-            num++;
-        }
-        page_in_request = 0;
-        pthread_mutex_unlock(&page_in_mutex);
-
-        /* Ignore errors */
-        page = xc_map_foreign_pages(pia->xch, pia->dom, PROT_READ, gfns, num);
-        if (page)
-            munmap(page, XC_PAGE_SIZE * num);
-    }
-    page_in_possible = 0;
-    pthread_exit(NULL);
-}
-
-void page_in_trigger(void)
-{
-    if (!page_in_possible)
-        return;
-
-    pthread_mutex_lock(&page_in_mutex);
-    page_in_request = 1;
-    pthread_mutex_unlock(&page_in_mutex);
-    pthread_cond_signal(&page_in_cond);
-}
-
-void create_page_in_thread(struct xenpaging *paging)
-{
-    page_in_args.dom = paging->vm_event.domain_id;
-    page_in_args.pagein_queue = paging->pagein_queue;
-    page_in_args.xch = paging->xc_handle;
-    if (pthread_create(&page_in_thread, NULL, page_in, &page_in_args) == 0)
-        page_in_possible = 1;
-}
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * indent-tabs-mode: nil
- * End: 
- */
diff --git a/tools/xenpaging/policy.h b/tools/xenpaging/policy.h
deleted file mode 100644
index b1425a90ef6d..000000000000
--- a/tools/xenpaging/policy.h
+++ /dev/null
@@ -1,48 +0,0 @@
-/******************************************************************************
- * tools/xenpaging/policy.h
- *
- * Xen domain paging policy hooks.
- *
- * Copyright (c) 2009 Citrix Systems, Inc. (Patrick Colp)
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
- */
-
-
-#ifndef __XEN_PAGING_POLICY_H__
-#define __XEN_PAGING_POLICY_H__
-
-
-#include "xenpaging.h"
-
-
-int policy_init(struct xenpaging *paging);
-unsigned long policy_choose_victim(struct xenpaging *paging);
-void policy_notify_paged_out(unsigned long gfn);
-void policy_notify_paged_in(unsigned long gfn);
-void policy_notify_paged_in_nomru(unsigned long gfn);
-void policy_notify_dropped(unsigned long gfn);
-
-#endif // __XEN_PAGING_POLICY_H__
-
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * tab-width: 4
- * indent-tabs-mode: nil
- * End:
- */
diff --git a/tools/xenpaging/policy_default.c b/tools/xenpaging/policy_default.c
deleted file mode 100644
index 979d25123045..000000000000
--- a/tools/xenpaging/policy_default.c
+++ /dev/null
@@ -1,186 +0,0 @@
-/******************************************************************************
- *
- * Xen domain paging default policy.
- *
- * Copyright (c) 2009 Citrix Systems, Inc. (Patrick Colp)
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
- */
-
-#include <errno.h>
-
-#include "policy.h"
-
-
-#define DEFAULT_MRU_SIZE (1024 * 16)
-
-
-static unsigned long *mru;
-static unsigned int i_mru;
-static unsigned int mru_size;
-static unsigned long *bitmap;
-static unsigned long *unconsumed;
-static unsigned int unconsumed_cleared;
-static unsigned long current_gfn;
-static unsigned long max_pages;
-
-
-int policy_init(struct xenpaging *paging)
-{
-    int i;
-    int rc = -ENOMEM;
-
-    max_pages = paging->max_pages;
-
-    /* Allocate bitmap for pages not to page out */
-    bitmap = bitmap_alloc(max_pages);
-    if ( !bitmap )
-        goto out;
-    /* Allocate bitmap to track unusable pages */
-    unconsumed = bitmap_alloc(max_pages);
-    if ( !unconsumed )
-        goto out;
-
-    /* Initialise MRU list of paged in pages */
-    if ( paging->policy_mru_size > 0 )
-        mru_size = paging->policy_mru_size;
-    else
-        mru_size = paging->policy_mru_size = DEFAULT_MRU_SIZE;
-
-    mru = malloc(sizeof(*mru) * mru_size);
-    if ( mru == NULL )
-        goto out;
-
-    for ( i = 0; i < mru_size; i++ )
-        mru[i] = INVALID_MFN;
-
-    /* Don't page out page 0 */
-    set_bit(0, bitmap);
-
-    /* Start in the middle to avoid paging during BIOS startup */
-    current_gfn = max_pages / 2;
-
-    rc = 0;
- out:
-    return rc;
-}
-
-unsigned long policy_choose_victim(struct xenpaging *paging)
-{
-    xc_interface *xch = paging->xc_handle;
-    unsigned long i;
-
-    /* One iteration over all possible gfns */
-    for ( i = 0; i < max_pages; i++ )
-    {
-        /* Try next gfn */
-        current_gfn++;
-
-        /* Restart on wrap */
-        if ( current_gfn >= max_pages )
-            current_gfn = 0;
-
-        if ( (current_gfn & (BITS_PER_LONG - 1)) == 0 )
-        {
-            /* All gfns busy */
-            if ( ~bitmap[current_gfn >> ORDER_LONG] == 0 || ~unconsumed[current_gfn >> ORDER_LONG] == 0 )
-            {
-                current_gfn += BITS_PER_LONG;
-                i += BITS_PER_LONG;
-                continue;
-            }
-        }
-
-        /* gfn busy */
-        if ( test_bit(current_gfn, bitmap) )
-            continue;
-
-        /* gfn already tested */
-        if ( test_bit(current_gfn, unconsumed) )
-            continue;
-
-        /* gfn found */
-        break;
-    }
-
-    /* Could not nominate any gfn */
-    if ( i >= max_pages )
-    {
-        /* No more pages, wait in poll */
-        paging->use_poll_timeout = 1;
-        /* Count wrap arounds */
-        unconsumed_cleared++;
-        /* Force retry every few seconds (depends on poll() timeout) */
-        if ( unconsumed_cleared > 123)
-        {
-            /* Force retry of unconsumed gfns on next call */
-            bitmap_clear(unconsumed, max_pages);
-            unconsumed_cleared = 0;
-            DPRINTF("clearing unconsumed, current_gfn %lx", current_gfn);
-        }
-        return INVALID_MFN;
-    }
-
-    set_bit(current_gfn, unconsumed);
-    return current_gfn;
-}
-
-void policy_notify_paged_out(unsigned long gfn)
-{
-    set_bit(gfn, bitmap);
-    clear_bit(gfn, unconsumed);
-}
-
-static void policy_handle_paged_in(unsigned long gfn, int do_mru)
-{
-    unsigned long old_gfn = mru[i_mru & (mru_size - 1)];
-
-    if ( old_gfn != INVALID_MFN )
-        clear_bit(old_gfn, bitmap);
-    
-    if (do_mru) {
-        mru[i_mru & (mru_size - 1)] = gfn;
-    } else {
-        clear_bit(gfn, bitmap);
-        mru[i_mru & (mru_size - 1)] = INVALID_MFN;
-    }
-
-    i_mru++;
-}
-
-void policy_notify_paged_in(unsigned long gfn)
-{
-    policy_handle_paged_in(gfn, 1);
-}
-
-void policy_notify_paged_in_nomru(unsigned long gfn)
-{
-    policy_handle_paged_in(gfn, 0);
-}
-
-void policy_notify_dropped(unsigned long gfn)
-{
-    clear_bit(gfn, bitmap);
-}
-
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * tab-width: 4
- * indent-tabs-mode: nil
- * End:
- */
diff --git a/tools/xenpaging/xenpaging.c b/tools/xenpaging/xenpaging.c
deleted file mode 100644
index c7a9a8247766..000000000000
--- a/tools/xenpaging/xenpaging.c
+++ /dev/null
@@ -1,1084 +0,0 @@
-/******************************************************************************
- *
- * Domain paging. 
- * Copyright (c) 2009 by Citrix Systems, Inc. (Patrick Colp)
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
- */
-
-#define _GNU_SOURCE
-
-#include <inttypes.h>
-#include <stdio.h>
-#include <stdlib.h>
-#include <errno.h>
-#include <stdarg.h>
-#include <time.h>
-#include <signal.h>
-#include <unistd.h>
-#include <poll.h>
-#include <xenstore.h>
-#include <getopt.h>
-
-#include "file_ops.h"
-#include "policy.h"
-#include "xenpaging.h"
-
-/* Defines number of mfns a guest should use at a time, in KiB */
-#define WATCH_TARGETPAGES "memory/target-tot_pages"
-static char *watch_target_tot_pages;
-static char *dom_path;
-static char watch_token[16];
-static char *filename;
-static int interrupted;
-
-static void unlink_pagefile(void)
-{
-    if ( filename && filename[0] )
-    {
-        unlink(filename);
-        filename[0] = '\0';
-    }
-}
-
-static void close_handler(int sig)
-{
-    interrupted = sig;
-    unlink_pagefile();
-}
-
-static void xenpaging_mem_paging_flush_ioemu_cache(struct xenpaging *paging)
-{
-    struct xs_handle *xsh = paging->xs_handle;
-    domid_t domain_id = paging->vm_event.domain_id;
-    char path[80];
-
-    sprintf(path, "/local/domain/0/device-model/%u/command", domain_id);
-
-    xs_write(xsh, XBT_NULL, path, "flush-cache", strlen("flush-cache")); 
-}
-
-static int xenpaging_wait_for_event_or_timeout(struct xenpaging *paging)
-{
-    xc_interface *xch = paging->xc_handle;
-    xenevtchn_handle *xce = paging->vm_event.xce_handle;
-    char **vec, *val;
-    unsigned int num;
-    struct pollfd fd[2];
-    int port;
-    int rc;
-    int timeout;
-
-    /* Wait for event channel and xenstore */
-    fd[0].fd = xenevtchn_fd(xce);
-    fd[0].events = POLLIN | POLLERR;
-    fd[1].fd = xs_fileno(paging->xs_handle);
-    fd[1].events = POLLIN | POLLERR;
-
-    /* No timeout while page-out is still in progress */
-    timeout = paging->use_poll_timeout ? 100 : 0;
-    rc = poll(fd, 2, timeout);
-    if ( rc < 0 )
-    {
-        if (errno == EINTR)
-            return 0;
-
-        PERROR("Poll exited with an error");
-        return -1;
-    }
-
-    /* First check for guest shutdown */
-    if ( rc && fd[1].revents & POLLIN )
-    {
-        DPRINTF("Got event from xenstore\n");
-        vec = xs_read_watch(paging->xs_handle, &num);
-        if ( vec )
-        {
-            DPRINTF("path '%s' token '%s'\n", vec[XS_WATCH_PATH], vec[XS_WATCH_TOKEN]);
-            if ( strcmp(vec[XS_WATCH_TOKEN], watch_token) == 0 )
-            {
-                /* If our guest disappeared, set interrupt flag and fall through */
-                if ( xs_is_domain_introduced(paging->xs_handle, paging->vm_event.domain_id) == false )
-                {
-                    xs_unwatch(paging->xs_handle, "@releaseDomain", watch_token);
-                    interrupted = SIGQUIT;
-                    /* No further poll result processing */
-                    rc = 0;
-                }
-            }
-            else if ( strcmp(vec[XS_WATCH_PATH], watch_target_tot_pages) == 0 )
-            {
-                int ret, target_tot_pages;
-                val = xs_read(paging->xs_handle, XBT_NULL, vec[XS_WATCH_PATH], NULL);
-                if ( val )
-                {
-                    ret = sscanf(val, "%d", &target_tot_pages);
-                    if ( ret > 0 )
-                    {
-                        /* KiB to pages */
-                        target_tot_pages >>= 2;
-                        if ( target_tot_pages < 0 || target_tot_pages > paging->max_pages )
-                            target_tot_pages = paging->max_pages;
-                        paging->target_tot_pages = target_tot_pages;
-                        /* Disable poll() delay while new target is not yet reached */
-                        paging->use_poll_timeout = 0;
-                        DPRINTF("new target_tot_pages %d\n", target_tot_pages);
-                    }
-                    free(val);
-                }
-            }
-            free(vec);
-        }
-    }
-
-    if ( rc && fd[0].revents & POLLIN )
-    {
-        DPRINTF("Got event from evtchn\n");
-        port = xenevtchn_pending(xce);
-        if ( port == -1 )
-        {
-            PERROR("Failed to read port from event channel");
-            rc = -1;
-            goto err;
-        }
-
-        rc = xenevtchn_unmask(xce, port);
-        if ( rc < 0 )
-        {
-            PERROR("Failed to unmask event channel port");
-        }
-    }
-err:
-    return rc;
-}
-
-static int xenpaging_get_tot_pages(struct xenpaging *paging)
-{
-    xc_interface *xch = paging->xc_handle;
-    xc_domaininfo_t domain_info;
-    int rc;
-
-    rc = xc_domain_getinfo_single(xch, paging->vm_event.domain_id, &domain_info);
-    if ( rc < 0 )
-    {
-        PERROR("Error getting domain info");
-        return -1;
-    }
-    return domain_info.tot_pages;
-}
-
-static void *init_page(void)
-{
-    void *buffer;
-
-    /* Allocated page memory */
-    errno = posix_memalign(&buffer, XC_PAGE_SIZE, XC_PAGE_SIZE);
-    if ( errno != 0 )
-        return NULL;
-
-    /* Lock buffer in memory so it can't be paged out */
-    if ( mlock(buffer, XC_PAGE_SIZE) < 0 )
-    {
-        free(buffer);
-        buffer = NULL;
-    }
-
-    return buffer;
-}
-
-static void usage(void)
-{
-    printf("usage:\n\n");
-
-    printf("  xenpaging [options] -f <pagefile> -d <domain_id>\n\n");
-
-    printf("options:\n");
-    printf(" -d <domid>     --domain=<domid>         numerical domain_id of guest. This option is required.\n");
-    printf(" -f <file>      --pagefile=<file>        pagefile to use. This option is required.\n");
-    printf(" -m <max_memkb> --max_memkb=<max_memkb>  maximum amount of memory to handle.\n");
-    printf(" -r <num>       --mru_size=<num>         number of paged-in pages to keep in memory.\n");
-    printf(" -v             --verbose                enable debug output.\n");
-    printf(" -h             --help                   this output.\n");
-}
-
-static int xenpaging_getopts(struct xenpaging *paging, int argc, char *argv[])
-{
-    int ch;
-    static const char sopts[] = "hvd:f:m:r:";
-    static const struct option lopts[] = {
-        {"help", 0, NULL, 'h'},
-        {"verbose", 0, NULL, 'v'},
-        {"domain", 1, NULL, 'd'},
-        {"pagefile", 1, NULL, 'f'},
-        {"mru_size", 1, NULL, 'm'},
-        { }
-    };
-
-    while ((ch = getopt_long(argc, argv, sopts, lopts, NULL)) != -1)
-    {
-        switch(ch) {
-        case 'd':
-            paging->vm_event.domain_id = atoi(optarg);
-            break;
-        case 'f':
-            free(filename);
-            filename = strdup(optarg);
-            break;
-        case 'm':
-            /* KiB to pages */
-            paging->max_pages = atoi(optarg) >> 2;
-            break;
-        case 'r':
-            paging->policy_mru_size = atoi(optarg);
-            break;
-        case 'v':
-            paging->debug = 1;
-            break;
-        case 'h':
-        case '?':
-            usage();
-            return 1;
-        }
-    }
-
-    argv += optind; argc -= optind;
-    
-    /* Path to pagefile is required */
-    if ( !filename )
-    {
-        printf("Filename for pagefile missing!\n");
-        usage();
-        return 1;
-    }
-
-    /* Set domain id */
-    if ( !paging->vm_event.domain_id )
-    {
-        printf("Numerical <domain_id> missing!\n");
-        return 1;
-    }
-
-    return 0;
-}
-
-static struct xenpaging *xenpaging_init(int argc, char *argv[])
-{
-    struct xenpaging *paging;
-    xc_domaininfo_t domain_info;
-    xc_interface *xch = NULL;
-    char *p;
-    int rc;
-    unsigned long ring_pfn, mmap_pfn;
-
-    /* Allocate memory */
-    paging = calloc(1, sizeof(struct xenpaging));
-    if ( !paging )
-        goto err;
-
-    /* Get cmdline options and domain_id */
-    if ( xenpaging_getopts(paging, argc, argv) )
-        goto err;
-
-    paging->logger = (xentoollog_logger *)xtl_createlogger_stdiostream(stderr,
-                         paging->debug ? XTL_DEBUG : XTL_PROGRESS, 0);
-
-    /* Open connection to xen */
-    paging->xc_handle = xch = xc_interface_open(paging->logger, NULL, 0);
-    if ( !xch )
-        goto err;
-
-    DPRINTF("xenpaging init\n");
-
-    /* Open connection to xenstore */
-    paging->xs_handle = xs_open(0);
-    if ( paging->xs_handle == NULL )
-    {
-        PERROR("Error initialising xenstore connection");
-        goto err;
-    }
-
-    /* write domain ID to watch so we can ignore other domain shutdowns */
-    snprintf(watch_token, sizeof(watch_token), "%u", paging->vm_event.domain_id);
-    if ( xs_watch(paging->xs_handle, "@releaseDomain", watch_token) == false )
-    {
-        PERROR("Could not bind to shutdown watch\n");
-        goto err;
-    }
-
-    /* Watch xenpagings working target */
-    dom_path = xs_get_domain_path(paging->xs_handle, paging->vm_event.domain_id);
-    if ( !dom_path )
-    {
-        PERROR("Could not find domain path\n");
-        goto err;
-    }
-    if ( asprintf(&watch_target_tot_pages, "%s/%s", dom_path, WATCH_TARGETPAGES) < 0 )
-    {
-        PERROR("Could not alloc watch path\n");
-        goto err;
-    }
-    DPRINTF("watching '%s'\n", watch_target_tot_pages);
-    if ( xs_watch(paging->xs_handle, watch_target_tot_pages, "") == false )
-    {
-        PERROR("Could not bind to xenpaging watch\n");
-        goto err;
-    }
-
-    /* Map the ring page */
-    xc_get_hvm_param(xch, paging->vm_event.domain_id, 
-                        HVM_PARAM_PAGING_RING_PFN, &ring_pfn);
-    mmap_pfn = ring_pfn;
-    paging->vm_event.ring_page = 
-        xc_map_foreign_pages(xch, paging->vm_event.domain_id,
-                             PROT_READ | PROT_WRITE, &mmap_pfn, 1);
-    if ( !paging->vm_event.ring_page )
-    {
-        /* Map failed, populate ring page */
-        rc = xc_domain_populate_physmap_exact(paging->xc_handle, 
-                                              paging->vm_event.domain_id,
-                                              1, 0, 0, &ring_pfn);
-        if ( rc != 0 )
-        {
-            PERROR("Failed to populate ring gfn\n");
-            goto err;
-        }
-
-        paging->vm_event.ring_page = 
-            xc_map_foreign_pages(xch, paging->vm_event.domain_id,
-                                 PROT_READ | PROT_WRITE,
-                                 &mmap_pfn, 1);
-        if ( !paging->vm_event.ring_page )
-        {
-            PERROR("Could not map the ring page\n");
-            goto err;
-        }
-    }
-    
-    /* Initialise Xen */
-    rc = xc_mem_paging_enable(xch, paging->vm_event.domain_id,
-                             &paging->vm_event.evtchn_port);
-    if ( rc != 0 )
-    {
-        switch ( errno ) {
-            case EBUSY:
-                ERROR("xenpaging is (or was) active on this domain");
-                break;
-            case ENODEV:
-                ERROR("xenpaging requires Hardware Assisted Paging");
-                break;
-            case EMLINK:
-                ERROR("xenpaging not supported while iommu passthrough is enabled");
-                break;
-            case EXDEV:
-                ERROR("xenpaging not supported in a PoD guest");
-                break;
-            default:
-                PERROR("Error initialising shared page");
-                break;
-        }
-        goto err;
-    }
-
-    /* Open event channel */
-    paging->vm_event.xce_handle = xenevtchn_open(NULL, 0);
-    if ( paging->vm_event.xce_handle == NULL )
-    {
-        PERROR("Failed to open event channel");
-        goto err;
-    }
-
-    /* Bind event notification */
-    rc = xenevtchn_bind_interdomain(paging->vm_event.xce_handle,
-                                    paging->vm_event.domain_id,
-                                    paging->vm_event.evtchn_port);
-    if ( rc < 0 )
-    {
-        PERROR("Failed to bind event channel");
-        goto err;
-    }
-
-    paging->vm_event.port = rc;
-
-    /* Initialise ring */
-    SHARED_RING_INIT((vm_event_sring_t *)paging->vm_event.ring_page);
-    BACK_RING_INIT(&paging->vm_event.back_ring,
-                   (vm_event_sring_t *)paging->vm_event.ring_page,
-                   XC_PAGE_SIZE);
-
-    /* Now that the ring is set, remove it from the guest's physmap */
-    if ( xc_domain_decrease_reservation_exact(xch, 
-                    paging->vm_event.domain_id, 1, 0, &ring_pfn) )
-        PERROR("Failed to remove ring from guest physmap");
-
-    /* Get max_pages from guest if not provided via cmdline */
-    if ( !paging->max_pages )
-    {
-        rc = xc_domain_getinfo_single(xch, paging->vm_event.domain_id,
-                                      &domain_info);
-        if ( rc < 0 )
-        {
-            PERROR("Error getting domain info");
-            goto err;
-        }
-
-        /* Record number of max_pages */
-        paging->max_pages = domain_info.max_pages;
-    }
-
-    /* Allocate bitmap for tracking pages that have been paged out */
-    paging->bitmap = bitmap_alloc(paging->max_pages);
-    if ( !paging->bitmap )
-    {
-        PERROR("Error allocating bitmap");
-        goto err;
-    }
-    DPRINTF("max_pages = %d\n", paging->max_pages);
-
-    /* Allocate indicies for pagefile slots */
-    paging->slot_to_gfn = calloc(paging->max_pages, sizeof(*paging->slot_to_gfn));
-    paging->gfn_to_slot = calloc(paging->max_pages, sizeof(*paging->gfn_to_slot));
-    if ( !paging->slot_to_gfn || !paging->gfn_to_slot )
-        goto err;
-
-    /* Allocate stack for known free slots in pagefile */
-    paging->free_slot_stack = calloc(paging->max_pages, sizeof(*paging->free_slot_stack));
-    if ( !paging->free_slot_stack )
-        goto err;
-
-    /* Initialise policy */
-    rc = policy_init(paging);
-    if ( rc != 0 )
-    {
-        PERROR("Error initialising policy");
-        goto err;
-    }
-
-    paging->paging_buffer = init_page();
-    if ( !paging->paging_buffer )
-    {
-        PERROR("Creating page aligned load buffer");
-        goto err;
-    }
-
-    /* Open file */
-    paging->fd = open(filename, O_CREAT | O_TRUNC | O_RDWR, S_IRUSR | S_IWUSR);
-    if ( paging->fd < 0 )
-    {
-        PERROR("failed to open file");
-        goto err;
-    }
-
-    return paging;
-
- err:
-    if ( paging )
-    {
-        if ( paging->xs_handle )
-            xs_close(paging->xs_handle);
-        if ( xch )
-            xc_interface_close(xch);
-        if ( paging->logger )
-            xtl_logger_destroy(paging->logger);
-        if ( paging->paging_buffer )
-        {
-            munlock(paging->paging_buffer, XC_PAGE_SIZE);
-            free(paging->paging_buffer);
-        }
-
-        if ( paging->vm_event.ring_page )
-        {
-            munmap(paging->vm_event.ring_page, XC_PAGE_SIZE);
-        }
-
-        free(dom_path);
-        free(watch_target_tot_pages);
-        free(paging->free_slot_stack);
-        free(paging->slot_to_gfn);
-        free(paging->gfn_to_slot);
-        free(paging->bitmap);
-        free(paging);
-    }
-
-    return NULL;
-}
-
-static void xenpaging_teardown(struct xenpaging *paging)
-{
-    int rc;
-    xc_interface *xch = paging->xc_handle;
-
-    xs_unwatch(paging->xs_handle, watch_target_tot_pages, "");
-    xs_unwatch(paging->xs_handle, "@releaseDomain", watch_token);
-
-    paging->xc_handle = NULL;
-    /* Tear down domain paging in Xen */
-    munmap(paging->vm_event.ring_page, XC_PAGE_SIZE);
-    rc = xc_mem_paging_disable(xch, paging->vm_event.domain_id);
-    if ( rc != 0 )
-    {
-        PERROR("Error tearing down domain paging in xen");
-    }
-
-    /* Unbind VIRQ */
-    rc = xenevtchn_unbind(paging->vm_event.xce_handle, paging->vm_event.port);
-    if ( rc != 0 )
-    {
-        PERROR("Error unbinding event port");
-    }
-    paging->vm_event.port = -1;
-
-    /* Close event channel */
-    rc = xenevtchn_close(paging->vm_event.xce_handle);
-    if ( rc != 0 )
-    {
-        PERROR("Error closing event channel");
-    }
-    paging->vm_event.xce_handle = NULL;
-    
-    /* Close connection to xenstore */
-    xs_close(paging->xs_handle);
-
-    /* Close connection to Xen */
-    xc_interface_close(xch);
-
-    xtl_logger_destroy(paging->logger);
-}
-
-static void get_request(struct vm_event *vm_event, vm_event_request_t *req)
-{
-    vm_event_back_ring_t *back_ring;
-    RING_IDX req_cons;
-
-    back_ring = &vm_event->back_ring;
-    req_cons = back_ring->req_cons;
-
-    /* Copy request */
-    memcpy(req, RING_GET_REQUEST(back_ring, req_cons), sizeof(*req));
-    req_cons++;
-
-    /* Update ring */
-    back_ring->req_cons = req_cons;
-    back_ring->sring->req_event = req_cons + 1;
-}
-
-static void put_response(struct vm_event *vm_event, vm_event_response_t *rsp)
-{
-    vm_event_back_ring_t *back_ring;
-    RING_IDX rsp_prod;
-
-    back_ring = &vm_event->back_ring;
-    rsp_prod = back_ring->rsp_prod_pvt;
-
-    /* Copy response */
-    memcpy(RING_GET_RESPONSE(back_ring, rsp_prod), rsp, sizeof(*rsp));
-    rsp_prod++;
-
-    /* Update ring */
-    back_ring->rsp_prod_pvt = rsp_prod;
-    RING_PUSH_RESPONSES(back_ring);
-}
-
-/* Evict a given gfn
- * Returns < 0 on fatal error
- * Returns 0 on successful evict
- * Returns > 0 if gfn can not be evicted
- */
-static int xenpaging_evict_page(struct xenpaging *paging, unsigned long gfn, int slot)
-{
-    xc_interface *xch = paging->xc_handle;
-    void *page;
-    xen_pfn_t victim = gfn;
-    int ret;
-    struct xen_domctl domctl;
-
-    /* Nominate page */
-    ret = xc_mem_paging_nominate(xch, paging->vm_event.domain_id, gfn);
-    if ( ret < 0 )
-    {
-        /* unpageable gfn is indicated by EBUSY */
-        if ( errno == EBUSY )
-            ret = 1;
-        else
-            PERROR("Error nominating page %lx", gfn);
-        goto out;
-    }
-
-    /* Map page */
-    page = xc_map_foreign_pages(xch, paging->vm_event.domain_id, PROT_READ, &victim, 1);
-    if ( page == NULL )
-    {
-        PERROR("Error mapping page %lx", gfn);
-        ret = -1;
-        goto out;
-    }
-
-    /* Copy page */
-    ret = write_page(paging->fd, page, slot);
-    if ( ret < 0 )
-    {
-        PERROR("Error copying page %lx", gfn);
-        munmap(page, XC_PAGE_SIZE);
-        ret = -1;
-        goto out;
-    }
-
-    /* Release page */
-    munmap(page, XC_PAGE_SIZE);
-
-    /* Tell Xen to evict page */
-    ret = xc_mem_paging_evict(xch, paging->vm_event.domain_id, gfn);
-    if ( ret < 0 )
-    {
-        /* A gfn in use is indicated by EBUSY */
-        if ( errno == EBUSY )
-        {
-                ret = 1;
-                DPRINTF("Nominated page %lx busy", gfn);
-        } else
-            PERROR("Error evicting page %lx", gfn);
-        goto out;
-    }
-
-    DPRINTF("evict_page > gfn %lx pageslot %d\n", gfn, slot);
-    /* Notify policy of page being paged out */
-    policy_notify_paged_out(gfn);
-
-    /* Update index */
-    paging->slot_to_gfn[slot] = gfn;
-    paging->gfn_to_slot[gfn] = slot;
-
-    /* Record number of evicted pages */
-    paging->num_paged_out++;
-
-    ret = 0;
-
- out:
-    return ret;
-}
-
-static int xenpaging_resume_page(struct xenpaging *paging, vm_event_response_t *rsp, int notify_policy)
-{
-    /* Put the page info on the ring */
-    put_response(&paging->vm_event, rsp);
-
-    /* Notify policy of page being paged in */
-    if ( notify_policy )
-    {
-        /*
-         * Do not add gfn to mru list if the target is lower than mru size.
-         * This allows page-out of these gfns if the target grows again.
-         */
-        if (paging->num_paged_out > paging->policy_mru_size)
-            policy_notify_paged_in(rsp->u.mem_paging.gfn);
-        else
-            policy_notify_paged_in_nomru(rsp->u.mem_paging.gfn);
-
-       /* Record number of resumed pages */
-       paging->num_paged_out--;
-    }
-
-    /* Tell Xen page is ready */
-    return xenevtchn_notify(paging->vm_event.xce_handle, paging->vm_event.port);
-}
-
-static int xenpaging_populate_page(struct xenpaging *paging, unsigned long gfn, int i)
-{
-    xc_interface *xch = paging->xc_handle;
-    int ret;
-    unsigned char oom = 0;
-
-    DPRINTF("populate_page < gfn %lx pageslot %d\n", gfn, i);
-
-    /* Read page */
-    ret = read_page(paging->fd, paging->paging_buffer, i);
-    if ( ret != 0 )
-    {
-        PERROR("Error reading page");
-        goto out;
-    }
-
-    do
-    {
-        /* Tell Xen to allocate a page for the domain */
-        ret = xc_mem_paging_load(xch, paging->vm_event.domain_id, gfn, paging->paging_buffer);
-        if ( ret < 0 )
-        {
-            if ( errno == ENOMEM )
-            {
-                if ( oom++ == 0 )
-                    DPRINTF("ENOMEM while preparing gfn %lx\n", gfn);
-                sleep(1);
-                continue;
-            }
-            PERROR("Error loading %lx during page-in", gfn);
-            ret = -1;
-            break;
-        }
-    }
-    while ( ret && !interrupted );
-
-
- out:
-    return ret;
-}
-
-/* Trigger a page-in for a batch of pages */
-static void resume_pages(struct xenpaging *paging, int num_pages)
-{
-    xc_interface *xch = paging->xc_handle;
-    int i, num = 0;
-
-    for ( i = 0; i < paging->max_pages && num < num_pages; i++ )
-    {
-        if ( test_bit(i, paging->bitmap) )
-        {
-            paging->pagein_queue[num] = i;
-            num++;
-            if ( num == XENPAGING_PAGEIN_QUEUE_SIZE )
-                break;
-        }
-    }
-    /* num may be less than num_pages, caller has to try again */
-    if ( num )
-        page_in_trigger();
-}
-
-/* Evict one gfn and write it to the given slot
- * Returns < 0 on fatal error
- * Returns 0 on successful evict
- * Returns > 0 if no gfn can be evicted
- */
-static int evict_victim(struct xenpaging *paging, int slot)
-{
-    xc_interface *xch = paging->xc_handle;
-    unsigned long gfn;
-    static int num_paged_out;
-    int ret;
-
-    do
-    {
-        gfn = policy_choose_victim(paging);
-        if ( gfn == INVALID_MFN )
-        {
-            /* If the number did not change after last flush command then
-             * the command did not reach qemu yet, or qemu still processes
-             * the command, or qemu has nothing to release.
-             * Right now there is no need to issue the command again.
-             */
-            if ( num_paged_out != paging->num_paged_out )
-            {
-                DPRINTF("Flushing qemu cache\n");
-                xenpaging_mem_paging_flush_ioemu_cache(paging);
-                num_paged_out = paging->num_paged_out;
-            }
-            ret = ENOSPC;
-            goto out;
-        }
-
-        if ( interrupted )
-        {
-            ret = EINTR;
-            goto out;
-        }
-
-        ret = xenpaging_evict_page(paging, gfn, slot);
-        if ( ret < 0 )
-            goto out;
-    }
-    while ( ret );
-
-    if ( test_and_set_bit(gfn, paging->bitmap) )
-        ERROR("Page %lx has been evicted before", gfn);
-
-    ret = 0;
-
- out:
-    return ret;
-}
-
-/* Evict a batch of pages and write them to a free slot in the paging file
- * Returns < 0 on fatal error
- * Returns 0 if no gfn can be evicted
- * Returns > 0 on successful evict
- */
-static int evict_pages(struct xenpaging *paging, int num_pages)
-{
-    xc_interface *xch = paging->xc_handle;
-    int rc, slot, num = 0;
-
-    /* Reuse known free slots */
-    while ( paging->stack_count > 0 && num < num_pages )
-    {
-        slot = paging->free_slot_stack[--paging->stack_count];
-        rc = evict_victim(paging, slot);
-        if ( rc )
-        {
-            num = rc < 0 ? -1 : num;
-            return num;
-        }
-        num++;
-    }
-
-    /* Scan all slots slots for remainders */
-    for ( slot = 0; slot < paging->max_pages && num < num_pages; slot++ )
-    {
-        /* Slot is allocated */
-        if ( paging->slot_to_gfn[slot] )
-            continue;
-
-        rc = evict_victim(paging, slot);
-        if ( rc )
-        {
-            num = rc < 0 ? -1 : num;
-            break;
-        }
-
-        num++;
-    }
-    return num;
-}
-
-int main(int argc, char *argv[])
-{
-    struct sigaction act;
-    struct xenpaging *paging;
-    vm_event_request_t req;
-    vm_event_response_t rsp;
-    int num, prev_num = 0;
-    int slot;
-    int tot_pages;
-    int rc;
-    xc_interface *xch;
-
-    /* Initialise domain paging */
-    paging = xenpaging_init(argc, argv);
-    if ( paging == NULL )
-    {
-        fprintf(stderr, "Error initialising paging\n");
-        return 1;
-    }
-    xch = paging->xc_handle;
-
-    DPRINTF("starting %s for domain_id %u with pagefile %s\n",
-            argv[0], paging->vm_event.domain_id, filename);
-
-    /* ensure that if we get a signal, we'll do cleanup, then exit */
-    act.sa_handler = close_handler;
-    act.sa_flags = 0;
-    sigemptyset(&act.sa_mask);
-    sigaction(SIGHUP,  &act, NULL);
-    sigaction(SIGTERM, &act, NULL);
-    sigaction(SIGINT,  &act, NULL);
-    sigaction(SIGALRM, &act, NULL);
-
-    /* listen for page-in events to stop pager */
-    create_page_in_thread(paging);
-
-    /* Swap pages in and out */
-    while ( 1 )
-    {
-        /* Wait for Xen to signal that a page needs paged in */
-        rc = xenpaging_wait_for_event_or_timeout(paging);
-        if ( rc < 0 )
-        {
-            ERROR("Error getting event");
-            goto out;
-        }
-        else if ( rc != 0 )
-        {
-            DPRINTF("Got event from Xen\n");
-        }
-
-        while ( RING_HAS_UNCONSUMED_REQUESTS(&paging->vm_event.back_ring) )
-        {
-            /* Indicate possible error */
-            rc = 1;
-
-            get_request(&paging->vm_event, &req);
-
-            if ( req.u.mem_paging.gfn > paging->max_pages )
-            {
-                ERROR("Requested gfn %"PRIx64" higher than max_pages %x\n",
-                      req.u.mem_paging.gfn, paging->max_pages);
-                goto out;
-            }
-
-            /* Check if the page has already been paged in */
-            if ( test_and_clear_bit(req.u.mem_paging.gfn, paging->bitmap) )
-            {
-                /* Find where in the paging file to read from */
-                slot = paging->gfn_to_slot[req.u.mem_paging.gfn];
-
-                /* Sanity check */
-                if ( paging->slot_to_gfn[slot] != req.u.mem_paging.gfn )
-                {
-                    ERROR("Expected gfn %"PRIx64" in slot %d, but found gfn %lx\n",
-                          req.u.mem_paging.gfn, slot, paging->slot_to_gfn[slot]);
-                    goto out;
-                }
-
-                if ( req.u.mem_paging.flags & MEM_PAGING_DROP_PAGE )
-                {
-                    DPRINTF("drop_page ^ gfn %"PRIx64" pageslot %d\n",
-                            req.u.mem_paging.gfn, slot);
-                    /* Notify policy of page being dropped */
-                    policy_notify_dropped(req.u.mem_paging.gfn);
-                }
-                else
-                {
-                    /* Populate the page */
-                    if ( xenpaging_populate_page(paging, req.u.mem_paging.gfn, slot) < 0 )
-                    {
-                        ERROR("Error populating page %"PRIx64"", req.u.mem_paging.gfn);
-                        goto out;
-                    }
-                }
-
-                /* Prepare the response */
-                rsp.u.mem_paging.gfn = req.u.mem_paging.gfn;
-                rsp.vcpu_id = req.vcpu_id;
-                rsp.flags = req.flags;
-
-                if ( xenpaging_resume_page(paging, &rsp, 1) < 0 )
-                {
-                    PERROR("Error resuming page %"PRIx64"", req.u.mem_paging.gfn);
-                    goto out;
-                }
-
-                /* Clear this pagefile slot */
-                paging->slot_to_gfn[slot] = 0;
-
-                /* Record this free slot */
-                paging->free_slot_stack[paging->stack_count++] = slot;
-            }
-            else
-            {
-                DPRINTF("page %s populated (domain = %d; vcpu = %d;"
-                        " gfn = %"PRIx64"; paused = %d; evict_fail = %d)\n",
-                        req.u.mem_paging.flags & MEM_PAGING_EVICT_FAIL ? "not" : "already",
-                        paging->vm_event.domain_id, req.vcpu_id, req.u.mem_paging.gfn,
-                        !!(req.flags & VM_EVENT_FLAG_VCPU_PAUSED) ,
-                        !!(req.u.mem_paging.flags & MEM_PAGING_EVICT_FAIL) );
-
-                /* Tell Xen to resume the vcpu */
-                if (( req.flags & VM_EVENT_FLAG_VCPU_PAUSED ) ||
-                    ( req.u.mem_paging.flags & MEM_PAGING_EVICT_FAIL ))
-                {
-                    /* Prepare the response */
-                    rsp.u.mem_paging.gfn = req.u.mem_paging.gfn;
-                    rsp.vcpu_id = req.vcpu_id;
-                    rsp.flags = req.flags;
-
-                    if ( xenpaging_resume_page(paging, &rsp, 0) < 0 )
-                    {
-                        PERROR("Error resuming page %"PRIx64"", req.u.mem_paging.gfn);
-                        goto out;
-                    }
-                }
-            }
-        }
-
-        /* If interrupted, write all pages back into the guest */
-        if ( interrupted == SIGTERM || interrupted == SIGINT )
-        {
-            /* If no more pages to process, exit loop. */
-            if ( !paging->num_paged_out )
-                break;
-            
-            /* One more round if there are still pages to process. */
-            resume_pages(paging, paging->num_paged_out);
-
-            /* Resume main loop */
-            continue;
-        }
-
-        /* Exit main loop on any other signal */
-        if ( interrupted )
-            break;
-
-        /* Indicate possible error */
-        rc = 1;
-
-        /* Check if the target has been reached already */
-        tot_pages = xenpaging_get_tot_pages(paging);
-        if ( tot_pages < 0 )
-            goto out;
-
-        /* Resume all pages if paging is disabled or no target was set */
-        if ( paging->target_tot_pages == 0 )
-        {
-            if ( paging->num_paged_out )
-                resume_pages(paging, paging->num_paged_out);
-        }
-        /* Evict more pages if target not reached */
-        else if ( tot_pages > paging->target_tot_pages )
-        {
-            num = tot_pages - paging->target_tot_pages;
-            if ( num != prev_num )
-            {
-                DPRINTF("Need to evict %d pages to reach %d target_tot_pages\n", num, paging->target_tot_pages);
-                prev_num = num;
-            }
-            /* Limit the number of evicts to be able to process page-in requests */
-            if ( num > 42 )
-            {
-                paging->use_poll_timeout = 0;
-                num = 42;
-            }
-            if ( evict_pages(paging, num) < 0 )
-                goto out;
-        }
-        /* Resume some pages if target not reached */
-        else if ( tot_pages < paging->target_tot_pages && paging->num_paged_out )
-        {
-            num = paging->target_tot_pages - tot_pages;
-            if ( num != prev_num )
-            {
-                DPRINTF("Need to resume %d pages to reach %d target_tot_pages\n", num, paging->target_tot_pages);
-                prev_num = num;
-            }
-            resume_pages(paging, num);
-        }
-        /* Now target was reached, enable poll() timeout */
-        else
-        {
-            paging->use_poll_timeout = 1;
-        }
-
-    }
-
-    /* No error */
-    rc = 0;
-
-    DPRINTF("xenpaging got signal %d\n", interrupted);
-
- out:
-    close(paging->fd);
-    unlink_pagefile();
-
-    /* Tear down domain paging */
-    xenpaging_teardown(paging);
-
-    return rc ? 2 : 0;
-}
-
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * indent-tabs-mode: nil
- * End: 
- */
diff --git a/tools/xenpaging/xenpaging.h b/tools/xenpaging/xenpaging.h
deleted file mode 100644
index e0fc7b31b863..000000000000
--- a/tools/xenpaging/xenpaging.h
+++ /dev/null
@@ -1,152 +0,0 @@
-/******************************************************************************
- * tools/xenpaging/xenpaging.h
- *
- * Xen domain paging.
- *
- * Copyright (c) 2009 Citrix Systems, Inc. (Patrick Colp)
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
- */
-
-
-#ifndef __XEN_PAGING2_H__
-#define __XEN_PAGING2_H__
-
-#include <malloc.h>
-#include <string.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <fcntl.h>
-#include <sys/mman.h>
-
-#include <xenevtchn.h>
-#define XC_WANT_COMPAT_MAP_FOREIGN_API
-#include <xenctrl.h>
-// #include <xc_private.h>
-#include <xen/event_channel.h>
-#include <xen/vm_event.h>
-
-#define XENPAGING_PAGEIN_QUEUE_SIZE 64
-
-struct vm_event {
-    domid_t domain_id;
-    xenevtchn_handle *xce_handle;
-    int port;
-    vm_event_back_ring_t back_ring;
-    uint32_t evtchn_port;
-    void *ring_page;
-};
-
-struct xenpaging {
-    xc_interface *xc_handle;
-    xentoollog_logger *logger;
-    struct xs_handle *xs_handle;
-
-    unsigned long *bitmap;
-
-    unsigned long *slot_to_gfn;
-    int *gfn_to_slot;
-
-    void *paging_buffer;
-
-    struct vm_event vm_event;
-    int fd;
-    /* number of pages for which data structures were allocated */
-    int max_pages;
-    int num_paged_out;
-    int target_tot_pages;
-    int policy_mru_size;
-    int use_poll_timeout;
-    int debug;
-    int stack_count;
-    int *free_slot_stack;
-    unsigned long pagein_queue[XENPAGING_PAGEIN_QUEUE_SIZE];
-};
-
-#define DPRINTF(msg, args...) xtl_log(paging->logger, XTL_DETAIL, 0,      \
-                                      "paging", msg, ## args)
-#define ERROR(msg, args...)   xtl_log(paging->logger, XTL_ERROR, -1,      \
-                                      "paging", msg, ## args)
-#define PERROR(msg, args...)  xtl_log(paging->logger, XTL_ERROR, -1,      \
-                                      "paging", msg "(%d = %s)", ## args, \
-                                      errno, strerror(errno))
-
-extern void create_page_in_thread(struct xenpaging *paging);
-extern void page_in_trigger(void);
-
-#define BITS_PER_LONG (sizeof(unsigned long) * 8)
-#define ORDER_LONG (sizeof(unsigned long) == 4 ? 5 : 6)
-
-#define BITMAP_ENTRY(_nr,_bmap) ((_bmap))[(_nr) / 8]
-#define BITMAP_SHIFT(_nr) ((_nr) % 8)
-
-static inline int bitmap_size(int nr_bits)
-{
-    return (nr_bits + 7) / 8;
-}
-
-static inline void *bitmap_alloc(int nr_bits)
-{
-    return calloc(1, bitmap_size(nr_bits));
-}
-
-static inline void bitmap_clear(void *addr, int nr_bits)
-{
-    memset(addr, 0, bitmap_size(nr_bits));
-}
-
-static inline int test_bit(int nr, const void *_addr)
-{
-    const char *addr = _addr;
-    return (BITMAP_ENTRY(nr, addr) >> BITMAP_SHIFT(nr)) & 1;
-}
-
-static inline void clear_bit(int nr, void *_addr)
-{
-    char *addr = _addr;
-    BITMAP_ENTRY(nr, addr) &= ~(1UL << BITMAP_SHIFT(nr));
-}
-
-static inline void set_bit(int nr, void *_addr)
-{
-    char *addr = _addr;
-    BITMAP_ENTRY(nr, addr) |= (1UL << BITMAP_SHIFT(nr));
-}
-
-static inline int test_and_clear_bit(int nr, void *addr)
-{
-    int oldbit = test_bit(nr, addr);
-    clear_bit(nr, addr);
-    return oldbit;
-}
-
-static inline int test_and_set_bit(int nr, void *addr)
-{
-    int oldbit = test_bit(nr, addr);
-    set_bit(nr, addr);
-    return oldbit;
-}
-
-#endif // __XEN_PAGING_H__
-
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * tab-width: 4
- * indent-tabs-mode: nil
- * End:
- */
diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
index f32bf5cbb73a..b02639d84964 100644
--- a/xen/arch/x86/hvm/Kconfig
+++ b/xen/arch/x86/hvm/Kconfig
@@ -84,10 +84,6 @@ config VIRIDIAN
 
 	  If unsure, say Y.
 
-config MEM_PAGING
-	bool "Xen memory paging support (UNSUPPORTED)" if UNSUPPORTED
-	depends on VM_EVENT
-
 config MEM_SHARING
 	bool "Xen memory sharing support (UNSUPPORTED)" if UNSUPPORTED
 	depends on INTEL_VMX
diff --git a/xen/arch/x86/hvm/dm.c b/xen/arch/x86/hvm/dm.c
index 3b53471af0d9..1758f37ed5b0 100644
--- a/xen/arch/x86/hvm/dm.c
+++ b/xen/arch/x86/hvm/dm.c
@@ -260,12 +260,6 @@ static int set_mem_type(struct domain *d,
         p2m_type_t ot;
 
         get_gfn_unshare(d, pfn, &ot);
-        if ( p2m_is_paging(ot) )
-        {
-            put_gfn(d, pfn);
-            p2m_mem_paging_populate(d, _gfn(pfn));
-            return -EAGAIN;
-        }
 
         if ( p2m_is_shared(ot) )
             rc = -EAGAIN;
diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index f3aae158e9f8..1abff57d2c32 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -743,7 +743,6 @@ static void *hvmemul_map_linear_addr(
              */
             ASSERT_UNREACHABLE();
             /* fall through */
-        case HVMTRANS_gfn_paged_out:
         case HVMTRANS_gfn_shared:
             err = ERR_PTR(~X86EMUL_RETRY);
             goto out;
@@ -896,7 +895,7 @@ static int hvmemul_linear_to_phys(
     }
     else if ( (pfn = paging_gva_to_gfn(curr, addr, &pfec)) == gfn_x(INVALID_GFN) )
     {
-        if ( pfec & (PFEC_page_paged | PFEC_page_shared) )
+        if ( pfec & PFEC_page_shared )
             return X86EMUL_RETRY;
         *reps = 0;
         x86_emul_pagefault(pfec, addr, &hvmemul_ctxt->ctxt);
@@ -915,7 +914,7 @@ static int hvmemul_linear_to_phys(
         if ( (npfn == gfn_x(INVALID_GFN)) ||
              (npfn != (pfn + (reverse ? -i : i))) )
         {
-            if ( pfec & (PFEC_page_paged | PFEC_page_shared) )
+            if ( pfec & PFEC_page_shared )
                 return X86EMUL_RETRY;
             done /= bytes_per_rep;
             if ( done == 0 )
@@ -1316,7 +1315,6 @@ static int linear_read(unsigned long addr, unsigned int bytes, void *p_data,
                                         hvmemul_ctxt, start,
                                         known_gla(addr, bytes, pfec));
 
-    case HVMTRANS_gfn_paged_out:
     case HVMTRANS_gfn_shared:
     case HVMTRANS_need_retry:
         return X86EMUL_RETRY;
@@ -1373,7 +1371,6 @@ static int linear_write(unsigned long addr, unsigned int bytes, void *p_data,
                                          hvmemul_ctxt, start,
                                          known_gla(addr, bytes, pfec));
 
-    case HVMTRANS_gfn_paged_out:
     case HVMTRANS_gfn_shared:
     case HVMTRANS_need_retry:
         return X86EMUL_RETRY;
@@ -2098,7 +2095,6 @@ static int cf_check hvmemul_rep_movs(
          */
         ASSERT_UNREACHABLE();
         /* fall through */
-    case HVMTRANS_gfn_paged_out:
     case HVMTRANS_gfn_shared:
         return X86EMUL_RETRY;
     case HVMTRANS_okay:
@@ -2218,7 +2214,6 @@ static int cf_check hvmemul_rep_stos(
              */
             ASSERT_UNREACHABLE();
             /* fall through */
-        case HVMTRANS_gfn_paged_out:
         case HVMTRANS_gfn_shared:
             return X86EMUL_RETRY;
         case HVMTRANS_okay:
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index f759a397c557..ef8f7936d68e 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1813,7 +1813,7 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsigned long gla,
     struct vcpu *curr = current;
     struct domain *currd = curr->domain;
     struct p2m_domain *p2m, *hostp2m;
-    int rc, fall_through = 0, paged = 0;
+    int rc, fall_through = 0;
     bool sharing_enomem = false;
     vm_event_request_t *req_ptr = NULL;
     bool sync = false;
@@ -2004,12 +2004,6 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsigned long gla,
         goto out_put_gfn;
     }
 
-#ifdef CONFIG_MEM_PAGING
-    /* Check if the page has been paged out */
-    if ( p2m_is_paged(p2mt) || (p2mt == p2m_ram_paging_out) )
-        paged = 1;
-#endif
-
 #ifdef CONFIG_MEM_SHARING
     /* Mem sharing: if still shared on write access then its enomem */
     if ( npfec.write_access && p2m_is_shared(p2mt) )
@@ -2063,8 +2057,6 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsigned long gla,
      * sleep on event ring wait queues, and we must not hold
      * locks in such circumstance.
      */
-    if ( paged )
-        p2m_mem_paging_populate(currd, _gfn(gfn));
 
     if ( sharing_enomem )
     {
@@ -2823,7 +2815,7 @@ static void *hvm_map_entry(unsigned long va, bool *writable)
      */
     pfec = PFEC_page_present;
     gfn = paging_gva_to_gfn(current, va, &pfec);
-    if ( pfec & (PFEC_page_paged | PFEC_page_shared) )
+    if ( pfec & PFEC_page_shared )
         goto fail;
 
     v = hvm_map_guest_frame_rw(gfn, 0, writable);
@@ -3258,9 +3250,6 @@ enum hvm_translation_result hvm_translate_get_page(
 
         if ( gfn_eq(gfn, INVALID_GFN) )
         {
-            if ( pfec & PFEC_page_paged )
-                return HVMTRANS_gfn_paged_out;
-
             if ( pfec & PFEC_page_shared )
                 return HVMTRANS_gfn_shared;
 
@@ -3294,12 +3283,6 @@ enum hvm_translation_result hvm_translate_get_page(
     if ( !page )
         return HVMTRANS_bad_gfn_to_mfn;
 
-    if ( p2m_is_paging(p2mt) )
-    {
-        put_page(page);
-        p2m_mem_paging_populate(v->domain, gfn);
-        return HVMTRANS_gfn_paged_out;
-    }
     if ( p2m_is_shared(p2mt) )
     {
         put_page(page);
diff --git a/xen/arch/x86/hvm/intercept.c b/xen/arch/x86/hvm/intercept.c
index da22c386763e..639dee7f5c96 100644
--- a/xen/arch/x86/hvm/intercept.c
+++ b/xen/arch/x86/hvm/intercept.c
@@ -137,7 +137,6 @@ int hvm_process_io_intercept(const struct hvm_io_handler *handler,
                     /* Drop the write as real hardware would. */
                     continue;
                 case HVMTRANS_bad_linear_to_gfn:
-                case HVMTRANS_gfn_paged_out:
                 case HVMTRANS_gfn_shared:
                 case HVMTRANS_need_retry:
                     ASSERT_UNREACHABLE();
@@ -170,7 +169,6 @@ int hvm_process_io_intercept(const struct hvm_io_handler *handler,
                     data = ~0;
                     break;
                 case HVMTRANS_bad_linear_to_gfn:
-                case HVMTRANS_gfn_paged_out:
                 case HVMTRANS_gfn_shared:
                 case HVMTRANS_need_retry:
                     ASSERT_UNREACHABLE();
diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index e4cdfe55c18e..1d6a1f5ed258 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -715,7 +715,6 @@ static void nvmx_update_apic_access_address(struct vcpu *v)
 
         apic_gpfn = get_vvmcs(v, APIC_ACCESS_ADDR) >> PAGE_SHIFT;
         apic_pg = get_page_from_gfn(v->domain, apic_gpfn, &p2mt, P2M_ALLOC);
-        ASSERT(apic_pg && !p2m_is_paging(p2mt));
         __vmwrite(APIC_ACCESS_ADDR, page_to_maddr(apic_pg));
         put_page(apic_pg);
     }
@@ -736,7 +735,6 @@ static void nvmx_update_virtual_apic_address(struct vcpu *v)
 
         vapic_gpfn = get_vvmcs(v, VIRTUAL_APIC_PAGE_ADDR) >> PAGE_SHIFT;
         vapic_pg = get_page_from_gfn(v->domain, vapic_gpfn, &p2mt, P2M_ALLOC);
-        ASSERT(vapic_pg && !p2m_is_paging(p2mt));
         __vmwrite(VIRTUAL_APIC_PAGE_ADDR, page_to_maddr(vapic_pg));
         put_page(vapic_pg);
     }
diff --git a/xen/arch/x86/include/asm/hvm/support.h b/xen/arch/x86/include/asm/hvm/support.h
index 9e9fa6295567..0728d19ada38 100644
--- a/xen/arch/x86/include/asm/hvm/support.h
+++ b/xen/arch/x86/include/asm/hvm/support.h
@@ -48,7 +48,6 @@ enum hvm_translation_result {
     HVMTRANS_bad_linear_to_gfn,
     HVMTRANS_bad_gfn_to_mfn,
     HVMTRANS_unhandleable,
-    HVMTRANS_gfn_paged_out,
     HVMTRANS_gfn_shared,
     HVMTRANS_need_retry,
 };
diff --git a/xen/arch/x86/include/asm/mem_paging.h b/xen/arch/x86/include/asm/mem_paging.h
deleted file mode 100644
index 2c618925d01d..000000000000
--- a/xen/arch/x86/include/asm/mem_paging.h
+++ /dev/null
@@ -1,24 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/******************************************************************************
- * include/asm-x86/mem_paging.h
- *
- * Memory paging support.
- *
- * Copyright (c) 2009 Citrix Systems, Inc. (Patrick Colp)
- */
-
-#ifndef __ASM_X86_MEM_PAGING_H__
-#define __ASM_X86_MEM_PAGING_H__
-
-int mem_paging_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_paging_op_t) arg);
-
-#endif /*__ASM_X86_MEM_PAGING_H__ */
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * indent-tabs-mode: nil
- * End:
- */
diff --git a/xen/arch/x86/include/asm/p2m.h b/xen/arch/x86/include/asm/p2m.h
index 3a5a5fd43c2a..2d2cd5f5e9e1 100644
--- a/xen/arch/x86/include/asm/p2m.h
+++ b/xen/arch/x86/include/asm/p2m.h
@@ -60,9 +60,6 @@ typedef enum {
      * be used in 64-bit builds */
     p2m_grant_map_rw = 7,         /* Read/write grant mapping */
     p2m_grant_map_ro = 8,         /* Read-only grant mapping */
-    p2m_ram_paging_out = 9,       /* Memory that is being paged out */
-    p2m_ram_paged = 10,           /* Memory that has been paged out */
-    p2m_ram_paging_in = 11,       /* Memory that is being paged in */
     p2m_ram_shared = 12,          /* Shared or sharable memory */
     p2m_ram_broken = 13,          /* Broken page, access cause domain crash */
     p2m_map_foreign  = 14,        /* ram pages from foreign domain */
@@ -81,18 +78,13 @@ typedef unsigned int p2m_query_t;
 #define P2M_RAM_TYPES (p2m_to_mask(p2m_ram_rw)                \
                        | p2m_to_mask(p2m_ram_logdirty)        \
                        | p2m_to_mask(p2m_ram_ro)              \
-                       | p2m_to_mask(p2m_ram_paging_out)      \
-                       | p2m_to_mask(p2m_ram_paged)           \
-                       | p2m_to_mask(p2m_ram_paging_in)       \
                        | p2m_to_mask(p2m_ram_shared)          \
                        | p2m_to_mask(p2m_ioreq_server))
 
 /* Types that represent a physmap hole that is ok to replace with a shared
  * entry */
 #define P2M_HOLE_TYPES (p2m_to_mask(p2m_mmio_dm)        \
-                       | p2m_to_mask(p2m_invalid)       \
-                       | p2m_to_mask(p2m_ram_paging_in) \
-                       | p2m_to_mask(p2m_ram_paged))
+                       | p2m_to_mask(p2m_invalid))
 
 /* Grant mapping types, which map to a real machine frame in another
  * VM */
@@ -120,21 +112,6 @@ typedef unsigned int p2m_query_t;
 
 #define P2M_POD_TYPES (p2m_to_mask(p2m_populate_on_demand))
 
-/* Pageable types */
-#define P2M_PAGEABLE_TYPES (p2m_to_mask(p2m_ram_rw) \
-                            | p2m_to_mask(p2m_ram_logdirty) )
-
-#ifdef CONFIG_MEM_PAGING
-#define P2M_PAGING_TYPES (p2m_to_mask(p2m_ram_paging_out)        \
-                          | p2m_to_mask(p2m_ram_paged)           \
-                          | p2m_to_mask(p2m_ram_paging_in))
-
-#define P2M_PAGED_TYPES (p2m_to_mask(p2m_ram_paged))
-#else
-#define P2M_PAGING_TYPES 0
-#define P2M_PAGED_TYPES 0
-#endif
-
 /* Shared types */
 #ifdef CONFIG_MEM_SHARING
 /* XXX: Sharable types could include p2m_ram_ro too, but we would need to
@@ -154,8 +131,7 @@ typedef unsigned int p2m_query_t;
 
 /* Valid types not necessarily associated with a (valid) MFN. */
 #define P2M_INVALID_MFN_TYPES (P2M_POD_TYPES                  \
-                               | p2m_to_mask(p2m_mmio_direct) \
-                               | P2M_PAGING_TYPES)
+                               | p2m_to_mask(p2m_mmio_direct))
 
 /* Broken type: the frame backing this pfn has failed in hardware
  * and must not be touched. */
@@ -175,9 +151,6 @@ typedef unsigned int p2m_query_t;
    implementations, there's no way of synchronising against that. */
 #define p2m_is_valid(_t)    (p2m_to_mask(_t) & \
                              (P2M_RAM_TYPES | p2m_to_mask(p2m_mmio_direct)))
-#define p2m_is_pageable(_t) (p2m_to_mask(_t) & P2M_PAGEABLE_TYPES)
-#define p2m_is_paging(_t)   (p2m_to_mask(_t) & P2M_PAGING_TYPES)
-#define p2m_is_paged(_t)    (p2m_to_mask(_t) & P2M_PAGED_TYPES)
 #define p2m_is_sharable(_t) (p2m_to_mask(_t) & P2M_SHARABLE_TYPES)
 #define p2m_is_shared(_t)   (p2m_to_mask(_t) & P2M_SHARED_TYPES)
 #define p2m_is_special(_t)  (p2m_to_mask(_t) & P2M_SPECIAL_TYPES)
@@ -775,14 +748,6 @@ static inline int relinquish_p2m_mapping(struct domain *d)
 /* Modify p2m table for shared gfn */
 int set_shared_p2m_entry(struct domain *d, unsigned long gfn_l, mfn_t mfn);
 
-/* Tell xenpaging to drop a paged out frame */
-void p2m_mem_paging_drop_page(struct domain *d, gfn_t gfn, p2m_type_t p2mt);
-/* Start populating a paged out frame */
-void p2m_mem_paging_populate(struct domain *d, gfn_t gfn);
-/* Resume normal operation (in case a domain was paused) */
-struct vm_event_st;
-void p2m_mem_paging_resume(struct domain *d, struct vm_event_st *rsp);
-
 /*
  * Internal functions, only called by other p2m code
  */
diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
index c37bd7a17658..ca401604d0d9 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -41,7 +41,6 @@
 #define PFEC_shstk          (_AC(1,U) << 6)
 #define PFEC_arch_mask      (_AC(0xffff,U)) /* Architectural PFEC values. */
 /* Internally used only flags. */
-#define PFEC_page_paged     (1U<<16)
 #define PFEC_page_shared    (1U<<17)
 #define PFEC_implicit       (1U<<18) /* Pagewalk input for ldt/gdt/idt/tr accesses. */
 #define PFEC_synth_mask     (~PFEC_arch_mask) /* Synthetic PFEC values. */
diff --git a/xen/arch/x86/livepatch.c b/xen/arch/x86/livepatch.c
index be40f625d206..01062dde7c03 100644
--- a/xen/arch/x86/livepatch.c
+++ b/xen/arch/x86/livepatch.c
@@ -43,10 +43,6 @@ int arch_livepatch_safety_check(void)
 #ifdef CONFIG_MEM_SHARING
         if ( has_active_waitqueue(d->vm_event_share) )
             goto fail;
-#endif
-#ifdef CONFIG_MEM_PAGING
-        if ( has_active_waitqueue(d->vm_event_paging) )
-            goto fail;
 #endif
         if ( has_active_waitqueue(d->vm_event_monitor) )
             goto fail;
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index b2b03da52b85..cbf955ee973b 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -2183,17 +2183,6 @@ static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
 
             page = get_page_from_gfn(pg_dom, gfn_x(gfn), &p2mt, q);
 
-            if ( p2m_is_paged(p2mt) )
-            {
-                if ( page )
-                    put_page(page);
-                p2m_mem_paging_populate(pg_dom, gfn);
-                return -ENOENT;
-            }
-
-            if ( p2mt == p2m_ram_paging_in && !page )
-                return -ENOENT;
-
             /* Did our attempt to unshare fail? */
             if ( (q & P2M_UNSHARE) && p2m_is_shared(p2mt) )
             {
@@ -4110,14 +4099,8 @@ long do_mmu_update(
             {
                 if ( page )
                     put_page(page);
-                if ( p2m_is_paged(p2mt) )
-                {
-                    p2m_mem_paging_populate(pt_owner, _gfn(gmfn));
-                    rc = -ENOENT;
-                }
-                else
-                    gdprintk(XENLOG_WARNING,
-                             "Could not get page for normal update\n");
+                gdprintk(XENLOG_WARNING,
+                         "Could not get page for normal update\n");
                 break;
             }
 
diff --git a/xen/arch/x86/mm/Makefile b/xen/arch/x86/mm/Makefile
index 960f6e840945..3fb2e53aeb4d 100644
--- a/xen/arch/x86/mm/Makefile
+++ b/xen/arch/x86/mm/Makefile
@@ -5,7 +5,6 @@ obj-$(CONFIG_ALTP2M) += altp2m.o
 obj-$(CONFIG_HVM) += guest_walk_2.o guest_walk_3.o guest_walk_4.o
 obj-$(CONFIG_SHADOW_PAGING) += guest_walk_4.o
 obj-$(CONFIG_VM_EVENT) += mem_access.o
-obj-$(CONFIG_MEM_PAGING) += mem_paging.o
 obj-$(CONFIG_MEM_SHARING) += mem_sharing.o
 obj-$(CONFIG_HVM) += nested.o
 obj-$(CONFIG_HVM) += p2m.o
diff --git a/xen/arch/x86/mm/altp2m.c b/xen/arch/x86/mm/altp2m.c
index 0bc9b9ad2f52..ac9f7437843b 100644
--- a/xen/arch/x86/mm/altp2m.c
+++ b/xen/arch/x86/mm/altp2m.c
@@ -76,7 +76,7 @@ int altp2m_vcpu_enable_ve(struct vcpu *v, gfn_t gfn)
      * pageable() predicate for this, due to it having the same properties
      * that we want.
      */
-    if ( !p2m_is_pageable(p2mt) || is_special_page(pg) )
+    if ( is_special_page(pg) )
     {
         rc = -EINVAL;
         goto err;
diff --git a/xen/arch/x86/mm/guest_walk.c b/xen/arch/x86/mm/guest_walk.c
index f48c3ef75f48..4ab1896fda28 100644
--- a/xen/arch/x86/mm/guest_walk.c
+++ b/xen/arch/x86/mm/guest_walk.c
@@ -547,15 +547,6 @@ void *map_domain_gfn(struct p2m_domain *p2m, gfn_t gfn, mfn_t *mfn,
     page = paging_mode_translate(p2m->domain)
            ? p2m_get_page_from_gfn(p2m, gfn, &p2mt, NULL, q)
            : get_page_from_gfn(p2m->domain, gfn_x(gfn), &p2mt, q);
-    if ( p2m_is_paging(p2mt) )
-    {
-        ASSERT(p2m_is_hostp2m(p2m));
-        if ( page )
-            put_page(page);
-        p2m_mem_paging_populate(p2m->domain, gfn);
-        *pfec = PFEC_page_paged;
-        return NULL;
-    }
     if ( p2m_is_shared(p2mt) )
     {
         if ( page )
diff --git a/xen/arch/x86/mm/hap/guest_walk.c b/xen/arch/x86/mm/hap/guest_walk.c
index d1b7c5762c9e..5d85c97b0605 100644
--- a/xen/arch/x86/mm/hap/guest_walk.c
+++ b/xen/arch/x86/mm/hap/guest_walk.c
@@ -48,15 +48,6 @@ unsigned long cf_check hap_p2m_ga_to_gfn(GUEST_PAGING_LEVELS)(
     top_gfn = _gfn(cr3 >> PAGE_SHIFT);
     top_page = p2m_get_page_from_gfn(p2m, top_gfn, &p2mt, NULL,
                                      P2M_ALLOC | P2M_UNSHARE);
-    if ( p2m_is_paging(p2mt) )
-    {
-        ASSERT(p2m_is_hostp2m(p2m));
-        *pfec = PFEC_page_paged;
-        if ( top_page )
-            put_page(top_page);
-        p2m_mem_paging_populate(p2m->domain, gaddr_to_gfn(cr3));
-        return gfn_x(INVALID_GFN);
-    }
     if ( p2m_is_shared(p2mt) )
     {
         *pfec = PFEC_page_shared;
@@ -92,13 +83,6 @@ unsigned long cf_check hap_p2m_ga_to_gfn(GUEST_PAGING_LEVELS)(
                                      P2M_ALLOC | P2M_UNSHARE);
         if ( page )
             put_page(page);
-        if ( p2m_is_paging(p2mt) )
-        {
-            ASSERT(p2m_is_hostp2m(p2m));
-            *pfec = PFEC_page_paged;
-            p2m_mem_paging_populate(p2m->domain, gfn);
-            return gfn_x(INVALID_GFN);
-        }
         if ( p2m_is_shared(p2mt) )
         {
             *pfec = PFEC_page_shared;
diff --git a/xen/arch/x86/mm/hap/nested_ept.c b/xen/arch/x86/mm/hap/nested_ept.c
index d88d677825f1..f1d021725b09 100644
--- a/xen/arch/x86/mm/hap/nested_ept.c
+++ b/xen/arch/x86/mm/hap/nested_ept.c
@@ -190,11 +190,6 @@ nept_walk_tables(struct vcpu *v, unsigned long l2ga, ept_walk_t *gw)
     goto out;
 
 map_err:
-    if ( rc == PFEC_page_paged )
-    {
-        ret = EPT_TRANSLATE_RETRY;
-        goto out;
-    }
     /* fall through to misconfig error */
 misconfig_err:
     ret =  EPT_TRANSLATE_MISCONFIG;
diff --git a/xen/arch/x86/mm/hap/nested_hap.c b/xen/arch/x86/mm/hap/nested_hap.c
index 255fba7e1cac..681dc238156f 100644
--- a/xen/arch/x86/mm/hap/nested_hap.c
+++ b/xen/arch/x86/mm/hap/nested_hap.c
@@ -126,7 +126,7 @@ static int nestedhap_walk_L0_p2m(
     if ( npfec.write_access && p2m_is_readonly(*p2mt) )
         goto out;
 
-    if ( p2m_is_paging(*p2mt) || p2m_is_shared(*p2mt) || !p2m_is_ram(*p2mt) )
+    if ( p2m_is_shared(*p2mt) || !p2m_is_ram(*p2mt) )
         goto out;
 
     if ( !mfn_valid(mfn) )
diff --git a/xen/arch/x86/mm/mem_paging.c b/xen/arch/x86/mm/mem_paging.c
deleted file mode 100644
index 33929b526ab9..000000000000
--- a/xen/arch/x86/mm/mem_paging.c
+++ /dev/null
@@ -1,487 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/******************************************************************************
- * arch/x86/mm/mem_paging.c
- *
- * Memory paging support.
- *
- * Copyright (c) 2009 Citrix Systems, Inc. (Patrick Colp)
- */
-
-#include <xen/guest_access.h>
-#include <xen/vm_event.h>
-
-#include <asm/mem_paging.h>
-#include <asm/p2m.h>
-
-#include <xsm/xsm.h>
-
-#include "mm-locks.h"
-
-/*
- * p2m_mem_paging_drop_page - Tell pager to drop its reference to a paged page
- * @d: guest domain
- * @gfn: guest page to drop
- *
- * p2m_mem_paging_drop_page() will notify the pager that a paged-out gfn was
- * released by the guest. The pager is supposed to drop its reference of the
- * gfn.
- */
-void p2m_mem_paging_drop_page(struct domain *d, gfn_t gfn, p2m_type_t p2mt)
-{
-    vm_event_request_t req = {
-        .reason = VM_EVENT_REASON_MEM_PAGING,
-        .u.mem_paging.gfn = gfn_x(gfn)
-    };
-
-    /*
-     * We allow no ring in this unique case, because it won't affect
-     * correctness of the guest execution at this point.  If this is the only
-     * page that happens to be paged-out, we'll be okay..  but it's likely the
-     * guest will crash shortly anyways.
-     */
-    int rc = vm_event_claim_slot(d, d->vm_event_paging);
-
-    if ( rc < 0 )
-        return;
-
-    /* Send release notification to pager */
-    req.u.mem_paging.flags = MEM_PAGING_DROP_PAGE;
-
-    /* Update stats unless the page hasn't yet been evicted */
-    if ( p2mt != p2m_ram_paging_out )
-        atomic_dec(&d->paged_pages);
-    else
-        /* Evict will fail now, tag this request for pager */
-        req.u.mem_paging.flags |= MEM_PAGING_EVICT_FAIL;
-
-    vm_event_put_request(d, d->vm_event_paging, &req);
-}
-
-/*
- * p2m_mem_paging_populate - Tell pager to populate a paged page
- * @d: guest domain
- * @gfn: guest page in paging state
- *
- * p2m_mem_paging_populate() will notify the pager that a page in any of the
- * paging states needs to be written back into the guest.
- * This function needs to be called whenever gfn_to_mfn() returns any of the p2m
- * paging types because the gfn may not be backed by a mfn.
- *
- * The gfn can be in any of the paging states, but the pager needs only be
- * notified when the gfn is in the paging-out path (paging_out or paged).  This
- * function may be called more than once from several vcpus. If the vcpu belongs
- * to the guest, the vcpu must be stopped and the pager notified that the vcpu
- * was stopped. The pager needs to handle several requests for the same gfn.
- *
- * If the gfn is not in the paging-out path and the vcpu does not belong to the
- * guest, nothing needs to be done and the function assumes that a request was
- * already sent to the pager. In this case the caller has to try again until the
- * gfn is fully paged in again.
- */
-void p2m_mem_paging_populate(struct domain *d, gfn_t gfn)
-{
-    struct vcpu *v = current;
-    vm_event_request_t req = {
-        .reason = VM_EVENT_REASON_MEM_PAGING,
-        .u.mem_paging.gfn = gfn_x(gfn)
-    };
-    p2m_type_t p2mt;
-    p2m_access_t a;
-    mfn_t mfn;
-    struct p2m_domain *p2m = p2m_get_hostp2m(d);
-    int rc = vm_event_claim_slot(d, d->vm_event_paging);
-
-    /* We're paging. There should be a ring. */
-    if ( rc == -EOPNOTSUPP )
-    {
-        gdprintk(XENLOG_ERR, "%pd paging gfn %"PRI_gfn" yet no ring in place\n",
-                 d, gfn_x(gfn));
-        /* Prevent the vcpu from faulting repeatedly on the same gfn */
-        if ( v->domain == d )
-            vcpu_pause_nosync(v);
-        domain_crash(d);
-        return;
-    }
-    else if ( rc < 0 )
-        return;
-
-    /* Fix p2m mapping */
-    gfn_lock(p2m, gfn, 0);
-    mfn = p2m->get_entry(p2m, gfn, &p2mt, &a, 0, NULL, NULL);
-    /* Allow only nominated or evicted pages to enter page-in path */
-    if ( p2mt == p2m_ram_paging_out || p2mt == p2m_ram_paged )
-    {
-        /* Evict will fail now, tag this request for pager */
-        if ( p2mt == p2m_ram_paging_out )
-            req.u.mem_paging.flags |= MEM_PAGING_EVICT_FAIL;
-
-        rc = p2m_set_entry(p2m, gfn, mfn, PAGE_ORDER_4K, p2m_ram_paging_in, a);
-    }
-    gfn_unlock(p2m, gfn, 0);
-    if ( rc < 0 )
-        goto out_cancel;
-
-    /* Pause domain if request came from guest and gfn has paging type */
-    if ( p2m_is_paging(p2mt) && v->domain == d )
-    {
-        vm_event_vcpu_pause(v);
-        req.flags |= VM_EVENT_FLAG_VCPU_PAUSED;
-    }
-    /* No need to inform pager if the gfn is not in the page-out path */
-    else if ( p2mt != p2m_ram_paging_out && p2mt != p2m_ram_paged )
-    {
-        /* gfn is already on its way back and vcpu is not paused */
-    out_cancel:
-        vm_event_cancel_slot(d, d->vm_event_paging);
-        return;
-    }
-
-    /* Send request to pager */
-    req.u.mem_paging.p2mt = p2mt;
-    req.vcpu_id = v->vcpu_id;
-
-    vm_event_put_request(d, d->vm_event_paging, &req);
-}
-
-/*
- * p2m_mem_paging_resume - Resume guest gfn
- * @d: guest domain
- * @rsp: vm_event response received
- *
- * p2m_mem_paging_resume() will forward the p2mt of a gfn to ram_rw. It is
- * called by the pager.
- *
- * The gfn was previously either evicted and populated, or nominated and
- * populated. If the page was evicted the p2mt will be p2m_ram_paging_in. If
- * the page was just nominated the p2mt will be p2m_ram_paging_in_start because
- * the pager did not call prepare().
- *
- * If the gfn was dropped the vcpu needs to be unpaused.
- */
-void p2m_mem_paging_resume(struct domain *d, struct vm_event_st *rsp)
-{
-    struct p2m_domain *p2m = p2m_get_hostp2m(d);
-    p2m_type_t p2mt;
-    p2m_access_t a;
-    mfn_t mfn;
-
-    /* Fix p2m entry if the page was not dropped */
-    if ( !(rsp->u.mem_paging.flags & MEM_PAGING_DROP_PAGE) )
-    {
-        gfn_t gfn = _gfn(rsp->u.mem_access.gfn);
-
-        gfn_lock(p2m, gfn, 0);
-        mfn = p2m->get_entry(p2m, gfn, &p2mt, &a, 0, NULL, NULL);
-        /*
-         * Allow only pages which were prepared properly, or pages which
-         * were nominated but not evicted.
-         */
-        if ( mfn_valid(mfn) && (p2mt == p2m_ram_paging_in) )
-        {
-            int rc = p2m_set_entry(p2m, gfn, mfn, PAGE_ORDER_4K,
-                                   paging_mode_log_dirty(d) ? p2m_ram_logdirty
-                                                            : p2m_ram_rw, a);
-
-            if ( !rc )
-                set_gpfn_from_mfn(mfn_x(mfn), gfn_x(gfn));
-        }
-        gfn_unlock(p2m, gfn, 0);
-    }
-}
-
-/*
- * nominate - Mark a guest page as to-be-paged-out
- * @d: guest domain
- * @gfn: guest page to nominate
- *
- * Returns 0 for success or negative errno values if gfn is not pageable.
- *
- * nominate() is called by the pager and checks if a guest page can be paged
- * out. If the following conditions are met the p2mt will be changed:
- * - the gfn is backed by a mfn
- * - the p2mt of the gfn is pageable
- * - the mfn is not used for IO
- * - the mfn has exactly one user and has no special meaning
- *
- * Once the p2mt is changed the page is readonly for the guest.  On success the
- * pager can write the page contents to disk and later evict the page.
- */
-static int nominate(struct domain *d, gfn_t gfn)
-{
-    struct page_info *page;
-    struct p2m_domain *p2m = p2m_get_hostp2m(d);
-    p2m_type_t p2mt;
-    p2m_access_t a;
-    mfn_t mfn;
-    int ret = -EBUSY;
-
-    gfn_lock(p2m, gfn, 0);
-
-    mfn = p2m->get_entry(p2m, gfn, &p2mt, &a, 0, NULL, NULL);
-
-    /* Check if mfn is valid */
-    if ( !mfn_valid(mfn) )
-        goto out;
-
-    /* Check p2m type */
-    if ( !p2m_is_pageable(p2mt) )
-        goto out;
-
-    /* Check for io memory page */
-    if ( is_iomem_page(mfn) )
-        goto out;
-
-    /* Check page count and type */
-    page = mfn_to_page(mfn);
-    if ( (page->count_info & (PGC_count_mask | PGC_allocated)) !=
-         (1 | PGC_allocated) )
-        goto out;
-
-    if ( (page->u.inuse.type_info & PGT_count_mask) != 0 )
-        goto out;
-
-    /* Fix p2m entry */
-    ret = p2m_set_entry(p2m, gfn, mfn, PAGE_ORDER_4K, p2m_ram_paging_out, a);
-
- out:
-    gfn_unlock(p2m, gfn, 0);
-    return ret;
-}
-
-/*
- * evict - Mark a guest page as paged-out
- * @d: guest domain
- * @gfn: guest page to evict
- *
- * Returns 0 for success or negative errno values if eviction is not possible.
- *
- * evict() is called by the pager and will free a guest page and release it
- * back to Xen. If the following conditions are met the page can be freed:
- * - the gfn is backed by a mfn
- * - the gfn was nominated
- * - the mfn has still exactly one user and has no special meaning
- *
- * After successful nomination some other process could have mapped the page. In
- * this case eviction can not be done. If the gfn was populated before the pager
- * could evict it, eviction can not be done either. In this case the gfn is
- * still backed by a mfn.
- */
-static int evict(struct domain *d, gfn_t gfn)
-{
-    struct page_info *page;
-    p2m_type_t p2mt;
-    p2m_access_t a;
-    mfn_t mfn;
-    struct p2m_domain *p2m = p2m_get_hostp2m(d);
-    int ret = -EBUSY;
-
-    gfn_lock(p2m, gfn, 0);
-
-    /* Get mfn */
-    mfn = p2m->get_entry(p2m, gfn, &p2mt, &a, 0, NULL, NULL);
-    if ( unlikely(!mfn_valid(mfn)) )
-        goto out;
-
-    /* Allow only nominated pages */
-    if ( p2mt != p2m_ram_paging_out )
-        goto out;
-
-    /* Get the page so it doesn't get modified under Xen's feet */
-    page = mfn_to_page(mfn);
-    if ( unlikely(!get_page(page, d)) )
-        goto out;
-
-    /* Check page count and type once more */
-    if ( (page->count_info & (PGC_count_mask | PGC_allocated)) !=
-         (2 | PGC_allocated) )
-        goto out_put;
-
-    if ( (page->u.inuse.type_info & PGT_count_mask) != 0 )
-        goto out_put;
-
-    /* Decrement guest domain's ref count of the page */
-    put_page_alloc_ref(page);
-
-    /* Remove mapping from p2m table */
-    ret = p2m_set_entry(p2m, gfn, INVALID_MFN, PAGE_ORDER_4K,
-                        p2m_ram_paged, a);
-
-    /* Track number of paged gfns */
-    atomic_inc(&d->paged_pages);
-
- out_put:
-    /* Put the page back so it gets freed */
-    put_page(page);
-
- out:
-    gfn_unlock(p2m, gfn, 0);
-    return ret;
-}
-
-/*
- * prepare - Allocate a new page for the guest
- * @d: guest domain
- * @gfn: guest page in paging state
- *
- * prepare() will allocate a new page for the guest if the gfn is not backed
- * by a mfn. It is called by the pager.
- * It is required that the gfn was already populated. The gfn may already have a
- * mfn if populate was called for  gfn which was nominated but not evicted. In
- * this case only the p2mt needs to be forwarded.
- */
-static int prepare(struct domain *d, gfn_t gfn,
-                   XEN_GUEST_HANDLE_64(const_uint8) buffer)
-{
-    struct page_info *page = NULL;
-    p2m_type_t p2mt;
-    p2m_access_t a;
-    mfn_t mfn;
-    struct p2m_domain *p2m = p2m_get_hostp2m(d);
-    int ret, page_extant = 1;
-
-    if ( !guest_handle_okay(buffer, PAGE_SIZE) )
-        return -EINVAL;
-
-    gfn_lock(p2m, gfn, 0);
-
-    mfn = p2m->get_entry(p2m, gfn, &p2mt, &a, 0, NULL, NULL);
-
-    ret = -ENOENT;
-    /* Allow missing pages */
-    if ( (p2mt != p2m_ram_paging_in) && (p2mt != p2m_ram_paged) )
-        goto out;
-
-    /* Allocate a page if the gfn does not have one yet */
-    if ( !mfn_valid(mfn) )
-    {
-        void *guest_map;
-
-        /* If the user did not provide a buffer, we disallow */
-        ret = -EINVAL;
-        if ( unlikely(guest_handle_is_null(buffer)) )
-            goto out;
-        /* Get a free page */
-        ret = -ENOMEM;
-        page_alloc_mm_pre_lock(d);
-        page = alloc_domheap_page(d, 0);
-        if ( unlikely(page == NULL) )
-            goto out;
-        if ( unlikely(!get_page(page, d)) )
-        {
-            /*
-             * The domain can't possibly know about this page yet, so failure
-             * here is a clear indication of something fishy going on.
-             */
-            gprintk(XENLOG_ERR,
-                    "%pd: fresh page for GFN %"PRI_gfn" in unexpected state\n",
-                    d, gfn_x(gfn));
-            domain_crash(d);
-            page = NULL;
-            goto out;
-        }
-        mfn = page_to_mfn(page);
-        page_extant = 0;
-
-        guest_map = map_domain_page(mfn);
-        ret = copy_from_guest(guest_map, buffer, PAGE_SIZE);
-        unmap_domain_page(guest_map);
-        if ( ret )
-        {
-            ret = -EFAULT;
-            goto out;
-        }
-    }
-
-    /*
-     * Make the page already guest-accessible. If the pager still has a
-     * pending resume operation, it will be idempotent p2m entry-wise, but
-     * will unpause the vcpu.
-     */
-    ret = p2m_set_entry(p2m, gfn, mfn, PAGE_ORDER_4K,
-                        paging_mode_log_dirty(d) ? p2m_ram_logdirty
-                                                 : p2m_ram_rw, a);
-    if ( !ret )
-    {
-        set_gpfn_from_mfn(mfn_x(mfn), gfn_x(gfn));
-
-        if ( !page_extant )
-            atomic_dec(&d->paged_pages);
-    }
-
- out:
-    gfn_unlock(p2m, gfn, 0);
-
-    if ( page )
-    {
-        /*
-         * Free the page on error.  Drop our temporary reference in all
-         * cases.
-         */
-        if ( ret )
-            put_page_alloc_ref(page);
-        put_page(page);
-    }
-
-    return ret;
-}
-
-int mem_paging_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_paging_op_t) arg)
-{
-    int rc;
-    xen_mem_paging_op_t mpo;
-    struct domain *d;
-    bool copyback = false;
-
-    if ( copy_from_guest(&mpo, arg, 1) )
-        return -EFAULT;
-
-    rc = rcu_lock_live_remote_domain_by_id(mpo.domain, &d);
-    if ( rc )
-        return rc;
-
-    rc = xsm_mem_paging(XSM_DM_PRIV, d);
-    if ( rc )
-        goto out;
-
-    rc = -ENODEV;
-    if ( unlikely(!vm_event_check_ring(d->vm_event_paging)) )
-        goto out;
-
-    switch( mpo.op )
-    {
-    case XENMEM_paging_op_nominate:
-        rc = nominate(d, _gfn(mpo.gfn));
-        break;
-
-    case XENMEM_paging_op_evict:
-        rc = evict(d, _gfn(mpo.gfn));
-        break;
-
-    case XENMEM_paging_op_prep:
-        rc = prepare(d, _gfn(mpo.gfn), mpo.buffer);
-        if ( !rc )
-            copyback = 1;
-        break;
-
-    default:
-        rc = -ENOSYS;
-        break;
-    }
-
-    if ( copyback && __copy_to_guest(arg, &mpo, 1) )
-        rc = -EFAULT;
-
-out:
-    rcu_unlock_domain(d);
-    return rc;
-}
-
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * indent-tabs-mode: nil
- * End:
- */
diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index 5c7a0ff30e8b..d66027eeeb0f 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -1198,36 +1198,6 @@ int add_to_physmap(struct domain *sd, unsigned long sgfn, shr_handle_t sh,
         mem_sharing_gfn_destroy(spage, cd, gfn_info);
         put_page_and_type(spage);
     }
-    else
-    {
-#ifdef CONFIG_MEM_PAGING
-        /*
-         * There is a chance we're plugging a hole where a paged out
-         * page was.
-         */
-        if ( p2m_is_paging(cmfn_type) && (cmfn_type != p2m_ram_paging_out) )
-        {
-            atomic_dec(&cd->paged_pages);
-            /*
-             * Further, there is a chance this was a valid page.
-             * Don't leak it.
-             */
-            if ( mfn_valid(cmfn) )
-            {
-                struct page_info *cpage = mfn_to_page(cmfn);
-
-                if ( !get_page(cpage, cd) )
-                {
-                    domain_crash(cd);
-                    ret = -EOVERFLOW;
-                    goto err_unlock;
-                }
-                put_page_alloc_ref(cpage);
-                put_page(cpage);
-            }
-        }
-#endif
-    }
 
     atomic_inc(&nr_saved_mfns);
 
diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index dfdbfa0afec8..ea4c5729bcf2 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -85,9 +85,6 @@ static void ept_p2m_type_to_flags(const struct p2m_domain *p2m,
         case p2m_invalid:
         case p2m_mmio_dm:
         case p2m_populate_on_demand:
-        case p2m_ram_paging_out:
-        case p2m_ram_paged:
-        case p2m_ram_paging_in:
         default:
             entry->r = entry->w = entry->x = 0;
             break;
diff --git a/xen/arch/x86/mm/p2m-pt.c b/xen/arch/x86/mm/p2m-pt.c
index 5a6ce2f8bc2e..515ee9780e34 100644
--- a/xen/arch/x86/mm/p2m-pt.c
+++ b/xen/arch/x86/mm/p2m-pt.c
@@ -64,9 +64,6 @@ static unsigned long p2m_type_to_flags(const struct p2m_domain *p2m,
     case p2m_invalid:
     case p2m_mmio_dm:
     case p2m_populate_on_demand:
-    case p2m_ram_paging_out:
-    case p2m_ram_paged:
-    case p2m_ram_paging_in:
     default:
         return flags | _PAGE_NX_BIT;
     case p2m_grant_map_ro:
@@ -910,7 +907,7 @@ p2m_pt_get_entry(struct p2m_domain *p2m, gfn_t gfn_,
 pod_retry_l1:
     flags = l1e_get_flags(*l1e);
     l1t = p2m_flags_to_type(flags);
-    if ( !(flags & _PAGE_PRESENT) && !p2m_is_paging(l1t) )
+    if ( !(flags & _PAGE_PRESENT) )
     {
         /* PoD: Try to populate */
         if ( p2m_is_pod(l1t) )
@@ -929,7 +926,7 @@ p2m_pt_get_entry(struct p2m_domain *p2m, gfn_t gfn_,
     *t = p2m_recalc_type(recalc || _needs_recalc(flags), l1t, p2m, gfn);
     unmap_domain_page(l1e);
 
-    ASSERT(mfn_valid(mfn) || !p2m_is_any_ram(*t) || p2m_is_paging(*t));
+    ASSERT(mfn_valid(mfn) || !p2m_is_any_ram(*t));
     return (p2m_is_valid(*t) || p2m_is_any_ram(*t)) ? mfn : INVALID_MFN;
 }
 
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index f5f9c0ac4513..c2804d39f9b1 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -405,7 +405,7 @@ struct page_info *p2m_get_page_from_gfn(
             return page;
 
         /* Error path: not a suitable GFN at all */
-        if ( !p2m_is_ram(*t) && !p2m_is_paging(*t) && !p2m_is_pod(*t) &&
+        if ( !p2m_is_ram(*t) && !p2m_is_pod(*t) &&
              !mem_sharing_is_fork(p2m->domain) )
             return NULL;
     }
@@ -697,7 +697,7 @@ p2m_add_page(struct domain *d, gfn_t gfn, mfn_t mfn,
 
             return -EPERM;
         }
-        else if ( p2m_is_ram(ot) && !p2m_is_paged(ot) )
+        else if ( p2m_is_ram(ot) )
         {
             ASSERT(mfn_valid(omfn));
             set_gpfn_from_mfn(mfn_x(omfn), INVALID_M2P_ENTRY);
@@ -707,13 +707,6 @@ p2m_add_page(struct domain *d, gfn_t gfn, mfn_t mfn,
             /* Count how man PoD entries we'll be replacing if successful */
             pod_count++;
         }
-#ifdef CONFIG_MEM_PAGING
-        else if ( p2m_is_paging(ot) && (ot != p2m_ram_paging_out) )
-        {
-            /* We're plugging a hole in the physmap where a paged out page was */
-            atomic_dec(&d->paged_pages);
-        }
-#endif
     }
 
     /* Then, look for m->p mappings for this range and deal with them */
@@ -742,7 +735,7 @@ p2m_add_page(struct domain *d, gfn_t gfn, mfn_t mfn,
                       mfn_x(mfn_add(mfn, i)), gfn_x(ogfn),
                       gfn_x(gfn_add(gfn, i)));
             omfn = p2m->get_entry(p2m, ogfn, &ot, &a, 0, NULL, NULL);
-            if ( p2m_is_ram(ot) && !p2m_is_paged(ot) )
+            if ( p2m_is_ram(ot) )
             {
                 ASSERT(mfn_valid(omfn));
                 P2M_DEBUG("old gfn=%#lx -> mfn %#lx\n",
@@ -789,7 +782,7 @@ p2m_add_page(struct domain *d, gfn_t gfn, mfn_t mfn,
                 set_gpfn_from_mfn(mfn_x(omfn), gfn_x(gfn) + i);
                 paging_mark_pfn_dirty(d, _pfn(gfn_x(gfn) + i));
             }
-            else if ( p2m_is_ram(ot) && !p2m_is_paged(ot) )
+            else if ( p2m_is_ram(ot) )
             {
                 ASSERT(mfn_valid(omfn));
                 set_gpfn_from_mfn(mfn_x(omfn), gfn_x(gfn) + i);
diff --git a/xen/arch/x86/mm/shadow/hvm.c b/xen/arch/x86/mm/shadow/hvm.c
index cf4862cbc9c2..9c46abffb7ba 100644
--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -126,7 +126,6 @@ hvm_read(enum x86_segment seg,
     case HVMTRANS_bad_gfn_to_mfn:
     case HVMTRANS_unhandleable:
         return X86EMUL_UNHANDLEABLE;
-    case HVMTRANS_gfn_paged_out:
     case HVMTRANS_gfn_shared:
     case HVMTRANS_need_retry:
         return X86EMUL_RETRY;
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index d10891dcfc86..7b62269f7839 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -89,12 +89,6 @@ static int guest_wrmsr_xen(struct vcpu *v, uint32_t idx, uint64_t val)
             if ( page )
                 put_page(page);
 
-            if ( p2m_is_paging(t) )
-            {
-                p2m_mem_paging_populate(d, _gfn(gmfn));
-                return X86EMUL_RETRY;
-            }
-
             gdprintk(XENLOG_WARNING,
                      "Bad GMFN %lx (MFN %#"PRI_mfn") to MSR %08x\n",
                      gmfn, mfn_x(page ? page_to_mfn(page) : INVALID_MFN), base);
diff --git a/xen/arch/x86/x86_64/compat/mm.c b/xen/arch/x86/x86_64/compat/mm.c
index d54efaad21cd..fda4760989c7 100644
--- a/xen/arch/x86/x86_64/compat/mm.c
+++ b/xen/arch/x86/x86_64/compat/mm.c
@@ -4,7 +4,6 @@
 #include <xen/multicall.h>
 #include <compat/memory.h>
 #include <compat/xen.h>
-#include <asm/mem_paging.h>
 #include <asm/mem_sharing.h>
 
 #include <asm/pv/mm.h>
@@ -156,11 +155,6 @@ int compat_arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     case XENMEM_get_sharing_shared_pages:
         return mem_sharing_get_nr_shared_mfns();
 
-#ifdef CONFIG_MEM_PAGING
-    case XENMEM_paging_op:
-        return mem_paging_memop(guest_handle_cast(arg, xen_mem_paging_op_t));
-#endif
-
 #ifdef CONFIG_MEM_SHARING
     case XENMEM_sharing_op:
         return mem_sharing_memop(guest_handle_cast(arg, xen_mem_sharing_op_t));
diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index 8eadab7933d0..282f35dcbd48 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -35,7 +35,6 @@ EMIT_FILE;
 #include <asm/pv/domain.h>
 #include <asm/setup.h>
 #include <asm/numa.h>
-#include <asm/mem_paging.h>
 #include <asm/mem_sharing.h>
 #include <asm/trampoline.h>
 
@@ -1023,11 +1022,6 @@ long subarch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     case XENMEM_get_sharing_shared_pages:
         return mem_sharing_get_nr_shared_mfns();
 
-#ifdef CONFIG_MEM_PAGING
-    case XENMEM_paging_op:
-        return mem_paging_memop(guest_handle_cast(arg, xen_mem_paging_op_t));
-#endif
-
 #ifdef CONFIG_MEM_SHARING
     case XENMEM_sharing_op:
         return mem_sharing_memop(guest_handle_cast(arg, xen_mem_sharing_op_t));
diff --git a/xen/common/domain.c b/xen/common/domain.c
index bb9e210c2895..3c62672445ea 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1511,9 +1511,6 @@ static void cf_check complete_domain_destroy(struct rcu_head *head)
 
     sched_destroy_domain(d);
 
-#ifdef CONFIG_MEM_PAGING
-    xfree(d->vm_event_paging);
-#endif
     xfree(d->vm_event_monitor);
 #ifdef CONFIG_MEM_SHARING
     xfree(d->vm_event_share);
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 93738931c575..3296d981f462 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -100,9 +100,6 @@ void getdomaininfo(struct domain *d, struct xen_domctl_getdomaininfo *info)
     info->outstanding_pages = d->outstanding_pages;
 #ifdef CONFIG_MEM_SHARING
     info->shr_pages         = atomic_read(&d->shr_pages);
-#endif
-#ifdef CONFIG_MEM_PAGING
-    info->paged_pages       = atomic_read(&d->paged_pages);
 #endif
     info->shared_info_frame =
         gfn_x(mfn_to_gfn(d, _mfn(virt_to_mfn(d->shared_info))));
diff --git a/xen/common/keyhandler.c b/xen/common/keyhandler.c
index cb6df2823b00..7f2e72f0dda3 100644
--- a/xen/common/keyhandler.c
+++ b/xen/common/keyhandler.c
@@ -281,17 +281,11 @@ static void cf_check dump_domains(unsigned char key)
         printk("    nr_pages=%u xenheap_pages=%u"
 #ifdef CONFIG_MEM_SHARING
                " shared_pages=%u"
-#endif
-#ifdef CONFIG_MEM_PAGING
-               " paged_pages=%u"
 #endif
                " dirty_cpus={%*pbl} max_pages=%u\n",
                domain_tot_pages(d), d->xenheap_pages,
 #ifdef CONFIG_MEM_SHARING
                atomic_read(&d->shr_pages),
-#endif
-#ifdef CONFIG_MEM_PAGING
-               atomic_read(&d->paged_pages),
 #endif
                CPUMASK_PR(d->dirty_cpumask), d->max_pages);
         printk("    handle=%02x%02x%02x%02x-%02x%02x-%02x%02x-"
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 1ad4b51c5b02..b7dade262602 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -447,28 +447,6 @@ int guest_remove_page(struct domain *d, unsigned long gmfn)
         return -ENOENT;
     }
 
-    if ( unlikely(p2m_is_paging(p2mt)) )
-    {
-        /*
-         * If the page hasn't yet been paged out, there is an
-         * actual page that needs to be released.
-         */
-        if ( p2mt == p2m_ram_paging_out )
-        {
-            ASSERT(mfn_valid(mfn));
-            goto obtain_page;
-        }
-
-        rc = guest_physmap_remove_page(d, _gfn(gmfn), mfn, 0);
-        if ( rc )
-            goto out_put_gfn;
-
-        put_gfn(d, gmfn);
-
-        p2m_mem_paging_drop_page(d, _gfn(gmfn), p2mt);
-
-        return 0;
-    }
     if ( p2mt == p2m_mmio_direct )
     {
         rc = -EPERM;
@@ -514,10 +492,9 @@ int guest_remove_page(struct domain *d, unsigned long gmfn)
     {
 #ifdef CONFIG_X86
         put_gfn(d, gmfn);
-        if ( !p2m_is_paging(p2mt) )
 #endif
-            gdprintk(XENLOG_INFO, "Bad page free for Dom%u GFN %lx\n",
-                     d->domain_id, gmfn);
+        gdprintk(XENLOG_INFO, "Bad page free for Dom%u GFN %lx\n",
+                 d->domain_id, gmfn);
 
         return -ENXIO;
     }
@@ -2037,16 +2014,6 @@ int check_get_page_from_gfn(struct domain *d, gfn_t gfn, bool readonly,
 
     page = get_page_from_gfn(d, gfn_x(gfn), &p2mt, q);
 
-#ifdef CONFIG_MEM_PAGING
-    if ( p2m_is_paging(p2mt) )
-    {
-        if ( page )
-            put_page(page);
-
-        p2m_mem_paging_populate(d, gfn);
-        return -EAGAIN;
-    }
-#endif
 #ifdef CONFIG_MEM_SHARING
     if ( (q & P2M_UNSHARE) && p2m_is_shared(p2mt) )
     {
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 2c4ff2c34c70..d74fc2aa9a30 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2791,8 +2791,7 @@ void free_domheap_pages(struct page_info *pg, unsigned int order)
              * responsibility for erasure. We do scrub regardless if option
              * scrub_domheap is set.
              */
-            scrub = d->is_dying || mem_paging_enabled(d) ||
-                    scrub_debug || opt_scrub_domheap;
+            scrub = d->is_dying || scrub_debug || opt_scrub_domheap;
         }
         else
         {
diff --git a/xen/common/vm_event.c b/xen/common/vm_event.c
index cf0258223f50..e92a4fc1c409 100644
--- a/xen/common/vm_event.c
+++ b/xen/common/vm_event.c
@@ -395,10 +395,6 @@ static int vm_event_resume(struct domain *d, struct vm_event_domain *ved)
         /* Check flags which apply only when the vCPU is paused */
         if ( atomic_read(&v->vm_event_pause_count) )
         {
-#ifdef CONFIG_MEM_PAGING
-            if ( rsp.reason == VM_EVENT_REASON_MEM_PAGING )
-                p2m_mem_paging_resume(d, &rsp);
-#endif
 #ifdef CONFIG_MEM_SHARING
             if ( mem_sharing_is_fork(d) )
             {
@@ -539,14 +535,6 @@ int __vm_event_claim_slot(struct domain *d, struct vm_event_domain *ved,
         return vm_event_grab_slot(ved, current->domain != d);
 }
 
-#ifdef CONFIG_MEM_PAGING
-/* Registered with Xen-bound event channel for incoming notifications. */
-static void cf_check mem_paging_notification(struct vcpu *v, unsigned int port)
-{
-    vm_event_resume(v->domain, v->domain->vm_event_paging);
-}
-#endif
-
 /* Registered with Xen-bound event channel for incoming notifications. */
 static void cf_check monitor_notification(struct vcpu *v, unsigned int port)
 {
@@ -564,20 +552,6 @@ static void cf_check mem_sharing_notification(struct vcpu *v, unsigned int port)
 /* Clean up on domain destruction */
 void vm_event_cleanup(struct domain *d)
 {
-#ifdef CONFIG_MEM_PAGING
-    if ( vm_event_check_ring(d->vm_event_paging) )
-    {
-        /* Destroying the wait queue head means waking up all
-         * queued vcpus. This will drain the list, allowing
-         * the disable routine to complete. It will also drop
-         * all domain refs the wait-queued vcpus are holding.
-         * Finally, because this code path involves previously
-         * pausing the domain (domain_kill), unpausing the
-         * vcpus causes no harm. */
-        destroy_waitqueue_head(&d->vm_event_paging->wq);
-        (void)vm_event_disable(d, &d->vm_event_paging);
-    }
-#endif
     if ( vm_event_check_ring(d->vm_event_monitor) )
     {
         destroy_waitqueue_head(&d->vm_event_monitor->wq);
@@ -635,63 +609,6 @@ int vm_event_domctl(struct domain *d, struct xen_domctl_vm_event_op *vec)
 
     switch ( vec->mode )
     {
-#ifdef CONFIG_MEM_PAGING
-    case XEN_DOMCTL_VM_EVENT_OP_PAGING:
-    {
-        rc = -EINVAL;
-
-        switch( vec->op )
-        {
-        case XEN_VM_EVENT_ENABLE:
-        {
-            rc = -EOPNOTSUPP;
-            /* hvm fixme: p2m_is_foreign types need addressing */
-            if ( is_hvm_domain(hardware_domain) )
-                break;
-
-            rc = -ENODEV;
-            /* Only HAP is supported */
-            if ( !hap_enabled(d) )
-                break;
-
-            /* No paging if iommu is used */
-            rc = -EMLINK;
-            if ( unlikely(is_iommu_enabled(d)) )
-                break;
-
-            rc = -EXDEV;
-            /* Disallow paging in a PoD guest */
-            if ( p2m_pod_active(d) )
-                break;
-
-            /* domain_pause() not required here, see XSA-99 */
-            rc = vm_event_enable(d, vec, &d->vm_event_paging, _VPF_mem_paging,
-                                 HVM_PARAM_PAGING_RING_PFN,
-                                 mem_paging_notification);
-        }
-        break;
-
-        case XEN_VM_EVENT_DISABLE:
-            if ( vm_event_check_ring(d->vm_event_paging) )
-            {
-                domain_pause(d);
-                rc = vm_event_disable(d, &d->vm_event_paging);
-                domain_unpause(d);
-            }
-            break;
-
-        case XEN_VM_EVENT_RESUME:
-            rc = vm_event_resume(d, d->vm_event_paging);
-            break;
-
-        default:
-            rc = -ENOSYS;
-            break;
-        }
-    }
-    break;
-#endif
-
     case XEN_DOMCTL_VM_EVENT_OP_MONITOR:
     {
         rc = -EINVAL;
diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index 951f1f30b7ad..d9b1f5768393 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -26,7 +26,6 @@
 
 #include <asm/hvm/io.h>
 #include <asm/io_apic.h>
-#include <asm/mem_paging.h>
 #include <asm/pt-contig-markers.h>
 #include <asm/setup.h>
 
@@ -777,7 +776,6 @@ bool arch_iommu_use_permitted(const struct domain *d)
      */
     return d == dom_io ||
            (likely(!mem_sharing_enabled(d)) &&
-            likely(!mem_paging_enabled(d)) &&
             likely(!p2m_pod_active(d)) &&
             likely(!p2m_is_global_logdirty(d)));
 }
diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
index bd9fc37b5297..65ff524016d7 100644
--- a/xen/include/public/memory.h
+++ b/xen/include/public/memory.h
@@ -377,7 +377,7 @@ typedef struct xen_pod_target xen_pod_target_t;
 #define XENMEM_get_sharing_freed_pages    18
 #define XENMEM_get_sharing_shared_pages   19
 
-#define XENMEM_paging_op                    20
+#define XENMEM_paging_op                    20 /* Removed in Xen 4.22 */
 #define XENMEM_paging_op_nominate           0
 #define XENMEM_paging_op_evict              1
 #define XENMEM_paging_op_prep               2
diff --git a/xen/include/public/vm_event.h b/xen/include/public/vm_event.h
index 3a86f0e208f1..51581f96a76f 100644
--- a/xen/include/public/vm_event.h
+++ b/xen/include/public/vm_event.h
@@ -130,7 +130,7 @@
 /* Memory sharing event */
 #define VM_EVENT_REASON_MEM_SHARING             2
 /* Memory paging event */
-#define VM_EVENT_REASON_MEM_PAGING              3
+#define VM_EVENT_REASON_MEM_PAGING              3 /* Removed in 4.22 */
 /* A control register was updated */
 #define VM_EVENT_REASON_WRITE_CTRLREG           4
 /* An MSR was updated. */
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 00db1da12f21..ef60d4438b0c 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -426,10 +426,6 @@ struct domain
     atomic_t         shr_pages;         /* shared pages */
 #endif
 
-#ifdef CONFIG_MEM_PAGING
-    atomic_t         paged_pages;       /* paged-out pages */
-#endif
-
     /* Scheduling. */
     void            *sched_priv;    /* scheduler-specific data */
     struct sched_unit *sched_unit_list;
@@ -600,10 +596,6 @@ struct domain
 #ifdef CONFIG_MEM_SHARING
     struct vm_event_domain *vm_event_share;
     struct domain *parent; /* VM fork parent */
-#endif
-    /* Memory paging support */
-#ifdef CONFIG_MEM_PAGING
-    struct vm_event_domain *vm_event_paging;
 #endif
     /* VM event monitor support */
     struct vm_event_domain *vm_event_monitor;
@@ -1011,9 +1003,7 @@ static inline struct domain *next_domain_in_cpupool(
  /* VCPU affinity has changed: migrating to a new CPU. */
 #define _VPF_migrating       3
 #define VPF_migrating        (1UL<<_VPF_migrating)
- /* VCPU is blocked due to missing mem_paging ring. */
-#define _VPF_mem_paging      4
-#define VPF_mem_paging       (1UL<<_VPF_mem_paging)
+/* Bit 4 unused */
  /* VCPU is blocked due to missing mem_access ring. */
 #define _VPF_mem_access      5
 #define VPF_mem_access       (1UL<<_VPF_mem_access)
@@ -1248,12 +1238,6 @@ static always_inline bool is_iommu_enabled(const struct domain *d)
     return evaluate_nospec(d->options & XEN_DOMCTL_CDF_iommu);
 }
 
-#ifdef CONFIG_MEM_PAGING
-# define mem_paging_enabled(d) vm_event_check_ring((d)->vm_event_paging)
-#else
-# define mem_paging_enabled(d) false
-#endif
-
 extern bool sched_smt_power_savings;
 extern bool sched_disable_smt_switching;
 
diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index b8fd7aeedd9e..68c6e81b70a8 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -648,14 +648,6 @@ static XSM_INLINE int cf_check xsm_mem_access(XSM_DEFAULT_ARG struct domain *d)
 }
 #endif
 
-#ifdef CONFIG_MEM_PAGING
-static XSM_INLINE int cf_check xsm_mem_paging(XSM_DEFAULT_ARG struct domain *d)
-{
-    XSM_ASSERT_ACTION(XSM_DM_PRIV);
-    return xsm_default_action(action, current->domain, d);
-}
-#endif
-
 #ifdef CONFIG_MEM_SHARING
 static XSM_INLINE int cf_check xsm_mem_sharing(XSM_DEFAULT_ARG struct domain *d)
 {
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index cc32a6c09104..e9cfa0ada5fb 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -159,10 +159,6 @@ struct xsm_ops {
     int (*mem_access)(struct domain *d);
 #endif
 
-#ifdef CONFIG_MEM_PAGING
-    int (*mem_paging)(struct domain *d);
-#endif
-
 #ifdef CONFIG_MEM_SHARING
     int (*mem_sharing)(struct domain *d);
 #endif
@@ -655,13 +651,6 @@ static inline int xsm_mem_access(xsm_default_t def, struct domain *d)
 }
 #endif
 
-#ifdef CONFIG_MEM_PAGING
-static inline int xsm_mem_paging(xsm_default_t def, struct domain *d)
-{
-    return alternative_call(xsm_ops.mem_paging, d);
-}
-#endif
-
 #ifdef CONFIG_MEM_SHARING
 static inline int xsm_mem_sharing(xsm_default_t def, struct domain *d)
 {
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index 244ef557528b..e35b6ae3dc33 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -119,10 +119,6 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
     .mem_access                    = xsm_mem_access,
 #endif
 
-#ifdef CONFIG_MEM_PAGING
-    .mem_paging                    = xsm_mem_paging,
-#endif
-
 #ifdef CONFIG_MEM_SHARING
     .mem_sharing                   = xsm_mem_sharing,
 #endif
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 28522dcbd271..b0026f91c045 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1340,13 +1340,6 @@ static int cf_check flask_mem_access(struct domain *d)
 }
 #endif
 
-#ifdef CONFIG_MEM_PAGING
-static int cf_check flask_mem_paging(struct domain *d)
-{
-    return current_has_perm(d, SECCLASS_DOMAIN2, DOMAIN2__MEM_PAGING);
-}
-#endif
-
 #ifdef CONFIG_MEM_SHARING
 static int cf_check flask_mem_sharing(struct domain *d)
 {
@@ -1934,10 +1927,6 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
     .mem_access = flask_mem_access,
 #endif
 
-#ifdef CONFIG_MEM_PAGING
-    .mem_paging = flask_mem_paging,
-#endif
-
 #ifdef CONFIG_MEM_SHARING
     .mem_sharing = flask_mem_sharing,
 #endif
diff --git a/xen/xsm/flask/policy/access_vectors b/xen/xsm/flask/policy/access_vectors
index bbb9c117ec4a..9d51a1d4f74b 100644
--- a/xen/xsm/flask/policy/access_vectors
+++ b/xen/xsm/flask/policy/access_vectors
@@ -235,8 +235,6 @@ class domain2
     soft_reset
 # XENMEM_access_op
     mem_access
-# XENMEM_paging_op
-    mem_paging
 # XENMEM_sharing_op
     mem_sharing
 # XEN_DOMCTL_psr_alloc

base-commit: 2611377cf9c92b43b04a33810f03fa07bf8ba954
-- 
2.39.5


