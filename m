Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1EDB0A802
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 17:55:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1048947.1419148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucnQS-0000pl-Qo; Fri, 18 Jul 2025 15:55:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1048947.1419148; Fri, 18 Jul 2025 15:55:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucnQS-0000nn-O5; Fri, 18 Jul 2025 15:55:08 +0000
Received: by outflank-mailman (input) for mailman id 1048947;
 Fri, 18 Jul 2025 15:55:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=00bL=Z7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ucnQR-0000nc-8e
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 15:55:07 +0000
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [2a00:1450:4864:20::442])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9288744e-63ef-11f0-a319-13f23c93f187;
 Fri, 18 Jul 2025 17:55:06 +0200 (CEST)
Received: by mail-wr1-x442.google.com with SMTP id
 ffacd0b85a97d-3a6cdc27438so1551725f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 18 Jul 2025 08:55:06 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b61ca48719sm2276468f8f.47.2025.07.18.08.55.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 08:55:04 -0700 (PDT)
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
X-Inumbo-ID: 9288744e-63ef-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1752854105; x=1753458905; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lE8kfXFdtSGbLzrdiB+ky/D+vJnGbNwubgsGzJhexTA=;
        b=MshMV+6aMhVR8T1f6rt+hViqI0grcRZCsuvqdOShg0SLgdP8A41VEYs0mkfhlMx3l3
         mX4apuKU3LitEtD6BPYX9xCKmu6FiM+H5ktyYUhKCYbJ+tssQtOB8MGuU7khN9Xla3LS
         o1rRe7nQxfiZK4lDfDqsY3hkxZLB+Q5Qia3kk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752854105; x=1753458905;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lE8kfXFdtSGbLzrdiB+ky/D+vJnGbNwubgsGzJhexTA=;
        b=DZS52qLj7FLORGFfLC2NeTGcifzNtuC+WUs5U51R2X4dPOcmAfw27plhvtyUk1wvwV
         w6LIyz53XuMX/pLMJ9EMwkw6LeIs46MyYIWiRp53WZ0eCr9wQPgr71UM7hs57PSoHt/b
         oCFTdKH5yJp0yP3Ed051kejhE/lXLAnIvMhdZEXyFVPQI/5xVbP48kMlIe1XuCxxWfwD
         lof5OcjvNHR/XN+gwfF9WTWqeXvhdvaQxkd8TfH62ic46CFr+0LKUc+NaztS1r2S5FOs
         KB2aLkF7XkXK5VAVZwTIy8xBjdPrA6ALtqKyvEO/rNRVWUnKaRm2IiOJ2u5kOO1dVR3Q
         0CZw==
X-Gm-Message-State: AOJu0Yx+IXcSZuB6Umn7/t0oSA9mcP4a/8J5IPHjrSCiQgo3AziriRPT
	N2OC9YHwykRRy6c1Fjbqo/SD6C6WLDNw29FBzpLXRvxsjv/Ssucy3dXR82a7jYzsZ098mnCs9UU
	k5Po69fSns4Sc
X-Gm-Gg: ASbGncscGLzgeRlr5RpO23t/IGsy9mpr8z6Ima9LvPIxPIYq7ZM9tALH8Nba1ugphh8
	TsclpApZk4FdQ4E9iac48lkQzg8BEICldoHcVmWwP4SDNCnjqRM6HQeu83iltdcFOFkb601MWjx
	SzwEHMNuYstidVRcWKx0O0f/sC10B29Awe6GWGkxaDSZtOaQ2xzz5T5GkkPzsUTjyQ7n7Gn3Mvv
	szfvnsPcv5IeLEm/SNjhty+ob8Y0p5h9HZ/mlmpFYzM3eyxYtW4m2Rw6lyuwv4ETFCieYFDzIBj
	MKeu65GiOaRE/JX0upJ8402ttcR9+CVyDYT/NsNDC7JGgdT6X23WM5TsuPoXbX/IPrjP5hLDu4w
	avWpAfif9h000GR59YQT2+qAeH9wZpeKtCEAZvKdTWIO6e7zXUoBl7cq0hdFogsI0TSFlir82NT
	2nvs9CLhE+SHA=
X-Google-Smtp-Source: AGHT+IGrp5qx4+Y0OCAYRkcnHKKVKR8b1B1kO1FTcNgiI6uMtfyhXMh1YkhsteKDbT1lhmZXHSS/WQ==
X-Received: by 2002:a05:6000:98c:b0:3a5:2fb2:35ac with SMTP id ffacd0b85a97d-3b60e4d55e8mr7254260f8f.24.1752854104892;
        Fri, 18 Jul 2025 08:55:04 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 0/4] x86: Convert remaining INTEL_FAM6_* users
Date: Fri, 18 Jul 2025 16:54:58 +0100
Message-Id: <20250718155502.2610047-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is a mechanical change to use the VFM constants rather than the
family-specific ones.

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1934721940

Andrew Cooper (4):
  x86/mwait-idle: Update vendor/family/model logic
  x86/cpu-policy: Update vendor/family/model logic
  x86/spec-ctrl: Update vendor/family/model logic
  x86/intel-family: Resync with Linux

 xen/arch/x86/cpu-policy.c               |  19 ++-
 xen/arch/x86/cpu/intel.c                |   3 +-
 xen/arch/x86/cpu/mwait-idle.c           |  30 +++--
 xen/arch/x86/include/asm/intel-family.h |  86 +------------
 xen/arch/x86/spec_ctrl.c                | 162 ++++++++++++------------
 5 files changed, 108 insertions(+), 192 deletions(-)

-- 
2.39.5


