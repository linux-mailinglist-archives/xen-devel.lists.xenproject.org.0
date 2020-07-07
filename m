Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B490221780B
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jul 2020 21:40:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jstSE-0007ay-Ud; Tue, 07 Jul 2020 19:40:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CHg+=AS=cert.pl=michal.leszczynski@srs-us1.protection.inumbo.net>)
 id 1jstSD-0007ao-01
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2020 19:40:33 +0000
X-Inumbo-ID: b7d032be-c089-11ea-bb8b-bc764e2007e4
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b7d032be-c089-11ea-bb8b-bc764e2007e4;
 Tue, 07 Jul 2020 19:40:32 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 0E816A2675;
 Tue,  7 Jul 2020 21:40:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 06A92A2691;
 Tue,  7 Jul 2020 21:40:30 +0200 (CEST)
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id fcq4hya3Rxz7; Tue,  7 Jul 2020 21:40:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 8CFE0A261F;
 Tue,  7 Jul 2020 21:40:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id SD8nyO5q28Qn; Tue,  7 Jul 2020 21:40:29 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 5986AA2647;
 Tue,  7 Jul 2020 21:40:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 3AE5A22383;
 Tue,  7 Jul 2020 21:39:59 +0200 (CEST)
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id kvb5TwRL8e28; Tue,  7 Jul 2020 21:39:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id ACE342242F;
 Tue,  7 Jul 2020 21:39:53 +0200 (CEST)
X-Quarantine-ID: <8p2776uf7EM3>
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 8p2776uf7EM3; Tue,  7 Jul 2020 21:39:53 +0200 (CEST)
Received: from mq-desktop.cert.pl (unknown [195.187.238.217])
 by belindir.nask.net.pl (Postfix) with ESMTPSA id 6C40922303;
 Tue,  7 Jul 2020 21:39:53 +0200 (CEST)
From: =?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v6 04/11] common: add vmtrace_pt_size domain parameter
Date: Tue,  7 Jul 2020 21:39:43 +0200
Message-Id: <036bc768bfb074269d9bd4530304a11170b7142d.1594150543.git.michal.leszczynski@cert.pl>
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
 tamas.lengyel@intel.com,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Michal Leszczynski <michal.leszczynski@cert.pl>

Add vmtrace_pt_size domain parameter in live domain and
vmtrace_pt_order parameter in xen_domctl_createdomain.

Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
---
 xen/arch/x86/domain.c       | 6 ++++++
 xen/common/domain.c         | 9 +++++++++
 xen/include/public/domctl.h | 1 +
 xen/include/xen/sched.h     | 3 +++
 4 files changed, 19 insertions(+)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index fee6c3931a..b75017b28b 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -499,6 +499,12 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
          */
         config->flags |= XEN_DOMCTL_CDF_oos_off;
 
+    if ( !hvm && config->processor_trace_buf_kb )
+    {
+        dprintk(XENLOG_INFO, "Processor trace is not supported on non-HVM\n");
+        return -EINVAL;
+    }
+
     return 0;
 }
 
diff --git a/xen/common/domain.c b/xen/common/domain.c
index a45cf023f7..e6e8f88da1 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -338,6 +338,12 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
         return -EINVAL;
     }
 
+    if ( config->processor_trace_buf_kb && !vmtrace_supported )
+    {
+        dprintk(XENLOG_INFO, "Processor tracing is not supported\n");
+        return -EINVAL;
+    }
+
     return arch_sanitise_domain_config(config);
 }
 
@@ -443,6 +449,9 @@ struct domain *domain_create(domid_t domid,
         d->nr_pirqs = min(d->nr_pirqs, nr_irqs);
 
         radix_tree_init(&d->pirq_tree);
+
+        if ( config->processor_trace_buf_kb )
+            d->processor_trace_buf_kb = config->processor_trace_buf_kb;
     }
 
     if ( (err = arch_domain_create(d, config)) != 0 )
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 59bdc28c89..7681675a94 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -92,6 +92,7 @@ struct xen_domctl_createdomain {
     uint32_t max_evtchn_port;
     int32_t max_grant_frames;
     int32_t max_maptrack_frames;
+    uint32_t processor_trace_buf_kb;
 
     struct xen_arch_domainconfig arch;
 };
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index ac53519d7f..c046e59886 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -457,6 +457,9 @@ struct domain
     unsigned    pbuf_idx;
     spinlock_t  pbuf_lock;
 
+    /* Used by vmtrace features */
+    uint32_t    processor_trace_buf_kb;
+
     /* OProfile support. */
     struct xenoprof *xenoprof;
 
-- 
2.17.1


