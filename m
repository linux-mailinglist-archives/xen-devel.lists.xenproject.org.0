Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C086B58F31A
	for <lists+xen-devel@lfdr.de>; Wed, 10 Aug 2022 21:30:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383895.619189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLrPZ-0000xw-6P; Wed, 10 Aug 2022 19:30:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383895.619189; Wed, 10 Aug 2022 19:30:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLrPY-0000rS-Sq; Wed, 10 Aug 2022 19:30:36 +0000
Received: by outflank-mailman (input) for mailman id 383895;
 Wed, 10 Aug 2022 19:30:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UxBI=YO=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1oLrPW-00067E-Sh
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 19:30:35 +0000
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [2607:f8b0:4864:20::f2c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e770febe-18e2-11ed-924f-1f966e50362f;
 Wed, 10 Aug 2022 21:30:34 +0200 (CEST)
Received: by mail-qv1-xf2c.google.com with SMTP id l18so11711228qvt.13
 for <xen-devel@lists.xenproject.org>; Wed, 10 Aug 2022 12:30:34 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:289e:b898:c7de:df6c])
 by smtp.gmail.com with ESMTPSA id
 v6-20020a05620a0f0600b006af10bd3635sm537231qkl.57.2022.08.10.12.30.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 12:30:32 -0700 (PDT)
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
X-Inumbo-ID: e770febe-18e2-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=dLajvGFi/Mcq6cLyHR7My8Hc/MEdmzVTbkF+UN7LfEg=;
        b=pB5xf/YEQ3P8NLS7h8SXbF4V4sYUUeMsGEYPIFenPb8paOjgeZ/0QBPFHSpO2t0H6a
         HJ3d1q+KGpQMvuMOao+B4AIIRF921ShjneEBM4WOMdDQG9btDQC9zGyX/eU1wyiLxjNt
         VENBx0xjLF8/tE2KXCg9QR9L7j6NSmHsubPxm17B+0upYRHaBjfYLYQa98yHMZvC1rXL
         TnDC3YdQhApMTPHH8jsQp1do6ucwo7nGHI46z+/NqtRuIQFOvJc7sZOqEtp7fk5w2Lh1
         PkfAO4Ssupm5OIuXCPS3YfE/405aKoRtXXUHFn354CMHzckx54tsNQxQRiCGxn8KSyQx
         GZpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=dLajvGFi/Mcq6cLyHR7My8Hc/MEdmzVTbkF+UN7LfEg=;
        b=wvJv/T7eZ03Jg1QjVs0/zOhEStMWt9V8cUBZCMiJ5xet4nPFhK1BGtYunUrEGFDvhY
         3ekr1oj6IJVIzZz5Dl64ova4Sru81wujbByvZdlaVu6i0ElB6rMuy1y4SUPag2Igj+8+
         OzH9UPzoCe+4T/0CFqMGk/7Ib5nRu13e6Ln/spwxIIQhXKNv9D+wwzpXPNPqZNX8MdTn
         a0OgfyjeW5mYqh9Zu8G1Rojx4jXFbf8A4V4kNc21u3afWElX965jzTVVEYzZLEwqQMHd
         PP/XopEHVAyqw0pqOgugmsxQX2KiDwjRCxwZjO+ESaXY5R/mi6t10bjNYe8kmOpYhHvB
         uiKw==
X-Gm-Message-State: ACgBeo3bdKAgCp3RBc5bk04Z+jjHJK+ZzzEJ04b4xvmtkhVaTXQ5uBOJ
	01ysIrSqupbx0Xq9Yot2PDNPUnf2V+k=
X-Google-Smtp-Source: AA6agR6AHSo2l4SyRfTLy7dPfWFwKCM7w+4fegiPz5bnDR7LfriyWsMdrF8su5Ldpt6aKhrNUxADLQ==
X-Received: by 2002:a05:6214:c25:b0:476:eb9c:fc7b with SMTP id a5-20020a0562140c2500b00476eb9cfc7bmr24850012qvd.108.1660159833498;
        Wed, 10 Aug 2022 12:30:33 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 10/13] libxc: Add xc_set_cpufreq_hwp
Date: Wed, 10 Aug 2022 15:29:41 -0400
Message-Id: <20220810192944.102135-11-jandryuk@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220810192944.102135-1-jandryuk@gmail.com>
References: <20220810192944.102135-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add xc_set_cpufreq_hwp to allow calling xen_systctl_pm_op
SET_CPUFREQ_HWP.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

---
v2:
Mark xc_set_hwp_para_t const
---
 tools/include/xenctrl.h |  4 ++++
 tools/libs/ctrl/xc_pm.c | 18 ++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 9586eca4c0..2d6c112d44 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1934,11 +1934,15 @@ struct xc_get_cpufreq_para {
     int32_t turbo_enabled;
 };
 
+typedef struct xen_set_hwp_para xc_set_hwp_para_t;
+
 int xc_get_cpufreq_para(xc_interface *xch, int cpuid,
                         struct xc_get_cpufreq_para *user_para);
 int xc_set_cpufreq_gov(xc_interface *xch, int cpuid, char *govname);
 int xc_set_cpufreq_para(xc_interface *xch, int cpuid,
                         int ctrl_type, int ctrl_value);
+int xc_set_cpufreq_hwp(xc_interface *xch, int cpuid,
+                       const xc_set_hwp_para_t *set_hwp);
 int xc_get_cpufreq_avgfreq(xc_interface *xch, int cpuid, int *avg_freq);
 
 int xc_set_sched_opt_smt(xc_interface *xch, uint32_t value);
diff --git a/tools/libs/ctrl/xc_pm.c b/tools/libs/ctrl/xc_pm.c
index 76d7eb7f26..87c636f820 100644
--- a/tools/libs/ctrl/xc_pm.c
+++ b/tools/libs/ctrl/xc_pm.c
@@ -330,6 +330,24 @@ int xc_set_cpufreq_para(xc_interface *xch, int cpuid,
     return xc_sysctl(xch, &sysctl);
 }
 
+int xc_set_cpufreq_hwp(xc_interface *xch, int cpuid,
+                       const xc_set_hwp_para_t *set_hwp)
+{
+    DECLARE_SYSCTL;
+
+    if ( !xch )
+    {
+        errno = EINVAL;
+        return -1;
+    }
+    sysctl.cmd = XEN_SYSCTL_pm_op;
+    sysctl.u.pm_op.cmd = SET_CPUFREQ_HWP;
+    sysctl.u.pm_op.cpuid = cpuid;
+    sysctl.u.pm_op.u.set_hwp = *set_hwp;
+
+    return xc_sysctl(xch, &sysctl);
+}
+
 int xc_get_cpufreq_avgfreq(xc_interface *xch, int cpuid, int *avg_freq)
 {
     int ret = 0;
-- 
2.37.1


