Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C7A214EB9
	for <lists+xen-devel@lfdr.de>; Sun,  5 Jul 2020 20:56:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1js9np-0005bl-2M; Sun, 05 Jul 2020 18:55:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NZHG=AQ=cert.pl=michal.leszczynski@srs-us1.protection.inumbo.net>)
 id 1js9nn-0005bb-Sy
 for xen-devel@lists.xenproject.org; Sun, 05 Jul 2020 18:55:47 +0000
X-Inumbo-ID: 2245a02e-bef1-11ea-8c02-12813bfff9fa
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2245a02e-bef1-11ea-8c02-12813bfff9fa;
 Sun, 05 Jul 2020 18:55:46 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 7B4FCA2046;
 Sun,  5 Jul 2020 20:55:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 71C8EA203D;
 Sun,  5 Jul 2020 20:55:44 +0200 (CEST)
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id LpZ0XIP1sjKn; Sun,  5 Jul 2020 20:55:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id EDFC8A1F8E;
 Sun,  5 Jul 2020 20:55:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id arBBim_pQi6z; Sun,  5 Jul 2020 20:55:43 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id B14CFA1FE9;
 Sun,  5 Jul 2020 20:55:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 9D6C822C09;
 Sun,  5 Jul 2020 20:55:13 +0200 (CEST)
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id IIeWzElhpfKb; Sun,  5 Jul 2020 20:55:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 27D5422C11;
 Sun,  5 Jul 2020 20:55:08 +0200 (CEST)
X-Quarantine-ID: <U7Rxn7a5967L>
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id U7Rxn7a5967L; Sun,  5 Jul 2020 20:55:08 +0200 (CEST)
Received: from mq-desktop.cert.pl (unknown [195.187.238.217])
 by belindir.nask.net.pl (Postfix) with ESMTPSA id EDAC622C06;
 Sun,  5 Jul 2020 20:55:07 +0200 (CEST)
From: =?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v5 04/11] common: add vmtrace_pt_size domain parameter
Date: Sun,  5 Jul 2020 20:54:57 +0200
Message-Id: <5d52b37e391a4165dc3775f77a621d34a33d22c2.1593974333.git.michal.leszczynski@cert.pl>
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

Add vmtrace_pt_size domain parameter in live domain and
vmtrace_pt_order parameter in xen_domctl_createdomain.

Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
---
 xen/common/domain.c         | 12 ++++++++++++
 xen/include/public/domctl.h |  1 +
 xen/include/xen/sched.h     |  4 ++++
 3 files changed, 17 insertions(+)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index a45cf023f7..25d3359c5b 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -338,6 +338,12 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
         return -EINVAL;
     }
 
+    if ( config->vmtrace_pt_order && !vmtrace_supported )
+    {
+        dprintk(XENLOG_INFO, "Processor tracing is not supported\n");
+        return -EINVAL;
+    }
+
     return arch_sanitise_domain_config(config);
 }
 
@@ -443,6 +449,12 @@ struct domain *domain_create(domid_t domid,
         d->nr_pirqs = min(d->nr_pirqs, nr_irqs);
 
         radix_tree_init(&d->pirq_tree);
+
+        if ( config->vmtrace_pt_order )
+        {
+            uint32_t shift_val = config->vmtrace_pt_order + PAGE_SHIFT;
+            d->vmtrace_pt_size = (1ULL << shift_val);
+        }
     }
 
     if ( (err = arch_domain_create(d, config)) != 0 )
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 59bdc28c89..7b8289d436 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -92,6 +92,7 @@ struct xen_domctl_createdomain {
     uint32_t max_evtchn_port;
     int32_t max_grant_frames;
     int32_t max_maptrack_frames;
+    uint8_t vmtrace_pt_order;
 
     struct xen_arch_domainconfig arch;
 };
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index ac53519d7f..48f0a61bbd 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -457,6 +457,10 @@ struct domain
     unsigned    pbuf_idx;
     spinlock_t  pbuf_lock;
 
+    /* Used by vmtrace features */
+    spinlock_t  vmtrace_lock;
+    uint64_t    vmtrace_pt_size;
+
     /* OProfile support. */
     struct xenoprof *xenoprof;
 
-- 
2.17.1


