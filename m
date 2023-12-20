Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC9A81A0BC
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 15:08:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657914.1027011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFxFa-0004ty-1m; Wed, 20 Dec 2023 14:08:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657914.1027011; Wed, 20 Dec 2023 14:08:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFxFZ-0004oE-UT; Wed, 20 Dec 2023 14:08:41 +0000
Received: by outflank-mailman (input) for mailman id 657914;
 Wed, 20 Dec 2023 14:08:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RD2L=H7=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rFxFY-0004kf-68
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 14:08:40 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 453cc1d3-9f41-11ee-9b0f-b553b5be7939;
 Wed, 20 Dec 2023 15:08:37 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2cc6863d43aso43341881fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 06:08:37 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 d19-20020a05651c089300b002cc83c337absm593892ljq.70.2023.12.20.06.08.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Dec 2023 06:08:36 -0800 (PST)
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
X-Inumbo-ID: 453cc1d3-9f41-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703081316; x=1703686116; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2fKu9ANs5pt5jj6Gpw7pQbCf+WI+5MwaW9ic+DTy9Fs=;
        b=R2TJl2NKXlDzOP4C2wo4inB4JPz1dHEiQ49tw5XGtCk+OIKXqpl4Va7r3664PhnZGw
         +/rfNAnRzrKjYBXk31s2xaMsWXMRzCkVzlP4k+bAZgKuHaweCMGXqQh135cVTGCG30A2
         jRvXgkqIUGAI/seePjPdiv+o0y+H2wUiy6uKoQBDh1h9vLEy9e5NG4jd7bfQeJU7S3KX
         YFkFQfEou1aWlSL/Dk23MqGrwgOOjecVgvrNz39AcrzXTTo9ALwrlxTw29gZnpvNBeGy
         HGEOmGE84zdsWueM1BAfEmCJPXeDrAd9WR5rbs3Nyea0hO9tQ2cHGFc+ludZQfWLFWy9
         MV4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703081316; x=1703686116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2fKu9ANs5pt5jj6Gpw7pQbCf+WI+5MwaW9ic+DTy9Fs=;
        b=eqtQc8OIs2h03SAosu34EXVaGdYYHfV15ePsrDxEdfWMgyGdM4hHkbTNTtNoczyOkQ
         /ouZGzqzzb7CQ9mmwBif7MPvLwO46sTnT22xOxuYDleaV/3x8PQ8ifwsE62lL86XeDO/
         Lu2wLFHAvSzT+2WXe0GuNyVr3QukBBFoT1frddem0W2Wl2pHS89ILssX/bczQT7x7294
         ogFR/TDUyDA9GVSPExTlln+F1RJydBtSzyR9COrnVs8uBnnu5fWhX59MbTv9L8aAkyIJ
         vT/Fs0nFFYoC0VmKUDFx/A+L3wVh8MB+35bMen8psOVltWTP87ZjKNHkDqW95tnDM1u8
         s2gg==
X-Gm-Message-State: AOJu0YwU3DMryBa5z2oRyBmub4fJPb4Qcx4n6zWqbKQ0Nl7LkzWoeHCw
	aCbRQjHmqP68HMucaM/Ip/YOXk8xtnoPbg==
X-Google-Smtp-Source: AGHT+IF/TDyhntyDamCgw7yzth1QdkVU3pXiAmtkMPFmpwRP98ZtkfYrHnI48rMbDg3lnvwKkMrNdw==
X-Received: by 2002:a2e:8897:0:b0:2cc:7013:4b40 with SMTP id k23-20020a2e8897000000b002cc70134b40mr2276330lji.68.1703081316356;
        Wed, 20 Dec 2023 06:08:36 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v6 1/9] automation: ensure values in EXTRA_FIXED_RANDCONFIG are separated by new line
Date: Wed, 20 Dec 2023 16:08:23 +0200
Message-ID: <9f75416adb77d03b639741e4548d041c78fd4227.1703072575.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1703072575.git.oleksii.kurochko@gmail.com>
References: <cover.1703072575.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Kconfig tool expects each configuration to be on a new line.

The current version of the build script puts all of ${EXTRA_FIXED_RANDCONFIG}
in a single line and configs are seperated by spaces.

As a result, only the first configuration in ${EXTRA_FIXED_RANDCONFIG} will
be used.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V6:
 - The patch was introduced in this version of patch series.
---
 automation/scripts/build | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/automation/scripts/build b/automation/scripts/build
index b3c71fb6fb..13b043923d 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -14,7 +14,7 @@ if [[ "${RANDCONFIG}" == "y" ]]; then
 
     # Append job-specific fixed configuration
     if [[ -n "${EXTRA_FIXED_RANDCONFIG}" ]]; then
-        echo "${EXTRA_FIXED_RANDCONFIG}" >> xen/tools/kconfig/allrandom.config
+        sed "s/ /\n/g" <<< "${EXTRA_FIXED_RANDCONFIG}" > xen/tools/kconfig/allrandom.config
     fi
 
     make -j$(nproc) -C xen KCONFIG_ALLCONFIG=tools/kconfig/allrandom.config randconfig
@@ -28,9 +28,11 @@ else
     echo "CONFIG_DEBUG=${debug}" >> xen/.config
 
     if [[ -n "${EXTRA_XEN_CONFIG}" ]]; then
-        echo "${EXTRA_XEN_CONFIG}" >> xen/.config
+        sed "s/ /\n/g" <<< "${EXTRA_XEN_CONFIG}" >> xen/.config
     fi
 
+    cat xen/.config
+
     make -j$(nproc) -C xen olddefconfig
 fi
 
-- 
2.43.0


