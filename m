Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B52CCC44FE
	for <lists+xen-devel@lfdr.de>; Tue, 16 Dec 2025 17:33:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1188085.1509371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVXyd-0002M7-PS; Tue, 16 Dec 2025 16:32:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1188085.1509371; Tue, 16 Dec 2025 16:32:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVXyd-0002K4-L8; Tue, 16 Dec 2025 16:32:43 +0000
Received: by outflank-mailman (input) for mailman id 1188085;
 Tue, 16 Dec 2025 16:32:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M6n8=6W=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vVXyb-0001QJ-UE
 for xen-devel@lists.xenproject.org; Tue, 16 Dec 2025 16:32:41 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6a46efb-da9c-11f0-9cce-f158ae23cfc8;
 Tue, 16 Dec 2025 17:32:40 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-47bdbc90dcaso633435e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 16 Dec 2025 08:32:40 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47bd994a221sm12994765e9.7.2025.12.16.08.32.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Dec 2025 08:32:38 -0800 (PST)
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
X-Inumbo-ID: d6a46efb-da9c-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1765902759; x=1766507559; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5gXaR4CNMM1JwOw0eyl/FJQAxgRZwy+cxNH9Xft08So=;
        b=ACFzqlCgx0ER4aD7erwshX4ntmHMalZjwi/sS91C+cpNqVNoB3LjFkWXSUsYd2WMH/
         +FeyG08KWecYL545rouMkAoYIt7So6do9l70zv4D6w667atP1ReerjpBy2/5qiBdpWhO
         Zy2GwahPt+n78WHSlS7lGeW0Ok5LiWWbcZyac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765902759; x=1766507559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5gXaR4CNMM1JwOw0eyl/FJQAxgRZwy+cxNH9Xft08So=;
        b=MyLQbXlMU3/5UViUlLm9iOF86SW2FblYNEHZ/8aYT2FWlc0yD24GxEazoBZ7X/0uAa
         FkXYlOHsx2d8P0xg6a9oPZ8mXfsnCluZZsLyK6t7iiipXmTan6NtfH6ryca6LW+pOmsw
         +UdEtETg8bFcnR7M1iFNIMsbpB9Y1HkPmVNsJx9tg21axX/Z4PqPhsHE2VOOBHlGO9yy
         0DRSKMU7gnJO4HiAkcICSXj+ecNbQcqf6RMbp8OYNW9ePBnxmuqk4xN4NVjmlv6rLUyf
         49L7GNjZ7Q5In6bFwx38XfASq87fpUdHdS9yXhAmoeU0+keYz/95EXZdV7RPdfmQlX0t
         p9ZQ==
X-Gm-Message-State: AOJu0YxN9DsDPJDb2FM3oddVe3AU46XKgumvkuMTlpft2gO4TZTQALCm
	9BulJt1qPnWTnJxCNSrbRgnmKMSaWuGEUOyz5FaNBAJPCIC4+PnNM0gGHkt9Y8VBKzWN8ZjuWxw
	73N4w
X-Gm-Gg: AY/fxX5x94Bbh0G2kPbUGyOAob+6AiiKgthee5oXkNsYwhLZt8kxflOJdFCZ/OldHEt
	SUZUcC3A/KFpmhdCXQhKhEN1wS9XC9NGJL5JLNZJtOYr3jSv3JtsX/w5LItt0WTvgIrrMyZ1FIT
	Ul4qVZ+CzAAdMbSxp802A154vmWyjd4AOuTUT+wYx47yrc3UkqaY0fVDmvgiYanNE4xNFpAlA4X
	X3/0e0xl1cRaipklWloz0sji4gKv5TvUYPAEZeETYhJSJglMz4MT6HTJApoWWp2y5yzd09I1Vlk
	9YLQH3gHZSG8EB3sZ9Ak5cZ1XkUq4HhgvEaLTibCPKTrcxBtKtSQf/5bz4j8qi2+hKENL7puuRj
	NqrAzDlr1CzuD3bT5qTwRzfddnvduU5TFyFI9WRioqqnEVKqNgWeRpPBUkgO563M2uwbyFjwOvr
	MrLuxtVg1eRfUN46DSXoAQXVOvRitsu8jTotu0I/y1MmzhY2/o+pp7gnvPlDXgzQ==
X-Google-Smtp-Source: AGHT+IHs5rK2CgHB0hILBdJRVro1dQCu5BQib4zZRP6eGKEUwzYltfCTDPzhWnlri2qpScjrghDDVA==
X-Received: by 2002:a05:600c:5252:b0:477:76cb:4812 with SMTP id 5b1f17b1804b1-47a8f708ebamr151546015e9.0.1765902759242;
        Tue, 16 Dec 2025 08:32:39 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 4/4] tools/tests: Memory Claims
Date: Tue, 16 Dec 2025 16:32:30 +0000
Message-Id: <20251216163230.2768186-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251216163230.2768186-1-andrew.cooper3@citrix.com>
References: <20251216163230.2768186-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add some basic testing of the memory claims mechainsm.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
---
 tools/tests/Makefile                   |   1 +
 tools/tests/mem-claim/.gitignore       |   1 +
 tools/tests/mem-claim/Makefile         |  38 +++++
 tools/tests/mem-claim/test-mem-claim.c | 190 +++++++++++++++++++++++++
 4 files changed, 230 insertions(+)
 create mode 100644 tools/tests/mem-claim/.gitignore
 create mode 100644 tools/tests/mem-claim/Makefile
 create mode 100644 tools/tests/mem-claim/test-mem-claim.c

diff --git a/tools/tests/Makefile b/tools/tests/Makefile
index e566bd169952..6477a4386dda 100644
--- a/tools/tests/Makefile
+++ b/tools/tests/Makefile
@@ -3,6 +3,7 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 SUBDIRS-y :=
 SUBDIRS-y += domid
+SUBDIRS-y += mem-claim
 SUBDIRS-y += paging-mempool
 SUBDIRS-y += pdx
 SUBDIRS-y += rangeset
diff --git a/tools/tests/mem-claim/.gitignore b/tools/tests/mem-claim/.gitignore
new file mode 100644
index 000000000000..cfcee00b819b
--- /dev/null
+++ b/tools/tests/mem-claim/.gitignore
@@ -0,0 +1 @@
+test-mem-claim
diff --git a/tools/tests/mem-claim/Makefile b/tools/tests/mem-claim/Makefile
new file mode 100644
index 000000000000..76ba3e3c8bef
--- /dev/null
+++ b/tools/tests/mem-claim/Makefile
@@ -0,0 +1,38 @@
+XEN_ROOT = $(CURDIR)/../../..
+include $(XEN_ROOT)/tools/Rules.mk
+
+TARGET := test-mem-claim
+
+.PHONY: all
+all: $(TARGET)
+
+.PHONY: clean
+clean:
+	$(RM) -- *.o $(TARGET) $(DEPS_RM)
+
+.PHONY: distclean
+distclean: clean
+	$(RM) -- *~
+
+.PHONY: install
+install: all
+	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC)/tests
+	$(INSTALL_PROG) $(TARGET) $(DESTDIR)$(LIBEXEC)/tests
+
+.PHONY: uninstall
+uninstall:
+	$(RM) -- $(DESTDIR)$(LIBEXEC)/tests/$(TARGET)
+
+CFLAGS += $(CFLAGS_xeninclude)
+CFLAGS += $(CFLAGS_libxenctrl)
+CFLAGS += $(APPEND_CFLAGS)
+
+LDFLAGS += $(LDLIBS_libxenctrl)
+LDFLAGS += $(APPEND_LDFLAGS)
+
+%.o: Makefile
+
+$(TARGET): test-mem-claim.o
+	$(CC) -o $@ $< $(LDFLAGS)
+
+-include $(DEPS_INCLUDE)
diff --git a/tools/tests/mem-claim/test-mem-claim.c b/tools/tests/mem-claim/test-mem-claim.c
new file mode 100644
index 000000000000..78eae9091f52
--- /dev/null
+++ b/tools/tests/mem-claim/test-mem-claim.c
@@ -0,0 +1,190 @@
+#include <err.h>
+#include <errno.h>
+#include <inttypes.h>
+#include <stdio.h>
+#include <string.h>
+#include <sys/mman.h>
+
+#include <xenctrl.h>
+#include <xenforeignmemory.h>
+#include <xengnttab.h>
+#include <xen-tools/common-macros.h>
+
+static unsigned int nr_failures;
+#define fail(fmt, ...)                          \
+({                                              \
+    nr_failures++;                              \
+    (void)printf(fmt, ##__VA_ARGS__);           \
+})
+
+static xc_interface *xch;
+static uint32_t domid = -1;
+
+static xc_physinfo_t physinfo;
+
+static struct xen_domctl_createdomain create = {
+    .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
+    .max_vcpus = 1,
+    .max_grant_frames = 1,
+    .grant_opts = XEN_DOMCTL_GRANT_version(1),
+
+    .arch = {
+#if defined(__x86_64__) || defined(__i386__)
+        .emulation_flags = XEN_X86_EMU_LAPIC,
+#endif
+    },
+};
+
+static void run_tests(void)
+{
+    int rc;
+
+    /*
+     * Check that the system is quiescent.  Outstanding claims is a global
+     * field.
+     */
+    rc = xc_physinfo(xch, &physinfo);
+    if ( rc )
+        return fail("Failed to obtain physinfo: %d - %s\n",
+                    errno, strerror(errno));
+
+    printf("Free pages: %"PRIu64", Oustanding claims: %"PRIu64"\n",
+           physinfo.free_pages, physinfo.outstanding_pages);
+
+    if ( physinfo.outstanding_pages )
+        return fail("  Test needs running on a quiescent system\n");
+
+    /*
+     * We want any arbitrary domain.  Start with HVM/HAP, falling back to
+     * HVM/Shadow and then to PV.  The dom0 running this test case is one of
+     * these modes.
+     */
+#if defined(__x86_64__) || defined(__i386__)
+    if ( !(physinfo.capabilities & XEN_SYSCTL_PHYSCAP_hap) )
+        create.flags &= ~XEN_DOMCTL_CDF_hap;
+
+    if ( !(physinfo.capabilities & (XEN_SYSCTL_PHYSCAP_hap|XEN_SYSCTL_PHYSCAP_shadow)) ||
+         !(physinfo.capabilities & XEN_SYSCTL_PHYSCAP_hvm) )
+    {
+        create.flags &= ~XEN_DOMCTL_CDF_hvm;
+        create.arch.emulation_flags = 0;
+    }
+#endif
+
+    rc = xc_domain_create(xch, &domid, &create);
+    if ( rc )
+        return fail("  Domain create failure: %d - %s\n",
+                    errno, strerror(errno));
+
+    rc = xc_domain_setmaxmem(xch, domid, -1);
+    if ( rc )
+        return fail("  Failed to set maxmem: %d - %s\n",
+                    errno, strerror(errno));
+
+    printf("  Created d%u\n", domid);
+
+    /*
+     * Creating a domain shouldn't change the claim.  Check it's still 0.
+     */
+    rc = xc_physinfo(xch, &physinfo);
+    if ( rc )
+        return fail("  Failed to obtain physinfo: %d - %s\n",
+                    errno, strerror(errno));
+
+    if ( physinfo.outstanding_pages )
+        return fail("  Unexpected outstanding claim of %"PRIu64" pages\n",
+                    physinfo.outstanding_pages);
+
+    /*
+     * Set a claim for 4M.  This should be the only claim in the system, and
+     * show up globally.
+     */
+    rc = xc_domain_claim_pages(xch, domid, 4*1024*1024/4096);
+    if ( rc )
+        return fail("  Failed to claim 4M of RAM: %d - %s\n",
+                    errno, strerror(errno));
+
+    rc = xc_physinfo(xch, &physinfo);
+    if ( rc )
+        return fail("  Failed to obtain physinfo: %d - %s\n",
+                    errno, strerror(errno));
+
+    if ( physinfo.outstanding_pages != 4*1024*1024/4096 )
+        return fail("  Expected claim to be 4M, got %"PRIu64" pages\n",
+                    physinfo.outstanding_pages);
+
+    /*
+     * Allocate 2M of RAM to the domain.  This should be deducted from global
+     * claim.
+     */
+    xen_pfn_t ram[] = { 0 };
+    rc = xc_domain_populate_physmap_exact(
+        xch, domid, ARRAY_SIZE(ram), 9, 0, ram);
+    if ( rc )
+        return fail("  Failed to populate physmap domain: %d - %s\n",
+                    errno, strerror(errno));
+
+    rc = xc_physinfo(xch, &physinfo);
+    if ( rc )
+        return fail("  Failed to obtain physinfo: %d - %s\n",
+                    errno, strerror(errno));
+
+    if ( physinfo.outstanding_pages != 2*1024*1024/4096 )
+        return fail("  Expected claim to be 2M, got %"PRIu64" pages\n",
+                    physinfo.outstanding_pages);
+
+    /*
+     * Destroying the domain should release the outstanding 2M claim.
+     */
+    rc = xc_domain_destroy(xch, domid);
+
+    /* Cancel the cleanup path, even in the case of an error. */
+    domid = -1;
+
+    if ( rc )
+        return fail("  Failed to destroy domain: %d - %s\n",
+                    errno, strerror(errno));
+
+    rc = xc_physinfo(xch, &physinfo);
+    if ( rc )
+        return fail("  Failed to obtain physinfo: %d - %s\n",
+                    errno, strerror(errno));
+
+    if ( physinfo.outstanding_pages )
+        return fail("  Expected no outstanding claim, got %"PRIu64" pages\n",
+                    physinfo.outstanding_pages);
+}
+
+int main(int argc, char **argv)
+{
+    int rc;
+
+    printf("Memory claims tests\n");
+
+    xch = xc_interface_open(NULL, NULL, 0);
+
+    if ( !xch )
+        err(1, "xc_interface_open");
+
+    run_tests();
+
+    if ( (int)domid >= 0 )
+    {
+        rc = xc_domain_destroy(xch, domid);
+        if ( rc )
+            fail("  Failed to destroy domain: %d - %s\n",
+                 errno, strerror(errno));
+    }
+
+    return !!nr_failures;
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


