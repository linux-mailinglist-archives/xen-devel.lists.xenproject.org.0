Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 515B89BCF71
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2024 15:34:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830259.1245227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8Kd2-00034q-8w; Tue, 05 Nov 2024 14:33:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830259.1245227; Tue, 05 Nov 2024 14:33:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8Kd2-00031U-5h; Tue, 05 Nov 2024 14:33:56 +0000
Received: by outflank-mailman (input) for mailman id 830259;
 Tue, 05 Nov 2024 14:33:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SSsw=SA=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t8Kd1-0002K5-BR
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2024 14:33:55 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fac9d3cc-9b82-11ef-a0c5-8be0dac302b0;
 Tue, 05 Nov 2024 15:33:53 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5c9454f3bfaso7202689a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 05 Nov 2024 06:33:53 -0800 (PST)
Received: from localhost.localdomain ([217.156.233.154])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cee6a99ff2sm1395047a12.4.2024.11.05.06.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 06:33:51 -0800 (PST)
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
X-Inumbo-ID: fac9d3cc-9b82-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmMiLCJoZWxvIjoibWFpbC1lZDEteDUyYy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImZhYzlkM2NjLTliODItMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwODE3MjMzLjE3MDk3NSwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730817232; x=1731422032; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uaCt1R4em9pfxDQHOMV7fnt5XQRHenhzTeTJnqdZ8nU=;
        b=U+6rm4YdBHLDfOu0p9aWuoNvXtPwm5fOGfBLvI5eRG9b5Wibfu36JvITuwWi514VZM
         Oes2x8qGRCKxbi6s6Puc4o8U+j4xZjgJoixfdkZUnOW23S4lmDhBMid3F8Y4ptfWGOF7
         8Ph11yIpZgNRhqlpzGTv81BfPOSNVvROF2r34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817232; x=1731422032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uaCt1R4em9pfxDQHOMV7fnt5XQRHenhzTeTJnqdZ8nU=;
        b=trbXY5QIb6gHQvGZhrLCWp0EqV7AlemqGTtYxUxU9B+mewAVKiF2AzFg/TdjHdg9LS
         78+pqrQjKIuoZ4meprlCRn8s/liZ2LS4QwDMARChMeHSKFu4y6r8gyCi9H9MmkWD9PRZ
         bWdpizA0WnH14dAcuyuHSaZTim5sfmvv2vfWvIcFYdHfEE67smy20g6nMWGk8tPnqQ+S
         gXgEwvH4K1JlbZhXyY5Ts3X0KhHYjzlelWZ/StW5GHAVY1Fkw3uNoMCMqVPMP5Cjp76T
         o4uzMsmIe86FnAmtZpe1em08Px2LXwc59KWxbfd9FDznK9ZIFDpWZuz+foYB1+USYuW+
         U1Aw==
X-Gm-Message-State: AOJu0Yyl6A8QYfjLTRgsvzwShDIr5fvYUv45KU4EKHxSQY3gVdeSGHfw
	zrLqZFKXkRg62kqQ2BmHSQfo0Mx/EK4ZQWAqUxZ0HmLZTk0iA9VAcHinOxo3oqR55ul2i3fBDZO
	o
X-Google-Smtp-Source: AGHT+IHkwmMqPA6QHCDQwMcBPOeKV84ETVsWV5zBo30jGJZIha1WDr3qXV57i1sevxjjrvQV5bhAwQ==
X-Received: by 2002:a05:6402:4405:b0:5ce:dfab:e2f5 with SMTP id 4fb4d7f45d1cf-5cedfabe3f0mr2954851a12.13.1730817231901;
        Tue, 05 Nov 2024 06:33:51 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 04/13] x86/fpu: Map/umap xsave area in vcpu_{reset,setup}_fpu()
Date: Tue,  5 Nov 2024 14:33:01 +0000
Message-ID: <20241105143310.28301-5-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241105143310.28301-1-alejandro.vallejo@cloud.com>
References: <20241105143310.28301-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional change.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v2:
  * No change
---
 xen/arch/x86/i387.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/i387.c b/xen/arch/x86/i387.c
index 3add0025e495..a6ae323fa95f 100644
--- a/xen/arch/x86/i387.c
+++ b/xen/arch/x86/i387.c
@@ -304,8 +304,10 @@ int vcpu_init_fpu(struct vcpu *v)
 
 void vcpu_reset_fpu(struct vcpu *v)
 {
+    struct xsave_struct *xsave_area = VCPU_MAP_XSAVE_AREA(v);
+
     v->fpu_initialised = false;
-    *v->arch.xsave_area = (struct xsave_struct) {
+    *xsave_area = (struct xsave_struct) {
         .fpu_sse = {
             .mxcsr = MXCSR_DEFAULT,
             .fcw = FCW_RESET,
@@ -313,15 +315,21 @@ void vcpu_reset_fpu(struct vcpu *v)
         },
         .xsave_hdr.xstate_bv = X86_XCR0_X87,
     };
+
+    VCPU_UNMAP_XSAVE_AREA(v, xsave_area);
 }
 
 void vcpu_setup_fpu(struct vcpu *v, const void *data)
 {
+    struct xsave_struct *xsave_area = VCPU_MAP_XSAVE_AREA(v);
+
     v->fpu_initialised = true;
-    *v->arch.xsave_area = (struct xsave_struct) {
+    *xsave_area = (struct xsave_struct) {
         .fpu_sse = *(const fpusse_t*)data,
         .xsave_hdr.xstate_bv = XSTATE_FP_SSE,
     };
+
+    VCPU_UNMAP_XSAVE_AREA(v, xsave_area);
 }
 
 /* Free FPU's context save area */
-- 
2.47.0


