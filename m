Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 466109023F1
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 16:21:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737297.1143532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGftH-0000Ca-1Z; Mon, 10 Jun 2024 14:20:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737297.1143532; Mon, 10 Jun 2024 14:20:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGftG-00009S-UK; Mon, 10 Jun 2024 14:20:54 +0000
Received: by outflank-mailman (input) for mailman id 737297;
 Mon, 10 Jun 2024 14:20:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3ow3=NM=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sGftE-00007Q-Oc
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 14:20:52 +0000
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [2607:f8b0:4864:20::733])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a35acadf-2734-11ef-90a2-e314d9c70b13;
 Mon, 10 Jun 2024 16:20:51 +0200 (CEST)
Received: by mail-qk1-x733.google.com with SMTP id
 af79cd13be357-79767180a15so45375185a.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2024 07:20:51 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-795758dfe3asm127231685a.105.2024.06.10.07.20.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jun 2024 07:20:48 -0700 (PDT)
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
X-Inumbo-ID: a35acadf-2734-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718029249; x=1718634049; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EmeqCABNjDotan3Y72svsvPEn7gJhsjuiG6QHhCgPvQ=;
        b=YvJfA12OB3sFdIw1RRotS2fex80GJdQh/gtzshnOXTHsaqPhGu3KpYWccUbMOo06RZ
         PF5rKb5RGDdC4R61n3IL2MZ+CbMoEhWqU1tUmeDp0WKXudkN05o5AcNRKxLy2XKkIUgu
         NDEPXfdUUCg3Wp/fH5KSBhWYt6PY8AtfsLxbk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718029249; x=1718634049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EmeqCABNjDotan3Y72svsvPEn7gJhsjuiG6QHhCgPvQ=;
        b=iLMYJJPxJjepAG7OTjl31Q8V0IYwXt4W4nHBKbiTGytoZa//K4C8OFquGbEkJRK9WV
         TILdQTZdBdSWyb3IDSzaMm2dHF/JYJGS+1MohQNrgGab2Ouy+VyTRzu3CiccYH3tGAgo
         ovvtfemPIWurJnaQS6iqMF1tF88pxP6+WXVXAI3sHk/3ILl5wH51wj8AEZqOGWx8DkM/
         mZRcnMku3Oc+6OI29P8AgBFusJiF/yu0tTck/yukhra39XrK+0Eyk4Ht5npAJaTfBLqC
         bHprzqWIY9DEer3qz0u8D2JIeQ0FaN7AqjauHL9ra+4mPKHz3HAXB6YU66Cq2Cwn4XxP
         EeyA==
X-Gm-Message-State: AOJu0Yz6RmjOt/FSJ1cWLL+8QEc5IOn5MdHDiUe33UzynUu4dqc6udbn
	RiV2/zXd6Un9+TGqmbBt6db7GeIfCOCm9/wiE2WVcfjnz94Y8tkw6ILsOtqy7OdVtKK6z3wU6MM
	5
X-Google-Smtp-Source: AGHT+IFVJ6qqqsqLC04Mqokc1ZPW7ysMrqYU9cIPAJV1KObi0//GhIoewHRe9csIUHpaXS5nGBBDKA==
X-Received: by 2002:a05:620a:3913:b0:795:f319:e4ae with SMTP id af79cd13be357-795f319f448mr418663485a.26.1718029248808;
        Mon, 10 Jun 2024 07:20:48 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 1/7] x86/smp: do not use shorthand IPI destinations in CPU hot{,un}plug contexts
Date: Mon, 10 Jun 2024 16:20:37 +0200
Message-ID: <20240610142043.11924-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240610142043.11924-1-roger.pau@citrix.com>
References: <20240610142043.11924-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Due to the current rwlock logic, if the CPU calling get_cpu_maps() does so from
a cpu_hotplug_{begin,done}() region the function will still return success,
because a CPU taking the rwlock in read mode after having taken it in write
mode is allowed.  Such behavior however defeats the purpose of get_cpu_maps(),
as it should always return false when called with a CPU hot{,un}plug operation
is in progress.  Otherwise the logic in send_IPI_mask() is wrong, as it could
decide to use the shorthand even when a CPU operation is in progress.

Introduce a new helper to detect whether the current caller is between a
cpu_hotplug_{begin,done}() region and use it in send_IPI_mask() to restrict
shorthand usage.

Fixes: 5500d265a2a8 ('x86/smp: use APIC ALLBUT destination shorthand when possible')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Modify send_IPI_mask() to detect CPU hotplug context.
---
 xen/arch/x86/smp.c       |  2 +-
 xen/common/cpu.c         |  5 +++++
 xen/include/xen/cpu.h    | 10 ++++++++++
 xen/include/xen/rwlock.h |  2 ++
 4 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/smp.c b/xen/arch/x86/smp.c
index 7443ad20335e..04c6a0572319 100644
--- a/xen/arch/x86/smp.c
+++ b/xen/arch/x86/smp.c
@@ -88,7 +88,7 @@ void send_IPI_mask(const cpumask_t *mask, int vector)
      * the system have been accounted for.
      */
     if ( system_state > SYS_STATE_smp_boot &&
-         !unaccounted_cpus && !disabled_cpus &&
+         !unaccounted_cpus && !disabled_cpus && !cpu_in_hotplug_context() &&
          /* NB: get_cpu_maps lock requires enabled interrupts. */
          local_irq_is_enabled() && (cpus_locked = get_cpu_maps()) &&
          (park_offline_cpus ||
diff --git a/xen/common/cpu.c b/xen/common/cpu.c
index 8709db4d2957..6e35b114c080 100644
--- a/xen/common/cpu.c
+++ b/xen/common/cpu.c
@@ -68,6 +68,11 @@ void cpu_hotplug_done(void)
     write_unlock(&cpu_add_remove_lock);
 }
 
+bool cpu_in_hotplug_context(void)
+{
+    return rw_is_write_locked_by_me(&cpu_add_remove_lock);
+}
+
 static NOTIFIER_HEAD(cpu_chain);
 
 void __init register_cpu_notifier(struct notifier_block *nb)
diff --git a/xen/include/xen/cpu.h b/xen/include/xen/cpu.h
index e1d4eb59675c..6bf578675008 100644
--- a/xen/include/xen/cpu.h
+++ b/xen/include/xen/cpu.h
@@ -13,6 +13,16 @@ void put_cpu_maps(void);
 void cpu_hotplug_begin(void);
 void cpu_hotplug_done(void);
 
+/*
+ * Returns true when the caller CPU is between a cpu_hotplug_{begin,done}()
+ * region.
+ *
+ * This is required to safely identify hotplug contexts, as get_cpu_maps()
+ * would otherwise succeed because a caller holding the lock in write mode is
+ * allowed to acquire the same lock in read mode.
+ */
+bool cpu_in_hotplug_context(void);
+
 /* Receive notification of CPU hotplug events. */
 void register_cpu_notifier(struct notifier_block *nb);
 
diff --git a/xen/include/xen/rwlock.h b/xen/include/xen/rwlock.h
index a2e98cad343e..4e7802821859 100644
--- a/xen/include/xen/rwlock.h
+++ b/xen/include/xen/rwlock.h
@@ -316,6 +316,8 @@ static always_inline void write_lock_irq(rwlock_t *l)
 
 #define rw_is_locked(l)               _rw_is_locked(l)
 #define rw_is_write_locked(l)         _rw_is_write_locked(l)
+#define rw_is_write_locked_by_me(l) \
+    lock_evaluate_nospec(_is_write_locked_by_me(atomic_read(&(l)->cnts)))
 
 
 typedef struct percpu_rwlock percpu_rwlock_t;
-- 
2.44.0


