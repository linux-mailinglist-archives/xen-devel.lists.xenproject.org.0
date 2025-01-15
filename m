Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14048A123F8
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 13:47:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872487.1283453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY2ng-0004Wa-DE; Wed, 15 Jan 2025 12:47:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872487.1283453; Wed, 15 Jan 2025 12:47:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY2ng-0004V0-9W; Wed, 15 Jan 2025 12:47:12 +0000
Received: by outflank-mailman (input) for mailman id 872487;
 Wed, 15 Jan 2025 12:47:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4o+i=UH=cloud.com=bernhard.kaindl@srs-se1.protection.inumbo.net>)
 id 1tY2ne-0004Uu-Qb
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 12:47:10 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d4ffdf7f-d33e-11ef-99a4-01e77a169b0f;
 Wed, 15 Jan 2025 13:47:08 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-386329da1d9so3412982f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2025 04:47:08 -0800 (PST)
Received: from localhost ([185.68.248.203]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e38f0eesm17806171f8f.61.2025.01.15.04.47.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 04:47:07 -0800 (PST)
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
X-Inumbo-ID: d4ffdf7f-d33e-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1736945228; x=1737550028; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yiLnvDkMCVfk/JEHp3old2hwqfuuFu8S2Iv1v5+6Iyc=;
        b=IRsNbVaBzkYtpxc/fyHdzQf8Wa6ZeBOZoefBIR7HvUFEm3vGIqh4aNEQpf1LRZht8x
         Pd1KQxXiKeTnlK5iKsHbBILTjcbKSbz5nPUHHJWKNi9njCsfMNqcN8UQXfShKLmCCvcI
         9kYYRB17PdZVlJ10gmV4fO7QMxxyM2VhUx7OQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736945228; x=1737550028;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yiLnvDkMCVfk/JEHp3old2hwqfuuFu8S2Iv1v5+6Iyc=;
        b=lDqghvliz1cPgVK+woMHTTIeWMxJ+s+beeesZuTHJ65rkbcTeMks6ZHfP+j/T+hOSe
         5IIsx1BRqplowcsmO9p0RGMb+jdUhq4gZaSyACN56l8Zu8k6gfJDsFWO13FcH4MFSzRN
         T9uE+lcnj5GHGdsZLs9a6mfxDc3KRhW5p11SUM2ckd9gnCU3rIm5aLelLsGKqf8OgVN2
         yAoMrncbMSoab6GsAp704f+Eylx7zSVM/bVkgcgl2Oc6FRLGsq1zwNMGkHIVC7Bp2zxA
         327xb5Dn2z46ReyrX9AgO73BNYcdOgYvV+A6DA4HV0OT7j48D8vZg3PF1i93hraM+Ko4
         BItQ==
X-Gm-Message-State: AOJu0YxgBGjsBNgDbWLEBcYjt32nsjOpUGdgAxPtnW8B0qFPGXAaW0p0
	pNa+W9ipeJ3WYVcvEohnuIb96Kvr4tq7xBl+ku6OMEHKhofKstBrWX1PKe5tC2w7R9xP3miRzt6
	7leB8ow==
X-Gm-Gg: ASbGnctrLGSbp6Qy6wwSR9z/ZATRiOkrp0glXqXFwkcB50LaLHKaORz5FYPIfZWi1jJ
	UPWJdOj75g/6jOAwhIU+tkWXU+Qlks2ZocWST1UO2Sy8evLpgjHQsomgegCoKCvrft5BbGkwhGM
	Rj++FPF4IQdbRLsdzb/eHedZuJ6Dhqx1yWc+iVyBHOQm5rn4ff+bhtxiXIwo+bGcCC2rXHg6J8E
	k1aqOp5hGgB1IoAxXcdslKoIrlrSLObNfRw942l9Lxzvwr7Vg3+pBwVoT31XA==
X-Google-Smtp-Source: AGHT+IFNMgxpjui+KOK88z2kypCOVXsvoA2X64Fs5IdKU/ikFNnFWgJ5ZLmYdG2VgLhUOxm12r2KUQ==
X-Received: by 2002:a5d:6c68:0:b0:38a:82a3:395f with SMTP id ffacd0b85a97d-38a872c93f9mr20693302f8f.9.1736945228032;
        Wed, 15 Jan 2025 04:47:08 -0800 (PST)
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
Subject: [PATCH v2] docs: Improve spelling of few cases in the documentation
Date: Wed, 15 Jan 2025 13:47:02 +0100
Message-ID: <2c20751e64552ec69686aa26304710bce975bca5.1736945126.git.bernhard.kaindl@cloud.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Skimming the docs, I came across a few places for spelling improvements.

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@cloud.com>
---
Changes in v2:
- Apply review of v1: Leave "brand new" and omit changes that Andy will do.
- "binary-patch" -> "binary patch" ("binarily patch" is okay but uncommon)
---
 docs/designs/non-cooperative-migration.md | 4 ++--
 docs/designs/qemu-deprivilege.md          | 2 +-
 docs/guest-guide/x86/hypercall-abi.rst    | 2 +-
 docs/man/xl.conf.5.pod.in                 | 2 +-
 docs/misc/livepatch.pandoc                | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

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
index a94fb57eb5..4a0b4fd6d8 100644
--- a/docs/misc/livepatch.pandoc
+++ b/docs/misc/livepatch.pandoc
@@ -2,7 +2,7 @@
 
 ## Rationale
 
-A mechanism is required to binarily patch the running hypervisor with new
+A mechanism is required to binary patch the running hypervisor with new
 opcodes that have come about due to primarily security updates.
 
 This document describes the design of the API that would allow us to
-- 
2.43.0


