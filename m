Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 436CB895871
	for <lists+xen-devel@lfdr.de>; Tue,  2 Apr 2024 17:44:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700206.1092970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrgIa-0005LA-L5; Tue, 02 Apr 2024 15:43:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700206.1092970; Tue, 02 Apr 2024 15:43:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrgIa-0005It-IV; Tue, 02 Apr 2024 15:43:44 +0000
Received: by outflank-mailman (input) for mailman id 700206;
 Tue, 02 Apr 2024 15:43:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wy/k=LH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rrgIZ-0005In-C0
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2024 15:43:43 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c83ef631-f107-11ee-afe5-a90da7624cb6;
 Tue, 02 Apr 2024 17:43:42 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-568c714a9c7so6296773a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Apr 2024 08:43:42 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 el11-20020a056402360b00b0056c249798absm6843594edb.71.2024.04.02.08.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Apr 2024 08:43:40 -0700 (PDT)
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
X-Inumbo-ID: c83ef631-f107-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712072621; x=1712677421; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OEDeQcW/fDOrd6H55FSVnSBzli8SzV2bo6GaPe7rMAc=;
        b=IkCD5vKdtyHf9d6DnSjcgqCLCxRW81qjZok0eGi1yu+UHRmi5MyQq5TL1Oz2MHV1Sq
         XTuqIixhomsSpha1Aq/82fe6qE+G77N4vAYcbL+i1QUqJR4G8lLeCJxgQanxuru8JYqv
         Vnbh4DfndULrwMwrL5Rz77DXt19aU3R9zxVmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712072621; x=1712677421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OEDeQcW/fDOrd6H55FSVnSBzli8SzV2bo6GaPe7rMAc=;
        b=PTtNiL1QfV4PxNTbLBVLPNq3N5vzq9fwJRwBKUGfD46KNjLXfakEySEtlJ4zrGzjV2
         quBFxFK3MvT102v9glGdTX6m5vTawFUcPFdLue0Vcei9Q+LSldaH5fQHcePh0fGHYhHW
         Pz6iVXRFFMgen3s6AdZpoq4M9yPtgc0rO91raPdK/iNCv17wij6oWDbuV6Sa87BZ05DG
         bdfiEf7cD//l2vhT81tp4vBxVaMd0fGxp/fcb9o68LylzSBkc5asHEm70FazyJDebmjZ
         FgjN5cKw7pXproq7e2/SDAhCYnbZMXr6Swa2K4PDZl2vWRDLnAchq+ZgAJTn8y+O7Z4c
         O6IQ==
X-Gm-Message-State: AOJu0YxZFwg+DIEMDKUSY+/obzCYEraXKVRIKUp5Bmwfv3QtOzfo1/8y
	gmO3qYpPBMecRikzKisGxBaS6VfC3i3U0DbtMfAdAPgivkXE1YUNhasbVvYgs/ku+VNwdY6oRqz
	kI4Y=
X-Google-Smtp-Source: AGHT+IHcVnW2eMTVQ0IZixRTjT0hnujVt6ViGoqbTtGm0/1V6/Y9yeKdNODXbi+0C7JGhu/FyqCf7A==
X-Received: by 2002:a05:6402:2114:b0:56c:d44:f1c3 with SMTP id bl20-20020a056402211400b0056c0d44f1c3mr10180759edb.25.1712072621305;
        Tue, 02 Apr 2024 08:43:41 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Roberto Bagnara <roberto.bagnara@bugseng.com>,
	"consulting @ bugseng . com" <consulting@bugseng.com>
Subject: [PATCH] x86: Address MISRA Rule 13.6
Date: Tue,  2 Apr 2024 16:43:39 +0100
Message-Id: <20240402154339.2448435-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

MISRA Rule 13.6 doesn't like having an expression in a sizeof() which
potentially has side effects.

Address several violations by pulling the expression out into a local
variable.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
CC: consulting@bugseng.com <consulting@bugseng.com>

Slightly RFC.
---
 xen/arch/x86/irq.c                       | 3 ++-
 xen/arch/x86/time.c                      | 6 ++++--
 xen/drivers/passthrough/amd/iommu_intr.c | 3 ++-
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 0487f734a5d2..d73f687f7617 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -1150,8 +1150,9 @@ static void cf_check irq_guest_eoi_timer_fn(void *data)
     {
         struct domain *d = action->guest[i];
         unsigned int pirq = domain_irq_to_pirq(d, irq);
+        struct pirq *pirq_info = pirq_info(d, pirq);
 
-        if ( test_and_clear_bool(pirq_info(d, pirq)->masked) )
+        if ( test_and_clear_bool(pirq_info->masked) )
             action->in_flight--;
     }
 
diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index 60870047894b..6f136f4b14bf 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -2503,7 +2503,9 @@ static long cmos_utc_offset; /* in seconds */
 
 int time_suspend(void)
 {
-    if ( smp_processor_id() == 0 )
+    unsigned int cpu = smp_processor_id();
+
+    if ( cpu == 0 )
     {
         cmos_utc_offset = -get_wallclock_time();
         cmos_utc_offset += get_sec();
@@ -2514,7 +2516,7 @@ int time_suspend(void)
     }
 
     /* Better to cancel calibration timer for accuracy. */
-    clear_bit(TIME_CALIBRATE_SOFTIRQ, &softirq_pending(smp_processor_id()));
+    clear_bit(TIME_CALIBRATE_SOFTIRQ, &softirq_pending(cpu));
 
     return 0;
 }
diff --git a/xen/drivers/passthrough/amd/iommu_intr.c b/xen/drivers/passthrough/amd/iommu_intr.c
index d9eefcd8e411..7fc796dec25b 100644
--- a/xen/drivers/passthrough/amd/iommu_intr.c
+++ b/xen/drivers/passthrough/amd/iommu_intr.c
@@ -183,6 +183,7 @@ static void free_intremap_entry(const struct amd_iommu *iommu,
                                 unsigned int bdf, unsigned int index)
 {
     union irte_ptr entry = get_intremap_entry(iommu, bdf, index);
+    struct ivrs_mappings *ivrs = get_ivrs_mappings(iommu->seg);
 
     if ( iommu->ctrl.ga_en )
     {
@@ -201,7 +202,7 @@ static void free_intremap_entry(const struct amd_iommu *iommu,
     else
         ACCESS_ONCE(entry.ptr32->raw) = 0;
 
-    __clear_bit(index, get_ivrs_mappings(iommu->seg)[bdf].intremap_inuse);
+    __clear_bit(index, ivrs[bdf].intremap_inuse);
 }
 
 static void update_intremap_entry(const struct amd_iommu *iommu,

base-commit: 7a09966e7b2823b70f6d56d0cf66c11124f4a3c1
-- 
2.30.2


