Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC26B9BCF7C
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2024 15:34:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830264.1245278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8Kd9-0004VH-V5; Tue, 05 Nov 2024 14:34:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830264.1245278; Tue, 05 Nov 2024 14:34:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8Kd9-0004S5-P0; Tue, 05 Nov 2024 14:34:03 +0000
Received: by outflank-mailman (input) for mailman id 830264;
 Tue, 05 Nov 2024 14:34:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SSsw=SA=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t8Kd7-0002Lm-IY
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2024 14:34:01 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe1b1500-9b82-11ef-99a3-01e77a169b0f;
 Tue, 05 Nov 2024 15:33:58 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5ceb03aadb1so5994427a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Nov 2024 06:33:58 -0800 (PST)
Received: from localhost.localdomain ([217.156.233.154])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cee6a99ff2sm1395047a12.4.2024.11.05.06.33.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 06:33:57 -0800 (PST)
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
X-Inumbo-ID: fe1b1500-9b82-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmIiLCJoZWxvIjoibWFpbC1lZDEteDUyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImZlMWIxNTAwLTliODItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwODE3MjM4LjQ4OTUwOSwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730817237; x=1731422037; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BUizmB3LOGfKPH6kG1rx3VM0wuv9I8IHhRkqZT/M2eQ=;
        b=cJ5Uk17YC/EeN0s7Q0qiduCn0XP1QI1BdjdN7S1G4LABL/8Brkd2cO+p6wpZeQ2nwI
         ICp+gJycQ+wjPaDWvxLpZzagDqoV03Xd+MrAFU+PVDFQmv/uzXAprdSUfYCXQpT0AjSB
         88BMFVCWaIzZ2Y0V/mtaO4qMn6SBD+b0IYiqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817237; x=1731422037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BUizmB3LOGfKPH6kG1rx3VM0wuv9I8IHhRkqZT/M2eQ=;
        b=lZ28g9O3392r5N1YZV6q81edJJGvurxPcci5cauHgERnD6u28Z+igdiSEdkgcbyMGh
         SW7NJhxamYC5UxjZV/5JJYBI7zLvzH4xXYP1yXrhN5PB/ukUwQHcm+6hT9Zg1Si+K5dz
         cUJn01Svh0zjOsTOUR5d+Xy30iOHzTWpgSsP8QiwqD6btMXjCl0AqllPv+iiTtHPfylo
         IDVqp2AAGM81/lL+RJ/Guq6NWjI+JGViHQGVtrVXiZEJCQIsfyxWc82p1Kkm0NpxF1dY
         z2FnwFo9Mi3yycxo1GMaFiCKuXJNpNSxNKSxui0eClVidhuDgsxYv1O+DHBBaC6IXDwh
         0Bhg==
X-Gm-Message-State: AOJu0YzSYsUAnTmb8caZrr4X+ezoBf/38zSHn2000n3cBAfR1o01DJSc
	eHUls62XsyntOJAGerI6l8UkduI15qVzmq1vRXalquNl7HoWVIjjRuW+NOxPmLfkjeeat/zjpN4
	Z
X-Google-Smtp-Source: AGHT+IEiUJOQD7yv0Jo69qAsBZhZGsSu6R1qeHwLDHYDgogg18wiMRIt9gk6zfpbL/A+gvmG/cfj6w==
X-Received: by 2002:a05:6402:42d6:b0:5ce:d01e:bf79 with SMTP id 4fb4d7f45d1cf-5ced01ebfccmr6412282a12.2.1730817237507;
        Tue, 05 Nov 2024 06:33:57 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 08/13] x86/xstate: Map/unmap xsave area in {compress,expand}_xsave_states()
Date: Tue,  5 Nov 2024 14:33:05 +0000
Message-ID: <20241105143310.28301-9-alejandro.vallejo@cloud.com>
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
 xen/arch/x86/xstate.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index 401bdad2eb0d..6db7ec2ea6a9 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -177,7 +177,7 @@ static void setup_xstate_comp(uint16_t *comp_offsets,
  */
 void expand_xsave_states(const struct vcpu *v, void *dest, unsigned int size)
 {
-    const struct xsave_struct *xstate = v->arch.xsave_area;
+    const struct xsave_struct *xstate = VCPU_MAP_XSAVE_AREA(v);
     const void *src;
     uint16_t comp_offsets[sizeof(xfeature_mask)*8];
     u64 xstate_bv = xstate->xsave_hdr.xstate_bv;
@@ -228,6 +228,8 @@ void expand_xsave_states(const struct vcpu *v, void *dest, unsigned int size)
 
         valid &= ~feature;
     }
+
+    VCPU_UNMAP_XSAVE_AREA(v, xstate);
 }
 
 /*
@@ -242,7 +244,7 @@ void expand_xsave_states(const struct vcpu *v, void *dest, unsigned int size)
  */
 void compress_xsave_states(struct vcpu *v, const void *src, unsigned int size)
 {
-    struct xsave_struct *xstate = v->arch.xsave_area;
+    struct xsave_struct *xstate = VCPU_MAP_XSAVE_AREA(v);
     void *dest;
     uint16_t comp_offsets[sizeof(xfeature_mask)*8];
     u64 xstate_bv, valid;
@@ -294,6 +296,8 @@ void compress_xsave_states(struct vcpu *v, const void *src, unsigned int size)
 
         valid &= ~feature;
     }
+
+    VCPU_UNMAP_XSAVE_AREA(v, xstate);
 }
 
 void xsave(struct vcpu *v, uint64_t mask)
-- 
2.47.0


