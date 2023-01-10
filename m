Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C11663A05
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 08:32:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474312.735441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pF97b-000629-Ki; Tue, 10 Jan 2023 07:32:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474312.735441; Tue, 10 Jan 2023 07:32:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pF97b-0005tP-FW; Tue, 10 Jan 2023 07:32:35 +0000
Received: by outflank-mailman (input) for mailman id 474312;
 Tue, 10 Jan 2023 07:32:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tiyo=5H=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pF97Z-0005Lt-Kw
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 07:32:33 +0000
Received: from sonic307-54.consmr.mail.gq1.yahoo.com
 (sonic307-54.consmr.mail.gq1.yahoo.com [98.137.64.30])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f0ce17e0-90b8-11ed-91b6-6bf2151ebd3b;
 Tue, 10 Jan 2023 08:32:32 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic307.consmr.mail.gq1.yahoo.com with HTTP; Tue, 10 Jan 2023 07:32:29 +0000
Received: by hermes--production-ne1-7b69748c4d-bxfkx (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 00995f78f0d4fd001b9b8f1699ee7ed7; 
 Tue, 10 Jan 2023 07:32:23 +0000 (UTC)
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
X-Inumbo-ID: f0ce17e0-90b8-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1673335949; bh=uHirQOlWVuB6Lr5OlbeNFyBvByaNMmueHYWxVEP496s=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=Oy5ECqB7RYxQ0xeY4XwHq6G+IpuDYUzxomzFfXpdKV2LtdbwjeL9SXK/vXNrjubU6nMMkJ4n+OZrZEi14hoqkCQJ46oh+MKfExW2o1V4CLoRoBSMzglUgLRPp3LcH7mYBmvmuJaroqQcRgozg6CyZjq/ORQtcLEtawJhCq/KKQvVPDw/AfbZkPQYiwJS7531vFgL9yVD4YShHpk7uE2zQo+80xC2ogQ8Z0dm+D/qrKUCEMjsBJwHXf1FK5pZHgitc522JtJHhhqPTpDaFoy/tfvLHhF6tEgYb/dqEpFNUG65uuL1XXfqPelbUvdoKR4R2zN6j3RjLmURk8kDHF3j9A==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1673335949; bh=yjV/LpRrRp+Rn9XEJsZO0kH4qFFobZTwzfyhX1BZbge=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=TZcDZVjqG3+t0g2pfpzGnWXqRfH1Cc5fOII707cXJHnx1Q5brSzUiKUwRw7bEn2XcAXt+qfWazxqbGJ5Einu9fowzTvGQvi0M1ECq6JMxuDFcod+BhuyXtt30wRlx+77suhqBdSDYY7IZcC8aRFkCbrC9THGtUJWpC0wO+YPyEmqlQPeKh8hjTail0MdDVQ8YyzydYt32l8rnyWuutfyspYgsNoz33eOw7CYpisipMigeapZ2k7hN4ATrVdTusI4MVe4+AMd+e/Vpv8sio29lwrG+p2ZHo/gRoHnr6kavHHQVptvghGdyhan7ByQ+UnN7a/i3xe46E+djMTQwPNjNw==
X-YMail-OSG: yZ4M3AEVM1kN1QlAmfPoevpe4f29EyvqCohc3s_6hBnPd0be3FNSakkqdwsNxTR
 yAnQv0jlwMF9zdc_HKDnrSch4S16zjzvcfC6ii8WtwsxSKxcYEbLm7gfwQHoUVSkUmlzdSHjayXI
 Pofoud_gufFHy4Vm4lNqHacZxSLiimBnYNOCt3mj9SeqVjtAMoL4FpspAtHRozlrFT0eth.VS8wt
 5XkopSMS40ycAHezFpVOLstBQm5S1nsBm6HpP_wXLJ8QvDjFoDQTbjtMkObBgPXn1to3kjFFdrNS
 j4ojBx1GtxSFkMOwrqEgwzmSpRQPPIj7XLx4fRG0NtstD5MpuEE7mpQB1thHh0ZxMrTFnHp9EIPB
 SIKLNIvF5LRxiPKxAU6L2bW1JEtreokUghfMvj.gZrLRkuml5hBrVIF8EYgKLGJyS_2ly2uo8Ni.
 My3IPdifOnRpwTEAK9eiwWWw3adOvhddwxzo_L8Z4MnxqqnIdBhUGZVUCdE6AzVdxvYJc6M2vumG
 S4RsokRdqv4inDs892xy4oKN_LtkDakHtFjMyY9j4aZaBAhUHv2VUmWRtmmWxZYNAiew9r8Dlc4s
 Cna2.nOfSJ6H1lpVxGCxhFjmYapUgjJIRZkdvWbtmTMXnmk6.e1CxCXbLmdSMsO9ilA8O6e6v5Ud
 Q.rQXmdxlC4_Cr.IzQjqXRkUJx1T1R_TvV7OjiV192edsverOOsgxZNq5hDcyf0DayuAGK3Dq29Y
 xnlBvinG0leh39PAsR5zryrjswtbDAbT_dEkiHa.avWrWJvAg1XOJpdgSZSZ58mmZ0XYAt3pEyhK
 YCmvHDxP88woYb1v7fxu2pNHnQOxkiq3MJItb3eE9msDkeVaT5oEWfx7SPMwAauxLC6yRW3Cb1SP
 xtiEjAbKE0MMA60rDbECGg9btz0JHSb8vIna.RDTdcLjaoTSd1blgE7yQMexCUA7gTdv0zqoQoWU
 1FuRMYptn.U_S1H6dAChrdxTlAIeYbw8hvaxisP31pt0e0YWIma4AomHiBPij9tSNOKoiBxMqEgX
 yc1GEMR290QVCBedlaXWwOEOb4qrirUtW7T_Hmnyaf8QTM8DanS6aKtJ7DLv.ZXTf7GGT3MHUdDm
 PkNyr6WHOyabAUtPR5ay_e1k7XMZTu8WSwONg6RHkSxAKU96JCjIFcX0VEVouj4SYkL9a6Cc9qHZ
 d_fezAMX2.dSvDNMzP7Eq4GcfoWA8BT_cw.4VTVOlhHgiatCY5570Odn87zm6RAkZ613gwUpxxtI
 PnIIYRreVKwZih7ox0DnVZT5jwmdl3rXFUU5Ym6m8UWKCXmIB_OwvXqAWBFoXvg7REwzB4ob0Udu
 daKNOm.TN5LCdCrX6e.Vd89cGNtF_SxhkxtjBcBjWrPZhimn5AYMshcwwz4cb3vfLXxaiE_mdcoa
 ZZ.egpqNTgGF76H9uJRT7UkTTMy3TPNiN4d4YnQ1ffSLyrFumqv79HP9GUDYV6vjWGijmD2Kw5ZP
 JkHv.bpXU4KId7IgD3r6eg7oUmQhDXFJ.vnlCnw0ePWs9ktfddsLp5Qfd4.GRN0PswikgiZyhWm3
 1ABuE6m_8OdvZm5u3LsnbCKq0tv9E6P9VIvgHKk5X_YbKtBRp0G0GkSyLsz32Q4hrvBxNNSSBUF6
 LAPsA_cewW5m0_ZfKXohYeyWnX.pc3T.IMH2DCqd.9lz.PvIi2vhv0QIkpS.CrpYJG_9loDZGkTd
 AA2PMuntDqwW597eY0Y9H7CHxsH1d3UF8WSd4AbIXO1OB0JOuA8ux4ULj._oioDRaoDazgkCiiZS
 FZs51NOrV7IO.swtfcaw_j4dYkKE299YRbBeNGBk4WjgKzLAWIl9jgVdG9G8xkw5.wpHtt9Elatm
 5U_F8fe393Lm_C2kHNYtvd7ial8TQP.l9gJkck5I4K7r8rxxQRjYFhbqoRhijQSpCIJ8E0_ytXD0
 m4KpsJBzK16g4tCV7qW2BXDBauT7Rpa3jzTAFBjRTkbZEu192fWxc9iHkxCWFQgZeEk8Au8OmONH
 HJvNlWBdL.b52sRA1sIAxaq0dsvSQ6wua1mz27Bgy4XviOIEkB1UTePwqx3vYzyvpiOgQ1eCYu7N
 ek_dS.wInV9pcuwZSUD76MsF4jRAhqoEVGdW.bYi_pYblcf357H_6ucFw2wOSNVFguOYSM8g63Oe
 YZA4m1aJcLWAqU7zJc7HWPSrnMfXebmrijIA6h3Y7qSNegbG2IRGnnu1mil4FWtSBDTYjAN9E4EA
 -
X-Sonic-MF: <brchuckz@aim.com>
From: Chuck Zmudzinski <brchuckz@aol.com>
To: anthony.perard@citrix.com
Cc: xen-devel@lists.xenproject.org,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	qemu-devel@nongnu.org
Subject: [XEN PATCH v2 2/3] libxl/dm: Manage pci slot assignment for Intel IGD passthrough
Date: Tue, 10 Jan 2023 02:32:03 -0500
Message-Id: <76d06f5d01e01df316230def4f31037695f11c1a.1673300848.git.brchuckz@aol.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1673300848.git.brchuckz@aol.com>
References: <cover.1673300848.git.brchuckz@aol.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

By default, except for the ich9-usb-uhci device which libxl assigns to
slot 29 (0xid), libxl defers to qemu upstream's automatic slot assignment
process, which is simply to assign each emulated device to the next
available slot on the pci bus. With this default behavior, libxl and
qemu will not configure the Intel IGD correctly. Specifically, the Intel
IGD must be assigned to slot 2, but the current default behavior is to
assign one of the emulated devices to slot 2.

With this patch libxl uses qemu command line options to specify the slot
address of each pci device in the guest when gfx_passthru is enabled
for the Intel IGD. It uses the same simple algorithm of assigning the
next available slot, except that it starts with slot 3 instead of slot 2
for the emulated devices. This process of slot assignment aims to
simulate the behavior of existing machines as much as possible.

The default behavior (when igd gfx_passthru is disabled) of letting qemu
manage the slot addresses of emulated pci devices is preserved. The
patch also preserves the special treatment for the ich9 usb2 controller
(ich9-usb-ehci1) that libxl currently assigns to slot.function 29.7 and
the associated ich9-usb-uhciN devices to slot 29 (0x1d).

For future maintainance of this code, it is important that pci devices
that are managed by the libxl__build_device_model_args_new function
follow the logic of this patch and use the new local counter next_slot
to assign the slot address instead of letting upstream qemu assign the
slot if the guest is configured for Intel IGD passthrough, and preserve
the current behavior of letting qemu assign the slot address otherwise.

Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
---
The diff of this patch is easier to review if it is generated using
the -b (aka --ignore-space-change) option of diff/git-diff to filter
out some of the changes that are only due to white space.

This patch is difficult to verify for correctness without testing all
the devices that could be added by the libxl__build_device_model_args_new
function. There are 12 places where the addr=%x option needed to be
added to the arguments of the "-device" qemu option that adds an
emulated pci device which corresponds to at least 12 different devices
that could be affected by this patch if the patch contains mistakes
that the compiler did not notice. One mistake the compiler would not
notice is a missing next_slot++; statement that would result in qemu
trying to assign a device to a slot that is already assigned, which
is an error in qemu. I did enough tests to find some mistakes in the
patch which of course I fixed before submitting the patch. So I cannot
guarantee that there are not any other mistakes in the patch because
I don't have the resources to do the necessary testing of the many
possible configurations that could be affected by this patch.

v2: No changes to this patch since v1

 tools/libs/light/libxl_dm.c | 168 ++++++++++++++++++++++++++++++------
 1 file changed, 141 insertions(+), 27 deletions(-)

diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 2048815611..2720b5d4d0 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -1205,6 +1205,20 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
     const char *path, *chardev;
     bool is_stubdom = libxl_defbool_val(b_info->device_model_stubdomain);
     int rc;
+    int next_slot;
+    bool configure_pci_for_igd = false;
+    /*
+     * next_slot is only used when we need to configure the pci
+     * slots for the Intel IGD. Slot 2 will be for the Intel IGD.
+     */
+    next_slot = 3;
+    if (libxl_defbool_val(b_info->u.hvm.gfx_passthru)) {
+        enum libxl_gfx_passthru_kind gfx_passthru_kind =
+                        libxl__detect_gfx_passthru_kind(gc, guest_config);
+        if (gfx_passthru_kind == LIBXL_GFX_PASSTHRU_KIND_IGD) {
+            configure_pci_for_igd = true;
+        }
+    }
 
     dm_args = flexarray_make(gc, 16, 1);
     dm_envs = flexarray_make(gc, 16, 1);
@@ -1372,6 +1386,20 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
 
         if (b_info->cmdline)
             flexarray_vappend(dm_args, "-append", b_info->cmdline, NULL);
+        /*
+         * When the Intel IGD is configured for primary graphics
+         * passthrough, we need to manually add the xen platform
+         * device because the QEMU machine type is "pc". Add it first to
+         * simulate the behavior of the "xenfv" QEMU machine type which
+         * always adds the xen platform device first. But in this case it
+         * will be at slot 3 because we are reserving slot 2 for the IGD.
+         */
+        if (configure_pci_for_igd &&
+            libxl_defbool_val(b_info->u.hvm.xen_platform_pci)) {
+            flexarray_append_pair(dm_args, "-device",
+                        GCSPRINTF("xen-platform,addr=%x", next_slot));
+            next_slot++;
+        }
 
         /* Find out early if one of the disk is on the scsi bus and add a scsi
          * controller. This is done ahead to keep the same behavior as previous
@@ -1381,7 +1409,14 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
                 continue;
             }
             if (strncmp(disks[i].vdev, "sd", 2) == 0) {
-                flexarray_vappend(dm_args, "-device", "lsi53c895a", NULL);
+                if (configure_pci_for_igd) {
+                    flexarray_vappend(dm_args, "-device",
+                        GCSPRINTF("lsi53c895a,addr=%x", next_slot), NULL);
+                    next_slot++;
+                } else {
+                    flexarray_vappend(dm_args, "-device", "lsi53c895a",
+                                      NULL);
+                }
                 break;
             }
         }
@@ -1436,31 +1471,67 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
             flexarray_append(dm_args, "-spice");
             flexarray_append(dm_args, spiceoptions);
             if (libxl_defbool_val(b_info->u.hvm.spice.vdagent)) {
-                flexarray_vappend(dm_args, "-device", "virtio-serial",
-                    "-chardev", "spicevmc,id=vdagent,name=vdagent", "-device",
-                    "virtserialport,chardev=vdagent,name=com.redhat.spice.0",
-                    NULL);
+                if (configure_pci_for_igd) {
+                    flexarray_vappend(dm_args, "-device",
+                        GCSPRINTF("virtio-serial,addr=%x", next_slot),
+                        "-chardev", "spicevmc,id=vdagent,name=vdagent",
+                        "-device",
+                        "virtserialport,chardev=vdagent,name=com.redhat.spice.0",
+                        NULL);
+                next_slot++;
+                } else {
+                    flexarray_vappend(dm_args, "-device", "virtio-serial",
+                        "-chardev", "spicevmc,id=vdagent,name=vdagent",
+                        "-device",
+                        "virtserialport,chardev=vdagent,name=com.redhat.spice.0",
+                        NULL);
+                }
             }
         }
 
         switch (b_info->u.hvm.vga.kind) {
         case LIBXL_VGA_INTERFACE_TYPE_STD:
-            flexarray_append_pair(dm_args, "-device",
-                GCSPRINTF("VGA,vgamem_mb=%d",
-                libxl__sizekb_to_mb(b_info->video_memkb)));
+            if (configure_pci_for_igd) {
+                flexarray_append_pair(dm_args, "-device",
+                    GCSPRINTF("VGA,addr=%x,vgamem_mb=%d", next_slot,
+                    libxl__sizekb_to_mb(b_info->video_memkb)));
+                next_slot++;
+            } else {
+                flexarray_append_pair(dm_args, "-device",
+                    GCSPRINTF("VGA,vgamem_mb=%d",
+                    libxl__sizekb_to_mb(b_info->video_memkb)));
+            }
             break;
         case LIBXL_VGA_INTERFACE_TYPE_CIRRUS:
-            flexarray_append_pair(dm_args, "-device",
-                GCSPRINTF("cirrus-vga,vgamem_mb=%d",
-                libxl__sizekb_to_mb(b_info->video_memkb)));
+            if (configure_pci_for_igd) {
+                flexarray_append_pair(dm_args, "-device",
+                    GCSPRINTF("cirrus-vga,addr=%x,vgamem_mb=%d", next_slot,
+                    libxl__sizekb_to_mb(b_info->video_memkb)));
+                next_slot++;
+            } else {
+                flexarray_append_pair(dm_args, "-device",
+                    GCSPRINTF("cirrus-vga,vgamem_mb=%d",
+                    libxl__sizekb_to_mb(b_info->video_memkb)));
+            }
             break;
         case LIBXL_VGA_INTERFACE_TYPE_NONE:
             break;
         case LIBXL_VGA_INTERFACE_TYPE_QXL:
             /* QXL have 2 ram regions, ram and vram */
-            flexarray_append_pair(dm_args, "-device",
-                GCSPRINTF("qxl-vga,vram_size_mb=%"PRIu64",ram_size_mb=%"PRIu64,
-                (b_info->video_memkb/2/1024), (b_info->video_memkb/2/1024) ) );
+            if (configure_pci_for_igd) {
+                flexarray_append_pair(dm_args, "-device",
+                    GCSPRINTF("qxl-vga,addr=%x,vram_size_mb=%"PRIu64
+                    ",ram_size_mb=%"PRIu64, next_slot,
+                    (b_info->video_memkb/2/1024),
+                    (b_info->video_memkb/2/1024) ) );
+                next_slot++;
+            } else {
+                flexarray_append_pair(dm_args, "-device",
+                    GCSPRINTF("qxl-vga,vram_size_mb=%"PRIu64
+                    ",ram_size_mb=%"PRIu64,
+                    (b_info->video_memkb/2/1024),
+                    (b_info->video_memkb/2/1024) ) );
+            }
             break;
         default:
             LOGD(ERROR, guest_domid, "Invalid emulated video card specified");
@@ -1496,8 +1567,15 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
         } else if (b_info->u.hvm.usbversion) {
             switch (b_info->u.hvm.usbversion) {
             case 1:
-                flexarray_vappend(dm_args,
-                    "-device", "piix3-usb-uhci,id=usb", NULL);
+                if (configure_pci_for_igd) {
+                    flexarray_vappend(dm_args, "-device",
+                        GCSPRINTF("piix3-usb-uhci,addr=%x,id=usb",
+                                  next_slot), NULL);
+                    next_slot++;
+                } else {
+                    flexarray_vappend(dm_args,
+                        "-device", "piix3-usb-uhci,id=usb", NULL);
+                }
                 break;
             case 2:
                 flexarray_append_pair(dm_args, "-device",
@@ -1509,8 +1587,15 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
                         i, 2*(i-1), i-1));
                 break;
             case 3:
-                flexarray_vappend(dm_args,
-                    "-device", "nec-usb-xhci,id=usb", NULL);
+                if (configure_pci_for_igd) {
+                    flexarray_vappend(dm_args, "-device",
+                        GCSPRINTF("nec-usb-xhci,addr=%x,id=usb",
+                                  next_slot), NULL);
+                    next_slot++;
+                } else {
+                    flexarray_vappend(dm_args,
+                        "-device", "nec-usb-xhci,id=usb", NULL);
+                }
                 break;
             default:
                 LOGD(ERROR, guest_domid, "usbversion parameter is invalid, "
@@ -1542,8 +1627,15 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
 
             switch (soundhw) {
             case LIBXL__QEMU_SOUNDHW_HDA:
-                flexarray_vappend(dm_args, "-device", "intel-hda",
-                                  "-device", "hda-duplex", NULL);
+                if (configure_pci_for_igd) {
+                    flexarray_vappend(dm_args, "-device",
+                        GCSPRINTF("intel-hda,addr=%x", next_slot),
+                                   "-device", "hda-duplex", NULL);
+                    next_slot++;
+                } else {
+                    flexarray_vappend(dm_args, "-device", "intel-hda",
+                                      "-device", "hda-duplex", NULL);
+                }
                 break;
             default:
                 flexarray_append_pair(dm_args, "-device",
@@ -1573,10 +1665,18 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
                                                 guest_domid, nics[i].devid,
                                                 LIBXL_NIC_TYPE_VIF_IOEMU);
                 flexarray_append(dm_args, "-device");
-                flexarray_append(dm_args,
-                   GCSPRINTF("%s,id=nic%d,netdev=net%d,mac=%s",
-                             nics[i].model, nics[i].devid,
-                             nics[i].devid, smac));
+                if (configure_pci_for_igd) {
+                    flexarray_append(dm_args,
+                        GCSPRINTF("%s,addr=%x,id=nic%d,netdev=net%d,mac=%s",
+                                  nics[i].model, next_slot, nics[i].devid,
+                                  nics[i].devid, smac));
+                    next_slot++;
+                } else {
+                    flexarray_append(dm_args,
+                        GCSPRINTF("%s,id=nic%d,netdev=net%d,mac=%s",
+                                  nics[i].model, nics[i].devid,
+                                  nics[i].devid, smac));
+                }
                 flexarray_append(dm_args, "-netdev");
                 flexarray_append(dm_args,
                                  GCSPRINTF("type=tap,id=net%d,ifname=%s,"
@@ -1865,8 +1965,15 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
     if (b_info->type == LIBXL_DOMAIN_TYPE_HVM) {
         flexarray_append_pair(dm_envs, "XEN_DOMAIN_ID", GCSPRINTF("%d", guest_domid));
 
-        if (b_info->u.hvm.hdtype == LIBXL_HDTYPE_AHCI)
-            flexarray_append_pair(dm_args, "-device", "ahci,id=ahci0");
+        if (b_info->u.hvm.hdtype == LIBXL_HDTYPE_AHCI) {
+            if (configure_pci_for_igd) {
+                flexarray_append_pair(dm_args, "-device",
+                            GCSPRINTF("ahci,addr=%x,id=ahci0", next_slot));
+                next_slot++;
+            } else {
+                flexarray_append_pair(dm_args, "-device", "ahci,id=ahci0");
+            }
+        }
         for (i = 0; i < num_disks; i++) {
             int disk, part;
             int dev_number =
@@ -2043,7 +2150,14 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
         switch (b_info->u.hvm.vendor_device) {
         case LIBXL_VENDOR_DEVICE_XENSERVER:
             flexarray_append(dm_args, "-device");
-            flexarray_append(dm_args, "xen-pvdevice,device-id=0xc000");
+            if (configure_pci_for_igd) {
+                flexarray_append(dm_args,
+                GCSPRINTF("xen-pvdevice,addr=%x,device-id=0xc000",
+                           next_slot));
+                next_slot++;
+            } else {
+                flexarray_append(dm_args, "xen-pvdevice,device-id=0xc000");
+            }
             break;
         default:
             break;
-- 
2.39.0


