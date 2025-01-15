Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D478EA12A70
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 19:06:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872997.1283989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY7mY-0008Ph-P4; Wed, 15 Jan 2025 18:06:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872997.1283989; Wed, 15 Jan 2025 18:06:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY7mY-0008OE-M3; Wed, 15 Jan 2025 18:06:22 +0000
Received: by outflank-mailman (input) for mailman id 872997;
 Wed, 15 Jan 2025 18:06:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4o+i=UH=cloud.com=bernhard.kaindl@srs-se1.protection.inumbo.net>)
 id 1tY7mX-0008O8-HV
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 18:06:21 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6bbd00ee-d36b-11ef-99a4-01e77a169b0f;
 Wed, 15 Jan 2025 19:06:19 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-ab2bb0822a4so11345666b.3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2025 10:06:19 -0800 (PST)
Received: from localhost ([185.68.248.203]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c906005csm789043866b.3.2025.01.15.10.06.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 10:06:18 -0800 (PST)
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
X-Inumbo-ID: 6bbd00ee-d36b-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1736964379; x=1737569179; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pDIlhf6xp1rAQ7F54paIPqTjBOmTMHyr5SYWOsuAcFE=;
        b=WwERcvM6pPnaFsLZD/+IrpDV7nNAxX0apndyfY74UE1b9Oupt/AwTa1bG0NpTCpxPA
         VCpsw2zZMBY3i23Eu8042l4HhilPOKZbeNtB/PhBrZ3uuCVTVEa2EdxjlrQ7dP7sGeGs
         UOjR4EILYo3r9X88lRF7umMP73UZDAL24hQMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736964379; x=1737569179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pDIlhf6xp1rAQ7F54paIPqTjBOmTMHyr5SYWOsuAcFE=;
        b=JDcTdd2GdCm/YM9l2CR6TfD5R1t7TGrFu6sYxGA+U/NCycCGn63PnQ9rN12cxfENet
         +MJTOiXFw1cdMXrEjmLJyDaBFsgTymkCig9LbNBGDZBc1AbQkdXFiNasDksva3VQuatu
         v5DO0AdIhniSSyvmXDIgs5d3ee4Dogv3EhVxhK46ra8Kbi6aaS4esfobClhbnoHZs3OI
         zDioxoxMmocnaLayPMcN/440GZUeQlGLmDJl9xRvN7tSF0g3BaoZEGE5jsyIWOCvjC3M
         LyR5w1Q5osOPuMsIVkMU+AiKjwcZTQrPyKdc1YMIgV2JMDOHXQISSluKN0aPpT98I4dK
         36MA==
X-Gm-Message-State: AOJu0Yw8BUuyMpzy3Sjq5FWL8oWETolgylhQv3edDdfF9PSsua7UFayW
	W2kXjbvOVHC9UE3rj8A0LWMBjYcsq9BJmThkYDLZbjESyzSw+tB0/I9HyCAGEUEbYqyVP/vW4aj
	4hcVANw==
X-Gm-Gg: ASbGncsV5kikm1mC3vD/zMGeiV3KGggu+oGlVmI/jrtyu7Mt+X9FgCpy26KSqHg4rb7
	MNmHrST7JiNBV2wH7/YKTNLwo5+OOQLjFrqFa+o29RTKgDbsyjxz4t5iiNMlxRC5Ihm0odPlPab
	2HrXR76WUBht/9hY2LibSSGDnTwNd+U9UFG0Z6CyvCTL5ZeaNQxyvfvegZ0BlsPLlO2DvByQS1/
	+JGUKN6godJQSM1ZeQGqRQRAv/5jwheTk5wmGYHVEnUT5RejPx6hadHyKX01g==
X-Google-Smtp-Source: AGHT+IEnDXDhsV5ZqXjtE6AmfjQfat6Utds7NZnekDEWjvyHh36k6fHnb1XveKvUXH0gi0S9m+LksA==
X-Received: by 2002:a17:907:6d20:b0:aa6:800a:1291 with SMTP id a640c23a62f3a-ab2ab167fb7mr2716565766b.7.1736964378724;
        Wed, 15 Jan 2025 10:06:18 -0800 (PST)
From: Bernhard Kaindl <bernhard.kaindl@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Bernhard Kaindl <bernhard.kaindl@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] docs: Punctuation: Add missing commas after linking adverbs as intros
Date: Wed, 15 Jan 2025 19:06:15 +0100
Message-ID: <ad9d1d7db8d43c82a02f64b8a317d7ae6522dd62.1736964253.git.bernhard.kaindl@cloud.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix missing commas after linking adverbs such as currently, fortunately,
hence, instead, and thus, when used as linking adverbs at the beginning
of sentences. I saw them with LTeX; other checkers have this rule too.

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@cloud.com>
---
 SUPPORT.md                                |  2 +-
 docs/designs/non-cooperative-migration.md | 10 +++++-----
 docs/designs/qemu-deprivilege.md          |  4 ++--
 docs/designs/xenstore-migration.md        |  4 ++--
 docs/man/xl.cfg.5.pod.in                  |  2 +-
 docs/misc/cache-coloring.rst              |  2 +-
 6 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/SUPPORT.md b/SUPPORT.md
index 9478b70b1b..019b49157e 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -453,7 +453,7 @@ A periodically repeating fixed timeslice scheduler.
 
     Status: Supported
 
-Currently only single-vcpu domains are supported.
+Currently, only single-vcpu domains are supported.
 
 ### Null Scheduler
 
diff --git a/docs/designs/non-cooperative-migration.md b/docs/designs/non-cooperative-migration.md
index 54496892ed..28c9301748 100644
--- a/docs/designs/non-cooperative-migration.md
+++ b/docs/designs/non-cooperative-migration.md
@@ -124,7 +124,7 @@ nodes.
 Because the console and store protocol shared pages are actually part of
 the guest memory image (in an E820 reserved region just below 4G in x86
 VMs) then the content will get migrated as part of the guest memory image.
-Hence no additional code is require to prevent any guest visible change in
+Hence, no additional code is required to prevent any guest visible change in
 the content.
 
 ### Shared Info
@@ -189,7 +189,7 @@ this fashion frontend and backend drivers can use the event channel as a
 *mailbox* to notify each other when a shared ring has been updated with new
 requests or response structures.
 
-Currently no event channel state is preserved on migration, requiring
+Currently, no event channel state is preserved on migration, requiring
 frontend and backend drivers to create and bind a complete new set of event
 channels in order to re-establish a protocol connection. Hence, one or more
 new save records will be required to transfer event channel state in order
@@ -222,12 +222,12 @@ The guest is responsible for managing its own grant table. No hypercall is
 required to grant a memory page to another domain. It is sufficient to find
 an unused grant entry and set bits in the entry to give read and/or write
 access to a remote domain also specified in the entry along with the page
-frame number. Thus the layout and content of the grant table logically
+frame number. Thus, the layout and content of the grant table logically
 forms part of the guest state.
 
-Currently no grant table state is migrated, requiring a guest to separately
+Currently, no grant table state is migrated, requiring a guest to separately
 maintain any state that it wishes to persist elsewhere in its memory image
-and then restore it after migration. Thus to avoid the need for such
+and then restore it after migration. Thus, to avoid the need for such
 explicit action by the guest, one or more new save records will be required
 to migrate the contents of the grant table.
 
diff --git a/docs/designs/qemu-deprivilege.md b/docs/designs/qemu-deprivilege.md
index 3be33adf6a..97ad35ec0e 100644
--- a/docs/designs/qemu-deprivilege.md
+++ b/docs/designs/qemu-deprivilege.md
@@ -179,7 +179,7 @@ being killed by the target process:
             kill(-1, 9);
     }
 
-Fortunately there is an assymetry we can take advantage of.  From the
+Fortunately, there is an asymmetry we can take advantage of.  From the
 POSIX spec:
 
 > For a process to have permission to send a signal to a process
@@ -269,7 +269,7 @@ environments.  We therefore need to either:
 The chroot (and seccomp?) happens late enough such that QEMU can
 initialize itself and open its disks. If you want to add a disk at run
 time via or insert a CD, you can't pass a path because QEMU is
-chrooted. Instead use the add-fd QMP command and use
+chrooted. Instead, use the add-fd QMP command and use
 /dev/fdset/<fdset-id> as the path.
 
 A further layer of restriction could be to set RLIMIT_NOFILES to '0',
diff --git a/docs/designs/xenstore-migration.md b/docs/designs/xenstore-migration.md
index 082314bf72..824aed9557 100644
--- a/docs/designs/xenstore-migration.md
+++ b/docs/designs/xenstore-migration.md
@@ -140,7 +140,7 @@ xenstored state that needs to be restored.
 | `evtchn-fd`    | The file descriptor used to communicate with |
 |                | the event channel driver                     |
 
-xenstored will resume in the original process context. Hence `rw-socket-fd`
+xenstored will resume in the original process context. Hence, `rw-socket-fd`
 simply specifies the file descriptor of the socket. Sockets are not always
 used, however, and so -1 will be used to denote an unused socket.
 
@@ -245,7 +245,7 @@ For `socket` connections it is as follows:
 | `socket-fd` | The file descriptor of the connected socket     |
 
 This type of connection is only relevant for live update, where the xenstored
-resumes in the original process context. Hence `socket-fd` simply specify
+resumes in the original process context. Hence, `socket-fd` simply specify
 the file descriptor of the socket connection.
 
 \pagebreak
diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 8e1422104e..e3cb930cef 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -506,7 +506,7 @@ Load the specified file as firmware for the guest.
 
 =head4 PVH guest options
 
-Currently there's no firmware available for PVH guests, they should be
+Currently, there's no firmware available for PVH guests, they should be
 booted using the B<Direct Kernel Boot> method or the B<bootloader> option.
 
 =over 4
diff --git a/docs/misc/cache-coloring.rst b/docs/misc/cache-coloring.rst
index e156062aa2..022ed1f3da 100644
--- a/docs/misc/cache-coloring.rst
+++ b/docs/misc/cache-coloring.rst
@@ -4,7 +4,7 @@ Xen cache coloring user guide
 =============================
 
 The cache coloring support in Xen allows to reserve Last Level Cache (LLC)
-partitions for Dom0, DomUs and Xen itself. Currently only ARM64 is supported.
+partitions for Dom0, DomUs and Xen itself. Currently, only ARM64 is supported.
 Cache coloring realizes per-set cache partitioning in software and is applicable
 to shared LLCs as implemented in Cortex-A53, Cortex-A72 and similar CPUs.
 
-- 
2.43.0


