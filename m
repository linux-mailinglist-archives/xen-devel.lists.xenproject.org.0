Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9985A3A2B9
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 17:27:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892029.1301069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkQR2-0006s7-R7; Tue, 18 Feb 2025 16:27:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892029.1301069; Tue, 18 Feb 2025 16:27:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkQR2-0006pU-O5; Tue, 18 Feb 2025 16:27:00 +0000
Received: by outflank-mailman (input) for mailman id 892029;
 Tue, 18 Feb 2025 16:26:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vlVU=VJ=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tkQR1-0003yu-2r
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 16:26:59 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2cbd687d-ee15-11ef-9aa7-95dc52dad729;
 Tue, 18 Feb 2025 17:26:58 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-439350f1a0bso34734545e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2025 08:26:58 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439941bd54bsm23652215e9.11.2025.02.18.08.26.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 18 Feb 2025 08:26:56 -0800 (PST)
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
X-Inumbo-ID: 2cbd687d-ee15-11ef-9aa7-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739896018; x=1740500818; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LY1yJOtl399lZ4AXgftr3zMqyDj58QmxjVcxn7qswe0=;
        b=TCQerYR+4TBAt11bIGDudigKkAKdBszbAUNNh4Cjii5mELuq0vTBgr0Gompb1wyHd0
         uFIlFQvhp/BDUFDw7mFms5QqpBASdQRCXaBfFtcK588Se1YCOmaGYULefUgJVIvEJwGN
         6SkzThZcdwzepHAz24NZf3krWLNcUufbLtA2JZ5tAh3c4Ko53MXP4Qp0s73d/VT8sUxK
         0UKOljPDYyBRgvzUdDExKE7tEop2iNxh+aKGZ6TC0jW7QmKdCFFr4qE8TeLiymHeAPMz
         ZnHlwkCifDOQ7ZJ2aA7nWKDlbBgNMoJznWxB1G4ma0vZKiUtvyMj/+b6xDojxaJA9agq
         2L2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739896018; x=1740500818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LY1yJOtl399lZ4AXgftr3zMqyDj58QmxjVcxn7qswe0=;
        b=YVkDKgVzYgBSN7Oas6CTReSFje8gp5gGh3ZZZhJbj4kfQhxme7W632fJUi2y9WdBud
         ETQWgD4p2Y/An05kMzd8cclk0m1GlQ7PNhJex8MEQ1V1V/SQyHPwFHNy46y5thE3Pwse
         IYov/4ue9MXgwGwT7lVm+2DtMUYFATRE4xcTeoORG2XP+pc0NqSzCD70V8tdpHi6HySP
         RxhzM1e58pm2sHF/Joqlewtsjq6qoXQ4L8w6VUG/Pffbr56emKspY6NiGysTEUdlloI2
         CIf4283j3r8WJSqwow7Ymf0C6z+TzTFmJUKviocXki+lagGduCfIjyeEFB1m/KyqLTht
         rlhw==
X-Forwarded-Encrypted: i=1; AJvYcCVfZB/GOEXj6krBzNjvTWq3BodD+UNfhFpI4+xd/N0J30McIuU+px824L5MLoQG+Un6KFwKNh/6I1E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxHWLAf7eQ5bX/FwBZU42ZaJzukO8KisSWYQk+thzbDbq5qIpdg
	uh3jUCN72dNXPJI6LrbKgdQB8JEYEHdqG/N2FXxJ5pgT6vlayLTwXV9jR91ci5w=
X-Gm-Gg: ASbGncsZH/oAES2aQoBTgupjmMayQ4bJROVHOe9E3psfQdt1E1VX0z+/uCza+bwVqDd
	/yYSWRa0Ihrk5TCCYJ4n2kRmbb0k2oWAtvcQfsLp9bWpOhxlocWOysDI+kFCQoiHLevkIZwQyDY
	H+mwFjGgWYXEOTnFZavZYd13bezA3vCU8Fv4ntLSSuvMu45tEo0drjDXhj9spceOhKvV0RS4rbg
	KO402/HaqLBDVuD1GJtcFHVTxtBnG1rZ9BPW5wpH8EIKs7he+hvE+B0YfQ6sHPYisiq7cE7YDGE
	8yqxWT0w447qF34jOIY489UNYThpTBNFXLHX8vg6YE+L/gSHe8oK6cT69ZovI3vWKA==
X-Google-Smtp-Source: AGHT+IGvcnFycQQ+MA4T/mqzvg5WJga+EiuJJvKuRerbPrC+Ynhn7kdBWW+6S7LFCffDmzCAKYbQwg==
X-Received: by 2002:a05:600c:4f15:b0:439:4c1e:d810 with SMTP id 5b1f17b1804b1-43999b0283amr4460925e9.9.1739896017978;
        Tue, 18 Feb 2025 08:26:57 -0800 (PST)
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
Subject: [PATCH 7/8] hw/xen/xen-legacy-backend: Remove unused 'net/net.h' header
Date: Tue, 18 Feb 2025 17:26:17 +0100
Message-ID: <20250218162618.46167-8-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250218162618.46167-1-philmd@linaro.org>
References: <20250218162618.46167-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/xen/xen-legacy-backend.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/hw/xen/xen-legacy-backend.h b/include/hw/xen/xen-legacy-backend.h
index e198b120c5d..2d0cbfecade 100644
--- a/include/hw/xen/xen-legacy-backend.h
+++ b/include/hw/xen/xen-legacy-backend.h
@@ -3,7 +3,6 @@
 
 #include "hw/xen/xen_backend_ops.h"
 #include "hw/xen/xen_pvdev.h"
-#include "net/net.h"
 #include "qom/object.h"
 
 #define TYPE_XENSYSDEV "xen-sysdev"
-- 
2.47.1


