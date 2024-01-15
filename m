Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BB782DB24
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 15:19:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667391.1038592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPNnl-0002vr-ID; Mon, 15 Jan 2024 14:18:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667391.1038592; Mon, 15 Jan 2024 14:18:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPNnl-0002sy-FP; Mon, 15 Jan 2024 14:18:57 +0000
Received: by outflank-mailman (input) for mailman id 667391;
 Mon, 15 Jan 2024 14:18:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y0sJ=IZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rPNnj-0002pr-9g
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2024 14:18:55 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02bb5d8f-b3b1-11ee-9b0f-b553b5be7939;
 Mon, 15 Jan 2024 15:18:53 +0100 (CET)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2cd17a979bcso98106641fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jan 2024 06:18:53 -0800 (PST)
Received: from localhost ([213.195.127.68]) by smtp.gmail.com with ESMTPSA id
 fd4-20020a056402388400b0055864f99f78sm5474688edb.20.2024.01.15.06.18.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 06:18:52 -0800 (PST)
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
X-Inumbo-ID: 02bb5d8f-b3b1-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1705328332; x=1705933132; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AuHUCtOs8INlwemCFope66L95sEtEz/jPkygbDkFePw=;
        b=h2pO5/iltnZIvf3sAQi8z+lZ1cHiiq5Gc0mrtOyDuLcDZdsmQtYxMGoOSj1GkmTTSc
         gBtchoMgGo/imG5FXt0qowL6cokITgiFtQTvr1Uop/DjQmoDAak6Wzbj0A9iWaYjou4j
         6jLqlF2v5fI9B91VHvE3AD2LFr007eOssKkRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705328332; x=1705933132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AuHUCtOs8INlwemCFope66L95sEtEz/jPkygbDkFePw=;
        b=vsFDt5z+W7mypUXmadR/iFNn4iDqt+/GsOalK6Gn6/9+pk5NrVfI1RFZjvPDVqFeO3
         FmfvMQvZIgbuXAJ3SRbqZRpUoO2gU+skoVVCizGL87menBnDhiA/ZUp6nhz7bXwE9clG
         whBeu2mkCKPwymWqTgqhsusoUSVYNn/JK4jonBMFgH04dA+ZzHio+nF2xVpiPkxjZ7YQ
         WRY4tJ1q4Z/+omRC1pAm1K62wgPN0fqijZ2IQ7mfGm/6XbTUVJDi0TQPLVOUR1ZhSft0
         PS8HeszhseW8tg9wD6zhnn+v09gMubBXeJRThjlUEUGaamaR2A/m6m7gY5xHhvWyEKsr
         1XoA==
X-Gm-Message-State: AOJu0YwE7PceX5Ujn4QRRxe5GUm2t4YZ1vK6m+rUXTpUBIpL4MODnhnu
	mP226TbsQwFRkyYZMb3UN6Fs1pWArFfH6ft4iMsLwkyq87M=
X-Google-Smtp-Source: AGHT+IFjGNVN7FCjgS9OJbnihs1hc8dxQVYMIEx8XTy8Og+w+wVtvxgTQsYGpbPK63Zr0HxUIfb6Qg==
X-Received: by 2002:a2e:9c09:0:b0:2cd:1e40:2903 with SMTP id s9-20020a2e9c09000000b002cd1e402903mr1126477lji.26.1705328332512;
        Mon, 15 Jan 2024 06:18:52 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: anthony.perard@citrix.com,
	iwj@xenproject.org,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] osstest: bump /boot partition to 1G
Date: Mon, 15 Jan 2024 15:18:37 +0100
Message-ID: <20240115141837.82983-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Increase the size of the boot partition, as arm64 initrd is already exhausting
all the space:

update-initramfs: Generating /boot/initrd.img-6.7.0+
gzip: stdout: No space left on device

Reported-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 Osstest.pm | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Osstest.pm b/Osstest.pm
index 7776ba88c6e2..a559ca4ea8b6 100644
--- a/Osstest.pm
+++ b/Osstest.pm
@@ -94,7 +94,7 @@ our %c = qw(
     HostProp_GenEtherPrefixBase 5e:36:0e:f5
 
     HostDiskESP    300
-    HostDiskBoot   300
+    HostDiskBoot  1000
     HostDiskRoot 20000
     HostDiskSwap  2000
 
-- 
2.43.0


