Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4CF1AC135
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2020 14:27:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jP3cF-0003Wm-UN; Thu, 16 Apr 2020 12:27:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fNsn=6A=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jP3cE-0003WU-Gy
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2020 12:27:34 +0000
X-Inumbo-ID: a51e214b-7fdd-11ea-8b81-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a51e214b-7fdd-11ea-8b81-12813bfff9fa;
 Thu, 16 Apr 2020 12:27:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2D0CBAC6D;
 Thu, 16 Apr 2020 12:27:32 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH] mini-os: use -m elf_i386 for final linking
Date: Thu, 16 Apr 2020 14:27:31 +0200
Message-Id: <20200416122731.22713-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, samuel.thibault@ens-lyon.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Using the standard -m elf_x86_64 for 64-bit mini-os results in the
first section (.text) to start only at offset 2MB in the binary file.

Using -m elf_i386 avoids that problem without any visible disadvantage.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/arch.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/arch.mk b/arch/x86/arch.mk
index c87885f..00028a0 100644
--- a/arch/x86/arch.mk
+++ b/arch/x86/arch.mk
@@ -26,3 +26,5 @@ ifeq ($(CONFIG_PARAVIRT),n)
 ARCH_LDFLAGS_FINAL := --oformat=elf32-i386
 ARCH_AS_DEPS += x86_hvm.S
 endif
+
+ARCH_LDFLAGS_FINAL += -m elf_i386
-- 
2.16.4


