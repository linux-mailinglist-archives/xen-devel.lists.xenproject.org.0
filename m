Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D31E22517E5
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 13:41:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAXJu-00032P-Rv; Tue, 25 Aug 2020 11:40:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=577d=CD=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1kAXJt-00030Q-NZ
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 11:40:53 +0000
X-Inumbo-ID: ded55b50-ed58-4048-a483-3bdad4bbe1b6
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ded55b50-ed58-4048-a483-3bdad4bbe1b6;
 Tue, 25 Aug 2020 11:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598355648;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=SUSJm7AFgIqRKTJLWc2VDqdelazeb0VtX7atdfIVoUE=;
 b=OFmbD+MP+cGVehf1F/6R2ZpbklcD/lbAhX4rnPbyXQoFrQdwOye/A8oO
 uQOvRh6XBAbmZWV7Hp+n5MDbB4iLha7/hgDAcrrMA8DyVA/zsGt/6ldz6
 YMlA0GCToBdQzPPU2THJRp6exic7gqWlONNtfxwir/i0f1gZPvx0IzykS Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: rx2bRs+MM7BNmbNgKWlkOJxBxXgnnJmWDW28qwxANextgJ+PnUu9uCJUhTsP6am/sRAFJBW53a
 0larcz3rlf9tJ50uo3ivYUlhD4CG3D7rTWXWqEEYohiiNqAw1EWTikCD8pHKtZZQQZ6gNDQiDM
 rUYfsZ3QprTV8fDNWKS/tqfIhAyJbkUbw7zoncxk7+3FqoA15uWeWrhG4FYnJ32QuDQGQUVOpR
 JfknKoyGD9an7DeYoOKGTSxN12C809Se0WlvR4AuCJcbWbiD6nvrDXZhQTSvZKrWg1HxJRf2XM
 y9U=
X-SBRS: 2.7
X-MesageID: 25539848
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,352,1592884800"; d="scan'208";a="25539848"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 09/12] target setup refactoring: Move
 target_kernkind_console_inittab
Date: Tue, 25 Aug 2020 12:40:38 +0100
Message-ID: <20200825114041.16290-10-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200825114041.16290-1-ian.jackson@eu.citrix.com>
References: <20200825114041.16290-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

We move this earlier.  This is OK because it depends only on the
console runvar (inside the sub; this is set by target_kernkind_check),
$ho and $gho (which are set by this point); and $mountpoint$ (which is
set by access().

No functional change.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 ts-debian-fixup | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/ts-debian-fixup b/ts-debian-fixup
index 34051137..2184212b 100755
--- a/ts-debian-fixup
+++ b/ts-debian-fixup
@@ -79,10 +79,9 @@ END
 }
 
 our $extra;
+our $console;
 
 sub console () {
-    my $console=
-        target_kernkind_console_inittab($ho,$gho,"$mountpoint");
     return unless length $console;
     
     my $xextra= "console=$console earlyprintk=xen";
@@ -211,6 +210,7 @@ savecfg();
 ether();
 access();
 target_kernkind_check($gho);
+$console = target_kernkind_console_inittab($ho,$gho,"$mountpoint");
 
 debian_overlays($ho, \&overlay);
 target_cmd_root($ho, <<END.debian_overlays_fixup_cmd($ho, $mountpoint));
-- 
2.20.1


