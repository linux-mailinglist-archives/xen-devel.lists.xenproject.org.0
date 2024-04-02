Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4576E894F94
	for <lists+xen-devel@lfdr.de>; Tue,  2 Apr 2024 12:09:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700083.1092681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrb4W-0004TB-EY; Tue, 02 Apr 2024 10:08:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700083.1092681; Tue, 02 Apr 2024 10:08:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrb4W-0004Rj-BJ; Tue, 02 Apr 2024 10:08:52 +0000
Received: by outflank-mailman (input) for mailman id 700083;
 Tue, 02 Apr 2024 10:08:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DzIh=LH=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rrb4U-0004Rb-RA
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2024 10:08:50 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ffa3c609-f0d8-11ee-a1ef-f123f15fe8a2;
 Tue, 02 Apr 2024 12:08:48 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-415644aca59so16423865e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 Apr 2024 03:08:48 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust35.5-4.cable.virginm.net. [82.13.64.36])
 by smtp.gmail.com with ESMTPSA id
 t10-20020a05600c450a00b004161b59e230sm1421620wmo.41.2024.04.02.03.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Apr 2024 03:08:47 -0700 (PDT)
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
X-Inumbo-ID: ffa3c609-f0d8-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712052528; x=1712657328; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZXpWGhb4xf3iNSzyENKiQCvAOMXFRR6+0bjqv2ZNwIc=;
        b=ko6OeyfHuko6Wgp67UV1WGaBdj8EMBo26cm+EYzAQ9tdkPyjNuX7LN+nwP/8Kfz4uD
         8FTyYmLjMc7XlFxwRXZvTf9OhrQJG52UPDLbxPW1bu7dGYatjiH0Td+3WOpTQ5MEaSCJ
         nv0ogGbyd+fmGrWvuhEloHPDamkdlHFmXEfQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712052528; x=1712657328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZXpWGhb4xf3iNSzyENKiQCvAOMXFRR6+0bjqv2ZNwIc=;
        b=YqCHDATFscZRwdu+9lB7HXV6ED4jsAq7i3wA+Y5godl4/oeTC8O6eQSoazHMiUN8iZ
         WepcddJZj01XshLFpFkvURVvcgLeS6DwU+2yfmaFwXZt2dZqp4z2aVq4FJcaryk68SNT
         iypkNvYT7yxdabGuCQw/GNb26ez+i5E4rXZsLvTacsTUaoo53e0YdMElzuO8s70aTB7B
         eLKG3LhN59zmZRU7v7lsi6ZW9WoQ0m1KochC7sEp3VDnwSPF/3zx3ybp2KYbK5a8/tOs
         wgWpuwZp/B3IOdlcgisFlb8lvkCtSp2+pxyzw2UUYWnTfvk26C5OtilQ7z2pqIQq+1BG
         6yEg==
X-Gm-Message-State: AOJu0YygcUq6chDCwoXk0ezb8k5gnZIRciNuIrgBeUtnkpFP+JzP56+0
	TTNnmWfDzza5gaXpd9/xbcRrJNVPGz92phU2YmM3VZ4ZVGRr2E5hby1G2ELg4DFFvOX3RgGMclQ
	t
X-Google-Smtp-Source: AGHT+IH0nBIudDQBtRAxphUS3pqLsVieqqncVYFmQzJIE/r/6YLKJVXwHXOv0vu4bpJJChW/OXHw+g==
X-Received: by 2002:a05:600c:304a:b0:414:8c06:5c32 with SMTP id n10-20020a05600c304a00b004148c065c32mr985044wmh.14.1712052528099;
        Tue, 02 Apr 2024 03:08:48 -0700 (PDT)
From: Anthony PERARD <anthony.perard@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
Subject: [OSSTEST PATCH 37/36] production-config: Set Bookworm's debian-installer version
Date: Tue,  2 Apr 2024 11:08:10 +0100
Message-Id: <20240402100810.42386-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240318165545.3898-1-anthony.perard@citrix.com>
References: <20240318165545.3898-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

I've got this one more patch to add to the series, which I forgot to
write. I'll put it before "Switch to Debian Bookworm as default suite"
when I'll push the rest of the series.

 production-config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/production-config b/production-config
index 6345c40c..0eb8f0f3 100644
--- a/production-config
+++ b/production-config
@@ -92,6 +92,7 @@ TftpDiVersion_wheezy 2016-06-08
 TftpDiVersion_jessie 2018-06-26
 TftpDiVersion_stretch 2020-09-24
 TftpDiVersion_buster 2023-06-20
+TftpDiVersion_bookworm 2024-03-26
 
 DebianSnapshotBackports_jessie http://snapshot.debian.org/archive/debian/20190206T211314Z/
 
-- 
Anthony PERARD


