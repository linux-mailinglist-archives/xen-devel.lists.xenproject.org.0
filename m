Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D270A3A2E1
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 17:32:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892059.1301078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkQWH-00031u-Cl; Tue, 18 Feb 2025 16:32:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892059.1301078; Tue, 18 Feb 2025 16:32:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkQWH-0002zX-A6; Tue, 18 Feb 2025 16:32:25 +0000
Received: by outflank-mailman (input) for mailman id 892059;
 Tue, 18 Feb 2025 16:32:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vlVU=VJ=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tkQR7-0004Eu-AW
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 16:27:05 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2fc91fe1-ee15-11ef-9896-31a8f345e629;
 Tue, 18 Feb 2025 17:27:03 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4398738217aso20634445e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2025 08:27:03 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4398a44264csm48848305e9.25.2025.02.18.08.27.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 18 Feb 2025 08:27:02 -0800 (PST)
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
X-Inumbo-ID: 2fc91fe1-ee15-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739896023; x=1740500823; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C8Njo+qOXhV4Sx/ta7KiauuSaoi71X4Ex5TI1JyVyyI=;
        b=AYtDsKwhxS9Ob8XA4G4+zy8Zub/4CzVT4CajUFgYBDmFWY3dCR2OPt1Ey5dC8il4lW
         +ZGIRAW2qK/lPmEhjkAixQRUuUM0cwAmeqRJFDybtT3+wIgqL7jPuMKx83glrLIiHP1l
         eRkELE/QRHgy/BTVnQRwMSzRhFOXGo3688U6QAaOT0jgBG7z9PpjpPWaw01SPSEvCGWk
         pKsmpZD9vXx3gQWTrKlRA8eOg1/ONE2ewHm7oBJCRpfr530dJEOpNJstN9rYEHSg9gbD
         zsmy65gqmprtFvAR6MVhZZZUErxDvieAvAuJ1uy7zdtAZ6d4jILFd9/dtSqSaQCeuFuz
         d7IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739896023; x=1740500823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C8Njo+qOXhV4Sx/ta7KiauuSaoi71X4Ex5TI1JyVyyI=;
        b=F8jr+qm2n5bp8AyYWA/wJJ46A3tDGKx2uBY7IGYDti8IFwWrMq0oSLJ8KNlp3SnAh/
         j3ELm2Is81dULFLFusJ1jfxYPtPtCn0SlRgGhNAZ4T9/1LziOJ4qJ0VONXy8vT7F4upW
         TxoDaIoffnESiV+hB7EcjfcmgEYN8BC69ajwxJVNnh40JzrJr5ngAukJOh8NdC5YlKNm
         SACCV/yZfDKlRwH4+Yh75ZIyZ99oWGiA7+G3dSu2VF37cvN+UV3ljwWh4NFgcPpv4GMO
         BtXS0n9N95Z3Vom/v9LNqOqLknR4Di3JWiBRpDtYTkS1gMiu4Eyor3WmgbDduCqDX6F4
         jX9Q==
X-Forwarded-Encrypted: i=1; AJvYcCW//xaSFMvpcPSpfq742w7IoVJpcXz+/hfMu1O2ll9ITXsGYiOH6/Ljg+UJqa7ZUvqbxhqThZVqPNg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwkXnbJcSAyJPsr3iIzEsAT/cGzCKfWsOcyEiLR4FtfOXneLI8C
	bfBEYvCpCSQGrV3e7pOVCcNbhMlTApA7dq9JmVO+r97X7wxeCm6/wM7RNPyMyjs=
X-Gm-Gg: ASbGncuy4VbPRO59bJjs5RwvEHT6QeSRnouXBEUAEo178hYbsK8bG5RjrgPBOnef/hu
	xV8lUtLgCWLboqO9rgWAj1Mm62tL9/h0AKz0j42sgHRmrVmvCh81MIUKNC0iZh16+iD/SzE4ch6
	e6K7Rh+6hc7CEq5pdI7cXwo0QDigFomhWByOvXo80jKZm6d//SVVIZe7+gSdIfYQQHRlNWgoEsb
	21UrLSWFeIzjdcux9g+IclHUNM0Wl441+jSjNtcwX3KY0oNnSHP1h4AxMZ9tvBuEQORQvvTWGwd
	l+KpW2bOOp5o+JqvGRjxxsu4PVRckwR+58R28NwiYd4VvfACdEfRTDfOOtwnLLvM1g==
X-Google-Smtp-Source: AGHT+IHNicWVQy20xmctK+WaMFhMn6/Qp3O5JrlTfAC9l8cTOsGhr1pxbbnLyADgvxXG36sDv5n1uQ==
X-Received: by 2002:a05:600c:4f55:b0:439:95b9:91fc with SMTP id 5b1f17b1804b1-43999d8b49dmr3064455e9.12.1739896023034;
        Tue, 18 Feb 2025 08:27:03 -0800 (PST)
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
Subject: [PATCH 8/8] meson: Remove support for Xen on 32-bit ARM hosts
Date: Tue, 18 Feb 2025 17:26:18 +0100
Message-ID: <20250218162618.46167-9-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250218162618.46167-1-philmd@linaro.org>
References: <20250218162618.46167-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Per Stefano:

  For ARM 32-bit, I do not think we ever had many deployments,
  as most are 64-bit. Even when there are deployments, they do
  not typically use QEMU, as QEMU is less important for Xen on
  ARM compared to x86.

The QEMU project only test to cross-build Xen on Aarch64 hosts
(see 84eda110792 ("gitlab-ci: Add Xen cross-build jobs").
Since 32-bit host aren't tested, simply remove the support there.

[*] https://lore.kernel.org/qemu-devel/alpine.DEB.2.22.394.2502031438170.11632@ubuntu-linux-20-04-desktop/
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
While apparently running Xen on 32-bit hosts isn't straighforward
anymore (see [x]), we don't need to remove it ASAP, it is already
in the deprecation queue since commit 6d701c9bac1 ("meson:
Deprecate 32-bit host support").

[x] https://lore.kernel.org/qemu-devel/173d18bf-f68c-4bd5-b822-abb1c1f0c51b@suse.com/
---
 docs/about/removed-features.rst | 5 +++++
 meson.build                     | 3 ---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index c6616ce05e5..f6ea53acc8b 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -969,6 +969,11 @@ MIPS "Trap-and-Emulate" KVM support (removed in 8.0)
 The MIPS "Trap-and-Emulate" KVM host and guest support was removed
 from Linux in 2021, and is not supported anymore by QEMU either.
 
+Xen on 32-bit ARM hosts (removed in 10.0)
+'''''''''''''''''''''''''''''''''''''''''
+
+Untested for more than 4 years.
+
 System emulator machines
 ------------------------
 
diff --git a/meson.build b/meson.build
index 8ed10b6624e..7b80d8dff09 100644
--- a/meson.build
+++ b/meson.build
@@ -308,9 +308,6 @@ if cpu == 'x86'
   xen_targets = ['i386-softmmu']
 elif cpu == 'x86_64'
   xen_targets = ['i386-softmmu', 'x86_64-softmmu']
-elif cpu == 'arm'
-  # i386 emulator provides xenpv machine type for multiple architectures
-  xen_targets = ['i386-softmmu']
 elif cpu == 'aarch64'
   # i386 emulator provides xenpv machine type for multiple architectures
   xen_targets = ['i386-softmmu', 'x86_64-softmmu', 'aarch64-softmmu']
-- 
2.47.1


