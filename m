Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D630C57854
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 14:02:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161382.1489354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJWxf-0008Uc-1t; Thu, 13 Nov 2025 13:02:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161382.1489354; Thu, 13 Nov 2025 13:02:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJWxe-0008SU-Uj; Thu, 13 Nov 2025 13:02:02 +0000
Received: by outflank-mailman (input) for mailman id 1161382;
 Thu, 13 Nov 2025 13:02:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kirI=5V=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vJWxd-0008C9-PB
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 13:02:01 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f11174ba-c090-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 14:02:00 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-42b3c965cc4so408287f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 05:02:00 -0800 (PST)
Received: from localhost.localdomain (host-78-149-11-196.as13285.net.
 [78.149.11.196]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b53e7b074sm3670314f8f.7.2025.11.13.05.01.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 05:01:57 -0800 (PST)
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
X-Inumbo-ID: f11174ba-c090-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1763038919; x=1763643719; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+b345aXZDFbH/2J6TGfuC9yXz/lG8GWyVVTrvhz6VIg=;
        b=FnXNzqtKu9NR6HNa7vSOYszzCu5g5Wk98YNJwtADkUozCYkkSnBPvqmA1ehTjDoAhr
         vzW+SkvkWOzRvEkjcz0dCuLMlp7rPBB9szxjS+I9ND0TWxdyrqGjkMnillf2XDdtc60b
         u77RWb91H1ef+nSqbzMPB3oBzKAfpUlpDqluk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763038919; x=1763643719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+b345aXZDFbH/2J6TGfuC9yXz/lG8GWyVVTrvhz6VIg=;
        b=olsB39mfBbkI7Mcm0UGqzuz1t6fJJzJ4KfnQ9m1xGdo58cRmbA00iO3oNCmzbj5/i5
         Vw5uPIdwMkMuH3zABd8Wr0JTwY57Dwet8mHO/k8j7uKdTmsY1JSnCJRKaRtYM7qUBRr2
         Ik2bp01+KGbMWW+TfutGgnuFaQ+cpTSyRwX95Y1XEVMAY3Wgl+NAl910LIJ/Jv0vGgDS
         uObPmbW08svAOpdN15EqnN6LtwOBQ0EtXQv55RNxo2Q0c09pJ5W4W1fAbgmP1wfjQh0/
         KOvEvWFXaNbErjh3Sm75UJ1s9nrDelOBapgzYw0+Aj+icUlD+GPtfDzfct5w5XdjR2jH
         bOvA==
X-Gm-Message-State: AOJu0YwgTNE4CSO6PvzbaE8Q/qL9V2mJ+C+Ucvv0zBJFNbPQDRxwvBs0
	MmtdAJH+w4rSsZfPWRhH0ZAAikjbjesjYeijxPiDTxGsY4SB138RXLfsSIxdNn/BNNWxN/5kBnK
	jKWIxAME=
X-Gm-Gg: ASbGncv0cUec9NsWcqepDF7SZA8vf7AF6T35xVZdreVPO27+C1vVNVFZRklssMGrQ/j
	Oi3oqMR9XI2ZzkdzgMSXpdUVKd1nXPLxE94jyoqkP8p56MzIzLLQwqqKvbqIeAg/zH4bfNho5sh
	XuYbv4SZ+pziKMh3dj6XP6sIgJFiSavfQvcXT0fTOAFmO1eRCFfK5ciZQdZaQ4ngptOp7ZRKjN4
	b3zBDEE5Ik5Pg5XKO4Doa06ocPxo5rC+L24aGWwDqrDWW/gJrwxIPq9ZZuKh7x2i71KCDS8O2js
	jy3J1Pds69kkpG/JlFGcygMF6xEURbP5diFtvqXvh1d7OaMyARRkFH5tQbSvPR0HNNeu+gh4958
	Qf0GQQGjhB63G6qKqWMTVjgdkKdZkzQ6GpMovYlv/ggoTmLvURSu5Z/6eq6wcBSDjhvduUynXBI
	I6JIj+AIm+kTrsOIXMjskhuTn0PV/VKKRtRFLD5ps/78U2imLTittOsvCJ7DW5nw==
X-Google-Smtp-Source: AGHT+IFvzXZuI4IsAmAWPZ3DCwhXxOsqdF2buk8qDMkdSeNFk+fARg78jxE8rRXE2CMZGtN+z/XGfA==
X-Received: by 2002:a05:6000:2884:b0:429:9272:c1be with SMTP id ffacd0b85a97d-42b527d549cmr2866506f8f.8.1763038919165;
        Thu, 13 Nov 2025 05:01:59 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>
Subject: [PATCH for-4.20] mktarball: Drop double-processing of the archive
Date: Thu, 13 Nov 2025 13:01:54 +0000
Message-Id: <20251113130154.220139-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a partial backport of commit 63ebd0e9649e ("releases: use newer
compression methods for tarballs"), but keeping gz as the only compression
method.

In addition to efficiency, this causes the tarball to use root/root ownership,
rather than leak whomever produced the tarball.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>

I've made 4.20.2 using this, and the results look to be correct, and match
4.20.1 other than the ownership adjustment.

For 4.19 and earlier, I'm considering just passing --owner and --group to the
final tar invocation.  Thoughts?
---
 tools/misc/mktarball | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/tools/misc/mktarball b/tools/misc/mktarball
index 7f9b61da4368..2f574f9bf0ee 100755
--- a/tools/misc/mktarball
+++ b/tools/misc/mktarball
@@ -5,14 +5,6 @@
 # Takes 2 arguments, the path to the dist directory and the version
 set -ex
 
-function git_archive_into {
-    mkdir -p "$2"
-
-    git --git-dir="$1"/.git \
-	archive --format=tar HEAD | \
-	tar Cxf "$2" -
-}
-
 if [[ -z "$1" || -z "$2" ]] ; then
   echo "usage: $0 path-to-XEN_ROOT xen-version"
   exit 1
@@ -21,14 +13,15 @@ fi
 xen_root="$1"
 desc="$2"
 
-tdir="$xen_root/dist/tmp.src-tarball"
+tdir="$xen_root/dist"
 
-rm -rf $tdir
+rm -f $tdir/xen-$desc.tar*
 
 mkdir -p $tdir
 
-git_archive_into $xen_root $tdir/xen-$desc
+git --git-dir="$xen_root/.git" archive --format=tar HEAD --prefix=xen-$desc/ \
+    >"$tdir/xen-$desc.tar"
 
-GZIP=-9v tar cz -f $xen_root/dist/xen-$desc.tar.gz -C $tdir xen-$desc
+gzip -9k "$tdir/xen-$desc.tar"
 
 echo "Source tarball in $xen_root/dist/xen-$desc.tar.gz"

base-commit: 03299bb3ec817f47a608dc6080afc32453627fb4
-- 
2.39.5


