Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D67A6AB9939
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 11:46:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986714.1372270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFre1-00078P-WD; Fri, 16 May 2025 09:46:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986714.1372270; Fri, 16 May 2025 09:46:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFre1-00076D-TP; Fri, 16 May 2025 09:46:21 +0000
Received: by outflank-mailman (input) for mailman id 986714;
 Fri, 16 May 2025 09:46:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UFMR=YA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uFre1-0006aW-AP
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 09:46:21 +0000
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [2607:f8b0:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9eb214d6-323a-11f0-9eb6-5ba50f476ded;
 Fri, 16 May 2025 11:46:21 +0200 (CEST)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-231e21d3b63so5106755ad.3
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 02:46:20 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-231d4ebb0d4sm10661265ad.195.2025.05.16.02.46.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 02:46:13 -0700 (PDT)
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
X-Inumbo-ID: 9eb214d6-323a-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747388779; x=1747993579; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hm8AIe/qcud/Th5sHM9Y/G8pv43gmto+PqgQas9D3iE=;
        b=naxO0iRcwb4AjjP5dhSD+p8e+X8Ul2xakaFQNDhWt/CB6ng7YiJZRv57WuJPrg6epx
         uOu/6r8OAxwWSG+W3q7hWm+6/VK36e6ddCb6sXctFVcDgeFmq9EPFs2kqMTBwkvKPlPM
         S2GfpGGxbadp49yDkefqvSZ7lSbjL51JkIQGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747388779; x=1747993579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hm8AIe/qcud/Th5sHM9Y/G8pv43gmto+PqgQas9D3iE=;
        b=UVubzubCq77KJXMVcLXEk6gRRCoRQRhWGEPBO9SBI3ctabzSvOns1tHmCuDT9qSnUs
         9mA61kRBakttRXnbQ+d0xzis8i56PlWKXSane1y0285N4cpflLvLfSrDJlqX4nIAC+7M
         ZUk1rfc7xwWfH6PfBJEfNd6DE4tIiv3KRBvZRBfvVUw0z0y1mtlsOsnFFowT2MvyrQIF
         +LSy9wuiPHkTu7kF57Tsz4ROrxv6J3zOBfCuVQnFGVPu6Zf+8xu/3h2L6kpakiFk5wuV
         whNXAY4bPC5aBsk7JnAW+01iT5qJw2Z92+wHid8hZdzJtmTtb3sgKNVwjxRxJdMuCzy1
         kfeA==
X-Gm-Message-State: AOJu0YyLT9gTAU7jvz1BIFvxwVl9OINRQhJIihExMdmoKXHvyiUrazIG
	dXHbf5ngsIhO8VRisbpJiCq/gOSvVQ+1vyVzu4O8mCPfPguCZD9ldTgxkdgqJk37/9iPIp0HACp
	irngD
X-Gm-Gg: ASbGncsON3+i5avrefOrOv3pm8YApWHWZawB1PBPke/hoXf76BFDVmkEGgleyifFWlO
	V1DZm6Hx423KmEhtI2uIbHoZKD27UhH17Am3cyn9kKK/ZdP3DsdItCHVesM8N0yJIxY/FiYWvi1
	QTeqY9OFndIzrfJqeLonU5B4Va/sVAFKRuT3FU77htJHEtdAShEkowOY+ANjSO2lRxYEw30cYsC
	DsWdB071dI0xnKeGJ7vGWGPyVHQ+EX0GwS0MVCJP+QmKi/dt4g7A3DU7GnuKiBtZee5pWpiXgoK
	StX7cuDMBMw48xobTT8lOf5yyZx877LPj5fz98HNd/06O31hlLrsGcA/vYJcGwAcjmwJckRWeiw
	+X2sxOuEXJTym4pleSVr7vWj/ZMdJBg==
X-Google-Smtp-Source: AGHT+IGA+qWfUyBWb2AxiIES1kDVVnjbALZ1vz8DqSY4VtBKeBEI8NkldomOj1H62clyuTKWds7bDg==
X-Received: by 2002:a17:902:d2cf:b0:22d:b305:e082 with SMTP id d9443c01a7336-231de3bb2d0mr23158125ad.47.1747388774593;
        Fri, 16 May 2025 02:46:14 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 4/6] xen/x86: account for assigned PCI devices in cache_flush_permitted()
Date: Fri, 16 May 2025 11:45:33 +0200
Message-ID: <20250516094535.63472-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250516094535.63472-1-roger.pau@citrix.com>
References: <20250516094535.63472-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

While unlikely, it's possible for PCI devices to not have any IO resources
assigned, yet in such case the owner domain might still need to issue cache
control operations in case the device performs DMA requests.

Adjust cache_flush_permitted() to account for has_arch_pdevs().

While there also switch l1_disallow_mask() to use cache_flush_permitted().
This should be a non-functional change after the adjustment done to
cache_flush_permitted().

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - New in this version.
---
 xen/arch/x86/include/asm/iocap.h | 3 ++-
 xen/arch/x86/mm.c                | 4 +---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/include/asm/iocap.h b/xen/arch/x86/include/asm/iocap.h
index 61d026dbf5f6..f948b7186e95 100644
--- a/xen/arch/x86/include/asm/iocap.h
+++ b/xen/arch/x86/include/asm/iocap.h
@@ -19,7 +19,8 @@
     (!rangeset_is_empty((d)->iomem_caps) ||             \
      !rangeset_is_empty((d)->arch.ioport_caps))
 
-#define cache_flush_permitted has_arch_io_resources
+#define cache_flush_permitted(d) \
+    (has_arch_io_resources(d) || has_arch_pdevs(d))
 
 static inline int ioports_permit_access(struct domain *d, unsigned long s,
                                         unsigned long e)
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index a1703db762e3..657623336c0e 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -172,9 +172,7 @@ static DEFINE_SPINLOCK(subpage_ro_lock);
 
 #define l1_disallow_mask(d)                                     \
     (((d) != dom_io) &&                                         \
-     (rangeset_is_empty((d)->iomem_caps) &&                     \
-      rangeset_is_empty((d)->arch.ioport_caps) &&               \
-      !has_arch_pdevs(d) &&                                     \
+     (!cache_flush_permitted(d) &&                              \
       is_pv_domain(d)) ?                                        \
      L1_DISALLOW_MASK : (L1_DISALLOW_MASK & ~PAGE_CACHE_ATTRS))
 
-- 
2.48.1


