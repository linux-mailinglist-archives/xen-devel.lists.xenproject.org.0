Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D757C76BE68
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 22:21:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574500.899839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQvra-0000gq-GS; Tue, 01 Aug 2023 20:21:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574500.899839; Tue, 01 Aug 2023 20:21:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQvra-0000ee-D1; Tue, 01 Aug 2023 20:21:02 +0000
Received: by outflank-mailman (input) for mailman id 574500;
 Tue, 01 Aug 2023 20:21:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B3Rc=DS=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1qQvrY-0000Vh-UH
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 20:21:00 +0000
Received: from sender3-of-o59.zoho.com (sender3-of-o59.zoho.com
 [136.143.184.59]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed01d9c5-30a8-11ee-b25c-6b7b168915f2;
 Tue, 01 Aug 2023 22:21:00 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1690921221539148.37958387649314;
 Tue, 1 Aug 2023 13:20:21 -0700 (PDT)
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
X-Inumbo-ID: ed01d9c5-30a8-11ee-b25c-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1690921223; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kjFnFBapoQ7lQPlaLmhBGvI7h1nmY845AgXgJ0HUtbJqdU5LFjp4IS1FXBnKy7xkeKljZeRqAjxiXA5syLROHfw3HyA9jjsdv70zwIGlSF7oFV9Mk1wloUHUzpiMgQG+rLdNp7iyaNegw5MhvpDZ6Qb8B5GylqTCGPxWwhU7P04=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1690921223; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=c36aqSstXSR6pA2kH24inhu4JODBmXhwXRJ9bra9rs8=; 
	b=c9QZqfFpDJ1w86/B7pmdMPyXkRhywCD71Kv1KwC6Kp6mex/HXD7uxLoxYbUpq50xNhj6ARDZHQbuj3ueb/Ls9UdZd7q2Vg6NmYlh6daU2wgug+3ULYvb3ZCZWllp8vdoE3umD0M6unNdqko8YH3y+gonbTmOOKVwTMPqMbVzyM4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1690921223;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=c36aqSstXSR6pA2kH24inhu4JODBmXhwXRJ9bra9rs8=;
	b=btgPcKIbUkSCLwMaCRscbjh82/cPU6TGLwPP0U3S/ywG+tUxcBk5jNvSLzy4/hZc
	xDBuVQuZrMeyJSFNsNe7P0xIGLMxLW1bax6KROOPs58YV0AADiOcQNToX+WyuqtVaQF
	Qms39sOusy73/lmd4LFVl0dafI4DtzhOXSaca6JQ=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [RFC 3/6] roles: add a role for xenstore domain
Date: Tue,  1 Aug 2023 16:20:03 -0400
Message-Id: <20230801202006.20322-4-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230801202006.20322-1-dpsmith@apertussolutions.com>
References: <20230801202006.20322-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Expand the possible roles for a domain to include a role for the Xenstore
domain.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/common/domain.c     | 3 +++
 xen/include/xen/sched.h | 3 ++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 0ff1d52e3d..dbf055c559 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -633,6 +633,9 @@ struct domain *domain_create(domid_t domid,
         d->role |= ROLE_HARDWARE_DOMAIN;
     }
 
+    if ( d->options & XEN_DOMCTL_CDF_xs_domain )
+        d->role |= ROLE_XENSTORE_DOMAIN;
+
     TRACE_1D(TRC_DOM0_DOM_ADD, d->domain_id);
 
     lock_profile_register_struct(LOCKPROF_TYPE_PERDOM, d, domid);
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 695f240326..ec0f9baff6 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -470,6 +470,7 @@ struct domain
 #define ROLE_UNBOUNDED_DOMAIN  (1U<<0)
 #define ROLE_CONTROL_DOMAIN    (1U<<1)
 #define ROLE_HARDWARE_DOMAIN   (1U<<2)
+#define ROLE_XENSTORE_DOMAIN   (1U<<3)
     uint8_t          role;
     /* Can this guest access the Xen console? */
     bool             is_console;
@@ -1165,7 +1166,7 @@ static inline bool is_vcpu_online(const struct vcpu *v)
 
 static inline bool is_xenstore_domain(const struct domain *d)
 {
-    return d->options & XEN_DOMCTL_CDF_xs_domain;
+    return d->role & ROLE_XENSTORE_DOMAIN;
 }
 
 static always_inline bool is_iommu_enabled(const struct domain *d)
-- 
2.20.1


