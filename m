Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0757E87EE5A
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 18:05:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695007.1084501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGQG-0001Hl-Qo; Mon, 18 Mar 2024 17:05:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695007.1084501; Mon, 18 Mar 2024 17:05:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGQG-0001EE-Lz; Mon, 18 Mar 2024 17:05:16 +0000
Received: by outflank-mailman (input) for mailman id 695007;
 Mon, 18 Mar 2024 17:05:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=az6s=KY=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rmGHf-0002gq-MT
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 16:56:23 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71039d29-e548-11ee-afdd-a90da7624cb6;
 Mon, 18 Mar 2024 17:56:19 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-41460512c25so3834195e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 09:56:19 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust35.5-4.cable.virginm.net. [82.13.64.36])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a05600c349200b0041413d11838sm2020141wmq.26.2024.03.18.09.56.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 09:56:18 -0700 (PDT)
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
X-Inumbo-ID: 71039d29-e548-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710780978; x=1711385778; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eqQ7r3Pddk0MZXZyItvqBWjUPFkKGqn9CfcnBLkApoY=;
        b=R82t1X7Hb2BXFNWAyMJJ6OMAY5LcdLg5UIFR6bop7gLZYgsJKqiIDfzrcu/qpao7dO
         RJWj2Ci4mQzcX2fyVGGdMZvBkqBtJFOgYS+1SMZrabpH11imGbAonFoO4DBIasuYVea5
         7b34yvgeGK5UO3btwjZT3lsOfN4K8bpP+X57U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710780978; x=1711385778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eqQ7r3Pddk0MZXZyItvqBWjUPFkKGqn9CfcnBLkApoY=;
        b=tftK2BQMPHwW0Yl/wQGAoOzq1p7IZq+TO0N3cp9RT0tm7nzjl+CqZ4/gM3vWNwsEOx
         S9PJf+ysGBHE5l6PSTFoxDa2ols/g5Fcte8tmjM0UwH3MptKJ773VLw2hzNfwQ8Eg/Qr
         6tiCKDWv/3hDv7qGdeh0PD3XgIBv4kge4due22G4Bemo5YxEQK4M21TqKodRUly3o1YG
         AI29+7prVOuft1orDiQOSvgl/uNGCcvVDiqJHhYowVdUcKVDirqTySLYJV14nCGFcA39
         /nCNvJxDFxmM1xWUnTONusfg131cyhlj6PUvCPYhCC3JdAxxKaD8xfJ+QmoILgvDSIk3
         Hx5w==
X-Gm-Message-State: AOJu0YxZn+G4Z44fatGgrOgJiPWcL62U32a06MVtPPvV5Z2tTWM4G5XF
	UCBGLq0ov2PuUbOgbBDfcQQH2uI00k1rzFYRD6NDCMBZB/98S+TKopJvQ8HfqI9X2m95Oe6VLsU
	/
X-Google-Smtp-Source: AGHT+IH0aBLlGgXNfgE33Vjye1egy0i8b9q5S/eE5gjpBCD8+7jCZaD72rCLuHhv9Ye6YEzpQjWnzQ==
X-Received: by 2002:a05:600c:4f0d:b0:413:e19:337f with SMTP id l13-20020a05600c4f0d00b004130e19337fmr5780538wmq.22.1710780978639;
        Mon, 18 Mar 2024 09:56:18 -0700 (PDT)
From: Anthony PERARD <anthony.perard@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
Subject: [OSSTEST PATCH 32/36] ts-xen-install: Fix bridge setup, ask to copy MAC addr
Date: Mon, 18 Mar 2024 16:55:41 +0000
Message-Id: <20240318165545.3898-33-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240318165545.3898-1-anthony.perard@citrix.com>
References: <20240318165545.3898-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This ask to copy the MAC address from $physif on the bridge.

On Debian Bookworm, when running as a Xen guest for nested tests, the
bridge does get a random MAC address and a different IP address from
DHCP than before setting up the bridge, so the test fails.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 ts-xen-install | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/ts-xen-install b/ts-xen-install
index 3a913fce..645d8a79 100755
--- a/ts-xen-install
+++ b/ts-xen-install
@@ -312,6 +312,9 @@ sub ensurebridge () {
     bridge_ports $physif
     bridge_fd 0
     bridge_stp off
+END
+            $bridgex .= <<END if ($ho->{Suite} !~ m/wheezy|jessie|stretch|buster/);
+    bridge_hw $physif
 END
 	} else {
 	    $iface= $physif;
-- 
Anthony PERARD


