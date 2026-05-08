Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNkVOLJK/mllowAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 22:42:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 982E04FB925
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 22:42:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1304175.1577275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLS1P-0004QC-5l; Fri, 08 May 2026 20:42:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1304175.1577275; Fri, 08 May 2026 20:42:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLS1P-0004ND-2w; Fri, 08 May 2026 20:42:07 +0000
Received: by outflank-mailman (input) for mailman id 1304175;
 Fri, 08 May 2026 20:42:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wLS1O-0004N7-Fu
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 20:42:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLS1N-003xE7-PW
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 22:42:05 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69fe4a84-bab6-0a2a0a5309dd-0a2a4509d400-24
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 22:42:05 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69fe4a9c-2497-0a2a45090019-a0658309da50-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 22:42:05 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id 6A3498245FBA;
 Fri,  8 May 2026 16:40:59 -0400 (EDT)
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
Subject: [PATCH v7 3/3] tools/ocaml: Add OCaml binding for NUMA claim sets
Date: Fri,  8 May 2026 21:27:59 +0100
Message-Id: <10726c7afb43856a1014c6b6e24700442ff8740e.1778272036.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1778272036.git.bernhard.kaindl@citrix.com>
References: <cover.1778272036.git.bernhard.kaindl@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1778272925-89775A53-D74062C2/0/0
X-purgate-type: clean
X-purgate-size: 4695
X-Rspamd-Queue-Id: 982E04FB925
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.01 / 15.00];
	DMARC_POLICY_REJECT(2.00)[citrix.com : SPF not aligned (relaxed), No valid DKIM,reject];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:bernhard.kaindl@citrix.com,m:christian.lindig@citrix.com,m:dave@recoil.org,m:anthony.perard@vates.tech,m:christian.lindig@cloud.com,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.486];
	RCVD_COUNT_SEVEN(0.00)[9];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cloud.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,citrix.com:mid]
X-Rspamd-Action: no action

Add an OCaml binding for xc_domain_claim_memory():

- tools/ocaml/libs/xc/xenctrl.ml/mli:
  Add claim record type and domain_claim_memory external.

- tools/ocaml/libs/xc/xenctrl_stubs.c:
  Marshal the OCaml claim array into a xen_memory_claim_t array.
  Map nodes of -1 to XEN_DOMCTL_CLAIM_MEMORY_HOST for host-wide claims.

Acked-by: Christian Lindig <christian.lindig@cloud.com>
Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
 tools/ocaml/libs/xc/xenctrl.ml      | 10 ++++++
 tools/ocaml/libs/xc/xenctrl.mli     | 10 ++++++
 tools/ocaml/libs/xc/xenctrl_stubs.c | 50 +++++++++++++++++++++++++++++
 3 files changed, 70 insertions(+)

diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index 97108b9d861a..8dd0c932e3ee 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -370,6 +370,16 @@ external domain_deassign_device: handle -> domid -> (int * int * int * int) -> u
 external domain_test_assign_device: handle -> domid -> (int * int * int * int) -> bool
   = "stub_xc_domain_test_assign_device"
 
+(* OCaml binding for xc_domain_claim_memory() to claim memory for a domain *)
+
+type claim =
+  {
+    pages: int64; (* Number of pages to claim *)
+    node: int32;  (* NUMA node ID, or -1 for host-wide claims *)
+  }
+external domain_claim_memory: handle -> domid -> claim array -> unit
+  = "stub_xc_domain_claim_memory"
+
 external version: handle -> version = "stub_xc_version_version"
 external version_compile_info: handle -> compile_info
   = "stub_xc_version_compile_info"
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index 9fccb2c2c287..e78ea0dfe6c4 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -297,6 +297,16 @@ external domain_deassign_device: handle -> domid -> (int * int * int * int) -> u
 external domain_test_assign_device: handle -> domid -> (int * int * int * int) -> bool
   = "stub_xc_domain_test_assign_device"
 
+(* OCaml binding for xc_domain_claim_memory() to claim memory for a domain *)
+
+type claim =
+  {
+    pages: int64; (* Number of pages to claim *)
+    node: int32;  (* NUMA node ID, or -1 for host-wide claims *)
+  }
+external domain_claim_memory: handle -> domid -> claim array -> unit
+  = "stub_xc_domain_claim_memory"
+
 external version : handle -> version = "stub_xc_version_version"
 external version_compile_info : handle -> compile_info
   = "stub_xc_version_compile_info"
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index c55f73b265b2..e91bebf5a4ed 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -1435,6 +1435,56 @@ CAMLprim value stub_xc_watchdog(value xch_val, value domid, value timeout)
 	CAMLreturn(Val_int(ret));
 }
 
+/* OCaml binding for xc_domain_claim_memory() to claim memory for a domain */
+CAMLprim value stub_xc_domain_claim_memory(value xch_val, value domid,
+                                           value claim_set)
+{
+	CAMLparam3(xch_val, domid, claim_set);
+	xc_interface *xch = xch_of_val(xch_val);
+	mlsize_t nr_entries = Wosize_val(claim_set);
+	uint32_t c_domid = (uint32_t)Int_val(domid);
+	uint32_t c_nr_entries = (uint32_t)nr_entries;
+	xen_memory_claim_t *c_claim_set;
+
+	if (!nr_entries)
+		caml_invalid_argument("domain_claim_memory: claim_set cannot be empty");
+
+	c_claim_set = calloc(c_nr_entries, sizeof(*c_claim_set));
+	if (c_claim_set == NULL)
+		caml_raise_out_of_memory();
+
+	/* The entries of the claim_set are claim entries with {pages, node} */
+	for (mlsize_t i = 0; i < nr_entries; i++) {
+		value claim_entry = Field(claim_set, i);
+		int64_t pages = Int64_val(Field(claim_entry, 0));
+		int32_t node = Int32_val(Field(claim_entry, 1));
+
+		if (pages < 0 || node < -1) {
+			free(c_claim_set);
+			caml_invalid_argument("domain_claim_memory: invalid pages or node");
+		}
+		c_claim_set[i] = (xen_memory_claim_t) {
+			.pages = (uint64_t)pages,
+			.target = (node == -1)
+				? XEN_DOMCTL_CLAIM_MEMORY_HOST
+				: (uint32_t)node
+		};
+	}
+
+	/* May have to wait for the domctl lock, release the OCaml runtime lock. */
+	caml_enter_blocking_section();
+	int retval = xc_domain_claim_memory(xch, c_domid,
+					    XEN_DOMCTL_CLAIM_MEMORY_SET,
+					    &c_nr_entries, c_claim_set);
+	caml_leave_blocking_section();
+
+	free(c_claim_set);
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


