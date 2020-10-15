Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB8928F70E
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 18:45:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7573.19941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT6NL-00059J-1b; Thu, 15 Oct 2020 16:45:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7573.19941; Thu, 15 Oct 2020 16:45:11 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT6NK-00058T-Su; Thu, 15 Oct 2020 16:45:10 +0000
Received: by outflank-mailman (input) for mailman id 7573;
 Thu, 15 Oct 2020 16:45:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YEeM=DW=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kT6NK-0004yr-5E
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:45:10 +0000
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6ab12fba-4c45-497b-966b-2f9e79aa024b;
 Thu, 15 Oct 2020 16:44:57 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id l2so4403908lfk.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 09:44:57 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id v13sm1482495ljh.66.2020.10.15.09.44.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Oct 2020 09:44:55 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=YEeM=DW=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
	id 1kT6NK-0004yr-5E
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:45:10 +0000
X-Inumbo-ID: 6ab12fba-4c45-497b-966b-2f9e79aa024b
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 6ab12fba-4c45-497b-966b-2f9e79aa024b;
	Thu, 15 Oct 2020 16:44:57 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id l2so4403908lfk.0
        for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 09:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ttyepk04DroNuuyrE7kUju7fxJWgSwghlPrbVPtWZwk=;
        b=V4XLO+24Y+705cePezQYGyFCz4z/qSTZsDUC1r3kjVWfPe15UvtNa51bdKnC5PWUEd
         HuWtcD7Hps6VST0HuSisyxAjgQjlvzRPCctuFl93LA8p6I/81eHSCyWXKUEdAHbZolUs
         +ojIFwxgYDR3sBsjU3H1hJbX/u9rWVuEzYb2lZwKHxjwJzY3Q1xwdQV+FkdkuSbk+FSo
         nyFAydRwuly3soU+DooQ5MflsgYO9bk6TX1huLRcMR1fxj9iIbd9I8bBnphK9KRGMSfE
         HlzC6xNxadcAs1+QR9E3UVcbKcP+f9VqklUmddNeKPQMjaZqnedTzuiuRKDfmP6rbM+A
         P36w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ttyepk04DroNuuyrE7kUju7fxJWgSwghlPrbVPtWZwk=;
        b=Jpl4B48GkjVE8iMaD/H9eTnAnGYv4Qf8znanKam6CE1tmUU7z+nV1nviQJkiqBSldR
         J2nOkAdu9gsFdIBDIO8fce4HD1DToEd3FW8ApzmO5SWss8zNUk1NhKCKr/EcUltr0+qj
         5SSGf0vNjUMUGQI/Xbxh36zpGSSqWbh2667ZoB5bNooIAMjlYTBlITVOoxb2Urxm69Dp
         ely3lOh3dAvwGHI+I0M1jLbbe7ea1jUEX06uEI3q9uNSOTOGuTnoSZcuC69MF8+4OELy
         mqU3G3SFMeleSltaGmACBA3bKxeZTsK6QSnfK4kN7hKevk9iyeaZfH7n9q7M3dz0XgJ/
         EAug==
X-Gm-Message-State: AOAM531NmNYkUloCXs+WXtlPrjJKR0LP+ESzw2UA1DsYSE0WIn6Cn+Qr
	qUHnpL6FvSHPPU4h6sNygRlDY/ncexyzHw==
X-Google-Smtp-Source: ABdhPJz/slHPdEYDiEnJBk3d7otX848eBJ8VApE6o12yUQc60uWrA2Q3qdoeaPfm/qaplDbFmlu88w==
X-Received: by 2002:a19:c857:: with SMTP id y84mr1338613lff.432.1602780296167;
        Thu, 15 Oct 2020 09:44:56 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
        by smtp.gmail.com with ESMTPSA id v13sm1482495ljh.66.2020.10.15.09.44.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Oct 2020 09:44:55 -0700 (PDT)
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
Subject: [PATCH V2 04/23] xen/ioreq: Provide alias for the handle_mmio()
Date: Thu, 15 Oct 2020 19:44:15 +0300
Message-Id: <1602780274-29141-5-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

The IOREQ is a common feature now and Arm will have its own
implementation.

But the name of the function is pretty generic and can be confusing
on Arm (we already have a try_handle_mmio()).

In order not to rename the function (which is used for a varying
set of purposes on x86) globally and get non-confusing variant on Arm
provide an alias ioreq_complete_mmio() to be used on common and
Arm code.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
CC: Julien Grall <julien.grall@arm.com>
Acked-by: Jan Beulich <jbeulich@suse.com>

---
Please note, this is a split/cleanup/hardening of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

Changes RFC -> V1:
   - new patch

Changes V1 -> V2:
   - remove "handle"
   - add Jan's A-b
---
 xen/common/ioreq.c              | 2 +-
 xen/include/asm-x86/hvm/ioreq.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index c89df7a..29ad48e 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -200,7 +200,7 @@ bool handle_hvm_io_completion(struct vcpu *v)
         break;
 
     case HVMIO_mmio_completion:
-        return handle_mmio();
+        return ioreq_complete_mmio();
 
     case HVMIO_pio_completion:
         return handle_pio(vio->io_req.addr, vio->io_req.size,
diff --git a/xen/include/asm-x86/hvm/ioreq.h b/xen/include/asm-x86/hvm/ioreq.h
index a3d8faa..a147856 100644
--- a/xen/include/asm-x86/hvm/ioreq.h
+++ b/xen/include/asm-x86/hvm/ioreq.h
@@ -181,6 +181,8 @@ static inline bool arch_hvm_ioreq_destroy(struct domain *d)
 #define IOREQ_STATUS_UNHANDLED   X86EMUL_UNHANDLEABLE
 #define IOREQ_STATUS_RETRY       X86EMUL_RETRY
 
+#define ioreq_complete_mmio   handle_mmio
+
 #endif /* __ASM_X86_HVM_IOREQ_H__ */
 
 /*
-- 
2.7.4


