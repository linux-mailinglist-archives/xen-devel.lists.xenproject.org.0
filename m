Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FD745DB7A
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 14:47:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231241.400116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF5Z-0007GD-Ly; Thu, 25 Nov 2021 13:47:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231241.400116; Thu, 25 Nov 2021 13:47:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF5Z-0007BX-Bu; Thu, 25 Nov 2021 13:47:01 +0000
Received: by outflank-mailman (input) for mailman id 231241;
 Thu, 25 Nov 2021 13:46:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nd7+=QM=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mqF0z-00076i-Of
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 13:42:17 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8010330d-4df5-11ec-a9d2-d9f7a1cc8784;
 Thu, 25 Nov 2021 14:42:16 +0100 (CET)
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
X-Inumbo-ID: 8010330d-4df5-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637847736;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NT4AA79X/GUr8W4g3mlMQcdf/icBfAifuywINiEHnwE=;
  b=hiGvm5PoPx6vF33fQ/9UHoO7JvZ13rL4g6InNy9w00eDbByPf0lTgYqd
   LMeB2QNNw6UTZF5qvy0Pvqkyz6bEi6LDHpd/QVkSqkGOelIl7IqLk0ijr
   PR7QBbGuy4AwIks4rEHWmTk2w/VjCCgERbQhe9JvzckZcLOfLoBX5laj9
   g=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: w55DqMXpiPkrnZZPQu3Swh8NkaaNSg+TCqDDzvppfdV5EuxfpIG56bMElYDneQqDPnHE1OUfhk
 nCyBe4jjIabFRq6zcJXmQmcGW/yGbAkLvvr9OFTNSj6a25kZZCEUz3BTlw8o80b9yy0+1U/2dh
 QTlG2L6k+NK/1bQPrt/r0CFENLLE+yvah9QmeN7w/Z1ixCyy8kGhVT/h8r/anCShMn7JP2Ilvt
 1YQAXtOHY89Tt/KDqS5aV7wcAyTS8yBRPiiGf5QbLoDlajroSe9AoDFSVyNk9Kr2o3Uln/X/nh
 yj43fHRkojCOD1R8+8ea2TWG
X-SBRS: 5.1
X-MesageID: 58135505
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:YsOKY635BrY68XKFdvbD5UR2kn2cJEfYwER7XKvMYLTBsI5bp2FVn
 GpOUGGEPKmJYGenfYx1aInjo0lU6p/QmoA2Tgs6pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan8ZqTNMEn970Es6wbNh2OaEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhv/BA4
 Y5clb6JdhYYHJDUweg4dRtlKnQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Ej8I/LM7tLcUHt2tp1z3xBvc6W5HTBa7N4Le02R9t1pkVQKuGO
 qL1bxJoLxfHRRRBIm0aM80YvMeQu0TkVD5H/Qf9Sa0fvDGIkV0ZPKLWGNjIft2HQ+1Fk0Deo
 XjJl0ziGQ0TPtGbzTuD81qvi/XJkCe9X5gdfJWn8tZ6jVvVwXYcYDUUX1ampfiyimalRslSb
 UcT/0IGvaU0sUCmUNT5dxm5u2Kf+A4RXcJKFO834x3LzbDbiy6QAHQESThQLsQrrsYsSRQl0
 1aIm5XiAjkHmLyKS1qN+7GMtzSwNCMJa2gYakc5oRAtuoe55ttp11SWE4glQPXdYsDJ9S/Y4
 xC7hXMvp5cqst869ZijpFzipTCRn82cJuIq3Tn/UmWg5wJ/QYeqYY209FTWhcp9wJalokqp5
 yZdxZXHhAwaJdTUzXHWHr1RdF28z6/daGW0vLJ5I3U2G91BEVaHdJsY3jxxLVwB3i0sKW6wO
 x+7Ve+8CfZu0JqWgU1fP93Z5ycCl/GI+THZuhf8NIcmX3SJXFXblByCnGbJt4wXrGAikLskJ
 bCQetu2AHARBMxPlWTtGLhCgO97l3pglAs/oKwXKDz9j9KjiIO9E+9ZYDNikMhlhE97nOkl2
 4kGbJbbo/mueOb/fjPW4eYuwaMidhAG6WTNg5UPLIare1M+cEl4UqO56e5xKuRNwvUO/s+Vr
 y7VZ6Ot4Aem7ZExAV7RMS4LhXKGdcsXkE/XygRwZwv1gCZ6Pt70hErdHrNuFYQaGCVY5aYcZ
 5E4lw+oW5yjkxzLpGYQa4fTtotneEj5jA6CJXP9MjM+Y4RhV0rC/dq9Jlnj8ywHDyyWs8oio
 uL/ilOHEMRbHwkyXtzLbP+Pzk+quSRPkuxFQEaVcMJYf1/h8dY2JnWp3OM3OcwFNT7K2iCei
 1SNGR4dqOSU+901/dDFiLqqtYCsF+ciTENWE3OCteS9NDXA/3rlyohFCb7acTfYXWLy2aOje
 eQKkK2sbKxZxA5H6tMuHaxqwKQy48rUi4Vblgk0Tm/Wa1mLC697JiXU18d4qaAQlKRSvhG7W
 xzT94ACa6mJIs7sDHUYOBEhMraYzfgRlzTfsaY1LUH96HMl9baLSxwPbRyFiSgbJ7ppKoI1h
 +wmvZdOuQC4jxMrNPeAjzxVqDvQfiBRDf1/u8FIGpLvhyoq1kpGMM7VBSLB6Z2Sb8lBbxsxK
 TiOiaue37lRyyIuqZbo+aQhCQaFuakzhQ==
IronPort-HdrOrdr: A9a23:vPKh8qrFqyOuLiOTGiecOQ4aV5oteYIsimQD101hICG8cqSj+P
 xG+85rsiMc6QxhIU3I9urgBEDtex7hHNtOkOss1NSZLW3bUQmTTL2KhLGKq1aLJ8S9zJ856U
 4JSdkZNDSaNzZHZKjBjDVQa+xQo+W6zA==
X-IronPort-AV: E=Sophos;i="5.87,263,1631592000"; 
   d="scan'208";a="58135505"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Anthony PERARD
	<anthony.perard@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	"George Dunlap" <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	"Jan Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v8 46/47] RFC, no-VPATH: remove check for clean source tree for out-of-tree builds
Date: Thu, 25 Nov 2021 13:40:05 +0000
Message-ID: <20211125134006.1076646-47-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125134006.1076646-1-anthony.perard@citrix.com>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Anthony PERARD <anthony.perard@gmail.com>

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/Makefile | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index 32c36426ed7c..a3c574ed1a87 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -282,7 +282,6 @@ tools_fixdep:
 	$(Q)$(MAKE) $(build)=tools tools/fixdep
 
 PHONY += outputmakefile
-# Before starting out-of-tree build, make sure the source tree is clean.
 # outputmakefile generates a Makefile in the output directory, if using a
 # separate output directory. This allows convenient use of make in the
 # output directory.
@@ -297,15 +296,6 @@ cmd_makefile = { \
 
 outputmakefile:
 ifdef building_out_of_srctree
-	$(Q)if [ -f $(srctree)/.config -o \
-		 -d $(srctree)/include/config -o \
-		 -d $(srctree)/include/generated ]; then \
-		echo >&2 "***"; \
-		echo >&2 "*** The source tree is not clean, please run 'make$(if $(findstring command line, $(origin XEN_TARGET_ARCH)), XEN_TARGET_ARCH=$(XEN_TARGET_ARCH)) distclean'"; \
-		echo >&2 "*** in $(abs_srctree)";\
-		echo >&2 "***"; \
-		false; \
-	fi
 	$(Q)ln -fsn $(srctree) source
 	$(call cmd,makefile)
 	$(Q)test -e .gitignore || \
-- 
Anthony PERARD


