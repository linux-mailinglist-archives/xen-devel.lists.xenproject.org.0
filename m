Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E019D44647F
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 14:56:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222347.384514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mizhe-0006tl-Vp; Fri, 05 Nov 2021 13:56:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222347.384514; Fri, 05 Nov 2021 13:56:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mizhe-0006qr-Pj; Fri, 05 Nov 2021 13:56:22 +0000
Received: by outflank-mailman (input) for mailman id 222347;
 Fri, 05 Nov 2021 13:56:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VR3F=PY=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mizhc-00063k-O5
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 13:56:20 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26a6ab5f-3e40-11ec-a9d2-d9f7a1cc8784;
 Fri, 05 Nov 2021 14:56:19 +0100 (CET)
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
X-Inumbo-ID: 26a6ab5f-3e40-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636120579;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=fOKvCwOi4OlG1f6O+oqdtMDNMG9VOfKqmOXJmlq8GK4=;
  b=RdNGBYg/Uxn/xUI1kKHMAqLuyCJfc7Kt0aEurCzKn5A13LQLVFwGcJE+
   lcBnpzmTRZRrgIerDipr+ijYhfLHapUPNgYGvwoqG766lM5lTwIIH01SY
   +D/y81nY7m7/+v9FmlMfAWqmJKebtkIuaMqRdjsaCBEmBbv6H8tbGtn6V
   c=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: YSPAK9CXf0pQ/VfHSun52glhaduhRU3vBrd+kO3mgogNToRmkvqd36E6XoanmbaT5Du9cTzWdg
 5fbwYh+mBbBY3cvxs7UBxLNBA5jV/GjTmfyzcRXTTTlnGaYugRxy9bS1TI6cEnAXRUeaqpBoSp
 AKQnW1djsGgDLpL0Fi3LmR0NNGPME4DqXd+regm+0sSaVS5GMsYFFgJ8Z2E+O32RZu/L8bxr4X
 B8/zSLPjQVlcF1GHc5jUzvtsCm3nugZmy9J5SCnutrz2wx8+tYcC704GGjLxJLYO7bH8tl3CJt
 UMmaxbWLKoCNdoBpsmOpMm4o
X-SBRS: 5.1
X-MesageID: 57137740
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:J/hufaK7Sa9f+dImFE+RCZIlxSXFcZb7ZxGr2PjKsXjdYENSgmZWy
 WdLWTqHOaneNDamKosgat+w9E8FsJDdzIdlQAZlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZUideSc+EH140Es7xrZj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB24pfct4
 tcWuqbodl55O4/LqaM5eSBHRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFFgMg5IdatF4QYonx6lhnSDOo8QICFSKLPjTNd9Gpv35sRQqqGD
 yYfQQtyLx/RRDxXA1hUUs4Yo9WDnWH+VAQN/Tp5ooJoujOOnWSdyoPFPMLOf92WRe1chkuCu
 n/d5GP9Hw0bM9qEjzGC9xqEiuDDkCzhUaoOBba48bhsm1TVyWsNYDUGWF3+rfSnh0qWX9NEN
 1dS6icotbI19kGgUp/6RRLQnZKflkdCAZwKSbR8sVzTjPqPi+qEOoQaZg97T4AMtpQ5f2QVj
 w+MvdTYQhhFiaLAHBpx6YyohT+1PCEUK0oLaikFURYJ7rHfnW0jsv7cZo09SfDo17UZDRm1m
 mnX93Zm293/mOZSj/3jlW0rlQ5AsXQgouQdwgzMFlyo4QpiDGJOT9z5sAOLhRqswWvwc7Vgg
 JTms5TBhAztJcvU/MBofAnrNOv0jxpiGGeN6WOD57F7q1yQF4eLJOi8Gg1WKkZzKdojcjT0e
 kLVsg45zMYNZyXyMPYsPtzuU5VCIU3c+TLNDK28gj1mOMkZSeN61Hs2OR74M57FyRBEfV4D1
 WezLp/3UCdy5VVPxzuqXeYNuYLHNQhlrV4/savTlkz9uZLHPSb9Ye5cbDOmM7BohIvZ8V692
 4sOaKO3J+B3DbSWjt//qtVIczjn7BETWPjLliCgXrXYflU6QTh5YxITqJt4E7FYc21uvr+g1
 hmAtoVwkzITXFXLdleHbG5NcrTqUcotpH43J3V0b12px2IiccCk66JGL8k7erwu9epCy/9oT
 qZaJ5XcU6oXEjmXqS4AaZTdrZB5cEj5jwy5ICf4MiM0eIRtRlKV94a8LBfv7iQHEgG+qdA6/
 ++7zgreTJdaH1ZiAc/aZeiB1VS0uXRByut+U1GReotYeVn28ZgsICv016dlL8YJIBTF5z2by
 wfJXktI+biT+9c4qYCbi7qFooGlF/pFMnBbR2SLv6yrMST6/3a4xdMSWui/Yj2ABnj//7+vZ
 LsJwqikYuEHhltDr6F1D61vkfAl/9LqqrJXklZkEXHMYwj5A79sOCDbj8xGt6kLzb5FowqmH
 EmI/4ACa7mOPcrkFn8XJRYkMbvfha1FxGGK4KRnOlj+6Q924KGDABdbMBS7gSBAKKd4bdE+y
 uA7tc9KswGyh3LG6DpdYvy4I4hUEkE9bg==
IronPort-HdrOrdr: A9a23:h0mtf64XDzfxV4cfFAPXwMzXdLJyesId70hD6qhwISY1TiX4rb
 HXoB11726WtN98Yh4dcJW7Sc29qBDnhOdICOsqTNWftWDd0QPCRuwP0WKh+UyGJ8SXzJ866U
 4KSchD4bPLY2SS9fyKhTWFLw==
X-IronPort-AV: E=Sophos;i="5.87,211,1631592000"; 
   d="scan'208";a="57137740"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>, Daniel Smith <dpsmith@apertussolutions.com>
Subject: [PATCH 4/5] xen/xsm: Improve fallback handling in xsm_fixup_ops()
Date: Fri, 5 Nov 2021 13:55:54 +0000
Message-ID: <20211105135555.24261-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211105135555.24261-1-andrew.cooper3@citrix.com>
References: <20211105135555.24261-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

The current xsm_fixup_ops() is just shy of a full page when compiled, and very
fragile to NULL function pointer errors.

Address both of these issues with a minor piece of structure (ab)use.
Introduce dummy_ops, and fixup the provided xsm_ops pointer by treating both
as an array of unsigned longs.

The compiled size improvement speaks for itself:

  $ ../scripts/bloat-o-meter xen-syms-before xen-syms-after
  add/remove: 1/0 grow/shrink: 0/1 up/down: 712/-3897 (-3185)
  Function                                     old     new   delta
  dummy_ops                                      -     712    +712
  xsm_fixup_ops                               3987      90   -3897

and there is an additional safety check that will make it obvious during
development if there is an issue with the fallback handling.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Daniel De Graaf <dgdegra@tycho.nsa.gov>
CC: Daniel Smith <dpsmith@apertussolutions.com>
---
 xen/include/xsm/xsm.h |   9 ++
 xen/xsm/dummy.c       | 254 +++++++++++++++++++++++++++-----------------------
 2 files changed, 147 insertions(+), 116 deletions(-)

diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index c5bd4213490a..5aa4dd588d17 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -42,6 +42,15 @@ enum xsm_default {
 };
 typedef enum xsm_default xsm_default_t;
 
+/*
+ * !!! WARNING !!!
+ *
+ * For simplicity, xsm_fixup_ops() expects that this structure is made
+ * exclusively of function pointers to non-init functions.  Think carefully
+ * before deviating from the pattern.
+ *
+ * !!! WARNING !!!
+ */
 struct xsm_ops {
     void (*security_domaininfo)(struct domain *d,
                                 struct xen_domctl_getdomaininfo *info);
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index 041f59fdf4ad..c111fa05968d 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -13,145 +13,167 @@
 #define XSM_NO_WRAPPERS
 #include <xsm/dummy.h>
 
-#define set_to_dummy_if_null(ops, function)                            \
-    do {                                                               \
-        if ( !ops->function )                                          \
-            ops->function = xsm_##function;                            \
-    } while (0)
-
-void __init xsm_fixup_ops (struct xsm_ops *ops)
-{
-    set_to_dummy_if_null(ops, security_domaininfo);
-    set_to_dummy_if_null(ops, domain_create);
-    set_to_dummy_if_null(ops, getdomaininfo);
-    set_to_dummy_if_null(ops, domctl_scheduler_op);
-    set_to_dummy_if_null(ops, sysctl_scheduler_op);
-    set_to_dummy_if_null(ops, set_target);
-    set_to_dummy_if_null(ops, domctl);
-    set_to_dummy_if_null(ops, sysctl);
-    set_to_dummy_if_null(ops, readconsole);
-
-    set_to_dummy_if_null(ops, evtchn_unbound);
-    set_to_dummy_if_null(ops, evtchn_interdomain);
-    set_to_dummy_if_null(ops, evtchn_close_post);
-    set_to_dummy_if_null(ops, evtchn_send);
-    set_to_dummy_if_null(ops, evtchn_status);
-    set_to_dummy_if_null(ops, evtchn_reset);
-
-    set_to_dummy_if_null(ops, grant_mapref);
-    set_to_dummy_if_null(ops, grant_unmapref);
-    set_to_dummy_if_null(ops, grant_setup);
-    set_to_dummy_if_null(ops, grant_transfer);
-    set_to_dummy_if_null(ops, grant_copy);
-    set_to_dummy_if_null(ops, grant_query_size);
-
-    set_to_dummy_if_null(ops, alloc_security_domain);
-    set_to_dummy_if_null(ops, free_security_domain);
-    set_to_dummy_if_null(ops, alloc_security_evtchns);
-    set_to_dummy_if_null(ops, free_security_evtchns);
-    set_to_dummy_if_null(ops, show_security_evtchn);
-    set_to_dummy_if_null(ops, init_hardware_domain);
-
-    set_to_dummy_if_null(ops, get_pod_target);
-    set_to_dummy_if_null(ops, set_pod_target);
-
-    set_to_dummy_if_null(ops, memory_exchange);
-    set_to_dummy_if_null(ops, memory_adjust_reservation);
-    set_to_dummy_if_null(ops, memory_stat_reservation);
-    set_to_dummy_if_null(ops, memory_pin_page);
-    set_to_dummy_if_null(ops, claim_pages);
-
-    set_to_dummy_if_null(ops, console_io);
-
-    set_to_dummy_if_null(ops, profile);
-
-    set_to_dummy_if_null(ops, kexec);
-    set_to_dummy_if_null(ops, schedop_shutdown);
-
-    set_to_dummy_if_null(ops, show_irq_sid);
-    set_to_dummy_if_null(ops, map_domain_pirq);
-    set_to_dummy_if_null(ops, map_domain_irq);
-    set_to_dummy_if_null(ops, unmap_domain_pirq);
-    set_to_dummy_if_null(ops, unmap_domain_irq);
-    set_to_dummy_if_null(ops, bind_pt_irq);
-    set_to_dummy_if_null(ops, unbind_pt_irq);
-    set_to_dummy_if_null(ops, irq_permission);
-    set_to_dummy_if_null(ops, iomem_permission);
-    set_to_dummy_if_null(ops, iomem_mapping);
-    set_to_dummy_if_null(ops, pci_config_permission);
-    set_to_dummy_if_null(ops, get_vnumainfo);
+static const struct xsm_ops __initconstrel dummy_ops = {
+    .security_domaininfo           = xsm_security_domaininfo,
+    .domain_create                 = xsm_domain_create,
+    .getdomaininfo                 = xsm_getdomaininfo,
+    .domctl_scheduler_op           = xsm_domctl_scheduler_op,
+    .sysctl_scheduler_op           = xsm_sysctl_scheduler_op,
+    .set_target                    = xsm_set_target,
+    .domctl                        = xsm_domctl,
+    .sysctl                        = xsm_sysctl,
+    .readconsole                   = xsm_readconsole,
+
+    .evtchn_unbound                = xsm_evtchn_unbound,
+    .evtchn_interdomain            = xsm_evtchn_interdomain,
+    .evtchn_close_post             = xsm_evtchn_close_post,
+    .evtchn_send                   = xsm_evtchn_send,
+    .evtchn_status                 = xsm_evtchn_status,
+    .evtchn_reset                  = xsm_evtchn_reset,
+
+    .grant_mapref                  = xsm_grant_mapref,
+    .grant_unmapref                = xsm_grant_unmapref,
+    .grant_setup                   = xsm_grant_setup,
+    .grant_transfer                = xsm_grant_transfer,
+    .grant_copy                    = xsm_grant_copy,
+    .grant_query_size              = xsm_grant_query_size,
+
+    .alloc_security_domain         = xsm_alloc_security_domain,
+    .free_security_domain          = xsm_free_security_domain,
+    .alloc_security_evtchns        = xsm_alloc_security_evtchns,
+    .free_security_evtchns         = xsm_free_security_evtchns,
+    .show_security_evtchn          = xsm_show_security_evtchn,
+    .init_hardware_domain          = xsm_init_hardware_domain,
+
+    .get_pod_target                = xsm_get_pod_target,
+    .set_pod_target                = xsm_set_pod_target,
+
+    .memory_exchange               = xsm_memory_exchange,
+    .memory_adjust_reservation     = xsm_memory_adjust_reservation,
+    .memory_stat_reservation       = xsm_memory_stat_reservation,
+    .memory_pin_page               = xsm_memory_pin_page,
+    .claim_pages                   = xsm_claim_pages,
+
+    .console_io                    = xsm_console_io,
+
+    .profile                       = xsm_profile,
+
+    .kexec                         = xsm_kexec,
+    .schedop_shutdown              = xsm_schedop_shutdown,
+
+    .show_irq_sid                  = xsm_show_irq_sid,
+    .map_domain_pirq               = xsm_map_domain_pirq,
+    .map_domain_irq                = xsm_map_domain_irq,
+    .unmap_domain_pirq             = xsm_unmap_domain_pirq,
+    .unmap_domain_irq              = xsm_unmap_domain_irq,
+    .bind_pt_irq                   = xsm_bind_pt_irq,
+    .unbind_pt_irq                 = xsm_unbind_pt_irq,
+    .irq_permission                = xsm_irq_permission,
+    .iomem_permission              = xsm_iomem_permission,
+    .iomem_mapping                 = xsm_iomem_mapping,
+    .pci_config_permission         = xsm_pci_config_permission,
+    .get_vnumainfo                 = xsm_get_vnumainfo,
 
 #if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
-    set_to_dummy_if_null(ops, get_device_group);
-    set_to_dummy_if_null(ops, assign_device);
-    set_to_dummy_if_null(ops, deassign_device);
+    .get_device_group              = xsm_get_device_group,
+    .assign_device                 = xsm_assign_device,
+    .deassign_device               = xsm_deassign_device,
 #endif
 
 #if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE)
-    set_to_dummy_if_null(ops, assign_dtdevice);
-    set_to_dummy_if_null(ops, deassign_dtdevice);
+    .assign_dtdevice               = xsm_assign_dtdevice,
+    .deassign_dtdevice             = xsm_deassign_dtdevice,
 #endif
 
-    set_to_dummy_if_null(ops, resource_plug_core);
-    set_to_dummy_if_null(ops, resource_unplug_core);
-    set_to_dummy_if_null(ops, resource_plug_pci);
-    set_to_dummy_if_null(ops, resource_unplug_pci);
-    set_to_dummy_if_null(ops, resource_setup_pci);
-    set_to_dummy_if_null(ops, resource_setup_gsi);
-    set_to_dummy_if_null(ops, resource_setup_misc);
-
-    set_to_dummy_if_null(ops, page_offline);
-    set_to_dummy_if_null(ops, hypfs_op);
-    set_to_dummy_if_null(ops, hvm_param);
-    set_to_dummy_if_null(ops, hvm_param_altp2mhvm);
-    set_to_dummy_if_null(ops, hvm_altp2mhvm_op);
-
-    set_to_dummy_if_null(ops, do_xsm_op);
+    .resource_plug_core            = xsm_resource_plug_core,
+    .resource_unplug_core          = xsm_resource_unplug_core,
+    .resource_plug_pci             = xsm_resource_plug_pci,
+    .resource_unplug_pci           = xsm_resource_unplug_pci,
+    .resource_setup_pci            = xsm_resource_setup_pci,
+    .resource_setup_gsi            = xsm_resource_setup_gsi,
+    .resource_setup_misc           = xsm_resource_setup_misc,
+
+    .page_offline                  = xsm_page_offline,
+    .hypfs_op                      = xsm_hypfs_op,
+    .hvm_param                     = xsm_hvm_param,
+    .hvm_param_altp2mhvm           = xsm_hvm_param_altp2mhvm,
+    .hvm_altp2mhvm_op              = xsm_hvm_altp2mhvm_op,
+
+    .do_xsm_op                     = xsm_do_xsm_op,
 #ifdef CONFIG_COMPAT
-    set_to_dummy_if_null(ops, do_compat_op);
+    .do_compat_op                  = xsm_do_compat_op,
 #endif
 
-    set_to_dummy_if_null(ops, add_to_physmap);
-    set_to_dummy_if_null(ops, remove_from_physmap);
-    set_to_dummy_if_null(ops, map_gmfn_foreign);
+    .add_to_physmap                = xsm_add_to_physmap,
+    .remove_from_physmap           = xsm_remove_from_physmap,
+    .map_gmfn_foreign              = xsm_map_gmfn_foreign,
 
-    set_to_dummy_if_null(ops, vm_event_control);
+    .vm_event_control              = xsm_vm_event_control,
 
 #ifdef CONFIG_MEM_ACCESS
-    set_to_dummy_if_null(ops, mem_access);
+    .mem_access                    = xsm_mem_access,
 #endif
 
 #ifdef CONFIG_MEM_PAGING
-    set_to_dummy_if_null(ops, mem_paging);
+    .mem_paging                    = xsm_mem_paging,
 #endif
 
 #ifdef CONFIG_MEM_SHARING
-    set_to_dummy_if_null(ops, mem_sharing);
+    .mem_sharing                   = xsm_mem_sharing,
 #endif
 
-    set_to_dummy_if_null(ops, platform_op);
+    .platform_op                   = xsm_platform_op,
 #ifdef CONFIG_X86
-    set_to_dummy_if_null(ops, do_mca);
-    set_to_dummy_if_null(ops, shadow_control);
-    set_to_dummy_if_null(ops, mem_sharing_op);
-    set_to_dummy_if_null(ops, apic);
-    set_to_dummy_if_null(ops, machine_memory_map);
-    set_to_dummy_if_null(ops, domain_memory_map);
-    set_to_dummy_if_null(ops, mmu_update);
-    set_to_dummy_if_null(ops, mmuext_op);
-    set_to_dummy_if_null(ops, update_va_mapping);
-    set_to_dummy_if_null(ops, priv_mapping);
-    set_to_dummy_if_null(ops, ioport_permission);
-    set_to_dummy_if_null(ops, ioport_mapping);
-    set_to_dummy_if_null(ops, pmu_op);
+    .do_mca                        = xsm_do_mca,
+    .shadow_control                = xsm_shadow_control,
+    .mem_sharing_op                = xsm_mem_sharing_op,
+    .apic                          = xsm_apic,
+    .machine_memory_map            = xsm_machine_memory_map,
+    .domain_memory_map             = xsm_domain_memory_map,
+    .mmu_update                    = xsm_mmu_update,
+    .mmuext_op                     = xsm_mmuext_op,
+    .update_va_mapping             = xsm_update_va_mapping,
+    .priv_mapping                  = xsm_priv_mapping,
+    .ioport_permission             = xsm_ioport_permission,
+    .ioport_mapping                = xsm_ioport_mapping,
+    .pmu_op                        = xsm_pmu_op,
 #endif
-    set_to_dummy_if_null(ops, dm_op);
-    set_to_dummy_if_null(ops, xen_version);
-    set_to_dummy_if_null(ops, domain_resource_map);
+    .dm_op                         = xsm_dm_op,
+    .xen_version                   = xsm_xen_version,
+    .domain_resource_map           = xsm_domain_resource_map,
 #ifdef CONFIG_ARGO
-    set_to_dummy_if_null(ops, argo_enable);
-    set_to_dummy_if_null(ops, argo_register_single_source);
-    set_to_dummy_if_null(ops, argo_register_any_source);
-    set_to_dummy_if_null(ops, argo_send);
+    .argo_enable                   = xsm_argo_enable,
+    .argo_register_single_source   = xsm_argo_register_single_source,
+    .argo_register_any_source      = xsm_argo_register_any_source,
+    .argo_send                     = xsm_argo_send,
 #endif
+};
+
+void __init xsm_fixup_ops(struct xsm_ops *ops)
+{
+    /*
+     * We make some simplifying assumptions about struct xsm_ops; that it is
+     * made exclusively of function pointers to non-init text.
+     *
+     * This allows us to walk over struct xsm_ops as if it were an array of
+     * unsigned longs.
+     */
+    unsigned long *dst = _p(ops);
+    unsigned long *src = _p(&dummy_ops);
+
+    for ( ; dst < (unsigned long *)(ops + 1); src++, dst++ )
+    {
+        /*
+         * If you encounter this BUG(), then you've most likely added a new
+         * XSM hook but failed to provide the default implementation in
+         * dummy_ops.
+         *
+         * If not, then perhaps a function pointer to an init function, or
+         * something which isn't a function pointer at all.
+         */
+        BUG_ON(!is_kernel_text(*src));
+
+        if ( !*dst )
+            *dst = *src;
+    }
 }
-- 
2.11.0


