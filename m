Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3526831C1
	for <lists+xen-devel@lfdr.de>; Tue, 31 Jan 2023 16:43:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487720.755395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMsmX-00011w-OM; Tue, 31 Jan 2023 15:42:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487720.755395; Tue, 31 Jan 2023 15:42:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMsmX-0000yt-LD; Tue, 31 Jan 2023 15:42:49 +0000
Received: by outflank-mailman (input) for mailman id 487720;
 Tue, 31 Jan 2023 15:42:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+3C0=54=citrix.com=prvs=388cd47ec=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pMsmW-0000yn-6F
 for xen-devel@lists.xenproject.org; Tue, 31 Jan 2023 15:42:48 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e6d862ff-a17d-11ed-b63b-5f92e7d2e73a;
 Tue, 31 Jan 2023 16:42:45 +0100 (CET)
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
X-Inumbo-ID: e6d862ff-a17d-11ed-b63b-5f92e7d2e73a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1675179765;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cFIPxvZZ0rwSP//GS3Rv8v2zkq9ONDq0Ii/XMdlr8oM=;
  b=YqxNn5US6hfiamVW04Wm8q0eCp2D+DLgZH6TgGzmmnIK80yAvXgXyoLs
   JvSwZ4jHrI8HHKpICErT/DOPPIdcPm7CrGtFYq6p8ndcZW6PH95H1xjH/
   MRODm7dfeZLQ2bIxx1dC7St/6PfFgz3bDkOwK94b5hON40lpKO2xjjkr9
   A=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 94969644
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:D68YQq2d23ghMUNkqPbD5exxkn2cJEfYwER7XKvMYLTBsI5bpzcHy
 jQfCG/Vaf7eM2v2f9t/Ooqz9B5Tu5LWx9VjHQtspC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK5ULSfUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS93uDgNyo4GlD5gVlPKgR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfPU9O7
 PIgIi40VwGk3O6Vh734R7lBiZF2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKk2aOHWjOX9OYH46tO6umnn4dSwesF+PrLA7y2PS0BZwwP7mN9+9ltmiFJkEwBfG+
 j6uE2LRHB4Fb9uf8T25qWuJ2+zsmCrlSZ4zPejtnhJtqALKnTFCYPEMbnO5vP24h0iWS99Zb
 UsO9UIGr6I/6UiqRdnVRACjrTiPuRt0c8VUO/037keK0KW8yx2CGmEOQzpFadonnMw7Xzon0
 hmOhdyBLSxitviZRGyQ8p+QrCiuIm4FIGkafygGQAAZpd75r+kOYgnnF4g5VvTv15usRG+2m
 mrRxMQju1kNpfIl17y1xVrZugu9gcPFbUk6pQiHc23wu2uVe7WZT4Cv7FHa69NJI4CYUkSNs
 RA4piSO0AwdJcrTzXLQGY3hCJnsvq/Ya2OE3TaDCrF7r1yQF2ifkZe8Cd2UDGNgKY46dDDge
 yc/UisBtcYIbBNGgUKaCr9d6vjGL4C6TLwJtdiONLKih6SdkyfZlByCnWbKgwjQfLEEyMnTw
 6uzf8e2Fmo9Aq961jewTOp1+eZ1mX1nnTiNH8ijlUvPPV+iiJm9EOdtDbdzRrphsPPsTPv9r
 L6zyPdmOz0ACbajM0E7AKYYLEwQLGhTOHwFg5U/SwJ3GSI/QDtJI6aIkdscl3lNw/w9ehHgo
 ivsBSe1CTPX2RX6FOl9Qio8Nu23B88l9ylT0O5FFQ/A5kXPqL2HtM83H6bbt5F9nAC/5ZaYl
 8U4Rvg=
IronPort-HdrOrdr: A9a23:q1FNO6CbXtRg++HlHemd55DYdb4zR+YMi2TDgXoBLCC9E/bo7P
 xG+c5wuCMc5wxhP03I9erwQZVoIkm8yXcW2/h0AV7KZmCP01dASrsSjrcK7AeQeREWndQts5
 uIHZIOcOEYzmIUsS852mWF+hobruVvOZrJudvj
X-IronPort-AV: E=Sophos;i="5.97,261,1669093200"; 
   d="scan'208";a="94969644"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH] .gitignore: Only ignore hidden dependency files
Date: Tue, 31 Jan 2023 15:42:35 +0000
Message-ID: <20230131154235.19845-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The current pattern also ignores directories suffixed with ".d", like:
    tools/hotplug/*/rc.d
    tools/hotplug/*/init.d

Avoid this by only ignoring "hidden" files, for which name starts with
a dot.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 .gitignore | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitignore b/.gitignore
index 880ba88c55..5b30d8fc36 100644
--- a/.gitignore
+++ b/.gitignore
@@ -1,12 +1,12 @@
 .hg
 .*.cmd
+.*.d
+.*.d2
 .*.tmp
 *.orig
 *~
 *.swp
 *.o
-*.d
-*.d2
 *.cppcheck.txt
 *.cppcheck.xml
 *.opic
-- 
Anthony PERARD


