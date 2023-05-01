Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 795936F37D1
	for <lists+xen-devel@lfdr.de>; Mon,  1 May 2023 21:31:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528120.820970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZF2-0005PX-Cd; Mon, 01 May 2023 19:31:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528120.820970; Mon, 01 May 2023 19:31:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZF2-0005MZ-8L; Mon, 01 May 2023 19:31:20 +0000
Received: by outflank-mailman (input) for mailman id 528120;
 Mon, 01 May 2023 19:31:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lARM=AW=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1ptZF0-000149-N3
 for xen-devel@lists.xenproject.org; Mon, 01 May 2023 19:31:18 +0000
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [2607:f8b0:4864:20::82c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd953b45-e856-11ed-8611-37d641c3527e;
 Mon, 01 May 2023 21:31:17 +0200 (CEST)
Received: by mail-qt1-x82c.google.com with SMTP id
 d75a77b69052e-3ef38864360so32531821cf.2
 for <xen-devel@lists.xenproject.org>; Mon, 01 May 2023 12:31:17 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 d6-20020ac80606000000b003bf9f9f1844sm9351784qth.71.2023.05.01.12.31.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 12:31:14 -0700 (PDT)
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
X-Inumbo-ID: bd953b45-e856-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682969475; x=1685561475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0JAKWHRmes/OZ2QqxthbDdVSth+8gV1gmiT1eY6OQAU=;
        b=agUYa27f+iQLWMNxlFEc2K+VW9/TDwM3m+jQfvXTxvXZbmzGAjWm0wsvu8JqtR207U
         t1t5hRwO5XCaNJeBc88seuaxK9iWobMhqaMFalduGXrSd1fuN4jpHX1uq0hiw73GxLxa
         QbJ0eOzdWZOowX39nQau708W4gepwI7smAEBwsHyb73JAshCTh2+k0inXyBLfFQROQjn
         kVZLmA8d83RtY1EFNGFyqPmD8NoRnV7padsi+zu+hjkMVIvAnO4R1lui3cpMG8T7Y8DP
         FqjAkbwmR1Ss3yV18+dB6lolo03B2Ai2r90qUQENivonfb8k4P3/JMrwXX/E19b/M6vA
         YtxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682969475; x=1685561475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0JAKWHRmes/OZ2QqxthbDdVSth+8gV1gmiT1eY6OQAU=;
        b=UlaklaRnKMH45rH2nnOqbKi5d+lnyRb0FeK2gNj7bSMajod8f/mQ29nKj5PAhsOB8k
         4CePo6DrzAjDo0DVPvQcKhMiulxc/uIuGRf0aXI5Prq4HOLVSrpX5iTxYrBGatHRW/bK
         X6APhppKC6Lnfd/Jj9HouwnH6yLs9hNij2buwRLX2S6qNl5Lb6djIxcgvr+K8GAoLPSW
         nO6A2AXanDtZOaLgSVxtHudXr4WUFXiVikWssmeG1MxKoU1zuBiEK5ZNkWWktcX+sI5Y
         7Xp+2t91IaVMhz3azgV4TSfyeNtEa+4dTqdZlcFQm1XgGU8Qva5nTpBmuhaQe9BRJ5rd
         V0SQ==
X-Gm-Message-State: AC+VfDx45hYpx6vN6LN+G7gg5A2qoI+uqewsi5UXTQcy/BWmlJstqCgt
	d7FAT32sa+7T5HlYEdmPRXHdTtLleIw=
X-Google-Smtp-Source: ACHHUZ7q7E2b3NRT8r2PP7bqWrRHuqumQRwO8VPJV/bucabXWhGvM2lctIFgM6saOuOeuyBtdclxKQ==
X-Received: by 2002:ac8:5c08:0:b0:3ef:7975:99d0 with SMTP id i8-20020ac85c08000000b003ef797599d0mr24307476qti.31.1682969475143;
        Mon, 01 May 2023 12:31:15 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 11/14 RESEND] libxc: Add xc_set_cpufreq_hwp
Date: Mon,  1 May 2023 15:30:31 -0400
Message-Id: <20230501193034.88575-12-jandryuk@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230501193034.88575-1-jandryuk@gmail.com>
References: <20230501193034.88575-1-jandryuk@gmail.com>
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
index 437001d713..cd367d9d8f 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1937,11 +1937,15 @@ struct xc_get_cpufreq_para {
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
index c3a9864bf7..a747ab053c 100644
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
2.40.0


