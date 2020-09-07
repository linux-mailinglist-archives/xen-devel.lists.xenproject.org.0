Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B6525F9D4
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 13:49:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFFdU-0002IK-7w; Mon, 07 Sep 2020 11:48:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=72DF=CQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kFFdT-0002IA-Cv
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 11:48:35 +0000
X-Inumbo-ID: 95745e6a-79f7-40ef-8069-8dd473645db1
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 95745e6a-79f7-40ef-8069-8dd473645db1;
 Mon, 07 Sep 2020 11:48:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 49E44ACB8;
 Mon,  7 Sep 2020 11:48:33 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>
Subject: [PATCH] config: use mini-os master for unstable
Date: Mon,  7 Sep 2020 13:48:13 +0200
Message-Id: <20200907114814.15620-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
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


