Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F5149B278
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 12:01:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260072.449154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJZu-0000Zr-BU; Tue, 25 Jan 2022 11:01:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260072.449154; Tue, 25 Jan 2022 11:01:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJZu-0000VF-3n; Tue, 25 Jan 2022 11:01:34 +0000
Received: by outflank-mailman (input) for mailman id 260072;
 Tue, 25 Jan 2022 11:01:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rP4T=SJ=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nCJZs-0006t5-3D
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 11:01:32 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26917dcc-7dce-11ec-bc18-3156f6d857e4;
 Tue, 25 Jan 2022 12:01:30 +0100 (CET)
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
X-Inumbo-ID: 26917dcc-7dce-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643108491;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tjCJsGpTJwkX9QPSIkgzC8qbhSpsXT5gJ2Q/ukX+uwo=;
  b=h2H21DcbcpZ0zTjanvqe6xSPyECwQ4c8sapGLQ8th06kCP9o0eQWrBYQ
   dM8BMNj/k5kYUrYIRFm9JfiKUfgO7cA04fUfjPDJfXUmaEjNKEEyvIUeE
   cy17Lx5ibC1RYT2B5dVNI3pVIltvTPjXDA3J86kXc4ZtUq4MVvkIbSAh4
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: NtsLjjrdj9hPcGsdnFY8PJKFM2i5xELmVlA0+3s0vj3JFOnztbnpPRgBNwZrw8ebzViEt0DDdR
 SPyTdw4Sb/pHBl0/SrpGjKU0H0HHRAeHnDoctYyEXiaUbfAPr7ZlPvmsO2zJH7jCV4AA5LNtHY
 j1NNxZmKVvgp/zXBvBzu/5SEz9oqDid/m5IDf+mxQ1D3gYV/pMgNLeN7IVvni4Zu39z1jTSmCB
 +eAOxXFrohnDAGMs02yDRqap9+I/lkOBtd+Iuy18kGJI6M3lryzLty1UVz6ThECSqrc8BOcMyQ
 Yllp7LZfcaS/x5M8RrwH46a8
X-SBRS: 5.2
X-MesageID: 64860826
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:+pfh7aibXfA2Km5e4+tRgMcqX161nBcKZh0ujC45NGQN5FlHY01je
 htvDG6PbPfcNGLxc9xxbYvkoU8PvJCEydMySARtriA9Eigb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0GE/NtTo5w7Rj2tcy3IDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1rm8TvbjUlJpTSs7wNAkRJNQxfY4l/reqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHiOp8fvXdxiynUF/88TbjIQrnQ5M8e1zA17ixLNaiCN
 5RBOWAxBPjGSyBIF1QrIaMkpcCho1TgcyZXrFKKpZNitgA/yyQuieOwYbI5YOeiXt5Jl0yVo
 mbH+WXRARwAMtGbjz2f/RqEmevnjS79HoUIG9WQ9ONugVCV7nweDlsRT1TTiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0WdBdDuk74wGl0bfP7kCSAW1sc9JaQIV47olsH2Vsj
 wLX2YOybdByjFGLYVSzruiznz+qADY+dX9TOD4iYCpbx+C29enfkSnzZtpkFae0iPj8Fjfx3
 y2GoUACulkDsSIY//7lpA6a2lpAsrCMF1dovVuPAgpJ+yskPNbNWmC+1bTMAR+sxq69R0LJg
 nULktP2AAsmXcDUz3zlrAng8diUCxe53N/03AYH83oJrW3FF5ufkWZ4um0WyKBBaZ5sRNMRS
 BWP0T69HbcKVJdQUYd5YpiqF+MhxrX6GNLuW5j8N4QSOcAtJVDYonA/PSZ8OlwBdmB2zcnT3
 r/AKa6R4YsyU/w7nFJauc9DuVPU+szO7TyKHs2qp/hW+bGfeGSUWd843KimNYgEAFe/iFyNq
 b53bpLSoz0GCbGWSnSJreY7cA5bRVBmVcGeg5EGLYarf1s5cFzN/teMm9vNjaQ/wfQM/goJl
 1ngMnJlJK3X3C2edl7SOyk9MdsCn/9X9BoGAMDlBn7ws1BLXGplxP13m0IfceZ1+ep94+RzS
 vVZKcyMDu4WEmbM+igHbIm7p4tnLUz5iQWLNiujQT4+Y58/GFCZpo66JlPipHsUEy66lcoiu
 Ln8hAnVdoUOGlZ5B8HMZfPxk17o5SoBmPh/VlfjK8VIfBm+65BjLiH816dlI8wFJRjZ6CGd0
 gKaXUURqeXX+tdn+9jVn6GU6YyuFrImTEZdGmDa65ewNDXboTX/kdMRDr7QcGmEBm3u+aika
 eFE9N3GMaUKzARQro5xM7d31qZitdHhkKBXk1Z/F3LRYlX1Vr45eiua3dNCv7Fmz6NCvVfkQ
 VqG/9RXNOnbOM7hF1JNdgMpYv7aiKMRkzjWq/80PF/79Gl8+7/eCRdeOByFiSp8KrppMdx6n
 bd96ZBOswHv2AA3NtumjzxP8zXeJ3MNZKwrq5UGDdK5kQEs0FxDPcTRByKeDEtjsDmQ3p3G+
 gOpuZc=
IronPort-HdrOrdr: A9a23:9mA72KwJNG/62/QqW6hKKrPwJr1zdoMgy1knxilNoRw8SKOlfq
 eV7ZEmPH7P+VEssR4b+OxoVJPsfZq+z+8W3WByB9eftWDd0QPCRr2KhbGSpwEIcBeRygcy78
 tdmtBFeb7NMWQ=
X-IronPort-AV: E=Sophos;i="5.88,314,1635220800"; 
   d="scan'208";a="64860826"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v9 07/30] build: rework cloc recipe
Date: Tue, 25 Jan 2022 11:00:40 +0000
Message-ID: <20220125110103.3527686-8-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125110103.3527686-1-anthony.perard@citrix.com>
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

We are going to make other modifications to the cloc recipe, so this
patch prepare make those modification easier.

We replace the Makefile meta programming by just a shell script which
should be easier to read and is actually faster to execute.

Instead of looking for files in "$(BASEDIR)", we use "." which is give
the same result overall. We also avoid the need for a temporary file
as cloc can read the list of files from stdin.

No change intended to the output of `cloc`.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---

Notes:
    v9:
    - acked
    
    v8:
    - rework cloc patch, move it ahead of problematic changes
      this is only a convertion to shell script with a single other change.

 xen/Makefile | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index d953dc50ac6a..ec24856a5d46 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -473,14 +473,12 @@ _MAP:
 
 .PHONY: cloc
 cloc:
-	$(eval tmpfile := $(shell mktemp))
-	$(foreach f, $(shell find $(BASEDIR) -name *.o.d), \
-		$(eval path := $(dir $(f))) \
-		$(eval names := $(shell grep -o "[a-zA-Z0-9_/-]*\.[cS]" $(f))) \
-		$(foreach sf, $(names), \
-			$(shell if test -f $(path)/$(sf) ; then echo $(path)/$(sf) >> $(tmpfile); fi;)))
-	cloc --list-file=$(tmpfile)
-	rm $(tmpfile)
+	find . -name '*.o.d' | while read f; do \
+	    for sf in $$(grep -o "[a-zA-Z0-9_/-]*\.[cS]" $$f); do \
+		sf="$$(dirname $$f)/$$sf"; \
+		test -f "$$sf" && echo "$$sf"; \
+	    done; \
+	done | cloc --list-file=-
 
 endif #config-build
 
-- 
Anthony PERARD


