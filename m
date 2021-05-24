Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2755B38F47F
	for <lists+xen-devel@lfdr.de>; Mon, 24 May 2021 22:38:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.131880.246295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llHKn-0002h8-WE; Mon, 24 May 2021 20:37:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 131880.246295; Mon, 24 May 2021 20:37:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llHKn-0002dN-RP; Mon, 24 May 2021 20:37:57 +0000
Received: by outflank-mailman (input) for mailman id 131880;
 Mon, 24 May 2021 20:37:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+P1=KT=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1llHKl-0001ey-Rt
 for xen-devel@lists.xenproject.org; Mon, 24 May 2021 20:37:55 +0000
Received: from mail-qt1-x835.google.com (unknown [2607:f8b0:4864:20::835])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c2118e63-7738-4f41-97de-3c3d00227708;
 Mon, 24 May 2021 20:37:43 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id i12so2053527qtr.7
 for <xen-devel@lists.xenproject.org>; Mon, 24 May 2021 13:37:43 -0700 (PDT)
Received: from localhost.localdomain (c-73-89-138-5.hsd1.vt.comcast.net.
 [73.89.138.5])
 by smtp.gmail.com with ESMTPSA id t25sm5142847qkt.62.2021.05.24.13.37.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 13:37:42 -0700 (PDT)
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
X-Inumbo-ID: c2118e63-7738-4f41-97de-3c3d00227708
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=uzJn8fV3EdSO38YaBLqYQLo0qSO3Ncl/nRlIGcswrmU=;
        b=PbqQkJ0hFYrSz/TATustRcgG2UbhpX19aadQxqd9njd05JuntAcPVgWMSMBe29gEJK
         CcMReC7IcnZUtLa+I+fzo+scENB89+P24hB4fxRa+3PSM7qlEPevfzSgPWYS6DH0Mb8e
         plNHyCCEq0OEq/CRoNGjPvUx6WuifULGO62ffpEAXGmOFWcJXKhxGF+MtIi7vQ/rm3Nm
         U10tQXpjwBVscDM9KZ0YyZ0uo8zjg4geNQ5IoysyoFJDCHMScaAUgm0kdH+spVBOLXfv
         sPaBSqaZt+16Ry1M/OQO7FBa+RFlEqZti2zxwTYozEk41Ca5eGd5Et8iwr/V7E5w0JI9
         pSlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=uzJn8fV3EdSO38YaBLqYQLo0qSO3Ncl/nRlIGcswrmU=;
        b=Wyt6uMLRX9S/ZEO2DVEh4P7j/X8skW6AKwWmeIz0nEl7SgRHS7/dbSMTX3HKKNWx9Z
         SzvBwIUyOBWy2qfOBfSI3iO9kk1lkNtH+Tw0uAuqaY14KtO5Vhl7/VeqNR6Grtx9lLxJ
         7/X1RTyB9HGrkoHuB9/0mAwSokSWj4seQbeBdBY3LpCKpOk9eDfDPVQCVNItULUe5DmB
         wTBAQgh0E1uEvmEbrjrFJL4wdi9uQsE9DZr+9Ilx7m3HC6Tdf5isZqywt1xNxqjnFcRk
         OBo9/U2vQp6xJ+hXwIziVybT7sDb6Ogff6/qEaS66OJaexMQoV6JmSFGLnvk37khjU05
         2HZA==
X-Gm-Message-State: AOAM531s2AwTQ2LYC6wPmirFEG6NNxT2nA4GsSztoU2LT9NkfUkGN8sa
	ImA1N/HECPbWEGgD575ekZdtu1fDgN0=
X-Google-Smtp-Source: ABdhPJyWcoigwKqIU6gEAnW4NBwEWCq09Refxst0zE2koG6GhY4k6z/eLqLY7AK5dmD4+wsBteUUGg==
X-Received: by 2002:ac8:1483:: with SMTP id l3mr28238595qtj.142.1621888662674;
        Mon, 24 May 2021 13:37:42 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.prg,
	xen-devel@lists.xenproject.org
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [RESEND PATCH 03/12] golang/xenlight: fix string conversion in generated toC functions
Date: Mon, 24 May 2021 16:36:44 -0400
Message-Id: <06763aceff41167d3d3bbd603f729572c1f55c77.1621887506.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1621887506.git.rosbrookn@ainfosec.com>
References: <cover.1621887506.git.rosbrookn@ainfosec.com>
In-Reply-To: <cover.1621887506.git.rosbrookn@ainfosec.com>
References: <cover.1621887506.git.rosbrookn@ainfosec.com>

In gengotypes.py, the toC functions only set C string fields when
the Go strings are non-empty. However, to prevent segfaults in some
cases, these fields should always at least be set to nil so that the C
memory is zeroed out.

Update gengotypes.py so that the generated code always sets these fields
to nil first, and then proceeds to check if the Go string is non-empty.
And, commit the new generated code.

Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
---
 tools/golang/xenlight/gengotypes.py  |   1 +
 tools/golang/xenlight/helpers.gen.go | 160 +++++++++++++++++++++++++++
 2 files changed, 161 insertions(+)

diff --git a/tools/golang/xenlight/gengotypes.py b/tools/golang/xenlight/gengotypes.py
index 3e40c3d5dc..e6daa9b92f 100644
--- a/tools/golang/xenlight/gengotypes.py
+++ b/tools/golang/xenlight/gengotypes.py
@@ -527,6 +527,7 @@ def xenlight_golang_convert_to_C(ty = None, outer_name = None,
 
     elif gotypename == 'string':
         # Use the cgo helper for converting C strings.
+        s += '{0}.{1} = nil\n'.format(cvarname, cname)
         s += 'if {0}.{1} != "" {{\n'.format(govarname,goname)
         s += '{0}.{1} = C.CString({2}.{3})}}\n'.format(cvarname,cname,
                                                    govarname,goname)
diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index b454b12d52..5222898fb8 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -154,8 +154,10 @@ C.libxl_vnc_info_dispose(xc)}
 if err := x.Enable.toC(&xc.enable); err != nil {
 return fmt.Errorf("converting field Enable: %v", err)
 }
+xc.listen = nil
 if x.Listen != "" {
 xc.listen = C.CString(x.Listen)}
+xc.passwd = nil
 if x.Passwd != "" {
 xc.passwd = C.CString(x.Passwd)}
 xc.display = C.int(x.Display)
@@ -216,11 +218,13 @@ return fmt.Errorf("converting field Enable: %v", err)
 }
 xc.port = C.int(x.Port)
 xc.tls_port = C.int(x.TlsPort)
+xc.host = nil
 if x.Host != "" {
 xc.host = C.CString(x.Host)}
 if err := x.DisableTicketing.toC(&xc.disable_ticketing); err != nil {
 return fmt.Errorf("converting field DisableTicketing: %v", err)
 }
+xc.passwd = nil
 if x.Passwd != "" {
 xc.passwd = C.CString(x.Passwd)}
 if err := x.AgentMouse.toC(&xc.agent_mouse); err != nil {
@@ -233,8 +237,10 @@ if err := x.ClipboardSharing.toC(&xc.clipboard_sharing); err != nil {
 return fmt.Errorf("converting field ClipboardSharing: %v", err)
 }
 xc.usbredirection = C.int(x.Usbredirection)
+xc.image_compression = nil
 if x.ImageCompression != "" {
 xc.image_compression = C.CString(x.ImageCompression)}
+xc.streaming_video = nil
 if x.StreamingVideo != "" {
 xc.streaming_video = C.CString(x.StreamingVideo)}
 
@@ -278,8 +284,10 @@ return fmt.Errorf("converting field Enable: %v", err)
 if err := x.Opengl.toC(&xc.opengl); err != nil {
 return fmt.Errorf("converting field Opengl: %v", err)
 }
+xc.display = nil
 if x.Display != "" {
 xc.display = C.CString(x.Display)}
+xc.xauthority = nil
 if x.Xauthority != "" {
 xc.xauthority = C.CString(x.Xauthority)}
 
@@ -337,6 +345,7 @@ return fmt.Errorf("converting field Uuid: %v", err)
 }
 xc.domid = C.libxl_domid(x.Domid)
 xc.ssidref = C.uint32_t(x.Ssidref)
+xc.ssid_label = nil
 if x.SsidLabel != "" {
 xc.ssid_label = C.CString(x.SsidLabel)}
 xc.running = C.bool(x.Running)
@@ -391,6 +400,7 @@ C.libxl_cpupoolinfo_dispose(xc)}
 }()
 
 xc.poolid = C.uint32_t(x.Poolid)
+xc.pool_name = nil
 if x.PoolName != "" {
 xc.pool_name = C.CString(x.PoolName)}
 xc.sched = C.libxl_scheduler(x.Sched)
@@ -458,9 +468,11 @@ if err != nil{
 C.libxl_channelinfo_dispose(xc)}
 }()
 
+xc.backend = nil
 if x.Backend != "" {
 xc.backend = C.CString(x.Backend)}
 xc.backend_id = C.uint32_t(x.BackendId)
+xc.frontend = nil
 if x.Frontend != "" {
 xc.frontend = C.CString(x.Frontend)}
 xc.frontend_id = C.uint32_t(x.FrontendId)
@@ -478,6 +490,7 @@ if !ok {
 return errors.New("wrong type for union key connection")
 }
 var pty C.libxl_channelinfo_connection_union_pty
+pty.path = nil
 if tmp.Path != "" {
 pty.path = C.CString(tmp.Path)}
 ptyBytes := C.GoBytes(unsafe.Pointer(&pty),C.sizeof_libxl_channelinfo_connection_union_pty)
@@ -563,24 +576,33 @@ C.libxl_version_info_dispose(xc)}
 
 xc.xen_version_major = C.int(x.XenVersionMajor)
 xc.xen_version_minor = C.int(x.XenVersionMinor)
+xc.xen_version_extra = nil
 if x.XenVersionExtra != "" {
 xc.xen_version_extra = C.CString(x.XenVersionExtra)}
+xc.compiler = nil
 if x.Compiler != "" {
 xc.compiler = C.CString(x.Compiler)}
+xc.compile_by = nil
 if x.CompileBy != "" {
 xc.compile_by = C.CString(x.CompileBy)}
+xc.compile_domain = nil
 if x.CompileDomain != "" {
 xc.compile_domain = C.CString(x.CompileDomain)}
+xc.compile_date = nil
 if x.CompileDate != "" {
 xc.compile_date = C.CString(x.CompileDate)}
+xc.capabilities = nil
 if x.Capabilities != "" {
 xc.capabilities = C.CString(x.Capabilities)}
+xc.changeset = nil
 if x.Changeset != "" {
 xc.changeset = C.CString(x.Changeset)}
 xc.virt_start = C.uint64_t(x.VirtStart)
 xc.pagesize = C.int(x.Pagesize)
+xc.commandline = nil
 if x.Commandline != "" {
 xc.commandline = C.CString(x.Commandline)}
+xc.build_id = nil
 if x.BuildId != "" {
 xc.build_id = C.CString(x.BuildId)}
 
@@ -650,8 +672,10 @@ if err := x.Oos.toC(&xc.oos); err != nil {
 return fmt.Errorf("converting field Oos: %v", err)
 }
 xc.ssidref = C.uint32_t(x.Ssidref)
+xc.ssid_label = nil
 if x.SsidLabel != "" {
 xc.ssid_label = C.CString(x.SsidLabel)}
+xc.name = nil
 if x.Name != "" {
 xc.name = C.CString(x.Name)}
 xc.domid = C.libxl_domid(x.Domid)
@@ -665,6 +689,7 @@ if err := x.Platformdata.toC(&xc.platformdata); err != nil {
 return fmt.Errorf("converting field Platformdata: %v", err)
 }
 xc.poolid = C.uint32_t(x.Poolid)
+xc.pool_name = nil
 if x.PoolName != "" {
 xc.pool_name = C.CString(x.PoolName)}
 if err := x.RunHotplugScripts.toC(&xc.run_hotplug_scripts); err != nil {
@@ -712,6 +737,7 @@ C.libxl_domain_restore_params_dispose(xc)}
 
 xc.checkpointed_stream = C.int(x.CheckpointedStream)
 xc.stream_version = C.uint32_t(x.StreamVersion)
+xc.colo_proxy_script = nil
 if x.ColoProxyScript != "" {
 xc.colo_proxy_script = C.CString(x.ColoProxyScript)}
 if err := x.UserspaceColoProxy.toC(&xc.userspace_colo_proxy); err != nil {
@@ -1312,6 +1338,7 @@ xc.shadow_memkb = C.uint64_t(x.ShadowMemkb)
 xc.iommu_memkb = C.uint64_t(x.IommuMemkb)
 xc.rtc_timeoffset = C.uint32_t(x.RtcTimeoffset)
 xc.exec_ssidref = C.uint32_t(x.ExecSsidref)
+xc.exec_ssid_label = nil
 if x.ExecSsidLabel != "" {
 xc.exec_ssid_label = C.CString(x.ExecSsidLabel)}
 if err := x.Localtime.toC(&xc.localtime); err != nil {
@@ -1323,6 +1350,7 @@ return fmt.Errorf("converting field DisableMigrate: %v", err)
 if err := x.Cpuid.toC(&xc.cpuid); err != nil {
 return fmt.Errorf("converting field Cpuid: %v", err)
 }
+xc.blkdev_start = nil
 if x.BlkdevStart != "" {
 xc.blkdev_start = C.CString(x.BlkdevStart)}
 if numVnumaNodes := len(x.VnumaNodes); numVnumaNodes > 0 {
@@ -1342,15 +1370,20 @@ if err := x.DeviceModelStubdomain.toC(&xc.device_model_stubdomain); err != nil {
 return fmt.Errorf("converting field DeviceModelStubdomain: %v", err)
 }
 xc.stubdomain_memkb = C.uint64_t(x.StubdomainMemkb)
+xc.stubdomain_kernel = nil
 if x.StubdomainKernel != "" {
 xc.stubdomain_kernel = C.CString(x.StubdomainKernel)}
+xc.stubdomain_ramdisk = nil
 if x.StubdomainRamdisk != "" {
 xc.stubdomain_ramdisk = C.CString(x.StubdomainRamdisk)}
+xc.device_model = nil
 if x.DeviceModel != "" {
 xc.device_model = C.CString(x.DeviceModel)}
 xc.device_model_ssidref = C.uint32_t(x.DeviceModelSsidref)
+xc.device_model_ssid_label = nil
 if x.DeviceModelSsidLabel != "" {
 xc.device_model_ssid_label = C.CString(x.DeviceModelSsidLabel)}
+xc.device_model_user = nil
 if x.DeviceModelUser != "" {
 xc.device_model_user = C.CString(x.DeviceModelUser)}
 if err := x.Extra.toC(&xc.extra); err != nil {
@@ -1397,17 +1430,22 @@ if err := x.ClaimMode.toC(&xc.claim_mode); err != nil {
 return fmt.Errorf("converting field ClaimMode: %v", err)
 }
 xc.event_channels = C.uint32_t(x.EventChannels)
+xc.kernel = nil
 if x.Kernel != "" {
 xc.kernel = C.CString(x.Kernel)}
+xc.cmdline = nil
 if x.Cmdline != "" {
 xc.cmdline = C.CString(x.Cmdline)}
+xc.ramdisk = nil
 if x.Ramdisk != "" {
 xc.ramdisk = C.CString(x.Ramdisk)}
+xc.device_tree = nil
 if x.DeviceTree != "" {
 xc.device_tree = C.CString(x.DeviceTree)}
 if err := x.Acpi.toC(&xc.acpi); err != nil {
 return fmt.Errorf("converting field Acpi: %v", err)
 }
+xc.bootloader = nil
 if x.Bootloader != "" {
 xc.bootloader = C.CString(x.Bootloader)}
 if err := x.BootloaderArgs.toC(&xc.bootloader_args); err != nil {
@@ -1432,6 +1470,7 @@ if !ok {
 return errors.New("wrong type for union key type")
 }
 var hvm C.libxl_domain_build_info_type_union_hvm
+hvm.firmware = nil
 if tmp.Firmware != "" {
 hvm.firmware = C.CString(tmp.Firmware)}
 hvm.bios = C.libxl_bios_type(tmp.Bios)
@@ -1465,6 +1504,7 @@ return fmt.Errorf("converting field ViridianEnable: %v", err)
 if err := tmp.ViridianDisable.toC(&hvm.viridian_disable); err != nil {
 return fmt.Errorf("converting field ViridianDisable: %v", err)
 }
+hvm.timeoffset = nil
 if tmp.Timeoffset != "" {
 hvm.timeoffset = C.CString(tmp.Timeoffset)}
 if err := tmp.Hpet.toC(&hvm.hpet); err != nil {
@@ -1481,10 +1521,13 @@ return fmt.Errorf("converting field NestedHvm: %v", err)
 if err := tmp.Altp2M.toC(&hvm.altp2m); err != nil {
 return fmt.Errorf("converting field Altp2M: %v", err)
 }
+hvm.system_firmware = nil
 if tmp.SystemFirmware != "" {
 hvm.system_firmware = C.CString(tmp.SystemFirmware)}
+hvm.smbios_firmware = nil
 if tmp.SmbiosFirmware != "" {
 hvm.smbios_firmware = C.CString(tmp.SmbiosFirmware)}
+hvm.acpi_firmware = nil
 if tmp.AcpiFirmware != "" {
 hvm.acpi_firmware = C.CString(tmp.AcpiFirmware)}
 hvm.hdtype = C.libxl_hdtype(tmp.Hdtype)
@@ -1497,6 +1540,7 @@ return fmt.Errorf("converting field Vga: %v", err)
 if err := tmp.Vnc.toC(&hvm.vnc); err != nil {
 return fmt.Errorf("converting field Vnc: %v", err)
 }
+hvm.keymap = nil
 if tmp.Keymap != "" {
 hvm.keymap = C.CString(tmp.Keymap)}
 if err := tmp.Sdl.toC(&hvm.sdl); err != nil {
@@ -1509,19 +1553,23 @@ if err := tmp.GfxPassthru.toC(&hvm.gfx_passthru); err != nil {
 return fmt.Errorf("converting field GfxPassthru: %v", err)
 }
 hvm.gfx_passthru_kind = C.libxl_gfx_passthru_kind(tmp.GfxPassthruKind)
+hvm.serial = nil
 if tmp.Serial != "" {
 hvm.serial = C.CString(tmp.Serial)}
+hvm.boot = nil
 if tmp.Boot != "" {
 hvm.boot = C.CString(tmp.Boot)}
 if err := tmp.Usb.toC(&hvm.usb); err != nil {
 return fmt.Errorf("converting field Usb: %v", err)
 }
 hvm.usbversion = C.int(tmp.Usbversion)
+hvm.usbdevice = nil
 if tmp.Usbdevice != "" {
 hvm.usbdevice = C.CString(tmp.Usbdevice)}
 if err := tmp.VkbDevice.toC(&hvm.vkb_device); err != nil {
 return fmt.Errorf("converting field VkbDevice: %v", err)
 }
+hvm.soundhw = nil
 if tmp.Soundhw != "" {
 hvm.soundhw = C.CString(tmp.Soundhw)}
 if err := tmp.XenPlatformPci.toC(&hvm.xen_platform_pci); err != nil {
@@ -1550,18 +1598,23 @@ if !ok {
 return errors.New("wrong type for union key type")
 }
 var pv C.libxl_domain_build_info_type_union_pv
+pv.kernel = nil
 if tmp.Kernel != "" {
 pv.kernel = C.CString(tmp.Kernel)}
 pv.slack_memkb = C.uint64_t(tmp.SlackMemkb)
+pv.bootloader = nil
 if tmp.Bootloader != "" {
 pv.bootloader = C.CString(tmp.Bootloader)}
 if err := tmp.BootloaderArgs.toC(&pv.bootloader_args); err != nil {
 return fmt.Errorf("converting field BootloaderArgs: %v", err)
 }
+pv.cmdline = nil
 if tmp.Cmdline != "" {
 pv.cmdline = C.CString(tmp.Cmdline)}
+pv.ramdisk = nil
 if tmp.Ramdisk != "" {
 pv.ramdisk = C.CString(tmp.Ramdisk)}
+pv.features = nil
 if tmp.Features != "" {
 pv.features = C.CString(tmp.Features)}
 if err := tmp.E820Host.toC(&pv.e820_host); err != nil {
@@ -1578,10 +1631,13 @@ var pvh C.libxl_domain_build_info_type_union_pvh
 if err := tmp.Pvshim.toC(&pvh.pvshim); err != nil {
 return fmt.Errorf("converting field Pvshim: %v", err)
 }
+pvh.pvshim_path = nil
 if tmp.PvshimPath != "" {
 pvh.pvshim_path = C.CString(tmp.PvshimPath)}
+pvh.pvshim_cmdline = nil
 if tmp.PvshimCmdline != "" {
 pvh.pvshim_cmdline = C.CString(tmp.PvshimCmdline)}
+pvh.pvshim_extra = nil
 if tmp.PvshimExtra != "" {
 pvh.pvshim_extra = C.CString(tmp.PvshimExtra)}
 pvhBytes := C.GoBytes(unsafe.Pointer(&pvh),C.sizeof_libxl_domain_build_info_type_union_pvh)
@@ -1635,6 +1691,7 @@ C.libxl_device_vfb_dispose(xc)}
 }()
 
 xc.backend_domid = C.libxl_domid(x.BackendDomid)
+xc.backend_domname = nil
 if x.BackendDomname != "" {
 xc.backend_domname = C.CString(x.BackendDomname)}
 xc.devid = C.libxl_devid(x.Devid)
@@ -1644,6 +1701,7 @@ return fmt.Errorf("converting field Vnc: %v", err)
 if err := x.Sdl.toC(&xc.sdl); err != nil {
 return fmt.Errorf("converting field Sdl: %v", err)
 }
+xc.keymap = nil
 if x.Keymap != "" {
 xc.keymap = C.CString(x.Keymap)}
 
@@ -1689,10 +1747,12 @@ C.libxl_device_vkb_dispose(xc)}
 }()
 
 xc.backend_domid = C.libxl_domid(x.BackendDomid)
+xc.backend_domname = nil
 if x.BackendDomname != "" {
 xc.backend_domname = C.CString(x.BackendDomname)}
 xc.devid = C.libxl_devid(x.Devid)
 xc.backend_type = C.libxl_vkb_backend(x.BackendType)
+xc.unique_id = nil
 if x.UniqueId != "" {
 xc.unique_id = C.CString(x.UniqueId)}
 xc.feature_disable_keyboard = C.bool(x.FeatureDisableKeyboard)
@@ -1758,14 +1818,18 @@ C.libxl_device_disk_dispose(xc)}
 }()
 
 xc.backend_domid = C.libxl_domid(x.BackendDomid)
+xc.backend_domname = nil
 if x.BackendDomname != "" {
 xc.backend_domname = C.CString(x.BackendDomname)}
+xc.pdev_path = nil
 if x.PdevPath != "" {
 xc.pdev_path = C.CString(x.PdevPath)}
+xc.vdev = nil
 if x.Vdev != "" {
 xc.vdev = C.CString(x.Vdev)}
 xc.backend = C.libxl_disk_backend(x.Backend)
 xc.format = C.libxl_disk_format(x.Format)
+xc.script = nil
 if x.Script != "" {
 xc.script = C.CString(x.Script)}
 xc.removable = C.int(x.Removable)
@@ -1781,13 +1845,17 @@ return fmt.Errorf("converting field ColoEnable: %v", err)
 if err := x.ColoRestoreEnable.toC(&xc.colo_restore_enable); err != nil {
 return fmt.Errorf("converting field ColoRestoreEnable: %v", err)
 }
+xc.colo_host = nil
 if x.ColoHost != "" {
 xc.colo_host = C.CString(x.ColoHost)}
 xc.colo_port = C.int(x.ColoPort)
+xc.colo_export = nil
 if x.ColoExport != "" {
 xc.colo_export = C.CString(x.ColoExport)}
+xc.active_disk = nil
 if x.ActiveDisk != "" {
 xc.active_disk = C.CString(x.ActiveDisk)}
+xc.hidden_disk = nil
 if x.HiddenDisk != "" {
 xc.hidden_disk = C.CString(x.HiddenDisk)}
 
@@ -1883,124 +1951,180 @@ C.libxl_device_nic_dispose(xc)}
 }()
 
 xc.backend_domid = C.libxl_domid(x.BackendDomid)
+xc.backend_domname = nil
 if x.BackendDomname != "" {
 xc.backend_domname = C.CString(x.BackendDomname)}
 xc.devid = C.libxl_devid(x.Devid)
 xc.mtu = C.int(x.Mtu)
+xc.model = nil
 if x.Model != "" {
 xc.model = C.CString(x.Model)}
 if err := x.Mac.toC(&xc.mac); err != nil {
 return fmt.Errorf("converting field Mac: %v", err)
 }
+xc.ip = nil
 if x.Ip != "" {
 xc.ip = C.CString(x.Ip)}
+xc.bridge = nil
 if x.Bridge != "" {
 xc.bridge = C.CString(x.Bridge)}
+xc.ifname = nil
 if x.Ifname != "" {
 xc.ifname = C.CString(x.Ifname)}
+xc.script = nil
 if x.Script != "" {
 xc.script = C.CString(x.Script)}
 xc.nictype = C.libxl_nic_type(x.Nictype)
 xc.rate_bytes_per_interval = C.uint64_t(x.RateBytesPerInterval)
 xc.rate_interval_usecs = C.uint32_t(x.RateIntervalUsecs)
+xc.gatewaydev = nil
 if x.Gatewaydev != "" {
 xc.gatewaydev = C.CString(x.Gatewaydev)}
+xc.coloft_forwarddev = nil
 if x.ColoftForwarddev != "" {
 xc.coloft_forwarddev = C.CString(x.ColoftForwarddev)}
+xc.colo_sock_mirror_id = nil
 if x.ColoSockMirrorId != "" {
 xc.colo_sock_mirror_id = C.CString(x.ColoSockMirrorId)}
+xc.colo_sock_mirror_ip = nil
 if x.ColoSockMirrorIp != "" {
 xc.colo_sock_mirror_ip = C.CString(x.ColoSockMirrorIp)}
+xc.colo_sock_mirror_port = nil
 if x.ColoSockMirrorPort != "" {
 xc.colo_sock_mirror_port = C.CString(x.ColoSockMirrorPort)}
+xc.colo_sock_compare_pri_in_id = nil
 if x.ColoSockComparePriInId != "" {
 xc.colo_sock_compare_pri_in_id = C.CString(x.ColoSockComparePriInId)}
+xc.colo_sock_compare_pri_in_ip = nil
 if x.ColoSockComparePriInIp != "" {
 xc.colo_sock_compare_pri_in_ip = C.CString(x.ColoSockComparePriInIp)}
+xc.colo_sock_compare_pri_in_port = nil
 if x.ColoSockComparePriInPort != "" {
 xc.colo_sock_compare_pri_in_port = C.CString(x.ColoSockComparePriInPort)}
+xc.colo_sock_compare_sec_in_id = nil
 if x.ColoSockCompareSecInId != "" {
 xc.colo_sock_compare_sec_in_id = C.CString(x.ColoSockCompareSecInId)}
+xc.colo_sock_compare_sec_in_ip = nil
 if x.ColoSockCompareSecInIp != "" {
 xc.colo_sock_compare_sec_in_ip = C.CString(x.ColoSockCompareSecInIp)}
+xc.colo_sock_compare_sec_in_port = nil
 if x.ColoSockCompareSecInPort != "" {
 xc.colo_sock_compare_sec_in_port = C.CString(x.ColoSockCompareSecInPort)}
+xc.colo_sock_compare_notify_id = nil
 if x.ColoSockCompareNotifyId != "" {
 xc.colo_sock_compare_notify_id = C.CString(x.ColoSockCompareNotifyId)}
+xc.colo_sock_compare_notify_ip = nil
 if x.ColoSockCompareNotifyIp != "" {
 xc.colo_sock_compare_notify_ip = C.CString(x.ColoSockCompareNotifyIp)}
+xc.colo_sock_compare_notify_port = nil
 if x.ColoSockCompareNotifyPort != "" {
 xc.colo_sock_compare_notify_port = C.CString(x.ColoSockCompareNotifyPort)}
+xc.colo_sock_redirector0_id = nil
 if x.ColoSockRedirector0Id != "" {
 xc.colo_sock_redirector0_id = C.CString(x.ColoSockRedirector0Id)}
+xc.colo_sock_redirector0_ip = nil
 if x.ColoSockRedirector0Ip != "" {
 xc.colo_sock_redirector0_ip = C.CString(x.ColoSockRedirector0Ip)}
+xc.colo_sock_redirector0_port = nil
 if x.ColoSockRedirector0Port != "" {
 xc.colo_sock_redirector0_port = C.CString(x.ColoSockRedirector0Port)}
+xc.colo_sock_redirector1_id = nil
 if x.ColoSockRedirector1Id != "" {
 xc.colo_sock_redirector1_id = C.CString(x.ColoSockRedirector1Id)}
+xc.colo_sock_redirector1_ip = nil
 if x.ColoSockRedirector1Ip != "" {
 xc.colo_sock_redirector1_ip = C.CString(x.ColoSockRedirector1Ip)}
+xc.colo_sock_redirector1_port = nil
 if x.ColoSockRedirector1Port != "" {
 xc.colo_sock_redirector1_port = C.CString(x.ColoSockRedirector1Port)}
+xc.colo_sock_redirector2_id = nil
 if x.ColoSockRedirector2Id != "" {
 xc.colo_sock_redirector2_id = C.CString(x.ColoSockRedirector2Id)}
+xc.colo_sock_redirector2_ip = nil
 if x.ColoSockRedirector2Ip != "" {
 xc.colo_sock_redirector2_ip = C.CString(x.ColoSockRedirector2Ip)}
+xc.colo_sock_redirector2_port = nil
 if x.ColoSockRedirector2Port != "" {
 xc.colo_sock_redirector2_port = C.CString(x.ColoSockRedirector2Port)}
+xc.colo_filter_mirror_queue = nil
 if x.ColoFilterMirrorQueue != "" {
 xc.colo_filter_mirror_queue = C.CString(x.ColoFilterMirrorQueue)}
+xc.colo_filter_mirror_outdev = nil
 if x.ColoFilterMirrorOutdev != "" {
 xc.colo_filter_mirror_outdev = C.CString(x.ColoFilterMirrorOutdev)}
+xc.colo_filter_redirector0_queue = nil
 if x.ColoFilterRedirector0Queue != "" {
 xc.colo_filter_redirector0_queue = C.CString(x.ColoFilterRedirector0Queue)}
+xc.colo_filter_redirector0_indev = nil
 if x.ColoFilterRedirector0Indev != "" {
 xc.colo_filter_redirector0_indev = C.CString(x.ColoFilterRedirector0Indev)}
+xc.colo_filter_redirector0_outdev = nil
 if x.ColoFilterRedirector0Outdev != "" {
 xc.colo_filter_redirector0_outdev = C.CString(x.ColoFilterRedirector0Outdev)}
+xc.colo_filter_redirector1_queue = nil
 if x.ColoFilterRedirector1Queue != "" {
 xc.colo_filter_redirector1_queue = C.CString(x.ColoFilterRedirector1Queue)}
+xc.colo_filter_redirector1_indev = nil
 if x.ColoFilterRedirector1Indev != "" {
 xc.colo_filter_redirector1_indev = C.CString(x.ColoFilterRedirector1Indev)}
+xc.colo_filter_redirector1_outdev = nil
 if x.ColoFilterRedirector1Outdev != "" {
 xc.colo_filter_redirector1_outdev = C.CString(x.ColoFilterRedirector1Outdev)}
+xc.colo_compare_pri_in = nil
 if x.ColoComparePriIn != "" {
 xc.colo_compare_pri_in = C.CString(x.ColoComparePriIn)}
+xc.colo_compare_sec_in = nil
 if x.ColoCompareSecIn != "" {
 xc.colo_compare_sec_in = C.CString(x.ColoCompareSecIn)}
+xc.colo_compare_out = nil
 if x.ColoCompareOut != "" {
 xc.colo_compare_out = C.CString(x.ColoCompareOut)}
+xc.colo_compare_notify_dev = nil
 if x.ColoCompareNotifyDev != "" {
 xc.colo_compare_notify_dev = C.CString(x.ColoCompareNotifyDev)}
+xc.colo_sock_sec_redirector0_id = nil
 if x.ColoSockSecRedirector0Id != "" {
 xc.colo_sock_sec_redirector0_id = C.CString(x.ColoSockSecRedirector0Id)}
+xc.colo_sock_sec_redirector0_ip = nil
 if x.ColoSockSecRedirector0Ip != "" {
 xc.colo_sock_sec_redirector0_ip = C.CString(x.ColoSockSecRedirector0Ip)}
+xc.colo_sock_sec_redirector0_port = nil
 if x.ColoSockSecRedirector0Port != "" {
 xc.colo_sock_sec_redirector0_port = C.CString(x.ColoSockSecRedirector0Port)}
+xc.colo_sock_sec_redirector1_id = nil
 if x.ColoSockSecRedirector1Id != "" {
 xc.colo_sock_sec_redirector1_id = C.CString(x.ColoSockSecRedirector1Id)}
+xc.colo_sock_sec_redirector1_ip = nil
 if x.ColoSockSecRedirector1Ip != "" {
 xc.colo_sock_sec_redirector1_ip = C.CString(x.ColoSockSecRedirector1Ip)}
+xc.colo_sock_sec_redirector1_port = nil
 if x.ColoSockSecRedirector1Port != "" {
 xc.colo_sock_sec_redirector1_port = C.CString(x.ColoSockSecRedirector1Port)}
+xc.colo_filter_sec_redirector0_queue = nil
 if x.ColoFilterSecRedirector0Queue != "" {
 xc.colo_filter_sec_redirector0_queue = C.CString(x.ColoFilterSecRedirector0Queue)}
+xc.colo_filter_sec_redirector0_indev = nil
 if x.ColoFilterSecRedirector0Indev != "" {
 xc.colo_filter_sec_redirector0_indev = C.CString(x.ColoFilterSecRedirector0Indev)}
+xc.colo_filter_sec_redirector0_outdev = nil
 if x.ColoFilterSecRedirector0Outdev != "" {
 xc.colo_filter_sec_redirector0_outdev = C.CString(x.ColoFilterSecRedirector0Outdev)}
+xc.colo_filter_sec_redirector1_queue = nil
 if x.ColoFilterSecRedirector1Queue != "" {
 xc.colo_filter_sec_redirector1_queue = C.CString(x.ColoFilterSecRedirector1Queue)}
+xc.colo_filter_sec_redirector1_indev = nil
 if x.ColoFilterSecRedirector1Indev != "" {
 xc.colo_filter_sec_redirector1_indev = C.CString(x.ColoFilterSecRedirector1Indev)}
+xc.colo_filter_sec_redirector1_outdev = nil
 if x.ColoFilterSecRedirector1Outdev != "" {
 xc.colo_filter_sec_redirector1_outdev = C.CString(x.ColoFilterSecRedirector1Outdev)}
+xc.colo_filter_sec_rewriter0_queue = nil
 if x.ColoFilterSecRewriter0Queue != "" {
 xc.colo_filter_sec_rewriter0_queue = C.CString(x.ColoFilterSecRewriter0Queue)}
+xc.colo_checkpoint_host = nil
 if x.ColoCheckpointHost != "" {
 xc.colo_checkpoint_host = C.CString(x.ColoCheckpointHost)}
+xc.colo_checkpoint_port = nil
 if x.ColoCheckpointPort != "" {
 xc.colo_checkpoint_port = C.CString(x.ColoCheckpointPort)}
 
@@ -2053,6 +2177,7 @@ xc.power_mgmt = C.bool(x.PowerMgmt)
 xc.permissive = C.bool(x.Permissive)
 xc.seize = C.bool(x.Seize)
 xc.rdm_policy = C.libxl_rdm_reserve_policy(x.RdmPolicy)
+xc.name = nil
 if x.Name != "" {
 xc.name = C.CString(x.Name)}
 
@@ -2126,6 +2251,7 @@ xc.devid = C.libxl_devid(x.Devid)
 xc.version = C.int(x.Version)
 xc.ports = C.int(x.Ports)
 xc.backend_domid = C.libxl_domid(x.BackendDomid)
+xc.backend_domname = nil
 if x.BackendDomname != "" {
 xc.backend_domname = C.CString(x.BackendDomname)}
 
@@ -2223,6 +2349,7 @@ if err != nil{
 C.libxl_device_dtdev_dispose(xc)}
 }()
 
+xc.path = nil
 if x.Path != "" {
 xc.path = C.CString(x.Path)}
 
@@ -2259,6 +2386,7 @@ C.libxl_device_vtpm_dispose(xc)}
 }()
 
 xc.backend_domid = C.libxl_domid(x.BackendDomid)
+xc.backend_domname = nil
 if x.BackendDomname != "" {
 xc.backend_domname = C.CString(x.BackendDomname)}
 xc.devid = C.libxl_devid(x.Devid)
@@ -2299,12 +2427,16 @@ C.libxl_device_p9_dispose(xc)}
 }()
 
 xc.backend_domid = C.libxl_domid(x.BackendDomid)
+xc.backend_domname = nil
 if x.BackendDomname != "" {
 xc.backend_domname = C.CString(x.BackendDomname)}
+xc.tag = nil
 if x.Tag != "" {
 xc.tag = C.CString(x.Tag)}
+xc.path = nil
 if x.Path != "" {
 xc.path = C.CString(x.Path)}
+xc.security_model = nil
 if x.SecurityModel != "" {
 xc.security_model = C.CString(x.SecurityModel)}
 xc.devid = C.libxl_devid(x.Devid)
@@ -2339,6 +2471,7 @@ C.libxl_device_pvcallsif_dispose(xc)}
 }()
 
 xc.backend_domid = C.libxl_domid(x.BackendDomid)
+xc.backend_domname = nil
 if x.BackendDomname != "" {
 xc.backend_domname = C.CString(x.BackendDomname)}
 xc.devid = C.libxl_devid(x.Devid)
@@ -2399,9 +2532,11 @@ C.libxl_device_channel_dispose(xc)}
 }()
 
 xc.backend_domid = C.libxl_domid(x.BackendDomid)
+xc.backend_domname = nil
 if x.BackendDomname != "" {
 xc.backend_domname = C.CString(x.BackendDomname)}
 xc.devid = C.libxl_devid(x.Devid)
+xc.name = nil
 if x.Name != "" {
 xc.name = C.CString(x.Name)}
 xc.connection = C.libxl_channel_connection(x.Connection)
@@ -2416,6 +2551,7 @@ if !ok {
 return errors.New("wrong type for union key connection")
 }
 var socket C.libxl_device_channel_connection_union_socket
+socket.path = nil
 if tmp.Path != "" {
 socket.path = C.CString(tmp.Path)}
 socketBytes := C.GoBytes(unsafe.Pointer(&socket),C.sizeof_libxl_device_channel_connection_union_socket)
@@ -2452,6 +2588,7 @@ if err != nil{
 C.libxl_connector_param_dispose(xc)}
 }()
 
+xc.unique_id = nil
 if x.UniqueId != "" {
 xc.unique_id = C.CString(x.UniqueId)}
 xc.width = C.uint32_t(x.Width)
@@ -2497,6 +2634,7 @@ C.libxl_device_vdispl_dispose(xc)}
 }()
 
 xc.backend_domid = C.libxl_domid(x.BackendDomid)
+xc.backend_domname = nil
 if x.BackendDomname != "" {
 xc.backend_domname = C.CString(x.BackendDomname)}
 xc.devid = C.libxl_devid(x.Devid)
@@ -2608,6 +2746,7 @@ if err != nil{
 C.libxl_vsnd_stream_dispose(xc)}
 }()
 
+xc.unique_id = nil
 if x.UniqueId != "" {
 xc.unique_id = C.CString(x.UniqueId)}
 xc._type = C.libxl_vsnd_stream_type(x.Type)
@@ -2654,6 +2793,7 @@ if err != nil{
 C.libxl_vsnd_pcm_dispose(xc)}
 }()
 
+xc.name = nil
 if x.Name != "" {
 xc.name = C.CString(x.Name)}
 if err := x.Params.toC(&xc.params); err != nil {
@@ -2714,11 +2854,14 @@ C.libxl_device_vsnd_dispose(xc)}
 }()
 
 xc.backend_domid = C.libxl_domid(x.BackendDomid)
+xc.backend_domname = nil
 if x.BackendDomname != "" {
 xc.backend_domname = C.CString(x.BackendDomname)}
 xc.devid = C.libxl_devid(x.Devid)
+xc.short_name = nil
 if x.ShortName != "" {
 xc.short_name = C.CString(x.ShortName)}
+xc.long_name = nil
 if x.LongName != "" {
 xc.long_name = C.CString(x.LongName)}
 if err := x.Params.toC(&xc.params); err != nil {
@@ -3103,9 +3246,11 @@ if err != nil{
 C.libxl_diskinfo_dispose(xc)}
 }()
 
+xc.backend = nil
 if x.Backend != "" {
 xc.backend = C.CString(x.Backend)}
 xc.backend_id = C.uint32_t(x.BackendId)
+xc.frontend = nil
 if x.Frontend != "" {
 xc.frontend = C.CString(x.Frontend)}
 xc.frontend_id = C.uint32_t(x.FrontendId)
@@ -3149,9 +3294,11 @@ if err != nil{
 C.libxl_nicinfo_dispose(xc)}
 }()
 
+xc.backend = nil
 if x.Backend != "" {
 xc.backend = C.CString(x.Backend)}
 xc.backend_id = C.uint32_t(x.BackendId)
+xc.frontend = nil
 if x.Frontend != "" {
 xc.frontend = C.CString(x.Frontend)}
 xc.frontend_id = C.uint32_t(x.FrontendId)
@@ -3198,9 +3345,11 @@ if err != nil{
 C.libxl_vtpminfo_dispose(xc)}
 }()
 
+xc.backend = nil
 if x.Backend != "" {
 xc.backend = C.CString(x.Backend)}
 xc.backend_id = C.uint32_t(x.BackendId)
+xc.frontend = nil
 if x.Frontend != "" {
 xc.frontend = C.CString(x.Frontend)}
 xc.frontend_id = C.uint32_t(x.FrontendId)
@@ -3254,9 +3403,11 @@ xc._type = C.libxl_usbctrl_type(x.Type)
 xc.devid = C.libxl_devid(x.Devid)
 xc.version = C.int(x.Version)
 xc.ports = C.int(x.Ports)
+xc.backend = nil
 if x.Backend != "" {
 xc.backend = C.CString(x.Backend)}
 xc.backend_id = C.uint32_t(x.BackendId)
+xc.frontend = nil
 if x.Frontend != "" {
 xc.frontend = C.CString(x.Frontend)}
 xc.frontend_id = C.uint32_t(x.FrontendId)
@@ -3422,6 +3573,7 @@ if err != nil{
 C.libxl_connectorinfo_dispose(xc)}
 }()
 
+xc.unique_id = nil
 if x.UniqueId != "" {
 xc.unique_id = C.CString(x.UniqueId)}
 xc.width = C.uint32_t(x.Width)
@@ -3473,9 +3625,11 @@ if err != nil{
 C.libxl_vdisplinfo_dispose(xc)}
 }()
 
+xc.backend = nil
 if x.Backend != "" {
 xc.backend = C.CString(x.Backend)}
 xc.backend_id = C.uint32_t(x.BackendId)
+xc.frontend = nil
 if x.Frontend != "" {
 xc.frontend = C.CString(x.Frontend)}
 xc.frontend_id = C.uint32_t(x.FrontendId)
@@ -3611,9 +3765,11 @@ if err != nil{
 C.libxl_vsndinfo_dispose(xc)}
 }()
 
+xc.backend = nil
 if x.Backend != "" {
 xc.backend = C.CString(x.Backend)}
 xc.backend_id = C.uint32_t(x.BackendId)
+xc.frontend = nil
 if x.Frontend != "" {
 xc.frontend = C.CString(x.Frontend)}
 xc.frontend_id = C.uint32_t(x.FrontendId)
@@ -3664,9 +3820,11 @@ if err != nil{
 C.libxl_vkbinfo_dispose(xc)}
 }()
 
+xc.backend = nil
 if x.Backend != "" {
 xc.backend = C.CString(x.Backend)}
 xc.backend_id = C.uint32_t(x.BackendId)
+xc.frontend = nil
 if x.Frontend != "" {
 xc.frontend = C.CString(x.Frontend)}
 xc.frontend_id = C.uint32_t(x.FrontendId)
@@ -3902,6 +4060,7 @@ return fmt.Errorf("converting field Compression: %v", err)
 if err := x.Netbuf.toC(&xc.netbuf); err != nil {
 return fmt.Errorf("converting field Netbuf: %v", err)
 }
+xc.netbufscript = nil
 if x.Netbufscript != "" {
 xc.netbufscript = C.CString(x.Netbufscript)}
 if err := x.Diskbuf.toC(&xc.diskbuf); err != nil {
@@ -4035,6 +4194,7 @@ if !ok {
 return errors.New("wrong type for union key type")
 }
 var disk_eject C.libxl_event_type_union_disk_eject
+disk_eject.vdev = nil
 if tmp.Vdev != "" {
 disk_eject.vdev = C.CString(tmp.Vdev)}
 if err := tmp.Disk.toC(&disk_eject.disk); err != nil {
-- 
2.17.1


