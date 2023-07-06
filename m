Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1E974A409
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 20:59:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560012.875587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHUCN-0002wm-HT; Thu, 06 Jul 2023 18:59:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560012.875587; Thu, 06 Jul 2023 18:59:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHUCN-0002vt-DU; Thu, 06 Jul 2023 18:59:27 +0000
Received: by outflank-mailman (input) for mailman id 560012;
 Thu, 06 Jul 2023 18:59:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zM/b=CY=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qHU8y-0003x8-7a
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 18:55:56 +0000
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [2607:f8b0:4864:20::72d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc82c15b-1c2e-11ee-b237-6b7b168915f2;
 Thu, 06 Jul 2023 20:55:55 +0200 (CEST)
Received: by mail-qk1-x72d.google.com with SMTP id
 af79cd13be357-76714caf466so98515985a.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Jul 2023 11:55:55 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 g25-20020ae9e119000000b0075b168fcde9sm1015297qkm.77.2023.07.06.11.55.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jul 2023 11:55:53 -0700 (PDT)
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
X-Inumbo-ID: bc82c15b-1c2e-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688669754; x=1691261754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wIB5Z/ggG5eJ8M2F2JBMwNaYc9A5YlbhT5y/HdVUB7g=;
        b=CL80xBSVUOr7DE4xzYXCvCDvI+BPp2amSVoahY4kQuR1PHBh+NFe5hjeX1QiE4gZSN
         GdHDadQwBRVSwPt0WN+u/P6dSjyNNWa+aW1f0WumZxxdkwKPF2RYqalod9Zv3AArAtq/
         07BUyZ7L6yj0ma/OlJlHKGf+GH69W2eDCx+zpU2i1U2/ibCZB0ZOY+KSH2Kq80Y3y0Pl
         y0B+S6sI17vrAGIV5GM6KqX+jO69DkGpltbNpOyjLVJycMZmdoRprtFcI5vvFDVPzeGM
         rw0R9nx7RegHtMF6ENPZtd6tQYc/HzSj6mRfBqSkMbD0VuiSqAVjXix37Lf6tzQ7nbFc
         NGVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688669754; x=1691261754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wIB5Z/ggG5eJ8M2F2JBMwNaYc9A5YlbhT5y/HdVUB7g=;
        b=g0l1UpKOSilVY2QADSv1Pe1nQ/kDuf+fsEQFJ/0ltknhvFWMoQRUDmbjCACxsCAaFZ
         fDtUPiMMDC9RAMPFeXtL9xm4J6uf0rYToC9COUvbfJ6WCx0Tl9Gsf+yjYTp5YMhJewv2
         fh1DFK4UR2vQP7osLn3rn1Q+6pMZx36NYwi7bv2zP9LGvqvi5QN0T1/Rs24vaLxCYCKE
         Iioq8VBZNrBzSNHuA2138u0LwG52qKKh4hp3b7KrpoYpRgJU0kEPlDchOO0g+7OzGxg+
         3d+WkVpdkv5bAIQYr5r0dSbcWaMW2X8cCsqI/8QSx1TIXfwSY587F6maRu1D3HnRxWmE
         4FsA==
X-Gm-Message-State: ABy/qLbQfkndZ25Wau25Y94NTcfipwuo0KWDew8NzwN/FS5HI4Lxhyoj
	5N9diZQvOKuspwf+iJoLGJsfoR1gbrE=
X-Google-Smtp-Source: APBJJlH+p8na6m3NXr3ToUwrDnUbgIyH0Bwij5oF6kagcSBUe8Cu9am00jA/3AtA1l/flGpTQArkdA==
X-Received: by 2002:a05:620a:254f:b0:766:77b7:4c73 with SMTP id s15-20020a05620a254f00b0076677b74c73mr2887406qko.35.1688669754167;
        Thu, 06 Jul 2023 11:55:54 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v5 13/15] libxc: Add xc_set_cpufreq_cppc
Date: Thu,  6 Jul 2023 14:54:38 -0400
Message-ID: <20230706185440.48333-14-jandryuk@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706185440.48333-1-jandryuk@gmail.com>
References: <20230706185440.48333-1-jandryuk@gmail.com>
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


