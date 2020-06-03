Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A35A11ED4BA
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jun 2020 19:09:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgWtb-0004ld-Gt; Wed, 03 Jun 2020 17:09:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EnF2=7Q=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jgWta-0004lX-SN
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2020 17:09:42 +0000
X-Inumbo-ID: 039812ee-a5bd-11ea-ad6e-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 039812ee-a5bd-11ea-ad6e-12813bfff9fa;
 Wed, 03 Jun 2020 17:09:42 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: RxCigYnqJ8jwZmk/BnaWuBkWK8CJG/CYdKGnGEhOOGkJ4ti0ZQx2I4/eBYI1ciJvXNT/LAl0qb
 WuZ4vAymWUTwjMhjt6EBGNAuKoVWYiaPpVVElaim9YpiuNhh4KVQeF8I95h4ErcJ8xkoI6rjJK
 XGCvByEJLNcIL2CJt7hguVeem6NAdahe/3b0ALhYYPXHUARYWqtpRo1S+baVbGa4FymKMqyUsn
 m5mxe2AqNfC5N+33AD92hprQQZxdCmhURzEx5javsoMZl2ozYa6fKw+XFAX/nIUCKicU7grxgx
 rlo=
X-SBRS: 2.7
X-MesageID: 19166954
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,468,1583211600"; d="scan'208";a="19166954"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH for-4.14] x86/shim: Fix defconfig selection and trim the build
 further
Date: Wed, 3 Jun 2020 18:09:08 +0100
Message-ID: <20200603170908.13239-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Several options (TBOOT, XENOPROF, Scheduler) depend on EXPERT to be able to
deselect/configure.

Enabling EXPERT now causes the request of the Credit1 scheduler to be honoured
(rather than giving us Credit2), but take this opportunity to switch to Null,
as the previously problematic issues are now believed to be fixed.

Enabling EXPERT also allows XEN_SHSTK to be selected, and we don't want this
being built for shim.  We also don't want TRACEBUFFER or GDBSX either.

Take this oppotunity to swap the disable of HVM_FEP for a general disable of
HVM (likely to have wider impliciations in the future), and disable ARGO (will
necesserily need plumbing work to function in shim).

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Juergen Gross <jgross@suse.com>
CC: Paul Durrant <paul@xen.org>
CC: Dario Faggioli <dfaggioli@suse.com>
---
 xen/arch/x86/configs/pvshim_defconfig | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/configs/pvshim_defconfig b/xen/arch/x86/configs/pvshim_defconfig
index 830660e022..3af48d6c06 100644
--- a/xen/arch/x86/configs/pvshim_defconfig
+++ b/xen/arch/x86/configs/pvshim_defconfig
@@ -5,19 +5,25 @@ CONFIG_PVH_GUEST=y
 CONFIG_PV_SHIM=y
 CONFIG_PV_SHIM_EXCLUSIVE=y
 CONFIG_NR_CPUS=32
+CONFIG_EXPERT=y
+CONFIG_SCHED_NULL=y
 # Disable features not used by the PV shim
+# CONFIG_HVM is not set
+# CONFIG_XEN_SHSTK is not set
 # CONFIG_HYPFS is not set
 # CONFIG_SHADOW_PAGING is not set
 # CONFIG_BIGMEM is not set
-# CONFIG_HVM_FEP is not set
 # CONFIG_TBOOT is not set
 # CONFIG_KEXEC is not set
 # CONFIG_XENOPROF is not set
 # CONFIG_XSM is not set
+# CONFIG_ARGO is not set
+# CONFIG_SCHED_CREDIT is not set
 # CONFIG_SCHED_CREDIT2 is not set
 # CONFIG_SCHED_RTDS is not set
 # CONFIG_SCHED_ARINC653 is not set
-# CONFIG_SCHED_NULL is not set
 # CONFIG_LIVEPATCH is not set
 # CONFIG_SUPPRESS_DUPLICATE_SYMBOL_WARNINGS is not set
+# CONFIG_TRACEBUFFER is not set
 # CONFIG_DEBUG is not set
+# CONFIG_GDBSX is not set
-- 
2.11.0


