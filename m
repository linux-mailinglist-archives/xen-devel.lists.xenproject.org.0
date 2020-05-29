Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8C51E7C06
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 13:35:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jedI9-00033H-RL; Fri, 29 May 2020 11:35:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gj5c=7L=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jedI7-00031l-SK
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 11:35:11 +0000
X-Inumbo-ID: 5121d66a-a1a0-11ea-8993-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5121d66a-a1a0-11ea-8993-bc764e2007e4;
 Fri, 29 May 2020 11:34:12 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jed3P-0003xZ-UC; Fri, 29 May 2020 12:20:00 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 10/49] Debian guests made with xen-tools: Write
 systemd random seed file
Date: Fri, 29 May 2020 12:19:06 +0100
Message-Id: <20200529111945.21394-11-ian.jackson@eu.citrix.com>
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

When the Debian guest is not made with d-i, we must still provide this
random seed file.  This can be done in ts-debian-fixup.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 ts-debian-fixup | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/ts-debian-fixup b/ts-debian-fixup
index fef9836e..dfeb4d39 100755
--- a/ts-debian-fixup
+++ b/ts-debian-fixup
@@ -102,6 +102,11 @@ sub console () {
     logm("extra: $extra");
 }
 
+sub randomseed () {
+    my $cmd = debian_write_random_seed_command($mountpoint);
+    target_cmd_root($ho, "set -ex\n".cmd);
+}
+
 sub filesystems () {
     my $rootdev= $r{"$gho->{Guest}_rootdev"};
     return unless defined($rootdev) && length($rootdev);
@@ -215,6 +220,7 @@ END
 target_cmd_root($ho, debian_dhcp_rofs_fix($ho, $mountpoint));
 
 console();
+randomseed();
 filesystems();
 otherfixupcfg();
 writecfg();
-- 
2.20.1


