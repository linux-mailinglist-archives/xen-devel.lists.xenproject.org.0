Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B902745DB91
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 14:48:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231309.400343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF6S-0001PG-Ia; Thu, 25 Nov 2021 13:47:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231309.400343; Thu, 25 Nov 2021 13:47:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF6S-00015q-0V; Thu, 25 Nov 2021 13:47:56 +0000
Received: by outflank-mailman (input) for mailman id 231309;
 Thu, 25 Nov 2021 13:47:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nd7+=QM=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mqF1C-0007NX-ET
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 13:42:30 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87919499-4df5-11ec-9787-a32c541c8605;
 Thu, 25 Nov 2021 14:42:29 +0100 (CET)
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
X-Inumbo-ID: 87919499-4df5-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637847749;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kLngYtN5+zVn384EmQlaf0kegkNhkeNirtRV6fuCSxQ=;
  b=AXBfYM1d2FtC4Ol/SRFu3n7DidIuvR/YEvtZHbyetxR4zoIZ3ljX2pXk
   yo34UkAMfhQjAr4Q7qmirv99gyx/9G0DjzAFe6F8deAgqynMNJfO821eV
   M1YM6GCzInqdvxeJVVCumyci2oT5iByJANUkDIrsuuHAOkwInhFwXuK3l
   Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: +VagdRN3XIM3iJxsKgxloBqFS/1UMY5Mlj9uW4l+bZ10LAHG7dapuFDtwrwrugCSOY6LIktC2N
 52DxCJt2dncM0V3/bYmMoxkN5m8TnPud9NVkg990K3rwiZTyUfiCJ3nvuqLhrQ//6MgmyBcnLd
 d1n/pxbXjJPabRPFLDgfbIaOrMfjzHULGpxtrO2fDk1vzzldHc0MTPlQhHh8aM83t4p3ELEBtD
 SbzjPvaqiystry0gda2Fn3Qf/KHnbxD5J1ILKKy+JV//gxr4cIXcpOG2UsGPhFOo7LnTVWwl6J
 q2qZAjWKB1mPr2L3mb7JoZZE
X-SBRS: 5.1
X-MesageID: 60634194
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:cbcbjaOb0ehQGpXvrR0ykMFynXyQoLVcMsEvi/4bfWQNrUon0zZTn
 2QeXG2EOPaPMGf1ft91YIm+8xtX7MDRyoc1TQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6bUsxNbVU8En540Eg+w7RRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYo2iolvpr4
 cxgjJiLbAkDMa7JutgjcyANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YuBqmsQkKtitJI4Fs2ts5TrYEewnUdbIRKCiCdpwgm9u3ZwXTKq2i
 8wxUTQ2TA/CeydzJhQvJ5MDk8WKgHr9bGgNwL6SjfVuuDWCpOBr65DvLd7Ud9qiVchT2EGCq
 Qru5H/lCxsXMNiezzut8X+2gOLL2yThV+o6C7mQ5vNsxlqJyQQ7ChcbSF+6qvmRkVOlVpRUL
 El80jojq+0++VKmSvH5XgakuziUsxgEQd1SHuYmrgaXxcL86gCFBm8CX3hZZcYvrsMeSjkj1
 1vPlNTsbRRur7+9WX+b7q2Trz65JW4SN2BqWMMfZVJbuZ+5+th110+RCIY4eEKosjHrMWzRy
 hqQhTETvrEoqMAh2Ka+32z5owv58/AlUTUJzgnQW2uk6CZwa4ike5Gk5DDn0BpQEGqKZgLf5
 SZZwqBy+MhLVMjQz3LVHI3hCZnwv67dWAAwl2KDCHXIG96F33e4Nb5d7zhlTKuCGpZVIGS5C
 KM/VO442XOyAJdIRfMoC25SI55zpUQFKTgCfqqJBueimrArKGe6ENhGPCZ8JVzFnkk2ir0YM
 pyGa8uqBntyIf05l2XpGLZNge5xmHFWKYbvqXfTlUrP7FZjTCTNFedt3KWmMojVE59oUC2Kq
 o0CZqNmOj1UUfHkYzm/zGLgBQtiEJTPPriv85Y/XrfaemJOQTh9Y9eMkeJJU9E0xMx9y7aXl
 kxRr2cFkTITc1Wccl7UAp2iAZuyNatCQYUTYXZxYA32gid7Ou5CLs43LvMKQFXuz8Q7pdYcc
 hXPU5To7i1nRmuV9jIDQ4P6qYA+Jh2niRjXZ3iuYSQlfo4mTAvMo4e2cgzq/SgILyy2qcph/
 OHwilKFGcIOF1Z4EcLbSPOz1Fft73ITr/1/AhnTKd5JdUSyrIUzc37tjuU6Kt0nIAnYwmfIz
 B6fBBoV/LGfo4I8/NTTq7qDqoOlT7l3EkZARjGJ5reqLyjKuGGkxNYYAuqPeDncUkLy+bmjO
 roJn62tbqVfkQ8T4YRmErttwaYv3PfVpudXnlZ+AXHGT1W3Ebc8cHOI6tZC6/9WzbhDtAroB
 k/WootGOa+EMd/OGUIKIFZ3dfyK0PwZl2WA7fkxJ0mmtiZ78KDeDBdXNhiIzidcMKF0IMUux
 uJ44Jwa7Am2ixwLNNeaj38LqzTQfyJYC6h35IsHBILLixYwzgAQaJPRPSb6/ZWTZogeKUItO
 DKV2PLPirk0KpAuqJbv+awhBdZguKk=
IronPort-HdrOrdr: A9a23:948ck67okO2s47XlNQPXwPDXdLJyesId70hD6qhwISY6TiX+rb
 HJoB17726NtN9/YhEdcLy7VJVoBEmskKKdgrNhWotKPjOW21dARbsKheCJrgEIWReOktK1vZ
 0QCpSWY+eQMbEVt6nHCXGDYrQd/OU=
X-IronPort-AV: E=Sophos;i="5.87,263,1631592000"; 
   d="scan'208";a="60634194"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Anthony PERARD
	<anthony.perard@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	"George Dunlap" <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	"Jan Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v8 45/47] WIP, no-VPATH: build xen, out-of-tree!
Date: Thu, 25 Nov 2021 13:40:04 +0000
Message-ID: <20211125134006.1076646-46-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125134006.1076646-1-anthony.perard@citrix.com>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Anthony PERARD <anthony.perard@gmail.com>

We can retire VPATH now, and $(srctree) to prerequisite of generic
rules.

(targets %.i and %.s and %.E are updated but may not work as
expected.)

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/Makefile |  3 +--
 xen/Rules.mk | 12 ++++++------
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index fbce0f6771fb..32c36426ed7c 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -188,9 +188,8 @@ else
 endif
 
 objtree := .
-VPATH := $(srctree)
 
-export building_out_of_srctree srctree objtree VPATH
+export building_out_of_srctree srctree objtree
 
 export XEN_ROOT := $(abs_srctree)/..
 
diff --git a/xen/Rules.mk b/xen/Rules.mk
index 0ef45d2c7087..6fcb1f6b769f 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -268,7 +268,7 @@ ifdef building_out_of_srctree
 $(gen-objs-S) $(obj-gen-y): $(obj)/%.o: $(obj)/%.S FORCE
 	$(call if_changed_dep,cc_o_S)
 endif
-$(obj)/%.o: $(src)/%.S FORCE
+$(obj)/%.o: $(srctree)/$(src)/%.S FORCE
 	$(call if_changed_dep,cc_o_S)
 
 
@@ -298,18 +298,18 @@ cmd_cc_s_c = $(CC) $(filter-out -Wa$(comma)%,$(c_flags)) -S $< -o $@
 quiet_cmd_cpp_s_S = CPP     $@
 cmd_cpp_s_S = $(CPP) $(call cpp_flags,$(a_flags)) -MQ $@ -o $@ $<
 
-$(obj)/%.i: $(src)/%.c FORCE
+$(obj)/%.i: $(srctree)/$(src)/%.c FORCE
 	$(call if_changed_dep,cpp_i_c)
 
-$(obj)/%.s: $(src)/%.c FORCE
+$(obj)/%.s: $(srctree)/$(src)/%.c FORCE
 	$(call if_changed_dep,cc_s_c)
 
-$(obj)/%.s: $(src)/%.S FORCE
+$(obj)/%.s: $(srctree)/$(src)/%.S FORCE
 	$(call if_changed_dep,cpp_s_S)
 
-$(obj)/%.E: $(src)/%.c FORCE
+$(obj)/%.E: $(srctree)/$(src)/%.c FORCE
 	$(call if_changed_dep,cpp_i_c)
-$(obj)/%.E: $(src)/%.S FORCE
+$(obj)/%.E: $(srctree)/$(src)/%.S FORCE
 	$(call if_changed_dep,cpp_s_S)
 
 # Linker scripts, .lds.S -> .lds
-- 
Anthony PERARD


