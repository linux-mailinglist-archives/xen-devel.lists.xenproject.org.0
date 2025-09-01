Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C53F9B3EDA5
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 20:09:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105300.1456221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut8x2-00075R-46; Mon, 01 Sep 2025 18:08:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105300.1456221; Mon, 01 Sep 2025 18:08:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut8x2-000736-1P; Mon, 01 Sep 2025 18:08:20 +0000
Received: by outflank-mailman (input) for mailman id 1105300;
 Mon, 01 Sep 2025 18:08:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wdOO=3M=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ut8x0-000730-VJ
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 18:08:18 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2d8de06-875e-11f0-8adc-4578a1afcccb;
 Mon, 01 Sep 2025 20:08:17 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3cf48ec9fa4so2360539f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 11:08:17 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3d1007c0dc8sm14514934f8f.53.2025.09.01.11.08.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 11:08:16 -0700 (PDT)
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
X-Inumbo-ID: a2d8de06-875e-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756750097; x=1757354897; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=twGw8qz9N+4L4pIFCsrwtC7rtAZFVGA9AgxXiRKdruY=;
        b=jNPTG9L+pXh6RT1zPZVkXzob4Pu5eFVyi7wV6/2L8xuALFXif+JVblQ7sfd0x1qiYa
         mFS7H9EXfa4rl5T1IQtDalrxfkcKN8fFue+zqqc7UUjSbLNr/vuxcoRFJzhfGFfsy87J
         01qE89ypg1srbcHyBaqDceyC7YtuDieHYo72U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756750097; x=1757354897;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=twGw8qz9N+4L4pIFCsrwtC7rtAZFVGA9AgxXiRKdruY=;
        b=boSZ8G04dplIt/ImIuSJRCPVI1a+Xv/pl6g8yjgk24lhaGAr47ukC0Az7k6K6BDR7Y
         UGMBC+TwQgFDpTjRJA8aFISjIG3WHdecSwOYSMEM/0FXn9LJZeHF8uOtb96L8kwA/eHD
         LYR2lnKJzJIEWMh8CMmqwn+BAPcEXIi5ZBTlDmWOA+VNa/4RbCXYwkzLcSqoqhoFCygf
         AgbHC3pCkyM4UufV7e4s+BseDLu/cSvPA2WWVEWzRIAkPwO2LhpK5bgOfPaFQl6lRvWe
         0y5MilOtRsVI6JxWivhNGrHqaQrJJKs8Kx3JepjPV3towna7H4eZm8DR4J30MhN24myu
         2CEg==
X-Gm-Message-State: AOJu0Yztck26UqU/fidT3GDpP9lDzo1dlAugFXG6nPjs4UXZZB9ylsT7
	1DZEHZaGFBv/Ugue0kU13Usi1sChU6QUPgLi/O+SgDHZGyX0InV+34d+jEu3eQl57CLKTtcJfzQ
	uWSti
X-Gm-Gg: ASbGnctBxvJ7oAL9GVbXfepVSkWdD7j5f6c1OHfxFjnv9BceWgxgUZbMQjdXY/jSqQZ
	SsGCmmvMH3QWXRPZA6CJnvs0m/cksbbm8UTmlgjdSm717J8gPp3uJIO5tkTjLmmJ8utWOHzNUAw
	KlMUXx2xEq79vr+SYYl3HaPMOuGnH/bY3tZz7edta7F+x+1jvAvV2jIOnu/yO7nA0/jL8UJbxRw
	xQoA7SGTG/aKD+iGRbSEUdhFNIfh/h3XcDUofnqinOW3O4gNroJ9AKsyjBlnBaovOCk1Wg7YWig
	adAVBKrFfZIaGvnkpeB+/wPZDxl6N9ZWU5W049FhUUjXyWyeoX7/zq4bppg45e/eBQ/7Lj/5hPy
	7agb2BSudEqA1pEJnpRNHQIdt5F1Ea0p0M7Gu3pJevY3nVXqRa3JEXyNKcoqjd7/FjWxYExGkAh
	Xt
X-Google-Smtp-Source: AGHT+IFNYhW9S9yHVcmvvSiwNapuGJBfFXTWhOdg+wQH9cVUbAeMGBk04VIVS7VGwaF1EVd35xLisA==
X-Received: by 2002:a05:6000:2dc2:b0:3d1:6748:65fd with SMTP id ffacd0b85a97d-3d1df34f1e8mr6491403f8f.58.1756750096928;
        Mon, 01 Sep 2025 11:08:16 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <JBeulich@suse.com>
Subject: [PATCH] x86/hvm: Rationalise CS limit handling in arch_set_info_hvm_guest()
Date: Mon,  1 Sep 2025 19:08:14 +0100
Message-Id: <20250901180814.1366701-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Ever since it's introduction in commit 192df6f9122d ("x86: allow HVM guests to
use hypercalls to bring up vCPUs"), %cs.g/limit has been handled differently
to all other segments.

The hypercall takes full 32bit, and hvm_set_segment_register() fixes up all
segments .g to match the limit being 2^20 or more.  Therefore, treating %cs
only as having architectural (20-bit) limit field is weird and unexpected.

Remove the custom handling for %cs.  This is a guest ABI change, but all
callers are expected to be setting up flat segmentation, at which point limit
will be ~0U and there will be no change in practice whether .g is set or not.

Reported-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

Slightly RFC as this is an ABI change, but I don't anticipate any breakge from
this change.
---
 xen/arch/x86/hvm/domain.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/hvm/domain.c b/xen/arch/x86/hvm/domain.c
index 048f29ae4911..4e9aaca39fe6 100644
--- a/xen/arch/x86/hvm/domain.c
+++ b/xen/arch/x86/hvm/domain.c
@@ -120,7 +120,6 @@ int arch_set_info_hvm_guest(struct vcpu *v, const struct vcpu_hvm_context *ctx)
     case VCPU_HVM_MODE_32B:
     {
         const struct vcpu_hvm_x86_32 *regs = &ctx->cpu_regs.x86_32;
-        uint32_t limit;
 
         if ( ctx->cpu_regs.x86_32.pad1 != 0 ||
              ctx->cpu_regs.x86_32.pad2[0] != 0 ||
@@ -147,13 +146,10 @@ int arch_set_info_hvm_guest(struct vcpu *v, const struct vcpu_hvm_context *ctx)
             return rc;
 
         /* Basic sanity checks. */
-        limit = cs.limit;
-        if ( cs.g )
-            limit = (limit << 12) | 0xfff;
-        if ( regs->eip > limit )
+        if ( regs->eip > cs.limit )
         {
             gprintk(XENLOG_ERR, "EIP (%#08x) outside CS limit (%#08x)\n",
-                    regs->eip, limit);
+                    regs->eip, cs.limit);
             return -EINVAL;
         }
 

base-commit: 3999ff0d307a9a901ad1b5ad56e0dde657fec558
-- 
2.39.5


