Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 885D66C30BC
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 12:48:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512363.792375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peaTB-0001jX-BF; Tue, 21 Mar 2023 11:48:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512363.792375; Tue, 21 Mar 2023 11:48:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peaTB-0001hI-7n; Tue, 21 Mar 2023 11:48:01 +0000
Received: by outflank-mailman (input) for mailman id 512363;
 Tue, 21 Mar 2023 11:47:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h9ZV=7N=citrix.com=prvs=437435c1e=sergey.dyasli@srs-se1.protection.inumbo.net>)
 id 1peaT8-0001D8-Ud
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 11:47:59 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 381d7b49-c7de-11ed-87f5-c1b5be75604c;
 Tue, 21 Mar 2023 12:47:57 +0100 (CET)
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
X-Inumbo-ID: 381d7b49-c7de-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679399277;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=fGE0T9aXdCXHzzRWPZzgGMfJeXlC0Uh4tsC4r6B01fo=;
  b=Me3RD6DpJ8hqAfGt4HfYVG7VhQBuAxMG3lPN+TE2irto9wV0yy4ITVv4
   XrhKXC3GfWY9EMGCfLNrjx6Tc3nLZ0TC7FPreBQUunYiJU/yX8Jy1/dyE
   AbW7qsCtoIoepkLLdI5ecjYJkLt3XS1bCaRaQxROZYJ7qvQVhu9xDs0sU
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 101693125
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:wKH6oq4df3XJpcQbzXry6QxRtAzHchMFZxGqfqrLsTDasY5as4F+v
 jQZDGjTbq2LZmr3Kdp/bojioU0C65/WyNZhSQNsrSkxHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7JwehBtC5gZlPasR5QeH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m8
 PYRFxtKPh65nrys0J2pGs5B3u0CFZy+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJUQVYT/7C7pn9AusrmLyaTJVuRSZtKMs52n7xw1tyrn9dtHSf7RmQO0Mxh/G9
 zmfpTmR7hcyEIbG9mO88WCX1sDspi/RWJ5VFI2H36s/6LGU7jNKU0BHPbehmtG7hVS5QMl3M
 FEP92wlqq1a3E62StjwWTWorXjCuQQTM/JLCPEz4gyJzqvS4i6aC3ICQzoHb8Yp3Oc0TzE30
 l6Cn/vyGCdi9raSTBq15rqS6D+/JyURBWsDfjMfCxsI5cH5p4M+hQ6JScxseIaqivXlFDe2x
 CqFxBXSnJ1K05RNjf/iuwma3XT1/MOhohMJChv/W2is0Sg+NICfftKy+XfJvdFtdK+4dwzU1
 JQboPRy/NziHLnUynPcG7tQTOjyjxqWGGaC2AAyRvHN4xzooif+Jt4IvVmSMW8zaq45lSnVj
 Fg/UO+7zLtaJzOUYKB+eOpd4Ox6nPG7RbwJuh05B+eig6SdlyfdpkmCnWbKgwjQfLEEyMnTw
 6uzf8e2Fmo9Aq961jewTOp1+eZ1mXFlnjyLG8ujn07PPV+iiJi9E+9tDbdzRrphsPPsTPrpH
 yZ3aJLRlkQ3vBzWaSjL648DRW03wYwALcmu8aR/L7fbSiI/QTFJNhMk6e54E2CTt/8OzbmgE
 7DUchIw9WcTclWedFjRMCs/OO2HsFQWhStTABHA9G2AgxALCbtDJo9GH3frVdHLLNBe8MM=
IronPort-HdrOrdr: A9a23:+ZASzK4Wu5SatQ3fgAPXwOrXdLJyesId70hD6qkRc20xTiX8ra
 rCoB1173PJYVoqN03I4OrwX5VoIkmsl6Kdg7NwAV7KZmCPhILPFu9fBODZsl7d8kPFl9K14p
 0QF5SWWOeaMbGjt7eB3OBjKadZ/DBbytHPuQ4D9QYXcei1UdAc0+8XYjzra3FLeA==
X-IronPort-AV: E=Sophos;i="5.98,278,1673931600"; 
   d="scan'208";a="101693125"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Sergey Dyasli <sergey.dyasli@citrix.com>
Subject: [PATCH v3 2/3] x86/platform: introduce XENPF_get_ucode_version
Date: Tue, 21 Mar 2023 11:47:44 +0000
Message-ID: <20230321114745.11044-3-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230321114745.11044-1-sergey.dyasli@citrix.com>
References: <20230321114745.11044-1-sergey.dyasli@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Currently it's impossible to get CPU's microcode revision after late
loading without looking into Xen logs which is not always convenient.

Add a new platform op in order to get the required data from Xen and
provide a wrapper for libxenctrl.

Signed-off-by: Sergey Dyasli <sergey.dyasli@citrix.com>
---
 tools/include/xenctrl.h                  |  2 ++
 tools/libs/ctrl/xc_misc.c                | 21 +++++++++++++++++
 xen/arch/x86/platform_hypercall.c        | 30 ++++++++++++++++++++++++
 xen/arch/x86/x86_64/platform_hypercall.c |  4 ++++
 xen/include/public/platform.h            | 12 ++++++++++
 xen/include/xlat.lst                     |  1 +
 6 files changed, 70 insertions(+)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 8aa747dc2e..d3ef7a48a5 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1187,6 +1187,8 @@ int xc_cputopoinfo(xc_interface *xch, unsigned *max_cpus,
                    xc_cputopo_t *cputopo);
 int xc_microcode_update(xc_interface *xch, const void *buf, size_t len);
 int xc_get_cpu_version(xc_interface *xch, struct xenpf_pcpu_version *cpu_ver);
+int xc_get_ucode_version(xc_interface *xch,
+                         struct xenpf_ucode_version *ucode_ver);
 int xc_numainfo(xc_interface *xch, unsigned *max_nodes,
                 xc_meminfo_t *meminfo, uint32_t *distance);
 int xc_pcitopoinfo(xc_interface *xch, unsigned num_devs,
diff --git a/tools/libs/ctrl/xc_misc.c b/tools/libs/ctrl/xc_misc.c
index f2f6e4348e..b93477d189 100644
--- a/tools/libs/ctrl/xc_misc.c
+++ b/tools/libs/ctrl/xc_misc.c
@@ -246,6 +246,27 @@ int xc_get_cpu_version(xc_interface *xch, struct xenpf_pcpu_version *cpu_ver)
     return 0;
 }
 
+int xc_get_ucode_version(xc_interface *xch,
+                         struct xenpf_ucode_version *ucode_ver)
+{
+    int ret;
+    DECLARE_PLATFORM_OP;
+
+    if ( !xch || !ucode_ver )
+        return -1;
+
+    platform_op.cmd = XENPF_get_ucode_version;
+    platform_op.u.ucode_version.xen_cpuid = ucode_ver->xen_cpuid;
+
+    ret = do_platform_op(xch, &platform_op);
+    if ( ret != 0 )
+        return ret;
+
+    *ucode_ver = platform_op.u.ucode_version;
+
+    return 0;
+}
+
 int xc_cputopoinfo(xc_interface *xch, unsigned *max_cpus,
                    xc_cputopo_t *cputopo)
 {
diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
index a2d9526355..d0818fea47 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -640,6 +640,36 @@ ret_t do_platform_op(
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
+            ret = -ENOENT;
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
diff --git a/xen/arch/x86/x86_64/platform_hypercall.c b/xen/arch/x86/x86_64/platform_hypercall.c
index 5bf6b958d2..b876fd0c4a 100644
--- a/xen/arch/x86/x86_64/platform_hypercall.c
+++ b/xen/arch/x86/x86_64/platform_hypercall.c
@@ -28,6 +28,10 @@ CHECK_pf_pcpuinfo;
 CHECK_pf_pcpu_version;
 #undef xen_pf_pcpu_version
 
+#define xen_pf_ucode_version xenpf_ucode_version
+CHECK_pf_ucode_version;
+#undef xen_pf_pucode_version
+
 #define xen_pf_enter_acpi_sleep xenpf_enter_acpi_sleep
 CHECK_pf_enter_acpi_sleep;
 #undef xen_pf_enter_acpi_sleep
diff --git a/xen/include/public/platform.h b/xen/include/public/platform.h
index 60caa5ce7e..232df79d5f 100644
--- a/xen/include/public/platform.h
+++ b/xen/include/public/platform.h
@@ -614,6 +614,17 @@ DEFINE_XEN_GUEST_HANDLE(xenpf_symdata_t);
 typedef struct dom0_vga_console_info xenpf_dom0_console_t;
 DEFINE_XEN_GUEST_HANDLE(xenpf_dom0_console_t);
 
+#define XENPF_get_ucode_version 65
+struct xenpf_ucode_version {
+    uint32_t xen_cpuid;       /* IN:  CPU number to get the revision from.  */
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
@@ -645,6 +656,7 @@ struct xen_platform_op {
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


