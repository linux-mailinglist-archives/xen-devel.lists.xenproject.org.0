Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 096116A5E5C
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 18:40:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503618.775942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX3xQ-00077l-MF; Tue, 28 Feb 2023 17:40:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503618.775942; Tue, 28 Feb 2023 17:40:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX3xQ-00075v-Gs; Tue, 28 Feb 2023 17:40:08 +0000
Received: by outflank-mailman (input) for mailman id 503618;
 Tue, 28 Feb 2023 17:40:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WuWh=6Y=citrix.com=prvs=4168872ba=sergey.dyasli@srs-se1.protection.inumbo.net>)
 id 1pX3xP-0006sS-0Z
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 17:40:07 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef28cf96-b78e-11ed-9695-2f268f93b82a;
 Tue, 28 Feb 2023 18:40:05 +0100 (CET)
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
X-Inumbo-ID: ef28cf96-b78e-11ed-9695-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677606005;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=kdC88fnrW3jwxtsuxpGeNQRlenhGudj0ts02zqy7nC0=;
  b=UIRFRGfdI5Bj1Qio7ep0z3zGvALT3C8U5fEaQdy26WAQnzhe0zUsyZxx
   D+v3LRoxyVw1nYxPTf6p6yFwe8fqGBqnQwju+OLR44eg4T9d2saUx/WOj
   EWtMohFvoKmvhfqNaDZMazxXLPWRKf7Dk8NjsCh0ofcTIPG+F616gnx3Y
   g=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 97712737
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:aBlO+qOutWkswmPvrR1ql8FynXyQoLVcMsEvi/4bfWQNrUpw0zwDx
 zAbDGqEaKmINjf0ed90b9uzpkoCscTXxtZiTAto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvLrRC9H5qyo42tC5AxmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0sVqX0NM1
 fwCEgpOf0ujt9Oay7Krd8A506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLolkf2ni2i5fyxRs1aUjaE2/3LS3Ep6172F3N/9K4PVHJ8KxRnwS
 mTurnjgXhswZc6lxWTbqGCLivSWlATWYddHfFG/3qEz2wDCroAJMzUGWF3+rfSnh0qWX9NEN
 1dS6icotbI19kGgUp/6RRLQiHyOswMYWtFQO/Yn8wzLwa3Riy6GAkAUQzgHb8Yp3Oc0SiYtz
 UShhM7yCHpkt7j9YXCA8raZqxuiNC5TKnUNDQcfVhcM6dTnpIA1jzrMQ8xlHarzicf6cQwc2
 BjT8nJ43e9Ky5dWiePipwuvby+QSobhbRNrxAf3Xnif1EBoP66VVqCj6UjmxKMVRGqGdWWps
 H8BksmYyekBC5CRiSCAKNkw8KGVC+Wta2OF3wM2d3U133H0oiP4I9gMiN1rDB0xWvvobwMFd
 6M6Vel5wJZIdEWnYqZsC25aI5R7lPOwfTgJux29UzavXnSTXFXalM2NTRTKt4wIrKTLufBXB
 HtjWZzwZUv28Iw+pNZMe88T0KUw2gc1zn7JSJbwwnyPiOTBOyPPE+ZdbArSP4jVCZ9oRy2Pr
 r5i2zaikU0DAIUSnAGMmWLsEbz6BSdiXs2nwyCmXuWCPhBnCAkc5wz5mNscl3het/0NzI/gp
 yjtMnK0PXKj3RUr3y3WMCE8AF4uNL4jxU8G0dsEZg74iiVzMN30s8/ytfIfJNEayQCq9tYsJ
 9FtRilKKq4npujvk9jFUaTAkQ==
IronPort-HdrOrdr: A9a23:cVrne6ky+hi/320npnxreUI5IC3pDfIs3DAbv31ZSRFFG/Fxl6
 iV88jztCWE7gr5N0tApTntAsS9qDbnhPxICOoqTNCftWvd2FdARbsKheCJ/9SjIVyaygc079
 YFT0EUMrPN5DZB4foSmDPIcOod/A==
X-IronPort-AV: E=Sophos;i="5.98,222,1673931600"; 
   d="scan'208";a="97712737"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Sergey Dyasli <sergey.dyasli@citrix.com>
Subject: [PATCH v2 3/3] tools/xen-ucode: print information about currently loaded ucode
Date: Tue, 28 Feb 2023 17:39:32 +0000
Message-ID: <20230228173932.28510-4-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230228173932.28510-1-sergey.dyasli@citrix.com>
References: <20230228173932.28510-1-sergey.dyasli@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Add an option to xen-ucode tool to print the currently loaded ucode
version and also print it during usage info.  Print CPU signature and
processor flags as well.  The raw data comes from cpuinfo directory in
xenhypfs and from XENPF_get_cpu_version platform op.

Example output:
    Intel:
    Current CPU signature is: 06-55-04 (raw 0x50654)
    Current CPU microcode revision is: 0x2006e05
    Current CPU processor flags are: 0x1

    AMD:
    Current CPU signature is: fam19h (raw 0xa00f11)
    Current CPU microcode revision is: 0xa0011a8

Signed-off-by: Sergey Dyasli <sergey.dyasli@citrix.com>
---
 tools/misc/Makefile    |  2 +-
 tools/misc/xen-ucode.c | 97 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 98 insertions(+), 1 deletion(-)

diff --git a/tools/misc/Makefile b/tools/misc/Makefile
index 1c6e1d6a04..e345ac76db 100644
--- a/tools/misc/Makefile
+++ b/tools/misc/Makefile
@@ -136,6 +136,6 @@ xencov: xencov.o
 	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(APPEND_LDFLAGS)
 
 xen-ucode: xen-ucode.o
-	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(APPEND_LDFLAGS)
+	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(LDLIBS_libxenhypfs) $(APPEND_LDFLAGS)
 
 -include $(DEPS_INCLUDE)
diff --git a/tools/misc/xen-ucode.c b/tools/misc/xen-ucode.c
index ad32face2b..7e657689f4 100644
--- a/tools/misc/xen-ucode.c
+++ b/tools/misc/xen-ucode.c
@@ -11,6 +11,96 @@
 #include <sys/stat.h>
 #include <fcntl.h>
 #include <xenctrl.h>
+#include <xenhypfs.h>
+
+static const char intel_id[] = "GenuineIntel";
+static const char   amd_id[] = "AuthenticAMD";
+
+static const char sig_path[] = "/cpuinfo/cpu-signature";
+static const char rev_path[] = "/cpuinfo/microcode-revision";
+static const char  pf_path[] = "/cpuinfo/processor-flags";
+
+static int hypfs_read_uint(struct xenhypfs_handle *hdl, const char *path,
+                           unsigned int *var)
+{
+    char *result;
+    result = xenhypfs_read(hdl, path);
+    if ( !result )
+        return -1;
+
+    errno = 0;
+    *var = strtol(result, NULL, 10);
+    if ( errno )
+        return -1;
+
+    return 0;
+}
+
+static void show_curr_cpu(FILE *f)
+{
+    int ret;
+    struct xenhypfs_handle *hdl;
+    xc_interface *xch;
+    struct xenpf_pcpu_version cpu_ver = {0};
+    bool intel = false, amd = false;
+    unsigned int cpu_signature, pf, ucode_revision;
+
+    hdl = xenhypfs_open(NULL, 0);
+    if ( !hdl )
+        return;
+
+    xch = xc_interface_open(0, 0, 0);
+    if ( xch == NULL )
+        return;
+
+    ret = xc_get_cpu_version(xch, &cpu_ver);
+    if ( ret )
+        return;
+
+    if ( memcmp(cpu_ver.vendor_id, intel_id,
+                sizeof(cpu_ver.vendor_id)) == 0 )
+        intel = true;
+    else if ( memcmp(cpu_ver.vendor_id, amd_id,
+                     sizeof(cpu_ver.vendor_id)) == 0 )
+        amd = true;
+
+    if ( hypfs_read_uint(hdl, sig_path, &cpu_signature) != 0 )
+        return;
+
+    if ( hypfs_read_uint(hdl, rev_path, &ucode_revision) != 0 )
+        return;
+
+    if ( intel && hypfs_read_uint(hdl, pf_path,  &pf) != 0 )
+        return;
+
+    /*
+     * Print signature in a form that allows to quickly identify which ucode
+     * blob to load, e.g.:
+     *
+     *      Intel:   /lib/firmware/intel-ucode/06-55-04
+     *      AMD:     /lib/firmware/amd-ucode/microcode_amd_fam19h.bin
+     */
+    if ( intel )
+    {
+        fprintf(f, "Current CPU signature is: %02x-%02x-%02x (raw %#x)\n",
+                   cpu_ver.family, cpu_ver.model, cpu_ver.stepping,
+                   cpu_signature);
+    }
+    else if ( amd )
+    {
+        fprintf(f, "Current CPU signature is: fam%xh (raw %#x)\n",
+                   cpu_ver.family, cpu_signature);
+    }
+
+    if ( intel || amd )
+        fprintf(f, "Current CPU microcode revision is: %#x\n", ucode_revision);
+
+    if ( intel )
+        fprintf(f, "Current CPU processor flags are: %#x\n", pf);
+
+    xc_interface_close(xch);
+    xenhypfs_close(hdl);
+}
 
 int main(int argc, char *argv[])
 {
@@ -25,9 +115,16 @@ int main(int argc, char *argv[])
         fprintf(stderr,
                 "xen-ucode: Xen microcode updating tool\n"
                 "Usage: %s <microcode blob>\n", argv[0]);
+        show_curr_cpu(stderr);
         exit(2);
     }
 
+    if ( !strcmp(argv[1], "show-cpu-info") )
+    {
+        show_curr_cpu(stdout);
+        return 0;
+    }
+
     filename = argv[1];
     fd = open(filename, O_RDONLY);
     if ( fd < 0 )
-- 
2.17.1


