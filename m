Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38637521B3A
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 16:05:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325689.548363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noQUf-0007br-N4; Tue, 10 May 2022 14:05:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325689.548363; Tue, 10 May 2022 14:05:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noQUf-0007ZQ-JG; Tue, 10 May 2022 14:05:41 +0000
Received: by outflank-mailman (input) for mailman id 325689;
 Tue, 10 May 2022 14:05:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ETdG=VS=citrix.com=prvs=12211c048=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1noQUe-0007ZI-Fg
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 14:05:40 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4422a734-d06a-11ec-a406-831a346695d4;
 Tue, 10 May 2022 16:05:38 +0200 (CEST)
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
X-Inumbo-ID: 4422a734-d06a-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652191538;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ShYoC//Fj+0SVz6SvliLV+WMXZfPQSkzrta4M19aexI=;
  b=C9EFJjcDwLaefy9tK+LH334n2WmbaLJEMbe8f8qbRv2lHOSlCWi84Z8O
   1eUbHpFC2mNfaW/RZukvd0YOaDNLcxuPzQfcwoi2YkSSUKLsXDh0U07gO
   W/imgJWQ0LKNeCUZz0jWiywMFa9zpf/RU1RkkOF47TuxAJ0emBMkXKjHl
   Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 70975971
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:cTvzF6vosbgmWV9nmz51NfgiaefnVEVeMUV32f8akzHdYApBsoF/q
 tZmKWGFPPaJY2Pyed91b9zlpkIA7Z/cmNdhTQdo/CE2HytG+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQywobVvqYy2YLjW17U4
 YuoyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8mbrf+w+hDAyJfLCN/B49vxaLicV6g5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvllpyy3ZCvA3B4jOWazQ6fdT3Ssqh9AIFvHbD
 yYcQWU3PUudMkIWUrsRINFlvO6X3H3+SmxRpmCvgrU732KM7CUkhdABN/KKI4fXFK25hH2wv
 Xna9m70BhUbMt23yjef9H+owOjVkkvTR4Y6BLC+sPlwjzW7xHEXCRAQfUu2p7++kEHWc8JSL
 QkY9zQjqYA29Ve3VZ/tUhugunmGsxUAHd1KHIUS6guA167V6AaxHXUfQ3hKb9lOiSMtbWV0j
 BnTxYqvXGEx9u3OIZ6AyluKhTziIxpOITFSXig7Two/wfDevaRjqA2aG76PD5WJptHyHDjxx
 RWDoy4/m6gfgKY36kmrwbzUq2ny/8aUF2bZ8i2SBzv4tV0hOOZJcqTysTDmAeB8wJF1p7Vrl
 FwNgICg4e8HFvlhfwTdEbxWTNlFCxtoWQAwYGKD/bF8rlxBGFb5JOi8BQ2Sw28za645lcfBO
 hO7hO+ozMY70IGWRaF2eZmtLM8h0LLtE9/oPtiNMIcUO8IoK1/XoHkzDaJ144wKuBJ3+ZzTx
 L/BKZr8ZZrkIfoPIMWKqxc1juZwm3FWKZL7TpHn1RW3uYdyl1bOIYrpxGCmN7hjhIvd+V292
 48Ga6OilkQEOMWjM3a/zGLmBQ1TRZTNLcuu+5I/my/qClcOJVzN/NeLn+x7J9w+z/Q9eyWh1
 ijVZ3K0AWHX3RXvQThmoFg6AF8zdf6TdU4GABE=
IronPort-HdrOrdr: A9a23:tHpFIqyHWEpBK2/QKLHFKrPwJr1zdoMgy1knxilNoRw8SKOlfq
 eV7ZEmPH7P+VEssR4b+OxoVJPsfZq+z+8W3WByB9eftWDd0QPCRr2KhbGSpwEIcBeRygcy78
 tdmtBFeb7NMWQ=
X-IronPort-AV: E=Sophos;i="5.91,214,1647316800"; 
   d="scan'208";a="70975971"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH] docs: fix path to code in migration doc
Date: Tue, 10 May 2022 15:05:06 +0100
Message-ID: <20220510140506.64930-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 docs/features/migration.pandoc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/features/migration.pandoc b/docs/features/migration.pandoc
index 719925818e..5334536d48 100644
--- a/docs/features/migration.pandoc
+++ b/docs/features/migration.pandoc
@@ -54,10 +54,10 @@ legacy stream into a migration v2 stream.
     * `docs/specs/libxc-migration-stream.pandoc`
     * `docs/specs/libxl-migration-stream.pandoc`
 * `libxc`
-    * `tools/libxc/xc_sr_*.[hc]`
+    * `tools/libs/guest/xg_sr_*.[hc]`
 * `libxl`
-    * `tools/libxl/libxl_stream_{read,write}.c`
-    * `tools/libxl/libxl_convert_callout.c`
+    * `tools/libs/light/libxl_stream_{read,write}.c`
+    * `tools/libs/light/libxl_convert_callout.c`
 * Scripts
     * `tools/python/xen/migration/*.py`
     * `tools/python/scripts/convert-legacy-stream`
-- 
Anthony PERARD


