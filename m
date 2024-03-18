Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B84C87EE2C
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 17:56:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694955.1084373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGHR-00067s-Bp; Mon, 18 Mar 2024 16:56:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694955.1084373; Mon, 18 Mar 2024 16:56:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGHQ-0005t5-Jl; Mon, 18 Mar 2024 16:56:08 +0000
Received: by outflank-mailman (input) for mailman id 694955;
 Mon, 18 Mar 2024 16:56:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=az6s=KY=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rmGHM-0002gq-Jp
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 16:56:04 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6800ac7f-e548-11ee-afdd-a90da7624cb6;
 Mon, 18 Mar 2024 17:56:04 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4141156f245so7505795e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 09:56:04 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust35.5-4.cable.virginm.net. [82.13.64.36])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a05600c349200b0041413d11838sm2020141wmq.26.2024.03.18.09.56.02
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
X-Inumbo-ID: 6800ac7f-e548-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710780963; x=1711385763; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pq6eeei87hao7bl7kATMciqySzcOcwgBpySkkkByHOs=;
        b=rn7auk2HZy3B9Sy5+rqED9hAN1EyCfJHQxUwvVcWMpzyufxLBeSFescbKS+MjeEpPr
         h5A/U1Ak0DdKbHEKY9wj1SRjGkdMHjZvkH/2oXaYVryZYVkEgic8aI/S/kx3+lSm18h6
         A1oOIfVxP5Pb4U/f/1rf1hJqaFwM+IRLfCQAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710780963; x=1711385763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pq6eeei87hao7bl7kATMciqySzcOcwgBpySkkkByHOs=;
        b=ZtBPw0MluhC8zV27hWMLFJvvOy+R6P5SpI2piegVDAvpJK3DVkuHyJzbmdt10vdujc
         rUhUAKxWbg52BX1naor927CR86GSCS49QGy/EAo7Zoha32WKjEVHkg6sC57MhtSGPKva
         5NzAzwgNaUUIR3NQ3vZabCji90k37ihEW805vJCfMqTM0hOi5Nl+pxaEo4xrQQ1dw490
         W/cLj1xiCzkb5CZLY4jFekPW73E7Mry3kaRHSdkx8pMKfaRv36M4RKAhEmkaiOsNFT4g
         st5/zcFTIvcwSxgHpcXGFFF1p+Puma7Uxqy9tTKMm3mqOThis8V1w6iQTPpdb9DpXIFk
         CLFg==
X-Gm-Message-State: AOJu0YwNOqHmn4gLIZPOSC0c1Uk0/gs2Fm9jEGK+iuf4/Rt35MDPa+XK
	/gUFLqakByfCfzPU0NWInQGENefoCLPKDGU/p60l8O/REQzZWpTSKlIXDburlEUYWLjVmfUW0Ku
	n
X-Google-Smtp-Source: AGHT+IGgDcQtvTM654d+tmeQwanSCT3po+N15r+1TYDul4GhmRBvO3zeGNYA2qI7rJvbettoAmpKdQ==
X-Received: by 2002:a05:600c:3587:b0:414:37f:26d with SMTP id p7-20020a05600c358700b00414037f026dmr6667536wmq.10.1710780963384;
        Mon, 18 Mar 2024 09:56:03 -0700 (PDT)
From: Anthony PERARD <anthony.perard@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
Subject: [OSSTEST PATCH 15/36] ts-xen-build-prep: Change package selection for Bookworm
Date: Mon, 18 Mar 2024 16:55:24 +0000
Message-Id: <20240318165545.3898-16-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240318165545.3898-1-anthony.perard@citrix.com>
References: <20240318165545.3898-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

python-dev:
    It doesn't exist on bookworm, and python2 shouldn't be needed
    anymore.

libsdl-dev:
    On buster this already select "libsdl1.2-dev", but to not change
    buster installation we will only use the new package name on
    Bookworm.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 ts-xen-build-prep | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/ts-xen-build-prep b/ts-xen-build-prep
index 547bbc16..48d3fb75 100755
--- a/ts-xen-build-prep
+++ b/ts-xen-build-prep
@@ -200,9 +200,9 @@ sub prep () {
     my @packages = qw(mercurial rsync figlet
                       build-essential bin86 bcc iasl bc
                       flex bison cmake ninja-build meson
-                      libpci-dev libncurses5-dev libssl-dev python-dev
+                      libpci-dev libncurses5-dev libssl-dev
                       libx11-dev git-core uuid-dev gettext gawk
-                      libsdl-dev libyajl-dev libaio-dev libpixman-1-dev
+                      libyajl-dev libaio-dev libpixman-1-dev
                       libglib2.0-dev liblzma-dev pkg-config
                       autoconf automake libtool xsltproc
                       libxml2-utils libxml2-dev
@@ -229,6 +229,12 @@ sub prep () {
         push(@packages, qw(texinfo autopoint libpciaccess-dev));
     }
 
+    if ($ho->{Suite} =~ m/squeeze|wheezy|jessie|stretch|buster/) {
+        push(@packages, qw(python-dev libsdl-dev))
+    } else {
+        push(@packages, qw(libsdl1.2-dev))
+    }
+
     # The in-tree ext4 support in libfsimage can't cope with 64bit ext4 on
     # 32bit build. Use the packaged library.
     if ($ho->{Suite} !~ m/squeeze|wheezy|jessie/) {
-- 
Anthony PERARD


