Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D3B75F7A4
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 15:00:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568927.889116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNvAH-0007eq-OO; Mon, 24 Jul 2023 12:59:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568927.889116; Mon, 24 Jul 2023 12:59:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNvAH-0007c0-JI; Mon, 24 Jul 2023 12:59:53 +0000
Received: by outflank-mailman (input) for mailman id 568927;
 Mon, 24 Jul 2023 12:59:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ymW7=DK=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qNvAG-0005PS-BW
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 12:59:52 +0000
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [2607:f8b0:4864:20::834])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa0b5116-2a21-11ee-b23a-6b7b168915f2;
 Mon, 24 Jul 2023 14:59:51 +0200 (CEST)
Received: by mail-qt1-x834.google.com with SMTP id
 d75a77b69052e-4039a42467fso31278521cf.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 05:59:51 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 d3-20020ac81183000000b00402364e77dcsm3273060qtj.7.2023.07.24.05.59.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 05:59:49 -0700 (PDT)
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
X-Inumbo-ID: fa0b5116-2a21-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690203590; x=1690808390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wIB5Z/ggG5eJ8M2F2JBMwNaYc9A5YlbhT5y/HdVUB7g=;
        b=SM+lqGSz/5VSB9c/MoeGAZxm/4e37RT/uB8jtevTGq2vpRK1NLJKjHt2dQIjYCAD1Q
         GtCp8vSZkjj6j8F2lmJAt12mGxcR6pLyCiJRo4/8ad/nJio3GF2rSRcMjJNXwlfaDABd
         KKTjn4RnHkuqLQDUb5kb7lLoFOxbAV/wHFUJvzkhzKNv6L0bR5GlRJGL3h8sFarOmr1E
         cmwXbyfqO4JVF1L+m7+mr9s9AzxJI1e2WRjL/6mzvrFjELvoZtERcNz6Lc0LCIetna63
         TkMeA9iw6XnfkAPW5tPEfjgJHmygzPceBvmkOMJOsssD57AnnFmq47SWPRvc3EcNxkn7
         +obw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690203590; x=1690808390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wIB5Z/ggG5eJ8M2F2JBMwNaYc9A5YlbhT5y/HdVUB7g=;
        b=H0dbT5TaxpiacrWkUP7OEcYtqomo8fuAfB509qnILAVgEMijCcYoJPBhXgmYWmhWdG
         MQ5PaESfLX/thpTROL7Ipq4CJMoXUt99fovisNzPt0tOgtEZT7SkRJAWVdMgxb/wdOh6
         fd/e8NhtXSboE/pHwN74mIuvOZOeMPhqxCueLKVBSK5MucO0K0zqeddZk0xX01gZ6cVj
         4ZzHaC/1mQ8NWGwTt4xRVtL/Ecl74gDMrX2AMmaBAvnuYxkV0SUAd9+Go2evY84VduHi
         /AIentvcwTqB3v6VtRgwXOocaVNM8MqVqX2HhKMNlRQM25z7XBdbkUJLL4meCxXNvhOx
         mATA==
X-Gm-Message-State: ABy/qLbfo0l7mm/BahqTSSTzEPMwf/BIEgME1gMvnJx99vECEu8cIDjt
	MEhd86E7fEAgW8nExjGZDkP9l7+ZzTQ=
X-Google-Smtp-Source: APBJJlEbAnhKZwmYJQ1uF7lhDM89r23rRp0J9dk/ylqXD/W3cyaHzjwGjBqtJEoEoPnRT2KCqo8gcA==
X-Received: by 2002:ac8:7f84:0:b0:403:adf1:8352 with SMTP id z4-20020ac87f84000000b00403adf18352mr11685349qtj.24.1690203590210;
        Mon, 24 Jul 2023 05:59:50 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v6 13/15] libxc: Add xc_set_cpufreq_cppc
Date: Mon, 24 Jul 2023 08:58:55 -0400
Message-ID: <20230724125857.11133-14-jandryuk@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230724125857.11133-1-jandryuk@gmail.com>
References: <20230724125857.11133-1-jandryuk@gmail.com>
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
index 2092632296..52f42fb5b6 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1930,11 +1930,15 @@ struct xc_get_cpufreq_para {
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
index cea3eab22e..1f267147f6 100644
--- a/tools/libs/ctrl/xc_pm.c
+++ b/tools/libs/ctrl/xc_pm.c
@@ -329,6 +329,29 @@ int xc_set_cpufreq_para(xc_interface *xch, int cpuid,
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


