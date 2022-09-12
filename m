Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5745C5B5A16
	for <lists+xen-devel@lfdr.de>; Mon, 12 Sep 2022 14:25:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.405788.648220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXiUd-0000w3-Jm; Mon, 12 Sep 2022 12:24:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 405788.648220; Mon, 12 Sep 2022 12:24:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXiUd-0000te-G4; Mon, 12 Sep 2022 12:24:51 +0000
Received: by outflank-mailman (input) for mailman id 405788;
 Mon, 12 Sep 2022 12:24:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2z8A=ZP=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1oXiUc-0000t5-5t
 for xen-devel@lists.xenproject.org; Mon, 12 Sep 2022 12:24:50 +0000
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [2607:f8b0:4864:20::733])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de9b7a44-3295-11ed-9760-273f2230c3a0;
 Mon, 12 Sep 2022 14:24:39 +0200 (CEST)
Received: by mail-qk1-x733.google.com with SMTP id d15so5801364qka.9
 for <xen-devel@lists.xenproject.org>; Mon, 12 Sep 2022 05:24:48 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:cc03:373b:6dc6:a951])
 by smtp.gmail.com with ESMTPSA id
 f1-20020ac87f01000000b0031d283f4c4dsm6705092qtk.60.2022.09.12.05.24.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Sep 2022 05:24:31 -0700 (PDT)
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
X-Inumbo-ID: de9b7a44-3295-11ed-9760-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=joJYsjy4tSiNhotj7nne40DqyOd3cM8XIQboEYpfiE4=;
        b=JWT0SsisRGZivxFMro7aPzg35Thn1e1qHMG181Z0lnHHvTTM7384+st+My27tYlxMT
         g+PpRwlVve6nxahJ3e3eerijlTIhu9JfQjlBCWhqGOPnDFDsZx46rVFfVhIbk2w2KTwU
         WdNb6U0pULstA6/KQ0gqbkr4SRvVfmXaA3yVIa2u/kJG1/33Ym972ezvGuTbGivOlt3l
         UN7w4jVspjnGck1XMJyr9tza2MqnXT/OS5r4vaJS+tNSXEyTlHwGTdsXfxcP7JwcHi1P
         WHwg8AGTUS2XYwoKvXwkHlXJq1p5T7N5E95YY8js/ob//86QSKT7KWqks4RfEAQHQyIW
         A/Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=joJYsjy4tSiNhotj7nne40DqyOd3cM8XIQboEYpfiE4=;
        b=UYfeJX6YVsZQevoGhbRFmvXvflsr68TArI4rcS1ECERwP74RDIcEe9OTJK4dodwHRd
         eQBXEeS8Zf9Awzp3WsJi3K3x69JHnjzGtX1oO6P7Q6CMcPhqekKD7v42NHtpGI0suARC
         ubC6FSO3k7HCiKZ/eOlSGy2i9IzFJXuAI5XmOKkjBNHq3SRjtfYWSsQ60QRmIuu1D+pG
         aucyKGQwg4RTWXQBdhF2Vs8z097c/gB+dEOjmO+GeLAv7R5GRqs7YKPagWs7m9AJSh0b
         104k752jkIHH6NlgGm4IKemUx9VLtnBqcO1lD9OaDbpS3A7oH3FkpFO6Gs6XlOdjo09P
         PfBQ==
X-Gm-Message-State: ACgBeo06sLgwt9GOmPpnWWOmV3KjIncwPSneLSKUdL6NN0O1Yl1dkzLg
	+QN2X2E/gXgB0T2eumx7+auOVNxrseg=
X-Google-Smtp-Source: AA6agR4RHiMCGpqWpwMzQLwd/OX21vE2GaDUi6qD5z7kQye3jHbV3bHeWacCoesKr7OQaRP2zzN4gQ==
X-Received: by 2002:a05:620a:246:b0:6cb:c0dd:2d7a with SMTP id q6-20020a05620a024600b006cbc0dd2d7amr14615091qkn.234.1662985487364;
        Mon, 12 Sep 2022 05:24:47 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 2/3] xl/libxl: Add ability to specify SMBIOS strings
Date: Mon, 12 Sep 2022 08:22:36 -0400
Message-Id: <20220912122237.5431-3-jandryuk@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220912122237.5431-1-jandryuk@gmail.com>
References: <20220912122237.5431-1-jandryuk@gmail.com>
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
Rename variable v to type

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
index b2901e04cf..fa78fba361 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -2061,6 +2061,51 @@ number of vendor defined SMBIOS structures (type 128 - 255). Since SMBIOS
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
index fa3cf2ab76..cae14ec6f5 100644
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
@@ -1189,6 +1221,15 @@ return fmt.Errorf("converting field Altp2M: %v", err)
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
@@ -1501,6 +1542,16 @@ if tmp.SystemFirmware != "" {
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
index a0be7ada8c..e084c3540b 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -386,6 +386,32 @@ Commandline string
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
@@ -568,6 +594,7 @@ NestedHvm Defbool
 Altp2M Defbool
 SystemFirmware string
 SmbiosFirmware string
+Smbios []Smbios
 AcpiFirmware string
 Hdtype Hdtype
 Nographic Defbool
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 2321a648a5..023613d35b 100644
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
index 2abaab439c..4f85623c42 100644
--- a/tools/libs/light/libxl_dom.c
+++ b/tools/libs/light/libxl_dom.c
@@ -771,6 +771,27 @@ static int hvm_build_set_xs_values(libxl__gc *gc,
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
index d634f304cd..d04207748e 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -418,6 +418,31 @@ libxl_version_info = Struct("version_info", [
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
@@ -604,6 +629,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
                                        ("altp2m",           libxl_defbool),
                                        ("system_firmware",  string),
                                        ("smbios_firmware",  string),
+                                       ("smbios",           Array(libxl_smbios, "num_smbios")),
                                        ("acpi_firmware",    string),
                                        ("hdtype",           libxl_hdtype),
                                        ("nographic",        libxl_defbool),
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 1b5381cef0..47521e9924 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1220,8 +1220,9 @@ void parse_config_data(const char *config_source,
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
@@ -1783,6 +1784,61 @@ void parse_config_data(const char *config_source,
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
2.37.3


