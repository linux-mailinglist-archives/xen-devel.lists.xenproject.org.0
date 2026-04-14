Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SM/QNWtB3mlvpwkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 15:30:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 507943FA830
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 15:30:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1281908.1564688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCdqB-0004kn-6p; Tue, 14 Apr 2026 13:30:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1281908.1564688; Tue, 14 Apr 2026 13:30:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCdqB-0004ij-2S; Tue, 14 Apr 2026 13:30:07 +0000
Received: by outflank-mailman (input) for mailman id 1281908;
 Tue, 14 Apr 2026 13:30:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wCdqA-0004fz-CQ
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 13:30:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCdq8-006u0t-43
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 15:30:05 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69de4158-5cb7-0a2a0a5109dd-0a2a4503b5fa-38
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 15:30:05 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69de415c-02b3-0a2a45030019-a0658309dcde-3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 15:30:05 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id EFBC181A473F;
 Tue, 14 Apr 2026 09:29:10 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
From: Bernhard Kaindl <bernhard.kaindl@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Bernhard Kaindl <bernhard.kaindl@citrix.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Christian Lindig <christian.lindig@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v6 6/7] tools/ocaml/libs/xc: Add an OCaml binding for NUMA-aware claims
Date: Tue, 14 Apr 2026 14:22:50 +0100
Message-Id: <284b58e46f6e2cb0df3f404da881f40884df5045.1776172526.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1776172526.git.bernhard.kaindl@citrix.com>
References: <cover.1776172526.git.bernhard.kaindl@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1776173405-C9136C9A-31D4E234/0/0
X-purgate-type: clean
X-purgate-size: 4737
X-Spamd-Result: default: False [3.01 / 15.00];
	DMARC_POLICY_REJECT(2.00)[citrix.com : SPF not aligned (relaxed), No valid DKIM,reject];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:bernhard.kaindl@citrix.com,m:christian.lindig@citrix.com,m:dave@recoil.org,m:anthony.perard@vates.tech,m:christian.lindig@cloud.com,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[9];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,citrix.com:mid];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.782];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel]
X-Rspamd-Queue-Id: 507943FA830
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add an OCaml binding for xc_domain_claim_memory() so the
XEN_DOMCTL_claim_memory hypercall can be used from OCaml.

This allows OCaml toolstacks to place NUMA-aware memory
claims for domains as well as host-wide claims.

tools/ocaml/libs/xc/xenctrl.ml/mli:
- Add claim record type and domain_claim_memory external.

tools/ocaml/libs/xc/xenctrl_stubs.c:
- Validate claim count and arguments.
- Marshal the OCaml claim array to memory_claim_t[].
- Map node/target of -1 to XEN_DOMCTL_CLAIM_MEMORY_GLOBAL.

Acked-by: Christian Lindig <christian.lindig@cloud.com>
Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
 tools/ocaml/libs/xc/xenctrl.ml      | 11 +++++++
 tools/ocaml/libs/xc/xenctrl.mli     | 11 +++++++
 tools/ocaml/libs/xc/xenctrl_stubs.c | 47 +++++++++++++++++++++++++++++
 3 files changed, 69 insertions(+)

diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index 97108b9d861a..680cd8ec5449 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -370,6 +370,17 @@ external domain_deassign_device: handle -> domid -> (int * int * int * int) -> u
 external domain_test_assign_device: handle -> domid -> (int * int * int * int) -> bool
   = "stub_xc_domain_test_assign_device"
 
+(* OCaml binding for xc_domain_claim_memory(): Install claim sets for a domain,
+   target is either a NUMA node or -1 for no node - memory from any node). *)
+
+type claim =
+  {
+    pages: int64;   (* Number of pages to claim *)
+    target: int32;  (* Target: NUMA node ID, or -1 for a flexible claim *)
+  }
+external domain_claim_memory: handle -> domid -> claim array -> unit
+  = "stub_xc_domain_claim_memory"
+
 external version: handle -> version = "stub_xc_version_version"
 external version_compile_info: handle -> compile_info
   = "stub_xc_version_compile_info"
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index 9fccb2c2c287..8a7c53a09d97 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -297,6 +297,17 @@ external domain_deassign_device: handle -> domid -> (int * int * int * int) -> u
 external domain_test_assign_device: handle -> domid -> (int * int * int * int) -> bool
   = "stub_xc_domain_test_assign_device"
 
+(* OCaml binding for xc_domain_claim_memory(): Install claim sets for a domain,
+   target is either a NUMA node or -1 for no node - memory from any node). *)
+
+type claim =
+  {
+    pages: int64;   (* Number of pages to claim *)
+    target: int32;  (* Target: NUMA node ID, or -1 for a flexible claim *)
+  }
+external domain_claim_memory: handle -> domid -> claim array -> unit
+  = "stub_xc_domain_claim_memory"
+
 external version : handle -> version = "stub_xc_version_version"
 external version_compile_info : handle -> compile_info
   = "stub_xc_version_compile_info"
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index c55f73b265b2..90464f718df0 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -1435,6 +1435,53 @@ CAMLprim value stub_xc_watchdog(value xch_val, value domid, value timeout)
 	CAMLreturn(Val_int(ret));
 }
 
+CAMLprim value stub_xc_domain_claim_memory(value xch_val, value domid,
+                                           value claims)
+{
+	CAMLparam3(xch_val, domid, claims);
+	xc_interface *xch = xch_of_val(xch_val);
+	mlsize_t nr_claims = Wosize_val(claims);
+	memory_claim_t *claim;
+	uint32_t c_domid = (uint32_t)Int_val(domid);
+	int retval;
+
+	claim = calloc(nr_claims, sizeof(*claim));
+	if (claim == NULL && nr_claims != 0)
+		caml_raise_out_of_memory();
+
+	for (mlsize_t i = 0; i < nr_claims; i++) {
+		value claim_rec = Field(claims, i);
+		int64_t pages = Int64_val(Field(claim_rec, 0));
+		int32_t target = Int32_val(Field(claim_rec, 1));
+		uint32_t c_target;
+
+		if (pages < 0 || target < -1 ) {
+			free(claim);
+			caml_invalid_argument("domain_claim_memory: invalid pages or node");
+		}
+
+		if (target == -1)
+			c_target = XEN_DOMCTL_CLAIM_MEMORY_GLOBAL;
+		else
+			c_target = (uint32_t)target;
+
+		claim[i] = (memory_claim_t) {
+			.pages = (uint64_t)pages, .target = c_target
+		};
+	}
+
+	/* May have to wait for the domctl lock, release the OCaml runtime lock. */
+	caml_enter_blocking_section();
+	retval = xc_domain_claim_memory(xch, c_domid, nr_claims, claim);
+	caml_leave_blocking_section();
+
+	free(claim);
+	if (retval < 0)
+		failwith_xc(xch);
+
+	CAMLreturn(Val_unit);
+}
+
 /*
  * Local variables:
  *  indent-tabs-mode: t
-- 
2.39.5


