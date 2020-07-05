Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 845F5214EC1
	for <lists+xen-devel@lfdr.de>; Sun,  5 Jul 2020 20:56:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1js9of-00062x-Jh; Sun, 05 Jul 2020 18:56:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NZHG=AQ=cert.pl=michal.leszczynski@srs-us1.protection.inumbo.net>)
 id 1js9od-0005m2-Vo
 for xen-devel@lists.xenproject.org; Sun, 05 Jul 2020 18:56:40 +0000
X-Inumbo-ID: 377be142-bef1-11ea-bca7-bc764e2007e4
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 377be142-bef1-11ea-bca7-bc764e2007e4;
 Sun, 05 Jul 2020 18:56:22 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 2C467A2026;
 Sun,  5 Jul 2020 20:56:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 097FAA209C;
 Sun,  5 Jul 2020 20:56:15 +0200 (CEST)
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id GXBBdrOICLwb; Sun,  5 Jul 2020 20:56:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id D1102A2081;
 Sun,  5 Jul 2020 20:56:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id xK-_YHP_09Yc; Sun,  5 Jul 2020 20:56:14 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id AE4C1A1F8E;
 Sun,  5 Jul 2020 20:56:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 1240F22C13;
 Sun,  5 Jul 2020 20:55:19 +0200 (CEST)
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id KA1JC6HJHzTN; Sun,  5 Jul 2020 20:55:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 8423C22C1E;
 Sun,  5 Jul 2020 20:55:08 +0200 (CEST)
X-Quarantine-ID: <p10_anPoB9eT>
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id p10_anPoB9eT; Sun,  5 Jul 2020 20:55:08 +0200 (CEST)
Received: from mq-desktop.cert.pl (unknown [195.187.238.217])
 by belindir.nask.net.pl (Postfix) with ESMTPSA id 538CB2295A;
 Sun,  5 Jul 2020 20:55:08 +0200 (CEST)
From: =?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v5 08/11] x86/mm: add vmtrace_buf resource type
Date: Sun,  5 Jul 2020 20:55:01 +0200
Message-Id: <a306c4811973d80c83f1cb46cdbef1aa54ac6379.1593974333.git.michal.leszczynski@cert.pl>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593974333.git.michal.leszczynski@cert.pl>
References: <cover.1593974333.git.michal.leszczynski@cert.pl>
In-Reply-To: <cover.1593974333.git.michal.leszczynski@cert.pl>
References: <cover.1593974333.git.michal.leszczynski@cert.pl>
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
 xen/common/memory.c         | 28 ++++++++++++++++++++++++++++
 xen/include/public/memory.h |  1 +
 2 files changed, 29 insertions(+)

diff --git a/xen/common/memory.c b/xen/common/memory.c
index eb42f883df..04f4e152c0 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1007,6 +1007,29 @@ static long xatp_permission_check(struct domain *d, unsigned int space)
     return xsm_add_to_physmap(XSM_TARGET, current->domain, d);
 }
 
+static int acquire_vmtrace_buf(struct domain *d, unsigned int id,
+                               unsigned long frame,
+                               unsigned int nr_frames,
+                               xen_pfn_t mfn_list[])
+{
+    mfn_t mfn;
+    unsigned int i;
+    struct vcpu *v = domain_vcpu(d, id);
+
+    if ( !v || !v->vmtrace.pt_buf )
+        return -EINVAL;
+
+    mfn = page_to_mfn(v->vmtrace.pt_buf);
+
+    if ( frame + nr_frames > (v->domain->vmtrace_pt_size >> PAGE_SHIFT) )
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
@@ -1117,6 +1140,11 @@ static int acquire_resource(
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


