Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A054852AC1F
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 21:42:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331457.554973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nr34d-0001iJ-9P; Tue, 17 May 2022 19:41:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331457.554973; Tue, 17 May 2022 19:41:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nr34d-0001gV-6b; Tue, 17 May 2022 19:41:39 +0000
Received: by outflank-mailman (input) for mailman id 331457;
 Tue, 17 May 2022 19:41:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=juf1=VZ=citrix.com=prvs=1294c2b73=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nr34c-0001gP-La
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 19:41:38 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5be0e18d-d619-11ec-837e-e5687231ffcc;
 Tue, 17 May 2022 21:41:36 +0200 (CEST)
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
X-Inumbo-ID: 5be0e18d-d619-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652816496;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aBugvKDimbdDHpVRY9poQsYTk8AfjAaSmNls4jiErmU=;
  b=G6RbNV2L6ofpWqbQ4BF5EtrLZAjxaKv+4/02f5halT9S2DB7LiaXeFmn
   HgKt3SDWFyQKU088hdhC2wXR9KP/5tDlgZjDYPnONosBE5vqpUDhAb73F
   FJ+H1YHij8opS4U9wus+W4fDwFRqEwoVWW6fjk2RE4EXrXIT7elH7aS3S
   k=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 71543646
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:jZw2kq7coxSGItJ8P3WKiAxRtFrHchMFZxGqfqrLsTDasY5as4F+v
 jAfC2qDPfqPZTb1eNlyb9y3pBsAuMfSz9I3Swtp/CE0Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0HqPp8Zj2tQy2YXgXFvX0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSZUyx1YKvpqt8DDTQBSRAnPaZh4YLYdC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKs2vH16wC6fJvEhWZ3ZGI3B5MNC3Sd2jcdLdRrbT
 5VANGY0MkieC/FJEmo9Fq4xrOWPvVX+Uj97jnyZmooovFGGmWSd15CyaYGIK7RmX/59mluTr
 yTI9mLyDxUeKfSW0z/D+XWp7sffkCW+VI8MGbmQ8v9xnEbV1mEVEAcRV1awvb++kEHWZj5EA
 xVKoGx09/F0rRH1CImmN/GlnJKaljcGcIYOFcgI0x/T5/OO0l+ZDU8dcyEUPbTKq/QKbTAt0
 1aImfbgCjpurKCZRBqhy1uEkd+hEXNLdDFfPEfoWSNAuoC++99r0nojW/45SMaIYsvJ9SYcK
 txghAw3nP0tgMECzM1XFniX0mv39vAlouPYjzg7v15JDCskPeZJhKTysDA3CMqsy67AFzG8U
 IAswZT20Qz3JcjleNaxaOsMBqq1wP2OLSfRh1Vid7F4qWn3qyf5Id0JvmomTKuMDirjUWa5C
 HI/RCsLvMMDVJdURfEfj32N5zQCkvG7SIWNugH8ZdtSeJlhHDJrDwk1DXN8K1vFyRB2+YlmY
 M/zWZ/1UR4yVPU8pBLrFrh17FPe7n1nrY8lbcujn0rPPHv3TCP9dIrpx3PVMLxotP7e8VyMm
 zudXuPToyhivCTFSnG/2eYuwZoidxDX2bieRxRrS9O+
IronPort-HdrOrdr: A9a23:4/aJ8qNHgQ/9j8BcTvujsMiBIKoaSvp037Eqv3oRdfUzSL3hqy
 nOpoVj6faaskdzZJhNo7+90ey7MBfhHP1OkO8s1NWZLWvbUQKTRekIh+aP/9SjIVyYygc079
 YaT0EUMr3N5DZB4/oSmDPIduod/A==
X-IronPort-AV: E=Sophos;i="5.91,233,1647316800"; 
   d="scan'208";a="71543646"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Christian Lindig
	<christian.lindig@citrix.com>, =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?=
	<edvin.torok@citrix.com>, Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH 2/2] tools/ocaml: Fix stubs the introduction of domain_create.cpupool_id
Date: Tue, 17 May 2022 20:41:13 +0100
Message-ID: <20220517194113.2574-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220517194113.2574-1-andrew.cooper3@citrix.com>
References: <20220517194113.2574-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Sadly, cpupool IDs are chosen by the caller, not assigned sequentially, so
this does need to have a full 32 bits of range.

Also leave a BUILD_BUG_ON() to catch more obvious ABI changes in the future.

Fixes: 92ea9c54fc81 ("arm/dom0less: assign dom0less guests to cpupools")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Christian Lindig <christian.lindig@citrix.com>
CC: Edwin Török <edvin.torok@citrix.com>
CC: Luca Fancellu <luca.fancellu@arm.com>
---
 tools/ocaml/libs/xc/xenctrl.ml      | 1 +
 tools/ocaml/libs/xc/xenctrl.mli     | 1 +
 tools/ocaml/libs/xc/xenctrl_stubs.c | 8 +++++++-
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index 7503031d8f61..8eab6f60eb14 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -85,6 +85,7 @@ type domctl_create_config =
 	max_grant_frames: int;
 	max_maptrack_frames: int;
 	max_grant_version: int;
+	cpupool_id: int32;
 	arch: arch_domainconfig;
 }
 
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index d1d9c9247afc..d3014a2708d8 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -77,6 +77,7 @@ type domctl_create_config = {
   max_grant_frames: int;
   max_maptrack_frames: int;
   max_grant_version: int;
+  cpupool_id: int32;
   arch: arch_domainconfig;
 }
 
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index 5b4fe72c8dec..513ee142d2a0 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -189,7 +189,8 @@ CAMLprim value stub_xc_domain_create(value xch, value wanted_domid, value config
 #define VAL_MAX_GRANT_FRAMES    Field(config, 6)
 #define VAL_MAX_MAPTRACK_FRAMES Field(config, 7)
 #define VAL_MAX_GRANT_VERSION   Field(config, 8)
-#define VAL_ARCH                Field(config, 9)
+#define VAL_CPUPOOL_ID          Field(config, 9)
+#define VAL_ARCH                Field(config, 10)
 
 	uint32_t domid = Int_val(wanted_domid);
 	int result;
@@ -201,6 +202,7 @@ CAMLprim value stub_xc_domain_create(value xch, value wanted_domid, value config
 		.max_maptrack_frames = Int_val(VAL_MAX_MAPTRACK_FRAMES),
 		.grant_opts =
 		    XEN_DOMCTL_GRANT_version(Int_val(VAL_MAX_GRANT_VERSION)),
+		.cpupool_id = Int32_val(VAL_CPUPOOL_ID),
 	};
 
 	domain_handle_of_uuid_string(cfg.handle, String_val(VAL_HANDLE));
@@ -225,6 +227,9 @@ CAMLprim value stub_xc_domain_create(value xch, value wanted_domid, value config
 	case 1: /* X86 - emulation flags in the block */
 #if defined(__i386__) || defined(__x86_64__)
 
+		/* Quick & dirty check for ABI changes. */
+		BUILD_BUG_ON(sizeof(cfg) != 64);
+
         /* Mnemonics for the named fields inside xen_x86_arch_domainconfig */
 #define VAL_EMUL_FLAGS          Field(arch_domconfig, 0)
 
@@ -254,6 +259,7 @@ CAMLprim value stub_xc_domain_create(value xch, value wanted_domid, value config
 	}
 
 #undef VAL_ARCH
+#undef VAL_CPUPOOL_ID
 #undef VAL_MAX_GRANT_VERSION
 #undef VAL_MAX_MAPTRACK_FRAMES
 #undef VAL_MAX_GRANT_FRAMES
-- 
2.11.0


