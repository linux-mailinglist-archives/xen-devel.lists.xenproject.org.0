Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40996697FA0
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 16:39:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496082.766642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSJsE-0002Uc-R8; Wed, 15 Feb 2023 15:39:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496082.766642; Wed, 15 Feb 2023 15:39:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSJsE-0002O8-Mn; Wed, 15 Feb 2023 15:39:10 +0000
Received: by outflank-mailman (input) for mailman id 496082;
 Wed, 15 Feb 2023 15:39:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v50p=6L=tibco.com=sdyasli@srs-se1.protection.inumbo.net>)
 id 1pSJsC-00026q-Qx
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 15:39:08 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e24d7dbe-ad46-11ed-933c-83870f6b2ba8;
 Wed, 15 Feb 2023 16:39:07 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 m16-20020a05600c3b1000b003dc4050c94aso1843500wms.4
 for <xen-devel@lists.xenproject.org>; Wed, 15 Feb 2023 07:39:07 -0800 (PST)
Received: from localhost.localdomain ([185.25.65.68])
 by smtp.gmail.com with ESMTPSA id
 t39-20020a05600c32a700b003e1e8d794e1sm2320560wmp.13.2023.02.15.07.39.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 07:39:06 -0800 (PST)
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
X-Inumbo-ID: e24d7dbe-ad46-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tibco.com; s=googleworkspace;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M4M+2M3RbH+k66gVRO8WHDkieezAlEhOYoWMRNwzTYk=;
        b=TcgStnY4DauLjeByL1c2EvclpvdP7EOGcVtztARxrZ+6aNrQPFaggONLPhkrOJMd1s
         vBl9yrLI968WFwmTgd1NmiSQMpyVQeX95V8Qiccx5750b6b0WLae5DiPjmOS3zsnZ5qw
         e8qFXM0TDUUGqsnCthffMqic9RdHgRyLZLiFyz2RNPTyUXPKLJkU09f+YqGaAPuk0YlD
         a4JlIO0fFbZDCIbXWnFq3tHLPMd3PXgkmdSaDbcMgj964OuFGOIL0rap1yHNSAcReGFs
         rnoe4cl+WDFm5WZOGHKDu20lkSlYt3uK1TWx11BvAroMAmbG3K96+t7Gq0RMfWC8wNoX
         e6Jw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M4M+2M3RbH+k66gVRO8WHDkieezAlEhOYoWMRNwzTYk=;
        b=PobcozcfKWZ8dmqfTdzMZLr1zkaGkWFZrcTL0YJ9h1Y3WtK4UflWEU/Tv9l19OO9As
         jBH5xxj00N5lHOGdK2/H/GZ5lizGdm7cumpVQvLm8kEiGwpc7yCItfUMzWYuB+zsXspX
         1QtOA481ZUw/bRTIv4A/2iJ0Z6K9H7ioL6Az8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M4M+2M3RbH+k66gVRO8WHDkieezAlEhOYoWMRNwzTYk=;
        b=aj4Mzl9OhV7My0rsoFdNd1ZwSrMRYPnITTFiPg3iQuMIRSEVgnTCaPnvRKK4bCrhlq
         q0nCDkKqguMGHQxPotUReFV3UpU6veMdOahvHIsapkYqUfDluVL93a0UbwpLSs5i4aOA
         1Y9yXZXRm7iMk6LfjSCO0hymRNUy93EF5D5F+Tmz0ZGxIKxnxe9gBCRNxZObj9NLEy5s
         dlPwJHd/rP8S4RU4l49zZKkPXTu4JQaJ+NijsISkW+Nz0XGGlht3T9i+LUvUWJUXjJfy
         z1KTvIN8WLl4CEd923nv363ea65hAHoWSX/ghhkjikkiwhEP9/gh+ppbpAKa3czAd3nf
         9aYg==
X-Gm-Message-State: AO0yUKURVkr5PPG48aeUsIn+FyUduV1Nj95lzcdnGMAeG9Gfrk4MGoy5
	9am/XqGKIY4riknFOSBVc4WFECATS2fqeK5rsRA=
X-Google-Smtp-Source: AK7set8pz04VfBZp39oQ0Jaf/6oi3Iv2nVHpIOIlgz7EJad/TGWMiZwvW2Ob2lgMpGqLwr5SCTsTtA==
X-Received: by 2002:a05:600c:1c2a:b0:3dc:5032:2895 with SMTP id j42-20020a05600c1c2a00b003dc50322895mr2851400wms.0.1676475547055;
        Wed, 15 Feb 2023 07:39:07 -0800 (PST)
Sender: Sergey Dyasli <sdyasli@tibco.com>
From: Sergey Dyasli <sergey.dyasli@cloud.com>
X-Google-Original-From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Sergey Dyasli <sergey.dyasli@citrix.com>
Subject: [PATCH v4 2/2] x86/ucode/AMD: late load the patch on every logical thread
Date: Wed, 15 Feb 2023 15:38:46 +0000
Message-Id: <20230215153846.18582-3-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230215153846.18582-1-sergey.dyasli@citrix.com>
References: <20230215153846.18582-1-sergey.dyasli@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently late ucode loading is performed only on the first core of CPU
siblings.  But according to the latest recommendation from AMD, late
ucode loading should happen on every logical thread/core.

To achieve that, consider every logical cpu as "primary" when running on
AMD cpus, i.e. skip cpu_sibling_mask checks.

Signed-off-by: Sergey Dyasli <sergey.dyasli@citrix.com>
---
v4:
- new patch
---
 xen/arch/x86/cpu/microcode/core.c | 35 ++++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index ba6e7b42c6..f720030761 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -398,10 +398,16 @@ static int cf_check microcode_nmi_callback(
          (!ucode_in_nmi && cpu == primary) )
         return 0;
 
-    if ( cpu == primary )
+    if ( boot_cpu_data.x86_vendor == X86_VENDOR_AMD )
+        /* load ucode on every logical thread/core */
         ret = primary_thread_work(nmi_patch);
     else
-        ret = secondary_nmi_work();
+    {
+        if ( cpu == primary )
+            ret = primary_thread_work(nmi_patch);
+        else
+            ret = secondary_nmi_work();
+    }
     this_cpu(loading_err) = ret;
 
     return 0;
@@ -540,7 +546,6 @@ static int control_thread_fn(const struct microcode_patch *patch)
 static int cf_check do_microcode_update(void *patch)
 {
     unsigned int cpu = smp_processor_id();
-    int ret;
 
     /*
      * The control thread set state to coordinate ucode loading. Primary
@@ -548,13 +553,18 @@ static int cf_check do_microcode_update(void *patch)
      * the completion of the ucode loading process.
      */
     if ( cpu == cpumask_first(&cpu_online_map) )
-        ret = control_thread_fn(patch);
-    else if ( cpu == cpumask_first(this_cpu(cpu_sibling_mask)) )
-        ret = primary_thread_fn(patch);
-    else
-        ret = secondary_thread_fn();
+        return control_thread_fn(patch);
 
-    return ret;
+    if ( boot_cpu_data.x86_vendor == X86_VENDOR_AMD )
+        /* load ucode on every logical thread/core */
+        return primary_thread_fn(patch);
+    else
+    {
+        if ( cpu == cpumask_first(this_cpu(cpu_sibling_mask)) )
+            return primary_thread_fn(patch);
+        else
+            return secondary_thread_fn();
+    }
 }
 
 struct ucode_buf {
@@ -642,8 +652,13 @@ static long cf_check microcode_update_helper(void *data)
     /* Calculate the number of online CPU core */
     nr_cores = 0;
     for_each_online_cpu(cpu)
-        if ( cpu == cpumask_first(per_cpu(cpu_sibling_mask, cpu)) )
+    {
+        if ( boot_cpu_data.x86_vendor == X86_VENDOR_AMD )
+            /* load ucode on every logical thread/core */
+            nr_cores++;
+        else if ( cpu == cpumask_first(per_cpu(cpu_sibling_mask, cpu)) )
             nr_cores++;
+    }
 
     printk(XENLOG_INFO "%u cores are to update their microcode\n", nr_cores);
 
-- 
2.31.1


