Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6BCAB995F
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 11:52:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986757.1372300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFrjD-0001rY-UU; Fri, 16 May 2025 09:51:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986757.1372300; Fri, 16 May 2025 09:51:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFrjD-0001p7-R6; Fri, 16 May 2025 09:51:43 +0000
Received: by outflank-mailman (input) for mailman id 986757;
 Fri, 16 May 2025 09:51:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UFMR=YA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uFreT-0005Zo-D4
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 09:46:49 +0000
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [2607:f8b0:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aebc1dac-323a-11f0-9ffb-bf95429c2676;
 Fri, 16 May 2025 11:46:47 +0200 (CEST)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-22e6344326dso20365185ad.1
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 02:46:47 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-231d4eedb3csm10689175ad.259.2025.05.16.02.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 02:46:45 -0700 (PDT)
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
X-Inumbo-ID: aebc1dac-323a-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747388806; x=1747993606; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DvMZEBj9rqnpNlTgFCVn6ltQWL+ib5z0Tm+s9auszek=;
        b=GqkMALaUpYq+lBqDdqr01/btxozo4Tk4eUzM+cvPxnXHCWpxyw1RLU2lGkZNx3U0hJ
         8SVRgU7kfIPwA3qJW6SeO8TYMEzeQRVXZdJ4TyE6qEadstizVV7kUvyWwfJhmreiyIM7
         M8PnLm2aqoIpvANrwoeLBjC8GtYuXmNpsbJKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747388806; x=1747993606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DvMZEBj9rqnpNlTgFCVn6ltQWL+ib5z0Tm+s9auszek=;
        b=KSGAoDKDjYMFN2LO7oIN8ZwPK6kbRiiZxcdomuLxJ8FOGKROFk/+F+rVBjzQ0YR5tK
         +qb13Gw1Tbbzq/RJFqHM0kRriFOxLBYIDdM+TMoUJOHxdB8aorN+ZGg+HqaonDv+5zEb
         6tqW9pUlHR09U8qkGUQKkTc2LY7ypfJp9C13H50vAsaOTfVn7xKEV9uftXmoJ4K6edQL
         kzc3uTKLRtW9s6W8fz6yQtBIYdoW6CwgNaj3qQk4PTwEIAV3dKTl9KuJ0e8PcKsBU5aI
         up9Zm+vdGd+EHd9DUuA+FXu6WsOexcLHT/quyJoxLoIEsflwFAVHeW9iWcDJhKZOPlbp
         pn+w==
X-Gm-Message-State: AOJu0YwUH0Ju5jdx7+RSd63/281A0ELvA6YEVtbYiR6aRhiGnoL0Zn//
	1DMoH2+TQHVZor3ERQjF3OmWfuVkVO6xad6sETt2ZdLLm9rWmCyISmS27RImmU8Msi8kOARgJOV
	nkwvf
X-Gm-Gg: ASbGncuvC0evqGjvhgAn3HbfgHqO2OD/13dens/SR3q2xlrLO51fu8HWoPDvGepTm6j
	vmVlqufJa674cSjc/dZ6kkwh2E7zBAd/XchWMrPHoJLrS80wTFHaXLJRz79EhrWqddYlCYVnAPN
	OgUvcLQsVCVXcw2x06JXLEOa7phlgQTrtosGYYoDoYTKuU0A0M09lHQf3yMsbOm0G75RrhHMqMl
	/sBMAbFGiUvOl/CoZHbAzWWJfeWUhFdFW7IslBKV7K9y+Qan6W1u2lhPWI3BpLGy35jI/OW0jV+
	WjIHwxtfQlZjXyhSgNPyHt7DHTkSy9fP/vN6hqlsAkp4BxeNTVimx2p3iHihmugrZSn8+nizkNS
	vsjJzEi9UfU9eUkvo470=
X-Google-Smtp-Source: AGHT+IEFrl2Rf1t+jyArCkyEkmT+bpC87gkIhjrCFFH5Zjqv0iaG8NmbviWDO/c1x6zWCrj80ybppA==
X-Received: by 2002:a17:902:c948:b0:220:e9f5:4b7c with SMTP id d9443c01a7336-231d44dc053mr29901695ad.17.1747388805836;
        Fri, 16 May 2025 02:46:45 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 6/6] x86/hvm: reduce the need to flush caches in memory_type_changed()
Date: Fri, 16 May 2025 11:45:35 +0200
Message-ID: <20250516094535.63472-7-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250516094535.63472-1-roger.pau@citrix.com>
References: <20250516094535.63472-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current cache flushing done in memory_type_changed() is too wide, and
this doesn't scale on boxes with high number of CPUs.  Attempt to limit
cache flushes as a result of p2m type changes, and only do them if:

 * The CPU doesn't support (or has broken) self-snoop capability, otherwise
   there would be leftover aliases in the cache.  For guest initiated
   memory changes (like changes to MTRRs) the guest should already do a
   cache flush.
 * The IOMMU cannot force all DMA accesses to be snooping ones.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - New in this version.
---
Not sure whether this attempt to reduce cache flushing should get some
mention in the CHANGELOG.
---
 xen/arch/x86/hvm/mtrr.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/mtrr.c b/xen/arch/x86/hvm/mtrr.c
index 8e1e15af8d73..9a6f6865a05e 100644
--- a/xen/arch/x86/hvm/mtrr.c
+++ b/xen/arch/x86/hvm/mtrr.c
@@ -782,14 +782,21 @@ HVM_REGISTER_SAVE_RESTORE(MTRR, hvm_save_mtrr_msr, NULL, hvm_load_mtrr_msr, 1,
 
 void memory_type_changed(struct domain *d)
 {
-    if ( (is_iommu_enabled(d) || cache_flush_permitted(d)) &&
+    if ( cache_flush_permitted(d) &&
          d->vcpu && d->vcpu[0] && p2m_memory_type_changed(d) &&
          /*
           * Do the p2m type-change, but skip the cache flush if the domain is
           * not yet running.  The check for creation_finished must strictly be
           * done after the call to p2m_memory_type_changed().
           */
-         d->creation_finished )
+         d->creation_finished &&
+         /*
+          * The cache flush should be done if either: CPU doesn't have
+          * self-snoop in which case there could be aliases left in the cache,
+          * or IOMMUs cannot force all DMA device accesses to be snooped.
+          */
+         (!boot_cpu_has(X86_FEATURE_XEN_SELFSNOOP) ||
+          (is_iommu_enabled(d) && !iommu_snoop)) )
     {
         flush_all(FLUSH_CACHE);
     }
-- 
2.48.1


