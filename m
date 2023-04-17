Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C21F76E4A60
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 15:54:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522147.811374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poPJ1-0004aY-VO; Mon, 17 Apr 2023 13:54:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522147.811374; Mon, 17 Apr 2023 13:54:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poPJ1-0004Wn-R6; Mon, 17 Apr 2023 13:54:07 +0000
Received: by outflank-mailman (input) for mailman id 522147;
 Mon, 17 Apr 2023 13:54:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tMb/=AI=citrix.com=prvs=464dae365=sergey.dyasli@srs-se1.protection.inumbo.net>)
 id 1poPJ0-00047e-FX
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 13:54:06 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 507e64cb-dd27-11ed-8611-37d641c3527e;
 Mon, 17 Apr 2023 15:54:04 +0200 (CEST)
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
X-Inumbo-ID: 507e64cb-dd27-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681739644;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=TNVm1fLgaF4ksJwYK+L9Xd3vsJAQXLNOU+yZsnmqhF8=;
  b=TStnw5k8DyPG5+EoF3ebiAgB6qLAMOTYUo2jtcEVWclaWM9x8hIeJKlz
   EW5jSmZ20YqvD/gZqhPfQ16EXU0E1l8+i+AM62egBE3ixPvm903By3+Zw
   j+7jkAteZPgKmgDBKnPH02DlydqmK7Jkx78OFkkTfmDs6m96a7EY3kE4U
   E=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 106220668
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:FCIWI6PYGGENOVPvrR2Sl8FynXyQoLVcMsEvi/4bfWQNrUpxgjNUz
 GQeWmmCM6veNDD1coskYN6/8hgPvZbUyYRlSAto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvPrRC9H5qyo42tE5wNmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0r1wOEtvz
 N0qES5XSD2qhOmM37GET9A506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLolkf2ni2i5fyxRs1aUjaE2/3LS3Ep6172F3N/9I4TUH58NwBjIz
 o7A11b4GzQ2MM618wiI8kKwod72ty6hQatHQdVU8dY12QbOlwT/EiY+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFaGtBMBX9tbE8Uh9RqAjKHT5m6xGWwsXjNHLts8u6ceRzMw0
 USSt8j0HjEpu7qQIVqf67OVoDWaKSUTa2gYakcsVhAZ6tPupIUyiBPnTdt5FqOxyNrvFlnNL
 yui9XZkwe9J1IhSivv9pAqc696xmnTXZlUy3y/2Z0OX1x0jQqOMZIeS9lvk6M8Vee51UWK9U
 Gg4d9m2tb5eVM3WxXHcHI3hD5nyua/bbWS0bUpHWsB4qm/zoyPLkZV4umkWGat/DioTldYFi
 mf3sBgZ2pJcNWDCgURfM9PoUJRCIUQN+L3YuhHogjlmOMIZmPevpn0GWKJp9zmFfLIQua8+I
 4yHVs2nEGwXD69qpBLvGbdEj+Bznn1jmjuPLXwe8/hA+ePHDEN5tJ9faAfeBgzHxPjsTPrpH
 yZ3aJLRlkQ3vBzWaSjL648DRW03wYwALcmu8aR/L7fTSjeK7Ul9U5c9N5t9Id0690mU/8+Ul
 kyAtrhwkgKn3yKccVXUMxiOqtrHBP5CkJ7yBgR0VX7A5pTpSdbHAHs3H3fvQYQayQ==
IronPort-HdrOrdr: A9a23:vtywhq4Rd9P0TF1OxwPXwMjXdLJyesId70hD6qhwISY7TiX4rb
 HJoB11737JYVoqNU3I3OrwWpVoIkmskqKdg7NwAV7KZmCP0wGVxcNZnO7fKlXbaknDH4Vmu5
 uIHZITNDSJNykYsfrH
X-Talos-CUID: 9a23:uBjjVGHGGAwWRGTxqmI883c+O/kEQETDllH9CkyzM3lqd7isHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AvnI9FAystrKaxT5FqAv2ErW2aOKaqJavEWUhlYc?=
 =?us-ascii?q?sgfuJNRxsHAakpjntW6Zyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.99,204,1677560400"; 
   d="scan'208";a="106220668"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Sergey Dyasli <sergey.dyasli@citrix.com>
Subject: [PATCH v5 2/3] x86/platform: introduce XENPF_get_ucode_revision
Date: Mon, 17 Apr 2023 14:53:34 +0100
Message-ID: <20230417135335.17176-3-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230417135335.17176-1-sergey.dyasli@citrix.com>
References: <20230417135335.17176-1-sergey.dyasli@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Currently it's impossible to get CPU's microcode revision from Xen after
late loading without looking into Xen logs which is not always convenient.

Add a new platform op in order to get the required data from Xen and
provide a wrapper for libxenctrl.

Signed-off-by: Sergey Dyasli <sergey.dyasli@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
v4 --> v5:
- Added Reviewed-by

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


