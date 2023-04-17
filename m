Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BFE6E4A5F
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 15:54:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522144.811354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poPIr-0003oK-B0; Mon, 17 Apr 2023 13:53:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522144.811354; Mon, 17 Apr 2023 13:53:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poPIr-0003lt-6m; Mon, 17 Apr 2023 13:53:57 +0000
Received: by outflank-mailman (input) for mailman id 522144;
 Mon, 17 Apr 2023 13:53:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tMb/=AI=citrix.com=prvs=464dae365=sergey.dyasli@srs-se1.protection.inumbo.net>)
 id 1poPIq-0003Vm-7O
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 13:53:56 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4af54abe-dd27-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 15:53:55 +0200 (CEST)
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
X-Inumbo-ID: 4af54abe-dd27-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681739635;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=7KS8mI+2XK81GgSuy9LkhsX3/pJwxpsay4LFxPQZ9HE=;
  b=ML4mF6vfk1UA7dfhfIy84o46AnNrd2IKeasiYeKrVyv/HgYLxT0NrBlP
   Th1LNcRqrYX4acIQlOpb5388bRd/yGwqPXYdVJlPNP85ZydX7/EhkGD68
   32mpLTwFF/9VD8M6YK0b045Qtz/0YFMkTHOx7tY5XhHcgvTyiDQ9a6yvf
   4=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 105714904
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:fOWrdK11+YApajHoh/bD5eRxkn2cJEfYwER7XKvMYLTBsI5bpzYDy
 GZKUWGAO62KNDb9LohxOd7k9EtU7JHWmtBiQQNrpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+XuDgNyo4GlD5gBnOqgS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfEWFr5
 aUnDiI2S0qjjf6/wre7Y9Y8iZF2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKk2aOHWjOX9OYH46tPylnHbyYntUuVuOoasf6GnP1g1hlrPqNbI5f/TTHZgKxxrJ/
 j6uE2LRGCgLKuOS0mW58F2O36yVmh6qfIEQPejtnhJtqALKnTFCYPEMbnOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHslhwWVsdUEuY6wBqQ0aeS6AGcbkAbShZRZdpgs9U5LRQo2
 UWOhMjBHiF0vfueTnf13rWJqTK/PwAFIGlEYjULJSMe+MXqqow3ihPJT/5gHbSzg9mzHiv/q
 w1mtwBn2e9V15RSkfzmoxae2WnESoX1ohAd9gXyTjuayBFCQdSFbZCh613bxMkQI9PMJrWeh
 0Toi/Ry/chXU8HUyHfcHbRRdF26z63baWOB2DaDC7Fkrm3woCD7IOi89RkkfC9U3tA4lSgFi
 aM5kSdY/9dtMXSjdsebiKrhWp1xncAM+TkIP804j+aigbArLmdrBAk0OSatM5nFySDAa50XN
 5aBatqLBn0HE6lhxzfeb75DgeZ1mXhmmD6MHcyTI/GbPV22PSf9dFv4GAHWMrBRAF2s+205D
 Oqzx+PVkk4CAYUSkwHc8JIJLEBiEEXX8ave8pQNHsbae1oOJY3UI6OJqV/XU9A/zvs9eyah1
 i3VZ3K0P3Kl3SWddl7SOi46AF4tNL4mxU8G0eUXFQ7A8xAejUyHts/zq7NfkWEbydFe
IronPort-HdrOrdr: A9a23:OQ2t/a7VQnXfEhFUYQPXwMjXdLJyesId70hD6qhwISY7TiX4rb
 HJoB11737JYVoqNU3I3OrwWpVoIkmskqKdg7NwAV7KZmCP0wGVxcNZnO7fKlXbaknDH4Vmu5
 uIHZITNDSJNykYsfrH
X-Talos-CUID: 9a23:na9ANGFBAGyK2kkGqmJ39GsEQ/8DYEb4llfaP0a6DGZAd+2aHAo=
X-Talos-MUID: 9a23:TTtyRwYKBFHTvOBTrQb9mg5vL5hU4YuMUQNXlqhXn8qGHHkl
X-IronPort-AV: E=Sophos;i="5.99,204,1677560400"; 
   d="scan'208";a="105714904"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Sergey Dyasli <sergey.dyasli@citrix.com>
Subject: [PATCH v5 3/3] tools/xen-ucode: print information about currently loaded ucode
Date: Mon, 17 Apr 2023 14:53:35 +0100
Message-ID: <20230417135335.17176-4-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230417135335.17176-1-sergey.dyasli@citrix.com>
References: <20230417135335.17176-1-sergey.dyasli@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Add an option to xen-ucode tool to print the currently loaded ucode
revision and also print it during usage info.  Print CPU signature and
platform flags as well.  The raw data comes from XENPF_get_cpu_version
and XENPF_get_ucode_revision platform ops.

Example output:
    Intel: CPU signature 06-55-04 (raw 0x00050654) pf 0x1 revision 0x02006e05
      AMD: CPU signature 19-01-01 (raw 0x00a00f11) revision 0x0a0011ce

Signed-off-by: Sergey Dyasli <sergey.dyasli@citrix.com>
---
v4 --> v5:
- Changed AMD output to be FF-MM-SS instead of famXX
- Modified usage string
- Fixed fprintf indentation
- Printing error messages always to stderr
- Use appropriate exit codes in show_curr_cpu()
---
 tools/misc/xen-ucode.c | 85 +++++++++++++++++++++++++++++++++++++-----
 1 file changed, 75 insertions(+), 10 deletions(-)

diff --git a/tools/misc/xen-ucode.c b/tools/misc/xen-ucode.c
index ad32face2b..c6ae6498d6 100644
--- a/tools/misc/xen-ucode.c
+++ b/tools/misc/xen-ucode.c
@@ -12,22 +12,95 @@
 #include <fcntl.h>
 #include <xenctrl.h>
 
+static xc_interface *xch;
+
+static const char intel_id[] = "GenuineIntel";
+static const char   amd_id[] = "AuthenticAMD";
+
+static void show_curr_cpu(FILE *f)
+{
+    int ret;
+    struct xenpf_pcpu_version cpu_ver = { .xen_cpuid = 0 };
+    struct xenpf_ucode_revision ucode_rev = { .cpu = 0 };
+    /* Always exit with 2 when called during usage-info */
+    int exit_code = (f == stderr) ? 2 : 1;
+
+    ret = xc_get_cpu_version(xch, &cpu_ver);
+    if ( ret )
+    {
+        fprintf(stderr, "Failed to get CPU information. (err: %s)\n",
+                strerror(errno));
+        exit(exit_code);
+    }
+
+    ret = xc_get_ucode_revision(xch, &ucode_rev);
+    if ( ret )
+    {
+        fprintf(stderr, "Failed to get microcode information. (err: %s)\n",
+                strerror(errno));
+        exit(exit_code);
+    }
+
+    /*
+     * Print signature in a form that allows to quickly identify which ucode
+     * blob to load, e.g.:
+     *
+     *      Intel:   /lib/firmware/intel-ucode/06-55-04
+     *      AMD:     /lib/firmware/amd-ucode/microcode_amd_fam19h.bin
+     */
+    if ( memcmp(cpu_ver.vendor_id, intel_id,
+                sizeof(cpu_ver.vendor_id)) == 0 )
+    {
+        fprintf(f,
+                "CPU signature %02x-%02x-%02x (raw 0x%08x) pf %#x revision 0x%08x\n",
+                cpu_ver.family, cpu_ver.model, cpu_ver.stepping,
+                ucode_rev.signature, ucode_rev.pf, ucode_rev.revision);
+    }
+    else if ( memcmp(cpu_ver.vendor_id, amd_id,
+                     sizeof(cpu_ver.vendor_id)) == 0 )
+    {
+        fprintf(f,
+                "CPU signature %02x-%02x-%02x (raw 0x%08x) revision 0x%08x\n",
+                cpu_ver.family, cpu_ver.model, cpu_ver.stepping,
+                ucode_rev.signature, ucode_rev.revision);
+    }
+    else
+    {
+        fprintf(f, "Unsupported CPU vendor: %s\n", cpu_ver.vendor_id);
+        exit(exit_code);
+    }
+}
+
 int main(int argc, char *argv[])
 {
     int fd, ret;
     char *filename, *buf;
     size_t len;
     struct stat st;
-    xc_interface *xch;
+
+    xch = xc_interface_open(NULL, NULL, 0);
+    if ( xch == NULL )
+    {
+        fprintf(stderr, "Error opening xc interface. (err: %s)\n",
+                strerror(errno));
+        exit(1);
+    }
 
     if ( argc < 2 )
     {
         fprintf(stderr,
                 "xen-ucode: Xen microcode updating tool\n"
-                "Usage: %s <microcode blob>\n", argv[0]);
+                "Usage: %s [<microcode file> | show-cpu-info]\n", argv[0]);
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
@@ -52,14 +125,6 @@ int main(int argc, char *argv[])
         exit(1);
     }
 
-    xch = xc_interface_open(NULL, NULL, 0);
-    if ( xch == NULL )
-    {
-        fprintf(stderr, "Error opening xc interface. (err: %s)\n",
-                strerror(errno));
-        exit(1);
-    }
-
     ret = xc_microcode_update(xch, buf, len);
     if ( ret )
     {
-- 
2.17.1


