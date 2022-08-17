Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9032A5972D1
	for <lists+xen-devel@lfdr.de>; Wed, 17 Aug 2022 17:21:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389053.625862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOKr8-0008LF-NT; Wed, 17 Aug 2022 15:21:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389053.625862; Wed, 17 Aug 2022 15:21:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOKr8-0008JD-Kl; Wed, 17 Aug 2022 15:21:18 +0000
Received: by outflank-mailman (input) for mailman id 389053;
 Wed, 17 Aug 2022 15:21:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2RHf=YV=citrix.com=prvs=221cc9648=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oOKr6-0008J5-Vr
 for xen-devel@lists.xenproject.org; Wed, 17 Aug 2022 15:21:17 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b241ba9-1e40-11ed-9250-1f966e50362f;
 Wed, 17 Aug 2022 17:21:15 +0200 (CEST)
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
X-Inumbo-ID: 3b241ba9-1e40-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660749675;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BVWAzeMfNadVbIGHsGpwb/svB97wQxpATDMDMIQRCQU=;
  b=CEnQAgJNiyhmR1457IKOrPLy92hwQOSep0UYnw+Z+PsikR2gWcwg2tav
   2MSzvhqZjO8Lu+53auu0dcBjD6P5zobxBd9xiEAzfD7c8oHxivT9Th/UQ
   zogdQDz+BBQ5OxMKzXfJKu7LGX4ttckDuhWCjNoGCbVvUAqkOj+fRuVc+
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 78744132
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:rd547K6SCU1sS80ZRrSuEwxRtC/HchMFZxGqfqrLsTDasY5as4F+v
 mEXUWDVbq7YZzf2fIpwPIrlpExQuZeDndBhGwc/rnxhHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yM6jclkf5KkYMbcICd9WAR4fykojBNnioYRj5VhxNO0GGthg
 /uryyHkEALjimUc3l48sfrZ8ks/5auq4Vv0g3RlDRx1lA6G/5UqJMp3yZGZdxPQXoRSF+imc
 OfPpJnRErTxpkpF5nuNy94XQ2VSKlLgFVHmZkl+AsBOtiNqtC0qupvXAdJHAathZ5dlqPgqo
 DlFncTYpQ7EpcQgksxFO/VTO3kW0aGrZNYriJVw2CCe5xSuTpfi/xlhJEAsbIgW1OpLPWJpy
 sMRDyIDa1elutvjldpXSsE07igiBMziPYdZsXB81zDJS/0hRPgvQY2Tu4Uehm1pwJkTQ7COP
 KL1ahI2BPjESxRJJlcQDoN4hOqyj2PzWzZZtEiUtew85G27IAlZj+iybIaMIYbiqcN9kWe3h
 WSdoDnDKyoYEfvO8iaIw1ORmbqa9c/8cN1LT+DpnhJwu3WI3XAaAhASUVq9oNG6h1S4VtYZL
 FYbkgIxqYAi+UrtScPyNzW6vXqFsxg0S9dWVeog52ml2qfSpgqUGGUAZjpAc8A98t87QyQw0
 V2ElM+vAiZg2JWXQ3+A8rafrRupJDMYa2QFYEc5oRAtuoe55ttp11SWE4glQPXdYsDJ9S/Yw
 irbqSYQi4kvjuk06Kyc717CxBSRn82cJuIq3Tk7Tl5J/ysgOtD9OdfytQmGhRpTBN3HFwfc5
 RDoj+DbtblTVs/VyURhVc1XRNmUC+C53CowaLKFN70o7HyT9nGqZui8CxkudR4yYq7oldIEC
 XI/WD+9B7cJZRNGlYctP+qM5z0ClMAM7+jNWPHOdcZpaZNsbgKB9ywGTRfOgTizzxR9wP1mY
 svznSOQ4ZEyWMxaIMeeHb9BgdfHOAhkrY8seXwL50v+iufPDJJkYbwELEGPfogE0U9wmy2Mq
 o43H5bblH1ivBjWOHa/HXg7cQ9XdhDWxPne96RqSwJ0ClQ/RT5+U6GOn9vMueVNxsxoqwsBx
 VnlMmcw9bY1rSSvxdmiApy7VI7SYA==
IronPort-HdrOrdr: A9a23:D6/a16nGHxjIWkm/WilUtuv6PbbpDfJD3DAbv31ZSRFFG/Fw9v
 rPoB1173XJYVoqNU3I+urgBEDjexzhHPdOiOF7AV7IZmfbUQWTQL1f0Q==
X-IronPort-AV: E=Sophos;i="5.93,243,1654574400"; 
   d="scan'208";a="78744132"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH] build: Fix missing MAKEFLAGS --no-print-directory
Date: Wed, 17 Aug 2022 16:21:06 +0100
Message-ID: <20220817152106.56601-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

While we already have "--no-print-directory" added to the make flags
in some cases, there's one case where the flags is missing, when doing
an out-of-tree build with O=, e.g.
    cd xen; make O=build

Without it, we just have loads of "Entering directory" and "Leaving
directory" with the same directory.

The comment and location in the Makefile are copied from Linux.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/xen/Makefile b/xen/Makefile
index 69b4dc960f..106aff6a07 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -186,6 +186,11 @@ endif # root-make-done
 # We process the rest of the Makefile if this is the final invocation of make
 ifeq ($(need-sub-make),)
 
+# Do not print "Entering directory ...",
+# but we want to display it when entering to the output directory
+# so that IDEs/editors are able to understand relative filenames.
+MAKEFLAGS += --no-print-directory
+
 ifeq ($(abs_srctree),$(abs_objtree))
     # building in the source tree
     srctree := .
-- 
Anthony PERARD


