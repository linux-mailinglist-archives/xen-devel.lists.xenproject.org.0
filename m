Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D37650DB8
	for <lists+xen-devel@lfdr.de>; Mon, 19 Dec 2022 15:46:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466151.725012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7HOt-0006zn-11; Mon, 19 Dec 2022 14:45:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466151.725012; Mon, 19 Dec 2022 14:45:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7HOs-0006xx-Sv; Mon, 19 Dec 2022 14:45:54 +0000
Received: by outflank-mailman (input) for mailman id 466151;
 Mon, 19 Dec 2022 14:45:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EUwz=4R=citrix.com=prvs=345b0463a=sergey.dyasli@srs-se1.protection.inumbo.net>)
 id 1p7HOq-0006ib-R0
 for xen-devel@lists.xenproject.org; Mon, 19 Dec 2022 14:45:52 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5766f8f-7fab-11ed-8fd4-01056ac49cbb;
 Mon, 19 Dec 2022 15:45:51 +0100 (CET)
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
X-Inumbo-ID: d5766f8f-7fab-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1671461151;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=tY/MEDglgrazRqF99q4UwNqEkL3kZa1LwaEItI2pDeg=;
  b=dGg9Cst2G05SwZjr7+SNx/2bo+Knlg0kLLESSQItL0NHYSLiim35qhV3
   hsUXXhxzYjjkpZMt6xKgVpQLB8RsYB60XDSlbPh8srBkoT7CgPQt2iRnA
   2j4DgTBi5d8QqN/1Ksl1Ys4ph9AzqaWGvM3upO0hgavHJ/Eezgsyts+u9
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 88063312
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:lVx05KM/9LAI38LvrR2Sl8FynXyQoLVcMsEvi/4bfWQNrUp0hjAPy
 WVMUWzUM/bfZGCne4onPIi3pkgAuZfVm9FqTgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvzrRC9H5qyo4mpC5w1mPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0u1+OXMe6
 qdIERFOVRPZpNro3p+7Q/Y506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w/N3wsYDUWUrsTIIkzhuillz/zYjRDrFO9rqsr+WnDigd21dABNfKFKoTUHp4MxC50o
 Erh1nvmWzo7LeWw0DqM4FGrq7+XnS3SDdd6+LqQqacx3Qz7KnYoIB8LUVq2p9Gph0j4XMhQQ
 2QP4TYnp6U28E2tT/H+Uge+rXrCuQQTM/JPF8Uq5QfLzbDbiy6JC25BQjNfZdgOsM4tWSdsx
 lKPh8nuBzFkrPuSU3313rWeoC62OCMVBXQffiJCRgwAi+QPu6lq0EiJFIw6Vvfo0JulQlkc3
 gxmsgA1jo0B3dFQh5yavmvE2RGU+IbkTgcqs1C/sn2e0it1Y4usZoqN4Ffd7OpdIIvxcmRtr
 EToiODFsrlQUMjleDilBbxUQer3v6rt3Cj02wYHInU3y9i6F5dPl6h06So2GkpmO91sldTBM
 B6K4lM5CHO+0RKXgU5Lj2CZUZ9CIUvIT46NuhXogj1mPPBMmPevpn0GWKJp9zmFfLIQua8+I
 4yHVs2nEGwXD69qpBLvGbhEiu97nX5glTKCLXwe8/hA+ePCDEN5tJ9faAfeBgzHxPjsTPrpH
 yZ3aJLRlkQ3vBzWaSjL648DRW03wYwALcmu8aR/L7fTSjeK7Ul9U5c9N5t9Id0690mU/8+Ul
 kyAtrhwkwGu2CKZdVjXMhiOqtrHBP5CkJ7yBgR0VX7A5pTpSd3HAHs3H3fvQYQayQ==
IronPort-HdrOrdr: A9a23:IZa4062dfX7Md9esiEJ2OwqjBI0kLtp133Aq2lEZdPWaSL3gqy
 nOpoVi6faQslwssR4b6LW90cW7MBHhHNtOkOos1NSZPTUO2lHYSL2KhLGKq1bd8m/FltK1vp
 0QFJSWZueAa2SSTvyX3OB7KbsdKRW8n5xATN2x80tQ
X-IronPort-AV: E=Sophos;i="5.96,255,1665460800"; 
   d="scan'208";a="88063312"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Sergey Dyasli
	<sergey.dyasli@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 1/3] xen/multiboot: add proper struct definitions to typedefs
Date: Mon, 19 Dec 2022 14:45:31 +0000
Message-ID: <20221219144533.19836-2-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221219144533.19836-1-sergey.dyasli@citrix.com>
References: <20221219144533.19836-1-sergey.dyasli@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

This allows to use them for forward declaration in other headers.

Signed-off-by: Sergey Dyasli <sergey.dyasli@citrix.com>

---
CC: George Dunlap <george.dunlap@citrix.com>
CC: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>

v1 --> v2:
- New patch
---
 xen/include/xen/multiboot.h | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/xen/include/xen/multiboot.h b/xen/include/xen/multiboot.h
index d1b43e1183..a541bdf8a8 100644
--- a/xen/include/xen/multiboot.h
+++ b/xen/include/xen/multiboot.h
@@ -46,23 +46,25 @@
 #ifndef __ASSEMBLY__
 
 /* The symbol table for a.out.  */
-typedef struct {
+struct aout_symbol_table {
     u32 tabsize;
     u32 strsize;
     u32 addr;
     u32 reserved;
-} aout_symbol_table_t;
+};
+typedef struct aout_symbol_table aout_symbol_table_t;
 
 /* The section header table for ELF.  */
-typedef struct {
+struct elf_section_header_table{
     u32 num;
     u32 size;
     u32 addr;
     u32 shndx;
-} elf_section_header_table_t;
+};
+typedef struct elf_section_header_table elf_section_header_table_t;
 
 /* The Multiboot information.  */
-typedef struct {
+struct multiboot_info {
     u32 flags;
 
     /* Valid if flags sets MBI_MEMLIMITS */
@@ -101,26 +103,29 @@ typedef struct {
 
     /* Valid if flags sets MBI_APM */
     u32 apm_table;
-} multiboot_info_t;
+};
+typedef struct multiboot_info multiboot_info_t;
 
 /* The module structure.  */
-typedef struct {
+struct module {
     u32 mod_start;
     u32 mod_end;
     u32 string;
     u32 reserved;
-} module_t;
+};
+typedef struct module module_t;
 
 /* The memory map. Be careful that the offset 0 is base_addr_low
    but no size.  */
-typedef struct {
+struct memory_map {
     u32 size;
     u32 base_addr_low;
     u32 base_addr_high;
     u32 length_low;
     u32 length_high;
     u32 type;
-} memory_map_t;
+};
+typedef struct memory_map memory_map_t;
 
 
 #endif /* __ASSEMBLY__ */
-- 
2.17.1


