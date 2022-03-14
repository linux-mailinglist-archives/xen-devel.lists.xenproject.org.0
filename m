Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A014D79B6
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 04:42:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.289863.491504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTbal-00081q-CZ; Mon, 14 Mar 2022 03:41:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 289863.491504; Mon, 14 Mar 2022 03:41:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTbal-0007zO-9W; Mon, 14 Mar 2022 03:41:55 +0000
Received: by outflank-mailman (input) for mailman id 289863;
 Mon, 14 Mar 2022 03:41:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ga0j=TZ=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1nTbai-0007zG-92
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 03:41:53 +0000
Received: from sonic306-21.consmr.mail.gq1.yahoo.com
 (sonic306-21.consmr.mail.gq1.yahoo.com [98.137.68.84])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac60146a-a348-11ec-853b-5f4723681683;
 Mon, 14 Mar 2022 04:41:48 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic306.consmr.mail.gq1.yahoo.com with HTTP; Mon, 14 Mar 2022 03:41:46 +0000
Received: by kubenode510.mail-prod1.omega.ne1.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID 2a2ff40647b282ca087dda5d8bac1295; 
 Mon, 14 Mar 2022 03:41:43 +0000 (UTC)
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
X-Inumbo-ID: ac60146a-a348-11ec-853b-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048; t=1647229306; bh=mLaHN5C5RzR3kqlo3PMcOlb/DmfXiYWaEjD2K3ImbGQ=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=rbyXGFXVfBxM8cJnHzl9ywnkE+x+SypMzLhofsw4KSkb+ukyqmhZN2B73HgzJHB8rkNY3IsHuhZnQd9SspTI6Ew+AlR5iOLd/Wi/XtA5Oc6mRKXCD9qXdWzzMBtb94m98blESIuz5sXD9JAiEoDalEfclURxPmqevuGZ0J7WnA+YvYEvs8k7MG4yr+J/PgJFvzL0mpw3uIWeDnBS4QeXzimsL4LkmuWQNfFDhq4SOOe7mUrCHNlCXxl6n2tZDzNuV4t5HyMM6zamta6WXFNhBJipBtDa0XVwXE57ocsbf0m5KOehEy5wMB9aVpFUwjifDhCPRIGezrPtnCb2p8kvXw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1647229306; bh=pJnuEFWPougLFIC66Rngu3qbknm8HFA+APqxALvqu8C=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=Rkn5lG9gQbnEczRksMlUIc7lnuChWaqOZYGuy6KFOoSTCKqhCPhL2rrmCYVRoS56uxkDXe4YiZ6S0kw1GQcYISpCSiWcYEcAUOlk1iuf9SUQlT6Lr/sO4lUDVoUgI5evGbfJ17Rof+fdlcBYN6h2sRCGaAMvkOMsOuKa+JOXR+Tpb4aOhAbxc6t9r0yvRVBW/PlZuKCNaqIKXa1I816fo1O680ke9Paerbgo2GY0+2PCDc3yZ3V6cqQXWVQv+KZSWerPb+EHEK8f0Na5dnt1h9lKpSmrW659zknTZmz6G+VuTKcHFc2XER+ebkGlP5Nl1Mr19W7SwFUDCMemDoEGLw==
X-YMail-OSG: uZr2XLgVM1kb0CkHNdEMW7nHD0RMHc71na8YKjUN_arnKI1vln5zMgBVdZQrgWf
 D6MJx8zdGvap3kv0lrs_WTJprjxX9DN917QZ5xjC2YV8dqFoJ11Tn1WwGx.ictXZ55KlYotOFcbK
 UwYj0KcDFSM0Pc.coPuxjqziCKWZhdnAdXKmVealc50kwDxMd8fSq5U1Eg34lWnTYlQc.EjgHpMt
 hYmBvMZINq3es1KtAbETSOCyy2_kliTKkPThs.cbGT2GGPGEZbUnTabDXgtoXl8587e6FsRkQIFB
 QST8QyP6UjaEtOlSPwJ.Vl.XSK2zTM_Uo43euk8T43VhOYgQMTLKvxp87MSQrfaHiTK_PYId06QD
 nGWnRYC2DstcZKzBZKfKI5FmXHOkRUTMvkRvFrp2OR2MClb5xmbviyLMYODkZOrdTY3CdZBciiGl
 ja9G2Kq7wUJ67G1.5Nn.Uu0PTLHcsMFqkMl7GLuq3e6h1MUXc3XNscJ_LVTwMO0mTq6YAI316iCx
 Xwm5MayommIEnBVDqNMSrmSABP03C4E17fywAvbCEDt67R_R2X20sbr8tBcpeI.4Hlp232lA7QO4
 J144X8SYXWwnMEPk21KSzqmGPlZfU2HKdjUeh.FjTWncz4YaOEMbF8l7Ry9ScT8fUooJ083kK8N0
 dmmWyu2Me_PNMEXB948fgK.RtmmoQ1VyyRG9DrcSZT227GseHGdwfVH4JgCcr1dAD0HQNd6wem9s
 TKxjUBNxp412svgLWS8Rb9sICBDAAZ5I1AmDTZZSkQMVhirdWNeiNmUckYBO0VzNaa3hJRpkVe8i
 Q7WJNaaVcZwbBKfgCt6.nOJ53tLFpCe7CYfdnDnufRhfGY_BtgFQfRxlbnwWxUfP0wLfDSldngtQ
 Nb_yYo.JzlqwKFZ6a_B6PQLGCInCXiNhSmKiWLFo5mdDaTLWiPlsCPGvIfgKiZhzgoEFPjnlJ3mo
 Npc9dLAk4ovDw2WxxzOV.gr4_VrLoUqsWQjVcbKpzjv_aQJZCZRhxQ8WYKbYxSfTu3QaRMgU3jBW
 KH877jsWq8acPlgtiHuLf.Zr9G2afiDg5vTV6i6zBlHUZl5jyaOLSdihBf8nXBYkvSlzgZjnwItQ
 K7wikQ5lN9FTA2ROSLNTnsBL8AVkpaTAvWMDJj1uJmU3GW6iERjQ.1miJpllBsaFA5QhJEqNaNeX
 tUWyAeBT5ErW0SgPlcEUN3Ug.xGIV..XkETH_IO6aW1Ua8ZqppLX_6JFJ4bm56KNrE08nX6C6gcX
 7nLMm4B8S_k31DzhKv81J5dwSWIQPYP2SsQxdN20hJfaf7pGEkQhSE6XjEW447QERChoz4rPp3od
 1VxswMtMyC1KBAl_IG1hRnJq7QzMpyqyv1wCxsXDzsoookn3.dW7yC.Aa9WKcCj_7E0Uru3eoIqe
 o24z.r.BN9Sy6E6BahE2rq4yuTOGaXSsC35bzULdZUzv2.JMR1cUJNQcTo.BXwePeXbNj1NgJKkj
 0kaGBi5IX4zEmbmACSPiEgDvH3z4hNiiPcAVodBSjiIK8AC4WQu.xJ3cYqjix3v_iwefJxHbh2_i
 9mIQLy8TMLvA.9XvRUolL0Vbm8k2wK7h3E96cSb2bJ28IlGAXSVXI5svbDNo1CZ2JqlNsI24VKIs
 JHSlY6q2jhAwJlbmYf0DQ8I1Pxpp3rLwOCE6KNqa_bYaRoQZUZYFEa0v63tIKchhVjAOlw5D5fpU
 dwrxCBe0JuXoTmP7NzC0Yf1osXKFBekWTany8cOAy1hZt3_eo8JhqQl7SmaDNQwfWDp6cKnpFe2a
 _PY70xdAz3uZtDBn6Bvg1g3LEZTqB6sSnyN9Dzrxi6JdiL3jKPIYHBu8eRd0WzipmXH12c005_m4
 MblrPieFsxwR_kiFzHy1lNY7kmT6.P3nXWVMh6pCnlJnriv2PgFFoR2cyxIpRzEp4P1zTqrgsf53
 37wehkV6R_7x_8irKFK_ibjWhYhzW4t0Di4NPMq5zP6rgmioi3QNRA9_BA.bsgl5J5cBBfZwHcxc
 i5P7tyk95dZfGpHidbiit4RVrEZSgvtdNGNJ5TNPuhwam0XB7yOWzf9kiUVvnqjxMcaLCCT6fVAg
 enbQCZeKWHGdXNKmBPNVA5AFKXzyykN8uGgo9MuQyK1g2gzfF2CDs3.iJ6V9FcaeF9jY2CfDxrtK
 vjylNG9D9dPrVMi7moXys23Ta1gzFf5lkrzR3nvsCP6GpCgIleiX0YWXstaC7vyw6mFZS0F8aQOd
 sWl0-
X-Sonic-MF: <brchuckz@aim.com>
From: Chuck Zmudzinski <brchuckz@netscape.net>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [XEN PATCH] tools/libs/light/libxl_pci.c: explicitly grant access to Intel IGD opregion
Date: Sun, 13 Mar 2022 23:41:37 -0400
Message-Id: <b62fbc602a629941c1acaad3b93d250a3eba33c0.1647222184.git.brchuckz@netscape.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <b62fbc602a629941c1acaad3b93d250a3eba33c0.1647222184.git.brchuckz.ref@netscape.net>

When gfx_passthru is enabled for the Intel IGD, hvmloader maps the IGD
opregion to the guest but libxl does not grant the guest permission to
access the mapped memory region. This results in a crash of the i915.ko
kernel module in a Linux HVM guest when it needs to access the IGD
opregion:

Oct 23 11:36:33 domU kernel: Call Trace:
Oct 23 11:36:33 domU kernel:  ? idr_alloc+0x39/0x70
Oct 23 11:36:33 domU kernel:  drm_get_last_vbltimestamp+0xaa/0xc0 [drm]
Oct 23 11:36:33 domU kernel:  drm_reset_vblank_timestamp+0x5b/0xd0 [drm]
Oct 23 11:36:33 domU kernel:  drm_crtc_vblank_on+0x7b/0x130 [drm]
Oct 23 11:36:33 domU kernel:  intel_modeset_setup_hw_state+0xbd4/0x1900 [i915]
Oct 23 11:36:33 domU kernel:  ? _cond_resched+0x16/0x40
Oct 23 11:36:33 domU kernel:  ? ww_mutex_lock+0x15/0x80
Oct 23 11:36:33 domU kernel:  intel_modeset_init_nogem+0x867/0x1d30 [i915]
Oct 23 11:36:33 domU kernel:  ? gen6_write32+0x4b/0x1c0 [i915]
Oct 23 11:36:33 domU kernel:  ? intel_irq_postinstall+0xb9/0x670 [i915]
Oct 23 11:36:33 domU kernel:  i915_driver_probe+0x5c2/0xc90 [i915]
Oct 23 11:36:33 domU kernel:  ? vga_switcheroo_client_probe_defer+0x1f/0x40
Oct 23 11:36:33 domU kernel:  ? i915_pci_probe+0x3f/0x150 [i915]
Oct 23 11:36:33 domU kernel:  local_pci_probe+0x42/0x80
Oct 23 11:36:33 domU kernel:  ? _cond_resched+0x16/0x40
Oct 23 11:36:33 domU kernel:  pci_device_probe+0xfd/0x1b0
Oct 23 11:36:33 domU kernel:  really_probe+0x222/0x480
Oct 23 11:36:33 domU kernel:  driver_probe_device+0xe1/0x150
Oct 23 11:36:33 domU kernel:  device_driver_attach+0xa1/0xb0
Oct 23 11:36:33 domU kernel:  __driver_attach+0x8a/0x150
Oct 23 11:36:33 domU kernel:  ? device_driver_attach+0xb0/0xb0
Oct 23 11:36:33 domU kernel:  ? device_driver_attach+0xb0/0xb0
Oct 23 11:36:33 domU kernel:  bus_for_each_dev+0x78/0xc0
Oct 23 11:36:33 domU kernel:  bus_add_driver+0x12b/0x1e0
Oct 23 11:36:33 domU kernel:  driver_register+0x8b/0xe0
Oct 23 11:36:33 domU kernel:  ? 0xffffffffc06b8000
Oct 23 11:36:33 domU kernel:  i915_init+0x5d/0x70 [i915]
Oct 23 11:36:33 domU kernel:  do_one_initcall+0x44/0x1d0
Oct 23 11:36:33 domU kernel:  ? do_init_module+0x23/0x260
Oct 23 11:36:33 domU kernel:  ? kmem_cache_alloc_trace+0xf5/0x200
Oct 23 11:36:33 domU kernel:  do_init_module+0x5c/0x260
Oct 23 11:36:33 domU kernel:  __do_sys_finit_module+0xb1/0x110
Oct 23 11:36:33 domU kernel:  do_syscall_64+0x33/0x80
Oct 23 11:36:33 domU kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xa9
Oct 23 11:36:33 domU kernel: RIP: 0033:0x7f188e1aa9b9

This bug first appeared with commits abfb006f1ff4 and 0561e1f01e87
during the development of Xen 4.5 in 2014 and is present in all Xen
versions 4.5 and higher.

Currently, because of another bug in Qemu upstream, this crash can
only be reproduced using the traditional Qemu device model, and of
course it can only be reproduced on a system with an Intel IGD and
compatible hardware and system BIOS that supports Intel VT-d. It also
only occurs with Linux Intel graphics drivers (i915) in a Linux guest.
It does not occur in a Windows guest with proprietary Windows Intel
graphics drivers. This testing was done with Qemu traditional running as
a process in dom0.

The commit abfb006f1ff4 was intended to explicitly grant access to all
needed I/O memory ranges so access requests by guests would not fail
after commit 0561e1f01e87 was applied, but it failed to handle the case
when the Intel IGD is being passed to an HVM guest for VGA passthrough.
This patch grants access to the Intel IGD opregion if an Intel IGD is
passed to an HVM guest and gfx_passthru is enabled in the xl.cfg guest
configuration file, in addition to the other memory that was configured
for access in commit abfb006f1ff4.

The fix is implemented as follows:

The first hunk of the patch adds two macros. These are the macros that
determine the starting address and size of the Intel IGD opregion.
PCI_INTEL_OPREGION matches the value in tools/firmware/hvmloader/pci_regs.h.
IGD_OPREGION_PAGES matches the value in tools/firmware/hvmloader/config.h.
These macros are used to correctly define the start address and size of
the Intel IGD opregion.

The second hunk is the new sysfs_dev_get_igd_opregion function, using
the same coding style as the other sysfs_dev_get_xxx functions in
the patched file. It returns the start address of the Intel IGD opregion
from dom0's point of view if there are no errors, and it is called by
code in the third and final hunk of the patch.

The third hunk extends the libxl__grant_vga_iomem_permission function,
which was a newly added function in one of the commits being fixed now
(abfb006f1ff4). That function, in addition to what it did before, now
checks if we have an Intel IGD and if so, it calls the new
sysfs_dev_get_igd_opregion function to get the starting address of the
memory to grant access to.

This problem was discovered by building and testing versions of
Xen 4.5-unstable until the aforementioned patches that broke passthrough
of the Intel IGD to a Linux HVM guest were found.

That alone, though, was not enough information to arrive at this fix.
After identifying abfb006f1ff4 and 0561e1f01e87 as the commits that were
causing the trouble, it was necessary to find out what memory was being
denied that previously was allowed. By examining verbose logs from both
Qemu and Xen, and the logs from a custom build of Xen that added a
custom log entry to indicate the address of the memory that was being
denied, it was possible to determine without doubt that the memory that
was being denied was the Intel IGD opregion.

Windows HVM guests are not affected by this issue, presumably because
the proprietary Windows Intel graphics drivers do not need to access the
Intel IGD opregion if for some reason it is inaccessible.

Guidelines for maintaining this code: This code needs to be kept
consistent with how hvmloader maps the Intel IGD opregion to the guest,
how hvmloader and libxenlight detect an Intel IGD on the PCI bus, and
how Qemu sets up the mapped IGD opregion in the guest and detects an
Intel IGD. For example, all these components should agree on the size of
the IGD opregion.

The most important point for the future is accurate detection of the
Intel IGD, which libxl__is_igd_vga_passthru currently provides. This
patch does not modify that function, but it does use it. It will be
important to ensure that function accurately detects an Intel IGD,
because that is the only way we validate the contents of the Intel
IGD opregion that we are permitting the guest to access. Currently, if
we have a VGA device, the vendor is Intel, and the gfx_passthru option
is enabled, we assume the contents of the memory we are mapping to
and sharing with the guest is valid. The libxl__is_igd_vga_passthru
function also reads the device id, but currently it assumes every
Intel GPU device has an opregion. So, for example, if it is discovered
that the newer discrete Intel GPUs do not have an opregion, the
libxl__is_igd_vga_passthru function should be modified to return false
for those devices.

Fixes: abfb006f1ff4 (tools/libxl: explicitly grant access to needed I/O-memory ranges)
Fixes: 0561e1f01e87 (xen/common: do not implicitly permit access to mapped I/O memory)
Backport: 4.12+

Signed-off-by: Chuck Zmudzinski <brchuckz@netscape.net>
---
 tools/libs/light/libxl_pci.c | 72 ++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 4bbbfe9f16..a4fc473de9 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -24,6 +24,8 @@
 #define PCI_OPTIONS            "msitranslate=%d,power_mgmt=%d"
 #define PCI_BDF_XSPATH         "%04x-%02x-%02x-%01x"
 #define PCI_PT_QDEV_ID         "pci-pt-%02x_%02x.%01x"
+#define PCI_INTEL_OPREGION     0xfc
+#define IGD_OPREGION_PAGES     3
 
 static unsigned int pci_encode_bdf(libxl_device_pci *pci)
 {
@@ -610,6 +612,45 @@ out:
     return ret;
 }
 
+static uint32_t sysfs_dev_get_igd_opregion(libxl__gc *gc,
+                                           libxl_device_pci *pci)
+{
+    char *pci_device_config_path =
+            GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/config",
+                      pci->domain, pci->bus, pci->dev, pci->func);
+    size_t read_items;
+    uint32_t igd_opregion;
+    uint32_t error = 0xffffffff;
+
+    FILE *f = fopen(pci_device_config_path, "r");
+    if (!f) {
+        LOGE(ERROR,
+             "pci device "PCI_BDF" does not have config attribute",
+             pci->domain, pci->bus, pci->dev, pci->func);
+        goto out;
+    }
+    if (fseek(f, PCI_INTEL_OPREGION, SEEK_SET)) {
+        LOGE(ERROR,
+             "cannot find igd opregion address of pci device "PCI_BDF,
+             pci->domain, pci->bus, pci->dev, pci->func);
+        goto out;
+    }
+    read_items = fread(&igd_opregion, 4, 1, f);
+    if (read_items != 1) {
+        LOGE(ERROR,
+             "cannot read igd opregion address of pci device "PCI_BDF,
+             pci->domain, pci->bus, pci->dev, pci->func);
+        goto out;
+    }
+    fclose(f);
+    return igd_opregion;
+
+out:
+    if (f)
+        fclose(f);
+    return error;
+}
+
 /*
  * Some devices may need some ways to work well. Here like IGD,
  * we have to pass a specific option to qemu.
@@ -2531,6 +2572,37 @@ int libxl__grant_vga_iomem_permission(libxl__gc *gc, const uint32_t domid,
                   domid, vga_iomem_start, (vga_iomem_start + 0x20 - 1));
             return ret;
         }
+
+        /* If this is an Intel IGD, allow access to the IGD opregion */
+        if (!libxl__is_igd_vga_passthru(gc, d_config)) return 0;
+
+        uint32_t igd_opregion = sysfs_dev_get_igd_opregion(gc, pci);
+        uint32_t error = 0xffffffff;
+        if (igd_opregion == error) break;
+
+        vga_iomem_start = ( (uint64_t) igd_opregion ) >> XC_PAGE_SHIFT;
+        ret = xc_domain_iomem_permission(CTX->xch, stubdom_domid,
+                                         vga_iomem_start,
+                                         IGD_OPREGION_PAGES, 1);
+        if (ret < 0) {
+            LOGED(ERROR, domid,
+                  "failed to give stubdom%d access to iomem range "
+                  "%"PRIx64"-%"PRIx64" for IGD passthru",
+                  stubdom_domid, vga_iomem_start, (vga_iomem_start +
+                                                IGD_OPREGION_PAGES - 1));
+            return ret;
+        }
+        ret = xc_domain_iomem_permission(CTX->xch, domid,
+                                         vga_iomem_start,
+                                         IGD_OPREGION_PAGES, 1);
+        if (ret < 0) {
+            LOGED(ERROR, domid,
+                  "failed to give dom%d access to iomem range "
+                  "%"PRIx64"-%"PRIx64" for IGD passthru",
+                  domid, vga_iomem_start, (vga_iomem_start +
+                                           IGD_OPREGION_PAGES - 1));
+            return ret;
+        }
         break;
     }
 
-- 
2.35.1


