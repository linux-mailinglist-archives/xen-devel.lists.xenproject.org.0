Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47766B0527F
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 09:15:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043554.1413520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubZt1-00041I-Bq; Tue, 15 Jul 2025 07:15:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043554.1413520; Tue, 15 Jul 2025 07:15:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubZt1-0003ze-8O; Tue, 15 Jul 2025 07:15:35 +0000
Received: by outflank-mailman (input) for mailman id 1043554;
 Tue, 15 Jul 2025 07:15:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZCKb=Z4=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1ubZsz-0003zY-Pu
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 07:15:33 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7da505a7-614b-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 09:15:30 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a54690d369so4200729f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jul 2025 00:15:30 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4561976784dsm57489215e9.18.2025.07.15.00.15.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Jul 2025 00:15:29 -0700 (PDT)
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
X-Inumbo-ID: 7da505a7-614b-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752563730; x=1753168530; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jK3VHhVp0eVShcAqpjGBRXDmPLTaiJrK+trki6OAZaY=;
        b=PzJsShgcRiPAAKWlILP+GEh5SAGMZcttMfK7/iYrbBY7WIQqrEe0+wa4AjmTeeZFXG
         KmcAa7TO7mD4kDOHOOkX5x1QZVFK+JXn1FFQpA/FS2Pcq0Z6ZzewcMfXLOiTDM87pojR
         /Xh/zybP2iENt3FwDprhLrhv2ipN+yBeplRu8LRLUzQyNVkW83JxPWY5phvDsjsNKaPL
         f/6t8iM0D//HLeHmOT0REC+bbKsg21p5chMofZG6xpTNhLxsXMEd/TDZpSrPMjIX4wgy
         w1z+pRlm3KhCCWf9MRdnU5FvLIvM89BoSublZBh/dzrXLjzk3uWE/f8FXFrvPtc9nFlO
         C2gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752563730; x=1753168530;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jK3VHhVp0eVShcAqpjGBRXDmPLTaiJrK+trki6OAZaY=;
        b=NiY/FnV/7fkGSUHfUhXTlSA4ffB4BB3HpQ0h0S6aE9N7ax/SZhp2tUdI3vjLuUDOQc
         h3pAFeOxTDfanR0WKR7EqCPobqZaSKZXMZf+8c0obeaoUsCg2dsxGzhL7rwLnbWnGFpL
         Wf9q+FW5uxRT0ti65dtVqeDiMtM35xGQNQkgvItSAeyuXOdOvQjcvefrYY0c8fsOcM9p
         ThF+y8Zeb4yb5cQhcyDjb8PAzxTjPGLraxJCRS1ZVk9iXiplDGipxZUmXxDyFJK50tqj
         wEmxKuSauWvJOJmEkMJMSAGgeZgr/Qs5jS8rticfnTEuvykbtfiz3aclJO1oQFCw5XWV
         unZA==
X-Forwarded-Encrypted: i=1; AJvYcCUOt7yWGfOOCCW29hxKO6ibH3eX8bkwrCZj7YdxAGrQrvFqm2bGrSN0kdEfkdGyfxvMLW3tPXnKBb8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw7lQhqMRifH3cYbp27pVTiRN9xhYrBpKaMI+avsdHo+mkg80EW
	L1EMVJ3LL0hf/7cTLdtIEiGzZ5oN3XjxptdWSUg2K9CQymGdfsEw17HYmDQ+f82jI18=
X-Gm-Gg: ASbGnct7CJifgwxfjbFl70K1Crotv3hAxcXxLdCTF5OmyvrhMQtFztwoYknzXgG43LP
	Qeu7m5vHrvD4ihCrZBlfLla4j4MutvzwXiRNEYyY8XoQfArVM3osYmAziBDzL1llG69X82jbMz/
	Ew67tsTLwxvX3oSaHnzluUPHVJOs09rlIyDrM2TUbVyJcFLlMG7qOv+rvXBpJzf+1WXaV48wbI/
	gmY3gYsj1HHTi4eEJ/D7gh9J+v/OivwBzHA+6PwTl1b1jJLB5HNOOWFQw/tUBQggfReIBTGO/Xx
	/6OaawQKcyMaHk6OUaYb9GSeT05rq0072WEPjyRdznpGUamzT4GtqKoJ90yForqhKSk11CGnFBA
	pNGQbOqJlpozHuwfdQZ0TJ1V+zTXl9jnqc5rxEKb8FrEqHq427TrjphtS8FdJfR1Wv13PdQyUch
	NH/w==
X-Google-Smtp-Source: AGHT+IHc/hNaSxV/q5zS/EGfLlhOgnJMNAW+20yw+IkE5PFdUkO2Ro8e29tK1H+hW7tz8zfDXyx3sg==
X-Received: by 2002:a5d:64e2:0:b0:3a6:ec1d:1cba with SMTP id ffacd0b85a97d-3b5f2dc2ce7mr10700753f8f.20.1752563730160;
        Tue, 15 Jul 2025 00:15:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Anthony PERARD <anthony@xenproject.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	qemu-arm@nongnu.org,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Xiaoyao Li <xiaoyao.li@intel.com>
Subject: [PATCH v2] hw/arm/xen-pvh: Remove unnecessary 'hw/xen/arch_hvm.h' header
Date: Tue, 15 Jul 2025 09:15:27 +0200
Message-ID: <20250715071528.46196-1-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

"hw/xen/arch_hvm.h" only declares the arch_handle_ioreq() and
arch_xen_set_memory() prototypes, which are not used by xen-pvh.c.
Remove the unnecessary header inclusion.

Cc: Xiaoyao Li <xiaoyao.li@intel.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Based-on: <20250513171737.74386-1-philmd@linaro.org>
---
 hw/arm/xen-pvh.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/arm/xen-pvh.c b/hw/arm/xen-pvh.c
index 4b26bcff7a5..1a9eeb01c8e 100644
--- a/hw/arm/xen-pvh.c
+++ b/hw/arm/xen-pvh.c
@@ -10,7 +10,6 @@
 #include "hw/boards.h"
 #include "system/system.h"
 #include "hw/xen/xen-pvh-common.h"
-#include "hw/xen/arch_hvm.h"
 
 #define TYPE_XEN_ARM  MACHINE_TYPE_NAME("xenpvh")
 
-- 
2.49.0


