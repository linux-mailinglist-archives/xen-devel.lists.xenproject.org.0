Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81808A3A2AE
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 17:26:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891996.1301019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkQQd-0004Ye-By; Tue, 18 Feb 2025 16:26:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891996.1301019; Tue, 18 Feb 2025 16:26:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkQQd-0004Wd-8h; Tue, 18 Feb 2025 16:26:35 +0000
Received: by outflank-mailman (input) for mailman id 891996;
 Tue, 18 Feb 2025 16:26:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vlVU=VJ=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tkQQb-0004Eu-Bi
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 16:26:33 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ccbd521-ee15-11ef-9896-31a8f345e629;
 Tue, 18 Feb 2025 17:26:31 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4396a24118dso42201885e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2025 08:26:31 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439941bd54bsm23641345e9.11.2025.02.18.08.26.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 18 Feb 2025 08:26:30 -0800 (PST)
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
X-Inumbo-ID: 1ccbd521-ee15-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739895991; x=1740500791; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WMi6HKMJEZy6PJobbwMTCNEj8KX/6SAXVrdJz11g72k=;
        b=ypBtCKv9yB9Y5HmWlMr3pV9Z5eXTwJBseftpHpcn+1Z/daw/PfB2P80H8Ksnk90ZvJ
         V837iOoRF20BRkJRQL5cGbphlXDe92NIPfRnBvs5UHnbamoCbF62rXvn+E/hwtbD7ro/
         sF7TLi8fvlRfWGwp2LMWC0+Zmwp4D505wGnodCtNsJVAq9N9O6Cry9vyKEa9PNDYoF7j
         WNMfEmxqvcts5BdoWYOTEshO539TU7dqm9zywv8Bgqr99VjsuQZUxT0S8wOZh4AaANmp
         a2xSZL0OPA1tg1ZCSJN+eP6Z7tDmlJ6UvBwouVIeo8PE3cppXh6YLb1zgapicqYBzmwo
         JakA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739895991; x=1740500791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WMi6HKMJEZy6PJobbwMTCNEj8KX/6SAXVrdJz11g72k=;
        b=L/J+AZNKsWmXNusHRv+LyPvbJBnEvqe/gmahmlIrrm161BkIJ2CwhlMik0pk7fUzZq
         RymsoQoKCpNzbmrg+QWZv/DbbqojnobeUh5YDFwl1mo5mET+YLU/dSHzdBuYf7CUUQ24
         LlNd2eiC49y63DhQiHojFVRMnnMJNGL9SjQJEbiUyg0wrMToNI0IniZo9p+4tKrMjFdb
         VWFtoAAYLpK7lRPCRx0UOycl9SIbD/N+DNS5jAoiIn1nsmRJ831hiU9HiJm96qOyfZpZ
         DJlfkWOUNCI7069wJ+Qv+ctZHrhYZIG/8jaTWVxVCIy/2dpTXuSYKJKvx3pDp7IZxhi7
         FpBw==
X-Forwarded-Encrypted: i=1; AJvYcCUDEZilh6hqw1ROmNZxFLdT6KeFJQkyLLRWdamcfMHH3ndIp8pxYdvAL5BycpNsUbckzelYozUh7Z8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxYk33CUVnbcfaoRYTR4+8/hwfgKrpj+UIKE7p/YIPVW0FDGWY7
	hhVbSIUxnFLlvTRefJln7Dl4C57O9qkvOHGESptky0+eoYJH1ApLrukn5ltXfj8=
X-Gm-Gg: ASbGncv6psxev2a/Dl3fj1EX6rjzeA+hDCnD7/m3qqZ4v9AMTLvYoLNLR2mfixd2/Uv
	cYfYCRh6Pl99tF+prBQbqoVGnxx4f+Hrh7UHh8pMmcOmBTCYU5cDqUWRH20aRAfZ8sTg0SvUKQR
	Y7rn1pIQxDqN5FUnmz4dNoCybzWrZv5LrfrccCS76tth4irqwor/hlPuNESpsAA4nh2X4KfHZtY
	rECXwU+8XAL0DB79hJEdiu8qN5e06EHi++K7n4hrYHPnJ3OqXEZfbAgp18gbc1VG+0BAuZCh2U4
	lX6yYpd0lx/W7Img8w+p31sjnoZREK2wa2RQyPb0kBIl0XrHUczGVcysF2EvGj7xKw==
X-Google-Smtp-Source: AGHT+IGDR/hUW2+zIj2HthGePLoD6GAPRVrHbOwKJDDnZXahEAaGlBqwa3h93T0HklL55mOUPzcfKw==
X-Received: by 2002:a05:600c:5124:b0:439:5da7:8e0 with SMTP id 5b1f17b1804b1-43999da82bbmr3503685e9.16.1739895991236;
        Tue, 18 Feb 2025 08:26:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Vikram Garhwal <vikram.garhwal@bytedance.com>,
	Thomas Huth <thuth@redhat.com>,
	Jan Beulich <jbeulich@suse.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH 2/8] hw/arm: Do not expose the virt machine on Xen-only binary
Date: Tue, 18 Feb 2025 17:26:12 +0100
Message-ID: <20250218162618.46167-3-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250218162618.46167-1-philmd@linaro.org>
References: <20250218162618.46167-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since the Virt machine is useless under Xen, do not even
try to build it there.
A Xen-only binary now only offers the XenPVH machine:

  $ qemu-system-aarch64 -M help
  Supported machines are:
  none                 empty machine
  xenpvh               Xen PVH ARM machine

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 256013ca808..e5f4b1d84d3 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -2,6 +2,7 @@ config ARM_VIRT
     bool
     default y
     depends on ARM
+    depends on TCG || KVM || HVF
     imply PCI_DEVICES
     imply TEST_DEVICES
     imply VFIO_AMD_XGBE
-- 
2.47.1


