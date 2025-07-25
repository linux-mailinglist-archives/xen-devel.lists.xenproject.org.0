Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF40B12095
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 17:07:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1058056.1425724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufK0y-0002Ut-DP; Fri, 25 Jul 2025 15:07:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1058056.1425724; Fri, 25 Jul 2025 15:07:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufK0y-0002OZ-Ac; Fri, 25 Jul 2025 15:07:16 +0000
Received: by outflank-mailman (input) for mailman id 1058056;
 Fri, 25 Jul 2025 15:07:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DJoT=2G=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1ufK0w-0002MQ-GV
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 15:07:14 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b3b2364-6969-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 17:07:13 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-612b67dcb89so3504813a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 25 Jul 2025 08:07:13 -0700 (PDT)
Received: from localhost.localdomain ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-614cd0f730fsm2194208a12.22.2025.07.25.08.07.11
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
X-Inumbo-ID: 0b3b2364-6969-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1753456032; x=1754060832; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1gldfYEC90AFOymeYiJGOOlK0XDlSS3TK6PUeJ5xsBI=;
        b=cBHv1C3FDjwscy8jGz/R5WDHwVMSSs0oHTJhNMocrIkehQXHZSZ9iHEQFJu/Ys4M5w
         73v0o42BBjNC5gO4OSY913E8QSC9Bi4T+l+EW8lSNzAhZMVCGAdlQNra+5E1IX7ysW3j
         9eyak0V7jDYGBY8q4TZeh5yVHrnIQAe7MXXjQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753456032; x=1754060832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1gldfYEC90AFOymeYiJGOOlK0XDlSS3TK6PUeJ5xsBI=;
        b=HCCtoRFP925ZL8sNMefn9O8EoS+8HAUslVK+7kLfqGNYxYEXzJJ9D2M9gQJW4cIw/z
         J0UT7J0US0nzdrQ3fGfgz8rWF9BgPfFVG9VUw+D7lx20pxRHAwCHQalnyxDSMLLvWP6I
         v9HzYx95V5s3zRJiMHJKbCupUpBynCS0++goWsKEVJi5A3MfYOFeVTEG4JLKlK1QCaAT
         42OfV+pbBxi29L7FWCxd2Uj7PpHG615PIyurPQW/paHWDG1Xqzs4z8UpyCZ26GJz1v4X
         /+zuw/0S/wvhqSxc/lX+ePgjgWzmjg3A2hKK9Dw6PKzfCTScRueG9HdqGMhvJkQFsdy3
         1qHw==
X-Gm-Message-State: AOJu0Yyvl6xTvQNjtimb78BSVB5ABgh6LxhILMGz6YZxregRhkgCp9M2
	ruUnNRIBBuDDF1MNFWn9rqivm9unOb6uHKlkZQ1pnOFew25X1rF0hZsP283OM2MDtIHk2ua6LQq
	UPJ+OwX4=
X-Gm-Gg: ASbGncvS2dffXDc9aekUFp32uXNUQGIxZx3N1HhaoSORdTStRj7atWJGTxZsSHi9pZ7
	DK8shiTfsfki7LDZolUUaSEJ7jsYiLGUwjCyU1TLA5aXM4vUOsSzvSn7OkTRqvs8wGwktYmTAa1
	3Ho4D4Wrlo9NHPwQMDfE6vxGUjkP0fkEr8cQptmh70tFWEdJaBvUsB/8m387WNwueF0qVeOTF4e
	8f23YXreSAwin6mILbmyY/agCWdu62DnQOIpujKvLl+/mrrZHu75aKLVJSYh8EcWNMMo4vjfESN
	EvkqbykneZItNKmee61yFcI9U2Z6GaYrNkWhObIBJILtOwVtyXIs04cW3t72pQp35Aw1RFuS410
	H4fO9c4+LRmDUbQo6DNuHaIgWy2rUuAPOaMt3ZrFjRKClx90=
X-Google-Smtp-Source: AGHT+IFAm1oNjhbrdoGhR81wq/e3CncUbkScUIHos9elHA3eI3eDgJstaeMlhqb8CDcy8aQ3pUiwAA==
X-Received: by 2002:a05:6402:270b:b0:612:d3ce:26be with SMTP id 4fb4d7f45d1cf-614f1dccaa6mr2276305a12.16.1753456032472;
        Fri, 25 Jul 2025 08:07:12 -0700 (PDT)
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	andriy.sultanov@vates.tech,
	boris.ostrovsky@oracle.com
Subject: [RFC PATCH v1 01/10] pmu.h: add a BUILD_BUG_ON to ensure it fits within one page
Date: Fri, 25 Jul 2025 16:06:37 +0100
Message-ID: <80e7ae8bc1546b004e2b3dcc3f3e57563ff741d2.1753372928.git.edwin.torok@cloud.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1753372928.git.edwin.torok@cloud.com>
References: <cover.1753372928.git.edwin.torok@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Linux already has a similar BUILD_BUG_ON.
Currently this struct is ~224 bytes on x86-64.

No functional change.

Signed-off-by: Edwin Török <edwin.torok@cloud.com>
---
 xen/arch/x86/cpu/vpmu.c  | 1 +
 xen/include/public/pmu.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
index c28192ea26..7be79c2d00 100644
--- a/xen/arch/x86/cpu/vpmu.c
+++ b/xen/arch/x86/cpu/vpmu.c
@@ -401,6 +401,7 @@ static int vpmu_arch_initialise(struct vcpu *v)
     uint8_t vendor = current_cpu_data.x86_vendor;
     int ret;
 
+    BUILD_BUG_ON(sizeof(struct xen_pmu_data) > PAGE_SIZE);
     BUILD_BUG_ON(sizeof(struct xen_pmu_intel_ctxt) > XENPMU_CTXT_PAD_SZ);
     BUILD_BUG_ON(sizeof(struct xen_pmu_amd_ctxt) > XENPMU_CTXT_PAD_SZ);
     BUILD_BUG_ON(sizeof(struct xen_pmu_regs) > XENPMU_REGS_PAD_SZ);
diff --git a/xen/include/public/pmu.h b/xen/include/public/pmu.h
index af8b7babdd..15decc024d 100644
--- a/xen/include/public/pmu.h
+++ b/xen/include/public/pmu.h
@@ -93,6 +93,9 @@ DEFINE_XEN_GUEST_HANDLE(xen_pmu_params_t);
  * Architecture-independent fields of xen_pmu_data are WO for the hypervisor
  * and RO for the guest but some fields in xen_pmu_arch can be writable
  * by both the hypervisor and the guest (see arch-$arch/pmu.h).
+ *
+ * PAGE_SIZE bytes of memory are allocated.
+ * This struct cannot be larger than PAGE_SIZE.
  */
 struct xen_pmu_data {
     /* Interrupted VCPU */
-- 
2.47.1


