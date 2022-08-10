Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5F558F354
	for <lists+xen-devel@lfdr.de>; Wed, 10 Aug 2022 21:49:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384000.619267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLrhR-0007vJ-0Q; Wed, 10 Aug 2022 19:49:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384000.619267; Wed, 10 Aug 2022 19:49:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLrhQ-0007tW-S0; Wed, 10 Aug 2022 19:49:04 +0000
Received: by outflank-mailman (input) for mailman id 384000;
 Wed, 10 Aug 2022 19:49:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UxBI=YO=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1oLrhP-0007rn-AY
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 19:49:03 +0000
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [2607:f8b0:4864:20::834])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b1ebc2e-18e5-11ed-924f-1f966e50362f;
 Wed, 10 Aug 2022 21:49:01 +0200 (CEST)
Received: by mail-qt1-x834.google.com with SMTP id l5so5602918qtv.4
 for <xen-devel@lists.xenproject.org>; Wed, 10 Aug 2022 12:49:01 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:289e:b898:c7de:df6c])
 by smtp.gmail.com with ESMTPSA id
 bk9-20020a05620a1a0900b006b978b521c8sm520897qkb.69.2022.08.10.12.48.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 12:48:59 -0700 (PDT)
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
X-Inumbo-ID: 7b1ebc2e-18e5-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=SumqexTTCRqxobYVxQoizLalrVNYgAZFWBWnxLaSfUU=;
        b=O3R02hA7NmhxIqDrMeEBUTxbZLZtn7DIWAvSUoNFXQ3G5qQQ7LSvcdH281uucrfp7c
         lFhMYQaC6H5VGiq27S5mJIGWDm6nPZXkPEFCS+3yjpRkmxGV5svrnHUg+6kMTeW0rdx5
         /NKMEhvUzZVIdWCNoOI7FBs4X5g+MIteStBt58JP0Ya/p9CvYpDuiElkniJwpzn16pT8
         whpBxWtEiWpuEkRtdPDOP8yvoO/yhQ76A+3IxNX1AyK2OIjMbgJX4TUKuRN4txOXp5++
         LkiIW1AEYh2Er/B+1B2wfN6XO2KqnwodWBxpHrSlFRbOwRZPTZkt5WqslZ96p5U9sniq
         4wuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=SumqexTTCRqxobYVxQoizLalrVNYgAZFWBWnxLaSfUU=;
        b=POct13hKXoX59FETvLJeLkdOfwrw8URmiE2M0VOA2QJO1GhgCKFX625WX6HSr/A57I
         K50NKa41KCkrKELTh1LLmwgKD62OUpdnkUmTS47ykVjaesPEDJOEmS4lfE80MAT8/BA/
         gxVVsp0Xn++jlOgCq5WgacrqpQodsNDWfTgYzabYsZeDcmGfy50nRcHrkt7XejjWm8m3
         +0QtqwJLqutvbyuLlUK4kUvCnz7MqBPHVAdzqf7NPnXyHwyO4+/W+N15XVGBqfzlx5FI
         wrlP54vGSTPM5kNfEhNKvYMParu8Qnu30JNfQ28U7Uy/nzO2zIt+DvbSfVQcmI77QzW4
         OCng==
X-Gm-Message-State: ACgBeo1SrqEzqh5C+QmHIatY9q7tvHPiWxVMiHc7+dH55EEFRudXQ6uB
	HDvmhsVzKQFC/pAtt+UblUhJGz7kWoA=
X-Google-Smtp-Source: AA6agR5iS1H/EecYrydPcu8k+9OzkxsXICEcXw+79WbpyY1AwZ7Fd4FykCuXSCQF1u5TcGgw4uiD2A==
X-Received: by 2002:ac8:5fd1:0:b0:31f:31a6:55c0 with SMTP id k17-20020ac85fd1000000b0031f31a655c0mr25626552qta.506.1660160940152;
        Wed, 10 Aug 2022 12:49:00 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 2/3] xl/libxl: Add ability to specify SMBIOS strings
Date: Wed, 10 Aug 2022 15:48:26 -0400
Message-Id: <20220810194827.103428-3-jandryuk@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220810194827.103428-1-jandryuk@gmail.com>
References: <20220810194827.103428-1-jandryuk@gmail.com>
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
The rendered man page and html don't have a newline at then end of the
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
 docs/man/xl.cfg.5.pod.in             | 45 ++++++++++++++++++++++++
 tools/golang/xenlight/helpers.gen.go | 51 ++++++++++++++++++++++++++++
 tools/golang/xenlight/types.gen.go   | 27 +++++++++++++++
 tools/include/libxl.h                |  5 +++
 tools/libs/light/libxl_dom.c         | 20 +++++++++++
 tools/libs/light/libxl_types.idl     | 26 ++++++++++++++
 tools/xl/xl_parse.c                  | 44 +++++++++++++++++++++++-
 7 files changed, 217 insertions(+), 1 deletion(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 6d98d73d76..7edf5d23f3 100644
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
index 2abaab439c..9034933ea8 100644
--- a/tools/libs/light/libxl_dom.c
+++ b/tools/libs/light/libxl_dom.c
@@ -771,6 +771,26 @@ static int hvm_build_set_xs_values(libxl__gc *gc,
             goto err;
     }
 
+    for (int i = 0; i < info->u.hvm.num_smbios; i++) {
+        char *p;
+        path = GCSPRINTF("/local/domain/%d/"HVM_XS_BIOS_STRINGS"/%s", domid,
+                   libxl_smbios_type_to_string(info->u.hvm.smbios[i].key));
+
+        /* libxl defines are all "_", but the HVM_XS_ strings are "-". */
+        p = strrchr(path, '/');
+        for ( ; *p; p++) {
+            if (*p == '_')
+                *p = '-';
+        }
+
+        LOGD(DEBUG, domid, "Writing %d %s %s\n", i, path,
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
index 1b5381cef0..4f3f962773 100644
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
@@ -1783,6 +1784,47 @@ void parse_config_data(const char *config_source,
         xlu_cfg_replace_string(config, "acpi_firmware",
                                &b_info->u.hvm.acpi_firmware, 0);
 
+        switch (xlu_cfg_get_list(config, "smbios", &smbios, &num_smbios, 0))
+        {
+        case 0: /* Success */
+            b_info->u.hvm.num_smbios = num_smbios;
+            b_info->u.hvm.smbios = xcalloc(num_smbios, sizeof(libxl_smbios));
+            for (i = 0; i < num_smbios; i++) {
+                char *option_untrimmed, *value_untrimmed;
+                char *option, *value;
+                libxl_smbios_type v;
+
+                buf = xlu_cfg_get_listitem(smbios, i);
+                if (!buf) continue;
+
+                if (split_string_into_pair(buf, "=",
+                                           &option_untrimmed,
+                                           &value_untrimmed)) {
+                    fprintf(stderr, "xl: failed to split \"%s\" into pair\n",
+                            buf);
+                    exit(EXIT_FAILURE);
+                }
+                trim(isspace, option_untrimmed, &option);
+                trim(isspace, value_untrimmed, &value);
+
+                e = libxl_smbios_type_from_string(option, &v);
+                if (e) {
+                    fprintf(stderr,
+                            "xl: unknown smbios type '%s'\n",
+                            buf);
+                    exit(-ERROR_FAIL);
+                }
+
+                b_info->u.hvm.smbios[i].key = v;
+                b_info->u.hvm.smbios[i].value = value;
+            }
+            break;
+        case ESRCH: break; /* Option not present */
+        default:
+            fprintf(stderr,"xl: Unable to parse smbios options.\n");
+            exit(-ERROR_FAIL);
+        }
+
         if (!xlu_cfg_get_string(config, "ms_vm_genid", &buf, 0)) {
             if (!strcmp(buf, "generate")) {
                 e = libxl_ms_vm_genid_generate(ctx, &b_info->u.hvm.ms_vm_genid);
-- 
2.37.1


