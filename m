Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FF9A35A60
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 10:30:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888662.1298006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tis1G-0004yD-KI; Fri, 14 Feb 2025 09:29:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888662.1298006; Fri, 14 Feb 2025 09:29:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tis1G-0004wg-HK; Fri, 14 Feb 2025 09:29:58 +0000
Received: by outflank-mailman (input) for mailman id 888662;
 Fri, 14 Feb 2025 09:29:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zro/=VF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tis1F-0004wC-GO
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 09:29:57 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 404df216-eab6-11ef-9896-31a8f345e629;
 Fri, 14 Feb 2025 10:29:55 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-aba868c6e88so5780766b.2
 for <xen-devel@lists.xenproject.org>; Fri, 14 Feb 2025 01:29:55 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dece1c43a0sm2620484a12.28.2025.02.14.01.29.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 01:29:54 -0800 (PST)
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
X-Inumbo-ID: 404df216-eab6-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739525395; x=1740130195; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OLL0Cu2im+2s7soMt+7n0C+aAoH5FL3BBfhVGKeMFWE=;
        b=I2azivfEw3GXRhzjyqHD4GZz2qDhrHE8mJqQu2s2Y/xdNwzJC9xMDqkYpoBYR6tQaZ
         ERETabLxdO+ziMjcV6jgAVNRpzBVZxQmwlRRqgs7xQtbw9k4E5zucJuJYEA3wR3ySWpU
         mJqIlVV2tXhUErIMuPoZ1iYLdJMviiZ3B/KGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739525395; x=1740130195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OLL0Cu2im+2s7soMt+7n0C+aAoH5FL3BBfhVGKeMFWE=;
        b=wuQNfzFNKBZ1r4AmRfW25Mt3/WFts0yGWB8ilFgWx3CtUxxYWjySSO9RToJUMCT6uf
         5RHjjHbupJIVQUbG3n5VUgZL2uaEStrT6/aHBQapk/vKmD5DXhtypQmyAEn1CX2w16bq
         ptqCpjnslvddRw3Fz743mBlsGVFUUyoIDzeWvj2OJm849kRELPOkBMolEFXRcRcwh9hE
         hIA4SwWD6MXElMtUHGsShnAcri3tJ5cRIrJ6TS6crYu6QlgSde+CSAf4TgqeRceNbrP9
         4Pi0ZAnCq+/KRw1PD1biisBcvmEiDB1LrDoQPgGKh8Z3VmaL/cudpR+D/1mpeYIWcoiC
         Viug==
X-Gm-Message-State: AOJu0Yx5Vmt2GqnCFxwFhLg3Yu4jgJYfGLqo3mnx1s0fPsBO85bD6EP0
	lZz8q6X/9shgfAoPraS81f4SLlsgn+5RVwu69HHgkOyhxs+dykd08oM9bagZUm9HeSCn9GUOcwr
	R
X-Gm-Gg: ASbGncu5opW0Y1s8hFdWdgZ1WtRSiuezJEaaeZOm6ZXHxUNlnz1xuCTzZydA3wP8FNo
	jZPKst3unWhgzwE2mh1JVsCwHAWiChelcqOM9z16TwM/Qq6sM9fgSPPyiPOqPQcPYZ4DcIvnMru
	mcY9gANh7Zw8nOCCVEx6VZeqUL57h4zoBGcsqDKLiNXz57NZcTRbB2/5w7VmX5Faf8mJqprwuBO
	VM09m4ZZWWSvwb5tzz+MyE4XFH8mjHPAOKoZry2h4XDuoJLmaEuMUV0lrZnrlTNVxhPZjy0Zbi7
	nI3LladdRbcur9oa9hiHlPBC6Q==
X-Google-Smtp-Source: AGHT+IFfUv1SX/hbJsebXW64LoqO4z+xKfYYYcxyFEuF98CtB+fGpEpf0TJLAgmBv4HUBcG+PSmUkA==
X-Received: by 2002:a17:907:6d0e:b0:aba:667d:7cd6 with SMTP id a640c23a62f3a-aba667d805fmr235657566b.18.1739525394889;
        Fri, 14 Feb 2025 01:29:54 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 1/2] x86/emul: dump unhandled memory accesses for PVH dom0
Date: Fri, 14 Feb 2025 10:29:27 +0100
Message-ID: <20250214092928.28932-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250214092928.28932-1-roger.pau@citrix.com>
References: <20250214092928.28932-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A PV dom0 can map any host memory as long as it's allowed by the IO
capability range in d->iomem_caps.  On the other hand, a PVH dom0 has no
way to populate MMIO region onto it's p2m, so it's limited to what Xen
initially populates on the p2m based on the host memory map and the enabled
device BARs.

Introduce a new debug build only printk that reports attempts by dom0 to
access addresses not populated on the p2m, and not handled by any emulator.
This is for information purposes only, but might allow getting an idea of
what MMIO ranges might be missing on the p2m.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/emulate.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index 0d90cc4598be..8aa7e49c056c 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -337,6 +337,9 @@ static int hvmemul_do_io(
         /* If there is no suitable backing DM, just ignore accesses */
         if ( !s )
         {
+            if ( is_mmio && is_hardware_domain(currd) )
+                gdprintk(XENLOG_DEBUG, "unhandled memory %s to %#lx size %u\n",
+                         dir ? "read" : "write", addr, size);
             rc = hvm_process_io_intercept(&null_handler, &p);
             vio->req.state = STATE_IOREQ_NONE;
         }
-- 
2.46.0


