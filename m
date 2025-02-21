Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BFBA402C7
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2025 23:37:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894698.1303419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlbdT-0004ab-HR; Fri, 21 Feb 2025 22:36:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894698.1303419; Fri, 21 Feb 2025 22:36:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlbdT-0004YB-Ev; Fri, 21 Feb 2025 22:36:43 +0000
Received: by outflank-mailman (input) for mailman id 894698;
 Fri, 21 Feb 2025 22:36:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7TFm=VM=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tlbdS-0004Y5-LT
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2025 22:36:42 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ee3cccb-f0a4-11ef-9896-31a8f345e629;
 Fri, 21 Feb 2025 23:36:36 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4397e5d5d99so16640835e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 21 Feb 2025 14:36:36 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b02f252dsm29451705e9.22.2025.02.21.14.36.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 14:36:34 -0800 (PST)
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
X-Inumbo-ID: 4ee3cccb-f0a4-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740177395; x=1740782195; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YwD9pfqj9ppLkVP6zSlioczGHp1Wlr70Pz3JqQaiQLQ=;
        b=kG8hAANAAbmVBSbA0xYFdvA9D9clkM7zs8Pb9jGbumBF502Zn4nvw1Fxp2upHDsLge
         bVI6urS47FWAARwgXkz6zAwTw4EI1hy7XeduUpG8ljXTPEeajtj081ZdOqUC8NNnpynA
         cJ34hwwuhs14cwLUBJgf7dLRVbHkqMHXuEAss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740177395; x=1740782195;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YwD9pfqj9ppLkVP6zSlioczGHp1Wlr70Pz3JqQaiQLQ=;
        b=wj4UHQk2Ab+iSVJUI8cnvUolDykFS7NWQldIUA9g7b/aN5oaidfkxGF1tUnl78Wpaa
         wEenboq5SxB2V1W1ZmmCltQen24Ww/DT9nsgfxR0Tkmh+kziltIGE5szSdrdeD+RCJAW
         nyh2K41f5KPcm4rWUY/tIWaLkS8u3XIrWQ5eQEVRXPFYPLMaOVl7st0+hAzDmiF/IBob
         p6xfLgWP+YEsh8oVKrtbTlqga5E3AF4LrG+BOigktsAXJOfMFmUpI10rBYu5UM2RIR5h
         o/UCfcCsN6jON+9RyepFte2sZBSYpRD1XcjEgsTRZY9WzhF64yrE0wHCRao+blWyoHsA
         IGeg==
X-Gm-Message-State: AOJu0Yy5uuMFPEX4yIyLXs4PG2vxEPno/yYhzYxbtAIqSTHli66OhEF4
	XbAr56ff+qXw8ZYxcM7tfByhYanRWzTyeUS2zzdCN1tEnU2kFuHCMCyJa6eWjR2yTXw1GJn034L
	6
X-Gm-Gg: ASbGncvJja9pf6InE+PqXvahjHVmjM5JKhRFokkBSvR5xUfjYkK3bFJzIGb7t8XXQLD
	48Hq5jR0VVOGVF9Jx6TbQRVdbdbroaufvPLf25DXF//pNM1ZaA1ONXuEbtsKujpVySLXJFQPOv5
	Fl+uzqAbWh4aWjQ46OnbEujZlHZlZ+GszdZ+0D0vTyJpvTqmtX6QfhWU8Hgv4XG5Vk3aakD1H0N
	rdS8kxIjhGCtuDvit7ZybBW1kmff29XBXsl8oiqiDF2Sm4thm4MJVK4T0XeD+pFX4z3v8aU4v88
	gqkLJ3HHeep0wWU3DBEBtyT+IMkYKn8X7+xfM+qdRPSTC0m7p1Xfu4hD2nbckyzHNUmgFhY54El
	7q2HvUA==
X-Google-Smtp-Source: AGHT+IGrc9bK9vun3GbbfNK13Trx5oJyAGEBLdDs2sJfxUgqxk7OYII28HbCxlggTJy9+FWVu12h/g==
X-Received: by 2002:a05:600c:4fc3:b0:439:9b19:9e2d with SMTP id 5b1f17b1804b1-439ae1f1bdbmr50605865e9.16.1740177395283;
        Fri, 21 Feb 2025 14:36:35 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] scripts: Fix git-checkout.sh to work with non-master branches (take 2)
Date: Fri, 21 Feb 2025 22:34:32 +0000
Message-Id: <20250221223432.882705-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

First, rename $TAG to $COMMITTISH.  We already pass tags, branches (well, only
master) and full SHAs into this script.

Xen uses master for QEMU_UPSTREAM_REVISION, and has done for other trees too
in the path.  Apparently we've never specified a different branch, because the
git-clone rune only pulls in the master branch; it does not pull in diverging
branches.

Fix this by performing an explicit fetch of the $COMMITTISH, then checking out
the dummy branch from the FETCH_HEAD.

Suggested-by: Jason Andryuk <jason.andryuk@amd.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Jason Andryuk <jason.andryuk@amd.com>

A second attempt, given that c554ec124b12 ended up having to be reverted.

https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1683296906
---
 scripts/git-checkout.sh | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/scripts/git-checkout.sh b/scripts/git-checkout.sh
index fd4425ac4ee8..a22540a2a5bb 100755
--- a/scripts/git-checkout.sh
+++ b/scripts/git-checkout.sh
@@ -1,12 +1,12 @@
 #!/bin/sh
 
 if test $# -lt 3; then
-	echo "Usage: $0 <tree> <tag> <dir>"
+	echo "Usage: $0 <tree> <committish> <dir>"
 	exit 1
 fi
 
 TREE=$1
-TAG=$2
+COMMITTISH=$2
 DIR=$3
 
 set -e
@@ -15,10 +15,11 @@ if test \! -d $DIR-remote; then
 	rm -rf $DIR-remote $DIR-remote.tmp
 	mkdir -p $DIR-remote.tmp; rmdir $DIR-remote.tmp
 	$GIT clone $TREE $DIR-remote.tmp
-	if test "$TAG" ; then
+	if test "$COMMITTISH" ; then
 		cd $DIR-remote.tmp
+		$GIT fetch origin $COMMITTISH
 		$GIT branch -D dummy >/dev/null 2>&1 ||:
-		$GIT checkout -b dummy $TAG
+		$GIT checkout -b dummy FETCH_HEAD
 		cd -
 	fi
 	mv $DIR-remote.tmp $DIR-remote
-- 
2.39.5


