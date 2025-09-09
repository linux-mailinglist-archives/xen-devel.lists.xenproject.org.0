Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BB6B503AB
	for <lists+xen-devel@lfdr.de>; Tue,  9 Sep 2025 19:02:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1117226.1463422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uw1iX-0007oy-NO; Tue, 09 Sep 2025 17:01:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1117226.1463422; Tue, 09 Sep 2025 17:01:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uw1iX-0007m9-Ke; Tue, 09 Sep 2025 17:01:17 +0000
Received: by outflank-mailman (input) for mailman id 1117226;
 Tue, 09 Sep 2025 17:01:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M0KN=3U=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uw1iW-0007m3-Ff
 for xen-devel@lists.xenproject.org; Tue, 09 Sep 2025 17:01:16 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98b84f1a-8d9e-11f0-9d13-b5c5bf9af7f9;
 Tue, 09 Sep 2025 19:01:15 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3df3be0e098so3213732f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 Sep 2025 10:01:15 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e75224d165sm3223632f8f.57.2025.09.09.10.01.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 10:01:12 -0700 (PDT)
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
X-Inumbo-ID: 98b84f1a-8d9e-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1757437275; x=1758042075; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CWSSPZ9omMuSs31QFjcFEchxLskxKeC36KOFf68CGZg=;
        b=UFUn85rfJMvkAiRYWvIPg+4m/SfJvSWBia++E0ahHs3aCgWTmK9ZES/oLFgIccaJ2H
         87jEj/08drB/nM5d18oFlYqxV40878CpvZRWXJUej9RuXThs+A9mOU/MiPgcuof41Eh6
         aa7wX9p1eUX8FxkAeohF87SKnkHq3CrdQv6x4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757437275; x=1758042075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CWSSPZ9omMuSs31QFjcFEchxLskxKeC36KOFf68CGZg=;
        b=PWXyDSpZCgnyOhgVQXWz3y0/TtZ8HzD/kb2ZvDMfAuOSIricRKLyBUSlnrZ8M+6uyW
         qm4ZMi++eA9aZXbhCgfQ0iBzNx28HV+uAp43Q6wZvdfGC4+co2aTjGlMYKtip+c97tgb
         XKBMuyhlhqMJZrxlL6yUyqzpIhK+TV025pl4MupJ5CKft11RzV3z/yncqcT77l0MC64E
         bYfe7vYggl5/BWWy5TD8K9kXVletePwDrFqqS8OI1jwWbx3JvEBulhCyHoabs/dXJbLv
         tZgd7R4597B/RFMcg2EF7cR3WNxeRG3i8ZaduNq3b7y6uKM8EDILvfAZn4sMLH53eu4p
         M4rQ==
X-Gm-Message-State: AOJu0YxRqxFG+YbYbAKR2S/ncEdcN/95PTarJormIif/Ymuu9wdadjuJ
	lP5e109ksj3AWHBIeA4o3yR2RyMpbmrzinzto+TASrSlAptcK7oFafIdPQqSDVavwbP980KAwyQ
	8NDw2
X-Gm-Gg: ASbGncvIvslSoDkTkVS543Whqx85wXkbWf+FbSw7/iirCkYEWMVwKTCYzOt8YcDs2dC
	MHW3zUij1KXvrsrMWXuuTZ18IEr1gOT20efyZ7mkp9EuwWwg9G7Awo8Exm6Cpuw41gl/o0VWdBw
	TljnjFwsBYuPCC+BdawUDFQaXos9Zt/G7pbXTzmqA5mngIZ8tUPKYgcWVVfIBg/iR6zM0INRnCq
	NPSlK1lmRcCCaxfY1Pdwdo+Rmue9WiNvbZ+iBYAFQBlZHLRQL6MdxO0HySnI2QiMUbkGmkS2K1h
	HlM34oNUJsRkvzqhpxLoPWZN9w+DviAU+KcLEErdHrYXZQoL2T0jcO+Gn/t+6ap+2pxXAfdJqT2
	Yxf956HbXmjQU/jG1PplNlgBfsyh7YWPEzsbvfnZ+YFoVy34a+ZJHMZtuaJD2zx5iHkCkdAvvfl
	OS
X-Google-Smtp-Source: AGHT+IGhM6N/e8kRKfioGxXjrp2JsjU+wbWsA/pMSQywJa+HLIGpX2rpaMCBQwJxGtJgnHXT+pXeqQ==
X-Received: by 2002:a05:6000:61e:b0:3e7:451f:3a6e with SMTP id ffacd0b85a97d-3e7451f3df8mr7379180f8f.51.1757437274655;
        Tue, 09 Sep 2025 10:01:14 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH TEST-ARTEFACTS] Be explicit about root in scripts/alpine-rootfs.sh
Date: Tue,  9 Sep 2025 18:01:11 +0100
Message-Id: <20250909170111.1810147-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The container is running as root, but be explicit anyway.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 scripts/alpine-rootfs.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/alpine-rootfs.sh b/scripts/alpine-rootfs.sh
index c999b89dbcd8..6fa1d56775bc 100755
--- a/scripts/alpine-rootfs.sh
+++ b/scripts/alpine-rootfs.sh
@@ -84,7 +84,7 @@ cd /
     PATHS="bin etc home init lib mnt opt root sbin srv usr var"
     find $PATHS -print0
     echo -ne "dev\0proc\0run\0sys\0"
-} | cpio -0 -H newc -o | gzip > "${COPYDIR}/rootfs.cpio.gz"
+} | cpio -0 -R 0:0 -H newc -o | gzip > "${COPYDIR}/rootfs.cpio.gz"
 
 # Print the contents for the build log
 zcat "${COPYDIR}/rootfs.cpio.gz" | cpio -tv

base-commit: d7434697deec41ddf31a2f3d189dee75d4d2486f
-- 
2.39.5


