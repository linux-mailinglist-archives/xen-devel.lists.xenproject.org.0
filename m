Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF47243141E
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 12:10:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.211932.369625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcPaa-0003mP-67; Mon, 18 Oct 2021 10:09:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 211932.369625; Mon, 18 Oct 2021 10:09:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcPaa-0003kG-2X; Mon, 18 Oct 2021 10:09:52 +0000
Received: by outflank-mailman (input) for mailman id 211932;
 Mon, 18 Oct 2021 10:09:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LiEI=PG=citrix.com=Jane.Malalane@srs-us1.protection.inumbo.net>)
 id 1mcPaY-0003k6-Hj
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 10:09:50 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0d31f0e1-f092-4008-b469-16449d62ce38;
 Mon, 18 Oct 2021 10:09:49 +0000 (UTC)
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
X-Inumbo-ID: 0d31f0e1-f092-4008-b469-16449d62ce38
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634551789;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=YWJg+zDnYt6xqu2Z8qpX70ggtGzngAo5flx3bGFEqa4=;
  b=RAd31PhkezORLwMiTvPkThxdjZ19S0/Y8e8CeEx2kRxxTO6A9G0XX/ca
   yv82cqQ2gmKjzFvboYBtkLFx5j2hAaAHwuGIZSZ7tad1RWpRhskNGx8hk
   yJA9C47opXJ9xUeHJee3K1FB/s2hpFky8BFE5TPUxBPKRSwjmEE7/fe9T
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 1YOxloufTNMrsdWlRFOWGjFlI5kMf0sL6+91kVewiwBqlgQTNZBIauyNNvEsyc4f6ZS9xSeYUI
 vIVVlu8IpKRLiiFZJXFipp3UukUp/SNyvHttB4e44XdF1x/61RpQsotwQUyv03XqS2hk6I8Kr6
 2oVbIxXmUEiPvzvWTOLDdm6796lSCx88I+pCaH2wmEzTx59XH354IMaZ1UN1xBWAIdZ514Omb0
 Cf5NnHBY+z8tu4nSQv5XFfscVRvBHWDyybxDOmsqHalpEaLfCGG+YjPtSQLRKh1adaUPVWEuP8
 /3AVJjHGYTn/vH3EnPT7dt07
X-SBRS: 5.1
X-MesageID: 55422929
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:9ciN4a9UQudHN9jqOhImDrUDSXmTJUtcMsCJ2f8bNWPcYEJGY0x3n
 TdLDTqBa6uDYGfweYh2Pdzj9ElX657cn95kHARvqy48E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGGeIdA970Ug6wrZg0tYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhb7
 94X6rK6SDwSN7HhqPwASAB3AQ5HaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwBJc/meqYWvnhkxDfUJf0nXYrCU+PB4towMDIY250SR6yPP
 ZtxhTxHQh/uWzEXOW8rKNFng8Ol2lbZLjtGkQfAzUYwyzeKl1EguFT3C/LKfvSaSMMTmVyXz
 krH4GbREhwcLMaYyzeO7jSrnOCntTP2XsceGaO18tZugUaP3SoDBRsOT1y5rPKlzEmkVLpix
 1c8o3R06/JorQryE4e7D0bQTGO4UgA0cf1bSbIU4gC28aPIzjaBG3MdYSxuUYlz3CMpfgAC2
 liMltLvIDVgtryJVH6QnoupQSOO1Ts9djBaO3dVJecRy5y6+ttr10OQJjp2OPft1oWdJN3m/
 9ydQMHSbZ0ohskXy77zw1nDhz+9znQiZl9ovluJNo5JAwUQWWJEW2BKwQWDhRqjBNzAJrVkg
 JTis5LPhAzpJcrV/BFhuM1XQNmUCw+taVUwe2JHEZg77CiK8HW+Z41W6zwWDB43aZpYKGK4O
 hOP41I5CHpv0J2CN/4fj2WZUJxC8EQdPY69CqC8giRmM/CdizNrDAkxPBXNjggBYWAnkL0lO
 IfzTCpfJS1yNEiT9xLvH711+eZynkgWnDqPLbimn0XP+efPPxa9FOZaWGZim8hktctoVi2Oq
 I0BXyZLoj0CONDDjt7/qtJKcg1WcCFmXPgbaaV/L4a+H+avI0l5Y9e5/F/rU9UNc319mria8
 3ejdFVfzVaj13TLJR/TMiJoaa/1XIY5pnU+ZHR+MVGt0nklQICu8KZAKMdnIeh5rLRunaxuU
 v0IW8ScGfATGD7JzCsQMMvmp4t4eRX12Q/XZ3i5YCIydoJLThDS/oO2ZRPm8SQDV3LltcY3r
 7C6+BncRJ4PG1ZrAMrMMar9xFKtp3kN3ul1WhKQcNVUfUzt9qlsKjDw0aBrc51dd02by2LDh
 QiMABoeqe3cmKMP8YHE1fKesoOkM+piBU4GTWPV2qm7aHvB9W25zI4eDOvRJWLBVHn58bmJb
 PlOy62uK+UOmVtHvtYuE7tvyq5itdLjq6UDk1ZhFXTPKV+qFqlhMj+N2swW7v9BwbpQuA2XX
 EOT+4YFZeXVaZ29SFNBdhA4aumj1O0PnmiA5Ps4F0z2+Str8efVSk5VJRSN1HRQIbYd3FnJG
 gv9VBr6MzCCtyc=
IronPort-HdrOrdr: A9a23:qoTIvaHcPl4XqMxkpLqE5seALOsnbusQ8zAXPiFKJSC9F/byqy
 nAppsmPHPP5gr5OktBpTnwAsi9qBrnnPYejLX5Vo3SPzUO1lHYSb1K3M/PxCDhBj271sM179
 YFT0GmMqyTMWRH
X-IronPort-AV: E=Sophos;i="5.85,381,1624334400"; 
   d="scan'208";a="55422929"
From: Jane Malalane <jane.malalane@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jane Malalane <jane.malalane@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [PATCH] tests/resource: Extend to check that the grant frames are mapped correctly
Date: Mon, 18 Oct 2021 11:08:48 +0100
Message-ID: <20211018100848.10612-1-jane.malalane@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain

Previously, we checked that we could map 40 pages with nothing
complaining. Now we're adding extra logic to check that those 40
frames are "correct".

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
---
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
---
 tools/tests/resource/Makefile        |  2 +
 tools/tests/resource/test-resource.c | 81 +++++++++++++++++++++++++++++++++---
 2 files changed, 77 insertions(+), 6 deletions(-)

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
index 1caaa60e62..fa4ca6217f 100644
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
 
@@ -51,18 +55,52 @@ static void test_gnttab(uint32_t domid, unsigned int nr_frames)
     res = xenforeignmemory_map_resource(
         fh, domid, XENMEM_resource_grant_table,
         XENMEM_resource_grant_table_id_shared, 0, size >> XC_PAGE_SHIFT,
-        &addr, PROT_READ | PROT_WRITE, 0);
+        (void *)&gnttab, PROT_READ | PROT_WRITE, 0);
 
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
+    /* Failure here indicates either that the frames were not mapped
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
@@ -107,6 +145,7 @@ static void test_domain_configurations(void)
         struct test *t = &tests[i];
         uint32_t domid = 0;
         int rc;
+        xen_pfn_t ram[1] = { 0 };
 
         printf("Test %s\n", t->name);
 
@@ -123,8 +162,25 @@ static void test_domain_configurations(void)
 
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
@@ -138,13 +194,26 @@ int main(int argc, char **argv)
 
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


