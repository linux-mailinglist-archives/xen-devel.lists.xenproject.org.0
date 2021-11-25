Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B8B45DB80
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 14:47:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231261.400147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF5q-0000ws-1M; Thu, 25 Nov 2021 13:47:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231261.400147; Thu, 25 Nov 2021 13:47:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF5p-0000uK-Qc; Thu, 25 Nov 2021 13:47:17 +0000
Received: by outflank-mailman (input) for mailman id 231261;
 Thu, 25 Nov 2021 13:47:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nd7+=QM=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mqF0a-00076i-Qx
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 13:41:52 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71cf687e-4df5-11ec-a9d2-d9f7a1cc8784;
 Thu, 25 Nov 2021 14:41:51 +0100 (CET)
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
X-Inumbo-ID: 71cf687e-4df5-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637847711;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CWsp0MdhX8GJ4/siL8IM7kIar9Uw1eonEXIe+1nIRyU=;
  b=ht23CctioGJ7ppfpPRbknDiAVvt7ag2FNhmc75XxdJ04FNiDzAQWP1Lu
   T2QENAuuMNpP5m4eIT5++XnCXSnp1VVKkVH+zTLfKMED6dkUYdL3BdhWi
   Q7UEdHApjNwP5fEnhBBv4mAQgMScWcW+NziOOW4WCo6BwEfJcgL41/Q3w
   M=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: k86/nwiWaQBbq9FQommKA4r3+yJbRPRDPopy1ke3GJfAVKukIirtNoXT9N3PzdTZLr/PzPySRA
 PWhzTok7FnVKLDJS/khqINrtpcUacz3DLDtnBmHGuM5JJBUC4VgU+PqrDQNJ+MnFLTT0iBhGMx
 +oIRbQSgzArtPtobuOllAs27BysTRkdbyDocTMiMPT2F3XpCYE7tELQOv4iBu2ctFmn3hJqR4N
 Jl/bcOpQoddsY4sfRPD7SNHZnHEEFxviE2c6jQ/L3A9i89hGLILTsfP/n26hDzFRJ/vVwoM+C/
 GANas4ZRAZLiEJ6etKX6h0UT
X-SBRS: 5.1
X-MesageID: 58617700
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:hqhjF6NZLv2nxJLvrR1qkMFynXyQoLVcMsEvi/4bfWQNrUp23jAEy
 zYXWT+GMv6ONjD3KYwlYNi//UwFsJOByoBjGgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6bUsxNbVU8En540Eg+w7RRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYoyfRjt9S1
 spkiYChcQU7PoDNwP4MChYNRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YuBqmsQkKtitJI4Fs2ts5TrYEewnUdbIRKCiCdpwgWdu358RRa62i
 8wxQgI+VDHGezB1a3wQLJlnmOCTmHPdfGgNwL6SjfVuuDWCpOBr65DmOcDZfdGiTsxPkkGV4
 GnB+gzRCxcGNNuZ2Hyd/2ilnOPnkibyWYZUH7q9ntZ6jVvWymENBRk+UVqgveL/mkO4Q8hYK
 UEf5mwpt6dayaCwZoCjBVvi+ifC50NCHYoLewEn1O2T4riM8gm6GHctciJQUN40tOI3HSY7j
 1DcyrsFGgdTmLGSTHuc8JKdojWzJTUZIAc+WMMUcecWy4K9+d9u13ojWv4mSffo1YOtRVkc1
 hjT9HBm74j/m/LnwElSEbrvpzu37qbEQQcujuk8djL0t1gpDGJJimHB1LQ60RqiBNrGJrVil
 CJd8yR70AzpJcvQ/BFhuM1XQNmUCw+taVUwe2JHEZg77CiK8HW+Z41W6zwWDB43aZlbJm65M
 B6J51I5CHpv0JyCN/EfXm5MI55ykfiI+SrNCpg4keaikrAuLVTarUmClGab3nz3kVhErE3ME
 czzTCpYNl5DUf4P5GPvH481iOZ3rghjlTK7bc2qlHyPjOvBDEN5vJ9YaTNimMhit/jayOgUm
 v4CX/a3J+J3DLejP3KJqNFLdjjn7xETXPjLliCeTcbbSiIOJY3rI6a5LWoJd9M3kqJLuP3P+
 33hCEZUxECm3S/MKBmQa2AlY7TqBM4toXU+NC0qHFCpx3l8Ptr/sPZBL8M6Les96ehu7f9oV
 P1ZKc+ONetCF2bc8DMHYJij8IE7LEa3hRiDNjaOaSQke8IyXBTA/9LpJ1O99CQHAietm9E5p
 rmsilHSTZYZHlwwB8fKcvO/iVi2uCFFyu51WkLJJPhVeVntr9c2e3Cg0KdvLphVexvZxzac2
 wKHOjsipLHA890v7d3EpaGYtIP1QeFwKVVXQjvA5rGsOCiEomf6md1cUPyFdCz2XX/v/Pnwf
 v1cyvzxPaFVnFtOtIYgQb9nwbhnuonqrr5eiA9lAG/KfxKgDbY5eiuK2sxGt6tswL5FuFTpB
 hLTq4cCYbjZatn4FFMxJRY+arXR3P4ZrTDe8PApLRio/yRw5reGDR1fMhTkZPax91ep3FfJG
 dschfM=
IronPort-HdrOrdr: A9a23:Qr39da/9jgfndjQAPltuk+DgI+orL9Y04lQ7vn2YSXRuHPBw8P
 re+sjztCWE8Ar5N0tBpTntAsW9qDbnhPtICOoqTNCftWvdyQiVxehZhOOIqVDd8m/Fh4pgPM
 9bAtFD4bbLbGSS4/yU3ODBKadD/OW6
X-IronPort-AV: E=Sophos;i="5.87,263,1631592000"; 
   d="scan'208";a="58617700"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Anthony PERARD
	<anthony.perard@gmail.com>, Doug Goldstein <cardoe@cardoe.com>
Subject: [XEN PATCH v8 36/47] RFC, no-VPATH: Kconfig: only ready auto.conf from objtree
Date: Thu, 25 Nov 2021 13:39:55 +0000
Message-ID: <20211125134006.1076646-37-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125134006.1076646-1-anthony.perard@citrix.com>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Anthony PERARD <anthony.perard@gmail.com>

zconf_fopen() will open file in $srctree if the file isn't in
$objtree. This is an issue for "auto.conf" as it could be in the
source tree if it is dirty. With "auto.conf" read from the source
tree, kconfig will not properly set the file associated with a
CONFIG_* properly in "include/config/" and instead only touch the
files that correspond to new CONFIG_* option that were not set in the
"auto.conf" found in the source tree.

That might not be an issue, but it is probably better to have a
populated "include/config/" directory in sync with
"include/config/auto.conf".

The second that read from conf_get_configname() would read ".config"
from the source directory which is also not wanted in Xen.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/tools/kconfig/confdata.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/xen/tools/kconfig/confdata.c b/xen/tools/kconfig/confdata.c
index 4f9139d055be..805d4c3e5636 100644
--- a/xen/tools/kconfig/confdata.c
+++ b/xen/tools/kconfig/confdata.c
@@ -357,12 +357,17 @@ int conf_read_simple(const char *name, int def)
 	int i, def_flags;
 
 	if (name) {
-		in = zconf_fopen(name);
+		if (def == S_DEF_AUTO) {
+			/* only open include/config/auto.conf in objtree */
+			in = fopen(name, "r");
+		} else {
+			in = zconf_fopen(name);
+		}
 	} else {
 		struct property *prop;
 
 		name = conf_get_configname();
-		in = zconf_fopen(name);
+		in = fopen(name, "r");
 		if (in)
 			goto load;
 		sym_add_change_count(1);
-- 
Anthony PERARD


