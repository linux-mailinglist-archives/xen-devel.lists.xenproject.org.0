Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEA9A7F996
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 11:32:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.941663.1341101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u25Jt-0005Mn-51; Tue, 08 Apr 2025 09:32:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 941663.1341101; Tue, 08 Apr 2025 09:32:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u25Jt-0005KG-1x; Tue, 08 Apr 2025 09:32:37 +0000
Received: by outflank-mailman (input) for mailman id 941663;
 Tue, 08 Apr 2025 09:32:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7fLb=W2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u25Jr-00055v-BR
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 09:32:35 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67068b4e-145c-11f0-9eaa-5ba50f476ded;
 Tue, 08 Apr 2025 11:32:35 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-abbd96bef64so1041933866b.3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Apr 2025 02:32:35 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ac7c01bdf2bsm869852166b.162.2025.04.08.02.32.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 02:32:33 -0700 (PDT)
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
X-Inumbo-ID: 67068b4e-145c-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744104754; x=1744709554; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OBoZj2TWpf5qRwQbJR04rLsEsqxEil79wFCoZ826MAc=;
        b=Kai+NV/ZaGOTHkZVzsbqGfNsFCgWC9E3P8iwiouABfih30iuth7SEsU7357M+sNrLI
         A5oTDuI9bOtpvW5L1bSCId+1GI595nwtaR9J5uUWlTJTuPFfwdEWhKL8V/uvIrpdx2VR
         VOGppy76RE+iBQI4Cx0+21XOPrGsal1Jl4++g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744104754; x=1744709554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OBoZj2TWpf5qRwQbJR04rLsEsqxEil79wFCoZ826MAc=;
        b=HsF6sEyJGzw9dj1LAcTWY461IyM4/JiR9/qOjOuBlWQ0BIX4SwUPwaxHMtB1F7pezD
         ewSF91zyNJMGz8F6aruSbWT9KgUZHAhHdkvZCzj0Tm65UEfAZWmeRUJdG2n+YgnTZhQl
         3BW7tKzy09pUuKxa8Nyrl5PxSxWrt0Pi+OkpDE7CAGIVvdYoO4AvbiWBZ8H9dK0r4OEV
         a3ASXd9HQcUXs1iwFwgHIgGDuxjY5/m0g+g9t+tur7wj0cuysak2UG6V7rYXsiwERvKS
         iAg7CM5zqpc9BWApH6V7msdhMGyl4M8FCo/D4+1HgheJ1as0559gqqi5JQE8zoJWfI9R
         dyJQ==
X-Gm-Message-State: AOJu0Yx8DhIKfQzvUk0lhZbh6TCgQLBpT3ELlsaCd3ZeDLSh/YWQsMtJ
	lBuWItc/EcZGQfKrciPLGynS5asE2/zqs3N6HrnQbcuD7iyK1SHk7ahTHsfGd4zxz5LTRrGs9md
	k
X-Gm-Gg: ASbGncsykbciogxyq4FHPI9PehDwXTIWDn7zOQzRxsMtCjT3EAy7nXDq+qJSHuaY4EJ
	bELYw7jUy6DjD3xhchXOv8cta0LIsZvLOw4ujafIfvgT6hkX8u7chIas9hmFh+PTTosvfmUn2PP
	mTMLl3Z0omtJEeTceFthFzPrsh0Cpy43WlWddIXKpXeFD3oczVza5PcETdQhQ0ejGJ3sypRYysF
	CvhyEflF+LM5lkuV9cccNpOIQGx0tPn85bao9CDLkyOO3+hX7M/cE59pf4/YaLSOkC4negRDKAS
	iN4ZMhHy9OrVndn2o6WL88E5sQfeGUvHZzVpSfnPJOa0Koh4Lw==
X-Google-Smtp-Source: AGHT+IFTDe6RBfWR1rCUViDb6pc9+YiSt/BHR4/prJizk1Vvq9x5HnZQ/8BYvMcZ4VbWM3YmGCoDVA==
X-Received: by 2002:a17:906:c156:b0:ac7:1ec1:d8bd with SMTP id a640c23a62f3a-ac7d190dcd8mr1529149266b.29.1744104753959;
        Tue, 08 Apr 2025 02:32:33 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 2/2] x86/hvm: fix write emulation of RO ranges
Date: Tue,  8 Apr 2025 11:31:56 +0200
Message-ID: <20250408093156.83277-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250408093156.83277-1-roger.pau@citrix.com>
References: <20250408093156.83277-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When running on AMD hardware in HVM mode the guest linear address (GLA)
will not be provided to hvm_emulate_one_mmio(), and instead is
unconditionally set of ~0.  As a consequence mmio_ro_emulated_write() will
always report an error, as the fault GLA generated by the emulation of the
access won't be ~0.

Fix this by only checking for the fault GLA in mmio_ro_emulated_write()
when the guest is PV.

Fixes: 33c19df9a5a0 ('x86/PCI: intercept accesses to RO MMIO from dom0s in HVM containers')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/mm.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 4fecd37aeca0..79836705c51e 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5187,7 +5187,12 @@ int cf_check mmio_ro_emulated_write(
 
     /* Only allow naturally-aligned stores at the original %cr2 address. */
     if ( ((bytes | offset) & (bytes - 1)) || !bytes ||
-         offset != mmio_ro_ctxt->cr2 )
+         /*
+          * HVM domains might not have a valid fault GLA in the context, as AMD
+          * NPT faults don't report the faulting GLA.  It's also possible for
+          * the fault to happen in non-paging modes.
+          */
+         (is_pv_domain(current->domain) && offset != mmio_ro_ctxt->cr2) )
     {
         gdprintk(XENLOG_WARNING, "bad access (cr2=%lx, addr=%lx, bytes=%u)\n",
                 mmio_ro_ctxt->cr2, offset, bytes);
-- 
2.48.1


