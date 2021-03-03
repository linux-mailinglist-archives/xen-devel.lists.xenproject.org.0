Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B60AE32ACCB
	for <lists+xen-devel@lfdr.de>; Wed,  3 Mar 2021 02:47:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92647.174676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHGbE-0008No-1W; Wed, 03 Mar 2021 01:46:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92647.174676; Wed, 03 Mar 2021 01:46:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHGbD-0008NG-UE; Wed, 03 Mar 2021 01:46:51 +0000
Received: by outflank-mailman (input) for mailman id 92647;
 Wed, 03 Mar 2021 01:46:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ma28=IB=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1lHGbB-000841-QS
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 01:46:49 +0000
Received: from mail-qv1-xf2b.google.com (unknown [2607:f8b0:4864:20::f2b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 09f5c152-e390-4f4d-b6f9-855b61d9817d;
 Wed, 03 Mar 2021 01:46:29 +0000 (UTC)
Received: by mail-qv1-xf2b.google.com with SMTP id dj14so3383347qvb.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Mar 2021 17:46:29 -0800 (PST)
Received: from six.home (cpe-67-241-56-252.twcny.res.rr.com. [67.241.56.252])
 by smtp.gmail.com with ESMTPSA id
 g21sm5406145qkk.72.2021.03.02.17.46.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 17:46:28 -0800 (PST)
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
X-Inumbo-ID: 09f5c152-e390-4f4d-b6f9-855b61d9817d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=V9qJff+98dFfqpPkCZweLxCXnXyOwxftISf2qu2jFAo=;
        b=nxoirzlyilLDZu27c+0cBEhVYn5Tx7APDjWJ+n0eC++T3KDUviuf+Pof+D3nV96SYH
         g3Lmx5Qfe6MDrgqGNHtoc+vpNzSLKkRBZytkaQw4a27AKat80mHXO8FIUwfnGrWtHqDl
         twL5deZRwi7HFx6kBLDmhCJBpFEztXl5k/kBb5zU4PYMnPPNG5misXwDaKdBbinBa1HJ
         +1OlGFTksjETj6OS4gYy3FEKeF6SFeMefODsvSq/UXL2XvbRWjVR3swZ2Zh4d4XKXfwb
         sDqGtzbbSA0eHIGIAjGsFhdVRMWJcZH49Nk0kDvVtg5UNFQ19n1za9fsMcTr53Ebewr8
         4PMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=V9qJff+98dFfqpPkCZweLxCXnXyOwxftISf2qu2jFAo=;
        b=B/ORSFj7SdOv1dyp2Cx9FMfwM6F/cTnok3I1SyHgm6g5pFgQQEI33AVO8fbVxDcgeQ
         e6jlNwvpULZWbru4xMl+EJzynlJ0pIP2lTCTVky8iMKj8R22s2l8YYOrsYiSZ5Rl1M88
         R4M3e+S7Dxvbx7Z8fdr3QM6edIr6OgvJGmip89/41I7QqOH175d3ICfhI3bAGnwk+EeN
         FORQT98j+PZEHC0GZHNwnPMkWr/IenT6Y78ZMRn9P5i85yS/zUkd74frUUcO+SbDssx1
         ZDH1EFQudDE34qnUvPbj9vhIYQKSAIFupRgAsxOJlODOW0G8EZU0Ylc8PkIF0/nZ1098
         Dthg==
X-Gm-Message-State: AOAM531Aus3d192BGF8yjl3EXPqoA5IriaJ/PrE4s7brwedNVb9FZqJT
	4V3tISows2eap0a+ie8IUqrpM1XLQfSwfw==
X-Google-Smtp-Source: ABdhPJwkoby6QITo+fIBUYiHPnnJPafLiAMpJzRHMV6/0hpALc44HUW6gmcA5Pyupn2SYcCLUh3Ttw==
X-Received: by 2002:ad4:542b:: with SMTP id g11mr6471580qvt.47.1614735989088;
        Tue, 02 Mar 2021 17:46:29 -0800 (PST)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.org
Cc: george.dunlap@citrix.com,
	Nick Rosbrook <rosbrookn@ainfosec.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [RFC v2 5/7] libxl: add device function definitions to libxl_types.idl
Date: Tue,  2 Mar 2021 20:46:17 -0500
Message-Id: <2cd96b7e884c6f0c2667ef7499ff7179b99ea635.1614734296.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1614734296.git.rosbrookn@ainfosec.com>
References: <cover.1614734296.git.rosbrookn@ainfosec.com>
In-Reply-To: <cover.1614734296.git.rosbrookn@ainfosec.com>
References: <cover.1614734296.git.rosbrookn@ainfosec.com>

Add definitions to libxl_type.idl for the device functions required by
each device. In addition, add a Builtin definition for libxl_asyncop_how,
since each device function requires this as a parameter.

This is still prepatory work, and a later commit will make use of these
new definitions to generate the code from gentypes.py.

Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
---
 tools/libs/light/libxl_types.idl | 202 +++++++++++++++++++++++++++++++
 1 file changed, 202 insertions(+)

diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 5b85a7419f..550af7a1c7 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -33,6 +33,8 @@ libxl_hwcap = Builtin("hwcap", passby=PASS_BY_REFERENCE, json_parse_type="JSON_A
 libxl_ms_vm_genid = Builtin("ms_vm_genid", passby=PASS_BY_REFERENCE, check_default_fn="libxl_ms_vm_genid_is_zero",
                             copy_fn="libxl_ms_vm_genid_copy")
 
+libxl_asyncop_how = Builtin("asyncop_how", passby=PASS_BY_CONST_REFERENCE)
+
 #
 # Specific integer types
 #
@@ -666,6 +668,24 @@ libxl_device_vfb = Struct("device_vfb", [
     ("keymap",        string),
     ])
 
+libxl_device_vfb_add = DeviceAddFunction("device_vfb_add",
+    device_param=("vfb", libxl_device_vfb),
+    extra_params=[("ao_how", libxl_asyncop_how)],
+    return_type=libxl_error
+)
+
+libxl_device_vfb_remove = DeviceRemoveFunction("device_vfb_remove",
+    device_param=("vfb", libxl_device_vfb),
+    extra_params=[("ao_how", libxl_asyncop_how)],
+    return_type=libxl_error
+)
+
+libxl_device_vfb_destroy = DeviceDestroyFunction("device_vfb_destroy",
+    device_param=("vfb", libxl_device_vfb),
+    extra_params=[("ao_how", libxl_asyncop_how)],
+    return_type=libxl_error
+)
+
 libxl_device_vkb = Struct("device_vkb", [
     ("backend_domid", libxl_domid),
     ("backend_domname", string),
@@ -684,6 +704,24 @@ libxl_device_vkb = Struct("device_vkb", [
     ("multi_touch_num_contacts", uint32)
     ])
 
+libxl_device_vkb_add = DeviceAddFunction("device_vkb_add",
+    device_param=("vkb", libxl_device_vkb),
+    extra_params=[("ao_how", libxl_asyncop_how)],
+    return_type=libxl_error
+)
+
+libxl_device_vkb_remove = DeviceRemoveFunction("device_vkb_remove",
+    device_param=("vkb", libxl_device_vkb),
+    extra_params=[("ao_how", libxl_asyncop_how)],
+    return_type=libxl_error
+)
+
+libxl_device_vkb_destroy = DeviceAddFunction("device_vkb_destroy",
+    device_param=("vkb", libxl_device_vkb),
+    extra_params=[("ao_how", libxl_asyncop_how)],
+    return_type=libxl_error
+)
+
 libxl_device_disk = Struct("device_disk", [
     ("backend_domid", libxl_domid),
     ("backend_domname", string),
@@ -708,6 +746,24 @@ libxl_device_disk = Struct("device_disk", [
     ("hidden_disk", string)
     ])
 
+libxl_device_disk_add = DeviceAddFunction("device_disk_add",
+    device_param=("disk", libxl_device_disk),
+    extra_params=[("ao_how", libxl_asyncop_how)],
+    return_type=libxl_error
+)
+
+libxl_device_disk_remove = DeviceRemoveFunction("device_disk_remove",
+    device_param=("disk", libxl_device_disk),
+    extra_params=[("ao_how", libxl_asyncop_how)],
+    return_type=libxl_error
+)
+
+libxl_device_disk_destroy = DeviceDestroyFunction("device_disk_destroy",
+    device_param=("disk", libxl_device_disk),
+    extra_params=[("ao_how", libxl_asyncop_how)],
+    return_type=libxl_error
+)
+
 libxl_device_nic = Struct("device_nic", [
     ("backend_domid", libxl_domid),
     ("backend_domname", string),
@@ -776,6 +832,24 @@ libxl_device_nic = Struct("device_nic", [
     ("colo_checkpoint_port", string)
     ])
 
+libxl_device_nic_add = DeviceAddFunction("device_nic_add",
+    device_param=("nic", libxl_device_nic),
+    extra_params=[("ao_how", libxl_asyncop_how)],
+    return_type=libxl_error
+)
+
+libxl_device_nic_remove = DeviceRemoveFunction("device_nic_remove",
+    device_param=("nic", libxl_device_nic),
+    extra_params=[("ao_how", libxl_asyncop_how)],
+    return_type=libxl_error
+)
+
+libxl_device_nic_destroy = DeviceDestroyFunction("device_nic_destroy",
+    device_param=("nic", libxl_device_nic),
+    extra_params=[("ao_how", libxl_asyncop_how)],
+    return_type=libxl_error
+)
+
 libxl_device_pci = Struct("device_pci", [
     ("func", uint8),
     ("dev", uint8),
@@ -791,6 +865,24 @@ libxl_device_pci = Struct("device_pci", [
     ("name", string),
     ])
 
+libxl_device_pci_add = DeviceAddFunction("device_pci_add",
+    device_param=("pci", libxl_device_pci),
+    extra_params=[("ao_how", libxl_asyncop_how)],
+    return_type=libxl_error
+)
+
+libxl_device_pci_remove = DeviceRemoveFunction("device_pci_remove",
+    device_param=("pci", libxl_device_pci),
+    extra_params=[("ao_how", libxl_asyncop_how)],
+    return_type=libxl_error
+)
+
+libxl_device_pci_destroy = DeviceDestroyFunction("device_pci_destroy",
+    device_param=("pci", libxl_device_pci),
+    extra_params=[("ao_how", libxl_asyncop_how)],
+    return_type=libxl_error
+)
+
 libxl_device_rdm = Struct("device_rdm", [
     ("start", uint64),
     ("size", uint64),
@@ -817,6 +909,26 @@ libxl_device_usbctrl = Struct("device_usbctrl", [
     ("backend_domname", string),
    ])
 
+libxl_device_usbctrl_add = DeviceAddFunction("device_usbctrl_add",
+    device_param=("usbctrl", libxl_device_usbctrl),
+    extra_params=[("ao_how", libxl_asyncop_how)],
+    return_type=libxl_error
+)
+
+libxl_device_usbctrl_remove = DeviceRemoveFunction("device_usbctrl_remove",
+    device_param=("usbctrl", libxl_device_usbctrl),
+    extra_params=[("ao_how", libxl_asyncop_how)],
+    return_type=libxl_error,
+    custom_remove="usbctrl"
+)
+
+libxl_device_usbctrl_destroy = DeviceDestroyFunction("device_usbctrl_destroy",
+    device_param=("usbctrl", libxl_device_usbctrl),
+    extra_params=[("ao_how", libxl_asyncop_how)],
+    return_type=libxl_error,
+    custom_remove="usbctrl"
+)
+
 libxl_device_usbdev = Struct("device_usbdev", [
     ("ctrl", libxl_devid),
     ("port", integer),
@@ -827,6 +939,18 @@ libxl_device_usbdev = Struct("device_usbdev", [
            ])),
     ])
 
+libxl_device_usbdev_add = DeviceAddFunction("device_usbdev_add",
+    device_param=("usbdev", libxl_device_usbdev),
+    extra_params=[("ao_how", libxl_asyncop_how)],
+    return_type=libxl_error
+)
+
+libxl_device_usbdev_remove = DeviceRemoveFunction("device_usbdev_remove",
+    device_param=("usbdev", libxl_device_usbdev),
+    extra_params=[("ao_how", libxl_asyncop_how)],
+    return_type=libxl_error
+)
+
 libxl_device_dtdev = Struct("device_dtdev", [
     ("path", string),
     ])
@@ -838,6 +962,24 @@ libxl_device_vtpm = Struct("device_vtpm", [
     ("uuid",             libxl_uuid),
 ])
 
+libxl_device_vtpm_add = DeviceAddFunction("device_vtpm_add",
+    device_param=("vtpm", libxl_device_vtpm),
+    extra_params=[("ao_how", libxl_asyncop_how)],
+    return_type=libxl_error
+)
+
+libxl_device_vtpm_remove = DeviceRemoveFunction("device_vtpm_remove",
+    device_param=("vtpm", libxl_device_vtpm),
+    extra_params=[("ao_how", libxl_asyncop_how)],
+    return_type=libxl_error
+)
+
+libxl_device_vtpm_destroy = DeviceDestroyFunction("device_vtpm_destroy",
+    device_param=("vtpm", libxl_device_vtpm),
+    extra_params=[("ao_how", libxl_asyncop_how)],
+    return_type=libxl_error
+)
+
 libxl_device_p9 = Struct("device_p9", [
     ("backend_domid",    libxl_domid),
     ("backend_domname",  string),
@@ -847,12 +989,36 @@ libxl_device_p9 = Struct("device_p9", [
     ("devid",            libxl_devid),
 ])
 
+libxl_device_p9_remove = DeviceRemoveFunction("device_p9_remove",
+    device_param=("p9", libxl_device_p9),
+    extra_params=[("ao_how", libxl_asyncop_how)],
+    return_type=libxl_error
+)
+
+libxl_device_p9_destroy = DeviceDestroyFunction("device_p9_destroy",
+    device_param=("p9", libxl_device_p9),
+    extra_params=[("ao_how", libxl_asyncop_how)],
+    return_type=libxl_error
+)
+
 libxl_device_pvcallsif = Struct("device_pvcallsif", [
     ("backend_domid",    libxl_domid),
     ("backend_domname",  string),
     ("devid",            libxl_devid),
 ])
 
+libxl_device_pvcallsif_remove = DeviceRemoveFunction("device_pvcallsif_remove",
+    device_param=("pvcallsif", libxl_device_pvcallsif),
+    extra_params=[("ao_how", libxl_asyncop_how)],
+    return_type=libxl_error
+)
+
+libxl_device_pvcallsif_destroy = DeviceDestroyFunction("device_pvcallsif_destroy",
+    device_param=("pvcallsif", libxl_device_pvcallsif),
+    extra_params=[("ao_how", libxl_asyncop_how)],
+    return_type=libxl_error
+)
+
 libxl_device_channel = Struct("device_channel", [
     ("backend_domid", libxl_domid),
     ("backend_domname", string),
@@ -879,6 +1045,24 @@ libxl_device_vdispl = Struct("device_vdispl", [
     ("connectors", Array(libxl_connector_param, "num_connectors"))
     ])
 
+libxl_device_vdispl_add = DeviceAddFunction("device_vdispl_add",
+    device_param=("vdispl", libxl_device_vdispl),
+    extra_params=[("ao_how", libxl_asyncop_how)],
+    return_type=libxl_error
+)
+
+libxl_device_vdispl_remove = DeviceRemoveFunction("device_vdispl_remove",
+    device_param=("vdispl", libxl_device_vdispl),
+    extra_params=[("ao_how", libxl_asyncop_how)],
+    return_type=libxl_error
+)
+
+libxl_device_vdispl_destroy = DeviceDestroyFunction("device_vdispl_destroy",
+    device_param=("vdispl", libxl_device_vdispl),
+    extra_params=[("ao_how", libxl_asyncop_how)],
+    return_type=libxl_error
+)
+
 libxl_vsnd_pcm_format = Enumeration("vsnd_pcm_format", [
     (1,  "S8"),
     (2,  "U8"),
@@ -942,6 +1126,24 @@ libxl_device_vsnd = Struct("device_vsnd", [
     ("pcms", Array(libxl_vsnd_pcm, "num_vsnd_pcms"))
     ])
 
+libxl_device_vsnd_add = DeviceAddFunction("device_vsnd_add",
+    device_param=("vsnd", libxl_device_vsnd),
+    extra_params=[("ao_how", libxl_asyncop_how)],
+    return_type=libxl_error
+)
+
+libxl_device_vsnd_remove = DeviceRemoveFunction("device_vsnd_remove",
+    device_param=("vsnd", libxl_device_vsnd),
+    extra_params=[("ao_how", libxl_asyncop_how)],
+    return_type=libxl_error
+)
+
+libxl_device_vsnd_destroy = DeviceDestroyFunction("device_vsnd_destroy",
+    device_param=("vsnd", libxl_device_vsnd),
+    extra_params=[("ao_how", libxl_asyncop_how)],
+    return_type=libxl_error
+)
+
 libxl_domain_config = Struct("domain_config", [
     ("c_info", libxl_domain_create_info),
     ("b_info", libxl_domain_build_info),
-- 
2.17.1


