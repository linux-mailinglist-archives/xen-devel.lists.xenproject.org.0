Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B492763D71
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 19:17:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570661.892716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOi8Z-00041f-Nb; Wed, 26 Jul 2023 17:17:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570661.892716; Wed, 26 Jul 2023 17:17:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOi8Z-0003tC-I9; Wed, 26 Jul 2023 17:17:23 +0000
Received: by outflank-mailman (input) for mailman id 570661;
 Wed, 26 Jul 2023 17:17:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pn9P=DM=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qOi2j-0005nP-QP
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 17:11:21 +0000
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com
 [2607:f8b0:4864:20::e34])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6fe5d449-2bd7-11ee-8613-37d641c3527e;
 Wed, 26 Jul 2023 19:11:19 +0200 (CEST)
Received: by mail-vs1-xe34.google.com with SMTP id
 ada2fe7eead31-44757af136cso14433137.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jul 2023 10:11:20 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 s17-20020a0ca611000000b0063d1aa446e2sm1248019qva.59.2023.07.26.10.11.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 10:11:17 -0700 (PDT)
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
X-Inumbo-ID: 6fe5d449-2bd7-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690391478; x=1690996278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wIB5Z/ggG5eJ8M2F2JBMwNaYc9A5YlbhT5y/HdVUB7g=;
        b=i6jixsyaZ39eQkyDMG2g2c4UpEA1PEFFmE0zEADrlJ36oqzICRuU7Fv+UHs2lF03JB
         Q11hQjU2R46sWY4p2ZXIR2/GGnk/gWTpGKNp7gd0avUxUHA12sXjR3vE6Pw24ANzPiVx
         CptPVMLnfyF6QeHibjl8CcxI6HANdIZBAqXmLAxJRZjYBWCMBcwKO4qapxOOwPW3wD7K
         C4ijSLPdidWSj4qm/6UA1Gxnbq0+mULORy+T4RLqcGMdUaQXZvvMizEjTvGvFn0ly65X
         uflwgHV851IddZe2qkf6O4dDWUTJVm3UaeiNosjfVQARZtSQXk3DmvRD/yLeIwDYnVwC
         O6nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690391478; x=1690996278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wIB5Z/ggG5eJ8M2F2JBMwNaYc9A5YlbhT5y/HdVUB7g=;
        b=T8zT6P/dyr4BH5hA1WGSdNNLhL0wXXqD7oUl4WTTsZMKnQUyfItQXA1AhpMWkDqZgG
         mX5D4gqcHjo17wSF1iBmQEBeN5BQcAZbsMGNEI/MPLmW/f4Nlg61H3+06PryJ9vYd1p2
         MJDFF+dCmUkbfAYq1ss2JBueIcYiFuKwzpHMkWuaHwgLv+5NkkbhO7POuJwmZZLDP8Ye
         8U/Km9fFfz4a9gqrSTAatKnw1djZtlFqXLgkmX1ZWPbTMT/N2nlmuWTN4tFCXfxRDLd6
         CTvwCQbM7v/OMYWteFcLEx9ifJVRGULNk2YEkfvXSyElsAdJp6/qFysHEXb92Q73/Io/
         VHmg==
X-Gm-Message-State: ABy/qLaf1enoKvVi/Kkv8lIEbfj/tOvoz6Qv63lej9OjCY+8KUQOFdoR
	gB8XbfuuuYR4LgP2Dugdr9wrWBCYxhE=
X-Google-Smtp-Source: APBJJlGbfOVaJ6JhFnY4cR2crCc3Eb+DisFFZbx74DJbPeLPPfwaRq2ZeagfuZLH46r4KPc7asidLg==
X-Received: by 2002:a67:ef92:0:b0:443:66b9:b8f0 with SMTP id r18-20020a67ef92000000b0044366b9b8f0mr2027430vsp.10.1690391478530;
        Wed, 26 Jul 2023 10:11:18 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v7 13/15] libxc: Add xc_set_cpufreq_cppc
Date: Wed, 26 Jul 2023 13:09:43 -0400
Message-ID: <20230726170945.34961-14-jandryuk@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230726170945.34961-1-jandryuk@gmail.com>
References: <20230726170945.34961-1-jandryuk@gmail.com>
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


