Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BCBA12045
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 11:43:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872316.1283273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY0ra-0001rz-LP; Wed, 15 Jan 2025 10:43:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872316.1283273; Wed, 15 Jan 2025 10:43:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY0ra-0001qJ-Ic; Wed, 15 Jan 2025 10:43:06 +0000
Received: by outflank-mailman (input) for mailman id 872316;
 Wed, 15 Jan 2025 10:43:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4o+i=UH=cloud.com=bernhard.kaindl@srs-se1.protection.inumbo.net>)
 id 1tY0rZ-0001qD-2a
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 10:43:05 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f753389-d32d-11ef-a0e1-8be0dac302b0;
 Wed, 15 Jan 2025 11:43:03 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4362bae4d7dso46613355e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2025 02:43:03 -0800 (PST)
Received: from localhost ([185.68.248.203]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e37d154sm17643663f8f.10.2025.01.15.02.43.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 02:43:02 -0800 (PST)
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
X-Inumbo-ID: 7f753389-d32d-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1736937783; x=1737542583; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uOXIkpl9nUkKoAlwzI7JQ7MlkyqR4hdJY0tA9XuuqEw=;
        b=KUOlvW+yj/MXpjsIqLVsHfxcS25j/KzRW4ALYGrgByUcED8r7SJQnlRxoAhIu7JnyM
         mfYnPdwC7nGBpcWAaL3RPhKtMGOg0m6GWZuVy4PVRdfsy43XUul1cgBMOCq1arMu4cG1
         hhx4ZoCzIDXIfxlyZcYqD81wwPxDdRE7oy9XY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736937783; x=1737542583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uOXIkpl9nUkKoAlwzI7JQ7MlkyqR4hdJY0tA9XuuqEw=;
        b=VItrNZNdWRaCjjcgYUaXp+ynESwRjXU9rUUOjqehLFcAjOxglJl9t8Zz+KrqmKanV2
         pHU6M7VlCLyBqO7Uxmfy47wt8UvOd8lP3ueDBysnk9jmhIZKrQpz+wf110P6rgX4Ekjy
         X8g3to75NYX0TcKF2j73K10KemAA1wHDyZ5d8Sqa5qJIT92w6iu7PWaITo2udN7qgGz5
         yHrUt8zPrJAmND1xYR/QGo6e1E96pFT4NlnzAqSCWn2MSn6PEwilvLnVCNRboZtwGdSZ
         o+Ez5zFGsRvx9ZzwRn/XMjaKyuav2LHJj0fnrnU6fMbXNEH+SHCjIxsldDGS/TC7Slf9
         jrkA==
X-Gm-Message-State: AOJu0Yy5cctOjPcY2m/ANYahLStOhT7zbRPNoVdUBYL13q88XDa3bIDW
	kLGow+SuWYVkNNoIUuj4gYlBf2qWmd3fyHxx3jqR+LLRHdXq1UOR9EpfuHvvcdISpU17193P7Lu
	4bZgcew==
X-Gm-Gg: ASbGncvz+Py62prAJcCEwCde3TMlBw3rpNXalfCs5VGzOivcccVQ9Tuk3RIr/ZbePhC
	YYCcEX0OC4xCsRkgQ53N9aB7HFiIu5MSa6xYKcAke+Oq9rb/NO/DMBrIGU015difmS4kUUBvAfz
	DlgH8U8r7ynzJaXpGTEmyMpcunSBFmhn8cxEpSLYWWX4AHyZC1oaf0DqDYDsPlO7FrOedrt8kBW
	IVFsub2aPNxEBxInP7DqyJmkcJATRNsOUTdk+25NL/T4XiN7lVKQlg+gQ3aPA==
X-Google-Smtp-Source: AGHT+IEBSyUCZdFS+5yN4BDhICeSingrg6DKfYFQe8b/tGnIOwFiHV0ZkEWXBEE9skJxTaRA67lZaQ==
X-Received: by 2002:a05:600c:3551:b0:434:effb:9f8a with SMTP id 5b1f17b1804b1-436e26b8be2mr277621495e9.15.1736937782974;
        Wed, 15 Jan 2025 02:43:02 -0800 (PST)
From: Bernhard Kaindl <bernhard.kaindl@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Bernhard Kaindl <bernhard.kaindl@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH] docs: Improve spelling of few cases in the documentation
Date: Wed, 15 Jan 2025 11:42:59 +0100
Message-ID: <504170a4a195551072c14141e28ef554ac1cad2c.1736937491.git.bernhard.kaindl@cloud.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Skimming the docs, I came across a few places for spelling improvements.
I checked using dictionaries to be sure.

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@cloud.com>
---
 docs/admin-guide/microcode-loading.rst    | 4 ++--
 docs/designs/non-cooperative-migration.md | 4 ++--
 docs/designs/qemu-deprivilege.md          | 2 +-
 docs/guest-guide/x86/hypercall-abi.rst    | 2 +-
 docs/man/xl.conf.5.pod.in                 | 2 +-
 docs/misc/livepatch.pandoc                | 2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/docs/admin-guide/microcode-loading.rst b/docs/admin-guide/microcode-loading.rst
index a07e25802f..f9b2b73d17 100644
--- a/docs/admin-guide/microcode-loading.rst
+++ b/docs/admin-guide/microcode-loading.rst
@@ -20,7 +20,7 @@ distro guidance for microcode loading.
 Microcode can make almost arbitrary changes to the processor, including to
 software visible features.  This includes removing features (e.g. the Haswell
 TSX errata which necessitated disabling the feature entirely), or the addition
-of brand new features (e.g. the Spectre v2 controls to work around speculative
+of brand-new features (e.g. the Spectre v2 controls to work around speculative
 execution vulnerabilities).
 
 
@@ -40,7 +40,7 @@ Xen will report during boot if it performed a microcode update::
   (XEN) microcode: CPU6 updated from revision 0x1a to 0x25, date = 2018-04-02
 
 The exact details printed are system and microcode specific.  After boot, the
-current microcode version can obtained from with dom0::
+current microcode version can be obtained from with dom0::
 
   [root@host ~]# head /proc/cpuinfo
   processor    : 0
diff --git a/docs/designs/non-cooperative-migration.md b/docs/designs/non-cooperative-migration.md
index 4b876d809f..54496892ed 100644
--- a/docs/designs/non-cooperative-migration.md
+++ b/docs/designs/non-cooperative-migration.md
@@ -112,7 +112,7 @@ because the guest can sample its own domid from the frontend area and use
 it in hypercalls (e.g. HVMOP_set_param) rather than DOMID_SELF, the guest
 domid must also be preserved to maintain the ABI.
 
-Furthermore, it will necessary to modify backend drivers to re-establish
+Furthermore, it will be necessary to modify backend drivers to re-establish
 communication with frontend drivers without perturbing the content of the
 backend area or requiring any changes to the values of the xenstore state
 nodes.
@@ -259,7 +259,7 @@ Essentially this should skip the check to see if PV drivers and migrate as
 if there are none present, but also enabling the extra save records. Note
 that at least some of the extra records should only form part of a
 non-cooperative migration stream. For example, migrating event channel
-state would be counter productive in a normal migration as this will
+state would be counter-productive in a normal migration as this will
 essentially leak event channel objects at the receiving end. Others, such
 as grant table state, could potentially harmlessly form part of a normal
 migration stream.
diff --git a/docs/designs/qemu-deprivilege.md b/docs/designs/qemu-deprivilege.md
index 81a5f5c05d..f12b1a3ae3 100644
--- a/docs/designs/qemu-deprivilege.md
+++ b/docs/designs/qemu-deprivilege.md
@@ -3,7 +3,7 @@
 The goal of deprilvileging qemu is this: Even if there is a bug (for
 example in qemu) which permits a domain to gain control of the device
 model, the compromised device model process is prevented from
-violating the system's overall security properties.  Ie, a guest
+violating the system's overall security properties.  I.e., a guest
 cannot "escape" from the virtualisation by using a qemu bug.
 
 This document lists the various technical measures which we either
diff --git a/docs/guest-guide/x86/hypercall-abi.rst b/docs/guest-guide/x86/hypercall-abi.rst
index 745fbbb64a..e52ed453bc 100644
--- a/docs/guest-guide/x86/hypercall-abi.rst
+++ b/docs/guest-guide/x86/hypercall-abi.rst
@@ -109,7 +109,7 @@ abstracting away the details of how it is currently running.
 Creating Hypercall Pages
 ------------------------
 
-Guests which are started using the PV boot protocol may set set
+Guests which are started using the PV boot protocol may set
 ``XEN_ELFNOTE_HYPERCALL_PAGE`` to have the nominated page written as a
 hypercall page during construction.  This mechanism is common for PV guests,
 and allows hypercalls to be issued with no additional setup.
diff --git a/docs/man/xl.conf.5.pod.in b/docs/man/xl.conf.5.pod.in
index 44738b80bf..0cfec8587c 100644
--- a/docs/man/xl.conf.5.pod.in
+++ b/docs/man/xl.conf.5.pod.in
@@ -4,7 +4,7 @@
 
 =head1 DESCRIPTION
 
-The F<xl.conf> file allows configuration of hostwide C<xl> toolstack
+The F<xl.conf> file allows configuration of host-wide C<xl> toolstack
 options.
 
 For details of per-domain configuration options please see
diff --git a/docs/misc/livepatch.pandoc b/docs/misc/livepatch.pandoc
index a94fb57eb5..43010227e5 100644
--- a/docs/misc/livepatch.pandoc
+++ b/docs/misc/livepatch.pandoc
@@ -2,7 +2,7 @@
 
 ## Rationale
 
-A mechanism is required to binarily patch the running hypervisor with new
+A mechanism is required to binary-patch the running hypervisor with new
 opcodes that have come about due to primarily security updates.
 
 This document describes the design of the API that would allow us to
-- 
2.43.0


