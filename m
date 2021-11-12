Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEE444E935
	for <lists+xen-devel@lfdr.de>; Fri, 12 Nov 2021 15:50:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225282.389042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlXrc-000190-Cu; Fri, 12 Nov 2021 14:49:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225282.389042; Fri, 12 Nov 2021 14:49:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlXrc-000172-9d; Fri, 12 Nov 2021 14:49:12 +0000
Received: by outflank-mailman (input) for mailman id 225282;
 Fri, 12 Nov 2021 14:49:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UwsT=P7=citrix.com=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1mlXra-00016v-KZ
 for xen-devel@lists.xenproject.org; Fri, 12 Nov 2021 14:49:10 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af1007a7-43c7-11ec-9787-a32c541c8605;
 Fri, 12 Nov 2021 15:49:08 +0100 (CET)
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
X-Inumbo-ID: af1007a7-43c7-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636728548;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VhZDuLVZjU9aDCkZMQRVgwJGPF9zi+h/hgwLm11lo6c=;
  b=EihusLzUIhgjK9rEEz4ZE+yUJu4+uG6lvwjzOPdeNbMw+xet3L7vOyJg
   2/Fy88cBhLyVk/SJlDTVbbYD2J0UMnDAq2N1AdH0CuwTAro+bGzGjEUHh
   bHOyPHPyU5Lu/pqLCG755BmI7j2b94TCyxojIxqBx/s8O/KfGbtQJUH4A
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: YbnqWo8DVksOAowrftBEVOEPjEaGRjteYHDblWbf/VblW43xEU4JnisTeHUnnxvyYU1kV2Etmv
 xAKkP98yiDzCwzmGrygSZxcJ6/PHFe+jUki1gB17vHhcnbqHr3VNHutox1VPh8KicE3ABBFKlO
 7jifavn3QtZxhLuRM5j/QWJxHtEiIDnVED3bBPjfWc4/hM+oZarHSfJpAaZyWSnGBtcYc6a0l9
 SvDGFNhCKNYNcEn/t6WeG/02ekAD0pVPNMO1hIxjfaiXl3FulsgR3TrR9e1f49bTDP6YF27vES
 zrUSlh7IHXOFplG1LZeQ4Bo+
X-SBRS: 5.1
X-MesageID: 57217265
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:yL+J96oIwuR3af+RDnEr31Og60teBmLVYhIvgKrLsJaIsI4StFCzt
 garIBmFPauJZzCnLYp0YYiz9xsBsJeGy942SAFqqCg3RHhG8ZuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dnd+4f5fs7Rh2Ncx2IHjW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnZOBRFg4MrySo+c2SBYFKCYjbKBKpKCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFKEWvHwm6DjdBPIvR53rSKTW/95Imjw3g6iiGN6DO
 JBANmAxMXwsZTVVEH1KGMswudunn33ZagV5kQ+c+qcetj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKhAFNvSPxDyd6HWui+TT2yThV+o6BLC+s/JnnlCX7mgSEwENE0u2p+GjjUyzUM4ZL
 FYbkhfCtoBrqhbtFIOkGUTl/jjU5XbwRua8DcU12QzS26bFvT2aLXMLEwVGNY0ruJMpEGlCO
 kCyo/vlAjlmsbuwQH2b96uJoT7aBRX5PVPudgdfE1JbvoCLTJUby0uWE409SPLdYsjdQGmom
 1i3QD4Ca6L/ZCLh/4Gy5hj5jj2lvfAlpSZlt1yMDgpJAu6UDbNJhrBEC3CHsp6sz67DFzFtW
 UTofeDEsYji6rnXxESwrB0lRu3B2hp8GGS0baRTN5cg7S+x3HWoYJpd5jpzTG8wbJ1aJ2K3O
 hSI6F4LjHO2AJdMRfUqC25WI556pZUM6Py/DqyEBjawSsQZmPC7ENFGOhfLgjGFfLkEmqAjI
 5aLGftA/l5BYZmLOAGeHr9HuZdyn3hW7TqKGfjTkkT2uZLDNSX9YepUbzOzghURsfrsTPP9q
 I0EaaNnCnx3DYXDX8Ug2dJJcA1RcyFkXcueRg4+XrfrHzeK0VoJU5f5qY7NsaQ/90iMvuuXr
 Hy7RGFCz1/z2S/OJQmQMygxY7LzR5dv63k8OHV0b1qv3nEiZ6ep7bseKMRrLeV2qrQ7wK4mV
 eQBduWBHu9LFmbN9QMCYMSvt4dlbhmq216DZnL3fDglcpd8bAXV4du4LBD3/SwDA3Pv58szq
 rGtzC3BRp8HS1gwBcracqv3nViwoWIciKR5WE6Reotff0Dl8Y5LLS3tj6Bof5FQeEubnjbDj
 lSYGxYVo+XJsrQZytiRiPDWtZqtHst/AlFeQzvR44GpOHSI5WGk24JBDrqFJGiPSGPu9ay+T
 uxJ1PWgYuYflVNHvocgQbZmyaUyu4nmq7NAl1k2GXzKaxKgC696I2nA1s5K7/UfyrhcsAqwe
 0SO5tgFZunZZJK7SAYcdFg/c+CO9fAIgT2Dv/06LXLz6DJz4LfaA15ZOAOBiXAFIbZ4WG//L
 TzNZCLCB9SDtycX
IronPort-HdrOrdr: A9a23:2Lky9q7VQNuY/DZyMAPXwMbXdLJyesId70hD6qhwISY1TiX+rb
 HJoB17726StN9/YgBCpTntAsa9qBDnhPpICOsqTNWftWDd0QPCRuwP0WKL+UyYJ8SUzI5gPM
 lbHZSWcOeAaGRHsQ==
X-IronPort-AV: E=Sophos;i="5.87,229,1631592000"; 
   d="scan'208";a="57217265"
From: Jane Malalane <jane.malalane@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jane Malalane <jane.malalane@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH for-4.16 v2] tests/resource: Extend to check that the grant frames are mapped correctly
Date: Fri, 12 Nov 2021 14:48:21 +0000
Message-ID: <20211112144821.987-1-jane.malalane@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Previously, we checked that we could map 40 pages with nothing
complaining. Now we're adding extra logic to check that those 40
frames are "correct".

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
Release-Acked-by: Ian Jackson <iwj@xenproject.org>
---
CC: Ian Jackson <iwj@xenproject.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * Cast the gnttab pointer to the correct type (void **)
 * Fixed comment style
---
 tools/tests/resource/Makefile        |  2 +
 tools/tests/resource/test-resource.c | 82 +++++++++++++++++++++++++++++++++---
 2 files changed, 78 insertions(+), 6 deletions(-)

diff --git a/tools/tests/resource/Makefile b/tools/tests/resource/Makefile
index 1c3aee4ff7..b3cd70c06d 100644
--- a/tools/tests/resource/Makefile
+++ b/tools/tests/resource/Makefile
@@ -31,10 +31,12 @@ CFLAGS += -Werror
 CFLAGS += $(CFLAGS_xeninclude)
 CFLAGS += $(CFLAGS_libxenctrl)
 CFLAGS += $(CFLAGS_libxenforeginmemory)
+CFLAGS += $(CFLAGS_libxengnttab)
 CFLAGS += $(APPEND_CFLAGS)
 
 LDFLAGS += $(LDLIBS_libxenctrl)
 LDFLAGS += $(LDLIBS_libxenforeignmemory)
+LDFLAGS += $(LDLIBS_libxengnttab)
 LDFLAGS += $(APPEND_LDFLAGS)
 
 %.o: Makefile
diff --git a/tools/tests/resource/test-resource.c b/tools/tests/resource/test-resource.c
index 1caaa60e62..286d338c1f 100644
--- a/tools/tests/resource/test-resource.c
+++ b/tools/tests/resource/test-resource.c
@@ -6,6 +6,7 @@
 
 #include <xenctrl.h>
 #include <xenforeignmemory.h>
+#include <xengnttab.h>
 #include <xen-tools/libs.h>
 
 static unsigned int nr_failures;
@@ -17,13 +18,16 @@ static unsigned int nr_failures;
 
 static xc_interface *xch;
 static xenforeignmemory_handle *fh;
+static xengnttab_handle *gh;
 
-static void test_gnttab(uint32_t domid, unsigned int nr_frames)
+static void test_gnttab(uint32_t domid, unsigned int nr_frames, unsigned long gfn)
 {
     xenforeignmemory_resource_handle *res;
-    void *addr = NULL;
+    grant_entry_v1_t *gnttab;
     size_t size;
     int rc;
+    uint32_t refs[nr_frames], domids[nr_frames];
+    void *grants;
 
     printf("  Test grant table\n");
 
@@ -51,18 +55,53 @@ static void test_gnttab(uint32_t domid, unsigned int nr_frames)
     res = xenforeignmemory_map_resource(
         fh, domid, XENMEM_resource_grant_table,
         XENMEM_resource_grant_table_id_shared, 0, size >> XC_PAGE_SHIFT,
-        &addr, PROT_READ | PROT_WRITE, 0);
+        (void **)&gnttab, PROT_READ | PROT_WRITE, 0);
 
     /*
      * Failure here with E2BIG indicates Xen is missing the bugfix to map
      * resources larger than 32 frames.
      */
     if ( !res )
-        return fail("    Fail: Map %d - %s\n", errno, strerror(errno));
+        return fail("    Fail: Map grant table %d - %s\n", errno, strerror(errno));
 
+    /* Put each gref at a unique offset in its frame. */
+    for ( unsigned int i = 0; i < nr_frames; i++ )
+    {
+        unsigned int gref = i * (XC_PAGE_SIZE / sizeof(*gnttab)) + i;
+
+        refs[i] = gref;
+        domids[i] = domid;
+
+        gnttab[gref].domid = 0;
+        gnttab[gref].frame = gfn;
+        gnttab[gref].flags = GTF_permit_access;
+    }
+
+    /* Map grants. */
+    grants = xengnttab_map_grant_refs(gh, nr_frames, domids, refs, PROT_READ | PROT_WRITE);
+
+    /*
+     * Failure here indicates either that the frames were not mapped
+     * in the correct order or xenforeignmemory_map_resource() didn't
+     * give us the frames we asked for to begin with.
+     */
+    if ( grants == NULL )
+    {
+        fail("    Fail: Map grants %d - %s\n", errno, strerror(errno));
+        goto out;
+    }
+
+    /* Unmap grants. */
+    rc = xengnttab_unmap(gh, grants, nr_frames);
+
+    if ( rc )
+        fail("    Fail: Unmap grants %d - %s\n", errno, strerror(errno));
+
+    /* Unmap grant table. */
+ out:
     rc = xenforeignmemory_unmap_resource(fh, res);
     if ( rc )
-        return fail("    Fail: Unmap %d - %s\n", errno, strerror(errno));
+        return fail("    Fail: Unmap grant table %d - %s\n", errno, strerror(errno));
 }
 
 static void test_domain_configurations(void)
@@ -107,6 +146,7 @@ static void test_domain_configurations(void)
         struct test *t = &tests[i];
         uint32_t domid = 0;
         int rc;
+        xen_pfn_t ram[1] = { 0 };
 
         printf("Test %s\n", t->name);
 
@@ -123,8 +163,25 @@ static void test_domain_configurations(void)
 
         printf("  Created d%u\n", domid);
 
-        test_gnttab(domid, t->create.max_grant_frames);
+        rc = xc_domain_setmaxmem(xch, domid, -1);
+        if ( rc )
+        {
+            fail("  Failed to set max memory for domain: %d - %s\n",
+                 errno, strerror(errno));
+            goto test_done;
+        }
+
+        rc = xc_domain_populate_physmap_exact(xch, domid, ARRAY_SIZE(ram), 0, 0, ram);
+        if ( rc )
+        {
+            fail("  Failed to populate physmap domain: %d - %s\n",
+                 errno, strerror(errno));
+            goto test_done;
+        }
+
+        test_gnttab(domid, t->create.max_grant_frames, ram[0]);
 
+    test_done:
         rc = xc_domain_destroy(xch, domid);
         if ( rc )
             fail("  Failed to destroy domain: %d - %s\n",
@@ -138,13 +195,26 @@ int main(int argc, char **argv)
 
     xch = xc_interface_open(NULL, NULL, 0);
     fh = xenforeignmemory_open(NULL, 0);
+    gh = xengnttab_open(NULL, 0);
 
     if ( !xch )
         err(1, "xc_interface_open");
     if ( !fh )
         err(1, "xenforeignmemory_open");
+    if ( !gh )
+        err(1, "xengnttab_open");
 
     test_domain_configurations();
 
     return !!nr_failures;
 }
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
2.11.0


