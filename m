Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C10C59BCF7D
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2024 15:34:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830263.1245267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8Kd7-00046v-GY; Tue, 05 Nov 2024 14:34:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830263.1245267; Tue, 05 Nov 2024 14:34:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8Kd7-000445-9f; Tue, 05 Nov 2024 14:34:01 +0000
Received: by outflank-mailman (input) for mailman id 830263;
 Tue, 05 Nov 2024 14:33:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SSsw=SA=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t8Kd5-0002Lm-Na
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2024 14:33:59 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd27942f-9b82-11ef-99a3-01e77a169b0f;
 Tue, 05 Nov 2024 15:33:56 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5c903f5bd0eso10245858a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 05 Nov 2024 06:33:56 -0800 (PST)
Received: from localhost.localdomain ([217.156.233.154])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cee6a99ff2sm1395047a12.4.2024.11.05.06.33.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 06:33:55 -0800 (PST)
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
X-Inumbo-ID: fd27942f-9b82-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzQiLCJoZWxvIjoibWFpbC1lZDEteDUzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImZkMjc5NDJmLTliODItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwODE3MjM2Ljg2NzczNywic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730817236; x=1731422036; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N6lX8wC6vemlWKb1ztmufWqxP8TDVhHXoJf9VFLSRv4=;
        b=kXktaJXveODNv06MYvImBltVodEW/gpD4YHFSbWOIr5/FQ0ZL1wY17TTvLyFLFt2kj
         7K1L7HUuzCY2akbGZAVx/hYV/Wl6lJ2TKKjTrw0YCf/Ih1xU1VPkSZhMXjqZw9orJjwH
         zeuGXsJU7IoqctZJhgUfzfouoi70kpNHEdGiE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817236; x=1731422036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N6lX8wC6vemlWKb1ztmufWqxP8TDVhHXoJf9VFLSRv4=;
        b=hxQmIs6iMOI7mT1GTmKe3MmY08Olxm58Yio+WBaSXYjHATMRVAqjlP+EyrL6KY+RyK
         cgp+BSBXvgnLSVDVwQuHfN9rVpTYGklNJbXjLBwKTMgt9w0Exqcmzqtw2hcnxHeEdNZx
         1iErhN3BPCOCvJ8wAW2l2VeMtQs6/+SeVqKmMLpTcuta/0dFDKYUWTXYor+l6N9ddr4J
         senpPPC4+NXe3rFk/rEwTBKQ7HRAJQk+/v27bX/ydrEjeLCUF9JRGzUfqB6rsSZMJB/w
         uw9pUIZ606jvg1aFWt5hNHf9CCBZcstiX0btKKaZ8FjyswtvuDlXLY3IqW/m5FMcfnMM
         RA3A==
X-Gm-Message-State: AOJu0YwyyhE8qfSKi8WT3weYnsqsHaEtGBYTBfJcfF1KcOa3MIRzaFX4
	j9IOBm5EfLVvA25wk2BI5vpebLVY35krSaK/WJRM7zbrRpTgiOa3IqZQeViddjOb/JW2XezJrPM
	v
X-Google-Smtp-Source: AGHT+IGVWmLvCB54DEgDhUuVvwOh11g5k5GHHLDORNT+WxCKbjVQgDKv6HikkcI8I3dUFbb80yEbnw==
X-Received: by 2002:a05:6402:520b:b0:5c9:6f20:4cf1 with SMTP id 4fb4d7f45d1cf-5cea971b4b5mr17021317a12.27.1730817235911;
        Tue, 05 Nov 2024 06:33:55 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 07/13] x86/domctl: Map/unmap xsave area in arch_get_info_guest()
Date: Tue,  5 Nov 2024 14:33:04 +0000
Message-ID: <20241105143310.28301-8-alejandro.vallejo@cloud.com>
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
 xen/arch/x86/domctl.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 5f01111619da..3044f706de1c 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -1377,16 +1377,17 @@ void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c)
     unsigned int i;
     const struct domain *d = v->domain;
     bool compat = is_pv_32bit_domain(d);
+    const struct xsave_struct *xsave_area;
 #ifdef CONFIG_COMPAT
 #define c(fld) (!compat ? (c.nat->fld) : (c.cmp->fld))
 #else
 #define c(fld) (c.nat->fld)
 #endif
 
-    BUILD_BUG_ON(sizeof(c.nat->fpu_ctxt) !=
-                 sizeof(v->arch.xsave_area->fpu_sse));
-    memcpy(&c.nat->fpu_ctxt, &v->arch.xsave_area->fpu_sse,
-           sizeof(c.nat->fpu_ctxt));
+    xsave_area = VCPU_MAP_XSAVE_AREA(v);
+    BUILD_BUG_ON(sizeof(c.nat->fpu_ctxt) != sizeof(xsave_area->fpu_sse));
+    memcpy(&c.nat->fpu_ctxt, &xsave_area->fpu_sse, sizeof(c.nat->fpu_ctxt));
+    VCPU_UNMAP_XSAVE_AREA(v, xsave_area);
 
     if ( is_pv_domain(d) )
         c(flags = v->arch.pv.vgc_flags & ~(VGCF_i387_valid|VGCF_in_kernel));
-- 
2.47.0


