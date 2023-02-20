Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E82169C7AC
	for <lists+xen-devel@lfdr.de>; Mon, 20 Feb 2023 10:28:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.497990.768759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pU2S1-0000CV-8f; Mon, 20 Feb 2023 09:27:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 497990.768759; Mon, 20 Feb 2023 09:27:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pU2S1-00008i-4f; Mon, 20 Feb 2023 09:27:13 +0000
Received: by outflank-mailman (input) for mailman id 497990;
 Mon, 20 Feb 2023 09:27:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mb/C=6Q=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1pU2Rz-00008c-L8
 for xen-devel@lists.xenproject.org; Mon, 20 Feb 2023 09:27:11 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bff641ec-b100-11ed-933d-83870f6b2ba8;
 Mon, 20 Feb 2023 10:27:10 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 m14-20020a7bce0e000000b003e00c739ce4so334987wmc.5
 for <xen-devel@lists.xenproject.org>; Mon, 20 Feb 2023 01:27:09 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a05600c19c700b003e21f20b646sm444874wmq.21.2023.02.20.01.27.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 01:27:08 -0800 (PST)
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
X-Inumbo-ID: bff641ec-b100-11ed-933d-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KRDbs92uM4wmUdpecuxlJKfatamZgZMyKqKMjmX0LIw=;
        b=jPvZIkZcJ8gdAWV6qG3DbOFkszZjapiPscRaT92GuJHw+ovKDvG9kUyHKo9D2MHTVV
         raiVn4M2EwZ2B4NjUqG1ZuCY9iLC0ihJeicw/1HJAz+CbXzvYRNVL5l+kydqQMUc2Ake
         Xe9XLnI536EEZgsdSJ8Mr0obkQSJWVZaSibCgGaicnYAd5VzuQYaL8/OsCEFwEZ5zJo8
         ki31tNEq+MHoKOEfajMsI4lhEkYyhEc0r60lGAMjzpE5se8h1ZYyKTtAaR//uwUtyd9I
         jrMtEdMeA961uwHmvrl/kNvxu6bxLwQUeHlu0VzUppBQNsnTyKzV93PjayPXDsuVNO7y
         aQPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KRDbs92uM4wmUdpecuxlJKfatamZgZMyKqKMjmX0LIw=;
        b=v6lBAhwzPj5SlIMp/uRyyN823qFtcQea6eHMWL+0T7J8/fAqlDIq4JW/23ED9jjE/x
         prcD/DMEOPZmhjTrXtzW3EorUd/8O5UfBERKZbJRtt9rc/c8cauRwLDryv2B6QVCUcOo
         HA+Rc6rPxWUQApjd4svpekJavcocnW1BofVgkdRXexs8WzjQy6YDJxkTGtmJMpNAsPep
         12tKlXCnbMYDLPGJrm7SZi1sJYFiWp6E0FxV7u5OfQlnRZ+Q7S2Lj8tihnKMvNFWu5Sd
         WgnyKWwvZPiTKbwZYgSRmWentwYrV2LUiVpWBqcBTOz6yFfmmAFNfJ/LnzF5qdzwoG8v
         XTVA==
X-Gm-Message-State: AO0yUKWI9BhVUhY4trairWDvrcuxbMWIWtPR5WkfeDNq7qmRhteeESk4
	1P8n+BAbSW13bl0y7Ca7wD6NyA==
X-Google-Smtp-Source: AK7set8pl9Ml+zJvhVflawVpr8e/yIoq8lc6l2m+q97iXgNCuiYJuKy8Rs0FokEMSm/SgpQt4ZrBew==
X-Received: by 2002:a05:600c:198e:b0:3e2:1f00:bff7 with SMTP id t14-20020a05600c198e00b003e21f00bff7mr325096wmq.12.1676885229384;
        Mon, 20 Feb 2023 01:27:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH] hw/i386/xen: Remove unused 'hw/ide.h' include from header
Date: Mon, 20 Feb 2023 10:27:07 +0100
Message-Id: <20230220092707.22584-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/xen/xen_platform.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
index 66e6de31a6..3795a203d4 100644
--- a/hw/i386/xen/xen_platform.c
+++ b/hw/i386/xen/xen_platform.c
@@ -25,7 +25,6 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-#include "hw/ide.h"
 #include "hw/ide/pci.h"
 #include "hw/pci/pci.h"
 #include "hw/xen/xen_common.h"
-- 
2.38.1


