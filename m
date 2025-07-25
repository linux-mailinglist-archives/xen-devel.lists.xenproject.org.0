Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B64E3B12270
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 18:58:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1058286.1425907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufLk5-00008p-Ct; Fri, 25 Jul 2025 16:57:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1058286.1425907; Fri, 25 Jul 2025 16:57:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufLk5-00006L-AB; Fri, 25 Jul 2025 16:57:57 +0000
Received: by outflank-mailman (input) for mailman id 1058286;
 Fri, 25 Jul 2025 16:57:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0g6R=2G=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1ufLk3-00006F-LJ
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 16:57:55 +0000
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [2607:f8b0:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8179ca64-6978-11f0-a31e-13f23c93f187;
 Fri, 25 Jul 2025 18:57:54 +0200 (CEST)
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-b2c4e46a89fso2097930a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 25 Jul 2025 09:57:54 -0700 (PDT)
Received: from pc.. ([38.41.223.211]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31e63a766d9sm3021487a91.2.2025.07.25.09.57.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jul 2025 09:57:52 -0700 (PDT)
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
X-Inumbo-ID: 8179ca64-6978-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753462673; x=1754067473; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MBsnQtK/MSVuSA8COT22mwmsED90jexli3qzsr1fS4Q=;
        b=vHwh31oKcB/ZRy1oXIpUhepS37i6SJEi3G4MciiZ45ZJDIStpbVxvnyYT/Y8gNluKZ
         HcofoO+TB40BYSZSZYFkW9xnNkHElmZnF3MmDISptCEA5DZNZqj0lGeysnf5MdPHMhj+
         3DiydxPZoPiZ1fuYcWeYulEvWMSkPOw8TwyBKDCNb7W32tjN4wXlDsPZiA3xlS6zgP2a
         9Lmk7YSlLehow9/0QDThqOQq8tNEN7SGb1U8D9YDolw11lLGM+cRRvW/IdNP+YzKhNQr
         mZX5+0kVf3eudHPcjt34y/Gh6DB64V1vk37ZbvENBjIVoul2+q1TbbtU81g52fLNVj4+
         1SlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753462673; x=1754067473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MBsnQtK/MSVuSA8COT22mwmsED90jexli3qzsr1fS4Q=;
        b=ax/II3s6j6x2Zcq0KsTx43kboqdJXA19OE3uGhWNfG/kl00xXHO2vBhI+VVG2770z9
         t2rqq4zL4+jBhHXRZvkvIwwS2LevqCgKQ9iGigB/UtcM6Ky0LJOuQCTCCHlmBFCP/3UL
         +tp5WMbCeSJLmuEp0aIAMjCTBMRVczC7DMVuxcrJF4tKSP939UcijUJnbzYwt5aFx9u7
         GNxnghedZ99pGWcptrlYX2FpvoRpRIib1jypgwavy8JtrOMOf91Jpfv+jwyf0f0MaOLk
         MMlE856BkIVCVk6MSTakuEY07vjlxHWtWsNvw/aBtv55tMnrWJkPFIZ06eWt7emSj/Fg
         rK2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUOPw0MMfNa/bMffQcAAWyzaLZOYQHk+vopdFUAL8SPrBVL9srnnjWXjBwzeNRIEAjVpFN9hAGATWI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzg9ba/CHha7e076dLmhE0NWZodzQQ3CqGE4torvSAfhbp6DDJt
	3EQ/9plcBp7iaea9HFHFEDBxtF9hJQlCl1KWctG/cA21opzmoECsZ06pPge90Ep6fKw=
X-Gm-Gg: ASbGnct9AkLVOSB60twmnX2kmgVrIpFVSobxPY4nuboZvjhp6xGzRGUINB+aCoDwBTW
	I/rEIOF+dZXVD0EJapHv4TiWYpN56k9Dnr06hpi9+gTK350aDDxhpkzN0t8kuxZ5DHYOC1BVvir
	KDIt5z5XOt9YSLHXqAMkQQcykZkmOox1L2jz4PeZMrWEN9HL+YEyje4slYLs3vQAHSZZw8CahZU
	XWOqE/RY6uu6SnW3qLN8iCC3P5/e/+spsSsJatXbWB52n7rbV6T3pubqlX492vqKTriS4S97HHw
	Iypm1gNAtE8Vir5vajPsb49LUo9ZKLswGJeN0sKkbyLwzngLsL1ZPjoFb2KUvnOAxv0LIs+sn/C
	B7h9ZOrjKduvK1cvndwhXvw==
X-Google-Smtp-Source: AGHT+IHXA/JVUDtZuI+n60b2WNaVrkPRhJ89RBAHgHSbhERFjM884v+v86/0ijkq1TId3c4loFM7rw==
X-Received: by 2002:a17:90b:2809:b0:311:fde5:c4be with SMTP id 98e67ed59e1d1-31e77a1a3b7mr3789784a91.35.1753462672937;
        Fri, 25 Jul 2025 09:57:52 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH] hw/xen/xen_pt: fix missing include
Date: Fri, 25 Jul 2025 09:57:49 -0700
Message-ID: <20250725165749.3893240-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

FAILED: libqemu-i386-softmmu.a.p/hw_xen_xen_pt.c.o
...
/home/user/.work/qemu/hw/xen/xen_pt.c: In function ‘xen_pt_need_gsi’:
/home/user/.work/qemu/hw/xen/xen_pt.c:783:9: error: implicit declaration of function ‘error_report’; did you mean ‘error_report_err’? [-Wimplicit-function-declaration]
  783 |         error_report("Cannot open %s: %s", guest_type, strerror(errno));
      |         ^~~~~~~~~~~~
      |         error_report_err
/home/user/.work/qemu/hw/xen/xen_pt.c:783:9: error: nested extern declaration of ‘error_report’ [-Werror=nested-externs]
cc1: all warnings being treated as errors

Fixes: 012842c ("log: make '-msg timestamp=on' apply to all qemu_log usage")
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/xen/xen_pt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
index 9d16644d82e..006b5b55f24 100644
--- a/hw/xen/xen_pt.c
+++ b/hw/xen/xen_pt.c
@@ -54,6 +54,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qemu/error-report.h"
 #include <sys/ioctl.h>
 
 #include "hw/pci/pci.h"
-- 
2.47.2


