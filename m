Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3470D87EE1E
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 17:56:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694942.1084258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGHE-0002w5-7G; Mon, 18 Mar 2024 16:55:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694942.1084258; Mon, 18 Mar 2024 16:55:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGHE-0002td-0Z; Mon, 18 Mar 2024 16:55:56 +0000
Received: by outflank-mailman (input) for mailman id 694942;
 Mon, 18 Mar 2024 16:55:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=az6s=KY=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rmGHC-0002f9-Lg
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 16:55:54 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 614004a5-e548-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 17:55:52 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-412e784060cso33041695e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 09:55:52 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust35.5-4.cable.virginm.net. [82.13.64.36])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a05600c349200b0041413d11838sm2020141wmq.26.2024.03.18.09.55.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 09:55:51 -0700 (PDT)
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
X-Inumbo-ID: 614004a5-e548-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710780952; x=1711385752; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFcZD/vzCDZy7qgNaMCGQWkAf2ZxLdhNx3qOWLX+MmQ=;
        b=LoYGUUIwwtNY88Ya7k++i7V57mDREXCNQP8BR/24s1etfq96izIqjssA7mkBVFC79E
         XYOfz6K9mXr95T/jm2R/LxAPZjSOYjXyqZT1L5z4+0R+Iunv+AfqG85XkTrrfvkTfyep
         95xMOkEGdIcAIcuupE19UfVRsY5ipKbLunrB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710780952; x=1711385752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pFcZD/vzCDZy7qgNaMCGQWkAf2ZxLdhNx3qOWLX+MmQ=;
        b=Dwapubd876t2p+AoFfdeJP5CaCxh5PwZ+X8trHXIOIXQh5WhOE8Mvy50lffzW2VP8P
         i/3xGVeX4p7xFSMCYRNCRHio+QVEKWxq6seulyZtZ+jBUtgswhAA7Gl6LjzEXiweKrFP
         tRIj+UD9lCtoXBYs3vqyd5Qi/8X9zoe2rCjAVwNHei3LjXRAglx6eHg1cHODx2rgnVHm
         6pSQRhklqMFn9aMFsZUMXgTfpcPrt8fM4B4CgpnQiweE4tJORm/YJIWsSUiEB2lJDLZ0
         q+8k7bR06x6ibQhRAp6yJD+CKOYAzE00d48s4oMv6+1Nctk6m5tfCmEDkPsdqp88UeiP
         66xg==
X-Gm-Message-State: AOJu0Yy4xsMAhlh/jiSsu9pYN4ncEi0xvOzhd+rWmYTjyJCnAiNFIEOW
	E8U7TFqL1knpI6AXJkmwkRn5+ERa81XeAqbNnBVyl7sWJ6AGLsd1jTM+lJmxbd+L/TpdRPaAWcp
	m
X-Google-Smtp-Source: AGHT+IG8YAV1ftnzazAZIDxBa3utzD1TDHSKSdBtOtR7vb9I1M5xfaPy+clF7DLuB05ctRuoArjHUg==
X-Received: by 2002:a05:600c:4f04:b0:412:e0f7:ef52 with SMTP id l4-20020a05600c4f0400b00412e0f7ef52mr148317wmq.19.1710780952144;
        Mon, 18 Mar 2024 09:55:52 -0700 (PDT)
From: Anthony PERARD <anthony.perard@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
Subject: [OSSTEST PATCH 01/36] production-config: Add bookworm debian install media filename
Date: Mon, 18 Mar 2024 16:55:10 +0000
Message-Id: <20240318165545.3898-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240318165545.3898-1-anthony.perard@citrix.com>
References: <20240318165545.3898-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 production-config | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/production-config b/production-config
index 2c44805c..6345c40c 100644
--- a/production-config
+++ b/production-config
@@ -101,6 +101,8 @@ DebianImageVersion_jessie 8.2.0
 DebianImageVersion_stretch 9.4.0
 DebianImageFile_buster_amd64 debian-10.12.0-amd64-xfce-CD-1.iso
 DebianImageFile_buster_i386 debian-10.12.0-i386-xfce-CD-1.iso
+DebianImageFile_bookworm_amd64 debian-12.5.0-amd64-netinst.iso
+DebianImageFile_bookworm_i386 debian-12.5.0-i386-netinst.iso
 
 
 # Update with ./mg-netgrub-loader-update
-- 
Anthony PERARD


