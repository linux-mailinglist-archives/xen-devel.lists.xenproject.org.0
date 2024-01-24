Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E94AC83B378
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 22:00:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671239.1044512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSkLj-0007Yt-My; Wed, 24 Jan 2024 20:59:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671239.1044512; Wed, 24 Jan 2024 20:59:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSkLj-0007Wa-Ik; Wed, 24 Jan 2024 20:59:55 +0000
Received: by outflank-mailman (input) for mailman id 671239;
 Wed, 24 Jan 2024 20:59:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LRLw=JC=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rSkLi-0006yg-8Y
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 20:59:54 +0000
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [2607:f8b0:4864:20::82f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84a4d3a3-bafb-11ee-9b0f-b553b5be7939;
 Wed, 24 Jan 2024 21:59:52 +0100 (CET)
Received: by mail-qt1-x82f.google.com with SMTP id
 d75a77b69052e-42a446cb1baso15500591cf.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2024 12:59:52 -0800 (PST)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 d3-20020ac80603000000b004260b65b4f7sm4643391qth.97.2024.01.24.12.59.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 12:59:50 -0800 (PST)
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
X-Inumbo-ID: 84a4d3a3-bafb-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706129990; x=1706734790; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BthpWTlw2BkiPY7xlL82j899+I8S9+DzigRUVf0kQtA=;
        b=AXZz6knApLhe/YDur+gQV/1/s4/5WeHOkxnosC1b7Tw7jUt81u09RWMiZNp0YLIrgD
         EglE6JNlfPRMWdHHNpsJmYTEu3M/EEbdVTm/gmIdi2RNJVjQA0JJx3aFZFU4NRR7OOnK
         8IOioxtVZfdeshf+dR4BmCL0zEjtGpcJXtaEYf2K+QdGwe/qAKI/0iMY3L6/VvrArxqN
         qfSXLODtRyGtoqhUpJ3wyskWu3BJHr4p/aXdykudwPjHsTf/HfOwZ/+LAyPSi9vz40hE
         1e8hqQXnfBlnz0PUpqVA5X/tmrkRp2rJj710HOj4rpA12mEcOwSXDPbdEEaa2Lh6VRcw
         3idw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706129990; x=1706734790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BthpWTlw2BkiPY7xlL82j899+I8S9+DzigRUVf0kQtA=;
        b=JvQ+1rmyZ9JzQxcYT6qaSMFmVNjgEG0H9nd4FSXJ6l/45MYx/vkY5h1PgNgij9Jujc
         bQjZGDS4HewFJwW/zBIlPA4LjyiVnzgCXU8buARSVB67hRifCYvNnTPN+pIBb171gMmZ
         FH851tkLzUXNr0mFcf51Q3VmzmXeSbOKRkcuU6Inl8ATIfAYOF+XOAE4QmS2YbhK3cBL
         VoDWFRLrAdIZfYDNOf8ZETCNViD2RUqYz6TyF32Hg58heJelBdSKNY4gEoaRDS5N+zHx
         Ypo7VrdlsYWxofSef/9ByEaO5rpmg94x7eJCNBjB0LnRwQ/EGN3QjjOrKQvIzt4X7GB8
         jP6w==
X-Gm-Message-State: AOJu0Yy+DZ7ubjEfS94szcK0x2DvQAkjJZA6XdK9bBIfv1e0pL9Tkm3v
	6xIIbOM0QorwllzOGen87QAVDBIVuRJdEbnWS9aiq5jCZDoqCzco2nmd4Vkw
X-Google-Smtp-Source: AGHT+IEL1N+v8/fKPf+QXUL4GVjzna7A1Yy/9ub/38bNbJfUs/Q8gv0AwbvyW/uXPcE7s0Sw9GJOuQ==
X-Received: by 2002:a05:622a:138e:b0:42a:5dc5:fdc8 with SMTP id o14-20020a05622a138e00b0042a5dc5fdc8mr1387749qtk.63.1706129990612;
        Wed, 24 Jan 2024 12:59:50 -0800 (PST)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 2/2] xenpm: Print message for disabled commands
Date: Wed, 24 Jan 2024 15:59:22 -0500
Message-ID: <20240124205922.67266-3-jandryuk@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240124205922.67266-1-jandryuk@gmail.com>
References: <20240124205922.67266-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xenpm get-cpufreq-states currently just prints no output when cpufreq is
disabled or HWP is running.  Have it print an appropriate message.  The
cpufreq disabled one mirros the cpuidle disabled one.

cpufreq disabled:
$ xenpm get-cpufreq-states
Either Xen cpufreq is disabled or no valid information is registered!

Under HWP:
$ xenpm get-cpufreq-states
P-State information not supported.  Try get-cpufreq-average or start.

Also allow xenpm to handle EOPNOTSUPP from the pmstat hypercalls.
EOPNOTSUPP is returned when HWP is active in some cases and allows the
differentiation from cpufreq being disabled.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
v2:
New

 tools/misc/xenpm.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index d982482a3f..79c618590b 100644
--- a/tools/misc/xenpm.c
+++ b/tools/misc/xenpm.c
@@ -362,7 +362,15 @@ static int show_pxstat_by_cpuid(xc_interface *xc_handle, int cpuid)
 
     ret = get_pxstat_by_cpuid(xc_handle, cpuid, &pxstatinfo);
     if ( ret )
+    {
+        if ( ret == -ENODEV )
+            fprintf(stderr,
+                    "Either Xen cpufreq is disabled or no valid information is registered!\n");
+       else if ( ret == -EOPNOTSUPP )
+            fprintf(stderr,
+                    "P-State information not supported.  Try get-cpufreq-average or start.\n");
         return ret;
+    }
 
     print_pxstat(cpuid, &pxstatinfo);
 
@@ -382,9 +390,11 @@ void pxstat_func(int argc, char *argv[])
     {
         /* show pxstates on all cpus */
         int i;
-        for ( i = 0; i < max_cpu_nr; i++ )
-            if ( show_pxstat_by_cpuid(xc_handle, i) == -ENODEV )
+        for ( i = 0; i < max_cpu_nr; i++ ) {
+            int ret = show_pxstat_by_cpuid(xc_handle, i);
+            if ( ret == -ENODEV || ret == -EOPNOTSUPP )
                 break;
+	}
     }
     else
         show_pxstat_by_cpuid(xc_handle, cpuid);
@@ -432,7 +442,7 @@ static uint64_t *sum, *sum_cx, *sum_px;
 
 static void signal_int_handler(int signo)
 {
-    int i, j, k;
+    int i, j, k, ret;
     struct timeval tv;
     int cx_cap = 0, px_cap = 0;
     xc_cputopo_t *cputopo = NULL;
@@ -473,7 +483,8 @@ static void signal_int_handler(int signo)
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


