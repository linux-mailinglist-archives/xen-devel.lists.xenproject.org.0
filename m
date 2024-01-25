Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8BC83CAA7
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jan 2024 19:16:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671699.1045193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT4GD-0004pQ-Es; Thu, 25 Jan 2024 18:15:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671699.1045193; Thu, 25 Jan 2024 18:15:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT4GD-0004nZ-BY; Thu, 25 Jan 2024 18:15:33 +0000
Received: by outflank-mailman (input) for mailman id 671699;
 Thu, 25 Jan 2024 18:15:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KpLG=JD=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rT4GC-0004GD-F9
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2024 18:15:32 +0000
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [2607:f8b0:4864:20::72a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b990f26d-bbad-11ee-8a42-1f161083a0e0;
 Thu, 25 Jan 2024 19:15:31 +0100 (CET)
Received: by mail-qk1-x72a.google.com with SMTP id
 af79cd13be357-783b0813e48so70209485a.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jan 2024 10:15:31 -0800 (PST)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 wg8-20020a05620a568800b00781b8f4c89asm5265899qkn.43.2024.01.25.10.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jan 2024 10:15:29 -0800 (PST)
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
X-Inumbo-ID: b990f26d-bbad-11ee-8a42-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706206530; x=1706811330; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Cyl/tzhVyURcOp/nlofd5b74JJYkMUzcH4H5kjvyLE=;
        b=LhjLdVhRzPbpca1iKmVk0uBO+lU67vwnUZy9sOlHed0DMtNzFFm9ETK9Oxmbo4LCO7
         k5rA9NNq0w/jouCiIxInQ2z/pvwba3lF1dHiv1tW+wNQH+xKwERS3zhdQHopVzhUbCHR
         T5IlSbQFmYVP1rPd/02FFQyF+w2CYir9ywEjGzQEOTGvySx1WJ2yYAw23spvTfm3RoEu
         3qy8nc6eNQurDryFHSCwpcBgQYNumps1rcLbUDdFj2UgkfDaXI4v1e+aybf/8Q876E++
         0JclIGdRYSpyVZmH6RIEqojU9Ifll3HI6+v8Ho/iiXCyrQ+qClMWOS5TF9yOkSG+yru4
         X3WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706206530; x=1706811330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Cyl/tzhVyURcOp/nlofd5b74JJYkMUzcH4H5kjvyLE=;
        b=lIOHP8q0x99XeIJRCbaoDr5ES0fNvAkxm5zpGnp3bx9y7VbzLZDPtyjSD2KjH/Lb+8
         KOu1bn6N/E3QTnUgPz1xENEWlkXrc6gZ2Uq2Ub7EdeplYW9enA6AgJmDnne21n7gV/t5
         t2kJgxYbEGrFxhOK3tbRzB3yxYqd0xAoxiZNuSAcc3yGhiwISiyKwMI6Yvj2EAzufJV0
         Ee4ImKreQ62rxCBNgR1AySud6+rz7Flgf0ch4SMQlumbGVZ9Y8MPEZ6Lcv3Pq6bLshf6
         rzlxz7VU3IAPhQIoJJOnDqZNYEsoSNDqYGS3SisVxGEMU/+ZUDWkj+6p/xgXvJvqZJZi
         WK0Q==
X-Gm-Message-State: AOJu0YyoBD0nIa8sF4JnrfW6AgIKAyJrzNy+QMavOIiun2Jhk/T1o9Qf
	APOblpTi7FPiq2w+wWLB4/kKUWhIIDsUeIwrlUtq4tq6lLx8VXut6fPcwrga
X-Google-Smtp-Source: AGHT+IHIGKvvx5bRtA8gFtzC3UIz69okIYgMu7Dy5xhL55yABZzc84JQCJWdijmUREAcIQtOM3hCoQ==
X-Received: by 2002:a05:620a:2116:b0:783:8b88:e4df with SMTP id l22-20020a05620a211600b007838b88e4dfmr306321qkl.14.1706206529887;
        Thu, 25 Jan 2024 10:15:29 -0800 (PST)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 2/2] xenpm: Print message for disabled commands
Date: Thu, 25 Jan 2024 13:14:54 -0500
Message-ID: <20240125181454.50534-3-jandryuk@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240125181454.50534-1-jandryuk@gmail.com>
References: <20240125181454.50534-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xenpm get-cpufreq-states currently just prints no output when cpufreq is
disabled or HWP is running.  Have it print an appropriate message.  The
cpufreq disabled one mirrors the cpuidle disabled one.

cpufreq disabled:
$ xenpm get-cpufreq-states
Either Xen cpufreq is disabled or no valid information is registered!

Under HWP:
$ xenpm get-cpufreq-states
P-State information not supported.  Try 'get-cpufreq-average' or 'start'.

Also allow xenpm to handle EOPNOTSUPP from the pmstat hypercalls.
EOPNOTSUPP is returned when HWP is active in some cases and allows the
differentiation from cpufreq being disabled.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
v2:
New

v3:
Quote subcommands in error message
Fix style errors
s/mirros/mirrors/ in commit message
---
 tools/misc/xenpm.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index d982482a3f..336d246346 100644
--- a/tools/misc/xenpm.c
+++ b/tools/misc/xenpm.c
@@ -362,7 +362,15 @@ static int show_pxstat_by_cpuid(xc_interface *xc_handle, int cpuid)
 
     ret = get_pxstat_by_cpuid(xc_handle, cpuid, &pxstatinfo);
     if ( ret )
+    {
+        if ( ret == -ENODEV )
+            fprintf(stderr,
+                    "Either Xen cpufreq is disabled or no valid information is registered!\n");
+        else if ( ret == -EOPNOTSUPP )
+            fprintf(stderr,
+                    "P-State information not supported.  Try 'get-cpufreq-average' or 'start'.\n");
         return ret;
+    }
 
     print_pxstat(cpuid, &pxstatinfo);
 
@@ -383,8 +391,12 @@ void pxstat_func(int argc, char *argv[])
         /* show pxstates on all cpus */
         int i;
         for ( i = 0; i < max_cpu_nr; i++ )
-            if ( show_pxstat_by_cpuid(xc_handle, i) == -ENODEV )
+        {
+            int ret = show_pxstat_by_cpuid(xc_handle, i);
+
+            if ( ret == -ENODEV || ret == -EOPNOTSUPP )
                 break;
+        }
     }
     else
         show_pxstat_by_cpuid(xc_handle, cpuid);
@@ -432,7 +444,7 @@ static uint64_t *sum, *sum_cx, *sum_px;
 
 static void signal_int_handler(int signo)
 {
-    int i, j, k;
+    int i, j, k, ret;
     struct timeval tv;
     int cx_cap = 0, px_cap = 0;
     xc_cputopo_t *cputopo = NULL;
@@ -473,7 +485,8 @@ static void signal_int_handler(int signo)
                 }
     }
 
-    if ( get_pxstat_by_cpuid(xc_handle, 0, NULL) != -ENODEV )
+    ret = get_pxstat_by_cpuid(xc_handle, 0, NULL);
+    if ( ret != -ENODEV && ret != -EOPNOTSUPP )
     {
         px_cap = 1;
         for ( i = 0; i < max_cpu_nr; i++ )
-- 
2.43.0


