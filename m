Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 810946593DE
	for <lists+xen-devel@lfdr.de>; Fri, 30 Dec 2022 01:39:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.469763.729181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pB3QL-0002zM-J7; Fri, 30 Dec 2022 00:39:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 469763.729181; Fri, 30 Dec 2022 00:39:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pB3QL-0002vU-Cy; Fri, 30 Dec 2022 00:39:01 +0000
Received: by outflank-mailman (input) for mailman id 469763;
 Fri, 30 Dec 2022 00:39:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3dJX=44=citrix.com=prvs=35664f79d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pB3QK-0002si-AO
 for xen-devel@lists.xenproject.org; Fri, 30 Dec 2022 00:39:00 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 562fe20d-87da-11ed-91b6-6bf2151ebd3b;
 Fri, 30 Dec 2022 01:38:56 +0100 (CET)
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
X-Inumbo-ID: 562fe20d-87da-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1672360736;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=UrorcfN+X/i2NxjKMCMKXsJRYNP4k03KIG8MCGJilaU=;
  b=AIeGbsk8P8/h3En9R/Pnub3XET9vTCVxR94tzwOPOkqSgqVRWh9n/VQ7
   26dGWNQ5EwFrBWQWxZr+i1TFKkv5Tl3VABilRkp5mURt5iOjXgRrcZiPS
   in/mCsInOP/UXe1qrpr/q0Kj/fNi4NJ54KwdP7QSpAkPcSnJIa9ymaGJY
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 90945510
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:6BM59q5Uc0cGsL5qgQETNgxRtPXHchMFZxGqfqrLsTDasY5as4F+v
 mUYUG+OP/+IY2Pxfd4kPYvk9B8E6sSDyNExGQtr/iFjHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4pwehBtC5gZkPKoR7QeF/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m/
 tMFBWkMUSC6o/uU4Kq0ctVLwc8NI5y+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJU0UUrsUIMtWcOOAr3/zaTBH7nmSorI6+TP7xw1tyrn9dtHSf7RmQO0ExhfE+
 z+fpwwVBDkaae3HwBnazUuTxejUrBvmYK8tE+KBo6sCbFq7mTVIVUx+uUGAify4gU63X5RYM
 V4Z/gInqKR0/0uuJvH6WxC7u3+F+B0BQd1bE+49wA6Iw6vQpQ2eAwAsXjNHLdArqsIybTgrz
 UOS2cPkAyR1t7+YQm7b8a2bxRu5MDIZKmIqbiYeQQwIpdLkpekblQnTR9xuFKq0iNzdGjzqx
 T2O6i8kiN0uYdUjjvvhuwqd2nT1+8aPHlVdChjrsnyN5SxkSdekWLyRzUH5ze5PFLq+CVKvs
 y1R8ySB19wmAZaInS2LZewCGrC1+vqIWAHhbU5T84oJrGr0pSP6FWxEyHQnfRoybJ5YEdP8S
 BWL0T698qO/K5dDgUVfR4uqQ/onwqH7fTgOfqCFN4EeCnSdmeLuwc2PWaJy9zq2+KTPuftlU
 Xt+TSpLJShyNEif5GDqL9rxKJdyrszE+UvdRIrg0zOs2qeEaXieRN8taQXRNLtivPPa8V+Eq
 L6z0vdmLD0GCoXDjtT/q9ZPfTjm01BgbXwJlyCnXrHaeVc3cI3QI/TQ3akga+RYokihrc+Rp
 ivVchYBmDLCaYjvdV3ihoZLNOm+Av6SbBsTYUQRALpf8yJyPNvxvf9PLPPav9APrYRe8BK9d
 NFdE+3oPxiFYm6vF+g1BXUlkLFfSQ==
IronPort-HdrOrdr: A9a23:ZR39Nq6jJhsmlfRlbgPXwMbXdLJyesId70hD6qkRc3Bom6mj/P
 xG88516faZslgssRMb+exoSZPgfZq0z/cci+Qs1NyZLWrbUQWTXeRfxLqn7zr8GzDvss5xvJ
 0QF5SW0eeAb2RHsQ==
X-IronPort-AV: E=Sophos;i="5.96,285,1665460800"; 
   d="scan'208";a="90945510"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, Anthony
 PERARD <anthony.perard@citrix.com>, Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 2/6] CI: Remove guesswork about which artefacts to preserve
Date: Fri, 30 Dec 2022 00:38:44 +0000
Message-ID: <20221230003848.3241-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20221230003848.3241-1-andrew.cooper3@citrix.com>
References: <20221230003848.3241-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Preserve the artefacts based on the `make` rune we actually ran, rather than
guesswork about which rune we would have run based on other settings.

Note that the ARM qemu smoke tests depend on finding binaries/xen even from
full builds.  Also that the Jessie-32 containers build tools but not Xen.

This means the x86_32 builds now store relevant artefacts.  No change in other
configurations.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 automation/scripts/build | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/automation/scripts/build b/automation/scripts/build
index 5dafa72ba540..8dee1cbbc251 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -70,18 +70,24 @@ if [[ "${CC}" == "gcc" && `cc-ver` -lt 0x040600 ]]; then
     cfgargs+=("--with-system-seabios=/bin/false")
 fi
 
+# Directory for the artefacts to be dumped into
+mkdir binaries
+
 if [[ "${hypervisor_only}" == "y" ]]; then
+    # Xen-only build
     make -j$(nproc) xen
+
+    # Preserve artefacts
+    cp xen/xen binaries/xen
 else
+    # Full build
     ./configure "${cfgargs[@]}"
     make -j$(nproc) dist
-fi
 
-# Extract artifacts to avoid getting rewritten by customised builds
-mkdir binaries
-if [[ "${XEN_TARGET_ARCH}" != "x86_32" ]]; then
-    cp xen/xen binaries/xen
-    if [[ "${hypervisor_only}" != "y" ]]; then
-        cp -r dist binaries/
-    fi
+    # Preserve artefacts
+    # Note: Some smoke tests depending on finding binaries/xen on a full build
+    # even though dist/ contains everything, while some containers don't even
+    # build Xen
+    cp -r dist binaries/
+    if [[ -f xen/xen ]] ; then cp xen/xen binaries/xen; fi
 fi
-- 
2.11.0


