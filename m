Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 494B91EBC38
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 14:59:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg6Vb-0002eQ-A6; Tue, 02 Jun 2020 12:59:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d8pY=7P=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jg6VZ-0002e9-Tc
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 12:59:09 +0000
X-Inumbo-ID: d62fb358-a4d0-11ea-9947-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d62fb358-a4d0-11ea-9947-bc764e2007e4;
 Tue, 02 Jun 2020 12:59:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DD6A3AF72;
 Tue,  2 Jun 2020 12:59:05 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH-for-4.14 v2 2/2] xen/config: disable hypervisor filesystem for
 pv-shim
Date: Tue,  2 Jun 2020 14:59:00 +0200
Message-Id: <20200602125900.4424-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200602125900.4424-1-jgross@suse.com>
References: <20200602125900.4424-1-jgross@suse.com>
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>, paul@xen.org,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The pv-shim doesn't need the hypervisor filesystem, so disable it.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/configs/pvshim_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/configs/pvshim_defconfig b/xen/arch/x86/configs/pvshim_defconfig
index 9710aa6238..830660e022 100644
--- a/xen/arch/x86/configs/pvshim_defconfig
+++ b/xen/arch/x86/configs/pvshim_defconfig
@@ -6,6 +6,7 @@ CONFIG_PV_SHIM=y
 CONFIG_PV_SHIM_EXCLUSIVE=y
 CONFIG_NR_CPUS=32
 # Disable features not used by the PV shim
+# CONFIG_HYPFS is not set
 # CONFIG_SHADOW_PAGING is not set
 # CONFIG_BIGMEM is not set
 # CONFIG_HVM_FEP is not set
-- 
2.26.2


