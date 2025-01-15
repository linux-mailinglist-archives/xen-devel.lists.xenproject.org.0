Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7CBA1251F
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 14:45:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872554.1283525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY3hg-0000tR-SA; Wed, 15 Jan 2025 13:45:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872554.1283525; Wed, 15 Jan 2025 13:45:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY3hg-0000rR-OP; Wed, 15 Jan 2025 13:45:04 +0000
Received: by outflank-mailman (input) for mailman id 872554;
 Wed, 15 Jan 2025 13:45:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4o+i=UH=cloud.com=bernhard.kaindl@srs-se1.protection.inumbo.net>)
 id 1tY3he-0000rL-V5
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 13:45:03 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea87a20e-d346-11ef-99a4-01e77a169b0f;
 Wed, 15 Jan 2025 14:45:00 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43618283dedso64761265e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2025 05:45:00 -0800 (PST)
Received: from localhost ([185.68.248.203]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e4b80c9sm17489552f8f.84.2025.01.15.05.44.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 05:44:59 -0800 (PST)
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
X-Inumbo-ID: ea87a20e-d346-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1736948700; x=1737553500; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yOnHHZIX8J37zXnZstGifH2YDQRYPB0JvqGcQB48250=;
        b=jfSh1U1yYWjX29Gk0+ZlFK8pLbUovSByYUNpxe4oovWPlV0f7/ELDKqnVX027FmVtD
         +SQ0/Il6SPr3fvkW4Hrg6tGwSnjShU8ZmoideLbrWtmkkun8hA0fZKC7LJFVAXaJB/vI
         /d9RKQqHVlh6925LpPRpd2Gp4ec+wMDSRO/+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736948700; x=1737553500;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yOnHHZIX8J37zXnZstGifH2YDQRYPB0JvqGcQB48250=;
        b=hKpp6ExOL3ub80nX8Rwyf9wL0Th+07DAfrsgZBNQidgWz/WY2vM9IpN0jH4onq/3V/
         2hYEHmZUreYZa+5QZEaMXKsJsbsj05CfCyHZy/39zTfN1wMi6WRq1x6y6QDL9ZckNrdp
         qeDxlscafuonmkgtIORuhdQBYAGYE3fKIUX0oopAnAMLOchUiLc16eB1R/jmyUIxE5Z/
         jBd1OIc8p2WG065iNEzhuHIZDlPme6US3t9hrURTySwPtfBzVmO1fnxqyVqzfQhlo70W
         p4Rycv7fCzsNBmzO77wa7f761iwGYHSxniHH+3reRMjzv31w3Yz4ouNb/I6/Q9gO0y41
         GtGQ==
X-Gm-Message-State: AOJu0YxCvHiS1gooV5wyOkuMczizynEvGj16U5d5fG33ZqL/Cqe2Wn5G
	lK38xj8v+llFsDnsb6XljZ5SZEl5Cj4KYbAPz2oARsZbryU38ieO3j+QotcMsPPrAcLJ2g5zYqZ
	AcGXpSg==
X-Gm-Gg: ASbGncubTE+dxNbdvr+uXLhkHOMpyj+4fkSgYcAnBZkudXuXiI+5mmxb2JxIDWAtMix
	5r/nxpFogtRTAH1rbJEeskHLP6Wo2MxFMFIkREktXJE0gWweqC0VSgiBBMtpqi2xmE54QQOX9pL
	aQSxjxhE+jaxaOJSn8fJcchoW9sZ2KU+S317R3KyutbwSrtC1AHBquvTSLZeAO95XxP/0QKLFMI
	WNHNSEifA0m3eVHtTpnM8VelK/+3CfzZAwzUP3sT9uRL/akHvc9uEP7oF1e6g==
X-Google-Smtp-Source: AGHT+IFpyYKuiVL5NbAKLI2ifsePSYAUGvl21jANUA+UTH3GPyBbIF7X8iDUcSfDCiueLjDGTxDNxw==
X-Received: by 2002:a05:600c:5117:b0:434:fe62:28c1 with SMTP id 5b1f17b1804b1-436e26cfe5cmr127768285e9.18.1736948700035;
        Wed, 15 Jan 2025 05:45:00 -0800 (PST)
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
Subject: [PATCH] Design docs: Fix some typos in the design docs
Date: Wed, 15 Jan 2025 14:44:55 +0100
Message-ID: <692dabc63953fb0d33536f87e4c5c147ba6ce11c.1736948633.git.bernhard.kaindl@cloud.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Skimming through the design docs, I saw some typos that needed fixing.

---
Comments for reviewers (not for the commit message itself):

Sample typos (some are not easy to spot):
- heirarchical: (ei->ie)
- implementaiton: (it->ti)
- comprimised: (i->o)
- contol->control (r)

PS: I did the fixes using LTeX in an IDE and re-checked the mail too.

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@cloud.com>
---
 docs/designs/argo.pandoc                |  4 ++--
 docs/designs/nested-svm-cpu-features.md | 12 ++++++------
 docs/designs/qemu-deprivilege.md        |  8 ++++----
 docs/designs/xenstore-migration.md      |  2 +-
 docs/features/qemu-deprivilege.pandoc   |  2 +-
 5 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/docs/designs/argo.pandoc b/docs/designs/argo.pandoc
index e18aacea7c..cd854d2a7a 100644
--- a/docs/designs/argo.pandoc
+++ b/docs/designs/argo.pandoc
@@ -58,7 +58,7 @@ concurrency.
 
 Avoidance of deadlock is essential and since state must frequently be updated
 that pertains to more than one domain, a locking protocol defines which locks
-are needed and the order of their acquistion.
+are needed and the order of their acquisition.
 
 ## Structure
 
@@ -127,7 +127,7 @@ by the domain.
 
 ## Hierarchical Locking Model and Protocol
 
-The locking discipline within the Argo code is heirarchical and utilizes
+The locking discipline within the Argo code is hierarchical and utilizes
 reader/writer locks to enable increased concurrency when operations do not
 conflict. None of the Argo locks are reentrant.
 
diff --git a/docs/designs/nested-svm-cpu-features.md b/docs/designs/nested-svm-cpu-features.md
index 837a96df05..c855748141 100644
--- a/docs/designs/nested-svm-cpu-features.md
+++ b/docs/designs/nested-svm-cpu-features.md
@@ -22,7 +22,7 @@ leaf 8000000A:edx
   from the L1 hypervisor's perspective to be as close as possible to
   the original hardware.  In particular, the behavior of the hardware
   on error paths 1) is not easy to understand or test, 2) can be the
-  source of surprising vulnerabiliies.  (See XSA-7 for an example of a
+  source of surprising vulnerabilities.  (See XSA-7 for an example of a
   case where subtle error-handling differences can open up a privilege
   escalation.)  We should avoid emulating any bit of the hardware with
   complex error paths if we can at all help it.
@@ -59,11 +59,11 @@ leaf 8000000A:edx
 
 - 2 `SVML` *SVM Lock*: Not required for L0, not provided to L1
 
-  Seems to be aboult enabling an operating system to prevent "blue
+  Seems to be about enabling an operating system to prevent "blue
   pill" attacks against itself.
 
   Xen doesn't use it, nor provide it; so it would need to be
-  implementend.  The best way to protect a guest OS is to leave nested
+  implemented.  The best way to protect a guest OS is to leave nested
   virt disabled in the tools.
 
 - 3 `NRIPS` NRIP Save: Require for both L0 and L1
@@ -78,8 +78,8 @@ leaf 8000000A:edx
   The main putative use for this would be trying to maintain an
   invariant TSC across cores with different clock speeds, or after a
   migrate.  Unlike others, this doesn't have an error path to worry
-  about compatibility-wise; and according to tests done when nestedSVM
-  was first implemented, it's actually faster to emliate TscRateMSR in
+  about compatibility-wise; and according to tests done when nested SVM
+  was first implemented, it's actually faster to emulate TscRateMSR in
   the L0 hypervisor than for L1 to attempt to emulate it itself.
 
   However, using this properly in L0 will take some implementation
@@ -89,7 +89,7 @@ leaf 8000000A:edx
  - 5 `VmcbClean`: VMCB Clean Bits: Not required by L0, provide to L1
 
   This is a pure optimization, both on the side of the L0 and L1.  The
-  implementaiton for L1 is entirely Xen-side, so can be provided even
+  implementation for L1 is entirely Xen-side, so can be provided even
   on hardware that doesn't provide it.  And it's purely an
   optimization, so could be "implemented" by ignoring the bits
   entirely.
diff --git a/docs/designs/qemu-deprivilege.md b/docs/designs/qemu-deprivilege.md
index f12b1a3ae3..603491f24d 100644
--- a/docs/designs/qemu-deprivilege.md
+++ b/docs/designs/qemu-deprivilege.md
@@ -22,7 +22,7 @@ The following restrictions are currently implemented.
 '''Description''': As mentioned above, having QEMU switch to a
 non-root user, one per domain id.  Not being the root user limits what
 a compromised QEMU process can do to the system, and having one user
-per domain id limits what a comprimised QEMU process can do to the
+per domain id limits what a compromised QEMU process can do to the
 QEMU processes of other VMs.
 
 '''Implementation''': The toolstack adds the following to the qemu command-line:
@@ -79,8 +79,8 @@ Then adds the following to the qemu command-line:
 ## Namespaces for unused functionality (Linux only)
 
 '''Description''': QEMU doesn't use the functionality associated with
-mount and IPC namespaces. (IPC namespaces contol non-file-based IPC
-mechanisms within the kernel; unix and network sockets are not
+mount and IPC namespaces. (IPC namespaces control non-file-based IPC
+mechanisms within the kernel; Unix and network sockets are not
 affected by this.)  Making separate namespaces for these for QEMU
 won't affect normal operation, but it does mean that even if other
 restrictions fail, the process won't be able to even name system mount
@@ -251,7 +251,7 @@ executing QEMU.  (But this would then require other changes to create
 the QMP socket, VNC socket, and so on).
 
 It should be noted that `-sandbox` is implemented as a blacklist, not
-a whitelist; that is, it disables known-unsed functionality which may
+a whitelist; that is, it disables known-unused functionality which may
 be harmful, rather than disabling all functionality except that known
 to be safe and needed.  This is unfortunately necessary since qemu
 doesn't know what system calls libraries might end up making.  (See
diff --git a/docs/designs/xenstore-migration.md b/docs/designs/xenstore-migration.md
index 5022268386..082314bf72 100644
--- a/docs/designs/xenstore-migration.md
+++ b/docs/designs/xenstore-migration.md
@@ -372,7 +372,7 @@ or modified by a transaction for which there is also a `TRANSACTION_DATA`
 record previously present).
 
 Each _committed_ node in the stream is required to have an already known parent
-node. A parent node is known if it was either in the node data base before the
+node. A parent node is known if it was either in the node database before the
 stream was started to be processed, or if a `NODE_DATA` record for that parent
 node has already been processed in the stream.
 
diff --git a/docs/features/qemu-deprivilege.pandoc b/docs/features/qemu-deprivilege.pandoc
index 4ef119c821..915e38d8c9 100644
--- a/docs/features/qemu-deprivilege.pandoc
+++ b/docs/features/qemu-deprivilege.pandoc
@@ -25,7 +25,7 @@ dm_restrict is a set of operations to restrict QEMU running in domain
 
  1. Mechanisms to restrict QEMU to only being able to affect its own
 domain
- 2. Mechanisms to restruct QEMU's ability to interact with domain 0.
+ 2. Mechanisms to restrict QEMU's ability to interact with domain 0.
 
 # User details
 
-- 
2.43.0


