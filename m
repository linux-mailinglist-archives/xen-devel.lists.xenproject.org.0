Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3206C2463BC
	for <lists+xen-devel@lfdr.de>; Mon, 17 Aug 2020 11:49:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7blt-0004Cs-QH; Mon, 17 Aug 2020 09:49:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YVS9=B3=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k7bls-00046Z-Ao
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 09:49:40 +0000
X-Inumbo-ID: a8a6fc10-f60b-4a0d-8a2b-b05a507178fb
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a8a6fc10-f60b-4a0d-8a2b-b05a507178fb;
 Mon, 17 Aug 2020 09:49:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D4418AEE8;
 Mon, 17 Aug 2020 09:49:50 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Subject: [PATCH II v2 05/17] tools: fix pkg-config file for libxenguest
Date: Mon, 17 Aug 2020 11:49:10 +0200
Message-Id: <20200817094922.15768-6-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200817094922.15768-1-jgross@suse.com>
References: <20200817094922.15768-1-jgross@suse.com>
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

The pkg-config file for libxenguest is missing the private dependency
on libxenctrl.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libxc/xenguest.pc.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libxc/xenguest.pc.in b/tools/libxc/xenguest.pc.in
index 225ac0b9c8..6b43b67e63 100644
--- a/tools/libxc/xenguest.pc.in
+++ b/tools/libxc/xenguest.pc.in
@@ -7,4 +7,4 @@ Description: The Xenguest library for Xen hypervisor
 Version: @@version@@
 Cflags: -I${includedir}
 Libs: @@libsflag@@${libdir} -lxenguest
-Requires.private: xentoollog,xencall,xenforeignmemory,xenevtchn
+Requires.private: xentoollog,xencall,xenforeignmemory,xenevtchn,xencontrol
-- 
2.26.2


