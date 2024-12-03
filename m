Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DAA9E173A
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 10:22:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847528.1262631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIP6r-0004fz-S0; Tue, 03 Dec 2024 09:22:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847528.1262631; Tue, 03 Dec 2024 09:22:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIP6r-0004dO-OH; Tue, 03 Dec 2024 09:22:21 +0000
Received: by outflank-mailman (input) for mailman id 847528;
 Tue, 03 Dec 2024 09:22:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yzh2=S4=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tIP6q-0003Ra-Tf
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 09:22:20 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 17d24f65-b158-11ef-99a3-01e77a169b0f;
 Tue, 03 Dec 2024 10:22:18 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-53df6322ea7so9026150e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Dec 2024 01:22:18 -0800 (PST)
Received: from localhost.localdomain ([176.187.209.146])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5997d5625sm600599666b.63.2024.12.03.01.22.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 03 Dec 2024 01:22:17 -0800 (PST)
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
X-Inumbo-ID: 17d24f65-b158-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733217738; x=1733822538; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Z0cleQPrNy9NjZu27Yx3P0Ha1Flw6gQBqfbwRAF2Ak=;
        b=L+jBn8stAqUjaEbbEf4vB8yfYGzJJJVAcNXix5dEo5HGqlgHH8Jov0q896K/pozbiG
         l3pIYZwHkoMdDk2EIYGEgkTFArCH03SKBNsLzOXPePt9YhBU+HmezMOVF1s00Jq74aZ5
         0oVPBd4EHda8EEO8DglNbbBPuLNGncVV1hqC2WwCjq7T6AHv+JMrQRkL4YGtP9ZSGBFB
         5kIQo3fFN5hSc3690k46eQFbGqVxmBoyDn6ESDBTrkUfMLMM91GGJoptogzFOJKLsLyZ
         vzweAbPFa1ST4G52gMprYYX50l3vf6Plfufp2jJQRFHITDG0V/ld3gUZD+1axdV1ZJOy
         IcJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733217738; x=1733822538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Z0cleQPrNy9NjZu27Yx3P0Ha1Flw6gQBqfbwRAF2Ak=;
        b=qFWz0+6SSNTyuXrV99S0DTzez8pcUNC8uuYI4na/fLMOIGKM5q7TV8ox+C8N+35XHB
         jCf3I+viyMXdHtc1l2XjOP8cwhnuP1/mqnsihGIH/VZiSstkfOYH7JxW6q8CUr8RSuqY
         iQhax0jUdNy4ddLdzQ1OoXRxyG3Rh3LOwxM7elxuNr7rfyJ5abrwVaPF3nR68+ge2Z/M
         WOw+lK/DbI7yeic6sYmrkasqMfnUB3maLexBM+aREeZ1tYI8WPQy0RusYA46llvVZXu3
         pxCLLsv8hiA4e+KElyRFJSp8yWf/NMMIwR0ea61ufHQKljofJIGtIbVg1n82WS6JGO7g
         pPJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXrZbqTtK8KxFATaIoMCMHbgovLeNV8oTNDBXpMQ6X+evXHZxLcgVwjaa3s6HByjOQc5VFKLd6Uu8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxPSTKyrjE5TvlCmi+kgRWfRnC+oL6kwVJ/8IDp7RvwtuZdgL06
	RukmDuT/ehNqZcY46udklRBm2oE9Fdvy0UWy7nMBYcPtF1gyXio2SXn3uGXSkfc=
X-Gm-Gg: ASbGncszaOeOErH+GiqGxySOuM3hQZqWnnY0mFSKBzsEtVyeLqQ6SzXqlq1Z37HgMcv
	zaF6nSCUra42sS26Ou+dd9w5v5cuYAnV5Y5z9+Zt+VF7lO17OYxth/zbjTJVNJiyi2g/ZTcpB3f
	kHg+iC+zAT4N3B3iwWcKCm7HzNk4vi8Et32n0PAuzh6xWaY+ek7eEgg6hhixO4hELjsNWN24AQV
	nNQSEQtha/X9WLCHO7/WLFhAdeggjtB9LMDDLCtkANo3jicSUafiVAujXkS6FeLIzsYT7pV
X-Google-Smtp-Source: AGHT+IFKXdzCHgoYrbBgxEetwk2wWIxXomwv6Wa0ZHXf5sB1MUtHIOwB2t+dSu80nFR8vz7SoiVkxQ==
X-Received: by 2002:a05:6512:124f:b0:53d:ed0a:8113 with SMTP id 2adb3069b0e04-53e129fef1amr1251543e87.14.1733217738255;
        Tue, 03 Dec 2024 01:22:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	xen-devel@lists.xenproject.org,
	qemu-ppc@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 4/7] scripts/device-crash-test: Remove legacy '-machine foo,accel=bar'
Date: Tue,  3 Dec 2024 10:21:50 +0100
Message-ID: <20241203092153.60590-5-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241203092153.60590-1-philmd@linaro.org>
References: <20241203092153.60590-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since commit 6f6e1698a68 ("vl: configure accelerators from -accel
options") we prefer the '-accel bar' command line option.

Replace '-machine foo,accel=bar' -> '-machine foo -accel bar' in
the device-crash-test script.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 scripts/device-crash-test | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/scripts/device-crash-test b/scripts/device-crash-test
index da8b56edd99..2b139e29ba0 100755
--- a/scripts/device-crash-test
+++ b/scripts/device-crash-test
@@ -295,7 +295,10 @@ class QemuBinaryInfo(object):
         self._machine_info = {}
 
         dbg("devtype: %r", devtype)
-        args = ['-S', '-machine', 'none,accel=kvm:tcg']
+        args = ['-S',
+                '-machine', 'none',
+                '-accel', 'kvm:tcg',
+               ]
         dbg("querying info for QEMU binary: %s", binary)
         vm = QEMUMachine(binary=binary, args=args)
         vm.launch()
@@ -358,7 +361,9 @@ def checkOneCase(args, testcase):
 
     dbg("will test: %r", testcase)
 
-    args = ['-S', '-machine', '%s,accel=%s' % (machine, accel),
+    args = ['-S',
+            '-machine', machine,
+            '-accel', accel,
             '-device', qemuOptsEscape(device)]
     cmdline = ' '.join([binary] + args)
     dbg("will launch QEMU: %s", cmdline)
-- 
2.45.2


