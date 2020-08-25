Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE782517EA
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 13:41:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAXKI-0003Ki-J9; Tue, 25 Aug 2020 11:41:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=577d=CD=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1kAXKH-00030H-Hg
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 11:41:17 +0000
X-Inumbo-ID: 29920a8b-3c64-4a28-ab21-6454ac762236
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 29920a8b-3c64-4a28-ab21-6454ac762236;
 Tue, 25 Aug 2020 11:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598355653;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=SVuGQtvcGVVfaf+v1DRdEz59cBEmccl8FT7QK9fAm0E=;
 b=C7+NgVqtb8ohDcctDETFZDX1N03eQNmX2vVDy6/Tsr3OnvyuIpMRF8hG
 kki6P+EXNAhyAa9H9oMOjE8xS+CD92Gq9khkG1yk72dz1HffBibsmadld
 MMtWNn0fRd7jWEWlG3Ksu+edGgRr4caFv+0firQeR0QlCl/Deu7REH8eD I=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Bqsw/AzjpiKXJfTQi+M8+BPCBeEleqZfzUDnFiKHSNZvhHmwUs1gKrlAqfnufBtXkEz+JdcVMa
 mu7Kv1LE4BMzvuuxfObXGOW5756c0B5XGLp95DC6jxFYQiEJIeuys42Q2ACJ7a1smCM4tXhmKC
 8vgyL2fmH2LF0OcDzEXXVxmuEJCyRv2zCFTuMmjV4vJLYfPfZ0dPuCUIBTtKs/ZEkWTNc/QFOa
 Tq77eaOnHzWWbvJ2zQXv/d+v0TE5MJYcfOlYwqb0cYXh5j0H9AhAIBFB6GTEF55zuk5nmcq6Yi
 EP0=
X-SBRS: 2.7
X-MesageID: 26171003
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,352,1592884800"; d="scan'208";a="26171003"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 11/12] target setup refactoring: Add a doc comment
Date: Tue, 25 Aug 2020 12:40:40 +0100
Message-ID: <20200825114041.16290-12-ian.jackson@eu.citrix.com>
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

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/TestSupport.pm | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Osstest/TestSupport.pm b/Osstest/TestSupport.pm
index fd7b238b..d9bb2585 100644
--- a/Osstest/TestSupport.pm
+++ b/Osstest/TestSupport.pm
@@ -2563,6 +2563,9 @@ sub target_var ($$) {
 }
 
 sub target_setup_rootdev_console_inittab ($$$) {
+    # Operators on $gho.
+    # $gho's filesystem is accessed via $ho and $mountpoint;
+    # so maybe $gho is $ho and $mountpoint is "/".
     my ($ho, $gho, $root) = @_;
 
     my $pfx= target_var_prefix($gho);
-- 
2.20.1


