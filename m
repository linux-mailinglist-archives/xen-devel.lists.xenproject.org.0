Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 036661A0EA1
	for <lists+xen-devel@lfdr.de>; Tue,  7 Apr 2020 15:49:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLoal-0005dD-7K; Tue, 07 Apr 2020 13:48:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=WJ2g=5X=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jLoai-0005d8-V2
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2020 13:48:36 +0000
X-Inumbo-ID: 79efa524-78d6-11ea-80cb-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 79efa524-78d6-11ea-80cb-12813bfff9fa;
 Tue, 07 Apr 2020 13:48:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DA223AC79;
 Tue,  7 Apr 2020 13:48:33 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH] config: use mini-os master for unstable
Date: Tue,  7 Apr 2020 15:48:31 +0200
Message-Id: <20200407134831.22354-1-jgross@suse.com>
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

We haven't used mini-os master for about 2 years now due to a stubdom
test failing [1]. Booting a guest with mini-os master used for building
stubdom didn't reveal any problem, so use master for unstable in order
to let OSStest find any problems not showing up in the local test.

[1]: https://lists.xen.org/archives/html/minios-devel/2018-04/msg00015.html

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 Config.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.mk b/Config.mk
index dc6e7d03df..0f303c79b2 100644
--- a/Config.mk
+++ b/Config.mk
@@ -245,7 +245,7 @@ MINIOS_UPSTREAM_URL ?= git://xenbits.xen.org/mini-os.git
 endif
 OVMF_UPSTREAM_REVISION ?= 20d2e5a125e34fc8501026613a71549b2a1a3e54
 QEMU_UPSTREAM_REVISION ?= master
-MINIOS_UPSTREAM_REVISION ?= 0b4b7897e08b967a09bed2028a79fabff82342dd
+MINIOS_UPSTREAM_REVISION ?= master
 
 SEABIOS_UPSTREAM_REVISION ?= rel-1.13.0
 
-- 
2.16.4


