Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A8D265099
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 22:22:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGT5g-0004Mw-M5; Thu, 10 Sep 2020 20:22:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vQLO=CT=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kGT5e-0004JK-SX
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 20:22:42 +0000
X-Inumbo-ID: 5230dacd-e276-4803-a78d-db96a4e52b79
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5230dacd-e276-4803-a78d-db96a4e52b79;
 Thu, 10 Sep 2020 20:22:32 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id y11so4304810lfl.5
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2020 13:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Y/dYcio/hiAAprYUa9lh090XJMa0/CH+ZJW7bHpIZ34=;
 b=nZ8HDgkAIIx+upAgZp0X+xoXwx7hJrqfZSHJlFwEWqCrE3OUz4MqM2pOQDnYpjWwwL
 kJrg7/vqr3YctzJ7nPv2Ou8MI9F+Qt8D1eWrxr09VhANjzA60jNaBoLuYXICEJlaa1jH
 zXB+b3Ili7ltIkb0UYKyeO8WceGy15FlIMAi9knwfhz070Ftx4K6kkocdTIqbNleergB
 A8MDOG2HmOyPFJpLnclI+XKoyRGPhOUUpkJ9tbWZGtafhXsLMNGJ08E8g+7s7jz2mC6v
 FHeE0/MvmLRuJ3OW3DxGyfQ+XixFzxwuk4u6zPoJ1Xkz4D7SlaVn/22l/qlrE6OAxMG9
 2nJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Y/dYcio/hiAAprYUa9lh090XJMa0/CH+ZJW7bHpIZ34=;
 b=L6OGn4SWI8UJb7H3pIHjsXUNokjkbTJ6rukC9iOxe/U6uBmIK8jHs5lsoyv8wTmVyx
 G/XaJjEWWBvjT9sdMaScI6hcd87p3rKc7zLwiioHAOcSD4wzJlMcCmUzm2IkCKIFk6U6
 slkkh89v1R6KpARJpJy6JKSbWLfLkgU3HRg5myud0mCRmJSnfj/cLMFQ3Ze6zDe7qz0b
 3tR4MQy2sb5RvUDoAW8/VtosD78Ek1dIE/VQSkgMmFgc4WqWooeqqWgW7ZWue31MWeLw
 m6PgqcdHXIxSjWiiMFmm/vobINNWbulw1bFetrOhRVSS4JA/MGaShOOZAybEU6WamLIT
 G2cA==
X-Gm-Message-State: AOAM5305UKSoXvnogXn7M/C85lA8NVprKgNseVtuUVsoh1l9ozflqam+
 G5MU5arllxPb/rfaUiSEZXhHEkSCl+HVGQ==
X-Google-Smtp-Source: ABdhPJzUqgm1rO8y2Aeydf4eju+R7S0/pfa7z/4I1N8IU9krqwh61G0YOPQIIVB8U06Pt//GCkmLUQ==
X-Received: by 2002:a19:674f:: with SMTP id e15mr5092725lfj.50.1599769350926; 
 Thu, 10 Sep 2020 13:22:30 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id u5sm1584375lfq.17.2020.09.10.13.22.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Sep 2020 13:22:30 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>
Subject: [PATCH V1 04/16] xen/ioreq: Provide alias for the handle_mmio()
Date: Thu, 10 Sep 2020 23:21:58 +0300
Message-Id: <1599769330-17656-5-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

The IOREQ is a common feature now and Arm will have its own
implementation.

But the name of the function is pretty generic and can be confusing
on Arm (we already have a try_handle_mmio()).

In order not to rename the function (which is used for a varying
set of purposes on x86) globally and get non-confusing variant on Arm
provide an alias ioreq_handle_complete_mmio() to be used on common and
Arm code.

Signed-off-by: Julien Grall <julien.grall@arm.com>
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

---
Please note, this is a split/cleanup/hardening of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

Changes RFC -> V1:
   - new patch
---
---
 xen/common/ioreq.c              | 2 +-
 xen/include/asm-x86/hvm/ioreq.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index 5017617..ce12751 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -189,7 +189,7 @@ bool handle_hvm_io_completion(struct vcpu *v)
         break;
 
     case HVMIO_mmio_completion:
-        return handle_mmio();
+        return ioreq_handle_complete_mmio();
 
     case HVMIO_pio_completion:
         return handle_pio(vio->io_req.addr, vio->io_req.size,
diff --git a/xen/include/asm-x86/hvm/ioreq.h b/xen/include/asm-x86/hvm/ioreq.h
index dec1e71..43afdee 100644
--- a/xen/include/asm-x86/hvm/ioreq.h
+++ b/xen/include/asm-x86/hvm/ioreq.h
@@ -42,6 +42,8 @@ void arch_hvm_ioreq_destroy(struct domain *d);
 #define IOREQ_IO_UNHANDLED   X86EMUL_UNHANDLEABLE
 #define IOREQ_IO_RETRY       X86EMUL_RETRY
 
+#define ioreq_handle_complete_mmio   handle_mmio
+
 #endif /* __ASM_X86_HVM_IOREQ_H__ */
 
 /*
-- 
2.7.4


