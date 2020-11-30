Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AC42C8237
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 11:32:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.40805.73781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjgTh-0000fR-HZ; Mon, 30 Nov 2020 10:32:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 40805.73781; Mon, 30 Nov 2020 10:32:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjgTh-0000eo-D8; Mon, 30 Nov 2020 10:32:17 +0000
Received: by outflank-mailman (input) for mailman id 40805;
 Mon, 30 Nov 2020 10:32:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=avKr=FE=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kjgTf-0000Uu-CD
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 10:32:15 +0000
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8247b874-94ea-45a8-b30a-bd01c48b57d4;
 Mon, 30 Nov 2020 10:32:01 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id o24so17026537ljj.6
 for <xen-devel@lists.xenproject.org>; Mon, 30 Nov 2020 02:32:01 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id 136sm2399393lfb.62.2020.11.30.02.31.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 30 Nov 2020 02:31:59 -0800 (PST)
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
X-Inumbo-ID: 8247b874-94ea-45a8-b30a-bd01c48b57d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=oPwVS+xymxylL7L/6Uw1WpkrUax1c9fqZs6baXhLT/w=;
        b=u26ezXmb1HRCJb8cN2LiXx5fYCJJYgz8O2qS2wZNHCim1gBF6QWCOUxmPgGnUZJdCQ
         A2u07GsuWsrAPZVkPSbcqCvD5qIr7z1DpVWz3+yYB2QNTW6tgJMTKCzn5FwuZLmVFUMP
         tqWxf9mah+ryYyhRIePhziAvpCOSpqXvL1l6/akGhCHL7rbjCdRxK2cjsH9Hk2dyKreD
         mLK+pQDSdeCZRlgHQBveuXtZ5jFRB14xGWrknxT60ICr3W22nPUSzhpC8QLxQ5epxVOW
         TL7Io7jPWTIj9N9sdrERmj6D+Gsqf9asqUJZGQO0cdmVX45AJS/XtSynS/GGAaLvvV7F
         YTfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=oPwVS+xymxylL7L/6Uw1WpkrUax1c9fqZs6baXhLT/w=;
        b=ho0zbMsGJt0juD6lEUrRYVD6n1SIRDZhx15x1YpnfxkWe3biuV90O7nAEfudHu5FEA
         lA61i1UhJ7kD31Oe4IdPXtGliy/hBT1yPmGc2zwTvvMMfAW0qpvYbp6euFg/5LcBO0I8
         Jd7u6sr+MtvCpU6K0LZwiOuNaXqhkIMEpicx9RPSdsU7qKZ6G8nA5cHlaQTGCgUVPjic
         ahEamABDw4vIJi2F6xuKr8Riqdj7ivXIGJo+GUNArx8riz9k55xHDQ7FvqXDIbnNmjDK
         3VGeLENUBmMLa79wbjNHp2X5AbbdkjuZiOioTKV6U4tbBhYX1YvdVoBxyVGRClgiJuf9
         xr0g==
X-Gm-Message-State: AOAM530ET5C56xCgF0EhGZJwwUsWYkdd4ffj92fcMf3jH20tiTSS+tgS
	R+x5Qj0yV1Ra+yI9NjR8V2jZoxuLjCoa9w==
X-Google-Smtp-Source: ABdhPJyuSNGsY9pPHt6NxlrdawJ/3pd8os8BI0EWnoUkpWEPjXmJ9k5q9+vUOTu4IB3qd3+tTl76+Q==
X-Received: by 2002:a05:651c:315:: with SMTP id a21mr8588159ljp.229.1606732320354;
        Mon, 30 Nov 2020 02:32:00 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Paul Durrant <paul@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien.grall@arm.com>
Subject: [PATCH V3 03/23] x86/ioreq: Provide out-of-line wrapper for the handle_mmio()
Date: Mon, 30 Nov 2020 12:31:18 +0200
Message-Id: <1606732298-22107-4-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

The IOREQ is about to be common feature and Arm will have its own
implementation.

But the name of the function is pretty generic and can be confusing
on Arm (we already have a try_handle_mmio()).

In order not to rename the function (which is used for a varying
set of purposes on x86) globally and get non-confusing variant on Arm
provide a wrapper ioreq_complete_mmio() to be used on common and Arm code.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
CC: Julien Grall <julien.grall@arm.com>

---
Please note, this is a split/cleanup/hardening of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

Changes RFC -> V1:
   - new patch

Changes V1 -> V2:
   - remove "handle"
   - add Jan's A-b

Changes V2 -> V3:
   - remove Jan's A-b
   - update patch subject/description
   - use out-of-line function instead of #define
   - put earlier in the series to avoid breakage
---
---
 xen/arch/x86/hvm/ioreq.c        | 7 ++++++-
 xen/include/asm-x86/hvm/ioreq.h | 2 ++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
index 9525554..36b1e4e 100644
--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -36,6 +36,11 @@
 #include <public/hvm/ioreq.h>
 #include <public/hvm/params.h>
 
+bool ioreq_complete_mmio(void)
+{
+    return handle_mmio();
+}
+
 static void set_ioreq_server(struct domain *d, unsigned int id,
                              struct hvm_ioreq_server *s)
 {
@@ -226,7 +231,7 @@ bool handle_hvm_io_completion(struct vcpu *v)
         break;
 
     case HVMIO_mmio_completion:
-        return handle_mmio();
+        return ioreq_complete_mmio();
 
     case HVMIO_pio_completion:
         return handle_pio(vio->io_req.addr, vio->io_req.size,
diff --git a/xen/include/asm-x86/hvm/ioreq.h b/xen/include/asm-x86/hvm/ioreq.h
index e9c8b2d..c7563e1 100644
--- a/xen/include/asm-x86/hvm/ioreq.h
+++ b/xen/include/asm-x86/hvm/ioreq.h
@@ -74,6 +74,8 @@ unsigned int hvm_broadcast_ioreq(ioreq_t *p, bool buffered);
 
 void hvm_ioreq_init(struct domain *d);
 
+bool ioreq_complete_mmio(void);
+
 #define IOREQ_STATUS_HANDLED     X86EMUL_OKAY
 #define IOREQ_STATUS_UNHANDLED   X86EMUL_UNHANDLEABLE
 #define IOREQ_STATUS_RETRY       X86EMUL_RETRY
-- 
2.7.4


