Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4669082D756
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 11:27:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667276.1038373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPKBp-0007gX-53; Mon, 15 Jan 2024 10:27:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667276.1038373; Mon, 15 Jan 2024 10:27:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPKBp-0007dC-26; Mon, 15 Jan 2024 10:27:33 +0000
Received: by outflank-mailman (input) for mailman id 667276;
 Mon, 15 Jan 2024 10:27:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y0sJ=IZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rPKBm-0007d6-Sn
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2024 10:27:30 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae642f30-b390-11ee-98f1-6d05b1d4d9a1;
 Mon, 15 Jan 2024 11:27:27 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-55790581457so9648725a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jan 2024 02:27:27 -0800 (PST)
Received: from localhost ([213.195.127.68]) by smtp.gmail.com with ESMTPSA id
 w26-20020a17090652da00b00a1c7b20e9e6sm5098330ejn.32.2024.01.15.02.27.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 02:27:26 -0800 (PST)
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
X-Inumbo-ID: ae642f30-b390-11ee-98f1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1705314447; x=1705919247; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u2hlj+SUWp4Z7x8nJLTw3nkULa+otkpDaZaf12QWm7Y=;
        b=T3oIN6usgrtsaS63/iLr3lXWYmEQoOtrcF21iwMIww5lv8daFC2vhxQ8aT6xmg4tuV
         JZWzaN9jzdhIms36A+FaEKiOZju7ZC7Xtca4sTmxMcCOeuaXulGh5TPgL59Wv8LWqeD5
         HzKigeJBQiRoSWOafUScggzyf+ddkjH5QIOpU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705314447; x=1705919247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u2hlj+SUWp4Z7x8nJLTw3nkULa+otkpDaZaf12QWm7Y=;
        b=FuQBHb2LRxvsWWBM0fEHDFAvKexS3DXPFuIE5j2lxYAfW2vXIATcnUSuS/CP2pe8PZ
         6nPRrjun3UYp7F2GTC1ZFcd9c1ILNvb+LKTMgmtx4nixpNVHEtXWESA7tCbzfMaYNphS
         Ju7N0VIjFqpGzyg7KtJWvD4ZT6mPhKA0FCwvL7Hw7pVubk07G/IZuWo4sA19xCuKXbHS
         ztoPAAxfF9ICPOTosUxtmMZ1DNzs1kS8hDG/3Hx5Ga/SPgxusqTyKbiN7BujJ4ZgZgA+
         gIzEcIONiy2v5PgOx46s3wihwMZ63ysuLb9+8WgvxlwxxUS1HR4NTffwREKmp3u91vBw
         t2cg==
X-Gm-Message-State: AOJu0YwXUDe2UY4ibi7ue66cMotCttZmFvYWj/hbWBWo7jBwiWp9mtjQ
	AYwomgS3z/zDle7LdbJlRjAmrLRLEYQt3lljvCj9NniwkXs=
X-Google-Smtp-Source: AGHT+IEolSgfyz00x6gwWaQsgAfG6PCcRungvjsjNun1FmvFE6Kboj0e6sQ4ourjnWd5WC5zngwrXw==
X-Received: by 2002:a17:906:ff53:b0:a26:c83d:e086 with SMTP id zo19-20020a170906ff5300b00a26c83de086mr2268129ejb.103.1705314447172;
        Mon, 15 Jan 2024 02:27:27 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] CirrusCI: drop FreeBSD 12
Date: Mon, 15 Jan 2024 11:27:18 +0100
Message-ID: <20240115102718.81294-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Went EOL by the end of December 2023, and the pkg repos have been shut down.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 .cirrus.yml | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index 385618c394ea..d0a9021a77e4 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -14,12 +14,6 @@ freebsd_template: &FREEBSD_TEMPLATE
     - ./configure --with-system-seabios=/usr/local/share/seabios/bios.bin
     - gmake -j`sysctl -n hw.ncpu` clang=y
 
-task:
-  name: 'FreeBSD 12'
-  freebsd_instance:
-    image_family: freebsd-12-4
-  << : *FREEBSD_TEMPLATE
-
 task:
   name: 'FreeBSD 13'
   freebsd_instance:
-- 
2.43.0


