Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F33E14E578F
	for <lists+xen-devel@lfdr.de>; Wed, 23 Mar 2022 18:34:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294016.499744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nX4rv-00035i-KN; Wed, 23 Mar 2022 17:33:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294016.499744; Wed, 23 Mar 2022 17:33:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nX4rv-0002zY-ED; Wed, 23 Mar 2022 17:33:59 +0000
Received: by outflank-mailman (input) for mailman id 294016;
 Wed, 23 Mar 2022 17:33:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s5zF=UC=gmail.com=philippe.mathieu.daude@srs-se1.protection.inumbo.net>)
 id 1nX4eQ-0004Zy-P3
 for xen-devel@lists.xenproject.org; Wed, 23 Mar 2022 17:20:02 +0000
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [2607:f8b0:4864:20::1032])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78af94f3-aacd-11ec-a405-831a346695d4;
 Wed, 23 Mar 2022 18:20:02 +0100 (CET)
Received: by mail-pj1-x1032.google.com with SMTP id b8so2367589pjb.4
 for <xen-devel@lists.xenproject.org>; Wed, 23 Mar 2022 10:20:01 -0700 (PDT)
Received: from localhost.localdomain (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 oo17-20020a17090b1c9100b001bf0ccc59c2sm7189967pjb.16.2022.03.23.10.19.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Mar 2022 10:20:00 -0700 (PDT)
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
X-Inumbo-ID: 78af94f3-aacd-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f+HL4Abo/9emIoVYr4nPcZWANTfk8HbxwtFhwWh4T4E=;
        b=R38CVVHJgH8kHmGn0ZOyhoWZ33CV6mzkknIiqbfMkEd3nlYmXum5LYE5EuR9nOh5dV
         4p+1F+9RocXuE6X/etkgzAlBdiSWWmatjKQnx2IG0DXq/5XQUfkek0cJmgKz3CvRAv+Q
         ZEQD4UjM+CuFPFnvkD7N3P9I3mXgm6KY1NLl24qU0ZpnRER1x6XTt68YoiVIlyjwivDY
         O6oJvDcjzbgtgV5VVYi1YxOK5p8sfe9NSUl24zEhnSJ+u/RzIPghmhV5VRqXDLHTZfDz
         1fSHXii1iS47EJJoenarBJh84GnRVtK24aTa2pye2VI1SSKFMWmBWKuqZTE/MxejwKcS
         YLCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f+HL4Abo/9emIoVYr4nPcZWANTfk8HbxwtFhwWh4T4E=;
        b=7Z9fcWjK8IhhaMXbDSHqml5IKiGSzeX13Dr966VmkzFWX2jh6fCg/+jVZbJM/+b093
         TZWTnwqnIreAlBOsi59PJCWvkKQb+/lAmfIKOrat2PBSGZDdghtGZWszjhOfL61Og5hY
         3H1IVGqNI5y0peZDKw4q54FHvFieMODKQx1bRY/DIikhc/fgVJo3lqYzna2KAPyBDyRZ
         9lSjHncs/lOAPnjrsqzmv1fM6lQOqUn0GWJKVmj6clXVfsKkplhDgFrAVvtQp7obfTDr
         baeFxa4fY9VYQHKXpdgxriIyPEptXg9RcnO+JUuKj0i9XArFQjzW4TSzVFFZzgDWhT1l
         2Qew==
X-Gm-Message-State: AOAM531Q5Dw7tZjYISjIvmMOriPJnoV/hdJmFtigziA32hmKVuCxxGoI
	Z/z8GdlyoicnXvSYyfH4SdU=
X-Google-Smtp-Source: ABdhPJwUGIANIvoDBDf1d6wuhMbglFjfjHX2yL7VBu0eJlXm38w4pEE/zj+JRqSDdW4aqPv9Y3LI/A==
X-Received: by 2002:a17:90a:8d85:b0:1b8:a215:e3e4 with SMTP id d5-20020a17090a8d8500b001b8a215e3e4mr12881119pjo.175.1648056000652;
        Wed, 23 Mar 2022 10:20:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: Wenchao Wang <wenchao.wang@intel.com>,
	Laurent Vivier <lvivier@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Cameron Esfahani <dirty@apple.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	haxm-team@intel.com,
	Paul Durrant <paul@xen.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Roman Bolshakov <r.bolshakov@yadro.com>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Kamil Rytarowski <kamil@netbsd.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Huth <thuth@redhat.com>,
	Colin Xu <colin.xu@intel.com>
Subject: [PATCH v4 10/13] accel-ops: Introduce common_vcpu_thread_destroy() and .precheck handler
Date: Wed, 23 Mar 2022 18:17:48 +0100
Message-Id: <20220323171751.78612-11-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
References: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Introduce an empty common_vcpu_thread_destroy() function, and
provide a AccelOpsClass::destroy_vcpu_thread_precheck() callback
so accelerators can choose whether to call common_vcpu_thread_destroy.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/sysemu/accel-ops.h | 2 ++
 softmmu/cpus.c             | 9 +++++++++
 2 files changed, 11 insertions(+)

diff --git a/include/sysemu/accel-ops.h b/include/sysemu/accel-ops.h
index caf337f61f..b47f6de3f9 100644
--- a/include/sysemu/accel-ops.h
+++ b/include/sysemu/accel-ops.h
@@ -35,6 +35,8 @@ struct AccelOpsClass {
     /* If non-NULL, return whether common vCPU thread must be created */
     bool (*create_vcpu_thread_precheck)(CPUState *cpu);
     void (*create_vcpu_thread_postcheck)(CPUState *cpu);
+    /* If non-NULL, return whether common vCPU thread must be destroyed */
+    bool (*destroy_vcpu_thread_precheck)(CPUState *cpu);
 
     void (*kick_vcpu_thread)(CPUState *cpu);
     bool (*cpu_thread_is_idle)(CPUState *cpu);
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index cf430ac486..37325b3b8d 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -617,6 +617,10 @@ static void common_vcpu_thread_create(CPUState *cpu)
 #endif
 }
 
+static void common_vcpu_thread_destroy(CPUState *cpu)
+{
+}
+
 void cpu_remove_sync(CPUState *cpu)
 {
     cpu->stop = true;
@@ -625,6 +629,11 @@ void cpu_remove_sync(CPUState *cpu)
     qemu_mutex_unlock_iothread();
     qemu_thread_join(cpu->thread);
     qemu_mutex_lock_iothread();
+
+    if (cpus_accel->destroy_vcpu_thread_precheck == NULL
+            || cpus_accel->destroy_vcpu_thread_precheck(cpu)) {
+        common_vcpu_thread_destroy(cpu);
+    }
 }
 
 void cpus_register_accel(const AccelOpsClass *ops)
-- 
2.35.1


