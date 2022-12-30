Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9556593DF
	for <lists+xen-devel@lfdr.de>; Fri, 30 Dec 2022 01:39:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.469767.729228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pB3QO-00041H-CK; Fri, 30 Dec 2022 00:39:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 469767.729228; Fri, 30 Dec 2022 00:39:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pB3QO-0003vp-7j; Fri, 30 Dec 2022 00:39:04 +0000
Received: by outflank-mailman (input) for mailman id 469767;
 Fri, 30 Dec 2022 00:39:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3dJX=44=citrix.com=prvs=35664f79d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pB3QM-0002si-Aa
 for xen-devel@lists.xenproject.org; Fri, 30 Dec 2022 00:39:02 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5928b429-87da-11ed-91b6-6bf2151ebd3b;
 Fri, 30 Dec 2022 01:38:59 +0100 (CET)
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
X-Inumbo-ID: 5928b429-87da-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1672360738;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=6ChiBmSNHgKbogktQk+KonGj57CWHhflhgZJDwsSg2o=;
  b=fDWV09SJAXQmiUEfbcxAoWGKkLduDFgHLo3OfknqyW2bm8+AX2/7pT+x
   EdFerQhxwLAMsqoxdpsdoalgzKmNttXD4SyK38Mg3ymyH+hGtkfxYVahE
   p2JfkeiopOsAL8CwNskz8UJ6kQlPf64jaAYI+9mik3Y8zYTFCUpgj7r0n
   M=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 90529782
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:uMcI2K5QRpgW4/pm6gvCBgxRtPXHchMFZxGqfqrLsTDasY5as4F+v
 mIcUGyDPf6KMWGgLtxza9i09RlT6sfTyN5nSANoqy4xHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4pwehBtC5gZkPKoR7QeF/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m/
 9YcCT8TXkG6jeuG/5Tqe65SgsICM5y+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJU0UUrsUIMtWcOOAr3/zaTBH7nmSorI6+TP7xw1tyrn9dtHSf7RmQO0ExhvC9
 z2WpQwVBDk3H4CZk2ClqU6MuevkpynjUosMSOKRo6sCbFq7mTVIVUx+uUGAify4gU63X5RYM
 V4Z/gInqKR0/0uuJvH6WxC7u3+F+B0BQd1bE+49wA6Iw6vQpQ2eAwAsXjNHLdArqsIybTgrz
 UOS2cPkAyR1t7+YQm7b8a2bxRu5MDIZKmIqbiYeQQwIpdLkpekblQnTR9xuFKq0iNzdGjzqx
 T2O6i8kiN0uYdUjjvvhuwqd2nT1+8aPHlVdChjrsnyN5Cl9RYG7V92R41Hr0tARHcGnSl+go
 y1R8ySB19wmAZaInS2LZewCGrC1+vqIWAHhbU5T84oJrGr0pSP6FWxEyHQnfRoybJ5YEdP8S
 BWL0T698qO/K5dDgUVfR4uqQ/onwqH7fTgOfqCFN4EeCnSdmeLuwc2PWaJy9zq2+KTPuftlU
 Xt+TSpLJShyNEif5GDqL9rxKJdyrszE+UvdRIrg0zOs2qeEaXieRN8taQXRNLtivPPa8V+Eq
 L6z0vdmLD0GCoXDjtT/q9ZPfTjm01BgbXwJlyCnXrHaeVc3cI3QI/TQ3akga+RYokihrc+Rp
 ivVchYBmDLCaYjvdV3ihoZLNOm+Av6SbBsTYUQRALpf8yJyPNvxvf9PLPPav9APrYRe8BK9d
 NFdE+3oPxiFYm+vF+g1BXUlkLFfSQ==
IronPort-HdrOrdr: A9a23:AH0k6KElWSnR5vf7pLqE5seALOsnbusQ8zAXPiFKJSC9F/byqy
 nAppsmPHPP5gr5OktBpTnwAsi9qBrnnPYejLX5Vo3SPzUO1lHYSb1K3M/PxCDhBj271sM179
 YFT0GmMqyTMWRH
X-IronPort-AV: E=Sophos;i="5.96,285,1665460800"; 
   d="scan'208";a="90529782"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, Anthony
 PERARD <anthony.perard@citrix.com>, Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 6/6] CI: Simplify the MUSL check
Date: Fri, 30 Dec 2022 00:38:48 +0000
Message-ID: <20221230003848.3241-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20221230003848.3241-1-andrew.cooper3@citrix.com>
References: <20221230003848.3241-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

There's no need to do ad-hoc string parsing.  Use grep -q instead.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 automation/scripts/build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/automation/scripts/build b/automation/scripts/build
index 206312ecc7d0..f2f5e55bc04f 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -65,7 +65,7 @@ else
         cfgargs+=("--disable-stubdom")
     fi
 
-    if  ! test -z "$(ldd /bin/ls|grep musl|head -1)"; then
+    if ldd /bin/ls | grep -q musl; then
         # disable --disable-werror for QEMUU when building with MUSL
         cfgargs+=("--with-extra-qemuu-configure-args=\"--disable-werror\"")
         # SeaBIOS doesn't build on MUSL systems
-- 
2.11.0


