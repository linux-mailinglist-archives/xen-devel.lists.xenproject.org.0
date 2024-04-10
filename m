Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEFC89F115
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 13:44:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703047.1098851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruWMe-0003We-CJ; Wed, 10 Apr 2024 11:43:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703047.1098851; Wed, 10 Apr 2024 11:43:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruWMe-0003V7-9M; Wed, 10 Apr 2024 11:43:40 +0000
Received: by outflank-mailman (input) for mailman id 703047;
 Wed, 10 Apr 2024 11:43:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rpn4=LP=linaro.org=manos.pitsidianakis@srs-se1.protection.inumbo.net>)
 id 1ruWMc-0003V1-Mp
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 11:43:38 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 916ea3f7-f72f-11ee-b907-491648fe20b8;
 Wed, 10 Apr 2024 13:43:37 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4167fce0a41so16389755e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 10 Apr 2024 04:43:37 -0700 (PDT)
Received: from localhost.localdomain (adsl-125.109.242.226.tellas.gr.
 [109.242.226.125]) by smtp.gmail.com with ESMTPSA id
 a20-20020a05600c349400b00416a7313deasm1622874wmq.4.2024.04.10.04.43.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Apr 2024 04:43:36 -0700 (PDT)
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
X-Inumbo-ID: 916ea3f7-f72f-11ee-b907-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712749416; x=1713354216; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eIOOIl9Rw1Y1qSX9CrPFraMXRXSZ6MzaRuCNGToA2kA=;
        b=UeWb/bHYWBMsJwbosSnxm/JZS9uySBuAKwkJfPGV2rOJeGbdAP3bSEzRdeSyuJ8IPT
         sYtU8ZF7d3jlq3sdXAjkWhamLaiTvv5Yh3FyrqUHDBsaudnzRviyw3Wy4e1gwJ49+D3G
         ba/sb2v2/Xh2M0TkfNyMCwcnJ5pe46TCTkYS+NyRlnslYZGjdaIUVDsnArbqtunaPqIS
         eiSSnMh1AQRz3iECmHA8ZvWBeVMPApzptduWqkFVgZOGTwXxU3c6fbCss/+ny87FhBbs
         riupm2D65ELppzCg6+IubwpXxSubqse1+AkCm7Ain6JuuL8tfvvlDTNiw4P817k/sVDc
         FFrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712749416; x=1713354216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eIOOIl9Rw1Y1qSX9CrPFraMXRXSZ6MzaRuCNGToA2kA=;
        b=ks0l74jThCi9Kqv60NSjON5DSoP5a94M96Y81C620/BUjw2o4OfFXPW5rMaw8PMZ6Y
         Ku0PS1w4azFqey7rRsYiVDKaxhgmFBgYpZP8GV8ZVdX4x6qpsKQLHg5hfozPM+XEHoTq
         GoH/iyvnHDW1M2hGfQYFE21nl1aXnpLACNTm+7GT48h8IEvgQE60cHmbUOyNIUP8b3xN
         Chl3E9bOoxcRvkIBK/KO+MTIlEOMogz/zoBhbhTwThkvt4aZU83ewGlj24oV8NEA+yZ6
         EMVY9sln3a8bkbEjkSXBRrBH+1W8yVkkA0Wi1hN7maCdOj89jj9e3tkazsUibepwf3yp
         wnBA==
X-Gm-Message-State: AOJu0Yxzr/P/OWI6soNAtq2qz6MvAN436ICkx9SikZiYBPneB7zUjF4k
	7+Hd/1uCKUjL83j3PWs48A6IyUSlOphb9NV4jfNtdl6+oPILrZXrXr1WuFKAHT3IgG06sydo5Rf
	I
X-Google-Smtp-Source: AGHT+IFXJ6i1+PXzEDR4YtTL1S4r8HjAH5VABIHgs5qvaGYEcG1Mtp5qHDLYJxoyrAN4+Ikl3dgEZw==
X-Received: by 2002:a05:600c:470d:b0:416:bd66:af68 with SMTP id v13-20020a05600c470d00b00416bd66af68mr2033774wmo.7.1712749416316;
        Wed, 10 Apr 2024 04:43:36 -0700 (PDT)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [RFC PATCH v1 0/2] convert LIBXL_DEVICE_MODEL_START_TIMEOUT to env var
Date: Wed, 10 Apr 2024 14:43:13 +0300
Message-Id: <cover.1712748711.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF8
Content-Transfer-Encoding: 8bit

This patch series proposes converting the compile-time define 
LIBXL_DEVICE_MODEL_START_TIMEOUT value to an optionally overridden by 
environment variable value, just like the current behavior for 
LIBXL_BOOTLOADER_TIMEOUT is.

Manos Pitsidianakis (2):
  libs/light: add device model start timeout env var
  libs/light: expand device model start timeout use

 docs/man/xl.1.pod.in                 | 11 +++++++++++
 tools/libs/light/libxl_9pfs.c        |  2 +-
 tools/libs/light/libxl_device.c      |  2 +-
 tools/libs/light/libxl_dm.c          | 10 +++++-----
 tools/libs/light/libxl_dom_suspend.c |  2 +-
 tools/libs/light/libxl_domain.c      |  5 +++--
 tools/libs/light/libxl_internal.h    |  6 ++++++
 tools/libs/light/libxl_pci.c         | 10 +++++-----
 tools/libs/light/libxl_usb.c         |  8 ++++----
 9 files changed, 37 insertions(+), 19 deletions(-)


base-commit: f48299cad5c3c69fdc2c101517a6dab9c9827ea5
-- 
γαῖα πυρί μιχθήτω


