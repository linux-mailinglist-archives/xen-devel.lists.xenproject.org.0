Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BBE87EE5C
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 18:05:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695008.1084520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGQT-000273-1N; Mon, 18 Mar 2024 17:05:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695008.1084520; Mon, 18 Mar 2024 17:05:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGQS-00024J-U3; Mon, 18 Mar 2024 17:05:28 +0000
Received: by outflank-mailman (input) for mailman id 695008;
 Mon, 18 Mar 2024 17:05:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=az6s=KY=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rmGHO-0002f9-RL
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 16:56:06 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 686d457a-e548-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 17:56:04 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-512bde3d197so3808604e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 09:56:04 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust35.5-4.cable.virginm.net. [82.13.64.36])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a05600c349200b0041413d11838sm2020141wmq.26.2024.03.18.09.56.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 09:56:03 -0700 (PDT)
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
X-Inumbo-ID: 686d457a-e548-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710780964; x=1711385764; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zGc/tAE3LgxqS6yxs5mnzZ81H1ykyZF+fgjzTHt3zAQ=;
        b=Nd7SeoJXvkdESDP60rFSRMmR9KNgA2BYQDVen8y2Hda2mT39d+Q7LiGq/SVJiGQKw0
         ZIvMN/Crj4rTu0TWLSkZHf6575grTYzTFd2ESQEQe3MS/miTFBmaeDy1dEO1cS4rB/1r
         a/H+Rjlh4llPM/v69zR1xEq47cdp294e6HGOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710780964; x=1711385764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zGc/tAE3LgxqS6yxs5mnzZ81H1ykyZF+fgjzTHt3zAQ=;
        b=XmOXhpPnU1edc43N1nj4BZH+rHF9EhP9DyysX5uEH1yaNQMnYC39ynFSk6/WuYiZ6O
         LQmglwagxJew03InhpgVyh2nXSTeqnVDP8FdeQOxeMJ7ST0DcJ1uCeblbpKTXDpiPjMF
         V0u3NYcALtL2Jt1x937cuLyE2tZVo22K6YuesRA9XzULVCYNuapmVP237nFN5zR1qyO/
         9q9Go6sku/dCKwlRBqdFcr+FDmxalj+8kG+oCvk9SFCx5Dg01J/Xu9t00m92nCj0TwkE
         1wduckaCOCOf9f7+bGVCnGP2uOaPCWg3Eo2+PtGocNkl/+QW5DSgh5HduyJo3uXhLs7G
         h79w==
X-Gm-Message-State: AOJu0YxezwlVrj9umP+jm4fuD3KPbyngdQy76fuHIVghV+0ZyIjtm8Xi
	jgwc77R7tFeQbcqPHSMmkvV8vmMeKv0PYHPTDH11y5XUbNIJQR/feL2nLoJtrO2yjqgAa8cyJWE
	S
X-Google-Smtp-Source: AGHT+IHv6ANcOL3/Tor8yfkblZa2vNFikZkiCQfGeZEkPIbXlpNbaAn/WfluD2+T4+nnF2yU4d5yaQ==
X-Received: by 2002:ac2:464c:0:b0:513:e27c:78f0 with SMTP id s12-20020ac2464c000000b00513e27c78f0mr49422lfo.46.1710780964279;
        Mon, 18 Mar 2024 09:56:04 -0700 (PDT)
From: Anthony PERARD <anthony.perard@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
Subject: [OSSTEST PATCH 16/36] bl_getmenu_open: Read grub.cfg as root
Date: Mon, 18 Mar 2024 16:55:25 +0000
Message-Id: <20240318165545.3898-17-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240318165545.3898-1-anthony.perard@citrix.com>
References: <20240318165545.3898-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On bookworm, "/boot/grub/grub.cfg" isn't accessible by user "osstest",
so read the file as user "root".

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 Osstest/Debian.pm | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Osstest/Debian.pm b/Osstest/Debian.pm
index 31d32d6f..57f31977 100644
--- a/Osstest/Debian.pm
+++ b/Osstest/Debian.pm
@@ -139,7 +139,7 @@ sub debian_boot_setup ($$$$$;$) {
 
 sub bl_getmenu_open ($$$) {
     my ($ho, $rmenu, $lmenu) = @_;
-    target_getfile($ho, 60, $rmenu, $lmenu);
+    target_getfile_root($ho, 60, $rmenu, $lmenu);
     my $f= new IO::File $lmenu, 'r' or die "$lmenu $?";
     return $f;
 }
-- 
Anthony PERARD


