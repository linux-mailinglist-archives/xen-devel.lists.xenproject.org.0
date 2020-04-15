Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EC21A978F
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 10:53:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOdnj-0001xo-N2; Wed, 15 Apr 2020 08:53:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UoJL=57=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jOdni-0001xY-1F
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 08:53:42 +0000
X-Inumbo-ID: 9a9864fc-7ef6-11ea-9e09-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9a9864fc-7ef6-11ea-9e09-bc764e2007e4;
 Wed, 15 Apr 2020 08:53:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 80423AF92;
 Wed, 15 Apr 2020 08:53:39 +0000 (UTC)
Subject: [PATCH 3/3] xenoprof: limit scope of types and #define-s
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <25c5b76f-4f95-3ba9-0ae0-dd0c1f3f8496@suse.com>
Message-ID: <61ac5f46-fd43-e173-202e-9de46755d604@suse.com>
Date: Wed, 15 Apr 2020 10:53:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <25c5b76f-4f95-3ba9-0ae0-dd0c1f3f8496@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Quite a few of the items are used by xenoprof.c only, so move them there
to limit their visibility as well as the amount of re-building needed in
case of changes. Also drop the inclusion of the public header there.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/oprofile/nmi_int.c
+++ b/xen/arch/x86/oprofile/nmi_int.c
@@ -19,7 +19,7 @@
 #include <xen/string.h>
 #include <xen/delay.h>
 #include <xen/xenoprof.h>
-#include <public/xen.h>
+#include <public/xenoprof.h>
 #include <asm/msr.h>
 #include <asm/apic.h>
 #include <asm/regs.h>
--- a/xen/common/xenoprof.c
+++ b/xen/common/xenoprof.c
@@ -23,6 +23,32 @@
 #undef virt_to_mfn
 #define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
 
+#define XENOPROF_DOMAIN_IGNORED    0
+#define XENOPROF_DOMAIN_ACTIVE     1
+#define XENOPROF_DOMAIN_PASSIVE    2
+
+#define XENOPROF_IDLE              0
+#define XENOPROF_INITIALIZED       1
+#define XENOPROF_COUNTERS_RESERVED 2
+#define XENOPROF_READY             3
+#define XENOPROF_PROFILING         4
+
+#ifndef CONFIG_COMPAT
+#define XENOPROF_COMPAT(x) false
+typedef struct xenoprof_buf xenoprof_buf_t;
+#define xenoprof_buf(d, b, field) ACCESS_ONCE((b)->field)
+#else
+#include <compat/xenoprof.h>
+#define XENOPROF_COMPAT(x) ((x)->is_compat)
+typedef union {
+    struct xenoprof_buf native;
+    struct compat_oprof_buf compat;
+} xenoprof_buf_t;
+#define xenoprof_buf(d, b, field) ACCESS_ONCE(*(!(d)->xenoprof->is_compat \
+                                                ? &(b)->native.field \
+                                                : &(b)->compat.field))
+#endif
+
 /* Limit amount of pages used for shared buffer (per domain) */
 #define MAX_OPROF_SHARED_PAGES 32
 
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -29,6 +29,7 @@
 #include <public/platform.h>
 #include <public/version.h>
 #include <public/hvm/params.h>
+#include <public/xenoprof.h>
 #include <public/xsm/flask_op.h>
 
 #include <avc.h>
--- a/xen/include/asm-x86/xenoprof.h
+++ b/xen/include/asm-x86/xenoprof.h
@@ -26,6 +26,8 @@ struct vcpu;
 
 #ifdef CONFIG_XENOPROF
 
+#include <public/xen.h>
+
 int nmi_reserve_counters(void);
 int nmi_setup_events(void);
 int nmi_enable_virq(void);
--- a/xen/include/xen/xenoprof.h
+++ b/xen/include/xen/xenoprof.h
@@ -11,7 +11,6 @@
 #define __XEN_XENOPROF_H__
 
 #include <xen/inttypes.h>
-#include <public/xenoprof.h>
 #include <asm/xenoprof.h>
 
 #define PMU_OWNER_NONE          0
@@ -20,37 +19,9 @@
 
 #ifdef CONFIG_XENOPROF
 
-#define XENOPROF_DOMAIN_IGNORED    0
-#define XENOPROF_DOMAIN_ACTIVE     1
-#define XENOPROF_DOMAIN_PASSIVE    2
-
-#define XENOPROF_IDLE              0
-#define XENOPROF_INITIALIZED       1
-#define XENOPROF_COUNTERS_RESERVED 2
-#define XENOPROF_READY             3
-#define XENOPROF_PROFILING         4
-
-#ifndef CONFIG_COMPAT
-typedef struct xenoprof_buf xenoprof_buf_t;
-#else
-#include <compat/xenoprof.h>
-typedef union {
-	struct xenoprof_buf native;
-	struct compat_oprof_buf compat;
-} xenoprof_buf_t;
-#endif
-
-#ifndef CONFIG_COMPAT
-#define XENOPROF_COMPAT(x) 0
-#define xenoprof_buf(d, b, field) ACCESS_ONCE((b)->field)
-#else
-#define XENOPROF_COMPAT(x) ((x)->is_compat)
-#define xenoprof_buf(d, b, field) ACCESS_ONCE(*(!(d)->xenoprof->is_compat \
-                                                ? &(b)->native.field \
-                                                : &(b)->compat.field))
-#endif
-
 struct domain;
+struct vcpu;
+struct cpu_user_regs;
 
 int acquire_pmu_ownership(int pmu_ownership);
 void release_pmu_ownership(int pmu_ownership);


