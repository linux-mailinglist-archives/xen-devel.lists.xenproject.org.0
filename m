Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A10AA0BC8
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 14:37:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.972346.1360704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9kCi-0007Nu-JP; Tue, 29 Apr 2025 12:36:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 972346.1360704; Tue, 29 Apr 2025 12:36:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9kCi-0007LH-Gp; Tue, 29 Apr 2025 12:36:52 +0000
Received: by outflank-mailman (input) for mailman id 972346;
 Tue, 29 Apr 2025 12:36:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yPhw=XP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u9kCh-0007L9-9O
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 12:36:51 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c2c4c3a-24f6-11f0-9ffb-bf95429c2676;
 Tue, 29 Apr 2025 14:36:45 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43d04dc73b7so53363925e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Apr 2025 05:36:45 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073ca5467sm13613882f8f.28.2025.04.29.05.36.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Apr 2025 05:36:44 -0700 (PDT)
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
X-Inumbo-ID: 9c2c4c3a-24f6-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745930205; x=1746535005; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SG3XByK8O/rE2KJ3fe819/e/kESRXNZtyTnahhTihHw=;
        b=XM9x7jZmcrOqo8IsqWhsVazw4DNIpLu5Ip/97nLrzvmLxnm0OjJ7ipNfJuTvLSBkAe
         xxyP5nbpdqd0RtaPjBnRQem/tWG8FHULCTR41FiElj1kPLsu8FwBc5CX31DJwpLCw5O5
         3SyibxImTOLs/vjuR5tnlysIO7ZU4HbwLmIEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745930205; x=1746535005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SG3XByK8O/rE2KJ3fe819/e/kESRXNZtyTnahhTihHw=;
        b=Ro2sm1F2yGkOVDclsYbIaAKY9VAynv2SC87f8Q8G1SijkfLgR9DnuKV9IViviGbzLY
         M/NaI42XZseH52In3yALdDEuwf3Giy5XFt+v0MmgO4HtRDK7Ou10bshUiwK2ftjnFYww
         oYe/IdqpWQTQqxjXvm+OtxCJmH5+QolUaWv+/wXPWpbeVWEwBQut4a0eNbpYL/HiKrzb
         F147YG1BklC7waOOrI3BUFX9ijguXv0ktqbMb71YFQD4H/56/FnjBPuY03TIdz6n0zQ+
         8MCwd9HDRH+njZYE5Vx+bC+ZZR7bTKnR1kgshU9yCq+wPOGCg1AiPpdDj2T8A7MHGQxe
         Me8g==
X-Gm-Message-State: AOJu0Yzmwt7k5PUcMsQi27sI71PQyGBS/+vHT6B1PTuWbMPx6z7/z2A3
	QDhSdGibV2hegz5v7YrCNOsRojHKx0mwPLMEkbscbyhvthanwXc3pEGbNEmwjXz4cUX9AD/8Efl
	Q
X-Gm-Gg: ASbGncvwJqKwBa+rgRw2GtOm4kNqcgyQOl7vbD6H/CBaDdaR5pAFrxiQa0EftcZgh7O
	CBeZMRbxgPDeuSDG77xcjdDbqtqA9lqg0wE2s9iYRKqblhle2KPLhkYH3zIhxly3+X4yiZWT0Sj
	mAjBgAf7CFafnb7GYj0HU7kamkpg7Oh3cj2vOjlmVHQz5lAFKnV2RPFOmny0WbgEwDJL2mhZS3f
	QPOFwK2sbFaPcAG+iZZM7CHVTf5Kzl7CbXi5HNd6I5MJq8tLxnmKzLP54F7LQlHG8Yv0juRBaI0
	FwQWacvZsCD5qHIQJG+WN9j6lxvczFcyzkDG54byi9dpvnv9YPEn7FnskC869RnMLSnLaDeRyE6
	zTbdV/SOSi1TWCgov6k8trhSY
X-Google-Smtp-Source: AGHT+IFRYcwMBlrnXG6mGsIy2iZYIPAs374JJsrsfiQn6huWz5TkebNfnU51/H/jRJzXjlCjlk0egA==
X-Received: by 2002:a05:6000:4212:b0:39e:cbd2:9129 with SMTP id ffacd0b85a97d-3a0890a5178mr3180600f8f.10.1745930205129;
        Tue, 29 Apr 2025 05:36:45 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <JBeulich@suse.com>
Subject: [PATCH TEST-ARTEFACTS] (Re)add libgcc to alpine rootfs
Date: Tue, 29 Apr 2025 13:36:43 +0100
Message-Id: <20250429123643.230423-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It turns out that QEMU built in staging-4.19 (only) depends on it.

But, GCC can emit libgcc calls for arbitrary reasons, so include it
unconditionally.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Jan Beulich <JBeulich@suse.com>
---
 scripts/alpine-rootfs.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/alpine-rootfs.sh b/scripts/alpine-rootfs.sh
index 4d9da9c6fb4c..13d39e8846e7 100755
--- a/scripts/alpine-rootfs.sh
+++ b/scripts/alpine-rootfs.sh
@@ -10,6 +10,7 @@ apk --no-cache upgrade
 
 PKGS=(
     # System
+    libgcc
     openrc
     udev
     util-linux

base-commit: 036ffcafc8388d48f840815dd05e255042185d3d
-- 
2.39.5


