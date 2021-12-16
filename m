Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD631476D49
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 10:21:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247775.427263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxmwO-0008DY-RJ; Thu, 16 Dec 2021 09:20:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247775.427263; Thu, 16 Dec 2021 09:20:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxmwO-0008Bh-Nd; Thu, 16 Dec 2021 09:20:44 +0000
Received: by outflank-mailman (input) for mailman id 247775;
 Thu, 16 Dec 2021 09:20:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VCpR=RB=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mxmwN-0008Bb-Vr
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 09:20:44 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f878b22-5e51-11ec-9e60-abaf8a552007;
 Thu, 16 Dec 2021 10:20:41 +0100 (CET)
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
X-Inumbo-ID: 6f878b22-5e51-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1639646441;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Eenr6lVD8mBTFntcyKC5oakyauxRxLv4WtMuAgZ9/Ls=;
  b=ZYvLpJxIgdceuXz/l95s5nUrb/iAvcr/bvyJ+hdEWhWXhN/nePvf45hZ
   6q8G+m53llCRYi6N3SsKMzs7ILEG9/P92MWyLS8Vjr5bxuU7Ji+EFKYJO
   fRlvGIy5BxVRU/xrIsPRthgb1JMycURSxi4Y4a09Wy9CBLlNjGx2Lrc13
   c=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: EPJrtohJ8BvwO4jZmg+19QEbZHVQU9XnQqndS0RlQysaEVXV731Fz/mjNvyVMokAk0I8K0E5SG
 mXGLuq3ZLV8/90mRrZW4YYvzZlUVA5TJoVp2iNUuhmr83mAgID8gnOHBpysbCbpFruYPKWrDZP
 lGZLi374vmxQSrgfc8V8Dd9AXG4KXdeOH3XT2AmTFoeOXtnqnPPIyj2vSmQ8t9WoHSnKtRsQV5
 0QczDLZ6p4V/0GqW3rRDX1l4nojIBqSasPFhZgiFo8OCV9zN+f14di7zTYw8wJilWBbPzx80Fc
 wR1j/jQ/l7j1aKpQSBNHBngf
X-SBRS: 5.1
X-MesageID: 60104168
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:HvPiOKOyF+Puxr7vrR0GkMFynXyQoLVcMsEvi/4bfWQNrUoi1mMEy
 GYbX2vQbvbYZ2Cmc95xad6y8k4Hv5TUnNIySgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En5400s9w7RRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYo2SXvtRSx
 cxSjKPqdgl1D4TFp9wjSzANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YsBqit4uM4/AO4QHt2s75TrYEewnUdbIRKCiCdpwgm9p3pwXQ6a2i
 8wxaTlNVwyYPxZ1CE5QM7Zuuva4j37fSmgNwL6SjfVuuDWCpOBr65DvLd7Ud9qiVchT2EGCq
 QruwWP9BR0LMc2F/hCM+Hmsm+znkDvyXcQZE7jQ3vRnmkGJz2ofThgfT0KmoOKRg1S7HdlYL
 iQ85S4GvaU0skuxQbHVTxC+5XKJoBMYc95RCPEhrhGAzLLO5ASUDXRCSSROAPQEnsIrQT0h1
 neSgsjkQzdotdW9UmmB/72ZqTezPyk9LmIYYyIACwwf7LHeTJob10yVCIw5Sejs04OzSWqYL
 y22QDYW1qsyie0GzrqCwgr4jW6dj5H2djAtz1CCNo661T9RaImgbo2uzFHU6/dcMYqUJmW8U
 Gg4d9u2t75XU8zU/MCZaKBURezyua7ZWNHJqQc3R8FJyti7x5K0kWm8ChlaLVwhDMsLcCSBj
 KT76VIIv8870JdHgMZKj2ON5yYCkfiI+TfNDKm8gj9yjn5ZLlXvEMZGPxH44owVuBJw+ZzTw
 L/CGSpWMV4UCL580B29TPoH3Lkgy0gWnD2IFM2qlEv3jODGPxZ5rIvp1nPUNIjVC4ve/23oH
 yt3bZPWm32zrsWgCsUozWLjBQ9TdiVqbXwHg8dWavSCMmJb9JIJUJfsLUcaU9U9xcx9z76Ql
 lnkAxMw4Aev1BXvdFTRAlg+OeyHYHqKhS9iVcDaFQ3zgCZLjEfGxPp3SqbbipF7rrE+lqAtE
 KFeEyhCa9wWIgn6F/0mRcGVhORfmN6D3Gpi5gKpP2oyeYBOXQvM9oO2dwfj7nBWXCG2qdE/s
 /ur0QaCGcgPQAFrDcD3bvOzzgzu4ShBybwqB0aYcMNOfEjM8ZRxL3CjhPEAPMxRew7IwSGX1
 ljKDE5A9/XNuYI87PLAmbuA89WyC+J7E0cDRzvb4L+6ODP05G2mxYMcAu+EcSqEDDH/+bm4Z
 PUTxPb5aaVVkFFPuot6MrBq0aNhuIe/++4EllxpRSyZYU6qB7VsJmi98fNO7qAdlKVEvQaWW
 16U/oUIM7u+J864QkUaIxAob7rf2KhMyCXS9/k8PG7z+DRzoOicSUxXMhSB1H5dIb9yPN93y
 OstopdLuQm2ix5sOdealCFEsW+LKyVYAakgs5gbBq7tixYqlQ4eMcCNVHeu7cHdcchIP2krP
 iSQ1fjLiLlrz0bfd2Y+SCrW1u1HiJVS4B1HwTfu/bhSdgYpUhPv4CBszA==
IronPort-HdrOrdr: A9a23:9+iBW64RUYRvDIzaOQPXwMTXdLJyesId70hD6qhwISY6TiX+rb
 HIoB17726RtN9/YhEdcLy7VJVoIkmskKKdg7NhXotKNTOO0ADDQb2KhbGSpQEIcBeeygcy78
 hdmtBFeb/NMWQ=
X-IronPort-AV: E=Sophos;i="5.88,211,1635220800"; 
   d="scan'208";a="60104168"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>
Subject: [PATCH] xen/build: Fix `make cscope` rune
Date: Thu, 16 Dec 2021 09:20:14 +0000
Message-ID: <20211216092014.707-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

There are two problems, both in the all_sources definition.

First, everything in arch/*/include gets double hits with cscope queries,
because they end up getting listed twice in cscope.files.

Drop the first `find` rune of the three, because it's redundant with the third
rune following c/s 725381a5eab3 ("xen: move include/asm-* to
arch/*/include/asm").

Second, and this way for a long time:

  $ make cscope
  ( find arch/x86/include -name '*.h' -print; find include -name '*.h' -print;
  find xsm arch/x86 common drivers lib test -name '*.[chS]' -print ) >
  cscope.files
  cscope -k -b -q
  cscope: cannot find file arch/x86/efi/efi.h
  cscope: cannot find file arch/x86/efi/ebmalloc.c
  cscope: cannot find file arch/x86/efi/compat.c
  cscope: cannot find file arch/x86/efi/pe.c
  cscope: cannot find file arch/x86/efi/boot.c
  cscope: cannot find file arch/x86/efi/runtime.c

This is caused by these being symlinks to common/efi.  Restrict all find runes
to `-type f` to skip symlinks, because common/efi/*.c are already listed.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>

Anthony: I looked through the remainder of your build series and I cant spot
any edits to all_sources.  Apologies if I missed it.
---
 xen/Makefile | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index 2ad7da7ad67b..dc6bdc44c7a2 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -468,9 +468,8 @@ arch/$(TARGET_ARCH)/include/asm/asm-offsets.h: asm-offsets.s
 
 SUBDIRS = xsm arch/$(TARGET_ARCH) common drivers lib test
 define all_sources
-    ( find arch/$(TARGET_ARCH)/include -name '*.h' -print; \
-      find include -name '*.h' -print; \
-      find $(SUBDIRS) -name '*.[chS]' -print )
+    ( find include -type f -name '*.h' -print; \
+      find $(SUBDIRS) -type f -name '*.[chS]' -print )
 endef
 
 define set_exuberant_flags
-- 
2.11.0


