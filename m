Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A16630B377
	for <lists+xen-devel@lfdr.de>; Tue,  2 Feb 2021 00:27:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80190.146509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6ibb-0007U7-SN; Mon, 01 Feb 2021 23:27:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80190.146509; Mon, 01 Feb 2021 23:27:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6ibb-0007TU-Mi; Mon, 01 Feb 2021 23:27:39 +0000
Received: by outflank-mailman (input) for mailman id 80190;
 Mon, 01 Feb 2021 23:27:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IWGu=HD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l6ibZ-0007P6-Qt
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 23:27:37 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3d35c18d-68bf-48f9-993b-8fdff7993348;
 Mon, 01 Feb 2021 23:27:31 +0000 (UTC)
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
X-Inumbo-ID: 3d35c18d-68bf-48f9-993b-8fdff7993348
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612222051;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SJRgavZh5UboqFIes1Vgd8L9o/aFp0WpSJ+Ons+P7bw=;
  b=VJ+XdxhDljjq4eO4QmvqjbxS6JuTELmP9M433yE/rB9ZrmQT8UYelJug
   isRTKaF5D1SX4t3QJGklg22yWPQ9ZyTZ09Yvj8Udk0zK1ngsZvJtKWFp9
   80doVvdWnbGYSliXDz8y15BscDyES05ImsSU1K6z+VkdanKe/n9Q+/l4b
   4=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: vJwJmHhGesYA1E5eg5NT9NMRm0hNc4DFSfh8WkGBNeByiHoRntitHyhtv7W48wl75fZNCSFR3B
 l9eRQSWp4qQmrLqYrLWODTXN9UNTiUjDrEp7G0kq+sHrEWRc+ICtme/0/aUzmrfSgDIEz2rMLk
 lUXlRYWLzIsS0rcb+lNOvTEZTm+srPwcMS1jXr2ZSvEWFy1KkNuqy72JYfcR3GpQ+EfCejWROa
 r7n1y1Z7WeO62A8bLBkWM+tzoB0vu7Rvg0cL80hwuqN0PLvA/vBjziyx34mzBD28nm+4uWukyf
 JHQ=
X-SBRS: 5.1
X-MesageID: 36319798
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,393,1602561600"; 
   d="scan'208";a="36319798"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>
Subject: [PATCH v9 04/11] xen/memory: Add a vmtrace_buf resource type
Date: Mon, 1 Feb 2021 23:26:56 +0000
Message-ID: <20210201232703.29275-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210201232703.29275-1-andrew.cooper3@citrix.com>
References: <20210201232703.29275-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Michał Leszczyński <michal.leszczynski@cert.pl>

Allow to map processor trace buffer using acquire_resource().

Signed-off-by: Michał Leszczyński <michal.leszczynski@cert.pl>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Michał Leszczyński <michal.leszczynski@cert.pl>
CC: Tamas K Lengyel <tamas@tklengyel.com>

v8:
 * Rebase over 'fault' and ARM/IOREQ series.

v7:
 * Rebase over changes elsewhere in the series
---
 xen/common/memory.c         | 29 +++++++++++++++++++++++++++++
 xen/include/public/memory.h |  1 +
 2 files changed, 30 insertions(+)

diff --git a/xen/common/memory.c b/xen/common/memory.c
index 128718b31c..fada97a79f 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1085,6 +1085,9 @@ static unsigned int resource_max_frames(const struct domain *d,
     case XENMEM_resource_ioreq_server:
         return ioreq_server_max_frames(d);
 
+    case XENMEM_resource_vmtrace_buf:
+        return d->vmtrace_size >> PAGE_SHIFT;
+
     default:
         return -EOPNOTSUPP;
     }
@@ -1125,6 +1128,29 @@ static int acquire_ioreq_server(struct domain *d,
 #endif
 }
 
+static int acquire_vmtrace_buf(
+    struct domain *d, unsigned int id, unsigned int frame,
+    unsigned int nr_frames, xen_pfn_t mfn_list[])
+{
+    const struct vcpu *v = domain_vcpu(d, id);
+    unsigned int i;
+    mfn_t mfn;
+
+    if ( !v )
+        return -ENOENT;
+
+    if ( !v->vmtrace.pg ||
+         (frame + nr_frames) > (d->vmtrace_size >> PAGE_SHIFT) )
+        return -EINVAL;
+
+    mfn = page_to_mfn(v->vmtrace.pg);
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
@@ -1142,6 +1168,9 @@ static int _acquire_resource(
     case XENMEM_resource_ioreq_server:
         return acquire_ioreq_server(d, id, frame, nr_frames, mfn_list);
 
+    case XENMEM_resource_vmtrace_buf:
+        return acquire_vmtrace_buf(d, id, frame, nr_frames, mfn_list);
+
     default:
         return -EOPNOTSUPP;
     }
diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
index 020c79d757..50e73eef98 100644
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


