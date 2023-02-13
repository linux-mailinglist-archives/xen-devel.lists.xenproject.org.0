Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7D4694955
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 15:58:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494609.764761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRaHP-0001xy-EE; Mon, 13 Feb 2023 14:58:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494609.764761; Mon, 13 Feb 2023 14:58:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRaHP-0001tW-6n; Mon, 13 Feb 2023 14:58:07 +0000
Received: by outflank-mailman (input) for mailman id 494609;
 Mon, 13 Feb 2023 14:58:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sHlb=6J=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pRaHN-00012P-IR
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 14:58:05 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1cb4403-abae-11ed-933c-83870f6b2ba8;
 Mon, 13 Feb 2023 15:58:05 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id w3so6279037edc.2
 for <xen-devel@lists.xenproject.org>; Mon, 13 Feb 2023 06:58:05 -0800 (PST)
Received: from uni.router.wind (adsl-89.109.242.225.tellas.gr.
 [109.242.225.89]) by smtp.googlemail.com with ESMTPSA id
 v1-20020a50a441000000b004aab66d34c7sm6787617edb.7.2023.02.13.06.58.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 06:58:04 -0800 (PST)
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
X-Inumbo-ID: d1cb4403-abae-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ujMzxZfrYB5JFSrASU3fn2r5SzOae7nTM8nRB1r5wJY=;
        b=qQUzqofAB7XHVlMOJ9/FiXdsAacgiS1HSqi/8gBRNXvR56Oj4eO3O8SJgrLiL9tVEt
         rfBTy+Qs9j5FxHLjB1uR8NE7soc6tL4v/cm6P4jMtPXiknjOjvWhOrZOUh6zb0ijU4Ep
         cr0sJL06LieL2T8A2eJgMYsz/7AqDWm0Ld+lEgshwqK1DKHLXbtXO9NTqn5sUqjyQxxZ
         VInXFl0fSpMym4dxoxV7fcorKp0jetIjKw+QeKDPOiuktGtcGGSZevTby+s9p3xDwi5r
         JeimrvjdRoXR2C+eEggRYLl22PNakIG5w572SRtHitcKA6yytQRD4oIF4KprCY+6Dk4G
         H9pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ujMzxZfrYB5JFSrASU3fn2r5SzOae7nTM8nRB1r5wJY=;
        b=gSAoZc59SWV6eX6ercuQFVU5I+i81uIPNtgRzftWyVYdLXFMeAeT2MCudJyIoCXzR6
         b6z3lAAjNNuPXau3tV91fGVfuU6kU0NP9kXa3Jph3PlHtEwV9F3YlBOzwVm/GhuidNsz
         l2DOs3EBZnu9sQl54jOXZ5FfLtHZstPliUz5uxkfEsV61ht97Sy8uDu9ziDBqfKPPbaI
         FsSESlidVUkoI7WB2c01uryJGxQT995uqhrB03TxWZnyUrC5s9Hlzs/mB5T7hbEurcgB
         JTZqU/G5RujoJrlrdPDeWMX55gAsc589/4Ag6p5MtURraVZUdenUKQiQsch2xBuYAELj
         +tlQ==
X-Gm-Message-State: AO0yUKVdyxDasLRnSTP8XxoOvpQmFPxaI64pD94dlOubufBX7EAG3Oky
	DQI0YsoEJ18IWg51o46IlWfSx+t20E0=
X-Google-Smtp-Source: AK7set/AgUit0BtL52XxsnBZB07JuKhunWPqAOd3skmpuIm61VEmLFWBGHZlfOt4Hgg3BEozgoJVnA==
X-Received: by 2002:a50:d547:0:b0:4ab:15d9:2dae with SMTP id f7-20020a50d547000000b004ab15d92daemr19565683edj.14.1676300284612;
        Mon, 13 Feb 2023 06:58:04 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [RFC 04/10] x86/vpmu: separate AMD-V and Intel VT-x init arch_vpmu_ops initializers
Date: Mon, 13 Feb 2023 16:57:45 +0200
Message-Id: <20230213145751.1047236-5-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230213145751.1047236-1-burzalodowa@gmail.com>
References: <20230213145751.1047236-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function core2_vpmu_init() is VT-x specific while the functions
amd_vpmu_init() and hygon_vpmu_init() are AMD-V specific, thus need to be
guarded with INTEL_VMX and AMD_SVM, respectively.
Instead of adding #ifdef guards around the function calls in common vpu code,
implement them as static inline null-returning functions when the respective
technology is not enabled.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/arch/x86/include/asm/vpmu.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/xen/arch/x86/include/asm/vpmu.h b/xen/arch/x86/include/asm/vpmu.h
index 05e1fbfccf..1e08afb7af 100644
--- a/xen/arch/x86/include/asm/vpmu.h
+++ b/xen/arch/x86/include/asm/vpmu.h
@@ -53,9 +53,18 @@ struct arch_vpmu_ops {
 #endif
 };
 
+#ifdef CONFIG_INTEL_VMX
 const struct arch_vpmu_ops *core2_vpmu_init(void);
+#else
+static inline const struct arch_vpmu_ops *core2_vpmu_init(void) { return NULL; }
+#endif /* CONFIG_INTEL_VMX */
+#ifdef CONFIG_AMD_SVM
 const struct arch_vpmu_ops *amd_vpmu_init(void);
 const struct arch_vpmu_ops *hygon_vpmu_init(void);
+#else
+static inline const struct arch_vpmu_ops *amd_vpmu_init(void) { return NULL; }
+static inline const struct arch_vpmu_ops *hygon_vpmu_init(void) { return NULL; }
+#endif /* CONFIG_AMD_SVM */
 
 struct vpmu_struct {
     u32 flags;
-- 
2.37.2


