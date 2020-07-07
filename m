Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4161217811
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jul 2020 21:41:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jstSj-0007oG-SD; Tue, 07 Jul 2020 19:41:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CHg+=AS=cert.pl=michal.leszczynski@srs-us1.protection.inumbo.net>)
 id 1jstSj-0007no-23
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2020 19:41:05 +0000
X-Inumbo-ID: c98e3e7e-c089-11ea-8de3-12813bfff9fa
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c98e3e7e-c089-11ea-8de3-12813bfff9fa;
 Tue, 07 Jul 2020 19:41:02 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id E789EA26AF;
 Tue,  7 Jul 2020 21:41:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id E4FA5A2675;
 Tue,  7 Jul 2020 21:40:59 +0200 (CEST)
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id tpwVciS3kWfD; Tue,  7 Jul 2020 21:40:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 79919A26A3;
 Tue,  7 Jul 2020 21:40:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id R9EPWexH40j8; Tue,  7 Jul 2020 21:40:59 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 4FFA3A261F;
 Tue,  7 Jul 2020 21:40:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id BEE562247F;
 Tue,  7 Jul 2020 21:40:04 +0200 (CEST)
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id fYEdaYTL948b; Tue,  7 Jul 2020 21:39:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 0B00922456;
 Tue,  7 Jul 2020 21:39:54 +0200 (CEST)
X-Quarantine-ID: <hw4v3GfJxCBR>
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id hw4v3GfJxCBR; Tue,  7 Jul 2020 21:39:53 +0200 (CEST)
Received: from mq-desktop.cert.pl (unknown [195.187.238.217])
 by belindir.nask.net.pl (Postfix) with ESMTPSA id CD26022303;
 Tue,  7 Jul 2020 21:39:53 +0200 (CEST)
From: =?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v6 08/11] x86/mm: add vmtrace_buf resource type
Date: Tue,  7 Jul 2020 21:39:47 +0200
Message-Id: <2129d21e7ef7e960951a8baafab01d9392dff8f3.1594150543.git.michal.leszczynski@cert.pl>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594150543.git.michal.leszczynski@cert.pl>
References: <cover.1594150543.git.michal.leszczynski@cert.pl>
In-Reply-To: <cover.1594150543.git.michal.leszczynski@cert.pl>
References: <cover.1594150543.git.michal.leszczynski@cert.pl>
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 luwei.kang@intel.com, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Leszczynski <michal.leszczynski@cert.pl>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 tamas.lengyel@intel.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Michal Leszczynski <michal.leszczynski@cert.pl>

Allow to map processor trace buffer using
acquire_resource().

Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
---
 xen/common/memory.c         | 31 +++++++++++++++++++++++++++++++
 xen/include/public/memory.h |  1 +
 2 files changed, 32 insertions(+)

diff --git a/xen/common/memory.c b/xen/common/memory.c
index eb42f883df..c0a22eb60f 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1007,6 +1007,32 @@ static long xatp_permission_check(struct domain *d, unsigned int space)
     return xsm_add_to_physmap(XSM_TARGET, current->domain, d);
 }
 
+static int acquire_vmtrace_buf(struct domain *d, unsigned int id,
+                               uint64_t frame,
+                               uint64_t nr_frames,
+                               xen_pfn_t mfn_list[])
+{
+    mfn_t mfn;
+    unsigned int i;
+    uint64_t size;
+    struct vcpu *v = domain_vcpu(d, id);
+
+    if ( !v || !v->vmtrace.pt_buf )
+        return -EINVAL;
+
+    mfn = page_to_mfn(v->vmtrace.pt_buf);
+    size = v->domain->processor_trace_buf_kb * KB(1);
+
+    if ( (frame > (size >> PAGE_SHIFT)) ||
+         (nr_frames > ((size >> PAGE_SHIFT) - frame)) )
+        return -EINVAL;
+
+    for ( i = 0; i < nr_frames; i++ )
+        mfn_list[i] = mfn_x(mfn_add(mfn, frame + i));
+
+    return 0;
+}
+
 static int acquire_grant_table(struct domain *d, unsigned int id,
                                unsigned long frame,
                                unsigned int nr_frames,
@@ -1117,6 +1143,11 @@ static int acquire_resource(
                                  mfn_list);
         break;
 
+    case XENMEM_resource_vmtrace_buf:
+        rc = acquire_vmtrace_buf(d, xmar.id, xmar.frame, xmar.nr_frames,
+                                 mfn_list);
+        break;
+
     default:
         rc = arch_acquire_resource(d, xmar.type, xmar.id, xmar.frame,
                                    xmar.nr_frames, mfn_list);
diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
index 21057ed78e..f4c905a10e 100644
--- a/xen/include/public/memory.h
+++ b/xen/include/public/memory.h
@@ -625,6 +625,7 @@ struct xen_mem_acquire_resource {
 
 #define XENMEM_resource_ioreq_server 0
 #define XENMEM_resource_grant_table 1
+#define XENMEM_resource_vmtrace_buf 2
 
     /*
      * IN - a type-specific resource identifier, which must be zero
-- 
2.17.1


