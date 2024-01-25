Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 822AC83CAA5
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jan 2024 19:16:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671698.1045184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT4GA-0004ZU-8E; Thu, 25 Jan 2024 18:15:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671698.1045184; Thu, 25 Jan 2024 18:15:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT4GA-0004Wy-4u; Thu, 25 Jan 2024 18:15:30 +0000
Received: by outflank-mailman (input) for mailman id 671698;
 Thu, 25 Jan 2024 18:15:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KpLG=JD=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rT4G9-0004GD-8a
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2024 18:15:29 +0000
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [2607:f8b0:4864:20::733])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7bd1c09-bbad-11ee-8a42-1f161083a0e0;
 Thu, 25 Jan 2024 19:15:28 +0100 (CET)
Received: by mail-qk1-x733.google.com with SMTP id
 af79cd13be357-78313f4d149so610365385a.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jan 2024 10:15:28 -0800 (PST)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 wg8-20020a05620a568800b00781b8f4c89asm5265899qkn.43.2024.01.25.10.15.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jan 2024 10:15:26 -0800 (PST)
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
X-Inumbo-ID: b7bd1c09-bbad-11ee-8a42-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706206527; x=1706811327; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YyEbMZdJfecnQ9Hzg5AB7rtSEVHtymjTaGyNCauyTks=;
        b=lXkC4e+HiRB2trX7vR+kWAhNGoBR2laQbKVfsVYOGq7wgZka7tOvGETFFYQKgUaEmv
         DqJ3969bItTnbt4aO0hbMtotTDAJZMlL4dDiPUF9lyb28I/7nu9AEiRdTAdYRtp7L1Yk
         7FrqbJ5smL9jCiYLxihvE2pgBoY/V8pHNKF1+t0MOx2ox49hFhBpZKmHx4/4jbygfBAo
         aT6vnObae4bIrpeiB6OLh56ee7644OQ4qGqxItOaZSN7ejdViD0UpvSAOHosH0/RTrND
         eB4BQ0YE4+37lonSUqRQq3prqwEKMVdrZP544PmytY/UMJ/pA+HKJa38vZTHnMnA9xEi
         0u7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706206527; x=1706811327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YyEbMZdJfecnQ9Hzg5AB7rtSEVHtymjTaGyNCauyTks=;
        b=rQM57gvaELl73F5Q8Twy7bzCgKCRElF5uWYW4r+DTn2W1z5PZa7454KoBvNDTkzgD9
         ii8GmhT1Mg1y9+iKn33FrcH6f8jPrgRcUxYtytJ4HyP5+JOcb1j/sk7mLPpio9JAaFeB
         YsvvEjvAKWnC0zLmLIY8R5RsrQ7n30XN5mvClc87iJ9F29XXLS2UGLA/tFtTiYMsIuQS
         d0RQ1QCq9/2GBjSNTPH/52gQh+mNCRp7vKeGhFKHieMZOX2ygrvovy7B+loSLITx/d4G
         s6hcFXN6324eJ3j4CckDIzXnaBNhx066DHxMgXe07F7Ws3YJ+OBvcd2J5r7V48MHSTUz
         yIOQ==
X-Gm-Message-State: AOJu0Yzyw6Q1QN5fdp82tkumKLqIxG4HHTtKVbGKZsuby+A0sriTK34V
	R0/WHgOML8kZeG2dx8an34l4OuXgGIlkL4jSh7xHYtlMPIG0lxE+FPtFUFxs
X-Google-Smtp-Source: AGHT+IG6CrsocHLAqBMNBRYNbbTEsI51rayRyRzMxZzvh6CjXbmVn3O61ug+Dsl6MG48ddQCoucSbg==
X-Received: by 2002:a05:620a:22f7:b0:783:3b4a:b55b with SMTP id p23-20020a05620a22f700b007833b4ab55bmr1288900qki.53.1706206526712;
        Thu, 25 Jan 2024 10:15:26 -0800 (PST)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 1/2] pmstat: Limit hypercalls under HWP
Date: Thu, 25 Jan 2024 13:14:53 -0500
Message-ID: <20240125181454.50534-2-jandryuk@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240125181454.50534-1-jandryuk@gmail.com>
References: <20240125181454.50534-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When HWP is active, the cpufreq P-state information is not updated.  In
that case, return -EOPNOTSUPP instead of bogus, incomplete info.

Similarly, set_cpufreq_para() is not applicable when HWP is active.
Many of the options already checked the governor and were inaccessible,
but SCALING_MIN/MAX_FREQ was still accessible (though it would do
nothing).  Add an ealier HWP check to handle all cases.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
v2:
Use -EOPNOTSUPP in both places

v3:
Add Jan's R-b
---
 xen/drivers/acpi/pmstat.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/xen/drivers/acpi/pmstat.c b/xen/drivers/acpi/pmstat.c
index 85097d463c..86588ddd42 100644
--- a/xen/drivers/acpi/pmstat.c
+++ b/xen/drivers/acpi/pmstat.c
@@ -66,6 +66,8 @@ int do_get_pm_info(struct xen_sysctl_get_pmstat *op)
             return -ENODEV;
         if ( !cpufreq_driver.init )
             return -ENODEV;
+        if ( hwp_active() )
+            return -EOPNOTSUPP;
         if ( !pmpt || !(pmpt->perf.init & XEN_PX_INIT) )
             return -EINVAL;
         break;
@@ -329,6 +331,9 @@ static int set_cpufreq_para(struct xen_sysctl_pm_op *op)
     if ( !policy || !policy->governor )
         return -EINVAL;
 
+    if ( hwp_active() )
+        return -EOPNOTSUPP;
+
     switch(op->u.set_para.ctrl_type)
     {
     case SCALING_MAX_FREQ:
-- 
2.43.0


