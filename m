Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCBE2CD5A8
	for <lists+xen-devel@lfdr.de>; Thu,  3 Dec 2020 13:42:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.43409.78061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kknw2-00062l-IR; Thu, 03 Dec 2020 12:42:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43409.78061; Thu, 03 Dec 2020 12:42:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kknw2-000621-EQ; Thu, 03 Dec 2020 12:42:10 +0000
Received: by outflank-mailman (input) for mailman id 43409;
 Thu, 03 Dec 2020 12:42:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1kknw0-0005yS-JC
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 12:42:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kknvz-00046M-Nc; Thu, 03 Dec 2020 12:42:07 +0000
Received: from host86-183-162-145.range86-183.btcentralplus.com
 ([86.183.162.145] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kknvz-00015A-Fm; Thu, 03 Dec 2020 12:42:07 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=CGl8BZR/+SpIqigLmobGcANzj6zAGuP+UKJDCJC+Ltg=; b=SbbI6XX5sX2gwuUxhWLZLT1pAX
	4ZL8iL+x0MoLHveAY1p0FQnICSlV/ZcM/nIq3r996pGP3fUHPfGg0mJ7ieDkLcD8k9KmOrqQi6zyN
	I4gxHGQd/gRl5BZpvbYI+vxBZKnK8rPcIE4sGGTHyZI5PEaumxUs1Gt4GFyU53cZHGhs=;
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v5 4/4] xl: introduce a 'xen-abi-features' option...
Date: Thu,  3 Dec 2020 12:41:59 +0000
Message-Id: <20201203124159.3688-5-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201203124159.3688-1-paul@xen.org>
References: <20201203124159.3688-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

... to control which features of the Xen ABI are enabled in
'libxl_domain_build_info', and hence exposed to the guest.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>

v5:
 - New in v5
---
 docs/man/xl.cfg.5.pod.in | 50 ++++++++++++++++++++++++++++++++++++++++
 tools/xl/xl_parse.c      | 50 ++++++++++++++++++++++++++++++++++++++--
 2 files changed, 98 insertions(+), 2 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 3f0f8de1e988..b42ab8ba9f60 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -1649,6 +1649,56 @@ This feature is a B<technology preview>.
 
 =back
 
+=item B<xen_abi_features=[ "STRING", "STRING", ...]>
+
+The features of the Xen ABI exposed to the guest. The following features
+may be specified:
+
+=over 4
+
+=item B<evtchn_fifo>
+
+A new event channel ABI was introduced in Xen 4.4. Moving a guest from an
+earlier Xen to Xen 4.4 onwards may expose bugs in the guest support for
+this ABI. Disabling this feature hides the ABI from the guest and hence
+may be used as a workaround for such bugs.
+
+The festure is enabled by default.
+
+=item B<evcthn_upcall>
+
+B<x86 HVM only>. A new hypercall to specify per-VCPU interrupt vectors to use
+for event channel upcalls in HVM guests was added in Xen 4.6. Moving a guest
+from an earlier Xen to Xen 4.6 onwards may expose bugs in the guest support
+for this hypercall. Disabling this feature hides the hypercall from the
+guest and hence may be used as a workaround for such bugs.
+
+The festure is enabled by default for B<x86 HVM> guests. Note that it is
+considered an error to enable this feature for B<Arm> or B<x86 PV> guests.
+
+=item B<all>
+
+This is a special value that enables all available features.
+
+=back
+
+Features can be disabled by prefixing the name with '!'. So, for example,
+to enable all features except B<evtchn_upcall>, specify:
+
+=over 4
+
+B<xen-abi-features=[ "all", "!evtchn_upcall" ]>
+
+=back
+
+Or, to simply enable default features except B<evtchn_fifo>, specify:
+
+=over 4
+
+B<xen-abi-features=[ "!evtchn_fifo" ]>
+
+=back
+
 =back
 
 =head2 Paravirtualised (PV) Guest Specific Options
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index cae8eb679c5a..566e09f938f4 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1216,8 +1216,9 @@ void parse_config_data(const char *config_source,
     XLU_ConfigList *cpus, *vbds, *nics, *pcis, *cvfbs, *cpuids, *vtpms,
                    *usbctrls, *usbdevs, *p9devs, *vdispls, *pvcallsifs_devs;
     XLU_ConfigList *channels, *ioports, *irqs, *iomem, *viridian, *dtdevs,
-                   *mca_caps;
-    int num_ioports, num_irqs, num_iomem, num_cpus, num_viridian, num_mca_caps;
+                   *mca_caps, *features;
+    int num_ioports, num_irqs, num_iomem, num_cpus, num_viridian, num_mca_caps,
+        num_features;
     int pci_power_mgmt = 0;
     int pci_msitranslate = 0;
     int pci_permissive = 0;
@@ -2737,6 +2738,51 @@ skip_usbdev:
     xlu_cfg_get_defbool(config, "xend_suspend_evtchn_compat",
                         &c_info->xend_suspend_evtchn_compat, 0);
 
+    switch (xlu_cfg_get_list(config, "xen_abi_features",
+                             &features, &num_features, 1))
+    {
+    case 0: /* Success */
+        if (num_features) {
+            libxl_bitmap_alloc(ctx, &b_info->feature_enable,
+                               LIBXL_BUILDINFO_FEATURE_ENABLE_DISABLE_WIDTH);
+            libxl_bitmap_alloc(ctx, &b_info->feature_disable,
+                               LIBXL_BUILDINFO_FEATURE_ENABLE_DISABLE_WIDTH);
+        }
+        for (i = 0; i < num_features; i++) {
+            if (strcmp(buf, "all") == 0)
+                libxl_bitmap_set_any(&b_info->feature_enable);
+            else {
+                libxl_bitmap *s = &b_info->feature_enable;
+                libxl_bitmap *r = &b_info->feature_disable;
+                libxl_xen_abi_feature f;
+
+                buf = xlu_cfg_get_listitem(features, i);
+
+                if (*buf == '!') {
+                    s = &b_info->feature_disable;
+                    r = &b_info->feature_enable;
+                    buf++;
+                }
+
+                e = libxl_xen_abi_feature_from_string(buf, &f);
+                if (e) {
+                    fprintf(stderr,
+                            "xl: Unknown Xen ABI feature '%s'\n",
+                            buf);
+                    exit(-ERROR_FAIL);
+                }
+
+                libxl_bitmap_set(s, f);
+                libxl_bitmap_reset(r, f);
+            }
+        }
+        break;
+    case ESRCH: break; /* Option not present */
+    default:
+        fprintf(stderr,"xl: Unable to parse Xen ABI features.\n");
+        exit(-ERROR_FAIL);
+    }
+
     xlu_cfg_destroy(config);
 }
 
-- 
2.20.1


