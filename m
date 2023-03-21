Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC65D6C30BB
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 12:48:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512364.792386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peaTC-0001zr-MF; Tue, 21 Mar 2023 11:48:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512364.792386; Tue, 21 Mar 2023 11:48:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peaTC-0001wq-FW; Tue, 21 Mar 2023 11:48:02 +0000
Received: by outflank-mailman (input) for mailman id 512364;
 Tue, 21 Mar 2023 11:48:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h9ZV=7N=citrix.com=prvs=437435c1e=sergey.dyasli@srs-se1.protection.inumbo.net>)
 id 1peaTA-0001D8-7A
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 11:48:00 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a1cc7c3-c7de-11ed-87f5-c1b5be75604c;
 Tue, 21 Mar 2023 12:47:59 +0100 (CET)
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
X-Inumbo-ID: 3a1cc7c3-c7de-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679399279;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=yPgkIRATgOC2FbBBzbnMPFmEbRwaB2aFJyQAh88EYlA=;
  b=AdhU3IvIKBPjkN4jzRJ4ZW4AaVYe816RnLOvqD/JpGVsg0v541heBy7G
   Repi88XW0IE3Y5ts4Gx1JyAixgOyuY299OuV9Zca4G1qWM+4YuCffD92g
   71PWjt63LWRWZ0gxuVpq5NStMt4Py6C7LlW4q1QAg6CPAfZgEKDeoYmkl
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 101693127
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:5LsfWaxu2AIDQ8YbeFN6t+cDxirEfRIJ4+MujC+fZmUNrF6WrkVRn
 WQfDG3QO/iJMGf8LdEkOonl9RgEv8LRzYI1HlY9qyAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UMHUMja4mtC5QRlP6kT5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KXBzz
 PgqJA8yVRmOo/CV+JGeV/lhict2eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+zi2PwfiwepEOcvq42y2PS0BZwwP7mN9+9ltmiHJ0MwBfD/
 ziZl4j/Ki5AMYOT5X2/zk2xvveMrXyjCKEjSLLto5aGh3XMnzdOWXX6T2CTo/ajjVWlc8lCM
 EFS8S0rxYAw6UiqQ9/VTxC+5nmesXY0QMFMGuc37AWMzKv84AuDAGUACDlbZ7QOtsU7WDgr3
 V+hhM7yCHpkt7j9YWKQ8PKYoC2/PQARLHQefmkUQA0d+d7hrYovyBXVQb5LD6qdntDzXzbqz
 Fi3QDMW3utJy5RRjuPioA6B2mj3znTUcuIrzhTqZ2aX4jxGX4eoQ56L0Xv+8OZNI4nMGzFto
 0M4d9iiAPEmVM/SxXfTHbVUR9lF9N7ebmSC3AcH840Jsm30piX9Jd04DCRWfh8BDyoSRdP+j
 KY/Uyt17YQbAnalZLQfj2mZW5VzlviI+TgIu5npgjtyjntZLlXvENlGPxL44owUuBFEfVsDE
 Zmaa92wKn0RFL5qyjG7L89Ej+B6nXthnT2IHcChp/hC7VZ4TCTNIYrpzXPUNrxphE97nOkl2
 4kGbJbbo/mueOb/fjPW4eYuELz+FlBiXcqeg5UOLoare1M2cFzN/teMmNvNjaQ+xP8L/goJl
 1ngMnJlJK3X3CCacl/RNiA9AF4tNL4mxU8G0eUXFQ7A8xAejUyHts/zq7NfkWEbydFe
IronPort-HdrOrdr: A9a23:mdADxqxh7kdHM7ognWX1KrPwDr1zdoMgy1knxilNoH1uA6mlfq
 WV9pkmPHDP5Ar5NEtOpTn4AtjmfZq+z+8W3WByB9eftWDd0QOVxedZg7cKqAeQeBEWmNQ96U
 5WSdkbNDShNzNHZB7BkXOF+gwbsaG6GX2T9IHjJqtWPHpXgn9bnnpE4mnyKDwOeDV7
X-IronPort-AV: E=Sophos;i="5.98,278,1673931600"; 
   d="scan'208";a="101693127"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Sergey Dyasli <sergey.dyasli@citrix.com>
Subject: [PATCH v3 3/3] tools/xen-ucode: print information about currently loaded ucode
Date: Tue, 21 Mar 2023 11:47:45 +0000
Message-ID: <20230321114745.11044-4-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230321114745.11044-1-sergey.dyasli@citrix.com>
References: <20230321114745.11044-1-sergey.dyasli@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Add an option to xen-ucode tool to print the currently loaded ucode
version and also print it during usage info.  Print CPU signature and
processor flags as well.  The raw data comes from XENPF_get_cpu_version
and XENPF_get_ucode_version platform ops.

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
 tools/misc/xen-ucode.c | 66 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/tools/misc/xen-ucode.c b/tools/misc/xen-ucode.c
index ad32face2b..b9037ce6a1 100644
--- a/tools/misc/xen-ucode.c
+++ b/tools/misc/xen-ucode.c
@@ -12,6 +12,65 @@
 #include <fcntl.h>
 #include <xenctrl.h>
 
+static const char intel_id[] = "GenuineIntel";
+static const char   amd_id[] = "AuthenticAMD";
+
+static void show_curr_cpu(FILE *f)
+{
+    int ret;
+    xc_interface *xch;
+    struct xenpf_pcpu_version cpu_ver = { .xen_cpuid = 0 };
+    struct xenpf_ucode_version ucode_ver = { .xen_cpuid = 0 };
+    bool intel = false, amd = false;
+
+    xch = xc_interface_open(0, 0, 0);
+    if ( xch == NULL )
+        return;
+
+    ret = xc_get_cpu_version(xch, &cpu_ver);
+    if ( ret )
+        return;
+
+    ret = xc_get_ucode_version(xch, &ucode_ver);
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
+                   ucode_ver.cpu_signature);
+    }
+    else if ( amd )
+    {
+        fprintf(f, "Current CPU signature is: fam%xh (raw %#x)\n",
+                   cpu_ver.family, ucode_ver.cpu_signature);
+    }
+
+    if ( intel || amd )
+        fprintf(f, "Current CPU microcode revision is: %#x\n",
+                   ucode_ver.ucode_revision);
+
+    if ( intel )
+        fprintf(f, "Current CPU processor flags are: %#x\n", ucode_ver.pf);
+
+    xc_interface_close(xch);
+}
+
 int main(int argc, char *argv[])
 {
     int fd, ret;
@@ -25,9 +84,16 @@ int main(int argc, char *argv[])
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


