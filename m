Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4987EB2DF
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 15:56:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632697.987058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2uqE-0004WH-G9; Tue, 14 Nov 2023 14:56:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632697.987058; Tue, 14 Nov 2023 14:56:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2uqE-0004Tn-Cp; Tue, 14 Nov 2023 14:56:38 +0000
Received: by outflank-mailman (input) for mailman id 632697;
 Tue, 14 Nov 2023 14:56:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6V1E=G3=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1r2uaI-0003b0-Gl
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 14:40:10 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b58ac18b-82fb-11ee-9b0e-b553b5be7939;
 Tue, 14 Nov 2023 15:40:09 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-9d2e7726d5bso856523766b.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 Nov 2023 06:40:09 -0800 (PST)
Received: from m1x-phil.lan (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr.
 [176.184.25.155]) by smtp.gmail.com with ESMTPSA id
 y10-20020a1709064b0a00b009dd7bc622fbsm5606206eju.113.2023.11.14.06.40.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 14 Nov 2023 06:40:08 -0800 (PST)
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
X-Inumbo-ID: b58ac18b-82fb-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699972808; x=1700577608; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CAcrCtDRFE27SgAEHRwd23jK5KSLpjZ+znXdyGAiZas=;
        b=TFC8KGRi8SIsVI/CJymk087sb+4rTj/4Nrfn+7QKf4+LMREqrfj1cjE96SgWsq7+c2
         tk9BH5oEdnuVfWJWFoPe2TTQz0v4Gt9Y6b7coNgBzsE5DgZaMsS2PBEeKt13/a8Ije5M
         rX6D+ptjmJBteV2w8iicbQ2DO8DMVLf2Px5dOCOBSOwKbuXsgTy4qjPhBTIP3qu6V58y
         gsiDn+wlRY8/VlB4avWYO7FCixRp/Z9HvH48d/wPN/h+yanJuNybgQU76mLoLMb/yWcu
         Hl403+GS3cqEhoWCN9nwwSCJym42kcyC3QuIzJAvOq7G3o/46Tc8t2joXp9zWGDFwwZf
         eZWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699972808; x=1700577608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CAcrCtDRFE27SgAEHRwd23jK5KSLpjZ+znXdyGAiZas=;
        b=BOy3v7+7PTmyAl732iSU3KVmuDZkNAhveUl+NpIlhIFRchFRH2PzFAWcnkT9Jvxk9V
         qmsrhE9/tIwBIRJ3G2QNTO2nmdB6BGEgvahjLz0cTAwrEMEpowGhhRhiuxDUl/2r4nnK
         +8XSz52sMHdLnSVvnofyxqQo5BJtz5SW+iu9DT0LjfZyh3llDM+BGpwsT2d0X9D50n4K
         iXWKxoFRf7T2MhYM3Uf3KeIwLU8vqYzFZaqT5gMqLdS3BhG1Fh7+QuJStiWLi0aBFpUc
         agHKP6DAQMyI4vzXeMta+WLG3wCALSEjL0MRlv969KER+MXCeMSdsTwuWPv5SYxgkTM9
         pn5g==
X-Gm-Message-State: AOJu0Yx17B+dDe5VHSJwSnyRuCeAm6Xk2lJG2m4x/Srx9XJAOmdQh/Rw
	gwC/tDxdLzw8jMJvuzRKSfTL7A==
X-Google-Smtp-Source: AGHT+IFRbdN3aM58BgezwVky3EFK69MoaorjbUe4txfqvi/Mr07fntHT95KnMqBlE8Dz9TGy0ZX5tw==
X-Received: by 2002:a17:907:9848:b0:9dd:5adc:b1d2 with SMTP id jj8-20020a170907984800b009dd5adcb1d2mr6678484ejc.38.1699972808614;
        Tue, 14 Nov 2023 06:40:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: David Woodhouse <dwmw@amazon.co.uk>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paul Durrant <paul@xen.org>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	qemu-block@nongnu.org,
	Anthony Perard <anthony.perard@citrix.com>,
	kvm@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0 v2 16/19] hw/xen/xen_pt: Add missing license
Date: Tue, 14 Nov 2023 15:38:12 +0100
Message-ID: <20231114143816.71079-17-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231114143816.71079-1-philmd@linaro.org>
References: <20231114143816.71079-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Commit eaab4d60d3 ("Introduce Xen PCI Passthrough, qdevice")
introduced both xen_pt.[ch], but only added the license to
xen_pt.c. Use the same license for xen_pt.h.

Suggested-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/xen/xen_pt.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/xen/xen_pt.h b/hw/xen/xen_pt.h
index 31bcfdf705..d3180bb134 100644
--- a/hw/xen/xen_pt.h
+++ b/hw/xen/xen_pt.h
@@ -1,3 +1,13 @@
+/*
+ * Copyright (c) 2007, Neocleus Corporation.
+ * Copyright (c) 2007, Intel Corporation.
+ *
+ * SPDX-License-Identifier: GPL-2.0-only
+ *
+ * Alex Novik <alex@neocleus.com>
+ * Allen Kay <allen.m.kay@intel.com>
+ * Guy Zana <guy@neocleus.com>
+ */
 #ifndef XEN_PT_H
 #define XEN_PT_H
 
-- 
2.41.0


