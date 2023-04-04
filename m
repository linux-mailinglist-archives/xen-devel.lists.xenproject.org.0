Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4709E6D685A
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 18:07:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518017.804132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjjBn-000453-Fu; Tue, 04 Apr 2023 16:07:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518017.804132; Tue, 04 Apr 2023 16:07:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjjBn-00042f-CQ; Tue, 04 Apr 2023 16:07:19 +0000
Received: by outflank-mailman (input) for mailman id 518017;
 Tue, 04 Apr 2023 16:07:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gCXw=73=citrix.com=prvs=451435b33=sergey.dyasli@srs-se1.protection.inumbo.net>)
 id 1pjjBm-00042B-23
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 16:07:18 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3963683-d302-11ed-b464-930f4c7d94ae;
 Tue, 04 Apr 2023 18:07:15 +0200 (CEST)
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
X-Inumbo-ID: c3963683-d302-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680624435;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=QsmKjz9FSvqTsAQ5kNWHSGgpoV1tw0uvDbd0t6jEgvo=;
  b=NauPj0zhH9qqNc6uPFGBX8VXr0Up6GZZd0gvygJjwLe7C7Koahpvl82A
   0MpOcsKx1psg4lBqMqXAlqfnIiBHHHgsZTkqjp0iffgB1d2qv1x6/gHy6
   GSAVjeFsxOw+iaWQY/ITmdWbaCOZWZ9XB5qtHI3G4ndR1UTWIelxf/4ou
   0=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 104328623
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:dUgNEal0GTwHMn6zhFqF1jTo5gy2JkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIeUG6DOa6IZjD9e91zboXjox8AuZPUyYdrGQRu/C08HiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aSaVA8w5ARkPqgX5AOGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 f1HNzVWV0uqvvm3/a+KbdFql8MAcPC+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsWYAx/5JEWxY9EglHkfidXpUPTqbs++GzS5AdwzKLsIJzefdniqcB9xx7E/
 TiWoT6iav0cHNWa1CLZz2qJv+PWgRjXZI43RJLj0cc/1TV/wURMUUZLBDNXu8KRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JSGeAn7ACGyoLP/h2UQGMDS1Zpd9gOpMIwAzsw2
 TehndzzAid0mKaIUn/b/bCRxRuwJCwUIGkqdSICCwwf7LHLu5ovhxjCStJiFq+djdDvHzz0h
 TeQo0ADa6471JBRkf/hpBae3mzq/8KSJuIo2unJdmP68QYiXdWMXpep1EXqys5GPYG6EmDU6
 RDohPOiAPAy4YClzXLdGLtVQOr4u55pIxWH3wcxQsBJGyCFvif6INsOuGwWyFJBaJ5sRNP/X
 KPEVeq9Drd3NWDiU6J4apnZ5y8Cnfm5ToSNuhw5g7NzjnlNmOyvpnsGiba4hTyFraTVufhX1
 W2nWcitF20GLq9s0SC7QewQuZdymHBmmD+NFMqglUr3uVZ7WJJyYe5dWGZik8hjtP/UyOkr2
 4032zS2J+V3D7SlP3i/HX87JlEWN3krba3LRzhsXrfbeGJOQThxY8I9NJt9I+SJaYwJzLaXl
 px8M2cEoGfCaYrvcl/VMCo7NOu+Bf6SbxsTZEQRALph4FB7Ca7H0UvVX8JfkWUPnAC78cNJc
 g==
IronPort-HdrOrdr: A9a23:A8CGqKNzLcl7FsBcTuqjsMiBIKoaSvp037BL7TEVdfUxSKb0qy
 nAppgmPHPP5wr5IUtQ4OxoW5PwI080l6QU3WB5B97LYOCBggWVxepZnOjfKlPbehEWwdQtsZ
 uII5IUNDQpNykAsS8h2njfLz/8+qjhzEl1v5an856yd3ARV51d
X-IronPort-AV: E=Sophos;i="5.98,318,1673931600"; 
   d="scan'208";a="104328623"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Sergey Dyasli <sergey.dyasli@citrix.com>
Subject: [PATCH v4 2/3] x86/platform: introduce XENPF_get_ucode_revision
Date: Tue, 4 Apr 2023 17:06:54 +0100
Message-ID: <20230404160655.2354-3-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230404160655.2354-1-sergey.dyasli@citrix.com>
References: <20230404160655.2354-1-sergey.dyasli@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Currently it's impossible to get CPU's microcode revision from Xen after
late loading without looking into Xen logs which is not always convenient.

Add a new platform op in order to get the required data from Xen and
provide a wrapper for libxenctrl.

Signed-off-by: Sergey Dyasli <sergey.dyasli@citrix.com>
---
v3 --> v4:
- clarified the commit message
- Renamed "ucode version" to "ucode revision"
- Removed DECLARE_PLATFORM_OP and NULL checks
- Added a TODO comment about parked CPUs
- Renamed struct xenpf_ucode_revision fields
---
 tools/include/xenctrl.h                  |  2 ++
 tools/libs/ctrl/xc_misc.c                | 18 +++++++++++++++
 xen/arch/x86/platform_hypercall.c        | 29 ++++++++++++++++++++++++
 xen/arch/x86/x86_64/platform_hypercall.c |  4 ++++
 xen/include/public/platform.h            | 11 +++++++++
 xen/include/xlat.lst                     |  1 +
 6 files changed, 65 insertions(+)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 34b3b25289..1149f805ba 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1187,6 +1187,8 @@ int xc_cputopoinfo(xc_interface *xch, unsigned *max_cpus,
                    xc_cputopo_t *cputopo);
 int xc_microcode_update(xc_interface *xch, const void *buf, size_t len);
 int xc_get_cpu_version(xc_interface *xch, struct xenpf_pcpu_version *cpu_ver);
+int xc_get_ucode_revision(xc_interface *xch,
+                          struct xenpf_ucode_revision *ucode_rev);
 int xc_numainfo(xc_interface *xch, unsigned *max_nodes,
                 xc_meminfo_t *meminfo, uint32_t *distance);
 int xc_pcitopoinfo(xc_interface *xch, unsigned num_devs,
diff --git a/tools/libs/ctrl/xc_misc.c b/tools/libs/ctrl/xc_misc.c
index 90d50faa4f..4159294b2e 100644
--- a/tools/libs/ctrl/xc_misc.c
+++ b/tools/libs/ctrl/xc_misc.c
@@ -243,6 +243,24 @@ int xc_get_cpu_version(xc_interface *xch, struct xenpf_pcpu_version *cpu_ver)
     return 0;
 }
 
+int xc_get_ucode_revision(xc_interface *xch,
+                          struct xenpf_ucode_revision *ucode_rev)
+{
+    int ret;
+    struct xen_platform_op op = {
+        .cmd = XENPF_get_ucode_revision,
+        .u.ucode_revision.cpu = ucode_rev->cpu,
+    };
+
+    ret = do_platform_op(xch, &op);
+    if ( ret != 0 )
+        return ret;
+
+    *ucode_rev = op.u.ucode_revision;
+
+    return 0;
+}
+
 int xc_cputopoinfo(xc_interface *xch, unsigned *max_cpus,
                    xc_cputopo_t *cputopo)
 {
diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
index a2d9526355..9ff2da8fc3 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -640,6 +640,35 @@ ret_t do_platform_op(
     }
     break;
 
+    case XENPF_get_ucode_revision:
+    {
+        struct xenpf_ucode_revision *rev = &op->u.ucode_revision;
+
+        if ( !get_cpu_maps() )
+        {
+            ret = -EBUSY;
+            break;
+        }
+
+        /* TODO: make it possible to know ucode revisions for parked CPUs */
+        if ( (rev->cpu >= nr_cpu_ids) || !cpu_online(rev->cpu) )
+            ret = -ENOENT;
+        else
+        {
+            const struct cpu_signature *sig = &per_cpu(cpu_sig, rev->cpu);
+
+            rev->signature = sig->sig;
+            rev->pf = sig->pf;
+            rev->revision = sig->rev;
+        }
+
+        put_cpu_maps();
+
+        if ( __copy_field_to_guest(u_xenpf_op, op, u.ucode_revision) )
+            ret = -EFAULT;
+    }
+    break;
+
     case XENPF_cpu_online:
     {
         int cpu = op->u.cpu_ol.cpuid;
diff --git a/xen/arch/x86/x86_64/platform_hypercall.c b/xen/arch/x86/x86_64/platform_hypercall.c
index 5bf6b958d2..99440f4076 100644
--- a/xen/arch/x86/x86_64/platform_hypercall.c
+++ b/xen/arch/x86/x86_64/platform_hypercall.c
@@ -28,6 +28,10 @@ CHECK_pf_pcpuinfo;
 CHECK_pf_pcpu_version;
 #undef xen_pf_pcpu_version
 
+#define xen_pf_ucode_revision xenpf_ucode_revision
+CHECK_pf_ucode_revision;
+#undef xen_pf_pucode_revision
+
 #define xen_pf_enter_acpi_sleep xenpf_enter_acpi_sleep
 CHECK_pf_enter_acpi_sleep;
 #undef xen_pf_enter_acpi_sleep
diff --git a/xen/include/public/platform.h b/xen/include/public/platform.h
index 60caa5ce7e..15777b5416 100644
--- a/xen/include/public/platform.h
+++ b/xen/include/public/platform.h
@@ -614,6 +614,16 @@ DEFINE_XEN_GUEST_HANDLE(xenpf_symdata_t);
 typedef struct dom0_vga_console_info xenpf_dom0_console_t;
 DEFINE_XEN_GUEST_HANDLE(xenpf_dom0_console_t);
 
+#define XENPF_get_ucode_revision 65
+struct xenpf_ucode_revision {
+    uint32_t cpu;             /* IN:  CPU number to get the revision from.  */
+    uint32_t signature;       /* OUT: CPU signature (CPUID.1.EAX).          */
+    uint32_t pf;              /* OUT: Platform Flags (Intel only)           */
+    uint32_t revision;        /* OUT: Microcode Revision.                   */
+};
+typedef struct xenpf_ucode_revision xenpf_ucode_revision_t;
+DEFINE_XEN_GUEST_HANDLE(xenpf_ucode_revision_t);
+
 /*
  * ` enum neg_errnoval
  * ` HYPERVISOR_platform_op(const struct xen_platform_op*);
@@ -645,6 +655,7 @@ struct xen_platform_op {
         xenpf_resource_op_t           resource_op;
         xenpf_symdata_t               symdata;
         xenpf_dom0_console_t          dom0_console;
+        xenpf_ucode_revision_t        ucode_revision;
         uint8_t                       pad[128];
     } u;
 };
diff --git a/xen/include/xlat.lst b/xen/include/xlat.lst
index d601a8a984..9c41948514 100644
--- a/xen/include/xlat.lst
+++ b/xen/include/xlat.lst
@@ -157,6 +157,7 @@
 ?	xenpf_pcpuinfo			platform.h
 ?	xenpf_pcpu_version		platform.h
 ?	xenpf_resource_entry		platform.h
+?	xenpf_ucode_revision		platform.h
 ?	pmu_data			pmu.h
 ?	pmu_params			pmu.h
 !	sched_poll			sched.h
-- 
2.17.1


