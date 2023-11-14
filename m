Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1C17EB272
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 15:38:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632621.986902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2uZ0-0005Ds-Td; Tue, 14 Nov 2023 14:38:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632621.986902; Tue, 14 Nov 2023 14:38:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2uZ0-0005BU-QX; Tue, 14 Nov 2023 14:38:50 +0000
Received: by outflank-mailman (input) for mailman id 632621;
 Tue, 14 Nov 2023 14:38:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6V1E=G3=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1r2uYz-0003b0-Bc
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 14:38:49 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 851d30b8-82fb-11ee-9b0e-b553b5be7939;
 Tue, 14 Nov 2023 15:38:47 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-54366784377so8748483a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Nov 2023 06:38:47 -0800 (PST)
Received: from m1x-phil.lan (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr.
 [176.184.25.155]) by smtp.gmail.com with ESMTPSA id
 m13-20020a50930d000000b0053e3d8f1d9fsm5267242eda.67.2023.11.14.06.38.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 14 Nov 2023 06:38:47 -0800 (PST)
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
X-Inumbo-ID: 851d30b8-82fb-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699972727; x=1700577527; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UVR+oDiuZU+TW6PLxAmD0Xj/DK6BF5fQU92EHH5K3Z4=;
        b=JE5EwRB/NhM31ug+MxKMHIzTxC5afV3rXEOALsjJ9aDYIFqFZ8mX6ibjk9oDRsCY8b
         gOxG+ji2bFpghHfXY2sS3X+lz9AEffdKP8AGtFlOexHkIMKIHdO+Nf5qAk8TqxHaGtq/
         KTCqXFYu4ujoIObgGqTKV/7R7kEhBYFDkNte6Dcl/MAOUODDdowBFntbQ6fzwBWaxCwn
         KCLSL/vL5Qp7pT9u9yEZV5S6BHdYmcDTF1J9V1xqoDRboA8Pf0UG2bW7CR4++C5jHBGN
         ulVpfLGY7Xgcqn2uHdk6Trpyat3KLY10wWbpg84fQC3XmM6IAbcBNOwOLRTjr3kApapG
         /4HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699972727; x=1700577527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UVR+oDiuZU+TW6PLxAmD0Xj/DK6BF5fQU92EHH5K3Z4=;
        b=AhWJdys5O74ZASeRsLvkuH9Do4Xari7PalLFE9/gjs4l2wdkafkKm3QX8rW0nDXkj1
         VejP8j3a+ldMAo4A0JQ5mak+HU4xT0TVD62ahuG+re4KClIL+vFIzwjFkJCJ5spXJNia
         Ly9pxt0CyblU2babIPfvI235lBH1zrFgMdvSAO3JB3Vo12gkrkAadG0qBMg+yCovgGai
         UjWAN49hiDjy+xSsykFZ4EYm4W1+6nZVXOpKchxmrv3xvtdhZlVjpVgDBp77F0kgpMSr
         GNQOk+mEtI3uKeyktngp9AeZeSo3wfzcebpynE25SKRcInnbmTWIhB1v0QPV8VsKjk6q
         PkgQ==
X-Gm-Message-State: AOJu0Yy7upXiiGTgGxJV92WpIP26GfVZ1cauYDwu9hjog8z1icb1fwPT
	PenQxTlIeQeDNgZl1iyKe9lruA==
X-Google-Smtp-Source: AGHT+IFU6fMqnyRTdYcaSZcZeeOvXEQ5/pqyJPjwVu+SyaMG1cEZXv2HxBOf7hgBnVZ045SVB8RX8Q==
X-Received: by 2002:aa7:c759:0:b0:543:5a91:a8b2 with SMTP id c25-20020aa7c759000000b005435a91a8b2mr7512514eds.19.1699972727421;
        Tue, 14 Nov 2023 06:38:47 -0800 (PST)
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
	Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@redhat.com>
Subject: [PATCH-for-9.0 v2 04/19] system/physmem: Do not include 'hw/xen/xen.h' but 'sysemu/xen.h'
Date: Tue, 14 Nov 2023 15:38:00 +0100
Message-ID: <20231114143816.71079-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231114143816.71079-1-philmd@linaro.org>
References: <20231114143816.71079-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

physmem.c doesn't use any declaration from "hw/xen/xen.h",
it only requires "sysemu/xen.h" and "system/xen-mapcache.h".

Suggested-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 system/physmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/system/physmem.c b/system/physmem.c
index fc2b0fee01..04630711d2 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -35,7 +35,7 @@
 #include "hw/qdev-core.h"
 #include "hw/qdev-properties.h"
 #include "hw/boards.h"
-#include "hw/xen/xen.h"
+#include "sysemu/xen.h"
 #include "sysemu/kvm.h"
 #include "sysemu/tcg.h"
 #include "sysemu/qtest.h"
-- 
2.41.0


