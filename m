Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 780BF7EB270
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 15:38:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632618.986872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2uYh-0003zc-VQ; Tue, 14 Nov 2023 14:38:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632618.986872; Tue, 14 Nov 2023 14:38:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2uYh-0003wm-Sj; Tue, 14 Nov 2023 14:38:31 +0000
Received: by outflank-mailman (input) for mailman id 632618;
 Tue, 14 Nov 2023 14:38:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6V1E=G3=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1r2uYg-0003vI-HC
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 14:38:30 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a023afb-82fb-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 15:38:29 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-9c773ac9b15so803904566b.2
 for <xen-devel@lists.xenproject.org>; Tue, 14 Nov 2023 06:38:29 -0800 (PST)
Received: from m1x-phil.lan (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr.
 [176.184.25.155]) by smtp.gmail.com with ESMTPSA id
 v21-20020a1709064e9500b009df5d874ca7sm5636254eju.23.2023.11.14.06.38.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 14 Nov 2023 06:38:27 -0800 (PST)
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
X-Inumbo-ID: 7a023afb-82fb-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699972707; x=1700577507; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7bjOOh298/gVm20zFogtcW7Ag9vjCtjGY9z1KnDRo3U=;
        b=DWY+OgqUa47v2r77qSjATEmqaZvwmpnPR63A0wPSgvWtgZem89riY6bcbhiBkaP6Ug
         vvGtQeHzkwM8AyyusI9CohijXN58HmuMHiLlJjSiTwmZIrsN7+XDn3mnForFEX44Kc+R
         mD6o5JaLPuKZHPKf2cIBKIEgLvWm1QXWSofZrFfnxXgm5FVJzoHrjrwqFKFY4xRlr10J
         ThGsVM3+f1g+Iu+6uTH0AhTLvoUqynNqxMiSBmZNDvKruhAgyY44+C3edkczx8xy/2pU
         M6HhJ9vYXRumjiAiduX8Pv50R4+RBe/3KwWJj/yLL0tS7rNgiiwV9I0c6JWOhsc0zv4f
         m+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699972707; x=1700577507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7bjOOh298/gVm20zFogtcW7Ag9vjCtjGY9z1KnDRo3U=;
        b=dnh37ygBpdzGKp1cavwUW7aQ4pQ9PLivWLMkxZCpIblNegmLZlVgv1As6Fk2ayTund
         5gseu4B6oWsi9KcMB2n8xbEbDHhHZq/0TVIY/nQdN+gzm8wjlTyBtX3oLfJ8JHHwUpHT
         8NMlQvpNmUOYGw1knrZm1zzx+dOhM4JtAlEd9dFsc7UH1CHcxCsi6HrEsIcnjm162i98
         vhH1kRJ+eTt0jaz0E0oRrMWnW7Vc3Z4V0U3k2d/vNDWKrwdg9oAUg48WoWhTJfD8WB9v
         T3PR8sHqqvjl4AhxLEYq5/YRxPWHswovPThgZAKQkjtx/6PY5mvjiXEKtYlCilQ+HozG
         aj/g==
X-Gm-Message-State: AOJu0YzX46EYNS3Z27SrrOdd3Zx/6L4pnppEsMRanRU6ABZV7WtgDE93
	FUK0uFr0uI/jLL3kChC5UHHTSA==
X-Google-Smtp-Source: AGHT+IGmC/f0NBuJq3lX6zmQbmq53YN/p3zW7ekfEdUOO96zzY8Hw2NKquJgt5a7Y31IS7pqqhAiDQ==
X-Received: by 2002:a17:906:e084:b0:9c6:64be:a3c9 with SMTP id gh4-20020a170906e08400b009c664bea3c9mr7562718ejb.39.1699972707580;
        Tue, 14 Nov 2023 06:38:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: David Woodhouse <dwmw@amazon.co.uk>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paul Durrant <paul@xen.org>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	qemu-block@nongnu.org,
	Anthony Perard <anthony.perard@citrix.com>,
	kvm@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Cleber Rosa <crosa@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>
Subject: [PATCH-for-9.0 v2 01/19] tests/avocado: Add 'guest:xen' tag to tests running Xen guest
Date: Tue, 14 Nov 2023 15:37:57 +0100
Message-ID: <20231114143816.71079-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231114143816.71079-1-philmd@linaro.org>
References: <20231114143816.71079-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a tag to run all Xen-specific tests using:

  $ make check-avocado AVOCADO_TAGS='guest:xen'

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/avocado/boot_xen.py      | 3 +++
 tests/avocado/kvm_xen_guest.py | 1 +
 2 files changed, 4 insertions(+)

diff --git a/tests/avocado/boot_xen.py b/tests/avocado/boot_xen.py
index fc2faeedb5..f7f35d4740 100644
--- a/tests/avocado/boot_xen.py
+++ b/tests/avocado/boot_xen.py
@@ -61,6 +61,9 @@ def launch_xen(self, xen_path):
 
 
 class BootXen(BootXenBase):
+    """
+    :avocado: tags=guest:xen
+    """
 
     def test_arm64_xen_411_and_dom0(self):
         """
diff --git a/tests/avocado/kvm_xen_guest.py b/tests/avocado/kvm_xen_guest.py
index 5391283113..63607707d6 100644
--- a/tests/avocado/kvm_xen_guest.py
+++ b/tests/avocado/kvm_xen_guest.py
@@ -22,6 +22,7 @@ class KVMXenGuest(QemuSystemTest, LinuxSSHMixIn):
     :avocado: tags=arch:x86_64
     :avocado: tags=machine:q35
     :avocado: tags=accel:kvm
+    :avocado: tags=guest:xen
     :avocado: tags=kvm_xen_guest
     """
 
-- 
2.41.0


