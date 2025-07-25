Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEA3B12094
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 17:07:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1058057.1425731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufK0y-0002ch-PC; Fri, 25 Jul 2025 15:07:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1058057.1425731; Fri, 25 Jul 2025 15:07:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufK0y-0002VC-LH; Fri, 25 Jul 2025 15:07:16 +0000
Received: by outflank-mailman (input) for mailman id 1058057;
 Fri, 25 Jul 2025 15:07:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DJoT=2G=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1ufK0x-0002MQ-GZ
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 15:07:15 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ba6d494-6969-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 17:07:13 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-60c5b8ee2d9so4565899a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 25 Jul 2025 08:07:13 -0700 (PDT)
Received: from localhost.localdomain ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-614cd0f730fsm2194208a12.22.2025.07.25.08.07.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jul 2025 08:07:12 -0700 (PDT)
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
X-Inumbo-ID: 0ba6d494-6969-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1753456033; x=1754060833; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WjJUuOkVkjeeAsMY8i9Mv8bOHKA0v2O1WG6n4OAsjLs=;
        b=V7R/CHIEcs+Qh4oC+N3xAobvNmlCX8H3WOOMPQcUkYJAAS2Ep68MKbefaRZJru0rk2
         YLBsfNZONcRP9sn5mckq129mcyUpzzQpcLZ52mWUrt8o6x1+mDenJiq8e0xNMZsrVn9B
         1C/kv6V+rwu09tjEOSpdaM/0XTMNeOzWANCCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753456033; x=1754060833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WjJUuOkVkjeeAsMY8i9Mv8bOHKA0v2O1WG6n4OAsjLs=;
        b=sOFIBt4u6gZd4YQj4JbD+BqjBtf56ruA7b5FnlcOVkHaqcTo0KSxdA92E6CJTXeGwU
         NHcPNb+Q1Cxdbmth/PrVfVqQJNhQeiN/B+2YqAQ6FGBPmUolivAZDZIQpnz/Vs4NjKU8
         Cjk/r4teU24bJa3BBW746yzO2oCPHuSExyYhi7TOVXsXx4kbKyR9j/PgpK4aEzc32e3G
         tyCZBpEWDmWv5hKJ/JkmsUQj7DkuimJ6rsJx0WKSE2Erp3W6nETZvupbgnDD1IS3coUg
         dEEvpK0zf+vWr/d8sZHRXh4DdlfQAnYWnAtVDrLZ1jgzicayTOFBD7cIFfbqgR2ZYbb9
         rafQ==
X-Gm-Message-State: AOJu0YxSUGCnuKQJdB8ujRSyRg8RPO+6KUbzTqCimhG8dkPGFFBvmMlh
	NsxqV3iS3hBh6mHbp6S9/wJ1H62aXuRpJ61mIxdM4X+BVwikPkcmUyViEYoNB51GJjgu1h1VnrI
	GuKR/oIU=
X-Gm-Gg: ASbGnct1GBID54CDFwspivGH3/n+ocAC0XsGoeBb9d1mVou1nl8c7vdix9VVh5wRgV8
	SbgYcsmjnZMelJVWoX8hD8V4pikjgnmbihqGeWpRyykJUl7DLf4YUXMHRy0bjzkaGVi2Q10SyRd
	5Bqj+N2V8Z1MYUnXGfJFvj09IgPHZhLfwToBYlbint3yMx1ONrOcAPUroMt9dK3C8NdMcIdDeei
	PfuXsD6iM3gDHvxfXw4MBrTlFssRiL3vLXzSJrlaxgolhP1vQTelX1dnTPFlv/wukW/hxZbFObv
	62Sy4wiSaJlaC5A0rnPxTBtG+qLHu5juJ1Y87UDn3dUEhadamPaHBbfCsW2zBl/KveFAzOT6vY5
	NeOIONYGa22I7OV6wGgJf9K3/pqYVz+IotYpr
X-Google-Smtp-Source: AGHT+IE1RlHK5S4tEzuYbFc3r98R2pHtlcQZi02L4eIuKkTVKrqlsurFhfmiXkDse6o9kTwjD6XcgQ==
X-Received: by 2002:a05:6402:1ed6:b0:60c:461e:7199 with SMTP id 4fb4d7f45d1cf-614f1bb98f0mr2068972a12.9.1753456033074;
        Fri, 25 Jul 2025 08:07:13 -0700 (PDT)
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	andriy.sultanov@vates.tech,
	boris.ostrovsky@oracle.com
Subject: [RFC PATCH v1 02/10] arch-x86/pmu.h: document current memory layout for VPMU
Date: Fri, 25 Jul 2025 16:06:38 +0100
Message-ID: <5602e488bfa9b06e46e2a374d40ff4a617feb512.1753372928.git.edwin.torok@cloud.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1753372928.git.edwin.torok@cloud.com>
References: <cover.1753372928.git.edwin.torok@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There are nested structs, unions, padding and flexible array members.
The interpretation of the flexible array members is all done with
pointer arithmetic, it is useful to visualize the actual memory layout.

The ascii-art drawing is compatible with ascii-art-to-unicode (aa2u) fro
m hackage.

No functional change.

Signed-off-by: Edwin Török <edwin.torok@cloud.com>
---
 xen/include/public/arch-x86/pmu.h | 63 +++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/xen/include/public/arch-x86/pmu.h b/xen/include/public/arch-x86/pmu.h
index d0a99268af..8be71a88ee 100644
--- a/xen/include/public/arch-x86/pmu.h
+++ b/xen/include/public/arch-x86/pmu.h
@@ -129,6 +129,69 @@ struct xen_pmu_arch {
 typedef struct xen_pmu_arch xen_pmu_arch_t;
 DEFINE_XEN_GUEST_HANDLE(xen_pmu_arch_t);
 
+/* Memory layout:
+*                .---------------------.
+*                | struct xen_pmu_data |
+* +==============+=====================+=======================+ <.
+* | vcpu_id                                                    |  |
+* +------------------------------------------------------------+  |
+* | pcpu_id                                                    |  |
+* +------------------------------------------------------------+  |
+* | domain_id                                                  |  |
+* +------------------------------------------------------------+  |
+* |##pad#######################################################|  |
+* +====+=+===+==================+==============================+  |
+* | pmu| | r | regs             |##pad#########################|  |
+* +----. +---. (xen or guest)   |##############################|  |
+* |      +======================+==============================+  |
+* |      | pmu_flags                                           |  |
+* |      +===+====================+============================+  |
+* |      | l | lapic_lvtpc        |############################|  |
+* |      +---. ###################|##pad#######################|  |
+* |      |     ###################|############################|  |
+* |      +===+=+=======+=====+====+====+=======+========+======+  |
+* |      | c | |       | amd |    |    | intel |         |#####|  |
+* |      +---+ |       .-----.    |    .-------.         |#####|  |
+* |      |     | counter          | fixed_counters       |#####|  | 
+* |      |     +------------------+----------------------+#####|  |
+* |      |     | ctrls            | arch_counters        |#####|  |
+* |      |     +=====+========+===+----------------------+#####|  |
+* |      |     |     | regs[] |  :| global_ctrl          |#####|  |
+* |      |     |     +--------.  :+----------------------+#####|  |
+* |      |     |struct           :| global_ovf_ctrl      |#####|  |
+* |      |     |xen_pmu_cntr_pair:+----------------------+#####|  |
+* |      |     |[counters]       :| global_status        |#####|  |
+* |      |     |                 :+----------------------+#####|  |
+* |      |     |                 :| fixed_ctrl           |#####|  |
+* |      |     |                 :+----------------------+#####|  |
+* |      |     |                 :| ds_area              |#####|  |
+* |      |     |                 :+----------------------+#####|  |
+* |      |     |                 :| pebs_enable          |#pad#|  |
+* |      |     |                 :+----------------------+#####|  |
+* |      |     |                 v| debugctl             |#####|  |
+* |      |     |##################+=======+========+=====+#####|  |
+* |      |     |##################|       | regs[] | :[0]|#####|  |
+* |      |     |##################|       +--------. :   |#####|  |
+* |      |     |##################| uint64_t         :   |#####|  |
+* |      |     |##################| [fixed_counters] :   |#####|  |
+* |      |     |##################|                  :   |#####|  |
+* |      |     |##################|                  :   |#####|  |
+* |      |     |##################| -----------------:   |#####|  |
+* |      |     |##################|  struct          :   |#####|  |
+* |      |     |##################| xen_pmu_cntr_pair:   |#####|  |
+* |      |     +==================+ [arch_counters]  :   +=====+  | 
+* |      |                        |                  :   |     |  |
+* |      |                        |                  v   |     |  |
+* |      |                        +======================+     |  |
+* |      +=====================================================+  |
+* +==========================+=================================+  |
+* |############################################################|  |
+* ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::  :
+* ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::  :
+* |############################################################|  | PAGE_SIZE
+* +=========+==================================================+ <.
+*/
+
 #endif /* __XEN_PUBLIC_ARCH_X86_PMU_H__ */
 /*
  * Local variables:
-- 
2.47.1


