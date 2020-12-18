Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A65F72DEA5E
	for <lists+xen-devel@lfdr.de>; Fri, 18 Dec 2020 21:45:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.56682.99292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqMd8-0001Bq-OR; Fri, 18 Dec 2020 20:45:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 56682.99292; Fri, 18 Dec 2020 20:45:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqMd8-0001BC-L7; Fri, 18 Dec 2020 20:45:38 +0000
Received: by outflank-mailman (input) for mailman id 56682;
 Fri, 18 Dec 2020 20:45:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dpih=FW=daemonizer.de=maxi@srs-us1.protection.inumbo.net>)
 id 1kqMd7-00018c-GP
 for xen-devel@lists.xenproject.org; Fri, 18 Dec 2020 20:45:37 +0000
Received: from mx1.somlen.de (unknown [2a00:1828:a019::100:0])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a4face0c-83fd-4ebf-a058-7acf17fb493a;
 Fri, 18 Dec 2020 20:45:32 +0000 (UTC)
Received: by mx1.somlen.de with ESMTPSA id E10F8C3AF0D;
 Fri, 18 Dec 2020 21:45:29 +0100 (CET)
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
X-Inumbo-ID: a4face0c-83fd-4ebf-a058-7acf17fb493a
From: Maximilian Engelhardt <maxi@daemonizer.de>
To: xen-devel@lists.xenproject.org
Cc: Maximilian Engelhardt <maxi@daemonizer.de>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 1/3] xen/arch/x86: don't insert timestamp when SOURCE_DATE_EPOCH is defined
Date: Fri, 18 Dec 2020 21:42:33 +0100
Message-Id: <5f715df2808dcd24b9fab95cd02522d16daba86c.1608319634.git.maxi@daemonizer.de>
In-Reply-To: <cover.1608319634.git.maxi@daemonizer.de>
References: <cover.1608319634.git.maxi@daemonizer.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

By default a timestamp gets added to the xen efi binary. Unfortunately
ld doesn't seem to provide a way to set a custom date, like from
SOURCE_DATE_EPOCH, so set a zero value for the timestamp (option
--no-insert-timestamp) if SOURCE_DATE_EPOCH is defined. This makes
reproducible builds possible.

This is an alternative to the patch suggested in [1]. This patch only
omits the timestamp when SOURCE_DATE_EPOCH is defined.

[1] https://lists.xenproject.org/archives/html/xen-devel/2020-10/msg02161.html

Signed-off-by: Maximilian Engelhardt <maxi@daemonizer.de>
---
 xen/arch/x86/Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 8f2180485b..863aed043f 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -184,6 +184,12 @@ EFI_LDFLAGS += --major-image-version=$(XEN_VERSION)
 EFI_LDFLAGS += --minor-image-version=$(XEN_SUBVERSION)
 EFI_LDFLAGS += --major-os-version=2 --minor-os-version=0
 EFI_LDFLAGS += --major-subsystem-version=2 --minor-subsystem-version=0
+# It seems ld unfortunately can't set a custom timestamp, so add a zero value
+# for the timestamp (option --no-insert-timestamp) if SOURCE_DATE_EPOCH is
+# defined to make reproducible builds possible.
+ifdef SOURCE_DATE_EPOCH
+EFI_LDFLAGS += --no-insert-timestamp
+endif
 
 $(TARGET).efi: VIRT_BASE = 0x$(shell $(NM) efi/relocs-dummy.o | sed -n 's, A VIRT_START$$,,p')
 $(TARGET).efi: ALT_BASE = 0x$(shell $(NM) efi/relocs-dummy.o | sed -n 's, A ALT_START$$,,p')
-- 
2.20.1


