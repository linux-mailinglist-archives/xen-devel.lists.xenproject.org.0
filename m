Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F23847EB2C0
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 15:48:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632658.987003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2ui3-0006Ya-9H; Tue, 14 Nov 2023 14:48:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632658.987003; Tue, 14 Nov 2023 14:48:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2ui3-0006Wv-6V; Tue, 14 Nov 2023 14:48:11 +0000
Received: by outflank-mailman (input) for mailman id 632658;
 Tue, 14 Nov 2023 14:48:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6V1E=G3=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1r2uaU-0003vI-LZ
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 14:40:22 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd63bcd8-82fb-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 15:40:22 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-53e04b17132so8865323a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 Nov 2023 06:40:22 -0800 (PST)
Received: from m1x-phil.lan (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr.
 [176.184.25.155]) by smtp.gmail.com with ESMTPSA id
 e29-20020a50d4dd000000b0052e1783ab25sm5343752edj.70.2023.11.14.06.40.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 14 Nov 2023 06:40:21 -0800 (PST)
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
X-Inumbo-ID: bd63bcd8-82fb-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699972822; x=1700577622; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xWc7O88tTfL+IROUfXsM+NSd2X7VWDO4aCdpc797HXc=;
        b=B2w1KnhFgmoFbUuLJV0Y9OjkgLXehu40+UFLinv4nNzXhki1Rzu4xRiQ0dA2WLrqo9
         H3cYkQE09bKlMYMwjt7xFHW3CkGHh7pJRbjCIUk5r0qJurzWvL8Dow75sFHGoZ63qO7d
         hL27YHYVlEe75dkuFOBQX6Qbyd0N9l12GFfQhT5sgcKYjpV8UWxmy1KAz0OR7w6xgu1K
         H25EWeLCpglMoj4RsNSRgLZ5QGZ4VsZT0nIrYTqu3iXFxhZ8CRnYp31YbhiQFnmFxCRR
         ocQfxfmY26Nkn95m/wgxCaVvpb0GNAZSZZomFIkYxELOi41d7LERU4Ssqs2oyNLr9ltR
         E+bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699972822; x=1700577622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xWc7O88tTfL+IROUfXsM+NSd2X7VWDO4aCdpc797HXc=;
        b=N6fCDiaBfpRZItF30ril9NYb3yLooC8QH23ip5vp9/gMamTB3HsY59dURH8zMd3ON3
         /RDiOMdsnvK4cq8kqBW2SAopsuY7UKCdFgAA1vJN3NtxSp4v7nDAHhmPTcY5WSRN6f/W
         boneHAIDuNR5rdTsIJzio3UzSyW51XdBWfW3aoLOk6YreqmjUG/pkqaNqzhXnwlLiWmh
         FCkzmk/MPN5VfYgRo7pIMA6xYM7jYtW3UxTCJYJ/10VK0QJogxF53ojAVTfFO8MeGT6a
         E1MkSUbZTDxMQdbNbp1Qv8JFE1bGJBWQNqwCU15a5i5VmS7xMW3UZ5rs1DLvT1X5irmW
         wJBQ==
X-Gm-Message-State: AOJu0Yy0ZP65stN5fNrs8nVL41y+0Bk3QQN4KF5UsaPwECcKmXDYJqO4
	UadNR5iavyuBsnsZpiEy8L2Pvg==
X-Google-Smtp-Source: AGHT+IHNrn5T4boQ0NzVhZdNm2rxcLbpt1HdZaO6IACtyCbzFgVV5y7RIxXgNNvQBcNbwz/XH0TntA==
X-Received: by 2002:a05:6402:518e:b0:543:5c2f:e0e6 with SMTP id q14-20020a056402518e00b005435c2fe0e6mr7401790edd.17.1699972821905;
        Tue, 14 Nov 2023 06:40:21 -0800 (PST)
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
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH-for-9.0 v2 18/19] hw/i386/xen: Compile 'xen-hvm.c' with Xen CPPFLAGS
Date: Tue, 14 Nov 2023 15:38:14 +0100
Message-ID: <20231114143816.71079-19-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231114143816.71079-1-philmd@linaro.org>
References: <20231114143816.71079-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

xen-hvm.c calls xc_set_hvm_param() from <xenctrl.h>,
so better compile it with Xen CPPFLAGS.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/xen/meson.build | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/i386/xen/meson.build b/hw/i386/xen/meson.build
index 3dc4c4f106..3f0df8bc07 100644
--- a/hw/i386/xen/meson.build
+++ b/hw/i386/xen/meson.build
@@ -1,8 +1,10 @@
 i386_ss.add(when: 'CONFIG_XEN', if_true: files(
-  'xen-hvm.c',
   'xen_apic.c',
   'xen_pvdevice.c',
 ))
+i386_ss.add(when: ['CONFIG_XEN', xen], if_true: files(
+  'xen-hvm.c',
+))
 
 i386_ss.add(when: 'CONFIG_XEN_BUS', if_true: files(
   'xen_platform.c',
-- 
2.41.0


