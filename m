Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0DCA3A2B1
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 17:27:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892020.1301058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkQQx-0006Nj-IZ; Tue, 18 Feb 2025 16:26:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892020.1301058; Tue, 18 Feb 2025 16:26:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkQQx-0006L2-FQ; Tue, 18 Feb 2025 16:26:55 +0000
Received: by outflank-mailman (input) for mailman id 892020;
 Tue, 18 Feb 2025 16:26:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vlVU=VJ=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tkQQw-0004Eu-43
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 16:26:54 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 292ea6ac-ee15-11ef-9896-31a8f345e629;
 Tue, 18 Feb 2025 17:26:52 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43932b9b09aso63534735e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2025 08:26:52 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43990f53847sm35280935e9.1.2025.02.18.08.26.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 18 Feb 2025 08:26:51 -0800 (PST)
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
X-Inumbo-ID: 292ea6ac-ee15-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739896012; x=1740500812; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mperaQfcVOBqRRYRjHccBT2TwBZt0VUagowA4iRkLpA=;
        b=hDh6SfUi7hYIJGN4xG/4G/OmTM0X3aqarNwmoUDnJSzEagmOoFsAfiiDC1LTSWUhJt
         3nfoYiUWstx/n3RNqUzFlbtar54OPLl9KfZz5XgSD9aEORSZzBjvxPgPWyNZZnyNX6WH
         L1cdJ49+V9AAhic+WKxVEfFeuDdyvWy/kXz+pjtpLS7jFc3Dg09mctO6VcL5YJ+HrnmZ
         ON1Ec7W7xzMhnc9Yl2IlBm5MR9+SVcC5F3+kVpxdseTd9zYI3uZYUVMVyvTaOLmg5Qvr
         8z2knL2R5zw+w2OWbbTpNDdFaQRrmeuyqBwFrGqnqThMowWAfVTEbR4VSn83IdIwdPkq
         Rk3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739896012; x=1740500812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mperaQfcVOBqRRYRjHccBT2TwBZt0VUagowA4iRkLpA=;
        b=NaiK2ARSuUKmMrF1KnQdW5LFk0Lc5bCbBWaZAD9TuJZHPi3Nbej5ck6MG9o8QIpwAo
         ay2D1eUhEl3goeVa8uiuSG3+dhCNkstFif3sAQsLxdzK5MMmvmDC0bFez8JDe0h7BpqJ
         tiQz5PFKwujF0UKMzPxf2Vn+pRfYkIAFS80+wFJ6C8+7o0SNrmqKySy3oRLTsrjFa8j4
         ZUSeq/Mncut7p4K96cOrbaicevW6rsBqHaLRBFrZGA0Ql4zR+MEm3e4ohSduGI0cHB7p
         hKIzIezjxEhEznDoMAGl4soJHeAiJw0Rexqv3mZWe9Rfe/fkTBaBYHHfgLgmdgp1zlNt
         Uc7w==
X-Forwarded-Encrypted: i=1; AJvYcCXGJkO2zZ7cHzDi1Wwj1rdMZgCxot06UJvOkMZOKCgg98U5DS7ZDwKpaX35ffXG/c++9l42yMXO02Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzi8/7CzzHi6JyfR7Hhvy0tXe4C9zX44qTLNeyUIkWtTy+kroCW
	VXqonNetaF09INlZvj+ThaSNby1THws0Caj5dK9T8tR73wGw1za50dkiRC75SwY=
X-Gm-Gg: ASbGncvE34YpfTKa1aYZE8TP5yDgm3FuxhV5dZB0SSU2NALweYlbzzUEwSqJMi2ZBat
	dkr9SyY0GdGgskwagpp4/efEshlPS7vSXZ7zOxGAUSsJWHSwYIzyXWUvt/Cm8voEdsZMfTNuoSU
	4BJKvFTxOfPrSYG5AO776DM3QZI2SFtJtWLHl+pp44VTr2uN6D3gyHfEOEQFVwKzrhgCm0FoXz3
	KFMswsIxJxscexmsDYC7wOZasBXdPnI/TWmuQg3xKtqYNRbfIb+nGl1Oq//tpoqDJi8xhGHNqgb
	tVOci9i+3bo/7+jy39DYYxusUmZfTiJwknoKhVLuXckZc7xcDg6AaGQUVyXD93rb3Q==
X-Google-Smtp-Source: AGHT+IF7J9TVuOyN/e8Zf762aLNRW9ueMObB9uugOr+4mEzA/SYgnf7ANAVSmsXQfhVb+gVyh0mcig==
X-Received: by 2002:a05:600c:511f:b0:439:43b1:e60 with SMTP id 5b1f17b1804b1-4396e6df40amr143667775e9.17.1739896011980;
        Tue, 18 Feb 2025 08:26:51 -0800 (PST)
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
Subject: [PATCH 6/8] hw/xen/xen-bus: Reduce included headers
Date: Tue, 18 Feb 2025 17:26:16 +0100
Message-ID: <20250218162618.46167-7-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250218162618.46167-1-philmd@linaro.org>
References: <20250218162618.46167-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Have "hw/xen/xen-bus" include the bare minimal set of headers.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/xen/xen-bus.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/hw/xen/xen-bus.h b/include/hw/xen/xen-bus.h
index 2adb2af8391..bdbf1ed6fd0 100644
--- a/include/hw/xen/xen-bus.h
+++ b/include/hw/xen/xen-bus.h
@@ -8,9 +8,10 @@
 #ifndef HW_XEN_BUS_H
 #define HW_XEN_BUS_H
 
+#include "hw/qdev-core.h"
 #include "hw/xen/xen_backend_ops.h"
-#include "hw/sysbus.h"
 #include "qemu/notify.h"
+#include "qemu/queue.h"
 #include "qom/object.h"
 
 typedef struct XenEventChannel XenEventChannel;
-- 
2.47.1


