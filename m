Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E04E669644
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 12:57:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477248.739875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGIg6-0004J3-4K; Fri, 13 Jan 2023 11:56:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477248.739875; Fri, 13 Jan 2023 11:56:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGIg6-0004H2-0T; Fri, 13 Jan 2023 11:56:58 +0000
Received: by outflank-mailman (input) for mailman id 477248;
 Fri, 13 Jan 2023 11:56:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qv1V=5K=citrix.com=prvs=370028da5=sergey.dyasli@srs-se1.protection.inumbo.net>)
 id 1pGIg3-0004Gr-VK
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 11:56:55 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e261930-9339-11ed-b8d0-410ff93cb8f0;
 Fri, 13 Jan 2023 12:56:53 +0100 (CET)
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
X-Inumbo-ID: 5e261930-9339-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673611013;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1VhMBk01iAdLd9A1jclGzRw/3yWThCvcmGKvuFToPDE=;
  b=STjmug96AgzJDeZSmRENdZN4MmOrfRTbo5LuvS17b2zhThs93opPUJfU
   n1Rw2EPkeeGN+LpmA83V7gvXGhhhf2gO77cakadWTc6HwNF7swqeoeBpV
   9ck2ODghdd7+dChfsg4p3ZOKao3trOKRZZGcVnGX0hIli3OP3jbxZjvAb
   M=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 91401879
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:Taq30qhe5nGZPnpGVtEmnTUuX161WRAKZh0ujC45NGQN5FlHY01je
 htvDWiDOP6CZjTzKNF/OY3j9k9S75PTn9FmQANo+SE8FHwb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmUpH1QMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWt0N8klgZmP6sT5QaFzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tRBKhoWfgrTt96NzZCqctU8tNQvDvf0adZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJYw1MYH49tL7Aan3XaDBCp1+E46Ym6nPXzSR60aT3McqTcduPLSlQthfB+
 jqfrzuoav0cHNamywq/q3O2vMrsm3/RSZAIC7qY6uE/1TV/wURMUUZLBDNXu8KRiESzRtZeI
 Ew84Tc1oO4580nDZtvgWxy1plaUsxhaXMBfe8Uh8x2EwKfQ5wefB0AHQyRHZdhgs9U5LRQ62
 1nMk973CDhHtLyOVWnb5rqStSm1OyUeMSkFfyBsZRQBy8nupsc0lB2nZtRsCqmulfXuBCr9h
 TuNqUADa6471JBRkf/hpBae3mzq/8KSJuIo2unJdjunxBhpft6VW7ely0nj0aZyPIq7cEbU6
 RDohPOiAPAy4YClzXLSG7hSQu3yvp5pIxWH3wcxQsBJGyCFvif6INsOuGwWyFJBaJ5sRNP/X
 KPEVeq9Drd3NWDiU6J4apnZ5y8Cnfm5ToSNuhw5g7NzjnlNmOyvpnsGiba4hTyFraTVufhX1
 W2nWcitF20GLq9s0SC7QewQuZdymH9lmD+DHsqkl0j7uVZ7WJJzYe1eWLdpRrlmhJ5oXS2Pq
 4oPXyd040g3vBLCjtn/rtdIcAFiwYkTDpHqsc1HHtNv0SI/cFzN/8T5mOt7E6Q8xvQ9qws91
 i3lMqOu4Aal1CKvxMTjQiwLVY4Dqr4m9yhmZXZ3Ywz2s5XhCK72hJoim1IMVeFP3IReITRcF
 ZHpp+3o7ixzdwn6
IronPort-HdrOrdr: A9a23:uNNabahzCNhHD4n/v0v9+MnWgXBQXiAji2hC6mlwRA09TyX5ra
 2TdTogtSMc6QxhPE3I/OrrBEDuexzhHPJOj7X5Xo3SOTUO2lHYT72KhLGKq1Hd8kXFndK1vp
 0QEZSWZueQMbB75/yKnTVREbwbsaW6GHbDv5ag859vJzsaFZ2J921Ce2Gm+tUdfng8OXI+fq
 DsgPZvln6bVlk8SN+0PXUBV/irnaywqHq3CSR2fiLO8WO1/EuV1II=
X-IronPort-AV: E=Sophos;i="5.97,213,1669093200"; 
   d="scan'208";a="91401879"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wl@xen.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] tools/xen-ucode: print information about currently loaded ucode
Date: Fri, 13 Jan 2023 11:56:30 +0000
Message-ID: <20230113115630.22264-1-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Currently it's impossible to get CPU's microcode revision after late
loading without looking into Xen logs which is not always convenient.
Add an option to xen-ucode tool to print the currently loaded ucode
version and also print it during usage info.

Add a new platform op in order to get the required data from Xen.
Print CPU signature and processor flags as well.

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
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Juergen Gross <jgross@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: George Dunlap <george.dunlap@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: "Roger Pau Monné" <roger.pau@citrix.com>
---
 tools/include/xenctrl.h           |  1 +
 tools/libs/ctrl/xc_misc.c         |  5 +++
 tools/misc/xen-ucode.c            | 68 +++++++++++++++++++++++++++++++
 xen/arch/x86/platform_hypercall.c | 32 +++++++++++++++
 xen/include/public/platform.h     | 14 +++++++
 xen/include/xlat.lst              |  1 +
 6 files changed, 121 insertions(+)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 23037874d3..e9911da5ea 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1185,6 +1185,7 @@ typedef uint32_t xc_node_to_node_dist_t;
 int xc_physinfo(xc_interface *xch, xc_physinfo_t *info);
 int xc_cputopoinfo(xc_interface *xch, unsigned *max_cpus,
                    xc_cputopo_t *cputopo);
+int xc_platform_op(xc_interface *xch, struct xen_platform_op *op);
 int xc_microcode_update(xc_interface *xch, const void *buf, size_t len);
 int xc_numainfo(xc_interface *xch, unsigned *max_nodes,
                 xc_meminfo_t *meminfo, uint32_t *distance);
diff --git a/tools/libs/ctrl/xc_misc.c b/tools/libs/ctrl/xc_misc.c
index 265f15ec2d..d03c240d14 100644
--- a/tools/libs/ctrl/xc_misc.c
+++ b/tools/libs/ctrl/xc_misc.c
@@ -226,6 +226,11 @@ int xc_microcode_update(xc_interface *xch, const void *buf, size_t len)
     return ret;
 }
 
+int xc_platform_op(xc_interface *xch, struct xen_platform_op *op)
+{
+    return do_platform_op(xch, op);
+}
+
 int xc_cputopoinfo(xc_interface *xch, unsigned *max_cpus,
                    xc_cputopo_t *cputopo)
 {
diff --git a/tools/misc/xen-ucode.c b/tools/misc/xen-ucode.c
index ad32face2b..c4cb4fbb50 100644
--- a/tools/misc/xen-ucode.c
+++ b/tools/misc/xen-ucode.c
@@ -12,6 +12,67 @@
 #include <fcntl.h>
 #include <xenctrl.h>
 
+static const char *intel_id = "GenuineIntel";
+static const char *amd_id   = "AuthenticAMD";
+
+void show_curr_cpu(FILE *f)
+{
+    int ret;
+    xc_interface *xch;
+    struct xen_platform_op op_cpu = {0}, op_ucode = {0};
+    struct xenpf_pcpu_version *cpu_ver = &op_cpu.u.pcpu_version;
+    struct xenpf_ucode_version *ucode_ver = &op_ucode.u.ucode_version;
+    bool intel = false, amd = false;
+
+    xch = xc_interface_open(0, 0, 0);
+    if ( xch == NULL )
+        return;
+
+    op_cpu.cmd = XENPF_get_cpu_version;
+    op_cpu.interface_version = XENPF_INTERFACE_VERSION;
+    op_cpu.u.pcpu_version.xen_cpuid = 0;
+
+    ret = xc_platform_op(xch, &op_cpu);
+    if ( ret )
+        return;
+
+    op_ucode.cmd = XENPF_get_ucode_version;
+    op_ucode.interface_version = XENPF_INTERFACE_VERSION;
+    op_ucode.u.pcpu_version.xen_cpuid = 0;
+
+    ret = xc_platform_op(xch, &op_ucode);
+    if ( ret )
+        return;
+
+    if ( memcmp(cpu_ver->vendor_id, intel_id,
+                sizeof(cpu_ver->vendor_id)) == 0 )
+        intel = true;
+    else if ( memcmp(cpu_ver->vendor_id, amd_id,
+                     sizeof(cpu_ver->vendor_id)) == 0 )
+        amd = true;
+
+    if ( intel )
+    {
+        fprintf(f, "Current CPU signature is: %02x-%02x-%02x (raw %#x)\n",
+                   cpu_ver->family, cpu_ver->model, cpu_ver->stepping,
+                   ucode_ver->cpu_signature);
+    }
+    else if ( amd )
+    {
+        fprintf(f, "Current CPU signature is: fam%xh (raw %#x)\n",
+                   cpu_ver->family, ucode_ver->cpu_signature);
+    }
+
+    if ( intel || amd )
+        fprintf(f, "Current CPU microcode revision is: %#x\n",
+                   ucode_ver->ucode_revision);
+
+    if ( intel )
+        fprintf(f, "Current CPU processor flags are: %#x\n", ucode_ver->pf);
+
+    xc_interface_close(xch);
+}
+
 int main(int argc, char *argv[])
 {
     int fd, ret;
@@ -20,11 +81,18 @@ int main(int argc, char *argv[])
     struct stat st;
     xc_interface *xch;
 
+    if ( argc >= 2 && !strcmp(argv[1], "show-cpu-info") )
+    {
+        show_curr_cpu(stdout);
+        return 0;
+    }
+
     if ( argc < 2 )
     {
         fprintf(stderr,
                 "xen-ucode: Xen microcode updating tool\n"
                 "Usage: %s <microcode blob>\n", argv[0]);
+        show_curr_cpu(stderr);
         exit(2);
     }
 
diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
index 08ab2fea62..fcb7d81db1 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -640,6 +640,38 @@ ret_t do_platform_op(
     }
     break;
 
+    case XENPF_get_ucode_version:
+    {
+        struct xenpf_ucode_version *ver = &op->u.ucode_version;
+
+        if ( !get_cpu_maps() )
+        {
+            ret = -EBUSY;
+            break;
+        }
+
+        if ( (ver->xen_cpuid >= nr_cpu_ids) || !cpu_online(ver->xen_cpuid) )
+        {
+            ver->cpu_signature = 0;
+            ver->pf = 0;
+            ver->ucode_revision = 0;
+        }
+        else
+        {
+            const struct cpu_signature *sig = &per_cpu(cpu_sig, ver->xen_cpuid);
+
+            ver->cpu_signature = sig->sig;
+            ver->pf = sig->pf;
+            ver->ucode_revision = sig->rev;
+        }
+
+        put_cpu_maps();
+
+        if ( __copy_field_to_guest(u_xenpf_op, op, u.ucode_version) )
+            ret = -EFAULT;
+    }
+    break;
+
     case XENPF_cpu_online:
     {
         int cpu = op->u.cpu_ol.cpuid;
diff --git a/xen/include/public/platform.h b/xen/include/public/platform.h
index 14784dfa77..1a24dc24c0 100644
--- a/xen/include/public/platform.h
+++ b/xen/include/public/platform.h
@@ -610,6 +610,19 @@ DEFINE_XEN_GUEST_HANDLE(xenpf_symdata_t);
 typedef struct dom0_vga_console_info xenpf_dom0_console_t;
 DEFINE_XEN_GUEST_HANDLE(xenpf_dom0_console_t);
 
+#define XENPF_get_ucode_version 65
+struct xenpf_ucode_version {
+    uint32_t xen_cpuid;       /* IN:  CPU number to get the revision from.  */
+                              /*      Return data should be equal among all */
+                              /*      the CPUs.                             */
+    uint32_t cpu_signature;   /* OUT: CPU signature (CPUID.1.EAX).          */
+    uint32_t pf;              /* OUT: Processor Flags.                      */
+                              /*      Only applicable to Intel.             */
+    uint32_t ucode_revision;  /* OUT: Microcode Revision.                   */
+};
+typedef struct xenpf_ucode_version xenpf_ucode_version_t;
+DEFINE_XEN_GUEST_HANDLE(xenpf_ucode_version_t);
+
 /*
  * ` enum neg_errnoval
  * ` HYPERVISOR_platform_op(const struct xen_platform_op*);
@@ -641,6 +654,7 @@ struct xen_platform_op {
         xenpf_resource_op_t           resource_op;
         xenpf_symdata_t               symdata;
         xenpf_dom0_console_t          dom0_console;
+        xenpf_ucode_version_t         ucode_version;
         uint8_t                       pad[128];
     } u;
 };
diff --git a/xen/include/xlat.lst b/xen/include/xlat.lst
index d601a8a984..164f700eb6 100644
--- a/xen/include/xlat.lst
+++ b/xen/include/xlat.lst
@@ -157,6 +157,7 @@
 ?	xenpf_pcpuinfo			platform.h
 ?	xenpf_pcpu_version		platform.h
 ?	xenpf_resource_entry		platform.h
+?	xenpf_ucode_version		platform.h
 ?	pmu_data			pmu.h
 ?	pmu_params			pmu.h
 !	sched_poll			sched.h
-- 
2.17.1


