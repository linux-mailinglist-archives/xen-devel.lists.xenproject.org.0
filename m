Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEh6JYZgoGmMiwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 16:02:30 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 857841A82C2
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 16:02:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1242052.1542811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvcsT-0003Gq-21; Thu, 26 Feb 2026 15:02:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1242052.1542811; Thu, 26 Feb 2026 15:02:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvcsS-0003EG-VA; Thu, 26 Feb 2026 15:02:08 +0000
Received: by outflank-mailman (input) for mailman id 1242052;
 Thu, 26 Feb 2026 15:02:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wgwr=A6=citrix.com=bernhard.kaindl@srs-se1.protection.inumbo.net>)
 id 1vvcsR-0003E5-Ra
 for xen-devel@lists.xenproject.org; Thu, 26 Feb 2026 15:02:07 +0000
Received: from na1pdmzitismtp01.tibco.com (na1pdmzitismtp01.corp.cloud.com
 [160.101.131.8]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1dccd3c2-1324-11f1-b164-2bf370ae4941;
 Thu, 26 Feb 2026 16:02:07 +0100 (CET)
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id 182D34290365;
 Thu, 26 Feb 2026 10:01:46 -0500 (EST)
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
X-Inumbo-ID: 1dccd3c2-1324-11f1-b164-2bf370ae4941
From: Bernhard Kaindl <bernhard.kaindl@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Bernhard Kaindl <bernhard.kaindl@citrix.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v4 08/10] tools/ocaml/libs/xc: add OCaml domain_claim_memory binding
Date: Thu, 26 Feb 2026 14:29:22 +0000
Message-Id: <538ada6fad9414a102db0096f297f77b90f3ac01.1772098423.git.bernhard.kaindl@citrix.com>
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
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[citrix.com:query timed out];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:bernhard.kaindl@citrix.com,m:christian.lindig@citrix.com,m:dave@recoil.org,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.983];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:mid,citrix.com:email]
X-Rspamd-Queue-Id: 857841A82C2
X-Rspamd-Action: no action

Add OCaml bindings for xc_domain_claim_memory(), for using the
XEN_DOMCTL_claim_memory hypercall from OCaml. This allows OCaml
toolstacks to place NUMA-aware memory claims for domains as well
as host-wide claims.

tools/ocaml/libs/xc/xenctrl.ml/mli:
- Add claim record type and domain_claim_memory external.

tools/ocaml/libs/xc/xenctrl_stubs.c:
- Validate claim count and arguments.
- Marshal the OCaml claim array to memory_claim_t[].
- Map node = -1 to XEN_DOMCTL_CLAIM_MEMORY_NO_NODE.

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
 tools/ocaml/libs/xc/xenctrl.ml      | 11 ++++++++
 tools/ocaml/libs/xc/xenctrl.mli     | 11 ++++++++
 tools/ocaml/libs/xc/xenctrl_stubs.c | 43 +++++++++++++++++++++++++++++
 3 files changed, 65 insertions(+)

diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index 97108b9d861a..a1a05dcaede3 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -370,6 +370,17 @@ external domain_deassign_device: handle -> domid -> (int * int * int * int) -> u
 external domain_test_assign_device: handle -> domid -> (int * int * int * int) -> bool
   = "stub_xc_domain_test_assign_device"
 
+(* OCaml binding for xc_domain_claim_memory(): claim pages for a domain,
+   optionally per NUMA node (node = -1 means no specific node). *)
+
+type claim =
+  {
+    pages: int64;  (* Number of pages to claim *)
+    node: int32;   (* NUMA node ID, or -1 for no specific node *)
+  }
+external domain_claim_memory: handle -> domid -> claim array -> unit
+  = "stub_xc_domain_claim_memory"
+
 external version: handle -> version = "stub_xc_version_version"
 external version_compile_info: handle -> compile_info
   = "stub_xc_version_compile_info"
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index 9fccb2c2c287..1781c89258fe 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -297,6 +297,17 @@ external domain_deassign_device: handle -> domid -> (int * int * int * int) -> u
 external domain_test_assign_device: handle -> domid -> (int * int * int * int) -> bool
   = "stub_xc_domain_test_assign_device"
 
+(* OCaml binding for xc_domain_claim_memory(): claim pages for a domain,
+   optionally per NUMA node (node = -1 means no specific node). *)
+
+type claim =
+  {
+    pages: int64;  (* Number of pages to claim *)
+    node: int32;   (* NUMA node ID, or -1 for no specific node *)
+  }
+external domain_claim_memory: handle -> domid -> claim array -> unit
+  = "stub_xc_domain_claim_memory"
+
 external version : handle -> version = "stub_xc_version_version"
 external version_compile_info : handle -> compile_info
   = "stub_xc_version_compile_info"
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index c55f73b265b2..a77d7dac58e8 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -1435,6 +1435,49 @@ CAMLprim value stub_xc_watchdog(value xch_val, value domid, value timeout)
 	CAMLreturn(Val_int(ret));
 }
 
+CAMLprim value stub_xc_domain_claim_memory(value xch_val, value domid,
+                                           value claims)
+{
+	CAMLparam3(xch_val, domid, claims);
+	xc_interface *xch = xch_of_val(xch_val);
+	mlsize_t nr_claims = Wosize_val(claims);
+	memory_claim_t *claim;
+	int retval;
+
+	if (nr_claims > XEN_DOMCTL_MAX_CLAIMS)
+		caml_invalid_argument("domain_claim_memory: too many claims");
+
+	claim = calloc(nr_claims, sizeof(*claim));
+	if (claim == NULL && nr_claims != 0)
+		caml_raise_out_of_memory();
+
+	for (mlsize_t i = 0; i < nr_claims; i++) {
+		value claim_rec = Field(claims, i);
+		int64_t pages = Int64_val(Field(claim_rec, 0));
+		int32_t node = Int32_val(Field(claim_rec, 1));
+		uint32_t c_node;
+
+		if (pages < 0 || node < -1 ) {
+			free(claim);
+			caml_invalid_argument("domain_claim_memory: invalid pages or node");
+		}
+
+		if (node == -1)
+			c_node = XEN_DOMCTL_CLAIM_MEMORY_NO_NODE;
+		else
+			c_node = node;
+
+		claim[i] = (memory_claim_t)XEN_NODE_CLAIM_INIT((uint64_t)pages, c_node);
+	}
+
+	retval = xc_domain_claim_memory(xch, Int_val(domid), nr_claims, claim);
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


