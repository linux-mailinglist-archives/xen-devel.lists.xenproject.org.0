Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC92B0C0AE
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 11:51:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051311.1419634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udnAe-0001dY-Hf; Mon, 21 Jul 2025 09:50:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051311.1419634; Mon, 21 Jul 2025 09:50:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udnAe-0001bz-Dl; Mon, 21 Jul 2025 09:50:56 +0000
Received: by outflank-mailman (input) for mailman id 1051311;
 Mon, 21 Jul 2025 09:50:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ipwj=2C=cloud.com=bernhard.kaindl@srs-se1.protection.inumbo.net>)
 id 1udnAc-0001aA-Az
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 09:50:54 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 30e012df-6618-11f0-a31d-13f23c93f187;
 Mon, 21 Jul 2025 11:50:53 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-ae708b0e83eso731174266b.2
 for <xen-devel@lists.xenproject.org>; Mon, 21 Jul 2025 02:50:53 -0700 (PDT)
Received: from MinisforumBD795m.citrite.net ([185.68.248.203])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aec6c7d68a1sm644918866b.46.2025.07.21.02.50.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 02:50:52 -0700 (PDT)
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
X-Inumbo-ID: 30e012df-6618-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1753091453; x=1753696253; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ND/Rh4IXIloEEkYW5lj+vETKdb818Vq+9JP5elxr8+A=;
        b=kueozrblWVJ++sK4Tn6WA/F9rVk7HPtXuTF1i0Lxqx1gir8hWG3MU5s7MpT4qW5VRo
         bX9JtWSqYDnevXgh+qYyvnC5iCfVyrioAQVszngnZmFTH4uygaWLdyXODWs+pANlkNBo
         tV5wdrUEvS+ICOR58l2T8s4BHFJ/QvztLVCto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753091453; x=1753696253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ND/Rh4IXIloEEkYW5lj+vETKdb818Vq+9JP5elxr8+A=;
        b=EIQCGqKwE9r0ILySHK4fJ8K6tndpuBrv+sJmnPpME54fE8Bic189MQlxBpuuiKVlTN
         Aoc5IuRm6m7/0fqP8d9/dVFKwimh4f7/AmpNdiNQdFUBrCPq/PolTSQa2VNTjc0Ni+DR
         xTIf8tCcqI/JNqOkDhoUj560P49xmV+oRKcT7xqPVnBY44KcXz1Sct6HqFFPew1UMdam
         HrQ3RsFQX0EyOiomHC8Ezpg0wybhVJhd54wnUNeTsO0anomQ8T6gozcAH6p/eBI97jZn
         ZZxkBgm5/MZddqgJAfMbwx8HNUuSLObwvkCePSKcFaVbfiSujYpDHoQsuSX50C0c5XlV
         SiOQ==
X-Gm-Message-State: AOJu0Yx2CovTTaCEPuCGr6kLkdDXi8R0PeygfgDAdOYHQfqoLWQi5S3U
	vsazRv4pIhJ2jEQ583vtYgdNPwfg3Bm7x4wBogjF13NNqMwzm6ZlcJQAHIBfOf7Gd8rbi2cgI8v
	eaV4sMOZNUA==
X-Gm-Gg: ASbGnct9/AGwsVScVsIapwM970ssTyXc9XGN57gSX3U/ewLZfoLJ845CB8W19suKUeQ
	+GZPeA5OlfTuwDgZj0xzoKZPndWlBoD0oYWmYsTYmZc7vF67KjJ7VstRe4VamFdrQiUDuilT3yz
	BeQqqNAnUDtxG40p2ZVWnaspNq49TPuKI+9cL5uOum+ybIKugPpQQ6I6ca19UTPcDYkCchAk9Ig
	8huO5Pj0SzheUUL0IfyhGn3HmX6rWHhC+iCvl4h+lfEoDxj1gQuHXjoiZOxaYbchcXgH2w0zUaf
	7u6PuGEZJ+daLmZpBMxlmlk4aiGRtTyQi7YkM84RNBEMwedvtDDggLR4Rg3XCDJ8kBEt1Blbw2A
	8i/yMStCPdwW3IwNurxRWzij5aXu+LsHmBCK82q/w8CTCEXpYGSKz
X-Google-Smtp-Source: AGHT+IEFTa02dm4CXsoELwf4M4SsW7EDMj+u46K5KLdNieOlPCzeVcJOgU2/9cZKbB0j4ygZ51+cyw==
X-Received: by 2002:a17:907:989:b0:ae0:b7ef:1c11 with SMTP id a640c23a62f3a-ae9cdd86a54mr1880114566b.5.1753091452609;
        Mon, 21 Jul 2025 02:50:52 -0700 (PDT)
From: Bernhard Kaindl <bernhard.kaindl@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Bernhard Kaindl <bernhard.kaindl@cloud.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <gwd@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/2] sched/core: Update vcpu_runstate_get() to return nonaffine time
Date: Mon, 21 Jul 2025 11:49:50 +0200
Message-ID: <20250721094951.2006-2-bernhard.kaindl@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250721094951.2006-1-bernhard.kaindl@cloud.com>
References: <20250721094951.2006-1-bernhard.kaindl@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update vcpu_runstate_get() to return a snapshot of the accumulated
non-affine vCPU running time at the current time of this call.

We cannot change the struct vcpu_runstate_info: It is part of the
Guest shared memory area that is part of the frozen VM ABI.

Instead return the new value: This way we do not have to change all
old callers to pass a NULL in place of it, and we also we don't want
an internal shadow struct that we memcpy from with sizeof(). To be open
open to return data in the future, return a struct with the new field.

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@cloud.com>
---
 xen/common/sched/core.c   | 26 ++++++++++++++++++++++++--
 xen/include/public/vcpu.h | 10 ++++++++++
 xen/include/xen/sched.h   |  4 ++--
 3 files changed, 36 insertions(+), 4 deletions(-)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 489255b9c6..319bd7a928 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -324,12 +324,25 @@ void sched_guest_idle(void (*idle) (void), unsigned int cpu)
     atomic_dec(&per_cpu(sched_urgent_count, cpu));
 }
 
-void vcpu_runstate_get(const struct vcpu *v,
-                       struct vcpu_runstate_info *runstate)
+/**
+ * vcpu_runstate_get(): Return vCPU time spent in different runstates
+ *
+ * @param v:        vCPU to get runstate times (since vCPU start)
+ * @param runstate: Return time spent in each runstate.
+ *                  This structure is part of the runstate memory areas
+ *                  shared with the domains which is part of the ABI
+ *                  with domains that is frozen and cannot be changed.
+ *                  To return additional values, use e.g. the return
+ *                  value(no need to change all callers) of this function.
+ * @returns         struct with non-affine running time since vcpu creation
+ */
+vcpu_runstate_extra_t vcpu_runstate_get(const struct vcpu *v,
+                                        struct vcpu_runstate_info *runstate)
 {
     spinlock_t *lock;
     s_time_t delta;
     struct sched_unit *unit;
+    vcpu_runstate_extra_t ret;
 
     rcu_read_lock(&sched_res_rculock);
 
@@ -343,14 +356,23 @@ void vcpu_runstate_get(const struct vcpu *v,
                            : v->sched_unit;
     lock = likely(v == current) ? NULL : unit_schedule_lock_irq(unit);
     memcpy(runstate, &v->runstate, sizeof(*runstate));
+    ret.nonaffine_time = v->nonaffine_time; /* accumulated nonaffine time */
+
     delta = NOW() - runstate->state_entry_time;
     if ( delta > 0 )
+    {
         runstate->time[runstate->state] += delta;
 
+        if ( nonaffine(v, unit) ) /* When running nonaffine, add the delta */
+            ret.nonaffine_time += delta;
+    }
+
     if ( unlikely(lock != NULL) )
         unit_schedule_unlock_irq(lock, unit);
 
     rcu_read_unlock(&sched_res_rculock);
+
+    return ret;
 }
 
 uint64_t get_cpu_idle_time(unsigned int cpu)
diff --git a/xen/include/public/vcpu.h b/xen/include/public/vcpu.h
index f7445ac0b0..59e6647a24 100644
--- a/xen/include/public/vcpu.h
+++ b/xen/include/public/vcpu.h
@@ -79,8 +79,18 @@ struct vcpu_runstate_info {
     uint64_t time[4];
 };
 typedef struct vcpu_runstate_info vcpu_runstate_info_t;
+/* vcpu_runstate_info_t is in the Guest shared memory area (frozen ABI) */
 DEFINE_XEN_GUEST_HANDLE(vcpu_runstate_info_t);
 
+/*
+ * Extra information returned from vcpu_runstate_get that is not part
+ * of the Guest shared memory area (not part of the frozen Guest ABI)
+ */
+struct vcpu_runstate_extra {
+    uint64_t nonaffine_time; /* Time running outside soft_affinity mask */
+};
+typedef struct vcpu_runstate_extra vcpu_runstate_extra_t;
+
 /* VCPU is currently running on a physical CPU. */
 #define RUNSTATE_running  0
 
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index aba60afd4f..4fdbbaea87 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -1110,8 +1110,8 @@ int vcpu_set_hard_affinity(struct vcpu *v, const cpumask_t *affinity);
 int vcpu_affinity_domctl(struct domain *d, uint32_t cmd,
                          struct xen_domctl_vcpuaffinity *vcpuaff);
 
-void vcpu_runstate_get(const struct vcpu *v,
-                       struct vcpu_runstate_info *runstate);
+vcpu_runstate_extra_t vcpu_runstate_get(const struct vcpu *v,
+                                        struct vcpu_runstate_info *runstate);
 uint64_t get_cpu_idle_time(unsigned int cpu);
 void sched_guest_idle(void (*idle) (void), unsigned int cpu);
 void scheduler_enable(void);
-- 
2.43.0


