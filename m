Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B096ACF54
	for <lists+xen-devel@lfdr.de>; Mon,  6 Mar 2023 21:41:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507110.780341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZHdU-0001KT-QY; Mon, 06 Mar 2023 20:40:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507110.780341; Mon, 06 Mar 2023 20:40:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZHdU-0001HJ-MC; Mon, 06 Mar 2023 20:40:44 +0000
Received: by outflank-mailman (input) for mailman id 507110;
 Mon, 06 Mar 2023 20:40:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r4JU=66=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1pZHdT-0000m6-AA
 for xen-devel@lists.xenproject.org; Mon, 06 Mar 2023 20:40:43 +0000
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [2607:f8b0:4864:20::82c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2900348b-bc5f-11ed-96b5-2f268f93b82a;
 Mon, 06 Mar 2023 21:40:42 +0100 (CET)
Received: by mail-qt1-x82c.google.com with SMTP id h19so12077425qtk.7
 for <xen-devel@lists.xenproject.org>; Mon, 06 Mar 2023 12:40:42 -0800 (PST)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:2825:cedc:1289:7391])
 by smtp.gmail.com with ESMTPSA id
 j10-20020ac8440a000000b003b82a07c4d6sm8086316qtn.84.2023.03.06.12.40.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 12:40:39 -0800 (PST)
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
X-Inumbo-ID: 2900348b-bc5f-11ed-96b5-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678135240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XhXDy5ti8KLorVIT2G2UDKzu/rOmP963s9KoYPQtJPg=;
        b=eyCh7wyIPm1KFpLgKs+7TCdsYLsW2uO2qFPO9zBCmdPOrV9jKzUJv2K3evBH4O3ERZ
         l/bUtrLd+KaJYiaI3bMjYYpYS0tDbmLYXZzAp6UtXm7/pbLtv62/p5NhjYMr+19GU4sI
         eg4AWjeCZMfEBbs3ujY6Yv5C9FkzrFAlOuImjM158CJhlRiEP7B3a+orny2YudrFAJ6v
         mLiwJ+5xGeWecRiZFvIJx6yfEoqw2IEnS1WRKwJQ/sI/FCM8H93rcgJE2pvPBanpMQtf
         k3ZYYG+gHodFX2M5XsMIl998k+gxARyf3KoFi92u24hVf/DDpsDYlA23Y62AgoW1Pyo9
         9VZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678135240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XhXDy5ti8KLorVIT2G2UDKzu/rOmP963s9KoYPQtJPg=;
        b=r/bkSljilu0N2mIfleI1KUjBfdFU8rzx3sDQlG90EeZVfYkcprO11ODgeIhYs+nGUC
         TgKEc7E41XhdqmQb1oPbOiHOD5eAF39vwt2OIyxj0dpqM+LYQKQlnwk8nHoAtkLeMkOd
         PcWumXcTQ8MbvCovpDbrjp2fIFDHsgCIITddAXVxM4fZ4KrVTsbmvFf6iyhgXrDZcR9K
         7SKhpWpQwX3YBih7f24dNM+7szp3TtnI6QIw4lZtKgXkhAfD2aPJQlF1OOl1harmLi3n
         EQlJ01XB2/aY3ydFwzdb1UqZxvh2ACS9ADDffo1IOWMQCwGXFVQRHggH+9v1dWBMcP5A
         pUzw==
X-Gm-Message-State: AO0yUKVNFIIHbYZODZWD8dZil2SZAXH036RqlYpMp3oF/W50mmNyOCee
	iWIYEBwmlxRCJJcKZ1wukXbfRWfxViU=
X-Google-Smtp-Source: AK7set++jiCpAfR58iuZ5SwbyicSozBn5xU3pSr39+n4WlUA1blXwaM1msSoRur+65ZbsLDCkedh9Q==
X-Received: by 2002:a05:622a:48:b0:3ba:1d8d:f6d0 with SMTP id y8-20020a05622a004800b003ba1d8df6d0mr22135529qtw.23.1678135240326;
        Mon, 06 Mar 2023 12:40:40 -0800 (PST)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v4 2/3] xl/libxl: Add ability to specify SMBIOS strings
Date: Mon,  6 Mar 2023 15:40:23 -0500
Message-Id: <20230306204024.124882-3-jandryuk@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306204024.124882-1-jandryuk@gmail.com>
References: <20230306204024.124882-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hvm_xs_strings.h specifies xenstore entries which can be used to set or
override smbios strings.  hvmloader has support for reading them, but
xl/libxl support is not wired up.

Allow specifying the strings with the new xl.cfg option:
smbios=["bios_vendor=Xen Project","system_version=1.0"]

In terms of strings, the SMBIOS specification 3.5 says:
https://www.dmtf.org/sites/default/files/standards/documents/DSP0134_3.5.0.pdf
"""
Strings must be encoded as UTF-8 with no byte order mark (BOM). For
compatibility with older SMBIOS parsers, US-ASCII characters should be
used.  NOTE There is no limit on the length of each individual text
string. However, the length of the entire structure table (including all
strings) must be reported in the Structure Table Length field of the
32-bit Structure Table Entry Point (see 5.2.1) and/or the Structure
Table Maximum Size field of the 64-bit Structure Table Entry Point (see
5.2.2).
"""

The strings aren't checked for utf-8 or length.  hvmloader has a sanity
check on the overall length.

The libxl_smbios_type enum starts at 1 since otherwise the 0th key is
not printed in the json output.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
v3
Disallow empty value strings
xstrdup listitem before modifying
Handle option=foo=bar -> option foo=bar
Fix compilation - remove stray }
Remove log message newline
Add multiline comment star
Rename variable v to key

v2:
Update s/_/-/ comment
Update debug print to xs_path = "value"
Error on xlu_cfg_get_listitem failure
Use EXIT_FAILURE consistently
free parsed strings
Move break to new line

The rendered man page and html don't have a newline at the end of the
new section.
"""
           battery_device_name=STRING
       ms_vm_genid="OPTION"
"""

however the txt format is correct:
"""
        battery_device_name=STRING

    ms_vm_genid="OPTION"
"""

I'm at a loss as to why this is happening.
---
 docs/man/xl.cfg.5.pod.in             | 45 +++++++++++++++++++++
 tools/golang/xenlight/helpers.gen.go | 51 ++++++++++++++++++++++++
 tools/golang/xenlight/types.gen.go   | 27 +++++++++++++
 tools/include/libxl.h                |  5 +++
 tools/libs/light/libxl_dom.c         | 21 ++++++++++
 tools/libs/light/libxl_types.idl     | 26 +++++++++++++
 tools/xl/xl_parse.c                  | 58 +++++++++++++++++++++++++++-
 7 files changed, 232 insertions(+), 1 deletion(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 024bceeb61..bc4386ee96 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -2079,6 +2079,51 @@ number of vendor defined SMBIOS structures (type 128 - 255). Since SMBIOS
 structures do not present their overall size, each entry in the file must be
 preceded by a 32b integer indicating the size of the following structure.
 
+=item B<smbios=[ "SMBIOS_SPEC_STRING", "SMBIOS_SPEC_STRING", ...]>
+
+Specifies the SMBIOS values to be provided to the guest.  These set or
+override specific entries in the tables provided to the guest.
+
+Each B<SMBIOS_SPEC_STRING> is a C<KEY=VALUE> string from the following list:
+
+=over 4
+
+=item B<bios_vendor=STRING>
+
+=item B<bios_version=STRING>
+
+=item B<system_manufacturer=STRING>
+
+=item B<system_product_name=STRING>
+
+=item B<system_version=STRING>
+
+=item B<system_serial_number=STRING>
+
+=item B<baseboard_manufacturer=STRING>
+
+=item B<baseboard_product_name=STRING>
+
+=item B<baseboard_version=STRING>
+
+=item B<baseboard_serial_number=STRING>
+
+=item B<baseboard_asset_tag=STRING>
+
+=item B<baseboard_location_in_chassis=STRING>
+
+=item B<enclosure_manufacturer=STRING>
+
+=item B<enclosure_serial_number=STRING>
+
+=item B<enclosure_asset_tag=STRING>
+
+=item B<battery_manufacturer=STRING>
+
+=item B<battery_device_name=STRING>
+
+=back
+
 =item B<ms_vm_genid="OPTION">
 
 Provide a VM generation ID to the guest.
diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index 3ac4938858..0a203d2232 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -589,6 +589,38 @@ xc.build_id = C.CString(x.BuildId)}
  return nil
  }
 
+// NewSmbios returns an instance of Smbios initialized with defaults.
+func NewSmbios() (*Smbios, error) {
+var (
+x Smbios
+xc C.libxl_smbios)
+
+C.libxl_smbios_init(&xc)
+defer C.libxl_smbios_dispose(&xc)
+
+if err := x.fromC(&xc); err != nil {
+return nil, err }
+
+return &x, nil}
+
+func (x *Smbios) fromC(xc *C.libxl_smbios) error {
+ x.Key = SmbiosType(xc.key)
+x.Value = C.GoString(xc.value)
+
+ return nil}
+
+func (x *Smbios) toC(xc *C.libxl_smbios) (err error){defer func(){
+if err != nil{
+C.libxl_smbios_dispose(xc)}
+}()
+
+xc.key = C.libxl_smbios_type(x.Key)
+if x.Value != "" {
+xc.value = C.CString(x.Value)}
+
+ return nil
+ }
+
 // NewDomainCreateInfo returns an instance of DomainCreateInfo initialized with defaults.
 func NewDomainCreateInfo() (*DomainCreateInfo, error) {
 var (
@@ -1183,6 +1215,15 @@ return fmt.Errorf("converting field Altp2M: %v", err)
 }
 x.SystemFirmware = C.GoString(tmp.system_firmware)
 x.SmbiosFirmware = C.GoString(tmp.smbios_firmware)
+x.Smbios = nil
+if n := int(tmp.num_smbios); n > 0 {
+cSmbios := (*[1<<28]C.libxl_smbios)(unsafe.Pointer(tmp.smbios))[:n:n]
+x.Smbios = make([]Smbios, n)
+for i, v := range cSmbios {
+if err := x.Smbios[i].fromC(&v); err != nil {
+return fmt.Errorf("converting field Smbios: %v", err) }
+}
+}
 x.AcpiFirmware = C.GoString(tmp.acpi_firmware)
 x.Hdtype = Hdtype(tmp.hdtype)
 if err := x.Nographic.fromC(&tmp.nographic);err != nil {
@@ -1495,6 +1536,16 @@ if tmp.SystemFirmware != "" {
 hvm.system_firmware = C.CString(tmp.SystemFirmware)}
 if tmp.SmbiosFirmware != "" {
 hvm.smbios_firmware = C.CString(tmp.SmbiosFirmware)}
+if numSmbios := len(tmp.Smbios); numSmbios > 0 {
+hvm.smbios = (*C.libxl_smbios)(C.malloc(C.ulong(numSmbios)*C.sizeof_libxl_smbios))
+hvm.num_smbios = C.int(numSmbios)
+cSmbios := (*[1<<28]C.libxl_smbios)(unsafe.Pointer(hvm.smbios))[:numSmbios:numSmbios]
+for i,v := range tmp.Smbios {
+if err := v.toC(&cSmbios[i]); err != nil {
+return fmt.Errorf("converting field Smbios: %v", err)
+}
+}
+}
 if tmp.AcpiFirmware != "" {
 hvm.acpi_firmware = C.CString(tmp.AcpiFirmware)}
 hvm.hdtype = C.libxl_hdtype(tmp.Hdtype)
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index 16ce879e3f..2d8bc7654a 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -392,6 +392,32 @@ Commandline string
 BuildId string
 }
 
+type SmbiosType int
+const(
+SmbiosTypeBiosVendor SmbiosType = 1
+SmbiosTypeBiosVersion SmbiosType = 2
+SmbiosTypeSystemManufacturer SmbiosType = 3
+SmbiosTypeSystemProductName SmbiosType = 4
+SmbiosTypeSystemVersion SmbiosType = 5
+SmbiosTypeSystemSerialNumber SmbiosType = 6
+SmbiosTypeBaseboardManufacturer SmbiosType = 7
+SmbiosTypeBaseboardProductName SmbiosType = 8
+SmbiosTypeBaseboardVersion SmbiosType = 9
+SmbiosTypeBaseboardSerialNumber SmbiosType = 10
+SmbiosTypeBaseboardAssetTag SmbiosType = 11
+SmbiosTypeBaseboardLocationInChassis SmbiosType = 12
+SmbiosTypeEnclosureManufacturer SmbiosType = 13
+SmbiosTypeEnclosureSerialNumber SmbiosType = 14
+SmbiosTypeEnclosureAssetTag SmbiosType = 15
+SmbiosTypeBatteryManufacturer SmbiosType = 16
+SmbiosTypeBatteryDeviceName SmbiosType = 17
+)
+
+type Smbios struct {
+Key SmbiosType
+Value string
+}
+
 type DomainCreateInfo struct {
 Type DomainType
 Hap Defbool
@@ -572,6 +598,7 @@ NestedHvm Defbool
 Altp2M Defbool
 SystemFirmware string
 SmbiosFirmware string
+Smbios []Smbios
 AcpiFirmware string
 Hdtype Hdtype
 Nographic Defbool
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index d652895075..5c65222f1e 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -174,6 +174,11 @@
  */
 #define LIBXL_HAVE_BUILDINFO_HVM_MS_VM_GENID 1
 
+/*
+ * libxl_domain_build_info has the u.hvm.smbios field.
+ */
+#define LIBXL_HAVE_BUILDINFO_HVM_SMBIOS 1
+
 /*
  * LIBXL_HAVE_VCPUINFO_SOFT_AFFINITY indicates that a 'cpumap_soft'
  * field (of libxl_bitmap type) is present in libxl_vcpuinfo,
diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
index f6311eea6e..5433301f70 100644
--- a/tools/libs/light/libxl_dom.c
+++ b/tools/libs/light/libxl_dom.c
@@ -773,6 +773,27 @@ static int hvm_build_set_xs_values(libxl__gc *gc,
             goto err;
     }
 
+    for (int i = 0; i < info->u.hvm.num_smbios; i++) {
+        char *p;
+        path = GCSPRINTF("/local/domain/%d/"HVM_XS_BIOS_STRINGS"/%s", domid,
+                   libxl_smbios_type_to_string(info->u.hvm.smbios[i].key));
+
+        /* Convert libxl_smbios_type string to xenstore path that hvmloader
+         * will use, as defined by HVM_XS_*. That is convert the '_' to '-'. */
+        p = strrchr(path, '/');
+        for ( ; *p; p++) {
+            if (*p == '_')
+                *p = '-';
+        }
+
+        LOGD(DEBUG, domid, "Writing %s = \"%s\"", path,
+             info->u.hvm.smbios[i].value);
+        ret = libxl__xs_printf(gc, XBT_NULL, path, "%s",
+                               info->u.hvm.smbios[i].value);
+        if (ret)
+            goto err;
+    }
+
     /* Only one module can be passed. PVHv2 guests do not support this. */
     if (dom->acpi_modules[0].guest_addr_out && 
         info->type == LIBXL_DOMAIN_TYPE_HVM) {
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 0cfad8508d..df4dd36697 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -423,6 +423,31 @@ libxl_version_info = Struct("version_info", [
     ("build_id",          string),
     ], dir=DIR_OUT)
 
+libxl_smbios_type = Enumeration("smbios_type", [
+    (1,  "bios_vendor"),
+    (2,  "bios_version"),
+    (3,  "system_manufacturer"),
+    (4,  "system_product_name"),
+    (5,  "system_version"),
+    (6,  "system_serial_number"),
+    (7,  "baseboard_manufacturer"),
+    (8,  "baseboard_product_name"),
+    (9,  "baseboard_version"),
+    (10, "baseboard_serial_number"),
+    (11, "baseboard_asset_tag"),
+    (12, "baseboard_location_in_chassis"),
+    (13, "enclosure_manufacturer"),
+    (14, "enclosure_serial_number"),
+    (15, "enclosure_asset_tag"),
+    (16, "battery_manufacturer"),
+    (17, "battery_device_name"),
+    ])
+
+libxl_smbios = Struct("smbios", [
+    ("key",          libxl_smbios_type),
+    ("value",        string),
+    ], dir=DIR_IN)
+
 libxl_domain_create_info = Struct("domain_create_info",[
     ("type",         libxl_domain_type),
     ("hap",          libxl_defbool),
@@ -609,6 +634,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
                                        ("altp2m",           libxl_defbool),
                                        ("system_firmware",  string),
                                        ("smbios_firmware",  string),
+                                       ("smbios",           Array(libxl_smbios, "num_smbios")),
                                        ("acpi_firmware",    string),
                                        ("hdtype",           libxl_hdtype),
                                        ("nographic",        libxl_defbool),
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 853e9f357a..ba219024b6 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1297,8 +1297,9 @@ void parse_config_data(const char *config_source,
     XLU_ConfigList *cpus, *vbds, *nics, *pcis, *cvfbs, *cpuids, *vtpms,
                    *usbctrls, *usbdevs, *p9devs, *vdispls, *pvcallsifs_devs;
     XLU_ConfigList *channels, *ioports, *irqs, *iomem, *viridian, *dtdevs,
-                   *mca_caps;
+                   *mca_caps, *smbios;
     int num_ioports, num_irqs, num_iomem, num_cpus, num_viridian, num_mca_caps;
+    int num_smbios;
     int pci_power_mgmt = 0;
     int pci_msitranslate = 0;
     int pci_permissive = 0;
@@ -1860,6 +1861,61 @@ void parse_config_data(const char *config_source,
         xlu_cfg_replace_string(config, "acpi_firmware",
                                &b_info->u.hvm.acpi_firmware, 0);
 
+        switch (xlu_cfg_get_list(config, "smbios", &smbios, &num_smbios, 0))
+        {
+        case 0: /* Success */
+            b_info->u.hvm.num_smbios = num_smbios;
+            b_info->u.hvm.smbios = xcalloc(num_smbios, sizeof(libxl_smbios));
+            for (i = 0; i < num_smbios; i++) {
+                libxl_smbios_type type;
+                char *option;
+                char *value;
+
+                buf = xlu_cfg_get_listitem(smbios, i);
+                if (!buf) {
+                    fprintf(stderr,
+                            "xl: Unable to get element #%d in smbios list\n",
+                            i);
+                    exit(EXIT_FAILURE);
+                }
+
+                option = xstrdup(buf);
+                value = strchr(option, '=');
+                if (value == NULL) {
+                    fprintf(stderr, "xl: failed to split \"%s\" at '='\n",
+                            option);
+                    exit(EXIT_FAILURE);
+                }
+
+                *value = '\0';
+                value++;
+
+                if (*value == '\0') {
+                    fprintf(stderr,
+                            "xl: empty value not allowed for smbios \"%s=\"\n",
+                            option);
+                    exit(EXIT_FAILURE);
+                }
+
+                e = libxl_smbios_type_from_string(option, &type);
+                if (e) {
+                    fprintf(stderr, "xl: unknown smbios type '%s'\n", option);
+                    exit(EXIT_FAILURE);
+                }
+
+                b_info->u.hvm.smbios[i].key = type;
+                b_info->u.hvm.smbios[i].value = xstrdup(value);
+
+                free(option);
+            }
+            break;
+        case ESRCH: /* Option not present */
+            break;
+        default:
+            fprintf(stderr,"xl: Unable to parse smbios options.\n");
+            exit(EXIT_FAILURE);
+        }
+
         if (!xlu_cfg_get_string(config, "ms_vm_genid", &buf, 0)) {
             if (!strcmp(buf, "generate")) {
                 e = libxl_ms_vm_genid_generate(ctx, &b_info->u.hvm.ms_vm_genid);
-- 
2.39.2


