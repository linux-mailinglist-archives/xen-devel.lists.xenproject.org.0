Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8C21DE37E
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 11:50:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc4Jm-0007ml-QW; Fri, 22 May 2020 09:50:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2cgu=7E=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jc4Jl-0007mg-PF
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 09:50:17 +0000
X-Inumbo-ID: a3a0895c-9c11-11ea-aba8-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a3a0895c-9c11-11ea-aba8-12813bfff9fa;
 Fri, 22 May 2020 09:50:16 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 2EOl9xU0oWRpS/14ijNqMJw2MTZ/WKZsksGprQsRZUnBHIul/sC2q2piRMqB5USAJTglWXyzzA
 wAVe9PBVuU9qW+7VQdQFgqCsPOqN9W1Qq3WmTAYLUNRb3Apy1aGU4oHHXgkUF1BH+21w/saO1I
 UCWyHVj+em1s25fqVx2dBa7sKFYlhtnBbIhb33cgw4uARbX2WCs94DTHnBiChEiVwC9UwJ2OZt
 /AYPVCMa4tIWOLaOMaIVhUzbTcoSfWb0ef1aWMTtkrGzDhBrXleNXRyrlumxwQa7UcceL8cIhV
 Yrg=
X-SBRS: 2.7
X-MesageID: 18159426
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,421,1583211600"; d="scan'208";a="18159426"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH] golang: Update generated files after libxl_types.idl change
Date: Fri, 22 May 2020 10:49:56 +0100
Message-ID: <20200522094956.3611661-1-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Ian Jackson <ian.jackson@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

c/s 7efd9f3d45 ("libxl: Handle Linux stubdomain specific QEMU
options.") modified libl_types.idl.  Run gengotypes.py again to update
the geneated golang bindings.

Signed-off-by: George Dunlap <george.dunlap@citrix.com>
---
CC: Nick Rosbrook <rosbrookn@ainfosec.com>
CC: Ian Jackson <ian.jackson@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 tools/golang/xenlight/helpers.gen.go | 10 ++++++++++
 tools/golang/xenlight/types.gen.go   |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index 109e9515a2..b5bd0de830 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -1163,6 +1163,9 @@ func (x *DomainBuildInfo) fromC(xc *C.libxl_domain_build_info) error {
 	if err := x.DeviceModelStubdomain.fromC(&xc.device_model_stubdomain); err != nil {
 		return fmt.Errorf("converting field DeviceModelStubdomain: %v", err)
 	}
+	x.StubdomainMemkb = uint64(xc.stubdomain_memkb)
+	x.StubdomainKernel = C.GoString(xc.stubdomain_kernel)
+	x.StubdomainRamdisk = C.GoString(xc.stubdomain_ramdisk)
 	x.DeviceModel = C.GoString(xc.device_model)
 	x.DeviceModelSsidref = uint32(xc.device_model_ssidref)
 	x.DeviceModelSsidLabel = C.GoString(xc.device_model_ssid_label)
@@ -1489,6 +1492,13 @@ func (x *DomainBuildInfo) toC(xc *C.libxl_domain_build_info) (err error) {
 	if err := x.DeviceModelStubdomain.toC(&xc.device_model_stubdomain); err != nil {
 		return fmt.Errorf("converting field DeviceModelStubdomain: %v", err)
 	}
+	xc.stubdomain_memkb = C.uint64_t(x.StubdomainMemkb)
+	if x.StubdomainKernel != "" {
+		xc.stubdomain_kernel = C.CString(x.StubdomainKernel)
+	}
+	if x.StubdomainRamdisk != "" {
+		xc.stubdomain_ramdisk = C.CString(x.StubdomainRamdisk)
+	}
 	if x.DeviceModel != "" {
 		xc.device_model = C.CString(x.DeviceModel)
 	}
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index df68fd0e88..15516ae552 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -509,6 +509,9 @@ type DomainBuildInfo struct {
 	MaxMaptrackFrames     uint32
 	DeviceModelVersion    DeviceModelVersion
 	DeviceModelStubdomain Defbool
+	StubdomainMemkb       uint64
+	StubdomainKernel      string
+	StubdomainRamdisk     string
 	DeviceModel           string
 	DeviceModelSsidref    uint32
 	DeviceModelSsidLabel  string
-- 
2.25.1


