Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5040A22BC4
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2025 11:38:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879442.1289644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdRvS-0005DE-OS; Thu, 30 Jan 2025 10:37:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879442.1289644; Thu, 30 Jan 2025 10:37:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdRvS-0005At-K0; Thu, 30 Jan 2025 10:37:34 +0000
Received: by outflank-mailman (input) for mailman id 879442;
 Thu, 30 Jan 2025 10:37:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j2sA=UW=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tdRvR-0005An-49
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2025 10:37:33 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 332011ac-def6-11ef-99a4-01e77a169b0f;
 Thu, 30 Jan 2025 11:37:27 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43635796b48so3581915e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jan 2025 02:37:30 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e23dea58sm18398835e9.15.2025.01.30.02.37.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 30 Jan 2025 02:37:29 -0800 (PST)
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
X-Inumbo-ID: 332011ac-def6-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738233450; x=1738838250; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vJAhgdvuaUzoP5rhYvCoy1R4+PFzIiikeM9bnH6e+vE=;
        b=YEfZengSZCFcZL1qrkZRN+gJoN4pTU29mOKUZesOJ7VAK6C4CnioO5xPRH+wMCcadL
         ooLal/sDy0iciJuv00/t74a3i4inw1FMmLyEdluxvV6MUu6fnkjTwp189y7Q2qKm5jSL
         Fnfp4Fuz9bypRCNcIrQ9bRW891ISPRQCOXVTnqkloIHDvRM5+SYWAslxBEfVlr3IVERa
         bFwJCmpgro62gvTCauD186/F0U2TggiJ5QkK67dyEnyIIwLviaY0nQuDRCHIcWV+FyoZ
         1xW7zPDJGcWEPFiqSc9gTKbFuADDkgw0t1SttJ11O9vEgYu28H6AEiwjc6unz8RSu2Fs
         vISw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738233450; x=1738838250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vJAhgdvuaUzoP5rhYvCoy1R4+PFzIiikeM9bnH6e+vE=;
        b=D2RnSgSm+we1irzAayliciPc7en+WLJq1Y86o2SQurd8WCHlooix8swKZmimFE//1Y
         NTU5mR8jHKRa9Wf2KFEvnINStSeg+KjbkYULSbUjbNP+X+dEiFZcjH+kNy4Xn198xGxj
         dl10p2BkDcE6jDRHqji3HUttBneDA0LygXHmVEoV6OnlfM51hfZ2CxcLfNbrf1LAvvym
         v3W2jrD3/cN9Z05uDw9M7S9KOKn8svXS4IpeZCOdKzkEkJgHwufgaAM9Ui2Pb40Czp7i
         H9WpJWGEs/HIL4+X7duyLHojtM36Ztk+qU4QiPHiI4ogPWu064tq/x1WrcOADjCc4t8/
         z4Vw==
X-Forwarded-Encrypted: i=1; AJvYcCXvCH9VeQGdEax3gaWOqvValZ1YlDaHywT+muAoRjqQ+1gN7N5cXbn5Riis2u9FfTMQpuzQq8f3P+w=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw3x1fxQcMRIm2rnG51ym5gpAkKJTRYoUy8rPTFHPOaO/w+GTPV
	mthiHEev+ajubeGxwOdN4XKYhboH9NyQ/E6QXExOOxCJYxvewYn7QZCYLINjaI8=
X-Gm-Gg: ASbGncuhXXbzHFwRyifW24v8gzyt9G8Qs/7kaAHgTaFiJlukRxyKnLJvTLpHVHOOj0r
	2JBRCM8IvgtYli+pNaXhJkwu0b/Ougtjtaz+mJisZDZUWyEaYWOQDsFvMmTUM7k8AlnqPJ262qi
	Zr6iMWGFj8hSETPqMWMNI8VeubNpgQKF7wZvFbOmliOTNHX22VtEZ5w4JL8npjqFv+zImsBk24/
	mD6cMSSxGEpaYuILXQwrgBAs3lXE6CwF92Gdnp6YD/xDAjohgr7t3hA7lhewlb3x5iDR9wc+VBa
	G2gu5tyVVqgrnxPin1BRpLOOk8c5SFw8aYQ+d02oI7WDtqXqL1LiHQQq2cHCiodT0w==
X-Google-Smtp-Source: AGHT+IGK3HLzliP+MhxUr7psmyi6DTayWfInVMx+k7v2EncKNgyMI2rVs1CJKECTEksKE3IWOylWxA==
X-Received: by 2002:a05:600c:3d0d:b0:434:ff08:202e with SMTP id 5b1f17b1804b1-438e15ee1cemr21636335e9.8.1738233450329;
        Thu, 30 Jan 2025 02:37:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Bernhard Beschow <shentey@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Fabiano Rosas <farosas@suse.de>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	xen-devel@lists.xenproject.org,
	Laurent Vivier <lvivier@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 0/2] tests/qtest: Make qtest_has_accel() generic
Date: Thu, 30 Jan 2025 11:37:26 +0100
Message-ID: <20250130103728.536-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

(Series fully reviewed)

Since v1:
- Use g_strconcat (Akihiko)

In preparation of running QTests using HVF on Darwin,
make qtest_has_accel() generic.

Note, this also allow running other accelerators such
Xen, WHPX, ...

Philippe Mathieu-Daudé (2):
  tests/qtest: Extract qtest_qom_has_concrete_type() helper
  tests/qtest: Make qtest_has_accel() generic

 tests/qtest/libqtest.c | 110 +++++++++++++++++++++++------------------
 1 file changed, 61 insertions(+), 49 deletions(-)

-- 
2.47.1


