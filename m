Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3339D7F5139
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 21:08:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639136.996100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5tVY-0004LC-0B; Wed, 22 Nov 2023 20:07:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639136.996100; Wed, 22 Nov 2023 20:07:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5tVX-0004J6-Sv; Wed, 22 Nov 2023 20:07:35 +0000
Received: by outflank-mailman (input) for mailman id 639136;
 Wed, 22 Nov 2023 20:07:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dm5i=HD=citrix.com=prvs=683e23acf=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1r5tVW-0004J0-3t
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 20:07:34 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2b0c3b6-8972-11ee-98e1-6d05b1d4d9a1;
 Wed, 22 Nov 2023 21:07:30 +0100 (CET)
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
X-Inumbo-ID: c2b0c3b6-8972-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1700683650;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ajR47PI9+A7vbmq9LHaRu4S2BE2fqTbEVy8/SGUdSYM=;
  b=HbvF8fxg7S+RjNBSiQohAOJT83z39LF+IARHhXUZf+xh8GuPtaxuQJY3
   suKb2KpdGtWaNVaewCMPZGX18ZbWIcN4zGLlG53S+u1uKctI/OWc00ze/
   JF87LqTBtIfOV7E1JbaRO0CK0B3wujqzFavgElFFdK3HazhB8cV1P4HB+
   U=;
X-CSE-ConnectionGUID: HLBBH2xvSKCGcElpimFhrQ==
X-CSE-MsgGUID: 0Bgk/KD4SdWfjkk8NF8BsQ==
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 128275789
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:+MhQaayMRycxq8aMCbV6t+eKxyrEfRIJ4+MujC+fZmUNrF6WrkVVy
 WoYCjqFPvzbZzH9Kd91adiy8EtQ7MKDyoM3GgRvriAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjPzOHvykTrecZkidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8E8HUMja4mtC5QVnP6oT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KUFq3
 9Y4ciATVTOoqOmbxKq6T8dsnP12eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyPVKfO3WjOX9OYH46tM6uimPybHtzr1WNqLBsy2PS0BZwwP7mN9+9ltmiHJ8FxBnF+
 TKXl4j/KkkwO9/Y6hbZyX6TiO3MnnPddtI4D4Tto5aGh3XMnzdOWXX6T2CTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jYDX/JAHut87xuCopc4+C7AWDJCFGQYLoV75YlpHVTGy
 2NlgfvJIRZFkOeFV0m+3ZifgDeqOC07LXU7MHpsoRQ+3zXznG0ipkuQFo49Tv7k0YadJN3m/
 9ydQMEDa1QvYS0jjfzTEajv2W7Em3QwZlddCv/rdmyk9BhlQ4Wuepal71PWhd4Zc97BEAbe7
 ClfxJbBhAzrMX1rvHbWKAnqNOj5j8tpzRWG2QI/d3Xf32jFF4GfkXB4v2gleRYB3jcscj71e
 k7D0T69F7cKVEZGmZRfOtrrY+xzlPiIKDgQfqyMBja4SsQrJVDvEeAHTRL44l0BZ2B9wPhvY
 sjDIJbE4LRzIf0P8Qdajtw1idcDrh3SD0uILXwn53xLCYajWUM=
IronPort-HdrOrdr: A9a23:n6UdOKrMO/QG+UKsSx6eOREaV5oTeYIsimQD101hICG8cqSj+f
 xG+85rsyMc6QxhIE3I9urhBEDtex/hHNtOkOws1NSZLW7bUQmTXeJfBOLZqlWKcUDDH6xmpM
 NdmsBFeaTN5DNB7PoSjjPWLz9Z+qjkzJyV
X-Talos-CUID: 9a23:96DyUW3yAUonsKPLqbQRubxfOuQPWF2H3GnrAGSXAkttULyQZ1+KwfYx
X-Talos-MUID: 9a23:DAqkegt9yqEmzaF0BM2n3BttN4BLz/iVBH8Dk5YF6++qZQZrAmLI
X-IronPort-AV: E=Sophos;i="6.04,219,1695700800"; 
   d="scan'208";a="128275789"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>, Alejandro Vallejo
	<alejandro.vallejo@cloud.com>
Subject: [PATCH v2.5/6] tools/pygrub: Fix expression before it's copied elsewhere
Date: Wed, 22 Nov 2023 20:07:02 +0000
Message-ID: <20231122200702.1874420-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231106150508.22665-3-alejandro.vallejo@cloud.com>
References: <20231106150508.22665-3-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This has an identical meaning, and is the more pythonic way of writing it.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 tools/pygrub/src/pygrub | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/pygrub/src/pygrub b/tools/pygrub/src/pygrub
index 327cf51774fc..2c06684d6532 100755
--- a/tools/pygrub/src/pygrub
+++ b/tools/pygrub/src/pygrub
@@ -88,7 +88,7 @@ def downgrade_rlimits():
     # filesystem we set RLIMIT_FSIZE to a high bound, so that the file
     # write permissions are bound.
     fsize = LIMIT_FSIZE
-    if "PYGRUB_MAX_FILE_SIZE_MB" in os.environ.keys():
+    if "PYGRUB_MAX_FILE_SIZE_MB" in os.environ:
         fsize = int(os.environ["PYGRUB_MAX_FILE_SIZE_MB"]) << 20
 
     resource.setrlimit(resource.RLIMIT_FSIZE, (fsize, fsize))
-- 
2.30.2


