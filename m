Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 066439E1734
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 10:22:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847515.1262602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIP6b-0003Vi-5G; Tue, 03 Dec 2024 09:22:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847515.1262602; Tue, 03 Dec 2024 09:22:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIP6b-0003SM-2W; Tue, 03 Dec 2024 09:22:05 +0000
Received: by outflank-mailman (input) for mailman id 847515;
 Tue, 03 Dec 2024 09:22:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yzh2=S4=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tIP6a-0003Ra-1G
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 09:22:04 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0de70a18-b158-11ef-99a3-01e77a169b0f;
 Tue, 03 Dec 2024 10:22:02 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-53df6322ea7so9025667e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Dec 2024 01:22:02 -0800 (PST)
Received: from localhost.localdomain ([176.187.209.146])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa599908be5sm591969266b.140.2024.12.03.01.22.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 03 Dec 2024 01:22:00 -0800 (PST)
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
X-Inumbo-ID: 0de70a18-b158-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733217722; x=1733822522; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XItCJo5+ANEXJJ4rNbIonoA3BAW/mx+bgexv+wsAke8=;
        b=lYSS1UjsP3SYWBGfErLLhzadHBbklYQcYKcFvItkVEUX3hGMb+2E34viwr67ih07+z
         mipLjH5voNoB6jgTguovCh9AIewy8DV5dQxKZiVFcaL2H1EmWh/KsYukVK931etRlhyQ
         CREVUxIPW+FwjBpMhqDEyTnuphYzmvTBzWyPXbeH9MkPCwu/nddWGjzCDgepxSClUg2S
         4T79uQbjo+4Lpc2jzIFFAGjsg5tJ+025n9fmCC+TnJ/KRd0C/mcFk7Swxz9G/4O1/fO9
         30aGKHmQC21fi2UCrhutdBztO2v21vl2Ab59rdVhHHtqQy/wu0gLgtMZthbe/jv1pL9E
         58tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733217722; x=1733822522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XItCJo5+ANEXJJ4rNbIonoA3BAW/mx+bgexv+wsAke8=;
        b=m1pYas7CuNJtNzfFMeyli8csZPQUdIYrGeeisF/MocGscGWQACw2YqH7nBs1KaOx8V
         UoR6/8/5BL7lcxmbMWlKHvQHCy0lz3M7JrGiSR/tEve9e2r6amrcaatYC+vbYbYRPE2V
         K9NCYfvkRRwYGv4Tw1x/t4On10MjV2ECcrhZPWFpE/dOSQmbRY0hyvBWA/J4Q/rtcYko
         L+p8oN0mgDAkCcNg95iRVE/Ec5Ci8A0U1cM/nIlNGp0yzLJ8F0n4rKIaJrvvSNzHdVN8
         h5Afi119v1MB06nSZt9nHgLobcW2njFv8BRZiYXsac7xa63Fucb6piIBaXeaSsLdBbW3
         c7Pg==
X-Forwarded-Encrypted: i=1; AJvYcCVzCBrBNPS/MzsovcnOw57EZc93PC0r6fcs8kK4rZ/tN3GQJehybU39D8NskkIYOjiOaGZrZ0jh01E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwuQaE3/uYr2TkjkHsXNxXpWuyXsIgzxtjBSq3vrPsT5IUR2O2D
	ATxKLM6l5Eo6KG9OiVKeb4JlaINcvWFAtmiJNb5ykssZYMmwq8SdljDuqWZDWHI=
X-Gm-Gg: ASbGncuIdQO8Ghk/2R/vY9gOrYVZ77PRKoxvQdP/+5kbMU4iwqaBK2hUMkHHkZsckao
	+kBEuDc/9mPSyginkTzJJ+yOnvUbmshhh+PQg6YaksejTqsrqIcDrz4a20OLbch0IWCADhbui1p
	TiC2bYgeCZUvP3wYBHWlLUfzdQR9V/dMMdMrW16XruWM0eekyiAPYci/68lTQ7l7W3Fbd3nZzOe
	6bORDN0bIOmIrujvUIBCGwtveBJyj8NElp2pFdgSh2Rb9LFnOCQxQYa/VwmEqRs6WKFNqlj
X-Google-Smtp-Source: AGHT+IELVm7e97U6LHV1aSNR3lGVC9QDV3n0nCKk5HiuyFOrOWNT99UW+76qnuiTrgbzvwhK7O0Rcg==
X-Received: by 2002:ac2:5967:0:b0:53e:12f2:5e02 with SMTP id 2adb3069b0e04-53e12f25e19mr1049931e87.42.1733217721439;
        Tue, 03 Dec 2024 01:22:01 -0800 (PST)
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
Subject: [PATCH 1/7] tests/functional/test_ppc64_hv: Remove legacy '-machine foo,accel=bar'
Date: Tue,  3 Dec 2024 10:21:47 +0100
Message-ID: <20241203092153.60590-2-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241203092153.60590-1-philmd@linaro.org>
References: <20241203092153.60590-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since commit 6f6e1698a68 ("vl: configure accelerators from -accel
options") we prefer the '-accel bar' command line option.

Replace '-machine foo,accel=bar' -> '-machine foo -accel bar' in
functional tests.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/functional/test_ppc64_hv.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/functional/test_ppc64_hv.py b/tests/functional/test_ppc64_hv.py
index 312248bbfe4..536a433b993 100755
--- a/tests/functional/test_ppc64_hv.py
+++ b/tests/functional/test_ppc64_hv.py
@@ -138,7 +138,8 @@ def do_test_kvm(self, hpt=False):
         else:
             append = ''
         exec_command(self, 'qemu-system-ppc64 -nographic -smp 2 -m 1g '
-                           '-machine pseries,x-vof=on,accel=kvm '
+                           '-accel kvm '
+                           '-machine pseries,x-vof=on '
                            '-machine cap-cfpc=broken,cap-sbbc=broken,'
                                     'cap-ibs=broken,cap-ccf-assist=off '
                            '-drive file=/dev/nvme0n1,format=raw,readonly=on '
-- 
2.45.2


