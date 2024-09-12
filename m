Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCBD976A70
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 15:24:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797485.1207454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sojne-0002pa-Up; Thu, 12 Sep 2024 13:23:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797485.1207454; Thu, 12 Sep 2024 13:23:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sojne-0002o1-S1; Thu, 12 Sep 2024 13:23:54 +0000
Received: by outflank-mailman (input) for mailman id 797485;
 Thu, 12 Sep 2024 13:23:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HbDX=QK=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sojnd-0002kQ-Hf
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 13:23:53 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41291a11-710a-11ef-a0b5-8be0dac302b0;
 Thu, 12 Sep 2024 15:23:52 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2f029e9c9cfso10964601fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Sep 2024 06:23:52 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25c72861sm745545166b.105.2024.09.12.06.23.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 06:23:51 -0700 (PDT)
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
X-Inumbo-ID: 41291a11-710a-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1726147432; x=1726752232; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Up51uPGKDDIgw1GcHlTddUeNtioazLZkiuE6mZRsSzw=;
        b=NbC8DJYXxkYmPFY1Bip2UyL5JUDn+GjTY7SPPWYL4Qq3J19x6PyaaGS+uGQSmxkqL0
         xr8O+BS87+uRtrbxauouSdxoN2mj+xz7b1z0eHu8ValN2Wt9AckbH68mXddtr6sEHBGI
         m9hvFNEXMDE0vldKp3qq/ufmUbx0tleYRgKQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726147432; x=1726752232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Up51uPGKDDIgw1GcHlTddUeNtioazLZkiuE6mZRsSzw=;
        b=LY9vk2vUQGavLEiD0VEKckPwpTLrOA1pn28NwIfS+z8bZW8pBigzK0aGWchI4cJuYW
         Haekb87DqVPcFKdlL6WyidVpt6CaFtLe4pZVukpeB+r7aw9hZVxJmLJZwSbQNwZ3THnz
         1IXkS11liBVjDtZnINWQrOiUR5YxXeEwRiGdTgfwKXlmxLj3/D7PqAAtpFipzGf9v5zT
         9FJjHXSORmO9GOF9ntku7131mD3AQ/1E01H2vaCkOytJZYnYKmBhh5CcQGGTAbT3rDFq
         zwDpQPrcX+ou/yIWEihmhrBCgLX4aoSsZN9suN/fBWwd7FNDQ5TRgItD7MIdrVnuvqRv
         +ECg==
X-Gm-Message-State: AOJu0YzK3A3ekMonA4yS8fuCmTFT0g+k5pH48ZyL3A14+38dfSlZb2od
	xING5PO0dCWl6ge29GD1AZn5Q/j1RFj/2QxpRM1vun9oGThFHceS8mYIc6JQmCap0WFJlTrB5MI
	p
X-Google-Smtp-Source: AGHT+IHqZCBbYwUr8NSXGAwnm3cjNXfZ+46LYZ4N59e1usUcgI1x0ezt3wXGwO62P2PS5Uj1tWqzaQ==
X-Received: by 2002:a2e:a586:0:b0:2f7:7b34:2876 with SMTP id 38308e7fff4ca-2f787dc72dbmr23116061fa.15.1726147431544;
        Thu, 12 Sep 2024 06:23:51 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] changelog: add note about blkif protocol fixes
Date: Thu, 12 Sep 2024 15:23:47 +0200
Message-ID: <20240912132347.28756-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 CHANGELOG.md | 1 +
 1 file changed, 1 insertion(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 26e7d8dd2ac4..8864ea7eafad 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -9,6 +9,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 ### Changed
  - On x86:
    - Prefer ACPI reboot over UEFI ResetSystem() run time service call.
+ - Fixed blkif protocol specification for sector sizes different than 512b.
 
 ### Added
 
-- 
2.46.0


