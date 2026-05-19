Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJyWA7pdDGq5gQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 14:55:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 540B457F1A7
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 14:55:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312962.1583135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPJy8-00082R-Ma; Tue, 19 May 2026 12:54:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312962.1583135; Tue, 19 May 2026 12:54:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPJy8-0007zy-Il; Tue, 19 May 2026 12:54:44 +0000
Received: by outflank-mailman (input) for mailman id 1312962;
 Tue, 19 May 2026 12:54:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wPJy7-0007zs-4R
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 12:54:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPJy5-006q17-2N
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 14:54:41 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a0c5d75-2eae-0a2a0a5409dd-0a2a45078838-48
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 14:54:40 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a0c5d8f-229c-0a2a45070019-a0658309dcd8-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 14:54:40 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id A8D8082044AB;
 Tue, 19 May 2026 08:53:29 -0400 (EDT)
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
Cc: Bernhard Kaindl <bernhard.kaindl@citrix.com>
Subject: [PATCH] tests/mem-claim: System test suite for NUMA-aware claim sets
Date: Tue, 19 May 2026 13:53:08 +0100
Message-Id: <89ed55c313dff841ba7030bb7fa13ab248cb3ccd.1779193767.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1779195280-28678FE8-85430644/0/0
X-purgate-type: clean
X-purgate-size: 94387
X-Spamd-Result: default: False [3.01 / 15.00];
	DMARC_POLICY_REJECT(2.00)[citrix.com : SPF not aligned (relaxed), No valid DKIM,reject];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:bernhard.kaindl@citrix.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[9];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:email,citrix.com:mid,citrix.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo,claim.target:url];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[]
X-Rspamd-Queue-Id: 540B457F1A7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a comprehensive test suite for the xc_domain_claim_memory() API
and the legacy xc_domain_claim_pages() API for regression testing and
confirming interoperability that covers argument validation and the
protection semantics of memory claims across domains and NUMA nodes.

The suite verifies claim behaviour both host-wide and per-node, and
checks how host-wide and node-specific claims interact with claim
and allocation requests for other domains to ensure correct claims
protection and claims invariant maintenance across all code paths.

Key checks include:

- Argument validation and correct errno handling for invalid inputs.
- NUMA-aware claim sets, covering node-specific and global targets.
- Replacement semantics after allocations (global and node-scoped).
- Inter-domain protection and claim movement across NUMA nodes.

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
Dear reviewers,

this patch provides the system tests for the NUMA claims series v7:
https://lists.xen.org/archives/html/xen-devel/2026-05/msg00363.html

For reference, find an example of running it on a claims-v7 series
Xen hypervisor (on a NUMA host in this case, UMA hosts skip some tests):

$ git pull git@gitlab.com:bernhardkaindl/xen.git claims-system-test-v7
$ make -C tools/tests/mem-claim clean all
$ tools/tests/mem-claim/test-claim-memory -h
Usage: tools/tests/mem-claim/test-claim-memory [OPTIONS]

Options:
  -l, --list         List available test IDs and exit
  -t, --test ID      Run only the specified test ID (repeatable)
  -v, --verbose      Print per-step progress
  -h, --help         Show this help text
Available tests:
  A1-1  basic_node_claim
  A1-2  host_wide_replace_after_alloc
  A1-3  node_replace_after_alloc
  A1-4  legacy_host_wide_claim
  A1-5  move_claim_between_nodes
  A1-6  zero_claim_resets_claim
  A1-7  zero_claim_memory_reset
  A1-8  query_claim_memory_size
  I1-1  reject_non_present_node
  I1-2  reject_too_many_claims
  I1-3  reject_node_gt_uint8_max
  I1-4  reject_pages_gt_int32_max
  I1-5  reject_nonzero_pad
  I1-6  reject_zero_claim_count
  I1-7  null_claims_nonzero_count
  I1-8  zero_count_with_pointer
  I1-9  claim_pages_gt_free_enomem
  I2-1  claim_pages_causes_enomem
  I2-2  claim_memory_causes_enomem
  I2-3  claim_prima_causes_enomem

$ tools/tests/mem-claim/test-claim-memory -v

========= testcase program: tools/tests/mem-claim/test-claim-memory ==========
      step 1: create primary domain
      step 2: set maxmem for primary domain
      step 3: create secondary domain
      step 4: set maxmem for secondary domain
      step 5: set basic node claim
      step 6: check node claim is reflected in outstanding pages
      step 7: destroy helper domain
      step 8: destroy primary domain
      step 9: check cleanup restored baseline claimed pages
tools/tests/mem-claim/test-claim-memory::A1-1  PASSED (0.01 ms)
      step 10: create primary domain
      step 11: set maxmem for primary domain
      step 12: create secondary domain
      step 13: set maxmem for secondary domain
      step 14: install initial host-wide claim
      step 15: Allocate one extent to consume part of claim
      step 16: reduce host-wide claim after allocation
      step 17: release all claims with zero claim
      step 18: destroy helper domain
      step 19: destroy primary domain
      step 20: check cleanup restored baseline claimed pages
tools/tests/mem-claim/test-claim-memory::A1-2  PASSED (0.04 ms)
      step 21: create primary domain
      step 22: set maxmem for primary domain
      step 23: create secondary domain
      step 24: set maxmem for secondary domain
      step 25: set initial node-specific replacement claim
      step 26: Allocate one extent to consume part of claim
      step 27: replace node claim with a new absolute target
      step 28: release all claims with zero claim
      step 29: destroy helper domain
      step 30: destroy primary domain
      step 31: check cleanup restored baseline claimed pages
tools/tests/mem-claim/test-claim-memory::A1-3 PASSED (0.02 ms)
      step 32: create primary domain
      step 33: set maxmem for primary domain
      step 34: create secondary domain
      step 35: set maxmem for secondary domain
      step 36: set legacy host-wide claim
      step 37: claim is added the outstanding pages
      step 38: allocate extents to redeem a part of claim
      step 39: allocated against claim, outstanding pages reduced
      step 40: destroy helper domain
      step 41: destroy primary domain
      step 42: check cleanup restored baseline claimed pages
tools/tests/mem-claim/test-claim-memory::A1-4 PASSED (0.03 ms)
      step 43: create primary domain
      step 44: set maxmem for primary domain
      step 45: create secondary domain
      step 46: set maxmem for secondary domain
      step 47: Claim most memory on source node.
      step 48: claim all except 10 pages on node 1
      step 49: claim all pages except 10 pages on node 1 claim=23748599 free=23748609
      step 50: The claim blocks the allocation on the source node.
      step 51: Move the claim to most memory on the destination node.
      step 52: claim all except 10 pages on node 0
      step 53: claim all pages except 10 pages on node 0 claim=23526547 free=23526557
      step 54: Moved claim no longer blocks allocs on source node.
      step 55: Moved claim now blocks allocs on destination node.
      step 56: release all claims with zero claim
      step 57: Claim released, allocs on destination node succeed.
      step 58: release all claims with zero claim
      step 59: destroy helper domain
      step 60: destroy primary domain
      step 61: check cleanup restored baseline claimed pages
tools/tests/mem-claim/test-claim-memory::A1-5 PASSED (0.15 ms)
      step 62: create primary domain
      step 63: set maxmem for primary domain
      step 64: create secondary domain
      step 65: set maxmem for secondary domain
      step 66: zero claim to reset outstanding to baseline
      step 67: zero claim to reset outstanding to baseline
      step 68: check zero claim resets outstanding to baseline
      step 69: destroy helper domain
      step 70: destroy primary domain
      step 71: check cleanup restored baseline claimed pages
tools/tests/mem-claim/test-claim-memory::A1-6 PASSED (0.01 ms)
      step 72: create primary domain
      step 73: set maxmem for primary domain
      step 74: create secondary domain
      step 75: set maxmem for secondary domain
      step 76: make a claim to move outstanding away from baseline
      step 77: set a zero claim to reset outstanding to baseline
      step 78: check zero claim resets outstanding to baseline
      step 79: destroy helper domain
      step 80: destroy primary domain
      step 81: check cleanup restored baseline claimed pages
tools/tests/mem-claim/test-claim-memory::A1-7 PASSED (0.01 ms)
      step 82: create primary domain
      step 83: set maxmem for primary domain
      step 84: create secondary domain
      step 85: set maxmem for secondary domain
      step 86: Query claim-set size with nr_entries=0 and claim_set=NULL
      step 87: Fetch the claim set using the returned entry count
      step 88: destroy helper domain
      step 89: destroy primary domain
      step 90: check cleanup restored baseline claimed pages
tools/tests/mem-claim/test-claim-memory::A1-8 PASSED (0.00 ms)
      step 91: create primary domain
      step 92: set maxmem for primary domain
      step 93: create secondary domain
      step 94: set maxmem for secondary domain
      step 95: reject claim on a non-present NUMA node
      step 96: destroy helper domain
      step 97: destroy primary domain
      step 98: check cleanup restored baseline claimed pages
tools/tests/mem-claim/test-claim-memory::I1-1 PASSED (0.00 ms)
      step 99: create primary domain
      step 100: set maxmem for primary domain
      step 101: create secondary domain
      step 102: set maxmem for secondary domain
      step 103: reject claim list larger than the supported maximum
      step 104: destroy helper domain
      step 105: destroy primary domain
      step 106: check cleanup restored baseline claimed pages
tools/tests/mem-claim/test-claim-memory::I1-2 PASSED (0.03 ms)
      step 107: create primary domain
      step 108: set maxmem for primary domain
      step 109: create secondary domain
      step 110: set maxmem for secondary domain
      step 111: reject claim with node id above UINT8_MAX
      step 112: destroy helper domain
      step 113: destroy primary domain
      step 114: check cleanup restored baseline claimed pages
tools/tests/mem-claim/test-claim-memory::I1-3 PASSED (0.00 ms)
      step 115: create primary domain
      step 116: set maxmem for primary domain
      step 117: create secondary domain
      step 118: set maxmem for secondary domain
      step 119: reject claim with pages larger than INT32_MAX
      step 120: destroy helper domain
      step 121: destroy primary domain
      step 122: check cleanup restored baseline claimed pages
tools/tests/mem-claim/test-claim-memory::I1-4 PASSED (0.00 ms)
      step 123: create primary domain
      step 124: set maxmem for primary domain
      step 125: create secondary domain
      step 126: set maxmem for secondary domain
      step 127: reject claim with non-zero cmd
      step 128: destroy helper domain
      step 129: destroy primary domain
      step 130: check cleanup restored baseline claimed pages
tools/tests/mem-claim/test-claim-memory::I1-5 PASSED (0.00 ms)
      step 131: create primary domain
      step 132: set maxmem for primary domain
      step 133: create secondary domain
      step 134: set maxmem for secondary domain
      step 135: reject xc_domain_claim_memory() with nr_claims == 0
      step 136: destroy helper domain
      step 137: destroy primary domain
      step 138: check cleanup restored baseline claimed pages
tools/tests/mem-claim/test-claim-memory::I1-6 [nr_claims=0] PASSED (0.00 ms)
      step 139: create primary domain
      step 140: set maxmem for primary domain
      step 141: create secondary domain
      step 142: set maxmem for secondary domain
      step 143: reject xc_domain_claim_memory() with claims=NULL and nr_claims == 1
      step 144: destroy helper domain
      step 145: destroy primary domain
      step 146: check cleanup restored baseline claimed pages
tools/tests/mem-claim/test-claim-memory::I1-7 [nr_claims=1 claims=NULL] PASSED (0.00 ms)
      step 147: create primary domain
      step 148: set maxmem for primary domain
      step 149: create secondary domain
      step 150: set maxmem for secondary domain
      step 151: reject xc_domain_claim_memory() with !nr_claims but a claims pointer
      step 152: destroy helper domain
      step 153: destroy primary domain
      step 154: check cleanup restored baseline claimed pages
tools/tests/mem-claim/test-claim-memory::I1-8 [nr_claims=0 claims=valid node=1] PASSED (0.00 ms)
      step 155: create primary domain
      step 156: set maxmem for primary domain
      step 157: create secondary domain
      step 158: set maxmem for secondary domain
      step 159: reject xc_domain_claim_pages() with pages > total free pages
      step 160: reject claim_memory() with pages > total free pages
      step 161: reject claim_memory() with pages > node free pages
      step 162: destroy helper domain
      step 163: destroy primary domain
      step 164: check cleanup restored baseline claimed pages
tools/tests/mem-claim/test-claim-memory::I1-9 [claim=47275120 free=47275119] PASSED (0.01 ms)
      step 165: create primary domain
      step 166: set maxmem for primary domain
      step 167: create secondary domain
      step 168: set maxmem for secondary domain
      step 169: dom_1: claim nearly all global memory with claim_pages
      step 170: expect ENOMEM for xc_domain_claim_pages() with claims > spare page
      step 171: expect ENOMEM for claim_memory() with claims > spare pages
      step 172: expect ENOMEM for claim_memory() with claims > spare pages
      step 173: destroy helper domain
      step 174: destroy primary domain
      step 175: check cleanup restored baseline claimed pages
tools/tests/mem-claim/test-claim-memory::I2-1 [claim=47274872 free=47275072] PASSED (0.01 ms)
      step 176: create primary domain
      step 177: set maxmem for primary domain
      step 178: create secondary domain
      step 179: set maxmem for secondary domain
      step 180: claim all except 200 pages on host
      step 181: claim all pages except 200 pages on host claim=47274825 free=47275025
      step 182: expect ENOMEM for xc_domain_claim_pages() with claims > spare page
      step 183: expect ENOMEM for claim_memory() with claims > spare pages
      step 184: expect ENOMEM for claim_memory() with claims > spare pages
      step 185: destroy helper domain
      step 186: destroy primary domain
      step 187: check cleanup restored baseline claimed pages
tools/tests/mem-claim/test-claim-memory::I2-2 PASSED (0.01 ms)
      step 188: create primary domain
      step 189: set maxmem for primary domain
      step 190: create secondary domain
      step 191: set maxmem for secondary domain
      step 192: claim all except 200 pages on node 1
      step 193: claim all pages except 200 pages on node 1 claim=23748361 free=23748561
      step 194: expect ENOMEM for claim_memory() with claims > spare pages
      step 195: destroy helper domain
      step 196: destroy primary domain
      step 197: check cleanup restored baseline claimed pages
tools/tests/mem-claim/test-claim-memory::I2-3 PASSED (0.01 ms)
================== short test summary info =================
PASSED A1-1 basic_node_claim
PASSED A1-2 host_wide_replace_after_alloc
PASSED A1-3 node_replace_after_alloc
PASSED A1-4 legacy_host_wide_claim
PASSED A1-5 move_claim_between_nodes
PASSED A1-6 zero_claim_resets_claim
PASSED A1-7 zero_claim_memory_reset
PASSED A1-8 query_claim_memory_size
PASSED I1-1 reject_non_present_node
PASSED I1-2 reject_too_many_claims
PASSED I1-3 reject_node_gt_uint8_max
PASSED I1-4 reject_pages_gt_int32_max
PASSED I1-5 reject_nonzero_pad
PASSED I1-6 reject_zero_claim_count
PASSED I1-7 null_claims_nonzero_count
PASSED I1-8 zero_count_with_pointer
PASSED I1-9 claim_pages_gt_free_enomem
PASSED I2-1 claim_pages_causes_enomem
PASSED I2-2 claim_memory_causes_enomem
PASSED I2-3 claim_prima_causes_enomem
============ 20 passed, 0 failed, 0 skipped ============

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
 tools/tests/mem-claim/.gitignore          |   1 +
 tools/tests/mem-claim/Makefile            |  35 +-
 tools/tests/mem-claim/accounting-1.h      | 456 ++++++++++
 tools/tests/mem-claim/input-phase1.h      | 173 ++++
 tools/tests/mem-claim/input-phase2.h      |  96 +++
 tools/tests/mem-claim/libtestclaims.c     | 980 ++++++++++++++++++++++
 tools/tests/mem-claim/libtestclaims.h     | 203 +++++
 tools/tests/mem-claim/test-claim-memory.c | 130 +++
 8 files changed, 2067 insertions(+), 7 deletions(-)
 create mode 100644 tools/tests/mem-claim/accounting-1.h
 create mode 100644 tools/tests/mem-claim/input-phase1.h
 create mode 100644 tools/tests/mem-claim/input-phase2.h
 create mode 100644 tools/tests/mem-claim/libtestclaims.c
 create mode 100644 tools/tests/mem-claim/libtestclaims.h
 create mode 100644 tools/tests/mem-claim/test-claim-memory.c

diff --git a/tools/tests/mem-claim/.gitignore b/tools/tests/mem-claim/.gitignore
index cfcee00b819b..08365576b22b 100644
--- a/tools/tests/mem-claim/.gitignore
+++ b/tools/tests/mem-claim/.gitignore
@@ -1 +1,2 @@
 test-mem-claim
+test-claim-memory
diff --git a/tools/tests/mem-claim/Makefile b/tools/tests/mem-claim/Makefile
index 76ba3e3c8bef..5c090639553b 100644
--- a/tools/tests/mem-claim/Makefile
+++ b/tools/tests/mem-claim/Makefile
@@ -1,14 +1,34 @@
 XEN_ROOT = $(CURDIR)/../../..
 include $(XEN_ROOT)/tools/Rules.mk
 
-TARGET := test-mem-claim
+TARGETS := test-mem-claim test-claim-memory
+
+LIB_OBJ := libtestclaims.o
 
 .PHONY: all
-all: $(TARGET)
+all: $(TARGETS)
+
+#  Can also be called with "make run-tests-mem-claim" from the toplevel.
+.PHONY: run
+run: $(TARGETS)
+ifeq ($(CC),$(HOSTCC))
+	set -e;             \
+	for test in $? ; do \
+		./$$test ;  \
+	done
+else
+	$(warning HOSTCC != CC, will not run test)
+endif
+
+# The tests in this directory need to run in a privileged domain (Dom0)
+# with libxenctrl and a matching the hypervisor to test running it.
+# Therefore, they don't run with the native test target for build-time tests.
+.PHONY: test
+test:
 
 .PHONY: clean
 clean:
-	$(RM) -- *.o $(TARGET) $(DEPS_RM)
+	$(RM) -- *.o $(TARGETS) $(DEPS_RM)
 
 .PHONY: distclean
 distclean: clean
@@ -17,11 +37,11 @@ distclean: clean
 .PHONY: install
 install: all
 	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC)/tests
-	$(INSTALL_PROG) $(TARGET) $(DESTDIR)$(LIBEXEC)/tests
+	$(INSTALL_PROG) $(TARGETS) $(DESTDIR)$(LIBEXEC)/tests
 
 .PHONY: uninstall
 uninstall:
-	$(RM) -- $(DESTDIR)$(LIBEXEC)/tests/$(TARGET)
+	$(RM) -- $(patsubst %,$(DESTDIR)$(LIBEXEC)/tests/%,$(TARGETS))
 
 CFLAGS += $(CFLAGS_xeninclude)
 CFLAGS += $(CFLAGS_libxenctrl)
@@ -32,7 +52,8 @@ LDFLAGS += $(APPEND_LDFLAGS)
 
 %.o: Makefile
 
-$(TARGET): test-mem-claim.o
-	$(CC) -o $@ $< $(LDFLAGS)
+
+$(TARGETS): %: %.o $(LIB_OBJ)
+	$(CC) -o $@ $^ $(LDFLAGS)
 
 -include $(DEPS_INCLUDE)
diff --git a/tools/tests/mem-claim/accounting-1.h b/tools/tests/mem-claim/accounting-1.h
new file mode 100644
index 000000000000..09b1fa69ce3d
--- /dev/null
+++ b/tools/tests/mem-claim/accounting-1.h
@@ -0,0 +1,456 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * claim-memory-allocations.h - Test claiming memory and claims protection
+ * with NUMA-aware claim sets.
+ *
+ * Check claiming memory and allocation against claims with NUMA-aware
+ * claim sets, including:
+ *
+ * - Claim nearly all free memory on a node or host-wide,
+ * - Verify the claim is reflected in physinfo
+ * - Assert that memory can be allocated by redeeming the claim.
+ * - Exercise xc_domain_claim_memory() with different valid claim sets.
+ * - Exercise xc_domain_claim_pages() and verify that claims are reflected
+ *   in the outstanding pages in Xen.
+ */
+#include "libtestclaims.h"
+
+/*
+ * A1-1: basic single-node claim is tracked in outstanding pages and released
+ * when the domain is destroyed.
+ *
+ * Smoke test: claims half the primary node's free pages, verifies they
+ * appear in physinfo.outstanding_pages, then returns.  The fixture destroys
+ * the domain, which releases the claim, and verifies outstanding pages returns
+ * to the pre-test baseline.
+ *
+ * Skipped when NUMA is disabled (num_nodes == 1 and no per-node free pages) or
+ * when there are fewer than 2 free pages available on the primary node.
+ */
+static int test_basic_node_claim(struct test_ctx *ctx)
+{
+    uint64_t pre_existing_claims, free_pages;
+    xen_memory_claim_t claim;
+
+    /* Get the free memory on the test node */
+    ctx->target1 = ctx->env->primary_node;
+    lib_get_node_free_pages(ctx, ctx->target1, &free_pages, NULL);
+
+    if ( free_pages < 2 )
+        return lib_fail(
+            ctx, "need >= 2 free pages on node %" PRIu64 ", got %" PRIu64,
+            ctx->target1, free_pages);
+
+    /*
+     * Leave one page of slack between the claim and the free pages
+     * so claim does not fail due to a small concurrent allocation.
+     */
+    ctx->alloc_pages = free_pages - 1;
+    snprintf(ctx->result->params, sizeof(ctx->result->params),
+             "node=%" PRIu64 " claim_pages=%" PRIu64 " free_pages=%" PRIu64,
+             ctx->target1, ctx->alloc_pages, free_pages);
+
+    /*
+     * Capture the baseline after domain creation (domain creation doesn't
+     * change outstanding pages, so this equals the fixture's baseline).
+     */
+    rc = lib_get_total_claims(ctx, &pre_existing_claims);
+    if ( rc )
+        return rc;
+
+    claim = (xen_memory_claim_t){
+        .pages = ctx->alloc_pages,
+        .target = ctx->target1
+    };
+    rc = lib_claim_memory(ctx, ctx->dom_1, 1, &claim, "set basic node claim");
+    if ( rc )
+        return rc;
+
+    return lib_check_claim(
+        ctx, pre_existing_claims, ctx->alloc_pages,
+        "check node claim is reflected in outstanding pages");
+
+    /* Domain teardown releases claim; fixture verifies baseline is restored. */
+}
+
+/*
+ * A1-2: host-wide claim is replaced atomically after an allocation.
+ *
+ * Sets an initial host-wide claim, allocates one extent (consuming part of it),
+ * then sets a smaller replacement claim and verifies the outstanding count
+ * reflects the new absolute target.
+ */
+static int test_update_host_after_alloc(struct test_ctx *ctx)
+{
+    unsigned long free_pages;
+    unsigned long initial_pages;
+
+    /* Get the total free memory for sizing the initial claim */
+    lib_get_total_free_pages(ctx, &free_pages);
+
+    if ( free_pages < 2 )
+        return lib_fail(ctx, "need >= 2 free pages total, got %" PRIu64,
+                        free_pages);
+
+    /*
+     * This test needs two valid claim targets: an initial larger claim
+     * and a smaller replacement target after consuming one claimed page.
+     */
+    initial_pages    = free_pages;
+    ctx->alloc_pages = free_pages / 2;
+
+    snprintf(ctx->result->params, sizeof(ctx->result->params),
+             "alloc_pages=%" PRIu64 " initial=%" PRIu64 " "
+             "replacement=%" PRIu64 " total free=%" PRIu64,
+             ctx->alloc_pages, initial_pages, ctx->alloc_pages, free_pages);
+
+    rc = lib_claim_memory(ctx, ctx->dom_1, 1, /* one claim record */
+                          &(xen_memory_claim_t){
+                              .pages  = initial_pages,
+                              .target = XEN_DOMCTL_CLAIM_MEMORY_HOST,
+                          },
+                          "install initial host-wide claim");
+    if ( rc )
+        return rc;
+
+    lib_set_step(ctx, "Allocate one extent to consume part of claim");
+    rc = lib_populate_success(ctx, (lib_populate_args_t){
+                                  .domid      = ctx->dom_1,
+                                  .nr_extents = 1,
+                              });
+    if ( rc )
+        return rc;
+
+    rc = lib_claim_memory(ctx, ctx->dom_1, 1, /* one claim record */
+                          &(xen_memory_claim_t){
+                              .pages  = ctx->alloc_pages,
+                              .target = XEN_DOMCTL_CLAIM_MEMORY_HOST,
+                          },
+                          "reduce host-wide claim after allocation");
+    if ( rc )
+        return rc;
+
+    return lib_release_all_claims(ctx, ctx->dom_1);
+}
+
+/*
+ * A1-3: node-specific claim is replaced atomically after an allocation.
+ *
+ * Same as A1-2 but scoped to the primary NUMA node:
+ * Sets an initial node claim, allocates one extent (consuming part of it),
+ * then sets a smaller replacement claim and verifies the outstanding count
+ * reflects the new absolute target.
+ */
+static int test_node_replace_after_alloc(struct test_ctx *ctx)
+{
+    uint64_t free_pages, initial_pages;
+
+    /* Node used for claim sizing, claiming and allocation */
+    ctx->target1 = ctx->env->primary_node;
+
+    /* Get the free memory on the test node for sizing the initial claim */
+    lib_get_node_free_pages(ctx, ctx->target1, &free_pages, NULL);
+    if ( free_pages < 2 )
+        return lib_skip_test(
+            ctx, "need >= 2 pages on node %" PRIu64 ", got %" PRIu64,
+            ctx->target1, free_pages);
+    /*
+     * This test needs two valid claim targets: an initial larger claim
+     * and a smaller replacement target after consuming one claimed page.
+     *
+     * Leave one page of slack between the claim and the free pages
+     * so claim does not fail due to a small concurrent allocation.
+     */
+    initial_pages    = free_pages - 1;
+    ctx->alloc_pages = free_pages / 2;
+
+    /* Logging of test parameters */
+    snprintf(ctx->result->params, sizeof(ctx->result->params),
+             "node=%" PRIu64 " init=%" PRIu64 " replacement=%" PRIu64
+             " free=%" PRIu64,
+             ctx->target1, initial_pages, ctx->alloc_pages, free_pages);
+
+    /* Create the claim with initial_pages */
+    rc = lib_claim_memory(ctx, ctx->dom_1, 1, /* one claim */
+                          &(xen_memory_claim_t){
+                              .pages  = initial_pages,
+                              .target = ctx->target1,
+                          },
+                          "set initial node-specific replacement claim");
+    if ( rc )
+        return rc;
+
+    lib_set_step(ctx, "Allocate one extent to consume part of claim");
+    rc =
+        lib_populate_success(ctx, (lib_populate_args_t){
+                                 .domid      = ctx->dom_1,
+                                 .nr_extents = 1,
+                                 .flags = XENMEMF_exact_node(ctx->target1),
+                             });
+    if ( rc )
+        return rc;
+
+    /* Update the claim with ctx->alloc_pages */
+    rc = lib_claim_memory(ctx, ctx->dom_1, 1, /* one claim */
+                          &(xen_memory_claim_t){
+                              .pages  = ctx->alloc_pages,
+                              .target = ctx->target1,
+                          },
+                          "replace node claim with a new absolute target");
+    if ( rc )
+        return rc;
+
+    return lib_release_all_claims(ctx, ctx->dom_1);
+}
+
+/*
+ * A1-4: legacy xc_domain_claim_pages() host-wide claim is tracked in outstanding
+ * pages, reduced by an allocation, and released when the domain is destroyed.
+ */
+static int test_legacy_host_wide_claim(struct test_ctx *ctx)
+{
+    uint64_t pre_existing_claims, free_pages;
+
+    /* Get the total free memory for sizing the claim */
+    lib_get_total_free_pages(ctx, &free_pages);
+
+    ctx->alloc_pages = free_pages / 2;
+    snprintf(ctx->result->params, sizeof(ctx->result->params), "claim=%" PRIu64,
+             ctx->alloc_pages);
+
+    rc = lib_get_total_claims(ctx, &pre_existing_claims);
+    if ( rc )
+        return rc;
+
+    rc = lib_claim_pages_legacy(ctx, ctx->dom_1, ctx->alloc_pages,
+                                "set legacy host-wide claim");
+    if ( rc )
+        return rc;
+
+    rc = lib_check_claim(ctx, pre_existing_claims, ctx->alloc_pages,
+                         "claim is added the outstanding pages");
+    if ( rc )
+        return rc;
+
+    lib_set_step(ctx, "allocate extents to redeem a part of claim");
+    rc = lib_populate_success(ctx, (lib_populate_args_t){
+                                  .domid      = ctx->dom_1,
+                                  .nr_extents = 10,
+                              });
+    if ( rc )
+        return rc;
+
+    return lib_check_claim(
+        ctx, pre_existing_claims, ctx->alloc_pages - 10,
+        "allocated against claim, outstanding pages reduced");
+    /* Teardown releases the claim; fixture verifies baseline is restored. */
+}
+
+/*
+ * A1-5: Test blocking allocation with claims and claim movement between nodes.
+ *
+ * This test performs a sequence of claims and allocations to verify that claims
+ * block allocations on the claimed node, that moving a claim to another node
+ * allows allocation on the original node, and that the new node is now blocked
+ * by the claim until it is released.
+ *
+ * To achieve this, the test creates a helper domain used for allocation
+ * attempts, then:
+ *
+ * Claims most free pages on the primary node, verifies allocation is blocked,
+ * then moves the claim to the secondary node, verifies the original allocation
+ * can now succeed on the primary node.
+ *
+ * It then verifies allocation is now blocked on the secondary node,
+ * releases the claim, and verifies the allocation can now succeed on the
+ * secondary node as well.
+ *
+ * Requires at least two online NUMA nodes.
+ */
+static int test_move_claim_between_nodes(struct test_ctx *ctx)
+{
+    uint64_t free_src, free_dst, spare_pages = 10;
+
+    if ( !ctx->env->have_secondary_node )
+        return lib_skip_test(ctx, "Requires at least two online NUMA nodes.");
+
+    ctx->target1 = ctx->env->primary_node;
+    ctx->target2 = ctx->env->secondary_node;
+
+    lib_get_node_free_pages(ctx, ctx->target1, &free_src, NULL);
+    lib_get_node_free_pages(ctx, ctx->target2, &free_dst, NULL);
+
+    if ( free_src < spare_pages + 1 || free_dst < spare_pages + 1 )
+        return lib_fail(ctx, "Need more pages, got %" PRIu64 "/%" PRIu64 ".",
+                        free_src, free_dst);
+
+    lib_set_step(ctx, "Claim most memory on source node.");
+    rc = lib_claim_all_on_node(ctx, ctx->dom_1, ctx->target1, spare_pages);
+    if ( rc )
+        return rc;
+
+    lib_set_step(ctx, "The claim blocks the allocation on the source node.");
+    rc =
+        lib_populate_failure(ctx, (lib_populate_args_t){
+                                 .domid      = ctx->dom_2,
+                                 .nr_extents = spare_pages * 2,
+                                 .flags = XENMEMF_exact_node(ctx->target1),
+                             });
+    if ( rc )
+        return rc;
+
+    lib_set_step(ctx, "Move the claim to most memory on the destination node.");
+    rc = lib_claim_all_on_node(ctx, ctx->dom_1, ctx->target2, spare_pages);
+    if ( rc )
+        return rc;
+
+    lib_set_step(ctx, "Moved claim no longer blocks allocs on source node.");
+    rc =
+        lib_populate_success(ctx, (lib_populate_args_t){
+                                 .domid      = ctx->dom_2,
+                                 .start      = spare_pages * 2,
+                                 .nr_extents = spare_pages * 2,
+                                 .flags = XENMEMF_exact_node(ctx->target1),
+                             });
+    if ( rc )
+        return rc;
+
+    lib_set_step(ctx, "Moved claim now blocks allocs on destination node.");
+    rc =
+        lib_populate_failure(ctx, (lib_populate_args_t){
+                                 .domid      = ctx->dom_2,
+                                 .nr_extents = spare_pages * 2,
+                                 .flags = XENMEMF_exact_node(ctx->target2),
+                             });
+    if ( rc )
+        return rc;
+
+    rc = lib_release_all_claims(ctx, ctx->dom_1);
+    if ( rc )
+        return rc;
+
+    lib_set_step(ctx, "Claim released, allocs on destination node succeed.");
+    rc =
+        lib_populate_success(ctx, (lib_populate_args_t){
+                                 .domid      = ctx->dom_2,
+                                 .start      = spare_pages * 2,
+                                 .nr_extents = spare_pages * 2,
+                                 .flags = XENMEMF_exact_node(ctx->target2),
+                             });
+    if ( rc )
+        return rc;
+
+    return lib_release_all_claims(ctx, ctx->dom_1);
+}
+
+/*
+ * A1-6: Check that a calling xc_domain_claim_pages(claim_pages = 0)
+ * resets the claims to the baseline.
+ */
+static int test_zero_claim_resets_claim(struct test_ctx *ctx)
+{
+    uint64_t pre_existing_claims;
+
+    rc = lib_get_total_claims(ctx, &pre_existing_claims);
+    if ( rc )
+        return rc;
+
+    /* Make a claim first to move outstanding away from the baseline. */
+    rc = lib_claim_pages_legacy(ctx, ctx->dom_1, 8,
+                                "zero claim to reset outstanding to baseline");
+    if ( rc )
+        return rc;
+
+    /* Now set a zero claim to reset outstanding back to the baseline. */
+    rc = lib_claim_pages_legacy(ctx, ctx->dom_1, 0,
+                                "zero claim to reset outstanding to baseline");
+    if ( rc )
+        return rc;
+
+    return lib_check_claim(ctx, pre_existing_claims, 0,
+                           "check zero claim resets outstanding to baseline");
+}
+
+/*
+ * A1-7: Check that a calling xc_domain_claim_memory(claim_pages = 0)
+ * resets the claims to the baseline.
+ */
+static int test_zero_claim_memory_resets(struct test_ctx *ctx)
+{
+    uint64_t pre_existing_claims;
+
+    rc = lib_get_total_claims(ctx, &pre_existing_claims);
+    if ( rc )
+        return rc;
+
+    /* Make a claim first to move outstanding away from the baseline. */
+    rc = lib_claim_memory(
+        ctx, ctx->dom_1, 1,
+        &(xen_memory_claim_t){ .pages = 8, .target = ctx->env->primary_node },
+        "make a claim to move outstanding away from baseline");
+    if ( rc )
+        return rc;
+
+    /* Now set a zero claim to reset outstanding back to the baseline. */
+    rc = lib_claim_memory(
+        ctx, ctx->dom_1, 1,
+        &(xen_memory_claim_t){
+            .pages = 0,
+            .target = XEN_DOMCTL_CLAIM_MEMORY_HOST
+        },
+        "set a zero claim to reset outstanding to baseline");
+    if ( rc )
+        return rc;
+
+    return lib_check_claim(ctx, pre_existing_claims, 0,
+                           "check zero claim resets outstanding to baseline");
+}
+
+/*
+ * A1-8: Check that xc_domain_claim_memory(GET) accepts nr_entries == 0 and
+ * claim_set == NULL to report the required claim-set size.
+ */
+static int test_query_claim_memory_size(struct test_ctx *ctx)
+{
+    xen_memory_claim_t claim = {};
+    uint32_t nr_entries = 0;
+
+    snprintf(ctx->result->params, sizeof(ctx->result->params),
+             "mode=get nr_entries=0 claim_set=NULL");
+
+    lib_set_step(ctx,
+                 "Query claim-set size with nr_entries=0 and claim_set=NULL");
+    rc = xc_domain_claim_memory(ctx->env->xch, ctx->dom_1,
+                                XEN_DOMCTL_CLAIM_MEMORY_GET,
+                                &nr_entries, NULL);
+    if ( rc != -1 || errno != ERANGE )
+        return lib_fail_with_errno(
+            ctx, errno,
+            "expected xc_domain_claim_memory(GET, nr_entries=0, claim_set=NULL) "
+            "to fail with ERANGE, got rc=%d and nr_entries=%u",
+            rc, nr_entries);
+
+    if ( nr_entries != 1 )
+        return lib_fail(ctx, "expected required claim-set size 1, got %u",
+                        nr_entries);
+
+    lib_set_step(ctx, "Fetch the claim set using the returned entry count");
+    rc = xc_domain_claim_memory(ctx->env->xch, ctx->dom_1,
+                                XEN_DOMCTL_CLAIM_MEMORY_GET,
+                                &nr_entries, &claim);
+    if ( rc )
+        return lib_fail_with_errno(ctx, errno,
+                                   "xc_domain_claim_memory(GET) failed");
+
+    if ( nr_entries != 1 )
+        return lib_fail(ctx, "expected one returned claim record, got %u",
+                        nr_entries);
+
+    if ( claim.target != XEN_DOMCTL_CLAIM_MEMORY_HOST || claim.pages != 0 )
+        return lib_fail(ctx,
+                        "expected a single zero host-wide claim, got target=%#x"
+                        " pages=%" PRIu64,
+                        claim.target, (uint64_t)claim.pages);
+
+    return 0;
+}
diff --git a/tools/tests/mem-claim/input-phase1.h b/tools/tests/mem-claim/input-phase1.h
new file mode 100644
index 000000000000..b86517363b96
--- /dev/null
+++ b/tools/tests/mem-claim/input-phase1.h
@@ -0,0 +1,173 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * input-phase1.h - Test Phase 1 argument validation for memory claims,
+ * including invalid claim parameters and claiming more pages than are free.
+ *
+ * I1-1 - I1-9: invalid claims are rejected with appropriate error codes.
+ *
+ * This file contains test cases to validate argument handling when dealing
+ * with NUMA-aware claim sets.
+ *
+ * Tests various invalid claim parameters (non-present node, too many claims,
+ * node id above UINT8_MAX, pages above INT32_MAX, non-zero pad, zero claim
+ * count, null claims pointer with non-zero count, and non-null claims pointer
+ * with zero count) and verify they are rejected with the expected error code.
+ */
+#include "libtestclaims.h"
+
+static int test_reject_non_present_node(struct test_ctx *ctx)
+{
+    xen_memory_claim_t claim = {
+        .pages = 1, .target = ctx->env->num_nodes, /* Out-of-range node id */
+    };
+
+    ctx->target1 = ctx->env->primary_node;
+    snprintf(ctx->result->params, sizeof(ctx->result->params),
+             "node=%u num_nodes=%u", claim.target, ctx->env->num_nodes);
+
+    return lib_expect_claim_memory_failure(
+        ctx, ctx->dom_1, 1, &claim, ENOENT,
+        "reject claim on a non-present NUMA node");
+}
+
+static int test_reject_too_many_claims(struct test_ctx *ctx)
+{
+    const uint32_t nr_claims = 0x100; /* Xen does not support such nr_claims */
+    xen_memory_claim_t claims[nr_claims];
+
+    ctx->target1 = ctx->env->primary_node;
+    for ( uint32_t i = 0; i < nr_claims; i++ )
+        claims[i] = ((xen_memory_claim_t){
+                         .pages  = 1,
+                         .target = ctx->env->primary_node,
+                     });
+
+    snprintf(ctx->result->params, sizeof(ctx->result->params), "nr_claims=%u",
+             nr_claims);
+
+    return lib_expect_claim_memory_failure(
+        ctx, ctx->dom_1, nr_claims, claims, E2BIG,
+        "reject claim list larger than the supported maximum");
+}
+
+static int test_reject_node_gt_uint8_max(struct test_ctx *ctx)
+{
+    xen_memory_claim_t claim = {
+        .pages  = 1,
+        .target = UINT8_MAX + 1U,
+    };
+
+    ctx->target1 = ctx->env->primary_node;
+    snprintf(ctx->result->params, sizeof(ctx->result->params), "node=%u",
+             claim.target);
+
+    return lib_expect_claim_memory_failure(
+        ctx, ctx->dom_1, 1, &claim, ENOENT,
+        "reject claim with node id above UINT8_MAX");
+}
+
+static int test_reject_pages_gt_int32_max(struct test_ctx *ctx)
+{
+    xen_memory_claim_t claim = {
+        .pages  = INT32_MAX + 1UL,
+        .target = ctx->env->primary_node,
+    };
+
+    ctx->target1 = ctx->env->primary_node;
+    snprintf(ctx->result->params, sizeof(ctx->result->params),
+             "pages=%" PRIu64 " node=%u", claim.pages, claim.target);
+
+    return lib_expect_claim_memory_failure(
+        ctx, ctx->dom_1, 1, &claim, ENOMEM,
+        "reject claim with pages larger than INT32_MAX");
+}
+
+static int test_reject_nonzero_pad(struct test_ctx *ctx)
+{
+    xen_memory_claim_t claim = {
+        .pages = 1,
+        .target = ctx->env->primary_node,
+        .cmd = 1,
+    };
+
+    ctx->target1 = ctx->env->primary_node;
+    snprintf(ctx->result->params, sizeof(ctx->result->params), "node=%u cmd=%u",
+             claim.target, claim.cmd);
+
+    return lib_expect_claim_memory_failure(
+        ctx, ctx->dom_1, 1, &claim, EINVAL,
+        "reject claim with non-zero cmd");
+}
+
+static int test_reject_zero_claim_count(struct test_ctx *ctx)
+{
+    snprintf(ctx->result->params, sizeof(ctx->result->params), "nr_claims=0");
+
+    return lib_expect_claim_memory_failure(
+        ctx, ctx->dom_1, 0, NULL, EINVAL,
+        "reject xc_domain_claim_memory() with nr_claims == 0");
+}
+
+static int test_null_claims_nonzero_count(struct test_ctx *ctx)
+{
+    snprintf(ctx->result->params, sizeof(ctx->result->params),
+             "nr_claims=1 claims=NULL");
+
+    return lib_expect_claim_memory_failure(
+        ctx, ctx->dom_1, 1, NULL, EFAULT,
+        "reject xc_domain_claim_memory() with claims=NULL and nr_claims == 1");
+}
+
+static int test_zero_count_valid_pointer(struct test_ctx *ctx)
+{
+    xen_memory_claim_t claim = {
+        .pages  = 1,
+        .target = ctx->env->primary_node,
+    };
+
+    snprintf(ctx->result->params, sizeof(ctx->result->params),
+             "nr_claims=0 claims=valid node=%u", claim.target);
+
+    return lib_expect_claim_memory_failure(
+        ctx, ctx->dom_1, 0, &claim, EINVAL,
+        "reject xc_domain_claim_memory() with !nr_claims but a claims pointer");
+}
+
+/*
+ * I1-9: Check both xc_domain_claim_pages() and xc_domain_claim_memory()
+ * with pages > free pages fail with ENOMEM.
+ */
+static int test_claim_pages_gt_free_enomem(struct test_ctx *ctx)
+{
+    uint64_t free_pages;
+
+    /* Get the total free memory for sizing the claim */
+    lib_get_total_free_pages(ctx, &free_pages);
+    ctx->alloc_pages = free_pages + 1;
+
+    snprintf(ctx->result->params, sizeof(ctx->result->params),
+             "claim=%" PRIu64 " free=%" PRIu64, ctx->alloc_pages, free_pages);
+
+    rc = lib_claim_pages_legacy_failure(
+        ctx, ctx->dom_1, ctx->alloc_pages, ENOMEM,
+        "reject xc_domain_claim_pages() with pages > total free pages");
+    if ( rc )
+        return rc;
+
+    rc = lib_expect_claim_memory_failure(
+        ctx, ctx->dom_1, 1,
+        &(xen_memory_claim_t){ .pages  = ctx->alloc_pages,
+                           .target = XEN_DOMCTL_CLAIM_MEMORY_HOST },
+        ENOMEM, "reject claim_memory() with pages > total free pages");
+
+    /* Get the free pages on the primary node and fail to claim more than it */
+    lib_get_node_free_pages(ctx, ctx->env->primary_node, &free_pages, NULL);
+    rc = lib_expect_claim_memory_failure(
+        ctx, ctx->dom_1, 1,
+        &(xen_memory_claim_t){
+            .pages  = free_pages + 1,
+            .target = ctx->env->primary_node
+        },
+        ENOMEM, "reject claim_memory() with pages > node free pages");
+    return rc;
+}
diff --git a/tools/tests/mem-claim/input-phase2.h b/tools/tests/mem-claim/input-phase2.h
new file mode 100644
index 000000000000..c8c4fd94931b
--- /dev/null
+++ b/tools/tests/mem-claim/input-phase2.h
@@ -0,0 +1,96 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * input-phase2.h - Test argument validation for memory claims
+ *
+ * This file contains test cases to validate argument handling when dealing
+ * with NUMA-aware claim sets.
+ */
+#include "libtestclaims.h"
+
+/* Helper to expect ENOMEM for host-wide claims */
+static int claim_expect_host_wide_enomem(struct test_ctx *ctx, uint64_t claims)
+{
+    rc = lib_claim_pages_legacy_failure(
+        ctx, ctx->dom_2, claims, ENOMEM,
+        "expect ENOMEM for xc_domain_claim_pages() with claims > spare page");
+    if ( rc )
+        return rc;
+
+    return lib_expect_claim_memory_failure(
+        ctx, ctx->dom_2, 1,
+        /* Request more than the spare to ensure failure */
+        &(xen_memory_claim_t){
+            .pages  = claims,
+            .target = XEN_DOMCTL_CLAIM_MEMORY_HOST
+        },
+        ENOMEM, "expect ENOMEM for claim_memory() with claims > spare pages");
+}
+
+/* Helper to expect ENOMEM for node-specific claims */
+static int claim_expect_enomem_on_node(struct test_ctx *ctx, uint64_t claims)
+{
+    return lib_expect_claim_memory_failure(
+        ctx, ctx->dom_2, 1,
+        /* Request more than the spare to ensure failure */
+        &(xen_memory_claim_t){ .pages = claims, .target = ctx->target1 },
+        ENOMEM,
+        "expect ENOMEM for claim_memory() with claims > spare pages");
+}
+
+/*
+ * I2-1
+ *
+ * Create a legacy claim for dom_1 using claim_pages and assert claim calls
+ * for dom_2 exceeding the unclaimed memory fail with ENOMEM.
+ */
+static int test_claim_pages_causes_enomem(struct test_ctx *ctx)
+{
+    uint64_t free_pages;
+
+    /* Get the total free memory for sizing the claim */
+    lib_get_total_free_pages(ctx, &free_pages);
+    ctx->alloc_pages = free_pages - SPARE_PAGES;
+
+    snprintf(ctx->result->params, sizeof(ctx->result->params),
+             "claim=%" PRIu64 " free=%" PRIu64, ctx->alloc_pages, free_pages);
+
+    rc = lib_claim_pages_legacy(
+        ctx, ctx->dom_1, ctx->alloc_pages,
+        "dom_1: claim nearly all global memory with claim_pages");
+    if ( rc )
+        return rc;
+
+    rc = claim_expect_host_wide_enomem(ctx, SPARE_PAGES * 2);
+    if ( !rc )
+        rc = claim_expect_enomem_on_node(ctx, SPARE_PAGES * 2);
+    return rc;
+}
+
+/*
+ * I2-2
+ *
+ * Create a host-wide claim for dom 1 using claim_memory and assert that
+ * claim calls for dom 2 that exceed the unclaimed memory fail with ENOMEM.
+ */
+static int test_host_overcommit_enomem(struct test_ctx *ctx)
+{
+    if ( lib_claim_all_on_host(ctx, ctx->dom_1, SPARE_PAGES) )
+        return -1;
+    rc = claim_expect_host_wide_enomem(ctx, SPARE_PAGES * 2);
+    if ( !rc )
+        rc = claim_expect_enomem_on_node(ctx, SPARE_PAGES * 2);
+    return rc;
+}
+
+/*
+ * I2-3
+ *
+ * Create a primary-node claim for dom 1 using claim_memory and assert that
+ * claim calls for dom 2 that exceed the unclaimed memory fail with ENOMEM.
+ */
+static int test_node_overcommit_enomem(struct test_ctx *ctx)
+{
+    if ( lib_claim_all_on_node(ctx, ctx->dom_1, ctx->target1, SPARE_PAGES) )
+        return -1;
+    return claim_expect_enomem_on_node(ctx, SPARE_PAGES * 2);
+}
diff --git a/tools/tests/mem-claim/libtestclaims.c b/tools/tests/mem-claim/libtestclaims.c
new file mode 100644
index 000000000000..c921956670e1
--- /dev/null
+++ b/tools/tests/mem-claim/libtestclaims.c
@@ -0,0 +1,980 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Functional system test framework for testing memory claims in Xen.
+ *
+ * See test-claim-memory.c for details on a test suite using this framework
+ * and the verifications it is designed to perform on behalf of a test suite.
+ *
+ * Besides providing the test suite with functionality to validate the
+ * effects of memory claims on the system, such as querying memory state,
+ * creating and destroying test domains, performing claim operations and
+ * populating memory, it also provides a consistent way to manage test
+ * state and record failures with detailed messages that include the
+ * current step, test parameters, and a snapshot of relevant memory
+ * state to aid in diagnosing issues when a test fails.
+ *
+ * It also provides the framework to select test cases, run them, and
+ * restore the system to a clean state after tests by destroying test
+ * domains to release populated memory and claims, even if a test fails
+ * partway through.
+ *
+ * The functions cover:
+ *
+ * - Managing the test_ctx structure which holds the test environment,
+ *   configuration, and results.
+ *
+ * - Providing helper functions to:
+ *   - Create and destroy domains for testing, which are needed to make claims
+ *   - Query the system's memory state in terms of free pages and outstanding
+ *     claims, which are used for sizing claims and verifying their effects.
+ *   - Perform claim operations and check their effects on the system.
+ *   - Populate memory to test the blocking effects of claims.
+ *   - Record failures with detailed messages that include the current step,
+ *     test parameters, and a snapshot of relevant memory state.
+ *
+ * - Cleanup the test environment by destroying domains after tests, ensuring
+ *   that claims are released and the system is left in a clean state even
+ *   if a test fails partway through.
+ *
+ * - Providing a consistent way to skip tests when preconditions are not met,
+ *   such as insufficient free memory or lack of multiple NUMA nodes.
+ *
+ * - Ensuring that all interactions with Xen are checked for errors, and that
+ *   any failures are reported with detailed diagnostics.
+ *
+ * - Test cases should use the provided helper functions to perform all
+ *   operations that interact with Xen or manage test state to ensure
+ *   consistent failure reporting and cleanup.
+ */
+#include <err.h>
+#include <errno.h>
+#include <getopt.h>
+#include <inttypes.h>
+#include <stdarg.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <time.h>
+
+#include <xen-tools/common-macros.h>
+
+#include "libtestclaims.h"
+
+int rc;
+static int step;
+static const struct option long_options[] = {
+    { "help",    no_argument,       NULL, 'h' },
+    { "list",    no_argument,       NULL, 'l' },
+    { "test",    required_argument, NULL, 't' },
+    { "verbose", no_argument,       NULL, 'v' },
+    { NULL,      0,                 NULL,  0  },
+};
+
+/* --- diagnostics helpers --- */
+
+/* Append formatted text to a buffer, ensuring it is always null-terminated. */
+void lib_appendf(char *buf, size_t size, const char *fmt, ...)
+{
+    va_list ap;
+    size_t used = strlen(buf);
+
+    if ( used >= size )
+        return;
+
+    va_start(ap, fmt);
+    vsnprintf(buf + used, size - used, fmt, ap);
+    va_end(ap);
+}
+
+/* Print debug information if verbose mode is enabled. */
+void lib_debugf(struct test_ctx *ctx, const char *fmt, ...)
+{
+    va_list ap;
+
+    if ( !ctx->cfg->verbose )
+        return;
+
+    fputs("      debug: ", stdout);
+
+    va_start(ap, fmt);
+    vprintf(fmt, ap);
+    va_end(ap);
+
+    fputc('\n', stdout);
+}
+
+/*
+ * Set the current test step description, which is included in failure reports.
+ * If verbose mode is enabled, also print the step to stdout.
+ */
+void lib_set_step(struct test_ctx *ctx, const char *fmt, ...)
+{
+    va_list ap;
+
+    va_start(ap, fmt);
+    vsnprintf(ctx->step, sizeof(ctx->step), fmt, ap);
+    va_end(ap);
+
+    if ( ctx->cfg->verbose )
+        printf("      step %d: %s\n", ++step, ctx->step);
+}
+
+/*
+ * Record a test failure with a formatted message and errno, and include the
+ * current step, test parameters, and a snapshot of relevant memory state in
+ * the details.
+ */
+static void append_snapshot(struct test_ctx *ctx)
+{
+    xc_physinfo_t physinfo;
+    unsigned int nodes[2] = { ctx->target1, ctx->target2 };
+
+    xc_physinfo(ctx->env->xch, &physinfo);
+    ctx_appendf(ctx,
+                "\n    snapshot: free_pages=%" PRIu64
+                ", outstanding_pages=%" PRIu64,
+                physinfo.free_pages, physinfo.outstanding_pages);
+
+    /* Include their free/total pages at the time of failure in the snapshot. */
+    for ( size_t i = 0; i < ARRAY_SIZE(nodes); i++ )
+    {
+        unsigned long free_pages, total_pages;
+        unsigned int node = nodes[i];
+
+        if ( node == INVALID_NODE )
+            continue;
+        if ( i == 1 && node == nodes[0] )
+            continue;
+
+        lib_get_node_free_pages(ctx, node, &free_pages, &total_pages);
+        ctx_appendf(ctx, "\n    snapshot: node%u free=%lu total=%lu", node,
+                    free_pages, total_pages);
+    }
+}
+
+/*
+ * Record a test failure with a formatted message and the given errno.
+ *
+ * Include the current step, test parameters, and a snapshot of relevant
+ * memory state in the details.
+ */
+int lib_fail_with_errno(struct test_ctx *ctx, int errnum, const char *fmt, ...)
+{
+    va_list ap;
+
+    ctx->result->status     = TEST_FAILED;
+    ctx->result->details[0] = '\0';
+
+    ctx_appendf(ctx, "step=%s", ctx->step[0] ? ctx->step : "(not set)");
+    ctx_appendf(ctx, "\n    dom_1=%u dom_2=%u target1=%s target2=%s",
+                ctx->dom_1, ctx->dom_2,
+                ctx->target1 == INVALID_NODE ? "n/a" : "set",
+                ctx->target2 == INVALID_NODE ? "n/a" : "set");
+
+    if ( ctx->target1 != INVALID_NODE )
+        ctx_appendf(ctx, " (%" PRIu64 ")", ctx->target1);
+    if ( ctx->target2 != INVALID_NODE )
+        ctx_appendf(ctx, " (%" PRIu64 ")", ctx->target2);
+
+    ctx_appendf(ctx, "\n    alloc_pages=%lu", ctx->alloc_pages);
+
+    ctx_appendf(ctx, "\n    cause: ");
+    va_start(ap, fmt);
+    vsnprintf(ctx->result->details + strlen(ctx->result->details),
+              sizeof(ctx->result->details) - strlen(ctx->result->details), fmt,
+              ap);
+    va_end(ap);
+
+    if ( errnum )
+        ctx_appendf(ctx, "\n    errno=%d (%s)", errnum, strerror(errnum));
+
+    append_snapshot(ctx);
+    return -1;
+}
+
+/*
+ * Record a test failure with a formatted message and the current errno.
+ *
+ * Calls lib_fail_with_errno() to do the actual recording, passing the current
+ * errno.
+ */
+int lib_fail(struct test_ctx *ctx, const char *fmt, ...)
+{
+    va_list ap;
+    int saved_errno = errno;
+    char message[1024];
+
+    va_start(ap, fmt);
+    vsnprintf(message, sizeof(message), fmt, ap);
+    va_end(ap);
+
+    return lib_fail_with_errno(ctx, saved_errno, "%s", message);
+}
+
+/*
+ * Record that a test was skipped with a formatted message.
+ *
+ * Include the message in the details to explain why the test was skipped.
+ */
+int lib_skip_test(struct test_ctx *ctx, const char *fmt, ...)
+{
+    va_list ap;
+
+    ctx->result->status     = TEST_SKIPPED;
+    ctx->result->details[0] = '\0';
+
+    va_start(ap, fmt);
+    vsnprintf(ctx->result->details, sizeof(ctx->result->details), fmt, ap);
+    va_end(ap);
+
+    return 1;
+}
+
+/* --- memory-state queries --- */
+
+/* Get the number of free and total pages for a specific NUMA node. */
+int lib_get_node_free_pages(struct test_ctx *ctx, unsigned int node,
+                            uint64_t *free_pages, uint64_t *total_pages)
+{
+    struct test_env *env = ctx->env;
+
+    if ( node >= env->num_nodes ) /* Check node validity */
+        return lib_fail(ctx, "Invalid node %u/%u", node, env->num_nodes);
+
+    if ( xc_numainfo(env->xch, &env->num_nodes, env->meminfo, NULL) )
+        return lib_fail(ctx, "xc_numainfo failed to get node memory info");
+
+    *free_pages = env->meminfo[node].memfree / XC_PAGE_SIZE;
+    if ( total_pages )
+        *total_pages = env->meminfo[node].memsize / XC_PAGE_SIZE;
+    return 0;
+}
+
+/* Get the total number of free pages available across all nodes. */
+int lib_get_total_free_pages(struct test_ctx *ctx, uint64_t *free_pages)
+{
+    struct test_env *env = ctx->env;
+    uint64_t free_bytes;
+
+    if ( xc_availheap(env->xch, 0, 0, -1, &free_bytes) )
+        return lib_fail(ctx, "xc_availheap failed to get total free pages");
+
+    *free_pages = free_bytes / XC_PAGE_SIZE;
+    return 0;
+}
+
+/* Get the current total number of outstanding claimed pages on the host. */
+int lib_get_total_claims(struct test_ctx *ctx,
+                         uint64_t *outstanding_pages_total)
+{
+    xc_physinfo_t physinfo;
+
+    if ( xc_physinfo(ctx->env->xch, &physinfo) )
+        return lib_fail(ctx, "xc_physinfo failed to get outstanding pages");
+
+    *outstanding_pages_total = physinfo.outstanding_pages;
+    return 0;
+}
+
+/* --- claim check operations --- */
+
+/* Check the current outstanding pages against the expected value. */
+int lib_check_claim(struct test_ctx *ctx, uint64_t baseline_outstanding,
+                    uint64_t expected_delta, const char *reason)
+{
+    xc_physinfo_t physinfo;
+    uint64_t expected = baseline_outstanding + expected_delta;
+
+    lib_set_step(ctx, "%s", reason);
+    if ( xc_physinfo(ctx->env->xch, &physinfo) )
+        return lib_fail(ctx, "xc_physinfo failed to get outstanding pages");
+
+    if ( physinfo.outstanding_pages != expected )
+        return lib_fail_with_errno(
+            ctx, 0, "expected outstanding_pages=%" PRIu64 ", got %" PRIu64,
+            expected, physinfo.outstanding_pages);
+    return 0;
+}
+
+/* --- domain lifecycle --- */
+
+/*
+ * Create a domain with the specified configuration and label.
+ * Record a failure if the creation or maxmem setting fails.
+ *
+ * On success, the new domain ID is stored in *domid.
+ */
+int lib_create_domain(struct test_ctx *ctx, uint32_t *domid, const char *label)
+{
+    struct xen_domctl_createdomain create = ctx->env->create_template;
+
+    lib_set_step(ctx, "create %s domain", label);
+    *domid = DOMID_INVALID;
+    if ( xc_domain_create(ctx->env->xch, domid, &create) )
+        return lib_fail(ctx, "xc_domain_create(%s) failed", label);
+
+    lib_set_step(ctx, "set maxmem for %s domain", label);
+    if ( xc_domain_setmaxmem(ctx->env->xch, *domid, -1) )
+    {
+        lib_destroy_domain(ctx, domid, label);
+        return lib_fail(ctx, "xc_domain_setmaxmem(%s) failed", label);
+    }
+
+    return 0;
+}
+
+/*
+ * Destroy the specified domain, if it is valid.
+ * Add the destroy step with the given label to the current test description.
+ * Record a failure if the destroy operation fails.
+ *
+ * This should be called during test cleanup to ensure domains are destroyed
+ * and claims are released even if a test fails partway through.
+ */
+int lib_destroy_domain(struct test_ctx *ctx, uint32_t *domid, const char *label)
+{
+    if ( *domid == DOMID_INVALID )
+        return 0;
+
+    lib_set_step(ctx, "destroy %s domain", label);
+    rc     = xc_domain_destroy(ctx->env->xch, *domid);
+    *domid = DOMID_INVALID;
+    if ( rc )
+    {
+        if ( ctx->result->status == TEST_FAILED )
+        {
+            ctx_appendf(ctx,
+                        "\n    cleanup: xc_domain_destroy(%s) failed: %d (%s)",
+                        label, errno, strerror(errno));
+            return -1;
+        }
+
+        return lib_fail(ctx, "xc_domain_destroy(%s) failed", label);
+    }
+
+    return 0;
+}
+
+/* --- claim operations --- */
+
+/*
+ * Attempt to claim memory with the specified parameters.
+ * Record the failure if the claim operation fails.
+ */
+int lib_claim_memory(struct test_ctx *ctx, uint32_t domid, uint32_t records,
+                     xen_memory_claim_t *claim_set, const char *reason)
+{
+    lib_set_step(ctx, "%s", reason);
+    rc = xc_domain_claim_memory(ctx->env->xch, domid,
+                                XEN_DOMCTL_CLAIM_MEMORY_SET, &records,
+                                claim_set);
+    if ( rc )
+    {
+        uint64_t outstanding_pages, node_free, total_pages;
+
+        lib_get_node_free_pages(ctx, ctx->target1, &node_free, &total_pages);
+        lib_get_total_claims(ctx, &outstanding_pages);
+
+        return lib_fail(ctx,
+                        "xc_domain_claim_memory failed: node=%" PRIu64
+                        "\n    total_outstanding: %" PRIu64
+                        "\n          total_pages: %" PRIu64
+                        "\n      node free_pages: %" PRIu64,
+                        ctx->target1, outstanding_pages, total_pages,
+                        node_free);
+    }
+    return rc;
+}
+
+/*
+ * Attempt to claim memory with the specified parameters, expecting it to fail
+ * with the specified errno. Record a failure if it does not fail as expected.
+ */
+int lib_expect_claim_memory_failure(struct test_ctx *ctx, uint32_t domid,
+                                    uint32_t records,
+                                    xen_memory_claim_t *claim_set,
+                                    int expected_errno, const char *reason)
+{
+    lib_set_step(ctx, "%s", reason);
+    rc = xc_domain_claim_memory(ctx->env->xch, domid,
+                                XEN_DOMCTL_CLAIM_MEMORY_SET, &records,
+                                claim_set);
+    if ( rc == -1 && errno == expected_errno )
+        return 0;
+
+    return lib_fail_with_errno(ctx, errno,
+                               "expected xc_domain_claim_memory() to fail with "
+                               "errno=%d (%s), got rc=%d",
+                               expected_errno, strerror(expected_errno), rc);
+}
+
+/*
+ * Release all claims for the specified domain by setting a zero claim.
+ * Record the failure if the claim release operation fails.
+ */
+int lib_release_all_claims(struct test_ctx *ctx, uint32_t domid)
+{
+    uint32_t records = 1;
+
+    lib_set_step(ctx, "release all claims with zero claim");
+    rc = xc_domain_claim_memory(ctx->env->xch, domid,
+                                XEN_DOMCTL_CLAIM_MEMORY_SET, &records,
+                                &(xen_memory_claim_t){});
+    if ( rc )
+        return lib_fail(ctx, "xc_domain_claim_memory(..., pages=0) failed");
+    return 0;
+}
+
+/*
+ * Claim all available memory on the host except for a specified number
+ * of pages to spare. Record the failure if the claim operation fails.
+ */
+int lib_claim_all_on_host(struct test_ctx *ctx, uint32_t domid,
+                          unsigned int spare)
+{
+    unsigned long free_pages;
+    unsigned long claim_pages = 0;
+
+    lib_set_step(ctx, "claim all except %u pages on host", spare);
+    lib_get_total_free_pages(ctx, &free_pages);
+    if ( free_pages <= spare )
+        return lib_fail(ctx, "Not enough free pages @ host, spare=%u, free=%lu",
+                        spare, free_pages);
+
+    claim_pages += free_pages - spare;
+    snprintf(ctx->result->params, sizeof(ctx->result->params),
+             "claim all pages except %u pages on host claim=%lu free=%lu",
+             spare, claim_pages, free_pages);
+    return lib_claim_memory(
+        ctx, domid, 1,
+        &(xen_memory_claim_t){
+            .pages  = claim_pages,
+            .target = XEN_DOMCTL_CLAIM_MEMORY_HOST
+        },
+        ctx->result->params);
+}
+
+/*
+ * Claim all available memory on the specified node, except for the given
+ * spare pages to tolerate minor fluctuations in free memory.
+ *
+ * Verify the domain's outstanding claims after installing the claim.
+ */
+int lib_claim_all_on_node(struct test_ctx *ctx, uint32_t domid,
+                          unsigned int node, unsigned int spare)
+{
+    uint64_t global_before, global_after, free_pages, claim_pages = 0;
+    uint64_t dom_claims_before;
+    xc_domaininfo_t info;
+
+    lib_set_step(ctx, "claim all except %u pages on node %u", spare, node);
+    lib_get_node_free_pages(ctx, node, &free_pages, NULL);
+    if ( free_pages <= spare )
+        return lib_fail(ctx, "Not enough pages @ node %u, spare=%u, free=%lu",
+                        node, spare, free_pages);
+
+    claim_pages += free_pages - spare;
+    snprintf(ctx->result->params, sizeof(ctx->result->params),
+             "claim all pages except %u pages on node %u claim=%lu free=%lu",
+             spare, node, claim_pages, free_pages);
+
+    /*
+     * For asserting the claims state after installing the claim, we need
+     * to know both the total outstanding claims and the domain's outstanding.
+     */
+    lib_get_total_claims(ctx, &global_before);
+    if ( xc_domain_getinfo_single(ctx->env->xch, domid, &info) )
+        return lib_fail(ctx, "xc_domain_getinfo failed to get domain claims");
+    dom_claims_before = info.outstanding_pages;
+
+    rc = lib_claim_memory(
+        ctx, domid, 1,
+        &(xen_memory_claim_t){ .pages = claim_pages, .target = node },
+        ctx->result->params);
+    if ( rc )
+        return rc;
+    lib_get_total_claims(ctx, &global_after);
+
+    if ( xc_domain_getinfo_single(ctx->env->xch, domid, &info) )
+        return lib_fail(ctx, "xc_domain_getinfo failed to get domain claims");
+
+    if ( info.outstanding_pages != claim_pages )
+        return lib_fail(ctx, "unexpected claims installation: exp=%lu, got=%lu",
+                        claim_pages, info.outstanding_pages);
+
+    if ( global_after - global_before != claim_pages - dom_claims_before )
+        return lib_fail(ctx, "unexpexcted delta @ node %u: exp=%lu, got=%lu",
+                        node, claim_pages, global_before - global_after);
+    return 0;
+}
+
+/*
+ * Attempt to claim memory with the legacy xc_domain_claim_pages() API.
+ * Record the failure if the claim operation fails.
+ */
+int lib_claim_pages_legacy(struct test_ctx *ctx, uint32_t domid,
+                           unsigned long nr_pages, const char *reason)
+{
+    lib_set_step(ctx, "%s", reason);
+    rc = xc_domain_claim_pages(ctx->env->xch, domid, nr_pages);
+    if ( rc )
+        return lib_fail(ctx, "xc_domain_claim_pages(%lu) failed", nr_pages);
+    return 0;
+}
+
+/*
+ * Attempt to claim memory with the legacy xc_domain_claim_pages() API.
+ * Expect it to fail with the specified errno.
+ * Record a failure on success or if it fails with an unexpected errno.
+ */
+int lib_claim_pages_legacy_failure(struct test_ctx *ctx, uint32_t domid,
+                                   unsigned long request, int expected_errno,
+                                   const char *reason)
+{
+    uint64_t outstanding_claims, free_pages;
+
+    /*
+     * Sanity check: Check that there are not enough free pages for installing
+     * the claim, as this is the only condition under which the claim install
+     * is expected to fail with ENOMEM. If this fails, the previous actions
+     * of the test did not properly set up the expected conditions for the
+     * claim to fail, so we record this as the cause of failure.
+     */
+    lib_get_total_claims(ctx, &outstanding_claims);
+    lib_get_total_free_pages(ctx, &free_pages);
+    if ( request < free_pages - outstanding_claims )
+        return lib_fail(ctx,
+                        "too many unclaimed pages to expect ENOMEM: "
+                        "request=%lu, free=%" PRIu64 " - claims=%" PRIu64
+                        "=%" PRIu64,
+                        request, free_pages, outstanding_claims,
+                        free_pages - outstanding_claims);
+    lib_set_step(ctx, "%s", reason);
+    rc = xc_domain_claim_pages(ctx->env->xch, domid, request);
+    if ( rc == -1 && errno == expected_errno )
+        return 0;
+
+    return lib_fail_with_errno(ctx, errno,
+                               "expected xc_domain_claim_pages() to fail "
+                               "with errno=%d(%s), got rc=%d",
+                               expected_errno, strerror(expected_errno), rc);
+}
+
+/* --- physmap population --- */
+
+/*
+ * Private helper function to populate extents at the specified GPFN
+ * with the xc_domain_populate_physmap() API, and return the result code.
+ *
+ * Tests may use its callers lib_populate_success() or lib_populate_failure()
+ * which record the failure the actual result did not match the expectation.
+ */
+static int lib_populate_physmap(struct test_ctx *ctx, lib_populate_args_t args)
+{
+    xen_pfn_t *frames;
+
+    frames = calloc(args.nr_extents, sizeof(*frames));
+    if ( !frames )
+        return lib_fail(ctx, "calloc(%lu) failed", args.nr_extents);
+
+    for ( unsigned long i = 0; i < args.nr_extents; i++ )
+        frames[i] = args.start + i;
+
+    errno = 0;
+    rc    = xc_domain_populate_physmap_exact(ctx->env->xch, args.domid,
+                                             args.nr_extents, args.order,
+                                             args.flags, frames);
+    free(frames);
+    return rc;
+}
+
+/*
+ * Populate extents at the specified GPFN with checking if it
+ * succeeded. Record the failure with diagnostics if it did not.
+ */
+int lib_populate_success(struct test_ctx *ctx, lib_populate_args_t args)
+{
+    rc = lib_populate_physmap(ctx, args);
+    if ( rc )
+        return lib_fail(ctx, "expected populate to succeed for node %u",
+                        XENMEMF_get_node(args.flags));
+    return 0;
+}
+
+/*
+ * Attempt to populate extents at the specified GPFN with checking if it
+ * failed. Record a failure with diagnostics if it did not fail as expected.
+ */
+int lib_populate_failure(struct test_ctx *ctx, lib_populate_args_t args)
+{
+    rc = lib_populate_physmap(ctx, args);
+    if ( rc == 0 )
+        return lib_fail_with_errno(
+            ctx, 0, "expected exact-node populate to fail for node %u",
+            XENMEMF_get_node(args.flags));
+    return 0;
+}
+
+/* --- test runner --- */
+
+static double timespec_diff_ms(const struct timespec *start,
+                               const struct timespec *end)
+{
+    double sec  = (double)(end->tv_sec - start->tv_sec);
+    double nsec = (double)(end->tv_nsec - start->tv_nsec);
+
+    return sec * 1000.0 + nsec / 1e6;
+}
+
+static void usage(FILE *stream, const char *prog)
+{
+    fprintf(stream,
+            "Usage: %s [OPTIONS]\n\n"
+            "Options:\n"
+            "  -l, --list         List available test IDs and exit\n"
+            "  -t, --test ID      Run only the specified test ID (repeatable)\n"
+            "  -v, --verbose      Print per-step progress\n"
+            "  -h, --help         Show this help text\n",
+            prog);
+}
+
+int lib_print_available_tests(const struct test_case *cases, size_t num_cases)
+{
+    puts("Available tests:");
+    for ( size_t i = 0; i < num_cases; i++ )
+        printf("  %s  %s\n", cases[i].id, cases[i].name);
+    return 0;
+}
+
+/*
+ * Parse command-line arguments to configure the test run.
+ * It populates the runtime_config struct with the parsed configuration,
+ * including test IDs and the verbose flag.
+ *
+ * It supports filtering tests by test ID and enabling verbose output.
+ * If --list is specified, prints available tests and exits.
+ * By default, all tests will be run with concise output.
+ * If cfg.list_only is set, the caller should exit after this function returns.
+ *
+ * Returns 0 on success, or 1 on failure (invalid arguments)
+ */
+int lib_parse_args(int argc, char *argv[], struct runtime_config *cfg)
+{
+    int opt;
+
+    while ( (opt = getopt_long(argc, argv, "hlt:v", long_options, NULL)) != -1 )
+    {
+        switch ( opt )
+        {
+        case 'h':
+            usage(stdout, argv[0]);
+        case 'l':
+            cfg->list_only = true;
+            break;
+
+        case 't':
+            if ( cfg->nr_selected_ids >= ARRAY_SIZE(cfg->selected_ids) )
+                errx(1, "too many --test selectors (max %zu)",
+                     ARRAY_SIZE(cfg->selected_ids));
+            cfg->selected_ids[cfg->nr_selected_ids++] = optarg;
+            break;
+
+        case 'v':
+            cfg->verbose = true;
+            break;
+
+        default:
+            usage(stderr, argv[0]);
+            return 1;
+        }
+    }
+
+    if ( cfg->list_only )
+        return 0;
+
+    printf("========= testcase program: %s ==========\n", argv[0]);
+    if ( cfg->nr_selected_ids )
+    {
+        printf("Selected %zu test(s):\n", cfg->nr_selected_ids);
+        for ( size_t i = 0; i < cfg->nr_selected_ids; i++ )
+            printf("  %s\n", cfg->selected_ids[i]);
+    }
+    return 0;
+}
+
+/*
+ * Run a single test case, capturing results and ensuring cleanup.
+ *
+ * Outstanding claims are tracked baseline_outstanding are are checked
+ * to be reset to the baseline at the end of the test, ensuring that all
+ * claims are released after each test case.
+ *
+ * Returns 0 on success, or -1 on failure with result details populated.
+ */
+int lib_run_one_test(struct test_env *env, const struct runtime_config *cfg,
+                     const struct test_case *test, struct test_result *result)
+{
+    struct test_ctx ctx = {
+        .env         = env,
+        .cfg         = cfg,
+        .result      = result,
+        .dom_1       = DOMID_INVALID,
+        .dom_2       = DOMID_INVALID,
+        .target1     = env->primary_node,
+        .target2     = INVALID_NODE,
+        .alloc_pages = 0,
+        .step        = "",
+    };
+    uint64_t baseline_outstanding;
+    struct timespec start, end;
+
+    if ( env->num_nodes >= 2 )
+        ctx.target2 = env->secondary_node;
+
+    result->test        = test;
+    result->status      = TEST_PASSED;
+    result->params[0]   = '\0';
+    result->details[0]  = '\0';
+    result->duration_ms = 0.0;
+
+    /*
+     * Fixture: capture baseline, create the primary domain, run the test
+     * body, then always destroy any remaining test domains and verify
+     * outstanding pages returned to baseline.
+     */
+    rc = lib_get_total_claims(&ctx, &baseline_outstanding);
+    if ( rc )
+        goto out;
+
+    rc = lib_create_domain(&ctx, &ctx.dom_1, "primary");
+    if ( rc )
+        goto out;
+
+    rc = lib_create_domain(&ctx, &ctx.dom_2, "secondary");
+    if ( rc )
+        goto out;
+
+    clock_gettime(CLOCK_MONOTONIC, &start);
+
+    errno = 0;
+    rc    = test->test(&ctx); /* Run the test body */
+
+    clock_gettime(CLOCK_MONOTONIC, &end);
+    result->duration_ms = timespec_diff_ms(&start, &end);
+
+    if ( rc > 0 && result->status == TEST_SKIPPED )
+        rc = 0;
+
+ out:
+    /* Cleanup test domains without affecting the return code if rc != 0 */
+    if ( lib_destroy_domain(&ctx, &ctx.dom_2, "helper") && !rc )
+        rc = -1;
+
+    if ( lib_destroy_domain(&ctx, &ctx.dom_1, "primary") && !rc )
+        rc = -1;
+
+    if ( !rc &&
+         lib_check_claim(&ctx, baseline_outstanding, 0,
+                         "check cleanup restored baseline claimed pages") )
+        rc = -1;
+
+    if ( rc < 0 )
+        result->status = TEST_FAILED;
+
+    return rc;
+}
+
+/*
+ * Run all test cases, filtering based on the runtime configuration, and print
+ * results to stdout. Each test case is run with lib_run_one_test() which
+ * captures detailed diagnostics on failure.
+ */
+void lib_run_tests(struct test_env *env, char *argv0,
+                   const struct runtime_config *cfg,
+                   const struct test_case *test_cases,
+                   unsigned int num_test_cases, struct test_result *results)
+{
+    for ( size_t i = 0; i < num_test_cases; i++ )
+    {
+        struct test_result *result = &results[i];
+
+        if ( !test_is_selected(cfg, &test_cases[i]) )
+            continue;
+
+        lib_run_one_test(env, cfg, &test_cases[i], result);
+
+        /* Print a summary: test, result, including parameters and duration. */
+        printf("%s::%s [%s] %s (%.2f ms)\n", argv0, result->test->id,
+               result->params[0] ? result->params : "default",
+               status_name(result->status), result->duration_ms);
+
+        if ( result->status == TEST_FAILED || result->status == TEST_SKIPPED )
+            printf("    %s\n", result->details);
+    }
+}
+
+/*
+ * Print a concise summary of test results, including counts of passed, failed,
+ * and skipped tests, and details for any failures or skips.
+ */
+int lib_summary(const struct test_result *results, unsigned int num_results)
+{
+    unsigned int passed = 0, failed = 0, skipped = 0;
+
+    puts("================== short test summary info =================");
+    for ( size_t i = 0; i < num_results; i++ )
+    {
+        if ( !results[i].test )
+            continue;
+
+        printf("%s %s %s\n", status_name(results[i].status),
+               results[i].test->id, results[i].test->name);
+
+        switch ( results[i].status )
+        {
+        case TEST_PASSED:
+            passed++;
+            break;
+        case TEST_FAILED:
+            failed++;
+            printf("    %s\n", results[i].details);
+            break;
+        case TEST_SKIPPED:
+            skipped++;
+            printf("    %s\n", results[i].details);
+            break;
+        }
+    }
+    printf("============ %u passed, %u failed, %u skipped ============\n",
+           passed, failed, skipped);
+    return failed;
+}
+
+/* Update the create_template structure based on the host's capabilities */
+static void fixup_create_template(struct xen_domctl_createdomain *create,
+                                  const xc_physinfo_t *physinfo)
+{
+#if defined(__x86_64__) || defined(__i386__)
+    if ( !(physinfo->capabilities & XEN_SYSCTL_PHYSCAP_hap) )
+        create->flags &= ~XEN_DOMCTL_CDF_hap;
+
+    if ( !(physinfo->capabilities &
+           (XEN_SYSCTL_PHYSCAP_hap | XEN_SYSCTL_PHYSCAP_shadow)) ||
+         !(physinfo->capabilities & XEN_SYSCTL_PHYSCAP_hvm) )
+    {
+        create->flags &= ~XEN_DOMCTL_CDF_hvm;
+        create->arch.emulation_flags = 0;
+    }
+#else
+    (void)physinfo;
+#endif
+}
+
+/*
+ * Initialise the test environment by opening the Xen control interface,
+ * querying the number of NUMA nodes, and populating memory information.
+ * Returns 0 on success, or -1 on failure with errno set.
+ */
+int lib_initialise_test_env(struct test_env *env)
+{
+    xc_physinfo_t physinfo;
+
+    env->xch = xc_interface_open(NULL, NULL, 0);
+    if ( !env->xch )
+        err(1, "xc_interface_open");
+
+    /*
+     * Get the number of nodes to allocate xc_meminfo_t structures for.
+     * If NUMA is disabled, this will return one node, so we can still
+     * run tests that don't require > 1 NUMA node on non-NUMA hosts.
+     */
+    xc_numainfo(env->xch, &env->num_nodes, NULL, NULL);
+
+    /* Allocate memory for xc_meminfo_t structures */
+    env->meminfo = calloc(env->num_nodes, sizeof(*env->meminfo));
+    if ( !env->meminfo )
+        err(1, "calloc");
+
+    /* Populate meminfo structures with current data */
+    xc_numainfo(env->xch, &env->num_nodes, env->meminfo, NULL);
+    xc_physinfo(env->xch, &physinfo);
+
+    /* Initialise the create_template structure */
+    env->create_template = (struct xen_domctl_createdomain){
+        .flags            = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
+        .max_vcpus        = 1,
+        .max_grant_frames = 1,
+        .grant_opts       = XEN_DOMCTL_GRANT_version(1),
+#if defined(__x86_64__) || defined(__i386__)
+        .arch = { .emulation_flags = XEN_X86_EMU_LAPIC, },
+#endif
+    };
+    /* Update the create_template structure based on the host's capabilities */
+    fixup_create_template(&env->create_template, &physinfo);
+
+    env->primary_node        = 0;
+    env->secondary_node      = 0;
+    env->have_secondary_node = false;
+
+    /*
+     * Pick the node with the most free memory as the primary node, and if
+     * there's a second node, pick the one with the next most free memory as
+     * the secondary.
+     */
+    for ( unsigned int i = 1; i < env->num_nodes; i++ )
+    {
+        if ( env->meminfo[i].memfree > env->meminfo[env->primary_node].memfree )
+        {
+            env->secondary_node      = env->primary_node;
+            env->primary_node        = i;
+            env->have_secondary_node = true;
+        }
+        else if ( !env->have_secondary_node ||
+                  env->meminfo[i].memfree >
+                  env->meminfo[env->secondary_node].memfree )
+        {
+            env->secondary_node      = i;
+            env->have_secondary_node = true;
+        }
+    }
+
+    if ( env->num_nodes < 2 )
+        env->have_secondary_node = false;
+    else if ( env->secondary_node == env->primary_node )
+    {
+        for ( unsigned int i = 0; i < env->num_nodes; i++ )
+        {
+            if ( i != env->primary_node )
+            {
+                env->secondary_node      = i;
+                env->have_secondary_node = true;
+                break;
+            }
+        }
+    }
+
+    return 0;
+}
+
+/* Free allocated memory and close the Xen control interface */
+void lib_release_test_env(struct test_env *env)
+{
+    free(env->meminfo);
+    env->meminfo = NULL;
+
+    if ( env->xch )
+    {
+        xc_interface_close(env->xch);
+        env->xch = NULL;
+    }
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/tools/tests/mem-claim/libtestclaims.h b/tools/tests/mem-claim/libtestclaims.h
new file mode 100644
index 000000000000..4fb171effd52
--- /dev/null
+++ b/tools/tests/mem-claim/libtestclaims.h
@@ -0,0 +1,203 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Header file for the functional system test framework
+ * testing for memory claims in the Xen hypervisor.
+ *
+ * This header declares the interface for the test framework implemented
+ * in libtestclaims.c.
+ *
+ * It includes the definitions of the test environment, test context, and
+ * helper functions for performing memory claim operations, querying memory
+ * state, managing test domains, and recording test results.
+ */
+#ifndef _LIBTEST_MEM_CLAIMS_
+#define _LIBTEST_MEM_CLAIMS_
+
+#include <limits.h>
+#include <stdbool.h>
+#include <stdint.h>
+#include <stdlib.h>
+
+#include <xenctrl.h>
+
+#define MAX_SELECTED_TESTS 32
+#define INVALID_NODE       UINT_MAX
+#define SPARE_PAGES        200
+
+struct test_env {
+    xc_interface                  *xch;
+    struct xen_domctl_createdomain create_template;
+    unsigned int                   num_nodes;
+    unsigned int                   primary_node;
+    unsigned int                   secondary_node;
+    bool                           have_secondary_node;
+    xc_meminfo_t                  *meminfo;
+};
+
+struct runtime_config {
+    const char *selected_ids[MAX_SELECTED_TESTS];
+    size_t      nr_selected_ids;
+    bool        list_only;
+    bool        verbose;
+};
+
+enum test_status {
+    TEST_PASSED,
+    TEST_FAILED,
+    TEST_SKIPPED,
+};
+
+struct test_case;
+
+struct test_result {
+    const struct test_case *test;
+    enum test_status        status;
+    char                    params[256];
+    char                    details[4096];
+    double                  duration_ms;
+};
+
+struct test_ctx {
+    struct test_env             *env;
+    const struct runtime_config *cfg;
+    struct test_result          *result;
+    uint32_t                     dom_1;
+    uint32_t                     dom_2;
+    uint64_t                     target1;
+    uint64_t                     target2;
+    uint64_t                     alloc_pages;
+    char                         step[160];
+};
+
+struct lib_populate_physmap_args {
+    uint32_t      domid;
+    xen_pfn_t     start;
+    unsigned long nr_extents;
+    unsigned int  order;
+    unsigned int  flags;
+};
+typedef struct lib_populate_physmap_args lib_populate_args_t;
+
+/*
+ * test_fn_t: the test body.  Called after the fixture has created
+ * ctx->domid and captured a baseline outstanding-pages count.  Tests needing
+ * extra domains should create and destroy them explicitly.
+ * Returns 0 on pass, -1 on fail, 1 on skip.
+ */
+typedef int (*test_fn_t)(struct test_ctx *ctx);
+
+struct test_case {
+    const char *id;
+    const char *name;
+    test_fn_t   test;
+};
+
+/* --- diagnostics helpers --- */
+void lib_appendf(char *buf, size_t size, const char *fmt, ...)
+__attribute__((format(printf, 3, 4)));
+
+/* Append a formatted string to ctx->result->details. */
+#define ctx_appendf(ctx, ...)                                               \
+        lib_appendf((ctx)->result->details, sizeof((ctx)->result->details), \
+                    __VA_ARGS__)
+void lib_debugf(struct test_ctx *ctx, const char *fmt, ...)
+__attribute__((format(printf, 2, 3)));
+void lib_set_step(struct test_ctx *ctx, const char *fmt, ...)
+__attribute__((format(printf, 2, 3)));
+int lib_fail_with_errno(struct test_ctx *ctx, int errnum, const char *fmt, ...)
+__attribute__((format(printf, 3, 4)));
+int lib_fail(struct test_ctx *ctx, const char *fmt, ...)
+__attribute__((format(printf, 2, 3)));
+int lib_skip_test(struct test_ctx *ctx, const char *fmt, ...)
+__attribute__((format(printf, 2, 3)));
+
+/* --- memory-state queries --- */
+int lib_get_node_free_pages(struct test_ctx *ctx, unsigned int node,
+                            unsigned long *free_pages,
+                            unsigned long *total_pages);
+int lib_get_total_free_pages(struct test_ctx *ctx, unsigned long *free_pages);
+int lib_get_total_claims(struct test_ctx *ctx,
+                         uint64_t *outstanding_pages_global);
+int lib_check_claim(struct test_ctx *ctx, uint64_t baseline_outstanding,
+                    uint64_t expected_delta, const char *reason);
+
+/* --- domain lifecycle --- */
+int lib_create_domain(struct test_ctx *ctx, uint32_t *domid, const char *label);
+int lib_destroy_domain(struct test_ctx *ctx, uint32_t *domid,
+                       const char *label);
+
+/* --- claim operations --- */
+int lib_claim_memory(struct test_ctx *ctx, uint32_t domid, uint32_t nr_claims,
+                     xen_memory_claim_t *claims, const char *reason);
+int lib_expect_claim_memory_failure(struct test_ctx *ctx, uint32_t domid,
+                                    uint32_t nr_claims,
+                                    xen_memory_claim_t *claims,
+                                    int expected_errno, const char *reason);
+int lib_release_all_claims(struct test_ctx *ctx, uint32_t domid);
+int lib_claim_pages_legacy(struct test_ctx *ctx, uint32_t domid,
+                           unsigned long nr_pages, const char *reason);
+int lib_claim_pages_legacy_failure(struct test_ctx *ctx, uint32_t domid,
+                                   unsigned long nr_pages, int expected_errno,
+                                   const char *reason);
+int lib_claim_all_on_host(struct test_ctx *ctx, uint32_t domid,
+                          unsigned int spare);
+int lib_claim_all_on_node(struct test_ctx *ctx, uint32_t domid, uint32_t node,
+                          uint32_t spare);
+
+/* --- physmap --- */
+int lib_populate_success(struct test_ctx *ctx, lib_populate_args_t args);
+int lib_populate_failure(struct test_ctx *ctx, lib_populate_args_t args);
+
+/* --- test runner --- */
+int  lib_print_available_tests(const struct test_case *cases, size_t num_cases);
+int  lib_parse_args(int argc, char *argv[], struct runtime_config *cfg);
+int  lib_run_one_test(struct test_env *env, const struct runtime_config *cfg,
+                      const struct test_case *test, struct test_result *result);
+void lib_run_tests(struct test_env *env, char *argv0,
+                   const struct runtime_config *cfg,
+                   const struct test_case *test_cases,
+                   unsigned int num_test_cases, struct test_result *results);
+int  lib_summary(const struct test_result *results, unsigned int num_results);
+int  lib_initialise_test_env(struct test_env *env);
+void lib_release_test_env(struct test_env *env);
+unsigned long lib_default_alloc_pages(unsigned long free_pages);
+
+extern int rc;
+
+static inline const char *status_name(enum test_status status)
+{
+    switch ( status )
+    {
+    case TEST_PASSED:
+        return "PASSED";
+    case TEST_FAILED:
+        return "FAILED";
+    case TEST_SKIPPED:
+        return "SKIPPED";
+    }
+    return "UNKNOWN";
+}
+
+static inline bool test_is_selected(const struct runtime_config *cfg,
+                                    const struct test_case *test)
+{
+    if ( !cfg->nr_selected_ids )
+        return true;
+
+    for ( size_t i = 0; i < cfg->nr_selected_ids; i++ )
+        if ( !strcmp(cfg->selected_ids[i], test->id) )
+            return true;
+    return false;
+}
+
+#endif /* _LIBTEST_MEM_CLAIMS_ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/tools/tests/mem-claim/test-claim-memory.c b/tools/tests/mem-claim/test-claim-memory.c
new file mode 100644
index 000000000000..006b1f534e50
--- /dev/null
+++ b/tools/tests/mem-claim/test-claim-memory.c
@@ -0,0 +1,130 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Functional system test suite for testing memory claims in Xen.
+ *
+ * It is designed to test the xc_domain_claim_memory() API and
+ * to reconfirm the xc_domain_claim_pages() API and interacts
+ * with the running Xen hypervisor in Dom0 using libxenctrl.
+ *
+ * The verifications performed by the test cases include:
+ *
+ * - Validating that claims can be successfully made with valid parameters
+ *   and that they have the expected effects on the system's memory state,
+ *   such as increasing the number of outstanding claimed pages.
+ *
+ * - Validating that invalid claim attempts are rejected with the expected
+ *   error codes, such as EINVAL for invalid parameters or ENOMEM when
+ *   claiming more pages than are free.
+ *
+ * - Validating the effects of memory claims on the system, such as blocking
+ *   effects when claiming more pages than are free or left unclaimed by
+ *   other domains, and the guarantees provided by claims such as reserved
+ *   claimed pages not being allocated to other domains.
+ *
+ * For the need to perform these verifications, the test cases interact
+ * with the Xen hypervisor to query the system's memory state, create and
+ * destroy test domains, perform claim operations, and populate memory to
+ * test the blocking effects of claims.
+ *
+ * As the act of testing the blocking effects of claims involves allocating
+ * memory from the system, other operations that interact with the system's
+ * memory state should be avoided or kept to a minimum during the test run
+ * to avoid interference with the test results.
+ *
+ * During these interactions, the test cases record successes and failures
+ * with detailed messages that include the current step, test parameters,
+ * and a snapshot of relevant memory state to aid in diagnosing issues
+ * when a test fails.
+ *
+ * The test suite also ensures that domains are destroyed after tests to
+ * clean up claims and leave the system in a clean state, even if a test
+ * fails partway through.
+ *
+ * Some test cases that require multiple NUMA nodes can be skipped if the
+ * system does not have a 2nd NUMA node, allowing the test suite to be run
+ * on single-node systems as well.
+ *
+ * It is designed to run on a quiet system as it stakes claims on the system's
+ * memory and verifies their effects, by allocating against the running system
+ * Xen hypervisor in Dom0 using libxenctrl.
+ */
+#include <err.h>
+#include <errno.h>
+#include <limits.h>
+#include <stdio.h>
+#include <inttypes.h>
+#include <stdlib.h>
+#include <string.h>
+
+#include <xen-tools/common-macros.h>
+
+#include "libtestclaims.h"
+#include "accounting-1.h"
+#include "input-phase1.h"
+#include "input-phase2.h"
+
+/* Short helper to declare test cases more concisely. */
+#define CASE(ID, NAME, FN)                           \
+        {                                            \
+            .id = (ID), .name = (NAME), .test = (FN) \
+        }
+
+/*
+ * List of test cases.  lib_run_tests() iterates over this list to run tests.
+ *
+ * Tests are identified by their id (e.g. "A1-1") and have a descriptive name
+ * and a function pointer to the test implementation.
+ */
+static const struct test_case cases[] = {
+    CASE("A1-1", "basic_node_claim", test_basic_node_claim),
+    CASE("A1-2", "host_wide_replace_after_alloc", test_update_host_after_alloc),
+    CASE("A1-3", "node_replace_after_alloc", test_node_replace_after_alloc),
+    CASE("A1-4", "legacy_host_wide_claim", test_legacy_host_wide_claim),
+    CASE("A1-5", "move_claim_between_nodes", test_move_claim_between_nodes),
+    CASE("A1-6", "zero_claim_resets_claim", test_zero_claim_resets_claim),
+    CASE("A1-7", "zero_claim_memory_reset", test_zero_claim_memory_resets),
+    CASE("A1-8", "query_claim_memory_size", test_query_claim_memory_size),
+    CASE("I1-1", "reject_non_present_node", test_reject_non_present_node),
+    CASE("I1-2", "reject_too_many_claims", test_reject_too_many_claims),
+    CASE("I1-3", "reject_node_gt_uint8_max", test_reject_node_gt_uint8_max),
+    CASE("I1-4", "reject_pages_gt_int32_max", test_reject_pages_gt_int32_max),
+    CASE("I1-5", "reject_nonzero_pad", test_reject_nonzero_pad),
+    CASE("I1-6", "reject_zero_claim_count", test_reject_zero_claim_count),
+    CASE("I1-7", "null_claims_nonzero_count", test_null_claims_nonzero_count),
+    CASE("I1-8", "zero_count_with_pointer", test_zero_count_valid_pointer),
+    CASE("I1-9", "claim_pages_gt_free_enomem", test_claim_pages_gt_free_enomem),
+    CASE("I2-1", "claim_pages_causes_enomem", test_claim_pages_causes_enomem),
+    CASE("I2-2", "claim_memory_causes_enomem", test_host_overcommit_enomem),
+    CASE("I2-3", "claim_prima_causes_enomem", test_node_overcommit_enomem),
+};
+
+/* Test entry point */
+int main(int argc, char **argv)
+{
+    struct test_result results[ARRAY_SIZE(cases)] = {};
+    struct runtime_config cfg = {};
+    struct test_env env = {};
+    int retval;
+
+    retval = lib_parse_args(argc, argv, &cfg);
+    if ( cfg.list_only )
+        return lib_print_available_tests(cases, ARRAY_SIZE(cases));
+    if ( !retval )
+    {
+        lib_initialise_test_env(&env);
+        lib_run_tests(&env, argv[0], &cfg, cases, ARRAY_SIZE(cases), results);
+        retval = lib_summary(results, ARRAY_SIZE(results));
+        lib_release_test_env(&env);
+    }
+    return retval ? EXIT_FAILURE : EXIT_SUCCESS;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.39.5


