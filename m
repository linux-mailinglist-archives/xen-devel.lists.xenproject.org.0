Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD9925F9D5
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 13:49:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFFdU-0002IQ-GZ; Mon, 07 Sep 2020 11:48:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=72DF=CQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kFFdT-0002IB-Gp
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 11:48:35 +0000
X-Inumbo-ID: 9b9e78d1-857a-415e-853a-7c76f8cfadc3
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9b9e78d1-857a-415e-853a-7c76f8cfadc3;
 Mon, 07 Sep 2020 11:48:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BA549AC2F;
 Mon,  7 Sep 2020 11:48:34 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH] minios: use more recent commit for building xen unstable
Date: Mon,  7 Sep 2020 13:48:14 +0200
Message-Id: <20200907114814.15620-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200907114814.15620-1-jgross@suse.com>
References: <20200907114814.15620-1-jgross@suse.com>
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

Commit 82c3d15c903aa43 ("minios: Revert recent change and revert to
working minios") switched the used commit for the build of Xen unstable
from master to a rather old commit (the one used for Xen 4.13 instead
of the last one without a known problem).

Switch to Mini-OS commit 051b87bb9c196 instead, which doesn't contain
the problematic modification being reason for switching away from
master.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 Config.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.mk b/Config.mk
index db434ee2c6..259e68863d 100644
--- a/Config.mk
+++ b/Config.mk
@@ -246,7 +246,7 @@ MINIOS_UPSTREAM_URL ?= git://xenbits.xen.org/mini-os.git
 endif
 OVMF_UPSTREAM_REVISION ?= a3741780fe3535e19e02efa869a7cac481891129
 QEMU_UPSTREAM_REVISION ?= master
-MINIOS_UPSTREAM_REVISION ?= 0b4b7897e08b967a09bed2028a79fabff82342dd
+MINIOS_UPSTREAM_REVISION ?= 051b87bb9c19609976fb038f386920e1ce5454c5
 
 SEABIOS_UPSTREAM_REVISION ?= rel-1.14.0
 
-- 
2.26.2


