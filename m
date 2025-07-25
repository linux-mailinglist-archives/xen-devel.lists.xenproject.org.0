Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9864AB1208F
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 17:07:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1058063.1425791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufK13-0003yW-NE; Fri, 25 Jul 2025 15:07:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1058063.1425791; Fri, 25 Jul 2025 15:07:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufK13-0003tk-81; Fri, 25 Jul 2025 15:07:21 +0000
Received: by outflank-mailman (input) for mailman id 1058063;
 Fri, 25 Jul 2025 15:07:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DJoT=2G=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1ufK11-0002MQ-VR
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 15:07:19 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e778261-6969-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 17:07:18 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-60c5b8ee2d9so4566074a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 25 Jul 2025 08:07:18 -0700 (PDT)
Received: from localhost.localdomain ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-614cd0f730fsm2194208a12.22.2025.07.25.08.07.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jul 2025 08:07:17 -0700 (PDT)
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
X-Inumbo-ID: 0e778261-6969-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1753456038; x=1754060838; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pgdrUaRK51EGFDQFL2vaOaEhFZOTQJ0jVrsmZeYmDCg=;
        b=SO6IRMWh/gS8wuFAIEbGqOVFcHgvJkfdkqWy8zzRA5BIVj72v6/d9a2Dh0cUkvcTMk
         DHpmCTngqCx0DWW8ynTcbLXgZknWevpnS6jtF4TvnHlfOoUf1/hhqLrrQb5gt+j/0qIO
         7Ka9or+FzHgRdit1h9tSdQ1ZrQ4vqq5TDLTR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753456038; x=1754060838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pgdrUaRK51EGFDQFL2vaOaEhFZOTQJ0jVrsmZeYmDCg=;
        b=BEp5Gy/5uS2CjwKjhd920y2LqZ0r6pIdO/50ft4+b5z0G2rjpbs4w9c09YD7vyYAeT
         PWMWvYsKh4+2QO4EsmxeaHg5v9xQ73YbtfphbudeZrJTsBTIgsUhCQaql7KwTFZvpM0X
         10yRrwJOeXFEmquhoT8YjHz7mTOpSqZasbmXQ5UFnjvAyDkQzVONMVr9+ilksRlaaUzW
         ruru6tdgHzZfHOdwYyuh6qOW08R08hpIl4JbnUQF/DgHPhRvCrOD8oRi64pUZzZA8mHs
         aX42YEPcoBm2kJ1VO4J8lLF/c36NAL+nJpDdigP+Ni1rXHQ6jvnIT4Ggqm9ZdRBsu+FF
         FYBg==
X-Gm-Message-State: AOJu0YwhsrMzbyShYbjyUuHOxYMt40qd2/h1nFdiSu4lYU6g+JkmTxnR
	Rkdb/UuSHEx7HBoIoD4D3ni4K7keRmD4IjBHGCF7He6faHNFCaPTOHDZOiItrpijQoWueaD9QkT
	hEYSPuJQ=
X-Gm-Gg: ASbGnctHKNuqbfU3JyyD4EBSWsmHpJQDsLeg/8INDglFDXPZXBu6XR0CQhUbVQKv1Os
	BhwPEzDDMq7Ra6qEtKAhEQMnNlueovgdh3O0hFqQMsnpmTXKfHE56VcMANnyf2KpLPo2CB01QQt
	eyFdldThyD5hjCf89FEAsAgUGBf7vQx41V3jxFT1Lfwo02YeeQxc069TzovZVbLLQ8OEU0kdMNy
	BQn4D3w4w0AAlLxmeWeIReCi4XRfLrASGa3xR3UjtOoQxcGdNY33/XTCvh1qd8YoLUMAvvAzXbN
	bLm29UHEF+9rwAG2G76iYnsXgAYLZCMnkRNLxvEEfCAO6FIMCitZez+bh6OzsJhE/liSz7CTnWS
	fMCkV3vB+Eeic7Fkj47R1uS07R+prBpwDMhZu
X-Google-Smtp-Source: AGHT+IFkZB1eCc3nFd05rIzbxLA6V7k3SXjt0e1xZdY+847AaGsGEpk/zqlZBztde+fqnZoNbtS/7A==
X-Received: by 2002:a05:6402:354f:b0:612:a77e:1816 with SMTP id 4fb4d7f45d1cf-614f0b348ebmr2142898a12.0.1753456037883;
        Fri, 25 Jul 2025 08:07:17 -0700 (PDT)
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	andriy.sultanov@vates.tech,
	boris.ostrovsky@oracle.com
Subject: [RFC PATCH v1 08/10] pmu.h: expose a hypervisor stacktrace feature
Date: Fri, 25 Jul 2025 16:06:44 +0100
Message-ID: <16c0a94b10578eaf1e033307dc2b8a9c4321a79b.1753372928.git.edwin.torok@cloud.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1753372928.git.edwin.torok@cloud.com>
References: <cover.1753372928.git.edwin.torok@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

For now this'll only be expected to work when the hypervisor is compiled
with frame pointers, and only when the domain is privileged enough to
profile Xen (i.e. it is the hardware domain running in HV or ALL modes).

The stacktrace feature is a flag, rather than a new mode, and would
simply report a stacktrace of depth 0 in other cases.
Old hypervisors with VPMU 0.1 would also report a stracktrace of depth
0, due to implicit zero-filling of the page that contains 'struct xen_pmu_data'.

This is just the interface, followup commit implements it.

No functional change.

Signed-off-by: Edwin Török <edwin.torok@cloud.com>
---
 xen/include/public/pmu.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/include/public/pmu.h b/xen/include/public/pmu.h
index 6366a79169..85b2bbed74 100644
--- a/xen/include/public/pmu.h
+++ b/xen/include/public/pmu.h
@@ -80,10 +80,12 @@ DEFINE_XEN_GUEST_HANDLE(xen_pmu_params_t);
  *                              Architectural Performance Events exposed by
  *                              cpuid and listed in the Intel developer's manual
  *                              (ignored on AMD).
+ * - XENPMU_FEATURE_HV_STACKTRACE: Hypervisor stacktraces (when compiled with frame pointers)
  */
 #define XENPMU_FEATURE_INTEL_BTS  (1<<0)
 #define XENPMU_FEATURE_IPC_ONLY   (1<<1)
 #define XENPMU_FEATURE_ARCH_ONLY  (1<<2)
+#define XENPMU_FEATURE_HV_STACKTRACE (1<<3)
 
 /*
  * Shared PMU data between hypervisor and PV(H) domains.
-- 
2.47.1


