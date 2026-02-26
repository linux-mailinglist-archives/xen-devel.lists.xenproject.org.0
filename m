Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DCwCm1doGm3igQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 15:49:17 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4B91A7E2C
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 15:49:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1241961.1542769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvcfl-0007ok-EK; Thu, 26 Feb 2026 14:49:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1241961.1542769; Thu, 26 Feb 2026 14:49:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvcfl-0007mf-An; Thu, 26 Feb 2026 14:49:01 +0000
Received: by outflank-mailman (input) for mailman id 1241961;
 Thu, 26 Feb 2026 14:48:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wgwr=A6=citrix.com=bernhard.kaindl@srs-se1.protection.inumbo.net>)
 id 1vvcfj-0007mT-Jq
 for xen-devel@lists.xenproject.org; Thu, 26 Feb 2026 14:48:59 +0000
Received: from na1pdmzitismtp02.tibco.com (na1pdmzitismtp02.tibco.com
 [160.101.131.9]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47c89918-1322-11f1-b164-2bf370ae4941;
 Thu, 26 Feb 2026 15:48:58 +0100 (CET)
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id 572748153330;
 Thu, 26 Feb 2026 09:48:26 -0500 (EST)
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
X-Inumbo-ID: 47c89918-1322-11f1-b164-2bf370ae4941
From: Bernhard Kaindl <bernhard.kaindl@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Bernhard Kaindl <bernhard.kaindl@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v4 05/10] xen/domain: Add DOMCTL handler for claiming memory with NUMA awareness
Date: Thu, 26 Feb 2026 14:29:19 +0000
Message-Id: <b2c94f0c3b41976b2691ce15b9f9a2589370e65a.1772098423.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1772098423.git.bernhard.kaindl@citrix.com>
References: <cover.1772098423.git.bernhard.kaindl@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.01 / 15.00];
	DMARC_POLICY_REJECT(2.00)[citrix.com : SPF not aligned (relaxed), No valid DKIM,reject];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:bernhard.kaindl@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.982];
	RCVD_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:mid,citrix.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TAGGED_RCPT(0.00)[xen-devel]
X-Rspamd-Queue-Id: AF4B91A7E2C
X-Rspamd-Action: no action

Add a DOMCTL handler for claiming memory with NUMA awareness. It
rejects claims when LLC coloring (does not support claims) is enabled
and translates the public constant to the internal NUMA_NO_NODE.

The request is forwarded to domain_set_outstanding_pages() for the
actual claim processing. The handler uses the same XSM hook as the
legacy XENMEM_claim_pages hypercall.

While the underlying infrastructure currently supports only a single
claim, the public hypercall interface is designed to be extensible for
multiple claims in the future without breaking the API.

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
 xen/common/domain.c         | 29 ++++++++++++++++++++++++++++
 xen/common/domctl.c         |  9 +++++++++
 xen/include/public/domctl.h | 38 +++++++++++++++++++++++++++++++++++++
 xen/include/xen/domain.h    |  2 ++
 4 files changed, 78 insertions(+)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index e7861259a2b3..ac1b091f5574 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -268,6 +268,35 @@ int get_domain_state(struct xen_domctl_get_domain_state *info, struct domain *d,
     return rc;
 }
 
+/* Claim memory for a domain or reset the claim */
+int claim_memory(struct domain *d, const struct xen_domctl_claim_memory *uinfo)
+{
+    memory_claim_t claim;
+
+    /* alloc_color_heap_page() does not handle claims, so reject LLC coloring */
+    if ( llc_coloring_enabled )
+        return -EOPNOTSUPP;
+    /*
+     * We only support single claims at the moment, and if the domain is
+     * dying (d->is_dying is set), its claims have already been released
+     */
+    if ( uinfo->pad || uinfo->nr_claims != 1 || d->is_dying )
+        return -EINVAL;
+
+    if ( copy_from_guest(&claim, uinfo->claims, 1) )
+        return -EFAULT;
+
+    if ( claim.pad )
+        return -EINVAL;
+
+    /* Convert the API tag for a host-wide claim to the NUMA_NO_NODE constant */
+    if ( claim.node == XEN_DOMCTL_CLAIM_MEMORY_NO_NODE )
+        claim.node = NUMA_NO_NODE;
+
+    /* NB. domain_set_outstanding_pages() has the checks to validate its args */
+    return domain_set_outstanding_pages(d, claim.pages, claim.node);
+}
+
 static void __domain_finalise_shutdown(struct domain *d)
 {
     struct vcpu *v;
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 29a7726d32d0..9e858f631aaf 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -868,6 +868,15 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
         ret = get_domain_state(&op->u.get_domain_state, d, &op->domain);
         break;
 
+    case XEN_DOMCTL_claim_memory:
+        /* Use the same XSM hook as XENMEM_claim_pages */
+        ret = xsm_claim_pages(XSM_PRIV, d);
+        if ( ret )
+            break;
+
+        ret = claim_memory(d, &op->u.claim_memory);
+        break;
+
     default:
         ret = arch_do_domctl(op, d, u_domctl);
         break;
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 8f6708c0a7cd..610806c8b6e0 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -1276,6 +1276,42 @@ struct xen_domctl_get_domain_state {
     uint64_t unique_id;      /* Unique domain identifier. */
 };
 
+/*
+ * XEN_DOMCTL_claim_memory
+ *
+ * Claim memory for a guest domain. The claimed memory is converted into actual
+ * memory pages by allocating it. Except for the option to pass claims for
+ * multiple NUMA nodes, the semantics are based on host-wide claims as
+ * provided by XENMEM_claim_pages, and are identical for host-wide claims.
+ *
+ * The initial implementation supports a claim for the host or a NUMA node, but
+ * using an array, the API is designed to be extensible to support more claims.
+ */
+struct xen_memory_claim {
+    uint64_aligned_t pages;   /* Amount of pages to be allotted to the domain */
+    uint32_t node;  /* NUMA node, or XEN_DOMCTL_CLAIM_MEMORY_NO_NODE for host */
+    uint32_t pad;                 /* padding for alignment, set to 0 on input */
+};
+typedef struct xen_memory_claim memory_claim_t;
+#define XEN_DOMCTL_CLAIM_MEMORY_NO_NODE    0xFFFFFFFF  /* No node: host claim */
+
+/* Use XEN_NODE_CLAIM_INIT to initialize a memory_claim_t structure */
+#define XEN_NODE_CLAIM_INIT(_pages, _node) { \
+    .pages = (_pages),                  \
+    .node = (_node),                    \
+    .pad = 0                            \
+}
+DEFINE_XEN_GUEST_HANDLE(memory_claim_t);
+
+struct xen_domctl_claim_memory {
+    /* IN: array of struct xen_memory_claim */
+    XEN_GUEST_HANDLE_64(memory_claim_t) claims;
+    /* IN: number of claims in the claims array handle. See the claims field. */
+    uint32_t nr_claims;
+#define XEN_DOMCTL_MAX_CLAIMS UINT8_MAX /* More claims require changes in Xen */
+    uint32_t pad;                       /* padding for alignment, set it to 0 */
+};
+
 struct xen_domctl {
 /* Stable domctl ops: interface_version is required to be 0.  */
     uint32_t cmd;
@@ -1368,6 +1404,7 @@ struct xen_domctl {
 #define XEN_DOMCTL_gsi_permission                88
 #define XEN_DOMCTL_set_llc_colors                89
 #define XEN_DOMCTL_get_domain_state              90 /* stable interface */
+#define XEN_DOMCTL_claim_memory                  91
 #define XEN_DOMCTL_gdbsx_guestmemio            1000
 #define XEN_DOMCTL_gdbsx_pausevcpu             1001
 #define XEN_DOMCTL_gdbsx_unpausevcpu           1002
@@ -1436,6 +1473,7 @@ struct xen_domctl {
 #endif
         struct xen_domctl_set_llc_colors    set_llc_colors;
         struct xen_domctl_get_domain_state  get_domain_state;
+        struct xen_domctl_claim_memory      claim_memory;
         uint8_t                             pad[128];
     } u;
 };
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index 93c0fd00c1d7..79e8932c4530 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -193,4 +193,6 @@ extern bool vmtrace_available;
 
 extern bool vpmu_is_available;
 
+int claim_memory(struct domain *d, const struct xen_domctl_claim_memory *uinfo);
+
 #endif /* __XEN_DOMAIN_H__ */
-- 
2.39.5


