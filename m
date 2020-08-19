Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB18224A462
	for <lists+xen-devel@lfdr.de>; Wed, 19 Aug 2020 18:53:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8RKG-0003oW-ON; Wed, 19 Aug 2020 16:52:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qP9Y=B5=gmail.com=don.slutz@srs-us1.protection.inumbo.net>)
 id 1k8RKF-0003kZ-KZ
 for xen-devel@lists.xen.org; Wed, 19 Aug 2020 16:52:35 +0000
X-Inumbo-ID: 701a3ca8-835e-4475-a585-f8387a64ef99
Received: from mail-qt1-x844.google.com (unknown [2607:f8b0:4864:20::844])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 701a3ca8-835e-4475-a585-f8387a64ef99;
 Wed, 19 Aug 2020 16:52:21 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id h21so18273845qtp.11
 for <xen-devel@lists.xen.org>; Wed, 19 Aug 2020 09:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :in-reply-to:references;
 bh=cWulFsHkNsMNGC2uvEY33xRgo78iJDptDGbhfvQXNSY=;
 b=nt34M22LhQ1cPr4+nW9rwrLB32z5vE3SvLB0ziE3HRWakRRfJKH3MoxzP8nCtY1+XN
 cTbINjuAKiky9/Nwa3dPldHvY5ITG3DnEmwteyijN6RB1NK6IZ4uDyoTvmrClSeWlWEK
 CKAa5wI1mtlRKgYoC+7GjvsVMKNpx0dyQDCpJRVXLum7rwGgQvAH78k1+S5AwxCnCunW
 x34sfJfjlUnA4bschugwDTCpLP99IPl1IdvXzOHGBI8Rq5T8GMPdyALA0KH316urzWt6
 qHMzrPMYAmKnbQ/j+jWTpJuQlOZ6sDFCe7nK8tVoiqYYqBQcIjf/Qtwck0aizipMcx3V
 M3yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=cWulFsHkNsMNGC2uvEY33xRgo78iJDptDGbhfvQXNSY=;
 b=iAxrzDkarXqXJf8sQ0MRVkvImdtrsBkIyVVmpNK7r9X/3+TP7ptgN8VXl+X5p2KLrs
 zpLdWMCVoeO31Ql5kd+DcJqezl2SLGWbybYFd4BrV9mAA/6q3Pah6ke40LD8OKDupc1Z
 JA9ynGa5pakxu1z7ep2pP+2uMMnQaJvb0Uh6RtxcEBNvBK11zF5zh1jJBd2tk4j67DvZ
 RhZezLRgj+58tFYStDTFnXmqenzgPN21QZfyOqig7Tw5/KCKBDflhZNua9b2x9iSiPE/
 uy/2RsS1VqIZ6JZN9a/IUDKyPkBSo4EPK21u/5dQywtsXwCgJxyjpyG9wrUDJx+GFmaq
 /oVQ==
X-Gm-Message-State: AOAM533JYwL/U7QdHDkCZzJKgayAixcPXmj1pRv0+6uChBEr269dqNe0
 3HDjRUMtym3wwY72sHzNvLN3mLg3yvPHwmPZ
X-Google-Smtp-Source: ABdhPJyREnuFIxcunzazKQW44dQPm0Jfaa9gruk7tvcOZ9HQbKF2VbFaQdLSNdDsZ5SvI8HHCiXFfA==
X-Received: by 2002:ac8:1788:: with SMTP id o8mr22064948qtj.330.1597855941268; 
 Wed, 19 Aug 2020 09:52:21 -0700 (PDT)
Received: from TestCloud1.don.dslutz.org.zatium.us
 (pool-96-230-225-98.bstnma.fios.verizon.net. [96.230.225.98])
 by smtp.googlemail.com with ESMTPSA id
 128sm25105832qkk.101.2020.08.19.09.52.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Aug 2020 09:52:20 -0700 (PDT)
From: Don Slutz <don.slutz@gmail.com>
X-Google-Original-From: Don Slutz <Don.Slutz@Gmail.com
To: xen-devel@lists.xen.org
Cc: Aravind Gopalakrishnan <Aravind.Gopalakrishnan@amd.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Eddie Dong <eddie.dong@intel.com>, Ian Campbell <ian.campbell@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Keir Fraser <keir@xen.org>,
 Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <stefano.stabellini@eu.citrix.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Tim Deegan <tim@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Don Slutz <dslutz@verizon.com>, Don Slutz <don.slutz@gmail.com>
Subject: [Xen-devel] [XEN PATCH v14 3/8] tools: Add vmware_hwver support
Date: Wed, 19 Aug 2020 12:51:57 -0400
Message-Id: <c1560bc4cecae1c40de5f5cfc39832394f77c5ed.1597854907.git.don.slutz@gmail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <67b90d11eae2c88faab22d458e7e38db0f5aada4.1597854907.git.don.slutz@gmail.com>
References: <cover.1597854907.git.don.slutz@gmail.com>
 <34a50dc69e4c5722597e02a4df4e3da6d6586ec7.1597854907.git.don.slutz@gmail.com>
 <67b90d11eae2c88faab22d458e7e38db0f5aada4.1597854907.git.don.slutz@gmail.com>
In-Reply-To: <cover.1597854907.git.don.slutz@gmail.com>
References: <cover.1597854907.git.don.slutz@gmail.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Don Slutz <dslutz@verizon.com>

This is used to set xen_arch_domainconfig vmware_hw. It is set to
the emulated VMware virtual hardware version.

Currently 0, 3-4, 6-11 are good values.  However the code only
checks for == 0, != 0, or < 7.

Signed-off-by: Don Slutz <dslutz@verizon.com>
CC: Don Slutz <don.slutz@gmail.com>
---
Acked-by: Ian Campbell <ian.campbell@citrix.com>

v14:
  Reworked to current code.

v13:
  Added: Acked-by: Ian Campbell

v12:
    I'm not sure this hunk has anything to do with this patch, nor
    what the semantic difference between the old and new text is
    supposed to be.
      Dropped comment change.


v11:
  Dropped "If non-zero then default VGA to VMware's VGA"

v10:
    LIBXL_HAVE_LIBXL_VGA_INTERFACE_TYPE_VMWARE &
    LIBXL_HAVE_BUILDINFO_HVM_VMWARE_HWVER are arriving together
    a single umbrella could be used.
      Since I split the LIBXL_VGA_INTERFACE_TYPE_VMWARE into
      it's own patch, this is not longer true.
      But I did use 1 for the 2 c_info changes.
    Please use GCSPRINTF.
  Remove vga=vmware from here.

v9:
      I assumed that s/vmware_hw/vmware_hwver/ is not a big enough
      change to drop the Reviewed-by.  Did a minor edit to the
      commit message to add 7 to the list of values checked.

v7:
    Default handling of hvm.vga.kind bad.
      Fixed.
    Default of vmware_port should be based on vmware_hw.
      Done. 

v5:
      Anything looking for Xen according to the Xen cpuid instructions...
        Adjusted doc to new wording.

 docs/man/xl.cfg.5.pod.in    | 17 +++++++++++++++++
 tools/libxl/libxl_create.c  |  4 +++-
 tools/libxl/libxl_types.idl |  1 +
 tools/libxl/libxl_x86.c     |  3 +--
 tools/xl/xl_parse.c         |  3 +++
 5 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index a9eae96..10eac33 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -2353,6 +2353,23 @@ The viridian option can be specified as a boolean. A value of true (1)
 is equivalent to the list [ "defaults" ], and a value of false (0) is
 equivalent to an empty list.
 
+=item B<vmware_hwver=NUMBER>
+
+Turns on or off the exposure of VMware cpuid.  The number is
+VMware's hardware version number, where 0 is off.  A number >= 7
+is needed to enable exposure of VMware cpuid.
+
+The hardware version number (vmware_hwver) comes from VMware config files.
+
+=over 4
+
+In a .vmx it is virtualHW.version
+
+In a .ovf it is part of the value of vssd:VirtualSystemType.
+For vssd:VirtualSystemType == vmx-07, vmware_hwver = 7.
+
+=back
+
 =back
 
 =head3 Emulated VGA Graphics Device
diff --git a/tools/libxl/libxl_create.c b/tools/libxl/libxl_create.c
index 2814818..e28d175 100644
--- a/tools/libxl/libxl_create.c
+++ b/tools/libxl/libxl_create.c
@@ -499,7 +499,7 @@ int libxl__domain_build(libxl__gc *gc,
         vments[4] = "start_time";
         vments[5] = GCSPRINTF("%lu.%02d", start_time.tv_sec,(int)start_time.tv_usec/10000);
 
-        localents = libxl__calloc(gc, 13, sizeof(char *));
+        localents = libxl__calloc(gc, 15, sizeof(char *));
         i = 0;
         localents[i++] = "platform/acpi";
         localents[i++] = libxl__acpi_defbool_val(info) ? "1" : "0";
@@ -509,6 +509,8 @@ int libxl__domain_build(libxl__gc *gc,
         localents[i++] = libxl_defbool_val(info->u.hvm.acpi_s4) ? "1" : "0";
         localents[i++] = "platform/acpi_laptop_slate";
         localents[i++] = libxl_defbool_val(info->u.hvm.acpi_laptop_slate) ? "1" : "0";
+        localents[i++] = "platform/vmware_hwver";
+        localents[i++] = GCSPRINTF("%d", d_config->c_info.vmware_hwver);
         if (info->u.hvm.mmio_hole_memkb) {
             uint64_t max_ram_below_4g =
                 (1ULL << 32) - (info->u.hvm.mmio_hole_memkb << 10);
diff --git a/tools/libxl/libxl_types.idl b/tools/libxl/libxl_types.idl
index 36350d2..89a9ee7 100644
--- a/tools/libxl/libxl_types.idl
+++ b/tools/libxl/libxl_types.idl
@@ -420,6 +420,7 @@ libxl_domain_create_info = Struct("domain_create_info",[
     ("driver_domain",libxl_defbool),
     ("passthrough",  libxl_passthrough),
     ("xend_suspend_evtchn_compat",libxl_defbool),
+    ("vmware_hwver", uint32),
     ], dir=DIR_IN)
 
 libxl_domain_restore_params = Struct("domain_restore_params", [
diff --git a/tools/libxl/libxl_x86.c b/tools/libxl/libxl_x86.c
index 3418a81..0ee7418 100644
--- a/tools/libxl/libxl_x86.c
+++ b/tools/libxl/libxl_x86.c
@@ -21,8 +21,7 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
         abort();
     }
 
-    /* Note: will be changed in next patch (tools: Add ...). */
-    config->arch.vmware_hwver = 0;
+    config->arch.vmware_hwver = d_config->c_info.vmware_hwver;
     return 0;
 }
 
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index c74a9e3..4794398 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1573,6 +1573,9 @@ void parse_config_data(const char *config_source,
     b_info->cmdline = parse_cmdline(config);
 
     xlu_cfg_get_defbool(config, "driver_domain", &c_info->driver_domain, 0);
+    if (!xlu_cfg_get_long(config, "vmware_hwver",  &l, 1))
+        c_info->vmware_hwver = l;
+
     xlu_cfg_get_defbool(config, "acpi", &b_info->acpi, 0);
 
     xlu_cfg_replace_string (config, "bootloader", &b_info->bootloader, 0);
-- 
1.8.3.1


