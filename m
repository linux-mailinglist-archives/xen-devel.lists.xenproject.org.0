Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A3F254C4B
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 19:36:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBLpR-0005HB-HR; Thu, 27 Aug 2020 17:36:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LCk+=CF=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1kBLpQ-00056c-01
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 17:36:48 +0000
X-Inumbo-ID: 4af3a760-4c2e-407f-867d-99ddcfafd12b
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4af3a760-4c2e-407f-867d-99ddcfafd12b;
 Thu, 27 Aug 2020 17:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598549793;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Jd/69jSrkYCxXn7af6OWEJJQ8fkaAtMcqXK50r2PD/o=;
 b=iVEJgmHAqBnaT2Kqz2CnvEAR5QNFdJWpcKw2haZUsrkNcNTbTgWlkZm7
 beXnCp0DW8PMPojwUCGbB2t/Cd/T25ySHVJ+6z2tVDjqc7vo07CT17AG7
 wuYtxXP6Rgq/bP2S7D9atugPmS38dknRzDvVAzpVz2LTaUEvNderto9st U=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: E27MO3U+SpUGqyCWEqLeJvxJUxgSSkU9mV9fBNw9FTOYknKMWUsS0HfeiNFeD/Owxq8/5JQPP1
 zkcBO5G8oIy8fVFbHJHvmUr40jcxySR+HJ1A7NS3oC7khcR4rpJn3qgU/6RdXvAvzEAfl/Jfkk
 s57JimTRlbceEDftuPdGt/E3gDPBuIr9vabt/2bnP/AHhZMSJR0LahXGEjdPKRgFKgArcE8p2b
 4H8dujc5HRGIf4Y9qQ5UO83gkGS3/m9xJ+/+DVrtpabLHo3WsO/8B+V5M4EEek8AeAfFokE1Hx
 idE=
X-SBRS: 2.7
X-MesageID: 25758534
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,360,1592884800"; d="scan'208";a="25758534"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Ian
 Jackson" <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v1 8/9] tools/ocaml/libs/mmap: mark mmap/munmap as blocking
Date: Thu, 27 Aug 2020 18:35:59 +0100
Message-ID: <2260c8a46871b7996fee69643e25eb3cb0d1c657.1598548832.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1598548832.git.edvin.torok@citrix.com>
References: <cover.1598548832.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

These functions can potentially take some time,
so allow other OCaml code to proceed meanwhile (if any).

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 tools/ocaml/libs/mmap/xenmmap_stubs.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/tools/ocaml/libs/mmap/xenmmap_stubs.c b/tools/ocaml/libs/mmap/xenmmap_stubs.c
index 9c1126c6a2..21feceea0e 100644
--- a/tools/ocaml/libs/mmap/xenmmap_stubs.c
+++ b/tools/ocaml/libs/mmap/xenmmap_stubs.c
@@ -28,6 +28,7 @@
 #include <caml/fail.h>
 #include <caml/callback.h>
 #include <caml/unixsupport.h>
+#include <caml/signals.h>
 
 #define Wsize_bsize_round(n) (Wsize_bsize( (n) + sizeof(value) - 1 ))
 
@@ -69,7 +70,9 @@ CAMLprim value stub_mmap_init(value fd, value pflag, value mflag,
 		caml_invalid_argument("negative offset");
 	length = Int_val(len);
 
+	caml_enter_blocking_section();
 	addr = mmap(NULL, length, c_pflag, c_mflag, fd, Int_val(offset));
+	caml_leave_blocking_section();
 	if (MAP_FAILED == addr)
 		uerror("mmap", Nothing);
 
@@ -80,10 +83,15 @@ CAMLprim value stub_mmap_init(value fd, value pflag, value mflag,
 CAMLprim value stub_mmap_final(value intf)
 {
 	CAMLparam1(intf);
+	struct mmap_interface interface = *Intf_val(intf);
 
-	if (Intf_val(intf)->addr != MAP_FAILED)
-		munmap(Intf_val(intf)->addr, Intf_val(intf)->len);
+	/* mark it as freed, in case munmap below fails, so we don't retry it */
 	Intf_val(intf)->addr = MAP_FAILED;
+	if (interface.addr != MAP_FAILED) {
+		caml_enter_blocking_section();
+		munmap(interface.addr, interface.len);
+		caml_leave_blocking_section();
+	}
 
 	CAMLreturn(Val_unit);
 }
-- 
2.25.1


