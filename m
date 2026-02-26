Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKYiL+pfoGmMiwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 15:59:54 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D81B1A824D
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 15:59:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1242025.1542801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvcq8-0001kf-MJ; Thu, 26 Feb 2026 14:59:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1242025.1542801; Thu, 26 Feb 2026 14:59:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvcq8-0001iC-JR; Thu, 26 Feb 2026 14:59:44 +0000
Received: by outflank-mailman (input) for mailman id 1242025;
 Thu, 26 Feb 2026 14:59:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wgwr=A6=citrix.com=bernhard.kaindl@srs-se1.protection.inumbo.net>)
 id 1vvcq7-0001i6-6e
 for xen-devel@lists.xenproject.org; Thu, 26 Feb 2026 14:59:43 +0000
Received: from na1pdmzitismtp01.tibco.com (na1pdmzitismtp01.tibco.com
 [160.101.131.8]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c73c83c2-1323-11f1-b164-2bf370ae4941;
 Thu, 26 Feb 2026 15:59:42 +0100 (CET)
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id E9CDB4290343;
 Thu, 26 Feb 2026 09:59:20 -0500 (EST)
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
X-Inumbo-ID: c73c83c2-1323-11f1-b164-2bf370ae4941
From: Bernhard Kaindl <bernhard.kaindl@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Bernhard Kaindl <bernhard.kaindl@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v4 07/10] tools/lib/ctrl/xc: Add xc_domain_claim_memory() to libxenctrl
Date: Thu, 26 Feb 2026 14:29:21 +0000
Message-Id: <cff8a067879289c2dac661a513a1b7f4e11caa90.1772098423.git.bernhard.kaindl@citrix.com>
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:bernhard.kaindl@citrix.com,m:anthony.perard@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.980];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_COUNT_SEVEN(0.00)[7];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[]
X-Rspamd-Queue-Id: 6D81B1A824D
X-Rspamd-Action: no action

Add a libxc function for the new XEN_DOMCTL_claim_memory hypercall,
It supports node-specific claims and host-wide claims.

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
 tools/include/xenctrl.h     |  4 ++++
 tools/libs/ctrl/xc_domain.c | 27 +++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index d5dbf69c8968..a0a9f2143b32 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2659,6 +2659,10 @@ int xc_domain_set_llc_colors(xc_interface *xch, uint32_t domid,
                              const uint32_t *llc_colors,
                              uint32_t num_llc_colors);
 
+int xc_domain_claim_memory(xc_interface *xch, uint32_t domid,
+                           uint32_t nr_claims,
+                           memory_claim_t *claims);
+
 #if defined(__arm__) || defined(__aarch64__)
 int xc_dt_overlay(xc_interface *xch, void *overlay_fdt,
                   uint32_t overlay_fdt_size, uint8_t overlay_op);
diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
index 01c0669c8863..685efc03d295 100644
--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -1070,6 +1070,33 @@ int xc_domain_remove_from_physmap(xc_interface *xch,
     return xc_memory_op(xch, XENMEM_remove_from_physmap, &xrfp, sizeof(xrfp));
 }
 
+/* Claim the guest memory for a domain before starting the domain build */
+int xc_domain_claim_memory(xc_interface *xch,
+                           uint32_t domid,
+                           uint32_t nr_claims,
+                           memory_claim_t *claims)
+{
+    struct xen_domctl domctl = {};
+    DECLARE_HYPERCALL_BOUNCE(claims, sizeof(*claims) * nr_claims,
+                             XC_HYPERCALL_BUFFER_BOUNCE_IN);
+    int ret;
+
+    if ( xc_hypercall_bounce_pre(xch, claims) )
+        return -1;
+
+    domctl.cmd = XEN_DOMCTL_claim_memory;
+    domctl.domain = domid;
+    domctl.u.claim_memory.nr_claims = nr_claims;
+    set_xen_guest_handle(domctl.u.claim_memory.claims, claims);
+
+    ret = do_domctl(xch, &domctl);
+
+    xc_hypercall_bounce_post(xch, claims);
+
+    return ret;
+}
+
+/* Legacy function for claiming pages, replaced by xc_domain_claim_memory() */
 int xc_domain_claim_pages(xc_interface *xch,
                                uint32_t domid,
                                unsigned long nr_pages)
-- 
2.39.5


