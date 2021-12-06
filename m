Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0161F46A25C
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 18:08:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239510.415336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHTL-0008Ji-G8; Mon, 06 Dec 2021 17:08:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239510.415336; Mon, 06 Dec 2021 17:08:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHTL-0008Bh-5w; Mon, 06 Dec 2021 17:08:15 +0000
Received: by outflank-mailman (input) for mailman id 239510;
 Mon, 06 Dec 2021 17:08:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yl1=QX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muHQ4-0005ta-1N
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 17:04:52 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ea6bac9-56b6-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 18:04:50 +0100 (CET)
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
X-Inumbo-ID: 9ea6bac9-56b6-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638810290;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=H1pWpWC+QbCQo3x/OTxy8zwavbLBTT32ayVn9iwZfeQ=;
  b=avbsSRoktxCkSjZxujgOZN7JBhS//EEnNM2GWvXQjdN6Hfsajc7kGTga
   9zfK35AR5exboGp3F7UclZKROfAkgqzFRrWgWCLJSdIJv05JU+tJ9ov0f
   JTCZz45kUvjbAXnlgJnmAu95Jefi1OvO3eTAGzgQU60TTQGvGifsL8utW
   g=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: r+J7dNGSsVG/yNJLfBDMBjLnynN8OtCkf/pc8yKPV2Ay0uLBPM3fYM/ytpLczoxpqek3QJThef
 bxpGAxzoT1Kx94nkLF7+12ypCWeQBAovU1o6sghBVPcsWoY2R0HzHFL7eUjy2w7PXZ26xsfEUn
 s+2O2CYhhIBi2bfwhLJtguxeoGe9aRIP3LTj2Y4AjjHpg6oK09d4TvXCwa+qNjNO12zRetlvti
 EiicT2q4lJWg1yMtQCQ554P+3e9L1AqaxSxD67ywBcz87Uos0/tUeuAOamWdHUn4kD8lypVnKF
 qnL65K1+m6JLmvJIF0eVSgE8
X-SBRS: 5.1
X-MesageID: 61420896
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:w06y9q9QxQDZ1/Um8g9zDrUDBHmTJUtcMsCJ2f8bNWPcYEJGY0x3y
 WAYXzuHOqyJZ2ukKop0PI60pEhQ7JSBydMwGlBpqHs8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGmeIdA970Ug6wrRh3NYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPggl
 osTlJKXZD1yJ+6UgsANCQNaLgBHaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwqKtXrO4UO/Glt1zjDAd4tQIzZQrWM7thdtNs1rp4XQayGN
 5tHAdZpRA/GQAAROk8FM4ARtv2xrWH4KDdCmmvA8MLb5ECMlVcsgdABKuH9ZdiiVchT2EGCq
 Qru5G38HxwecsCfyDCM73awruLJhmb/SYUUUrqi+ZZCgUKR7nweDgUMUlm2quX/jVSxM/pPJ
 kpR9icwoKwa8E2wUsK7TxC+uGSDvBMXR5xXCeJSwAiL1qrT5RffHmUeRyRNQNMjvc4yAzct0
 ze0c8jBXGI19ufPEDTEq+nS/Wja1TUpwXEqNHFaEyoLxPTZ+5hw1gjrXox5EpOUt4igcd3v+
 AyioC87jrQVqMcE0aSn4FzK6w6RSoj1oh0dvVuOAD/8hu9tTMv8PtHztwCHhRpVBN/BFgHpg
 ZQSpySJAAni57mpnTfFfugCFarBCx2tYGyF2g4H83XMGl2QF5+fkWJ4vWgWyKRBaJ9sldrVj
 Kn741k5CHh7ZiTCUEOPS9jtY/nGNIC5fTgfatjab8BVfr96fxKd8SdlaCa4hj62wBd2wPxlY
 8nEIa5A6Er274w9llJaoM9HjtcWKt0WnzuPFfgXMTz5uVZhWJJlYehcawbfBgzIxKiFvB/U4
 75i2ziikH1ivBnFSnCPq+Y7dAlSRVBiXMyeg5EHJ4arf1s9cEl8WqC5/F/UU9E890ijvryTp
 S/Vt44x4AeXuEAr3i3WMC0+M+22As4kxZ/5VAR1VWuVN7EYSd7HxM8im1EfJtHLLcRvkqx5S
 ecrYcKFDqgdQzjL4W1FP5L8sJZjZFKgggfXZ3ipZz02fphBQQ3V+4C7IluzpXdWVifn59Ejp
 7CA1x/ARcZRTQpVE8uLOumkyEm8vCZBlbsqDVfIONRaZG7l7JNud37qlvYyLsxVcUfDyzKW2
 hy4GxAdoeWR8YY5/MOQ3fKPrpuzEvs4FU1fRjGJ4bGzPCjc32yi3Y4fD7rYIWGDDDv5ofzwa
 /9UwvfwNOw8sGxL64csQax2ya8e5sf0o+MIxApTA3iWPU+gDaltIyfa0JAX5LFN3LJQpSC/R
 lmLpotBIbyMNc7oTAwRKQ4iYrjR3P0YgGCPv/E8IUG87y5r5ruXF05VOkDU2iBaKbJ0NqIjw
 Psg55FKu1Du1EJyP4bUlD1Q+kSNMmcEAvcuuZwtCYP2jhYmlwNZapvGBy6quJyCZr2g6KXxz
 uN4UEYau4lh+w==
IronPort-HdrOrdr: A9a23:ILF63arvXBiiqAt6UhSp/a0aV5oheYIsimQD101hICG8cqSj+P
 xG+85rsCMc6QxhP03I9urgBEDtex7hHP1OkOss1NWZPDUO0VHAROoJ0WKL+UyFJ8SUzIBgPM
 lbH5SWcOeAbmRHsQ==
X-IronPort-AV: E=Sophos;i="5.87,292,1631592000"; 
   d="scan'208";a="61420896"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@gmail.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [XEN PATCH 57/57] stubdom: xenlibs linkfarm, ignore non-regular files
Date: Mon, 6 Dec 2021 17:02:40 +0000
Message-ID: <20211206170241.13165-58-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211206170241.13165-1-anthony.perard@citrix.com>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

When we will convert tools/ build system, their will be a need to
replace some use of "vpath". This will done making symbolic links.
Those symlinks are not wanted by stubdom build system when making a
linkfarm for the Xen libraries. To avoid them, we will use `find`
instead of plain shell globbing.

For example, there will be a link to "xen/lib/x86/cpuid.o" in
"tools/libs/guest/".

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 stubdom/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/stubdom/Makefile b/stubdom/Makefile
index 1fa075b9ad..b312f710cd 100644
--- a/stubdom/Makefile
+++ b/stubdom/Makefile
@@ -345,7 +345,7 @@ define do_links
   mkdir -p $(dir $@)include
   cd $(dir $@); \
   ln -sf $(dir $<)include/*.h include/; \
-  ln -sf $(dir $<)*.[ch] .; \
+  find $(dir $<) -maxdepth 1 -type f -name '*.[ch]' -exec ln -sf {} . \; ; \
   ln -sf $(dir $<)Makefile.common .
   touch $@
 endef
-- 
Anthony PERARD


