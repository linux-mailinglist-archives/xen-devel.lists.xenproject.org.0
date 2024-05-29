Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FE58D3282
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 11:03:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731689.1137346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCFCU-00073i-Vo; Wed, 29 May 2024 09:02:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731689.1137346; Wed, 29 May 2024 09:02:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCFCU-00071B-Sz; Wed, 29 May 2024 09:02:26 +0000
Received: by outflank-mailman (input) for mailman id 731689;
 Wed, 29 May 2024 09:02:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJ4/=NA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sCFCT-0006nV-T7
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 09:02:25 +0000
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [2607:f8b0:4864:20::f34])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a42f51a-1d9a-11ef-90a1-e314d9c70b13;
 Wed, 29 May 2024 11:02:24 +0200 (CEST)
Received: by mail-qv1-xf34.google.com with SMTP id
 6a1803df08f44-6ab9d406101so10364256d6.3
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 02:02:24 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6ac163189cbsm52218246d6.125.2024.05.29.02.02.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 02:02:22 -0700 (PDT)
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
X-Inumbo-ID: 2a42f51a-1d9a-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716973343; x=1717578143; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q0Nh3rBmN+pTUZ9mi1QuaHwm6Qdmm1bW1P320o0L9uQ=;
        b=UrCRNhoAdwKdMwnay26lSkyLKktz/PB5H92GLpZxY27JCpJxj/cf5ZewimxjIy28hr
         fV5XTeAa4MyoxbDVvBL9cm17LFMuRO7GsJxeoVM/UGz6OLS7VaMhpVYhtbiQ/CIhfBEo
         mBUKP+Twdv2nzuy9KtzB8y4SXpuXmzmzbicmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716973343; x=1717578143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q0Nh3rBmN+pTUZ9mi1QuaHwm6Qdmm1bW1P320o0L9uQ=;
        b=jKCK9rPPQij7Z2sFb3KGSteqLY6q78V5/TOV71rWFIfCbI3XO8DVuJikl7kqAhiIBS
         g/JA5396YceHog8lOwiDgB8XKPYQkMJbYcOsaDbr3DMeLvl0287vnebNW/xM6MjJlnq0
         KDjN9QyFk8Cx1dVTpFyWZMcIXZoIV4z7rvsqyJZJOPG6sgF/iO3G0M4nKUhbT8r2cAL6
         6O/xKXw1tNd0xxDWxbYZ8WqengB6CVyR2ceW1aw0KNu8iG8khEuoFZnNjgW3xbPso4UW
         VEimtzETbXHnZZtI9Q50CUdr+jc+sg4Kt1kmVWm1P0l3zKyl6ETokyVF1jcJV0bs9wnk
         Br0w==
X-Gm-Message-State: AOJu0Yxg+JxPe7mLlFPVUa02Ni7NyzAo6dT9b4/sZKs4DnfiWVqULpEO
	ZT5doBshy5l01CSd4cnByPlgSV5ZglTsTVjAG2iGlYSPmm8+dFS6KMmIgCgkGvkY6cHy7yIqRQc
	m
X-Google-Smtp-Source: AGHT+IFHRIN1eZv4oe0SSy/cz+Iz9pCra+5E0JzLjhkBniawjYKENoDwI5H8li2IB8bRXo70SdnG0g==
X-Received: by 2002:a05:6214:4a07:b0:6a0:b3cc:ee48 with SMTP id 6a1803df08f44-6abc8cd1be4mr175200136d6.37.1716973342641;
        Wed, 29 May 2024 02:02:22 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH for-4.19 2/9] xen/cpu: do not get the CPU map in stop_machine_run()
Date: Wed, 29 May 2024 11:01:24 +0200
Message-ID: <20240529090132.59434-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240529090132.59434-1-roger.pau@citrix.com>
References: <20240529090132.59434-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current callers of stop_machine_run() outside of init code already have the
CPU maps locked, and hence there's no reason for stop_machine_run() to attempt
to lock again.

Replace the get_cpu_maps() call with a suitable unreachable assert.

Further changes will modify the conditions under which get_cpu_maps() returns
success and without the adjustment proposed here the usage of
stop_machine_run() in cpu_down() would then return an error.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/common/cpu.c          |  5 +++++
 xen/common/stop_machine.c | 15 ++++++++-------
 xen/include/xen/cpu.h     |  2 ++
 3 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/xen/common/cpu.c b/xen/common/cpu.c
index 8709db4d2957..6173220e771b 100644
--- a/xen/common/cpu.c
+++ b/xen/common/cpu.c
@@ -68,6 +68,11 @@ void cpu_hotplug_done(void)
     write_unlock(&cpu_add_remove_lock);
 }
 
+bool cpu_map_locked(void)
+{
+    return rw_is_locked(&cpu_add_remove_lock);
+}
+
 static NOTIFIER_HEAD(cpu_chain);
 
 void __init register_cpu_notifier(struct notifier_block *nb)
diff --git a/xen/common/stop_machine.c b/xen/common/stop_machine.c
index 398cfd507c10..7face75648e8 100644
--- a/xen/common/stop_machine.c
+++ b/xen/common/stop_machine.c
@@ -82,9 +82,15 @@ int stop_machine_run(int (*fn)(void *data), void *data, unsigned int cpu)
     BUG_ON(!local_irq_is_enabled());
     BUG_ON(!is_idle_vcpu(current));
 
-    /* cpu_online_map must not change. */
-    if ( !get_cpu_maps() )
+    /*
+     * cpu_online_map must not change.  The only two callers of
+     * stop_machine_run() outside of init code already have the CPU map locked.
+     */
+    if ( system_state >= SYS_STATE_active && !cpu_map_locked() )
+    {
+        ASSERT_UNREACHABLE();
         return -EBUSY;
+    }
 
     nr_cpus = num_online_cpus();
     if ( cpu_online(this) )
@@ -92,10 +98,7 @@ int stop_machine_run(int (*fn)(void *data), void *data, unsigned int cpu)
 
     /* Must not spin here as the holder will expect us to be descheduled. */
     if ( !spin_trylock(&stopmachine_lock) )
-    {
-        put_cpu_maps();
         return -EBUSY;
-    }
 
     stopmachine_data.fn = fn;
     stopmachine_data.fn_data = data;
@@ -136,8 +139,6 @@ int stop_machine_run(int (*fn)(void *data), void *data, unsigned int cpu)
 
     spin_unlock(&stopmachine_lock);
 
-    put_cpu_maps();
-
     return ret;
 }
 
diff --git a/xen/include/xen/cpu.h b/xen/include/xen/cpu.h
index e1d4eb59675c..d8c8264c58b0 100644
--- a/xen/include/xen/cpu.h
+++ b/xen/include/xen/cpu.h
@@ -13,6 +13,8 @@ void put_cpu_maps(void);
 void cpu_hotplug_begin(void);
 void cpu_hotplug_done(void);
 
+bool cpu_map_locked(void);
+
 /* Receive notification of CPU hotplug events. */
 void register_cpu_notifier(struct notifier_block *nb);
 
-- 
2.44.0


