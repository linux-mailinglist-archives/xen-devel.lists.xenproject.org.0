Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 687E5B14D43
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 13:58:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062570.1428288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugiyH-0002I5-Sz; Tue, 29 Jul 2025 11:58:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062570.1428288; Tue, 29 Jul 2025 11:58:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugiyH-0002F5-QG; Tue, 29 Jul 2025 11:58:17 +0000
Received: by outflank-mailman (input) for mailman id 1062570;
 Tue, 29 Jul 2025 11:58:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xsxe=2K=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1ugiyG-0002Ez-PY
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 11:58:16 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49c9907a-6c73-11f0-b895-0df219b8e170;
 Tue, 29 Jul 2025 13:58:06 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4561ed868b5so35817145e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jul 2025 04:58:06 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b789a31c4asm5676065f8f.17.2025.07.29.04.58.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 29 Jul 2025 04:58:05 -0700 (PDT)
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
X-Inumbo-ID: 49c9907a-6c73-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753790286; x=1754395086; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hZLCuI32mRLDzwfhzdD0trdugKB1fD2xZRFNlNXmbIw=;
        b=VeqPWnI2CeBQRJdRpBXXZDA4bBtYist3iu0Kzeife8eorTmiWSXr48gVLZYiJjKJs9
         98brj4x5DOpOVytThxW1HbSJyEXzYveGJVjsTLipcvmdwJ7LMJIjunKD6KvuQEbhMa41
         c3EyFvb08neEjri0D8Ie0xehHUIwCPnI/W2ORbEIYzMbzdU6NM4NCoX3VmvGgDSpzBki
         t7RxE9kzxf6Nr9Hmf2FRwsL0lj7z1ngDOCZJgfy88Mr4TLOB/yBUY8taK8EFyZDg3Y6e
         EJIckEh57vToZjrVZe8kuyH3XMTjq3dgSAsza35ldVxapkj11MHa7fEVISu3ww2tWTXS
         eMYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753790286; x=1754395086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hZLCuI32mRLDzwfhzdD0trdugKB1fD2xZRFNlNXmbIw=;
        b=TqMV1l2f8S1WdvD8BK/Zx3HYZerv7KZa9ypEmCvjwvpN8Yrlq67ThvlGnLJUqQzZ22
         Av5PltYO7XkmnSRtr+k6vknxiZy/TaPFnMCO20Ek8kU5lIy0pOKBnAdS76jZPGnjZ70N
         O3Drtn+vyXHw8z+plMIxWnciYFSVbzaDcAoZoXntDjXcT7JQtbjxDsGeCfYtsBX0LObZ
         weypYXlraB+g1oIUR1PPBFl2nC/LCojeFjxmGxds5wdZIx7HxK5+GcvtPy2g1cShFURB
         llcsEkhKuS2fvGKP8JH5u6i6x2noNVyXkPfhqoaje22MPD8qkIDOjBZTYGSHvonXmr7k
         sZBg==
X-Forwarded-Encrypted: i=1; AJvYcCWYFK0o7DEfcUBj2kBUlHXF5RC3OZFPdK0i94ytGHPL/ZrNOvIraFn/CTG1S96Llal5wsVLQwP8BNU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyIFBH4Ff7LQ3K0ax7/ht78ZDAzsIjmbKueBO05f+/mLGQzAnke
	JSKEFKhgatWJ41+MMBV6Kt4ubfvqSyVYk/FrUp0fL/P2FrVVxGCuClWM3fE7XkrWdok=
X-Gm-Gg: ASbGncsVrREJd27L68tHnrvXbQzDrEKKcM9sxD3C0ASAxoHVt9Lh0gq4o3f9rG1gN5b
	Ei7fODRk8N9NqXeHcxdnRKGitqSXaPO0yf+YHnq1zxIiL94dGdka+KdnxIBcZUT7/fF6K8MKxqA
	ioaJXxRCwtIbyiiLxbcuslaVUk6ZWJU5qeHHTpfYd5hlM1LJk21Di/CyeACU21t92opZR1vvgMv
	bIuQUCawbdmia0xFKPM3CZBZLM+AZT0uYmgAjXBii9OWXUAVMs6isMst1yaqAAd/W25vJnEscMC
	WWcui+1k7WhRG4zZRwQSWfGMCM6CNVxGk3XgJwBuEjzx+0mg2lYVYM3pwduSVh9MrG1pc/c+4wT
	f2Z6wvxcBkUhpoIMFGywtar1+Vrji5f2X35a5MKlqNAhEY6GHFmHXhtpFbxEAXEsIPijQHx9V
X-Google-Smtp-Source: AGHT+IFm9e3gIXrKykE7g+jz/UvSig1IqrhOgcqxaEPGlK2m9NH3XLC6gGAvWtwPWiefgqfVJO61Aw==
X-Received: by 2002:a05:600c:1e22:b0:456:2ac6:cca4 with SMTP id 5b1f17b1804b1-45876311cd0mr112740315e9.13.1753790285847;
        Tue, 29 Jul 2025 04:58:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Adam Williamson <awilliam@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: [PULL 6/9] hw/xen/passthrough: add missing error-report include
Date: Tue, 29 Jul 2025 13:57:31 +0200
Message-ID: <20250729115735.33619-7-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250729115735.33619-1-philmd@linaro.org>
References: <20250729115735.33619-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Adam Williamson <awilliam@redhat.com>

In commit cfcacbab38e ("xen/passthrough: use gsi to map pirq when
dom0 is PVH") an `error_report` was added to this file, but the
corresponding include of `qemu/error-report.h` was missed. This
only becomes apparent when building against Xen 4.20+ with trace
backend log disabled.

Fixes: cfcacbab38e4 (xen/passthrough: use gsi to map pirq when dom0 is PVH)
Signed-off-by: Adam Williamson <awilliam@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20250717220207.171040-1-awilliam@redhat.com>
[PMD: Improved commit description, added Fixes: tag]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
2.49.0


