Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FEC39B259
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jun 2021 08:03:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136690.253345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lp2uW-0002pH-OZ; Fri, 04 Jun 2021 06:02:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136690.253345; Fri, 04 Jun 2021 06:02:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lp2uW-0002jS-J0; Fri, 04 Jun 2021 06:02:24 +0000
Received: by outflank-mailman (input) for mailman id 136690;
 Fri, 04 Jun 2021 06:02:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x6aI=K6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lp2uV-00029d-Kq
 for xen-devel@lists.xenproject.org; Fri, 04 Jun 2021 06:02:23 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3e75bed6-f25e-4c17-bf1d-2c16cc88ec47;
 Fri, 04 Jun 2021 06:02:18 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5BBDD21A0A;
 Fri,  4 Jun 2021 06:02:17 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 2B50C118DD;
 Fri,  4 Jun 2021 06:02:17 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id OJZkCenBuWCyGwAALh3uQQ
 (envelope-from <jgross@suse.com>); Fri, 04 Jun 2021 06:02:17 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 3e75bed6-f25e-4c17-bf1d-2c16cc88ec47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622786537; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eIBjeTC4n1sKa6paY8ti6Xavmo8jAw6kAIRZige1e6Q=;
	b=npwQj0bxc5WTZl2jMjTKIHJfkGlQuZssSGTpjmDOzqVoBRhh8q7l9R1XA95x3VjW/B9y5F
	iUS/Q9avZoWD9kk0/pJQopzAaTcs7tOHac8VMEYNWpTjjF1QUnUb6K5Cm7/6zt4KPdqBUP
	DCu53gUpKeUjsgoHmOQ482WfAM9c0SM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622786537; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eIBjeTC4n1sKa6paY8ti6Xavmo8jAw6kAIRZige1e6Q=;
	b=npwQj0bxc5WTZl2jMjTKIHJfkGlQuZssSGTpjmDOzqVoBRhh8q7l9R1XA95x3VjW/B9y5F
	iUS/Q9avZoWD9kk0/pJQopzAaTcs7tOHac8VMEYNWpTjjF1QUnUb6K5Cm7/6zt4KPdqBUP
	DCu53gUpKeUjsgoHmOQ482WfAM9c0SM=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 4/6] tools/libs: move xc_resume.c to libxenguest
Date: Fri,  4 Jun 2021 08:02:12 +0200
Message-Id: <20210604060214.14924-5-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210604060214.14924-1-jgross@suse.com>
References: <20210604060214.14924-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The guest suspend functionality is already part of libxenguest. Move
the resume functionality from libxenctrl to libxenguest, too.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Wei Liu <wl@xen.org>
---
 tools/include/xenctrl.h                       | 63 -------------------
 tools/include/xenguest.h                      | 62 ++++++++++++++++++
 tools/libs/ctrl/Makefile                      |  1 -
 tools/libs/guest/Makefile                     |  1 +
 .../{ctrl/xc_resume.c => guest/xg_resume.c}   |  1 +
 5 files changed, 64 insertions(+), 64 deletions(-)
 rename tools/libs/{ctrl/xc_resume.c => guest/xg_resume.c} (99%)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 58d3377d6a..2a7c836a02 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -576,69 +576,6 @@ int xc_domain_destroy(xc_interface *xch,
                       uint32_t domid);
 
 
-/**
- * This function resumes a suspended domain. The domain should have
- * been previously suspended.
- *
- * Note that there are 'xc_domain_suspend' as suspending a domain
- * is quite the endeavour.
- *
- * For the purpose of this explanation there are three guests:
- * PV (using hypercalls for privilgied operations), HVM
- * (fully hardware virtualized guests using emulated devices for everything),
- * and PVHVM (PV aware with hardware virtualisation).
- *
- * HVM guest are the simplest - they suspend via S3 / S4 and resume from
- * S3 / S4. Upon resume they have to re-negotiate with the emulated devices.
- *
- * PV and PVHVM communicate via hypercalls for suspend (and resume).
- * For suspend the toolstack initiates the process by writing an value
- * in XenBus "control/shutdown" with the string "suspend".
- *
- * The PV guest stashes anything it deems neccessary in 'struct
- * start_info' in case of failure (PVHVM may ignore this) and calls
- * the SCHEDOP_shutdown::SHUTDOWN_suspend hypercall (for PV as
- * argument it passes the MFN to 'struct start_info').
- *
- * And then the guest is suspended.
- *
- * The checkpointing or notifying a guest that the suspend failed or
- * cancelled (in case of checkpoint) is by having the
- * SCHEDOP_shutdown::SHUTDOWN_suspend hypercall return a non-zero
- * value.
- *
- * The PV and PVHVM resume path are similar. For PV it would be
- * similar to bootup - figure out where the 'struct start_info' is (or
- * if the suspend was cancelled aka checkpointed - reuse the saved
- * values).
- *
- * From here on they differ depending whether the guest is PV or PVHVM
- * in specifics but follow overall the same path:
- *  - PV: Bringing up the vCPUS,
- *  - PVHVM: Setup vector callback,
- *  - Bring up vCPU runstates,
- *  - Remap the grant tables if checkpointing or setup from scratch,
- *
- *
- * If the resume was not checkpointing (or if suspend was succesful) we would
- * setup the PV timers and the different PV events. Lastly the PV drivers
- * re-negotiate with the backend.
- *
- * This function would return before the guest started resuming. That is
- * the guest would be in non-running state and its vCPU context would be
- * in the the SCHEDOP_shutdown::SHUTDOWN_suspend hypercall return path
- * (for PV and PVHVM). For HVM it would be in would be in QEMU emulated
- * BIOS handling S3 suspend.
- *
- * @parm xch a handle to an open hypervisor interface
- * @parm domid the domain id to resume
- * @parm fast use cooperative resume (guest must support this)
- * return 0 on success, -1 on failure
- */
-int xc_domain_resume(xc_interface *xch,
-		     uint32_t domid,
-		     int fast);
-
 /**
  * This function will shutdown a domain. This is intended for use in
  * fully-virtualized domains where this operation is analogous to the
diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index f9fb0449ad..61d0a82f48 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -689,6 +689,68 @@ int xc_query_page_offline_status(xc_interface *xch, unsigned long start,
 
 int xc_exchange_page(xc_interface *xch, uint32_t domid, xen_pfn_t mfn);
 
+/**
+ * This function resumes a suspended domain. The domain should have
+ * been previously suspended.
+ *
+ * Note that there are 'xc_domain_suspend' as suspending a domain
+ * is quite the endeavour.
+ *
+ * For the purpose of this explanation there are three guests:
+ * PV (using hypercalls for privilgied operations), HVM
+ * (fully hardware virtualized guests using emulated devices for everything),
+ * and PVHVM (PV aware with hardware virtualisation).
+ *
+ * HVM guest are the simplest - they suspend via S3 / S4 and resume from
+ * S3 / S4. Upon resume they have to re-negotiate with the emulated devices.
+ *
+ * PV and PVHVM communicate via hypercalls for suspend (and resume).
+ * For suspend the toolstack initiates the process by writing an value
+ * in XenBus "control/shutdown" with the string "suspend".
+ *
+ * The PV guest stashes anything it deems neccessary in 'struct
+ * start_info' in case of failure (PVHVM may ignore this) and calls
+ * the SCHEDOP_shutdown::SHUTDOWN_suspend hypercall (for PV as
+ * argument it passes the MFN to 'struct start_info').
+ *
+ * And then the guest is suspended.
+ *
+ * The checkpointing or notifying a guest that the suspend failed or
+ * cancelled (in case of checkpoint) is by having the
+ * SCHEDOP_shutdown::SHUTDOWN_suspend hypercall return a non-zero
+ * value.
+ *
+ * The PV and PVHVM resume path are similar. For PV it would be
+ * similar to bootup - figure out where the 'struct start_info' is (or
+ * if the suspend was cancelled aka checkpointed - reuse the saved
+ * values).
+ *
+ * From here on they differ depending whether the guest is PV or PVHVM
+ * in specifics but follow overall the same path:
+ *  - PV: Bringing up the vCPUS,
+ *  - PVHVM: Setup vector callback,
+ *  - Bring up vCPU runstates,
+ *  - Remap the grant tables if checkpointing or setup from scratch,
+ *
+ *
+ * If the resume was not checkpointing (or if suspend was succesful) we would
+ * setup the PV timers and the different PV events. Lastly the PV drivers
+ * re-negotiate with the backend.
+ *
+ * This function would return before the guest started resuming. That is
+ * the guest would be in non-running state and its vCPU context would be
+ * in the the SCHEDOP_shutdown::SHUTDOWN_suspend hypercall return path
+ * (for PV and PVHVM). For HVM it would be in would be in QEMU emulated
+ * BIOS handling S3 suspend.
+ *
+ * @parm xch a handle to an open hypervisor interface
+ * @parm domid the domain id to resume
+ * @parm fast use cooperative resume (guest must support this)
+ * return 0 on success, -1 on failure
+ */
+int xc_domain_resume(xc_interface *xch,
+                     uint32_t domid,
+                     int fast);
 
 /**
  * Memory related information, such as PFN types, the P2M table,
diff --git a/tools/libs/ctrl/Makefile b/tools/libs/ctrl/Makefile
index ce9ecae710..fbeb3a3537 100644
--- a/tools/libs/ctrl/Makefile
+++ b/tools/libs/ctrl/Makefile
@@ -20,7 +20,6 @@ SRCS-y       += xc_rt.c
 SRCS-y       += xc_tbuf.c
 SRCS-y       += xc_pm.c
 SRCS-y       += xc_cpu_hotplug.c
-SRCS-y       += xc_resume.c
 SRCS-y       += xc_vm_event.c
 SRCS-y       += xc_vmtrace.c
 SRCS-y       += xc_monitor.c
diff --git a/tools/libs/guest/Makefile b/tools/libs/guest/Makefile
index 6d2a1d5bbc..2a2323ff09 100644
--- a/tools/libs/guest/Makefile
+++ b/tools/libs/guest/Makefile
@@ -9,6 +9,7 @@ endif
 SRCS-y += xg_private.c
 SRCS-y += xg_domain.c
 SRCS-y += xg_suspend.c
+SRCS-y += xg_resume.c
 ifeq ($(CONFIG_MIGRATE),y)
 SRCS-y += xg_sr_common.c
 SRCS-$(CONFIG_X86) += xg_sr_common_x86.c
diff --git a/tools/libs/ctrl/xc_resume.c b/tools/libs/guest/xg_resume.c
similarity index 99%
rename from tools/libs/ctrl/xc_resume.c
rename to tools/libs/guest/xg_resume.c
index e3c8e83aa9..3bdefb2eef 100644
--- a/tools/libs/ctrl/xc_resume.c
+++ b/tools/libs/guest/xg_resume.c
@@ -14,6 +14,7 @@
  */
 
 #include "xc_private.h"
+#include "xenguest.h"
 
 #if defined(__i386__) || defined(__x86_64__)
 
-- 
2.26.2


