Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E93CD1C0989
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 23:39:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUGtz-0000A7-KR; Thu, 30 Apr 2020 21:39:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aBcg=6O=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jUGty-00009n-97
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 21:39:26 +0000
X-Inumbo-ID: 09744504-8b2b-11ea-9887-bc764e2007e4
Received: from mail-qk1-x741.google.com (unknown [2607:f8b0:4864:20::741])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 09744504-8b2b-11ea-9887-bc764e2007e4;
 Thu, 30 Apr 2020 21:39:14 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id f83so58221qke.13
 for <xen-devel@lists.xenproject.org>; Thu, 30 Apr 2020 14:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :in-reply-to:references;
 bh=zO/QwmQM2eJmgFIVnT+skwr7mYqvfo4GsOBrQ+ORrQc=;
 b=NB2u25IkeBOI4eSaqCjr7OLW6OYRCYHKftFcl9gcJy5AmHjrGteWKicvisCROwbB2M
 6h/zjFZIaQJvfjBFCndM5BStyEXZ277oRFDEoZZp3A3eXb0z/f8PgnQmf/P1CJgGLuDL
 szCXa9EPOySjF3W+eHS+wkdwssOuBV40bVyjRMme3iWE7gaiwQkEyxoR/7VhgIURMLov
 unOPH8IUmp4lxH22abPVONfAcnqUMF/JXlP6rDQDAoQwBKW4LWQ/1FEykexRUKLUSFZC
 /gacntvzAwgjNEQfQHWrdOxG1y0VxWcLjT9Xpz6Iend6NTdH4Kl1OWTgRc3LjW8UVG9L
 sEOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=zO/QwmQM2eJmgFIVnT+skwr7mYqvfo4GsOBrQ+ORrQc=;
 b=lLZc2hTCma3m0fpGNDZCf0+ZNGoB5dvl7ED2KgJEpmkBaYrAi+t+8gAYgfEHLpx6C/
 YMvIR4aKmTJ9btfXvz3dlIptPt4z/YQDS7ls1brxVodTW0FlkwuKWEB5+tmiY3DpeFmJ
 iRAgnZJrrizjMZOiO22n2wmVcA/w9rwxBvXT236MyGG6XPwK3OkCLJjwusbC1ZN2vATV
 RHQsL64wtXOEvFvltaVXQlaTtRCCExsuHVpfLWCIZjqbIjF6fHCp6FMvQwjHA3hBFiJw
 qY4QzUAcnrD7vJJVoOPxv9CI6ZltNoO2WKVRs73LvOKzBzVmoSnAALd1uKWWGVg17K1k
 8QPg==
X-Gm-Message-State: AGi0PuZ6vdX49iO/bQefcbwzELuYdnb2fQmaEdDXFGaPqspqHd0gbECY
 bPVL6bXYcRpDhllLI8BdqmiFNkp/DuE=
X-Google-Smtp-Source: APiQypI25lMZcFA2OKC0nPPUIW81W8Dbi3f3IffkqjKicyO8SjolPOU9DfA70iiVBsaFMI7FsKz0pw==
X-Received: by 2002:a05:620a:6db:: with SMTP id
 27mr599543qky.314.1588282750776; 
 Thu, 30 Apr 2020 14:39:10 -0700 (PDT)
Received: from six.lan (cpe-67-241-56-252.twcny.res.rr.com. [67.241.56.252])
 by smtp.gmail.com with ESMTPSA id b42sm922476qta.29.2020.04.30.14.39.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 14:39:09 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 1/3] golang/xenlight: re-track generated go code
Date: Thu, 30 Apr 2020 17:38:59 -0400
Message-Id: <2ccb1ae4ffa3f00a13ce303df0e4a44d249861c2.1588282027.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588282027.git.rosbrookn@ainfosec.com>
References: <cover.1588282027.git.rosbrookn@ainfosec.com>
In-Reply-To: <cover.1588282027.git.rosbrookn@ainfosec.com>
References: <cover.1588282027.git.rosbrookn@ainfosec.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Nick Rosbrook <rosbrookn@ainfosec.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Commit df669de074c395a3b2eeb975fddd3da4c148da13 un-tracked the generated
Go code, but it was decided that we actually keep the generated code
in-tree.

Undo the changes to ignore the generated code, and re-generate it.

Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
---
 .gitignore                           |    3 -
 .hgignore                            |    2 -
 tools/golang/xenlight/Makefile       |    1 -
 tools/golang/xenlight/helpers.gen.go | 4728 ++++++++++++++++++++++++++
 tools/golang/xenlight/types.gen.go   | 1226 +++++++
 5 files changed, 5954 insertions(+), 6 deletions(-)
 create mode 100644 tools/golang/xenlight/helpers.gen.go
 create mode 100644 tools/golang/xenlight/types.gen.go

diff --git a/.gitignore b/.gitignore
index 9c8a31f896..bfa53723b3 100644
--- a/.gitignore
+++ b/.gitignore
@@ -406,9 +406,6 @@ tools/xenstore/xenstore-watch
 tools/xl/_paths.h
 tools/xl/xl
 
-tools/golang/src
-tools/golang/*/*.gen.go
-
 docs/txt/misc/*.txt
 docs/txt/man/*.txt
 docs/figs/*.png
diff --git a/.hgignore b/.hgignore
index 2ec52982e1..2d41670632 100644
--- a/.hgignore
+++ b/.hgignore
@@ -282,8 +282,6 @@
 ^tools/ocaml/test/xtl$
 ^tools/ocaml/test/send_debug_keys$
 ^tools/ocaml/test/list_domains$
-^tools/golang/src$
-^tools/golang/.*/.*\.gen\.go$
 ^tools/autom4te\.cache$
 ^tools/config\.h$
 ^tools/config\.log$
diff --git a/tools/golang/xenlight/Makefile b/tools/golang/xenlight/Makefile
index 144c133ced..753132306a 100644
--- a/tools/golang/xenlight/Makefile
+++ b/tools/golang/xenlight/Makefile
@@ -49,7 +49,6 @@ install: build
 clean:
 	$(RM) -r $(XEN_GOPATH)$(GOXL_PKG_DIR)
 	$(RM) $(XEN_GOPATH)/pkg/*/$(XEN_GOCODE_URL)/xenlight.a
-	$(RM) *.gen.go
 
 .PHONY: distclean
 distclean: clean
diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
new file mode 100644
index 0000000000..109e9515a2
--- /dev/null
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -0,0 +1,4728 @@
+// DO NOT EDIT.
+//
+// This file is generated by:
+// gengotypes.py ../../libxl/libxl_types.idl
+//
+package xenlight
+
+import (
+	"errors"
+	"fmt"
+	"unsafe"
+)
+
+/*
+#cgo LDFLAGS: -lxenlight
+#include <stdlib.h>
+#include <libxl.h>
+
+typedef typeof(((struct libxl_channelinfo *)NULL)->u.pty)libxl_channelinfo_connection_union_pty;
+typedef typeof(((struct libxl_domain_build_info *)NULL)->u.hvm)libxl_domain_build_info_type_union_hvm;
+typedef typeof(((struct libxl_domain_build_info *)NULL)->u.pv)libxl_domain_build_info_type_union_pv;
+typedef typeof(((struct libxl_domain_build_info *)NULL)->u.pvh)libxl_domain_build_info_type_union_pvh;
+typedef typeof(((struct libxl_device_usbdev *)NULL)->u.hostdev)libxl_device_usbdev_type_union_hostdev;
+typedef typeof(((struct libxl_device_channel *)NULL)->u.socket)libxl_device_channel_connection_union_socket;
+typedef typeof(((struct libxl_event *)NULL)->u.domain_shutdown)libxl_event_type_union_domain_shutdown;
+typedef typeof(((struct libxl_event *)NULL)->u.disk_eject)libxl_event_type_union_disk_eject;
+typedef typeof(((struct libxl_event *)NULL)->u.operation_complete)libxl_event_type_union_operation_complete;
+typedef typeof(((struct libxl_psr_hw_info *)NULL)->u.cat)libxl_psr_hw_info_type_union_cat;
+typedef typeof(((struct libxl_psr_hw_info *)NULL)->u.mba)libxl_psr_hw_info_type_union_mba;
+*/
+import "C"
+
+// NewIoportRange returns an instance of IoportRange initialized with defaults.
+func NewIoportRange() (*IoportRange, error) {
+	var (
+		x  IoportRange
+		xc C.libxl_ioport_range
+	)
+
+	C.libxl_ioport_range_init(&xc)
+	defer C.libxl_ioport_range_dispose(&xc)
+
+	if err := x.fromC(&xc); err != nil {
+		return nil, err
+	}
+
+	return &x, nil
+}
+
+func (x *IoportRange) fromC(xc *C.libxl_ioport_range) error {
+	x.First = uint32(xc.first)
+	x.Number = uint32(xc.number)
+
+	return nil
+}
+
+func (x *IoportRange) toC(xc *C.libxl_ioport_range) (err error) {
+	defer func() {
+		if err != nil {
+			C.libxl_ioport_range_dispose(xc)
+		}
+	}()
+
+	xc.first = C.uint32_t(x.First)
+	xc.number = C.uint32_t(x.Number)
+
+	return nil
+}
+
+// NewIomemRange returns an instance of IomemRange initialized with defaults.
+func NewIomemRange() (*IomemRange, error) {
+	var (
+		x  IomemRange
+		xc C.libxl_iomem_range
+	)
+
+	C.libxl_iomem_range_init(&xc)
+	defer C.libxl_iomem_range_dispose(&xc)
+
+	if err := x.fromC(&xc); err != nil {
+		return nil, err
+	}
+
+	return &x, nil
+}
+
+func (x *IomemRange) fromC(xc *C.libxl_iomem_range) error {
+	x.Start = uint64(xc.start)
+	x.Number = uint64(xc.number)
+	x.Gfn = uint64(xc.gfn)
+
+	return nil
+}
+
+func (x *IomemRange) toC(xc *C.libxl_iomem_range) (err error) {
+	defer func() {
+		if err != nil {
+			C.libxl_iomem_range_dispose(xc)
+		}
+	}()
+
+	xc.start = C.uint64_t(x.Start)
+	xc.number = C.uint64_t(x.Number)
+	xc.gfn = C.uint64_t(x.Gfn)
+
+	return nil
+}
+
+// NewVgaInterfaceInfo returns an instance of VgaInterfaceInfo initialized with defaults.
+func NewVgaInterfaceInfo() (*VgaInterfaceInfo, error) {
+	var (
+		x  VgaInterfaceInfo
+		xc C.libxl_vga_interface_info
+	)
+
+	C.libxl_vga_interface_info_init(&xc)
+	defer C.libxl_vga_interface_info_dispose(&xc)
+
+	if err := x.fromC(&xc); err != nil {
+		return nil, err
+	}
+
+	return &x, nil
+}
+
+func (x *VgaInterfaceInfo) fromC(xc *C.libxl_vga_interface_info) error {
+	x.Kind = VgaInterfaceType(xc.kind)
+
+	return nil
+}
+
+func (x *VgaInterfaceInfo) toC(xc *C.libxl_vga_interface_info) (err error) {
+	defer func() {
+		if err != nil {
+			C.libxl_vga_interface_info_dispose(xc)
+		}
+	}()
+
+	xc.kind = C.libxl_vga_interface_type(x.Kind)
+
+	return nil
+}
+
+// NewVncInfo returns an instance of VncInfo initialized with defaults.
+func NewVncInfo() (*VncInfo, error) {
+	var (
+		x  VncInfo
+		xc C.libxl_vnc_info
+	)
+
+	C.libxl_vnc_info_init(&xc)
+	defer C.libxl_vnc_info_dispose(&xc)
+
+	if err := x.fromC(&xc); err != nil {
+		return nil, err
+	}
+
+	return &x, nil
+}
+
+func (x *VncInfo) fromC(xc *C.libxl_vnc_info) error {
+	if err := x.Enable.fromC(&xc.enable); err != nil {
+		return fmt.Errorf("converting field Enable: %v", err)
+	}
+	x.Listen = C.GoString(xc.listen)
+	x.Passwd = C.GoString(xc.passwd)
+	x.Display = int(xc.display)
+	if err := x.Findunused.fromC(&xc.findunused); err != nil {
+		return fmt.Errorf("converting field Findunused: %v", err)
+	}
+
+	return nil
+}
+
+func (x *VncInfo) toC(xc *C.libxl_vnc_info) (err error) {
+	defer func() {
+		if err != nil {
+			C.libxl_vnc_info_dispose(xc)
+		}
+	}()
+
+	if err := x.Enable.toC(&xc.enable); err != nil {
+		return fmt.Errorf("converting field Enable: %v", err)
+	}
+	if x.Listen != "" {
+		xc.listen = C.CString(x.Listen)
+	}
+	if x.Passwd != "" {
+		xc.passwd = C.CString(x.Passwd)
+	}
+	xc.display = C.int(x.Display)
+	if err := x.Findunused.toC(&xc.findunused); err != nil {
+		return fmt.Errorf("converting field Findunused: %v", err)
+	}
+
+	return nil
+}
+
+// NewSpiceInfo returns an instance of SpiceInfo initialized with defaults.
+func NewSpiceInfo() (*SpiceInfo, error) {
+	var (
+		x  SpiceInfo
+		xc C.libxl_spice_info
+	)
+
+	C.libxl_spice_info_init(&xc)
+	defer C.libxl_spice_info_dispose(&xc)
+
+	if err := x.fromC(&xc); err != nil {
+		return nil, err
+	}
+
+	return &x, nil
+}
+
+func (x *SpiceInfo) fromC(xc *C.libxl_spice_info) error {
+	if err := x.Enable.fromC(&xc.enable); err != nil {
+		return fmt.Errorf("converting field Enable: %v", err)
+	}
+	x.Port = int(xc.port)
+	x.TlsPort = int(xc.tls_port)
+	x.Host = C.GoString(xc.host)
+	if err := x.DisableTicketing.fromC(&xc.disable_ticketing); err != nil {
+		return fmt.Errorf("converting field DisableTicketing: %v", err)
+	}
+	x.Passwd = C.GoString(xc.passwd)
+	if err := x.AgentMouse.fromC(&xc.agent_mouse); err != nil {
+		return fmt.Errorf("converting field AgentMouse: %v", err)
+	}
+	if err := x.Vdagent.fromC(&xc.vdagent); err != nil {
+		return fmt.Errorf("converting field Vdagent: %v", err)
+	}
+	if err := x.ClipboardSharing.fromC(&xc.clipboard_sharing); err != nil {
+		return fmt.Errorf("converting field ClipboardSharing: %v", err)
+	}
+	x.Usbredirection = int(xc.usbredirection)
+	x.ImageCompression = C.GoString(xc.image_compression)
+	x.StreamingVideo = C.GoString(xc.streaming_video)
+
+	return nil
+}
+
+func (x *SpiceInfo) toC(xc *C.libxl_spice_info) (err error) {
+	defer func() {
+		if err != nil {
+			C.libxl_spice_info_dispose(xc)
+		}
+	}()
+
+	if err := x.Enable.toC(&xc.enable); err != nil {
+		return fmt.Errorf("converting field Enable: %v", err)
+	}
+	xc.port = C.int(x.Port)
+	xc.tls_port = C.int(x.TlsPort)
+	if x.Host != "" {
+		xc.host = C.CString(x.Host)
+	}
+	if err := x.DisableTicketing.toC(&xc.disable_ticketing); err != nil {
+		return fmt.Errorf("converting field DisableTicketing: %v", err)
+	}
+	if x.Passwd != "" {
+		xc.passwd = C.CString(x.Passwd)
+	}
+	if err := x.AgentMouse.toC(&xc.agent_mouse); err != nil {
+		return fmt.Errorf("converting field AgentMouse: %v", err)
+	}
+	if err := x.Vdagent.toC(&xc.vdagent); err != nil {
+		return fmt.Errorf("converting field Vdagent: %v", err)
+	}
+	if err := x.ClipboardSharing.toC(&xc.clipboard_sharing); err != nil {
+		return fmt.Errorf("converting field ClipboardSharing: %v", err)
+	}
+	xc.usbredirection = C.int(x.Usbredirection)
+	if x.ImageCompression != "" {
+		xc.image_compression = C.CString(x.ImageCompression)
+	}
+	if x.StreamingVideo != "" {
+		xc.streaming_video = C.CString(x.StreamingVideo)
+	}
+
+	return nil
+}
+
+// NewSdlInfo returns an instance of SdlInfo initialized with defaults.
+func NewSdlInfo() (*SdlInfo, error) {
+	var (
+		x  SdlInfo
+		xc C.libxl_sdl_info
+	)
+
+	C.libxl_sdl_info_init(&xc)
+	defer C.libxl_sdl_info_dispose(&xc)
+
+	if err := x.fromC(&xc); err != nil {
+		return nil, err
+	}
+
+	return &x, nil
+}
+
+func (x *SdlInfo) fromC(xc *C.libxl_sdl_info) error {
+	if err := x.Enable.fromC(&xc.enable); err != nil {
+		return fmt.Errorf("converting field Enable: %v", err)
+	}
+	if err := x.Opengl.fromC(&xc.opengl); err != nil {
+		return fmt.Errorf("converting field Opengl: %v", err)
+	}
+	x.Display = C.GoString(xc.display)
+	x.Xauthority = C.GoString(xc.xauthority)
+
+	return nil
+}
+
+func (x *SdlInfo) toC(xc *C.libxl_sdl_info) (err error) {
+	defer func() {
+		if err != nil {
+			C.libxl_sdl_info_dispose(xc)
+		}
+	}()
+
+	if err := x.Enable.toC(&xc.enable); err != nil {
+		return fmt.Errorf("converting field Enable: %v", err)
+	}
+	if err := x.Opengl.toC(&xc.opengl); err != nil {
+		return fmt.Errorf("converting field Opengl: %v", err)
+	}
+	if x.Display != "" {
+		xc.display = C.CString(x.Display)
+	}
+	if x.Xauthority != "" {
+		xc.xauthority = C.CString(x.Xauthority)
+	}
+
+	return nil
+}
+
+// NewDominfo returns an instance of Dominfo initialized with defaults.
+func NewDominfo() (*Dominfo, error) {
+	var (
+		x  Dominfo
+		xc C.libxl_dominfo
+	)
+
+	C.libxl_dominfo_init(&xc)
+	defer C.libxl_dominfo_dispose(&xc)
+
+	if err := x.fromC(&xc); err != nil {
+		return nil, err
+	}
+
+	return &x, nil
+}
+
+func (x *Dominfo) fromC(xc *C.libxl_dominfo) error {
+	if err := x.Uuid.fromC(&xc.uuid); err != nil {
+		return fmt.Errorf("converting field Uuid: %v", err)
+	}
+	x.Domid = Domid(xc.domid)
+	x.Ssidref = uint32(xc.ssidref)
+	x.SsidLabel = C.GoString(xc.ssid_label)
+	x.Running = bool(xc.running)
+	x.Blocked = bool(xc.blocked)
+	x.Paused = bool(xc.paused)
+	x.Shutdown = bool(xc.shutdown)
+	x.Dying = bool(xc.dying)
+	x.NeverStop = bool(xc.never_stop)
+	x.ShutdownReason = ShutdownReason(xc.shutdown_reason)
+	x.OutstandingMemkb = uint64(xc.outstanding_memkb)
+	x.CurrentMemkb = uint64(xc.current_memkb)
+	x.SharedMemkb = uint64(xc.shared_memkb)
+	x.PagedMemkb = uint64(xc.paged_memkb)
+	x.MaxMemkb = uint64(xc.max_memkb)
+	x.CpuTime = uint64(xc.cpu_time)
+	x.VcpuMaxId = uint32(xc.vcpu_max_id)
+	x.VcpuOnline = uint32(xc.vcpu_online)
+	x.Cpupool = uint32(xc.cpupool)
+	x.DomainType = DomainType(xc.domain_type)
+
+	return nil
+}
+
+func (x *Dominfo) toC(xc *C.libxl_dominfo) (err error) {
+	defer func() {
+		if err != nil {
+			C.libxl_dominfo_dispose(xc)
+		}
+	}()
+
+	if err := x.Uuid.toC(&xc.uuid); err != nil {
+		return fmt.Errorf("converting field Uuid: %v", err)
+	}
+	xc.domid = C.libxl_domid(x.Domid)
+	xc.ssidref = C.uint32_t(x.Ssidref)
+	if x.SsidLabel != "" {
+		xc.ssid_label = C.CString(x.SsidLabel)
+	}
+	xc.running = C.bool(x.Running)
+	xc.blocked = C.bool(x.Blocked)
+	xc.paused = C.bool(x.Paused)
+	xc.shutdown = C.bool(x.Shutdown)
+	xc.dying = C.bool(x.Dying)
+	xc.never_stop = C.bool(x.NeverStop)
+	xc.shutdown_reason = C.libxl_shutdown_reason(x.ShutdownReason)
+	xc.outstanding_memkb = C.uint64_t(x.OutstandingMemkb)
+	xc.current_memkb = C.uint64_t(x.CurrentMemkb)
+	xc.shared_memkb = C.uint64_t(x.SharedMemkb)
+	xc.paged_memkb = C.uint64_t(x.PagedMemkb)
+	xc.max_memkb = C.uint64_t(x.MaxMemkb)
+	xc.cpu_time = C.uint64_t(x.CpuTime)
+	xc.vcpu_max_id = C.uint32_t(x.VcpuMaxId)
+	xc.vcpu_online = C.uint32_t(x.VcpuOnline)
+	xc.cpupool = C.uint32_t(x.Cpupool)
+	xc.domain_type = C.libxl_domain_type(x.DomainType)
+
+	return nil
+}
+
+// NewCpupoolinfo returns an instance of Cpupoolinfo initialized with defaults.
+func NewCpupoolinfo() (*Cpupoolinfo, error) {
+	var (
+		x  Cpupoolinfo
+		xc C.libxl_cpupoolinfo
+	)
+
+	C.libxl_cpupoolinfo_init(&xc)
+	defer C.libxl_cpupoolinfo_dispose(&xc)
+
+	if err := x.fromC(&xc); err != nil {
+		return nil, err
+	}
+
+	return &x, nil
+}
+
+func (x *Cpupoolinfo) fromC(xc *C.libxl_cpupoolinfo) error {
+	x.Poolid = uint32(xc.poolid)
+	x.PoolName = C.GoString(xc.pool_name)
+	x.Sched = Scheduler(xc.sched)
+	x.NDom = uint32(xc.n_dom)
+	if err := x.Cpumap.fromC(&xc.cpumap); err != nil {
+		return fmt.Errorf("converting field Cpumap: %v", err)
+	}
+
+	return nil
+}
+
+func (x *Cpupoolinfo) toC(xc *C.libxl_cpupoolinfo) (err error) {
+	defer func() {
+		if err != nil {
+			C.libxl_cpupoolinfo_dispose(xc)
+		}
+	}()
+
+	xc.poolid = C.uint32_t(x.Poolid)
+	if x.PoolName != "" {
+		xc.pool_name = C.CString(x.PoolName)
+	}
+	xc.sched = C.libxl_scheduler(x.Sched)
+	xc.n_dom = C.uint32_t(x.NDom)
+	if err := x.Cpumap.toC(&xc.cpumap); err != nil {
+		return fmt.Errorf("converting field Cpumap: %v", err)
+	}
+
+	return nil
+}
+
+// NewChannelinfo returns an instance of Channelinfo initialized with defaults.
+func NewChannelinfo(connection ChannelConnection) (*Channelinfo, error) {
+	var (
+		x  Channelinfo
+		xc C.libxl_channelinfo
+	)
+
+	C.libxl_channelinfo_init(&xc)
+	C.libxl_channelinfo_init_connection(&xc, C.libxl_channel_connection(connection))
+	defer C.libxl_channelinfo_dispose(&xc)
+
+	if err := x.fromC(&xc); err != nil {
+		return nil, err
+	}
+
+	return &x, nil
+}
+
+func (x *Channelinfo) fromC(xc *C.libxl_channelinfo) error {
+	x.Backend = C.GoString(xc.backend)
+	x.BackendId = uint32(xc.backend_id)
+	x.Frontend = C.GoString(xc.frontend)
+	x.FrontendId = uint32(xc.frontend_id)
+	x.Devid = Devid(xc.devid)
+	x.State = int(xc.state)
+	x.Evtch = int(xc.evtch)
+	x.Rref = int(xc.rref)
+	x.Connection = ChannelConnection(xc.connection)
+	switch x.Connection {
+	case ChannelConnectionUnknown:
+		x.ConnectionUnion = nil
+	case ChannelConnectionPty:
+		var connectionPty ChannelinfoConnectionUnionPty
+		if err := connectionPty.fromC(xc); err != nil {
+			return fmt.Errorf("converting field connectionPty: %v", err)
+		}
+		x.ConnectionUnion = connectionPty
+	case ChannelConnectionSocket:
+		x.ConnectionUnion = nil
+	default:
+		return fmt.Errorf("invalid union key '%v'", x.Connection)
+	}
+
+	return nil
+}
+
+func (x *ChannelinfoConnectionUnionPty) fromC(xc *C.libxl_channelinfo) error {
+	if ChannelConnection(xc.connection) != ChannelConnectionPty {
+		return errors.New("expected union key ChannelConnectionPty")
+	}
+
+	tmp := (*C.libxl_channelinfo_connection_union_pty)(unsafe.Pointer(&xc.u[0]))
+	x.Path = C.GoString(tmp.path)
+	return nil
+}
+
+func (x *Channelinfo) toC(xc *C.libxl_channelinfo) (err error) {
+	defer func() {
+		if err != nil {
+			C.libxl_channelinfo_dispose(xc)
+		}
+	}()
+
+	if x.Backend != "" {
+		xc.backend = C.CString(x.Backend)
+	}
+	xc.backend_id = C.uint32_t(x.BackendId)
+	if x.Frontend != "" {
+		xc.frontend = C.CString(x.Frontend)
+	}
+	xc.frontend_id = C.uint32_t(x.FrontendId)
+	xc.devid = C.libxl_devid(x.Devid)
+	xc.state = C.int(x.State)
+	xc.evtch = C.int(x.Evtch)
+	xc.rref = C.int(x.Rref)
+	xc.connection = C.libxl_channel_connection(x.Connection)
+	switch x.Connection {
+	case ChannelConnectionUnknown:
+		break
+	case ChannelConnectionPty:
+		tmp, ok := x.ConnectionUnion.(ChannelinfoConnectionUnionPty)
+		if !ok {
+			return errors.New("wrong type for union key connection")
+		}
+		var pty C.libxl_channelinfo_connection_union_pty
+		if tmp.Path != "" {
+			pty.path = C.CString(tmp.Path)
+		}
+		ptyBytes := C.GoBytes(unsafe.Pointer(&pty), C.sizeof_libxl_channelinfo_connection_union_pty)
+		copy(xc.u[:], ptyBytes)
+	case ChannelConnectionSocket:
+		break
+	default:
+		return fmt.Errorf("invalid union key '%v'", x.Connection)
+	}
+
+	return nil
+}
+
+// NewVminfo returns an instance of Vminfo initialized with defaults.
+func NewVminfo() (*Vminfo, error) {
+	var (
+		x  Vminfo
+		xc C.libxl_vminfo
+	)
+
+	C.libxl_vminfo_init(&xc)
+	defer C.libxl_vminfo_dispose(&xc)
+
+	if err := x.fromC(&xc); err != nil {
+		return nil, err
+	}
+
+	return &x, nil
+}
+
+func (x *Vminfo) fromC(xc *C.libxl_vminfo) error {
+	if err := x.Uuid.fromC(&xc.uuid); err != nil {
+		return fmt.Errorf("converting field Uuid: %v", err)
+	}
+	x.Domid = Domid(xc.domid)
+
+	return nil
+}
+
+func (x *Vminfo) toC(xc *C.libxl_vminfo) (err error) {
+	defer func() {
+		if err != nil {
+			C.libxl_vminfo_dispose(xc)
+		}
+	}()
+
+	if err := x.Uuid.toC(&xc.uuid); err != nil {
+		return fmt.Errorf("converting field Uuid: %v", err)
+	}
+	xc.domid = C.libxl_domid(x.Domid)
+
+	return nil
+}
+
+// NewVersionInfo returns an instance of VersionInfo initialized with defaults.
+func NewVersionInfo() (*VersionInfo, error) {
+	var (
+		x  VersionInfo
+		xc C.libxl_version_info
+	)
+
+	C.libxl_version_info_init(&xc)
+	defer C.libxl_version_info_dispose(&xc)
+
+	if err := x.fromC(&xc); err != nil {
+		return nil, err
+	}
+
+	return &x, nil
+}
+
+func (x *VersionInfo) fromC(xc *C.libxl_version_info) error {
+	x.XenVersionMajor = int(xc.xen_version_major)
+	x.XenVersionMinor = int(xc.xen_version_minor)
+	x.XenVersionExtra = C.GoString(xc.xen_version_extra)
+	x.Compiler = C.GoString(xc.compiler)
+	x.CompileBy = C.GoString(xc.compile_by)
+	x.CompileDomain = C.GoString(xc.compile_domain)
+	x.CompileDate = C.GoString(xc.compile_date)
+	x.Capabilities = C.GoString(xc.capabilities)
+	x.Changeset = C.GoString(xc.changeset)
+	x.VirtStart = uint64(xc.virt_start)
+	x.Pagesize = int(xc.pagesize)
+	x.Commandline = C.GoString(xc.commandline)
+	x.BuildId = C.GoString(xc.build_id)
+
+	return nil
+}
+
+func (x *VersionInfo) toC(xc *C.libxl_version_info) (err error) {
+	defer func() {
+		if err != nil {
+			C.libxl_version_info_dispose(xc)
+		}
+	}()
+
+	xc.xen_version_major = C.int(x.XenVersionMajor)
+	xc.xen_version_minor = C.int(x.XenVersionMinor)
+	if x.XenVersionExtra != "" {
+		xc.xen_version_extra = C.CString(x.XenVersionExtra)
+	}
+	if x.Compiler != "" {
+		xc.compiler = C.CString(x.Compiler)
+	}
+	if x.CompileBy != "" {
+		xc.compile_by = C.CString(x.CompileBy)
+	}
+	if x.CompileDomain != "" {
+		xc.compile_domain = C.CString(x.CompileDomain)
+	}
+	if x.CompileDate != "" {
+		xc.compile_date = C.CString(x.CompileDate)
+	}
+	if x.Capabilities != "" {
+		xc.capabilities = C.CString(x.Capabilities)
+	}
+	if x.Changeset != "" {
+		xc.changeset = C.CString(x.Changeset)
+	}
+	xc.virt_start = C.uint64_t(x.VirtStart)
+	xc.pagesize = C.int(x.Pagesize)
+	if x.Commandline != "" {
+		xc.commandline = C.CString(x.Commandline)
+	}
+	if x.BuildId != "" {
+		xc.build_id = C.CString(x.BuildId)
+	}
+
+	return nil
+}
+
+// NewDomainCreateInfo returns an instance of DomainCreateInfo initialized with defaults.
+func NewDomainCreateInfo() (*DomainCreateInfo, error) {
+	var (
+		x  DomainCreateInfo
+		xc C.libxl_domain_create_info
+	)
+
+	C.libxl_domain_create_info_init(&xc)
+	defer C.libxl_domain_create_info_dispose(&xc)
+
+	if err := x.fromC(&xc); err != nil {
+		return nil, err
+	}
+
+	return &x, nil
+}
+
+func (x *DomainCreateInfo) fromC(xc *C.libxl_domain_create_info) error {
+	x.Type = DomainType(xc._type)
+	if err := x.Hap.fromC(&xc.hap); err != nil {
+		return fmt.Errorf("converting field Hap: %v", err)
+	}
+	if err := x.Oos.fromC(&xc.oos); err != nil {
+		return fmt.Errorf("converting field Oos: %v", err)
+	}
+	x.Ssidref = uint32(xc.ssidref)
+	x.SsidLabel = C.GoString(xc.ssid_label)
+	x.Name = C.GoString(xc.name)
+	x.Domid = Domid(xc.domid)
+	if err := x.Uuid.fromC(&xc.uuid); err != nil {
+		return fmt.Errorf("converting field Uuid: %v", err)
+	}
+	if err := x.Xsdata.fromC(&xc.xsdata); err != nil {
+		return fmt.Errorf("converting field Xsdata: %v", err)
+	}
+	if err := x.Platformdata.fromC(&xc.platformdata); err != nil {
+		return fmt.Errorf("converting field Platformdata: %v", err)
+	}
+	x.Poolid = uint32(xc.poolid)
+	x.PoolName = C.GoString(xc.pool_name)
+	if err := x.RunHotplugScripts.fromC(&xc.run_hotplug_scripts); err != nil {
+		return fmt.Errorf("converting field RunHotplugScripts: %v", err)
+	}
+	if err := x.DriverDomain.fromC(&xc.driver_domain); err != nil {
+		return fmt.Errorf("converting field DriverDomain: %v", err)
+	}
+	x.Passthrough = Passthrough(xc.passthrough)
+	if err := x.XendSuspendEvtchnCompat.fromC(&xc.xend_suspend_evtchn_compat); err != nil {
+		return fmt.Errorf("converting field XendSuspendEvtchnCompat: %v", err)
+	}
+
+	return nil
+}
+
+func (x *DomainCreateInfo) toC(xc *C.libxl_domain_create_info) (err error) {
+	defer func() {
+		if err != nil {
+			C.libxl_domain_create_info_dispose(xc)
+		}
+	}()
+
+	xc._type = C.libxl_domain_type(x.Type)
+	if err := x.Hap.toC(&xc.hap); err != nil {
+		return fmt.Errorf("converting field Hap: %v", err)
+	}
+	if err := x.Oos.toC(&xc.oos); err != nil {
+		return fmt.Errorf("converting field Oos: %v", err)
+	}
+	xc.ssidref = C.uint32_t(x.Ssidref)
+	if x.SsidLabel != "" {
+		xc.ssid_label = C.CString(x.SsidLabel)
+	}
+	if x.Name != "" {
+		xc.name = C.CString(x.Name)
+	}
+	xc.domid = C.libxl_domid(x.Domid)
+	if err := x.Uuid.toC(&xc.uuid); err != nil {
+		return fmt.Errorf("converting field Uuid: %v", err)
+	}
+	if err := x.Xsdata.toC(&xc.xsdata); err != nil {
+		return fmt.Errorf("converting field Xsdata: %v", err)
+	}
+	if err := x.Platformdata.toC(&xc.platformdata); err != nil {
+		return fmt.Errorf("converting field Platformdata: %v", err)
+	}
+	xc.poolid = C.uint32_t(x.Poolid)
+	if x.PoolName != "" {
+		xc.pool_name = C.CString(x.PoolName)
+	}
+	if err := x.RunHotplugScripts.toC(&xc.run_hotplug_scripts); err != nil {
+		return fmt.Errorf("converting field RunHotplugScripts: %v", err)
+	}
+	if err := x.DriverDomain.toC(&xc.driver_domain); err != nil {
+		return fmt.Errorf("converting field DriverDomain: %v", err)
+	}
+	xc.passthrough = C.libxl_passthrough(x.Passthrough)
+	if err := x.XendSuspendEvtchnCompat.toC(&xc.xend_suspend_evtchn_compat); err != nil {
+		return fmt.Errorf("converting field XendSuspendEvtchnCompat: %v", err)
+	}
+
+	return nil
+}
+
+// NewDomainRestoreParams returns an instance of DomainRestoreParams initialized with defaults.
+func NewDomainRestoreParams() (*DomainRestoreParams, error) {
+	var (
+		x  DomainRestoreParams
+		xc C.libxl_domain_restore_params
+	)
+
+	C.libxl_domain_restore_params_init(&xc)
+	defer C.libxl_domain_restore_params_dispose(&xc)
+
+	if err := x.fromC(&xc); err != nil {
+		return nil, err
+	}
+
+	return &x, nil
+}
+
+func (x *DomainRestoreParams) fromC(xc *C.libxl_domain_restore_params) error {
+	x.CheckpointedStream = int(xc.checkpointed_stream)
+	x.StreamVersion = uint32(xc.stream_version)
+	x.ColoProxyScript = C.GoString(xc.colo_proxy_script)
+	if err := x.UserspaceColoProxy.fromC(&xc.userspace_colo_proxy); err != nil {
+		return fmt.Errorf("converting field UserspaceColoProxy: %v", err)
+	}
+
+	return nil
+}
+
+func (x *DomainRestoreParams) toC(xc *C.libxl_domain_restore_params) (err error) {
+	defer func() {
+		if err != nil {
+			C.libxl_domain_restore_params_dispose(xc)
+		}
+	}()
+
+	xc.checkpointed_stream = C.int(x.CheckpointedStream)
+	xc.stream_version = C.uint32_t(x.StreamVersion)
+	if x.ColoProxyScript != "" {
+		xc.colo_proxy_script = C.CString(x.ColoProxyScript)
+	}
+	if err := x.UserspaceColoProxy.toC(&xc.userspace_colo_proxy); err != nil {
+		return fmt.Errorf("converting field UserspaceColoProxy: %v", err)
+	}
+
+	return nil
+}
+
+// NewSchedParams returns an instance of SchedParams initialized with defaults.
+func NewSchedParams() (*SchedParams, error) {
+	var (
+		x  SchedParams
+		xc C.libxl_sched_params
+	)
+
+	C.libxl_sched_params_init(&xc)
+	defer C.libxl_sched_params_dispose(&xc)
+
+	if err := x.fromC(&xc); err != nil {
+		return nil, err
+	}
+
+	return &x, nil
+}
+
+func (x *SchedParams) fromC(xc *C.libxl_sched_params) error {
+	x.Vcpuid = int(xc.vcpuid)
+	x.Weight = int(xc.weight)
+	x.Cap = int(xc.cap)
+	x.Period = int(xc.period)
+	x.Extratime = int(xc.extratime)
+	x.Budget = int(xc.budget)
+
+	return nil
+}
+
+func (x *SchedParams) toC(xc *C.libxl_sched_params) (err error) {
+	defer func() {
+		if err != nil {
+			C.libxl_sched_params_dispose(xc)
+		}
+	}()
+
+	xc.vcpuid = C.int(x.Vcpuid)
+	xc.weight = C.int(x.Weight)
+	xc.cap = C.int(x.Cap)
+	xc.period = C.int(x.Period)
+	xc.extratime = C.int(x.Extratime)
+	xc.budget = C.int(x.Budget)
+
+	return nil
+}
+
+// NewVcpuSchedParams returns an instance of VcpuSchedParams initialized with defaults.
+func NewVcpuSchedParams() (*VcpuSchedParams, error) {
+	var (
+		x  VcpuSchedParams
+		xc C.libxl_vcpu_sched_params
+	)
+
+	C.libxl_vcpu_sched_params_init(&xc)
+	defer C.libxl_vcpu_sched_params_dispose(&xc)
+
+	if err := x.fromC(&xc); err != nil {
+		return nil, err
+	}
+
+	return &x, nil
+}
+
+func (x *VcpuSchedParams) fromC(xc *C.libxl_vcpu_sched_params) error {
+	x.Sched = Scheduler(xc.sched)
+	x.Vcpus = nil
+	if n := int(xc.num_vcpus); n > 0 {
+		cVcpus := (*[1 << 28]C.libxl_sched_params)(unsafe.Pointer(xc.vcpus))[:n:n]
+		x.Vcpus = make([]SchedParams, n)
+		for i, v := range cVcpus {
+			if err := x.Vcpus[i].fromC(&v); err != nil {
+				return fmt.Errorf("converting field Vcpus: %v", err)
+			}
+		}
+	}
+
+	return nil
+}
+
+func (x *VcpuSchedParams) toC(xc *C.libxl_vcpu_sched_params) (err error) {
+	defer func() {
+		if err != nil {
+			C.libxl_vcpu_sched_params_dispose(xc)
+		}
+	}()
+
+	xc.sched = C.libxl_scheduler(x.Sched)
+	if numVcpus := len(x.Vcpus); numVcpus > 0 {
+		xc.vcpus = (*C.libxl_sched_params)(C.malloc(C.ulong(numVcpus) * C.sizeof_libxl_sched_params))
+		xc.num_vcpus = C.int(numVcpus)
+		cVcpus := (*[1 << 28]C.libxl_sched_params)(unsafe.Pointer(xc.vcpus))[:numVcpus:numVcpus]
+		for i, v := range x.Vcpus {
+			if err := v.toC(&cVcpus[i]); err != nil {
+				return fmt.Errorf("converting field Vcpus: %v", err)
+			}
+		}
+	}
+
+	return nil
+}
+
+// NewDomainSchedParams returns an instance of DomainSchedParams initialized with defaults.
+func NewDomainSchedParams() (*DomainSchedParams, error) {
+	var (
+		x  DomainSchedParams
+		xc C.libxl_domain_sched_params
+	)
+
+	C.libxl_domain_sched_params_init(&xc)
+	defer C.libxl_domain_sched_params_dispose(&xc)
+
+	if err := x.fromC(&xc); err != nil {
+		return nil, err
+	}
+
+	return &x, nil
+}
+
+func (x *DomainSchedParams) fromC(xc *C.libxl_domain_sched_params) error {
+	x.Sched = Scheduler(xc.sched)
+	x.Weight = int(xc.weight)
+	x.Cap = int(xc.cap)
+	x.Period = int(xc.period)
+	x.Budget = int(xc.budget)
+	x.Extratime = int(xc.extratime)
+	x.Slice = int(xc.slice)
+	x.Latency = int(xc.latency)
+
+	return nil
+}
+
+func (x *DomainSchedParams) toC(xc *C.libxl_domain_sched_params) (err error) {
+	defer func() {
+		if err != nil {
+			C.libxl_domain_sched_params_dispose(xc)
+		}
+	}()
+
+	xc.sched = C.libxl_scheduler(x.Sched)
+	xc.weight = C.int(x.Weight)
+	xc.cap = C.int(x.Cap)
+	xc.period = C.int(x.Period)
+	xc.budget = C.int(x.Budget)
+	xc.extratime = C.int(x.Extratime)
+	xc.slice = C.int(x.Slice)
+	xc.latency = C.int(x.Latency)
+
+	return nil
+}
+
+// NewVnodeInfo returns an instance of VnodeInfo initialized with defaults.
+func NewVnodeInfo() (*VnodeInfo, error) {
+	var (
+		x  VnodeInfo
+		xc C.libxl_vnode_info
+	)
+
+	C.libxl_vnode_info_init(&xc)
+	defer C.libxl_vnode_info_dispose(&xc)
+
+	if err := x.fromC(&xc); err != nil {
+		return nil, err
+	}
+
+	return &x, nil
+}
+
+func (x *VnodeInfo) fromC(xc *C.libxl_vnode_info) error {
+	x.Memkb = uint64(xc.memkb)
+	x.Distances = nil
+	if n := int(xc.num_distances); n > 0 {
+		cDistances := (*[1 << 28]C.uint32_t)(unsafe.Pointer(xc.distances))[:n:n]
+		x.Distances = make([]uint32, n)
+		for i, v := range cDistances {
+			x.Distances[i] = uint32(v)
+		}
+	}
+	x.Pnode = uint32(xc.pnode)
+	if err := x.Vcpus.fromC(&xc.vcpus); err != nil {
+		return fmt.Errorf("converting field Vcpus: %v", err)
+	}
+
+	return nil
+}
+
+func (x *VnodeInfo) toC(xc *C.libxl_vnode_info) (err error) {
+	defer func() {
+		if err != nil {
+			C.libxl_vnode_info_dispose(xc)
+		}
+	}()
+
+	xc.memkb = C.uint64_t(x.Memkb)
+	if numDistances := len(x.Distances); numDistances > 0 {
+		xc.distances = (*C.uint32_t)(C.malloc(C.size_t(numDistances * numDistances)))
+		xc.num_distances = C.int(numDistances)
+		cDistances := (*[1 << 28]C.uint32_t)(unsafe.Pointer(xc.distances))[:numDistances:numDistances]
+		for i, v := range x.Distances {
+			cDistances[i] = C.uint32_t(v)
+		}
+	}
+	xc.pnode = C.uint32_t(x.Pnode)
+	if err := x.Vcpus.toC(&xc.vcpus); err != nil {
+		return fmt.Errorf("converting field Vcpus: %v", err)
+	}
+
+	return nil
+}
+
+// NewRdmReserve returns an instance of RdmReserve initialized with defaults.
+func NewRdmReserve() (*RdmReserve, error) {
+	var (
+		x  RdmReserve
+		xc C.libxl_rdm_reserve
+	)
+
+	C.libxl_rdm_reserve_init(&xc)
+	defer C.libxl_rdm_reserve_dispose(&xc)
+
+	if err := x.fromC(&xc); err != nil {
+		return nil, err
+	}
+
+	return &x, nil
+}
+
+func (x *RdmReserve) fromC(xc *C.libxl_rdm_reserve) error {
+	x.Strategy = RdmReserveStrategy(xc.strategy)
+	x.Policy = RdmReservePolicy(xc.policy)
+
+	return nil
+}
+
+func (x *RdmReserve) toC(xc *C.libxl_rdm_reserve) (err error) {
+	defer func() {
+		if err != nil {
+			C.libxl_rdm_reserve_dispose(xc)
+		}
+	}()
+
+	xc.strategy = C.libxl_rdm_reserve_strategy(x.Strategy)
+	xc.policy = C.libxl_rdm_reserve_policy(x.Policy)
+
+	return nil
+}
+
+// NewDomainBuildInfo returns an instance of DomainBuildInfo initialized with defaults.
+func NewDomainBuildInfo(dtype DomainType) (*DomainBuildInfo, error) {
+	var (
+		x  DomainBuildInfo
+		xc C.libxl_domain_build_info
+	)
+
+	C.libxl_domain_build_info_init(&xc)
+	C.libxl_domain_build_info_init_type(&xc, C.libxl_domain_type(dtype))
+	defer C.libxl_domain_build_info_dispose(&xc)
+
+	if err := x.fromC(&xc); err != nil {
+		return nil, err
+	}
+
+	return &x, nil
+}
+
+func (x *DomainBuildInfo) fromC(xc *C.libxl_domain_build_info) error {
+	x.MaxVcpus = int(xc.max_vcpus)
+	if err := x.AvailVcpus.fromC(&xc.avail_vcpus); err != nil {
+		return fmt.Errorf("converting field AvailVcpus: %v", err)
+	}
+	if err := x.Cpumap.fromC(&xc.cpumap); err != nil {
+		return fmt.Errorf("converting field Cpumap: %v", err)
+	}
+	if err := x.Nodemap.fromC(&xc.nodemap); err != nil {
+		return fmt.Errorf("converting field Nodemap: %v", err)
+	}
+	x.VcpuHardAffinity = nil
+	if n := int(xc.num_vcpu_hard_affinity); n > 0 {
+		cVcpuHardAffinity := (*[1 << 28]C.libxl_bitmap)(unsafe.Pointer(xc.vcpu_hard_affinity))[:n:n]
+		x.VcpuHardAffinity = make([]Bitmap, n)
+		for i, v := range cVcpuHardAffinity {
+			if err := x.VcpuHardAffinity[i].fromC(&v); err != nil {
+				return fmt.Errorf("converting field VcpuHardAffinity: %v", err)
+			}
+		}
+	}
+	x.VcpuSoftAffinity = nil
+	if n := int(xc.num_vcpu_soft_affinity); n > 0 {
+		cVcpuSoftAffinity := (*[1 << 28]C.libxl_bitmap)(unsafe.Pointer(xc.vcpu_soft_affinity))[:n:n]
+		x.VcpuSoftAffinity = make([]Bitmap, n)
+		for i, v := range cVcpuSoftAffinity {
+			if err := x.VcpuSoftAffinity[i].fromC(&v); err != nil {
+				return fmt.Errorf("converting field VcpuSoftAffinity: %v", err)
+			}
+		}
+	}
+	if err := x.NumaPlacement.fromC(&xc.numa_placement); err != nil {
+		return fmt.Errorf("converting field NumaPlacement: %v", err)
+	}
+	x.TscMode = TscMode(xc.tsc_mode)
+	x.MaxMemkb = uint64(xc.max_memkb)
+	x.TargetMemkb = uint64(xc.target_memkb)
+	x.VideoMemkb = uint64(xc.video_memkb)
+	x.ShadowMemkb = uint64(xc.shadow_memkb)
+	x.IommuMemkb = uint64(xc.iommu_memkb)
+	x.RtcTimeoffset = uint32(xc.rtc_timeoffset)
+	x.ExecSsidref = uint32(xc.exec_ssidref)
+	x.ExecSsidLabel = C.GoString(xc.exec_ssid_label)
+	if err := x.Localtime.fromC(&xc.localtime); err != nil {
+		return fmt.Errorf("converting field Localtime: %v", err)
+	}
+	if err := x.DisableMigrate.fromC(&xc.disable_migrate); err != nil {
+		return fmt.Errorf("converting field DisableMigrate: %v", err)
+	}
+	if err := x.Cpuid.fromC(&xc.cpuid); err != nil {
+		return fmt.Errorf("converting field Cpuid: %v", err)
+	}
+	x.BlkdevStart = C.GoString(xc.blkdev_start)
+	x.VnumaNodes = nil
+	if n := int(xc.num_vnuma_nodes); n > 0 {
+		cVnumaNodes := (*[1 << 28]C.libxl_vnode_info)(unsafe.Pointer(xc.vnuma_nodes))[:n:n]
+		x.VnumaNodes = make([]VnodeInfo, n)
+		for i, v := range cVnumaNodes {
+			if err := x.VnumaNodes[i].fromC(&v); err != nil {
+				return fmt.Errorf("converting field VnumaNodes: %v", err)
+			}
+		}
+	}
+	x.MaxGrantFrames = uint32(xc.max_grant_frames)
+	x.MaxMaptrackFrames = uint32(xc.max_maptrack_frames)
+	x.DeviceModelVersion = DeviceModelVersion(xc.device_model_version)
+	if err := x.DeviceModelStubdomain.fromC(&xc.device_model_stubdomain); err != nil {
+		return fmt.Errorf("converting field DeviceModelStubdomain: %v", err)
+	}
+	x.DeviceModel = C.GoString(xc.device_model)
+	x.DeviceModelSsidref = uint32(xc.device_model_ssidref)
+	x.DeviceModelSsidLabel = C.GoString(xc.device_model_ssid_label)
+	x.DeviceModelUser = C.GoString(xc.device_model_user)
+	if err := x.Extra.fromC(&xc.extra); err != nil {
+		return fmt.Errorf("converting field Extra: %v", err)
+	}
+	if err := x.ExtraPv.fromC(&xc.extra_pv); err != nil {
+		return fmt.Errorf("converting field ExtraPv: %v", err)
+	}
+	if err := x.ExtraHvm.fromC(&xc.extra_hvm); err != nil {
+		return fmt.Errorf("converting field ExtraHvm: %v", err)
+	}
+	if err := x.SchedParams.fromC(&xc.sched_params); err != nil {
+		return fmt.Errorf("converting field SchedParams: %v", err)
+	}
+	x.Ioports = nil
+	if n := int(xc.num_ioports); n > 0 {
+		cIoports := (*[1 << 28]C.libxl_ioport_range)(unsafe.Pointer(xc.ioports))[:n:n]
+		x.Ioports = make([]IoportRange, n)
+		for i, v := range cIoports {
+			if err := x.Ioports[i].fromC(&v); err != nil {
+				return fmt.Errorf("converting field Ioports: %v", err)
+			}
+		}
+	}
+	x.Irqs = nil
+	if n := int(xc.num_irqs); n > 0 {
+		cIrqs := (*[1 << 28]C.uint32_t)(unsafe.Pointer(xc.irqs))[:n:n]
+		x.Irqs = make([]uint32, n)
+		for i, v := range cIrqs {
+			x.Irqs[i] = uint32(v)
+		}
+	}
+	x.Iomem = nil
+	if n := int(xc.num_iomem); n > 0 {
+		cIomem := (*[1 << 28]C.libxl_iomem_range)(unsafe.Pointer(xc.iomem))[:n:n]
+		x.Iomem = make([]IomemRange, n)
+		for i, v := range cIomem {
+			if err := x.Iomem[i].fromC(&v); err != nil {
+				return fmt.Errorf("converting field Iomem: %v", err)
+			}
+		}
+	}
+	if err := x.ClaimMode.fromC(&xc.claim_mode); err != nil {
+		return fmt.Errorf("converting field ClaimMode: %v", err)
+	}
+	x.EventChannels = uint32(xc.event_channels)
+	x.Kernel = C.GoString(xc.kernel)
+	x.Cmdline = C.GoString(xc.cmdline)
+	x.Ramdisk = C.GoString(xc.ramdisk)
+	x.DeviceTree = C.GoString(xc.device_tree)
+	if err := x.Acpi.fromC(&xc.acpi); err != nil {
+		return fmt.Errorf("converting field Acpi: %v", err)
+	}
+	x.Bootloader = C.GoString(xc.bootloader)
+	if err := x.BootloaderArgs.fromC(&xc.bootloader_args); err != nil {
+		return fmt.Errorf("converting field BootloaderArgs: %v", err)
+	}
+	x.TimerMode = TimerMode(xc.timer_mode)
+	if err := x.NestedHvm.fromC(&xc.nested_hvm); err != nil {
+		return fmt.Errorf("converting field NestedHvm: %v", err)
+	}
+	if err := x.Apic.fromC(&xc.apic); err != nil {
+		return fmt.Errorf("converting field Apic: %v", err)
+	}
+	if err := x.DmRestrict.fromC(&xc.dm_restrict); err != nil {
+		return fmt.Errorf("converting field DmRestrict: %v", err)
+	}
+	x.Tee = TeeType(xc.tee)
+	x.Type = DomainType(xc._type)
+	switch x.Type {
+	case DomainTypeHvm:
+		var typeHvm DomainBuildInfoTypeUnionHvm
+		if err := typeHvm.fromC(xc); err != nil {
+			return fmt.Errorf("converting field typeHvm: %v", err)
+		}
+		x.TypeUnion = typeHvm
+	case DomainTypePv:
+		var typePv DomainBuildInfoTypeUnionPv
+		if err := typePv.fromC(xc); err != nil {
+			return fmt.Errorf("converting field typePv: %v", err)
+		}
+		x.TypeUnion = typePv
+	case DomainTypePvh:
+		var typePvh DomainBuildInfoTypeUnionPvh
+		if err := typePvh.fromC(xc); err != nil {
+			return fmt.Errorf("converting field typePvh: %v", err)
+		}
+		x.TypeUnion = typePvh
+	case DomainTypeInvalid:
+		x.TypeUnion = nil
+	default:
+		return fmt.Errorf("invalid union key '%v'", x.Type)
+	}
+	x.ArchArm.GicVersion = GicVersion(xc.arch_arm.gic_version)
+	x.ArchArm.Vuart = VuartType(xc.arch_arm.vuart)
+	x.Altp2M = Altp2MMode(xc.altp2m)
+
+	return nil
+}
+
+func (x *DomainBuildInfoTypeUnionHvm) fromC(xc *C.libxl_domain_build_info) error {
+	if DomainType(xc._type) != DomainTypeHvm {
+		return errors.New("expected union key DomainTypeHvm")
+	}
+
+	tmp := (*C.libxl_domain_build_info_type_union_hvm)(unsafe.Pointer(&xc.u[0]))
+	x.Firmware = C.GoString(tmp.firmware)
+	x.Bios = BiosType(tmp.bios)
+	if err := x.Pae.fromC(&tmp.pae); err != nil {
+		return fmt.Errorf("converting field Pae: %v", err)
+	}
+	if err := x.Apic.fromC(&tmp.apic); err != nil {
+		return fmt.Errorf("converting field Apic: %v", err)
+	}
+	if err := x.Acpi.fromC(&tmp.acpi); err != nil {
+		return fmt.Errorf("converting field Acpi: %v", err)
+	}
+	if err := x.AcpiS3.fromC(&tmp.acpi_s3); err != nil {
+		return fmt.Errorf("converting field AcpiS3: %v", err)
+	}
+	if err := x.AcpiS4.fromC(&tmp.acpi_s4); err != nil {
+		return fmt.Errorf("converting field AcpiS4: %v", err)
+	}
+	if err := x.AcpiLaptopSlate.fromC(&tmp.acpi_laptop_slate); err != nil {
+		return fmt.Errorf("converting field AcpiLaptopSlate: %v", err)
+	}
+	if err := x.Nx.fromC(&tmp.nx); err != nil {
+		return fmt.Errorf("converting field Nx: %v", err)
+	}
+	if err := x.Viridian.fromC(&tmp.viridian); err != nil {
+		return fmt.Errorf("converting field Viridian: %v", err)
+	}
+	if err := x.ViridianEnable.fromC(&tmp.viridian_enable); err != nil {
+		return fmt.Errorf("converting field ViridianEnable: %v", err)
+	}
+	if err := x.ViridianDisable.fromC(&tmp.viridian_disable); err != nil {
+		return fmt.Errorf("converting field ViridianDisable: %v", err)
+	}
+	x.Timeoffset = C.GoString(tmp.timeoffset)
+	if err := x.Hpet.fromC(&tmp.hpet); err != nil {
+		return fmt.Errorf("converting field Hpet: %v", err)
+	}
+	if err := x.VptAlign.fromC(&tmp.vpt_align); err != nil {
+		return fmt.Errorf("converting field VptAlign: %v", err)
+	}
+	x.MmioHoleMemkb = uint64(tmp.mmio_hole_memkb)
+	x.TimerMode = TimerMode(tmp.timer_mode)
+	if err := x.NestedHvm.fromC(&tmp.nested_hvm); err != nil {
+		return fmt.Errorf("converting field NestedHvm: %v", err)
+	}
+	if err := x.Altp2M.fromC(&tmp.altp2m); err != nil {
+		return fmt.Errorf("converting field Altp2M: %v", err)
+	}
+	x.SystemFirmware = C.GoString(tmp.system_firmware)
+	x.SmbiosFirmware = C.GoString(tmp.smbios_firmware)
+	x.AcpiFirmware = C.GoString(tmp.acpi_firmware)
+	x.Hdtype = Hdtype(tmp.hdtype)
+	if err := x.Nographic.fromC(&tmp.nographic); err != nil {
+		return fmt.Errorf("converting field Nographic: %v", err)
+	}
+	if err := x.Vga.fromC(&tmp.vga); err != nil {
+		return fmt.Errorf("converting field Vga: %v", err)
+	}
+	if err := x.Vnc.fromC(&tmp.vnc); err != nil {
+		return fmt.Errorf("converting field Vnc: %v", err)
+	}
+	x.Keymap = C.GoString(tmp.keymap)
+	if err := x.Sdl.fromC(&tmp.sdl); err != nil {
+		return fmt.Errorf("converting field Sdl: %v", err)
+	}
+	if err := x.Spice.fromC(&tmp.spice); err != nil {
+		return fmt.Errorf("converting field Spice: %v", err)
+	}
+	if err := x.GfxPassthru.fromC(&tmp.gfx_passthru); err != nil {
+		return fmt.Errorf("converting field GfxPassthru: %v", err)
+	}
+	x.GfxPassthruKind = GfxPassthruKind(tmp.gfx_passthru_kind)
+	x.Serial = C.GoString(tmp.serial)
+	x.Boot = C.GoString(tmp.boot)
+	if err := x.Usb.fromC(&tmp.usb); err != nil {
+		return fmt.Errorf("converting field Usb: %v", err)
+	}
+	x.Usbversion = int(tmp.usbversion)
+	x.Usbdevice = C.GoString(tmp.usbdevice)
+	if err := x.VkbDevice.fromC(&tmp.vkb_device); err != nil {
+		return fmt.Errorf("converting field VkbDevice: %v", err)
+	}
+	x.Soundhw = C.GoString(tmp.soundhw)
+	if err := x.XenPlatformPci.fromC(&tmp.xen_platform_pci); err != nil {
+		return fmt.Errorf("converting field XenPlatformPci: %v", err)
+	}
+	if err := x.UsbdeviceList.fromC(&tmp.usbdevice_list); err != nil {
+		return fmt.Errorf("converting field UsbdeviceList: %v", err)
+	}
+	x.VendorDevice = VendorDevice(tmp.vendor_device)
+	if err := x.MsVmGenid.fromC(&tmp.ms_vm_genid); err != nil {
+		return fmt.Errorf("converting field MsVmGenid: %v", err)
+	}
+	if err := x.SerialList.fromC(&tmp.serial_list); err != nil {
+		return fmt.Errorf("converting field SerialList: %v", err)
+	}
+	if err := x.Rdm.fromC(&tmp.rdm); err != nil {
+		return fmt.Errorf("converting field Rdm: %v", err)
+	}
+	x.RdmMemBoundaryMemkb = uint64(tmp.rdm_mem_boundary_memkb)
+	x.McaCaps = uint64(tmp.mca_caps)
+	return nil
+}
+
+func (x *DomainBuildInfoTypeUnionPv) fromC(xc *C.libxl_domain_build_info) error {
+	if DomainType(xc._type) != DomainTypePv {
+		return errors.New("expected union key DomainTypePv")
+	}
+
+	tmp := (*C.libxl_domain_build_info_type_union_pv)(unsafe.Pointer(&xc.u[0]))
+	x.Kernel = C.GoString(tmp.kernel)
+	x.SlackMemkb = uint64(tmp.slack_memkb)
+	x.Bootloader = C.GoString(tmp.bootloader)
+	if err := x.BootloaderArgs.fromC(&tmp.bootloader_args); err != nil {
+		return fmt.Errorf("converting field BootloaderArgs: %v", err)
+	}
+	x.Cmdline = C.GoString(tmp.cmdline)
+	x.Ramdisk = C.GoString(tmp.ramdisk)
+	x.Features = C.GoString(tmp.features)
+	if err := x.E820Host.fromC(&tmp.e820_host); err != nil {
+		return fmt.Errorf("converting field E820Host: %v", err)
+	}
+	return nil
+}
+
+func (x *DomainBuildInfoTypeUnionPvh) fromC(xc *C.libxl_domain_build_info) error {
+	if DomainType(xc._type) != DomainTypePvh {
+		return errors.New("expected union key DomainTypePvh")
+	}
+
+	tmp := (*C.libxl_domain_build_info_type_union_pvh)(unsafe.Pointer(&xc.u[0]))
+	if err := x.Pvshim.fromC(&tmp.pvshim); err != nil {
+		return fmt.Errorf("converting field Pvshim: %v", err)
+	}
+	x.PvshimPath = C.GoString(tmp.pvshim_path)
+	x.PvshimCmdline = C.GoString(tmp.pvshim_cmdline)
+	x.PvshimExtra = C.GoString(tmp.pvshim_extra)
+	return nil
+}
+
+func (x *DomainBuildInfo) toC(xc *C.libxl_domain_build_info) (err error) {
+	defer func() {
+		if err != nil {
+			C.libxl_domain_build_info_dispose(xc)
+		}
+	}()
+
+	xc.max_vcpus = C.int(x.MaxVcpus)
+	if err := x.AvailVcpus.toC(&xc.avail_vcpus); err != nil {
+		return fmt.Errorf("converting field AvailVcpus: %v", err)
+	}
+	if err := x.Cpumap.toC(&xc.cpumap); err != nil {
+		return fmt.Errorf("converting field Cpumap: %v", err)
+	}
+	if err := x.Nodemap.toC(&xc.nodemap); err != nil {
+		return fmt.Errorf("converting field Nodemap: %v", err)
+	}
+	if numVcpuHardAffinity := len(x.VcpuHardAffinity); numVcpuHardAffinity > 0 {
+		xc.vcpu_hard_affinity = (*C.libxl_bitmap)(C.malloc(C.ulong(numVcpuHardAffinity) * C.sizeof_libxl_bitmap))
+		xc.num_vcpu_hard_affinity = C.int(numVcpuHardAffinity)
+		cVcpuHardAffinity := (*[1 << 28]C.libxl_bitmap)(unsafe.Pointer(xc.vcpu_hard_affinity))[:numVcpuHardAffinity:numVcpuHardAffinity]
+		for i, v := range x.VcpuHardAffinity {
+			if err := v.toC(&cVcpuHardAffinity[i]); err != nil {
+				return fmt.Errorf("converting field VcpuHardAffinity: %v", err)
+			}
+		}
+	}
+	if numVcpuSoftAffinity := len(x.VcpuSoftAffinity); numVcpuSoftAffinity > 0 {
+		xc.vcpu_soft_affinity = (*C.libxl_bitmap)(C.malloc(C.ulong(numVcpuSoftAffinity) * C.sizeof_libxl_bitmap))
+		xc.num_vcpu_soft_affinity = C.int(numVcpuSoftAffinity)
+		cVcpuSoftAffinity := (*[1 << 28]C.libxl_bitmap)(unsafe.Pointer(xc.vcpu_soft_affinity))[:numVcpuSoftAffinity:numVcpuSoftAffinity]
+		for i, v := range x.VcpuSoftAffinity {
+			if err := v.toC(&cVcpuSoftAffinity[i]); err != nil {
+				return fmt.Errorf("converting field VcpuSoftAffinity: %v", err)
+			}
+		}
+	}
+	if err := x.NumaPlacement.toC(&xc.numa_placement); err != nil {
+		return fmt.Errorf("converting field NumaPlacement: %v", err)
+	}
+	xc.tsc_mode = C.libxl_tsc_mode(x.TscMode)
+	xc.max_memkb = C.uint64_t(x.MaxMemkb)
+	xc.target_memkb = C.uint64_t(x.TargetMemkb)
+	xc.video_memkb = C.uint64_t(x.VideoMemkb)
+	xc.shadow_memkb = C.uint64_t(x.ShadowMemkb)
+	xc.iommu_memkb = C.uint64_t(x.IommuMemkb)
+	xc.rtc_timeoffset = C.uint32_t(x.RtcTimeoffset)
+	xc.exec_ssidref = C.uint32_t(x.ExecSsidref)
+	if x.ExecSsidLabel != "" {
+		xc.exec_ssid_label = C.CString(x.ExecSsidLabel)
+	}
+	if err := x.Localtime.toC(&xc.localtime); err != nil {
+		return fmt.Errorf("converting field Localtime: %v", err)
+	}
+	if err := x.DisableMigrate.toC(&xc.disable_migrate); err != nil {
+		return fmt.Errorf("converting field DisableMigrate: %v", err)
+	}
+	if err := x.Cpuid.toC(&xc.cpuid); err != nil {
+		return fmt.Errorf("converting field Cpuid: %v", err)
+	}
+	if x.BlkdevStart != "" {
+		xc.blkdev_start = C.CString(x.BlkdevStart)
+	}
+	if numVnumaNodes := len(x.VnumaNodes); numVnumaNodes > 0 {
+		xc.vnuma_nodes = (*C.libxl_vnode_info)(C.malloc(C.ulong(numVnumaNodes) * C.sizeof_libxl_vnode_info))
+		xc.num_vnuma_nodes = C.int(numVnumaNodes)
+		cVnumaNodes := (*[1 << 28]C.libxl_vnode_info)(unsafe.Pointer(xc.vnuma_nodes))[:numVnumaNodes:numVnumaNodes]
+		for i, v := range x.VnumaNodes {
+			if err := v.toC(&cVnumaNodes[i]); err != nil {
+				return fmt.Errorf("converting field VnumaNodes: %v", err)
+			}
+		}
+	}
+	xc.max_grant_frames = C.uint32_t(x.MaxGrantFrames)
+	xc.max_maptrack_frames = C.uint32_t(x.MaxMaptrackFrames)
+	xc.device_model_version = C.libxl_device_model_version(x.DeviceModelVersion)
+	if err := x.DeviceModelStubdomain.toC(&xc.device_model_stubdomain); err != nil {
+		return fmt.Errorf("converting field DeviceModelStubdomain: %v", err)
+	}
+	if x.DeviceModel != "" {
+		xc.device_model = C.CString(x.DeviceModel)
+	}
+	xc.device_model_ssidref = C.uint32_t(x.DeviceModelSsidref)
+	if x.DeviceModelSsidLabel != "" {
+		xc.device_model_ssid_label = C.CString(x.DeviceModelSsidLabel)
+	}
+	if x.DeviceModelUser != "" {
+		xc.device_model_user = C.CString(x.DeviceModelUser)
+	}
+	if err := x.Extra.toC(&xc.extra); err != nil {
+		return fmt.Errorf("converting field Extra: %v", err)
+	}
+	if err := x.ExtraPv.toC(&xc.extra_pv); err != nil {
+		return fmt.Errorf("converting field ExtraPv: %v", err)
+	}
+	if err := x.ExtraHvm.toC(&xc.extra_hvm); err != nil {
+		return fmt.Errorf("converting field ExtraHvm: %v", err)
+	}
+	if err := x.SchedParams.toC(&xc.sched_params); err != nil {
+		return fmt.Errorf("converting field SchedParams: %v", err)
+	}
+	if numIoports := len(x.Ioports); numIoports > 0 {
+		xc.ioports = (*C.libxl_ioport_range)(C.malloc(C.ulong(numIoports) * C.sizeof_libxl_ioport_range))
+		xc.num_ioports = C.int(numIoports)
+		cIoports := (*[1 << 28]C.libxl_ioport_range)(unsafe.Pointer(xc.ioports))[:numIoports:numIoports]
+		for i, v := range x.Ioports {
+			if err := v.toC(&cIoports[i]); err != nil {
+				return fmt.Errorf("converting field Ioports: %v", err)
+			}
+		}
+	}
+	if numIrqs := len(x.Irqs); numIrqs > 0 {
+		xc.irqs = (*C.uint32_t)(C.malloc(C.size_t(numIrqs * numIrqs)))
+		xc.num_irqs = C.int(numIrqs)
+		cIrqs := (*[1 << 28]C.uint32_t)(unsafe.Pointer(xc.irqs))[:numIrqs:numIrqs]
+		for i, v := range x.Irqs {
+			cIrqs[i] = C.uint32_t(v)
+		}
+	}
+	if numIomem := len(x.Iomem); numIomem > 0 {
+		xc.iomem = (*C.libxl_iomem_range)(C.malloc(C.ulong(numIomem) * C.sizeof_libxl_iomem_range))
+		xc.num_iomem = C.int(numIomem)
+		cIomem := (*[1 << 28]C.libxl_iomem_range)(unsafe.Pointer(xc.iomem))[:numIomem:numIomem]
+		for i, v := range x.Iomem {
+			if err := v.toC(&cIomem[i]); err != nil {
+				return fmt.Errorf("converting field Iomem: %v", err)
+			}
+		}
+	}
+	if err := x.ClaimMode.toC(&xc.claim_mode); err != nil {
+		return fmt.Errorf("converting field ClaimMode: %v", err)
+	}
+	xc.event_channels = C.uint32_t(x.EventChannels)
+	if x.Kernel != "" {
+		xc.kernel = C.CString(x.Kernel)
+	}
+	if x.Cmdline != "" {
+		xc.cmdline = C.CString(x.Cmdline)
+	}
+	if x.Ramdisk != "" {
+		xc.ramdisk = C.CString(x.Ramdisk)
+	}
+	if x.DeviceTree != "" {
+		xc.device_tree = C.CString(x.DeviceTree)
+	}
+	if err := x.Acpi.toC(&xc.acpi); err != nil {
+		return fmt.Errorf("converting field Acpi: %v", err)
+	}
+	if x.Bootloader != "" {
+		xc.bootloader = C.CString(x.Bootloader)
+	}
+	if err := x.BootloaderArgs.toC(&xc.bootloader_args); err != nil {
+		return fmt.Errorf("converting field BootloaderArgs: %v", err)
+	}
+	xc.timer_mode = C.libxl_timer_mode(x.TimerMode)
+	if err := x.NestedHvm.toC(&xc.nested_hvm); err != nil {
+		return fmt.Errorf("converting field NestedHvm: %v", err)
+	}
+	if err := x.Apic.toC(&xc.apic); err != nil {
+		return fmt.Errorf("converting field Apic: %v", err)
+	}
+	if err := x.DmRestrict.toC(&xc.dm_restrict); err != nil {
+		return fmt.Errorf("converting field DmRestrict: %v", err)
+	}
+	xc.tee = C.libxl_tee_type(x.Tee)
+	xc._type = C.libxl_domain_type(x.Type)
+	switch x.Type {
+	case DomainTypeHvm:
+		tmp, ok := x.TypeUnion.(DomainBuildInfoTypeUnionHvm)
+		if !ok {
+			return errors.New("wrong type for union key type")
+		}
+		var hvm C.libxl_domain_build_info_type_union_hvm
+		if tmp.Firmware != "" {
+			hvm.firmware = C.CString(tmp.Firmware)
+		}
+		hvm.bios = C.libxl_bios_type(tmp.Bios)
+		if err := tmp.Pae.toC(&hvm.pae); err != nil {
+			return fmt.Errorf("converting field Pae: %v", err)
+		}
+		if err := tmp.Apic.toC(&hvm.apic); err != nil {
+			return fmt.Errorf("converting field Apic: %v", err)
+		}
+		if err := tmp.Acpi.toC(&hvm.acpi); err != nil {
+			return fmt.Errorf("converting field Acpi: %v", err)
+		}
+		if err := tmp.AcpiS3.toC(&hvm.acpi_s3); err != nil {
+			return fmt.Errorf("converting field AcpiS3: %v", err)
+		}
+		if err := tmp.AcpiS4.toC(&hvm.acpi_s4); err != nil {
+			return fmt.Errorf("converting field AcpiS4: %v", err)
+		}
+		if err := tmp.AcpiLaptopSlate.toC(&hvm.acpi_laptop_slate); err != nil {
+			return fmt.Errorf("converting field AcpiLaptopSlate: %v", err)
+		}
+		if err := tmp.Nx.toC(&hvm.nx); err != nil {
+			return fmt.Errorf("converting field Nx: %v", err)
+		}
+		if err := tmp.Viridian.toC(&hvm.viridian); err != nil {
+			return fmt.Errorf("converting field Viridian: %v", err)
+		}
+		if err := tmp.ViridianEnable.toC(&hvm.viridian_enable); err != nil {
+			return fmt.Errorf("converting field ViridianEnable: %v", err)
+		}
+		if err := tmp.ViridianDisable.toC(&hvm.viridian_disable); err != nil {
+			return fmt.Errorf("converting field ViridianDisable: %v", err)
+		}
+		if tmp.Timeoffset != "" {
+			hvm.timeoffset = C.CString(tmp.Timeoffset)
+		}
+		if err := tmp.Hpet.toC(&hvm.hpet); err != nil {
+			return fmt.Errorf("converting field Hpet: %v", err)
+		}
+		if err := tmp.VptAlign.toC(&hvm.vpt_align); err != nil {
+			return fmt.Errorf("converting field VptAlign: %v", err)
+		}
+		hvm.mmio_hole_memkb = C.uint64_t(tmp.MmioHoleMemkb)
+		hvm.timer_mode = C.libxl_timer_mode(tmp.TimerMode)
+		if err := tmp.NestedHvm.toC(&hvm.nested_hvm); err != nil {
+			return fmt.Errorf("converting field NestedHvm: %v", err)
+		}
+		if err := tmp.Altp2M.toC(&hvm.altp2m); err != nil {
+			return fmt.Errorf("converting field Altp2M: %v", err)
+		}
+		if tmp.SystemFirmware != "" {
+			hvm.system_firmware = C.CString(tmp.SystemFirmware)
+		}
+		if tmp.SmbiosFirmware != "" {
+			hvm.smbios_firmware = C.CString(tmp.SmbiosFirmware)
+		}
+		if tmp.AcpiFirmware != "" {
+			hvm.acpi_firmware = C.CString(tmp.AcpiFirmware)
+		}
+		hvm.hdtype = C.libxl_hdtype(tmp.Hdtype)
+		if err := tmp.Nographic.toC(&hvm.nographic); err != nil {
+			return fmt.Errorf("converting field Nographic: %v", err)
+		}
+		if err := tmp.Vga.toC(&hvm.vga); err != nil {
+			return fmt.Errorf("converting field Vga: %v", err)
+		}
+		if err := tmp.Vnc.toC(&hvm.vnc); err != nil {
+			return fmt.Errorf("converting field Vnc: %v", err)
+		}
+		if tmp.Keymap != "" {
+			hvm.keymap = C.CString(tmp.Keymap)
+		}
+		if err := tmp.Sdl.toC(&hvm.sdl); err != nil {
+			return fmt.Errorf("converting field Sdl: %v", err)
+		}
+		if err := tmp.Spice.toC(&hvm.spice); err != nil {
+			return fmt.Errorf("converting field Spice: %v", err)
+		}
+		if err := tmp.GfxPassthru.toC(&hvm.gfx_passthru); err != nil {
+			return fmt.Errorf("converting field GfxPassthru: %v", err)
+		}
+		hvm.gfx_passthru_kind = C.libxl_gfx_passthru_kind(tmp.GfxPassthruKind)
+		if tmp.Serial != "" {
+			hvm.serial = C.CString(tmp.Serial)
+		}
+		if tmp.Boot != "" {
+			hvm.boot = C.CString(tmp.Boot)
+		}
+		if err := tmp.Usb.toC(&hvm.usb); err != nil {
+			return fmt.Errorf("converting field Usb: %v", err)
+		}
+		hvm.usbversion = C.int(tmp.Usbversion)
+		if tmp.Usbdevice != "" {
+			hvm.usbdevice = C.CString(tmp.Usbdevice)
+		}
+		if err := tmp.VkbDevice.toC(&hvm.vkb_device); err != nil {
+			return fmt.Errorf("converting field VkbDevice: %v", err)
+		}
+		if tmp.Soundhw != "" {
+			hvm.soundhw = C.CString(tmp.Soundhw)
+		}
+		if err := tmp.XenPlatformPci.toC(&hvm.xen_platform_pci); err != nil {
+			return fmt.Errorf("converting field XenPlatformPci: %v", err)
+		}
+		if err := tmp.UsbdeviceList.toC(&hvm.usbdevice_list); err != nil {
+			return fmt.Errorf("converting field UsbdeviceList: %v", err)
+		}
+		hvm.vendor_device = C.libxl_vendor_device(tmp.VendorDevice)
+		if err := tmp.MsVmGenid.toC(&hvm.ms_vm_genid); err != nil {
+			return fmt.Errorf("converting field MsVmGenid: %v", err)
+		}
+		if err := tmp.SerialList.toC(&hvm.serial_list); err != nil {
+			return fmt.Errorf("converting field SerialList: %v", err)
+		}
+		if err := tmp.Rdm.toC(&hvm.rdm); err != nil {
+			return fmt.Errorf("converting field Rdm: %v", err)
+		}
+		hvm.rdm_mem_boundary_memkb = C.uint64_t(tmp.RdmMemBoundaryMemkb)
+		hvm.mca_caps = C.uint64_t(tmp.McaCaps)
+		hvmBytes := C.GoBytes(unsafe.Pointer(&hvm), C.sizeof_libxl_domain_build_info_type_union_hvm)
+		copy(xc.u[:], hvmBytes)
+	case DomainTypePv:
+		tmp, ok := x.TypeUnion.(DomainBuildInfoTypeUnionPv)
+		if !ok {
+			return errors.New("wrong type for union key type")
+		}
+		var pv C.libxl_domain_build_info_type_union_pv
+		if tmp.Kernel != "" {
+			pv.kernel = C.CString(tmp.Kernel)
+		}
+		pv.slack_memkb = C.uint64_t(tmp.SlackMemkb)
+		if tmp.Bootloader != "" {
+			pv.bootloader = C.CString(tmp.Bootloader)
+		}
+		if err := tmp.BootloaderArgs.toC(&pv.bootloader_args); err != nil {
+			return fmt.Errorf("converting field BootloaderArgs: %v", err)
+		}
+		if tmp.Cmdline != "" {
+			pv.cmdline = C.CString(tmp.Cmdline)
+		}
+		if tmp.Ramdisk != "" {
+			pv.ramdisk = C.CString(tmp.Ramdisk)
+		}
+		if tmp.Features != "" {
+			pv.features = C.CString(tmp.Features)
+		}
+		if err := tmp.E820Host.toC(&pv.e820_host); err != nil {
+			return fmt.Errorf("converting field E820Host: %v", err)
+		}
+		pvBytes := C.GoBytes(unsafe.Pointer(&pv), C.sizeof_libxl_domain_build_info_type_union_pv)
+		copy(xc.u[:], pvBytes)
+	case DomainTypePvh:
+		tmp, ok := x.TypeUnion.(DomainBuildInfoTypeUnionPvh)
+		if !ok {
+			return errors.New("wrong type for union key type")
+		}
+		var pvh C.libxl_domain_build_info_type_union_pvh
+		if err := tmp.Pvshim.toC(&pvh.pvshim); err != nil {
+			return fmt.Errorf("converting field Pvshim: %v", err)
+		}
+		if tmp.PvshimPath != "" {
+			pvh.pvshim_path = C.CString(tmp.PvshimPath)
+		}
+		if tmp.PvshimCmdline != "" {
+			pvh.pvshim_cmdline = C.CString(tmp.PvshimCmdline)
+		}
+		if tmp.PvshimExtra != "" {
+			pvh.pvshim_extra = C.CString(tmp.PvshimExtra)
+		}
+		pvhBytes := C.GoBytes(unsafe.Pointer(&pvh), C.sizeof_libxl_domain_build_info_type_union_pvh)
+		copy(xc.u[:], pvhBytes)
+	case DomainTypeInvalid:
+		break
+	default:
+		return fmt.Errorf("invalid union key '%v'", x.Type)
+	}
+	xc.arch_arm.gic_version = C.libxl_gic_version(x.ArchArm.GicVersion)
+	xc.arch_arm.vuart = C.libxl_vuart_type(x.ArchArm.Vuart)
+	xc.altp2m = C.libxl_altp2m_mode(x.Altp2M)
+
+	return nil
+}
+
+// NewDeviceVfb returns an instance of DeviceVfb initialized with defaults.
+func NewDeviceVfb() (*DeviceVfb, error) {
+	var (
+		x  DeviceVfb
+		xc C.libxl_device_vfb
+	)
+
+	C.libxl_device_vfb_init(&xc)
+	defer C.libxl_device_vfb_dispose(&xc)
+
+	if err := x.fromC(&xc); err != nil {
+		return nil, err
+	}
+
+	return &x, nil
+}
+
+func (x *DeviceVfb) fromC(xc *C.libxl_device_vfb) error {
+	x.BackendDomid = Domid(xc.backend_domid)
+	x.BackendDomname = C.GoString(xc.backend_domname)
+	x.Devid = Devid(xc.devid)
+	if err := x.Vnc.fromC(&xc.vnc); err != nil {
+		return fmt.Errorf("converting field Vnc: %v", err)
+	}
+	if err := x.Sdl.fromC(&xc.sdl); err != nil {
+		return fmt.Errorf("converting field Sdl: %v", err)
+	}
+	x.Keymap = C.GoString(xc.keymap)
+
+	return nil
+}
+
+func (x *DeviceVfb) toC(xc *C.libxl_device_vfb) (err error) {
+	defer func() {
+		if err != nil {
+			C.libxl_device_vfb_dispose(xc)
+		}
+	}()
+
+	xc.backend_domid = C.libxl_domid(x.BackendDomid)
+	if x.BackendDomname != "" {
+		xc.backend_domname = C.CString(x.BackendDomname)
+	}
+	xc.devid = C.libxl_devid(x.Devid)
+	if err := x.Vnc.toC(&xc.vnc); err != nil {
+		return fmt.Errorf("converting field Vnc: %v", err)
+	}
+	if err := x.Sdl.toC(&xc.sdl); err != nil {
+		return fmt.Errorf("converting field Sdl: %v", err)
+	}
+	if x.Keymap != "" {
+		xc.keymap = C.CString(x.Keymap)
+	}
+
+	return nil
+}
+
+// NewDeviceVkb returns an instance of DeviceVkb initialized with defaults.
+func NewDeviceVkb() (*DeviceVkb, error) {
+	var (
+		x  DeviceVkb
+		xc C.libxl_device_vkb
+	)
+
+	C.libxl_device_vkb_init(&xc)
+	defer C.libxl_device_vkb_dispose(&xc)
+
+	if err := x.fromC(&xc); err != nil {
+		return nil, err
+	}
+
+	return &x, nil
+}
+
+func (x *DeviceVkb) fromC(xc *C.libxl_device_vkb) error {
+	x.BackendDomid = Domid(xc.backend_domid)
+	x.BackendDomname = C.GoString(xc.backend_domname)
+	x.Devid = Devid(xc.devid)
+	x.BackendType = VkbBackend(xc.backend_type)
+	x.UniqueId = C.GoString(xc.unique_id)
+	x.FeatureDisableKeyboard = bool(xc.feature_disable_keyboard)
+	x.FeatureDisablePointer = bool(xc.feature_disable_pointer)
+	x.FeatureAbsPointer = bool(xc.feature_abs_pointer)
+	x.FeatureRawPointer = bool(xc.feature_raw_pointer)
+	x.FeatureMultiTouch = bool(xc.feature_multi_touch)
+	x.Width = uint32(xc.width)
+	x.Height = uint32(xc.height)
+	x.MultiTouchWidth = uint32(xc.multi_touch_width)
+	x.MultiTouchHeight = uint32(xc.multi_touch_height)
+	x.MultiTouchNumContacts = uint32(xc.multi_touch_num_contacts)
+
+	return nil
+}
+
+func (x *DeviceVkb) toC(xc *C.libxl_device_vkb) (err error) {
+	defer func() {
+		if err != nil {
+			C.libxl_device_vkb_dispose(xc)
+		}
+	}()
+
+	xc.backend_domid = C.libxl_domid(x.BackendDomid)
+	if x.BackendDomname != "" {
+		xc.backend_domname = C.CString(x.BackendDomname)
+	}
+	xc.devid = C.libxl_devid(x.Devid)
+	xc.backend_type = C.libxl_vkb_backend(x.BackendType)
+	if x.UniqueId != "" {
+		xc.unique_id = C.CString(x.UniqueId)
+	}
+	xc.feature_disable_keyboard = C.bool(x.FeatureDisableKeyboard)
+	xc.feature_disable_pointer = C.bool(x.FeatureDisablePointer)
+	xc.feature_abs_pointer = C.bool(x.FeatureAbsPointer)
+	xc.feature_raw_pointer = C.bool(x.FeatureRawPointer)
+	xc.feature_multi_touch = C.bool(x.FeatureMultiTouch)
+	xc.width = C.uint32_t(x.Width)
+	xc.height = C.uint32_t(x.Height)
+	xc.multi_touch_width = C.uint32_t(x.MultiTouchWidth)
+	xc.multi_touch_height = C.uint32_t(x.MultiTouchHeight)
+	xc.multi_touch_num_contacts = C.uint32_t(x.MultiTouchNumContacts)
+
+	return nil
+}
+
+// NewDeviceDisk returns an instance of DeviceDisk initialized with defaults.
+func NewDeviceDisk() (*DeviceDisk, error) {
+	var (
+		x  DeviceDisk
+		xc C.libxl_device_disk
+	)
+
+	C.libxl_device_disk_init(&xc)
+	defer C.libxl_device_disk_dispose(&xc)
+
+	if err := x.fromC(&xc); err != nil {
+		return nil, err
+	}
+
+	return &x, nil
+}
+
+func (x *DeviceDisk) fromC(xc *C.libxl_device_disk) error {
+	x.BackendDomid = Domid(xc.backend_domid)
+	x.BackendDomname = C.GoString(xc.backend_domname)
+	x.PdevPath = C.GoString(xc.pdev_path)
+	x.Vdev = C.GoString(xc.vdev)
+	x.Backend = DiskBackend(xc.backend)
+	x.Format = DiskFormat(xc.format)
+	x.Script = C.GoString(xc.script)
+	x.Removable = int(xc.removable)
+	x.Readwrite = int(xc.readwrite)
+	x.IsCdrom = int(xc.is_cdrom)
+	x.DirectIoSafe = bool(xc.direct_io_safe)
+	if err := x.DiscardEnable.fromC(&xc.discard_enable); err != nil {
+		return fmt.Errorf("converting field DiscardEnable: %v", err)
+	}
+	if err := x.ColoEnable.fromC(&xc.colo_enable); err != nil {
+		return fmt.Errorf("converting field ColoEnable: %v", err)
+	}
+	if err := x.ColoRestoreEnable.fromC(&xc.colo_restore_enable); err != nil {
+		return fmt.Errorf("converting field ColoRestoreEnable: %v", err)
+	}
+	x.ColoHost = C.GoString(xc.colo_host)
+	x.ColoPort = int(xc.colo_port)
+	x.ColoExport = C.GoString(xc.colo_export)
+	x.ActiveDisk = C.GoString(xc.active_disk)
+	x.HiddenDisk = C.GoString(xc.hidden_disk)
+
+	return nil
+}
+
+func (x *DeviceDisk) toC(xc *C.libxl_device_disk) (err error) {
+	defer func() {
+		if err != nil {
+			C.libxl_device_disk_dispose(xc)
+		}
+	}()
+
+	xc.backend_domid = C.libxl_domid(x.BackendDomid)
+	if x.BackendDomname != "" {
+		xc.backend_domname = C.CString(x.BackendDomname)
+	}
+	if x.PdevPath != "" {
+		xc.pdev_path = C.CString(x.PdevPath)
+	}
+	if x.Vdev != "" {
+		xc.vdev = C.CString(x.Vdev)
+	}
+	xc.backend = C.libxl_disk_backend(x.Backend)
+	xc.format = C.libxl_disk_format(x.Format)
+	if x.Script != "" {
+		xc.script = C.CString(x.Script)
+	}
+	xc.removable = C.int(x.Removable)
+	xc.readwrite = C.int(x.Readwrite)
+	xc.is_cdrom = C.int(x.IsCdrom)
+	xc.direct_io_safe = C.bool(x.DirectIoSafe)
+	if err := x.DiscardEnable.toC(&xc.discard_enable); err != nil {
+		return fmt.Errorf("converting field DiscardEnable: %v", err)
+	}
+	if err := x.ColoEnable.toC(&xc.colo_enable); err != nil {
+		return fmt.Errorf("converting field ColoEnable: %v", err)
+	}
+	if err := x.ColoRestoreEnable.toC(&xc.colo_restore_enable); err != nil {
+		return fmt.Errorf("converting field ColoRestoreEnable: %v", err)
+	}
+	if x.ColoHost != "" {
+		xc.colo_host = C.CString(x.ColoHost)
+	}
+	xc.colo_port = C.int(x.ColoPort)
+	if x.ColoExport != "" {
+		xc.colo_export = C.CString(x.ColoExport)
+	}
+	if x.ActiveDisk != "" {
+		xc.active_disk = C.CString(x.ActiveDisk)
+	}
+	if x.HiddenDisk != "" {
+		xc.hidden_disk = C.CString(x.HiddenDisk)
+	}
+
+	return nil
+}
+
+// NewDeviceNic returns an instance of DeviceNic initialized with defaults.
+func NewDeviceNic() (*DeviceNic, error) {
+	var (
+		x  DeviceNic
+		xc C.libxl_device_nic
+	)
+
+	C.libxl_device_nic_init(&xc)
+	defer C.libxl_device_nic_dispose(&xc)
+
+	if err := x.fromC(&xc); err != nil {
+		return nil, err
+	}
+
+	return &x, nil
+}
+
+func (x *DeviceNic) fromC(xc *C.libxl_device_nic) error {
+	x.BackendDomid = Domid(xc.backend_domid)
+	x.BackendDomname = C.GoString(xc.backend_domname)
+	x.Devid = Devid(xc.devid)
+	x.Mtu = int(xc.mtu)
+	x.Model = C.GoString(xc.model)
+	if err := x.Mac.fromC(&xc.mac); err != nil {
+		return fmt.Errorf("converting field Mac: %v", err)
+	}
+	x.Ip = C.GoString(xc.ip)
+	x.Bridge = C.GoString(xc.bridge)
+	x.Ifname = C.GoString(xc.ifname)
+	x.Script = C.GoString(xc.script)
+	x.Nictype = NicType(xc.nictype)
+	x.RateBytesPerInterval = uint64(xc.rate_bytes_per_interval)
+	x.RateIntervalUsecs = uint32(xc.rate_interval_usecs)
+	x.Gatewaydev = C.GoString(xc.gatewaydev)
+	x.ColoftForwarddev = C.GoString(xc.coloft_forwarddev)
+	x.ColoSockMirrorId = C.GoString(xc.colo_sock_mirror_id)
+	x.ColoSockMirrorIp = C.GoString(xc.colo_sock_mirror_ip)
+	x.ColoSockMirrorPort = C.GoString(xc.colo_sock_mirror_port)
+	x.ColoSockComparePriInId = C.GoString(xc.colo_sock_compare_pri_in_id)
+	x.ColoSockComparePriInIp = C.GoString(xc.colo_sock_compare_pri_in_ip)
+	x.ColoSockComparePriInPort = C.GoString(xc.colo_sock_compare_pri_in_port)
+	x.ColoSockCompareSecInId = C.GoString(xc.colo_sock_compare_sec_in_id)
+	x.ColoSockCompareSecInIp = C.GoString(xc.colo_sock_compare_sec_in_ip)
+	x.ColoSockCompareSecInPort = C.GoString(xc.colo_sock_compare_sec_in_port)
+	x.ColoSockCompareNotifyId = C.GoString(xc.colo_sock_compare_notify_id)
+	x.ColoSockCompareNotifyIp = C.GoString(xc.colo_sock_compare_notify_ip)
+	x.ColoSockCompareNotifyPort = C.GoString(xc.colo_sock_compare_notify_port)
+	x.ColoSockRedirector0Id = C.GoString(xc.colo_sock_redirector0_id)
+	x.ColoSockRedirector0Ip = C.GoString(xc.colo_sock_redirector0_ip)
+	x.ColoSockRedirector0Port = C.GoString(xc.colo_sock_redirector0_port)
+	x.ColoSockRedirector1Id = C.GoString(xc.colo_sock_redirector1_id)
+	x.ColoSockRedirector1Ip = C.GoString(xc.colo_sock_redirector1_ip)
+	x.ColoSockRedirector1Port = C.GoString(xc.colo_sock_redirector1_port)
+	x.ColoSockRedirector2Id = C.GoString(xc.colo_sock_redirector2_id)
+	x.ColoSockRedirector2Ip = C.GoString(xc.colo_sock_redirector2_ip)
+	x.ColoSockRedirector2Port = C.GoString(xc.colo_sock_redirector2_port)
+	x.ColoFilterMirrorQueue = C.GoString(xc.colo_filter_mirror_queue)
+	x.ColoFilterMirrorOutdev = C.GoString(xc.colo_filter_mirror_outdev)
+	x.ColoFilterRedirector0Queue = C.GoString(xc.colo_filter_redirector0_queue)
+	x.ColoFilterRedirector0Indev = C.GoString(xc.colo_filter_redirector0_indev)
+	x.ColoFilterRedirector0Outdev = C.GoString(xc.colo_filter_redirector0_outdev)
+	x.ColoFilterRedirector1Queue = C.GoString(xc.colo_filter_redirector1_queue)
+	x.ColoFilterRedirector1Indev = C.GoString(xc.colo_filter_redirector1_indev)
+	x.ColoFilterRedirector1Outdev = C.GoString(xc.colo_filter_redirector1_outdev)
+	x.ColoComparePriIn = C.GoString(xc.colo_compare_pri_in)
+	x.ColoCompareSecIn = C.GoString(xc.colo_compare_sec_in)
+	x.ColoCompareOut = C.GoString(xc.colo_compare_out)
+	x.ColoCompareNotifyDev = C.GoString(xc.colo_compare_notify_dev)
+	x.ColoSockSecRedirector0Id = C.GoString(xc.colo_sock_sec_redirector0_id)
+	x.ColoSockSecRedirector0Ip = C.GoString(xc.colo_sock_sec_redirector0_ip)
+	x.ColoSockSecRedirector0Port = C.GoString(xc.colo_sock_sec_redirector0_port)
+	x.ColoSockSecRedirector1Id = C.GoString(xc.colo_sock_sec_redirector1_id)
+	x.ColoSockSecRedirector1Ip = C.GoString(xc.colo_sock_sec_redirector1_ip)
+	x.ColoSockSecRedirector1Port = C.GoString(xc.colo_sock_sec_redirector1_port)
+	x.ColoFilterSecRedirector0Queue = C.GoString(xc.colo_filter_sec_redirector0_queue)
+	x.ColoFilterSecRedirector0Indev = C.GoString(xc.colo_filter_sec_redirector0_indev)
+	x.ColoFilterSecRedirector0Outdev = C.GoString(xc.colo_filter_sec_redirector0_outdev)
+	x.ColoFilterSecRedirector1Queue = C.GoString(xc.colo_filter_sec_redirector1_queue)
+	x.ColoFilterSecRedirector1Indev = C.GoString(xc.colo_filter_sec_redirector1_indev)
+	x.ColoFilterSecRedirector1Outdev = C.GoString(xc.colo_filter_sec_redirector1_outdev)
+	x.ColoFilterSecRewriter0Queue = C.GoString(xc.colo_filter_sec_rewriter0_queue)
+	x.ColoCheckpointHost = C.GoString(xc.colo_checkpoint_host)
+	x.ColoCheckpointPort = C.GoString(xc.colo_checkpoint_port)
+
+	return nil
+}
+
+func (x *DeviceNic) toC(xc *C.libxl_device_nic) (err error) {
+	defer func() {
+		if err != nil {
+			C.libxl_device_nic_dispose(xc)
+		}
+	}()
+
+	xc.backend_domid = C.libxl_domid(x.BackendDomid)
+	if x.BackendDomname != "" {
+		xc.backend_domname = C.CString(x.BackendDomname)
+	}
+	xc.devid = C.libxl_devid(x.Devid)
+	xc.mtu = C.int(x.Mtu)
+	if x.Model != "" {
+		xc.model = C.CString(x.Model)
+	}
+	if err := x.Mac.toC(&xc.mac); err != nil {
+		return fmt.Errorf("converting field Mac: %v", err)
+	}
+	if x.Ip != "" {
+		xc.ip = C.CString(x.Ip)
+	}
+	if x.Bridge != "" {
+		xc.bridge = C.CString(x.Bridge)
+	}
+	if x.Ifname != "" {
+		xc.ifname = C.CString(x.Ifname)
+	}
+	if x.Script != "" {
+		xc.script = C.CString(x.Script)
+	}
+	xc.nictype = C.libxl_nic_type(x.Nictype)
+	xc.rate_bytes_per_interval = C.uint64_t(x.RateBytesPerInterval)
+	xc.rate_interval_usecs = C.uint32_t(x.RateIntervalUsecs)
+	if x.Gatewaydev != "" {
+		xc.gatewaydev = C.CString(x.Gatewaydev)
+	}
+	if x.ColoftForwarddev != "" {
+		xc.coloft_forwarddev = C.CString(x.ColoftForwarddev)
+	}
+	if x.ColoSockMirrorId != "" {
+		xc.colo_sock_mirror_id = C.CString(x.ColoSockMirrorId)
+	}
+	if x.ColoSockMirrorIp != "" {
+		xc.colo_sock_mirror_ip = C.CString(x.ColoSockMirrorIp)
+	}
+	if x.ColoSockMirrorPort != "" {
+		xc.colo_sock_mirror_port = C.CString(x.ColoSockMirrorPort)
+	}
+	if x.ColoSockComparePriInId != "" {
+		xc.colo_sock_compare_pri_in_id = C.CString(x.ColoSockComparePriInId)
+	}
+	if x.ColoSockComparePriInIp != "" {
+		xc.colo_sock_compare_pri_in_ip = C.CString(x.ColoSockComparePriInIp)
+	}
+	if x.ColoSockComparePriInPort != "" {
+		xc.colo_sock_compare_pri_in_port = C.CString(x.ColoSockComparePriInPort)
+	}
+	if x.ColoSockCompareSecInId != "" {
+		xc.colo_sock_compare_sec_in_id = C.CString(x.ColoSockCompareSecInId)
+	}
+	if x.ColoSockCompareSecInIp != "" {
+		xc.colo_sock_compare_sec_in_ip = C.CString(x.ColoSockCompareSecInIp)
+	}
+	if x.ColoSockCompareSecInPort != "" {
+		xc.colo_sock_compare_sec_in_port = C.CString(x.ColoSockCompareSecInPort)
+	}
+	if x.ColoSockCompareNotifyId != "" {
+		xc.colo_sock_compare_notify_id = C.CString(x.ColoSockCompareNotifyId)
+	}
+	if x.ColoSockCompareNotifyIp != "" {
+		xc.colo_sock_compare_notify_ip = C.CString(x.ColoSockCompareNotifyIp)
+	}
+	if x.ColoSockCompareNotifyPort != "" {
+		xc.colo_sock_compare_notify_port = C.CString(x.ColoSockCompareNotifyPort)
+	}
+	if x.ColoSockRedirector0Id != "" {
+		xc.colo_sock_redirector0_id = C.CString(x.ColoSockRedirector0Id)
+	}
+	if x.ColoSockRedirector0Ip != "" {
+		xc.colo_sock_redirector0_ip = C.CString(x.ColoSockRedirector0Ip)
+	}
+	if x.ColoSockRedirector0Port != "" {
+		xc.colo_sock_redirector0_port = C.CString(x.ColoSockRedirector0Port)
+	}
+	if x.ColoSockRedirector1Id != "" {
+		xc.colo_sock_redirector1_id = C.CString(x.ColoSockRedirector1Id)
+	}
+	if x.ColoSockRedirector1Ip != "" {
+		xc.colo_sock_redirector1_ip = C.CString(x.ColoSockRedirector1Ip)
+	}
+	if x.ColoSockRedirector1Port != "" {
+		xc.colo_sock_redirector1_port = C.CString(x.ColoSockRedirector1Port)
+	}
+	if x.ColoSockRedirector2Id != "" {
+		xc.colo_sock_redirector2_id = C.CString(x.ColoSockRedirector2Id)
+	}
+	if x.ColoSockRedirector2Ip != "" {
+		xc.colo_sock_redirector2_ip = C.CString(x.ColoSockRedirector2Ip)
+	}
+	if x.ColoSockRedirector2Port != "" {
+		xc.colo_sock_redirector2_port = C.CString(x.ColoSockRedirector2Port)
+	}
+	if x.ColoFilterMirrorQueue != "" {
+		xc.colo_filter_mirror_queue = C.CString(x.ColoFilterMirrorQueue)
+	}
+	if x.ColoFilterMirrorOutdev != "" {
+		xc.colo_filter_mirror_outdev = C.CString(x.ColoFilterMirrorOutdev)
+	}
+	if x.ColoFilterRedirector0Queue != "" {
+		xc.colo_filter_redirector0_queue = C.CString(x.ColoFilterRedirector0Queue)
+	}
+	if x.ColoFilterRedirector0Indev != "" {
+		xc.colo_filter_redirector0_indev = C.CString(x.ColoFilterRedirector0Indev)
+	}
+	if x.ColoFilterRedirector0Outdev != "" {
+		xc.colo_filter_redirector0_outdev = C.CString(x.ColoFilterRedirector0Outdev)
+	}
+	if x.ColoFilterRedirector1Queue != "" {
+		xc.colo_filter_redirector1_queue = C.CString(x.ColoFilterRedirector1Queue)
+	}
+	if x.ColoFilterRedirector1Indev != "" {
+		xc.colo_filter_redirector1_indev = C.CString(x.ColoFilterRedirector1Indev)
+	}
+	if x.ColoFilterRedirector1Outdev != "" {
+		xc.colo_filter_redirector1_outdev = C.CString(x.ColoFilterRedirector1Outdev)
+	}
+	if x.ColoComparePriIn != "" {
+		xc.colo_compare_pri_in = C.CString(x.ColoComparePriIn)
+	}
+	if x.ColoCompareSecIn != "" {
+		xc.colo_compare_sec_in = C.CString(x.ColoCompareSecIn)
+	}
+	if x.ColoCompareOut != "" {
+		xc.colo_compare_out = C.CString(x.ColoCompareOut)
+	}
+	if x.ColoCompareNotifyDev != "" {
+		xc.colo_compare_notify_dev = C.CString(x.ColoCompareNotifyDev)
+	}
+	if x.ColoSockSecRedirector0Id != "" {
+		xc.colo_sock_sec_redirector0_id = C.CString(x.ColoSockSecRedirector0Id)
+	}
+	if x.ColoSockSecRedirector0Ip != "" {
+		xc.colo_sock_sec_redirector0_ip = C.CString(x.ColoSockSecRedirector0Ip)
+	}
+	if x.ColoSockSecRedirector0Port != "" {
+		xc.colo_sock_sec_redirector0_port = C.CString(x.ColoSockSecRedirector0Port)
+	}
+	if x.ColoSockSecRedirector1Id != "" {
+		xc.colo_sock_sec_redirector1_id = C.CString(x.ColoSockSecRedirector1Id)
+	}
+	if x.ColoSockSecRedirector1Ip != "" {
+		xc.colo_sock_sec_redirector1_ip = C.CString(x.ColoSockSecRedirector1Ip)
+	}
+	if x.ColoSockSecRedirector1Port != "" {
+		xc.colo_sock_sec_redirector1_port = C.CString(x.ColoSockSecRedirector1Port)
+	}
+	if x.ColoFilterSecRedirector0Queue != "" {
+		xc.colo_filter_sec_redirector0_queue = C.CString(x.ColoFilterSecRedirector0Queue)
+	}
+	if x.ColoFilterSecRedirector0Indev != "" {
+		xc.colo_filter_sec_redirector0_indev = C.CString(x.ColoFilterSecRedirector0Indev)
+	}
+	if x.ColoFilterSecRedirector0Outdev != "" {
+		xc.colo_filter_sec_redirector0_outdev = C.CString(x.ColoFilterSecRedirector0Outdev)
+	}
+	if x.ColoFilterSecRedirector1Queue != "" {
+		xc.colo_filter_sec_redirector1_queue = C.CString(x.ColoFilterSecRedirector1Queue)
+	}
+	if x.ColoFilterSecRedirector1Indev != "" {
+		xc.colo_filter_sec_redirector1_indev = C.CString(x.ColoFilterSecRedirector1Indev)
+	}
+	if x.ColoFilterSecRedirector1Outdev != "" {
+		xc.colo_filter_sec_redirector1_outdev = C.CString(x.ColoFilterSecRedirector1Outdev)
+	}
+	if x.ColoFilterSecRewriter0Queue != "" {
+		xc.colo_filter_sec_rewriter0_queue = C.CString(x.ColoFilterSecRewriter0Queue)
+	}
+	if x.ColoCheckpointHost != "" {
+		xc.colo_checkpoint_host = C.CString(x.ColoCheckpointHost)
+	}
+	if x.ColoCheckpointPort != "" {
+		xc.colo_checkpoint_port = C.CString(x.ColoCheckpointPort)
+	}
+
+	return nil
+}
+
+// NewDevicePci returns an instance of DevicePci initialized with defaults.
+func NewDevicePci() (*DevicePci, error) {
+	var (
+		x  DevicePci
+		xc C.libxl_device_pci
+	)
+
+	C.libxl_device_pci_init(&xc)
+	defer C.libxl_device_pci_dispose(&xc)
+
+	if err := x.fromC(&xc); err != nil {
+		return nil, err
+	}
+
+	return &x, nil
+}
+
+func (x *DevicePci) fromC(xc *C.libxl_device_pci) error {
+	x.Func = byte(xc._func)
+	x.Dev = byte(xc.dev)
+	x.Bus = byte(xc.bus)
+	x.Domain = int(xc.domain)
+	x.Vdevfn = uint32(xc.vdevfn)
+	x.VfuncMask = uint32(xc.vfunc_mask)
+	x.Msitranslate = bool(xc.msitranslate)
+	x.PowerMgmt = bool(xc.power_mgmt)
+	x.Permissive = bool(xc.permissive)
+	x.Seize = bool(xc.seize)
+	x.RdmPolicy = RdmReservePolicy(xc.rdm_policy)
+
+	return nil
+}
+
+func (x *DevicePci) toC(xc *C.libxl_device_pci) (err error) {
+	defer func() {
+		if err != nil {
+			C.libxl_device_pci_dispose(xc)
+		}
+	}()
+
+	xc._func = C.uint8_t(x.Func)
+	xc.dev = C.uint8_t(x.Dev)
+	xc.bus = C.uint8_t(x.Bus)
+	xc.domain = C.int(x.Domain)
+	xc.vdevfn = C.uint32_t(x.Vdevfn)
+	xc.vfunc_mask = C.uint32_t(x.VfuncMask)
+	xc.msitranslate = C.bool(x.Msitranslate)
+	xc.power_mgmt = C.bool(x.PowerMgmt)
+	xc.permissive = C.bool(x.Permissive)
+	xc.seize = C.bool(x.Seize)
+	xc.rdm_policy = C.libxl_rdm_reserve_policy(x.RdmPolicy)
+
+	return nil
+}
+
+// NewDeviceRdm returns an instance of DeviceRdm initialized with defaults.
+func NewDeviceRdm() (*DeviceRdm, error) {
+	var (
+		x  DeviceRdm
+		xc C.libxl_device_rdm
+	)
+
+	C.libxl_device_rdm_init(&xc)
+	defer C.libxl_device_rdm_dispose(&xc)
+
+	if err := x.fromC(&xc); err != nil {
+		return nil, err
+	}
+
+	return &x, nil
+}
+
+func (x *DeviceRdm) fromC(xc *C.libxl_device_rdm) error {
+	x.Start = uint64(xc.start)
+	x.Size = uint64(xc.size)
+	x.Policy = RdmReservePolicy(xc.policy)
+
+	return nil
+}
+
+func (x *DeviceRdm) toC(xc *C.libxl_device_rdm) (err error) {
+	defer func() {
+		if err != nil {
+			C.libxl_device_rdm_dispose(xc)
+		}
+	}()
+
+	xc.start = C.uint64_t(x.Start)
+	xc.size = C.uint64_t(x.Size)
+	xc.policy = C.libxl_rdm_reserve_policy(x.Policy)
+
+	return nil
+}
+
+// NewDeviceUsbctrl returns an instance of DeviceUsbctrl initialized with defaults.
+func NewDeviceUsbctrl() (*DeviceUsbctrl, error) {
+	var (
+		x  DeviceUsbctrl
+		xc C.libxl_device_usbctrl
+	)
+
+	C.libxl_device_usbctrl_init(&xc)
+	defer C.libxl_device_usbctrl_dispose(&xc)
+
+	if err := x.fromC(&xc); err != nil {
+		return nil, err
+	}
+
+	return &x, nil
+}
+
+func (x *DeviceUsbctrl) fromC(xc *C.libxl_device_usbctrl) error {
+	x.Type = UsbctrlType(xc._type)
+	x.Devid = Devid(xc.devid)
+	x.Version = int(xc.version)
+	x.Ports = int(xc.ports)
+	x.BackendDomid = Domid(xc.backend_domid)
+	x.BackendDomname = C.GoString(xc.backend_domname)
+
+	return nil
+}
+
+func (x *DeviceUsbctrl) toC(xc *C.libxl_device_usbctrl) (err error) {
+	defer func() {
+		if err != nil {
+			C.libxl_device_usbctrl_dispose(xc)
+		}
+	}()
+
+	xc._type = C.libxl_usbctrl_type(x.Type)
+	xc.devid = C.libxl_devid(x.Devid)
+	xc.version = C.int(x.Version)
+	xc.ports = C.int(x.Ports)
+	xc.backend_domid = C.libxl_domid(x.BackendDomid)
+	if x.BackendDomname != "" {
+		xc.backend_domname = C.CString(x.BackendDomname)
+	}
+
+	return nil
+}
+
+// NewDeviceUsbdev returns an instance of DeviceUsbdev initialized with defaults.
+func NewDeviceUsbdev(utype UsbdevType) (*DeviceUsbdev, error) {
+	var (
+		x  DeviceUsbdev
+		xc C.libxl_device_usbdev
+	)
+
+	C.libxl_device_usbdev_init(&xc)
+	C.libxl_device_usbdev_init_type(&xc, C.libxl_usbdev_type(utype))
+	defer C.libxl_device_usbdev_dispose(&xc)
+
+	if err := x.fromC(&xc); err != nil {
+		return nil, err
+	}
+
+	return &x, nil
+}
+
+func (x *DeviceUsbdev) fromC(xc *C.libxl_device_usbdev) error {
+	x.Ctrl = Devid(xc.ctrl)
+	x.Port = int(xc.port)
+	x.Type = UsbdevType(xc._type)
+	switch x.Type {
+	case UsbdevTypeHostdev:
+		var typeHostdev DeviceUsbdevTypeUnionHostdev
+		if err := typeHostdev.fromC(xc); err != nil {
+			return fmt.Errorf("converting field typeHostdev: %v", err)
+		}
+		x.TypeUnion = typeHostdev
+	default:
+		return fmt.Errorf("invalid union key '%v'", x.Type)
+	}
+
+	return nil
+}
+
+func (x *DeviceUsbdevTypeUnionHostdev) fromC(xc *C.libxl_device_usbdev) error {
+	if UsbdevType(xc._type) != UsbdevTypeHostdev {
+		return errors.New("expected union key UsbdevTypeHostdev")
+	}
+
+	tmp := (*C.libxl_device_usbdev_type_union_hostdev)(unsafe.Pointer(&xc.u[0]))
+	x.Hostbus = byte(tmp.hostbus)
+	x.Hostaddr = byte(tmp.hostaddr)
+	return nil
+}
+
+func (x *DeviceUsbdev) toC(xc *C.libxl_device_usbdev) (err error) {
+	defer func() {
+		if err != nil {
+			C.libxl_device_usbdev_dispose(xc)
+		}
+	}()
+
+	xc.ctrl = C.libxl_devid(x.Ctrl)
+	xc.port = C.int(x.Port)
+	xc._type = C.libxl_usbdev_type(x.Type)
+	switch x.Type {
+	case UsbdevTypeHostdev:
+		tmp, ok := x.TypeUnion.(DeviceUsbdevTypeUnionHostdev)
+		if !ok {
+			return errors.New("wrong type for union key type")
+		}
+		var hostdev C.libxl_device_usbdev_type_union_hostdev
+		hostdev.hostbus = C.uint8_t(tmp.Hostbus)
+		hostdev.hostaddr = C.uint8_t(tmp.Hostaddr)
+		hostdevBytes := C.GoBytes(unsafe.Pointer(&hostdev), C.sizeof_libxl_device_usbdev_type_union_hostdev)
+		copy(xc.u[:], hostdevBytes)
+	default:
+		return fmt.Errorf("invalid union key '%v'", x.Type)
+	}
+
+	return nil
+}
+
+// NewDeviceDtdev returns an instance of DeviceDtdev initialized with defaults.
+func NewDeviceDtdev() (*DeviceDtdev, error) {
+	var (
+		x  DeviceDtdev
+		xc C.libxl_device_dtdev
+	)
+
+	C.libxl_device_dtdev_init(&xc)
+	defer C.libxl_device_dtdev_dispose(&xc)
+
+	if err := x.fromC(&xc); err != nil {
+		return nil, err
+	}
+
+	return &x, nil
+}
+
+func (x *DeviceDtdev) fromC(xc *C.libxl_device_dtdev) error {
+	x.Path = C.GoString(xc.path)
+
+	return nil
+}
+
+func (x *DeviceDtdev) toC(xc *C.libxl_device_dtdev) (err error) {
+	defer func() {
+		if err != nil {
+			C.libxl_device_dtdev_dispose(xc)
+		}
+	}()
+
+	if x.Path != "" {
+		xc.path = C.CString(x.Path)
+	}
+
+	return nil
+}
+
+// NewDeviceVtpm returns an instance of DeviceVtpm initialized with defaults.
+func NewDeviceVtpm() (*DeviceVtpm, error) {
+	var (
+		x  DeviceVtpm
+		xc C.libxl_device_vtpm
+	)
+
+	C.libxl_device_vtpm_init(&xc)
+	defer C.libxl_device_vtpm_dispose(&xc)
+
+	if err := x.fromC(&xc); err != nil {
+		return nil, err
+	}
+
+	return &x, nil
+}
+
+func (x *DeviceVtpm) fromC(xc *C.libxl_device_vtpm) error {
+	x.BackendDomid = Domid(xc.backend_domid)
+	x.BackendDomname = C.GoString(xc.backend_domname)
+	x.Devid = Devid(xc.devid)
+	if err := x.Uuid.fromC(&xc.uuid); err != nil {
+		return fmt.Errorf("converting field Uuid: %v", err)
+	}
+
+	return nil
+}
+
+func (x *DeviceVtpm) toC(xc *C.libxl_device_vtpm) (err error) {
+	defer func() {
+		if err != nil {
+			C.libxl_device_vtpm_dispose(xc)
+		}
+	}()
+
+	xc.backend_domid = C.libxl_domid(x.BackendDomid)
+	if x.BackendDomname != "" {
+		xc.backend_domname = C.CString(x.BackendDomname)
+	}
+	xc.devid = C.libxl_devid(x.Devid)
+	if err := x.Uuid.toC(&xc.uuid); err != nil {
+		return fmt.Errorf("converting field Uuid: %v", err)
+	}
+
+	return nil
+}
+
+// NewDeviceP9 returns an instance of DeviceP9 initialized with defaults.
+func NewDeviceP9() (*DeviceP9, error) {
+	var (
+		x  DeviceP9
+		xc C.libxl_device_p9
+	)
+
+	C.libxl_device_p9_init(&xc)
+	defer C.libxl_device_p9_dispose(&xc)
+
+	if err := x.fromC(&xc); err != nil {
+		return nil, err
+	}
+
+	return &x, nil
+}
+
+func (x *DeviceP9) fromC(xc *C.libxl_device_p9) error {
+	x.BackendDomid = Domid(xc.backend_domid)
+	x.BackendDomname = C.GoString(xc.backend_domname)
+	x.Tag = C.GoString(xc.tag)
+	x.Path = C.GoString(xc.path)
+	x.SecurityModel = C.GoString(xc.security_model)
+	x.Devid = Devid(xc.devid)
+
+	return nil
+}
+
+func (x *DeviceP9) toC(xc *C.libxl_device_p9) (err error) {
+	defer func() {
+		if err != nil {
+			C.libxl_device_p9_dispose(xc)
+		}
+	}()
+
+	xc.backend_domid = C.libxl_domid(x.BackendDomid)
+	if x.BackendDomname != "" {
+		xc.backend_domname = C.CString(x.BackendDomname)
+	}
+	if x.Tag != "" {
+		xc.tag = C.CString(x.Tag)
+	}
+	if x.Path != "" {
+		xc.path = C.CString(x.Path)
+	}
+	if x.SecurityModel != "" {
+		xc.security_model = C.CString(x.SecurityModel)
+	}
+	xc.devid = C.libxl_devid(x.Devid)
+
+	return nil
+}
+
+// NewDevicePvcallsif returns an instance of DevicePvcallsif initialized with defaults.
+func NewDevicePvcallsif() (*DevicePvcallsif, error) {
+	var (
+		x  DevicePvcallsif
+		xc C.libxl_device_pvcallsif
+	)
+
+	C.libxl_device_pvcallsif_init(&xc)
+	defer C.libxl_device_pvcallsif_dispose(&xc)
+
+	if err := x.fromC(&xc); err != nil {
+		return nil, err
+	}
+
+	return &x, nil
+}
+
+func (x *DevicePvcallsif) fromC(xc *C.libxl_device_pvcallsif) error {
+	x.BackendDomid = Domid(xc.backend_domid)
+	x.BackendDomname = C.GoString(xc.backend_domname)
+	x.Devid = Devid(xc.devid)
+
+	return nil
+}
+
+func (x *DevicePvcallsif) toC(xc *C.libxl_device_pvcallsif) (err error) {
+	defer func() {
+		if err != nil {
+			C.libxl_device_pvcallsif_dispose(xc)
+		}
+	}()
+
+	xc.backend_domid = C.libxl_domid(x.BackendDomid)
+	if x.BackendDomname != "" {
+		xc.backend_domname = C.CString(x.BackendDomname)
+	}
+	xc.devid = C.libxl_devid(x.Devid)
+
+	return nil
+}
+
+// NewDeviceChannel returns an instance of DeviceChannel initialized with defaults.
+func NewDeviceChannel(connection ChannelConnection) (*DeviceChannel, error) {
+	var (
+		x  DeviceChannel
+		xc C.libxl_device_channel
+	)
+
+	C.libxl_device_channel_init(&xc)
+	C.libxl_device_channel_init_connection(&xc, C.libxl_channel_connection(connection))
+	defer C.libxl_device_channel_dispose(&xc)
+
+	if err := x.fromC(&xc); err != nil {
+		return nil, err
+	}
+
+	return &x, nil
+}
+
+func (x *DeviceChannel) fromC(xc *C.libxl_device_channel) error {
+	x.BackendDomid = Domid(xc.backend_domid)
+	x.BackendDomname = C.GoString(xc.backend_domname)
+	x.Devid = Devid(xc.devid)
+	x.Name = C.GoString(xc.name)
+	x.Connection = ChannelConnection(xc.connection)
+	switch x.Connection {
+	case ChannelConnectionUnknown:
+		x.ConnectionUnion = nil
+	case ChannelConnectionPty:
+		x.ConnectionUnion = nil
+	case ChannelConnectionSocket:
+		var connectionSocket DeviceChannelConnectionUnionSocket
+		if err := connectionSocket.fromC(xc); err != nil {
+			return fmt.Errorf("converting field connectionSocket: %v", err)
+		}
+		x.ConnectionUnion = connectionSocket
+	default:
+		return fmt.Errorf("invalid union key '%v'", x.Connection)
+	}
+
+	return nil
+}
+
+func (x *DeviceChannelConnectionUnionSocket) fromC(xc *C.libxl_device_channel) error {
+	if ChannelConnection(xc.connection) != ChannelConnectionSocket {
+		return errors.New("expected union key ChannelConnectionSocket")
+	}
+
+	tmp := (*C.libxl_device_channel_connection_union_socket)(unsafe.Pointer(&xc.u[0]))
+	x.Path = C.GoString(tmp.path)
+	return nil
+}
+
+func (x *DeviceChannel) toC(xc *C.libxl_device_channel) (err error) {
+	defer func() {
+		if err != nil {
+			C.libxl_device_channel_dispose(xc)
+		}
+	}()
+
+	xc.backend_domid = C.libxl_domid(x.BackendDomid)
+	if x.BackendDomname != "" {
+		xc.backend_domname = C.CString(x.BackendDomname)
+	}
+	xc.devid = C.libxl_devid(x.Devid)
+	if x.Name != "" {
+		xc.name = C.CString(x.Name)
+	}
+	xc.connection = C.libxl_channel_connection(x.Connection)
+	switch x.Connection {
+	case ChannelConnectionUnknown:
+		break
+	case ChannelConnectionPty:
+		break
+	case ChannelConnectionSocket:
+		tmp, ok := x.ConnectionUnion.(DeviceChannelConnectionUnionSocket)
+		if !ok {
+			return errors.New("wrong type for union key connection")
+		}
+		var socket C.libxl_device_channel_connection_union_socket
+		if tmp.Path != "" {
+			socket.path = C.CString(tmp.Path)
+		}
+		socketBytes := C.GoBytes(unsafe.Pointer(&socket), C.sizeof_libxl_device_channel_connection_union_socket)
+		copy(xc.u[:], socketBytes)
+	default:
+		return fmt.Errorf("invalid union key '%v'", x.Connection)
+	}
+
+	return nil
+}
+
+// NewConnectorParam returns an instance of ConnectorParam initialized with defaults.
+func NewConnectorParam() (*ConnectorParam, error) {
+	var (
+		x  ConnectorParam
+		xc C.libxl_connector_param
+	)
+
+	C.libxl_connector_param_init(&xc)
+	defer C.libxl_connector_param_dispose(&xc)
+
+	if err := x.fromC(&xc); err != nil {
+		return nil, err
+	}
+
+	return &x, nil
+}
+
+func (x *ConnectorParam) fromC(xc *C.libxl_connector_param) error {
+	x.UniqueId = C.GoString(xc.unique_id)
+	x.Width = uint32(xc.width)
+	x.Height = uint32(xc.height)
+
+	return nil
+}
+
+func (x *ConnectorParam) toC(xc *C.libxl_connector_param) (err error) {
+	defer func() {
+		if err != nil {
+			C.libxl_connector_param_dispose(xc)
+		}
+	}()
+
+	if x.UniqueId != "" {
+		xc.unique_id = C.CString(x.UniqueId)
+	}
+	xc.width = C.uint32_t(x.Width)
+	xc.height = C.uint32_t(x.Height)
+
+	return nil
+}
+
+// NewDeviceVdispl returns an instance of DeviceVdispl initialized with defaults.
+func NewDeviceVdispl() (*DeviceVdispl, error) {
+	var (
+		x  DeviceVdispl
+		xc C.libxl_device_vdispl
+	)
+
+	C.libxl_device_vdispl_init(&xc)
+	defer C.libxl_device_vdispl_dispose(&xc)
+
+	if err := x.fromC(&xc); err != nil {
+		return nil, err
+	}
+
+	return &x, nil
+}
+
+func (x *DeviceVdispl) fromC(xc *C.libxl_device_vdispl) error {
+	x.BackendDomid = Domid(xc.backend_domid)
+	x.BackendDomname = C.GoString(xc.backend_domname)
+	x.Devid = Devid(xc.devid)
+	x.BeAlloc = bool(xc.be_alloc)
+	x.Connectors = nil
+	if n := int(xc.num_connectors); n > 0 {
+		cConnectors := (*[1 << 28]C.libxl_connector_param)(unsafe.Pointer(xc.connectors))[:n:n]
+		x.Connectors = make([]ConnectorParam, n)
+		for i, v := range cConnectors {
+			if err := x.Connectors[i].fromC(&v); err != nil {
+				return fmt.Errorf("converting field Connectors: %v", err)
+			}
+		}
+	}
+
+	return nil
+}
+
+func (x *DeviceVdispl) toC(xc *C.libxl_device_vdispl) (err error) {
+	defer func() {
+		if err != nil {
+			C.libxl_device_vdispl_dispose(xc)
+		}
+	}()
+
+	xc.backend_domid = C.libxl_domid(x.BackendDomid)
+	if x.BackendDomname != "" {
+		xc.backend_domname = C.CString(x.BackendDomname)
+	}
+	xc.devid = C.libxl_devid(x.Devid)
+	xc.be_alloc = C.bool(x.BeAlloc)
+	if numConnectors := len(x.Connectors); numConnectors > 0 {
+		xc.connectors = (*C.libxl_connector_param)(C.malloc(C.ulong(numConnectors) * C.sizeof_libxl_connector_param))
+		xc.num_connectors = C.int(numConnectors)
+		cConnectors := (*[1 << 28]C.libxl_connector_param)(unsafe.Pointer(xc.connectors))[:numConnectors:numConnectors]
+		for i, v := range x.Connectors {
+			if err := v.toC(&cConnectors[i]); err != nil {
+				return fmt.Errorf("converting field Connectors: %v", err)
+			}
+		}
+	}
+
+	return nil
+}
+
+// NewVsndParams returns an instance of VsndParams initialized with defaults.
+func NewVsndParams() (*VsndParams, error) {
+	var (
+		x  VsndParams
+		xc C.libxl_vsnd_params
+	)
+
+	C.libxl_vsnd_params_init(&xc)
+	defer C.libxl_vsnd_params_dispose(&xc)
+
+	if err := x.fromC(&xc); err != nil {
+		return nil, err
+	}
+
+	return &x, nil
+}
+
+func (x *VsndParams) fromC(xc *C.libxl_vsnd_params) error {
+	x.SampleRates = nil
+	if n := int(xc.num_sample_rates); n > 0 {
+		cSampleRates := (*[1 << 28]C.uint32_t)(unsafe.Pointer(xc.sample_rates))[:n:n]
+		x.SampleRates = make([]uint32, n)
+		for i, v := range cSampleRates {
+			x.SampleRates[i] = uint32(v)
+		}
+	}
+	x.SampleFormats = nil
+	if n := int(xc.num_sample_formats); n > 0 {
+		cSampleFormats := (*[1 << 28]C.libxl_vsnd_pcm_format)(unsafe.Pointer(xc.sample_formats))[:n:n]
+		x.SampleFormats = make([]VsndPcmFormat, n)
+		for i, v := range cSampleFormats {
+			x.SampleFormats[i] = VsndPcmFormat(v)
+		}
+	}
+	x.ChannelsMin = uint32(xc.channels_min)
+	x.ChannelsMax = uint32(xc.channels_max)
+	x.BufferSize = uint32(xc.buffer_size)
+
+	return nil
+}
+
+func (x *VsndParams) toC(xc *C.libxl_vsnd_params) (err error) {
+	defer func() {
+		if err != nil {
+			C.libxl_vsnd_params_dispose(xc)
+		}
+	}()
+
+	if numSampleRates := len(x.SampleRates); numSampleRates > 0 {
+		xc.sample_rates = (*C.uint32_t)(C.malloc(C.size_t(numSampleRates * numSampleRates)))
+		xc.num_sample_rates = C.int(numSampleRates)
+		cSampleRates := (*[1 << 28]C.uint32_t)(unsafe.Pointer(xc.sample_rates))[:numSampleRates:numSampleRates]
+		for i, v := range x.SampleRates {
+			cSampleRates[i] = C.uint32_t(v)
+		}
+	}
+	if numSampleFormats := len(x.SampleFormats); numSampleFormats > 0 {
+		xc.sample_formats = (*C.libxl_vsnd_pcm_format)(C.malloc(C.size_t(numSampleFormats * numSampleFormats)))
+		xc.num_sample_formats = C.int(numSampleFormats)
+		cSampleFormats := (*[1 << 28]C.libxl_vsnd_pcm_format)(unsafe.Pointer(xc.sample_formats))[:numSampleFormats:numSampleFormats]
+		for i, v := range x.SampleFormats {
+			cSampleFormats[i] = C.libxl_vsnd_pcm_format(v)
+		}
+	}
+	xc.channels_min = C.uint32_t(x.ChannelsMin)
+	xc.channels_max = C.uint32_t(x.ChannelsMax)
+	xc.buffer_size = C.uint32_t(x.BufferSize)
+
+	return nil
+}
+
+// NewVsndStream returns an instance of VsndStream initialized with defaults.
+func NewVsndStream() (*VsndStream, error) {
+	var (
+		x  VsndStream
+		xc C.libxl_vsnd_stream
+	)
+
+	C.libxl_vsnd_stream_init(&xc)
+	defer C.libxl_vsnd_stream_dispose(&xc)
+
+	if err := x.fromC(&xc); err != nil {
+		return nil, err
+	}
+
+	return &x, nil
+}
+
+func (x *VsndStream) fromC(xc *C.libxl_vsnd_stream) error {
+	x.UniqueId = C.GoString(xc.unique_id)
+	x.Type = VsndStreamType(xc._type)
+	if err := x.Params.fromC(&xc.params); err != nil {
+		return fmt.Errorf("converting field Params: %v", err)
+	}
+
+	return nil
+}
+
+func (x *VsndStream) toC(xc *C.libxl_vsnd_stream) (err error) {
+	defer func() {
+		if err != nil {
+			C.libxl_vsnd_stream_dispose(xc)
+		}
+	}()
+
+	if x.UniqueId != "" {
+		xc.unique_id = C.CString(x.UniqueId)
+	}
+	xc._type = C.libxl_vsnd_stream_type(x.Type)
+	if err := x.Params.toC(&xc.params); err != nil {
+		return fmt.Errorf("converting field Params: %v", err)
+	}
+
+	return nil
+}
+
+// NewVsndPcm returns an instance of VsndPcm initialized with defaults.
+func NewVsndPcm() (*VsndPcm, error) {
+	var (
+		x  VsndPcm
+		xc C.libxl_vsnd_pcm
+	)
+
+	C.libxl_vsnd_pcm_init(&xc)
+	defer C.libxl_vsnd_pcm_dispose(&xc)
+
+	if err := x.fromC(&xc); err != nil {
+		return nil, err
+	}
+
+	return &x, nil
+}
+
+func (x *VsndPcm) fromC(xc *C.libxl_vsnd_pcm) error {
+	x.Name = C.GoString(xc.name)
+	if err := x.Params.fromC(&xc.params); err != nil {
+		return fmt.Errorf("converting field Params: %v", err)
+	}
+	x.Streams = nil
+	if n := int(xc.num_vsnd_streams); n > 0 {
+		cStreams := (*[1 << 28]C.libxl_vsnd_stream)(unsafe.Pointer(xc.streams))[:n:n]
+		x.Streams = make([]VsndStream, n)
+		for i, v := range cStreams {
+			if err := x.Streams[i].fromC(&v); err != nil {
+				return fmt.Errorf("converting field Streams: %v", err)
+			}
+		}
+	}
+
+	return nil
+}
+
+func (x *VsndPcm) toC(xc *C.libxl_vsnd_pcm) (err error) {
+	defer func() {
+		if err != nil {
+			C.libxl_vsnd_pcm_dispose(xc)
+		}
+	}()
+
+	if x.Name != "" {
+		xc.name = C.CString(x.Name)
+	}
+	if err := x.Params.toC(&xc.params); err != nil {
+		return fmt.Errorf("converting field Params: %v", err)
+	}
+	if numVsndStreams := len(x.Streams); numVsndStreams > 0 {
+		xc.streams = (*C.libxl_vsnd_stream)(C.malloc(C.ulong(numVsndStreams) * C.sizeof_libxl_vsnd_stream))
+		xc.num_vsnd_streams = C.int(numVsndStreams)
+		cStreams := (*[1 << 28]C.libxl_vsnd_stream)(unsafe.Pointer(xc.streams))[:numVsndStreams:numVsndStreams]
+		for i, v := range x.Streams {
+			if err := v.toC(&cStreams[i]); err != nil {
+				return fmt.Errorf("converting field Streams: %v", err)
+			}
+		}
+	}
+
+	return nil
+}
+
+// NewDeviceVsnd returns an instance of DeviceVsnd initialized with defaults.
+func NewDeviceVsnd() (*DeviceVsnd, error) {
+	var (
+		x  DeviceVsnd
+		xc C.libxl_device_vsnd
+	)
+
+	C.libxl_device_vsnd_init(&xc)
+	defer C.libxl_device_vsnd_dispose(&xc)
+
+	if err := x.fromC(&xc); err != nil {
+		return nil, err
+	}
+
+	return &x, nil
+}
+
+func (x *DeviceVsnd) fromC(xc *C.libxl_device_vsnd) error {
+	x.BackendDomid = Domid(xc.backend_domid)
+	x.BackendDomname = C.GoString(xc.backend_domname)
+	x.Devid = Devid(xc.devid)
+	x.ShortName = C.GoString(xc.short_name)
+	x.LongName = C.GoString(xc.long_name)
+	if err := x.Params.fromC(&xc.params); err != nil {
+		return fmt.Errorf("converting field Params: %v", err)
+	}
+	x.Pcms = nil
+	if n := int(xc.num_vsnd_pcms); n > 0 {
+		cPcms := (*[1 << 28]C.libxl_vsnd_pcm)(unsafe.Pointer(xc.pcms))[:n:n]
+		x.Pcms = make([]VsndPcm, n)
+		for i, v := range cPcms {
+			if err := x.Pcms[i].fromC(&v); err != nil {
+				return fmt.Errorf("converting field Pcms: %v", err)
+			}
+		}
+	}
+
+	return nil
+}
+
+func (x *DeviceVsnd) toC(xc *C.libxl_device_vsnd) (err error) {
+	defer func() {
+		if err != nil {
+			C.libxl_device_vsnd_dispose(xc)
+		}
+	}()
+
+	xc.backend_domid = C.libxl_domid(x.BackendDomid)
+	if x.BackendDomname != "" {
+		xc.backend_domname = C.CString(x.BackendDomname)
+	}
+	xc.devid = C.libxl_devid(x.Devid)
+	if x.ShortName != "" {
+		xc.short_name = C.CString(x.ShortName)
+	}
+	if x.LongName != "" {
+		xc.long_name = C.CString(x.LongName)
+	}
+	if err := x.Params.toC(&xc.params); err != nil {
+		return fmt.Errorf("converting field Params: %v", err)
+	}
+	if numVsndPcms := len(x.Pcms); numVsndPcms > 0 {
+		xc.pcms = (*C.libxl_vsnd_pcm)(C.malloc(C.ulong(numVsndPcms) * C.sizeof_libxl_vsnd_pcm))
+		xc.num_vsnd_pcms = C.int(numVsndPcms)
+		cPcms := (*[1 << 28]C.libxl_vsnd_pcm)(unsafe.Pointer(xc.pcms))[:numVsndPcms:numVsndPcms]
+		for i, v := range x.Pcms {
+			if err := v.toC(&cPcms[i]); err != nil {
+				return fmt.Errorf("converting field Pcms: %v", err)
+			}
+		}
+	}
+
+	return nil
+}
+
+// NewDomainConfig returns an instance of DomainConfig initialized with defaults.
+func NewDomainConfig() (*DomainConfig, error) {
+	var (
+		x  DomainConfig
+		xc C.libxl_domain_config
+	)
+
+	C.libxl_domain_config_init(&xc)
+	defer C.libxl_domain_config_dispose(&xc)
+
+	if err := x.fromC(&xc); err != nil {
+		return nil, err
+	}
+
+	return &x, nil
+}
+
+func (x *DomainConfig) fromC(xc *C.libxl_domain_config) error {
+	if err := x.CInfo.fromC(&xc.c_info); err != nil {
+		return fmt.Errorf("converting field CInfo: %v", err)
+	}
+	if err := x.BInfo.fromC(&xc.b_info); err != nil {
+		return fmt.Errorf("converting field BInfo: %v", err)
+	}
+	x.Disks = nil
+	if n := int(xc.num_disks); n > 0 {
+		cDisks := (*[1 << 28]C.libxl_device_disk)(unsafe.Pointer(xc.disks))[:n:n]
+		x.Disks = make([]DeviceDisk, n)
+		for i, v := range cDisks {
+			if err := x.Disks[i].fromC(&v); err != nil {
+				return fmt.Errorf("converting field Disks: %v", err)
+			}
+		}
+	}
+	x.Nics = nil
+	if n := int(xc.num_nics); n > 0 {
+		cNics := (*[1 << 28]C.libxl_device_nic)(unsafe.Pointer(xc.nics))[:n:n]
+		x.Nics = make([]DeviceNic, n)
+		for i, v := range cNics {
+			if err := x.Nics[i].fromC(&v); err != nil {
+				return fmt.Errorf("converting field Nics: %v", err)
+			}
+		}
+	}
+	x.Pcidevs = nil
+	if n := int(xc.num_pcidevs); n > 0 {
+		cPcidevs := (*[1 << 28]C.libxl_device_pci)(unsafe.Pointer(xc.pcidevs))[:n:n]
+		x.Pcidevs = make([]DevicePci, n)
+		for i, v := range cPcidevs {
+			if err := x.Pcidevs[i].fromC(&v); err != nil {
+				return fmt.Errorf("converting field Pcidevs: %v", err)
+			}
+		}
+	}
+	x.Rdms = nil
+	if n := int(xc.num_rdms); n > 0 {
+		cRdms := (*[1 << 28]C.libxl_device_rdm)(unsafe.Pointer(xc.rdms))[:n:n]
+		x.Rdms = make([]DeviceRdm, n)
+		for i, v := range cRdms {
+			if err := x.Rdms[i].fromC(&v); err != nil {
+				return fmt.Errorf("converting field Rdms: %v", err)
+			}
+		}
+	}
+	x.Dtdevs = nil
+	if n := int(xc.num_dtdevs); n > 0 {
+		cDtdevs := (*[1 << 28]C.libxl_device_dtdev)(unsafe.Pointer(xc.dtdevs))[:n:n]
+		x.Dtdevs = make([]DeviceDtdev, n)
+		for i, v := range cDtdevs {
+			if err := x.Dtdevs[i].fromC(&v); err != nil {
+				return fmt.Errorf("converting field Dtdevs: %v", err)
+			}
+		}
+	}
+	x.Vfbs = nil
+	if n := int(xc.num_vfbs); n > 0 {
+		cVfbs := (*[1 << 28]C.libxl_device_vfb)(unsafe.Pointer(xc.vfbs))[:n:n]
+		x.Vfbs = make([]DeviceVfb, n)
+		for i, v := range cVfbs {
+			if err := x.Vfbs[i].fromC(&v); err != nil {
+				return fmt.Errorf("converting field Vfbs: %v", err)
+			}
+		}
+	}
+	x.Vkbs = nil
+	if n := int(xc.num_vkbs); n > 0 {
+		cVkbs := (*[1 << 28]C.libxl_device_vkb)(unsafe.Pointer(xc.vkbs))[:n:n]
+		x.Vkbs = make([]DeviceVkb, n)
+		for i, v := range cVkbs {
+			if err := x.Vkbs[i].fromC(&v); err != nil {
+				return fmt.Errorf("converting field Vkbs: %v", err)
+			}
+		}
+	}
+	x.Vtpms = nil
+	if n := int(xc.num_vtpms); n > 0 {
+		cVtpms := (*[1 << 28]C.libxl_device_vtpm)(unsafe.Pointer(xc.vtpms))[:n:n]
+		x.Vtpms = make([]DeviceVtpm, n)
+		for i, v := range cVtpms {
+			if err := x.Vtpms[i].fromC(&v); err != nil {
+				return fmt.Errorf("converting field Vtpms: %v", err)
+			}
+		}
+	}
+	x.P9S = nil
+	if n := int(xc.num_p9s); n > 0 {
+		cP9S := (*[1 << 28]C.libxl_device_p9)(unsafe.Pointer(xc.p9s))[:n:n]
+		x.P9S = make([]DeviceP9, n)
+		for i, v := range cP9S {
+			if err := x.P9S[i].fromC(&v); err != nil {
+				return fmt.Errorf("converting field P9S: %v", err)
+			}
+		}
+	}
+	x.Pvcallsifs = nil
+	if n := int(xc.num_pvcallsifs); n > 0 {
+		cPvcallsifs := (*[1 << 28]C.libxl_device_pvcallsif)(unsafe.Pointer(xc.pvcallsifs))[:n:n]
+		x.Pvcallsifs = make([]DevicePvcallsif, n)
+		for i, v := range cPvcallsifs {
+			if err := x.Pvcallsifs[i].fromC(&v); err != nil {
+				return fmt.Errorf("converting field Pvcallsifs: %v", err)
+			}
+		}
+	}
+	x.Vdispls = nil
+	if n := int(xc.num_vdispls); n > 0 {
+		cVdispls := (*[1 << 28]C.libxl_device_vdispl)(unsafe.Pointer(xc.vdispls))[:n:n]
+		x.Vdispls = make([]DeviceVdispl, n)
+		for i, v := range cVdispls {
+			if err := x.Vdispls[i].fromC(&v); err != nil {
+				return fmt.Errorf("converting field Vdispls: %v", err)
+			}
+		}
+	}
+	x.Vsnds = nil
+	if n := int(xc.num_vsnds); n > 0 {
+		cVsnds := (*[1 << 28]C.libxl_device_vsnd)(unsafe.Pointer(xc.vsnds))[:n:n]
+		x.Vsnds = make([]DeviceVsnd, n)
+		for i, v := range cVsnds {
+			if err := x.Vsnds[i].fromC(&v); err != nil {
+				return fmt.Errorf("converting field Vsnds: %v", err)
+			}
+		}
+	}
+	x.Channels = nil
+	if n := int(xc.num_channels); n > 0 {
+		cChannels := (*[1 << 28]C.libxl_device_channel)(unsafe.Pointer(xc.channels))[:n:n]
+		x.Channels = make([]DeviceChannel, n)
+		for i, v := range cChannels {
+			if err := x.Channels[i].fromC(&v); err != nil {
+				return fmt.Errorf("converting field Channels: %v", err)
+			}
+		}
+	}
+	x.Usbctrls = nil
+	if n := int(xc.num_usbctrls); n > 0 {
+		cUsbctrls := (*[1 << 28]C.libxl_device_usbctrl)(unsafe.Pointer(xc.usbctrls))[:n:n]
+		x.Usbctrls = make([]DeviceUsbctrl, n)
+		for i, v := range cUsbctrls {
+			if err := x.Usbctrls[i].fromC(&v); err != nil {
+				return fmt.Errorf("converting field Usbctrls: %v", err)
+			}
+		}
+	}
+	x.Usbdevs = nil
+	if n := int(xc.num_usbdevs); n > 0 {
+		cUsbdevs := (*[1 << 28]C.libxl_device_usbdev)(unsafe.Pointer(xc.usbdevs))[:n:n]
+		x.Usbdevs = make([]DeviceUsbdev, n)
+		for i, v := range cUsbdevs {
+			if err := x.Usbdevs[i].fromC(&v); err != nil {
+				return fmt.Errorf("converting field Usbdevs: %v", err)
+			}
+		}
+	}
+	x.OnPoweroff = ActionOnShutdown(xc.on_poweroff)
+	x.OnReboot = ActionOnShutdown(xc.on_reboot)
+	x.OnWatchdog = ActionOnShutdown(xc.on_watchdog)
+	x.OnCrash = ActionOnShutdown(xc.on_crash)
+	x.OnSoftReset = ActionOnShutdown(xc.on_soft_reset)
+
+	return nil
+}
+
+func (x *DomainConfig) toC(xc *C.libxl_domain_config) (err error) {
+	defer func() {
+		if err != nil {
+			C.libxl_domain_config_dispose(xc)
+		}
+	}()
+
+	if err := x.CInfo.toC(&xc.c_info); err != nil {
+		return fmt.Errorf("converting field CInfo: %v", err)
+	}
+	if err := x.BInfo.toC(&xc.b_info); err != nil {
+		return fmt.Errorf("converting field BInfo: %v", err)
+	}
+	if numDisks := len(x.Disks); numDisks > 0 {
+		xc.disks = (*C.libxl_device_disk)(C.malloc(C.ulong(numDisks) * C.sizeof_libxl_device_disk))
+		xc.num_disks = C.int(numDisks)
+		cDisks := (*[1 << 28]C.libxl_device_disk)(unsafe.Pointer(xc.disks))[:numDisks:numDisks]
+		for i, v := range x.Disks {
+			if err := v.toC(&cDisks[i]); err != nil {
+				return fmt.Errorf("converting field Disks: %v", err)
+			}
+		}
+	}
+	if numNics := len(x.Nics); numNics > 0 {
+		xc.nics = (*C.libxl_device_nic)(C.malloc(C.ulong(numNics) * C.sizeof_libxl_device_nic))
+		xc.num_nics = C.int(numNics)
+		cNics := (*[1 << 28]C.libxl_device_nic)(unsafe.Pointer(xc.nics))[:numNics:numNics]
+		for i, v := range x.Nics {
+			if err := v.toC(&cNics[i]); err != nil {
+				return fmt.Errorf("converting field Nics: %v", err)
+			}
+		}
+	}
+	if numPcidevs := len(x.Pcidevs); numPcidevs > 0 {
+		xc.pcidevs = (*C.libxl_device_pci)(C.malloc(C.ulong(numPcidevs) * C.sizeof_libxl_device_pci))
+		xc.num_pcidevs = C.int(numPcidevs)
+		cPcidevs := (*[1 << 28]C.libxl_device_pci)(unsafe.Pointer(xc.pcidevs))[:numPcidevs:numPcidevs]
+		for i, v := range x.Pcidevs {
+			if err := v.toC(&cPcidevs[i]); err != nil {
+				return fmt.Errorf("converting field Pcidevs: %v", err)
+			}
+		}
+	}
+	if numRdms := len(x.Rdms); numRdms > 0 {
+		xc.rdms = (*C.libxl_device_rdm)(C.malloc(C.ulong(numRdms) * C.sizeof_libxl_device_rdm))
+		xc.num_rdms = C.int(numRdms)
+		cRdms := (*[1 << 28]C.libxl_device_rdm)(unsafe.Pointer(xc.rdms))[:numRdms:numRdms]
+		for i, v := range x.Rdms {
+			if err := v.toC(&cRdms[i]); err != nil {
+				return fmt.Errorf("converting field Rdms: %v", err)
+			}
+		}
+	}
+	if numDtdevs := len(x.Dtdevs); numDtdevs > 0 {
+		xc.dtdevs = (*C.libxl_device_dtdev)(C.malloc(C.ulong(numDtdevs) * C.sizeof_libxl_device_dtdev))
+		xc.num_dtdevs = C.int(numDtdevs)
+		cDtdevs := (*[1 << 28]C.libxl_device_dtdev)(unsafe.Pointer(xc.dtdevs))[:numDtdevs:numDtdevs]
+		for i, v := range x.Dtdevs {
+			if err := v.toC(&cDtdevs[i]); err != nil {
+				return fmt.Errorf("converting field Dtdevs: %v", err)
+			}
+		}
+	}
+	if numVfbs := len(x.Vfbs); numVfbs > 0 {
+		xc.vfbs = (*C.libxl_device_vfb)(C.malloc(C.ulong(numVfbs) * C.sizeof_libxl_device_vfb))
+		xc.num_vfbs = C.int(numVfbs)
+		cVfbs := (*[1 << 28]C.libxl_device_vfb)(unsafe.Pointer(xc.vfbs))[:numVfbs:numVfbs]
+		for i, v := range x.Vfbs {
+			if err := v.toC(&cVfbs[i]); err != nil {
+				return fmt.Errorf("converting field Vfbs: %v", err)
+			}
+		}
+	}
+	if numVkbs := len(x.Vkbs); numVkbs > 0 {
+		xc.vkbs = (*C.libxl_device_vkb)(C.malloc(C.ulong(numVkbs) * C.sizeof_libxl_device_vkb))
+		xc.num_vkbs = C.int(numVkbs)
+		cVkbs := (*[1 << 28]C.libxl_device_vkb)(unsafe.Pointer(xc.vkbs))[:numVkbs:numVkbs]
+		for i, v := range x.Vkbs {
+			if err := v.toC(&cVkbs[i]); err != nil {
+				return fmt.Errorf("converting field Vkbs: %v", err)
+			}
+		}
+	}
+	if numVtpms := len(x.Vtpms); numVtpms > 0 {
+		xc.vtpms = (*C.libxl_device_vtpm)(C.malloc(C.ulong(numVtpms) * C.sizeof_libxl_device_vtpm))
+		xc.num_vtpms = C.int(numVtpms)
+		cVtpms := (*[1 << 28]C.libxl_device_vtpm)(unsafe.Pointer(xc.vtpms))[:numVtpms:numVtpms]
+		for i, v := range x.Vtpms {
+			if err := v.toC(&cVtpms[i]); err != nil {
+				return fmt.Errorf("converting field Vtpms: %v", err)
+			}
+		}
+	}
+	if numP9S := len(x.P9S); numP9S > 0 {
+		xc.p9s = (*C.libxl_device_p9)(C.malloc(C.ulong(numP9S) * C.sizeof_libxl_device_p9))
+		xc.num_p9s = C.int(numP9S)
+		cP9S := (*[1 << 28]C.libxl_device_p9)(unsafe.Pointer(xc.p9s))[:numP9S:numP9S]
+		for i, v := range x.P9S {
+			if err := v.toC(&cP9S[i]); err != nil {
+				return fmt.Errorf("converting field P9S: %v", err)
+			}
+		}
+	}
+	if numPvcallsifs := len(x.Pvcallsifs); numPvcallsifs > 0 {
+		xc.pvcallsifs = (*C.libxl_device_pvcallsif)(C.malloc(C.ulong(numPvcallsifs) * C.sizeof_libxl_device_pvcallsif))
+		xc.num_pvcallsifs = C.int(numPvcallsifs)
+		cPvcallsifs := (*[1 << 28]C.libxl_device_pvcallsif)(unsafe.Pointer(xc.pvcallsifs))[:numPvcallsifs:numPvcallsifs]
+		for i, v := range x.Pvcallsifs {
+			if err := v.toC(&cPvcallsifs[i]); err != nil {
+				return fmt.Errorf("converting field Pvcallsifs: %v", err)
+			}
+		}
+	}
+	if numVdispls := len(x.Vdispls); numVdispls > 0 {
+		xc.vdispls = (*C.libxl_device_vdispl)(C.malloc(C.ulong(numVdispls) * C.sizeof_libxl_device_vdispl))
+		xc.num_vdispls = C.int(numVdispls)
+		cVdispls := (*[1 << 28]C.libxl_device_vdispl)(unsafe.Pointer(xc.vdispls))[:numVdispls:numVdispls]
+		for i, v := range x.Vdispls {
+			if err := v.toC(&cVdispls[i]); err != nil {
+				return fmt.Errorf("converting field Vdispls: %v", err)
+			}
+		}
+	}
+	if numVsnds := len(x.Vsnds); numVsnds > 0 {
+		xc.vsnds = (*C.libxl_device_vsnd)(C.malloc(C.ulong(numVsnds) * C.sizeof_libxl_device_vsnd))
+		xc.num_vsnds = C.int(numVsnds)
+		cVsnds := (*[1 << 28]C.libxl_device_vsnd)(unsafe.Pointer(xc.vsnds))[:numVsnds:numVsnds]
+		for i, v := range x.Vsnds {
+			if err := v.toC(&cVsnds[i]); err != nil {
+				return fmt.Errorf("converting field Vsnds: %v", err)
+			}
+		}
+	}
+	if numChannels := len(x.Channels); numChannels > 0 {
+		xc.channels = (*C.libxl_device_channel)(C.malloc(C.ulong(numChannels) * C.sizeof_libxl_device_channel))
+		xc.num_channels = C.int(numChannels)
+		cChannels := (*[1 << 28]C.libxl_device_channel)(unsafe.Pointer(xc.channels))[:numChannels:numChannels]
+		for i, v := range x.Channels {
+			if err := v.toC(&cChannels[i]); err != nil {
+				return fmt.Errorf("converting field Channels: %v", err)
+			}
+		}
+	}
+	if numUsbctrls := len(x.Usbctrls); numUsbctrls > 0 {
+		xc.usbctrls = (*C.libxl_device_usbctrl)(C.malloc(C.ulong(numUsbctrls) * C.sizeof_libxl_device_usbctrl))
+		xc.num_usbctrls = C.int(numUsbctrls)
+		cUsbctrls := (*[1 << 28]C.libxl_device_usbctrl)(unsafe.Pointer(xc.usbctrls))[:numUsbctrls:numUsbctrls]
+		for i, v := range x.Usbctrls {
+			if err := v.toC(&cUsbctrls[i]); err != nil {
+				return fmt.Errorf("converting field Usbctrls: %v", err)
+			}
+		}
+	}
+	if numUsbdevs := len(x.Usbdevs); numUsbdevs > 0 {
+		xc.usbdevs = (*C.libxl_device_usbdev)(C.malloc(C.ulong(numUsbdevs) * C.sizeof_libxl_device_usbdev))
+		xc.num_usbdevs = C.int(numUsbdevs)
+		cUsbdevs := (*[1 << 28]C.libxl_device_usbdev)(unsafe.Pointer(xc.usbdevs))[:numUsbdevs:numUsbdevs]
+		for i, v := range x.Usbdevs {
+			if err := v.toC(&cUsbdevs[i]); err != nil {
+				return fmt.Errorf("converting field Usbdevs: %v", err)
+			}
+		}
+	}
+	xc.on_poweroff = C.libxl_action_on_shutdown(x.OnPoweroff)
+	xc.on_reboot = C.libxl_action_on_shutdown(x.OnReboot)
+	xc.on_watchdog = C.libxl_action_on_shutdown(x.OnWatchdog)
+	xc.on_crash = C.libxl_action_on_shutdown(x.OnCrash)
+	xc.on_soft_reset = C.libxl_action_on_shutdown(x.OnSoftReset)
+
+	return nil
+}
+
+// NewDiskinfo returns an instance of Diskinfo initialized with defaults.
+func NewDiskinfo() (*Diskinfo, error) {
+	var (
+		x  Diskinfo
+		xc C.libxl_diskinfo
+	)
+
+	C.libxl_diskinfo_init(&xc)
+	defer C.libxl_diskinfo_dispose(&xc)
+
+	if err := x.fromC(&xc); err != nil {
+		return nil, err
+	}
+
+	return &x, nil
+}
+
+func (x *Diskinfo) fromC(xc *C.libxl_diskinfo) error {
+	x.Backend = C.GoString(xc.backend)
+	x.BackendId = uint32(xc.backend_id)
+	x.Frontend = C.GoString(xc.frontend)
+	x.FrontendId = uint32(xc.frontend_id)
+	x.Devid = Devid(xc.devid)
+	x.State = int(xc.state)
+	x.Evtch = int(xc.evtch)
+	x.Rref = int(xc.rref)
+
+	return nil
+}
+
+func (x *Diskinfo) toC(xc *C.libxl_diskinfo) (err error) {
+	defer func() {
+		if err != nil {
+			C.libxl_diskinfo_dispose(xc)
+		}
+	}()
+
+	if x.Backend != "" {
+		xc.backend = C.CString(x.Backend)
+	}
+	xc.backend_id = C.uint32_t(x.BackendId)
+	if x.Frontend != "" {
+		xc.frontend = C.CString(x.Frontend)
+	}
+	xc.frontend_id = C.uint32_t(x.FrontendId)
+	xc.devid = C.libxl_devid(x.Devid)
+	xc.state = C.int(x.State)
+	xc.evtch = C.int(x.Evtch)
+	xc.rref = C.int(x.Rref)
+
+	return nil
+}
+
+// NewNicinfo returns an instance of Nicinfo initialized with defaults.
+func NewNicinfo() (*Nicinfo, error) {
+	var (
+		x  Nicinfo
+		xc C.libxl_nicinfo
+	)
+
+	C.libxl_nicinfo_init(&xc)
+	defer C.libxl_nicinfo_dispose(&xc)
+
+	if err := x.fromC(&xc); err != nil {
+		return nil, err
+	}
+
+	return &x, nil
+}
+
+func (x *Nicinfo) fromC(xc *C.libxl_nicinfo) error {
+	x.Backend = C.GoString(xc.backend)
+	x.BackendId = uint32(xc.backend_id)
+	x.Frontend = C.GoString(xc.frontend)
+	x.FrontendId = uint32(xc.frontend_id)
+	x.Devid = Devid(xc.devid)
+	x.State = int(xc.state)
+	x.Evtch = int(xc.evtch)
+	x.RrefTx = int(xc.rref_tx)
+	x.RrefRx = int(xc.rref_rx)
+
+	return nil
+}
+
+func (x *Nicinfo) toC(xc *C.libxl_nicinfo) (err error) {
+	defer func() {
+		if err != nil {
+			C.libxl_nicinfo_dispose(xc)
+		}
+	}()
+
+	if x.Backend != "" {
+		xc.backend = C.CString(x.Backend)
+	}
+	xc.backend_id = C.uint32_t(x.BackendId)
+	if x.Frontend != "" {
+		xc.frontend = C.CString(x.Frontend)
+	}
+	xc.frontend_id = C.uint32_t(x.FrontendId)
+	xc.devid = C.libxl_devid(x.Devid)
+	xc.state = C.int(x.State)
+	xc.evtch = C.int(x.Evtch)
+	xc.rref_tx = C.int(x.RrefTx)
+	xc.rref_rx = C.int(x.RrefRx)
+
+	return nil
+}
+
+// NewVtpminfo returns an instance of Vtpminfo initialized with defaults.
+func NewVtpminfo() (*Vtpminfo, error) {
+	var (
+		x  Vtpminfo
+		xc C.libxl_vtpminfo
+	)
+
+	C.libxl_vtpminfo_init(&xc)
+	defer C.libxl_vtpminfo_dispose(&xc)
+
+	if err := x.fromC(&xc); err != nil {
+		return nil, err
+	}
+
+	return &x, nil
+}
+
+func (x *Vtpminfo) fromC(xc *C.libxl_vtpminfo) error {
+	x.Backend = C.GoString(xc.backend)
+	x.BackendId = uint32(xc.backend_id)
+	x.Frontend = C.GoString(xc.frontend)
+	x.FrontendId = uint32(xc.frontend_id)
+	x.Devid = Devid(xc.devid)
+	x.State = int(xc.state)
+	x.Evtch = int(xc.evtch)
+	x.Rref = int(xc.rref)
+	if err := x.Uuid.fromC(&xc.uuid); err != nil {
+		return fmt.Errorf("converting field Uuid: %v", err)
+	}
+
+	return nil
+}
+
+func (x *Vtpminfo) toC(xc *C.libxl_vtpminfo) (err error) {
+	defer func() {
+		if err != nil {
+			C.libxl_vtpminfo_dispose(xc)
+		}
+	}()
+
+	if x.Backend != "" {
+		xc.backend = C.CString(x.Backend)
+	}
+	xc.backend_id = C.uint32_t(x.BackendId)
+	if x.Frontend != "" {
+		xc.frontend = C.CString(x.Frontend)
+	}
+	xc.frontend_id = C.uint32_t(x.FrontendId)
+	xc.devid = C.libxl_devid(x.Devid)
+	xc.state = C.int(x.State)
+	xc.evtch = C.int(x.Evtch)
+	xc.rref = C.int(x.Rref)
+	if err := x.Uuid.toC(&xc.uuid); err != nil {
+		return fmt.Errorf("converting field Uuid: %v", err)
+	}
+
+	return nil
+}
+
+// NewUsbctrlinfo returns an instance of Usbctrlinfo initialized with defaults.
+func NewUsbctrlinfo() (*Usbctrlinfo, error) {
+	var (
+		x  Usbctrlinfo
+		xc C.libxl_usbctrlinfo
+	)
+
+	C.libxl_usbctrlinfo_init(&xc)
+	defer C.libxl_usbctrlinfo_dispose(&xc)
+
+	if err := x.fromC(&xc); err != nil {
+		return nil, err
+	}
+
+	return &x, nil
+}
+
+func (x *Usbctrlinfo) fromC(xc *C.libxl_usbctrlinfo) error {
+	x.Type = UsbctrlType(xc._type)
+	x.Devid = Devid(xc.devid)
+	x.Version = int(xc.version)
+	x.Ports = int(xc.ports)
+	x.Backend = C.GoString(xc.backend)
+	x.BackendId = uint32(xc.backend_id)
+	x.Frontend = C.GoString(xc.frontend)
+	x.FrontendId = uint32(xc.frontend_id)
+	x.State = int(xc.state)
+	x.Evtch = int(xc.evtch)
+	x.RefUrb = int(xc.ref_urb)
+	x.RefConn = int(xc.ref_conn)
+
+	return nil
+}
+
+func (x *Usbctrlinfo) toC(xc *C.libxl_usbctrlinfo) (err error) {
+	defer func() {
+		if err != nil {
+			C.libxl_usbctrlinfo_dispose(xc)
+		}
+	}()
+
+	xc._type = C.libxl_usbctrl_type(x.Type)
+	xc.devid = C.libxl_devid(x.Devid)
+	xc.version = C.int(x.Version)
+	xc.ports = C.int(x.Ports)
+	if x.Backend != "" {
+		xc.backend = C.CString(x.Backend)
+	}
+	xc.backend_id = C.uint32_t(x.BackendId)
+	if x.Frontend != "" {
+		xc.frontend = C.CString(x.Frontend)
+	}
+	xc.frontend_id = C.uint32_t(x.FrontendId)
+	xc.state = C.int(x.State)
+	xc.evtch = C.int(x.Evtch)
+	xc.ref_urb = C.int(x.RefUrb)
+	xc.ref_conn = C.int(x.RefConn)
+
+	return nil
+}
+
+// NewVcpuinfo returns an instance of Vcpuinfo initialized with defaults.
+func NewVcpuinfo() (*Vcpuinfo, error) {
+	var (
+		x  Vcpuinfo
+		xc C.libxl_vcpuinfo
+	)
+
+	C.libxl_vcpuinfo_init(&xc)
+	defer C.libxl_vcpuinfo_dispose(&xc)
+
+	if err := x.fromC(&xc); err != nil {
+		return nil, err
+	}
+
+	return &x, nil
+}
+
+func (x *Vcpuinfo) fromC(xc *C.libxl_vcpuinfo) error {
+	x.Vcpuid = uint32(xc.vcpuid)
+	x.Cpu = uint32(xc.cpu)
+	x.Online = bool(xc.online)
+	x.Blocked = bool(xc.blocked)
+	x.Running = bool(xc.running)
+	x.VcpuTime = uint64(xc.vcpu_time)
+	if err := x.Cpumap.fromC(&xc.cpumap); err != nil {
+		return fmt.Errorf("converting field Cpumap: %v", err)
+	}
+	if err := x.CpumapSoft.fromC(&xc.cpumap_soft); err != nil {
+		return fmt.Errorf("converting field CpumapSoft: %v", err)
+	}
+
+	return nil
+}
+
+func (x *Vcpuinfo) toC(xc *C.libxl_vcpuinfo) (err error) {
+	defer func() {
+		if err != nil {
+			C.libxl_vcpuinfo_dispose(xc)
+		}
+	}()
+
+	xc.vcpuid = C.uint32_t(x.Vcpuid)
+	xc.cpu = C.uint32_t(x.Cpu)
+	xc.online = C.bool(x.Online)
+	xc.blocked = C.bool(x.Blocked)
+	xc.running = C.bool(x.Running)
+	xc.vcpu_time = C.uint64_t(x.VcpuTime)
+	if err := x.Cpumap.toC(&xc.cpumap); err != nil {
+		return fmt.Errorf("converting field Cpumap: %v", err)
+	}
+	if err := x.CpumapSoft.toC(&xc.cpumap_soft); err != nil {
+		return fmt.Errorf("converting field CpumapSoft: %v", err)
+	}
+
+	return nil
+}
+
+// NewPhysinfo returns an instance of Physinfo initialized with defaults.
+func NewPhysinfo() (*Physinfo, error) {
+	var (
+		x  Physinfo
+		xc C.libxl_physinfo
+	)
+
+	C.libxl_physinfo_init(&xc)
+	defer C.libxl_physinfo_dispose(&xc)
+
+	if err := x.fromC(&xc); err != nil {
+		return nil, err
+	}
+
+	return &x, nil
+}
+
+func (x *Physinfo) fromC(xc *C.libxl_physinfo) error {
+	x.ThreadsPerCore = uint32(xc.threads_per_core)
+	x.CoresPerSocket = uint32(xc.cores_per_socket)
+	x.MaxCpuId = uint32(xc.max_cpu_id)
+	x.NrCpus = uint32(xc.nr_cpus)
+	x.CpuKhz = uint32(xc.cpu_khz)
+	x.TotalPages = uint64(xc.total_pages)
+	x.FreePages = uint64(xc.free_pages)
+	x.ScrubPages = uint64(xc.scrub_pages)
+	x.OutstandingPages = uint64(xc.outstanding_pages)
+	x.SharingFreedPages = uint64(xc.sharing_freed_pages)
+	x.SharingUsedFrames = uint64(xc.sharing_used_frames)
+	x.MaxPossibleMfn = uint64(xc.max_possible_mfn)
+	x.NrNodes = uint32(xc.nr_nodes)
+	if err := x.HwCap.fromC(&xc.hw_cap); err != nil {
+		return fmt.Errorf("converting field HwCap: %v", err)
+	}
+	x.CapHvm = bool(xc.cap_hvm)
+	x.CapPv = bool(xc.cap_pv)
+	x.CapHvmDirectio = bool(xc.cap_hvm_directio)
+	x.CapHap = bool(xc.cap_hap)
+	x.CapShadow = bool(xc.cap_shadow)
+	x.CapIommuHapPtShare = bool(xc.cap_iommu_hap_pt_share)
+
+	return nil
+}
+
+func (x *Physinfo) toC(xc *C.libxl_physinfo) (err error) {
+	defer func() {
+		if err != nil {
+			C.libxl_physinfo_dispose(xc)
+		}
+	}()
+
+	xc.threads_per_core = C.uint32_t(x.ThreadsPerCore)
+	xc.cores_per_socket = C.uint32_t(x.CoresPerSocket)
+	xc.max_cpu_id = C.uint32_t(x.MaxCpuId)
+	xc.nr_cpus = C.uint32_t(x.NrCpus)
+	xc.cpu_khz = C.uint32_t(x.CpuKhz)
+	xc.total_pages = C.uint64_t(x.TotalPages)
+	xc.free_pages = C.uint64_t(x.FreePages)
+	xc.scrub_pages = C.uint64_t(x.ScrubPages)
+	xc.outstanding_pages = C.uint64_t(x.OutstandingPages)
+	xc.sharing_freed_pages = C.uint64_t(x.SharingFreedPages)
+	xc.sharing_used_frames = C.uint64_t(x.SharingUsedFrames)
+	xc.max_possible_mfn = C.uint64_t(x.MaxPossibleMfn)
+	xc.nr_nodes = C.uint32_t(x.NrNodes)
+	if err := x.HwCap.toC(&xc.hw_cap); err != nil {
+		return fmt.Errorf("converting field HwCap: %v", err)
+	}
+	xc.cap_hvm = C.bool(x.CapHvm)
+	xc.cap_pv = C.bool(x.CapPv)
+	xc.cap_hvm_directio = C.bool(x.CapHvmDirectio)
+	xc.cap_hap = C.bool(x.CapHap)
+	xc.cap_shadow = C.bool(x.CapShadow)
+	xc.cap_iommu_hap_pt_share = C.bool(x.CapIommuHapPtShare)
+
+	return nil
+}
+
+// NewConnectorinfo returns an instance of Connectorinfo initialized with defaults.
+func NewConnectorinfo() (*Connectorinfo, error) {
+	var (
+		x  Connectorinfo
+		xc C.libxl_connectorinfo
+	)
+
+	C.libxl_connectorinfo_init(&xc)
+	defer C.libxl_connectorinfo_dispose(&xc)
+
+	if err := x.fromC(&xc); err != nil {
+		return nil, err
+	}
+
+	return &x, nil
+}
+
+func (x *Connectorinfo) fromC(xc *C.libxl_connectorinfo) error {
+	x.UniqueId = C.GoString(xc.unique_id)
+	x.Width = uint32(xc.width)
+	x.Height = uint32(xc.height)
+	x.ReqEvtch = int(xc.req_evtch)
+	x.ReqRref = int(xc.req_rref)
+	x.EvtEvtch = int(xc.evt_evtch)
+	x.EvtRref = int(xc.evt_rref)
+
+	return nil
+}
+
+func (x *Connectorinfo) toC(xc *C.libxl_connectorinfo) (err error) {
+	defer func() {
+		if err != nil {
+			C.libxl_connectorinfo_dispose(xc)
+		}
+	}()
+
+	if x.UniqueId != "" {
+		xc.unique_id = C.CString(x.UniqueId)
+	}
+	xc.width = C.uint32_t(x.Width)
+	xc.height = C.uint32_t(x.Height)
+	xc.req_evtch = C.int(x.ReqEvtch)
+	xc.req_rref = C.int(x.ReqRref)
+	xc.evt_evtch = C.int(x.EvtEvtch)
+	xc.evt_rref = C.int(x.EvtRref)
+
+	return nil
+}
+
+// NewVdisplinfo returns an instance of Vdisplinfo initialized with defaults.
+func NewVdisplinfo() (*Vdisplinfo, error) {
+	var (
+		x  Vdisplinfo
+		xc C.libxl_vdisplinfo
+	)
+
+	C.libxl_vdisplinfo_init(&xc)
+	defer C.libxl_vdisplinfo_dispose(&xc)
+
+	if err := x.fromC(&xc); err != nil {
+		return nil, err
+	}
+
+	return &x, nil
+}
+
+func (x *Vdisplinfo) fromC(xc *C.libxl_vdisplinfo) error {
+	x.Backend = C.GoString(xc.backend)
+	x.BackendId = uint32(xc.backend_id)
+	x.Frontend = C.GoString(xc.frontend)
+	x.FrontendId = uint32(xc.frontend_id)
+	x.Devid = Devid(xc.devid)
+	x.State = int(xc.state)
+	x.BeAlloc = bool(xc.be_alloc)
+	x.Connectors = nil
+	if n := int(xc.num_connectors); n > 0 {
+		cConnectors := (*[1 << 28]C.libxl_connectorinfo)(unsafe.Pointer(xc.connectors))[:n:n]
+		x.Connectors = make([]Connectorinfo, n)
+		for i, v := range cConnectors {
+			if err := x.Connectors[i].fromC(&v); err != nil {
+				return fmt.Errorf("converting field Connectors: %v", err)
+			}
+		}
+	}
+
+	return nil
+}
+
+func (x *Vdisplinfo) toC(xc *C.libxl_vdisplinfo) (err error) {
+	defer func() {
+		if err != nil {
+			C.libxl_vdisplinfo_dispose(xc)
+		}
+	}()
+
+	if x.Backend != "" {
+		xc.backend = C.CString(x.Backend)
+	}
+	xc.backend_id = C.uint32_t(x.BackendId)
+	if x.Frontend != "" {
+		xc.frontend = C.CString(x.Frontend)
+	}
+	xc.frontend_id = C.uint32_t(x.FrontendId)
+	xc.devid = C.libxl_devid(x.Devid)
+	xc.state = C.int(x.State)
+	xc.be_alloc = C.bool(x.BeAlloc)
+	if numConnectors := len(x.Connectors); numConnectors > 0 {
+		xc.connectors = (*C.libxl_connectorinfo)(C.malloc(C.ulong(numConnectors) * C.sizeof_libxl_connectorinfo))
+		xc.num_connectors = C.int(numConnectors)
+		cConnectors := (*[1 << 28]C.libxl_connectorinfo)(unsafe.Pointer(xc.connectors))[:numConnectors:numConnectors]
+		for i, v := range x.Connectors {
+			if err := v.toC(&cConnectors[i]); err != nil {
+				return fmt.Errorf("converting field Connectors: %v", err)
+			}
+		}
+	}
+
+	return nil
+}
+
+// NewStreaminfo returns an instance of Streaminfo initialized with defaults.
+func NewStreaminfo() (*Streaminfo, error) {
+	var (
+		x  Streaminfo
+		xc C.libxl_streaminfo
+	)
+
+	C.libxl_streaminfo_init(&xc)
+	defer C.libxl_streaminfo_dispose(&xc)
+
+	if err := x.fromC(&xc); err != nil {
+		return nil, err
+	}
+
+	return &x, nil
+}
+
+func (x *Streaminfo) fromC(xc *C.libxl_streaminfo) error {
+	x.ReqEvtch = int(xc.req_evtch)
+	x.ReqRref = int(xc.req_rref)
+
+	return nil
+}
+
+func (x *Streaminfo) toC(xc *C.libxl_streaminfo) (err error) {
+	defer func() {
+		if err != nil {
+			C.libxl_streaminfo_dispose(xc)
+		}
+	}()
+
+	xc.req_evtch = C.int(x.ReqEvtch)
+	xc.req_rref = C.int(x.ReqRref)
+
+	return nil
+}
+
+// NewPcminfo returns an instance of Pcminfo initialized with defaults.
+func NewPcminfo() (*Pcminfo, error) {
+	var (
+		x  Pcminfo
+		xc C.libxl_pcminfo
+	)
+
+	C.libxl_pcminfo_init(&xc)
+	defer C.libxl_pcminfo_dispose(&xc)
+
+	if err := x.fromC(&xc); err != nil {
+		return nil, err
+	}
+
+	return &x, nil
+}
+
+func (x *Pcminfo) fromC(xc *C.libxl_pcminfo) error {
+	x.Streams = nil
+	if n := int(xc.num_vsnd_streams); n > 0 {
+		cStreams := (*[1 << 28]C.libxl_streaminfo)(unsafe.Pointer(xc.streams))[:n:n]
+		x.Streams = make([]Streaminfo, n)
+		for i, v := range cStreams {
+			if err := x.Streams[i].fromC(&v); err != nil {
+				return fmt.Errorf("converting field Streams: %v", err)
+			}
+		}
+	}
+
+	return nil
+}
+
+func (x *Pcminfo) toC(xc *C.libxl_pcminfo) (err error) {
+	defer func() {
+		if err != nil {
+			C.libxl_pcminfo_dispose(xc)
+		}
+	}()
+
+	if numVsndStreams := len(x.Streams); numVsndStreams > 0 {
+		xc.streams = (*C.libxl_streaminfo)(C.malloc(C.ulong(numVsndStreams) * C.sizeof_libxl_streaminfo))
+		xc.num_vsnd_streams = C.int(numVsndStreams)
+		cStreams := (*[1 << 28]C.libxl_streaminfo)(unsafe.Pointer(xc.streams))[:numVsndStreams:numVsndStreams]
+		for i, v := range x.Streams {
+			if err := v.toC(&cStreams[i]); err != nil {
+				return fmt.Errorf("converting field Streams: %v", err)
+			}
+		}
+	}
+
+	return nil
+}
+
+// NewVsndinfo returns an instance of Vsndinfo initialized with defaults.
+func NewVsndinfo() (*Vsndinfo, error) {
+	var (
+		x  Vsndinfo
+		xc C.libxl_vsndinfo
+	)
+
+	C.libxl_vsndinfo_init(&xc)
+	defer C.libxl_vsndinfo_dispose(&xc)
+
+	if err := x.fromC(&xc); err != nil {
+		return nil, err
+	}
+
+	return &x, nil
+}
+
+func (x *Vsndinfo) fromC(xc *C.libxl_vsndinfo) error {
+	x.Backend = C.GoString(xc.backend)
+	x.BackendId = uint32(xc.backend_id)
+	x.Frontend = C.GoString(xc.frontend)
+	x.FrontendId = uint32(xc.frontend_id)
+	x.Devid = Devid(xc.devid)
+	x.State = int(xc.state)
+	x.Pcms = nil
+	if n := int(xc.num_vsnd_pcms); n > 0 {
+		cPcms := (*[1 << 28]C.libxl_pcminfo)(unsafe.Pointer(xc.pcms))[:n:n]
+		x.Pcms = make([]Pcminfo, n)
+		for i, v := range cPcms {
+			if err := x.Pcms[i].fromC(&v); err != nil {
+				return fmt.Errorf("converting field Pcms: %v", err)
+			}
+		}
+	}
+
+	return nil
+}
+
+func (x *Vsndinfo) toC(xc *C.libxl_vsndinfo) (err error) {
+	defer func() {
+		if err != nil {
+			C.libxl_vsndinfo_dispose(xc)
+		}
+	}()
+
+	if x.Backend != "" {
+		xc.backend = C.CString(x.Backend)
+	}
+	xc.backend_id = C.uint32_t(x.BackendId)
+	if x.Frontend != "" {
+		xc.frontend = C.CString(x.Frontend)
+	}
+	xc.frontend_id = C.uint32_t(x.FrontendId)
+	xc.devid = C.libxl_devid(x.Devid)
+	xc.state = C.int(x.State)
+	if numVsndPcms := len(x.Pcms); numVsndPcms > 0 {
+		xc.pcms = (*C.libxl_pcminfo)(C.malloc(C.ulong(numVsndPcms) * C.sizeof_libxl_pcminfo))
+		xc.num_vsnd_pcms = C.int(numVsndPcms)
+		cPcms := (*[1 << 28]C.libxl_pcminfo)(unsafe.Pointer(xc.pcms))[:numVsndPcms:numVsndPcms]
+		for i, v := range x.Pcms {
+			if err := v.toC(&cPcms[i]); err != nil {
+				return fmt.Errorf("converting field Pcms: %v", err)
+			}
+		}
+	}
+
+	return nil
+}
+
+// NewVkbinfo returns an instance of Vkbinfo initialized with defaults.
+func NewVkbinfo() (*Vkbinfo, error) {
+	var (
+		x  Vkbinfo
+		xc C.libxl_vkbinfo
+	)
+
+	C.libxl_vkbinfo_init(&xc)
+	defer C.libxl_vkbinfo_dispose(&xc)
+
+	if err := x.fromC(&xc); err != nil {
+		return nil, err
+	}
+
+	return &x, nil
+}
+
+func (x *Vkbinfo) fromC(xc *C.libxl_vkbinfo) error {
+	x.Backend = C.GoString(xc.backend)
+	x.BackendId = uint32(xc.backend_id)
+	x.Frontend = C.GoString(xc.frontend)
+	x.FrontendId = uint32(xc.frontend_id)
+	x.Devid = Devid(xc.devid)
+	x.State = int(xc.state)
+	x.Evtch = int(xc.evtch)
+	x.Rref = int(xc.rref)
+
+	return nil
+}
+
+func (x *Vkbinfo) toC(xc *C.libxl_vkbinfo) (err error) {
+	defer func() {
+		if err != nil {
+			C.libxl_vkbinfo_dispose(xc)
+		}
+	}()
+
+	if x.Backend != "" {
+		xc.backend = C.CString(x.Backend)
+	}
+	xc.backend_id = C.uint32_t(x.BackendId)
+	if x.Frontend != "" {
+		xc.frontend = C.CString(x.Frontend)
+	}
+	xc.frontend_id = C.uint32_t(x.FrontendId)
+	xc.devid = C.libxl_devid(x.Devid)
+	xc.state = C.int(x.State)
+	xc.evtch = C.int(x.Evtch)
+	xc.rref = C.int(x.Rref)
+
+	return nil
+}
+
+// NewNumainfo returns an instance of Numainfo initialized with defaults.
+func NewNumainfo() (*Numainfo, error) {
+	var (
+		x  Numainfo
+		xc C.libxl_numainfo
+	)
+
+	C.libxl_numainfo_init(&xc)
+	defer C.libxl_numainfo_dispose(&xc)
+
+	if err := x.fromC(&xc); err != nil {
+		return nil, err
+	}
+
+	return &x, nil
+}
+
+func (x *Numainfo) fromC(xc *C.libxl_numainfo) error {
+	x.Size = uint64(xc.size)
+	x.Free = uint64(xc.free)
+	x.Dists = nil
+	if n := int(xc.num_dists); n > 0 {
+		cDists := (*[1 << 28]C.uint32_t)(unsafe.Pointer(xc.dists))[:n:n]
+		x.Dists = make([]uint32, n)
+		for i, v := range cDists {
+			x.Dists[i] = uint32(v)
+		}
+	}
+
+	return nil
+}
+
+func (x *Numainfo) toC(xc *C.libxl_numainfo) (err error) {
+	defer func() {
+		if err != nil {
+			C.libxl_numainfo_dispose(xc)
+		}
+	}()
+
+	xc.size = C.uint64_t(x.Size)
+	xc.free = C.uint64_t(x.Free)
+	if numDists := len(x.Dists); numDists > 0 {
+		xc.dists = (*C.uint32_t)(C.malloc(C.size_t(numDists * numDists)))
+		xc.num_dists = C.int(numDists)
+		cDists := (*[1 << 28]C.uint32_t)(unsafe.Pointer(xc.dists))[:numDists:numDists]
+		for i, v := range x.Dists {
+			cDists[i] = C.uint32_t(v)
+		}
+	}
+
+	return nil
+}
+
+// NewCputopology returns an instance of Cputopology initialized with defaults.
+func NewCputopology() (*Cputopology, error) {
+	var (
+		x  Cputopology
+		xc C.libxl_cputopology
+	)
+
+	C.libxl_cputopology_init(&xc)
+	defer C.libxl_cputopology_dispose(&xc)
+
+	if err := x.fromC(&xc); err != nil {
+		return nil, err
+	}
+
+	return &x, nil
+}
+
+func (x *Cputopology) fromC(xc *C.libxl_cputopology) error {
+	x.Core = uint32(xc.core)
+	x.Socket = uint32(xc.socket)
+	x.Node = uint32(xc.node)
+
+	return nil
+}
+
+func (x *Cputopology) toC(xc *C.libxl_cputopology) (err error) {
+	defer func() {
+		if err != nil {
+			C.libxl_cputopology_dispose(xc)
+		}
+	}()
+
+	xc.core = C.uint32_t(x.Core)
+	xc.socket = C.uint32_t(x.Socket)
+	xc.node = C.uint32_t(x.Node)
+
+	return nil
+}
+
+// NewPcitopology returns an instance of Pcitopology initialized with defaults.
+func NewPcitopology() (*Pcitopology, error) {
+	var (
+		x  Pcitopology
+		xc C.libxl_pcitopology
+	)
+
+	C.libxl_pcitopology_init(&xc)
+	defer C.libxl_pcitopology_dispose(&xc)
+
+	if err := x.fromC(&xc); err != nil {
+		return nil, err
+	}
+
+	return &x, nil
+}
+
+func (x *Pcitopology) fromC(xc *C.libxl_pcitopology) error {
+	x.Seg = uint16(xc.seg)
+	x.Bus = byte(xc.bus)
+	x.Devfn = byte(xc.devfn)
+	x.Node = uint32(xc.node)
+
+	return nil
+}
+
+func (x *Pcitopology) toC(xc *C.libxl_pcitopology) (err error) {
+	defer func() {
+		if err != nil {
+			C.libxl_pcitopology_dispose(xc)
+		}
+	}()
+
+	xc.seg = C.uint16_t(x.Seg)
+	xc.bus = C.uint8_t(x.Bus)
+	xc.devfn = C.uint8_t(x.Devfn)
+	xc.node = C.uint32_t(x.Node)
+
+	return nil
+}
+
+// NewSchedCreditParams returns an instance of SchedCreditParams initialized with defaults.
+func NewSchedCreditParams() (*SchedCreditParams, error) {
+	var (
+		x  SchedCreditParams
+		xc C.libxl_sched_credit_params
+	)
+
+	C.libxl_sched_credit_params_init(&xc)
+
+	if err := x.fromC(&xc); err != nil {
+		return nil, err
+	}
+
+	return &x, nil
+}
+
+func (x *SchedCreditParams) fromC(xc *C.libxl_sched_credit_params) error {
+	x.TsliceMs = int(xc.tslice_ms)
+	x.RatelimitUs = int(xc.ratelimit_us)
+	x.VcpuMigrDelayUs = int(xc.vcpu_migr_delay_us)
+
+	return nil
+}
+
+func (x *SchedCreditParams) toC(xc *C.libxl_sched_credit_params) (err error) {
+	xc.tslice_ms = C.int(x.TsliceMs)
+	xc.ratelimit_us = C.int(x.RatelimitUs)
+	xc.vcpu_migr_delay_us = C.int(x.VcpuMigrDelayUs)
+
+	return nil
+}
+
+// NewSchedCredit2Params returns an instance of SchedCredit2Params initialized with defaults.
+func NewSchedCredit2Params() (*SchedCredit2Params, error) {
+	var (
+		x  SchedCredit2Params
+		xc C.libxl_sched_credit2_params
+	)
+
+	C.libxl_sched_credit2_params_init(&xc)
+
+	if err := x.fromC(&xc); err != nil {
+		return nil, err
+	}
+
+	return &x, nil
+}
+
+func (x *SchedCredit2Params) fromC(xc *C.libxl_sched_credit2_params) error {
+	x.RatelimitUs = int(xc.ratelimit_us)
+
+	return nil
+}
+
+func (x *SchedCredit2Params) toC(xc *C.libxl_sched_credit2_params) (err error) {
+	xc.ratelimit_us = C.int(x.RatelimitUs)
+
+	return nil
+}
+
+// NewDomainRemusInfo returns an instance of DomainRemusInfo initialized with defaults.
+func NewDomainRemusInfo() (*DomainRemusInfo, error) {
+	var (
+		x  DomainRemusInfo
+		xc C.libxl_domain_remus_info
+	)
+
+	C.libxl_domain_remus_info_init(&xc)
+	defer C.libxl_domain_remus_info_dispose(&xc)
+
+	if err := x.fromC(&xc); err != nil {
+		return nil, err
+	}
+
+	return &x, nil
+}
+
+func (x *DomainRemusInfo) fromC(xc *C.libxl_domain_remus_info) error {
+	x.Interval = int(xc.interval)
+	if err := x.AllowUnsafe.fromC(&xc.allow_unsafe); err != nil {
+		return fmt.Errorf("converting field AllowUnsafe: %v", err)
+	}
+	if err := x.Blackhole.fromC(&xc.blackhole); err != nil {
+		return fmt.Errorf("converting field Blackhole: %v", err)
+	}
+	if err := x.Compression.fromC(&xc.compression); err != nil {
+		return fmt.Errorf("converting field Compression: %v", err)
+	}
+	if err := x.Netbuf.fromC(&xc.netbuf); err != nil {
+		return fmt.Errorf("converting field Netbuf: %v", err)
+	}
+	x.Netbufscript = C.GoString(xc.netbufscript)
+	if err := x.Diskbuf.fromC(&xc.diskbuf); err != nil {
+		return fmt.Errorf("converting field Diskbuf: %v", err)
+	}
+	if err := x.Colo.fromC(&xc.colo); err != nil {
+		return fmt.Errorf("converting field Colo: %v", err)
+	}
+	if err := x.UserspaceColoProxy.fromC(&xc.userspace_colo_proxy); err != nil {
+		return fmt.Errorf("converting field UserspaceColoProxy: %v", err)
+	}
+
+	return nil
+}
+
+func (x *DomainRemusInfo) toC(xc *C.libxl_domain_remus_info) (err error) {
+	defer func() {
+		if err != nil {
+			C.libxl_domain_remus_info_dispose(xc)
+		}
+	}()
+
+	xc.interval = C.int(x.Interval)
+	if err := x.AllowUnsafe.toC(&xc.allow_unsafe); err != nil {
+		return fmt.Errorf("converting field AllowUnsafe: %v", err)
+	}
+	if err := x.Blackhole.toC(&xc.blackhole); err != nil {
+		return fmt.Errorf("converting field Blackhole: %v", err)
+	}
+	if err := x.Compression.toC(&xc.compression); err != nil {
+		return fmt.Errorf("converting field Compression: %v", err)
+	}
+	if err := x.Netbuf.toC(&xc.netbuf); err != nil {
+		return fmt.Errorf("converting field Netbuf: %v", err)
+	}
+	if x.Netbufscript != "" {
+		xc.netbufscript = C.CString(x.Netbufscript)
+	}
+	if err := x.Diskbuf.toC(&xc.diskbuf); err != nil {
+		return fmt.Errorf("converting field Diskbuf: %v", err)
+	}
+	if err := x.Colo.toC(&xc.colo); err != nil {
+		return fmt.Errorf("converting field Colo: %v", err)
+	}
+	if err := x.UserspaceColoProxy.toC(&xc.userspace_colo_proxy); err != nil {
+		return fmt.Errorf("converting field UserspaceColoProxy: %v", err)
+	}
+
+	return nil
+}
+
+// NewEvent returns an instance of Event initialized with defaults.
+func NewEvent(etype EventType) (*Event, error) {
+	var (
+		x  Event
+		xc C.libxl_event
+	)
+
+	C.libxl_event_init(&xc)
+	C.libxl_event_init_type(&xc, C.libxl_event_type(etype))
+	defer C.libxl_event_dispose(&xc)
+
+	if err := x.fromC(&xc); err != nil {
+		return nil, err
+	}
+
+	return &x, nil
+}
+
+func (x *Event) fromC(xc *C.libxl_event) error {
+	if err := x.Link.fromC(&xc.link); err != nil {
+		return fmt.Errorf("converting field Link: %v", err)
+	}
+	x.Domid = Domid(xc.domid)
+	if err := x.Domuuid.fromC(&xc.domuuid); err != nil {
+		return fmt.Errorf("converting field Domuuid: %v", err)
+	}
+	x.ForUser = uint64(xc.for_user)
+	x.Type = EventType(xc._type)
+	switch x.Type {
+	case EventTypeDomainShutdown:
+		var typeDomainShutdown EventTypeUnionDomainShutdown
+		if err := typeDomainShutdown.fromC(xc); err != nil {
+			return fmt.Errorf("converting field typeDomainShutdown: %v", err)
+		}
+		x.TypeUnion = typeDomainShutdown
+	case EventTypeDomainDeath:
+		x.TypeUnion = nil
+	case EventTypeDiskEject:
+		var typeDiskEject EventTypeUnionDiskEject
+		if err := typeDiskEject.fromC(xc); err != nil {
+			return fmt.Errorf("converting field typeDiskEject: %v", err)
+		}
+		x.TypeUnion = typeDiskEject
+	case EventTypeOperationComplete:
+		var typeOperationComplete EventTypeUnionOperationComplete
+		if err := typeOperationComplete.fromC(xc); err != nil {
+			return fmt.Errorf("converting field typeOperationComplete: %v", err)
+		}
+		x.TypeUnion = typeOperationComplete
+	case EventTypeDomainCreateConsoleAvailable:
+		x.TypeUnion = nil
+	default:
+		return fmt.Errorf("invalid union key '%v'", x.Type)
+	}
+
+	return nil
+}
+
+func (x *EventTypeUnionDomainShutdown) fromC(xc *C.libxl_event) error {
+	if EventType(xc._type) != EventTypeDomainShutdown {
+		return errors.New("expected union key EventTypeDomainShutdown")
+	}
+
+	tmp := (*C.libxl_event_type_union_domain_shutdown)(unsafe.Pointer(&xc.u[0]))
+	x.ShutdownReason = byte(tmp.shutdown_reason)
+	return nil
+}
+
+func (x *EventTypeUnionDiskEject) fromC(xc *C.libxl_event) error {
+	if EventType(xc._type) != EventTypeDiskEject {
+		return errors.New("expected union key EventTypeDiskEject")
+	}
+
+	tmp := (*C.libxl_event_type_union_disk_eject)(unsafe.Pointer(&xc.u[0]))
+	x.Vdev = C.GoString(tmp.vdev)
+	if err := x.Disk.fromC(&tmp.disk); err != nil {
+		return fmt.Errorf("converting field Disk: %v", err)
+	}
+	return nil
+}
+
+func (x *EventTypeUnionOperationComplete) fromC(xc *C.libxl_event) error {
+	if EventType(xc._type) != EventTypeOperationComplete {
+		return errors.New("expected union key EventTypeOperationComplete")
+	}
+
+	tmp := (*C.libxl_event_type_union_operation_complete)(unsafe.Pointer(&xc.u[0]))
+	x.Rc = int(tmp.rc)
+	return nil
+}
+
+func (x *Event) toC(xc *C.libxl_event) (err error) {
+	defer func() {
+		if err != nil {
+			C.libxl_event_dispose(xc)
+		}
+	}()
+
+	if err := x.Link.toC(&xc.link); err != nil {
+		return fmt.Errorf("converting field Link: %v", err)
+	}
+	xc.domid = C.libxl_domid(x.Domid)
+	if err := x.Domuuid.toC(&xc.domuuid); err != nil {
+		return fmt.Errorf("converting field Domuuid: %v", err)
+	}
+	xc.for_user = C.uint64_t(x.ForUser)
+	xc._type = C.libxl_event_type(x.Type)
+	switch x.Type {
+	case EventTypeDomainShutdown:
+		tmp, ok := x.TypeUnion.(EventTypeUnionDomainShutdown)
+		if !ok {
+			return errors.New("wrong type for union key type")
+		}
+		var domain_shutdown C.libxl_event_type_union_domain_shutdown
+		domain_shutdown.shutdown_reason = C.uint8_t(tmp.ShutdownReason)
+		domain_shutdownBytes := C.GoBytes(unsafe.Pointer(&domain_shutdown), C.sizeof_libxl_event_type_union_domain_shutdown)
+		copy(xc.u[:], domain_shutdownBytes)
+	case EventTypeDomainDeath:
+		break
+	case EventTypeDiskEject:
+		tmp, ok := x.TypeUnion.(EventTypeUnionDiskEject)
+		if !ok {
+			return errors.New("wrong type for union key type")
+		}
+		var disk_eject C.libxl_event_type_union_disk_eject
+		if tmp.Vdev != "" {
+			disk_eject.vdev = C.CString(tmp.Vdev)
+		}
+		if err := tmp.Disk.toC(&disk_eject.disk); err != nil {
+			return fmt.Errorf("converting field Disk: %v", err)
+		}
+		disk_ejectBytes := C.GoBytes(unsafe.Pointer(&disk_eject), C.sizeof_libxl_event_type_union_disk_eject)
+		copy(xc.u[:], disk_ejectBytes)
+	case EventTypeOperationComplete:
+		tmp, ok := x.TypeUnion.(EventTypeUnionOperationComplete)
+		if !ok {
+			return errors.New("wrong type for union key type")
+		}
+		var operation_complete C.libxl_event_type_union_operation_complete
+		operation_complete.rc = C.int(tmp.Rc)
+		operation_completeBytes := C.GoBytes(unsafe.Pointer(&operation_complete), C.sizeof_libxl_event_type_union_operation_complete)
+		copy(xc.u[:], operation_completeBytes)
+	case EventTypeDomainCreateConsoleAvailable:
+		break
+	default:
+		return fmt.Errorf("invalid union key '%v'", x.Type)
+	}
+
+	return nil
+}
+
+// NewPsrCatInfo returns an instance of PsrCatInfo initialized with defaults.
+func NewPsrCatInfo() (*PsrCatInfo, error) {
+	var (
+		x  PsrCatInfo
+		xc C.libxl_psr_cat_info
+	)
+
+	C.libxl_psr_cat_info_init(&xc)
+	defer C.libxl_psr_cat_info_dispose(&xc)
+
+	if err := x.fromC(&xc); err != nil {
+		return nil, err
+	}
+
+	return &x, nil
+}
+
+func (x *PsrCatInfo) fromC(xc *C.libxl_psr_cat_info) error {
+	x.Id = uint32(xc.id)
+	x.CosMax = uint32(xc.cos_max)
+	x.CbmLen = uint32(xc.cbm_len)
+	x.CdpEnabled = bool(xc.cdp_enabled)
+
+	return nil
+}
+
+func (x *PsrCatInfo) toC(xc *C.libxl_psr_cat_info) (err error) {
+	defer func() {
+		if err != nil {
+			C.libxl_psr_cat_info_dispose(xc)
+		}
+	}()
+
+	xc.id = C.uint32_t(x.Id)
+	xc.cos_max = C.uint32_t(x.CosMax)
+	xc.cbm_len = C.uint32_t(x.CbmLen)
+	xc.cdp_enabled = C.bool(x.CdpEnabled)
+
+	return nil
+}
+
+// NewPsrHwInfo returns an instance of PsrHwInfo initialized with defaults.
+func NewPsrHwInfo(ptype PsrFeatType) (*PsrHwInfo, error) {
+	var (
+		x  PsrHwInfo
+		xc C.libxl_psr_hw_info
+	)
+
+	C.libxl_psr_hw_info_init(&xc)
+	C.libxl_psr_hw_info_init_type(&xc, C.libxl_psr_feat_type(ptype))
+	defer C.libxl_psr_hw_info_dispose(&xc)
+
+	if err := x.fromC(&xc); err != nil {
+		return nil, err
+	}
+
+	return &x, nil
+}
+
+func (x *PsrHwInfo) fromC(xc *C.libxl_psr_hw_info) error {
+	x.Id = uint32(xc.id)
+	x.Type = PsrFeatType(xc._type)
+	switch x.Type {
+	case PsrFeatTypeCat:
+		var typeCat PsrHwInfoTypeUnionCat
+		if err := typeCat.fromC(xc); err != nil {
+			return fmt.Errorf("converting field typeCat: %v", err)
+		}
+		x.TypeUnion = typeCat
+	case PsrFeatTypeMba:
+		var typeMba PsrHwInfoTypeUnionMba
+		if err := typeMba.fromC(xc); err != nil {
+			return fmt.Errorf("converting field typeMba: %v", err)
+		}
+		x.TypeUnion = typeMba
+	default:
+		return fmt.Errorf("invalid union key '%v'", x.Type)
+	}
+
+	return nil
+}
+
+func (x *PsrHwInfoTypeUnionCat) fromC(xc *C.libxl_psr_hw_info) error {
+	if PsrFeatType(xc._type) != PsrFeatTypeCat {
+		return errors.New("expected union key PsrFeatTypeCat")
+	}
+
+	tmp := (*C.libxl_psr_hw_info_type_union_cat)(unsafe.Pointer(&xc.u[0]))
+	x.CosMax = uint32(tmp.cos_max)
+	x.CbmLen = uint32(tmp.cbm_len)
+	x.CdpEnabled = bool(tmp.cdp_enabled)
+	return nil
+}
+
+func (x *PsrHwInfoTypeUnionMba) fromC(xc *C.libxl_psr_hw_info) error {
+	if PsrFeatType(xc._type) != PsrFeatTypeMba {
+		return errors.New("expected union key PsrFeatTypeMba")
+	}
+
+	tmp := (*C.libxl_psr_hw_info_type_union_mba)(unsafe.Pointer(&xc.u[0]))
+	x.CosMax = uint32(tmp.cos_max)
+	x.ThrtlMax = uint32(tmp.thrtl_max)
+	x.Linear = bool(tmp.linear)
+	return nil
+}
+
+func (x *PsrHwInfo) toC(xc *C.libxl_psr_hw_info) (err error) {
+	defer func() {
+		if err != nil {
+			C.libxl_psr_hw_info_dispose(xc)
+		}
+	}()
+
+	xc.id = C.uint32_t(x.Id)
+	xc._type = C.libxl_psr_feat_type(x.Type)
+	switch x.Type {
+	case PsrFeatTypeCat:
+		tmp, ok := x.TypeUnion.(PsrHwInfoTypeUnionCat)
+		if !ok {
+			return errors.New("wrong type for union key type")
+		}
+		var cat C.libxl_psr_hw_info_type_union_cat
+		cat.cos_max = C.uint32_t(tmp.CosMax)
+		cat.cbm_len = C.uint32_t(tmp.CbmLen)
+		cat.cdp_enabled = C.bool(tmp.CdpEnabled)
+		catBytes := C.GoBytes(unsafe.Pointer(&cat), C.sizeof_libxl_psr_hw_info_type_union_cat)
+		copy(xc.u[:], catBytes)
+	case PsrFeatTypeMba:
+		tmp, ok := x.TypeUnion.(PsrHwInfoTypeUnionMba)
+		if !ok {
+			return errors.New("wrong type for union key type")
+		}
+		var mba C.libxl_psr_hw_info_type_union_mba
+		mba.cos_max = C.uint32_t(tmp.CosMax)
+		mba.thrtl_max = C.uint32_t(tmp.ThrtlMax)
+		mba.linear = C.bool(tmp.Linear)
+		mbaBytes := C.GoBytes(unsafe.Pointer(&mba), C.sizeof_libxl_psr_hw_info_type_union_mba)
+		copy(xc.u[:], mbaBytes)
+	default:
+		return fmt.Errorf("invalid union key '%v'", x.Type)
+	}
+
+	return nil
+}
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
new file mode 100644
index 0000000000..df68fd0e88
--- /dev/null
+++ b/tools/golang/xenlight/types.gen.go
@@ -0,0 +1,1226 @@
+// DO NOT EDIT.
+//
+// This file is generated by:
+// gengotypes.py ../../libxl/libxl_types.idl
+//
+package xenlight
+
+type Error int
+
+const (
+	ErrorNonspecific                  Error = -1
+	ErrorVersion                      Error = -2
+	ErrorFail                         Error = -3
+	ErrorNi                           Error = -4
+	ErrorNomem                        Error = -5
+	ErrorInval                        Error = -6
+	ErrorBadfail                      Error = -7
+	ErrorGuestTimedout                Error = -8
+	ErrorTimedout                     Error = -9
+	ErrorNoparavirt                   Error = -10
+	ErrorNotReady                     Error = -11
+	ErrorOseventRegFail               Error = -12
+	ErrorBufferfull                   Error = -13
+	ErrorUnknownChild                 Error = -14
+	ErrorLockFail                     Error = -15
+	ErrorJsonConfigEmpty              Error = -16
+	ErrorDeviceExists                 Error = -17
+	ErrorCheckpointDevopsDoesNotMatch Error = -18
+	ErrorCheckpointDeviceNotSupported Error = -19
+	ErrorVnumaConfigInvalid           Error = -20
+	ErrorDomainNotfound               Error = -21
+	ErrorAborted                      Error = -22
+	ErrorNotfound                     Error = -23
+	ErrorDomainDestroyed              Error = -24
+	ErrorFeatureRemoved               Error = -25
+	ErrorProtocolErrorQmp             Error = -26
+	ErrorUnknownQmpError              Error = -27
+	ErrorQmpGenericError              Error = -28
+	ErrorQmpCommandNotFound           Error = -29
+	ErrorQmpDeviceNotActive           Error = -30
+	ErrorQmpDeviceNotFound            Error = -31
+	ErrorQemuApi                      Error = -32
+)
+
+type DomainType int
+
+const (
+	DomainTypeInvalid DomainType = -1
+	DomainTypeHvm     DomainType = 1
+	DomainTypePv      DomainType = 2
+	DomainTypePvh     DomainType = 3
+)
+
+type RdmReserveStrategy int
+
+const (
+	RdmReserveStrategyIgnore RdmReserveStrategy = 0
+	RdmReserveStrategyHost   RdmReserveStrategy = 1
+)
+
+type RdmReservePolicy int
+
+const (
+	RdmReservePolicyInvalid RdmReservePolicy = -1
+	RdmReservePolicyStrict  RdmReservePolicy = 0
+	RdmReservePolicyRelaxed RdmReservePolicy = 1
+)
+
+type ChannelConnection int
+
+const (
+	ChannelConnectionUnknown ChannelConnection = 0
+	ChannelConnectionPty     ChannelConnection = 1
+	ChannelConnectionSocket  ChannelConnection = 2
+)
+
+type DeviceModelVersion int
+
+const (
+	DeviceModelVersionUnknown            DeviceModelVersion = 0
+	DeviceModelVersionQemuXenTraditional DeviceModelVersion = 1
+	DeviceModelVersionQemuXen            DeviceModelVersion = 2
+)
+
+type ConsoleType int
+
+const (
+	ConsoleTypeUnknown ConsoleType = 0
+	ConsoleTypeSerial  ConsoleType = 1
+	ConsoleTypePv      ConsoleType = 2
+	ConsoleTypeVuart   ConsoleType = 3
+)
+
+type DiskFormat int
+
+const (
+	DiskFormatUnknown DiskFormat = 0
+	DiskFormatQcow    DiskFormat = 1
+	DiskFormatQcow2   DiskFormat = 2
+	DiskFormatVhd     DiskFormat = 3
+	DiskFormatRaw     DiskFormat = 4
+	DiskFormatEmpty   DiskFormat = 5
+	DiskFormatQed     DiskFormat = 6
+)
+
+type DiskBackend int
+
+const (
+	DiskBackendUnknown DiskBackend = 0
+	DiskBackendPhy     DiskBackend = 1
+	DiskBackendTap     DiskBackend = 2
+	DiskBackendQdisk   DiskBackend = 3
+)
+
+type NicType int
+
+const (
+	NicTypeUnknown  NicType = 0
+	NicTypeVifIoemu NicType = 1
+	NicTypeVif      NicType = 2
+)
+
+type ActionOnShutdown int
+
+const (
+	ActionOnShutdownDestroy         ActionOnShutdown = 1
+	ActionOnShutdownRestart         ActionOnShutdown = 2
+	ActionOnShutdownRestartRename   ActionOnShutdown = 3
+	ActionOnShutdownPreserve        ActionOnShutdown = 4
+	ActionOnShutdownCoredumpDestroy ActionOnShutdown = 5
+	ActionOnShutdownCoredumpRestart ActionOnShutdown = 6
+	ActionOnShutdownSoftReset       ActionOnShutdown = 7
+)
+
+type Trigger int
+
+const (
+	TriggerUnknown  Trigger = 0
+	TriggerPower    Trigger = 1
+	TriggerSleep    Trigger = 2
+	TriggerNmi      Trigger = 3
+	TriggerInit     Trigger = 4
+	TriggerReset    Trigger = 5
+	TriggerS3Resume Trigger = 6
+)
+
+type TscMode int
+
+const (
+	TscModeDefault        TscMode = 0
+	TscModeAlwaysEmulate  TscMode = 1
+	TscModeNative         TscMode = 2
+	TscModeNativeParavirt TscMode = 3
+)
+
+type GfxPassthruKind int
+
+const (
+	GfxPassthruKindDefault GfxPassthruKind = 0
+	GfxPassthruKindIgd     GfxPassthruKind = 1
+)
+
+type TimerMode int
+
+const (
+	TimerModeUnknown               TimerMode = -1
+	TimerModeDelayForMissedTicks   TimerMode = 0
+	TimerModeNoDelayForMissedTicks TimerMode = 1
+	TimerModeNoMissedTicksPending  TimerMode = 2
+	TimerModeOneMissedTickPending  TimerMode = 3
+)
+
+type BiosType int
+
+const (
+	BiosTypeUnknown BiosType = 0
+	BiosTypeRombios BiosType = 1
+	BiosTypeSeabios BiosType = 2
+	BiosTypeOvmf    BiosType = 3
+)
+
+type Scheduler int
+
+const (
+	SchedulerUnknown  Scheduler = 0
+	SchedulerSedf     Scheduler = 4
+	SchedulerCredit   Scheduler = 5
+	SchedulerCredit2  Scheduler = 6
+	SchedulerArinc653 Scheduler = 7
+	SchedulerRtds     Scheduler = 8
+	SchedulerNull     Scheduler = 9
+)
+
+type ShutdownReason int
+
+const (
+	ShutdownReasonUnknown   ShutdownReason = -1
+	ShutdownReasonPoweroff  ShutdownReason = 0
+	ShutdownReasonReboot    ShutdownReason = 1
+	ShutdownReasonSuspend   ShutdownReason = 2
+	ShutdownReasonCrash     ShutdownReason = 3
+	ShutdownReasonWatchdog  ShutdownReason = 4
+	ShutdownReasonSoftReset ShutdownReason = 5
+)
+
+type VgaInterfaceType int
+
+const (
+	VgaInterfaceTypeUnknown VgaInterfaceType = 0
+	VgaInterfaceTypeCirrus  VgaInterfaceType = 1
+	VgaInterfaceTypeStd     VgaInterfaceType = 2
+	VgaInterfaceTypeNone    VgaInterfaceType = 3
+	VgaInterfaceTypeQxl     VgaInterfaceType = 4
+)
+
+type VendorDevice int
+
+const (
+	VendorDeviceNone      VendorDevice = 0
+	VendorDeviceXenserver VendorDevice = 1
+)
+
+type ViridianEnlightenment int
+
+const (
+	ViridianEnlightenmentBase                ViridianEnlightenment = 0
+	ViridianEnlightenmentFreq                ViridianEnlightenment = 1
+	ViridianEnlightenmentTimeRefCount        ViridianEnlightenment = 2
+	ViridianEnlightenmentReferenceTsc        ViridianEnlightenment = 3
+	ViridianEnlightenmentHcallRemoteTlbFlush ViridianEnlightenment = 4
+	ViridianEnlightenmentApicAssist          ViridianEnlightenment = 5
+	ViridianEnlightenmentCrashCtl            ViridianEnlightenment = 6
+	ViridianEnlightenmentSynic               ViridianEnlightenment = 7
+	ViridianEnlightenmentStimer              ViridianEnlightenment = 8
+	ViridianEnlightenmentHcallIpi            ViridianEnlightenment = 9
+)
+
+type Hdtype int
+
+const (
+	HdtypeIde  Hdtype = 1
+	HdtypeAhci Hdtype = 2
+)
+
+type CheckpointedStream int
+
+const (
+	CheckpointedStreamNone  CheckpointedStream = 0
+	CheckpointedStreamRemus CheckpointedStream = 1
+	CheckpointedStreamColo  CheckpointedStream = 2
+)
+
+type VuartType int
+
+const (
+	VuartTypeUnknown  VuartType = 0
+	VuartTypeSbsaUart VuartType = 1
+)
+
+type VkbBackend int
+
+const (
+	VkbBackendUnknown VkbBackend = 0
+	VkbBackendQemu    VkbBackend = 1
+	VkbBackendLinux   VkbBackend = 2
+)
+
+type Passthrough int
+
+const (
+	PassthroughDefault  Passthrough = 0
+	PassthroughDisabled Passthrough = 1
+	PassthroughEnabled  Passthrough = 2
+	PassthroughSyncPt   Passthrough = 3
+	PassthroughSharePt  Passthrough = 4
+)
+
+type IoportRange struct {
+	First  uint32
+	Number uint32
+}
+
+type IomemRange struct {
+	Start  uint64
+	Number uint64
+	Gfn    uint64
+}
+
+type VgaInterfaceInfo struct {
+	Kind VgaInterfaceType
+}
+
+type VncInfo struct {
+	Enable     Defbool
+	Listen     string
+	Passwd     string
+	Display    int
+	Findunused Defbool
+}
+
+type SpiceInfo struct {
+	Enable           Defbool
+	Port             int
+	TlsPort          int
+	Host             string
+	DisableTicketing Defbool
+	Passwd           string
+	AgentMouse       Defbool
+	Vdagent          Defbool
+	ClipboardSharing Defbool
+	Usbredirection   int
+	ImageCompression string
+	StreamingVideo   string
+}
+
+type SdlInfo struct {
+	Enable     Defbool
+	Opengl     Defbool
+	Display    string
+	Xauthority string
+}
+
+type Dominfo struct {
+	Uuid             Uuid
+	Domid            Domid
+	Ssidref          uint32
+	SsidLabel        string
+	Running          bool
+	Blocked          bool
+	Paused           bool
+	Shutdown         bool
+	Dying            bool
+	NeverStop        bool
+	ShutdownReason   ShutdownReason
+	OutstandingMemkb uint64
+	CurrentMemkb     uint64
+	SharedMemkb      uint64
+	PagedMemkb       uint64
+	MaxMemkb         uint64
+	CpuTime          uint64
+	VcpuMaxId        uint32
+	VcpuOnline       uint32
+	Cpupool          uint32
+	DomainType       DomainType
+}
+
+type Cpupoolinfo struct {
+	Poolid   uint32
+	PoolName string
+	Sched    Scheduler
+	NDom     uint32
+	Cpumap   Bitmap
+}
+
+type Channelinfo struct {
+	Backend         string
+	BackendId       uint32
+	Frontend        string
+	FrontendId      uint32
+	Devid           Devid
+	State           int
+	Evtch           int
+	Rref            int
+	Connection      ChannelConnection
+	ConnectionUnion channelinfoConnectionUnion
+}
+
+type channelinfoConnectionUnion interface {
+	ischannelinfoConnectionUnion()
+}
+
+type ChannelinfoConnectionUnionPty struct {
+	Path string
+}
+
+func (x ChannelinfoConnectionUnionPty) ischannelinfoConnectionUnion() {}
+
+type Vminfo struct {
+	Uuid  Uuid
+	Domid Domid
+}
+
+type VersionInfo struct {
+	XenVersionMajor int
+	XenVersionMinor int
+	XenVersionExtra string
+	Compiler        string
+	CompileBy       string
+	CompileDomain   string
+	CompileDate     string
+	Capabilities    string
+	Changeset       string
+	VirtStart       uint64
+	Pagesize        int
+	Commandline     string
+	BuildId         string
+}
+
+type DomainCreateInfo struct {
+	Type                    DomainType
+	Hap                     Defbool
+	Oos                     Defbool
+	Ssidref                 uint32
+	SsidLabel               string
+	Name                    string
+	Domid                   Domid
+	Uuid                    Uuid
+	Xsdata                  KeyValueList
+	Platformdata            KeyValueList
+	Poolid                  uint32
+	PoolName                string
+	RunHotplugScripts       Defbool
+	DriverDomain            Defbool
+	Passthrough             Passthrough
+	XendSuspendEvtchnCompat Defbool
+}
+
+type DomainRestoreParams struct {
+	CheckpointedStream int
+	StreamVersion      uint32
+	ColoProxyScript    string
+	UserspaceColoProxy Defbool
+}
+
+type SchedParams struct {
+	Vcpuid    int
+	Weight    int
+	Cap       int
+	Period    int
+	Extratime int
+	Budget    int
+}
+
+type VcpuSchedParams struct {
+	Sched Scheduler
+	Vcpus []SchedParams
+}
+
+type DomainSchedParams struct {
+	Sched     Scheduler
+	Weight    int
+	Cap       int
+	Period    int
+	Budget    int
+	Extratime int
+	Slice     int
+	Latency   int
+}
+
+type VnodeInfo struct {
+	Memkb     uint64
+	Distances []uint32
+	Pnode     uint32
+	Vcpus     Bitmap
+}
+
+type GicVersion int
+
+const (
+	GicVersionDefault GicVersion = 0
+	GicVersionV2      GicVersion = 32
+	GicVersionV3      GicVersion = 48
+)
+
+type TeeType int
+
+const (
+	TeeTypeNone  TeeType = 0
+	TeeTypeOptee TeeType = 1
+)
+
+type RdmReserve struct {
+	Strategy RdmReserveStrategy
+	Policy   RdmReservePolicy
+}
+
+type Altp2MMode int
+
+const (
+	Altp2MModeDisabled Altp2MMode = 0
+	Altp2MModeMixed    Altp2MMode = 1
+	Altp2MModeExternal Altp2MMode = 2
+	Altp2MModeLimited  Altp2MMode = 3
+)
+
+type DomainBuildInfo struct {
+	MaxVcpus              int
+	AvailVcpus            Bitmap
+	Cpumap                Bitmap
+	Nodemap               Bitmap
+	VcpuHardAffinity      []Bitmap
+	VcpuSoftAffinity      []Bitmap
+	NumaPlacement         Defbool
+	TscMode               TscMode
+	MaxMemkb              uint64
+	TargetMemkb           uint64
+	VideoMemkb            uint64
+	ShadowMemkb           uint64
+	IommuMemkb            uint64
+	RtcTimeoffset         uint32
+	ExecSsidref           uint32
+	ExecSsidLabel         string
+	Localtime             Defbool
+	DisableMigrate        Defbool
+	Cpuid                 CpuidPolicyList
+	BlkdevStart           string
+	VnumaNodes            []VnodeInfo
+	MaxGrantFrames        uint32
+	MaxMaptrackFrames     uint32
+	DeviceModelVersion    DeviceModelVersion
+	DeviceModelStubdomain Defbool
+	DeviceModel           string
+	DeviceModelSsidref    uint32
+	DeviceModelSsidLabel  string
+	DeviceModelUser       string
+	Extra                 StringList
+	ExtraPv               StringList
+	ExtraHvm              StringList
+	SchedParams           DomainSchedParams
+	Ioports               []IoportRange
+	Irqs                  []uint32
+	Iomem                 []IomemRange
+	ClaimMode             Defbool
+	EventChannels         uint32
+	Kernel                string
+	Cmdline               string
+	Ramdisk               string
+	DeviceTree            string
+	Acpi                  Defbool
+	Bootloader            string
+	BootloaderArgs        StringList
+	TimerMode             TimerMode
+	NestedHvm             Defbool
+	Apic                  Defbool
+	DmRestrict            Defbool
+	Tee                   TeeType
+	Type                  DomainType
+	TypeUnion             domainBuildInfoTypeUnion
+	ArchArm               struct {
+		GicVersion GicVersion
+		Vuart      VuartType
+	}
+	Altp2M Altp2MMode
+}
+
+type domainBuildInfoTypeUnion interface {
+	isdomainBuildInfoTypeUnion()
+}
+
+type DomainBuildInfoTypeUnionHvm struct {
+	Firmware            string
+	Bios                BiosType
+	Pae                 Defbool
+	Apic                Defbool
+	Acpi                Defbool
+	AcpiS3              Defbool
+	AcpiS4              Defbool
+	AcpiLaptopSlate     Defbool
+	Nx                  Defbool
+	Viridian            Defbool
+	ViridianEnable      Bitmap
+	ViridianDisable     Bitmap
+	Timeoffset          string
+	Hpet                Defbool
+	VptAlign            Defbool
+	MmioHoleMemkb       uint64
+	TimerMode           TimerMode
+	NestedHvm           Defbool
+	Altp2M              Defbool
+	SystemFirmware      string
+	SmbiosFirmware      string
+	AcpiFirmware        string
+	Hdtype              Hdtype
+	Nographic           Defbool
+	Vga                 VgaInterfaceInfo
+	Vnc                 VncInfo
+	Keymap              string
+	Sdl                 SdlInfo
+	Spice               SpiceInfo
+	GfxPassthru         Defbool
+	GfxPassthruKind     GfxPassthruKind
+	Serial              string
+	Boot                string
+	Usb                 Defbool
+	Usbversion          int
+	Usbdevice           string
+	VkbDevice           Defbool
+	Soundhw             string
+	XenPlatformPci      Defbool
+	UsbdeviceList       StringList
+	VendorDevice        VendorDevice
+	MsVmGenid           MsVmGenid
+	SerialList          StringList
+	Rdm                 RdmReserve
+	RdmMemBoundaryMemkb uint64
+	McaCaps             uint64
+}
+
+func (x DomainBuildInfoTypeUnionHvm) isdomainBuildInfoTypeUnion() {}
+
+type DomainBuildInfoTypeUnionPv struct {
+	Kernel         string
+	SlackMemkb     uint64
+	Bootloader     string
+	BootloaderArgs StringList
+	Cmdline        string
+	Ramdisk        string
+	Features       string
+	E820Host       Defbool
+}
+
+func (x DomainBuildInfoTypeUnionPv) isdomainBuildInfoTypeUnion() {}
+
+type DomainBuildInfoTypeUnionPvh struct {
+	Pvshim        Defbool
+	PvshimPath    string
+	PvshimCmdline string
+	PvshimExtra   string
+}
+
+func (x DomainBuildInfoTypeUnionPvh) isdomainBuildInfoTypeUnion() {}
+
+type DeviceVfb struct {
+	BackendDomid   Domid
+	BackendDomname string
+	Devid          Devid
+	Vnc            VncInfo
+	Sdl            SdlInfo
+	Keymap         string
+}
+
+type DeviceVkb struct {
+	BackendDomid           Domid
+	BackendDomname         string
+	Devid                  Devid
+	BackendType            VkbBackend
+	UniqueId               string
+	FeatureDisableKeyboard bool
+	FeatureDisablePointer  bool
+	FeatureAbsPointer      bool
+	FeatureRawPointer      bool
+	FeatureMultiTouch      bool
+	Width                  uint32
+	Height                 uint32
+	MultiTouchWidth        uint32
+	MultiTouchHeight       uint32
+	MultiTouchNumContacts  uint32
+}
+
+type DeviceDisk struct {
+	BackendDomid      Domid
+	BackendDomname    string
+	PdevPath          string
+	Vdev              string
+	Backend           DiskBackend
+	Format            DiskFormat
+	Script            string
+	Removable         int
+	Readwrite         int
+	IsCdrom           int
+	DirectIoSafe      bool
+	DiscardEnable     Defbool
+	ColoEnable        Defbool
+	ColoRestoreEnable Defbool
+	ColoHost          string
+	ColoPort          int
+	ColoExport        string
+	ActiveDisk        string
+	HiddenDisk        string
+}
+
+type DeviceNic struct {
+	BackendDomid                   Domid
+	BackendDomname                 string
+	Devid                          Devid
+	Mtu                            int
+	Model                          string
+	Mac                            Mac
+	Ip                             string
+	Bridge                         string
+	Ifname                         string
+	Script                         string
+	Nictype                        NicType
+	RateBytesPerInterval           uint64
+	RateIntervalUsecs              uint32
+	Gatewaydev                     string
+	ColoftForwarddev               string
+	ColoSockMirrorId               string
+	ColoSockMirrorIp               string
+	ColoSockMirrorPort             string
+	ColoSockComparePriInId         string
+	ColoSockComparePriInIp         string
+	ColoSockComparePriInPort       string
+	ColoSockCompareSecInId         string
+	ColoSockCompareSecInIp         string
+	ColoSockCompareSecInPort       string
+	ColoSockCompareNotifyId        string
+	ColoSockCompareNotifyIp        string
+	ColoSockCompareNotifyPort      string
+	ColoSockRedirector0Id          string
+	ColoSockRedirector0Ip          string
+	ColoSockRedirector0Port        string
+	ColoSockRedirector1Id          string
+	ColoSockRedirector1Ip          string
+	ColoSockRedirector1Port        string
+	ColoSockRedirector2Id          string
+	ColoSockRedirector2Ip          string
+	ColoSockRedirector2Port        string
+	ColoFilterMirrorQueue          string
+	ColoFilterMirrorOutdev         string
+	ColoFilterRedirector0Queue     string
+	ColoFilterRedirector0Indev     string
+	ColoFilterRedirector0Outdev    string
+	ColoFilterRedirector1Queue     string
+	ColoFilterRedirector1Indev     string
+	ColoFilterRedirector1Outdev    string
+	ColoComparePriIn               string
+	ColoCompareSecIn               string
+	ColoCompareOut                 string
+	ColoCompareNotifyDev           string
+	ColoSockSecRedirector0Id       string
+	ColoSockSecRedirector0Ip       string
+	ColoSockSecRedirector0Port     string
+	ColoSockSecRedirector1Id       string
+	ColoSockSecRedirector1Ip       string
+	ColoSockSecRedirector1Port     string
+	ColoFilterSecRedirector0Queue  string
+	ColoFilterSecRedirector0Indev  string
+	ColoFilterSecRedirector0Outdev string
+	ColoFilterSecRedirector1Queue  string
+	ColoFilterSecRedirector1Indev  string
+	ColoFilterSecRedirector1Outdev string
+	ColoFilterSecRewriter0Queue    string
+	ColoCheckpointHost             string
+	ColoCheckpointPort             string
+}
+
+type DevicePci struct {
+	Func         byte
+	Dev          byte
+	Bus          byte
+	Domain       int
+	Vdevfn       uint32
+	VfuncMask    uint32
+	Msitranslate bool
+	PowerMgmt    bool
+	Permissive   bool
+	Seize        bool
+	RdmPolicy    RdmReservePolicy
+}
+
+type DeviceRdm struct {
+	Start  uint64
+	Size   uint64
+	Policy RdmReservePolicy
+}
+
+type UsbctrlType int
+
+const (
+	UsbctrlTypeAuto        UsbctrlType = 0
+	UsbctrlTypePv          UsbctrlType = 1
+	UsbctrlTypeDevicemodel UsbctrlType = 2
+	UsbctrlTypeQusb        UsbctrlType = 3
+)
+
+type UsbdevType int
+
+const (
+	UsbdevTypeHostdev UsbdevType = 1
+)
+
+type DeviceUsbctrl struct {
+	Type           UsbctrlType
+	Devid          Devid
+	Version        int
+	Ports          int
+	BackendDomid   Domid
+	BackendDomname string
+}
+
+type DeviceUsbdev struct {
+	Ctrl      Devid
+	Port      int
+	Type      UsbdevType
+	TypeUnion deviceUsbdevTypeUnion
+}
+
+type deviceUsbdevTypeUnion interface {
+	isdeviceUsbdevTypeUnion()
+}
+
+type DeviceUsbdevTypeUnionHostdev struct {
+	Hostbus  byte
+	Hostaddr byte
+}
+
+func (x DeviceUsbdevTypeUnionHostdev) isdeviceUsbdevTypeUnion() {}
+
+type DeviceDtdev struct {
+	Path string
+}
+
+type DeviceVtpm struct {
+	BackendDomid   Domid
+	BackendDomname string
+	Devid          Devid
+	Uuid           Uuid
+}
+
+type DeviceP9 struct {
+	BackendDomid   Domid
+	BackendDomname string
+	Tag            string
+	Path           string
+	SecurityModel  string
+	Devid          Devid
+}
+
+type DevicePvcallsif struct {
+	BackendDomid   Domid
+	BackendDomname string
+	Devid          Devid
+}
+
+type DeviceChannel struct {
+	BackendDomid    Domid
+	BackendDomname  string
+	Devid           Devid
+	Name            string
+	Connection      ChannelConnection
+	ConnectionUnion deviceChannelConnectionUnion
+}
+
+type deviceChannelConnectionUnion interface {
+	isdeviceChannelConnectionUnion()
+}
+
+type DeviceChannelConnectionUnionSocket struct {
+	Path string
+}
+
+func (x DeviceChannelConnectionUnionSocket) isdeviceChannelConnectionUnion() {}
+
+type ConnectorParam struct {
+	UniqueId string
+	Width    uint32
+	Height   uint32
+}
+
+type DeviceVdispl struct {
+	BackendDomid   Domid
+	BackendDomname string
+	Devid          Devid
+	BeAlloc        bool
+	Connectors     []ConnectorParam
+}
+
+type VsndPcmFormat int
+
+const (
+	VsndPcmFormatS8               VsndPcmFormat = 1
+	VsndPcmFormatU8               VsndPcmFormat = 2
+	VsndPcmFormatS16Le            VsndPcmFormat = 3
+	VsndPcmFormatS16Be            VsndPcmFormat = 4
+	VsndPcmFormatU16Le            VsndPcmFormat = 5
+	VsndPcmFormatU16Be            VsndPcmFormat = 6
+	VsndPcmFormatS24Le            VsndPcmFormat = 7
+	VsndPcmFormatS24Be            VsndPcmFormat = 8
+	VsndPcmFormatU24Le            VsndPcmFormat = 9
+	VsndPcmFormatU24Be            VsndPcmFormat = 10
+	VsndPcmFormatS32Le            VsndPcmFormat = 11
+	VsndPcmFormatS32Be            VsndPcmFormat = 12
+	VsndPcmFormatU32Le            VsndPcmFormat = 13
+	VsndPcmFormatU32Be            VsndPcmFormat = 14
+	VsndPcmFormatF32Le            VsndPcmFormat = 15
+	VsndPcmFormatF32Be            VsndPcmFormat = 16
+	VsndPcmFormatF64Le            VsndPcmFormat = 17
+	VsndPcmFormatF64Be            VsndPcmFormat = 18
+	VsndPcmFormatIec958SubframeLe VsndPcmFormat = 19
+	VsndPcmFormatIec958SubframeBe VsndPcmFormat = 20
+	VsndPcmFormatMuLaw            VsndPcmFormat = 21
+	VsndPcmFormatALaw             VsndPcmFormat = 22
+	VsndPcmFormatImaAdpcm         VsndPcmFormat = 23
+	VsndPcmFormatMpeg             VsndPcmFormat = 24
+	VsndPcmFormatGsm              VsndPcmFormat = 25
+)
+
+type VsndParams struct {
+	SampleRates   []uint32
+	SampleFormats []VsndPcmFormat
+	ChannelsMin   uint32
+	ChannelsMax   uint32
+	BufferSize    uint32
+}
+
+type VsndStreamType int
+
+const (
+	VsndStreamTypeP VsndStreamType = 1
+	VsndStreamTypeC VsndStreamType = 2
+)
+
+type VsndStream struct {
+	UniqueId string
+	Type     VsndStreamType
+	Params   VsndParams
+}
+
+type VsndPcm struct {
+	Name    string
+	Params  VsndParams
+	Streams []VsndStream
+}
+
+type DeviceVsnd struct {
+	BackendDomid   Domid
+	BackendDomname string
+	Devid          Devid
+	ShortName      string
+	LongName       string
+	Params         VsndParams
+	Pcms           []VsndPcm
+}
+
+type DomainConfig struct {
+	CInfo       DomainCreateInfo
+	BInfo       DomainBuildInfo
+	Disks       []DeviceDisk
+	Nics        []DeviceNic
+	Pcidevs     []DevicePci
+	Rdms        []DeviceRdm
+	Dtdevs      []DeviceDtdev
+	Vfbs        []DeviceVfb
+	Vkbs        []DeviceVkb
+	Vtpms       []DeviceVtpm
+	P9S         []DeviceP9
+	Pvcallsifs  []DevicePvcallsif
+	Vdispls     []DeviceVdispl
+	Vsnds       []DeviceVsnd
+	Channels    []DeviceChannel
+	Usbctrls    []DeviceUsbctrl
+	Usbdevs     []DeviceUsbdev
+	OnPoweroff  ActionOnShutdown
+	OnReboot    ActionOnShutdown
+	OnWatchdog  ActionOnShutdown
+	OnCrash     ActionOnShutdown
+	OnSoftReset ActionOnShutdown
+}
+
+type Diskinfo struct {
+	Backend    string
+	BackendId  uint32
+	Frontend   string
+	FrontendId uint32
+	Devid      Devid
+	State      int
+	Evtch      int
+	Rref       int
+}
+
+type Nicinfo struct {
+	Backend    string
+	BackendId  uint32
+	Frontend   string
+	FrontendId uint32
+	Devid      Devid
+	State      int
+	Evtch      int
+	RrefTx     int
+	RrefRx     int
+}
+
+type Vtpminfo struct {
+	Backend    string
+	BackendId  uint32
+	Frontend   string
+	FrontendId uint32
+	Devid      Devid
+	State      int
+	Evtch      int
+	Rref       int
+	Uuid       Uuid
+}
+
+type Usbctrlinfo struct {
+	Type       UsbctrlType
+	Devid      Devid
+	Version    int
+	Ports      int
+	Backend    string
+	BackendId  uint32
+	Frontend   string
+	FrontendId uint32
+	State      int
+	Evtch      int
+	RefUrb     int
+	RefConn    int
+}
+
+type Vcpuinfo struct {
+	Vcpuid     uint32
+	Cpu        uint32
+	Online     bool
+	Blocked    bool
+	Running    bool
+	VcpuTime   uint64
+	Cpumap     Bitmap
+	CpumapSoft Bitmap
+}
+
+type Physinfo struct {
+	ThreadsPerCore     uint32
+	CoresPerSocket     uint32
+	MaxCpuId           uint32
+	NrCpus             uint32
+	CpuKhz             uint32
+	TotalPages         uint64
+	FreePages          uint64
+	ScrubPages         uint64
+	OutstandingPages   uint64
+	SharingFreedPages  uint64
+	SharingUsedFrames  uint64
+	MaxPossibleMfn     uint64
+	NrNodes            uint32
+	HwCap              Hwcap
+	CapHvm             bool
+	CapPv              bool
+	CapHvmDirectio     bool
+	CapHap             bool
+	CapShadow          bool
+	CapIommuHapPtShare bool
+}
+
+type Connectorinfo struct {
+	UniqueId string
+	Width    uint32
+	Height   uint32
+	ReqEvtch int
+	ReqRref  int
+	EvtEvtch int
+	EvtRref  int
+}
+
+type Vdisplinfo struct {
+	Backend    string
+	BackendId  uint32
+	Frontend   string
+	FrontendId uint32
+	Devid      Devid
+	State      int
+	BeAlloc    bool
+	Connectors []Connectorinfo
+}
+
+type Streaminfo struct {
+	ReqEvtch int
+	ReqRref  int
+}
+
+type Pcminfo struct {
+	Streams []Streaminfo
+}
+
+type Vsndinfo struct {
+	Backend    string
+	BackendId  uint32
+	Frontend   string
+	FrontendId uint32
+	Devid      Devid
+	State      int
+	Pcms       []Pcminfo
+}
+
+type Vkbinfo struct {
+	Backend    string
+	BackendId  uint32
+	Frontend   string
+	FrontendId uint32
+	Devid      Devid
+	State      int
+	Evtch      int
+	Rref       int
+}
+
+type Numainfo struct {
+	Size  uint64
+	Free  uint64
+	Dists []uint32
+}
+
+type Cputopology struct {
+	Core   uint32
+	Socket uint32
+	Node   uint32
+}
+
+type Pcitopology struct {
+	Seg   uint16
+	Bus   byte
+	Devfn byte
+	Node  uint32
+}
+
+type SchedCreditParams struct {
+	TsliceMs        int
+	RatelimitUs     int
+	VcpuMigrDelayUs int
+}
+
+type SchedCredit2Params struct {
+	RatelimitUs int
+}
+
+type DomainRemusInfo struct {
+	Interval           int
+	AllowUnsafe        Defbool
+	Blackhole          Defbool
+	Compression        Defbool
+	Netbuf             Defbool
+	Netbufscript       string
+	Diskbuf            Defbool
+	Colo               Defbool
+	UserspaceColoProxy Defbool
+}
+
+type EventType int
+
+const (
+	EventTypeDomainShutdown               EventType = 1
+	EventTypeDomainDeath                  EventType = 2
+	EventTypeDiskEject                    EventType = 3
+	EventTypeOperationComplete            EventType = 4
+	EventTypeDomainCreateConsoleAvailable EventType = 5
+)
+
+type Event struct {
+	Link      EvLink
+	Domid     Domid
+	Domuuid   Uuid
+	ForUser   uint64
+	Type      EventType
+	TypeUnion eventTypeUnion
+}
+
+type eventTypeUnion interface {
+	iseventTypeUnion()
+}
+
+type EventTypeUnionDomainShutdown struct {
+	ShutdownReason byte
+}
+
+func (x EventTypeUnionDomainShutdown) iseventTypeUnion() {}
+
+type EventTypeUnionDiskEject struct {
+	Vdev string
+	Disk DeviceDisk
+}
+
+func (x EventTypeUnionDiskEject) iseventTypeUnion() {}
+
+type EventTypeUnionOperationComplete struct {
+	Rc int
+}
+
+func (x EventTypeUnionOperationComplete) iseventTypeUnion() {}
+
+type PsrCmtType int
+
+const (
+	PsrCmtTypeCacheOccupancy PsrCmtType = 1
+	PsrCmtTypeTotalMemCount  PsrCmtType = 2
+	PsrCmtTypeLocalMemCount  PsrCmtType = 3
+)
+
+type PsrCbmType int
+
+const (
+	PsrCbmTypeUnknown   PsrCbmType = 0
+	PsrCbmTypeL3Cbm     PsrCbmType = 1
+	PsrCbmTypeL3CbmCode PsrCbmType = 2
+	PsrCbmTypeL3CbmData PsrCbmType = 3
+	PsrCbmTypeL2Cbm     PsrCbmType = 4
+	PsrCbmTypeMbaThrtl  PsrCbmType = 5
+)
+
+type PsrCatInfo struct {
+	Id         uint32
+	CosMax     uint32
+	CbmLen     uint32
+	CdpEnabled bool
+}
+
+type PsrFeatType int
+
+const (
+	PsrFeatTypeCat PsrFeatType = 1
+	PsrFeatTypeMba PsrFeatType = 2
+)
+
+type PsrHwInfo struct {
+	Id        uint32
+	Type      PsrFeatType
+	TypeUnion psrHwInfoTypeUnion
+}
+
+type psrHwInfoTypeUnion interface {
+	ispsrHwInfoTypeUnion()
+}
+
+type PsrHwInfoTypeUnionCat struct {
+	CosMax     uint32
+	CbmLen     uint32
+	CdpEnabled bool
+}
+
+func (x PsrHwInfoTypeUnionCat) ispsrHwInfoTypeUnion() {}
+
+type PsrHwInfoTypeUnionMba struct {
+	CosMax   uint32
+	ThrtlMax uint32
+	Linear   bool
+}
+
+func (x PsrHwInfoTypeUnionMba) ispsrHwInfoTypeUnion() {}
-- 
2.17.1


