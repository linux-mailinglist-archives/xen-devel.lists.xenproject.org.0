Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C2620F4C4
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2020 14:35:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqFUJ-00086Z-J1; Tue, 30 Jun 2020 12:35:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f/Ev=AL=cert.pl=michal.leszczynski@srs-us1.protection.inumbo.net>)
 id 1jqFUH-00084u-6R
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2020 12:35:45 +0000
X-Inumbo-ID: 36959ab0-bace-11ea-8610-12813bfff9fa
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 36959ab0-bace-11ea-8610-12813bfff9fa;
 Tue, 30 Jun 2020 12:35:43 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id A9886A3800;
 Tue, 30 Jun 2020 14:35:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id A711FA3802;
 Tue, 30 Jun 2020 14:35:41 +0200 (CEST)
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id JziU2kPEFnPj; Tue, 30 Jun 2020 14:35:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 3D95EA37FE;
 Tue, 30 Jun 2020 14:35:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 0-sn10WueO7f; Tue, 30 Jun 2020 14:35:41 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 1A422A37F8;
 Tue, 30 Jun 2020 14:35:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 016AA223C3;
 Tue, 30 Jun 2020 14:34:46 +0200 (CEST)
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id vlc-Ku5jd70r; Tue, 30 Jun 2020 14:34:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 94DB822591;
 Tue, 30 Jun 2020 14:34:40 +0200 (CEST)
X-Quarantine-ID: <gWn4M7wYhlp7>
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id gWn4M7wYhlp7; Tue, 30 Jun 2020 14:34:40 +0200 (CEST)
Received: from mq-desktop.cert.pl (unknown [195.187.238.217])
 by belindir.nask.net.pl (Postfix) with ESMTPSA id 72A7622564;
 Tue, 30 Jun 2020 14:34:40 +0200 (CEST)
From: =?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v4 07/10] x86/mm: add vmtrace_buf resource type
Date: Tue, 30 Jun 2020 14:33:50 +0200
Message-Id: <2446caa5be5eca36f0b5ca47d2edcbd6f7792484.1593519420.git.michal.leszczynski@cert.pl>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593519420.git.michal.leszczynski@cert.pl>
References: <cover.1593519420.git.michal.leszczynski@cert.pl>
In-Reply-To: <cover.1593519420.git.michal.leszczynski@cert.pl>
References: <cover.1593519420.git.michal.leszczynski@cert.pl>
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
 tamas.lengyel@intel.com, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Leszczynski <michal.leszczynski@cert.pl>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 luwei.kang@intel.com,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Michal Leszczynski <michal.leszczynski@cert.pl>

Allow to map processor trace buffer using
acquire_resource().

Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
---
 xen/arch/x86/mm.c           | 25 +++++++++++++++++++++++++
 xen/include/public/memory.h |  1 +
 2 files changed, 26 insertions(+)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index e376fc7e8f..bb781bd90c 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -4624,6 +4624,31 @@ int arch_acquire_resource(struct domain *d, unsigned int type,
         }
         break;
     }
+
+    case XENMEM_resource_vmtrace_buf:
+    {
+        mfn_t mfn;
+        unsigned int i;
+        struct vcpu *v = domain_vcpu(d, id);
+        rc = -EINVAL;
+
+        if ( !v )
+            break;
+
+        if ( !v->arch.vmtrace.pt_buf )
+            break;
+
+        mfn = page_to_mfn(v->arch.vmtrace.pt_buf);
+
+        if ( frame + nr_frames > (v->domain->vmtrace_pt_size >> PAGE_SHIFT) )
+            break;
+
+        rc = 0;
+        for ( i = 0; i < nr_frames; i++ )
+            mfn_list[i] = mfn_x(mfn_add(mfn, frame + i));
+
+        break;
+    }
 #endif
 
     default:
diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
index dbd35305df..f823c784c3 100644
--- a/xen/include/public/memory.h
+++ b/xen/include/public/memory.h
@@ -620,6 +620,7 @@ struct xen_mem_acquire_resource {
 
 #define XENMEM_resource_ioreq_server 0
 #define XENMEM_resource_grant_table 1
+#define XENMEM_resource_vmtrace_buf 2
 
     /*
      * IN - a type-specific resource identifier, which must be zero
-- 
2.20.1


