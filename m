Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C998D2F3BE9
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 22:53:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66042.117151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzRbE-0002a3-Nb; Tue, 12 Jan 2021 21:53:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66042.117151; Tue, 12 Jan 2021 21:53:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzRbE-0002ZN-ID; Tue, 12 Jan 2021 21:53:12 +0000
Received: by outflank-mailman (input) for mailman id 66042;
 Tue, 12 Jan 2021 21:53:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OoN1=GP=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kzRbC-0002PK-Gp
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 21:53:10 +0000
Received: from mail-wm1-x330.google.com (unknown [2a00:1450:4864:20::330])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 429ab65e-718c-4e48-ae97-b36cf6066a68;
 Tue, 12 Jan 2021 21:52:56 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id r4so3488135wmh.5
 for <xen-devel@lists.xenproject.org>; Tue, 12 Jan 2021 13:52:56 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id 138sm6574053wma.41.2021.01.12.13.52.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 Jan 2021 13:52:54 -0800 (PST)
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
X-Inumbo-ID: 429ab65e-718c-4e48-ae97-b36cf6066a68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2tk65VOMw3jKSdrbjvPdRwki3JpePSSllFpesiDYEBY=;
        b=TvvwPbdYFdvWGZuc/0gCrpu3QfUvvXgWDxTjSF33qp4Qvuypt3NJbFmE+aLWzZ+ppT
         Nxa9AjIUnCnoA8sQgI+i05zp3BzQMSuoiMLbpIROAyKgMsHt2lxbAAmrC8gc1c5Y+kSo
         no2oRtNmrCuRT0eR/OyirZx5AVCrAXm96aKVejfUCytmarrxASQtC/fsD5vUBgzPG3kn
         JxCSmNVtP6gYmOrbwO/dLJZSG3Lo/DJI3fB0QiEcGyxT+7e5HtnnQ/mfXhC4fc774Y6P
         29fl+3cilNLLe80aC8p/1t891E4t6PoZ/UG1FFw+lzm78DmhJZcDy69KViLVWD4wnRAD
         hiyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=2tk65VOMw3jKSdrbjvPdRwki3JpePSSllFpesiDYEBY=;
        b=lTUxzmhxUYBM9x6D2nXj4PfXFrTSU+7qOPHXwrwuoy2xV3qemS0LOpmUJ58WbPMkEO
         JW6YOoE5SIhDHbqz2M39iIs0j41pgzSPG9MfCHROvlGgy5yNAYkn5V7yma0HcoxsU9CP
         0tz2oHbxADvapR8M8dkvLFK89cPEcUhnEXCxyNNVR4z5DymQBv6s5W9Buiifirrxkcps
         KWgiDcdQQh8l2Fs4Nl8kVXnVTGveqUEv/iKkcaP5S/wumx1t2dcLP9kkBchOG3M/bWj1
         8KW4gkZo4rPd11h7RqWDJOg1BK2VJCjVMeWMrqLArFAd5RS28wXqBePap+vN/owbw+IT
         ojgA==
X-Gm-Message-State: AOAM532FwgaNnQssMOVGj7eLsSYjhWvfug/a0VfFIQqRRROL3c0WLAYz
	OJpnq+l0++6uAqx2LEDdBChYobFhimxnYg==
X-Google-Smtp-Source: ABdhPJy2qmg2+2rotDljbXzcPM4UU//GyC2s3SuUhtv/OfjlxAQK9sctT/mWAiWQfZVdoNvYFdGl+g==
X-Received: by 2002:a1c:cc19:: with SMTP id h25mr1164357wmb.124.1610488375118;
        Tue, 12 Jan 2021 13:52:55 -0800 (PST)
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
Subject: [PATCH V4 03/24] x86/ioreq: Provide out-of-line wrapper for the handle_mmio()
Date: Tue, 12 Jan 2021 23:52:11 +0200
Message-Id: <1610488352-18494-4-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

The IOREQ is about to be common feature and Arm will have its own
implementation.

But the name of the function is pretty generic and can be confusing
on Arm (we already have a try_handle_mmio()).

In order not to rename the function (which is used for a varying
set of purposes on x86) globally and get non-confusing variant on Arm
provide a wrapper arch_ioreq_complete_mmio() to be used on common
and Arm code.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien.grall@arm.com>
[On Arm only]
Tested-by: Wei Chen <Wei.Chen@arm.com>

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

Changes V3 -> V4:
   - add Jan's R-b
   - rename ioreq_complete_mmio() to arch_ioreq_complete_mmio()
---
 xen/arch/x86/hvm/ioreq.c        | 7 ++++++-
 xen/include/asm-x86/hvm/ioreq.h | 1 +
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
index ff9a546..00c68f5 100644
--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -35,6 +35,11 @@
 #include <public/hvm/ioreq.h>
 #include <public/hvm/params.h>
 
+bool arch_ioreq_complete_mmio(void)
+{
+    return handle_mmio();
+}
+
 static void set_ioreq_server(struct domain *d, unsigned int id,
                              struct hvm_ioreq_server *s)
 {
@@ -225,7 +230,7 @@ bool handle_hvm_io_completion(struct vcpu *v)
         break;
 
     case HVMIO_mmio_completion:
-        return handle_mmio();
+        return arch_ioreq_complete_mmio();
 
     case HVMIO_pio_completion:
         return handle_pio(vio->io_req.addr, vio->io_req.size,
diff --git a/xen/include/asm-x86/hvm/ioreq.h b/xen/include/asm-x86/hvm/ioreq.h
index f140ef4..0e64e76 100644
--- a/xen/include/asm-x86/hvm/ioreq.h
+++ b/xen/include/asm-x86/hvm/ioreq.h
@@ -58,6 +58,7 @@ unsigned int hvm_broadcast_ioreq(ioreq_t *p, bool buffered);
 
 void hvm_ioreq_init(struct domain *d);
 
+bool arch_ioreq_complete_mmio(void);
 bool arch_vcpu_ioreq_completion(enum hvm_io_completion io_completion);
 int arch_ioreq_server_map_pages(struct hvm_ioreq_server *s);
 void arch_ioreq_server_unmap_pages(struct hvm_ioreq_server *s);
-- 
2.7.4


