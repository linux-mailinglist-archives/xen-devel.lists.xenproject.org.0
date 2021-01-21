Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C812FF731
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 22:27:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72426.130427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2hUd-0005Bw-6t; Thu, 21 Jan 2021 21:27:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72426.130427; Thu, 21 Jan 2021 21:27:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2hUc-0005Av-TM; Thu, 21 Jan 2021 21:27:50 +0000
Received: by outflank-mailman (input) for mailman id 72426;
 Thu, 21 Jan 2021 21:27:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rOiS=GY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l2hUb-0004xj-DS
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 21:27:49 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 16cfb996-d4fd-4070-967c-4b157110cdd2;
 Thu, 21 Jan 2021 21:27:39 +0000 (UTC)
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
X-Inumbo-ID: 16cfb996-d4fd-4070-967c-4b157110cdd2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611264459;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=r2BwqWd7NQ1mzdR8kM1P36wwz2HedhnLfyw+QNKXGLk=;
  b=TT+KlL9d549HqmUOYL54KqyoreABqNFyTQ0xkEXO8Zhi381f23Dz8WH8
   4XHTBqtDvypKFV9ZCILd5vsnRS/BdgFLwiogNhzFCBM2q+Rbdwjxbcj+q
   UqF31vb0LApI0fXXtxCrYsxlKMquN0wAOVsGvb6uaE5XVyUlPaIp6iJeP
   g=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: rgTHx5nwswuWivY0m9MruSK+ZqPzFzwki2x7fihnbWKj1XiBOOjkjfF/9PaRER3ClVBodvFDKw
 H2Yi8JNq5TGHeGeANl2hIzHIirx+cox+DoLIoC+OM4ofK6s7AlA6RHNiP0tFjXNG98DuI8YQQx
 nTcm4Ck0AJPV3MThKebFhsnz9aYcNTRMHYqcPXBIAg9HHN2rWbWFfNgP/9Ow54QFbeGFy/czpR
 e8BnR2XXlYOc8TDGRWpvYl9sebMArpiHAB36ggFYIVfDw0VO1rNP77Qt//XPeRaNKf9o6+u3VG
 Ey0=
X-SBRS: 5.1
X-MesageID: 35815974
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,365,1602561600"; 
   d="scan'208";a="35815974"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>
Subject: [PATCH v7 04/10] xen/memory: Add a vmtrace_buf resource type
Date: Thu, 21 Jan 2021 21:27:12 +0000
Message-ID: <20210121212718.2441-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210121212718.2441-1-andrew.cooper3@citrix.com>
References: <20210121212718.2441-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Michał Leszczyński <michal.leszczynski@cert.pl>

Allow to map processor trace buffer using acquire_resource().

Signed-off-by: Michał Leszczyński <michal.leszczynski@cert.pl>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Michał Leszczyński <michal.leszczynski@cert.pl>
CC: Tamas K Lengyel <tamas@tklengyel.com>

v7:
 * Rebase over changes elsewhere in the series
---
 xen/common/memory.c         | 27 +++++++++++++++++++++++++++
 xen/include/public/memory.h |  1 +
 2 files changed, 28 insertions(+)

diff --git a/xen/common/memory.c b/xen/common/memory.c
index c89923d909..ec6a55172a 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1068,11 +1068,35 @@ static unsigned int resource_max_frames(const struct domain *d,
     case XENMEM_resource_grant_table:
         return gnttab_resource_max_frames(d, id);
 
+    case XENMEM_resource_vmtrace_buf:
+        return d->vmtrace_frames;
+
     default:
         return arch_resource_max_frames(d, type, id);
     }
 }
 
+static int acquire_vmtrace_buf(
+    struct domain *d, unsigned int id, unsigned long frame,
+    unsigned int nr_frames, xen_pfn_t mfn_list[])
+{
+    const struct vcpu *v = domain_vcpu(d, id);
+    unsigned int i;
+    mfn_t mfn;
+
+    if ( !v || !v->vmtrace.buf ||
+         nr_frames > d->vmtrace_frames ||
+         (frame + nr_frames) > d->vmtrace_frames )
+        return -EINVAL;
+
+    mfn = page_to_mfn(v->vmtrace.buf);
+
+    for ( i = 0; i < nr_frames; i++ )
+        mfn_list[i] = mfn_x(mfn) + frame + i;
+
+    return nr_frames;
+}
+
 /*
  * Returns -errno on error, or positive in the range [1, nr_frames] on
  * success.  Returning less than nr_frames contitutes a request for a
@@ -1087,6 +1111,9 @@ static int _acquire_resource(
     case XENMEM_resource_grant_table:
         return gnttab_acquire_resource(d, id, frame, nr_frames, mfn_list);
 
+    case XENMEM_resource_vmtrace_buf:
+        return acquire_vmtrace_buf(d, id, frame, nr_frames, mfn_list);
+
     default:
         return arch_acquire_resource(d, type, id, frame, nr_frames, mfn_list);
     }
diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
index c4c47a0b38..b0378bb14b 100644
--- a/xen/include/public/memory.h
+++ b/xen/include/public/memory.h
@@ -625,6 +625,7 @@ struct xen_mem_acquire_resource {
 
 #define XENMEM_resource_ioreq_server 0
 #define XENMEM_resource_grant_table 1
+#define XENMEM_resource_vmtrace_buf 2
 
     /*
      * IN - a type-specific resource identifier, which must be zero
-- 
2.11.0


