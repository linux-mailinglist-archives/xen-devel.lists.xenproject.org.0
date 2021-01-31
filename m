Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 154FB309CA1
	for <lists+xen-devel@lfdr.de>; Sun, 31 Jan 2021 15:18:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79294.144377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6DYT-0000rz-M8; Sun, 31 Jan 2021 14:18:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79294.144377; Sun, 31 Jan 2021 14:18:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6DYT-0000rL-Hv; Sun, 31 Jan 2021 14:18:21 +0000
Received: by outflank-mailman (input) for mailman id 79294;
 Sun, 31 Jan 2021 14:18:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jslU=HC=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1l6DYS-0000oq-0a
 for xen-devel@lists.xenproject.org; Sun, 31 Jan 2021 14:18:20 +0000
Received: from mail-wr1-x435.google.com (unknown [2a00:1450:4864:20::435])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2e185fba-bd13-48ab-85a0-32c31c481b91;
 Sun, 31 Jan 2021 14:18:19 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id d16so13711826wro.11
 for <xen-devel@lists.xenproject.org>; Sun, 31 Jan 2021 06:18:19 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id r13sm19361075wmh.9.2021.01.31.06.18.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 06:18:17 -0800 (PST)
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
X-Inumbo-ID: 2e185fba-bd13-48ab-85a0-32c31c481b91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=donqcXl7R+CymjCL8vc7v5IAilQU7H4mg0fNs68sCzA=;
        b=EL5L4ND35kWNG1I9b8z6kaSTxjuZlsxrL/gpCp3XKMsxXKuAviwff9mPbRwbvpb+EI
         JPGDHK3wvuulr3vBjWYj6XCKarU+KI8z9GK2YilFpVDuPGagHnSnlrAine3jtXDxdOCA
         n8YqAeS2QFNyyv2f66tg8pPROFQG19CpTi+9tVK1qGUiEfP3Xddc69G0Go0ma4jUYIiO
         N/RwCoTcHbtUQWiqTtkxUg/bcDsJiH6TcEW52YKAwbCHCLOtZIV0mt8fcASmiFdvGjWl
         QsNtU4sX5534e1nsWHqLUar5y3g2Q8g6k9AZnoG1G28tBldETFrYvvmgoAFikTCjfS7K
         FD/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=donqcXl7R+CymjCL8vc7v5IAilQU7H4mg0fNs68sCzA=;
        b=mHy1hCpTPLf77tHeWc0XQwWmqsGsH2dsC4fi4R4FXfB9K8cPf7LDUg2QnHyGwsbSDy
         WjDHDzg8/sUrJdi8O18yb0mRjg4A2dtkWfc7GM2ipLDLlMUHPgyPgQbg6k0szQBI9fVZ
         OR4HJucQaofkboyLQ3pSYGbbyWuIULjRlncWbQ3S9XBjMkMvKkiecJp2i1hbtU/k9vOL
         n9gA7ujgQb0WdcJGLynEytYXvYHCwQetdn1YxEUQaKb0vifuZzo7yR3yWN1hjAv6RKC4
         zYjxPQFXsIC3+4Je4CzRw6OdZ5wp1naWMZlTT3mNO5RKwPnFtkzzywhVCsXsJMhaoOZD
         dhdA==
X-Gm-Message-State: AOAM533k9mDUkKTW3qY3YwsCt8uahJQtQwlqmNr+UxikYcgoD6P6gaZz
	vHFbBzW/ZvQBxnHTGMKotkw=
X-Google-Smtp-Source: ABdhPJyBay95tlHd1UGHaPoVXUhxbE+HNEY0tZvPa16UvxrzZf4mNIYgk1tojlQ8w0VCrO1mzI4lnA==
X-Received: by 2002:a5d:5549:: with SMTP id g9mr14592028wrw.244.1612102698480;
        Sun, 31 Jan 2021 06:18:18 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paul Durrant <paul@xen.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	Anthony Perard <anthony.perard@citrix.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 1/4] meson: Do not build Xen x86_64-softmmu on Aarch64
Date: Sun, 31 Jan 2021 15:18:07 +0100
Message-Id: <20210131141810.293186-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131141810.293186-1-f4bug@amsat.org>
References: <20210131141810.293186-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Xen on ARM documentation only mentions the i386-softmmu
target. As the x86_64-softmmu doesn't seem used, remove it
to avoid wasting cpu cycles building it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 meson.build | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meson.build b/meson.build
index f00b7754fd4..97a577a7743 100644
--- a/meson.build
+++ b/meson.build
@@ -74,10 +74,10 @@
 endif
 
 accelerator_targets = { 'CONFIG_KVM': kvm_targets }
-if cpu in ['x86', 'x86_64', 'arm', 'aarch64']
+if cpu in ['arm', 'aarch64']
   # i368 emulator provides xenpv machine type for multiple architectures
   accelerator_targets += {
-    'CONFIG_XEN': ['i386-softmmu', 'x86_64-softmmu'],
+    'CONFIG_XEN': ['i386-softmmu'],
   }
 endif
 if cpu in ['x86', 'x86_64']
@@ -85,6 +85,7 @@
     'CONFIG_HAX': ['i386-softmmu', 'x86_64-softmmu'],
     'CONFIG_HVF': ['x86_64-softmmu'],
     'CONFIG_WHPX': ['i386-softmmu', 'x86_64-softmmu'],
+    'CONFIG_XEN': ['i386-softmmu', 'x86_64-softmmu'],
   }
 endif
 
-- 
2.26.2


