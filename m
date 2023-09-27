Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C24F47B0F87
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 01:20:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609176.948091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qldpH-0006DN-1Y; Wed, 27 Sep 2023 23:20:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609176.948091; Wed, 27 Sep 2023 23:20:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qldpG-0006Ba-Up; Wed, 27 Sep 2023 23:20:14 +0000
Received: by outflank-mailman (input) for mailman id 609176;
 Wed, 27 Sep 2023 23:20:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hjpc=FL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qldpF-0006BU-Fu
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 23:20:13 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66e8cacb-5d8c-11ee-878a-cb3800f73035;
 Thu, 28 Sep 2023 01:20:12 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 54056B818F3;
 Wed, 27 Sep 2023 23:20:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66D36C433C7;
 Wed, 27 Sep 2023 23:20:07 +0000 (UTC)
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
X-Inumbo-ID: 66e8cacb-5d8c-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695856808;
	bh=GgRKXEkiIvH3XdyU4PPmjhD4prwZBp3rGOtG2KtWupY=;
	h=From:To:Cc:Subject:Date:From;
	b=VEuOWgL7silRe1sIYKAN20WIb3bgLG86g7N/iOH2hvDeNbmYERDxfmahtTghxYy8+
	 kFCzGi6CP/Z4Jg+b9NUMY3egefs9kkEpBynqVWyRXv0jwEMLYeUIAU3nVxP0s42I6/
	 tmUyQ6Nj2CIKWcaMkrFVwBCo0ryU7+e7XigRT1DnYbwQaCkwla/Af9AxfGlOSlApkL
	 Zlo87PF/RWJy4faiGjOIDnIQVMBQIRELA6dCfFMyTJXB3r1D9ZvFXZutCmvx7Q9CM8
	 cyMc/phxG4mhsJtErHcu7AjpcXGX1AJ23iirtCkjMap8k8tGmD4BVIH6ZIcD0Cqc60
	 WpiyLE2gmz3fg==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	jbeulich@suse.com,
	george.dunlap@citrix.com,
	julien@xen.org,
	sstabellini@kernel.org,
	bertrand.marquis@arm.com,
	roger.pau@citrix.com,
	wl@xen.org,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH v3] SUPPORT: downgrade Physical CPU Hotplug to Experimental
Date: Wed, 27 Sep 2023 16:20:04 -0700
Message-Id: <20230927232004.1981595-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@amd.com>

The feature is not commonly used, and we don't have hardware to test it,
not in OSSTest, not in Gitlab, and not even ad-hoc manually by community
members. We could use QEMU to test it, but even that it is known not to
work.

Also take the opportunity to rename the feature to "ACPI CPU Hotplug"
for clarity.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v3:
- add note to CHANGELOG.md
---
 CHANGELOG.md | 2 ++
 SUPPORT.md   | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 24636b8eaf..e33cf4e1b1 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -13,6 +13,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
    known user doesn't use it properly, leading to in-guest breakage.
  - The "dom0" option is now supported on Arm and "sve=" sub-option can be used
    to enable dom0 guest to use SVE/SVE2 instructions.
+ - Physical CPU Hotplug downgraded to Experimental and renamed "ACPI CPU
+   Hotplug" for clarity
 
 ### Added
  - On x86, support for features new in Intel Sapphire Rapids CPUs:
diff --git a/SUPPORT.md b/SUPPORT.md
index 3461f5cf2f..3472b6edfa 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -46,9 +46,9 @@ For the Cortex A77 r0p0 - r1p0, see Errata 1508412.
 
 ## Host hardware support
 
-### Physical CPU Hotplug
+### ACPI CPU Hotplug
 
-    Status, x86: Supported
+    Status, x86: Experimental
 
 ### Physical Memory
 
-- 
2.25.1


