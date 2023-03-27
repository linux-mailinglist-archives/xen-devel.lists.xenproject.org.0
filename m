Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5825D6CAF00
	for <lists+xen-devel@lfdr.de>; Mon, 27 Mar 2023 21:42:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515453.798336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgsis-0002lP-VS; Mon, 27 Mar 2023 19:41:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515453.798336; Mon, 27 Mar 2023 19:41:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgsis-0002jI-SM; Mon, 27 Mar 2023 19:41:42 +0000
Received: by outflank-mailman (input) for mailman id 515453;
 Mon, 27 Mar 2023 19:41:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kO+W=7T=citrix.com=prvs=443697bea=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pgsir-0002j7-PD
 for xen-devel@lists.xenproject.org; Mon, 27 Mar 2023 19:41:42 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62f0e800-ccd7-11ed-b464-930f4c7d94ae;
 Mon, 27 Mar 2023 21:41:38 +0200 (CEST)
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
X-Inumbo-ID: 62f0e800-ccd7-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679946098;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qHxoaXcYTvK6LrtavVTEPpXmEC/muoBbiaV4h46YBMA=;
  b=R2aKa0qEOt6uVQ9A1QIMt9c8NaZjDlVvmlonnFgeG25wWVYK044tzGqR
   kyXzdVzkB7M7Swz7IFqcfy4IoJ2uLaJoWuB3TldSLGpmEey0KcmdBwjwq
   AtXn24YKrBBANxg2ZJrZ9IsWjoXScKgCbuwRpk0+YEV3nYnDFAgscashT
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 103008786
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:2TsHU6PFZ10BXH/vrR2ol8FynXyQoLVcMsEvi/4bfWQNrUorhjRWy
 GMcWD2POqmDamvxe9B1PISz9BwH6pLSmNJiQAto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvLrRC9H5qyo42tD5ANmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0vddXUpW6
 8MfFAI2UzyIm/6J+b6JddA506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLoXmuuyi2a5WDpfsF+P/oI84nTJzRw327/oWDbQUoXSHp0NzhnI+
 Aoq+Uz2XjcLDp+k9QOrySz8nM/trSr5RacdQejQGvlC3wTImz175ActfUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxasnDQRRt5RGO0S8xyWx+zf5APxLncAZi5MbpohrsBeeNAx/
 gbXxZWzX2Up6eDLDyvHrd94sA9eJwAEBzMpfTE7Sjc32OTPq50vsSvDfOlaRfvdYsLOJd3g/
 9ybhHFg2ORN05NRjP3TEUPv2Gz1+MWQJuIhzkCOBz/+sFskDGKwT9bwgWU3+8qsO2pworOpm
 HEf0/aT4+kVZX1mvHzcGb5ddF1FChvsDdE9vbKMN8N7n9hV0yT/Fb28Gg1WKkZzKdojcjT0e
 kLVsg45zMYNYyr7MfYnON3rVZxCIU3c+TLNDKi8gj1mPPBMmPKvpnkyNSZ8IUi0+KTTrU3PE
 cjCKpv9ZZrrIa9m0CC3V48g7FPf/QhnnTm7bcmin3yaPU+2OCb9Ya0bK2GHcu1RxPrC+G05B
 f4DbZrVo/ieOcWiChTqHXk7dAlTdiJnXMCn8qS6tIere2JbJY3oMNeJqZtJRmCvt/49ejvgl
 p1lZnJl9Q==
IronPort-HdrOrdr: A9a23:cyh7iqGKBec31Sn8pLqEL8eALOsnbusQ8zAXP0AYc20yTiX4ra
 CTdZEgviMc5wxxZJhNo6HkBEDiewKkyXcW2/hoAV7KZmCP1wWVxelZnPDfKlbbaknDH4BmpM
 BdWpk7JefcSX5dpq/BjDVQFexL/PC3tJqFv6P16VBDbS9XUIlczyFfTjy2LyRNNWp7LKt8G5
 qY6tBGtDa7EE57Uu2wGmMZWezOvP3n/aiWAyI7Ow==
X-IronPort-AV: E=Sophos;i="5.98,295,1673931600"; 
   d="scan'208";a="103008786"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Sergey Dyasli
	<sergey.dyasli@citrix.com>
Subject: [PATCH 1/5] xen/earlycpio: Drop nextoff parameter
Date: Mon, 27 Mar 2023 20:41:22 +0100
Message-ID: <20230327194126.3573997-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230327194126.3573997-1-andrew.cooper3@citrix.com>
References: <20230327194126.3573997-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This is imported from Linux, but the parameter being signed is dubious in the
first place and we're not plausibly going to gain a use for the functionality.
Linux has subsequently made it an optional parameter to avoid forcing callers
to pass a stack variable they don't care about using.

In the unlikely case that we gain a usecase, we can reintroduce it, but in the
meantime simplify the single caller.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Sergey Dyasli <sergey.dyasli@citrix.com>
---
 xen/arch/x86/cpu/microcode/core.c | 3 +--
 xen/common/earlycpio.c            | 8 +-------
 xen/include/xen/earlycpio.h       | 3 +--
 3 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index cfa2d5053a52..11c471cc3f83 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -156,7 +156,6 @@ void __init microcode_scan_module(
     uint64_t *_blob_start;
     unsigned long _blob_size;
     struct cpio_data cd;
-    long offset;
     const char *p = NULL;
     int i;
 
@@ -189,7 +188,7 @@ void __init microcode_scan_module(
         }
         cd.data = NULL;
         cd.size = 0;
-        cd = find_cpio_data(p, _blob_start, _blob_size, &offset /* ignore */);
+        cd = find_cpio_data(p, _blob_start, _blob_size);
         if ( cd.data )
         {
             ucode_blob.size = cd.size;
diff --git a/xen/common/earlycpio.c b/xen/common/earlycpio.c
index 4bcf32a51ceb..6c76307c2541 100644
--- a/xen/common/earlycpio.c
+++ b/xen/common/earlycpio.c
@@ -56,10 +56,6 @@ enum cpio_fields {
  * @path:       The directory to search for, including a slash at the end
  * @data:       Pointer to the the cpio archive or a header inside
  * @len:        Remaining length of the cpio based on data pointer
- * @nextoff:    When a matching file is found, this is the offset from the
- *              beginning of the cpio to the beginning of the next file, not the
- *              matching file itself. It can be used to iterate through the cpio
- *              to find all files inside of a directory path.
  *
  * @return:     struct cpio_data containing the address, length and
  *              filename (with the directory path cut off) of the found file.
@@ -68,8 +64,7 @@ enum cpio_fields {
  *              the match returned an empty filename string.
  */
 
-struct cpio_data __init find_cpio_data(const char *path, void *data,
-				       size_t len,  long *nextoff)
+struct cpio_data __init find_cpio_data(const char *path, void *data, size_t len)
 {
 	const size_t cpio_header_len = 8*C_NFIELDS - 2;
 	struct cpio_data cd = { NULL, 0, "" };
@@ -129,7 +124,6 @@ struct cpio_data __init find_cpio_data(const char *path, void *data,
 		if ((ch[C_MODE] & 0170000) == 0100000 &&
 		    ch[C_NAMESIZE] >= mypathsize &&
 		    !memcmp(p, path, mypathsize)) {
-			*nextoff = (long)nptr - (long)data;
 			if (ch[C_NAMESIZE] - mypathsize >= MAX_CPIO_FILE_NAME) {
 				printk(
 				"File %s exceeding MAX_CPIO_FILE_NAME [%d]\n",
diff --git a/xen/include/xen/earlycpio.h b/xen/include/xen/earlycpio.h
index 16d9404d739e..d4992035982d 100644
--- a/xen/include/xen/earlycpio.h
+++ b/xen/include/xen/earlycpio.h
@@ -9,7 +9,6 @@ struct cpio_data {
 	char name[MAX_CPIO_FILE_NAME];
 };
 
-struct cpio_data find_cpio_data(const char *path, void *data, size_t len,
-				long *offset);
+struct cpio_data find_cpio_data(const char *path, void *data, size_t len);
 
 #endif /* _EARLYCPIO_H */
-- 
2.30.2


