Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E388C772E56
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 20:57:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578854.906608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT5Q1-0004Ad-Fq; Mon, 07 Aug 2023 18:57:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578854.906608; Mon, 07 Aug 2023 18:57:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT5Q1-00048f-Cl; Mon, 07 Aug 2023 18:57:29 +0000
Received: by outflank-mailman (input) for mailman id 578854;
 Mon, 07 Aug 2023 18:57:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qk11=DY=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qT5LA-0004GT-Qa
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 18:52:28 +0000
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [2607:f8b0:4864:20::c32])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d4e026d-3553-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 20:52:27 +0200 (CEST)
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-56d0d7300d9so3379268eaf.1
 for <xen-devel@lists.xenproject.org>; Mon, 07 Aug 2023 11:52:27 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 l3-20020a0ce503000000b00635fcd30ff9sm3077278qvm.40.2023.08.07.11.52.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 11:52:24 -0700 (PDT)
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
X-Inumbo-ID: 8d4e026d-3553-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691434345; x=1692039145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8DQkeW1PaXja4KIHBd9qWOWyZUnQRLS9exqlWjIoM/A=;
        b=Z2lmti/Wer72P5ai8c80vOFC++zaGGpmeGQt/JShbpznCCh/DpVnKzoQu0RpvB7DiT
         o8UYN3JEP2SSVz+iWIYySnnruPKXAP4vsHf3Y2xelJkyyCchAoRgxoI14SGy6CIxAHxR
         aYIvyn95Bq/Ux4hAamu+qIkhBYsGyrRZoEwKGvQczYut5xBvn7XyQjRc6Qa9YaUxD1sA
         WXV0qqBKmTOZ4xxlBkmd5nASkUm5Id4F/F6RZ8xZM6NGok/KfanKxfIvu5TTTVQjcS6d
         wQNRgzB/VvdTQ/uO4pjAJ7CcPQ+LtL4uSfRNwfrH/r6rjKOLbu/HF9bYXSnAmp1juDpE
         IQqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691434345; x=1692039145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8DQkeW1PaXja4KIHBd9qWOWyZUnQRLS9exqlWjIoM/A=;
        b=JGh+IY+28h806/n0svjTEShdashWFvLLIcVUbqWU3M3WviqF11LrCiRVgCFcRJNoCG
         vs+OrP1v2+23Fu7xtQCjSyaiu4PT0es7EZG6xOpXOyjRA8ZpuqTsSrf8FgoN62BhxEzi
         nevYPHawya7Y+o6orr7HOsMGBxFnxj5KS0HGw2UGGus47scstePodexGlUqn+U6ld2Gr
         t2XXR6XIHDsKz4WCYnQ5ISWQ6lLpn9mb08Cz/L6AMZpE//gJVvnbgL9jU6UkYORWp7wk
         Efxvt320CxEsjudbpXSZ2RHfqH3wZ3q5FRgtpDA0t0mgCCqpQlsRUK3LYdLkmZ5FllnL
         9oGw==
X-Gm-Message-State: AOJu0YzwQwD1m6l9p+Y/VyPPGQC8nJIYO9BLpNJu7mEJPEXJuYvuN0kK
	nRZy+QooVJv0WunEz0IZ1lE8eIzFniM=
X-Google-Smtp-Source: AGHT+IHLRK6B7CKh9F5LEFpo5z6t/O2jdU4MY1VAnFsvimMK3dDFp/U6+2u8F5o7xaDA3yEoXXxK6w==
X-Received: by 2002:a05:6358:99a6:b0:139:833c:53f8 with SMTP id j38-20020a05635899a600b00139833c53f8mr9052643rwb.24.1691434345322;
        Mon, 07 Aug 2023 11:52:25 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v8 13/15] libxc: Add xc_set_cpufreq_cppc
Date: Mon,  7 Aug 2023 14:51:17 -0400
Message-ID: <20230807185119.98333-14-jandryuk@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230807185119.98333-1-jandryuk@gmail.com>
References: <20230807185119.98333-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add xc_set_cpufreq_cppc to allow calling xen_systctl_pm_op
SET_CPUFREQ_CPPC.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Acked-by: Anthony PERARD <anthony.perard@citrix.com>
---
v2:
Mark xc_set_hwp_para_t const

v4:
s/hwp/cppc/
Add Anthony's Ack

v5:
Remove const and copy back result
---
 tools/include/xenctrl.h |  4 ++++
 tools/libs/ctrl/xc_pm.c | 23 +++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 5824394125..12dca13b69 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1947,11 +1947,15 @@ struct xc_get_cpufreq_para {
     int32_t turbo_enabled;
 };
 
+typedef struct xen_set_cppc_para xc_set_cppc_para_t;
+
 int xc_get_cpufreq_para(xc_interface *xch, int cpuid,
                         struct xc_get_cpufreq_para *user_para);
 int xc_set_cpufreq_gov(xc_interface *xch, int cpuid, char *govname);
 int xc_set_cpufreq_para(xc_interface *xch, int cpuid,
                         int ctrl_type, int ctrl_value);
+int xc_set_cpufreq_cppc(xc_interface *xch, int cpuid,
+                        xc_set_cppc_para_t *set_cppc);
 int xc_get_cpufreq_avgfreq(xc_interface *xch, int cpuid, int *avg_freq);
 
 int xc_set_sched_opt_smt(xc_interface *xch, uint32_t value);
diff --git a/tools/libs/ctrl/xc_pm.c b/tools/libs/ctrl/xc_pm.c
index 3e969b841f..6157f4e3d4 100644
--- a/tools/libs/ctrl/xc_pm.c
+++ b/tools/libs/ctrl/xc_pm.c
@@ -368,6 +368,29 @@ int xc_set_cpufreq_para(xc_interface *xch, int cpuid,
     return xc_sysctl(xch, &sysctl);
 }
 
+int xc_set_cpufreq_cppc(xc_interface *xch, int cpuid,
+                        xc_set_cppc_para_t *set_cppc)
+{
+    DECLARE_SYSCTL;
+    int ret;
+
+    if ( !xch )
+    {
+        errno = EINVAL;
+        return -1;
+    }
+    sysctl.cmd = XEN_SYSCTL_pm_op;
+    sysctl.u.pm_op.cmd = SET_CPUFREQ_CPPC;
+    sysctl.u.pm_op.cpuid = cpuid;
+    sysctl.u.pm_op.u.set_cppc = *set_cppc;
+
+    ret = xc_sysctl(xch, &sysctl);
+
+    *set_cppc = sysctl.u.pm_op.u.set_cppc;
+
+    return ret;
+}
+
 int xc_get_cpufreq_avgfreq(xc_interface *xch, int cpuid, int *avg_freq)
 {
     int ret = 0;
-- 
2.41.0


