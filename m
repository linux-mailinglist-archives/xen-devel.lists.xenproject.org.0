Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CED8371F6
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jan 2024 20:10:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670141.1042747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRzg4-0003dv-0j; Mon, 22 Jan 2024 19:09:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670141.1042747; Mon, 22 Jan 2024 19:09:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRzg3-0003aj-Tf; Mon, 22 Jan 2024 19:09:47 +0000
Received: by outflank-mailman (input) for mailman id 670141;
 Mon, 22 Jan 2024 19:09:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eEUA=JA=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rRzg3-0003ad-8b
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2024 19:09:47 +0000
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [2607:f8b0:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd06c61e-b959-11ee-9b0f-b553b5be7939;
 Mon, 22 Jan 2024 20:09:44 +0100 (CET)
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-6ddf388ca74so1817073a34.0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jan 2024 11:09:44 -0800 (PST)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 fj22-20020a05622a551600b00429bdb1d705sm2743963qtb.1.2024.01.22.11.09.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jan 2024 11:09:42 -0800 (PST)
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
X-Inumbo-ID: cd06c61e-b959-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705950583; x=1706555383; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/06LHe3kSR6cR46TKM9o0dxUT/H7ZG7I/ELydD7KVXA=;
        b=CHah24Og4ptYvcmNvwp5DRoZvuAyO2E3bMcW1TmVc4IyPzoAOZYwxpzImGBIW/e2gz
         SSPR6KS/HEjHFSs0C6UlqBqPhDGSoOwGLmmPy6G98Skl7Hkb1x2rl/1QLFswB54gachr
         /b0MvbbokdkF1Y7HXmvu5guqi2e6r1j4Eo3PtETPUmUTlocjiv9iggGhZl14MJ3+EGxH
         uFnhZ07qAXowwdBIK8E6rZS19+IkWbRn3GpK6xfWDUaWS+xjIdhkBDmz+Kb9TntjOQN5
         wl7X6+eudJnEY/3ZBBGjSYzYVR84u5cqXj5O0E9wg/sS+Z30lIRLq8YvrwAHtFac5uJN
         0C8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705950583; x=1706555383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/06LHe3kSR6cR46TKM9o0dxUT/H7ZG7I/ELydD7KVXA=;
        b=sGY1gbHg55fyWkQir0bkDxUWVcnLCBSLAvmD8wQaDcON8ewEvIR4ukDXlxghWXxC4z
         XoX2EzVS7SasdI4f7JjKmd2FfBTbHNsDVJsv1aTqMC7rS/n7eLd9WiVuXpvNZFLm8ETy
         mpxFt51AMT3oTvjaR55gReqPaRNv2pf4+axKJxBKzeJifK/HfD8+sHV4qoRWAMlbTP1M
         4CPpziwXF+Q5vOzZoiGubj6coD6iT1b0YVeEA9QEzXyGEeMXxKT5++aOprq6sr/P/BF2
         bMdQn63WV+NCkDaG69/MKDD9gG+FlIFLFTPfzMtcwtttAncJ49E3HToIi0m7xDGujeRE
         6oFA==
X-Gm-Message-State: AOJu0Yz7v9VNSCkwJrf8+KrsFMeefIb4n7DtVOjiaiN+Oj68ii7mUR8/
	2JTrV2OYNzL1Puc1012NqXpmeQ3qQPNtEz+j74y6Uzmt/jsoUIBT98ya5+a+
X-Google-Smtp-Source: AGHT+IFl/d4an0rvO1amFSG4D+AUsoWHJDlm5kZnTodgEFTobSOOi7xUj1pqB85xsU0hFUUX/mhabA==
X-Received: by 2002:a9d:7d08:0:b0:6dd:ca7d:b4eb with SMTP id v8-20020a9d7d08000000b006ddca7db4ebmr4021936otn.0.1705950582826;
        Mon, 22 Jan 2024 11:09:42 -0800 (PST)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] pmstat: Limit hypercalls under HWP
Date: Mon, 22 Jan 2024 14:09:34 -0500
Message-ID: <20240122190934.52080-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When HWP is active, the cpufreq P-state information is not updated.  In
that case, return -ENODEV instead of bogus, incomplete info.  The xenpm
command already supports skipping results when -ENODEV is returned, so
it is re-used when -EOPNOTSUPP might be more accurate.

Similarly, set_cpufreq_para() is not applicable when HWP is active.
Many of the options already checked the governor and were inaccessible,
but SCALING_MIN/MAX_FREQ was still accessible (though it would do
nothing).  Add an ealier HWP check to handle all cases.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
`xenpm get-cpufreq-states` now doesn't return any output.  It also exits
successfully since xenpm doesn't check the returns there.  Other
commands will fail:
xenpm set-scaling-maxfreq 11 1100000
failed to set scaling max freq (95 - Operation not supported)

 xen/drivers/acpi/pmstat.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/xen/drivers/acpi/pmstat.c b/xen/drivers/acpi/pmstat.c
index 85097d463c..4c4d298d1c 100644
--- a/xen/drivers/acpi/pmstat.c
+++ b/xen/drivers/acpi/pmstat.c
@@ -66,6 +66,8 @@ int do_get_pm_info(struct xen_sysctl_get_pmstat *op)
             return -ENODEV;
         if ( !cpufreq_driver.init )
             return -ENODEV;
+        if ( hwp_active() )
+            return -ENODEV;
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


