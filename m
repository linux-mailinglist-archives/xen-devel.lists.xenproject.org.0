Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 640411E7C02
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 13:34:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jedHp-0002ir-FU; Fri, 29 May 2020 11:34:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gj5c=7L=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jedHn-0002hE-RR
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 11:34:51 +0000
X-Inumbo-ID: 4990ebde-a1a0-11ea-8993-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4990ebde-a1a0-11ea-8993-bc764e2007e4;
 Fri, 29 May 2020 11:33:59 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jed3Z-0003xZ-Qa; Fri, 29 May 2020 12:20:09 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 42/49] buster: Install own linux-libc-dev package (!)
Date: Fri, 29 May 2020 12:19:38 +0100
Message-Id: <20200529111945.21394-43-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200529111945.21394-1-ian.jackson@eu.citrix.com>
References: <20200529111945.21394-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

As reported here:
  https://patchew.org/QEMU/20200513120147.21443-1-f4bug@amsat.org/
  https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=960271
the kernel has broken the build of upstream qemu.  This made it
into a Debian stable kernel update.  This breaks our CI runs almost
completely, when they run with buster.

I spoke to the Debian kernel folks and apparently there is no intent
to fast-track a fix to this.  So instead I have made a kernel source
package with the patch from that bug report, and built the
linux-libc-dev package fromk it.  The source is here for the time
being:
  https://www.chiark.greenend.org.uk/~ijackson/quicksand/2020/libc-kernel-bug.960271/

Deployment note: the source and linux-libc-dev_*.deb are in the
images directory on osstest@test-lab.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 production-config | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/production-config b/production-config
index 6372ac9a..7a8c0fd3 100644
--- a/production-config
+++ b/production-config
@@ -108,7 +108,7 @@ TftpGrubVersion XXXX-XX-XX
 
 DebianExtraPackages_jessie chiark-scripts_6.0.3~citrix1_all.deb
 DebianExtraPackages_stretch chiark-scripts_6.0.4~citrix1_all.deb
-DebianExtraPackages_buster chiark-scripts_6.0.5~citrix1_all.deb
+DebianExtraPackages_buster chiark-scripts_6.0.5~citrix1_all.deb libc-kernel-bug.960271/linux-libc-dev_4.19.118-2.0iwj_.deb
 
 DebianExtraPackages_uefi_i386_jessie   extradebs-uefi-i386-2018-04-01/
 DebianExtraPackages_uefi_amd64_jessie  extradebs-uefi-amd64-2018-04-01/
-- 
2.20.1


