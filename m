Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJ6VFZ5NA2r63gEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 17:56:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7041524283
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 17:56:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1307094.1578840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMpSd-0003wR-Kf; Tue, 12 May 2026 15:55:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1307094.1578840; Tue, 12 May 2026 15:55:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMpSd-0003uM-H0; Tue, 12 May 2026 15:55:55 +0000
Received: by outflank-mailman (input) for mailman id 1307094;
 Tue, 12 May 2026 15:55:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wMpSb-0003UQ-BI
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 15:55:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMpSa-00BEWS-OV
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 17:55:52 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a034d88-e002-0a2a0a5209dd-0a2a4509d4fc-2
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 17:55:52 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a034d88-2497-0a2a45090019-d155802fb4e4-3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 17:55:52 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-488af96f6b2so68703525e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 08:55:52 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fc8d69d0bsm4361335e9.13.2026.05.12.08.55.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2026 08:55:51 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1778601352; x=1779206152; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eWLklbcInMPQObYaiBnOHsAE/t9hZPY8o89RLu9YkzU=;
        b=O9THNi4xrLB6Y1oPM3C5RAVefSiWxB0mUz1/YviUnYfo77kyEii4xWoAaSKojZpRRo
         Ou71vQ/vApP4fDmX+Gguo8TN2NqBAu0j7H+nmj9FLLOqlk7SFrltzAMYF1pMnOQclL+M
         EZuXEP9bezZLP3AignX6yU2lpNTpWoKZQcTyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778601352; x=1779206152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eWLklbcInMPQObYaiBnOHsAE/t9hZPY8o89RLu9YkzU=;
        b=gHce2PX/HUB0AsAD88hC5IpcZXfu39enfhZnTG/LxSYZwnxLu3g8ZQbYAfgbKIWE2H
         Sqc13k6FDtLO/g4T32O/MwjSMlVDHnsLHH03ylNIcbaQlF4gjzZg6+oZBZzZe86RDrVE
         YboDLtXvuXN+JuLMNKbI0Qo/P8lseQ9oCtpeofUXW0NhlAdi+xzos9hw72kGUpZTON2f
         6fwU4qgpa9qRWi2HW133eCOxEdMEGMUPB/KwPJW7Bf3Lah/Qq9q8ZqvAFasuB+PJS2gJ
         GVSt6r1jgaZvDRrN5um3UKvztEbQJyBCFexdFdV6DBZBvm2cRbPFrH3kdrB+FTO7ZWOH
         aEeQ==
X-Gm-Message-State: AOJu0YxjKKhf3PQX4vVaAEdXit5cmzIegT0g2tJvK/4SjHkgdBrFoEpz
	qypkpjHqKsW0jswSZ7gIFt/ZiUZXNV78yGXzKvwMgvKC6T3CjQbiwHbsup6+jOnEEgf+QPhFOKn
	uV/l7zVc=
X-Gm-Gg: Acq92OFZnFGKEj3datAxcOHrrQ4jtTaTOf6u+neKNOvtTKw21+BOwLQLapg3RE745ja
	XUqdC7AH/NqrIIcOcPQbazjxV/hRp3z9hh90Tzl62rz+G3OJ2l0C7c2WmnIREQWffj4KYBVaJmz
	I9kSPm0oFQnadFel535d6fbBkRBbLEcIxpyVF0uIYabQU3EJTEvTW3oSpUU5vr+jzwW+fucxipF
	V3f4GjvFntZcO/r+5xcnX/3YwVemyPunPA6pJAW5nhRG//vRjhXi668WrSBF7ecG1QKZe9fu3C0
	6No2r3iu3EAwhyaMMeysgKb6vvVVqWlaET7Z7zL1yOnBeXBAU7SICwyCSXPqNrerMyMj8npUjD9
	a6403XygFWeHoJihhpGCWrwidM5vpvDDUUQY8dHjpQs21T7s7fo/+2Q4Ud+fSSgiNYiFGhaLCrA
	c0GF7GRUBSPqpbgYmfRirhv3J2MHgy2zbs2G5hJXwKPJTBtMw+Z+fFEwqeZMAhICOpfMfiXGnTw
	nmn
X-Received: by 2002:a05:600c:45d0:b0:488:7ff6:1f75 with SMTP id 5b1f17b1804b1-48e707f821dmr238327625e9.21.1778601351719;
        Tue, 12 May 2026 08:55:51 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 2/2] tests/paging-mempool: Extend to test P2M relocation
Date: Tue, 12 May 2026 16:55:40 +0100
Message-Id: <20260512155540.1733403-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260512155540.1733403-1-andrew.cooper3@citrix.com>
References: <20260512155540.1733403-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1778601352-37F7EA53-072FC948/10/73395122804
X-purgate-type: spam
X-purgate-size: 12153
X-Rspamd-Queue-Id: C7041524283
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.32 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,citrix.com:email,citrix.com:mid,citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

XENMAPSPACE_gmfn_range was found to be buggy with overlapping ranges, and the
fix is sufficiently far from clear that yours truely decided a test was in
order.

XENMAPSPACE_gmfn_range is exposed by xendevicemodel_relocate_memory() so take
the opportunity to create a better example for others to copy.

The test works as follows.  Populate 2M of RAM in the guest, marking the pages
so they can be identified later.  Then construct four relocation test
cases (overlapping vs non-overlapping, forwards vs backwards) using the marks
in the guest pages to confirm that the P2M was adjusted correctly.

The use of XEN_DOMCTL_CDF_iommu forces xenmem_add_to_physmap() to limit the
iteration count to a maximum of 16.  Use this to force a continuation and
exercise more of the logic.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

paging-mempool isn't necessary the best named test to put this in, but it's
the one with the best structure to fit it.  We are going to want to shuffle
the testing structure a bit when we've got a couple more examples to draw good
lines between.

Without "memory: overlapping XENMAPSPACE_gmfn_range requests", this fails:

  ...
  Test p2m memory relocation
    Test forward, no overlap:   GFNs [3e0...3ff] -> [400...41f]
    Test forward, overlapping:  GFNs [3c0...3df] -> [3c1...3e0]
      Fail: check mark unable to map 003c1: -22
      Fail: check mark unable to map 003c2: -22
      Fail: check mark unable to map 003c3: -22
      Fail: check mark unable to map 003c4: -22
      Fail: check mark unable to map 003c5: -22
      Fail: check mark unable to map 003c6: -22
      Fail: check mark unable to map 003c7: -22
      Fail: check mark unable to map 003c8: -22
      Fail: check mark unable to map 003c9: -22
      Fail: check mark unable to map 003ca: -22
      Fail: check mark unable to map 003cb: -22
      Fail: check mark unable to map 003cc: -22
      Fail: check mark unable to map 003cd: -22
      Fail: check mark unable to map 003ce: -22
      Fail: check mark unable to map 003cf: -22
      Fail: check mark unable to map 003d0: -22
      Fail: check mark unable to map 003d1: -22
      Fail: check mark unable to map 003d2: -22
      Fail: check mark unable to map 003d3: -22
      Fail: check mark unable to map 003d4: -22
      Fail: check mark unable to map 003d5: -22
      Fail: check mark unable to map 003d6: -22
      Fail: check mark unable to map 003d7: -22
      Fail: check mark unable to map 003d8: -22
      Fail: check mark unable to map 003d9: -22
      Fail: check mark unable to map 003da: -22
      Fail: check mark unable to map 003db: -22
      Fail: check mark unable to map 003dc: -22
      Fail: check mark unable to map 003dd: -22
      Fail: check mark unable to map 003de: -22
      Fail: check mark unable to map 003df: -22
      Fail: check mark: gfn 003e0 expecting fffffe20 (479), got fffffe3f (448)

With the fix in place, the test passes:

  ...
  Test p2m memory relocation
    Test forward, no overlap:   GFNs [3e0...3ff] -> [400...41f]
    Test forward, overlapping:  GFNs [3c0...3df] -> [3c1...3e0]
    Test backwards, no overlap: GFNs [200...21f] -> [1e0...1ff]
    Test backwards, no overlap: GFNs [220...23f] -> [21f...23e]
---
 tools/tests/paging-mempool/Makefile           |   4 +
 .../paging-mempool/test-paging-mempool.c      | 197 +++++++++++++++++-
 xen/common/memory.c                           |   2 +-
 3 files changed, 201 insertions(+), 2 deletions(-)

diff --git a/tools/tests/paging-mempool/Makefile b/tools/tests/paging-mempool/Makefile
index a1e12584ce80..7444d81b8460 100644
--- a/tools/tests/paging-mempool/Makefile
+++ b/tools/tests/paging-mempool/Makefile
@@ -25,9 +25,13 @@ uninstall:
 
 CFLAGS += $(CFLAGS_xeninclude)
 CFLAGS += $(CFLAGS_libxenctrl)
+CFLAGS += $(CFLAGS_libxendevicemodel)
+CFLAGS += $(CFLAGS_libxenforeignmemory)
 CFLAGS += $(APPEND_CFLAGS)
 
 LDFLAGS += $(LDLIBS_libxenctrl)
+LDFLAGS += $(LDLIBS_libxendevicemodel)
+LDFLAGS += $(LDLIBS_libxenforeignmemory)
 LDFLAGS += $(APPEND_LDFLAGS)
 
 %.o: Makefile
diff --git a/tools/tests/paging-mempool/test-paging-mempool.c b/tools/tests/paging-mempool/test-paging-mempool.c
index d1207d26d3fc..fc0375358324 100644
--- a/tools/tests/paging-mempool/test-paging-mempool.c
+++ b/tools/tests/paging-mempool/test-paging-mempool.c
@@ -6,6 +6,7 @@
 #include <sys/mman.h>
 
 #include <xenctrl.h>
+#include <xendevicemodel.h>
 #include <xenforeignmemory.h>
 #include <xengnttab.h>
 #include <xen-tools/common-macros.h>
@@ -19,10 +20,15 @@ static unsigned int nr_failures;
 })
 
 static xc_interface *xch;
+static xendevicemodel_handle *dh;
+static xenforeignmemory_handle *fh;
 static uint32_t domid;
 
 static struct xen_domctl_createdomain create = {
-    .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
+    .flags = (XEN_DOMCTL_CDF_hvm |
+              XEN_DOMCTL_CDF_hap |
+              XEN_DOMCTL_CDF_iommu |
+              0),
     .max_vcpus = 1,
     .max_grant_frames = 1,
     .grant_opts = XEN_DOMCTL_GRANT_version(1),
@@ -145,6 +151,183 @@ static int test_paging_mempool_size(void)
     return 0;
 }
 
+static int mark_guest_mem(xen_pfn_t gfn, size_t count)
+{
+    xen_pfn_t gfns[count];
+    uint32_t *mem;
+    size_t i;
+    int rc;
+
+    for ( i = 0; i < count; ++i )
+        gfns[i] = gfn + i;
+
+    mem = xenforeignmemory_map(fh, domid, PROT_READ | PROT_WRITE,
+                               count, gfns, NULL);
+    if ( !mem )
+        return fail("  Fail: mark mem foreign map: %d - %s\n",
+                    errno, strerror(errno));
+
+    for ( i = 0; i < count; ++i )
+    {
+        uint32_t *mark = &mem[i << 10];
+
+        *mark = ~i;
+    }
+
+    rc = xenforeignmemory_unmap(fh, mem, count);
+    if ( rc )
+        return fail("  Fail: mark mem foreign unmap: %d - %s\n",
+                    errno, strerror(errno));
+
+    return 0;
+}
+
+static int check_guest_marks(xen_pfn_t gfn, uint32_t mark_start, size_t count)
+{
+    xen_pfn_t gfns[count];
+    int errs[count];
+    uint32_t *mem;
+    size_t i;
+    int rc = 0;
+
+    for ( i = 0; i < count; ++i )
+        gfns[i] = gfn + i;
+
+    mem = xenforeignmemory_map(fh, domid, PROT_READ,
+                               count, gfns, errs);
+    if ( !mem )
+        return fail("    Fail: check mark foreign map: %d - %s\n",
+                    errno, strerror(errno));
+
+    for ( i = 0; i < count; ++i )
+    {
+        uint32_t *mark = &mem[i << 10];
+        uint32_t exp = ~(mark_start + i);
+
+        if ( errs[i] )
+        {
+            rc = -1;
+            fail("    Fail: check mark unable to map %05lx: %d\n", gfns[i], errs[i]);
+            continue;
+        }
+
+        if ( *mark == exp )
+            continue;
+
+        fail("    Fail: check mark: gfn %05lx expecting %08x (%u), got %08x (%u)\n",
+               gfns[i], exp, ~exp, *mark, ~*mark);
+        rc = -1;
+    }
+
+    if ( xenforeignmemory_unmap(fh, mem, count) )
+        return fail("    Fail: check marks foreign unmap: %d - %s\n",
+                    errno, strerror(errno));
+
+    return rc;
+}
+
+static int test_p2m_relocate_memory(void)
+{
+#define GFN_2M ((2UL << 20) >> 12)
+#define GFN_4M ((4UL << 20) >> 12)
+
+    xen_pfn_t physmap[] = { GFN_2M };
+    int rc;
+
+    /*
+     * Inherited state of the domain:
+     * - Unlimited allocation
+     *
+     * Construction of the test:
+     * - Populate 2M at 2M, mark the pages.
+     */
+    printf("Test p2m memory relocation\n");
+
+    rc = xc_domain_populate_physmap_exact(xch, domid, ARRAY_SIZE(physmap),
+                                          9 /* order 2M */, 0 /* flags */, physmap);
+    if ( rc )
+        return fail("  Fail: populate physmap: %d - %s\n",
+                    errno, strerror(errno));
+
+    rc = mark_guest_mem(GFN_2M, 1 << 9 /* order 2M */);
+    if ( rc )
+        return rc;
+
+    /* Sanity check the start and end markers. */
+    if ( (rc = check_guest_marks(GFN_2M,     0,       8)) ||
+         (rc = check_guest_marks(GFN_4M - 8, 512 - 8, 8)) )
+        return rc;
+
+
+#define GFN_PAIR(g, c) (g), ((g) + (c) - 1)
+
+    /*
+     * Move the final 32 pages below 4M forward by 32 pages.  All destination
+     * GFNs free, and no overlap.
+     */
+    printf("  Test forward, no overlap:   GFNs [%lx...%lx] -> [%lx...%lx]\n",
+           GFN_PAIR(GFN_4M - 32, 32), GFN_PAIR(GFN_4M, 32));
+
+    rc = xendevicemodel_relocate_memory(dh, domid, 32, GFN_4M - 32, GFN_4M);
+    if ( rc )
+        return fail("  Fail: relocate memory: %d - %s\n",
+                    errno, strerror(errno));
+
+    rc = check_guest_marks(GFN_4M, 512 - 32, 32);
+    if ( rc )
+        return rc;
+
+    /*
+     * Move the next 32 pages below 4M forward by 1 page.  The region is
+     * almost completely overlapping.
+     */
+    printf("  Test forward, overlapping:  GFNs [%lx...%lx] -> [%lx...%lx]\n",
+           GFN_PAIR(GFN_4M - 64, 32), GFN_PAIR(GFN_4M - 63, 32));
+
+    rc = xendevicemodel_relocate_memory(dh, domid, 32, GFN_4M - 64, GFN_4M - 63);
+    if ( rc )
+        return fail("  Fail: relocate memory: %d - %s\n",
+                    errno, strerror(errno));
+
+    rc = check_guest_marks(GFN_4M - 63, 512 - 64, 32);
+    if ( rc )
+        return rc;
+
+    /*
+     * Move the first 32 pages above 2M backwards by 32 pages.  All
+     * destination GFNs free, and no overlap.
+     */
+    printf("  Test backwards, no overlap: GFNs [%lx...%lx] -> [%lx...%lx]\n",
+           GFN_PAIR(GFN_2M, 32), GFN_PAIR(GFN_2M - 32, 32));
+
+    rc = xendevicemodel_relocate_memory(dh, domid, 32, GFN_2M, GFN_2M - 32);
+    if ( rc )
+        return fail("  Fail: relocate memory: %d - %s\n",
+                    errno, strerror(errno));
+
+    rc = check_guest_marks(GFN_2M - 32, 0, 32);
+    if ( rc )
+        return rc;
+
+    /*
+     * Move the next 32 pages above 2M backwards by 1 page.  The region is
+     * almost completely overlapping.
+     */
+    printf("  Test backwards, no overlap: GFNs [%lx...%lx] -> [%lx...%lx]\n",
+           GFN_PAIR(GFN_2M + 32, 32), GFN_PAIR(GFN_2M + 31, 32));
+
+    rc = xendevicemodel_relocate_memory(dh, domid, 32, GFN_2M + 32, GFN_2M + 31);
+    if ( rc )
+        return fail("  Fail: relocate memory: %d - %s\n",
+                    errno, strerror(errno));
+
+    rc = check_guest_marks(GFN_2M + 31, 32, 32);
+    if ( rc )
+        return rc;
+
+    return 0;
+}
+
 static int run_tests(void)
 {
     int rc;
@@ -153,6 +336,10 @@ static int run_tests(void)
     if ( rc )
         return rc;
 
+    rc = test_p2m_relocate_memory();
+    if ( rc )
+        return rc;
+
     return 0;
 }
 
@@ -166,6 +353,14 @@ int main(int argc, char **argv)
     if ( !xch )
         err(1, "xc_interface_open");
 
+    dh = xendevicemodel_open(NULL, 0);
+    if ( !dh )
+        err(1, "xendevicemodel_open");
+
+    fh = xenforeignmemory_open(NULL, 0);
+    if ( !fh )
+        err(1, "xenforeignmemory_open");
+
     rc = xc_domain_create(xch, &domid, &create);
     if ( rc )
     {
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 1ad4b51c5b02..c6109dc7d664 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -962,7 +962,7 @@ int xenmem_add_to_physmap(struct domain *d, struct xen_add_to_physmap *xatp,
     unsigned int done = 0;
     long rc = 0;
     union add_to_physmap_extra extra = {};
-    struct page_info *pages[16];
+    struct page_info *pages[16]; /* If changing this, adjust test-paging-mempool too */
 
     if ( !paging_mode_translate(d) )
     {
-- 
2.39.5


